Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E228AC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 23:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bkV/OlLI8P83uSVpnvK79g4nDlwIp3mo4iQ2+ui0B0=; b=N3loAZSXm10LoW
	KgxeM3WZMMp82iLJ9iiZqiod09lt1/K6D6ETzYwvJk/F7RER5HiwjIFXrmcKEQ5/Akze/zoMCs0bp
	XILW0RLIfkNH5gYaq1ZzXiNh+OKj4IcKa7SiYmebID01gh/qs38KyKBhIewN3K3fU6bJx9xBQkVHq
	BbCwSBkKGvuhMzGM/6wzr4dx2JJ7gLAIqjrXo2ewDtjPKIY7U3MfcMjUA1jYRPwXpjGLf4pRuWAcF
	2n0/O1iOCEzoOHzYXSbbmdjMByMXpFDqfF3XJDUC6SKAvhD+zu45p3430v0kU2t8XXwaSmhTWevcd
	WJeVmfxT/6uGE1N08IrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHwdJ-0024An-Mc; Wed, 09 Feb 2022 23:44:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHwdH-0024AK-IL
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 23:44:21 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nHwd4-0005XG-Kr; Thu, 10 Feb 2022 00:44:06 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu
Subject: Re: [PATCH v6 00/14] riscv: support for Svpbmt and D1 memory types
Date: Thu, 10 Feb 2022 00:44:04 +0100
Message-ID: <14426959.46CLvVMboC@diego>
In-Reply-To: <YgP+n5OMhQPSbICV@xhacker>
References: <20220209123800.269774-1-heiko@sntech.de>
 <YgP+n5OMhQPSbICV@xhacker>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_154419_664522_B63F25C4 
X-CRM114-Status: GOOD (  37.20  )
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

Hi,

Am Mittwoch, 9. Februar 2022, 18:49:19 CET schrieb Jisheng Zhang:
> On Wed, Feb 09, 2022 at 01:37:46PM +0100, Heiko Stuebner wrote:
> > Svpbmt is an extension defining "Supervisor-mode: page-based memory types"
> > for things like non-cacheable pages or I/O memory pages.
> > 
> > 
> > So this is my 2nd try at implementing Svpbmt (and the diverging D1 memory
> > types) using the alternatives framework.
> > 
> > This includes a number of changes to the alternatives mechanism itself.
> > The biggest one being the move to a more central location, as I expect
> > in the future, nearly every chip needing some sort of patching, be it
> > either for erratas or for optional features (svpbmt or others).
> > 
> > The dt-binding for svpbmt itself is of course not finished and is still
> > using the binding introduced in previous versions, as where to put
> > a svpbmt-property in the devicetree is still under dicussion.
> > Atish seems to be working on a framework for extensions [0],
> > 
> > The series also introduces support for the memory types of the D1
> > which are implemented differently to svpbmt. But when patching anyway
> > it's pretty clean to add the D1 variant via ALTERNATIVE_2 to the same
> > location.
> > 
> > The only slightly bigger difference is that the "normal" type is not 0
> > as with svpbmt, so kernel patches for this PMA type need to be applied
> > even before the MMU is brought up, so the series introduces a separate
> > stage for that.
> > 
> > 
> > In theory this series is 3 parts:
> > - sbi cache-flush / null-ptr
> > - alternatives improvements
> > - svpbmt+d1
> > 
> > So expecially patches from the first 2 areas could be applied when
> > deemed ready, I just thought to keep it together to show-case where
> > the end-goal is and not requiring jumping between different series.
> > 
> > 
> > The sbi cache-flush patch is based on Atish's sparse-hartid patch [1],
> > as it touches a similar area in mm/cacheflush.c
> > 
> > 
> > I picked the recipient list from the previous version, hopefully
> > I didn't forget anybody.
> > 
> > changes in v6:
> > - rebase onto 5.17-rc1
> > - handle sbi null-ptr differently
> > - improve commit messages
> > - use riscv,mmu as property name
> > 
> > changes in v5:
> > - move to use alternatives for runtime-patching
> 
> another choice is using static key mechanism. Pros: no need to coding
> in asm, all in c.
> 
> To support new arch features, I see other arch sometimes use static
> key, sometimes use alternative mechanism, so one question here would
> be which mechanism is better? Any guide?

For me it's also a bit of a learn-as-you-go experience, but I do see some
advantages in using alternatives:

- Static keys need the jump-label infrastructure, which the RiscV kernel
  only seems to provide on non-XIP kernels [0]
- the amount of asm here is somewhat minimal for the core no-cache and io
  types (load immediate + shift)
- using the static key mechanism still does incur more overhead for the
  conditional
- and if we want to support the strange family-members like the D1,
  (and it seems we do want that) this would create more conditionals
  as we have to test for svpbmt, d1 and maybe future special cases,
  where alternatives-patching on the other hand simply replaces the
  relevant code with the appropriate variant.


Heiko


[0] https://elixir.bootlin.com/linux/latest/source/arch/riscv/Kconfig#L67



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
