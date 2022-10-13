Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A715C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 13:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYZup2rcRUEoQwAsW7kliB8+L3SvnUxUsV0lCEXBYQM=; b=XZHUimDd/CuB0r
	jqFHfS99i/r/ZIflDYj6j6xrtdKmMEBWBs0JUSX+aNyB+XgJ6564glI2BFHY1O3z4AuOu7VIOAB8Q
	FsfLoFhDD6V1yQ7jrKvV8B/y8LaNembOTkXKCXnN/ZsrfCmQU1tumlUfljJJVNfj+P4mV0EisewqJ
	74DO49qtGJbnR/NLU/9SaCgq/fOeEKEXxO18KOyIz6bvhp2DNMkawrplTz7bd6y79UA/S1m7uzvAq
	ff6T/11hcFaI4VC+kvILBCaHEbuy//CUBpjWL1FVt6hnXY1HbYBvrXcI/J9Tn9YkMsxfKHfq45V0e
	mgtTlP/XcKy+gG82z+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyYN-00Byha-52; Thu, 13 Oct 2022 13:47:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyGj-00BsSs-Ft
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 13:29:03 +0000
Received: from p508fd99e.dip0.t-ipconnect.de ([80.143.217.158] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oiyGf-0007JB-RH; Thu, 13 Oct 2022 15:28:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 4/8] riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA extensions
Date: Thu, 13 Oct 2022 15:28:57 +0200
Message-ID: <1991071.yIU609i1g2@phil>
In-Reply-To: <3185764.oiGErgHkdL@diego>
References: <20221006070818.3616-1-jszhang@kernel.org> <20221006070818.3616-5-jszhang@kernel.org> <3185764.oiGErgHkdL@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_062901_560716_A6FFCE69 
X-CRM114-Status: GOOD (  11.60  )
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

Am Freitag, 7. Oktober 2022, 13:54:31 CEST schrieb Heiko St=FCbner:
> Am Donnerstag, 6. Oktober 2022, 09:08:14 CEST schrieb Jisheng Zhang:
> > make the riscv_cpufeature_patch_func() scan all ISA extensions rather
> > than limited feature macros.
> > =

> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

[...]

> > @@ -127,7 +124,7 @@ asm volatile(ALTERNATIVE_2(						\
> >  	"add a0, a0, %0\n\t"						\
> >  	"2:\n\t"							\
> >  	"bltu a0, %2, 3b\n\t"						\
> > -	"nop", 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,		\
> > +	"nop", 0, RISCV_ISA_EXT_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,	\
> =

> hmm, would it make sense to also at the same time extend the errata_id
> in the alternatives struct to unsigned long?
> =

> Right now it's a unsigned int, and we're already at bit30 with the curren=
t extensions.
> =

> Otherwise the idea is pretty neat of allowing easy handling for all exten=
sions
> =

> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

I think I might need to take that back ... with this change each
cpufeature is tightly coupled to real extension ids, but what about
cpufeatures that do not match directly to an extension?

I.e. ZICBOM + fast-unaligned-access [0] (coming from a dt-property)
or only viable with extension 1+2+3?


Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit=
/?h=3Driscv-hwprobe&id=3D9be297f7ed349945cccc85f8df9d90e5ab68c1d9



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
