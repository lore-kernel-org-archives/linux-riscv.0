Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60661C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 14:17:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 853036101D
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 14:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 853036101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vvwU9Saa45ib4iBDNbF7ERdH+pdqXfCErbsw6BSNdII=; b=DB1USV2CEGa3e59M3wolyd7FO
	uI6pKExr1fQKuUNqpZb96q/m9reCmfrFex+BavtNK72yNP823+bk3kCaXPJiAwVdfEM7D/Exvsdh5
	bsGCPNnOsqcIS8AZOLUSrt5YaAlVIdeFZS4RUooRyqBBs4ULRJq4ScUzgqFzC+Gs+b3CuuEjU0M1l
	TTTrO3uBLE7rU0lUn6hYztnIuXARw95jFhQ1f9zMLXPtcmwXJCk0qQVwwaMKCa9XAjdOgxZR0KDSX
	LMUBWkNwUpQ2Y287XgZFQIT35ARkG5jpE6p+CWXHHJAN0UQVwablPc6GXtRyekURfR5gpS7cfin02
	dAg003kyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWJr1-009U79-P3; Tue, 13 Apr 2021 14:17:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWJqf-009U4m-1O
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 14:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=M0Dl267gqCEnMPAwL+mz7iMBRCNVxP3PJ/BgUA1gtN8=; b=R/OOG9itOYvA5BJM5oNNmH77Xz
 x678YUr0P5XguZN5kXFp4d4ye4vJ4cjtmqb91ieqGYqGu+K2mlyXSl4mxFGHkJ2KamXlru9uOGoPp
 Ox4uQLwIsQ0QxVvTzyMQ6DfarE29D3ERCxZT6td83ytzu7UFvmidN2YnldAkIlVAmPLhyw8VC29F8
 C/+CcthdsR6kgKNy5VZn76eJQjAvHHySKOYTrQ9KZuGiFpDKll2oPYWVW22L111OPoKJLVxfLbp7c
 fb0tUamnpkojAOy+Kczn2s4Bd4wi936jt1BWtfILAMKZANmQlgK8K/AErnqzxS7Dwyk2w2JHN/PGy
 klxxLBKw==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWJqc-0075iL-Cu
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 14:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618323418; x=1649859418;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=M0Dl267gqCEnMPAwL+mz7iMBRCNVxP3PJ/BgUA1gtN8=;
 b=IiyHShZz+uvENJpaenOIkkp30qXWGFrTLy9Q4jvgXVWFMxYeWecPi7af
 Wy84Iay4A/Ip5D61b5vReWGw+ozZgTrJsXwyCEXLBKLCGXbkPLQSwANtx
 a82zaID54gDt/CBnoLbyX4k3sTyqGQFkxJjNE04XY5xONj4k1tW1Q7yDD
 vey77dpp5RNg7YLOePqrWUlD5vYSwBUxtaTpEyamn0Yp5EBUVUbFcis/V
 dS6Z3AZQevxQ1BC8VblYPjozLvcaHhKRX7CWFQdns6Q2kEupiMcYM/pew
 nVrurt/vEYzctZvRzL0lRo2QgV2W5Vf8t6Cp/1HdVj0RK2+qxm1iO7JJN w==;
IronPort-SDR: yXMLb1jAnyqwG0Hk7P76eylQ7q/NdFZNAR0gReY16hcRTofuUX9Hs0AVWfkuka+YFKTxQvrKTV
 UUAixIDJ8/3sgFdFwhtZ4HTnSd/57gpgz+WHT9qVNZc8qbRkoIz8PJjBN61WtwcZqIqg/U9uHO
 ASWGzL8Oow2MD8BRIK1cWMhml+gxE6/s+ynvphQFWOhTiAGKLYMGjKCPMVE1I5cUNgIf/g8u9u
 vgFmekH4thrAqjHwkdS4Zgrsfhjywve/PnS7CsgOng1R694bZ5Pm3YPVjAQrHqDKQOVVYrbl2C
 dG0=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; d="scan'208";a="116271016"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Apr 2021 07:16:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 07:16:55 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Tue, 13 Apr 2021 07:16:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0tl5CC0yUjA1NTe112ZTv4SQEqtgqPzvo+OtLc7sl60SvQDtiUF4TIGjEV8Epvo+lOlIXML5FUOaUn7yF9HTdkOLD9a9NHiTugjn9v9Mfcxn9Kudjai3DVW8Izc0J3Xgh5omTXE+Z5tu2URgm+ZiitxCB3jd0vGqhdgJUJZMuqFqGt6LpfQoAZUlsTRDo80WmRiaWG78SyhH97eeBcKczlmfJlnJzODMuEmflAYPrLoYeVBuqvPbTOtPrR2da3zGRGP5G3roCbYxDDGCSiQ5dZJ8HEOlJ570A4/V2QgdbiXgEVRXebAIUpFXAJUP794e0EU7zy2YuWNd8FHGTs4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0Dl267gqCEnMPAwL+mz7iMBRCNVxP3PJ/BgUA1gtN8=;
 b=TujLOGNTVa4R2eUP4DHH6kuCs+bGHNqQqUMaOnJNpv5t3FuQHNbwTRpFtbxuYqo+nfUWjyN1cgYmjAv9N/iHpBARVTThJjwQpVc8UHZnQBA32WN3mXoULBgQy3KXBMctGoEo7UR4m71ABikxcZ42mWrNzLc1q/fremwPvKUR0VgYNAkqdrZW5y2OjKc8eNyiBikTnD3jwwMtAyvDVgs2SZoRjOx/vU2OWpTYZ+EwgHonfAXTC3LXFYyI/K/mjKQGPmxr1sRTq5pmyct4l4YKOGF6vLOaQhZsEUXDTzgtCrxsNa0S2lQYNTc036wpLGxdNxrJNvnnRMEP/85cbMWMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0Dl267gqCEnMPAwL+mz7iMBRCNVxP3PJ/BgUA1gtN8=;
 b=f7V6whDtx1TpJdMPIV5gq6XCM/vkx623z4wV55JTL9f+4VXx8g23tAzd7zjeWJqL51LK8adolWY3RR4LtR8k6z3S+KyQqSQWh5wkDJJFjLQtL6Rhe1VHkFb2VJm/QZeEKvrtONiN6UXC1gmlBxd08W4+a1YVUsuA79HY6UU7IGI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW3PR11MB4761.namprd11.prod.outlook.com (2603:10b6:303:53::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Tue, 13 Apr
 2021 14:16:52 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::1ddb:df6a:6208:ccf9]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::1ddb:df6a:6208:ccf9%5]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 14:16:52 +0000
From: <Conor.Dooley@microchip.com>
To: <jassisinghbrar@gmail.com>
CC: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>, <Lewis.Hanly@microchip.com>,
 <Cyril.Jean@microchip.com>, <Daire.McNamara@microchip.com>,
 <atish.patra@wdc.com>, <anup.patel@wdc.com>, <david.abdurachmanov@gmail.com>
Subject: Re: [PATCH v5 2/5] mbox: add polarfire soc system controller mailbox
Thread-Topic: [PATCH v5 2/5] mbox: add polarfire soc system controller mailbox
Thread-Index: AQHXL7WE4HJN5Ljm/k6BLqqUQcNuCaqxIPoAgAFe5oA=
Date: Tue, 13 Apr 2021 14:16:52 +0000
Message-ID: <83723090-20c2-7c1f-edbb-efd752b0aed5@microchip.com>
References: <20210412160402.19394-1-conor.dooley@microchip.com>
 <CABb+yY1D4Z_vCXMYqHMhisJFZ9F8RPzaKUnTPhkFW=o5BEWfNg@mail.gmail.com>
In-Reply-To: <CABb+yY1D4Z_vCXMYqHMhisJFZ9F8RPzaKUnTPhkFW=o5BEWfNg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [89.204.252.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c895adb6-3e87-47ef-0445-08d8fe86c8f3
x-ms-traffictypediagnostic: MW3PR11MB4761:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB4761AC0BA10376EE76BDEA3E984F9@MW3PR11MB4761.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FKTOtLPlutHl7Csq2I4s9xhlkPHS/PsHV7KBYU2cIinSwCAmkpGYdewysLFU/GpqzXzQsUmdb3kAQB3xW49CTB0EFdI7/RmOluRX6NqwWG9Tj0zym6C4CgpmPgj5GDBpvVx9OC+JirpIay6DId1Ssrp5mKUowQyPomXufnKPnB8FVmJd4X3CZwrPLVSGw/4iYU8mJbFkURSOev82abv5BKnE9abY6cukdtR9jJeQKqYuzedcDWnXjgaqufysp3oo5buC5In3UMYDJ//8cmhgSFwewqIu725zGgk2SE+McF9UFd8O1zxRZ115a1gaMjvngtQ4H4EvmvmQV3/6VExwJ1hmCFOmLRgarNpUaeDnCg2G4depBgaieUpApX3IxR9MZFLKZkR1/i1+tkorIRQeMpM/fsXKBFFRW79zcDx6PS8De7up6gooVceifCaZeCmwjqtccq1VGu82Hyj+JLglgSsKazXpHAKuTv1uyc5k45MaV5FZCyZL/B48E/AONVZFLA9u80y/fEOYsAZY8vfxgffBMMNkV0C2adMguRLKrw83pQNhuWIVUWV9W0PyNIWSDQIvjVgaaldP+L1yJWwOj6OgwamsutiZgQAnT1kRSRyAjV9/EJb9tbfUvYnvc65topoPxtJEzuFuHCyj9SvX/EMVdoQ7UnIwhN57tc5gyhYoN/gBAze2/Aq18WCRWzdx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(8936002)(54906003)(6506007)(31696002)(36756003)(2906002)(86362001)(53546011)(498600001)(15650500001)(6916009)(5660300002)(4744005)(76116006)(91956017)(64756008)(66446008)(6486002)(66556008)(7416002)(186003)(26005)(83380400001)(6512007)(71200400001)(4326008)(2616005)(122000001)(66476007)(31686004)(66946007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?M2I0N2g0NjlERUcrQk1Ua0o5OFVpWlFJZTVYTldpV3hCNCtmTTlWV2hNdmJ5?=
 =?utf-8?B?S1NUM1dydXNYTVlHVmFsUHhJR0xzN2tBN0Q5ZllBc1hTWU1UL0dwREk2U0JE?=
 =?utf-8?B?VThhZEFGQ3hqMHB2TWFUTjltWUo3QTRZR0VwMjQrNVV1Q1BiZ3k4bW1yU1Jk?=
 =?utf-8?B?YmdvQ085NnRKK3ZDa3Exdml5RTBNQmZZVGJpcEdPN0l1U1poM2ErWGlwMVo0?=
 =?utf-8?B?WVBiUVVrWDZQMHFnOU5LZ0t6allzN1JlNHZZZVRoMldDWHBNVEl4L1JReEZ4?=
 =?utf-8?B?TnFhT2FLcHlQM1d4RFJpTjl3Z3BtNWQ2dlQzZnBUbkplcU1KT0Nwem9zU1NS?=
 =?utf-8?B?T3Y0SUkwQktSZ3NTM1pWaHVIMm92WGg1WXNOQXFnVnBrWk51STdlWGlJOURI?=
 =?utf-8?B?TzVqK2IzU1ZxYU5JaExmTEE1aUJOYklTNW1Ua1ozbjgwM3pSQ2VGajNwMk83?=
 =?utf-8?B?UzQ0TVdabEdXYXZ6NHUxanJtZ284aVZ6ak9KNU5XTGFoSityV1hZa3VPS0dk?=
 =?utf-8?B?VkQ1aUxpMVhNV281MGlpdVo4REs5VkxUU0hSNFgySkVQbEJlenRmTmxXTkZD?=
 =?utf-8?B?aDBQcmFIbmo5TEJHVzltd3Y0QitoMjFaWllyOStGZ1lxZGhPYm93emt5RDBH?=
 =?utf-8?B?bW9DQkhaSDhlVnlSTUR4ekRmL3hRRUFCQWU1aWNKNU9PTXFXSlhCL0hrVUlO?=
 =?utf-8?B?bXJuYmZjSGtnVDZZdzZuQklENExrY3J5RkhOY2ZCU3libDV2VWZzSi9VMFFZ?=
 =?utf-8?B?TUFzbERwcGkwcy9xSENIbG5qYzBEZ0dFTlQ5a1BnUWp4WG1XU2lhYVJUcGxC?=
 =?utf-8?B?NXJ1REZQcGlicW5HUjV1RFYwcHhXQW02TjdPTG9rczJYTURMSE1zUlBCOEti?=
 =?utf-8?B?bTBXdlRPemhrR2NiM3ZMRTBrUFRJLzhUdmpNcnVLcVlXOWFLUDZ0UzJJOEVP?=
 =?utf-8?B?aGtwTmRaTFI0N0ZEOEdsVVVjb1JwVTVlamxpcU55djk0SFNtNm9RQnZkZDZz?=
 =?utf-8?B?bEt4UWRBQVQxSTJFd01oM3FqR25iLzNDMlE2NEUxU1EvdVQxb3NocUduQVpK?=
 =?utf-8?B?SmducGlPQ2t6K01ZM3M5UzdkUWdzTFVLZHNLZUhraHRESnIxUU1CMy93S2tE?=
 =?utf-8?B?Vno2K2ViWmdPamthRGJmSUxyLzVkZzhoMzdENEtYN294ZkNhUCtEMkMwdkNU?=
 =?utf-8?B?RXNnQ2xjU1pCdk1GSXNmanhNU2tJdjVOMHQ2WGFBY29hUXFjK05PMGtyV2RG?=
 =?utf-8?B?cDlOUGxISndoQ3E0MFlUR1JkdnQ0VUFrTHlDWDEwZEUzSEp1RCtwckNtSjZK?=
 =?utf-8?B?LzBnOXVWRWk3dkRvQ0lSdkZ6RDc1TzdhK0xPc0JBbDllU3h4eUQ2Zk5aZ1JE?=
 =?utf-8?B?UVl0YXkzdFhJUExTTk1CQURwdzVMdDN2ZFNITVd4Mzh4K29TRUEzWThoMkR2?=
 =?utf-8?B?cktRVkFHRGZVZmhsbjZ2bTA3eTkzd3YvdkpmcmpkeXA2TnlJRGMrZVcycWtM?=
 =?utf-8?B?QkhUWW9rWWc2MFZjc0M4TUl2WWNXM05vREZhTkxVd0tWN1dOb2RxdDhENGh0?=
 =?utf-8?B?T1pUeGI0SWpJUUtjUHNsd01ZdDFuaEtHY21XR0pnVy9va21GbWcydERtcjVV?=
 =?utf-8?B?WVRoMkovMlFwVG41NWR5bUhyYlRTWkVVUU1qWFhiKzM1VC9GOGI2NjhtbzZY?=
 =?utf-8?B?bkRUQUt2eVc0OUVXUmVTYjVZOXArUUQ3TDJId2FYQlNzd0lkNDFVdkpQUDM5?=
 =?utf-8?Q?veDP4f7sg0LwPrjI5Y=3D?=
Content-ID: <9A695B02B404714B9E55E4B825EB3F48@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c895adb6-3e87-47ef-0445-08d8fe86c8f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2021 14:16:52.2381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hCaag8j4QbEE2+5xGrXCFKz0/Q9pNvsOOPmF5RWOknw0vvvGy0jYQ5Lzbzx4AmZWfMHtGmajX05wHGT3fkpIUOlpW7YsO0HX4igipasw1xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_071658_473171_294A540B 
X-CRM114-Status: GOOD (  11.57  )
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

On 12/04/2021 18:20, Jassi Brar wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On Mon, Apr 12, 2021 at 11:04 AM <conor.dooley@microchip.com> wrote:
>
>> diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
>> +       return (struct mpfs_mbox *)chan->con_priv;
>> +}
>> +
>> +static int mpfs_mbox_send_data(struct mbox_chan *chan, void *data)
>> +{
>> +       u32 val = 0u;
>> +       u16 opt_sel;
>> +       u32 tx_trigger;
>> +       struct mpfs_mss_msg *msg = data;
>> +       struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
>> +
>> +       mbox->response = msg->response;
>> +       mbox->resp_offset = msg->resp_offset;
>> +
>> +       if (mpfs_mbox_busy(mbox))
>> +               return -EBUSY;
>> +
> This check should be unnecessary because the api won't call
> send_data() unless the last one is done.
>
>
will act on the other observations/requests, this one should stay as is 
though - possible for something other than this driver to cause the 
system controller to be busy.

cheers


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
