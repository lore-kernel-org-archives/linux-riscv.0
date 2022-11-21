Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D6CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 22:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPS7gzdaRTUVcTU4Skt4M8dHj7OxrK+XivpBLYo0zeU=; b=cBYJLYsPNXa1o/
	NbjCKgMsFYS/aAiDfKqHpdCSEkZx+DveDIlVmCGkeYP9OfXefdDk406mLHaIPA7qk8iJxd1ur4D9j
	UOXVcP+gUQWFA6m+Q2tQl1OJMptzLjCFfYAFtHMVGviWe5ETRZnQCg626OkXvxiDVRRDWiA33Pmd4
	wytwY7+qkuAHrYnC/HH4aPa1Vcph36s2EniIY7KtF7sC5mfFy47lfPQkKd5fka4w7/wG75B4OxCCO
	MI3SG9KyvQEfISMGUly57wOSZSUueIhpeS12UdtBOgpNzQZy6HKZag90jsYhBH4WwHZ26/FP06CJL
	oB+8adWPdO/oMg7wBhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxFR7-000qD3-Md; Mon, 21 Nov 2022 22:38:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxFR4-000qCJ-Vy
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 22:38:44 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oxFR3-0004su-4j; Mon, 21 Nov 2022 23:38:41 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
Date: Mon, 21 Nov 2022 23:38:40 +0100
Message-ID: <4163934.aeNJFYEL58@diego>
In-Reply-To: <14108757.uLZWGnKmhe@diego>
References: <20221110164924.529386-1-heiko@sntech.de> <CA+V-a8sqEjLKdGm67Sm5YbYUVRuntAM0Wqw_Gk+V6i9x+b1Exg@mail.gmail.com> <14108757.uLZWGnKmhe@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_143843_044522_438FE82A 
X-CRM114-Status: GOOD (  25.53  )
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

Am Montag, 21. November 2022, 23:17:11 CET schrieb Heiko St=FCbner:
> Am Montag, 21. November 2022, 22:31:36 CET schrieb Lad, Prabhakar:
> > Some more information,
> > =

> > - If I drop the riscv_alternative_fix_auipc_jalr() call after
> > patch_text_nosync() and then print the alt->old_ptr instructions
> > before patching I can see the instructions as 0x13 (nop) which is
> > correct.
> > =

> > - if I call riscv_alternative_fix_auipc_jalr() call after
> > patch_text_nosync() and then print the alt->old_ptr instructions
> > before patching I dont see 0x13 (nop) consistently for old
> > instructions.
> =

> which is to be expected I guess.
> =

> alt->old_ptr points to the memory location where the live kernel code
> lives.
> =

> I.e. the code at this location is the thing the kernel actually runs.
> The code at this location then gets overwritten by the alternative
> assembly.
> =

> =

> > - If I replace the nop's in the old instructions with my assembly code
> > of rz/five cmo and then just use patch_text_nosync() I can see the
> > correct actual instruction being printed apart from jalr (is some sort
> > of offset added to it as I see last 4 bits match?) and then is
> > replaced correctly by the same alt instructions apart from the jalr
> > (log [0]).
> > =

> > - If I replace the nop's in the old instructions with my assembly code
> > of rz/five cmo and then use patch_text_nosync() and
> > riscv_alternative_fix_auipc_jalr() I can see the actual old
> > instructions differs a bit and again the jalr instruction differs too
> > in the patched code (log [1]).
> > =

> > [0] https://paste.debian.net/1261412/
> > [1] https://paste.debian.net/1261413/
> > =

> > Attached is the objump of dma-noncoherent.o for reference.
> =

> I did read that objdumps are not really conclusive when looking
> at auipc + jalr instructions, hence the printing of the actual instructio=
ns.
> =

> As either manually or with a helper like
> =

> 	https://luplab.gitlab.io/rvcodecjs/#q=3D0xf4c080e7
> =

> you can then decode the actual instruction and compare.
> =

> In your log the two jalr instructions decode to different offsets,
> 	jalr x1, x1, -180
> vs
> 	jalr x1, x1, -834
> =

> Can you check what the patch_offset value is in your case?
> =

> Interestingly the
> 	auipc x1, 0
> is 0 for both cases.
> =

> I'll try to build a real test-setup mimicing what you're doing
> tomorrow (european tomorrow).

also, is it possible for you to put your code on some github
or so? Sometimes looking at the actual code makes things
a lot easier :-)

Thanks
Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
