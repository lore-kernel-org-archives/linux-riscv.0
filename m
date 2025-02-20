Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BE7C021B1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 14:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kc4JuXjLiIStOkNYvTu8ZNqhm/+JGzKHZ3x++J1ITTQ=; b=HThmnAPwdVU+dn
	vOyfa9LDoCVGS0TKVyZo79hoUa2xVx/Exb12Byc16puml2fBO8vkEr5mckSMHbkZl3uXr91cZ0eaq
	1GAnxAMPPdjrpgv282DaPcZQ8Enb9LKAcmKi6ICxk5QtIxYVhZBgNLz2j75lR0Em+mwIpBzdpz+zS
	n6+Ye4lotavYXmCvakA0qgmvkr+daBlUlgkfnk7XAmbxRyHAfGgxxOdl/UIyibpuZyIXuA10QQ3td
	rZ9zbz/iFbK0Hi2Eujgx8tdh3dT4mcyRB6SbIV+XQQsFcCmKKEDP+etyy7eK4HlUF/61+KMbapy+2
	xdbNIIH4zU+AyHP7+czw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7cR-00000001Krj-49oT;
	Thu, 20 Feb 2025 14:33:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7QW-00000001HN6-3kZ3;
	Thu, 20 Feb 2025 14:21:22 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740061279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G/BmtFl2k81SUm/1VjrdU/jVgNub5nHsJ466sJIBSwU=;
	b=3oufnGd79cXN4jTTMDZ7Z6srl8Ucj1sL35GTITM5ip/hhNfLdNEYBcfYEMW975QF6921cA
	cciHlQX7+abbQrJT0TieGU8ctAA7wGO0cqj2/piqAaIcbrDv5L/4HeIGVwShaFC3Bq48YH
	suiMDHR3vg34aEAzMe+BV0KSW9VSPNgdjwW63lvegZgL1TQ5UiPythFZ5KnPHQRHxJG2Xj
	giFg2lDq21Vm2EoS1vuwvtqlttU4FdQYnquG8StF/7Qc2U1dMZXYRZ0FtVE75DzBMrzz/P
	N3504pfJR4o/GLBBGIeWk5v9l0bJsYmm0QupTJ+nNCCVRtaoXf+P0gSK0HcClw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740061279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G/BmtFl2k81SUm/1VjrdU/jVgNub5nHsJ466sJIBSwU=;
	b=D9Knt0/YpIddKDTVG7BDrv4vvrba0CkVNAk6jPl1IKKFJVU+mQyOoOkRYYlV8EljvtiK2B
	sr28C0ab+/lVqCAQ==
To: Mark Brown <broonie@kernel.org>, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v6 02/10] irqchip/irq-msi-lib: Optionally set default
 irq_eoi/irq_ack
In-Reply-To: <87jz9kiuvu.ffs@tglx>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
 <20250217085657.789309-3-apatel@ventanamicro.com>
 <Z7Xto0WZ-Crxunik@finisterre.sirena.org.uk> <87jz9kiuvu.ffs@tglx>
Date: Thu, 20 Feb 2025 15:21:18 +0100
Message-ID: <878qq0itnl.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_062121_067123_E8FC00F1 
X-CRM114-Status: UNSURE (   9.18  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Dave Hansen <dave.hansen@linux.intel.com>, hpa@zytor.com, linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, x86@kernel.org, Andrew Jones <ajones@ventanamicro.com>, Sascha Hauer <s.hauer@pengutronix.de>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Anup Patel <anup@brainfault.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 20 2025 at 14:54, Thomas Gleixner wrote:
> On Wed, Feb 19 2025 at 14:41, Mark Brown wrote:
>> On Mon, Feb 17, 2025 at 02:26:48PM +0530, Anup Patel wrote:
>> I'm seeing boot regressions with qemu on arm64 in -next which bisect
>> down to this patch.  We hit a NULL pointer dereference:
>>
>> <6>[    0.898900] virtio_blk virtio1: 1/0/0 default/read/poll queues
>> <5>[    0.910197] virtio_blk virtio1: [vda] 3906250 512-byte logical blocks (2.00 GB/1.86 GiB)
>> <1>[    0.924459] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>> <1>[    0.924508] Mem abort info:
>> <1>[    0.924521]   ESR = 0x000000008600002b
>> <1>[    0.924559]   EC = 0x21: IABT (current EL), IL = 32 bits
>> <1>[    0.924580]   SET = 0, FnV = 0
>> <1>[    0.924597]   EA = 0, S1PTW = 0
>> <1>[    0.924616]   FSC = 0x2b: level -1 translation fault
>> <1>[    0.924667] [0000000000000000] user address but active_mm is swapper
>> <0>[    0.924833] Internal error: Oops: 000000008600002b [#1] PREEMPT
>> SMP
>
> Uuurg. I wish I had double checked that the final submitted patch covers
> _ALL_ incarnations of this. The below delta patch should address it.

I'll redo the branch accordingly.

Thanks,

         tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
