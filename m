Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0496FC6171
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eb5w1F6bjIFVOl/wKc/xFX9kXyB3XBYPIdvUsvRYHAo=; b=DZuzkw4n2Wx/32
	qBPGzV4QlEPVhY1wrEbklVQpX8dZsLe0s8BY6GF8Cjbd4hzD39UVGucqHwfmcCpty8OA1IhWL6GPO
	YOXIF58GXaap2orv3ccLsL9Az/qH1vDCE6tSYdzk38KrSEnoYCJgzgKMp+B+PUXz7Uyt27QvCG44v
	Mbvnx88EtkpI2x9UFfBPsBG7HF4yaBG2Kf+mImw8/Rz04n3tUT/eG6qYxtVxQEwXfkPoJzybvBTwD
	ntgZaiBlHuT9wjS/myWNmjqa3sXynmEhow2QUvhOIwuZCz85R2tTYhCRo4zy0A6FXNO6vB4UWq/Ig
	hkY4q8YYqwSGmiLS0XJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIh-000000097Bf-1JIx;
	Sat, 03 Jan 2026 08:47:55 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIf-000000097AP-0cMF
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 08:47:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-803474aaa8bso241903b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 00:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430072; x=1768034872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sa14InhCOXebwmWDP7ecBkutspm2W7OpFimtcnzXp3w=;
        b=TPOodpDcFF/Yxpb9UJ6vwKjVIVG/cl5BGnqITcFBfeHsGIPEELgBx/egraNyFpOfcQ
         CV5Add7uUQyxBkICRgRhLmUy5AziTCl6YkxtSdo5hVwScsc2vjtRrvOHqBsp7/JOx3Xs
         Z7DU940dXqzfuV3N7AhO2VAO7I6Mz7qtIfzBsoZ5GoW/pO9y5/rZaWzQUQUKmicjCwz9
         GA3rZmeA4ewpw8KRe2VwchvLci2dNHt49GpzC10BwQEbJDgYdamcvyzKZwBewA3QmeOW
         QHI8T/V+aNsCiZ3ts3a0dXA4JYnZgIr3plkRdE5X9aezJZ8oSH92VKCy8sKahJiJL3TC
         Asbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430072; x=1768034872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sa14InhCOXebwmWDP7ecBkutspm2W7OpFimtcnzXp3w=;
        b=uIb+6Dzk/TZ7DW4ceHA7sDq5kOI/ZJ39/WOjo9WzdSeoPeT/9Su+hfBEzaWthqwqKh
         vg7PInIIBEKe97QJQSB6+sN+Vo159+5CH25iVH4QQywmB7UYskOFUZ/0bVf1hZKIB5Li
         5gUFdjQNQsuhTxp2iy/UwyL/A1sGyQX5tZCO/Twv9TXiCx+722Rl4nUPEABgyUaBm2TU
         ivegtNbguHmAGgXbf4S6+ulV6WokBGVuqcNQvx1/jm89xTTV4/09t6xOLH6pNb47DOlP
         k/OhQWZexkklGXPL3+E274w6M+sPrSLSEbAA1qtwQqNibaagRmqwca/XbMxVvoLucH05
         Geuw==
X-Forwarded-Encrypted: i=1; AJvYcCWVemKRZGmodi8cSK6XcRixkwvREAPe6U8Jmeh35I76BJC7US29oNuGkdLGLVq0PNODnMKANLObeANjXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yygx8Yms4+tGOEeQeJzXjQRTxoZ+7hgvXi+v24RZXysvU/UlGfh
	/nZ5jDr4fG4RGrcbl6YFd9O6HIBzgB4oWpZhbX7vUxHD6/PRFZRKbhKz
X-Gm-Gg: AY/fxX6qL6MOCpplijCNkygt4bo+jr3750hghWMh6RQEbIsEXkVV1jbLLT5GYSA/bIZ
	cSw4yquVkc3mxcqz6klwnsntaGD1+cOHJ78jpK7ST5vzR77oidvjNCPB3v4zyOoFMY760VPapda
	bT4HUTMopo5aXUaQdh8UlNA8KFuQugUt7BxHGK0uP7yO9dV58uAKxBWVI1ZU1yIkaePAmd40nQP
	mpr2xK5hYNsXnKl3Se3fqKLVMyBuKtdDvqzSz6n7oPqBG4zJRecEJVjmPrqh6gFIL9xzq/PZIwr
	XKI2Zco72WPOvB8tbbjo4nY8Fi6UqtTnL7QxwaDgIOLrWAb0hqKovLDlQm1kYCZmGujRVPTUKGm
	VFw8qCKl+q26wVhU3vF3IAeHOyIOWYD0afGuhPD9JFnZu9OyV40PQmCC32mmqzMj1nJlzE6OPSe
	63mJR44jltaDvDJaleyhgVR0sZQyhURvL0jV4=
X-Google-Smtp-Source: AGHT+IEE/qkOzQdehsR4JxutS5UUMjtZZSX5KqQIX0KxALxL/oRTRg+GqK0LQ65hB9xD4RLyoqIiJw==
X-Received: by 2002:a05:6a00:1f04:b0:7e8:3fcb:bc46 with SMTP id d2e1a72fcca58-8148b5212bdmr1895799b3a.27.1767430072502;
        Sat, 03 Jan 2026 00:47:52 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:47:52 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 1/5] riscv/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
Date: Sat,  3 Jan 2026 16:42:39 +0800
Message-ID: <20260103084243.195125-2-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_004753_187319_6900E2AC 
X-CRM114-Status: UNSURE (   9.72  )
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

Replace deprecated kmap_atomic() with kmap_local_page().

Signed-off-by: Keke Ming <ming.jvle@gmail.com>
---
 arch/riscv/kernel/probes/uprobes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index cc15f7ca6cc1..f0d0691a8688 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -165,7 +165,7 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 			   void *src, unsigned long len)
 {
 	/* Initialize the slot */
-	void *kaddr = kmap_atomic(page);
+	void *kaddr = kmap_local_page(page);
 	void *dst = kaddr + (vaddr & ~PAGE_MASK);
 	unsigned long start = (unsigned long)dst;
 
@@ -178,5 +178,5 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	}
 
 	flush_icache_range(start, start + len);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
