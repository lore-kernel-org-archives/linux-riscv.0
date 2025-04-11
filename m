Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08097C36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VU5c/Igau4svNM8h2VIQAJviSKpqXGc8wZn3XVzpRMc=; b=LPIN26/0S7hsr8
	IrrYFBGJydkZrwAMwMjK/I3lhCcfjnjamxKlRNiuXuD1tC3KmArLkmbaONdhsewrUpvTvFXIIosGr
	Wd9x1FpB35mSsr6rT8mlP+P6UpZ67xU52NpelQs9ViGKnJJS+NLaYbp/P3vk1r8x6OOXD8aR6W3jU
	6F2Ijv8CU17eABdvHAZOh3L9c+SXRgNgmMhlfPyC5a+P1TkQBmKoOZky0BOuFoC5R2384aD8tqZPA
	prfgHGaa5kcQiNMs98WAVDug1Ru0Hcu0rQL2FRnhIB6uhbEkz+wFRI1DZcqV7cphK/sUMqUf5Ppv/
	9u8qYv0Lqnd3Uub0df4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38qe-0000000CsOc-1WiR;
	Fri, 11 Apr 2025 07:30:48 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38n5-0000000CrC7-3fmA
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 07:27:09 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22438c356c8so19325425ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744356427; x=1744961227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEkz9sj9aVBNDIp/tCSuFWlfQARpupwyYG7ODnJ3fr0=;
        b=EwJGwR44qKd3NtIedCb3l5QAhiHISflkXk8W5rHh+umMV3K71G/nQfyOH4cJbSveCk
         n2lmeXP1pfD3m4qgFiflpc9T9gPampRuobC7e6L3Ltvq3wB3+2PyBibG4TrIGXk9e63x
         87LbhrYre0JbNUXzhgptMT9aMAtv4OJQFZpkFlkN0yHdPSlAmSehMjYHHONvPxA+PYvk
         LAPuC+cDdRozLTNgphDmI+fplgfcsG8pEU/tswggSae80b5K0EWPtzlPVtVCRMntZZON
         T4JQI3MqwTi+W0agjc01GEPys668FYOXsbvvGp9tfBu4xhG1crFjE6yTJC3UwBc2DB/c
         3G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744356427; x=1744961227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEkz9sj9aVBNDIp/tCSuFWlfQARpupwyYG7ODnJ3fr0=;
        b=a2PNxuvAgi8jYkltui0FFBeuAMNKaOyHscwizPoyGwMZcCkonsSRTnY2+b7oziKIYg
         SjDsoTEtJkAF7fGo/mQnJIF72mGXddN3YPXgF7o92X6qWdRyhJbmnz66u5HhOmycZkOv
         bs5gjbpJeDoN9KgjMXfUbxdaScWcugXtx+YNob4H1HFC2S3khD9nrnhQre6NK8Rqb4OZ
         3EL2I1c06lWxglhwHbjW+GoP7JugATPvP1bMGkaZeZD6OQ+6Ve5EfG5rcYQNA7pIT3NR
         uHNK+hiHDC6bkyXMCnzy34Bhbtq5At8Pie2AaCARYV5kCQNmmw7QsEVM6bIvOeB/zULr
         eMAw==
X-Gm-Message-State: AOJu0YyKbUKAGyvuyIKwlvRxS0acoF0wz3tzcXna4foFhQDRODhkWx4j
	VKL4hctoUylmCM1CKf2LP4GE8DzZQvD45xYL0uRtQBpcqSuxWKZzJQMlURIoTsE=
X-Gm-Gg: ASbGncteZMJdVenbyy5IzPAHJiRG36ygZ/d/lmpd3qWvG4yuT+WKuNIl0D4/HQlxp62
	Yd7/TPKaQkMvx2eSjfQBpvSOIj83mR+/Lzf0D24KG709XkUOOypHiyMEuRwZWm1Mr/7MZ2K0XRf
	45HGMra5NxmJETFSeyBD6dkunpcN6dIZGXHOK56wNgXnQPuCfQSc6N+3Qlv78C8MGntbEjmw6Kf
	INlsiJhggYOJMv3+6b0U4vbBYMLoZHykpZkKmtni5Q0RYf1Rf5LFpTPwZW5Em/chFHWGZtD3OWV
	Cags1+D7zeWSxpdNzePswFABA8ehQUMLfucWMUGhrXErG9dZ4LM1cCCDaeFkwbBNPeo4HFuER0k
	Kvg==
X-Google-Smtp-Source: AGHT+IHGaeBskLQLYpXz2YaNwdKixufR57YYfZ8SkaOfywMMlz5BGlU3CvKcG4DzeH1HMJO/YjugXQ==
X-Received: by 2002:a17:903:1a08:b0:224:1294:1d26 with SMTP id d9443c01a7336-22bea4b6dd7mr24156105ad.13.1744356426996;
        Fri, 11 Apr 2025 00:27:06 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b654adsm42523585ad.1.2025.04.11.00.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:27:06 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	evan@rivosinc.com,
	nylon.chen@sifive.com,
	cleger@rivosinc.com,
	zhangchunyan@iscas.ac.cn,
	samuel.holland@sifive.com,
	zong.li@sifive.com
Subject: [PATCH 2/2] riscv: misaligned: fix sleeping function called during misaligned access handling
Date: Fri, 11 Apr 2025 15:38:50 +0800
Message-Id: <20250411073850.3699180-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411073850.3699180-1-nylon.chen@sifive.com>
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_002707_910622_A774E9E6 
X-CRM114-Status: GOOD (  10.82  )
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

Use copy_from_user_nofault() and copy_to_user_nofault() instead of
copy_from/to_user functions in the misaligned access trap handlers.

The following bug report was found when executing misaligned memory
accesses:

BUG: sleeping function called from invalid context at ./include/linux/uaccess.h:162
in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 115, name: two
preempt_count: 0, expected: 0
CPU: 0 UID: 0 PID: 115 Comm: two Not tainted 6.14.0-rc5 #24
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
 [<ffffffff800160ea>] dump_backtrace+0x1c/0x24
 [<ffffffff80002304>] show_stack+0x28/0x34
 [<ffffffff80010fae>] dump_stack_lvl+0x4a/0x68
 [<ffffffff80010fe0>] dump_stack+0x14/0x1c
 [<ffffffff8004e44e>] __might_resched+0xfa/0x104
 [<ffffffff8004e496>] __might_sleep+0x3e/0x62
 [<ffffffff801963c4>] __might_fault+0x1c/0x24
 [<ffffffff80425352>] _copy_from_user+0x28/0xaa
 [<ffffffff8000296c>] handle_misaligned_store+0x204/0x254
 [<ffffffff809eae82>] do_trap_store_misaligned+0x24/0xee
 [<ffffffff809f4f1a>] handle_exception+0x146/0x152

Fixes: b686ecdeacf6 ("riscv: misaligned: Restrict user access to kernel memory")
Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE specific code")

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 arch/riscv/kernel/traps_misaligned.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index d7275dfb6b7e..563f73f88fa8 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -455,7 +455,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 
 	val.data_u64 = 0;
 	if (user_mode(regs)) {
-		if (copy_from_user(&val, (u8 __user *)addr, len))
+		if (copy_from_user_nofault(&val, (u8 __user *)addr, len))
 			return -1;
 	} else {
 		memcpy(&val, (u8 *)addr, len);
@@ -556,7 +556,7 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 		return -EOPNOTSUPP;
 
 	if (user_mode(regs)) {
-		if (copy_to_user((u8 __user *)addr, &val, len))
+		if (copy_to_user_nofault((u8 __user *)addr, &val, len))
 			return -1;
 	} else {
 		memcpy((u8 *)addr, &val, len);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
