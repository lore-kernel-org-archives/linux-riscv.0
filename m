Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DE9CDB482
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkEzCehUvUmzqN7vHSmOoWI71cAeyM8hmWmrBG2DV6s=; b=oXk9gsadj5mJlE
	ue8hNck6dBjt3d/xtLGh5tD/VF61qe0LTeWK672S9wzABTsqDaugPAvKaKaSzPzqbWKGLd0xirCNL
	TNDFjSoMiN0//4a5m/GbQhjH92qOmstwaqGvam+OjxU22k4wEILL6D0inFBr7cdZRcFhrjNcuBXxr
	TkhtjDtqRKS7pC1sZY17qEt3xlOerUJsA2fcODmXxu7rV1SkoaFEnG03j12OzkskImMGYUtK2QytE
	p8FrHhUvJVUSHdY7ehISyoTzUgMwDZiQ36QChjWUFQnY+hGeHBCUFDfXP9TQQUKUX5gCdELO4RHJF
	Ynk2aWfTmy+Fl+3E91sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvB-00CN8P-1E;
	Tue, 17 Oct 2023 13:15:41 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjv5-00CN27-12
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:37 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bbbe81185dso14808361fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548533; x=1698153333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSjULynk4axu/lQueuStT5Cc6po8Eg43A5EArhYri7c=;
        b=ZCKzd/Ptn/zB7xZR8QUPdxskiHFFuj5bcU/8BkxxQUTK4sHWr+/k4xTOwtUYQggKVV
         y6UIeCOqq+qsG4bpWVLvQCTA/QrvvxmnJpqjpNI6a1rXxTTbpqfKtJ2/vu+4fRJidLZ4
         zG1QxndrOHC41vbKZgP15z+bBTqJDSo9idqHBDCjyEeaCm5m2iVd7DE2+ifm5vB0J//m
         npf4CXn03lDDKCe6Qp1iopHyx7BM1KQ3BsE0PNqjmxCYm5y3rjhSCjid4E0h9/yptYtT
         LJbPC4o3zPEXY6amwkmwxvQZkJ8R2Cfka0fA2AB1E/RHwpHJVmn283URAfCCsNFAoEEx
         ge6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548533; x=1698153333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSjULynk4axu/lQueuStT5Cc6po8Eg43A5EArhYri7c=;
        b=XOiaq/b3Txq4vCJZnxubkJdTZ1UB7aqpOfYgMf0lm48T3AtLvyQjfAH/5r4q3u/Qka
         w9cF82ykJAn+H7jIQuQMY9f12Zw4eVBhhG28NE9heTqA9+lA82PU7GX3doE+NMqcuR/o
         oFnCqlwJFJ4XoLjTorGVOCX331w+rhff8q12RgA4UtHEfdazRYr6vw5BnA7f9nNQjBFZ
         JIVFvD9aY4br1aIgBh5cWGE6C4Kc+0woT1L92wMGO1uwY9kGsDJJ6xglon/iXYuM5vvh
         TEq2vCwC+9xf75jUtGQfNInaYXfJVmgXoI1ZV7yoTPQDXPgMwncb3PXSrC7cqUrciM0b
         10mw==
X-Gm-Message-State: AOJu0YxxQn0E2u3UyLbY74DWeESNEZmP/vndc828y1LhT75tWZ7t6/uV
	MV7EQauckL72PrUxaVa3Qk/ekMmg1T3Hi9hLEEQ4MA==
X-Google-Smtp-Source: AGHT+IHqDLYBet1B3FL9I2Io23hZaqRlzAfShCE8ZthuzQfc3iPmaq8AoMjB8iTpQd9gVBVYyXJlCw==
X-Received: by 2002:a2e:7309:0:b0:2c0:7d6:1349 with SMTP id o9-20020a2e7309000000b002c007d61349mr1828090ljc.0.1697548532200;
        Tue, 17 Oct 2023 06:15:32 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:31 -0700 (PDT)
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
Subject: [PATCH v2 06/19] riscv: hwprobe: export vector crypto ISA extensions
Date: Tue, 17 Oct 2023 15:14:43 +0200
Message-ID: <20231017131456.2053396-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061535_360654_E8188301 
X-CRM114-Status: GOOD (  11.62  )
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
b20+Ci0tLQogRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdCAgICAgICB8IDMwICsrKysr
KysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJv
YmUuaCB8IDEwICsrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgICAgICAg
ICB8IDEzICsrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRp
b24vcmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggOTY4ODk1NTYyZDQyLi44NjgxZmI2MDE1MDAgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9jdW1lbnRh
dGlvbi9yaXNjdi9od3Byb2JlLnJzdApAQCAtMTA3LDYgKzEwNywzNiBAQCBUaGUgZm9sbG93aW5n
IGtleXMgYXJlIGRlZmluZWQ6CiAgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pLVGAg
VGhlIFprdCBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcyBkZWZpbmVkCiAgICAgICAgaW4gdmVy
c2lvbiAxLjAgb2YgdGhlIFNjYWxhciBDcnlwdG8gSVNBIGV4dGVuc2lvbnMuCiAKKyAgKiA6Yzpt
YWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZCQmA6IFRoZSBadmJiIGV4dGVuc2lvbiBpcyBzdXBw
b3J0ZWQgYXMKKyAgICAgICBkZWZpbmVkIGluIHZlcnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgQ3J5
cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1lIElJLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hX
UFJPQkVfRVhUX1pWQkNgOiBUaGUgWnZiYyBleHRlbnNpb24gaXMgc3VwcG9ydGVkIGFzCisgICAg
ICAgZGVmaW5lZCBpbiB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIENyeXB0b2dyYXBoeSBFeHRl
bnNpb25zIFZvbHVtZSBJSS4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVktC
YDogVGhlIFp2a2IgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQgaW4g
dmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBDcnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUg
SUkuCisKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZLR2A6IFRoZSBadmtnIGV4
dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKKyAgICAgICBkZWZpbmVkIGluIHZlcnNpb24gMS4wIG9m
IHRoZSBSSVNDLVYgQ3J5cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1lIElJLgorCisgICogOmM6
bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWS05FRGA6IFRoZSBadmtuZWQgZXh0ZW5zaW9uIGlz
IHN1cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0Mt
ViBDcnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUgSUkuCisKKyAgKiA6YzptYWNybzpgUklT
Q1ZfSFdQUk9CRV9FWFRfWlZLTkhBYDogVGhlIFp2a25oYSBleHRlbnNpb24gaXMgc3VwcG9ydGVk
IGFzCisgICAgICAgZGVmaW5lZCBpbiB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIENyeXB0b2dy
YXBoeSBFeHRlbnNpb25zIFZvbHVtZSBJSS4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JF
X0VYVF9aVktOSEJgOiBUaGUgWnZrbmhiIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKKyAgICAg
ICBkZWZpbmVkIGluIHZlcnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgQ3J5cHRvZ3JhcGh5IEV4dGVu
c2lvbnMgVm9sdW1lIElJLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWS1NF
RGA6IFRoZSBadmtzZWQgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQg
aW4gdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBDcnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1
bWUgSUkuCisKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZLU0hgOiBUaGUgWnZr
c2ggZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdmVyc2lvbiAx
LjAgb2YgdGhlIFJJU0MtViBDcnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUgSUkuCisKKyAg
KiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZLVGA6IFRoZSBadmt0IGV4dGVuc2lvbiBp
cyBzdXBwb3J0ZWQgYXMKKyAgICAgICBkZWZpbmVkIGluIHZlcnNpb24gMS4wIG9mIHRoZSBSSVND
LVYgQ3J5cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1lIElJLgorCiAqIDpjOm1hY3JvOmBSSVND
Vl9IV1BST0JFX0tFWV9DUFVQRVJGXzBgOiBBIGJpdG1hc2sgdGhhdCBjb250YWlucyBwZXJmb3Jt
YW5jZQogICBpbmZvcm1hdGlvbiBhYm91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nlc3NvcnMu
CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCmluZGV4IDg5ZDBlMzdhMDFlOS4u
MjUyOWNlZTMyM2RiIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdw
cm9iZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKQEAgLTM5
LDYgKzM5LDE2IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKICNkZWZpbmUJCVJJU0NWX0hXUFJP
QkVfRVhUX1pLU0VECQkoMSA8PCAxMykKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pLU0gJ
CSgxIDw8IDE0KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWktUCQkoMSA8PCAxNSkKKyNk
ZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWQkIJCSgxIDw8IDE2KQorI2RlZmluZQkJUklTQ1Zf
SFdQUk9CRV9FWFRfWlZCQwkJKDEgPDwgMTcpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
VktCCQkoMSA8PCAxOCkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWS0cJCSgxIDw8IDE5
KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZLTkVECSgxIDw8IDIwKQorI2RlZmluZQkJ
UklTQ1ZfSFdQUk9CRV9FWFRfWlZLTkhBCSgxIDw8IDIxKQorI2RlZmluZQkJUklTQ1ZfSFdQUk9C
RV9FWFRfWlZLTkhCCSgxIDw8IDIyKQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZLU0VE
CSgxIDw8IDIzKQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZLU0gJCSgxIDw8IDI0KQor
I2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZLVAkJKDEgPDwgMjUpCiAjZGVmaW5lIFJJU0NW
X0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdO
RURfVU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VN
VUxBVEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3Yu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCmluZGV4IDJiNTBjNjYxZGE5MC4uMjVk
MzU4MDA4MDlmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwpAQCAtMTcyLDYgKzE3MiwxOSBAQCBzdGF0
aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQlD
SEVDS19JU0FfRVhUKFpLU0VEKTsKIAkJQ0hFQ0tfSVNBX0VYVChaS1NIKTsKIAkJQ0hFQ0tfSVNB
X0VYVChaS1QpOworCisJCWlmIChoYXNfdmVjdG9yKCkpIHsKKwkJCUNIRUNLX0lTQV9FWFQoWlZC
Qik7CisJCQlDSEVDS19JU0FfRVhUKFpWQkMpOworCQkJQ0hFQ0tfSVNBX0VYVChaVktCKTsKKwkJ
CUNIRUNLX0lTQV9FWFQoWlZLRyk7CisJCQlDSEVDS19JU0FfRVhUKFpWS05FRCk7CisJCQlDSEVD
S19JU0FfRVhUKFpWS05IQSk7CisJCQlDSEVDS19JU0FfRVhUKFpWS05IQik7CisJCQlDSEVDS19J
U0FfRVhUKFpWS1NFRCk7CisJCQlDSEVDS19JU0FfRVhUKFpWS1NIKTsKKwkJCUNIRUNLX0lTQV9F
WFQoWlZLVCk7CisJCX0KICN1bmRlZiBDSEVDS19JU0FfRVhUCiAJfQogCi0tIAoyLjQyLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
