Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E77C369A3
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TX1DyaO+I4J3sO3/WgTSrOrjSv4iUqkyO9nqa++HZZM=; b=dwCm/IsHiJckZX
	CkCsZ61AY0mJC0QgXx4kJUqmFUlEiJn3wVVINxu2ZiLXwIKA6eBN2xeRHIiKzQsfvrRKXupQPX0vd
	v76uVQwGk3dEXTQR9xVD5cq1eDgFEMaYt7aMsqarhfpl9wSVQwPtFa7ehv4BxrQmH1NEEnnrFQ6bY
	Afb4yue3Lca85wSuY0Ldg/Vht8l+xvUg9CaWkvYnDo2uaXUH1OBpqH9ijEHVj2D1zW0q5oXeEgM4/
	enHhtFUe3QpdhddPvF5Y41tITSw4OcOLWH18ir1M8GfsP4WWor4FQb4tiiaDgT1K7nuW1X2Uc2ggW
	9ZkJlLgMIAQCxW6BjPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1raA-00000001gFF-3rYU;
	Mon, 07 Apr 2025 18:52:30 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1quB-00000001TSV-1WXX
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 18:09:08 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-225477548e1so43792075ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 11:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049347; x=1744654147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sO5QthxwGi/gITP2al2MfjRxPqfuU0a+mulRSQDMGlk=;
        b=Slyo4MMPC4Nj7QiGXPoKy35YUUfbLAc3iUp59jeSfrkhjR92NDfYkVimxK44DfjYtE
         x9U7Idm8amOdZNa/8FuNLu5VH8M++GLTpQjkthZV946CLtaUXrN6F9+Y04EnzXppxuk9
         YV43pfV/yZNCiiRCsrEiz41nBe65S2qLlUgM2BlkGuq1XqppzyBvW2GTWJHR8tPz7gWJ
         TWILdTnsnHX36Svfj1XKmDstWkncxZDFNSK4VzdvD7fvwBAvwNkcF9zMzdIF8RXETF48
         WtwRjYsYyZCeUj1mloxto/stSk7AIG7Qo1HuTeZprzn3iRYg5GvEIT50TRI6bcGNzfUN
         wtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049347; x=1744654147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sO5QthxwGi/gITP2al2MfjRxPqfuU0a+mulRSQDMGlk=;
        b=Zwr9dWBWnmwBcvSe1T397UUi5tjNRzOBDk+ZBKfdMy/tZqGSTZ+VAHP8Rg+wttj2Kj
         x48k1jAzM5O511dFb+lRnBOHO0laSdc8q0XHPxB9mNMTrmK77L8klN/VLKZOZRZdPE13
         x+4kStq4Npspa+6BoDyd7gD7ysur5YewuuD7aFTB0hghtD9//O6y9fI/KRpVgFaEvJL4
         YbQUG6+NOa0JTTDXNvy7H00Wr9zNwtVXfj7Ndq29Wbvfn4F9noqSPQ1A2TTCmr60pGIQ
         n8CESWP0S6+BFdmfyJ9kbm+oJwuXdefP1JlAv/X25lUxwB0uLIXJKK0SOiReMiWDYW0L
         Ya4g==
X-Gm-Message-State: AOJu0YylAkyGo1kKsjSNpLQ2fm8lRxTHwKvkz+d50juolk91o1oz4vub
	l8IOVcQ8eF0EpNpr01bC2+1H7crhNVzKqFib77pjArOP/PjmBuo/Adjya41E
X-Gm-Gg: ASbGncuNdy3yPUCDIXRnw/WqEbevY2lYzkjZCd3yttJWAHuTDVg42G6SBpPUwXqHUAT
	ypcVNvXVQe0yI2JurzhrXK31DaZDyO6efYMZbXTSiYsChxVUea80Vxi1m/YwVzCucgNeUX2dD3L
	669BH7qrAMa/wkIrTExhuJA/pUYpHBmvTD8RheqsB4TLm/UnTFkBm3xnSqTScIjtGTqO8kp6VEu
	QXb+F9eQlGIuZ/zVd95Cpi2jL2fUFzoxgwxZuaVk0NAsZOReBB+evJ+Mw8HovjpNoqkO882FX5l
	CyyDBi/zt6xNan/BM4Kj+p1GARgTT6QCkOD50GzfsgiCCbIHQqXDbLLPT6/Lufa+TNM04tdPuQt
	aHFJxsAOzHFzpJOH001ci4dYY6cOiZjW0hg==
X-Google-Smtp-Source: AGHT+IEQoZKg5b+MyAfF5MYRIteTGVeC6PLB8bj9Qd+rDjzyW2lPRPeTqlPF4OleAXMNaZHG2RYIiw==
X-Received: by 2002:a17:903:283:b0:21f:1549:a563 with SMTP id d9443c01a7336-22a8a858f64mr170136425ad.2.1744049346653;
        Mon, 07 Apr 2025 11:09:06 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.09.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:09:06 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andybnac@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
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
Subject: [PATCH v4 04/12] kernel: ftrace: export ftrace_sync_ipi
Date: Tue,  8 Apr 2025 02:08:28 +0800
Message-Id: <20250407180838.42877-4-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_110907_399189_78040C9A 
X-CRM114-Status: GOOD (  11.48  )
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

The following ftrace patch for riscv uses a data store to update ftrace
function. Therefore, a romote fence is required to order it against
function_trace_op updates. The mechanism is similar to the fence between
function_trace_op and update_ftrace_func in the generic ftrace, so we
leverage the same ftrace_sync_ipi function.

Signed-off-by: Andy Chiu <andybnac@gmail.com>
---
 include/linux/ftrace.h | 1 +
 kernel/trace/ftrace.c  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index fbabc3d848b3..0d4eec574707 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -807,6 +807,7 @@ extern void ftrace_call(void);
 extern void ftrace_regs_call(void);
 extern void mcount_call(void);
 
+void ftrace_sync_ipi(void *data);
 void ftrace_modify_all_code(int command);
 
 #ifndef FTRACE_ADDR
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index ee662f380b61..d06bd4a046de 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -188,7 +188,7 @@ static void ftrace_pid_func(unsigned long ip, unsigned long parent_ip,
 	op->saved_func(ip, parent_ip, op, fregs);
 }
 
-static void ftrace_sync_ipi(void *data)
+void ftrace_sync_ipi(void *data)
 {
 	/* Probably not needed, but do it anyway */
 	smp_rmb();
-- 
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
