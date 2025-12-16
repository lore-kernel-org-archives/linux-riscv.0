Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C487D5B87E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 01:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHEArWi1LFkCIU/EShDwen/4/vCOfGRwwNf0rhc4duo=; b=kggc/gbDn7SWvE
	YHOiRBjKbCrIFPIf8iSLAZ8ICmBsIZaNrS4ZXUnPKBUl0+0rORn9dPIUUefjEcJEA0LCXU3Uidc0y
	qXGtufAxV49WFiB8/57/O1d4hn5oL4kTxlIPwu6fSCJGggAgxt/NARb5A78jARxIxk5g9BVYHA5ij
	4opcbFWUqYA/6Jvhap4IUzzC4EI3TPlXm12/55VZnmgsxI1HgbbBVBkrtn1FFNA8OYRx/UC44N2f7
	hQlyL8heNZvUJF/tlpOjHlM+fBC4ksXudGIVb+wq5Denlzxx/sdysYzboEw7GLEGzHwiUeIWDSU+T
	07rn0bhB6u2X/tEEi0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKAN-00000004Vfv-2IUf;
	Tue, 16 Dec 2025 01:47:55 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKAK-00000004VfK-1eLA
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 01:47:54 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7f1243792f2so2658385b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Dec 2025 17:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765849671; x=1766454471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQt8uoJWMBYj/YlVtM/kz+RuiqvE92xrlYMKIfu5C3o=;
        b=BpE5RJ2tBcfN3ZRmspmJJZ7TzaUP6FJjuRWXbCIVhTMpXkY+ZqplSNpxbeKP05G7Cq
         6jk6Sh1wQBGJ1hvfu4qZyAH+cyPRfCZydQGzTHNk2MZioM08alPhdKE/Vmij5Dfk1JWt
         nirSg9Zw0Dx85knWzLupwfyttYMn7pHrHO9mdCHRPSU14hJNny+Y2wn5tizuzVjM2JNA
         Ngm2UUYGRgF+CZtFQn6eE4eH5g8RsKns+D3dE+498ny9qZLgBu0B+RTflNVy5jEcW1I4
         7eHR5Q5YT0/7bSGfSk6r3qpGuLwHjHbYm7lJqO/RV/prhdl2P42F7NCB+aNbq6UMMXEG
         kBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765849671; x=1766454471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HQt8uoJWMBYj/YlVtM/kz+RuiqvE92xrlYMKIfu5C3o=;
        b=AyClL3I7qI0loPQgCNrWZ2I7+uplwLqeusez77QHEyaDEpiCZ1x7nugkTVxfvril51
         KZITgX3GMFQnkM67s8NyK/BMF7rZf8Asdk+yzjrIxJET2I7lhhb9nGFd2poLBwS+5S0M
         Dhthe9TN2/6rjbCVzbHS9z8zhZBMO3qGaisi8/dFP9xB6iOQLTHZJpamthVx7VArrrAI
         4FjLq/6GrKMNhqNQQFCuD4c8dDTw7KyQWt7RxVEMLIG6Zv7V2tBIySEzUQeth2OhWuwy
         KKsdL+fLx/Dja9MrsaWCZo9pgL3onFPpjhQjBHKO6+mdzUpmH9D9TEDHGN/WGTqKrzXj
         zj9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdx3EyBrQNDhm8D5CLD8vMxwH0NlG/trSu63Acilmn0gUK3Gq3KvT8eDRmHBnt6tIZTSMi7WMZ+3kA4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPl2ohlNlivg0NfGk5HCQYKskw83Y6Xk8lQv46FSsio0rSujxo
	i09V9lC3g8iX8jugCNGqpmuxRl8syUwSCa1xxV081XAfhCCzb9mv6rvZwlYu8TkGvq0=
X-Gm-Gg: AY/fxX4hGsvM065WGZalyXDnPDJ2dfDZrwA1ukzUU1pTkfxp67ON/OPbYAo4Qqc80e3
	VHpBx3RQaBy5dbWldDKtrHYLFsT6ewzGRtqkiyKJcMgDTR1SG3NwZXrzx42c7dZJCVGV6ME1sBm
	riPBhehp8Dw0Uurod6MQSd5dd6k4okjV8VqROZvWg550GpfVebKyLOo9bfoI9VG3aazqqs9T4ad
	UEEoEejAAAA1jREfd6N6LV/+FObwdNl3mKFlrSUd8pOUcuA/D6iASyS2CEN335rtGtx125vbV27
	C9gb3lRI+iV/oNCR0I2Oq9MPALLLt+q4RZmrHCKU2kxqBa7qoS3gKTtA9nB7TUHRwtWWtcmsDrb
	p3sPfS4+eebuxc6DzTuql9+OB31sYr1QiUua20VqgdZCjglcvTmrKWwKf0is49MXNxaAohtQVtd
	UsXu7HlCGZ+LQxUM2pRDB1xjnR5nULfgOAyxe9fh/kzdJc
X-Google-Smtp-Source: AGHT+IE5/ROoI003OCaxm/0k3SuDfxUIEDBUTPu0GmjjWMBKr4s+4vh/dmnl09LKvowuDGy06jqmLQ==
X-Received: by 2002:a05:6a20:4320:b0:366:14af:9bcc with SMTP id adf61e73a8af0-369afdf778bmr12452247637.66.1765849671148;
        Mon, 15 Dec 2025 17:47:51 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2c963b53sm13632790a12.36.2025.12.15.17.47.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Dec 2025 17:47:50 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andii@kernel.org,
	andybnac@gmail.com,
	apatel@ventanamicro.com,
	ast@kernel.org,
	ben.dooks@codethink.co.uk,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	charlie@rivosinc.com,
	cl@gentwo.org,
	conor.dooley@microchip.com,
	cuiyunhui@bytedance.com,
	cyrilbur@tenstorrent.com,
	daniel@iogearbox.net,
	debug@rivosinc.com,
	dennis@kernel.org,
	eddyz87@gmail.com,
	haoluo@google.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk,
	martin.lau@linux.dev,
	palmer@dabbelt.com,
	pjw@kernel.org,
	puranjay@kernel.org,
	pulehui@huawei.com,
	ruanjinjie@huawei.com,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	sdf@fomichev.me,
	song@kernel.org,
	tglx@linutronix.de,
	tj@kernel.org,
	thuth@redhat.com,
	yonghong.song@linux.dev,
	yury.norov@gmail.com,
	zong.li@sifive.com
Subject: [PATCH v3 1/3] riscv: remove irqflags.h inclusion in asm/bitops.h
Date: Tue, 16 Dec 2025 09:47:19 +0800
Message-Id: <20251216014721.42262-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251216014721.42262-1-cuiyunhui@bytedance.com>
References: <20251216014721.42262-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_174752_755459_46520095 
X-CRM114-Status: UNSURE (   8.79  )
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

The arch/riscv/include/asm/bitops.h does not functionally require
including /linux/irqflags.h. Additionally, adding
arch/riscv/include/asm/percpu.h causes a circular inclusion:
kernel/bounds.c
->include/linux/log2.h
->include/linux/bitops.h
->arch/riscv/include/asm/bitops.h
->include/linux/irqflags.h
->include/linux/find.h
->return val ? __ffs(val) : size;
->arch/riscv/include/asm/bitops.h

The compilation log is as follows:
CC      kernel/bounds.s
In file included from ./include/linux/bitmap.h:11,
               from ./include/linux/cpumask.h:12,
               from ./arch/riscv/include/asm/processor.h:55,
               from ./arch/riscv/include/asm/thread_info.h:42,
               from ./include/linux/thread_info.h:60,
               from ./include/asm-generic/preempt.h:5,
               from ./arch/riscv/include/generated/asm/preempt.h:1,
               from ./include/linux/preempt.h:79,
               from ./arch/riscv/include/asm/percpu.h:8,
               from ./include/linux/irqflags.h:19,
               from ./arch/riscv/include/asm/bitops.h:14,
               from ./include/linux/bitops.h:68,
               from ./include/linux/log2.h:12,
               from kernel/bounds.c:13:
./include/linux/find.h: In function 'find_next_bit':
./include/linux/find.h:66:30: error: implicit declaration of function '__ffs' [-Wimplicit-function-declaration]
   66 |                 return val ? __ffs(val) : size;
      |                              ^~~~~

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/bitops.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 238092125c118..3c1a15be54d80 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -11,7 +11,6 @@
 #endif /* _LINUX_BITOPS_H */
 
 #include <linux/compiler.h>
-#include <linux/irqflags.h>
 #include <asm/barrier.h>
 #include <asm/bitsperlong.h>
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
