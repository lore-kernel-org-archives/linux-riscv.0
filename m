Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562D6C88CB4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 15:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHWIuQ0EKKMTfgR8sx4r1zfCU6quTLazMXUtQsDLr6k=; b=OQUU6erX5A0FFd
	sdk4WRlOnf9Qys6RY0EN0053H8cbnSvUrYUqI5jI3k1E0Pkvdbm7i3PtciPzgvrYO1VVcOmhyduYN
	j6wESL68vDlrNv+3hyUKzEsquBO89sfTg5E2RVBjQIjDNG1Vu9RvtfhEXN/78t3uVE6Ztl++mabaq
	xVCwbPDVqTQSqoAG7ZRJafKMIY2LCgxXJHLgM+ci8BzZNS4ta912AS46sl8FqcUM7TkTAYZc0WrSE
	2EFle+en2Jjcq1XXcR04vqj74UKC+8J1nKbwWIh7Yp6Vvn2kiKODHpOqGXA+lSHchPSra8ss0fMpA
	Al/rkPHq8a43bq6oUuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8jiE-004XSn-2v;
	Mon, 12 Jun 2023 15:44:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8jiC-004XRr-0q
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 15:44:09 +0000
Received: from i53875b22.versanet.de ([83.135.91.34] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1q8ji9-0003ee-29; Mon, 12 Jun 2023 17:44:05 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: guoren@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, samuel@sholland.org,
 christoph.muellner@vrull.eu, Conor Dooley <conor.dooley@microchip.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] RISC-V: T-Head vector handling
Date: Mon, 12 Jun 2023 17:44:04 +0200
Message-ID: <2408420.NG923GbCHz@diego>
In-Reply-To: <mhng-ca852a2c-a1c7-4b14-a9a2-f2bd4541d6b7@palmer-ri-x1c9>
References: <mhng-ca852a2c-a1c7-4b14-a9a2-f2bd4541d6b7@palmer-ri-x1c9>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_084408_295372_46030CA6 
X-CRM114-Status: GOOD (  29.54  )
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

Am Montag, 12. Juni 2023, 17:29:49 CEST schrieb Palmer Dabbelt:
> On Tue, 14 Mar 2023 22:29:41 PDT (-0700), Palmer Dabbelt wrote:
> > On Tue, 28 Feb 2023 13:54:33 PST (-0800), heiko@sntech.de wrote:
> >> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> >>
> >> As is widely known the T-Head C9xx cores used for example in the
> >> Allwinner D1 implement an older non-ratified variant of the vector spec.
> >>
> >> While userspace will probably have a lot more problems implementing
> >> support for both, on the kernel side the needed changes are actually
> >> somewhat small'ish and can be handled via alternatives somewhat nicely.
> >>
> >> With this patchset I could run the same userspace program (picked from
> >> some riscv-vector-test repository) that does some vector additions on
> >> both qemu and a d1-nezha board. On both platforms it ran sucessfully and
> >> even produced the same results.
> >>
> >>
> >> As can be seen in the todo list, there are 2 places where the changed
> >> SR_VS location still needs to be handled in the next revision
> >> (assembly + ALTERNATIVES + constants + probably stringify resulted in
> >>  some grey hair so far already)
> >>
> >>
> >> ToDo:
> >> - follow along with the base vector patchset
> >> - handle SR_VS access in _save_context and _secondary_start_sbi
> >>
> >>
> >> Heiko Stuebner (2):
> >>   RISC-V: define the elements of the VCSR vector CSR
> >>   RISC-V: add T-Head vector errata handling
> >>
> >>  arch/riscv/Kconfig.erratas           |  13 +++
> >>  arch/riscv/errata/thead/errata.c     |  32 ++++++
> >>  arch/riscv/include/asm/csr.h         |  31 +++++-
> >>  arch/riscv/include/asm/errata_list.h |  62 +++++++++++-
> >>  arch/riscv/include/asm/vector.h      | 139 +++++++++++++++++++++++++--
> >>  5 files changed, 261 insertions(+), 16 deletions(-)
> >
> > I have no opposition to calling the T-Head vector stuff an errata
> > against V, the RISC-V folks have already made it quite apparent that
> > anything goes here.  I would like to get the standard V uABI sorted out
> > first, though, as there's still a lot of moving pieces there.  It's kind
> > of hard here as T-Head got thrown under the bus, but I'm not sure what
> > else to do about it.
> 
> The V-1.0 support has been merged, so I think we're good to go.  Does 
> someone mind re-spinning this against for-next so it lines up with all 
> the new user interfaces?

glad to hear that. I found the merge message now as well.
Somehow I was only Cc'ed on individual patches but not on the
cover-letter, so didn't realize the merge till now.

I'll try to re-spin and adapt to the changes since the initial submission.

Heiko


 I'll try to re-spin and adapt to the changes that
happened since the original submission.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
