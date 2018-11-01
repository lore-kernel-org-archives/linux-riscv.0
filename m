Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6473ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 02:19:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABE4120664
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 02:19:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VYdc8B6W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABE4120664
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTHX+TQMr0utmbfVUWFGfDE76kzKlpRprD2b6UVVhE8=; b=VYdc8B6WrrZlQb
	WK6pFMpkMHSUSao/HZF53/gwZqqKm782Ue/2+YFkc9zPHyioLSXl9PQWTGN9fGgDZtE2wlgZzz2gA
	eUK3T1hkr1PVpWbG5GAUXIoH5S1YBwdQM0qAlIWfeG09QuVVg5M1Zl7rWf2B5yKaM4hPL8puC6G9H
	wqXeBZwfvRW/jTIs+mx8L0cOe+EAfx1KG1rOnrWZodULVk1JpT9rK3SJeHtteuZn8prl3b637l5R2
	QlwpwdZ51bKvqXSP3N4Rwca4F6t4jl3orPaEH77bCsEziDj5zZCm7P0k/QsuFrDmNwCZ/XsO/c+Wp
	oi2tZqhSIGJzy9kfhv+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gI2a2-00056Q-Mp; Thu, 01 Nov 2018 02:19:30 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gI2Zz-00054p-De
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 02:19:29 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2018 19:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,450,1534834800"; d="scan'208";a="104993503"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga002.jf.intel.com with ESMTP; 31 Oct 2018 19:19:14 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 31 Oct 2018 19:19:14 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 31 Oct 2018 19:19:14 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.84]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.161]) with mapi id 14.03.0415.000;
 Thu, 1 Nov 2018 10:19:12 +0800
From: "Li, Philip" <philip.li@intel.com>
To: "Wu, Fengguang" <fengguang.wu@intel.com>, Logan Gunthorpe
 <logang@deltatee.com>
Subject: RE: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
Thread-Topic: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
Thread-Index: AQHUcYRXg2HZSSw3bUyv4TesH6RGy6U6LxLw
Date: Thu, 1 Nov 2018 02:19:11 +0000
Message-ID:
 <831EE4E5E37DCC428EB295A351E662495131B2E7@shsmsx102.ccr.corp.intel.com>
References: <20181031064709.30981-1-olof@lixom.net>
 <mhng-74b51433-1762-4741-935d-56ca1b3548a0@palmer-si-x1c4>
 <CAOesGMgWDM+Etng3bNU-Yem6+WRJEu+TfddzKoN-htno1Az3=w@mail.gmail.com>
 <861817b9-c5f3-e995-2e18-9526d89d6561@deltatee.com>
 <20181101014345.cdlte4grtaexb234@wfg-t540p.sh.intel.com>
In-Reply-To: <20181101014345.cdlte4grtaexb234@wfg-t540p.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjkyOTk2M2ItZWJjOC00YjlhLWE2MWMtOTRiMjdjNzQ2Njg4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiODdhbnJiRDYzU29lVTNYMzVXcFg5R2NcL0ZabXBSRnM0MERWWjJxcEViQ3dENkpHazIxWGlLYlJMN0xqUVlGeHoifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_191927_473071_B08ED093 
X-CRM114-Status: GOOD (  18.39  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, lkp <lkp@intel.com>,
 "kbuild@lists.01.org" <kbuild@lists.01.org>,
 Palmer Dabbelt <palmer@sifive.com>, Zong Li <zongbox@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101021911.7kYqN7omX8izVNXGZjghkWWjDuiJIpkAQ5c3CUFqFIo@z>

> Subject: Re: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
> 
> CC Philip, current kbuild test robot maintainer.
> 
> On Wed, Oct 31, 2018 at 12:12:21PM -0600, Logan Gunthorpe wrote:
> >
> >On 2018-10-31 11:52 a.m., Olof Johansson wrote:
> >> I've migrated machines to a new system and that CI is up and running.
> >> Right now the emails don't go anywhere but me, but let me know where
> >> you want them sent and I'll be happy to do so (probably not
> >> linux-riscv due to volume/noise). They're also uploaded to
> >> http://arm-soc.lixom.net/buildlogs/riscv/.
> >>
> >> Since you keep single-patch branches in your tree, and I compile
> >> everything for every branch, I've restricted what branches I poll and
> >> build. Right now it's "for*" and "riscv*".
> >
> >I think it would also be very nice to get the existing kbuild test robot
> >to start compile testing a few riscv configs. It already does most of
thanks Logan, the support to riscv and nds32 has been in our TODO list for
a while, but whole team is blocked by other effort. We will focus on this soon
to complete it within 2-3 weeks.

> >the other arches. This would help us catch these kinds of issues even
> >earlier seeing that test robot tests patches on mailing lists and many
> >other repos before Palmer would even pull them into his branch.
> >(Including a repo I routinely push branches to before sending out patches.)
> >
> >I'm not sure who's currently responsible for the robot but I've copied
> >Fenguang who, I believe, set it up originally as well as the kbuild
> >lists. Hopefully he can point us in the right direction to help get this
> >set up.
> >
> >Thanks,
> >
> >Logan
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
