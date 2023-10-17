Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E139CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqpvDLAOB2PS4AKzl8Q/yYsUtS3dNQTTf4LeMfP5s0w=; b=rdJrA/m/+SgMPt
	HrXE5rogJ1um74r577r9UnCUONaAqXggm7op/MlbmOPrAlJRPA5qmuwigmkrhlApnOmzkIMJCFcpS
	GdmpLz9RH5R2e6Dcqjt6ByQdcRfSj1eLtK6YTQDltdqrB0QK8j+TGxEQ4BCIcRfVNmBkzFZ5wOOtN
	MrvAOcNdjR0I6kpBpJXKeNXH4eGM87ZMKX17y5iDY+KWldlLZ0IfLKOxPG5GA9kFsZkfHAKQKH/y/
	VEyUtqso4ENKRF75aWxTO7AThsp6A7a5LW9Wz4V9vIZuYnfiafEZO5IJTbzM9FQ+XwZaCd3rmQOS9
	X3Fu/+ZNR/SMJMLpGcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvZ-00CNfk-2s;
	Tue, 17 Oct 2023 13:16:05 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvH-00CNEh-1S
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-406532c49dcso17776895e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548545; x=1698153345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4LU7gzy3Hbb258ih1CCCOKNMQ4iLpkNhcu+Kc5tvws=;
        b=1iVPB6qmgwaMn9vPltna+jAt3LCAFIxqQJxJi3dWJs30ZDbKKq5/nu+2XLJ+4c773h
         PzXXEgvBg+jzRcZ8LJo4CBnRne3WH0kPM09anGkCxA5HiSkcsmuCkffjJbmTtR4N9TQY
         v4pOSE6xgEvpXHqt1oYxKPYKw6VykPR4yhiBmaz7NLxsSjFGk5HE8YYpObkziNTfgMSd
         WWndb11IHCdxYe4RcGKeOarkC0ard33E0wMvLwiNndRqAQPQL6WcR+AZe2n66AuFzOih
         pvqd+wJC2cOgpuENlWzwqLXDIlBKaaJT92Yf9cH6EJqVfPKlpFwxupW/O0+Q9WjhHBrk
         +3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548545; x=1698153345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4LU7gzy3Hbb258ih1CCCOKNMQ4iLpkNhcu+Kc5tvws=;
        b=OHVLOmtet++12AxKGkNtuQeSLSb7BTzY0mP4giNL/ryIxAcx5WwWktJTzHjLdMiAPR
         hPFiDklTSt7O+VgkRjt++u0xfkwlPuwa1arOtGGatVFUq2jMUmmP58XNirwdWQ8yB7c/
         1lP1hRyE0xRN1XCVzFL4vxc72Bk/WDGgkSe2R0EX/sNvDoqULUKtR4fjywa8RSx/F2U1
         JOmenn1nxkiuMfjYjfQXwwxH7u9/NxbsLUUct9Qda+bH7EylyR/F+DXhc0kAHz7G1PNW
         tOFyVBIK0qG3vvAhonhi0NRSt3Y0oBWiiAJv3pm89r9XlBjcSH2SEci3XXtZMDSRJzTF
         qhyw==
X-Gm-Message-State: AOJu0YwBYdIlfg9hkDcq6kBpK9wmMTvaEjc1J+uFYieT3WUPEvGVXWkm
	/sv4IH57ZeDDBV+c6ThEmP54Ya5s0pHjn1mQE+G56w==
X-Google-Smtp-Source: AGHT+IHnpuaE2cK/zZiBwTN9WlDKtqZo7vhcXCnW27rCQU+XEM9WRrUe1J4q6WIg4FdM21J+kwJUfg==
X-Received: by 2002:a05:600c:891:b0:405:4280:341d with SMTP id l17-20020a05600c089100b004054280341dmr1640946wmp.4.1697548544833;
        Tue, 17 Oct 2023 06:15:44 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:44 -0700 (PDT)
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
Subject: [PATCH v2 18/19] riscv: hwprobe: export Zfa ISA extension
Date: Tue, 17 Oct 2023 15:14:55 +0200
Message-ID: <20231017131456.2053396-19-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061547_513437_7534C842 
X-CRM114-Status: GOOD (  11.27  )
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

RXhwb3J0IFpmYSBJU0EgZXh0ZW5zaW9uWzFdIHRocm91Z2ggaHdwcm9iZS4KCkxpbms6IGh0dHBz
Oi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMVZUNlFJZ2dwYjU5LThRUlYyNjZkRUU0VDhGWlR4
R3E0L3ZpZXcgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9z
aW5jLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0ICAgICAgIHwgNCAr
KysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCiBhcmNoL3Jp
c2N2L2tlcm5lbC9zeXNfcmlzY3YuYyAgICAgICAgIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5y
c3QgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IDc4MmFjMjZjYjkyYS4u
ZjgxZTNjOTNhYzFlIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0
CisrKyBiL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QKQEAgLTE1NCw2ICsxNTQsMTAg
QEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgogICAgICAgIGRlZmluZWQgaW4gdGhl
IFJJU0MtViBWZWN0b3IgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IGUyY2NkMDU0OGQ2Ywog
ICAgICAgICgiUmVtb3ZlIGRyYWZ0IHdhcm5pbmdzIGZyb20gWnZmaFttaW5dIikuCiAKKyAgKiA6
YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWkZBYDogVGhlIFpmYSBleHRlbnNpb24gaXMgc3Vw
cG9ydGVkIGFzCisgICAgICAgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51YWwgc3RhcnRp
bmcgZnJvbSBjb21taXQgMDU2YjZmZjQ2N2M3CisgICAgICAgKCJaZmEgaXMgcmF0aWZpZWQiKS4K
KwogKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRo
YXQgY29udGFpbnMgcGVyZm9ybWFuY2UKICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNlbGVjdGVk
IHNldCBvZiBwcm9jZXNzb3JzLgogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApp
bmRleCA3OTQwNzAxMDk1MmEuLjQwMTQ0OTJjMzk2MCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oCkBAIC01NCw2ICs1NCw3IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKICNk
ZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pJSElOVE5UTAkoMSA8PCAyOCkKICNkZWZpbmUJCVJJ
U0NWX0hXUFJPQkVfRVhUX1pWRkgJCSgxIDw8IDI5KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9F
WFRfWlZGSE1JTgkoMSA8PCAzMCkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pGQQkJKDEg
PDwgMzEpCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJUklTQ1Zf
SFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCmlu
ZGV4IDhkNmVkZDcyMTYyNy4uYTZhMDYzZjFkY2Y1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9zeXNfcmlzY3YuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwpAQCAt
MTkyLDYgKzE5Miw3IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2
X2h3cHJvYmUgKnBhaXIsCiAJCWlmIChoYXNfZnB1KCkpIHsKIAkJCUNIRUNLX0lTQV9FWFQoWkZI
KTsKIAkJCUNIRUNLX0lTQV9FWFQoWkZITUlOKTsKKwkJCUNIRUNLX0lTQV9FWFQoWkZBKTsKIAkJ
fQogI3VuZGVmIENIRUNLX0lTQV9FWFQKIAl9Ci0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
