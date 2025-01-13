Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8193C0218A
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoJdp3MamXDqojw+9i0gfbq++zVT849E5J+LScF7AsY=; b=CKgT51g2N+2RBd
	n6gGorLkegVdY8yJqo1WxtBIVrKR0xsQo4DMXUHHXbbhMcVTSqGH7eWlLnmtsra7R19hotPvkKJMr
	LN8cpmO04+f/RGIaFBrxk+EQRZz2jXPmRmP+Qt4/RrtL+OKCgFmisYRdCVkj0jUMic0W6kygKoUHJ
	X8go4n9lm4VsDXvnyNlB27jVtJSI+8d2XY87E7bzkhfRnj0FEFJ9Bj2gNJ2oKMLKCdSxs2itEEzu2
	RWLaMAfr32oGYr3zhB2YJuZfBgM32MF1PSHTF16LwkN1SYQUrJup+STiO2BpA5Wk75uFUdpPJyZUa
	X0bxBBO7nkZJ8x0PwiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMkK-00000005jPC-2amz;
	Mon, 13 Jan 2025 15:52:56 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXM4l-00000005Z0w-2pF4
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 15:10:00 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21a7ed0155cso75435205ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 07:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736780999; x=1737385799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrBkAyqGMS8V2VSoket5Q8LogeyFHT+hq05EyX1hziI=;
        b=DDTvFl9do+MespxqZnSi5lRxpXB5T15HQXiI3rletyefT380jgE8cX83W4I1Zd7aCI
         kATzK7GZh7m3Dee1EOM1P7G8KIr6XKdVrVsondwgTwCtoF6hCJG+RyyZlNPX9nBnSST0
         Wev99pJ5g//Bik8nLy/UpGhTgIXfPid9x1cDQeqI5b5/1gLBd1UyMBaDancXOtizlmZg
         YW4iXrzd9n3nJt0xIWtRaacTkx2i37fieTJzKLcbkzLv84tEjc40FeFy0QpVeLBDNgZJ
         aZUiYkM3FbgzILDwSF1/UyOMf6DRPxEoULLHIhQd0FSBIN9qGxZP82UVAvkxB4OOGqMm
         wL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780999; x=1737385799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrBkAyqGMS8V2VSoket5Q8LogeyFHT+hq05EyX1hziI=;
        b=Il+/fg/Dc42VeAhN3W5S+n1rBXPZdgrx+iiaNsKFCoeKf46dP/9yb5t9vt63IZEh2N
         +6IFjC/Ei824LSiXUA9TLxsan5CF6Sdl52RxWtfQCfdoDw78uZAoz7yTz5tcMH91sP3W
         Xplog2hHdlzJWqyq29I7XqWTQlqzbK5BUbnQZsRIRnt1J/f/nm+U0CgYuf4gl2JuthIb
         Npa8QSyXSWMmldoJBDwW0FA0eS+Q2VntiyaiSTYNr/pa5RHrjRhIav6hOualykSED6gw
         P/2yRcdSERzWGU493yGSJTHAC0gb88VpfylOOGlIewmYVz8hlWxOYzpa0b5WyRgSD8Kh
         4SZw==
X-Forwarded-Encrypted: i=1; AJvYcCU5wM1QF9zQNlovb0beqCp2ZSrtYiQxEQoGWYxD5yFoh2dGJZFhQWWqAVpZJzkiRjK6Fumn5jimg22WVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzR+wy5EKbA7zKK25tgyKzjJOa1vG+6zyQAz0TGy7GLTPEKhZh8
	VK+a16I9XooFBuhupl2b1vpdDQwIcVfhmEcuZwhthkItA192ZapYFijOr0yK/nM=
X-Gm-Gg: ASbGnctbquFsbIZBblQZ05a0usBNabxQDGCq2C6X2Ij6XTtFe1bpW73z0g0R1sgjDwK
	OSPcSIRyhsbIzl/YL5qeXWs4wr9wP3zt1ep83fT4vbtpOJxk9Qx2CK6+rczD09ZdbIHJ+kwK/RX
	nfuThb/mrGe4Dexb6+B3FHD7SGRL9lXr5CHnTkfhzuJtvTS9U1Cy+TAV42aniQlzla/zRzVMFSz
	xnRX7UAOnsxbQuoqRPPNEqKAowt7YEssMuC0Aj6NFXyrMv6jQrY7tZWbo11Yk/520g6hRqiHuIX
	TJXnS+/bp04Auv3g3Hz3eWhaWAn6dt13yytWVYA=
X-Google-Smtp-Source: AGHT+IGfPH54n4jg25Exlw8FAYVNncyhxePsJ8eA3RiB3a/wcXqKMqGrQ7KsPaB5LXBOZKh8ij+1/A==
X-Received: by 2002:a17:90b:5487:b0:2ee:f80c:688d with SMTP id 98e67ed59e1d1-2f5490bd537mr30669805a91.25.1736780998974;
        Mon, 13 Jan 2025 07:09:58 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a26ae2fsm10193120a91.9.2025.01.13.07.09.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 07:09:58 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 4/5] irqchip/timer-clint: Use wmb() to order normal writes and IPI writes
Date: Mon, 13 Jan 2025 23:09:32 +0800
Message-Id: <20250113150933.65121-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250113150933.65121-1-luxu.kernel@bytedance.com>
References: <20250113150933.65121-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_070959_708784_74963C55 
X-CRM114-Status: UNSURE (   7.70  )
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

During an IPI procedure, we need to ensure all previous write operations
are visible to other CPUs before sending a real IPI. We use wmb() barrier
to ensure this as CLINT issues IPI via mmio writes.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/clocksource/timer-clint.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 0bdd9d7ec545..8d73b45f9966 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -48,6 +48,12 @@ EXPORT_SYMBOL(clint_time_val);
 #ifdef CONFIG_SMP
 static void clint_send_ipi(unsigned int cpu)
 {
+	/*
+	 * Ensure that stores to normal memory are visible to the other CPUs
+	 * before issuing IPI.
+	 */
+	wmb();
+
 	writel(1, clint_ipi_base + cpuid_to_hartid_map(cpu));
 }
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
