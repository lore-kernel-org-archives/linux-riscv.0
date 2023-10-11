Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38519CD6E5D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 12:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNDyOVcSM0XysxminslzEOVDaohDfyQRxhrX0n7cqVU=; b=DCB/2W6Pt764pX
	7zGoAmXvQ7tJHegAdMZh326FNPRf+dJ8ZPA4akoBxzNk5vOgUoCFP26yRTuNBIYRHK/fjAWDtOary
	ruX7hE6qAeoQivaxqQAbFqnqGx+JaqJxlDCncn3hV+FVZTM2pjwKMLHSgByyRgWvIe0AXBEVXete/
	xzd+SRr4ccdeVYsHVOxaOClPIGuPUMgowGzQJfQyHJlKkd8+k9lSmLW8NO1AJgP0n2QkO3lLjYs8T
	l3SiZ7mpo/xy4EU4JekR5ArhGe2RmOXqyqQKk2KdvHElV5q25utR0i0PTJUETXyBY9YNxdCATmv+Y
	VzT+jjpIxdmymNRtCovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqYMH-00Fqpk-2N;
	Wed, 11 Oct 2023 12:30:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFV-00FjRm-1F
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Oct 2023 11:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nDxU+S/2S9Zyokkzv2m0SOvysTHMfn1aGA6JYhknF4k=; b=fLWJ3AxWSLrMFDQ/Uw15T77iF7
	5AKpooSxQkEHhfWJwD1QkKd3JQ2f/uzpFlTewIpThaQlbs5OLCNsOJGKf6P67FBvcxxkmHHr72Z3s
	85DheOebMOtzrY/Zhg9tUq0pMbIr5WvI9Ozyf3Rrilg+hzwIDGTqAfIfe6hhXppUj3VbAzmmOfA7q
	gfMjuklwaXdQLMJMm2I9D2Vm2DUd5ER/GvCz1+oqIYlpLjuStxyH+U3b0YXMYi9t3UxsrsoqNEWot
	yjzCY53TfayX+Y67wgaq28Rl2xxz+ELTJDyr5Lz1FWq4q8xNlUAdKI6nCmYCS6u39Qe7VqnY9g3Le
	sJTw3ftQ==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFO-000A2Y-2r
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:19:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso18558685e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023166; x=1697627966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDxU+S/2S9Zyokkzv2m0SOvysTHMfn1aGA6JYhknF4k=;
        b=ReNphagS6/Prn+d8liLB5sIOXEHSFqLdQgBNGlg01n1NJ2zbc64Iv9RaimCzRpnWVd
         ZEccqlDYtBNjtfnpQFg6UeUBAu0etx3Y8xjs8Cl6MEKEQTVMk7FTTcYo6Al+3hC/Mb8d
         dpdVnrBkCLVLSjuUmgO4QDNchnbbRHaCCifrjlkxmDMXDOotgFtDpRJ/7iIu0qwUSTq3
         jE60PO14uL6Lcw5ieV5I1qU9WCFhYiViMJ6srS9SR81qZ302nO2EDeVuxsax/59XEHWL
         /pUx/0wnpwqIU2AdqexkqiTqS5he3PvEXASVuNrD+oVO7hpUt80x4nIzoF3ekWwQLIG6
         i2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023166; x=1697627966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDxU+S/2S9Zyokkzv2m0SOvysTHMfn1aGA6JYhknF4k=;
        b=D6v8oVjeExe1tJXmAguOTILpANiKQuIYCQMU0oXYodPWOeIhBGPuIVeDmH6SbEC8FL
         izxMKADx70YQqjKG1vLrXRQgXp2qoI4PJfWmeB2fYl28yk9YAbaIDQcOrK9auUYT08JB
         KRyf11dmwnGb0kY2Zo62qGiwexGubByXvdw+/i9snDeNDaA19sBd6ZKwYB5C+nJ4xW+W
         jiwvG7oNqVbqp0X9hM1aimZFf3jKmOCXjlSpJWiSKBuPiFMS7LrkZ6Vysu83n37cJBpQ
         /u5SoAiLuLssJFaT7pFW4kOBceEQUWiCgN2Mc8UU9L9sxlfDcXSvsL0sVFz6y3Oir2WK
         4tAQ==
X-Gm-Message-State: AOJu0YwXR7PjcPhYx425FisqdGpP21MOE4joFnojv/JV5E1Ibpef07b2
	FJIw46P1pIHVoUNY8kwZaRR/vKxwJhsoQCBjNL3Ekg==
X-Google-Smtp-Source: AGHT+IFL8F9ISrFJv94kKo0D+DqyUmKI3p+OtOo8OtLvqm7OkyywkV6XfNe2K2nOJgZP+i+4KXShHQ==
X-Received: by 2002:a05:600c:3ca1:b0:405:3cc1:e115 with SMTP id bg33-20020a05600c3ca100b004053cc1e115mr18775209wmb.3.1697023166187;
        Wed, 11 Oct 2023 04:19:26 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:25 -0700 (PDT)
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
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 12/13] riscv: hwprobe: export Zvfh[min] ISA extensions
Date: Wed, 11 Oct 2023 13:14:37 +0200
Message-ID: <20231011111438.909552-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_121928_435042_C85A384F 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

RXhwb3J0IFp2ZmhbbWluXSBJU0EgZXh0ZW5zaW9uWzFdIHRocm91Z2ggaHdwcm9iZS4KClsxXSBo
dHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFfWXQ2MEhHQWYxcjFoeDdKbnNJcHR3MHNx
a0JkOUJROC92aWV3CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdCAgICAgICB8IDgg
KysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAyICsrCiBh
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyAgICAgICAgIHwgMiArKwogMyBmaWxlcyBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9o
d3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggYTU3N2Ix
ZDcyZGZmLi5jMmMzNTg4ODkxZDEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vcmlzY3YvaHdw
cm9iZS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdApAQCAtMTM0LDYg
KzEzNCwxNCBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAgICogOmM6bWFjcm86
YFJJU0NWX0hXUFJPQkVfRVhUX1pJSElOVE5UTGA6IFRoZSBaaWhpbnRudGwgZXh0ZW5zaW9uIHZl
cnNpb24gMS4wCiAgICAgICAgaXMgc3VwcG9ydGVkIGFzIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJ
U0EgbWFudWFsLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRkhgOiBUaGUg
WnZmaCBleHRlbnNpb24gaXMgc3VwcG9ydGVkIGFzCisgICAgICAgZGVmaW5lZCBpbiB0aGUgUklT
Qy1WIFZlY3RvciBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQgZTJjY2QwNTQ4ZDZjCisgICAg
ICAgKCJSZW1vdmUgZHJhZnQgd2FybmluZ3MgZnJvbSBadmZoW21pbl0iKS4KKworICAqIDpjOm1h
Y3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkZITUlOYDogVGhlIFp2ZmhtaW4gZXh0ZW5zaW9uIGlz
IHN1cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBWZWN0b3IgbWFudWFs
IHN0YXJ0aW5nIGZyb20gY29tbWl0IGUyY2NkMDU0OGQ2YworICAgICAgICgiUmVtb3ZlIGRyYWZ0
IHdhcm5pbmdzIGZyb20gWnZmaFttaW5dIikuCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVf
S0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAgIGlu
Zm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXggM2M0YWE1ZDAxZjkzLi5lZTY4ZWI5MGQ0
YzcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApAQCAtNDgsNiArNDgsOCBA
QCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aRkgJ
CSgxIDw8IDIyKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkZITUlOCSgxIDw8IDIzKQog
I2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklISU5UTlRMCSgxIDw8IDI0KQorI2RlZmluZQkJ
UklTQ1ZfSFdQUk9CRV9FWFRfWlZGSAkJKDEgPDwgMjUpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JF
X0VYVF9aVkZITUlOCSgxIDw8IDI2KQogI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJG
XzAJNQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkK
ICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfcmlzY3YuYwppbmRleCBjYTE3ODI5ZjNlMTYuLjYzZTEyMzMxNDUyNCAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX3Jpc2N2LmMKQEAgLTE3NSw2ICsxNzUsOCBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9l
eHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQkJQ0hFQ0tfSVNBX0VYVChaVktTSCk7
CiAJCQlDSEVDS19JU0FfRVhUKFpWS1NHKTsKIAkJCUNIRUNLX0lTQV9FWFQoWlZLVCk7CisJCQlD
SEVDS19JU0FfRVhUKFpWRkgpOworCQkJQ0hFQ0tfSVNBX0VYVChaVkZITUlOKTsKIAkJfQogCiAJ
CWlmIChoYXNfZnB1KCkpIHsKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
