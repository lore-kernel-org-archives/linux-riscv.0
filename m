Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBBCC433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 21:50:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF97020709
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 21:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BvJVAkyc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="WJtB9Ub/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF97020709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ueda1Vw8BvQpKx/rX8Xddebx7UDUraFLYvXMKjXkLjQ=; b=BvJVAkycLVVEAKRt+0xseTd8Z
	eZxCSYGjQJfxHGi18B7mddrhMjAv2jddwDw1wGDDGpHV6g0H/npIzAjmY2/Ldj5KGDOZ7L0J1JT/u
	12K68GNl3RdS77t3wv37VW5fmO7N29pVdjRSvyJ3s0+HecwlRIYQF3kwFSub8SdwBg5tOSkiRibPQ
	iuBPHLi41ylAzPiDLcrwO+g32y313ymdwVBmuujA8LErDimcxlg3PAs4g3VeOtmHxRLNxIM6VZr3T
	seVi23wtUcvOzZ5tIc1urd3MS1aS3vQDa1V64mbolrUEBuZdx/3z31/SRP7FXRe7rav+1ph8gA/BH
	2UKK3dHxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyMd1-0004LW-JD; Wed, 22 Jul 2020 21:50:19 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyMcx-0004Kg-H8
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 21:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595454615; x=1626990615;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Pvr/AHhBAJnt0q4WgV4JSPyDWOlgbmXaN2zOCOaQUF8=;
 b=WJtB9Ub/QaoBbbkyBd+YVmGTkKcKpmJjj1HMDwaOeHVusTb12iIRJjit
 vQrOpzF+yds/l9+Y8LE0OOY8yLDuBfclp2F7w8kRzrREVZa7akeg8lltx
 kLtUvNHCnL0b+LmdI76FC8LdY8udmRITJfHLeQatit2jd9m37XXvzkgZ2
 71aBkGzun4eCjGtT4Y9D35PC+iBMBlC+gsGGwAC+vM7hUxD1AAZLDjH9s
 KbMPHBc0Ear2mGAGCpNmXNYIKwWz3uyPQXa5b1EZYzyHitISu2N4X3P6g
 lJPGaQZ3oVlkvMnATbHqluNeAd867GGhDmP7PMYHuo6+MhZWetB6RkEL9 w==;
IronPort-SDR: g+n+33VhA/bGqFYMUD0iO6AqYCmX7NHJFwgpqyZaPG/p5N8zf3TpRWRQihgJKA6RC68Jb03VfU
 k7cxnt33VBrrd9aLN1a5+q/Y8Mc522qtItHyzQi1QOn5h8c1P069Cln3q1lkIheC+h2sIj1unV
 5Im4+ct8kbFzmt/X4rOuLt5OAd6zJEwTXz5ODUKjhWyASccZo41eFqeol6VowgA4IBHA/VE8TC
 kUmvUDeGVBie4VHdIxb0Xsb8Jfm2sQ5FqWLq2qTsTpTnak0OCpCwhD+Ua5xwsfvDPtxmEdPc/F
 8F8=
X-IronPort-AV: E=Sophos;i="5.75,383,1589212800"; d="scan'208";a="143149585"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jul 2020 05:50:12 +0800
IronPort-SDR: 0ZJrMR0CGHmTRl2VdQ1oARqC5M83A5ocSviKWx+b+DcXK9c1zqyTPZpRumqTLQQqURWrfE/LtZ
 oPcDsFqqhcd5f8KaTlJzLJ0lI6uo9gvLs=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 14:38:28 -0700
IronPort-SDR: MtnPCLlnv0inRa1cAAHHJM8LKE/86dw9sKZ9IsYk3eE9HM8cWKf209pEOlTaLYNZIParPU2SYn
 rjQXblYLwLlg==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 14:50:11 -0700
Date: Wed, 22 Jul 2020 22:50:06 +0100 (BST)
From: "Maciej W. Rozycki" <macro@wdc.com>
To: =?UTF-8?Q?F=C4=81ng-ru=C3=AC_S=C3=B2ng?= <maskray@google.com>
Subject: Re: Upstream binutils commit a87e1817a435dab6c6c042f9306497c9f13d4236
 breaks building the RISC-V vDSO
In-Reply-To: <CAFP8O3Kf54SYBKMTQDhJ+UwTate7KDszSGG1MwPJc0kTFhqkWw@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2007222245550.24175@redsun52.ssa.fujisawa.hgst.com>
References: <20200612084350.GA1108986@ubuntu-n2-xlarge-x86>
 <CAFP8O3+ydp6y9V4N1-9igHDhVjxqqYUecAYa3fT21FBTWtNx+w@mail.gmail.com>
 <20200617024228.GA2330477@ubuntu-n2-xlarge-x86>
 <CAFP8O3Kf54SYBKMTQDhJ+UwTate7KDszSGG1MwPJc0kTFhqkWw@mail.gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_175015_803497_145558D8 
X-CRM114-Status: GOOD (  15.15  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Nick Clifton <nickc@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 16 Jun 2020, F?ng-ru? S?ng wrote:

> > > I suggested that GNU ld from 2.35 onwards disallows accepting ET_EXEC
> > > as input (https://sourceware.org/bugzilla/show_bug.cgi?id=26047 ). The
> > > error message is from the patch.
> > > Taking ET_EXEC files as input are usually errors.
> > >
> > > If we do need to take ET_EXEC as input, we can change e_type in the
> > > ELF header to make the file an ET_REL
> > >
> > > printf '\1' | dd of=${2} conv=notrunc bs=1 seek=16 status=none
> > > (See http://git.kernel.org/linus/90ceddcb495008ac8ba7a3dce297841efcd7d584 )
> >
> > Is there a convenient way to do this in a Makefile? The relevant rule
> > is:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/kernel/vdso/Makefile#n63
> >
> > I am not sure if that is strictly necessary, hence the initial email.
> >
> > Cheers,
> > Nathan
> 
> If I understand correctly,
> 
> $(obj)/vdso-dummy.o:
> ...
>         printf '\1' | dd of=$@ conv=notrunc bs=1 seek=16 status=none
> 
> should fix the issue. The change can be made along with the migration
> from $(CC) to $(LD). Hope an arch/riscv maintainer can do this.

 This is an LD bug in the fix for PR ld/26047, so let's not invent hacks 
to work it around.  I have filed PR ld/26288 and I'm currently verifying a 
fix along with a couple of test cases with the intent to have it all 
included with the upcoming binutils 2.35 release currently scheduled this 
coming Sat.

 Cf. <https://sourceware.org/bugzilla/show_bug.cgi?id=26288>.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
