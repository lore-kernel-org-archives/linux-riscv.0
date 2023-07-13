Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE062C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 17:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DhAkXrU2Xe/AZ/qTjLzf6fmE58RfhgGo/cLg0YN7Xw=; b=R4L2ispPpqOTJK
	K4QkcGdcZtJ4vAOWFdnExycyClsvUyWh4LXH+WPRw5GIrNt8L5FrJ33DxT0xWPfaNNsMMmRVB4KFd
	vdYI5KwqJneIPfNqcmXhPFwYihLlDqNNTQzD/jNKv2PKavlf7B54ykEsvJgwZ12YVkIYYRn83mMO+
	VdAt4LH3TXhbeigF8YZgm7xsVnWZM5pdee/IIKFfbzEOjChSmX8A2jsqBkJ323Yrr1OfZZzZu/HEt
	uIhsX27CVt9z5kTbqPkfq7Jywo0kn8t5qNwjA1Iy/VGsk+aqV95AfSF10/nFRBm8By1fyEG4dITpi
	F3SaIroFY6lQMl6fNM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK02w-0042nR-2Z;
	Thu, 13 Jul 2023 17:24:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK02t-0042mX-2M
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 17:24:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0ABE161AD7;
	Thu, 13 Jul 2023 17:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243C9C433C8;
	Thu, 13 Jul 2023 17:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689269042;
	bh=/4im4ZxY1eq6/IcI6UPLD3DBbKq6QVOzwqNUur0HgIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otAADWGp4ybJt8/I/hJ1snCvyNZFAOkMY9/J0mwGcgfxHWM8cs+7FUFCdKjzAtWo1
	 wxVY0D68tg53hguxfPsOEp2L6q61PC8m/zH3G4iDzMK4t3yuwcgbNS1IJyA96i3Gkg
	 b0rQrBlUSVa0lWU5QAeN3F+YkV3tvbD1HhjfAWgFZKoyC0RydWvq0FWiQaMYP4mqGi
	 D/F4rwuoBQ0zQWXnocfQJ66c90WbBVi+Sue9wztAh/S+SrvgTdEsk94OPOBXw3yhkg
	 oY0J+92yVFWFTj3t19U0+14pqZMLxrB89xmgRyvq+gwhB9uY3SyHIx5QwoOoRKtF7K
	 G2OuEgq/FrSDw==
Date: Fri, 14 Jul 2023 01:12:32 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, guoren@kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
Message-ID: <ZLAwgLNyTiK7jbwM@xhacker>
References: <ZLAoIWX+qqWvucWz@xhacker>
 <mhng-40ca9d23-1074-4f5b-8ccd-e7e919f68928@palmer-ri-x1c9a>
 <20230713-chive-undesired-269a54eb53db@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230713-chive-undesired-269a54eb53db@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_102403_851304_9D3DC11F 
X-CRM114-Status: GOOD (  58.67  )
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

On Thu, Jul 13, 2023 at 06:04:22PM +0100, Conor Dooley wrote:
> Jumping on top of Palmer's reply cos I had already started replying...
> 
> On Thu, Jul 13, 2023 at 09:56:34AM -0700, Palmer Dabbelt wrote:
> > On Thu, 13 Jul 2023 09:36:49 PDT (-0700), jszhang@kernel.org wrote:
> > > On Wed, Jul 12, 2023 at 06:48:02PM +0100, Conor Dooley wrote:
> > > > From: Palmer Dabbelt <palmer@rivosinc.com>
> > > > 
> > > > The last merge window contained both V support and the deprecation of
> > > > the riscv,isa DT property, with the V implementation reading riscv,isa
> > > > to determine the presence of the V extension.  At the time that was the
> > > > only way to do it, but there's a lot of ambiguity around V in ISA
> > > > strings.  In particular, there is a lot of firmware in the wild that
> > > > uses "v" in the riscv,isa DT property to communicate support for the
> > > > 0.7.1 version of the Vector specification implemented by T-Head CPU
> > > > cores.
> > > 
> > > Add Guo
> > > 
> > > Hi Conor, Palmer,
> > > 
> > > FWICT, new T-HEAD's riscv cores such as C908 support standard RVV-1.0,
> > > this patch looks like a big hammer for T-HEAD. I do understand why
> > 
> > Ya, it's a big hammer.  There's no extant systems with the C908, though, and
> > given that the C906 and C910 alias marchid/mimplid it's kind of hard to
> > trust any of those values for T-Head systems.  We could check for the 0s and
> > hope T-Head starts setting something else, but I'm not sure that's a net win
> > (we've also got the C920 in the Sophgo chip, which IIUC is V-0.7.1 too).
> 
> (In reply to Jisheng mostly)
> It is most definitely a big hammer. And yes, we did talk about the c908
> & its standard implementation of vector before submitting this. Unless
> Guo can confirm that the c908 (and later CPU cores) will start setting
> mimpid & mvendorid, I don't really see what the alternatives are? *

In mainline kernel, three SoCs which powered by T-HEAD cpu are
supported: D1, D1s and TH1520, they don't contain the "v" in riscv,isa
dt property.

> Whacking in a list of DT compatibles to blacklist? That doesn't seem
> like something that would scale.
> Open to ideas on that front for sure, smaller hammers are always better!
> 
> @Palmer, from what I am told, the c920 does put zeros in those CSRs,
> so we are okay on that front.
> 
> * If they do do something other than 0s, the errata handling will need
>   an update anyway, so the big hammer could be revised in tandem...
> 
> > > this patch is provided, but can we mitigate the situation by carefully
> > > review the DTs? Per my understanding, dts is also part of linux kernel.
> > 
> > That would break compatibility with existing firmware.  It's certainly
> > something that has happened before, but we try to avoid it where possible.
> 
> (Mostly in reply to Jisheng again)
> Sure, some devicetrees are part of the kernel, but not all are - they may
> be passed up from U-Boot or OpenSBI etc & contain "v" in riscv,isa.

If so this looks like a bug of u-boot and opensbi.

PS: does u-boot/opensbi modify "riscv,isa" property dynamically? Or
there's below usage case:
mainline linux kernel + dtb which is built from u-boot/opensbi source
code rather than linux kernel.


> The intent of this patch (and Palmer's v1) is to make sure such systems
> do not tell the kernel they support the standard version of v, when they
> do not do so.
> 
> > In this case new T-Head systems that have standard V would just need to
> > provide the new DT properties instead of the ISA string property.  We've
> > deprecated the ISA string property already so that's what new systems should
> > be doing anyway, and given that this only applies to new systems it doesn't
> > seem like a big ask.
> 
> Aye, AFAIK there are no extant systems with a c908 outside of vendors?
> At least, from what searching I did I could not find a way to acquire
> one... If you read the patch, you will see that there is in fact a way
> out being provided & it is not a "no T-Head can never have vector"
> situation - just slightly earlier use of the new properties in the
> kernel than we perhaps intended.

This new properties look like a solution for T-HEAD vector support.
Guo may have comments.

Thank you.

> 
> Thanks,
> Conor.
> 
> > > > Rather than forcing use of the newly added interface that has strict
> > > > meanings for extensions to detect the presence of vector support, as
> > > > that would penalise those who have behaved, only ignore v in riscv,isa
> > > > on CPUs that report T-Head's vendor ID.
> > > > 
> > > > Fixes: dc6667a4e7e3 ("riscv: Extending cpufeature.c to detect V-extension")
> > > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > > Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > > Changes in v2:
> > > > - Use my version of the patch that touches hwcap and isainfo uniformly
> > > > - Don't penalise those who behaved
> > > > ---
> > > >  arch/riscv/kernel/cpufeature.c | 22 ++++++++++++++++++++++
> > > >  1 file changed, 22 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > > index bdcf460ea53d..05362715e1b7 100644
> > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > @@ -21,6 +21,7 @@
> > > >  #include <asm/hwcap.h>
> > > >  #include <asm/patch.h>
> > > >  #include <asm/processor.h>
> > > > +#include <asm/sbi.h>
> > > >  #include <asm/vector.h>
> > > > 
> > > >  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
> > > > @@ -334,6 +335,27 @@ void __init riscv_fill_hwcap(void)
> > > >  			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
> > > >  		}
> > > > 
> > > > +		/*
> > > > +		 * "V" in ISA strings is ambiguous in practice: it should mean
> > > > +		 * just the standard V-1.0 but vendors aren't well behaved.
> > > > +		 * Many vendors with T-Head CPU cores which implement the 0.7.1
> > > > +		 * version of the vector specification put "v" into their DTs
> > > > +		 * and no T-Head CPU cores with the standard version of vector
> > > > +		 * are in circulation yet.
> > > > +		 * Platforms with T-Head CPU cores that support the standard
> > > > +		 * version of vector must provide the explicit V property,
> > > > +		 * which is well defined.
> > > > +		 */
> > > > +		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID) {
> > > > +			if (of_property_match_string(node, "riscv,isa-extensions", "v") >= 0) {
> > > > +				this_hwcap |= isa2hwcap[RISCV_ISA_EXT_v];
> > > > +				set_bit(RISCV_ISA_EXT_v, isainfo->isa);
> > > > +			} else {
> > > > +				this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
> > > > +				clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
> > > > +			}
> > > > +		}
> > > > +
> > > >  		/*
> > > >  		 * All "okay" hart should have same isa. Set HWCAP based on
> > > >  		 * common capabilities of every "okay" hart, in case they don't
> > > > --
> > > > 2.39.2
> > > > 
> > > > 
> > > > _______________________________________________
> > > > linux-riscv mailing list
> > > > linux-riscv@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-riscv



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
