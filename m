Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159C8C369B2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmiDq0g0F8+qP20t6i+Lfl3hOoEJ0q8ciB4nmgpO6uM=; b=rh8sBb6MsSHT8S
	yWy2dgxZPWuQXG64M1UTYyaA94lV0VE77vAyeMe2XYDrb7WoKFUXKkFaZu5FaO1GYXMqjnPaufu6t
	hEpeLye6ErfL+80kYgcEVNDi5W0bhAy19xQnJXq7HmwDJn/2VdfiI95LU9F06TpldDK35oCuWSJwG
	cNy0gSPFPiMRLFsWhs+a+aymAcU9sQ/Fpr2If9gyshFfYKwCebEVjoCJ3rAfFQmalzvJCTFlfy0JZ
	AmV4jiXwIMynaCSaGxg2i1PUhgujtEOaevv0Z7yDgeVUpevTP3/Xhj9Zfx1rkNeMOmUZ7ILudI74e
	KB82uLSVY0x32z9R0c0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTg-0000000CzVB-2FQF;
	Thu, 17 Apr 2025 12:36:24 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OJW-0000000Cw3t-2IxQ
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:25:55 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22423adf751so8205905ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892754; x=1745497554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTkrNhYYE9bdipW/NOK/ur2NyEJBzn07+HWKIkSphrw=;
        b=RG4J9+yhr8I1M4UiXbxBXMLur+lcsR53qGOJNZR8sVPJMCJkiF3WmwEAT9uOR1zFpw
         hycAbWo99q3Ye5gAdgGiiG1pwmCR/yKAJdJzI/mY4qfYtUF8KWwaVEUoNTun8OuUaj6I
         uKaShJtwNoHN7Ya5twsTh0EzqxiUbEue1ZB8LGY6JA+wCLGRQrUWB93O2IJ+M/AD+6zs
         DxtHv2cQm1NxMRjXSCnIrpgUkcCLNsGYUlNCd7mvG9yvxhoKUdTzFGlww51F3U7a2BBF
         VnurMUDjnR2DYkBYCQSUALn9oycvm72lZtHJtUQzm4Tzbi30VkKQ4hL1fHMllkJ3jgQc
         05KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892754; x=1745497554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTkrNhYYE9bdipW/NOK/ur2NyEJBzn07+HWKIkSphrw=;
        b=lskL1+I/Nv4iHFf4XHBur8zRxc4ZlaqseH4Wr2mWGdahljg+fOw2CAwoKqxNfrZioF
         LJxINDdire9PcCBjkUJEevN24X0SHSS6XhcoJL8d/7/Va/iUe9BvX/TSiwhp4OHzTemW
         YnytAt76olAf1rlBdPDvD/RHo0aD/UfDPxIGbEqZyiC4UdLowgkmkoddMzmmH+oCwSoG
         a7rt8LAQZs1LUDdSRbSfbFoGBJI1Li8mD1ub/hZJ8QK8OoGaaVMaexFgWP62Uw6KgcRj
         P0kAp+HDOuT0aCbyiPknJGQANR94ynMiXMo/rwd+cOiAD2q8AIeQQkzNjzb33K0eN10z
         XyQA==
X-Forwarded-Encrypted: i=1; AJvYcCX0mLljmwuQDchzhUlDc6EE450y+piFxyxPLl4Z+po1JV0dm/YRyOixRxtTGlX4BIICxeM+BT1leVIlzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyIfzCwNgfr+bWng1zO4IMSMyLaQtKOuybCK1E9GKfoW92/shY
	UXZRH5wTKBsA8N7qQt4RZVzK6aZy/9Phf6FAh210o3uA5QaVQuFRHoRjEaNVf6E=
X-Gm-Gg: ASbGncsGoLBplo1CZV11SE0JmeLeJb2LvwBZT8N+n8bR8Z0jTfBsr7zoXf4nTgpsRWZ
	NFJr9Pvphywm0JVK85aDczlaBUjZn4R1UfpvOvLSu+vINnhkuI9YoHdWNEpe5THwMheVbvANKLM
	I0imc/zdn5/3HRRx6anC8LVLyGvwAI6vQdZq0uEJXzNidk+fQuV/xlF7fgWHtbyKTtQkdqHHSBA
	daBFxkygkaab45Zg0KCZB+AbDvo5pzcGDcpksByZZ4ivfZqxRC47Zmr43kSa5J+Tsat9Xv4G6tY
	eZbsLm3qy9F89hov8hNLj60wCmdiin7HZueuCXe3nQ==
X-Google-Smtp-Source: AGHT+IGDgb05pPnIfmQYcdZnqSyk1iwUEfpKUkpi5EKOyqIovfUBARsBsLViyCfGV2qgdXRRvN3wqQ==
X-Received: by 2002:a17:902:e806:b0:223:5e6a:57ab with SMTP id d9443c01a7336-22c3597ee39mr83719155ad.39.1744892753939;
        Thu, 17 Apr 2025 05:25:53 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:25:53 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v5 13/13] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
Date: Thu, 17 Apr 2025 14:20:00 +0200
Message-ID: <20250417122337.547969-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052554_587926_CB17B3A9 
X-CRM114-Status: GOOD (  12.36  )
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

U0JJX0ZXRlRfTUlTQUxJR05FRF9ERUxFRyBuZWVkcyBoZWRlbGVnIHRvIGJlIG1vZGlmaWVkIHRv
IGRlbGVnYXRlCm1pc2FsaWduZWQgbG9hZC9zdG9yZSBleGNlcHRpb25zLiBTYXZlIGFuZCByZXN0
b3JlIGl0IGR1cmluZyBDUFUKbG9hZC9wdXQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVn
QHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFt
aWNyby5jb20+Ci0tLQogYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgIHwgIDMgKysrCiBh
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKaW5kZXgg
NTQyNzQ3ZTJjN2Y1Li5kOThlMzc5OTQ1YzMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHUuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKQEAgLTY0Niw2ICs2NDYsNyBAQCB2b2lk
IGt2bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIHsKIAl2b2lkICpuc2g7
CiAJc3RydWN0IGt2bV92Y3B1X2NzciAqY3NyID0gJnZjcHUtPmFyY2guZ3Vlc3RfY3NyOworCXN0
cnVjdCBrdm1fdmNwdV9jb25maWcgKmNmZyA9ICZ2Y3B1LT5hcmNoLmNmZzsKIAogCXZjcHUtPmNw
dSA9IC0xOwogCkBAIC02NzEsNiArNjcyLDcgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3B1dChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCWNzci0+dnN0dmFsID0gbmFjbF9jc3JfcmVhZChuc2gsIENT
Ul9WU1RWQUwpOwogCQljc3ItPmh2aXAgPSBuYWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX0hWSVApOwog
CQljc3ItPnZzYXRwID0gbmFjbF9jc3JfcmVhZChuc2gsIENTUl9WU0FUUCk7CisJCWNmZy0+aGVk
ZWxlZyA9IG5hY2xfY3NyX3JlYWQobnNoLCBDU1JfSEVERUxFRyk7CiAJfSBlbHNlIHsKIAkJY3Ny
LT52c3N0YXR1cyA9IGNzcl9yZWFkKENTUl9WU1NUQVRVUyk7CiAJCWNzci0+dnNpZSA9IGNzcl9y
ZWFkKENTUl9WU0lFKTsKQEAgLTY4MSw2ICs2ODMsNyBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfcHV0
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAkJY3NyLT52c3R2YWwgPSBjc3JfcmVhZChDU1JfVlNU
VkFMKTsKIAkJY3NyLT5odmlwID0gY3NyX3JlYWQoQ1NSX0hWSVApOwogCQljc3ItPnZzYXRwID0g
Y3NyX3JlYWQoQ1NSX1ZTQVRQKTsKKwkJY2ZnLT5oZWRlbGVnID0gY3NyX3JlYWQoQ1NSX0hFREVM
RUcpOwogCX0KIH0KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5j
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCmluZGV4IGIwZjY2YzdiZjAxMC4uMjM3
ZWRhZWZhMjY3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKKysr
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCkBAIC0xNCw2ICsxNCw4IEBACiAjaW5j
bHVkZSA8YXNtL2t2bV92Y3B1X3NiaS5oPgogI2luY2x1ZGUgPGFzbS9rdm1fdmNwdV9zYmlfZndm
dC5oPgogCisjZGVmaW5lIE1JU19ERUxFRyAoQklUX1VMTChFWENfTE9BRF9NSVNBTElHTkVEKSB8
IEJJVF9VTEwoRVhDX1NUT1JFX01JU0FMSUdORUQpKQorCiBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2Zl
YXR1cmUgewogCS8qKgogCSAqIEBpZDogRmVhdHVyZSBJRApAQCAtNjgsNyArNzAsNDEgQEAgc3Rh
dGljIGJvb2wga3ZtX2Z3ZnRfaXNfZGVmaW5lZF9mZWF0dXJlKGVudW0gc2JpX2Z3ZnRfZmVhdHVy
ZV90IGZlYXR1cmUpCiAJcmV0dXJuIGZhbHNlOwogfQogCitzdGF0aWMgYm9vbCBrdm1fc2JpX2Z3
ZnRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cit7CisJcmV0dXJuIG1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKCk7Cit9CisKK3N0YXRp
YyBsb25nIGt2bV9zYmlfZndmdF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwKKwkJCQkJc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCisJCQkJ
CXVuc2lnbmVkIGxvbmcgdmFsdWUpCit7CisJaWYgKHZhbHVlID09IDEpCisJCWNzcl9zZXQoQ1NS
X0hFREVMRUcsIE1JU19ERUxFRyk7CisJZWxzZSBpZiAodmFsdWUgPT0gMCkKKwkJY3NyX2NsZWFy
KENTUl9IRURFTEVHLCBNSVNfREVMRUcpOworCWVsc2UKKwkJcmV0dXJuIFNCSV9FUlJfSU5WQUxJ
RF9QQVJBTTsKKworCXJldHVybiBTQklfU1VDQ0VTUzsKK30KKworc3RhdGljIGxvbmcga3ZtX3Ni
aV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAor
CQkJCQlzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKKwkJCQkJdW5zaWduZWQgbG9u
ZyAqdmFsdWUpCit7CisJKnZhbHVlID0gKGNzcl9yZWFkKENTUl9IRURFTEVHKSAmIE1JU19ERUxF
RykgIT0gMDsKKworCXJldHVybiBTQklfU1VDQ0VTUzsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVj
dCBrdm1fc2JpX2Z3ZnRfZmVhdHVyZSBmZWF0dXJlc1tdID0geworCXsKKwkJLmlkID0gU0JJX0ZX
RlRfTUlTQUxJR05FRF9FWENfREVMRUcsCisJCS5zdXBwb3J0ZWQgPSBrdm1fc2JpX2Z3ZnRfbWlz
YWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZCwKKwkJLnNldCA9IGt2bV9zYmlfZndmdF9zZXRf
bWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAorCQkuZ2V0ID0ga3ZtX3NiaV9md2Z0X2dldF9taXNhbGln
bmVkX2RlbGVnYXRpb24sCisJfSwKIH07CiAKIHN0YXRpYyBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2Nv
bmZpZyAqCi0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
