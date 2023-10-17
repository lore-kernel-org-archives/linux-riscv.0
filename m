Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331AACDB483
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+s0/hpGjBV1A2gdvZq10LQs5lA7pfQMRFGwRoXcWoAs=; b=PJ5UVeu/cCO2j7
	S71ffpFz5OrZ86Ml/IS7WRHVqxrFNYAnVpskkLixGw0D1ElLrIpzSucSVIG01YEjncN2uzHE+nkgv
	w020k4zHvJ8/d0ZfaPP40goj+U1SoRXstJbDhY//l/9PQocco5tXe1yZWRmA/5UvAWY5bO/6VECek
	a8CubQS66uK3VBF80kbZP/XH98eCB9asvOh2YaVpIUV8evfIl37HunjQgEsaPBqlBOVMLkdphKuEf
	WXl83jrTAX+nQjdRMMNkxNjTdRIXLRiPzMsQb5C2uZSBc0JzO/guNCCNwjr4GPj1xNK9VjUfJ13db
	MdRVqupHnU5Mb0wFOzpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjv7-00CN4Z-1l;
	Tue, 17 Oct 2023 13:15:37 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjv2-00CN0c-0P
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:33 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bbbe81185dso14808191fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548529; x=1698153329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+YdsWcYVn6169SyHd6y47aRn9PEH1vqa+UZ/lbiRsM=;
        b=2lbMPgtD9cEXVpwIB8UwaXgs0SfGUyJZ+OO2PnsVBgsP6oNAt73By5zC5955tDpTEV
         m6mtmgf3CVkW3Id0ihGyVSTL/9ZJ2cLnbRTRietlk+tCk06VLF8i5HNe0gmJHApoa8GL
         cVEr7GcQZkOWSRA7ZUswC7rUVvnzhCU3vaF93Eu1ph7FXSgfFarluCU/gtUpF9uORbE3
         cE9Xx0ZeS5pdpOcvPuOBAI8MEtzdwT5fxXFXV2yd8imUWkKXvRwOuT0DOnvJ2YKuOJe6
         ObTIWQZDMFiVx/+gm8w0p27gnm8tATvLqE/orz36RVvVEhZ3AhADZoYWwgD2AjD1v3zh
         1dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548529; x=1698153329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+YdsWcYVn6169SyHd6y47aRn9PEH1vqa+UZ/lbiRsM=;
        b=uAocmXunYQMzlCvg5yUZkURUTAbgLGrTX5pqDh8rDcrhNHTvQDzkpZWl2F9rvD9Y3P
         4aZLqjY2V3Fh1a+VMT5sD3FE8zd1MKtxPTd04OiFPiVcTBYQ96G/q30WuZvoBUwmPcv0
         YVo4dug/TwSm1aGfvjTvDtHg3I3Ng7aig0M0vsp18fK3IlgrEqdyGH7xv4yRb4QP4KRh
         WkwHnTX484HDKcLz9vXfcb2XiYPmJsrpSQejTuV/4pvkF0tDv9XdgGHYs8ZIsVFC2/n6
         W/4mBI8u8/MghoGUDn+feAlqaZ5KKqCXk+ND9EFARK/cZjmnJjlrZzuuFrylef4VVcgm
         cW6A==
X-Gm-Message-State: AOJu0YzASdKhCNABGja559B+TqrxnIuhR6em9ONYG4tWzdhvHkhAfGPO
	s3H9FLF6XyZuWh6knNLbZMGmT0XxTmE3g8TgLufvqQ==
X-Google-Smtp-Source: AGHT+IFBOTXEXr43gdsOEXZTLGsCUTwXsN7icrp4K+mwx8bu9OZBA4TzovT3zYwulcSpy9TKNqZz8A==
X-Received: by 2002:a05:651c:115:b0:2bc:d505:2bf3 with SMTP id a21-20020a05651c011500b002bcd5052bf3mr1744042ljb.1.1697548529526;
        Tue, 17 Oct 2023 06:15:29 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:29 -0700 (PDT)
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
Subject: [PATCH v2 03/19] riscv: hwprobe: add support for scalar crypto ISA extensions
Date: Tue, 17 Oct 2023 15:14:40 +0200
Message-ID: <20231017131456.2053396-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061532_166691_FD395F86 
X-CRM114-Status: GOOD (  10.41  )
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

RXhwb3J0IHRoZSBmb2xsb3dpbmcgc2NhbGFyIGNyeXB0byBleHRlbnNpb25zIHRocm91Z2ggaHdw
cm9iZToKCi0gWmJrYgotIFpia2MKLSBaYmt4Ci0gWmtuZAotIFprbmUKLSBaa25oCi0gWmtzZWQK
LSBaa3NoCi0gWmt0CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdCAgICAgICB8IDMw
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaCB8IDEwICsrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMg
ICAgICAgICB8IDEwICsrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50
YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggYTUyOTk2YjIyZjc1Li45Njg4OTU1NjJkNDIg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9jdW1l
bnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdApAQCAtNzcsNiArNzcsMzYgQEAgVGhlIGZvbGxvd2lu
ZyBrZXlzIGFyZSBkZWZpbmVkOgogICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQlNg
OiBUaGUgWmJzIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzIGRlZmluZWQKICAgICAgICBpbiB2
ZXJzaW9uIDEuMCBvZiB0aGUgQml0LU1hbmlwdWxhdGlvbiBJU0EgZXh0ZW5zaW9ucy4KIAorICAq
IDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQkNgIFRoZSBaYmMgZXh0ZW5zaW9uIGlzIHN1
cHBvcnRlZCwgYXMgZGVmaW5lZAorICAgICAgIGluIHZlcnNpb24gMS4wIG9mIHRoZSBTY2FsYXIg
Q3J5cHRvIElTQSBleHRlbnNpb25zLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhU
X1pCS0JgIFRoZSBaYmtiIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzCisgICAgICAgZGVmaW5l
ZCBpbiB2ZXJzaW9uIDEuMCBvZiB0aGUgU2NhbGFyIENyeXB0byBJU0EgZXh0ZW5zaW9ucy4KKwor
ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQktDYCBUaGUgWmJrYyBleHRlbnNpb24g
aXMgc3VwcG9ydGVkLCBhcworICAgICAgIGRlZmluZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIFNj
YWxhciBDcnlwdG8gSVNBIGV4dGVuc2lvbnMuCisKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9C
RV9FWFRfWkJLWGAgVGhlIFpia3ggZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMKKyAgICAgICBk
ZWZpbmVkIGluIHZlcnNpb24gMS4wIG9mIHRoZSBTY2FsYXIgQ3J5cHRvIElTQSBleHRlbnNpb25z
LgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pLTkRgIFRoZSBaa25kIGV4dGVu
c2lvbiBpcyBzdXBwb3J0ZWQsIGFzCisgICAgICAgZGVmaW5lZCBpbiB2ZXJzaW9uIDEuMCBvZiB0
aGUgU2NhbGFyIENyeXB0byBJU0EgZXh0ZW5zaW9ucy4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9I
V1BST0JFX0VYVF9aS05FYCBUaGUgWmtuZSBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcworICAg
ICAgIGRlZmluZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIFNjYWxhciBDcnlwdG8gSVNBIGV4dGVu
c2lvbnMuCisKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWktOSGAgVGhlIFprbmgg
ZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMKKyAgICAgICBkZWZpbmVkIGluIHZlcnNpb24gMS4w
IG9mIHRoZSBTY2FsYXIgQ3J5cHRvIElTQSBleHRlbnNpb25zLgorCisgICogOmM6bWFjcm86YFJJ
U0NWX0hXUFJPQkVfRVhUX1pLU0VEYCBUaGUgWmtzZWQgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwg
YXMKKyAgICAgICBkZWZpbmVkIGluIHZlcnNpb24gMS4wIG9mIHRoZSBTY2FsYXIgQ3J5cHRvIElT
QSBleHRlbnNpb25zLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pLU0hgIFRo
ZSBaa3NoIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzCisgICAgICAgZGVmaW5lZCBpbiB2ZXJz
aW9uIDEuMCBvZiB0aGUgU2NhbGFyIENyeXB0byBJU0EgZXh0ZW5zaW9ucy4KKworICAqIDpjOm1h
Y3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aS1RgIFRoZSBaa3QgZXh0ZW5zaW9uIGlzIHN1cHBvcnRl
ZCwgYXMgZGVmaW5lZAorICAgICAgIGluIHZlcnNpb24gMS4wIG9mIHRoZSBTY2FsYXIgQ3J5cHRv
IElTQSBleHRlbnNpb25zLgorCiAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJG
XzBgOiBBIGJpdG1hc2sgdGhhdCBjb250YWlucyBwZXJmb3JtYW5jZQogICBpbmZvcm1hdGlvbiBh
Ym91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nlc3NvcnMuCiAKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vaHdwcm9iZS5oCmluZGV4IDAwNmJmYjQ4MzQzZC4uODlkMGUzN2EwMWU5IDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCisrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKQEAgLTI5LDYgKzI5LDE2IEBAIHN0cnVjdCBy
aXNjdl9od3Byb2JlIHsKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pCQQkJKDEgPDwgMykK
ICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pCQgkJKDEgPDwgNCkKICNkZWZpbmUJCVJJU0NW
X0hXUFJPQkVfRVhUX1pCUwkJKDEgPDwgNSkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pC
QwkJKDEgPDwgNikKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pCS0IJCSgxIDw8IDcpCisj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQktDCQkoMSA8PCA4KQorI2RlZmluZQkJUklTQ1Zf
SFdQUk9CRV9FWFRfWkJLWAkJKDEgPDwgOSkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pL
TkQJCSgxIDw8IDEwKQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWktORQkJKDEgPDwgMTEp
CisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aS05ICQkoMSA8PCAxMikKKyNkZWZpbmUJCVJJ
U0NWX0hXUFJPQkVfRVhUX1pLU0VECQkoMSA8PCAxMykKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVf
RVhUX1pLU0gJCSgxIDw8IDE0KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWktUCQkoMSA8
PCAxNSkKICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wCTUKICNkZWZpbmUJCVJJ
U0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktOT1dOCSgwIDw8IDApCiAjZGVmaW5lCQlSSVNDVl9I
V1BST0JFX01JU0FMSUdORURfRU1VTEFURUQJKDEgPDwgMCkKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3N5c19yaXNjdi5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKaW5k
ZXggZTIwNzg3NGU2ODZlLi4yYjUwYzY2MWRhOTAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3N5c19yaXNjdi5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCkBAIC0x
NjIsNiArMTYyLDE2IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2
X2h3cHJvYmUgKnBhaXIsCiAJCUNIRUNLX0lTQV9FWFQoWkJBKTsKIAkJQ0hFQ0tfSVNBX0VYVCha
QkIpOwogCQlDSEVDS19JU0FfRVhUKFpCUyk7CisJCUNIRUNLX0lTQV9FWFQoWkJDKTsKKwkJQ0hF
Q0tfSVNBX0VYVChaQktCKTsKKwkJQ0hFQ0tfSVNBX0VYVChaQktDKTsKKwkJQ0hFQ0tfSVNBX0VY
VChaQktYKTsKKwkJQ0hFQ0tfSVNBX0VYVChaS05EKTsKKwkJQ0hFQ0tfSVNBX0VYVChaS05FKTsK
KwkJQ0hFQ0tfSVNBX0VYVChaS05IKTsKKwkJQ0hFQ0tfSVNBX0VYVChaS1NFRCk7CisJCUNIRUNL
X0lTQV9FWFQoWktTSCk7CisJCUNIRUNLX0lTQV9FWFQoWktUKTsKICN1bmRlZiBDSEVDS19JU0Ff
RVhUCiAJfQogCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
