Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB953C369A1
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+EAAgtsVxga89o31zieiBM+UvLheoVRVkDIL0mrA9I=; b=jeKfwQK/OcP/Ku
	YSwnlu8Lhc/flaik0gGWF7ClghML8dWOoLQ8K6bpvyb9dCT507Osekgrp/im+22+0IGFk7r9qEMJ5
	uO4T7hemXlRgoAqSoXbGUYnOVcqXqERv+A1wXgVmJ4D3YXXGCCHrBGl1crenONROVY7Cu3iiv9jBc
	VfVhykf4ETju20eq51eKjRZ+U6K5Sfsl2qZ0Kzhlbyz3vS/Y8ktyWPAo9uLNfXtnFUMHe1SW2KGz5
	SG2LzL8f+Y+WIc5VY51viwgBQtPKT9QGn4vTGyv7k3MX0QQwPHZJqNYWdxdALswLFQ3Ipup5h//vC
	Abf8r3iMzEFski+LcWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ra8-00000001g9p-0wr4;
	Mon, 07 Apr 2025 18:52:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qu2-00000001TRS-2hCx
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 18:08:59 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2255003f4c6so42069385ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 11:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049337; x=1744654137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GxvBXScR5G8/guPuwFtybfdLT7Xp8U7BWpl4kN1kr8=;
        b=mCTleirEoYBIUBwqraA8pgSYYd3jD3TS296CDw2JOBihcnIJrEHcIHqd47CZZkFLyj
         L1ySbWcyUI5dsw9wbnfbzr5rpui4DrC3tiA7kYkCjuDocGtz5gs+9P3sxdjozTguYbql
         tieIpiioeNbTtJq4MuXme2AkWtQX3HMD0di809hyZVhMk7EIDlLKeb8RW626ZtdzFU2u
         BIK7lQ0LUpWdLNLonVIvkVxwS4W1nnxqc9ta52mHXPMECSQjXU93Tjp0Hj7QqrI72XYC
         kcY4/MPZ75iFyyR1mksLQ1x+vZh4qo6+4CmBK8P68tTjZZJ9aBmlqb+Y6S3R789l1aT5
         iM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049337; x=1744654137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GxvBXScR5G8/guPuwFtybfdLT7Xp8U7BWpl4kN1kr8=;
        b=jpTMRTu+2mZArCmVKXKz/HFSwTwBc0VommzIwy3DGbMk7rV2PNwL64/GQVUmJic/sC
         Vx0ETmOvSXqCbl2n0jxYvxdxJewzXjnbocfL0iLsXvtq9YZbn5T7fIke+t2qBsN36Ynz
         pIxMsoQ3cFa4DDI9dZPVqBroqTQSLEwV9AuHOQZ+SdTAAAof+EzwKM2ic/ZG81Vlh/HG
         66jhCZW14mkMXCu2hktPE84sWF7KAla//Yr4D2RrSme7Y8B217DG1pHurihlsiVM6e2e
         cYjI3w1NI0cAn0jMXEnJ8bREqHFi+ulcLVJXYOjPxHyX9F27EDFjnx/ZIguDHOc2Fqrm
         RGxw==
X-Gm-Message-State: AOJu0Ywv0T6KcExWRtmXFiEGgp5cdzcURu8AU5Im/MyEEkR+BjmRYx6H
	TSFQEv8LVaTVEEynN8TkU2CeI/tZkJGA8p/UtS6KcYL8Ok8ykWlPxNTracVj
X-Gm-Gg: ASbGncvCkMyzb16yBln7ceyEywxEVtjOJf+E3B6m2ZC/ze9RHK61fMZ3uEn3wm8GT6P
	y63NUWrF8mgFbuqGhrRSE6iEXo7UaHwrvMg0eDQZ2q8zyNeS+AaSLv3SVZWQQilgbySZe1F7uU6
	HHzzw1upypnYwl0RUZXBMgcDoEHsNLIIizZZwT3gDGW/UIYWiWINNw/AecglUXXyv7EadAnKn5n
	sFi7OvMRqfXiKbyI621+C5VzErlDirOYDqo5Rm7VdSQuBirjzXvADnPAQ2CXtbzfGZDWFowOfVa
	3qDZjwCbFprZ9PoU+ADqksDM0YkNmgACUzcd2uqaHAG/1f9UzewmJm1kaoNSwvTyJsgKXpr/Tgf
	jxp2kGJOdnnt8hO7ha2uyeaKaBYi/69Gobg==
X-Google-Smtp-Source: AGHT+IEWDNqLKG23YHG2EaPKmPmMuBuN2vxb7Eb0UfS1Xfx3xzd34GxBwfA03Pt5nMI3Pt2fEK34Sw==
X-Received: by 2002:a17:903:230f:b0:223:517c:bfa1 with SMTP id d9443c01a7336-22a8a0a3a59mr190569785ad.38.1744049337341;
        Mon, 07 Apr 2025 11:08:57 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.08.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:08:56 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andybnac@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vicent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com,
	olivia.chu@sifive.com,
	c2232430@gmail.com
Subject: [PATCH v4 02/12] riscv: ftrace factor out code defined by !WITH_ARG
Date: Tue,  8 Apr 2025 02:08:26 +0800
Message-Id: <20250407180838.42877-2-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_110858_679937_4CC35713 
X-CRM114-Status: UNSURE (   9.32  )
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

DYNAMIC_FTRACE selects DYNAMIC_FTRACE_WITH_ARGS and mcount-dyn.S in
riscv, so we can remove ifdef jargons of WITH_ARG when it is known that
DYNAMIC_FTRACE is true.

Signed-off-by: Andy Chiu <andybnac@gmail.com>
---
Changelog v4:
 - Add anew patch that makes ftrace and its asm easier to maintain
---
 arch/riscv/kernel/ftrace.c     | 15 ---------------
 arch/riscv/kernel/mcount-dyn.S | 34 ----------------------------------
 2 files changed, 49 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 674dcdfae7a1..1fd10555c580 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -210,7 +210,6 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 }
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
 void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 		       struct ftrace_ops *op, struct ftrace_regs *fregs)
 {
@@ -231,19 +230,5 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 	if (!function_graph_enter_regs(old, ip, frame_pointer, parent, fregs))
 		*parent = return_hooker;
 }
-#else /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
-extern void ftrace_graph_call(void);
-int ftrace_enable_ftrace_graph_caller(void)
-{
-	return __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, true, true);
-}
-
-int ftrace_disable_ftrace_graph_caller(void)
-{
-	return __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, false, true);
-}
-#endif /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
 #endif /* CONFIG_DYNAMIC_FTRACE */
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index e988bd26b28b..3f06b40bb6c8 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -56,8 +56,6 @@
 	addi	sp, sp, ABI_SIZE_ON_STACK
 	.endm
 
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
-
 /**
 * SAVE_ABI_REGS - save regs against the ftrace_regs struct
 *
@@ -149,36 +147,6 @@
 	mv	a3, sp
 	.endm
 
-#endif /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
-
-#ifndef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
-SYM_FUNC_START(ftrace_caller)
-	SAVE_ABI
-
-	addi	a0, t0, -FENTRY_RA_OFFSET
-	la	a1, function_trace_op
-	REG_L	a2, 0(a1)
-	mv	a1, ra
-	mv	a3, sp
-
-SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
-	call	ftrace_stub
-
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
-	addi	a0, sp, ABI_RA
-	REG_L	a1, ABI_T0(sp)
-	addi	a1, a1, -FENTRY_RA_OFFSET
-#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
-	mv	a2, s0
-#endif
-SYM_INNER_LABEL(ftrace_graph_call, SYM_L_GLOBAL)
-	call	ftrace_stub
-#endif
-	RESTORE_ABI
-	jr	t0
-SYM_FUNC_END(ftrace_caller)
-
-#else /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
 SYM_FUNC_START(ftrace_caller)
 	mv	t1, zero
 	SAVE_ABI_REGS
@@ -194,8 +162,6 @@ SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
 	jr	t1
 SYM_FUNC_END(ftrace_caller)
 
-#endif /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
-
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 SYM_CODE_START(ftrace_stub_direct_tramp)
 	jr	t0
-- 
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
