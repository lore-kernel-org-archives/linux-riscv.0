Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A04CD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 06:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D1M2icM5jSmM3WKyhEy3MEEsc0t+lVs7U0XgFBJhkoU=; b=fzJkkN4rOXBCtd
	YkcGwIIFXqL8mGpIaY/9MyhJiFe4Lw5jA4+Cs6UP1uBt3/qU77j0Z8f8NQUNaLvQ30zG8/K3hbIcn
	t78cPZrL6uOvY0Agqsh5njvSPHDAdd/J1aCZ0KB5D9gWSVyaa3JnL49juSerKVRfwRlKum4QJWEwk
	uACuGYRuiwhKEt1YY3Zopc8NyV23sSuxSLI87zSB3zAmn0dfNONw9HABtcBf1LLS/6IW01/HbbNdV
	43J60APl65vYbEtJLfBKjOjxhFBJLJl1V4/E8HH0znqQuuWN0xrSpXwdbS1arYLnwloLNIQJuJsq4
	kknIspnNpYnluHSzm1hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6UW-00000000huh-2TWI;
	Thu, 18 Jun 2026 06:44:44 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6UU-00000000huL-1hT8
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 06:44:43 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c8894387780so272430a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 23:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781765078; x=1782369878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dbk1I0aDC1Yhxb16E4OBv59pDst3zDysCFUD2EyIEKs=;
        b=KwMipA/MxtO3QVqTTE62YMZPsOSUyg4KTZ4+T56MvnXAuT4Q6FnXJdIrZQwSDnzcTx
         Dm2sSSOzCoJrZXmkDe1BOZFWkE4eWcRZec6wHS9GjB22QIE6JJ4K18BfaowfuG4ljjWf
         1RLKIRs3owja00bpVVBFJ49rGjyqpPj54LTQ4wt41ymjaX+wu6YM5dADjECHV7BIq5qt
         1o/VddRyy4yeoUmxTNDzKdujCIARb6Nir+oI6sZR3vjNDbyDmw3snJyH849cAfI0vrj/
         FUEuTzptTuOt0sJ+uEHOUuJ3o4AaCuMHI5R52ETz5SU4CRo1TOdKN1i2LTWvF7VDzUsI
         YUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781765078; x=1782369878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbk1I0aDC1Yhxb16E4OBv59pDst3zDysCFUD2EyIEKs=;
        b=FZRwB3R4INpjxhgsB6olZSpPLmqAAnqwqXrgl1nAtgKRWzaKGv+YaUAtZkln4onQ4l
         OQBcaigh904mZcCG02CdvsKr1xOVwyDz2yAgEJrQPCHoRK7Tr+6tCyrGJUrk8ZI+R/fH
         QSXk5U5NoT+1Lqz0NU6occ+UKLmIHKo4bI+u05LoDGhzvJ9+AZiORM9ZuHv0VjdZb4pp
         ehamX0yHnJvVap4BfZ5v4+8e4tJigrcALB/kE0/GUCAtxgfaAZ6DVjGqvQCz+fZ5yNdL
         ffAZ+65z5tLR6JLtIHk4q0kgcBfXagxuzH7POKI7hTXO7cjc4nBxlQz1w71/5XzeuZCO
         xx5A==
X-Forwarded-Encrypted: i=1; AFNElJ9NF0tp5e9GNXGkyytTJxnZcw1/GJoJSVOulRVfKNsrIf1WTrwDf/FA2tXS1Fp/h/7UoiaqCg+JaLIdtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpabZW7FcIWlv8VGcOD6pUxMVEbiInQFfmroxe4NTh7Uh9Zzuu
	UKEL27de36AmdBI7CGYh8ZP/sJTzd4+aOuf5sEynGgReZXKZYoxKD3QK1XSo7OnQ7Fc=
X-Gm-Gg: AfdE7clvPcCTcGjD1d18i79KoLSvmY5yOT6ZfbR+N3jURCeYVuuEK5f4tXl9Zrosk/n
	Ty+2WtRkjoXAwCKqZuA/vqvrl/smmlS4sq1r+xprQCqyEZnvhe78vSC8LFkW1O4LzHUolDnIcLK
	JLq1bFtqEdeMW6eB271Vp2PDL2yM9YPvF6z3PqL1lI7fXGy98cYW/GvXOEKtEB9eP+R9SS76Nrv
	van4289VQEybPlQBWwyhLv6S9hazteNiiHahQEvN8RSCjUSX9J7YiVWuIFMavy54CQNssWCgKZc
	3Xd1CIoqvZF6Cys3FqhxSeeiA3qsIXYpfLCIAFfeEIbWpuWwR/k3b7eF/LW6G6MSO36UkJdy0hY
	w6C7NH4OktJpZyA4SOJJaD8f2Stc2YrHbN3kyXjWHZJHazr+k7zykXuEQghNKeHXr4BVb8y1bX3
	FKiueuobFGbxwUN7m4xFT1kQsgjeWi7sENNLggL5gX/CQGIg==
X-Received: by 2002:a17:902:ce07:b0:2c0:cb0e:ac3a with SMTP id d9443c01a7336-2c6bc224f58mr70875945ad.23.1781765077547;
        Wed, 17 Jun 2026 23:44:37 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c1fsm185275985ad.53.2026.06.17.23.44.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 23:44:36 -0700 (PDT)
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
Subject: [PATCH v4 0/3] riscv: support effective hardware PTE A/D updates
Date: Thu, 18 Jun 2026 14:44:03 +0800
Message-Id: <20260618064406.14508-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_234442_451794_CB009EBC 
X-CRM114-Status: UNSURE (   6.88  )
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

Changes since v3:
- Keep the only-Svadu binding contract as always enabled, and only
  describe the Svade+Svadu boot state as disabled instead of turned-off.
- Detect the need for FWFT from per-CPU Svade state instead of the global
  ISA intersection, so asymmetric Svade/Svadu systems do not skip FWFT.
- Document the secondary-hart FWFT bringup state flow in the commit log.

Yunhui Cui (3):
  dt-bindings: riscv: describe Svadu as disabled at boot
  riscv: track effective hardware PTE A/D updating
  riscv: preserve A/D and soft-dirty state across PTE updates

 .../devicetree/bindings/riscv/extensions.yaml |   2 +-
 arch/riscv/include/asm/cpufeature.h           |   8 ++
 arch/riscv/include/asm/pgtable.h              |  27 +++--
 arch/riscv/kernel/cpufeature.c                | 101 ++++++++++++++++--
 arch/riscv/kernel/smpboot.c                   |   4 +
 arch/riscv/mm/pgtable.c                       |  68 ++++++++++--
 6 files changed, 185 insertions(+), 25 deletions(-)

-- 
2.39.5

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
