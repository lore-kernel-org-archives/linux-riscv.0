Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87B3C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 10:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Div49Bzmz18fEsBOU/yXor+S+3RXv7Z3u5hzggR+Qn4=; b=V88UOPnG5B5wLE
	ZQX+atFx95XkjDNwA/0VQ/KubSyHCae/UYyJW5xAV+tMmpvm4JOVqtyBU+uGbE6KUNQ7C46AIsyQ/
	8Yr2Ig+xzsLnZgJjN9txRMaQI8sSaZKMG1ysYO3R5kqO7O2wkQZbyrmI4MoWJ1NzUVtc+xtXWHU2i
	UzVVY1T1RmifVJ3qqXoxsMhMCDHyetx3TooEamh0X9Abty/VwpouOoElPFeiPEd6U/Sy9LyQXesah
	QHOB5D1YIcgABAU6slMJcPr96jvp0N8WsxrkW0uzHiVz5ASaywwQQMWIK8AzFyXc8fKCYiodPWZRu
	1HACxyGw5cutwrUCkEog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCz7V-00000009t76-0tAL;
	Fri, 31 May 2024 10:04:21 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCz7R-00000009t62-3Wic
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 10:04:19 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5b97a9a9b4bso868744eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 03:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717149855; x=1717754655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s940/bF+Rjt/1+PI1jPUWGPmA+YmQXsAS03jzjf6Uz0=;
        b=YjMhNwHq4b34GR4kYgGLq6HkSl//O9sA4QAuC/js9bmSWcCwLPEyXexfwPavjaZyJ5
         z0pCMD+vcHnyspbwbBZ0fduj/oLD7CGCkTEmHdRwC8CwKnzAU/M/z8gCfOYV80QkNdQT
         FDGhA1aoRoWTM8FbV/IhJCIn4XfNdbJfPVP+UD/Ru5hhEA89YVzsZLIrdffuHoMoBky6
         m7J5Q/Z046gc7iKmMYMqATJDeaLeK7nFRtFPLLsA6QKzQkdI2gsQhtwlJceGqg8MgCG/
         1MYoDPrTep1WJKVM9K7qhjXyZFNh2dYzS3kuiBQIaiT6V3n9DsoS4PtzevtyptVegDkA
         ZiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717149855; x=1717754655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s940/bF+Rjt/1+PI1jPUWGPmA+YmQXsAS03jzjf6Uz0=;
        b=CLxFPgT9wkaOFsAKyJ3VG4rj8QaxaR2YZFS76WKv4HVg+Gg7vYXibUqFqzXrl5O7W3
         KRlPyafAVVyCywJX/YKffpfavO2rub4FTCQz84aNsitsRvV9ryDIFIWP8uq03cNoC/3l
         0admxHWy5fLdx66TrQp8l2d1VLaF9ulS8b0y+/z41rXYQba8QFxfPDOo33SqBNrrKRrM
         JsHd49R7dX18PzTAThObf01clHIPASyiTybgUvoM3YjLMxsZsPNL13SQ8D5ivCwAiwA0
         s12DyZMUGoosDOZ23PACXI5nq1k0sCJhR2msqTKyh3L7cCZe8RPb6/1c8+g8j4vmH71Z
         ++6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZE/GwKsyZVS1/Ag/27wpIvuwp9KB4SpVy7n3NIMPbEBEPnWr4A6/tprk9W2YuJger9IUgE1rLjsPzublBjHKKwT3cvnuFlDl6tpHZvOhW
X-Gm-Message-State: AOJu0Ywcuz2Tqdf2ubKA/OXfeF2r3SEEUmvBHwaxCtDN3byxhrnI75II
	I9t/8F79WrjGet9eDH9ExJhAXxlKxNHoHtxY7e0fe5kqhoW8vKv9
X-Google-Smtp-Source: AGHT+IEw8GHLkK3sXjfVt8Htx/1lJA4GJtSDwqUWaE2zFfPxDCJUxl3XrtzTQcSBHNtd2tXrRfEEzg==
X-Received: by 2002:a05:6359:45a3:b0:18d:8f73:348 with SMTP id e5c5f4694b2df-19b484c7115mr186018755d.0.1717149855279;
        Fri, 31 May 2024 03:04:15 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:80c9:183c::26a:4f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c355ec306fsm1002339a12.54.2024.05.31.03.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 03:04:14 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Qingfang Deng <qingfang.deng@siflower.com.cn>,
	Eric Chan <ericchancf@google.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: Implement ioremap_wc/wt
Date: Fri, 31 May 2024 18:04:06 +0800
Message-Id: <20240531100407.282-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_030417_919178_F0B6C26A 
X-CRM114-Status: UNSURE (   7.91  )
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

From: Qingfang Deng <qingfang.deng@siflower.com.cn>

Currently on RISC-V, ioremap_wc/wt uses the default ioremap
implementation, which maps the memory as strongly-ordered non-cacheable
IO memory on systems with Svpbmt.

To improve performance, map the memory as weakly-ordered non-cacheable
normal memory.

Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
---
 arch/riscv/include/asm/io.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 1c5c641075d2..582503e0f508 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -133,6 +133,14 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 #define outsq(addr, buffer, count) __outsq(PCI_IOBASE + (addr), buffer, count)
 #endif
 
+#ifdef CONFIG_MMU
+#define ioremap_wc(addr, size) \
+	ioremap_prot((addr), (size), \
+		     (_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_NOCACHE)
+
+#define ioremap_wt ioremap_wc
+#endif
+
 #include <asm-generic/io.h>
 
 #ifdef CONFIG_MMU
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
