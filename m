Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519B9FC617E
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyto9UYFXcTEQL0tLRJA7Jb1H97is71NOuhAMMsRLmc=; b=cWkRVCjKdLy5Hu
	atKYk+5mmaSgNDmYdLyk2RnYERlYoUs6biq4SfiW1RWEDXQfl7GMJSXP02ouEPWB5yDvXA9W75bAS
	EFIaweAerNLqWHo3P4GFK4biInlVC1UIA8hvVpX0YjwTZIoMj1d9Jkv+8eBEW64PpsKLqOJzV13Bq
	WKgfzNkSH3r3G8zk9dRQ9CWs+wxDc+nnzsNfI1RybY0EyipkR9fQaarNoTdNy4HKZWgSCuDbzgB0U
	j89gEqdrASe4ETw++gxeR+O2jUQNPBNGOGArMq9L7uiqwTAihZqnXhMjDkZWkdOZ3xczUG3nN7ADe
	UyKcH5RRtoTp8rwv955w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyDD-00000009A9k-1u4j;
	Sat, 03 Jan 2026 09:46:19 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyD6-00000009A6z-0SHO
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 09:46:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a1022dda33so102544525ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 01:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767433571; x=1768038371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QD8Sx/RaT2/O/5gLvBejwmV75tu/ja0fKa+EuiTHipM=;
        b=DHP3gCoEe75QKmCRXXaTBTh3o+ErwACHS1OoIKoac2Hv+XHZ4/S5/Gnqjl0nEQd8lo
         BVZilmUgx325ZghRfamCgtpLlbESvieYkScmfCSYcfhHF0qMJfeFmhGTdVg9q/W8zipf
         uOmpTIyNY1ozjbcrAAWLH4XmyyFsO4DxbGF10yKS7s1BkU9qUEouq0lokfaHYDn8XoKc
         Vk17u3avu3z8GAGUi7JujLXd1ykiFT6IoD6eNhU4rZGVUPtYVbu2DeIJm3cyafHtZ3co
         1DtCm+BqRx1ZKRCf07X9iYAzapeF5mxoqNxIf5FstflQn6Su7N9BoTnOiMLNUbs7OCkd
         /8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767433571; x=1768038371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QD8Sx/RaT2/O/5gLvBejwmV75tu/ja0fKa+EuiTHipM=;
        b=Feos+Z5Y20QzkOg1FLvWfKIcRa46qZ3t9wp9U1Z7/OiG16oPGYtJREXe+VptLMWKXS
         GCxMdayE7k0+UZlzwhiO4ekfyvbqvJ1Qqm7PsYgSigdIDX6A1ey8bfE4SnY8fGrYKbao
         Wf7HwJpDcqh/LzyrU1qX/VgC6pNunlaBXPlmzccGwDr2ZOK8zCAKqNZeIhKmNHF7IYzr
         +1/RuHEgERnu7TcfAIGJxr5xLGRQrwvEHUDPytvTFiuIjW5tRjWkTf8ej8DurRCNY6Zi
         IYtdaTRqIPL1RdxauhKqyD4YDa+J+TmDfe9sm4l7H5LpopN3oZ7yuYIr88BddnUWfcKj
         z5YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlO0X/CmUnavOqEMWUdV5cXX8r9CwEKWKPb4/L946F/yj0Fyzf2ASP51GG1oh20s4g0Wxn0+BySPfoIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaS0onJLctjqRBEj44uQWlBk0LJwE/TFxYmioj6PK8n0JzrOAF
	8lctdjVAWGWA1RhKYdh+InI74CSnY+e9ZnQ2TGTHzf09gKWSnoGDQJMw+Bhxu/IafcE=
X-Gm-Gg: AY/fxX51ZU7U6CJPWNbWDoHNqiSEqmjQ0UWF1D2v9G0ILUXqXAANrCTEj4T7HoIfl6B
	Lzc5Nan7duvsaxbfFGHuZhaFPwu2m+E022EDaZi12vr634kxOkIVKmPmyZgHr+SvORDzM8xo2kN
	3zghscK51oK7i7wwLulfeAA7baUaNGw5Xnv1dkAQG/xcP39G6vwvk5sSOIDKpwYX6EKC564Uw2g
	BzB4yPNjfkAsF9iJxTftUoM6c/LESy3gmi2zYcCp+uEyqUrqOYvl01cs7JKAZqErsI0uz7P0hEx
	7YiIoa0V7uak+CwnwvxdZZQyOaJtYTianv1Mdkl9s3vf5WTWtd69s0K6y6FLNsZhrpH7Jl6pwCS
	tnxVlVdrQlqJiku14PB9juwSMhk9x5fmMWi4XSVkqUrx2RI3pVjBuC70tQ/eJ5CDQjJhXOqc6ck
	GjXnN9x5G9AEUxmujRdRBhWNcAiRvTP3Lorm5C2LIt2h036zOOFI7S6fyikuh+3CRO
X-Google-Smtp-Source: AGHT+IFZ9sPizMNM+JWU3KI5MPEz2Gf+WxarNuEkzY+cxzhhI3PlvMK1ckXi0qC5e1Tf6i9ocvTvEA==
X-Received: by 2002:a17:902:f68a:b0:295:99f0:6c66 with SMTP id d9443c01a7336-2a2f2836964mr436023025ad.36.1767433571215;
        Sat, 03 Jan 2026 01:46:11 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbdasm403124315ad.65.2026.01.03.01.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 01:46:10 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
Date: Sat,  3 Jan 2026 18:44:59 +0900
Message-Id: <20260103094501.5625-2-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
References: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_014612_201551_BA90F9FC 
X-CRM114-Status: UNSURE (   8.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>
---
 drivers/clocksource/timer-riscv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 4d7cf338824a..cfc4d83c42c0 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -50,8 +50,9 @@ static int riscv_clock_next_event(unsigned long delta,
 
 	if (static_branch_likely(&riscv_sstc_available)) {
 #if defined(CONFIG_32BIT)
-		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
+		csr_write(CSR_STIMECMP, ULONG_MAX);
 		csr_write(CSR_STIMECMPH, next_tval >> 32);
+		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
 #else
 		csr_write(CSR_STIMECMP, next_tval);
 #endif
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
