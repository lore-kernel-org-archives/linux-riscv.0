Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC7BC47077
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HjCdz2HRpwr3VeJCOZVv7KyVcd313EMFLqQ6MFL6FdQ=; b=ltujkFS25Bfy3S
	Rkk3oiZ2ahzPq57FSaEMRFAoiox64qV7RZ50bNrmqVhOkZ8ZzKrD/c1EyMyyV1W28roCwH9NF4CQ6
	GAnd6WeMLO7nudcdqwOYywRX8+x02wITlX/7VdT1NBIRJg/DV4m8NgYeVxghij4B3lC0QTmps6Du0
	Vu0oYi20ns3UCEQcqaFCyUOHIEaI4Vrs4vP3Y1B1l5VkWcI52Wt3GdMdl9FRL23aOuaavqsPSBUBP
	RJDIYJmFUrfZhEJ+033uHhi8suNvQmU+svs/P1zeW1sUjDRqFglQb/X1tpfZuTXXEY9hj1khlnkWB
	JxSSTAhbxIcnjGtBNoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2Lu-00B8WX-0o;
	Wed, 03 Jan 2024 14:36:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2Lq-00B8Uk-33
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 14:36:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0D196CE1410;
	Wed,  3 Jan 2024 14:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8961AC433C8;
	Wed,  3 Jan 2024 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704292564;
	bh=is7O5uMKlFnKVd3x+vpOi0jZoWskFl0wA4r7k43/gWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pj111nEWhbwtnIBXAmtPTKY07uMZLZalmcUisGEP01x91bzK1WMukhkXdmvcbLiz4
	 nzjuKfvPLvnFmmJnrLQ3u5SNnbNuN7NK7IuyAO7jqoF0a4BeqbHjaoYV14ky9gjX7u
	 AQMYN2St2mGoLuzjRd+80Ftvu2tbiJmi8zaOAteCnijOw/MGNC+tQiq1/XqiG9txGu
	 R1dqFESMQMMqdCT57+JD8QAZu4Xa5xXNj+LQwbw3REC5LQfR/1AaGwt0+F/MikT/nw
	 bzj0byS0nAt1ZtobKqk3F5og48OWQeWe5VrN+DFCETjFL6EO7F3nQiUlMw5X/4jtnA
	 qAzRUdUnPCWuQ==
Date: Wed, 3 Jan 2024 08:35:57 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	Jerry Shih <jerry.shih@sifive.com>, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Phoebe Chen <phoebe.chen@sifive.com>, hongrong.hsu@sifive.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [RFC PATCH 00/13] RISC-V crypto with reworked asm files
Message-ID: <20240103143557.GA773@quark.localdomain>
References: <20240102064743.220490-1-ebiggers@kernel.org>
 <CAMj1kXEAqxCZ_PNM9a=CyciSHUzDU_yqemKh51oncHyLbYUKtA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXEAqxCZ_PNM9a=CyciSHUzDU_yqemKh51oncHyLbYUKtA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_063611_384795_3162E7B9 
X-CRM114-Status: GOOD (  34.64  )
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

On Wed, Jan 03, 2024 at 03:00:29PM +0100, Ard Biesheuvel wrote:
> On Tue, 2 Jan 2024 at 07:50, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > As discussed previously, the proposed use of the so-called perlasm for
> > the RISC-V crypto assembly files makes them difficult to read, and these
> > files have some other issues such extensively duplicating source code
> > for the different AES key lengths and for the unrolled hash functions.
> > There is/was a desire to share code with OpenSSL, but many of the files
> > have already diverged significantly; also, for most of the algorithms
> > the source code can be quite short anyway, due to the native support for
> > them in the RISC-V vector crypto extensions combined with the way the
> > RISC-V vector extension naturally scales to arbitrary vector lengths.
> >
> > Since we're still waiting for prerequisite patches to be merged anyway,
> > we have a bit more time to get this cleaned up properly.  So I've had a
> > go at cleaning up the patchset to use standard .S files, with the code
> > duplication fixed.  I also made some tweaks to make the different
> > algorithms consistent with each other and with what exists in the kernel
> > already for other architectures, and tried to improve comments.
> >
> > The result is this series, which passes all tests and is about 2400
> > lines shorter than the latest version with the perlasm
> > (https://lore.kernel.org/linux-crypto/20231231152743.6304-1-jerry.shih@sifive.com/).
> > All the same functionality and general optimizations are still included,
> > except for some minor optimizations in XTS that I dropped since it's not
> > clear they are worth the complexity.  (Note that almost all users of XTS
> > in the kernel only use it with block-aligned messages, so it's not very
> > important to optimize the ciphertext stealing case.)
> >
> > I'd appreciate people's thoughts on this series.  Jerry, I hope I'm not
> > stepping on your toes too much here, but I think there are some big
> > improvements here.
> >
> 
> As I have indicated before, I fully agree with Eric here that avoiding
> perlasm is preferable: sharing code with OpenSSL is great if we can
> simply adopt the exact same code (and track OpenSSL as its upstream)
> but this never really worked that well for skciphers, due to API
> differences. (The SHA transforms can be reused a bit more easily)
> 
> I will also note that perlasm is not as useful for RISC-V as it is for
> other architectures: in OpenSSL, perlasm is also used to abstract
> differences in calling conventions between, e.g., x86_64 on Linux vs
> Windows, or to support building with outdated [proprietary]
> toolchains.
> 
> I do wonder if we could also use .req directives for register aliases
> instead of CPP defines? It shouldn't matter for working code, but the
> diagnostics tend to be a bit more useful if the aliases are visible to
> the assembler.

.req unfortunately isn't an option since it is specific to AArch64 and ARM
assembly.  So we have to use #defines like x86 does.  Ultimately, the effect is
about the same.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
