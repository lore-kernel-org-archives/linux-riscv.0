Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33ADC04AA5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 21:15:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A289A2089E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 21:15:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pMvoquW4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A289A2089E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PN2pnX7KVws1z3hF7qlS7LF4ilH2LbsnzoC/QwP2dCM=; b=pMvoquW4NhjNdN
	8n6apBFjPpPcWIooGD3mMmz4WvEn1cIgJE2vNfkxggwcUjYw1K/y8n8F+6kQlxn6LQw8Czc4DkErf
	0SfBTg/PZ3+q3oonnqXFc6Gr8xQ52qV9h7YQxkxX0Hx0QrRS+u4oQ0JgYD71wvviAXs0DDDsToS3C
	ltrrpI3xEirocGpcAVZ0fcrs2QQ2AmUZOBr1RKctRCVMWQz42PtIkEPZfE7nbxfqZXgfq3cvPQAZX
	3BaZTdt4LeMZ7x/2lnM/KUpxysxbVML7snbrw5d6Mke+UjsG/ew5tJx8AhUD5+/A/3mx8KAVnK/wK
	OE7oCD+kwLMgvT8vQZvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCACg-0006T7-Fz; Mon, 15 Oct 2018 21:15:06 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCACd-0006H4-Q1
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 21:15:05 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BB26F753D8;
 Mon, 15 Oct 2018 21:14:52 +0000 (UTC)
Received: from localhost (ovpn-116-47.ams2.redhat.com [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4009917A63;
 Mon, 15 Oct 2018 21:14:52 +0000 (UTC)
Date: Mon, 15 Oct 2018 22:14:51 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Michael Clark <michaeljclark@mac.com>
Subject: Re: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for
 vda device
Message-ID: <20181015211451.GC31130@redhat.com>
References: <CAOuPNLgimMwWrw6oXs7Eu8xBG+geOt53D_LjiiNk7=OEtLtz3g@mail.gmail.com>
 <0D61A5C7-23B7-466E-BE00-458675DE4FF7@mac.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0D61A5C7-23B7-466E-BE00-458675DE4FF7@mac.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 15 Oct 2018 21:14:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_141503_913580_31D13D28 
X-CRM114-Status: GOOD (  18.66  )
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
Cc: linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org,
 Pintu Kumar <pintu.ping@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015211451.TJrng6s8i2g5zKkIS9FhzB9V_Eiyc66lBigTCdPlNvU@z>

On Tue, Oct 16, 2018 at 09:26:20AM +1300, 'Michael Clark' via RISC-V SW Dev wrote:
> Dropping isa-dev, adding sw-dev
> 
> > On 16/10/2018, at 3:00 AM, Pintu Kumar <pintu.ping@gmail.com> wrote:
> > 
> > Hi,
> > I am trying to setup riscv-qemu booting on a new Ubuntu PC.
> > I dont want to use freedom-u-sdk, so I am preparing my own environment.
> > I could able to build the following:
> > - riscv-toolchain
> > - riscv-linux
> > - riscv-qemu
> > - riscv-pk
> > - busybear
> > 
> > After that, I am trying to boot riscv-qemu, using the following command:
> > # sudo qemu-system-riscv64 -nographic -machine virt -kernel
> > PK/riscv-pk/build/bbl -append "root=/dev/vda ro console=ttyS0" -drive
> > file=busybear.bin,format=raw,id=hd0 -device
> > virtio-blk-device,drive=hd0
> 
> Note: sudo is not required. sudo is used in the busybear start-qemu.sh script as it uses bridged networking. The latest version of busybear points at linux-4.19-rc5 so the issue may have been fixed.
> 
> > But, I am getting kernel panic.
> > 
> > ---------
> > bbl loader
> > ....
> > Linux version 4.18.0-rc6...

It's a bit of a guess, but could this be the upstream kernel?  The
latest riscv-linux is 4.18.0 (not -rc6).

The reason I say it might be the upstream kernel is because ...

> > virtio_blk: probe of virtio0 failed with error -22

... I saw this exact error when I was using the upstream kernel
instead of the one which supported interrupt handling.  Interrupt
handling for RISC-V was added upstream after 4.18 so wouldn't be
included in upstream 4.18.0-rc6.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
