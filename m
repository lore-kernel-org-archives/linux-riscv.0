Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841E9C021B6
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 14:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGYBBpwnt3hWw/5C3fwSPGMNcDYClNDq6N78sbu4zpg=; b=Wu3WiY9dZNumt9
	/S9yb6gL2TTm5ARkfxNkHX5MuQOK7tvNGMayBWDcYBmYceH+qyxCPBO82vEXof0L8ty+6YTRS/ZbB
	6d1oxa2pSm5XLGxqTTKCPTTgATDbSCblpsJBV45Q/W4RN+GgyimJNQy2HqinkUhn9QvqsPZUhIhnn
	mjVI2b12Sj/bCzkdVkok8tieXQh1uHE9Fo8GneTTvNZuu3JW4K2czlATLHHC+VFSUSArlRhgkIb7A
	d53iV6KEWlrG4xsLVH225jCIoskBcSLf/i1eDyT69nVAOXuSdmYMlPw+Uq3xDHIdSe/rKColu2K7J
	c49zn73Z1hHOfLHbcznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUT5-00000005twK-1Ffr;
	Fri, 21 Feb 2025 14:57:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUT1-00000005tsT-0wRo
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 14:57:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so15363915e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 06:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740149845; x=1740754645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5+0DAJFyGg9dqAHMt/74M2g7aCiRWRLOEFqoe5G5I8=;
        b=P1s0LBllVdxbGkUnvinqD0mpuFny0PGjdIe9xGPhr6bwi9Y1iYjrHJ1hEx72aWf8BE
         g8tVbYolxY2qBNkJM8QI9wu0crDhvt+t1OxPh42rVAyRnXeqpgeB78qo+l1I2FMVu/Vj
         XNwJoxFeYOOinRmTI3GkY74hkK4EPBUDtyT2T9AzjdmTqLa9pWx2BoCz78O1CXY3mVQT
         vj6f05colO1YsvOR+/NEF+8NMkTKMRzGSY11n6w4qW435L8oUpCeOFx9zzimIybSODGb
         xGxU0N8Dmo8MbCsjwVAbwsxvqmuaKlVOxyTsIx1nvFg90pGfQm31e84TrD8Vaa+T/Vuy
         T71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149845; x=1740754645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5+0DAJFyGg9dqAHMt/74M2g7aCiRWRLOEFqoe5G5I8=;
        b=dxTDwH8EC21hfUUq+wTxyexSLp4ZsbNM74+edqschnh1Efbda71TntkD9Lf9nUuFUr
         U57iSTzsLGXegQ6FfSrw1z6ySGF9vdxymu0xthNi314AinLA6TTp2now2cjuGc6AjqEC
         +DVeGakVgA1+ajBWAWd4sLUO11dVbZ5LB6l5klipH7iH8muJeVaIQobPizVGgL4mvZdT
         JR/F2gsWbJ4L/JDrUJChIH0pfLvIdkT6WQ42Yxm3K2YonYk2PBKu/w3p2u+hraYjxOtt
         KR+b/VWrgjnvLIUPNUFUbX+zbHIoPEpp7OmZoyNWJ8VUPRBvo43iFRpQrWdn/U5FG2fd
         qHHA==
X-Gm-Message-State: AOJu0Yw6vfNOVfTqyaQW1qM44t/494WFYdc+CXmBLzcfxg8+sdS2QgYi
	2Z34EooGJ/eIMrK2Rw6+BVGHFVcc0r2hhs6T9IErWdaDQnWVi59+4eugy1jPDdrnzBzSAIn0rPy
	P
X-Gm-Gg: ASbGncvw64CFte8XrZ41TKu7e2U9liQpSdYjDAEZ15ZmF+J8B9NZgewIUWHw4dpFdAF
	IxyFYtIMxhklWrrXHP69yQ9lLG/tCuxjJrTYC0uy0fv5E4glC4573gXM3QoGtISZVe92r6kQ9AE
	0rr36ow5KK0tcbfz3G/5IRE8OVgbK440yncbrj/wB0oQF2EKDcCThlZgv9da27kTYrrWDihCb/O
	M3Uo8Ytwi+9qZl0Cdgz3KVKP3bWeWLkUjUrmAoEVZL/JIS148npUBybzSbJdAcfpDXwPxglXvOn
	Io2H4twaOV3ZMQ==
X-Google-Smtp-Source: AGHT+IETt9kJd9Q7ffWHdL/UIZ/UKzjspmPFiByxf6WkactZKn3mvY2VzKa7KOpSc146Ehnho9+HBw==
X-Received: by 2002:a05:600c:5253:b0:439:a093:fffe with SMTP id 5b1f17b1804b1-439ae1e9601mr32867375e9.7.1740149845532;
        Fri, 21 Feb 2025 06:57:25 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce428sm20391205e9.5.2025.02.21.06.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:57:25 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 4/8] riscv: Change check_unaligned_access_speed_all_cpus to void
Date: Fri, 21 Feb 2025 15:57:23 +0100
Message-ID: <20250221145718.115076-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221145718.115076-10-ajones@ventanamicro.com>
References: <20250221145718.115076-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_065727_262454_A3A3CC22 
X-CRM114-Status: GOOD (  11.55  )
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

VGhlIHJldHVybiB2YWx1ZSBvZiBjaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVz
KCkgaXMgYWx3YXlzCnplcm8sIHNvIG1ha2UgdGhlIGZ1bmN0aW9uIHZvaWQgc28gd2UgZG9uJ3Qg
bmVlZCB0byBjb25jZXJuIG91cnNlbHZlcwp3aXRoIGl0LiBUaGUgY2hhbmdlIGFsc28gYWxsb3dz
IHVzIHRvIHRpZHkgdXAKY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cygpIGEgYml0LgoK
UmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3
ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jp
c2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgfCAxNSArKysrKy0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYwppbmRleCAwMmI0ODVkYzRiYzQu
Ljc4MGYxYzVmNTEyYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2Fj
Y2Vzc19zcGVlZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3Bl
ZWQuYwpAQCAtMjE4LDcgKzIxOCw3IEBAIHN0YXRpYyBpbnQgcmlzY3Zfb2ZmbGluZV9jcHUodW5z
aWduZWQgaW50IGNwdSkKIH0KIAogLyogTWVhc3VyZSB1bmFsaWduZWQgYWNjZXNzIHNwZWVkIG9u
IGFsbCBDUFVzIHByZXNlbnQgYXQgYm9vdCBpbiBwYXJhbGxlbC4gKi8KLXN0YXRpYyBpbnQgX19p
bml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXModm9pZCkKK3N0YXRpYyB2
b2lkIF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVzKHZvaWQpCiB7
CiAJdW5zaWduZWQgaW50IGNwdTsKIAl1bnNpZ25lZCBpbnQgY3B1X2NvdW50ID0gbnVtX3Bvc3Np
YmxlX2NwdXMoKTsKQEAgLTIyNiw3ICsyMjYsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBjaGVja191
bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVzKHZvaWQpCiAKIAlpZiAoIWJ1ZnMpIHsKIAkJ
cHJfd2FybigiQWxsb2NhdGlvbiBmYWlsdXJlLCBub3QgbWVhc3VyaW5nIG1pc2FsaWduZWQgcGVy
Zm9ybWFuY2VcbiIpOwotCQlyZXR1cm4gMDsKKwkJcmV0dXJuOwogCX0KIAogCS8qCkBAIC0yNjEs
MTIgKzI2MSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX3Nw
ZWVkX2FsbF9jcHVzKHZvaWQpCiAJfQogCiAJa2ZyZWUoYnVmcyk7Ci0JcmV0dXJuIDA7CiB9CiAj
ZWxzZSAvKiBDT05GSUdfUklTQ1ZfUFJPQkVfVU5BTElHTkVEX0FDQ0VTUyAqLwotc3RhdGljIGlu
dCBfX2luaXQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1cyh2b2lkKQorc3Rh
dGljIHZvaWQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXModm9p
ZCkKIHsKLQlyZXR1cm4gMDsKIH0KICNlbmRpZgogCkBAIC00MDMsMTAgKzQwMSwxMCBAQCBzdGF0
aWMgaW50IF9faW5pdCB2ZWNfY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1cyh2
b2lkICp1bnVzZWQgX19hbHdheQogCiBzdGF0aWMgaW50IF9faW5pdCBjaGVja191bmFsaWduZWRf
YWNjZXNzX2FsbF9jcHVzKHZvaWQpCiB7Ci0JYm9vbCBhbGxfY3B1c19lbXVsYXRlZDsKIAlpbnQg
Y3B1OwogCi0JYWxsX2NwdXNfZW11bGF0ZWQgPSBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxh
dGVkX2FsbF9jcHVzKCk7CisJaWYgKCFjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2Fs
bF9jcHVzKCkpCisJCWNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXMoKTsKIAog
CWlmICghaGFzX3ZlY3RvcigpKSB7CiAJCWZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQpAQCAtNDE3
LDkgKzQxNSw2IEBAIHN0YXRpYyBpbnQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxs
X2NwdXModm9pZCkKIAkJCSAgICBOVUxMLCAidmVjX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3Bl
ZWRfYWxsX2NwdXMiKTsKIAl9CiAKLQlpZiAoIWFsbF9jcHVzX2VtdWxhdGVkKQotCQlyZXR1cm4g
Y2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1cygpOwotCiAJcmV0dXJuIDA7CiB9
CiAKLS0gCjIuNDguMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
