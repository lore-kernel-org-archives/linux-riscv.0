Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC066C83F1A
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 16:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Fuar9pNv8N9S1PJhp3B6xUgiu2ZtZaurqM+REowYNw=; b=UHLy/xuwY+JBMT
	gjFzi7FzxTk84TKzxENQstMhWp7oeFGUPM8vs3gOrU+9OpB87UfhbAKVFgxaVb3gSkhZCMJXiE8pB
	ICoC+aV6B296dWRQkmUsYASW4gHs1DLBs0+rvHsloYezXQ40Dg9TKsAFncGd/EceD2SyC1K48X/yP
	Vd7L0SdDdOCoiUlaPrgxQ7uJIjLFqTYbqwhlH+cmYpgwuHoukVj06qbZkjRMc9x6s01NA9KfBRqH0
	zxYnGD5oxasnGoeDGfSI3lU8+tteCtfXjayr1lyS5iZpiApH103yBvIQZHZPtYpfMA7bhIXL7ojkD
	iKJ+eDA+/d/FwAL0DZ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFuJ-000000031vN-35zU;
	Tue, 22 Jul 2025 16:31:59 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFYy-00000002ykx-4Biw
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 16:09:58 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45617a1bcdcso9976875e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 09:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753200595; x=1753805395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHn0RK1bDtnQTih55k+PE+Oh/xAeSlFKCAvFjBlOT6o=;
        b=EF+ib8+QzMh0pUB3cLKzT154PML1V07GqWptDXIjrtZeYItAx7TAHYrJO93gbp+C8j
         pVwTpmVEjJ9B9nMdGbVmAS28P0rlODmNDouNtwjK5JNbtoy89pmJac6pmY3RC57ZNmos
         sEb3A3AnL5iNZLYURkLKltHjkAA3uPq1L8Lq8YXhO7oDB13uYMgcvwPE3QVWI/q6Hg7W
         dMIgs68c5A2DqV7ccJXURkjX5hLuh6UCR+qLQa5Pc8MdfyYDV2BtCphJZcggaOhikkCC
         tU1SW4OtuSJRFfnMeHbvU25O7GxE1qrfKdumgUHruKmRpDs6ZW9damD6paIRStfDEEAB
         Y/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753200595; x=1753805395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHn0RK1bDtnQTih55k+PE+Oh/xAeSlFKCAvFjBlOT6o=;
        b=i04+XVFTglX7QiCn+d0zucZuHQ/yroJu/878iv9sNE7qF9D+7pyTOhcOgM/o3O06CL
         HxWjLIHAK9wneUyZFKRKNCzuniv6xNlixCYKdE6XAVhKAWkv71sBs5m1TLdKAPNh0vI7
         yggyXVYdg5GVdAW7vwwvXFFvyy9zQvTpAn1/L3WBSPyrlYnUUpK0Bu1Q2bhiljZiKKz4
         9cL2hH02pntI/WxDF5AE6iw7mMr8aQzQnWorZnDMITjGdRgGXSzT+EC92Umoj/LYZsAw
         tBOq6REr4GnzduGAiluAdtgmtYfgepALxB0gLTVwJsd00MrknPCtTeeXO8M1+KizJCdy
         rNcg==
X-Gm-Message-State: AOJu0Yx6WyRDJWGXD0q98bBxPbMqkdfS0jsan7KLmawS8vGV76kQDljP
	K6oh2yHB4RHJI92eCO0+WYIYxe2PZNw+jzxKl+aZIhm1iNfDr+K6u00H85lwjy4Wr0R59XFzbcA
	svvnr
X-Gm-Gg: ASbGnctJnDNK65YIbWC3WI13zSMT0Ql8c+7ct6BKCTmdP4QzjVY3drUVk6eN0osvmX1
	Fi5C2l4MhzxB+mb7Vgy0UhviCrMfAWjhceaUtKZg05C2ZwzTWcrs93YID3B+clREJ+mcKBv7Y+0
	Ys5LOXCXakYrd7xGJ93ydbgAnlDMe625CWmj2S6VLwAC/fHZ8Nn968+KEp9kAkHgET1jfNCJVGC
	InaEP11NWxjohWnL7i35OVaXhpTRH+q8WDcTpr1/pCXV37rFQCVrSRZAlcLqCAwi+4kmkKeMl7L
	8f10sZoceZT2iYaK+k5wZyH7u5GvArmz3EJgQKX9WAr2DNS+IPnILx0VjpCPo4iV1GH90qsXptp
	Fk0ErCI3qOkKpQ+ldSeMzDeUWaNo2B0lgOgK2kR1D
X-Google-Smtp-Source: AGHT+IFOOj2pCZuzkvgcI2e++izR9WZ44Bo7bX1ttKedDTZ/7/TUO4123SUu0NVdtBBwikHGaWbn/w==
X-Received: by 2002:a05:600c:548b:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-4562e047a0amr104331465e9.3.1753200594690;
        Tue, 22 Jul 2025 09:09:54 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:30d6:4986:8040:bb0a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b61ca4c754sm13900391f8f.59.2025.07.22.09.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 09:09:53 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH 2/3] riscv: use lw instead of REG_L when reading int cpu
Date: Tue, 22 Jul 2025 18:05:56 +0200
Message-ID: <20250722160556.2216925-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250722160556.2216925-2-rkrcmar@ventanamicro.com>
References: <20250722160556.2216925-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_090957_039107_9AF47267 
X-CRM114-Status: GOOD (  11.14  )
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

UkVHX0wgaXMgd3JvbmcsIGJlY2F1c2UgdGhyZWFkX2luZm8uY3B1IGlzIDMyLWJpdCwgbm90IHhs
ZW4tYml0IHdpZGUuClRoZSBzdHJ1Y3QgY3VycmVudGx5IGhhcyBhIGhvbGUgYWZ0ZXIgY3B1LCBz
byBsaXR0bGUgZW5kaWFuIGFjY2Vzc2VzCnNlZW1lZCBmaW5lLgoKRml4ZXM6IGJlOTdkMGRiNWY0
NCAoInJpc2N2OiBWTUFQX1NUQUNLIG92ZXJmbG93IGRldGVjdGlvbiB0aHJlYWQtc2FmZSIpCkZp
eGVzOiA1MDM2MzhlMGJhYmYgKCJyaXNjdjogU3RvcCBlbWl0dGluZyBwcmV2ZW50aXZlIHNmZW5j
ZS52bWEgZm9yIG5ldyB2bWFsbG9jIG1hcHBpbmdzIikKU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LE
jW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9hc20uaCB8IDIgKy0KIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgfCAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hc20uaAppbmRleCBiMzAyMmJjMjI0ZWMuLjkzYjFlNGNlMzRkMSAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Fz
bS5oCkBAIC05MSw3ICs5MSw3IEBACiAjZW5kaWYKIAogLm1hY3JvIGFzbV9wZXJfY3B1IGRzdCBz
eW0gdG1wCi0JUkVHX0wgXHRtcCwgVEFTS19USV9DUFUodHApCisJbHcgICAgXHRtcCwgVEFTS19U
SV9DUFUodHApCiAJc2xsaSAgXHRtcCwgXHRtcCwgUEVSX0NQVV9PRkZTRVRfU0hJRlQKIAlsYSAg
ICBcZHN0LCBfX3Blcl9jcHVfb2Zmc2V0CiAJYWRkICAgXGRzdCwgXGRzdCwgXHRtcApkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5
LlMKaW5kZXggNzU2NTZhZmEyZDZiLi40ZmRmMTg3YTYyYmYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL2VudHJ5LlMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwpAQCAtNDYs
NyArNDYsNyBAQAogCSAqIGEwID0gJm5ld192bWFsbG9jW0JJVF9XT1JEKGNwdSldCiAJICogYTEg
PSBCSVRfTUFTSyhjcHUpCiAJICovCi0JUkVHX0wgCWEyLCBUQVNLX1RJX0NQVSh0cCkKKwlsdwlh
MiwgVEFTS19USV9DUFUodHApCiAJLyoKIAkgKiBDb21wdXRlIHRoZSBuZXdfdm1hbGxvYyBlbGVt
ZW50IHBvc2l0aW9uOgogCSAqIChjcHUgLyA2NCkgKiA4ID0gKGNwdSA+PiA2KSA8PCAzCi0tIAoy
LjUwLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
