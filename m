Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F7CC6FD18
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 13:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0U9+L2vGhiFlUSMje+zFgCBXEgh74D1IUozqflwnB4=; b=LqUFRYE+82h/6m
	/tKva7rlIg5W2wI3/Z/crtkaK6zJHN/IEtsHHPDpjorzYr9pnEnrGsOsLJo9fc5xJohlkn5toyy9j
	LcDB4f9b7GK7rUbB8w2YVPQIhf8RXLSnpO9m+AxPfELM2/UoD6Ewr60v5Hoo0ZSXbNS3ZsFXGaCSg
	JgnWYLfqQxZD1zLpIy2hikbbtPRrQdxBY33t1JNiUmiqZ2pUgNOzBYXrYjE5+EdYZ5un05PxkGlb2
	2r8N9DbVX3NfNNxcfcu+i3EwOzoIZzvFzx4pDMcP9WK78CVJjj8R3SeurTVl+ACFyvC3QqgtYJR9Q
	4y7GkYmWZco63UWJkIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piExt-007YMT-2K;
	Fri, 31 Mar 2023 13:38:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piExp-007YLp-1W;
	Fri, 31 Mar 2023 13:38:47 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1piExm-0003vk-Sw; Fri, 31 Mar 2023 15:38:42 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 ShihPo Hung <shihpo.hung@sifive.com>, Vincent Chen <vincent.chen@sifive.com>,
 Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, Guo Ren <guoren@kernel.org>,
 Andy Chiu <andy.chiu@sifive.com>
Subject:  Re: [PATCH -next v17 16/20] riscv: prevent stack corruption by reserving
 task_pt_regs(p) early
Date: Fri, 31 Mar 2023 15:38:41 +0200
Message-ID: <14872268.tv2OnDr8pf@diego>
In-Reply-To: <20230327164941.20491-17-andy.chiu@sifive.com>
References:  <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-17-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_063845_528338_C04EEFB6 
X-CRM114-Status: GOOD (  10.81  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Montag, 27. M=E4rz 2023, 18:49:36 CEST schrieb Andy Chiu:
> From: Greentime Hu <greentime.hu@sifive.com>
> =

> Early function calls, such as setup_vm(), relocate_enable_mmu(),
> soc_early_init() etc, are free to operate on stack. However,
> PT_SIZE_ON_STACK bytes at the head of the kernel stack are purposedly
> reserved for the placement of per-task register context pointed by
> task_pt_regs(p). Those functions may corrupt task_pt_regs if we overlap
> the $sp with it. In fact, we had accidentally corrupted sstatus.VS in some
> tests, treating the kernel to save V context before V was actually
> allocated, resulting in a kernel panic.
> =

> Thus, we should skip PT_SIZE_ON_STACK for $sp before making C function
> calls from the top-level assembly.
> =

> Co-developed-by: ShihPo Hung <shihpo.hung@sifive.com>
> Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
