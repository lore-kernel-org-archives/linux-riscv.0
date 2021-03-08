Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C496C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 23:31:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 566346527D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 23:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 566346527D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=6D+yjZplI1m9XUm70zemSnP04IXOCx+hq8HwRjhNRoo=; b=M5Jmc9UYRp/X3OSy2irD/OhQZ
	EIS2OeObmc/Bu9ysWXtronQ3DC9EV3jSQI4NZwK1UCgycgZwITQF9yhWBcYlP6A3epqZr0uX8Hs6s
	WD1YRTjTEie8wK64LKmyBrV+3ivnwEhY+d8YpCGC67EYB4T2lCGRvhczV3rH8KX786wfeiwQ65U98
	s5Xqf4WwJdImT797mleB0trumvDi3LkwhS/5rCSok/DTOcRomA+NAR1tLF1zBKOlXl0nsQmNfw8eL
	oReLDdjs9EB5M0Pbc6JvUYmuHgJxJlEkpD/kFEvXe7g6NCuEKb0S1b52qYoSlDWHePeZsfx3M8mzM
	LESg5eiuA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJPKx-003NOX-9I; Mon, 08 Mar 2021 23:30:55 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJPKp-003NLL-9h
 for linux-riscv@lists.infradead.org; Mon, 08 Mar 2021 23:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1615246247; x=1646782247;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=hOgiNHBvnwyu7W6ufge7ElM1v/hdtw6I5yo+XKuX7xQ=;
 b=g7ZlW5P3zubyjPG5sajU18Ljrzce8JG3T2jLXh8tYYhdkZfyedG638cf
 MGCzoCh0cEsAVcgo7eqJa1onwewWOAJeUF8JYtFVbqOqNXU7ZgDpgI8KB
 xa4zatnIz8HIq/uq0Q6d3rvXLYMVIfxZPDc4J8OGG2p6+RcI6OTHckJM1
 Rwhdt55/xhXZECrnPF3KJRhlcoQcUVh5OkP8GeOwVSR5U8e7CFKy9xYz2
 13ougd9Rk8pfPIyTKcba/d5JTgw3qKHeTZJUZPTlSEfgZys+K2dyHIxbT
 8BvpjUCYUMYqzmgWk9pFwxImoN/uhJlzh+MzeoAJnz0P7/5+MHEtCs27u A==;
IronPort-SDR: yw0XhcLrKCGOEYEXL89nTXhJsd+0sIFIu9BhmSP8TScdce0H87VnJwsIvnC252arI6QmPbKRzu
 9vbittD1GnDBiMRw7tbxjBqyBgDrj1HprlDXMyuoC/dqgS7V+TlKfiFsZM6lrROehVaMZYxb16
 M3NByRLUJ5y5xjTX1aT5X16mEV4ARGQyLGFSE0IGQUD8gxwmWjdVGcvIjAFYI6XnZ2lis/5LLE
 /CrebsPtncFhqBOTT/03DWW6YdH7Wx0coKMMk7UnBmLO+no9kk2jJEggZAgvdYW/oo8whYvLkH
 JxA=
X-IronPort-AV: E=Sophos;i="5.81,233,1610380800"; d="scan'208";a="161674388"
Received: from mail-co1nam04lp2059.outbound.protection.outlook.com (HELO
 NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.59])
 by ob1.hgst.iphmx.com with ESMTP; 09 Mar 2021 07:30:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTg7I+JLKK5S4iwa8LCBStdi+BN4uQ6qElXHCkPdx70UWvqscwt3NoiTVvPF62j+klvIIbN19B6T7SCrWf35sfrxjop+muJuHQcyzo8yXLU/iWnHWv6fEZC7OTe8EI8Q5hEGhWXtfCjvdAXturHloDxvHZIxCfbFkaUM3vw3PASZDOnJ2QpoPyMUEpBgv0DQG8jns9R8IDtI23LWAzuWf3Ru2/R9PtrMIKfjfL3M/xCmifIXJRThijIwXPcVzjbnEp/gsdcV8ZFBswJSxmiVsLTN54QY+isyJSS/gEhqEzwNqxnN2zeS6XcF9wiPBsG0goRmOhSGAn6SBEkLwbz8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhW/sAW3ozUlXCg4SSe8twBS+8rbXYvjxK9q3qO8cKc=;
 b=ngkm1V+ptoCV1sL98E9SxMaVqT0AsmChkyBb7jQXka0zj3KuyPou2nI2IEDhkK6sZCoWJxQAu8d/Eix09BhgAdmKmYYLoP2GiQ4YSM5hFMfAwp6adSVW2UQxtmK1jtptteVPnPEhwuDiOHjJEecYTrs5RddF3GTP8YIQiUkvoBpcjM/ypll8bOqkqSrBxvwor+gO6G+wqdk6F+YlEQaPr7p4Yi9NpFMEL3Zb73wSlTAponK2wz7fTUc8Bsp/BOwb0onOyvbiEdYMhX6M1BWBtjsSGZ5okTfH0a1IWtLh96BH9b/BA1mKVxAClLG5LfM6MlCrsHt6mU8flU4y4gAXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhW/sAW3ozUlXCg4SSe8twBS+8rbXYvjxK9q3qO8cKc=;
 b=zkn9vardkEQ7aX4VeUcwknv2GC9It6U524Lfw9zX5a5xJYRJOxEIyE3rejrULMhlZ2khs5jiAFYElROuayCPNDZ+LiXG2ipFh+9EQr0Q9eIFP6P8pzCDlJou/upatf1HI0HaMlvKtrTGksJs4UQxE8wOih7ZjOaNfEDCJB2hLu4=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4611.namprd04.prod.outlook.com (2603:10b6:208:4f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 8 Mar
 2021 23:30:40 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::e9c5:588:89e:6887]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::e9c5:588:89e:6887%3]) with mapi id 15.20.3912.026; Mon, 8 Mar 2021
 23:30:40 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Vincent Chen <vincent.chen@sifive.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>
CC: "Frank.Zhao@starfivetech.com" <Frank.Zhao@starfivetech.com>, Atish Patra
 <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>, "guoren@kernel.org"
 <guoren@kernel.org>, "alankao@andestech.com" <alankao@andestech.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Subject: Re: [RFC patch 2/4] riscv: Get CPU manufacturer information
Thread-Topic: [RFC patch 2/4] riscv: Get CPU manufacturer information
Thread-Index: AQHXE890v2l8U/a0jEaIFZCk1pLShw==
Date: Mon, 8 Mar 2021 23:30:40 +0000
Message-ID: <BL0PR04MB6514006678BE79B275DCE744E7939@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
 <1615175897-23509-3-git-send-email-vincent.chen@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sifive.com; dkim=none (message not signed)
 header.d=none;sifive.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:b5c2:5e8e:bd4a:dfce]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b5efa09e-2a1d-46e9-8b78-08d8e28a2faa
x-ms-traffictypediagnostic: BL0PR04MB4611:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB4611D5D451A90BC9C7660BC0E7939@BL0PR04MB4611.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WBxgKmIM0HGasfYjyyg85nG/NAyBBmjAASyiiWTWwUTli1YzGNNv8Rb+a/mLwELe0XychA1phppJpujTz2AKgiOxdiJbT1YT2dyQ8XBu/Squ1tZQ6GeYOniVLkLfYCgpCjJTkUAdRdidC9xXAUkuOdfObGXsr+Ne6oS75dZ/sSWZgK+TD9Y6vJPef03hXjefWooD1gjsfOCaE8+1x/koDP594+WIBYpEJHUcyDZLFHmaIJu0KVbu6LJMbYZPgMJYy4NBDsQMiWAlvZK7v8xgdCbbuTOdv4hRE8hT3P+QrFx3mi/udhNxDOe9WveXZs91M2jfBmhTpv/Ac/Lpgg7DvsgIt+xLz62XlRRGK8s5i22nIy4cf1CloAq4oCn1FcQHgSd/mNXIiGl9nMfBWt7cIXSniU0eR0zSXR8Kb6GSKwKPXOMnOonqTlupH91/TdroxSZUCNpXPE3+eRgS/RXm7U4/rOoUo+HwQbKosccqBQVaI1aj/1WL0qlyid7mAjRAd+pKlbcnF9nuzt0kftkcKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(86362001)(5660300002)(91956017)(478600001)(66446008)(52536014)(4326008)(66556008)(64756008)(66476007)(2906002)(8676002)(66946007)(76116006)(7696005)(55016002)(186003)(54906003)(316002)(8936002)(110136005)(33656002)(53546011)(6506007)(71200400001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?JS4V4kCWAvpVe0Cuzn3DxVfD23yujhltWoxxrnVd+YvJ3S+eL/Dmh+73FJKn?=
 =?us-ascii?Q?HJATZ1ZBlSCtn0y7NnTd00Is2WYZRzsAn1hcs81pOCH4Br7Pblg2JY5TgZga?=
 =?us-ascii?Q?RVF0lgQEbaHdxLqUKG0d0if+8A1h6h4FHAXzkXIp1dVj5yGgYsFOj2Ui6ww4?=
 =?us-ascii?Q?94IBFkoeMOtX/73/VdkKcDhhGzS2ODVHRVy+5blwzAcrQpH9jUjDo6DL87pz?=
 =?us-ascii?Q?9UUvrhudeCvolFOazwbKSCl2fYUa4YScjRj48+Yt3Xp/3gFx7Is6sgQXUnzw?=
 =?us-ascii?Q?XI6ecTiSKzdJk6fEFZrh/c/3x93j+KvIHtSuNcceIsYj/Kswm0M1DWG26Ekh?=
 =?us-ascii?Q?40wRkuGdVC8bJqAaS4mnOWhjR2jZPoomywnrP7YdiJcoHh9ERRMPjYhlwdga?=
 =?us-ascii?Q?Ihzr4zd1YiJ7J+yp1kZj5KiT+yT0VikuFZCmHHswVak4x2+LtO7Npn8n+rd7?=
 =?us-ascii?Q?QGqrUnnj2oNg39QFTFyse5UKxarNxXXlQVKIEFJE8B9yEWxeN6Z0iwKtrSW+?=
 =?us-ascii?Q?eVGqSXg9js96pmK5PucWKMjHhEmL61TJExZrFY1Rmi4K4mnxjo1+A3bf4pa6?=
 =?us-ascii?Q?nwCfiHByRcFobm4JGydQq1MRMcrmdhggKTC+Ugt9YUX2x33GIY5v18AvFE3D?=
 =?us-ascii?Q?WbVrykU8K4OjlnO5Aj9GIi7OyDaP0jt2LUKnQZ+HaN9jeK6y5whgwqO9WxS2?=
 =?us-ascii?Q?33NCRIxRcb1BkfDb7NJVtUKoylYfAILUFmFlTipT2yndfVjoev3ViwjByNTJ?=
 =?us-ascii?Q?hZxTXU9TxMIaQhXN968BP+zLSFb1HKf6rBB2dNqtuyieV0A2UBdU127jMKMy?=
 =?us-ascii?Q?vQz7P3IfW2LHGhoOVdFcj6FGSrja6OCzuf5rG59XCwLkCD9BxGU+fvkYHGF8?=
 =?us-ascii?Q?hnGCUBjiCf7Bv1TPPRkGXn+0/iJUVtebaM9j95BUjU0789MGcfyoY0D1QQ0X?=
 =?us-ascii?Q?xTsGM2Qy2/xiY3MBNzRLzP1UGoagu668wBMB52p1O1XIe8ehKix1OPUdnH/2?=
 =?us-ascii?Q?MOPMpNWysTzvEHGlqWvXdj6L7ja5hCz91fsZSjMc/s++qpsQK+bSqVRUsopa?=
 =?us-ascii?Q?04gdYh/3LFz7SCg4H9gdYSb8i6Y+rtP5QaxB3Gum/2w31ZuMsVFvt1zSyPPJ?=
 =?us-ascii?Q?Ma3uSmR4ujNqfbacluwvCYGsFC7IWabb7OHL1NrmY00Z0GP2+StzzPpgBesh?=
 =?us-ascii?Q?N34GtXAWJOPojeedxplSlBHEWomEsaUSQsf6qgjcE1m9YJNXDqmUQRfkaeuY?=
 =?us-ascii?Q?DD8EEJY8oVLO88/s2ofdzUR1q9A6BEWGAj4F2N31qe2MGG0I0ZDBBTz0GfBY?=
 =?us-ascii?Q?QFNgLltbPadolyztRpPRwUIXKhTuRzrCJxHTp4T41r/KA0sqDKTH5MSBE24U?=
 =?us-ascii?Q?O+ha7vX89vULUxPjUR52d/yBQFJPTj9nKmgiKNolyL6fwhThaQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5efa09e-2a1d-46e9-8b78-08d8e28a2faa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2021 23:30:40.4671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xjd+aO1EdGLycxI9P79xT7tgrGODNMm5wTi7fxYevxcSpq0taYXnWHtzGjyT93wHHUfJkebAxh2xhrST8ytaQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4611
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_233048_090277_6F44CB1C 
X-CRM114-Status: GOOD (  16.81  )
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

On 2021/03/08 12:59, Vincent Chen wrote:
> Issue 3 SBI calls to get the vendor ID, architecture ID and implementation
> ID early in boot so we only need to take the SBI call overhead once.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/include/asm/csr.h       |  3 +++
>  arch/riscv/include/asm/hwcap.h     |  6 ++++++
>  arch/riscv/include/asm/processor.h |  2 ++
>  arch/riscv/include/asm/soc.h       |  1 +
>  arch/riscv/kernel/cpufeature.c     | 17 +++++++++++++++++
>  arch/riscv/kernel/setup.c          |  2 ++
>  arch/riscv/kernel/soc.c            |  1 +
>  7 files changed, 32 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index caadfc1d7487..87ac65696871 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -115,6 +115,9 @@
>  #define CSR_MIP			0x344
>  #define CSR_PMPCFG0		0x3a0
>  #define CSR_PMPADDR0		0x3b0
> +#define CSR_MVENDORID		0xf11
> +#define CSR_MARCHID		0xf12
> +#define CSR_MIMPID		0xf13
>  #define CSR_MHARTID		0xf14
>  
>  #ifdef CONFIG_RISCV_M_MODE
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 5ce50468aff1..b7409487c9d2 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -44,6 +44,12 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
>  #define riscv_isa_extension_available(isa_bitmap, ext)	\
>  	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
>  
> +struct cpu_manufacturer_info_t {
> +	unsigned long vendor_id;
> +	unsigned long arch_id;
> +	unsigned long imp_id;
> +};
> +
>  #endif
>  
>  #endif /* _ASM_RISCV_HWCAP_H */
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 3a240037bde2..4e11a9621d14 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -72,6 +72,8 @@ int riscv_of_parent_hartid(struct device_node *node);
>  
>  extern void riscv_fill_hwcap(void);
>  
> +void riscv_fill_cpu_manufacturer_info(void);
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* _ASM_RISCV_PROCESSOR_H */
> diff --git a/arch/riscv/include/asm/soc.h b/arch/riscv/include/asm/soc.h
> index f494066051a2..03dee6db404c 100644
> --- a/arch/riscv/include/asm/soc.h
> +++ b/arch/riscv/include/asm/soc.h
> @@ -10,6 +10,7 @@
>  #include <linux/of.h>
>  #include <linux/linkage.h>
>  #include <linux/types.h>
> +#include <asm/hwcap.h>
>  
>  #define SOC_EARLY_INIT_DECLARE(name, compat, fn)			\
>  	static const struct of_device_id __soc_early_init__##name	\
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index ac202f44a670..389162ee19ea 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -12,6 +12,8 @@
>  #include <asm/hwcap.h>
>  #include <asm/smp.h>
>  #include <asm/switch_to.h>
> +#include <asm/sbi.h>
> +#include <asm/csr.h>
>  
>  unsigned long elf_hwcap __read_mostly;
>  
> @@ -22,6 +24,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>  bool has_fpu __read_mostly;
>  #endif
>  
> +struct cpu_manufacturer_info_t cpu_mfr_info;
> +
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -149,3 +153,16 @@ void riscv_fill_hwcap(void)
>  		has_fpu = true;
>  #endif
>  }
> +
> +void riscv_fill_cpu_manufacturer_info(void)
> +{
> +#ifndef CONFIG_RISCV_M_MODE
> +	cpu_mfr_info.vendor_id = sbi_get_vendorid();
> +	cpu_mfr_info.arch_id = sbi_get_archid();
> +	cpu_mfr_info.imp_id = sbi_get_impid();
> +#else
> +	cpu_mfr_info.vendor_id = csr_read(CSR_MVENDORID);
> +	cpu_mfr_info.arch_id = csr_read(CSR_MARCHID);
> +	cpu_mfr_info.imp_id = csr_read(CSR_MIMPID);
> +#endif

Why ? reading the registers will work with M-Mode too. It was there before when
we temporarily had the builtin DTB lookup based on vendor/arch/imp (see defunct
soc_lookup_builtin_dtb() in 5.11).

> +}
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index e85bacff1b50..03621ce9092c 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -278,6 +278,8 @@ void __init setup_arch(char **cmdline_p)
>  #endif
>  
>  	riscv_fill_hwcap();
> +

Nit: I do not think the white libe is really necessary here.

> +	riscv_fill_cpu_manufacturer_info();
>  }
>  
>  static int __init topology_init(void)
> diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
> index a0516172a33c..58f6fd91743a 100644
> --- a/arch/riscv/kernel/soc.c
> +++ b/arch/riscv/kernel/soc.c
> @@ -6,6 +6,7 @@
>  #include <linux/libfdt.h>
>  #include <linux/pgtable.h>
>  #include <asm/soc.h>
> +#include <asm/hwcap.h>

Why is this necessary ?

>  
>  /*
>   * This is called extremly early, before parse_dtb(), to allow initializing
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
