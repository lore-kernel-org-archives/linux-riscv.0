Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EDDCF256A
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 03:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZuY1QxLKs1cv5wOuFG67ySzgp64POHkCTkGMIr+i7U=; b=Rjm4pq1+bw1F9MRlvxjSFx9CxE
	Kp6F0y10uI4VQAn/9Wq4NgUvkbJzPYRUQSvLT9GIE2GxUZvEVHWU3nq495U1EpIZvr6K3CTqtjpl7
	xQp5XJRTakG3DIS1dCnMClxXhCJQRbOj33FhpmGmBl6Iun0sKpZkjJJ9JIowDyhaKG4jdkcjcai6H
	eo6jwIfU7QYMsc/LNBq9TF9m9PWwISZ+aM2mm7nyXtq3mp8Pgp+o5iTPBDR4Wl06jwFCJrZwBWixR
	+IEKR4eBldqSDVtDjsNnRcxhE1ZLV3fNNFCkXZKv54Gt5BcOkeWJVDIBXMHWNmxZS+CDKDxU4BTh0
	bwksNQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYq2-00000001SrZ-2g50;
	Wed, 19 Nov 2025 03:26:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYq2-00000001SrT-183O
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 03:26:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C9FC600CB;
	Wed, 19 Nov 2025 03:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920D0C4AF0B;
	Wed, 19 Nov 2025 03:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763522789;
	bh=pGZoYPt+AqOEsg3KTIoYh0D9ik85ynYptIVwes91HiA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PKOiG43mXLxudw37IjACH8vvVbUjwJQdyXw8oKk0V6OZ3mDW8GJgr8ujuW34KrMf8
	 XsvN7FQEknveTpvD/6msZh9XaKjcUhvfRh28N2H6wEfUCoy7qwvHKR2VFsQ9l6kFvk
	 Facum8eib5Yp5vmGJI1Yua2FLBnvzypdR/u022dl3ZXZXes/lu5RfiWVF3LmOFSKfO
	 UNRNLJ/wgQlVe8uvhqk4t0jBnvaQwrEO1p8PdrJQtscIDE2VODkxIRySJjxmF8P3eK
	 MfXQMlHCdeMQZC2HRFnh+FtL3DhR5IiVcEw0tNG3PJFPc3WMPpMzcaUUTKcFfPJXAd
	 AwE4O9+lGpYQw==
Date: Tue, 18 Nov 2025 20:26:27 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
cc: "conor.dooley@microchip.com" <conor.dooley@microchip.com>, 
    Djordje Todorovic <Djordje.Todorovic@htecgroup.com>, 
    "alex@ghiti.fr" <alex@ghiti.fr>, 
    "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
    "cfu@wavecomp.com" <cfu@wavecomp.com>, 
    "conor@kernel.org" <conor@kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
    "palmer@dabbelt.com" <palmer@dabbelt.com>, 
    "pjw@kernel.org" <pjw@kernel.org>
Subject: Re: [PATCH] riscv: Update MIPS vendor id to 0x127.
In-Reply-To: <bb3a2237-6dde-4231-a016-faf190f9a877@htecgroup.com>
Message-ID: <cfa1cbf8-da6c-3ad1-e8d8-1a11ae5619a2@kernel.org>
References: <20251104-iciness-ranting-29dd93fe6a7e@wendy> <bb3a2237-6dde-4231-a016-faf190f9a877@htecgroup.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-769436388-1763522789=:937999"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-769436388-1763522789=:937999
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 4 Nov 2025, Aleksa Paunovic wrote:

> On 11/4/25 14:18, Conor Dooley wrote:
> 
> > On Tue, Nov 04, 2025 at 11:53:49AM +0000, Aleksa Paunovic wrote:
> >
> >>>> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
> >>>> index 3b09874d7a6dfb8f8aa45b0be41c20711d539e78..55205f7938055ba2b744dba5118bba935bcac008 100644
> >>>> --- a/arch/riscv/include/asm/vendorid_list.h
> >>>> +++ b/arch/riscv/include/asm/vendorid_list.h
> >>>> @@ -9,6 +9,6 @@
> >>>>  #define MICROCHIP_VENDOR_ID	0x029
> >>>>  #define SIFIVE_VENDOR_ID	0x489
> >>>>  #define THEAD_VENDOR_ID		0x5b7
> >>>> -#define MIPS_VENDOR_ID		0x722
> >>>> +#define MIPS_VENDOR_ID		0x127
> >>> How was this ever wrong? Do devices exist with this old ID? Do we need
> >>> to support both as vendor IDs for MIPS?
> >> I'm not sure how it first started, but since we worked on qemu as well, we never noticed any issues while testing. 
> >> It shouldn't cause any problems in the future though.
> > So all the hardware uses the 0x127 id? Where did 0x722 come from?
> > I recall qemu defaults to 0x0, so were none of the mips code paths
> > tested, or were they tested with a qemu modified to use 0x722?
> 
> 
> That is correct, all hardware uses the 0x127 id. 
> 
> I'm not sure where we got 0x722 from - perhaps I or someone else misread the value 
> 
> (0x27 and 0x2 are both mentioned in the Programmer's Guide mvendorid bit descriptions).
> 
> 
> Everything was tested with qemu modified to use 0x722. Please see [1], for example.
> 
> 
> [1] https://patchew.org/QEMU/20250717093833.402237-1-djordje.todorovic@htecgroup.com/20250717093833.402237-4-djordje.todorovic@htecgroup.com/

Something that would really help: when you post patches, please 
describe how they were tested.  Something like "Functionality tested on 
MIPS Boston with a P8700 bitstream" or "Boot-tested on upstream QEMU 
vx.y.z" or whatever.  This should go either in the series cover letter or 
below the line in the patch description.  At least then we know if the 
testing was done on something that's likely to resemble the final 
hardware product.

This goes for everyone else on the list, too, by the way.  Some people are 
really good about doing this.  For those of you who have been doing this 
already, please keep up the great work.


- Paul
--8323329-769436388-1763522789=:937999
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-769436388-1763522789=:937999--

