Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980C9CCD193
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 19:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VxrHwh1MScCFoi4HJYO+OgHZdUamb5Jwz0k7GwR43nw=; b=NmuV7TYyWD8sCj
	hhDc31eomyys81Ew66XFqP0SDgoV0ajJuBVcop4Bge9k5U6LgekUq68cZrPrhzj1JpFFCQutEjjsO
	ylqk7MzenZm3YhrGaMN4DBG+HGiUGRlleN5bRxmsdwIp2hODXhjERgoPxNS7Pt6ZdTJvbNquOeVHX
	CmiVMME8M1U2Wh7rhIoOyMIwNIPra/abOGIFf1SUHCrOUpkoA2SwOktK0nddemfz/48OQg6ILrwIC
	2b/mHvQvLv+vk+tbecPhxhsNpfi42A6j3OQMTba1xedYkWhulbOQ3SM1f6tKJbLSjko5UXwfItMDA
	V6vsE+XnzhuCVgzPzrxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97cb-00000002nfH-2JEu;
	Wed, 15 Oct 2025 19:57:17 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97cY-00000002neG-3tKC
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 19:57:16 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-782e93932ffso1405b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 12:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760558234; x=1761163034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jf1D+pXD9ez3LgtyDQn5W7bDLQYXqMdDa0ed4ybggHE=;
        b=SmqeRuvOazkBpH37uLZWTOR/Rt/VGG9FHS8e51ciohnR1j2FZODJj46CzhARy5upxQ
         JraOmKskF8cnCT5RdaYZyPI+9bxQryyrFlZWN55qrXMjLTpUASHTH2yXqiPFY9InFgb2
         jiPE+wnd/9/QCVHGSrdTH4fNINCnAnszeXGk5J4QYJ6Rxdj2fPiRcP1tvl86ni/qM7fD
         x6cDnmsiPimDPXYH81fbmO8VQ2yh7grgaqWw8nF9k7v1qtc91+neAArZ7ZcXMe2XBBrv
         koJZnqcdqAlij9aY/KH1Ce2iJrDihOUwk8+pd6sLDtlC6c+++ZNb0k8EdlKRQgVLH+5C
         Shpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760558234; x=1761163034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jf1D+pXD9ez3LgtyDQn5W7bDLQYXqMdDa0ed4ybggHE=;
        b=SqOaJr7ZSV+8l+m/Yv93kJbFQJJxce3oNEWwI6ZvTwpnjMPIP2FH3P7aNbfy/1zGE0
         GNH3U5/5LZB/cAdE2zk61+Te1TjREqL+iwEw4eE99QyQmzNyyGcMx4C+DsjuYsd7GemK
         ZbafTvspbU3SZVboA12u8e2YzQK2cgWpO6+33qjpjMI++6JemT311igEOcX2nMVS1lPk
         xqDhCtfvFDuaYMtC+0B9sVPV0MfFm02uY8hKUN6nj/d714yjy8YCn5dg2CU2csTLBfxL
         owVpYO2iM1A+8LqxRh9B2tyVquyhh8Sj0LGWRQwKLfzMJM4IYK7N3u3jCZtw10GgAdKd
         dvHA==
X-Forwarded-Encrypted: i=1; AJvYcCV3UkQSnT2NMF4nZiFAnHsRm96dlUKh24t/nhWJ1fEILqHQUC5/dkQOIJ1ZGKne2/smLKQWTdEjO04kQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHY4KfzBrhQch93Sril/nZSBuWHUh1rOCXVpt/qwt6XuXU8NyK
	4VJ02mTnH9NlQFykw7LToni3e3imdUH8tLuAQe4vYTn9f2N8tPSZQtMIWxvRNr1dhqI=
X-Gm-Gg: ASbGnctgelh0nqC6JqI6GkZi+MNpVtTt5TK7m5sSxJW59EYZdimfB8SSX//lEIU9jGQ
	lJ6ei/i9fsrjKgb0lMmXbHqGDFs/xyhx0j3Fgra16OPeL+pFfmeDru/okCOVLLaiVn+KAM0HOfX
	4nTtxoLD902ZX5nAafP+4AJ0SyTBo/iaERdJiM+E9+wI3iI7vzR7qWhsCiURY8ElCvvvBb495Ij
	He2iXG9Hz6ApV5f2HUCHlM1u67h3CEoUhA5vg3jKzuZ4K0grmfP1v8IOR6jMZNXq/wijAfqUVew
	6ZtH3vHxT8jNruAIVYpC/wopdxmPVzTRcnWefwW5kUsWbN6gCfemP68jFuHE2631HYLM7K3AVdD
	fZs98MgddO0YDaBhFNcD6jQldsf1vyrh5Hc6pD3rReVBvDTuBbagaxzgrBnnbPjszUWZ3trShuF
	zeWn64rG02jp/okyagNdUznA==
X-Google-Smtp-Source: AGHT+IHwZvjxinrfQrnbeoDgW7hQBq/oQ8eKuyKeD7xr+PW/nsvJq8jqNBQZpbLuAC6y9e8iYnyRbg==
X-Received: by 2002:a05:6a00:464e:b0:780:fff4:f7db with SMTP id d2e1a72fcca58-793874402c2mr37486934b3a.15.1760558233936;
        Wed, 15 Oct 2025 12:57:13 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b06075fsm20151322b3a.17.2025.10.15.12.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:57:13 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 0/4] irqchip/riscv-imsic: IRQ handling optimizations
Date: Wed, 15 Oct 2025 12:55:11 -0700
Message-ID: <20251015195712.3813004-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_125714_998364_89A604CB 
X-CRM114-Status: UNSURE (   6.62  )
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

This series includes a small cleanup to imsic_irq_set_affinity() and a
series of optimizations to the IMSIC IRQ handling hot path.

Benchmarks on a SiFive P470-based board (95% confidence interval):
  perf bench sched messaging: 5.20% to  7.08% improvement
  perf bench sched pipe     : 8.47% to 13.85% improvement


Samuel Holland (4):
  irqchip/riscv-imsic: Remove redundant irq_data lookups
  irqchip/riscv-imsic: Embed the vector array in lpriv
  irqchip/riscv-imsic: Inline imsic_vector_from_local_id()
  irqchip/riscv-imsic: Remove irq_desc lookup from hot path

 drivers/irqchip/irq-riscv-imsic-early.c    | 11 +++-----
 drivers/irqchip/irq-riscv-imsic-platform.c | 11 ++++----
 drivers/irqchip/irq-riscv-imsic-state.c    | 30 +++++-----------------
 drivers/irqchip/irq-riscv-imsic-state.h    |  8 +++---
 4 files changed, 19 insertions(+), 41 deletions(-)

-- 
2.47.2

base-commit: 9b332cece987ee1790b2ed4c989e28162fa47860
branch: up/imsic-opt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
