Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016EBCD8C92
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DUzFEaNx44hMDe1FIzOnUihJ5xcHs7GkssW88kOhVJ0=; b=B9GStzDp7n0tL2
	ffAQIR38M0VoelbO+wjhUeHcUNshieiZohhRagqd51hpy1vrSD/2ptEtsA8f7qmZjB7LkR9E5FREQ
	ffKA8JuUJtFcw8kDGnsXFpS9h5mYTYLFkBhmo0HGa8cpc2jKSu5mlzNrFnWEqg+GyZFPG4cuwP7Ob
	/pmZ1wTw0BvetYfWWiiB0mhUvsGyUNXYctWRUSuj3qGjfR0wdhFH8pGDJ0ZVyveQbEaJdbaXn3JAO
	dg7wEEicvA/uFw7IJBzdfZpY6M9x9/qxm3pJ0K+U2OPC0XDzS+BQDjC6kE1dvCSCu+9mFtogcMIIF
	dcAWxsipFZ5YeMzeMO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWw4q-00000005c8y-32ZZ;
	Tue, 09 Jun 2026 13:01:08 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWw4m-00000005c8J-2hRG
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 13:01:05 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso4837724a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781010063; x=1781614863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mA+1iToTuolWzR4VNZJJfQmxeczHbXjnH8cwuBOXmUA=;
        b=CPrBYVW6CP10/zXcQQthSo5cSZkWIv2C3l+adI1tv3bub5sQKW4SZvuR5NeJIu4qr3
         Xkc9D9ZcifefHdi23cbNrVOZwsYJISABHf07f7Atz8IKWJVQULmpBmVZ3FzGQb47xFuw
         grWt9EIzmqQBlyCmSDLfKVwQHLhrWMuta2dNYWKCweCYjwOzLzY578kemgEUexwVGILb
         TEPA9/kvUpw+xy9y/MSiBM7tSeyU5xPwIV7ASne1tNLrc76gsFedzNdxoTL84pZovTHz
         hqjk++Whqz6qmNiuCuQQi4T9nsXhHmq+txEYLYRRJYN2+u5fjvqU2WDlosqpcJtzVqbO
         7naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010063; x=1781614863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA+1iToTuolWzR4VNZJJfQmxeczHbXjnH8cwuBOXmUA=;
        b=nrZr6sB+jNmvhmp8Op0Kleo5EnX7IN/GIn3xWkd8jSNhvrnmbdeOst9wtju4HwwNUY
         eZSMG8mbTRM9thkUmipNZLJF0OEiIpYTpfkV0SzYLd1nTUbwXEgVTQ88MvXVceRriqGs
         yDsIopaGoh9fE4vvyiIdgcT49v0O2JBuCXQmqleQM7bzuUHbnFRu7RrseOY0pfNvQa5D
         X0/KxGEeHFyL/n2iaQtkOd+1gV32QCDYA+cKbw8mLqD8p79VUcZG6mRSIlL2FHSKs2y7
         6rh0KkIUaKcukWKTNKjtnSlIxE5zujpIAV9NtiHnwXxbOUdheI0tc6NDP9NdVltwJHKk
         NLQA==
X-Forwarded-Encrypted: i=1; AFNElJ/0rDCsRjkvqQMAOpdAA3dQYGGwkqcGW+1xnPNGS0EFfq2y32OBGT5zGN0pOhYycvIZmMxYA5F+9c9LTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv7HEAHTfEGNSdooo9yGn0LsM7BDwPYgqejVmd6CFNuJ9K/zOa
	KvQp/iFPq0nHxkVKbCTaQxbaa7iTbLDSzsM+ix9T3YS74JPzbQmSpc/L5YshVfytWkw=
X-Gm-Gg: Acq92OEdvV9L08d4cB/xEOIg1B4//ZkD7qhcJ+OAnbhGISprKdW2zLCOAYFqtDmkouT
	hO1/gaMeoJktZTgYy44D8RrBGf0U+P2OwEBiDz773ZJxxfHr9W0mWk3IHcMFoPz1Rwb+W/F6QTO
	WfSis75vcAWmvZTeVNE3xy4XaCeICnjchW0gZR7v8qGL25pjF7b+TO6WqMwcOmCBwzJcLgZBwKS
	U48O0Ipst4vyYp21R8MdC4aBViUQNONky5YCnAQA0eP14END/5IK9fxBTHRwNRuTMKa2rA7KXu3
	GLTp0icjHCoMtBf5P95Rf9rC3xoJZ5v+0iOKTHrib19GxLSG1jdYhivtBd4TdFf512zBEBw2c9L
	ozUj90u9b6Tue8kkyXU7hrKqXiNd10iBbgxU5g66HhtMGi5A2gAxP+zofJQbwpfJuxUbECjaDbx
	Rp6jU6iMRt+nLWol5SXnvIU7L4NfEHn193bp7sbIWjEpC+9Vx9TAmD1r5sEQE80LROVIk=
X-Received: by 2002:a17:90b:5906:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-370ee344dc4mr21272633a91.3.1781010061860;
        Tue, 09 Jun 2026 06:01:01 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf8284dsm23267889a91.4.2026.06.09.06.00.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jun 2026 06:01:01 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	apopple@nvidia.com,
	atishp@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com,
	conor+dt@kernel.org,
	cuiyunhui@bytedance.com,
	debug@rivosinc.com,
	devicetree@vger.kernel.org,
	guodong@riscstar.com,
	hui.wang@canonical.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	namcao@linutronix.de,
	nick.hu@sifive.com,
	palmer@dabbelt.com,
	pincheng.plct@isrc.iscas.ac.cn,
	pjw@kernel.org,
	qingwei.hu@bytedance.com,
	ritesh.list@gmail.com,
	rmclure@linux.ibm.com,
	robh@kernel.org,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn,
	zong.li@sifive.com
Subject: [PATCH v3 0/3] riscv: support effective hardware PTE A/D updates
Date: Tue,  9 Jun 2026 21:00:17 +0800
Message-Id: <20260609130021.99899-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_060104_690823_3CA93953 
X-CRM114-Status: UNSURE (   6.00  )
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

This series makes RISC-V track hardware PTE A/D updating by the
effective runtime state instead of treating Svadu discovery alone as
enough.

When both Svade and Svadu are present, Svadu is disabled at boot and
must be enabled through SBI FWFT.  The series enables FWFT PTE A/D
hardware updating on all currently online CPUs before enabling the
global static key, and enables it for later hotplug CPUs early in
smp_callin(), before they are marked online.  If FWFT setup fails, the
kernel falls back to software-managed A/D updates.

It also makes live PTE access/permission updates use cmpxchg-based
merges so that software updates do not lose concurrently
hardware-updated accessed, dirty, or soft-dirty state.

Changes since v2:
- Split the devicetree binding clarification into a separate patch.
- Avoid CPUHP_AP_ONLINE_DYN for FWFT setup; enable FWFT for current
  online CPUs during init and for hotplug CPUs early in smp_callin().
- Export riscv_hw_pte_ad_updating for modular KVM.
- Preserve _PAGE_SOFT_DIRTY together with A/D bits and rename the helper
  variable to avoid implying only hardware bits are preserved.

Yunhui Cui (3):
  dt-bindings: riscv: clarify Svadu boot-time behavior
  riscv: track effective hardware PTE A/D updating
  riscv: preserve A/D and soft-dirty state across PTE updates

 .../devicetree/bindings/riscv/extensions.yaml |  6 +-
 arch/riscv/include/asm/cpufeature.h           |  8 ++
 arch/riscv/include/asm/pgtable.h              | 27 ++++--
 arch/riscv/kernel/cpufeature.c                | 89 +++++++++++++++++--
 arch/riscv/kernel/smpboot.c                   |  4 +
 arch/riscv/mm/pgtable.c                       | 68 +++++++++++---
 6 files changed, 175 insertions(+), 27 deletions(-)

-- 
2.39.5

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
