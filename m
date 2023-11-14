Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C80C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wb6dpaLfYqSAWOXvLPoewyCWrHyO9D5O0fkMrKCsZWg=; b=whoIag/eSbXoEP
	yilrYGD5rvh2DPzFJqGc5J7k7NxOHxhmDGVvX71gEwVUqZVVL/GGm8dWeWAUv39eHewcfZ9OcMCLw
	FPZXyExkU9bKQAjxOPy3hO/GqUJTOA9mYU7f2PcV73kqs/20Tu85SD0qLGTCCpY7hxMWURCYZzVV/
	jrSd/jJxEqObkpcyuK7rYZSR5XHgpKNOaGxcIjrZgwLaLRUdd0sIFBKfqbAtKDkbaWhSCLx0XmVWk
	YP5csPq+aB00bHoHYG6KDDVA2FQ2iGekD1iPZjDQZTFs94bpj/9IDH9eq4d8bN6t2ClbOmC127z8e
	/wpxRcJZcTPpqJlYdtjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAo-00G92u-2q;
	Tue, 14 Nov 2023 14:13:50 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAj-00G8rx-0L
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:49 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-671188b2d44so10578806d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971220; x=1700576020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keCbZUlhJhR2ZwXU737WvxpdBzfAu930SEAq7brrB2I=;
        b=jB2eRi6y/UjUaiRamwUy1G3JwhuA1CLOiKHmdsFucQ7crbEpX59MgD8X3UesXMGvZn
         vF6LWoTmeDmA3GOq6c5uocO6JyTN8Slola8L+rztWRycHTiaJTeg5TQ3qlGPA7MPe3Ia
         /42IH0x87fBBnkmIgzme7NM9GafC5lrJOqrKY0lVb0cdW67GbADkZ5MK2tGOwtqgPxLQ
         epzYucH38n0pQhuBR7pzyhw5ulxtX2RiP+AtC+9a1u8Gk1cdrpEzdqf3aIuJUtJs8KSn
         ikapvuJDzpeT5F/TaumrPCwnSLXYlumuZdHLeEtJ3aZaBjvYFQQNYB2qxHzkSkjL70TI
         iCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971220; x=1700576020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keCbZUlhJhR2ZwXU737WvxpdBzfAu930SEAq7brrB2I=;
        b=eS2YWVZZp5pZaCcozZwl6RfAwdfqu1FeU6sJMyHQR7/tprwkhf2t73KwjUnkOvlgXT
         KbMaQZfucD/SwST/KmysJkUEzDrjxKNqMjVC7lfATB0PMXa1P6R38oOqvtf/6s4owFwA
         wKuPpjFfLgSTcOYnUnxU0x0ngfpJRV2HQwmdrWGiNZasHFrBjEEZB47nO/no1kpBzdvL
         nTNWzYCH53Kl7XJrz+QdAdr6i6yizuBizLeO1EMPXqowjI32D+On0ZenpmbPNCiQgwPe
         AhrvKLCmuxg0ngk2aB5SJGhPyfL6BV6w7HJ3/pnwK98X9cZEoeWVQCyOfHsuxAelREIe
         A/mQ==
X-Gm-Message-State: AOJu0YwyLyWqzq7OLyywP3el31YPk88pIhAGcNT2RSKeaLNNOId94U5A
	wqx9jc1OQ+b50fLdANxKaRLfAZUuSG9WF3Yb5uJeeg==
X-Google-Smtp-Source: AGHT+IH/a2FfbthDBterj2ExvRydm8PsEE46bPyI6vhg+6wuJOSTbSR3GQBAEKTJRnI4P9fwyid4gg==
X-Received: by 2002:a05:6214:5ec5:b0:66d:1178:8729 with SMTP id mn5-20020a0562145ec500b0066d11788729mr2432438qvb.0.1699971220091;
        Tue, 14 Nov 2023 06:13:40 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:39 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: [PATCH v4 07/20] riscv: hwprobe: export vector crypto ISA extensions
Date: Tue, 14 Nov 2023 09:12:43 -0500
Message-ID: <20231114141256.126749-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061345_171910_1AEC61A3 
X-CRM114-Status: GOOD (  11.16  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RXhwb3J0IFp2KiB2ZWN0b3IgY3J5cHRvIElTQSBleHRlbnNpb25zIHRoYXQgd2VyZSBhZGRlZCBp
biAiUklTQy1WCkNyeXB0b2dyYXBoeSBFeHRlbnNpb25zIFZvbHVtZSBJSSIgc3BlY2lmaWNhdGlv
blsxXSB0aHJvdWdoIGh3cHJvYmUuClRoaXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgZm9sbG93aW5n
IGluc3RydWN0aW9uczoKCi0gWnZiYjogVmVjdG9yIEJhc2ljIEJpdC1tYW5pcHVsYXRpb24KLSBa
dmJjOiBWZWN0b3IgQ2FycnlsZXNzIE11bHRpcGxpY2F0aW9uCi0gWnZrYjogVmVjdG9yIENyeXB0
b2dyYXBoeSBCaXQtbWFuaXB1bGF0aW9uCi0gWnZrZzogVmVjdG9yIEdDTS9HTUFDLgotIFp2a25l
ZDogTklTVCBTdWl0ZTogVmVjdG9yIEFFUyBCbG9jayBDaXBoZXIKLSBadmtuaFthYl06IE5JU1Qg
U3VpdGU6IFZlY3RvciBTSEEtMiBTZWN1cmUgSGFzaAotIFp2a3NlZDogU2hhbmdNaSBTdWl0ZTog
U000IEJsb2NrIENpcGhlcgotIFp2a3NoOiBTaGFuZ01pIFN1aXRlOiBTTTMgU2VjdXJlIEhhc2gK
LSBadmtuYzogTklTVCBBbGdvcml0aG0gU3VpdGUgd2l0aCBjYXJyeWxlc3MgbXVsdGlwbHkKLSBa
dmtuZzogTklTVCBBbGdvcml0aG0gU3VpdGUgd2l0aCBHQ00uCi0gWnZrc2M6IFNoYW5nTWkgQWxn
b3JpdGhtIFN1aXRlIHdpdGggY2FycnlsZXNzIG11bHRpcGxpY2F0aW9uCi0gWnZrc2c6IFNoYW5n
TWkgQWxnb3JpdGhtIFN1aXRlIHdpdGggR0NNLgotIFp2a3Q6IFZlY3RvciBEYXRhLUluZGVwZW5k
ZW50IEV4ZWN1dGlvbiBMYXRlbmN5LgoKWnZrbiBhbmQgWnZrcyBhcmUgb21taXRlZCBzaW5jZSB0
aGV5IGFyZSBhIHN1cGVyc2V0IG9mIG90aGVyIGV4dGVuc2lvbnMuCgpMaW5rOiBodHRwczovL2Ry
aXZlLmdvb2dsZS5jb20vZmlsZS9kLzFnYjlPTEgtRGhiQ2dXcDdWd3BQT1Zyclk2ZjNvU0pMTC92
aWV3IFsxXQpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5j
b20+ClJldmlld2VkLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KLS0tCiBEb2N1
bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMzAgKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMTAgKysr
KysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyAgICAgICAgIHwgMTMgKysrKysr
KysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggM2ExOGEzMWUzMmMzLi5hMDhmY2Q4OTliNmQgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAorKysgYi9Eb2N1bWVu
dGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKQEAgLTExMCw2ICsxMTAsMzYgQEAgVGhlIGZv
bGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgogICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VY
VF9aS1RgIFRoZSBaa3QgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMgZGVmaW5lZAogICAgICAg
IGluIHZlcnNpb24gMS4wIG9mIHRoZSBTY2FsYXIgQ3J5cHRvIElTQSBleHRlbnNpb25zLgogCisg
ICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWQkJgOiBUaGUgWnZiYiBleHRlbnNpb24g
aXMgc3VwcG9ydGVkIGFzCisgICAgICAgZGVmaW5lZCBpbiB2ZXJzaW9uIDEuMCBvZiB0aGUgUklT
Qy1WIENyeXB0b2dyYXBoeSBFeHRlbnNpb25zIFZvbHVtZSBJSS4KKworICAqIDpjOm1hY3JvOmBS
SVNDVl9IV1BST0JFX0VYVF9aVkJDYDogVGhlIFp2YmMgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBh
cworICAgICAgIGRlZmluZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBDcnlwdG9ncmFw
aHkgRXh0ZW5zaW9ucyBWb2x1bWUgSUkuCisKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9F
WFRfWlZLQmA6IFRoZSBadmtiIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKKyAgICAgICBkZWZp
bmVkIGluIHZlcnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgQ3J5cHRvZ3JhcGh5IEV4dGVuc2lvbnMg
Vm9sdW1lIElJLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWS0dgOiBUaGUg
WnZrZyBleHRlbnNpb24gaXMgc3VwcG9ydGVkIGFzCisgICAgICAgZGVmaW5lZCBpbiB2ZXJzaW9u
IDEuMCBvZiB0aGUgUklTQy1WIENyeXB0b2dyYXBoeSBFeHRlbnNpb25zIFZvbHVtZSBJSS4KKwor
ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVktORURgOiBUaGUgWnZrbmVkIGV4dGVu
c2lvbiBpcyBzdXBwb3J0ZWQgYXMKKyAgICAgICBkZWZpbmVkIGluIHZlcnNpb24gMS4wIG9mIHRo
ZSBSSVNDLVYgQ3J5cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1lIElJLgorCisgICogOmM6bWFj
cm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWS05IQWA6IFRoZSBadmtuaGEgZXh0ZW5zaW9uIGlzIHN1
cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBD
cnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUgSUkuCisKKyAgKiA6YzptYWNybzpgUklTQ1Zf
SFdQUk9CRV9FWFRfWlZLTkhCYDogVGhlIFp2a25oYiBleHRlbnNpb24gaXMgc3VwcG9ydGVkIGFz
CisgICAgICAgZGVmaW5lZCBpbiB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIENyeXB0b2dyYXBo
eSBFeHRlbnNpb25zIFZvbHVtZSBJSS4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VY
VF9aVktTRURgOiBUaGUgWnZrc2VkIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKKyAgICAgICBk
ZWZpbmVkIGluIHZlcnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgQ3J5cHRvZ3JhcGh5IEV4dGVuc2lv
bnMgVm9sdW1lIElJLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWS1NIYDog
VGhlIFp2a3NoIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKKyAgICAgICBkZWZpbmVkIGluIHZl
cnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgQ3J5cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1lIElJ
LgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWS1RgOiBUaGUgWnZrdCBleHRl
bnNpb24gaXMgc3VwcG9ydGVkIGFzCisgICAgICAgZGVmaW5lZCBpbiB2ZXJzaW9uIDEuMCBvZiB0
aGUgUklTQy1WIENyeXB0b2dyYXBoeSBFeHRlbnNpb25zIFZvbHVtZSBJSS4KKwogKiA6YzptYWNy
bzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRoYXQgY29udGFpbnMg
cGVyZm9ybWFuY2UKICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNlbGVjdGVkIHNldCBvZiBwcm9j
ZXNzb3JzLgogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9i
ZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAppbmRleCA2MjRhYmQ1
Y2RlMjkuLjg5NjI4YTc2Y2EwNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5o
CkBAIC00MCw2ICs0MCwxNiBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVND
Vl9IV1BST0JFX0VYVF9aS1NFRAkJKDEgPDwgMTQpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VY
VF9aS1NICQkoMSA8PCAxNSkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pLVAkJKDEgPDwg
MTYpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVkJCCQkoMSA8PCAxNykKKyNkZWZpbmUJ
CVJJU0NWX0hXUFJPQkVfRVhUX1pWQkMJCSgxIDw8IDE4KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9C
RV9FWFRfWlZLQgkJKDEgPDwgMTkpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVktHCQko
MSA8PCAyMCkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWS05FRAkoMSA8PCAyMSkKKyNk
ZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWS05IQQkoMSA8PCAyMikKKyNkZWZpbmUJCVJJU0NW
X0hXUFJPQkVfRVhUX1pWS05IQgkoMSA8PCAyMykKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhU
X1pWS1NFRAkoMSA8PCAyNCkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWS1NICQkoMSA8
PCAyNSkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWS1QJCSgxIDw8IDI2KQogI2RlZmlu
ZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9N
SVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJ
R05FRF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lz
X3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwppbmRleCA0M2FhNjZlNzE0
MTguLjliYmNkNzMzNGQ5NiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2
LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKQEAgLTE3Myw2ICsxNzMsMTkg
QEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFp
ciwKIAkJRVhUX0tFWShaS1NFRCk7CiAJCUVYVF9LRVkoWktTSCk7CiAJCUVYVF9LRVkoWktUKTsK
KworCQlpZiAoaGFzX3ZlY3RvcigpKSB7CisJCQlFWFRfS0VZKFpWQkIpOworCQkJRVhUX0tFWSha
VkJDKTsKKwkJCUVYVF9LRVkoWlZLQik7CisJCQlFWFRfS0VZKFpWS0cpOworCQkJRVhUX0tFWSha
VktORUQpOworCQkJRVhUX0tFWShaVktOSEEpOworCQkJRVhUX0tFWShaVktOSEIpOworCQkJRVhU
X0tFWShaVktTRUQpOworCQkJRVhUX0tFWShaVktTSCk7CisJCQlFWFRfS0VZKFpWS1QpOworCQl9
CiAjdW5kZWYgRVhUX0tFWQogCX0KIAotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
