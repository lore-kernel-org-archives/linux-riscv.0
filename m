Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC6660A260F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hQQKmU/5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kBXO36fAIes/OG+flhy+hpio5pO5mQKmTG5DneEcbz8=; b=hQQKmU/57lGlugICxlUwqJVjRy
	qp5tyA6vef6Q3tfENj+nWs1T3sF4vDydK6Pdj5DuHvnbw4Nl56BBVk/5DIY1hJPJtkbkERYITv4ry
	5qBau53lzjYG2nrtzMsq+E1gRoltJCcOC7ZyuyOftxLzNNOkqwP+Bijsb42frb85z3Gnz+WcXs8Um
	HIBecz2CRlid/T0B9o1QIY6x3oa/AYHfBu+6RL4yzh0giOHqTNFYunQoxXFda/8imFljx3M74f9Wl
	+Xo0GNLLEmtczKVkCJ0pA4qXn2Ir/IQWTofG+CdEgTcylrlWylCRnK8DwDo8s2n0bTLCj/MVhlhyP
	TgiARssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfuW-00000004Yxq-2ous;
	Tue, 27 Oct 2026 12:04:12 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfuT-00000004Ywr-1eNq;
	Tue, 27 Oct 2026 12:04:11 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jDTg55wlQz4yjjH;
	Tue, 27 Oct 2026 20:04:01 +0800 (CST)
Received: from szxl2zmapp05.zte.com.cn ([10.1.32.37])
	by mse-fl1.zte.com.cn with SMTP id 69RC3m9W064832;
	Tue, 27 Oct 2026 20:03:48 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Tue, 27 Oct 2026 20:03:51 +0800
X-Zmail-TransId: 3e816ae09326027-71f2f
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: wang.yechao255@zte.com.cn
From: Wang Yechao <wang.yechao255@zte.com.cn>
To: sashiko-bot@kernel.org
Cc: Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev,
        wang.yechao255@zte.com.cn
Subject: Re: [PATCH] RISC-V: KVM: Fix out-of-bounds index into aia_irq2bitpos[]
Date: Tue, 27 Oct 2026 20:02:08 +0800
Message-ID: <20261027120216.700844-1-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <sashiko-outbox-186480@kernel.org>
References: <sashiko-outbox-186480@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MAIL: mse-fl1.zte.com.cn 69RC3m9W064832
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 27 Oct 2026 20:04:01 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE09331.000/4jDTg55wlQz4yjjH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_050409_613304_BC62D4B1 
X-CRM114-Status: GOOD (  10.44  )
X-Spam-Score: -1.9 (-)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> [Severity: Medium]
> Can irq actually reach 64..67 in aia_get_iprio8() or aia_set_iprio8()?
> 
> Both helpers are static and only called from aia_rmw_iprio() via
> kvm_riscv_vcpu_aia_rmw_ireg() when isel is between ISELECT_IPRIO0 (0x30) and
> ISELECT_IPRIO15 (0x3f).
> 
> In arch/riscv/kvm/aia.c, aia_rmw_iprio() rejects odd isel values on RV64
> before computing first_irq:
> 
> arch/riscv/kvm/aia.c:aia_rmw_iprio() {
> #ifndef CONFIG_32BIT
>     if (isel & 0x1)
>         return KVM_INSN_ILLEGAL_TRAP;
> #endif
> 
>     nirqs = 4 * (BITS_PER_LONG / 32);
>     first_irq = (isel - ISELECT_IPRIO0) * 4;
>     ...
> }
> 
> Because ISELECT_IPRIO15 (0x3f) is odd, it returns KVM_INSN_ILLEGAL_TRAP on
> RV64. The largest even isel reaching the loop on RV64 is ISELECT_IPRIO14
> (0x3e), which gives first_irq = (0x3e - 0x30) * 4 = 56 and nirqs = 8, so
> first_irq + i is at most 56 + 7 = 63. On RV32, isel can be ISELECT_IPRIO15
> (0x3f), which gives first_irq = 60 and nirqs = 4, so first_irq + i is also
> at most 60 + 3 = 63.
> 
> Since ARRAY_SIZE(aia_irq2bitpos) is 64, isn't irq already guaranteed to be
> in 0..63, making these bounds checks unreachable?

Right,

I missed the odd-isel check in aia_rmw_iprio(). 
Please drop this patch. 

Thanks,
Yechao

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
