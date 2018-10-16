Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AFDC04EBD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 13:30:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D697420869
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 13:30:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eq5qe7dN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D697420869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4OkCSCHd+Q+RoUNnEbxjffZXdJgMEhFEzTsTipx0fY=; b=eq5qe7dNeWEJmj
	Sx6EhxwIKxXyWKNHjAvvGwg52VnY0IMD/2BIttcyVqHUUqkp+WuescwWsiCeVQlDAbtm2wmhKZF1O
	FLycryjRAHuRM5uW4MzOFSDHLmjpIELllDwrO6Tc0lj3LdcpKQX7kGSoMH9/1zlvTdWth1/ywiSnj
	r7KMUyFdzLhOUs7b4Ue28YDo7xH1E0GNe/n2ZAYbdu9EE+0J7mrzFN50MFhbCjzMMEbXYG+US2cy7
	8ZTq5dofQZ9otwQcaJSHb9lxBLNQhrgilqrl1pytPLaRysGAGVb9k1Pf39VnoMBVswUyn7dnduium
	t1yaHZz6grmqu9eT4z/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCPQv-0008PT-Q1; Tue, 16 Oct 2018 13:30:49 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCPQn-0008Ny-VN
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 13:30:48 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 19FDAC058CA0;
 Tue, 16 Oct 2018 13:30:31 +0000 (UTC)
Received: from localhost (ovpn-116-47.ams2.redhat.com [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E295106A7A6;
 Tue, 16 Oct 2018 13:30:30 +0000 (UTC)
Date: Tue, 16 Oct 2018 14:30:29 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Pintu Kumar <pintu.ping@gmail.com>
Subject: Re: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for
 vda device
Message-ID: <20181016133029.GY27120@redhat.com>
References: <20181015211451.GC31130@redhat.com>
 <mhng-2be13863-3f80-432c-9945-2770e7e7e4b4@palmer-si-x1c4>
 <CAOuPNLiR+BLUno8sYjwLwW1BqJbBrH-suBiHEx1-dtMO906Ung@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOuPNLiR+BLUno8sYjwLwW1BqJbBrH-suBiHEx1-dtMO906Ung@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 16 Oct 2018 13:30:31 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_063042_030928_A6FDAC4A 
X-CRM114-Status: GOOD (  19.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com, sw-dev@groups.riscv.org,
 Michael Clark <michaeljclark@mac.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016133029.OPhnnJtO0QXP5YOyeIz6cw_UL7OyUTbSQ0nFttISChk@z>

On Tue, Oct 16, 2018 at 06:42:11PM +0530, Pintu Kumar wrote:
> On Tue, Oct 16, 2018 at 6:10 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >
> > On Mon, 15 Oct 2018 14:14:51 PDT (-0700), rjones@redhat.com wrote:
> 
> > >
> > >> > virtio_blk: probe of virtio0 failed with error -22
> > >
> > > ... I saw this exact error when I was using the upstream kernel
> > > instead of the one which supported interrupt handling.  Interrupt
> > > handling for RISC-V was added upstream after 4.18 so wouldn't be
> > > included in upstream 4.18.0-rc6.
> >
> > Your best bet today is to run 4.19-rc8, which should be pretty stable.
> 
> Yes, I checked with mainline linux-kernel 4.19.
> Now I am able to boot successfully and login into qemu-riscv shell.
> Thank you so much :)
> 
> But I am curious to know what changes resulted into this fix, in 4.19 kernel ?
> Which is the exact patch in mainline, that fixes this issue?

It'll be one of the interrupt or irqchip patches here:

  https://github.com/riscv/riscv-linux/commits/riscv-linux-4.18

You should follow Palmer's advice and use the kernel he recommends
rather than trying to cherry pick patches.

Rich.

> Because at times during the development, it will be difficult to
> simply upgrade the kernel version.
> So, I wanted to stick to 4.18 itself, however I can back port the
> patches from 4.19 to fix the issue.
> So, if you can point me to the exact patch, it will be of great help.
> 
> Thanks,
> Pintu

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
