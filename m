Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87847F8E4B9
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 07:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IIMvRzcfzHTsU5oGBBUI9BrIsv42HsR5XQffoO7Ues8=; b=3ef3W+k0y0WnU/
	W7DZegR6YdiQxvJpaw6L7sFqhbFPsBlcxIU23HiWrMKROAPq2BSd1b7HA5ajptXpLTOhN7h47kw9h
	+eilchvew6d1fexMqqbBR9WfDH9V23NSZ7OvGZn0twqcs0ySfXArL/zUOZt8G5Ko1Os1hbGrcfpl3
	YCUf5etmgyQpZwl8jXgU3Z0zHor+bpDhO9ftLKu6W8adjlAqFdQU+c8K0ahRKcNz30IXl9lNcnFGX
	cL0O0Ip4WR+Us5KFatVvX0lvY30QgnVrCXryJbSh2KpdDWBHaJpl+1F8IMdeC+WvhMysHgDfCbEu0
	MeydLNBXnhoxzFsgQC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdul-00000003cWx-2wAd;
	Fri, 17 Apr 2026 07:46:59 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdui-00000003cWG-1o7Q
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 07:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776412016; x=1807948016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d0V2K7hHg944fwYwkvw6cOFWAKLw942mwZXIbway+No=;
  b=P9aARpM4FAgtqCnQh05nfFIQeExoupY4+95k3WhcyJZm53luu0b1e0RT
   yy3eYr9RZkfqPCm8PJ3vHi+85w+f78FjmwPtaNIJ0AWk52zsJ8Jo2odVu
   XhxKlai8oCjdhh940tDYcgNoLwBjTw8gSbZ0jg++xz7oiDGPVNciHU0Bl
   tLqzjW/y8COBsyY85NQFNUFueyKOuz3C3cw6rZR664wYHeGYhn5sP132T
   il/jpE/R8HmoN2nhRWRsXhzTFKEFfYoR8sA0DOf7UpWNriHWE+XfHeHjV
   Ye/I+JHplqMF6Kov0hVOxjEHbJvjHAxuRp4vfOMPQblspv8J9kWzBHIgu
   Q==;
X-CSE-ConnectionGUID: cipnqxvcTUqnKOmsFWt7lA==
X-CSE-MsgGUID: xfE5zpusQxWaR9Hvb/xluw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77295104"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="77295104"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 00:46:56 -0700
X-CSE-ConnectionGUID: SClO325QS+K9uV0xBRh9eA==
X-CSE-MsgGUID: pMUBXXPOQ7KF7t0wTQZRzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="234959932"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 00:46:52 -0700
Date: Fri, 17 Apr 2026 10:46:49 +0300
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
	Zhang Xincheng <zhangxincheng@ultrarisc.com>
Subject: Re: [PATCH v2 2/2] riscv: ultrarisc: 8250_dw: support DP1000 uart
Message-ID: <aeHlaTIKm1wl0J0_@ashevche-desk.local>
References: <20260316-ultrarisc-serial-v2-0-6ab3e7fa891c@ultrarisc.com>
 <20260316-ultrarisc-serial-v2-2-6ab3e7fa891c@ultrarisc.com>
 <abfrDBeJrValJR9a@ashevche-desk.local>
 <177641113786.3193169.8990532982066985425.b4-reply@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <177641113786.3193169.8990532982066985425.b4-reply@b4>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_004656_476991_0D78E237 
X-CRM114-Status: GOOD (  14.86  )
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

On Fri, Apr 17, 2026 at 03:32:17PM +0800, Jia Wang wrote:
> On 2026-03-16 13:35 +0200, Andy Shevchenko wrote:
> > On Mon, Mar 16, 2026 at 02:33:23PM +0800, Jia Wang via B4 Relay wrote:

...

> > > +#define DW_UART_QUIRK_FIXED_TYPE	BIT(6)
> > 
> > Seems unrequired.
> > 
> > But to make sure, can you elaborate what's going on here?
> > What is the reads from UCV and CPR registers?
> 
> Apologies for the delayed response.
> 
> Our DW UART implementation on DP1000 does not provide the CPR/UCV capability
> registers, and reads from both registers always return 0. As a result, the
> autodetection logic in 8250_dw cannot obtain meaningful capability
> information.
> 
> To handle this, the current approach is to skip autodetection and rely on
> fixed configuration via a quirk.
> 
> If there is a preferred or more appropriate way to support DW UART instances
> without CPR/UCV, I would be happy to adjust the implementation based on your
> suggestions.

Why can't you provide a CPR value via the existing quirk?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
