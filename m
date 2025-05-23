Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1314C54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEQ2E3HpgZFlTmYqh90XxVEDi6S2gXl2SErDFYoOnDw=; b=AD5TyqfRD62GXN
	rGK3LwxuvVs+YDu0Oj+/xqottWNHfFm2KSR9XpR1O3He2C7CQykFgrVQDKfSiHNFMBbrohkT+z1WE
	SBXrQXStsFt5MT01ckLkEmNAqOlonWrF5GqdXA2cdDR6QrAxjSYFRMhfFgBVF2BDvtTCkqiTngXrM
	1wYjtZHuZQFXIb0OxEBbIwXQwTcVyYEn72c3CSzmX/qNCvmfcv28R7Gus9WErCQB2h0htctfKZHX4
	ddb/guB0N5UMy3UMGrarmevX7rrvozKYDn1vA1hSETtcWX80BzGwg0sNWzZi92BMq63ULfRZil9zc
	ss9V5GONdpGp87sdIY6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPXy-00000003a7b-07zK;
	Fri, 23 May 2025 10:22:38 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPXu-00000003a5V-413O
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:22:36 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso7634651b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 03:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995754; x=1748600554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Pxqge87zPhTrwo0PySrFAhV25ryh/dqXEpJhdjy2V4=;
        b=K6fNVm9/K6TMDkaVSfVmz2QLvRUdbt6qJAPuqlJqpB2FW0ZMfPZNuWUsd32JHVnLTK
         LhWlTqk+c5jo5emcMo8o83/UfYAl5kY60FOM4REy9EGlgFt+ObH8keqFavQ9poKfHEbh
         s3QSw9njB44+xIcWTIIm12OsqSWjp2x0TiJKNorNEkh3QyQy8Lqm1myL4WtRM42tSvtg
         WR6lEnVs78i9/0/2PbIiBIeRAK4rAnaW3MC9gPPKS2FUPQONo60ET++ce4cFxlneMfFW
         VaW0/dKBF3rEv93u8nQ73y3l2StMtBnrnoFQd5Ev/05uyEtNS46KmfYsE62wNfmIomFx
         XlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995754; x=1748600554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Pxqge87zPhTrwo0PySrFAhV25ryh/dqXEpJhdjy2V4=;
        b=kiSWA5WihGOVqzBxIZt2EilrTnnWtBF91Vdd0DBCQS62MP7Y4balqFFW23Pa+S8QiV
         xJYOXU768qs4lz1RTHGxs7HeD1RtaIUX8Vkzp25rSx0QXbXtv82U0ShDUIXCexmgMXuk
         yTOTA5NscG4RHzPkH0PZWfDceJqbANQPnU5ep8fTX4PYL2twN4NDj2qp+OxzHe4rRwTj
         P8/fQW2vFAjasj4PWdzbd/oZ+Uffj7/GXYRs/xzhhX/Sta4IaylgXWKdrSWNeRFpJBK7
         1JrjlFI+kiPgxCRQjzx9xSLMjLJHbB13P8fvDo8kP+RiqTjJx3N58xbcLxcYms/VnhE4
         W7nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJFV6KkciblI98GUF3EcAeky2dxkoZS7N5MfjJyc9QawuoWj7bzqc9/b0Vj6CiP+RGzy8+hZ+yRLnARw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrzZb13+7GjQJI3w3H2IG2Qjcrf9Y8703P8mZLxANliJrfV9AE
	CnMVLCbE7XA32C8mNwcZW5cB3L9HGmTdK/Pc5IQn7BhLZpgxnc9dP7nCDbB39NvU/Cs=
X-Gm-Gg: ASbGncsfBgqL6xxpMM8z/A6q7KQuWOGYDgTGbF/2RkvdJiSDumKmWQ3mLaxIZ8YLEv1
	IO6/2kguP3+pm7PSjntKALBmJwaI4/H4vmwTDBqYXH1596NvdcW95Ouw074tegrhhNWrkvQ2xDJ
	PMk4zbfsuQ3MhfV8sXAeXF2YIXa1vi2oqorzi5Z27J4w57ebSx+ELAjVh2NfGQkQOUCLAsCtL7l
	lCXS5TI6RlCTQyXFf8efbCA6cukkt35S/HGgMogaXnlb1k13jnW/G4kTuPQ5wW5MF8VQFsklSZ8
	qohtH5rLnv83ZKWEnlKIl1s7K2j7tNEXGh7DUuq8PqMn0Rp4vsaM
X-Google-Smtp-Source: AGHT+IE1gzTYiMm9OIAjWx1ABZw0Jx+guEhp6+UHAyUqExFCs1x+5gRpocDwFkted+eu2d1RJUlKew==
X-Received: by 2002:a05:6a20:7f9b:b0:1ee:dcd3:80d7 with SMTP id adf61e73a8af0-21621663910mr40638738637.0.1747995754383;
        Fri, 23 May 2025 03:22:34 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:22:33 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 11/14] RISC-V: KVM: add SBI extension init()/deinit() functions
Date: Fri, 23 May 2025 12:19:28 +0200
Message-ID: <20250523101932.1594077-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_032234_989760_C6FF8042 
X-CRM114-Status: GOOD (  13.99  )
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

VGhlIEZXRlQgU0JJIGV4dGVuc2lvbiB3aWxsIG5lZWQgdG8gZHluYW1pY2FsbHkgYWxsb2NhdGUg
bWVtb3J5IGFuZCBkbwppbml0IHRpbWUgc3BlY2lmaWMgaW5pdGlhbGl6YXRpb24uIEFkZCBhbiBp
bml0L2RlaW5pdCBjYWxsYmFja3MgdGhhdAphbGxvd3MgdG8gZG8gc28uCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgpSZXZpZXdlZC1ieTogQXRpc2ggUGF0
cmEgPGF0aXNocEByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
dmNwdV9zYmkuaCB8ICA5ICsrKysrKysrKwogYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAg
ICAgICAgICB8ICAyICsrCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAgIHwg
MjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2Jp
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCmluZGV4IDRlZDYyMDNj
ZGQzMC4uYmNiOTA3NTdiMTQ5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV92Y3B1X3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgK
QEAgLTQ5LDYgKzQ5LDE0IEBAIHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHsKIAogCS8q
IEV4dGVuc2lvbiBzcGVjaWZpYyBwcm9iZSBmdW5jdGlvbiAqLwogCXVuc2lnbmVkIGxvbmcgKCpw
cm9iZSkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKKworCS8qCisJICogSW5pdC9kZWluaXQgZnVu
Y3Rpb24gY2FsbGVkIG9uY2UgZHVyaW5nIFZDUFUgaW5pdC9kZXN0cm95LiBUaGVzZQorCSAqIG1p
Z2h0IGJlIHVzZSBpZiB0aGUgU0JJIGV4dGVuc2lvbnMgbmVlZCB0byBhbGxvY2F0ZSBvciBkbyBz
cGVjaWZpYworCSAqIGluaXQgdGltZSBvbmx5IGNvbmZpZ3VyYXRpb24uCisJICovCisJaW50ICgq
aW5pdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKKwl2b2lkICgqZGVpbml0KShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpOwogfTsKIAogdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfZm9yd2FyZChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4pOwpAQCAtNjksNiArNzcsNyBA
QCBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqa3ZtX3ZjcHVfc2JpX2ZpbmRf
ZXh0KAogYm9vbCByaXNjdl92Y3B1X3N1cHBvcnRzX3NiaV9leHQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCBpbnQgaWR4KTsKIGludCBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2Jp
X2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2Rl
aW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiBpbnQga3ZtX3Jpc2N2X3ZjcHVfZ2V0X3Jl
Z19zYmlfc3RhKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyByZWdfbnVtLAog
CQkJCSAgIHVuc2lnbmVkIGxvbmcgKnJlZ192YWwpOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCmluZGV4IDAyNjM1YmFjOTFmMS4uMjI1
OTcxN2UzYjg5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKKysrIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdS5jCkBAIC0xODcsNiArMTg3LDggQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3Bv
c3RjcmVhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCiB2b2lkIGt2bV9hcmNoX3ZjcHVfZGVz
dHJveShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB7CisJa3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5p
dCh2Y3B1KTsKKwogCS8qIENsZWFudXAgVkNQVSBBSUEgY29udGV4dCAqLwogCWt2bV9yaXNjdl92
Y3B1X2FpYV9kZWluaXQodmNwdSk7CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCmluZGV4IGQxYzgzYTc3NzM1ZS4uMzEz
OWYxNzFjMjBmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCisrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKQEAgLTUwOCw1ICs1MDgsMzEgQEAgdm9pZCBrdm1fcmlz
Y3ZfdmNwdV9zYmlfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCXNjb250ZXh0LT5leHRf
c3RhdHVzW2lkeF0gPSBleHQtPmRlZmF1bHRfZGlzYWJsZWQgPwogCQkJCQlLVk1fUklTQ1ZfU0JJ
X0VYVF9TVEFUVVNfRElTQUJMRUQgOgogCQkJCQlLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfRU5B
QkxFRDsKKworCQlpZiAoZXh0LT5pbml0ICYmIGV4dC0+aW5pdCh2Y3B1KSAhPSAwKQorCQkJc2Nv
bnRleHQtPmV4dF9zdGF0dXNbaWR4XSA9IEtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19VTkFWQUlM
QUJMRTsKKwl9Cit9CisKK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5pdChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCit7CisJc3RydWN0IGt2bV92Y3B1X3NiaV9jb250ZXh0ICpzY29udGV4dCA9
ICZ2Y3B1LT5hcmNoLnNiaV9jb250ZXh0OworCWNvbnN0IHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2V4
dGVuc2lvbl9lbnRyeSAqZW50cnk7CisJY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNp
b24gKmV4dDsKKwlpbnQgaWR4LCBpOworCisJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoc2Jp
X2V4dCk7IGkrKykgeworCQllbnRyeSA9ICZzYmlfZXh0W2ldOworCQlleHQgPSBlbnRyeS0+ZXh0
X3B0cjsKKwkJaWR4ID0gZW50cnktPmV4dF9pZHg7CisKKwkJaWYgKGlkeCA8IDAgfHwgaWR4ID49
IEFSUkFZX1NJWkUoc2NvbnRleHQtPmV4dF9zdGF0dXMpKQorCQkJY29udGludWU7CisKKwkJaWYg
KHNjb250ZXh0LT5leHRfc3RhdHVzW2lkeF0gPT0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX1VO
QVZBSUxBQkxFIHx8CisJCSAgICAhZXh0LT5kZWluaXQpCisJCQljb250aW51ZTsKKworCQlleHQt
PmRlaW5pdCh2Y3B1KTsKIAl9CiB9Ci0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
