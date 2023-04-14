Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1254DC77B70
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 04:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNVvzo7iNGcNrMrQKrwcNNSrZJMJrbyuK7XqUpbIfcw=; b=UWgqzMoYrmf5YF
	YPwmCinilT6aZIbis9M4LLNt5e1Emvn6tjcc6DkpXeTNrRQRVtlAaCpXQpC1AdTayDUUzUwET713W
	/uzl3jQIPvKxEJHVHfxWs/jS05YLKDBaguJI9A0ZG7jZXj4ZsHAr//to6+Xbl75C4Wo69w5uUbRzJ
	W/s8rVYxDuZiQjren9lkM3uctErkFSgbEkce+wQT2U+yPYJST/Pi3j+fTLPfiZagBBUFY6+Cjszx5
	2rUEPZgdL9TTtOlso0WBSsbK6g11tdWcJNvVa/PK89yF3xPOFonWXPOewUif3QrO4yFTnhBwTY9S3
	QpI0GNSeFCME6AgNa88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnBEM-008HWo-1l;
	Fri, 14 Apr 2023 04:40:14 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnBEI-008HWI-1D
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 04:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681447210; x=1712983210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J0V3d0FklsfCJi+UN9UxEYZSMux7pKCvze06tCtbiuU=;
  b=OSftNfHvR9pBv/SjydX5LKtB0wTQTNGgG3Y7FfBNjZ6iwna2rmVB60Sw
   zEdFmAfOFHM3Z0VS6oDUulyX/830wleZb4MJjS0j2ZsqWtR7Fo+bxPc43
   Ieynv0ijqHyAODKsHc3j0ComV5NrD5zXlHH8G8ahprzXWhmffG3z+HPfG
   4Gy00fcACkSpnu47X1MiINIxmfDT1RuAkvSIM3rdxINx7ewh33kJdf7eh
   klXjcHCcRtAJG7Lm4AHgAhkoj8tmRMj4DcJhmQTOb705XrAir9CuNgP9J
   VbUm9GHtbGi00diV4ujLEwH/rlIeCd8gbrPdfyPC8EFKIFdMkUe/ypZAi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="409579932"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="409579932"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 21:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="639952323"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="639952323"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 21:39:59 -0700
Date: Fri, 14 Apr 2023 12:40:38 +0000
From: Xu Yilun <yilun.xu@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-fpga@vger.kernel.org, conor@kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] fpga: add PolarFire SoC Auto Update support
Message-ID: <ZDlJxrybiWy3Mk4Y@yilunxu-OptiPlex-7050>
References: <20230331071823.956087-1-conor.dooley@microchip.com>
 <20230331071823.956087-7-conor.dooley@microchip.com>
 <ZClfjuLa/pRATwCp@yilunxu-OptiPlex-7050>
 <20230411-tinsmith-matchless-af5c7c41d23b@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230411-tinsmith-matchless-af5c7c41d23b@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_214010_943215_632FA762 
X-CRM114-Status: GOOD (  45.97  )
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

On 2023-04-11 at 12:51:34 +0100, Conor Dooley wrote:
> On Sun, Apr 02, 2023 at 06:57:18PM +0800, Xu Yilun wrote:
> > On 2023-03-31 at 08:18:22 +0100, Conor Dooley wrote:
> > > Add support for Auto Update reprogramming of the FPGA fabric on
> > > PolarFire SoC, using the fw_upload mechanism a la the
> > > intel-m10-bmc-sec-update driver.
> > 
> > I'm not an expert of MTD and have several concerns about the mtd
> > writing part:
> > 
> > - This seems a generic case that writing a file content into the
> >   driver restricted offset on mtd.
> 
> Right, writing at an offset is pretty generic.
> 
> > - Seems the firmware update interface could be created for mtd device,
> >   like the nvmem interface?
> 
> I'm not entirely sure what you mean by this one.
> Are you saying that there should be a generic way to do "firmware"
> uploads to mtd devices, based on some sort of structure defined in

Yes, I think if the firmware upload interface could be generic, then add
it to the mtd devices, rather than creating a "virtual mtd management"
device as this patch does.

> devicetree etc?
> And perhaps then, this driver would register as a consumer of that
> interface, pushing all of the direct mtd stuff out to that interface?
> 
> > - I assume the purpose of the fw upload interface is to protect
> >   unexpected writing from user. So how to protect the mtd be
> >   written by other user interfaces like mtdchar/block or nvmem?
> 
> I'm not very good with the security knobs so I don't have an answer for
> you here (yet). But your assumption about the rationale here is correct
> and I would like to block access.
> 
> > For other parts:
> > 
> > - directory block check, fw upload don't touch this block, so why check
> >   it in fw upload process.
> 
> I don't know what you mean. The mtd device could be empty and the
> directory would need to be populated with the image address etc.
> Or, it could previously have been used for something else, and then it
> would be required to reconfigure it correctly for Auto Upgrade.
> 
> Maybe I am misunderstanding you?

This directory block content is unrelated to the firmware image, so
could be written before firmware upload interface is created. The
firmware image uploading could be done without touching directory
blocks. That means directory blocks could be set by driver as
no-touch area for firmware uploading interface.

> 
> > 
> > - image verification, no matter pass or fail, fw upload is actually done,
> >   the flash is written and no way to rollback. So may remove from fw
> >   upload process.
> 
> The FPGA is flash based, so writing to the mtd device is not going to
> actually program the FPGA with this content. The original image/bitstream
> in the mtd device is either going to be a) equivalent to what is already
> programmed in the FPGA, b) not an upgrade over what is current in the
> FPGA, c) something that was uploaded since the last time the device was
> restarted.
> I don't think that overwriting any of those is problematic, as if the
> verification fails, the original bitstream will continue being used
> until an image that does actually pass is provided.
> 
> Without doing the verification though, there's no way to tell for certain
> if the FPGA is actually going to perform an upgrade to this new bitstream
> once it is restarted, so I think there is value in keeping this.

I don't mean to remove the support of verification from driver. I say
remove the verification from MTD firmware upload process. You can
use another interface in your driver to verify if FPGA could load the
content in user block at any time.

In my opinion, generic firmware upload interface for MTD could be used
out of FPGA cases, it just deals with writing the image file to the MTD.
Once you have nothing more to write for the image file, the job for the
interface could be successfully done.

> 
> If you're still very sceptical about whether this belongs in
> drivers/fpga, I can always dump it in drivers/soc instead I guess.

I actually don't think this belongs to FPGA domain. My pereference is a
generic MTD firmware upload interface for MTD domain.

But this is just my opinion. You may talk to MTD or SoC maintainers for
final solution.

Thanks,
Yilun

> 
> Cheers,
> Conor.
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
