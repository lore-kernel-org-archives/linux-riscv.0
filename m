Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02748C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 12:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTZZ76n9vX6shbw3MMihECVOfwnN92uVFirjazj04XY=; b=Bz2/SfPc+BEhZ5
	jYwtbE+Vf0e6/vs0aZzXTWd+VY1ehdkyVq1TgEFDLZM+L+h3VlCBOO8c2QAWX5fq6k1dDRS5a19YK
	PD+UgYZM3WVfKeSlcTrKexdSDGz5ze1mqVGYFdrenLxHCUa7DgwsxIqrIQ+rTOMngnsC82zFEZXJJ
	qjNSpbGbALUKZhvjzZ/w4+YqBibXU1TmqT9eAv0gt0gKo070/xJAdpCkXuTmsE1o24L1oJZ6896gc
	10nNYgiCTNwqiKAT2P4L3mY5uQYtGAzaLTnvVngFZMVGRVkFPkVMLUoO2e7ypLdJnkHHgfDFpx5zU
	5byINtaYLyYo55wslkhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyuip-00D2iB-7V; Wed, 08 Jun 2022 12:23:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyuil-00D2ge-Aj
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 12:23:36 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1nyuij-0006jK-8c; Wed, 08 Jun 2022 14:23:33 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@rivosinc.com>, Ron Economos <re@w6rz.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V Patches for the 5.19 Merge Window, Part 1
Date: Wed, 08 Jun 2022 14:23:32 +0200
Message-ID: <1767879.8hzESeGDPO@diego>
In-Reply-To: <06c46bde-5d3f-9123-93b4-9e0f3824ac3a@w6rz.net>
References: <mhng-3cfe92b5-a83a-4642-9b9e-8416ae717fd6@palmer-ri-x1c9> <827324415.0ifERbkFSE@diego> <06c46bde-5d3f-9123-93b4-9e0f3824ac3a@w6rz.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_052335_408272_12C29080 
X-CRM114-Status: GOOD (  29.71  )
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

Am Mittwoch, 8. Juni 2022, 02:12:47 CEST schrieb Ron Economos:
> On 6/7/22 4:36 PM, Heiko St=FCbner wrote:
> > Am Dienstag, 7. Juni 2022, 22:46:52 CEST schrieb Ron Economos:
> >> On 5/31/22 10:13 AM, Palmer Dabbelt wrote:
> >>> The following changes since commit 9282d0996936c5fbf877c0d096a3feb456=
c878ad:
> >>>
> >>>     csky: Move to generic ticket-spinlock (2022-05-11 11:50:15 -0700)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>     git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tag=
s/riscv-for-linus-5.19-mw0
> >>>
> >>> for you to fetch changes up to 7699f7aacf3ebfee51c670b6f796b2797f0f74=
87:
> >>>
> >>>     RISC-V: Prepare dropping week attribute from arch_kexec_apply_rel=
ocations[_add] (2022-05-30 16:04:37 -0700)
> >>>
> >>> ----------------------------------------------------------------
> >>> RISC-V Patches for the 5.19 Merge Window, Part 1
> >>>
> >>> * Support for the Svpbmt extension, which allows memory attributes to=
 be
> >>>     encoded in pages.
> >>>
> >>>
> >>> Heiko Stuebner (12):
> >>>         riscv: integrate alternatives better into the main architectu=
re
> >>>         riscv: allow different stages with alternatives
> >>>         riscv: implement module alternatives
> >>>         riscv: implement ALTERNATIVE_2 macro
> >>>         riscv: extend concatenated alternatives-lines to the same len=
gth
> >>>         riscv: prevent compressed instructions in alternatives
> >>>         riscv: move boot alternatives to after fill_hwcap
> >>>         riscv: Fix accessing pfn bits in PTEs for non-32bit variants
> >>>         riscv: add RISC-V Svpbmt extension support
> >>>         riscv: remove FIXMAP_PAGE_IO and fall back to its default val=
ue
> >>>         riscv: don't use global static vars to store alternative data
> >>>         riscv: add memory-type errata for T-Head
> >>>
> >> An issue was found on the HiFive Unmatched with the 5.19-rc1 kernel. T=
he
> >> following warning occurs during boot:
> >>
> >> riscv64 kernel:
> >> ----------------------------------------------------------------
> >> riscv64 kernel: WARNING: Missing the following errata may cause
> >> potential issues
> >> riscv64 kernel:         SiFive Errata[0]:cip-453
> >> riscv64 kernel:         SiFive Errata[1]:cip-1200
> >> riscv64 kernel: Please enable the corresponding Kconfig to apply them
> >> riscv64 kernel:
> >> ----------------------------------------------------------------
> >>
> >> I've manually bisected the problem to this commit:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3Dff689fd21cb13098305bae3f8d0c0065df2e2fc1
> > hmm, on first glance I can't really see how that specific commit would
> > affect Sifive erratas. Patches directly before this one did change
> > alternative / errata things though.
> >
> > (1) From looking at your output, it seems at least CONFIG_ERRATA_SIFIVE
> > is enabled as the general sifive errata code is running, but are the
> > individual erratas also still enabled in your config?
> > They're default=3Dy forever and weren't touched by the svpbmt series,
> > but it'd be nice to know how the config looks, to see if the Kconfig
> > settings are strange somewhere
> >
> >
> > (2) Going from the list on
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/=
?h=3Dff689fd21cb13098305bae3f8d0c0065df2e2fc1
> >
> > could you maybe check if it's really working with the parent of the
> > commit you found. (i.e. patches before the svpbmt addition).
> >
> > Also just to be sure, it still works correctly with 5.18, right?
> >
> >
> > Thanks
> > Heiko
> >
> >
> Yes, that commit was surprising. I also thought it would have been one =

> of the previous "alternatives" commits. But I tested them all, and the =

> warning only appears with the "add RISC-V Svpbmt extension support" =

> commit. In other words, "git checkout 100631b" works fine, but "git =

> checkout ff689fd" does not.

after talking with Ron a bit more, we came across the finding that the
warnings actually happen later in the boot process, pointing to modules.

Which lead me to [0] for explanation of the issue and a possible fix.


[0] https://lore.kernel.org/r/20220608120849.1695191-1-heiko@sntech.de/





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
