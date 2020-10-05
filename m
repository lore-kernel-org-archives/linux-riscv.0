Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE32C4727D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 07:33:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8E81205F4
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 07:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jvFHxoe1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRppAU54"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8E81205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RgRCSXmAzNWHwF+ozqSTF1Kp6VQ6vV8OyM7Vvoj3sH4=; b=jvFHxoe1JngiakyaushTGfRK/
	AwnzWjADqKbJPjU1b9BZiMFxgUbhhgOWH3vmuXMqJ/+JJvoAiPM6pXpLSXX9CdYmpx+QdCvlGD6W2
	O/BPjSkXpoWitlDyFjMcF9a9WYyg6HNICoEtWJvoTB6R4uLPawcIkeEJfIpSuDyQCAmsdNb6Wty1H
	skO8pkBOvVXQOuZhHt6wTzd76cypUAlOE6fLVfebKBccvriwgbw5i8fvnHejGolQ6MsYHCHUQGr6g
	DXNA6ai0olgCHUNY1RzLWPH43dOL+AklygYnJQ5dBIpfgoi0YrwvRefIPRz/dmI4QuOWZA0W7T2mB
	K3lMZb4HA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPKzb-0008KP-1m; Mon, 05 Oct 2020 07:33:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPKzV-0008HI-Jg; Mon, 05 Oct 2020 07:33:02 +0000
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B3A2205F4;
 Mon,  5 Oct 2020 07:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601883179;
 bh=gu2e4JQFDSqeZWow6iyo4Sn010Xx6I+yVapiH4qL/Pg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rRppAU54V8DEObp+MMdOt/Qh6/tYptGxCZD0d0JUBUsgfjFRXBYR9T5DRxj3l7S37
 MwsFewTjq6L/jeLT6JBFXNLQs8oMquIF/iKYT0EyoFb76l/4ucdWZqUZpBV5Z1a8sh
 78sT/k94nxu5ViB56a1MsSarM7FzjYQx1SkG4Vb4=
Date: Mon, 5 Oct 2020 10:32:42 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: Re: [PATCH] man2: new page describing memfd_secret() system call
Message-ID: <20201005073242.GA4251@kernel.org>
References: <20200924133513.1589-1-rppt@kernel.org>
 <efb6d051-2104-af26-bfb0-995f4716feb2@gmail.com>
 <94cf1b3a-e191-a896-a27d-cd7649cb2c59@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94cf1b3a-e191-a896-a27d-cd7649cb2c59@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_033301_710648_993368B9 
X-CRM114-Status: GOOD (  15.03  )
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
Cc: mark.rutland@arm.com, linux-man@vger.kernel.org, tglx@linutronix.de,
 david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, linux-mm@kvack.org, will@kernel.org,
 linux-kselftest@vger.kernel.org, hpa@zytor.com, cl@linux.com,
 idan.yaniv@ibm.com, linux-riscv@lists.infradead.org, elena.reshetova@intel.com,
 linux-arch@vger.kernel.org, tycho@tycho.ws, linux-nvdimm@lists.01.org,
 shuah@kernel.org, x86@kernel.org, willy@infradead.org, rppt@linux.ibm.com,
 mingo@redhat.com, mtk.manpages@gmail.com, arnd@arndb.de, jejb@linux.ibm.com,
 bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org,
 paul.walmsley@sifive.com, kirill@shutemov.name, dan.j.williams@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Alex,

On Sat, Oct 03, 2020 at 11:32:43AM +0200, Alejandro Colomar wrote:
> Hi Mike and Michael,

I'll add the note to the man page, thanks!

> Ping. :)
> =

> Thanks,
> =

> Alex
> =

> On 2020-09-24 16:55, Alejandro Colomar wrote:
> > * Mike Rapoport:
> >  > +.PP
> >  > +.IR Note :
> >  > +There is no glibc wrapper for this system call; see NOTES.
> > =

> > You added a reference to NOTES, but then in notes there is nothing about
> > it.=A0 I guess you wanted to add the following to NOTES (taken from
> > membarrier.2):
> > =

> > .PP
> > Glibc does not provide a wrapper for this system call; call it using
> > .BR syscall (2).
> > =

> > Cheers,
> > =

> > Alex

-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
