Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072ADC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 18:12:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A75EA20664
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 18:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E5ev+3w4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A75EA20664
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X64KCmAp/qovvwaIfe+rM2/jg4/JzsSMZjCxG0ww3ec=; b=E5ev+3w4myUKMN
	Gye+aACNWF/niGdNXSDv8AdQFJKrirna84W3FymQ5MP1VTOAKg6Lj0HgAa+DPUsuVRfFH7uJY2q+G
	Geq2ORxhDVLf4sTWH2OcwDQNeNiT0WLVoZA1YkIE7mmWdBlEtCXGE13Wc8gnMEpW2YUeYaBUdK3XP
	egcpTVXLDB9eEURgAxmAYYN7SKTIgq+qhq9UkXPgVhYjMbdMILGHK6Gm6lavu79lGpFxv9VX7OToj
	UyoCoDdBdO7VCug35sP79v4+zDQPFKc/yyrp1t4zNeL+rFCx9XOJCasZa/q3H1EvoPFIOklTcGcY5
	7+XsbFOMApq9c9wrUKlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHuz0-0003nX-5P; Wed, 31 Oct 2018 18:12:46 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHuyw-0003ll-Oa
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 18:12:44 +0000
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1gHuyd-0004UZ-EY; Wed, 31 Oct 2018 12:12:24 -0600
To: Olof Johansson <olof@lixom.net>, Palmer Dabbelt <palmer@sifive.com>,
 Fengguang Wu <fengguang.wu@intel.com>
References: <20181031064709.30981-1-olof@lixom.net>
 <mhng-74b51433-1762-4741-935d-56ca1b3548a0@palmer-si-x1c4>
 <CAOesGMgWDM+Etng3bNU-Yem6+WRJEu+TfddzKoN-htno1Az3=w@mail.gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <861817b9-c5f3-e995-2e18-9526d89d6561@deltatee.com>
Date: Wed, 31 Oct 2018 12:12:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAOesGMgWDM+Etng3bNU-Yem6+WRJEu+TfddzKoN-htno1Az3=w@mail.gmail.com>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: lkp@intel.com, kbuild@lists.01.org,
 linux-kernel@vger.kernel.org, zongbox@gmail.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, fengguang.wu@intel.com, palmer@sifive.com,
 olof@lixom.net
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_111242_839472_32B33708 
X-CRM114-Status: GOOD (  12.87  )
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
 kbuild@lists.01.org, Zong Li <zongbox@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031181221.6m3Yk4Y36utAHnnlba3IcBhCvvTGc9npGFnLmqSgG-c@z>


On 2018-10-31 11:52 a.m., Olof Johansson wrote:
> I've migrated machines to a new system and that CI is up and running.
> Right now the emails don't go anywhere but me, but let me know where
> you want them sent and I'll be happy to do so (probably not
> linux-riscv due to volume/noise). They're also uploaded to
> http://arm-soc.lixom.net/buildlogs/riscv/.
> 
> Since you keep single-patch branches in your tree, and I compile
> everything for every branch, I've restricted what branches I poll and
> build. Right now it's "for*" and "riscv*".

I think it would also be very nice to get the existing kbuild test robot
to start compile testing a few riscv configs. It already does most of
the other arches. This would help us catch these kinds of issues even
earlier seeing that test robot tests patches on mailing lists and many
other repos before Palmer would even pull them into his branch.
(Including a repo I routinely push branches to before sending out patches.)

I'm not sure who's currently responsible for the robot but I've copied
Fenguang who, I believe, set it up originally as well as the kbuild
lists. Hopefully he can point us in the right direction to help get this
set up.

Thanks,

Logan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
