Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E318C64E8A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 10:25:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA6C620770
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 10:25:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eaD6cfuQ"
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qnbmrnHcjGYWwDB5UDwCE2Gzv4tVv1g9tirkPQzMXrU=; b=eaD6cfuQ6LPqr6FXvfIv1grGo
	l9fUcft45cc25bj2GqvSIG/o+AF6zf+aciln3uNWQfLOayTLJhWVtB5if3LH5iqo5ZpZ5rDZm/UXi
	r2GAaHPbQplUpeETjsdkluYB6iImFZ2jSa9YfflGpJyzf76K0LTSPhhEJXdioMVDD0W2ZROH1ooFD
	veFT16wgGOY27Htk0lwxYW77CySgiZZjGRJ2ZGZpt678v+gcYZdVTkziINjq47h2RH1gExrESUMpO
	RnECoRPG6DQgJkJyj6XK37v/CqmT9QMzmNKSStA5MDKKnLNUY9OqU5YfsE+YY3N0X51NfogGwk1Xt
	/d1m9MlDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk2qy-0005Kr-IC; Tue, 01 Dec 2020 10:25:48 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk2dl-0005y4-Is
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 10:12:11 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1kk2dT-0004w8-Pi; Tue, 01 Dec 2020 10:11:51 +0000
Subject: Re: [PATCH 1/6] mbox: add polarfire soc system controller mailbox
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "Conor.Dooley@microchip.com" <Conor.Dooley@microchip.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20201119170419.18272-1-conor.dooley@microchip.com>
 <BL0PR04MB6514AA9B313828842F7EF0D8E7FF0@BL0PR04MB6514.namprd04.prod.outlook.com>
 <ffa091eb-0963-f2b5-de9a-c76767d6776c@microchip.com>
 <CH2PR04MB6522D8B7E1EC319733D72CA5E7F50@CH2PR04MB6522.namprd04.prod.outlook.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <bf2e38ae-dbc0-8952-9a30-b56a5340c28a@codethink.co.uk>
Date: Tue, 1 Dec 2020 10:11:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CH2PR04MB6522D8B7E1EC319733D72CA5E7F50@CH2PR04MB6522.namprd04.prod.outlook.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_051209_728123_C74DFAFB 
X-CRM114-Status: GOOD (  13.53  )
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
Cc: "Cyril.Jean@microchip.com" <Cyril.Jean@microchip.com>,
 "david.abdurachmanov@gmail.com" <david.abdurachmanov@gmail.com>,
 "Daire.McNamara@microchip.com" <Daire.McNamara@microchip.com>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 "Lewis.Hanly@microchip.com" <Lewis.Hanly@microchip.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 30/11/2020 21:50, Damien Le Moal wrote:
> On 2020/11/30 22:23, Conor.Dooley@microchip.com wrote:
>> On 20/11/2020 00:05, Damien Le Moal wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 2020/11/20 2:05, conor.dooley@microchip.com wrote:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> This driver adds support for the single mailbox channel of the MSS
>>>> system controller on the Microchip PolarFire SoC.
>>>>
>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>> ---
>>>>   drivers/mailbox/Kconfig        |  12 ++
>>>>   drivers/mailbox/Makefile       |   2 +
>>>>   drivers/mailbox/mailbox-mpfs.c | 296 +++++++++++++++++++++++++++++++++
>>>>   3 files changed, 310 insertions(+)
>>>>   create mode 100644 drivers/mailbox/mailbox-mpfs.c
>>>>
>>>> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
>>>> index 05b1009e2820..4881a519683a 100644
>>>> --- a/drivers/mailbox/Kconfig
>>>> +++ b/drivers/mailbox/Kconfig
>>>> @@ -153,6 +153,18 @@ config MAILBOX_TEST
>>>>          Test client to help with testing new Controller driver
>>>>          implementations.
>>>>
>>>> +config MPFS_MBOX
>>>> +     tristate "MPFS Mailbox"
>>>> +     depends on HAS_IOMEM
>>> Shouldn't this dependency be on SOC_MICROCHIP_POLARFIRE ?
>> Not entirely sure what you mean by this one. You want the HAS_IOMEM to be selected by SOC_MICROCHIP_POLARFIRE ?
> 
> Sorry, I was not clear. I was referring to MPFS_MBOX: shouldn't it be dependent
> on SOC_MICROCHIP_POLARFIRE ? E.g.:
> 
> config MPFS_MBOX
> 	tristate "MPFS Mailbox"
> 	depends on HAS_IOMEM
> 	depends on SOC_MICROCHIP_POLARFIRE
> 	...

probably depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
so that you can build a "compile test" kernel with as much enabled as 
possible

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
