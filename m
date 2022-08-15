Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC3DC00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 17:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dG4NDlflcUge1Am1coPj5TvZjqUDqhp7cml8mJnQdI=; b=QvpP0P06TtAyo1
	T0mppI/Dhh65CsgUJ4Xqm1H0s6to2KI8x/DbegL4TQ2Vsv7EBz0Zj8zLa6dbuMzk4Qz78SxAIr/6R
	5UPsBUgrL3B4MQxOfifFbJ0OXzVD5/zBwa8OGm+ZJzSP6lGRSz30D6FFB92te/63RmsCFLr4MmF7k
	An2/vI/+NAUDBhfjYyJPrG2tMTdMlHsGO6yhLqH6Xn5lbnfIH7EPcXVb02sEQDMCrNUFBNbkKxxNl
	Lwb1WthsRCzeOKY6un+oWrJfDlUpDnDELCSv1o7RcWoGLczFgsBDdn0d5D6A8rxo5QsCFIoCeCVrf
	qatabfXjMc5kBW8jGLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNdoY-002DRu-6f; Mon, 15 Aug 2022 17:23:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNd0N-001fo6-6I
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 16:31:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5CB0AB80FD4;
	Mon, 15 Aug 2022 16:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC6CC433C1;
	Mon, 15 Aug 2022 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660581112;
	bh=sH6QF9BlOX1Fn9qSqhJiL3CBY6+2Aw1phNyF9Zh0680=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XtQ7vSGavTna86t4uCLAHtyOlCF4ha3Owy7Fp8ZJupjg0q2eAFH2kDnNN3njO7FNJ
	 ZAwfhQnCJypBIy0vhFank2WDkmXHHUlJf9VGtH1AZ8wZZdE4hoA4Qqf3vRxXKV7DOU
	 pnFsAmABtT0XvcM2j2+mHvr4buGeMZzsScBKpF64nNrOt3Qj/4Q6baf2jvi5q0w1n+
	 zZoyPD6bAGuzhGKeN4jErtjKIORArfsrpYLIkzhHxsaNza5wONsDmo8IZsLqg12xVN
	 1xH8AGn+orl9o2q94EL7/igFAr44+BIpdJJQzxTG90wF87jqqV0CWD9X+by6UTqA5l
	 EyHfoKB6uI/tw==
Date: Mon, 15 Aug 2022 09:31:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor.Dooley@microchip.com
Cc: palmer@dabbelt.com, gregkh@linuxfoundation.org, re@w6rz.net,
	sashal@kernel.org, dimitri.ledkov@canonical.com,
	anup@brainfault.org, stable@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: Apply f2928e224d85e7cc139009ab17cefdfec2df5d11 to 5.15 and 5.10?
Message-ID: <Yvp09SBnS4md2Og0@Ryzen-9-3900X.>
References: <mhng-f5bbfb9c-755f-4abe-affd-5c40efd11105@palmer-ri-x1c9>
 <bfd07e0f-f8e3-a904-667c-f9a69ebbd405@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bfd07e0f-f8e3-a904-667c-f9a69ebbd405@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_093155_702161_FC4D418A 
X-CRM114-Status: GOOD (  25.85  )
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

On Fri, Aug 12, 2022 at 05:00:57PM +0000, Conor.Dooley@microchip.com wrote:
> On 12/08/2022 17:40, Palmer Dabbelt wrote:
> > On Fri, 12 Aug 2022 08:36:46 PDT (-0700), Greg KH wrote:
> >> On Thu, Aug 11, 2022 at 08:23:21PM -0700, Ron Economos wrote:
> >>> On 8/11/22 5:24 PM, Nathan Chancellor wrote:
> >>> > Hi all,
> >>> >
> >>> > Would it be reasonable to apply commit f2928e224d85 ("riscv: set de=
fault
> >>> > pm_power_off to NULL") to 5.10 and 5.15? I see the following issue =
when
> >>> > testing OpenSUSE's RISC-V configuration in QEMU and it is resolved =
with
> >>> > that change.
> >>> >
> >>> > Requesting system poweroff
> >>> > [=A0=A0=A0 4.497128][=A0 T177] reboot: Power down
> >>> > [=A0=A0 32.045207][=A0=A0=A0 C0] watchdog: BUG: soft lockup - CPU#0=
 stuck for 26s! [init:177]
> >>> > [=A0=A0 32.045785][=A0=A0=A0 C0] Modules linked in:
> >>> > [=A0=A0 32.046166][=A0=A0=A0 C0] CPU: 0 PID: 177 Comm: init Not tai=
nted 5.15.60-default #1 5b276f06901b1c37142db73337a1816290810c90
> >>> > [=A0=A0 32.046814][=A0=A0=A0 C0] Hardware name: riscv-virtio,qemu (=
DT)
> >>> > [=A0=A0 32.047256][=A0=A0=A0 C0] epc : default_power_off+0x1a/0x20
> >>> > [=A0=A0 32.047667][=A0=A0=A0 C0]=A0 ra : machine_power_off+0x22/0x2a
> >>> > [=A0=A0 32.047979][=A0=A0=A0 C0] epc : ffffffff80004a4a ra : ffffff=
ff80004abe sp : ffffffd000bc3d50
> >>> > [=A0=A0 32.048405][=A0=A0=A0 C0]=A0 gp : ffffffff81bec160 tp : ffff=
ffe002080000 t0 : ffffffff80490964
> >>> > [=A0=A0 32.048827][=A0=A0=A0 C0]=A0 t1 : 0720072007200720 t2 : 5020=
3a746f6f6265 s0 : ffffffd000bc3d60
> >>> > [=A0=A0 32.049245][=A0=A0=A0 C0]=A0 s1 : 000000004321fedc a0 : 0000=
000000000004 a1 : ffffffff81b073c8
> >>> > [=A0=A0 32.049676][=A0=A0=A0 C0]=A0 a2 : 0000000000000010 a3 : 0000=
0000000000ab a4 : e0b1d187e51c7400
> >>> > [=A0=A0 32.050115][=A0=A0=A0 C0]=A0 a5 : ffffffff80004a30 a6 : c000=
0000ffffdfff a7 : ffffffff804ea464
> >>> > [=A0=A0 32.050555][=A0=A0=A0 C0]=A0 s2 : 0000000000000000 s3 : ffff=
ffff81a20390 s4 : fffffffffee1dead
> >>> > [=A0=A0 32.051009][=A0=A0=A0 C0]=A0 s5 : ffffffff81bee0c8 s6 : 0000=
003feff55a70 s7 : 0000002acc09bf08
> >>> > [=A0=A0 32.051427][=A0=A0=A0 C0]=A0 s8 : 0000000000000001 s9 : 0000=
000000000000 s10: 0000002b0a4db6e0
> >>> > [=A0=A0 32.051849][=A0=A0=A0 C0]=A0 s11: 0000000000000000 t3 : ffff=
ffe001e2bf00 t4 : ffffffe001e2bf00
> >>> > [=A0=A0 32.052274][=A0=A0=A0 C0]=A0 t5 : ffffffe001e2b000 t6 : ffff=
ffd000bc3ac8
> >>> > [=A0=A0 32.052604][=A0=A0=A0 C0] status: 0000000000000120 badaddr: =
0000000000000000 cause: 8000000000000005
> >>> > qemu-system-riscv64: terminating on signal 15 from pid 2356237 (tim=
eout)
> >>> >
> >>> > I am not sure if there is any regression potential with that change,
> >>> > hence this email. That change applies cleanly to both trees and I d=
on't
> >>> > see any additional problems from it.
> >>> >
> >>> > Cheers,
> >>> > Nathan
> >>>
> >>> Should be fine. I apply this patch to all of my 5.15.x stable builds =
to
> >>> enable warm reboot on the HiFive Unmatched.
> >>>
> >>
> >> Now queued up, thanks.
> > =

> > Thanks, though on a sort of related note: are folks actually running
> > 5.10-based kernels on RISC-V?=A0 I generally don't worry too much about
> > trying to backport stuff that far.

I am merely doing basic QEMU boot tests, primarily to catch regressions
in LLVM. There have been times where I see crashes or failed assertions
in LLVM or boot problems in QEMU that are only visible when building the
stable trees versus mainline and -next so they tend to be useful for
that reason. I don't have any RISC-V hardware though; if I did, I'd be
running mainline, so I wouldn't worry much about backporting past 5.15
if that is what you do now. I can always request fixes such as this out
of band :)

> For this patch itself, I think the actual effect depends on what your
> SBI implementation does.

I am using tip-of-tree QEMU, which should have a fairly recent copy of
SBI, which likely explains why this patch resolves the issue.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
