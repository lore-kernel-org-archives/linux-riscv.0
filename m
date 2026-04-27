Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E53FF8862
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvLSLC2nFVAl+NLjiLLkgPppGds84FjvgD5wV3qD68E=; b=UoMGkNA5XmmreN
	3bQok6QgcQJ7W4non1Lbpa3WlKeqSt4JzSjWtJBYU+wcGQaDQK6dp+r4nzlXLWP9p9fMnjuSJljAu
	Thevon0+jPebmfkOm0lgRXMSGvqMZSNNEAKWhmAyZgsnobp8cyCiltsEhlUIN/a7I1T1wg1C77/Xv
	hhr/1pJ9dQJvhWYl2YrcI1/r9SoDPai7g17YAzek9ODnPWeTJeMRB/lo9yqDH9qyRqNC/ShG1xUQF
	EW2C6DNzc8fozOH2vUlgjjW+0tOU/XP2fHYTZBmyuVAbBYyBLSsogvyfAsZCzftrXg15q4wcL2t7+
	TQLruXN4HElKj3gghG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGZY-0000000GOXV-1nOU;
	Mon, 27 Apr 2026 07:40:04 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGZW-0000000GOWm-06X7
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 07:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777275602; x=1808811602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zlgsYWirOHtm9Lc229H9LMqzfSLfI0W0RGMOA3FZlik=;
  b=dQk/ZOM6JB+k5bzIOKPNalAGbxjL7PEOMCCZFejuu3lWHujxx0YiUFUH
   k6AP5yOFH25cnVzpZ2e5wQgKwLQX7JQzkBrqwXxFkZ+tmDdkfZCu1WaX6
   U5pMdI00symxitnelphTiwzQ4CLewbriNY2yM3LveECDb87Vvem5JJPpl
   mCP9TqY4ZCa9NSBNvr3ycCv8RJZF3DraIf7dcnkjngkWkpIwYk/xogwW8
   tK+vrTCRvZFzR5WZXbZUsR7HnUJ5QuDuTOjEPEXc302qfwTxefhUQa0QL
   FZ6B3AoNvDkRCuV1IVOgkusBxKUCFjuxx2CiJL4MbJj8VVCq1Up2mBMm7
   g==;
X-CSE-ConnectionGUID: 6v/37OkURliJ0GNTopVCPA==
X-CSE-MsgGUID: ALqKUKK5S0K13aHoBNmb6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78213442"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78213442"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 00:40:00 -0700
X-CSE-ConnectionGUID: z5Vk5+rQTnGXBRvjcEH8+w==
X-CSE-MsgGUID: ZdD0/QxIT1WPhcrl3VtIZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="235338178"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 00:39:57 -0700
Date: Mon, 27 Apr 2026 10:39:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/4] serial: 8250_dw: Add support for UltraRISC DP1000
 UART
Message-ID: <ae8Syo630Qefw9Le@ashevche-desk.local>
References: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
 <aes-qdaT_9wMbTsm@ashevche-desk.local>
 <177727526561.1796253.1521989195994870860.b4-reply@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <177727526561.1796253.1521989195994870860.b4-reply@b4>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_004002_088922_23F2357D 
X-CRM114-Status: GOOD (  20.48  )
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

On Mon, Apr 27, 2026 at 03:34:25PM +0800, Jia Wang wrote:
> On 2026-04-24 12:58 +0300, Andy Shevchenko wrote:
> > On Fri, Apr 24, 2026 at 01:39:27PM +0800, Jia Wang wrote:
> > > This patch series adds support for the UltraRISC DP1000 UART controller.
> > > 
> > > The series includes four patches. The first two are preparatory cleanups;
> > > the last two add the DP1000 compatible and fixed CPR handling.
> > > 
> > > The patches have been tested on an UltraRISC DP1000 development board with
> > > Linux v7.0-rc7, verifying basic UART functionality.
> > 
> > Now it looks good to me, thanks!
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > (except DT bindings, not an expert, no tag)
> >
> 
> Thanks for the review, Andy. I need to rework patches 1, 2 and 4, so
> I won't add your Reviewed-by tag yet. Could you please have another
> look at the updated patches in v5?

Sure, whenever it will be available in the mailing lists/my mailbox.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
