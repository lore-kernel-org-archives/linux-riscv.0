Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8254C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 15:43:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 778432064C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 15:43:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HPUCiRVd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 778432064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMoAh3Lj4Ma/bu733yjnuvWpPOPMXTTIpTdiH78/H4E=; b=HPUCiRVdLT2zyi
	PQ+b9xCLoRALF3V/AQWwyKAx5mB5fcajSaihpXz0+yr4ftM9sWeIfitlkWBIlbSCeAWV5riTN+Wn6
	/orNPmpBemYLL32m2z3l1fTyynT7TJexgNlPZyA2lJEXO3hn8yKjSd2AVovKoRsA4uefcQdM6ibPj
	j8CgBruTVmx5KU5EjJu6jVHwr4MClLLmzUeyIMSRIuLukm4db4nkG4/z1JAhgrjiITAFPGvu3Y1tQ
	oZOXKVby4hNUxiAmAQCmTM0/ecaUoNOJCoqTcAemhEwSBWCZ2YyswXN1134L89v3W3jL+uwvv6E9Q
	+qz4THnCNPGL0U5wPL5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIF89-0004mc-Ef; Thu, 01 Nov 2018 15:43:33 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIF86-0004lW-1K
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 15:43:31 +0000
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1gIF7u-0003kF-Bw; Thu, 01 Nov 2018 09:43:19 -0600
To: "Li, Philip" <philip.li@intel.com>, "Wu, Fengguang"
 <fengguang.wu@intel.com>
References: <20181031064709.30981-1-olof@lixom.net>
 <mhng-74b51433-1762-4741-935d-56ca1b3548a0@palmer-si-x1c4>
 <CAOesGMgWDM+Etng3bNU-Yem6+WRJEu+TfddzKoN-htno1Az3=w@mail.gmail.com>
 <861817b9-c5f3-e995-2e18-9526d89d6561@deltatee.com>
 <20181101014345.cdlte4grtaexb234@wfg-t540p.sh.intel.com>
 <831EE4E5E37DCC428EB295A351E662495131B2E7@shsmsx102.ccr.corp.intel.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <da34ca57-ea7b-7fb9-bc45-4b315513e43f@deltatee.com>
Date: Thu, 1 Nov 2018 09:43:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <831EE4E5E37DCC428EB295A351E662495131B2E7@shsmsx102.ccr.corp.intel.com>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: linux-riscv@lists.infradead.org, olof@lixom.net,
 linux-kernel@vger.kernel.org, zongbox@gmail.com, palmer@sifive.com,
 kbuild@lists.01.org, lkp@intel.com, aou@eecs.berkeley.edu,
 fengguang.wu@intel.com, philip.li@intel.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_084330_437483_A0075E86 
X-CRM114-Status: GOOD (  10.35  )
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
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Zong Li <zongbox@gmail.com>, Olof Johansson <olof@lixom.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101154315.sTCnkt0KXDOYYdr2mhvtX1VZcMSbnnVSIfQg7oZlmtk@z>



On 2018-10-31 8:19 p.m., Li, Philip wrote:
>>> I think it would also be very nice to get the existing kbuild test robot
>>> to start compile testing a few riscv configs. It already does most of
> thanks Logan, the support to riscv and nds32 has been in our TODO list for
> a while, but whole team is blocked by other effort. We will focus on this soon
> to complete it within 2-3 weeks.

Thanks! Glad to hear it.

Logan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
