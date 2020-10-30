Return-Path: <SRS0=IYIb=EF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DAFC00A89
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 21:21:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13496221FA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 21:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rhB+fat3"
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7xhzddGoHvtIWwS5oudQalCsWHvtzY3WDbgRKnmYK2k=; b=rhB+fat39iEzR0qNq9+MbkSnc
	2StVExdl5EpNlRq2NHFomAW8XzitRibGZnJdo8MJcOwM7lCht4kp8CkbnuNHnm3GTkVmxjfpzThRG
	g1nxCgAq/NNASLvrA5Yisz9+1aD53i205ycZLtWCPSjwq+yoL+cfZhGR7jFeSSspDXOn+ZMKgVU4d
	yeDC1UHfw75vbW4JYReJcJUpo4gigLTQc7szy8fNBDH6BcPAvc5ppA+a9ygw7/ONbjvt+V0rUUpHB
	x0u9lKzYH0+Wp19L2yShlQLY6oqGjVb26ZlkukIWSAxyg5cfAqape/+FgkTXEJBV8Hh83i8VXdggV
	Q90J+fCjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYbqA-000670-Ps; Fri, 30 Oct 2020 21:21:42 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYbq8-00066h-6d
 for linux-riscv@lists.infradead.org; Fri, 30 Oct 2020 21:21:40 +0000
Received: from cpc98990-stkp12-2-0-cust216.10-2.cable.virginm.net
 ([86.26.12.217] helo=[192.168.0.10])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1kYbq7-0007z6-65; Fri, 30 Oct 2020 21:21:39 +0000
Subject: Re: [RFC PATCH 3/3] RISC-V: Enable Microchip PolarFire ICICLE SoC
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-4-atish.patra@wdc.com>
 <CAAhSdy0bgeCLYNTELdyFPj9_W1N6kDTwS6rUmLLnM=N3pTAp0g@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <f070bd74-1a5a-0559-0c37-10c9a62b82ff@codethink.co.uk>
Date: Fri, 30 Oct 2020 21:21:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy0bgeCLYNTELdyFPj9_W1N6kDTwS6rUmLLnM=N3pTAp0g@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_172140_282237_A1EAC92D 
X-CRM114-Status: GOOD (  12.50  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Padmarao Begari <padmarao.begari@microchip.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 30/10/2020 09:09, Anup Patel wrote:
> On Thu, Oct 29, 2020 at 4:58 AM Atish Patra <atish.patra@wdc.com> wrote:
>>
>> Enable Microchip PolarFire ICICLE soc config in defconfig.
>> It allows the default upstream kernel to boot on PolarFire ICICLE board.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---

Is there going to be a git tree with all the necessary support for the
polarfire/icicle boards? I so far have updated yocto patches, a rebase
to v5.9 and the v17 PCIe patches (which still don't work for us)

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
