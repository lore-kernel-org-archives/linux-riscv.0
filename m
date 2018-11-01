Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CFEECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 01:44:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FDBD20657
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 01:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="snRMk+MT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FDBD20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rT1VTNrFKNwHAZsbpWZD/m3zDua1Dq0s0HUPjeN6d08=; b=snRMk+MTBOpDf3b/6QvXA+QDV
	h0qLW2WwSTW3OPEbx+mVkPb2YbWBvQMgEG9V9wbNNUjUkhA6lA13VE2kwVd3/yO++1/mRo/C3xLHe
	zo1XKYcYvPiKYokd1lxcGGjzRYlxZUP12KdLAl4sJDcdN708S/H1nruaglmRP0iLcW7sWt1yI7pPt
	q4XvQuZ7+XXULTv9U9HMNJ0Z0F4+ynm5XTwKHKfLUqHIEqJwIF/nSCwYAF6/+M3IK7TTjVF30HQ55
	gqmHcx9j0qJuH01t2mhcM/vo+gVR5LAm3fl74i8QGnnPIZvhFjCZq/fgwX80DajMlUplS5CMVnxCZ
	C4ClTl9Fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gI21h-00015i-EH; Thu, 01 Nov 2018 01:44:01 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gI21e-00014O-QA
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 01:44:00 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2018 18:43:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,450,1534834800"; d="scan'208";a="92823546"
Received: from zhangq-mobl1.ccr.corp.intel.com (HELO wfg-t570.sh.intel.com)
 ([10.254.209.25])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2018 18:43:46 -0700
Received: from wfg by wfg-t570.sh.intel.com with local (Exim 4.89)
 (envelope-from <fengguang.wu@intel.com>)
 id 1gI21R-0004zi-Jt; Thu, 01 Nov 2018 09:43:45 +0800
Date: Thu, 1 Nov 2018 09:43:45 +0800
From: Fengguang Wu <fengguang.wu@intel.com>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
Message-ID: <20181101014345.cdlte4grtaexb234@wfg-t540p.sh.intel.com>
References: <20181031064709.30981-1-olof@lixom.net>
 <mhng-74b51433-1762-4741-935d-56ca1b3548a0@palmer-si-x1c4>
 <CAOesGMgWDM+Etng3bNU-Yem6+WRJEu+TfddzKoN-htno1Az3=w@mail.gmail.com>
 <861817b9-c5f3-e995-2e18-9526d89d6561@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <861817b9-c5f3-e995-2e18-9526d89d6561@deltatee.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_184358_861496_10D6B343 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, kbuild test robot <lkp@intel.com>,
 kbuild@lists.01.org, Palmer Dabbelt <palmer@sifive.com>,
 Zong Li <zongbox@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Philip Li <philip.li@intel.com>, Olof Johansson <olof@lixom.net>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101014345.d8sgZOOdlFZS4KeQt0POr95oGv4d7C-vdatcwrGwnds@z>

CC Philip, current kbuild test robot maintainer.

On Wed, Oct 31, 2018 at 12:12:21PM -0600, Logan Gunthorpe wrote:
>
>On 2018-10-31 11:52 a.m., Olof Johansson wrote:
>> I've migrated machines to a new system and that CI is up and running.
>> Right now the emails don't go anywhere but me, but let me know where
>> you want them sent and I'll be happy to do so (probably not
>> linux-riscv due to volume/noise). They're also uploaded to
>> http://arm-soc.lixom.net/buildlogs/riscv/.
>>
>> Since you keep single-patch branches in your tree, and I compile
>> everything for every branch, I've restricted what branches I poll and
>> build. Right now it's "for*" and "riscv*".
>
>I think it would also be very nice to get the existing kbuild test robot
>to start compile testing a few riscv configs. It already does most of
>the other arches. This would help us catch these kinds of issues even
>earlier seeing that test robot tests patches on mailing lists and many
>other repos before Palmer would even pull them into his branch.
>(Including a repo I routinely push branches to before sending out patches.)
>
>I'm not sure who's currently responsible for the robot but I've copied
>Fenguang who, I believe, set it up originally as well as the kbuild
>lists. Hopefully he can point us in the right direction to help get this
>set up.
>
>Thanks,
>
>Logan
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
