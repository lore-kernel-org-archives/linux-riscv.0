Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A094606A334
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 14:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c16GJqsE;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=OM13LXHE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=514LSaoZiRJxXE7eIidr2h8FEOwaaZhaibM5Hi77Ez8=; b=c16GJqsEyVUAb2
	7zHCa5Rv5Ur26x4W/bfrwhj2ZPSKJo0P7Jvj5zG68YAyCp1ivxiholvimN+5gxky1v5QdOg6WbLRR
	uRKMQvMfM3MXVk1TPhxyZe0CmbDv+MJyfn4lUbbe68xsgnEZmCJxHCFmEF+u4aDZ7p8l8uzkR/vvM
	9XxQDgdmWgZo6d3AldIjQZQ8f9dQ2P/19GmcUZ9Mruzu9Z6ur+D/X+EyC8m/HcgYrD1MgNJEP62eo
	blV4jhhUOInh8D7ETQaq5N7hm/YnEStN/+UgDEcZwXCw3bc8gCP+CgJYVzolbWUvrOPfCxTPL6RKO
	n3L9Z0s8m0yIkQxiTTww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAnh-00000009w8k-1hUA;
	Tue, 20 Oct 2026 14:26:49 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAna-00000009w3c-1K5l
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 14:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792506395; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=9VZNqnxOEQTj++mPRtHjJD1jjjPwkguBzx/LIqemhIs=;
	b=OM13LXHEmZi+hQxjbiqoXCPE8c9twId8TWdoFFS2dXJ4SGz7lDmTkFy4GxQAOlFURsRrX29O1/Ff9va0XVIFEQsCIIBlI6VL2fnN7dvUpG8cKRLvVRvLwIjhdvlyEhymMz6yA7+QjEkSvwedWjBw5QN04vNckSIvizGLNjYMQ98=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R331e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0XDDahPA_1792506390;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XDDahPA_1792506390 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 22:26:34 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: sudeep.holla@kernel.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	atishp@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Subject: Re: [PATCH] riscv: Populate boot CPU topology on UP kernels
Date: Tue, 20 Oct 2026 22:26:26 +0800
Message-ID: <20261020142630.1680-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020-frisky-jovial-echidna-2d003c@sudeepholla>
References: <20261012131034.1026-1-cp0613@linux.alibaba.com> <20261020-unsent-commuting-91739a882031@spud> <20261020-frisky-jovial-echidna-2d003c@sudeepholla>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_072644_032493_C60EB14E 
X-CRM114-Status: UNSURE (   5.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 01:24:00PM +0100, Sudeep Holla wrote:
> Commit 4b3dc9679cf7 ("arm64: force CONFIG_SMP=y and remove redundant #ifdefs")
> removed UP support and made SMP default enabled.

Thanks. RISC-V still allows UP: CONFIG_SMP is a plain bool with no
default, yet arch/riscv/Kconfig selects GENERIC_ARCH_TOPOLOGY
unconditionally while the only callers of init_cpu_topology() and
store_cpu_topology() sit in smpboot.c, which is built only for
CONFIG_SMP. That mismatch is what this patch closes.

Gating that select on SMP instead does not work. UP would then fall back
to the cpumask_of(cpu) defaults in include/linux/topology.h and report
the same sysfs, but vmlinux no longer links: arch_freq_scale,
capacity_freq_ref, topology_scale_freq_tick and topology_set_freq_scale
all become undefined references.

arch/riscv/include/asm/topology.h binds the arch_scale_freq_* and
arch_set_freq_scale hooks to symbols that only drivers/base/arch_topology.c
provides, and those defines suppress the generic fallbacks in
kernel/sched/sched.h and include/linux/sched/topology.h. Making the
gating work needs extra conditionals at several Kconfig and Makefile
gates, and gives up freq and capacity invariance on UP, which is a much
larger change than the twelve lines here.

Conor, and RISC-V maintainers: would you rather force CONFIG_SMP=y on
RISC-V as well and drop UP altogether, or keep UP buildable and take
this fix? I would keep the current approach unless you prefer the
former.

Best regards,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
