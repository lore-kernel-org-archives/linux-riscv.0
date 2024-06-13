Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25666C27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 07:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqPl1nP6zyXQjBRrJ4U280wsPUDjyWFy082Q0XgmG7U=; b=d3GVhsv2MCxao+
	M+SzkMAclNvPuvoPPDNlVCv+k93uv7LhAsArfQrteYpQctvsAn8iCBrIzEEij9cSztgWa/BILaA6U
	U34hBDg+JfCSKLWfspQknQJQBr28shLR4e0cRPHSS2rpgwI0CdTrpVpzaXY9wSMQFVv7O770/CeMa
	nYQUCl3UWbWfBV5rGzsZra4omtb3mqnNQVJtcqPQhnzDh0DvOY2+GiyYViGDcI90z2VnjK4x+vnjZ
	zLrowMQ6aYwMo/sueU//cMgCJRjLYIo4oZqBD+DDRUU4g1Y88h3ICtt4atzVajOhfjdsPAOqzeyoU
	gKgVB7Q/oFAGRi6fRhCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHewy-0000000FUMp-1JFa;
	Thu, 13 Jun 2024 07:32:48 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHewu-0000000FUM7-1mEx
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 07:32:46 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6f4603237e0so519917b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 00:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718263964; x=1718868764; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90j1lP2iehIU9E2euRd9xJoPIJsKCYmj2Va6/Ket5KI=;
        b=kUchnbBDSxKylodBGsRZwOp/eF8yxFjfOftndnKfWJNoNs7nNok586qVwPilnPDq0j
         FXaNYVAo6qW5HfNA2myCY1201yN6AevzlMI8UA9Q12cyis5E34AIo/cbxHnJoQitFals
         dKayZN7JXtAMVLnOnIo5Vitzx30LuJwVMG1EXG2czyt4FiAJZQUMYP57jG69DXsiipoG
         UmccYF4lBY5w1f01OgKmsfrdaYoXJul6+R4mTNv06Ck/mqj7RGhY1o+EQI0GcXAKkvxD
         ElkJ5U+Gp7EKrBiXDk6Fgsjeg0jnmfZwyD+dSqrne9Cq1u8/RQ6tsPXGYX913LMdmvZg
         xs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263964; x=1718868764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90j1lP2iehIU9E2euRd9xJoPIJsKCYmj2Va6/Ket5KI=;
        b=AlSCbdBCS2z3+aTGjB+i5M8wQUcerNf2ogQO6XKbXr5YHjoPB0nRfE9lt7A+mD7SMO
         t3AtmDRxYIBagw0RmztA/6dTix9G1JvL5dBM/RubT16ad6kBRWFDmj1hVxpuT9ELgo9L
         YXybvBtGd4mKwultSnFEXFJ+IZOZ+hrIAEV2fj2lOl2xHEC/7UOYkXFPTV+ZaFtPvUoE
         tZY1E2mAk1Ol9kKgBjvEtMnyF17qirjOWrNhLfeLTWtjDkWy4nRhpRgjr580u6IZRAbl
         fGkE9neIxivxld8LwOjwj8wftbOczu/w/QUS+SIe/SzerhAubNtiDAgcsiYFTozaLRgn
         tJBA==
X-Forwarded-Encrypted: i=1; AJvYcCXmU3ZsPnY2ujyw28dHjhapEqqi3NSf2S3V+LqeSnH4z401wMXDd6ET8sAXuDXTHPsvNevfXObIdNF+yzCzvZc3uxRVghz45HkvEh51+Dcs
X-Gm-Message-State: AOJu0Yz6Ksvw+tYUk6bMP+MaGD+mcAo9VJkQeAbKL5juPQo9zZWoyADp
	qzIszhug3xhHagpSdb0chdc9QQIU8r0ITu+/ZLbMhpZthGJnyuM//6iln0ikyMo=
X-Google-Smtp-Source: AGHT+IGTwQ5EB55toThK3E4Aeh/60oGzOVaQMTb+lJV8UkAi/aBjTebo3WO7lB+gn84w0BlxoTDk4Q==
X-Received: by 2002:a05:6a00:2d84:b0:705:a18a:686a with SMTP id d2e1a72fcca58-705c9389332mr2770164b3a.7.1718263963654;
        Thu, 13 Jun 2024 00:32:43 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc78a1a0sm730028b3a.0.2024.06.13.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 00:32:43 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 13 Jun 2024 15:11:06 +0800
Subject: [PATCH 1/8] riscv: stacktrace: convert arch_stack_walk() to
 noinstr
MIME-Version: 1.0
Message-Id: <20240613-dev-andyc-dyn-ftrace-v4-v1-1-1a538e12c01e@sifive.com>
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
In-Reply-To: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_003244_513743_66B77461 
X-CRM114-Status: GOOD (  12.18  )
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

arch_stack_walk() is called intensively in function_graph when the
kernel is compiled with CONFIG_TRACE_IRQFLAGS. As a result, the kernel
logs a lot of arch_stack_walk and its sub-functions into the ftrace
buffer. However, these functions should not appear on the trace log
because they are part of the ftrace itself. This patch references what
arm64 does for the smae function. So it further prevent the re-enter
kprobe issue, which is also possible on riscv.

Related-to: commit 0fbcd8abf337 ("arm64: Prohibit instrumentation on arch_stack_walk()")
Fixes: 680341382da5 ("riscv: add CALLER_ADDRx support")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/stacktrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 528ec7cc9a62..0d3f00eb0bae 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -156,7 +156,7 @@ unsigned long __get_wchan(struct task_struct *task)
 	return pc;
 }
 
-noinline void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
+noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 		     struct task_struct *task, struct pt_regs *regs)
 {
 	walk_stackframe(task, regs, consume_entry, cookie);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
