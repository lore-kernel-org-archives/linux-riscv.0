Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7604C3ABDD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEQ2E3HpgZFlTmYqh90XxVEDi6S2gXl2SErDFYoOnDw=; b=c6dv+tL0LCaE/Y
	eKiBjmwwcvJxLhzMussLL7SOuQVITDcD9qsIKak9RpMjOgkDktp7fyjIF/y2LXLO6NAKvL6AhLByG
	a11Dx+INOdjLIF726agYz1aBTgIZ/6EtTXdJ7JweVaBMdGAnYY/XislXCFtG8Bp/TyOIy0ZpBEgSw
	68xtUEhbtB+0tfSV2ccNQf+3jIaKFGk8WOhtS+iostJQfC8SGs692cvpQMTqS/j4ObecJxqgYzTl2
	H07XxW/v+hq+JKcTo7JK4nFplRQLMwNrN51hbSsnQV0wIrw0kjSa8PZ4fMCsncs3m4etoVMQb5YVx
	bn7QO01a14JcKDDKn0pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyM-0000000HXyH-1aKG;
	Thu, 15 May 2025 08:29:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTsk-0000000HVoL-2sQ8
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:23:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso6765765e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297437; x=1747902237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Pxqge87zPhTrwo0PySrFAhV25ryh/dqXEpJhdjy2V4=;
        b=NXk4y0TFAuSpXxFhw5lL1mwoOJo0ob61DxYHv8gOG2U8eo/YYFT0UaZ8ODS5SqNNEN
         oOe+YWZUk/5IvxKMH2vUCM85Ef63+jAuWPaeM/l5ByOgyMgZq11IYxX4tZyXm1V7xiXZ
         13ocBhLht+zdqdP1J/PNL7Vt1vilqnoNFpAvoyPn7NcmKSvlGsDBEzuPQPrxhMSb6DL7
         dvtQzAQW6n3PPT/OcKK9qD0lU7TX0vpLi1LRjt/T+BamwKR4UrUBVCIGRoBFTyPgPMi1
         OYUN3aFdOcPBFFd//LgXX7Lv13FDG/LOMasrbGFhmpygryzG0x2Yy8R5B435fq9nYFi1
         KMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297437; x=1747902237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Pxqge87zPhTrwo0PySrFAhV25ryh/dqXEpJhdjy2V4=;
        b=Bw80n2IW8PkBs2M57Pn7+x6uQhBCvAGdcX56hUP/LBNrtY5t9pZorJ3hZE5qWsfyKF
         xKcXau5sfeOIDAnqMcjNaL+iQBeKn1UF1cr7k9QVxo7a3pGGfkofcJPFUBRIAtBUyFMQ
         F2pSHJXHushzs+5RAYKCqOTDlREaBvtkQlEOlfFvS0wGTAWZV5S16GWnNnxsM9AMW5Pv
         7MIKApY7LW7SqmxcIAMkuVU4W6IJO1OXqxy1y81vlHZLjujILPArbvQxCjrx7Wa5mjZi
         tNRV3xSWn753y4dZGbAAv/Q/HNZV9MttScc7j/9jJjQBI0a1rUPpj8mG1fYSScVStzgG
         tmBg==
X-Forwarded-Encrypted: i=1; AJvYcCW7Ayj75A/nCUQvzD69IaQSLI0bLCfj0aIzXyxYFRaCrFAyOuEWB8FRsePs6L2Yee66j30mx/ePxhe3Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhsOfoLT0BFMwtLK+j0hdNvNBgzCpwfxUwzdzlr8R5sLg66QIM
	YkYfG3t4sRwerJlhZwWAzMnTaxm5U+IqhwTyCoXlGUAZTpQCWO+NbHgzHAvA7II=
X-Gm-Gg: ASbGncumEmjv6zMcuohEV3AgvLHDMKXGb02fOWf+3yAfu8hQJquSMxHeF9m+XFjrQfB
	JVTz+NPMaJ19hACPjsemUf7C4pm4mAkTCkny/ZMbC4sxlvfvxBqwiQ6F0LPWOv2Doy4FzM8WMq/
	Ig+M3rFm4yjFQp0b7RR/JH1noziAmTzpMevIPv0OMaiP35BOWC8gHpDbbUG5VEmCQ3Uf1/PfESz
	kqUZUeKTl+HG27xZarAm7Dl0GvrEJy189FnjKWjHR2hB/3aRCMbWznp3FgJKVsWdPS4GUt4ROdi
	hknxJDg/z+LIFWABRwdR7Yk3oUl4XN345F+zD2oWbB4CuiqlVdgjusnMudwLMA==
X-Google-Smtp-Source: AGHT+IEupGcBKUaQtXkFnFukO6A8UdisKBYtlExsocwvYgZ1EXZBcCmelFzxOJQp2aJDmAYM6taW7Q==
X-Received: by 2002:a05:600c:4e11:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-442f20baefamr66539545e9.5.1747297436910;
        Thu, 15 May 2025 01:23:56 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:56 -0700 (PDT)
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
Subject: [PATCH v7 11/14] RISC-V: KVM: add SBI extension init()/deinit() functions
Date: Thu, 15 May 2025 10:22:12 +0200
Message-ID: <20250515082217.433227-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012358_746747_08B35698 
X-CRM114-Status: GOOD (  13.71  )
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
