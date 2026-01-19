Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BF8CA5FF1
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 07:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K2vT/OeDb+gRoofnIZjz0LCEre0wJq2HF9j74SdEFHo=; b=VxyzRvp2DgyCKX
	NV/+dfRkW5C6fmmh6VL/MLEAwaZbnA0hPRcQCBx9SB6gNL0ZwsTOW7mwAcbjEt35Kb7xmcC4mfLRK
	UzL2b/q7kA5J+wxXPuIQz3lcsR++riV931m1x26MKf4y2kdus10aY4CIVZNFTWhi8U85AmEfJpKPD
	xDCqMPSh+efqe5D6LkZiyoXufRulX6jquvwLvwsVMHKUeY5UtZfPISojQ3KKv7lEeZfVIZs4NlPUV
	rDgVyXWb3stL11t13vxeTaPoHU5VXD6JLFYezyTeSNAMVhVsTBy8Zqk9O8d7kO/6oM0PGyzPOmjhn
	s/VtLWihg+1WtyN5uOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjTQ-00000001SZc-30Cx;
	Mon, 19 Jan 2026 07:14:54 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjTO-00000001SZH-1hT9
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 07:14:51 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-81f47610542so2020662b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 18 Jan 2026 23:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768806889; x=1769411689; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7DDX6XPx2ZYfystX3U6b8agXNPIWIVUXNZn5OvbXWc=;
        b=e0uLcFKnXQ4kC6LXkQ5cAA2ddWBHledCckThqJKwzGq9Rc1XfIYOubMpHSzW8lZqyr
         nJZIF7UGbymswBEzYGy0e24vCnBv5Eup+PRS+VKeU5fHIWCd7KfMpUK+UKTLA5xE/1Ne
         SYESPSeJtbvas0HLG9Y4DU46fjfFPq6lMLgzYyVESPhQQT56Bp8yf/ql2HsTac/zQhwx
         Wu69UqTcZ8X6fbNGsvVDhILAIjSK6QS7g2mARKynbIsCTYCPqKyf7+GptLBErD6/jFJl
         wfHY3W/7NxcDybevLu8xttW2dkCtGsLR16fcPG2ZnbkxI0h2DQOUP9oyDjeYoCh/o+ht
         gL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768806889; x=1769411689;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7DDX6XPx2ZYfystX3U6b8agXNPIWIVUXNZn5OvbXWc=;
        b=nw3Uk9Ss1FrQwlGcJ0NRIsNrP/XO9BBToU3kLKnOn2uqMzCvC+WKzbbnbxG12lNDdk
         lf8bPSbHzyCt56zhSRXc/DkJu4RbWZPms7sLAdPv8lARwa38tEXFCI7mycx3rLlcFIpv
         n7KsM119I8kpcukjW1UqmKvx1+UH2OGpKWkA3JptvBDr5E4EWqZpua18hlwbPbOxPp6V
         7XwoJo81oUNcz00In8j0TQT7Ua8tDKtnHV7ZcxsO6LdBgdEktHVchEuennZs2L7VP37o
         D7MoH5IFZqGStqTO8UiAMbTUY2pFbo7hff/Kcb8GpjSYSXY1HEiyaq+LpsKm5qFw9Q4e
         hP5A==
X-Gm-Message-State: AOJu0YyDGVWVF6CJ7y1wRIuUtrAnQBtFMbF7Is6HhIMAnwb3OP1b4NIU
	6Qgqd3PpiQkDJNif5NBa+VQPs8EopW2MhRd047axmYkSEmMlhhEDkuw6GSML/g==
X-Gm-Gg: AY/fxX57v7ScksJPJBLlL7f1TTsGTVdsC67xV2hCgJjJZ9jrCfjE/KA1dty46ls+rvs
	iUJ1/L2vPxmfPdfo7JP5mV5pClqgrFW+aP7BfPD/6/yoE+dbZXzUDuqE/NUs1PFIlpAzAnFMr/8
	PTbji03QMcwQPe+xY4uxUN2W905E0MtgYaBV5OdI7KYSzdtDnwxGgN9o0lNUGOQu9hks5L4COnA
	TeXVHXYkzdXO1pnvvkF8QDYPIsy2w0iyI6EJYtg+XA2OnMo0hQvjOvoDPuFZHg2zA1CFg3vJfhG
	Wpf+uXG7I/YdLOIj9CvV62dno8sccVdOKUlPKqwEvdX2LWaAXXv+z+HqJO2za5ZNa3MCjFnN3y9
	9RI0Z5RD8adtIWi7xwqQVYoQTYMGvYtiG4sqwnQs8LVJwuwMkYkgTID8dLbKXYh6r5wf1evfid4
	D5Qaz7vIpDbepdL2X7e2VxgBwLFjE=
X-Received: by 2002:a05:6a00:91d5:b0:81f:d605:b2c with SMTP id d2e1a72fcca58-81fd6050d78mr911124b3a.48.1768806888906;
        Sun, 18 Jan 2026 23:14:48 -0800 (PST)
Received: from adminpc-PowerEdge-R7525 ([27.122.242.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10c3721sm8330428b3a.23.2026.01.18.23.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:14:48 -0800 (PST)
Date: Mon, 19 Jan 2026 16:14:43 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org, inux-kernel@vger.kernel.org,
	austindh.kim@gmail.com
Subject: [PATCH] riscv: fix minor typo in syscall.h comment
Message-ID: <aW3Z4zTBvGJpk7a7@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_231450_452606_99FF269F 
X-CRM114-Status: GOOD (  11.92  )
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

From: Austin Kim <austin.kim@lge.com>

Some developers may be confused because RISC-V does not have
a register named r0. Also, orig_r0 is not available in pt_regs structure,
which is specific to riscv. So we had better fix this minor typo.

Signed-off-by: Austin Kim <austin.kim@lge.com>
---
 arch/riscv/include/asm/syscall.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 34313387f..8067e666a 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -20,7 +20,7 @@ extern void * const sys_call_table[];
 extern void * const compat_sys_call_table[];
 
 /*
- * Only the low 32 bits of orig_r0 are meaningful, so we return int.
+ * Only the low 32 bits of orig_a0 are meaningful, so we return int.
  * This importantly ignores the high bits on 64-bit, so comparisons
  * sign-extend the low 32 bits.
  */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
