Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D077CA0FE9
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 15:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wwvavo/BEU6aB0JSc3SOmWz+qbtzqBqv/nG2ILYlTM=; b=CMjNOl0I2jhmDp
	Jhdh1HixiN8WdPToP0rsJRo32HcVpWfFYzVXIiFSptcxqViAL5m2RDFTzPTH04hPwULxi/QTChoDy
	WY3nIB6kdPPvcmoh8rmv1+KOfIjIImuepZP8M4uKi/RwGvwX8CZmIdON42WQKIcj6QcvnHUjpd/0L
	1SyJRRGz4b/vmVRF+yBCr5/22AMjtfYb1qxTFVsBX6IM4m2gxPDqIgeJehYRbkqKZI60SHCYNv0Cn
	Pk825y4ymp0lOIsaal3LL+H6zjQDJms1P8JJ+fo+uq+0CTYd7rLh9cVUB2Gqqys7VumDnqS7cyGBB
	WFr5fBBoSmBF7UlbyLrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdB8e-004KcL-1H;
	Mon, 04 Sep 2023 15:05:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdB8a-004KbU-1k
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 15:05:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 759F9B80DB5;
	Mon,  4 Sep 2023 15:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A43C433C7;
	Mon,  4 Sep 2023 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693839909;
	bh=ljgv0MpAqVctGjtWZkElSITFiR5RbtuGf5naRqQkjmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAV2mP/F3umwbP/x9qYaYUwoCW4umGg9SjIkHMlYrX3gj1pusAzsFssWINlJbwWrl
	 +16uJGWL7QhZzx1rQADqchCCyimOAUnlTrwv/60stjJncUQCtWtgGBTcgGpcYjxPAX
	 m8/5kaXOWk/dVC9V2uxhMpN/wb/TF0Bvr/tLM6zo9trsbYnBWqObit/yKIIg9X2Cpj
	 AyfpZ2XAmtMtgmE4jhGGU2Y8MR5SxCd36KJFvcs9NXecwm8ru9GLqWo6YQDi9bwrhn
	 l1Z7YyCRlJLj3uL8B21bpAC9/kZtMSG5PvO2Mjjb35os2yk9q/w9ELLo/coCeLMlfz
	 4o5BEbobV8CJA==
Date: Mon, 4 Sep 2023 22:53:11 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jiexun Wang <wangjiexun@tinylab.org>, adrian.hunter@intel.com,
	aou@eecs.berkeley.edu, conor+dt@kernel.org, conor@kernel.org,
	devicetree@vger.kernel.org, guoren@kernel.org,
	jkridner@beagleboard.org, krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robertcnelson@beagleboard.org,
	robh+dt@kernel.org, ulf.hansson@linaro.org, wefu@redhat.com
Subject: Re: [PATCH RFC v2 0/4] RISC-V: Add basic eMMC support for BeagleV
 Ahead
Message-ID: <ZPXvV/1dbUf7g+0a@xhacker>
References: <ZOy3v+YgZgU1NrWx@xhacker>
 <20230829015647.115757-1-wangjiexun@tinylab.org>
 <ZO4MmdNRqrye/x2b@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZO4MmdNRqrye/x2b@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_080512_876044_5D6A65F1 
X-CRM114-Status: GOOD (  22.56  )
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

On Tue, Aug 29, 2023 at 08:19:53AM -0700, Drew Fustini wrote:
> On Tue, Aug 29, 2023 at 09:56:47AM +0800, Jiexun Wang wrote:
> > Date: Mon, 28 Aug 2023 23:05:35 +0800, Jisheng Zhang wrote:
> > >On Mon, Aug 28, 2023 at 12:40:16PM +0800, Jiexun Wang wrote:
> > >> Hello,
> > >> I tested the patch on my LicheePi 4A board.
> > >> It can successfully boot with eMMC, but when I use the eMMC more frequently - for instance:
> > >> 
> > >> $ while true; do /bin/dd if=/dev/zero of=bigfile bs=1024000 count=1024; done &
> > >> 
> > >> I encounter the following error:
> > >> 
> > >> sbi_trap_error: hart1: illegal instruction handler failed (error -2)
> > >
> > >> sbi_trap_error: hart1: mcause=0x0000000000000002 mtval=0x0000000060e2de4f
> > >> sbi_trap_error: hart1: mepc=0x000000000001897c mstatus=0x0000000a00001820
> > >> sbi_trap_error: hart1: ra=0x00000000000170f8 sp=0x000000000004adc8
> > >> sbi_trap_error: hart1: gp=0xffffffff8136ea90 tp=0xffffffd900228000
> > >> sbi_trap_error: hart1: s0=0x0000000000000000 s1=0x000000000004ae08
> > >> sbi_trap_error: hart1: a0=0x000000003f9aa9bc a1=0x0000000000000004
> > >> sbi_trap_error: hart1: a2=0x0000000000000000 a3=0x0000000000000000
> > >> sbi_trap_error: hart1: a4=0x0000000000042248 a5=0x00000000000170e5
> > >> sbi_trap_error: hart1: a6=0x0000000000000000 a7=0x0000000054494d45
> > >> sbi_trap_error: hart1: s2=0x000000000004aee8 s3=0x0000000000000000
> > >> sbi_trap_error: hart1: s4=0x000000000004ae08 s5=0x0000000000000000
> > >> sbi_trap_error: hart1: s6=0xffffffff813aa240 s7=0x0000000000000080
> > >> sbi_trap_error: hart1: s8=0xffffffff80a1b5f0 s9=0x0000000000000000
> > >> sbi_trap_error: hart1: s10=0xffffffd9fef5d380 s11=0xffffffff81290a80
> > >> sbi_trap_error: hart1: t0=0x0000000a00000820 t1=0x0000000000000000
> > >> sbi_trap_error: hart1: t2=0xffffffff80c00318 t3=0x0000000000000001
> > >> sbi_trap_error: hart1: t4=0x0000000000000330 t5=0x0000000000000001
> > >> sbi_trap_error: hart1: t6=0x0000000000040000
> > >> 
> > >> My kernel version is v6.5-rc3.
> > >> My OpenSBI version is 1.3.
> > >> I tried to use other versions of OpenSBI, yet the problem persists. 
> > >> Is there a possibility of any underlying bug? Your insights into this would be greatly appreciated.
> > >
> > >
> > >Can you plz try below opensbi?
> > 
> > I tried the OpenSBI you provided and the issue didn't recur.
> > I conducted stress test about 30 minutes and the system appears to be functioning very well.
> > Thank you so much for helping me resolve this problem.
> 
> That's great!
> 
> Jisheng - are these the commits that fix the error?
> 
> d98da90a19b5 ("lib: sbi_illegal_insn: Fix FENCE.TSO emulation infinite trap loop")
> 39d1e698c975 ("lib: sbi_illegal_insn: Add emulation for fence.tso")
> 

These two commits have been in upstream OpenSBI, so there
must be something to be patched/fixed in the upstream OpenSBI, but I have not
yet bisected the upstream OpenSBI to find the root cause.
This issue is on my TODO list.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
