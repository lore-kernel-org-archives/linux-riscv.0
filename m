Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF45C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 03:00:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB9C964DBA
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 03:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB9C964DBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=Q2Cz8DQi5rZzYhaM4GCYWF+hIYnMbcYSMKbic7JK8ME=; b=IXpli4K27gBpI30Ka/NzaA72w
	zUSFCo+fZKzWK6sN5K+QXurGk3qAWBGAtVVPQw00Azz9bt0I8rHqOowPB8UQH1eogql7O70EqzItx
	9Uc69m138SSvejApQvbud3FQmEOfETlbJ5+lQzVeeUgSYOLuVg7rK274yF1+wavoLpYnzgZQwp6qt
	q0DpzyurLs/igkbomw2zimpBzl0GUuy34ep3DdhkSNnoz6JX84jy+ZdrvtLR7Km+J2UAQq37gX/mx
	7S2N8SePuxc0qR25if9PfDF2rht8YUZCZ5F8LJDK+X4RqdiVwyaX2k3i5/J3UDvcdq2NBm8YvKQsd
	/PA/r62og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA2Da-0001bo-0p; Thu, 11 Feb 2021 03:00:34 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA2DX-0001bC-T3
 for linux-riscv@lists.infradead.org; Thu, 11 Feb 2021 03:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613012431; x=1644548431;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=QnpN5HazCXhHCFN6M44T9XF+FTR931Il6u+xYylFTXU=;
 b=ctmrr/BMa2LZwdPrkdJukdCWxO+jjcknf4UcGRjVrwr3Zf/XgbrPSh9P
 w7dmtfEFQ4u3ahM4LNX6LVm5P1bws+0mx0H+Oy+7E3Ut5P2lRTfnar9gv
 or6QVV9k7A0EcIFqql8FfD0nMZ0DsF5xLR4uSxjUvAEEZMTQVmGplmZRG
 D2zeRfDHG6nKJoHQRmWKQQutEOF/OdzjGDbHPlev9XEYfqlxF7q5GpRVx
 kXne9bc12SqTeY+C/fcMUC3xEULjZz39CZ7HeVrPt3dxCK5yVaCAa7NGj
 nZXNR22mEERtRi9wKSAJSs4DnjyolM+C/WKHwfe6ycYVUrhMIryKVh2Mj w==;
IronPort-SDR: FBKx1NQ4MAga21MU6Y2sOHP6P8V2uQQld6jnccUjrxHySPglMMzACSb/Ri6VXYFtWedxbsWBp1
 5uJz8aivOYDgjgHwdpQH01ReptkWQ1vnLiPXV9KbqkVReJb4SNAhk3vLASRHixZ7/OOSSWwk7O
 GNsJgg4SXzqsQBNvlMYUQ4ZYvCYLwITf8bIbdAav/AwdhEPsoSd6VLbinQaISsYNCl/r9SijYA
 vZI8JnkfAo3Do45qUcvbAyYr/1T5FYxiwNlZ9jFs7oW2jqztgr4TkdsQFBx4ChAoVJhm1iVkqw
 wPY=
X-IronPort-AV: E=Sophos;i="5.81,169,1610380800"; d="scan'208";a="159733206"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hgst.iphmx.com with ESMTP; 11 Feb 2021 11:00:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgtTd5uyCBcINIbkGqDgAbDcRbNXC1mh6f2JwFfLg1oAQW2G2vdBvawE8lmTy7iTXQgxjkltaUq2MwsEK45omXrCB+dvTlkpuENofqze9N/Tzo3OxkSZyuEGuiNYwCBo23Nt8o70851VUXmTMoPEp7u2x8PzHiyj1mMeOXBp7bhzzqx8YpjyhwSRkLQwg6cOOKDYqMQNeHuijzwzlZgtVknqRXY1Zsy4dLDNaWdnW+tJv+WRmYoo4wajixqQGyjCslOioiFjp0BO9CiAUcIfryzelUCzvjRRztnZVCsb4WfAq8i48nz2HBan3a8XYrciorNlsbjhSfBebQWhyjaP7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gOmHxl7Wb/n3gjmllH/ashq25rd2/p4nQgde9YBzbU=;
 b=HOyWTVsR4QNbfnLQPPiDbk2abpqFm4UAqTxUcSmrtNuWx990/q4trIRlnL4aBvUfNnIjvIdb2Qqd5qpAZdf3pm/bORH+ptN4j33shpx5NnsbAIEjhxXp/rbnsoBnOjl7IyR/tBkJSybEU5WQa+omU7hqILY5J+ZLmTvCE6qlcmjV1Kpdswr2y4NoPRbe9ap1Nstvty0eYk5Cx+fxppW1CsFAPHbANMbbxruwJQ9BjhC6oqljI9rvAkheDah7ndnAhPhQ5ZLla8Cc0W69b9iFora3K7honDCJZuGa9C61WY54OXGUAzNX9y+9e3Mu/gF3RTR8pZtNMVtozcvK/41PSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gOmHxl7Wb/n3gjmllH/ashq25rd2/p4nQgde9YBzbU=;
 b=vMq8t96ypx6NWhZpKreLadT/zyZRmuBDoncI6grRd+NdXOR9LVoXIfaaU5S4bR703UaailH/+zfI15y1QyomOe/eQj8Q052cPxeygEwWTBE9M8QgMOQOvjfzZ+rhL0tFD2iWhG8Wzb1vRP18trVBykAw+ZCBHOdyq3sRfQZuQnw=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6515.namprd04.prod.outlook.com (2603:10b6:208:1cb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 11 Feb
 2021 03:00:27 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3846.027; Thu, 11 Feb 2021
 03:00:27 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v19 01/17] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v19 01/17] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW/2n3wc+Wqmw6uUaKB4SLUckc0Q==
Date: Thu, 11 Feb 2021 03:00:27 +0000
Message-ID: <BL0PR04MB6514103FE8D6D87F99711D0EE78C9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210210050230.131281-1-damien.lemoal@wdc.com>
 <20210210050230.131281-2-damien.lemoal@wdc.com>
 <161301087300.1254594.18438542581140302342@swboyd.mtv.corp.google.com>
 <BL0PR04MB65141208E5636BC15ADD4A73E78C9@BL0PR04MB6514.namprd04.prod.outlook.com>
 <161301220412.1254594.16210039566881279371@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:4d23:6652:258b:81d8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 387317a9-a19d-45e2-b823-08d8ce392f22
x-ms-traffictypediagnostic: BL0PR04MB6515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB6515DDC298050033B589B82BE78C9@BL0PR04MB6515.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GhsIjTHoCYRIsV39ZlnjjSdIjKtkNo3rDnuSGhMQt2i98VZ+wtwozz3Vh6jkEmdi+JFtJMR9Q9pOlpFtn95KJR9TOqI//JA6KpsKtdnjTLurFxyMDmzFqVR9NxJySK3JkdMdTXbHeXXyv8yfiyr5B03/8NI/U6CflJkmSiyw7l0a9cQdZ9T9y1eR3oKxJgRT+0e7R6GyWBQVyS6u0Hxr33hGcOVb5Q50Wj36UtmZ1m/OJlcys3QEB0R2NekBBIYsBE0Z2jXGrLFuR/qJ5dmHZO/5Rl6J1OErjb/hyJ8UluM2MKkWuVXNuKpso54Qng+XoKu1G7nRr0fndxwv+o64lJJf64nhDBXm0hGUgfJ5Mg0Toum5jABihBXjZxPZzXD6Ikjw2eni+KK9c9GqXcfxJ8vX4yZ1hvrgy8g6AGY75N8Y6tVlQSbpPsK87wb8RJCAYvvcqzK2EieGH869Vfm5euIwhPFWGu3JvCcSf3qwN7n8eTV/9TX0EmPx5Ijh6N8uWoLt7FKPZltjd4ZbLLNut4V0x1HI0y6YUyAIfGYt8IMQKYZkFGRFwpYXha5aJYsD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(71200400001)(2906002)(52536014)(55016002)(54906003)(66946007)(64756008)(66446008)(8936002)(33656002)(76116006)(86362001)(110136005)(316002)(4326008)(66556008)(66476007)(83380400001)(186003)(91956017)(7696005)(53546011)(6506007)(478600001)(9686003)(5660300002)(8676002)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?W+FcxO2l143d6ODD0lwnzhUU/G4bd0oG8NgkzUgEbkj8mxynZDh2In5TV6H7?=
 =?us-ascii?Q?3IZEwB4UXY6r11qF2JggOjAWbKuPsmrYvwFEvwp3BOjpJXub+QCsU+4R+2qZ?=
 =?us-ascii?Q?SG0pKuF2SQ0LR5Lmo7feMbWiSgylUwBw16cdOAZ2hpN71KGHYObsxmh5uJ1H?=
 =?us-ascii?Q?PVlXXUGGoUIUHuOIxzSAYr1HjAK0gVQ/nZR7ZncVBxscFA+RbO588RR2Udw6?=
 =?us-ascii?Q?rUeZQamtwR1DJiwWqUkGGIhr9jYhJBp4AA06hkfbpj56psfyU55qHxi8Bc9e?=
 =?us-ascii?Q?fzzGydPZljfPmCjBzGsz69VjS895/n61faTye4TfwJpJH7tWD+TY722dMhii?=
 =?us-ascii?Q?RziJl3Ovcn8ogqsPlZrp46RoNHfWVvqUilW+JzCxnGvTcFXEYccybopZISwn?=
 =?us-ascii?Q?SwoSHmxMbqOkKqO8pv4C9umlbN8yXZyhSeZUrVG6Hch58w0vk04XVqNJuwdX?=
 =?us-ascii?Q?sM6LvyPtTJYOgku8J1NdX5nwo1a5a8616QkVmpUD0M2m1cl81JybR0kWt7/2?=
 =?us-ascii?Q?WMsgvdARovdc3ZgRc3cCWneNbMtYnM7bjHJaYhEKw6vxAETs+SS6/cJ4zmpc?=
 =?us-ascii?Q?WfNeeDxaB97A7HF/rtLNXOmFUvZt3I5BBhfkDqgKlXBHDXWTw6/7yeu7zp3A?=
 =?us-ascii?Q?4midYuLHhFAu7iQk7NCZLrTWXUgJvZd57pzd1rPajZ45arg4VpFenCrobI3D?=
 =?us-ascii?Q?y7ZAzNWRKb64c4f1L5Fz0IaNNKgkQfIRKpsanCLo28GPWtxnn6YnirUhcXNF?=
 =?us-ascii?Q?w78KITTCo0TUeLYdzHUeT/5MeyX8WQmpnoylXdjJNK7tJ7HTYcHXUW7riXDY?=
 =?us-ascii?Q?3BsGy9Ugmz8XB0cinp5KaoQvH75lVzaUQ+CkfHLC5qihTx7xq4dtvaWSCEFE?=
 =?us-ascii?Q?KfELDpwycy5gJyIuPwZg63J9S7IJMYAjRH747rzdwwfto++Zdj8uoFGSJGXM?=
 =?us-ascii?Q?y+8WAGwKN9mpkmz4bfl509husHWzSS8sc5AZPaY5P79Zl242pq4gvrqQMCAT?=
 =?us-ascii?Q?BAMQsSGmPdIeHU0d6bRiNsRpKLi5HnQdi9B6STUEE4qqq+GknrH2KnnEArmU?=
 =?us-ascii?Q?7MMCxd9jfhy3d9NuZe5O8kPWzSyQYupzbeOBPlBKX/iALBioXlaTqEp0LLuL?=
 =?us-ascii?Q?gSKzU1fD7IT8038yYz57uqrGjdc3iIK4dPPFUODmRTPFdzH6b8nkkRfCsYFn?=
 =?us-ascii?Q?Wg277HoWqaBtwMh4iRAYhO54nQmcVjk2LrE5HR0DAULaeB3M3BKkMIptA4Xh?=
 =?us-ascii?Q?u359+DHJRIRtcFe+BjCohPQC7el3x9/V3V0/ZY51Gc3dQM3EwhnMN0AE55Tt?=
 =?us-ascii?Q?WxbnzvmNRL/mONV/alPqr+cMSnvyodexLQQ/ImITmF8DQjibnL0Iukf9nOgp?=
 =?us-ascii?Q?xxe+I1lX4y/ox7pd0iIFQ/DfxrMjfStXalWGAxKcYac05at4kw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387317a9-a19d-45e2-b823-08d8ce392f22
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 03:00:27.1201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bCFDSugT78xgk0XQ80p+NZ5JlcLYuwM7d80j2iS9D0iUYviwr7z42a/KcdGkWSCDni+OjX9PPacZOBrQXvzrIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6515
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_220032_167848_FE0FE2FB 
X-CRM114-Status: GOOD (  15.79  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>,
 Michael Turquette <mturquette@baylibre.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-clk@" <"vger.kernel.org linux-clk"@vger.kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/02/11 11:56, Stephen Boyd wrote:
> Quoting Damien Le Moal (2021-02-10 18:41:45)
>> On 2021/02/11 11:34, Stephen Boyd wrote:
>>> Quoting Damien Le Moal (2021-02-09 21:02:14)
>>>> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.
>>>> This new driver with the compatible string "canaan,k210-clk" implements
>>>> support for the full clock structure of the K210 SoC. Since it is
>>>> required for the correct operation of the SoC, this driver is
>>>> selected by default for compilation when the SOC_CANAAN option is
>>>> selected.
>>>>
>>>> With this change, the k210-sysctl driver is turned into a simple
>>>> platform driver which enables its power bus clock and triggers
>>>> populating its child nodes. The sysctl driver retains the SOC early
>>>> initialization code, but the implementation now relies on the new
>>>> function k210_clk_early_init() provided by the new clk-k210 driver.
>>>>
>>>> The clock structure implemented and many of the coding ideas for the
>>>> driver come from the work by Sean Anderson on the K210 support for the
>>>> U-Boot project.
>>>>
>>>> Cc: Stephen Boyd <sboyd@kernel.org>
>>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>>> Cc: linux-clk@vger.kernel.org
>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>> ---
>>>
>>> No change log :/
>>
>> It is in the cover letter :)
> 
> Ok I don't see the cover letter but maybe I missed it.

I checked and it looks like I messed up (again) my git-send-email CC list. I had
added you and linux-clk to the cover letter CC but it did not work. My apologies.

The last changelog entry said:

Changes from v18:
* Added review and ack tags
* Addressed Stephen's comments on the clock driver:
  - Moved MAINTAINER file update to new patch 0002
  - Code style nits
  - Use of __init declarations for k210_register_xxx() functions
  - Use of of_clk_hw_register() instead of clk_hw_register()
  - Removed the need for in0 clock name

Thanks !

> 
>>
>>>
>>> Minor nitpicks but otherwise
>>>
>>> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>>
>> Thanks !
>>
>> I will address your nits in follow up patches. I really want to get this queued
>> in 5.12. So not resending a v20 :)
>>
> 
> Sure.
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
