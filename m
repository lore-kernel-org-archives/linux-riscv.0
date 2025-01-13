Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F2FC02180
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dmwmDZu/0QboByo+eUs6ugJGuVXpG85/Q3bStdkLQko=; b=RORrY91+HyGDVm
	J/kElamMQJlTbBxQZD+Ev54xXMzG0oUaIAud5E3npO0lIRRFOFYGj9n6bNnjrhYHyxgSnFsuUBygT
	ADU5MidiDpaQX00tRzYkfNyK6ftZCNWRv6CLJN+pyPFfED7Ruei28Es3ZXIL4vb/FIvzDGVAbO7OA
	w8gDqW+udXUOWmda/wNpVIOJF6DOGDD0IYGQbq8/fD8dNvYhCS4BWI620fkvp6P1US7Qtb++Cb0XT
	Cpn93EvtM/mThWeh+EMQhf/oIbAU7QE+Rq1EUla6axHQJA0sVsuZ8XRqyGNFoOBJgD7qsp20FcueJ
	yNKC+o7R4BBNwUAcAIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMkH-00000005jMv-27wl;
	Mon, 13 Jan 2025 15:52:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXM4Z-00000005YvP-15rs
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 15:09:48 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2163b0c09afso79880865ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 07:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736780982; x=1737385782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3JEPYZ3CZiadv0FeVqn0tgGKX/a2pKv6MMDJV6fcEyY=;
        b=gvTEk0yfB2LPQsikADApihyMj+LFVW04X6BBSFlwu7AhfKZ9sjugmvJGQlfH6C/6fb
         FH7bkn9z22oHDoF2WrzNpUkTeJXJskVBtdOo9U6pjRbXlvj9LPhstdYsxS0xYU2JZGdP
         O9niigqB2bkN4ncmq6Ei1icytQQIaJ4K3HKoE9zcg/8qBFv7HjTrXpSZWt2OrIA6ETaG
         9hckjMmeY0H9JbjKaGFO7828PEVHPX/aVQUI9QBSaRx7pE97ilSDFU/M+6bjSucLFc87
         xJPZi7Pt8JZriIOtboLQzM+5+sz5/xieaG8hhbrCWz5BWBybCzcXP0St4DVGk3E75Wsl
         HP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780982; x=1737385782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3JEPYZ3CZiadv0FeVqn0tgGKX/a2pKv6MMDJV6fcEyY=;
        b=c0AGPZPcIs6JehKxCapI6ihMNmbZ/hAt1ZJnaeGEJYogMKC12Ts7Pk1UfKv9hWB7lR
         sqr1GVnbayPWgDBSFATMNkkP5OdVVjr2FlK01GEjIRKCfiNe3ml6CLZzaMbrB5z2lWtU
         S8P+Z16SLSUyDnoXsJZejYO4d/j73VmyLkXXuQob27LcesKlX6Gx8NuDTF2UOxerQxPL
         lPwDtBNR+P5TcpSOIM9VfNFiYNPUuthJcEeBQ4POvVATFsXzPevvvZYE/NVmAZLSLqWb
         3m2OCxsos/I7slRnSehceiXx4+w0yMz3277DRcHEYv+zt7Qy+871/ojuUTNq8D+xGyjy
         NMhA==
X-Forwarded-Encrypted: i=1; AJvYcCUnXqUexp5F0I8MRTjwzUT9tNwiesQqahH6ju45BZxfUsYoJU71KrUQzl51oHKtS0ZbGJnnPkfIgSIoLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYGOBxPt6NRnF35a2rag7GoRcjIIlA6Cxsmzi0xItLFYmPV6IB
	J7wHDljkC8WJO9Z4dz7gRssGEFq+Va8Cqh8DbD6f/hZoVc5HSS9jBwkXnP+MGKg=
X-Gm-Gg: ASbGncu2A9U20+gX7TlWWUrLFG5rZtImyG7K84uE31XlIidVu+wgxhzmOdgLd+K6awU
	tOaqcyje6FWOHO2Z2WZBTmk1Exs7JFWh9ZdGUMXZOjTGytHc4ysnG6F4kq5qx/mVGzDPil955pc
	1lF2+sxD7eE6YhVb/6Xgnqp9M7vQoXa+4lPiMGc6A00LLarShrBUxpEid3ZcZcWaYCrMCBaUaW0
	NcPLiuubwL08zpo1xwI4zZ/A/f2PEclvayp5Hcw6VX74PmoUA8ZopFW0B/Ncx6V2o4ukEClL6y2
	rUkVr6RP1idGj7+UUXhS2DQyAgFGDgWssD/TPsI=
X-Google-Smtp-Source: AGHT+IEMX3JioaPcwbiF7eb4hzjcn+zIMS4w8BKcU/Z/uA0ebbyNORLjUYR7QiCS4H2LK8soZskKhA==
X-Received: by 2002:a17:90b:5446:b0:2ee:44ec:e524 with SMTP id 98e67ed59e1d1-2f548f7d212mr29923350a91.35.1736780982257;
        Mon, 13 Jan 2025 07:09:42 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a26ae2fsm10193120a91.9.2025.01.13.07.09.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 07:09:41 -0800 (PST)
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
Subject: [PATCH 0/5] riscv: irqchip: Optimization of interrupt handling
Date: Mon, 13 Jan 2025 23:09:28 +0800
Message-Id: <20250113150933.65121-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_070947_447103_F2AAB85D 
X-CRM114-Status: UNSURE (   5.16  )
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

This patch series provides some optimization for the existing interrupt
handling procedure. First, it tries to make a balance between interrupt
priority and fairness to avoid interrupts with lower priority get
starved. Also, it inserts barriers to ensure the order between normal
memory writes and IPI issuing.

Xu Lu (5):
  irqchip/riscv-intc: Balance priority and fairness during irq handling
  irqchip/riscv-imsic: Add a threshold to ext irq handling times
  irqchip/riscv-imsic: Use wmb() to order normal writes and IPI writes
  irqchip/timer-clint: Use wmb() to order normal writes and IPI writes
  irqchip/aclint-sswi: Use wmb() to order normal writes and IPI writes

 drivers/clocksource/timer-clint.c            |  6 ++++
 drivers/irqchip/irq-riscv-imsic-early.c      | 37 +++++++++++++-------
 drivers/irqchip/irq-riscv-intc.c             | 32 +++++++++++++----
 drivers/irqchip/irq-thead-c900-aclint-sswi.c |  6 ++++
 4 files changed, 62 insertions(+), 19 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
