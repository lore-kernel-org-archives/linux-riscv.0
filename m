Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFD4C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 18:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xypn3guGPa5mgBRJaoCKTCcSZR2nCYfctJ029Rlmy9A=; b=dcSkaIyh972LzL
	MhCq953hbUMJCyD5Vv+PfaeCvyIZRBRMDsMmzeMkCum9gm1a/zoppcs4kS9CKI6vke/pA16uMvPEH
	iRAPngBPVmxl93o2S7YaSHcaVNPQQUB0vMcxpCkaFgaCDvgQH825Q3G6eqkAoC0FWdTxMSPT0Xj0S
	uI8bwjAtzsdlTc9PlSTfWVwudcHe/cSpsSQDVeoUoFl5GWTCBqW+JpHz3Qe2tr0xE6rOPzdKT56kx
	suuOcz0RtRjhSAiwul2nSbvv3h+A+OLKe1c2Z2QFJ+TPe8MwmX7Xvm9jSMkeqLkseBOWOquXEVM+B
	EWJw7HjG/ltd0m5hYwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOej-00GACZ-0c;
	Mon, 03 Apr 2023 18:11:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOef-00GABz-0t
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 18:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680545506; x=1712081506;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zrQofNJvsGa+n+b3EiC8bQoA2+tWVtJLKM7VwzWPtjI=;
  b=NQ9GK62Cg6G3vY83rd3RxmZbpdDWcr7Y7AvBlCjqQjXFMOE0qfO5/+I1
   pISi2u1KCB/HiA+ThD/1XfVUmuidDzny18IepuXFkTOyrDKBudHRzW9vl
   gOsPHcbqRU2+Y8pW/p43ASfjUmZU2kR9XNwbb+RJIA3OlNey2ZNF0kkFg
   YiaHy/M+YJ9Y6BnVjW7neQj/rKtYSCjGdoM/xqpr0qjkcK/IcBHGemY+A
   UHxq9x9pnecEkxvFhFF7qa6ZD/92NXxiseo9FWnRgeS2s4QmcH/X9VSyy
   Uuk1MECFFxWsuIHb5MFp0aN85/fpvhiKwXNXhqV8cwmy42nlrUkSXaCDS
   A==;
X-IronPort-AV: E=Sophos;i="5.98,315,1673938800"; 
   d="scan'208";a="207954637"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Apr 2023 11:11:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 11:11:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Apr 2023 11:11:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+B5gAIDCFpmr5EUP2OWtwDnO0c2qG+ceHsjZFH6m9MB4z0KsgMGRiH7WblP6oc19RLqXNYZX/SGNHOvGqRzQAvLABLcOy8rDpAEuY3KOANq9ORH2E9T5euq8XvnEspW3B3aKt5Gw3NV1M4+S+yd4DEOwLmd4OTthU5Ni9L/1G37qETaHt6UqOn/eE1Macq3S6tZeNFAJgRg3P05Zd5eAgmt7PcZdCeyctEcfSC5UDU69LKdrTBahwDZJaXrotlH3WVaaD7be7ykzCKGvcSJ/aa8raE+0XuBynB0BhbNaJU20xWZqtpH8zw3vygmVKLjbqNA595sWkAhknEyUXMi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrQofNJvsGa+n+b3EiC8bQoA2+tWVtJLKM7VwzWPtjI=;
 b=DiLpg2IEfl2xHHMNMsL9ME4Wf6cjnsZMkR8Hl7E4kuFGePRutApHudifSYfKyI36kryjQqaoWnb7Qh6s8Es8lma63W5+5kHmVdXFEsirvewXbop5s43DBnuiC2JqD/FMVh1GRcxlOfG/JuU3ZTxZWN8d+v4vs+pwfZcewA86nm6yzjuFO/M4Aqa1jvXdoC2Udb+JZhTachGISkoTg1TdYaR3OLrMTGInBmkwYmuU31xcvZlYEuzgrOR7Gd7FSXXshjsQuloV54IdY/tQ40PtXhWWqzBV+KZfYCr23DLc97QUBjNotSwooDva3MNKSdPdgttpjycD+Z7z0NGIFUi02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrQofNJvsGa+n+b3EiC8bQoA2+tWVtJLKM7VwzWPtjI=;
 b=jE+Hl9IACEfH1a8OQKubpZZa15Jq+83PUZNlnL7wlFYJGsCE7YmvxF/+5o7Yv3/GnUB0ZiKYne7v1soDc9fWLM/3a+Gxz5er+AejUz8PRRyWHlp3zN1q5gMBlHJBs/YEB6gzxjUtICVJsAQn4cyKVH3wPHA4T8MCg0jxvQMqjks=
Received: from DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) by
 DM4PR11MB6504.namprd11.prod.outlook.com (2603:10b6:8:8d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.29; Mon, 3 Apr 2023 18:11:33 +0000
Received: from DM4PR11MB6166.namprd11.prod.outlook.com
 ([fe80::2643:88e6:3188:8a55]) by DM4PR11MB6166.namprd11.prod.outlook.com
 ([fe80::2643:88e6:3188:8a55%8]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 18:11:33 +0000
From: <Valentina.FernandezAlanis@microchip.com>
To: <conor@kernel.org>, <linux-riscv@lists.infradead.org>
CC: <Conor.Dooley@microchip.com>, <Daire.McNamara@microchip.com>,
	<jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/8] Hey Jassi, all,
Thread-Topic: [PATCH v3 0/8] Hey Jassi, all,
Thread-Index: AQHZZkqN8TI2HkRUM0Ksp3C3lzo2cq8Z4toA
Date: Mon, 3 Apr 2023 18:11:32 +0000
Message-ID: <d3fe02e9-0e34-17d0-251e-5cc4394c8889@microchip.com>
References: <20230307202257.1762151-1-conor@kernel.org>
In-Reply-To: <20230307202257.1762151-1-conor@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6166:EE_|DM4PR11MB6504:EE_
x-ms-office365-filtering-correlation-id: 4f48f6d7-6fe6-4ac5-2d3e-08db346edb14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xiKia2vu1y0oZ5UD0rTyGIeFxDUYoO8uzzQxPy5dTuSG6c/Xkug7ZU3YSsmMEmWJBoQ/7pUaJF3Flu1fq0dJOPQ3nExENxa9vvRQMeK2bPuVzi1wv66dQ/wsSqK0YxIIOMHd7B2bpilstvG3lDZn01Xj5+oBmrMFCyyFhALrdNMK8PDbQyfBVfnJWAVzC+1mI70yco7icU1hxD4BNQ+PKCcERHT234faTlBBwevMZNr3z162BcN34f5w595465y9sFX2g/AjM1MsBY4OQqIgags2eRL7v7KjmS3ff2laGODJLdUKnCqpVCqUtFfEw7HalAW66lQEq7hsXz9+qfRNv1UvB2IKrQ0wgQIsZPipgVK4KLdChVHuCxPQ1rMNV4Nv24KfvkIqiguJQWZomN2BLIhvL/1cIg0R7SG4acSB0IH67/z4GwyfzToMLNKFFq9Sd5jaLNISRUAsl7ey6pun6hJ2/u7wxpvtZQa2YroANcQJN49dhChzd+M4MbwuaY+A+Df2cryyEKEhmU49JVtGdZtKboJJ96Sm48EL+NztQCbcUYpgEW+Jz1w/hwZG8LLLz82AbeIodOLXn4X2jaAXY/4h/vt6PtjpFlGmkklNLcehmoPywQ65M1zd/bXbimS97r6kuZusyWlcs4voEv2kSxNJ7YczdoXqUfR5DgtX01oL+UKR1Lcor6AFkoxAZ93m
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6166.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199021)(31696002)(36756003)(38070700005)(86362001)(41300700001)(54906003)(76116006)(64756008)(71200400001)(66556008)(4326008)(6486002)(66476007)(66446008)(478600001)(316002)(91956017)(110136005)(8676002)(66946007)(186003)(2906002)(5660300002)(8936002)(38100700002)(122000001)(26005)(53546011)(6512007)(83380400001)(2616005)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnVMeTR5N3pnUVg2V3M5OCtYSVVEeHNSaUtsTzFBSS95RnMzSVJrSlluUStM?=
 =?utf-8?B?MXBCL1RZNDJMaVpnT29IaUtSREZxQjFGVUJkR3FKSk1NbDJOcTZSdFZ6Q3Jy?=
 =?utf-8?B?c1A2Q3N6ZllCVmVoVmh4RlBNTjNFck92RlN0WktPelZHei9Fak53ZFpYbDF3?=
 =?utf-8?B?VTBRaitMWk9YamFCNTd6Z0V1Z01rNHBPZWMxVFM4UU91dDE1SWVKaVorODJt?=
 =?utf-8?B?dzJkWlFlTmNHcDZORkNsQi9tb3NoRXZRajU0aVcyaXo2QzhxZ1NsQnJ0MmIv?=
 =?utf-8?B?ZTU0OXhsbS9VTUpMMERsdnVQbmQwUmtjbXNRUXhmdlBGamhRSm9GcU9aVG5r?=
 =?utf-8?B?TjkyaXJQRmVrQkhGazZzREhwM1lWdElocTVnL2dvZytoNktnVlFBOGw1T2lS?=
 =?utf-8?B?SHlSbnhGTTZuSlMzcFJGaFlvZEJiVHh4eGtHeksreWRLVStFZ05CbmFVU2pG?=
 =?utf-8?B?bXB1c2lxMDR1UStudlFIb0lFMFlVMU1USXVOdFBOVllVYWsrUU9JbjhUMlZo?=
 =?utf-8?B?MHFvemNYNEd0Y2tNbFM3MCs1bmNhSUp2WEVlcllML3hWRFJIbDljeCt4Uzkw?=
 =?utf-8?B?d1ZQbHQ4V1B2UU0zV29QdjJXVzNpZ1YrSUw2dWM3eHo4ZGxtMXJZK1Q3NG5G?=
 =?utf-8?B?R053ZC91Qyt5cHk5RGZNSEY5ZmR1RzZKY3RiZXZpYkdEZnFNSDJKVDY3eHZx?=
 =?utf-8?B?Zm1VMWdwa2hVN2NzZWI3V3ZIK3IwaW9CS2piR0k4cVJkTTg1TS9UWjNKbERJ?=
 =?utf-8?B?aHJmWkNNa2pUS2svdm1kdjZqZE1Qd1g0M0cwQWtGOFp3b2hyUzJTNUxtNnZP?=
 =?utf-8?B?d2VBS2FObStCYVlTc0hoNWhTTzg4YWVTaE1xRUw5UmhJclRYN1g5K3MxZURU?=
 =?utf-8?B?U1FiK3B0YmxIQ1VKKys4dG82WHFySFJ6cWFVZHlRcXV5L1Q3QUtZZk54dnNL?=
 =?utf-8?B?clVRU3JDZTFscHpuWlRGTmprZ1JDWTRQSCtZcUFYZ2YzUDlNaE1mckdJRHd1?=
 =?utf-8?B?UTRuSWF5dklidExZb2FhSHh5dHA2YTJLU2ZYeHFQb01iTTB3SUZ6Q2NUeTB4?=
 =?utf-8?B?UVVncm9BSVlIK3RuaUFtS1Nuc2NQNytIb2NVVDExWlhLOVNzRzcwS3lHVnNp?=
 =?utf-8?B?aE50SmhHVVRoUWNTdVRzb2hCQW5LVmRaZFNSUExqWTlQeHY2NEFVRnFEYWNw?=
 =?utf-8?B?S3NKWHVCWjEvWEpOcHR6N0FoeXBLZnNLamFicDlGL1Q2bE5CdVBoM3h4QXBD?=
 =?utf-8?B?TWpHQ3lycmhFVFB3Q2pDZkQ5aE9RL2xaYXF6Y1hiSEIyVURzMEUydm04Zkcv?=
 =?utf-8?B?emZ5Tm5uREg3NHhxdWNwWFN2aG1QSVpMU2pGVWx4V0RwNTBVVmlZQTdMK1M5?=
 =?utf-8?B?RWt0TW1FWEtndDFuUkpjUUo0WFY2WE9GaEtiSkpQN2QvNXhaa3Z6aEMyN3FZ?=
 =?utf-8?B?TVVNT2FneDhpd0phK0kxM1JIcm84eGtGTXBqT3l1b0FJVCsvTEhTS2VIVFpC?=
 =?utf-8?B?cElKcmNQY09tYUFuM2dyRlFSbnVEZ0hLVkVUeEQ5ekM1VTBocWo5QU01L0Rh?=
 =?utf-8?B?aGdYLzJGeGlWNWN2NExoMEJGczVLdExxODNtNEtmalpwaFkycGNlZXhBOFJt?=
 =?utf-8?B?Mkt0ZFFkVE1YbVh5UWxEN1R2MXc1aDV2QlNITmd1dS8wMkxScFdZdzc1Tkpl?=
 =?utf-8?B?Z28zMmZTNDVCNmZ1RmlEZlZCbWdzK2NIcXgrQ3JMRm9pc0cwZGU2UzhvSFc3?=
 =?utf-8?B?Z01UZUxnQldJUkljMGJwOW5Lb1MwUmNIOGNOOUc4VDdYV3BUazFFNTZlZHNk?=
 =?utf-8?B?RUVHRzY2SUp4cmVmdW1RWWJWYUFHUWdHSW83VXNwTHZ1NkVmVHphTXo5OWJO?=
 =?utf-8?B?dUFZZitNeEgrelJFckw0REZndDdoQjFkMGZmVkJabXFZYlJNTURGK3VWWm1P?=
 =?utf-8?B?a2t5MEZlVFV3TUE0cjQzcjhVNWZhYytWNmVwWENuNU1yWDB4NUJkVlJzZUpR?=
 =?utf-8?B?VVIyekx6QjhvVHN2ZGtWMUF1UWFaOEhodDFoMjkwdjRoQ3RKWXpHb001Ymg2?=
 =?utf-8?B?Yy9GdjdiK2tnbjlGSUJ5SDB1OC9SVTFVczQ3cWNwRm01MVVIVnZQSkhvcS9X?=
 =?utf-8?B?ZHZ5MnVndm0zSTZnV0JrQW1uY0psdGhtWEZBNHZxeWhBTTRScDhJZ3FTdU84?=
 =?utf-8?Q?KgZPWfLdQLL46NTEisKarDI=3D?=
Content-ID: <E00FD2FE07EAB045B12C5BCB28D8F0B5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6166.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f48f6d7-6fe6-4ac5-2d3e-08db346edb14
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 18:11:32.9519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5x3wPGDOdxEuuIQjUt7aF9PFGd8hR6GaBEc9fEIwx1e8ZWzbI8H3vh2UJa/RTNqPWcMx1MDeaLRd6nE+1f8ViEH0fMpsGSTQWOsr0rXbPShDnXtIeKd2lqzmxlYguPLX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6504
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_111145_583944_E625B71A 
X-CRM114-Status: GOOD (  35.77  )
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

On 07/03/2023 20:22, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Here are some fixes for the system controller on PolarFire SoC that I
> ran into while implementing support for using the system controller to
> re-program the FPGA. A few are just minor bits that I fixed in passing,
> but the bulk of the patchset is changes to how the mailbox figures out
> if a "service" has completed.
> 
> Prior to implementing this particular functionality, the services
> requested from the system controller, via its mailbox interface, always
> triggered an interrupt when the system controller was finished with
> the service.
> 
> Unfortunately some of the services used to validate the FPGA images
> before programming them do not trigger an interrupt if they fail.
> For example, the service that checks whether an FPGA image is actually
> a newer version than what is already programmed, does not trigger an
> interrupt, unless the image is actually newer than the one currently
> programmed. If it has an earlier version, no interrupt is triggered
> and a status is set in the system controller's status register to
> signify the reason for the failure.
> 
> In order to differentiate between the service succeeding & the system
> controller being inoperative or otherwise unable to function, I had to
> switch the controller to poll a busy bit in the system controller's
> registers to see if it has completed a service.
> This makes sense anyway, as the interrupt corresponds to "data ready"
> rather than "tx done", so I have changed the mailbox controller driver
> to do that & left the interrupt solely for signalling data ready.
> It just so happened that all of the services that I had worked with and
> tested up to this point were "infallible" & did not set a status, so the
> particular code paths were never tested.
> 
> Jassi, the mailbox and soc patches depend on each other, as the change
> in what the interrupt is used for requires changing the client driver's
> behaviour too, as mbox_send_message() will now return when the system
> controller is no longer busy rather than when the data is ready.
> I'm happy to send the lot via the soc tree with your Ack and/or reivew,
> if that also works you?
> I've got some other bits that I'd like to change in the client driver,
> so via the soc tree would suit me better.
> 
> Thanks,
> Conor.
Hi Conor,

I tested this on the Icicle Kit board, looks good to me. So:
Tested-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> 
> Changes in v3:
> - check the service status in the .tx_done() callback rather than
>    mpfs_mbox_rx_data()
> - re-order the if/else bits in mpfs_blocking_transaction() to please my
>    eyes a bit more
> - expand on the comment in same
> 
> Changes in v2:
> - up the timeout to 30 seconds, as required for services like image
>    validation, which may vary significantly in execution time
> - fixed a typo!
> 
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Jassi Brar <jassisinghbrar@gmail.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> 
> Conor Dooley (8):
>    mailbox: mpfs: fix an incorrect mask width
>    mailbox: mpfs: switch to txdone_poll
>    mailbox: mpfs: ditch a useless busy check
>    mailbox: mpfs: check the service status in .tx_done()
>    soc: microchip: mpfs: fix some horrible alignment
>    soc: microchip: mpfs: use a consistent completion timeout
>    soc: microchip: mpfs: simplify error handling in
>      mpfs_blocking_transaction()
>    soc: microchip: mpfs: handle timeouts and failed services differently
> 
>   drivers/mailbox/mailbox-mpfs.c              | 55 ++++++++++++---------
>   drivers/soc/microchip/mpfs-sys-controller.c | 52 +++++++++++++------
>   2 files changed, 67 insertions(+), 40 deletions(-)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
