Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EA5C3ABC9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUezo0XZjum4prumw4/6wBCtUV8fHq6Teh4NnRPyrso=; b=hPU65c1x0EuIKK
	YtzxQxm3lsnq6LfQn9jt2AYDmLuXlLYsLgB5/ZWSoqMmiPFOt5RqJW32z/xLJ3/RC/GthukYOtqfd
	UWn3uAlwYKlovc3WOeF962xPYjTnEeskDjy5r3NZA4w4mrxyjiDRXj1NqBeQCwLciRJrX0GXJbRPU
	Ut+9T0EMnRXkYJhBmv3mrsKNC1PYRRQ/rAjw0/HY3ulsAx2qQaoijpbJ/l+UnH/+iSqPytBsXmjaZ
	G1AgPa+ceZegLnCvbR3fgnk3FfZyBK2zGD1SuYdJ2dkmUMtqw0PE4PVh49y/OPboRUUqxFBFCZOWh
	gKcp6cCFWDDd62a8rliA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyN-0000000HY0M-1imr;
	Thu, 15 May 2025 08:29:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTsl-0000000HVpl-3TUn
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:24:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cfe574976so4312605e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297438; x=1747902238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4S246g4wPo4d+7PdKHFRm08olDhB+ym0CPBTheC+H4=;
        b=hzh/7Eww3Q0zGq+FCnWlssC4HDgoZuADJXTeSa/xzDpgxTue3Z45sNfnRWcr94vHtQ
         HH/1dFYk7E8/viyaNHMyIKNbG6LLKw3lmIZxC9qVKjxusQCITidOagNnAHRv3lICeFUF
         oMv0AZ5mIEVP9dBrO0wXU+ZSy9S3GKmnq2oppGtluhhbc0ZnmtB868/U68u6H6Fk2exQ
         GEa2wWnBY6LtRmp6euXOkvijZeeLBCeLyQn2GLJG3GbDZgRnXKeFWl4doLEESfAhVQAf
         C3pBTfh0gC8MZfb07FIs1qVjxdfoMjEhL4mJejJe+t8rZOdnRX2Q17cVdzK5Rf7+pi2a
         oFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297438; x=1747902238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4S246g4wPo4d+7PdKHFRm08olDhB+ym0CPBTheC+H4=;
        b=BGePm9DyW0PJurjkaGQP+oOHHXQNcvdvzeULWb3fLkJ+p4Y4ncGBaelMCM41oXd+p+
         hhxdVR3yCywcPtGz+ePjD3zMB4icPM2XZ0RBXEJ+eKa+LRqejEBJteH71j72EBFhLZ6m
         fkweLCndxuyIPoN5hAn4gBWMw9F3T8DE6WHa4VvUoiWV8davMAZhhn6TEQIPFaNCd0/B
         v9V/dg9LPPx7TAUbXiZyRtHEh1DRLqePbR+OvFpjNI4rZTF8x7m4nIalmrTdjiMuGabb
         iILcpuLt7b42N2tN/xPZhcmVm2jIRligsGMIM4Dv7ChtLDGQNNDb6B61I50Rt/0hEtPM
         JgLw==
X-Forwarded-Encrypted: i=1; AJvYcCXJZZHkVWzfhqmlh1NOwobirr8pGrhkgF6WGcvd0qLpruAXawYoNdZLwqZfnXiYO6XPE/8/njx3b9/g1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9sWcgsZ+X279lBwgykQQ0Bpa+AkXOguY3iW5ZZ6/8icCDtxtk
	fqJq4KUGQcLFhdGgXFIBQtGPoyU8p3LnhR9lj4rmxNXZdwojBTfriq+ZZ1ppmTA=
X-Gm-Gg: ASbGnctVDDzJG3QlWL1n+zI1Ok0ZpWmc/kbat46DhUGvlg72o5iUfwBeAaTqMX2wW6a
	ytRUH6xgRltj8jPYnHZk2bnyc7BHc2L30bOz3AaC4vLaBGj0W3BoDgo90ZmyXupf5jYVLOkjL3A
	kgojVHc9jCYe5u443XHjlwoHEpnf2y97o04Wt+mqg7yTBuGQQBojaEKEbnrVXxmYL7r3uA1135M
	GiwO5omyX5T4MzUieCaO3hXTs+XWxmBpdNiUaReVM04CBikvRpv/Q5uZT0FL74/MMeQW0p1w2c6
	xF4QTkgvG8eFCLkzGTyhIDbIQRTe/P4JxXCl741Xwe9mqAgPaP0=
X-Google-Smtp-Source: AGHT+IEY/qaTpWPjrGPpTEDfbNO4QGbOP366jxmTDp9n9/JqDA0v7dO/pJplxyWuqhCmMjnDiPy7MA==
X-Received: by 2002:a05:600c:3ba8:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-442f2110f24mr58036485e9.19.1747297438529;
        Thu, 15 May 2025 01:23:58 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:57 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 12/14] RISC-V: KVM: add SBI extension reset callback
Date: Thu, 15 May 2025 10:22:13 +0200
Message-ID: <20250515082217.433227-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012359_879386_B0C98F8A 
X-CRM114-Status: GOOD (  17.60  )
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

Q3VycmVudGx5LCBvbmx5IHRoZSBTVEEgZXh0ZW5zaW9uIG5lZWRlZCBhIHJlc2V0IGZ1bmN0aW9u
IGJ1dCB0aGF0J3MKZ29pbmcgdG8gYmUgdGhlIGNhc2UgZm9yIEZXRlQgYXMgd2VsbC4gQWRkIGEg
cmVzZXQgY2FsbGJhY2sgdGhhdCBjYW4gYmUKaW1wbGVtZW50ZWQgYnkgU0JJIGV4dGVuc2lvbnMu
CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJl
dmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgpSZXZpZXdl
ZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1faG9zdC5oICAgICB8ICAxIC0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX3ZjcHVfc2JpLmggfCAgMiArKwogYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAg
ICAgICB8ICAyICstCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAgIHwgMjQg
KysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYyAg
ICAgICAgIHwgIDMgKystCiA1IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IDBlOWMyZmFiNjM3OC4u
NGZhMDJlMDgyMTQyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0
LmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBAIC00MDcsNyArNDA3
LDYgQEAgdm9pZCBfX2t2bV9yaXNjdl92Y3B1X3Bvd2VyX29uKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSk7CiB2b2lkIGt2bV9yaXNjdl92Y3B1X3Bvd2VyX29uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7
CiBib29sIGt2bV9yaXNjdl92Y3B1X3N0b3BwZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAot
dm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfc3RhX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7
CiB2b2lkIGt2bV9yaXNjdl92Y3B1X3JlY29yZF9zdGVhbF90aW1lKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSk7CiAKICNlbmRpZiAvKiBfX1JJU0NWX0tWTV9IT1NUX0hfXyAqLwpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX3ZjcHVfc2JpLmgKaW5kZXggYmNiOTA3NTdiMTQ5Li5jYjY4YjNhNTdjOGYgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaApAQCAtNTcsNiArNTcsNyBAQCBzdHJ1
Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB7CiAJICovCiAJaW50ICgqaW5pdCkoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KTsKIAl2b2lkICgqZGVpbml0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwor
CXZvaWQgKCpyZXNldCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIH07CiAKIHZvaWQga3ZtX3Jp
c2N2X3ZjcHVfc2JpX2ZvcndhcmQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1
biAqcnVuKTsKQEAgLTc4LDYgKzc5LDcgQEAgYm9vbCByaXNjdl92Y3B1X3N1cHBvcnRzX3NiaV9l
eHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgaWR4KTsKIGludCBrdm1fcmlzY3ZfdmNwdV9z
YmlfZWNhbGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKIHZv
aWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIHZvaWQg
a3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwordm9pZCBr
dm1fcmlzY3ZfdmNwdV9zYmlfcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAogaW50IGt2
bV9yaXNjdl92Y3B1X2dldF9yZWdfc2JpX3N0YShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2ln
bmVkIGxvbmcgcmVnX251bSwKIAkJCQkgICB1bnNpZ25lZCBsb25nICpyZWdfdmFsKTsKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwppbmRl
eCAyMjU5NzE3ZTNiODkuLmVjOWY0NDU0NWNlYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0v
dmNwdS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwpAQCAtOTYsNyArOTYsNyBAQCBzdGF0
aWMgdm9pZCBrdm1fcmlzY3ZfcmVzZXRfdmNwdShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJdmNw
dS0+YXJjaC5oZmVuY2VfdGFpbCA9IDA7CiAJbWVtc2V0KHZjcHUtPmFyY2guaGZlbmNlX3F1ZXVl
LCAwLCBzaXplb2YodmNwdS0+YXJjaC5oZmVuY2VfcXVldWUpKTsKIAotCWt2bV9yaXNjdl92Y3B1
X3NiaV9zdGFfcmVzZXQodmNwdSk7CisJa3ZtX3Jpc2N2X3ZjcHVfc2JpX3Jlc2V0KHZjcHUpOwog
CiAJLyogUmVzZXQgdGhlIGd1ZXN0IENTUnMgZm9yIGhvdHBsdWcgdXNlY2FzZSAqLwogCWlmIChs
b2FkZWQpCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmkuYwppbmRleCAzMTM5ZjE3MWMyMGYuLjUwYmUwNzliNTUyOCAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaS5jCkBAIC01MzYsMyArNTM2LDI3IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5p
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCWV4dC0+ZGVpbml0KHZjcHUpOwogCX0KIH0KKwor
dm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQorewor
CXN0cnVjdCBrdm1fdmNwdV9zYmlfY29udGV4dCAqc2NvbnRleHQgPSAmdmNwdS0+YXJjaC5zYmlf
Y29udGV4dDsKKwljb25zdCBzdHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9leHRlbnNpb25fZW50cnkgKmVu
dHJ5OworCWNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uICpleHQ7CisJaW50IGlk
eCwgaTsKKworCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHNiaV9leHQpOyBpKyspIHsKKwkJ
ZW50cnkgPSAmc2JpX2V4dFtpXTsKKwkJZXh0ID0gZW50cnktPmV4dF9wdHI7CisJCWlkeCA9IGVu
dHJ5LT5leHRfaWR4OworCisJCWlmIChpZHggPCAwIHx8IGlkeCA+PSBBUlJBWV9TSVpFKHNjb250
ZXh0LT5leHRfc3RhdHVzKSkKKwkJCWNvbnRpbnVlOworCisJCWlmIChzY29udGV4dC0+ZXh0X3N0
YXR1c1tpZHhdICE9IEtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19FTkFCTEVEIHx8CisJCSAgICAh
ZXh0LT5yZXNldCkKKwkJCWNvbnRpbnVlOworCisJCWV4dC0+cmVzZXQodmNwdSk7CisJfQorfQor
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpX3N0YS5jCmluZGV4IDVmMzU0MjcxMTRjMS4uY2M2Y2I3YzhmMGU0IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYworKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaV9zdGEuYwpAQCAtMTYsNyArMTYsNyBAQAogI2luY2x1ZGUgPGFzbS9zYmkuaD4K
ICNpbmNsdWRlIDxhc20vdWFjY2Vzcy5oPgogCi12b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9zdGFf
cmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQorc3RhdGljIHZvaWQga3ZtX3Jpc2N2X3ZjcHVf
c2JpX3N0YV9yZXNldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB7CiAJdmNwdS0+YXJjaC5zdGEu
c2htZW0gPSBJTlZBTElEX0dQQTsKIAl2Y3B1LT5hcmNoLnN0YS5sYXN0X3N0ZWFsID0gMDsKQEAg
LTE1Niw2ICsxNTYsNyBAQCBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1
X3NiaV9leHRfc3RhID0gewogCS5leHRpZF9lbmQgPSBTQklfRVhUX1NUQSwKIAkuaGFuZGxlciA9
IGt2bV9zYmlfZXh0X3N0YV9oYW5kbGVyLAogCS5wcm9iZSA9IGt2bV9zYmlfZXh0X3N0YV9wcm9i
ZSwKKwkucmVzZXQgPSBrdm1fcmlzY3ZfdmNwdV9zYmlfc3RhX3Jlc2V0LAogfTsKIAogaW50IGt2
bV9yaXNjdl92Y3B1X2dldF9yZWdfc2JpX3N0YShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCi0tIAoy
LjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
