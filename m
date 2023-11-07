Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A87C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsGFSuJg5NGge8pRo72xvfsF1c7GHbOzM0tAq1cTxSk=; b=PuIVYF05POM3zD
	S6UWgiZ4mg+Vs8b44UcZOSWqg/zoqMQAV9S2XHVJ8IDu7zoOVt8blTZYrC/U8++04GnRUoF9NE6/J
	CUrSjnD3oIkjUSuj+o5k+o0WRMoFGdsqPjn2zuNyeN4pNoeGSPPJZfYCb8+n1XjgxI+RBe9woRSvV
	TuW5h2viwVkbIdYGvkprDe2E0X4GNXrJNr4uRRSp0z00kK0qsBopEC1pL6ufLm3332+OOKMJQhpqV
	nzA5zlrokIQadPHc+DIGnYVW/cN9f7vKZeWvNZX5Vr4pMq/uYGL3qKdOADwvPvaBZWigCgopQnbbH
	RvlWwM39xCMHUtfbPTBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkn-0019EV-0I;
	Tue, 07 Nov 2023 10:56:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkh-00199I-2m
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-408ffb55b35so3564995e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354569; x=1699959369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3TrfnxPBusbuENWlTFkbo4q1loDmWY4mGc5/+ZWfWU=;
        b=Gpht2uZ4XdYacoaf1p8hoamILABsAs3kuEZKg0dzpMXyA2l3xN6+apnXBgv733MkQh
         hZhnwTcd/gVdqwf9ZXpFFJGevsjy4qOW95PCwqz7zCWhZi+uFcSFqnxdXvKUwtVKyQ1k
         dEVT0+462O0LeALSuGLkwTYCOeLqrXit8lCWpVTcrAyPeyl353pBigx+gArnfDQonVIx
         XdrbRPVKpObFaKqhPzsr61MlkXytJnMD1u+tDneRpKk7ceQo7DB4vSnZmvB15ePH4y8N
         WXVqbNe/m9KazZSyHNVPVDrE1975/715AMAN3WPzL2MIIrVfmPk8RrpvFM8mJ7CFfx0o
         IzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354569; x=1699959369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3TrfnxPBusbuENWlTFkbo4q1loDmWY4mGc5/+ZWfWU=;
        b=Yebm5B6D5lQjw9D+VMASHU5dfUOzcernr6e5o4Lt7tCuNEVdqk1RVmRdKu10jh3IyO
         bt5qBbASob/vusVWgXPd3Q9DAPECGybMSSkoG0lLhLTRz841zKn4XKeTOunaQ+g4dVlF
         LMOGlyyrfZg6S9Wg+SGlF4MnYxnznT1gsJ6kjLBuJB6Q18XSjO5kZAvs7fHSb05+maeJ
         VNoWnnwx/zGGqeIrgnFnihqlofLkkqR33Mt8INrL0hZ0bLxF/I6dLrh6wvpcE6d73h+i
         YxVfJA0w1NM9zdWRQVPOW7NpU9ngnhLl90T2F558d2cPfRO5ARRwnZM48ZZYEq0vfDpT
         mbsw==
X-Gm-Message-State: AOJu0YyLloD4xUaSbMjFgFXlGoCLk5l0WS/EMvlOFGOhPV6bno0/gK/d
	sC4dDdW+9CdqLfQfzSQgkZaVUl0YclJ/MboiPXkUfg==
X-Google-Smtp-Source: AGHT+IHnxDz0Lcs+nSF4fhyZmX4N1apZiK61SiS26CL6G/o5AoZ2KehCJD/kPki3vD5ZYO3oxb3qIw==
X-Received: by 2002:a05:600c:3d95:b0:408:3ea2:1220 with SMTP id bi21-20020a05600c3d9500b004083ea21220mr25869592wmb.1.1699354568713;
        Tue, 07 Nov 2023 02:56:08 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:08 -0800 (PST)
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
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v3 07/20] riscv: hwprobe: export vector crypto ISA extensions
Date: Tue,  7 Nov 2023 11:55:43 +0100
Message-ID: <20231107105556.517187-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025611_901387_FD95FD55 
X-CRM114-Status: GOOD (  11.69  )
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
cmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggYjAyMGIyZDM1YTk5Li4yMTgzZmE2ZDJmYzEgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAorKysgYi9Eb2N1bWVu
dGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKQEAgLTEwNyw2ICsxMDcsMzYgQEAgVGhlIGZv
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
ZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAppbmRleCAxMGJmNTQz
ZGUzY2UuLjFiODUzODZmMjc2YiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5o
CkBAIC0zOSw2ICszOSwxNiBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVND
Vl9IV1BST0JFX0VYVF9aS1NFRAkJKDEgPDwgMTMpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VY
VF9aS1NICQkoMSA8PCAxNCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pLVAkJKDEgPDwg
MTUpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVkJCCQkoMSA8PCAxNikKKyNkZWZpbmUJ
CVJJU0NWX0hXUFJPQkVfRVhUX1pWQkMJCSgxIDw8IDE3KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9C
RV9FWFRfWlZLQgkJKDEgPDwgMTgpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVktHCQko
MSA8PCAxOSkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWS05FRAkoMSA8PCAyMCkKKyNk
ZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWS05IQQkoMSA8PCAyMSkKKyNkZWZpbmUJCVJJU0NW
X0hXUFJPQkVfRVhUX1pWS05IQgkoMSA8PCAyMikKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhU
X1pWS1NFRAkoMSA8PCAyMykKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWS1NICQkoMSA8
PCAyNCkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWS1QJCSgxIDw8IDI1KQogI2RlZmlu
ZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9N
SVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJ
R05FRF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lz
X3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwppbmRleCBiYjQ0NTkyNzA3
YTUuLjhlMWQyNjY1OWUxNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2
LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKQEAgLTE3Miw2ICsxNzIsMTkg
QEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFp
ciwKIAkJQ0hFQ0tfSVNBX0VYVChaS1NFRCk7CiAJCUNIRUNLX0lTQV9FWFQoWktTSCk7CiAJCUNI
RUNLX0lTQV9FWFQoWktUKTsKKworCQlpZiAoaGFzX3ZlY3RvcigpKSB7CisJCQlDSEVDS19JU0Ff
RVhUKFpWQkIpOworCQkJQ0hFQ0tfSVNBX0VYVChaVkJDKTsKKwkJCUNIRUNLX0lTQV9FWFQoWlZL
Qik7CisJCQlDSEVDS19JU0FfRVhUKFpWS0cpOworCQkJQ0hFQ0tfSVNBX0VYVChaVktORUQpOwor
CQkJQ0hFQ0tfSVNBX0VYVChaVktOSEEpOworCQkJQ0hFQ0tfSVNBX0VYVChaVktOSEIpOworCQkJ
Q0hFQ0tfSVNBX0VYVChaVktTRUQpOworCQkJQ0hFQ0tfSVNBX0VYVChaVktTSCk7CisJCQlDSEVD
S19JU0FfRVhUKFpWS1QpOworCQl9CiAjdW5kZWYgQ0hFQ0tfSVNBX0VYVAogCX0KIAotLSAKMi40
Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
