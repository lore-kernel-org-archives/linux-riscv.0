Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB93C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 07:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SXf3O6LY8GMNt9Kcl2kCN8zvfkDwXYK96pWfPs00uHA=; b=Yo9JJQHjjx/I4u
	0em6O02su7sBzEg3Mhrw0xPO9EE2oCgboxxCT810tuIlQc8x/KqkszXYXhIpU+ecXBilw7Fub0e3J
	wJwhhxIOky4OcC9p08YSLS5MMz1x6qh+nuJtCg2C/zfMuC2gggmWoEig7Mvn6aIDvWf/GP0oEocNE
	I4a2Asv9IdRd02JaupvLb4Rg1n+JitKgKopfoLoZsB63fzWTfTI2BQXgvl7WGi/6w2NxXCCrL15sG
	J8xBaNbJFxsrYg4U+LZ5JirXbzrG44fWnx2nsBOvMJmql2gzCiabgZZl/VG7n9bNshGwJZaONhhBN
	2YRE3O6753lv9GQdTjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHex1-0000000FUOE-0Nhx;
	Thu, 13 Jun 2024 07:32:51 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHewy-0000000FUMo-3GHt
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 07:32:50 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-705959a2dfbso497664b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 00:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718263967; x=1718868767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQsuZ21+9cGptdlB0BPgeEv8WU9oI426BLaNkf2S+w0=;
        b=SoRytKio3s3yrYzFJhAdxoA39gqTiWTxcBP7mbVhVDKtyQZ4rSgNTrtxgtv022VHmW
         +F24iPa4BQIMszphDcbJk+SgIEOcmhgPHhcK3ELMWBzwtPgJp/bwajN35j8/bXmmBqZf
         e68fNKsT8NT6GHtlbHlJSSDRs80uc5KMlUBusY++XXljFe+l1plDQafDFOa7xkJ7cMLm
         n3rfXpjKLh4KVmkHRYdYKSRqW73Kbc0iRhKArSI984z+KpYmdNVNCLaPKiiVW41jypY3
         vuZpMnkJV6XqqEqOqdarQAGh2HMeXkUWiXgO3Obd3yh/4XwDylB98UVacdrrjX2jUhw/
         czhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263967; x=1718868767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQsuZ21+9cGptdlB0BPgeEv8WU9oI426BLaNkf2S+w0=;
        b=ootHNlqqIlUk/Je66wKORWf1ew7hoHNFnXGQy4UH/ERdsKxqfpQIcVG/IJx96QUZoX
         ppwFKgplFErLFCZFv6DDhCd36hOg5Wwx2BUXM/wtfvfloFFuoSJ3TrSzWdaGpKj3vO+Q
         QbHpjH80k9R9o8UGPbIrY6cY++dKQSsSOxvqlet1bKrbCPr42npJGkBYDjMY/Gb142R0
         oEIEvoL9/htgZJTRK15lDnyhFsZ0f4uhhlh/XEenRHoeZoqNOasg2C7bvpSKn6uG1cx+
         hz07t3fX7W55DGd25gM8EQAlybP7VlN34tV6PCmQkrPEx6Ropwb3/h7hqSUjthvd1cI9
         PosA==
X-Forwarded-Encrypted: i=1; AJvYcCW7zI2mkWNcEt5FEn4JSsGWwNCFzhjap4CQ/86PNBwSeN2NE8U7F5dwn1OGwJh23AG0t5jrA+gyjiq4/iUFR94ui72TP5zBZXAM715Wf/a4
X-Gm-Message-State: AOJu0YzU/DRw3EEDAP9Z2RpvE7DmI45YaxumzzQ7fboegls8yuHjSBfv
	MUemn/LsVSt8n6ZwDGhGn+xUgs6LygSro6gywx+FCtYpD+Wu8MokwbG1XMqZPR0=
X-Google-Smtp-Source: AGHT+IGkMW8dM0M3dwKshtF1f8Z+mSNjVPk7wRBBSBrIqzVVkpK0qMV/aHa7vJh7XzX910Gr5qBw7Q==
X-Received: by 2002:a62:ab02:0:b0:705:d101:90ff with SMTP id d2e1a72fcca58-705d101919bmr283959b3a.16.1718263967547;
        Thu, 13 Jun 2024 00:32:47 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc78a1a0sm730028b3a.0.2024.06.13.00.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 00:32:47 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 13 Jun 2024 15:11:07 +0800
Subject: [PATCH 2/8] tracing: do not trace kernel_text_address()
MIME-Version: 1.0
Message-Id: <20240613-dev-andyc-dyn-ftrace-v4-v1-2-1a538e12c01e@sifive.com>
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
X-CRM114-CacheID: sfid-20240613_003248_850681_33F1EE66 
X-CRM114-Status: GOOD (  12.54  )
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

kernel_text_address() and __kernel_text_address() are called in
arch_stack_walk() of riscv. This results in excess amount of un-related
traces when the kernel is compiled with CONFIG_TRACE_IRQFLAGS. The
situation worsens when function_graph is active, as it calls
local_irq_save/restore in each function's entry/exit. This patch adds
both functions to notrace, so they won't show up on the trace records.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 kernel/extable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/extable.c b/kernel/extable.c
index 71f482581cab..d03fa462fa8b 100644
--- a/kernel/extable.c
+++ b/kernel/extable.c
@@ -74,7 +74,7 @@ int notrace core_kernel_text(unsigned long addr)
 	return 0;
 }
 
-int __kernel_text_address(unsigned long addr)
+int notrace __kernel_text_address(unsigned long addr)
 {
 	if (kernel_text_address(addr))
 		return 1;
@@ -91,7 +91,7 @@ int __kernel_text_address(unsigned long addr)
 	return 0;
 }
 
-int kernel_text_address(unsigned long addr)
+int notrace kernel_text_address(unsigned long addr)
 {
 	bool no_rcu;
 	int ret = 1;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
