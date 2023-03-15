Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56218C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 06:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/RmoBHaTV/aEZjBff5Io9/J/7CgjENAj3DhapCaJHU=; b=CWMr/hl+vN0W38
	7aSPSuMC0NLvxlCXZmEsERhmiO0XAbJiQYZ+YHhFAeb/zosnZwEUTiG2Ckw+5zotGnZCfvdrdwqsk
	5RKkkyFfzoqUpseudwMW36QNDcH9lEQuUiMDNZqo5sZjjfqpKrvjQv1JqAPmBGbxKryMk/1vthVP4
	9/G/vV/6Ofh+KGJdbcBi7G8AzUui48QLbF41bKya8TTR3gK7l31YNvGdW8/oeRZoCUhXaqREIcglT
	XqDsIBvikR2u0MKRpXPrua4fkieEC8rrs5iI7qk9mkeTRCUbJCaY1wyTsCeNAJ9ItMMfcGv2zCbhW
	SFx/eFEoFTMADn3tdayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKfL-00CX7j-28;
	Wed, 15 Mar 2023 06:31:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKfH-00CX6z-32
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 06:31:13 +0000
Received: from ip4d1634a9.dynamic.kabel-deutschland.de ([77.22.52.169] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pcKfD-0006gF-TQ; Wed, 15 Mar 2023 07:31:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, samuel@sholland.org, guoren@kernel.org,
 christoph.muellner@vrull.eu, Conor Dooley <conor.dooley@microchip.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] RISC-V: T-Head vector handling
Date: Wed, 15 Mar 2023 07:31:05 +0100
Message-ID: <3344603.e9J7NaK4W3@phil>
In-Reply-To: <mhng-6d6a325c-4adb-4d9a-98a0-012c75b4562e@palmer-ri-x1c9a>
References: <mhng-6d6a325c-4adb-4d9a-98a0-012c75b4562e@palmer-ri-x1c9a>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_233111_997650_CFC66A61 
X-CRM114-Status: GOOD (  25.33  )
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

Hi Palmer,

Am Mittwoch, 15. M=E4rz 2023, 06:29:41 CET schrieb Palmer Dabbelt:
> On Tue, 28 Feb 2023 13:54:33 PST (-0800), heiko@sntech.de wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> >
> > As is widely known the T-Head C9xx cores used for example in the
> > Allwinner D1 implement an older non-ratified variant of the vector spec.
> >
> > While userspace will probably have a lot more problems implementing
> > support for both, on the kernel side the needed changes are actually
> > somewhat small'ish and can be handled via alternatives somewhat nicely.
> >
> > With this patchset I could run the same userspace program (picked from
> > some riscv-vector-test repository) that does some vector additions on
> > both qemu and a d1-nezha board. On both platforms it ran sucessfully and
> > even produced the same results.
> >
> >
> > As can be seen in the todo list, there are 2 places where the changed
> > SR_VS location still needs to be handled in the next revision
> > (assembly + ALTERNATIVES + constants + probably stringify resulted in
> >  some grey hair so far already)
> >
> >
> > ToDo:
> > - follow along with the base vector patchset
> > - handle SR_VS access in _save_context and _secondary_start_sbi
> >
> >
> > Heiko Stuebner (2):
> >   RISC-V: define the elements of the VCSR vector CSR
> >   RISC-V: add T-Head vector errata handling
> >
> >  arch/riscv/Kconfig.erratas           |  13 +++
> >  arch/riscv/errata/thead/errata.c     |  32 ++++++
> >  arch/riscv/include/asm/csr.h         |  31 +++++-
> >  arch/riscv/include/asm/errata_list.h |  62 +++++++++++-
> >  arch/riscv/include/asm/vector.h      | 139 +++++++++++++++++++++++++--
> >  5 files changed, 261 insertions(+), 16 deletions(-)
> =

> I have no opposition to calling the T-Head vector stuff an errata =

> against V, the RISC-V folks have already made it quite apparent that =

> anything goes here.  I would like to get the standard V uABI sorted out =

> first, though, as there's still a lot of moving pieces there.

yeah, that's the reason the series is an RFC and is based on the main
vector series and I fully expect the main support to land first :-) .


> It's kind =

> of hard here as T-Head got thrown under the bus, but I'm not sure what =

> else to do about it.

Thankfully on the kernel-side the differences to implemeent both "at the
same time" are not that huge - userspace of course will need to figure
out their own solution.


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
