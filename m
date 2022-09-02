Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D80BC38145
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfH2ZBbpM+Ip1QbgHYhlZ+r/qD4IqFz4GdjM8BJETY8=; b=q3zKnMOoz037tu
	fwy5HFC736NHSMS9Iuzp8zNoCk8OSr8DZMtETTRgRsMnoQ/daN8L35Wsj0cTFH/eA+wpJBKqD5G3O
	5zzeBg0eIUZpvv4qbzq7ybc4UsN18Zfp1//O+aMF+W6HYX7UEoOLBq/vWhROTsWXw8OubHUlmiy1f
	1SuMfI4SEcVSQXuQzR9QL+3J4B1NdRxYgjt7whEuJDualbcjRZnXUVSVrVBBrYYiU0ILUx1rTf8Ks
	jHwSUOIjT856nh1ibIKo3t/xsAnHPFKce2PueVfZhGQzhR3MyslrM907krL5xwow3C4ohu2JZxJ7R
	qhdXJSAyu+B31TK9NlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU33S-002h0Q-15; Fri, 02 Sep 2022 09:33:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU33O-002gxu-SL
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 09:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662111214; x=1693647214;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mneCBuOkPyjCH42d3wMnu7Kwbt0RJKQ3iQw9BTqfmVQ=;
  b=oXQLVu5FjayE1bcTFrEShuKFTqFfzY/Qx/L5rQkSHUJ/dkXqPlxHMfnW
   twJOUOu7I+HsBqeFRvDZL6atJ7yChn24vyvmvAEtEn/qmPtvEgxHVj2DV
   RsRbk38pPUkPCLN3LK8PHVlljGCbr/aMZAOdtLG27fdLO9nz7eSM0Xh6h
   4/9FRiwvNC0Ws2nnCBOgb+J5xaCXk0mLnvv7hQ8OES8LZ6ie6Tg3M7igh
   XVgy22hmvx9m82zPo82ELxAgtu1jnif5BAA1emrkNnWP3o3w9DpBmFbzV
   Pf+Wc9yI108nOgdDD7665j2B0fFCU2zigJAIPJQcBUkmnYQEDGj2VhFzC
   A==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="175350860"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 02:33:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 02:33:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 2 Sep 2022 02:33:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpuemnX0+/2uwCwwa5KBI6dnIO6bzd59nZ6EL08TB4BTmEMpXk6/SmVjQwfeJ6RsbJZin9+BJs891IrBvqVU4zHPi26byvpLtlDi4MzptesnDGA1UiFmcRAL2PliExVa7gJAfI/XbvuZNDl8Vb+17Kccx0JeRmx8QkpHMup89zK4MDryM/UtjichAnxn3uCcUQCdAnGQxh87t2fwndRVaiHmXeCZkTN/nGiNo4hVmjmPAG/5xOM5AJlLGxGMpm21JViS25IiNTNVMQsv+FPBSUYHKGgsdrj0xt4YQhUoUn+EYNqSSxj1DkzaEzS5so7wIQoAUoSgw733R88b7qMsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mneCBuOkPyjCH42d3wMnu7Kwbt0RJKQ3iQw9BTqfmVQ=;
 b=llnr/mVOCu7pshFwAoVwiIy1dOgeA+8wSfi7IoxegTPmiWK4WrwCeZ0mCzmGmAzjLM4f0z+UYwVvHNpyxZUxAsesxRhi+XfzEwLOoWC+0ShKxRx13174GtDTTRBBywzq+oldgvfo9dbvjsy97JNY2volC3+MgVBQ73o6hMHMvoE7G3In68i4HoNHXeuESiqT5AUqJe546jEwGrsp7bte2DKXelv47pF3b+5/LFmORJlJQORv6t5RNPxX8vhAk4hexfa4k2sVxYz7VX+bnqetg78Baydm0OW4bnKKsLqBe0NhU/yP+p85i/YwvuTP5Zdl99IVxASt9rkTxEUUZUexGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mneCBuOkPyjCH42d3wMnu7Kwbt0RJKQ3iQw9BTqfmVQ=;
 b=BCY1ZQBTb3vvVWOKHzUD4lsP0KDOb+PsPLujaA8d9OIAsM1RzNV9r0GCC4MBWC9HS2/+k1InhFobwvq7Wx3ZKprLbrYL+oLjoG5itQI89KzK4ixTnZPtK0/u70xb4+om1dLVSZA+5aB2HpdZKxSDRroH13ogfTfxFYx8gZkdDzo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR1101MB2363.namprd11.prod.outlook.com (2603:10b6:3:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 09:33:27 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.010; Fri, 2 Sep 2022
 09:33:27 +0000
From: <Conor.Dooley@microchip.com>
To: <guoren@kernel.org>, <heiko@sntech.de>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<apatel@ventanamicro.com>, <atishp@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] riscv: check for kernel config option in t-head
 memory types errata
Thread-Topic: [PATCH 4/4] riscv: check for kernel config option in t-head
 memory types errata
Thread-Index: AQHYvlIzMjs1NuF9V0KyYwO1U6icxK3LU9uAgACNiAA=
Date: Fri, 2 Sep 2022 09:33:27 +0000
Message-ID: <6865a605-2428-e6c2-09dc-aa2a66e48c55@microchip.com>
References: <20220901222744.2210215-1-heiko@sntech.de>
 <20220901222744.2210215-4-heiko@sntech.de>
 <CAJF2gTQsXMB+igwMiya-sqyku+3iQPop1JJuHwXtTToj163h-A@mail.gmail.com>
In-Reply-To: <CAJF2gTQsXMB+igwMiya-sqyku+3iQPop1JJuHwXtTToj163h-A@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 743a2344-be57-4ae1-6177-08da8cc630ac
x-ms-traffictypediagnostic: DM5PR1101MB2363:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FxoKrkforygdv4OEi6k4xSHQP/xrhuzZxs62DOg2ulCipvuaoNP21niJoTNcTXqwhFhi0hgz/7L7Y8QHH3Kz4IqbguAyvvfpFTnkBvnPrCFChdpypPMvkVFBy+tnIv+lK6peNoURnUgb5yCUJzcVDEOif+X7LOEBA4vNymN5rT+UaXwi3h91GLTcfvFXpSqv98OvvFBFfx2tTTo5lqeygngbWN9UaIyeR3xvvpHxCY0BI1ZOs8ZQYjMQB63gWcyOTRThaWBoHbn8HZHj9/0m2QYfjSTeFxniBfKs22K+q8oRbjt3rt/pubPatIvL3vMIHke8KviVOovdPST11ViQiPUgbrbiOkQLa3WHhlb/EEycmbmv60qwOTjC4AaEpsztxhrZh0+gjsa8BswVb9Wvpttrpq4b8EUngl5Y/+x1C/2d7G5JeeF499HZ1dZikogNNSU+nvD/vbF8fwo1O/yPnNVCIeHpPYUoL8+iK3hRWuHKpJb7MZt1eJkkF3Mt+vCMOuJLAGtdSNCXVL63u/R3SOkxAgmwmMKmcoDUTd0OijpCucm4Vf+8WiB3ALPVMzReQkf7zQ3qboKJ92DGeK2qC3ezD/1Kyy/7kKVLzGHhN/v/tmvWeQpKLwH9dRR4hV5+DqYJesqhfOhJEOTVL0QbKbohMNzt948iNP/+FhwlhjacwEwwTGB0xf1djcXjuXcHJWWx1ZeUS2IiQLHXkohdmcrj/lcftyTqcypPAcwDDqKosVg7FBjlZh8uu3aa30aGQh32ImwY4XC/WHutZuOrulFmQA1whWgNZG5irJLkGne3YLy63PavTUd4S2bCIqgX+iN0hx3KrT9C8AK0QEytlg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(346002)(39860400002)(31696002)(38070700005)(122000001)(38100700002)(91956017)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(110136005)(54906003)(316002)(2906002)(8936002)(5660300002)(53546011)(6512007)(26005)(6506007)(186003)(2616005)(71200400001)(6486002)(41300700001)(478600001)(86362001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emNUb2VwSFdxU25VSjduMHF3d1hqZkhpV3JDVDZNZmRScFU2WnFPRlZrbTMw?=
 =?utf-8?B?UkRIT2Y2NWhvWmtrRWdmRTcwMkVCeVBJb09FVWRoTHBaSUpjUnkwb3BoQmt0?=
 =?utf-8?B?bFhXY2lHRXVFVHNDcDU1blJ6OGVFSVlQU0E4a1krcXRpMERqZHdUbXZybWxq?=
 =?utf-8?B?OXM4NDZKRkk1ZGZJZmdzS3M2dEppdXhhRHZpcnFGMnpDMkRFeHdRMWlnaDNo?=
 =?utf-8?B?WDBLajZ2RGcvekpHaXpXcC8rNTlpMXVzS01XbE1xNnlUd0VCQWpyYVVYYUtB?=
 =?utf-8?B?SkxCc2k3TVRFbTYxLzJKejJ5SWFteXVWeXAzWEp4TVJjZUNpVFhZRkVwalh5?=
 =?utf-8?B?Qysxc0RNdWRndTY5bTM3TGJVU2p5MWxCbk56cmYwT1FTamthZXlYVVBjUlBX?=
 =?utf-8?B?MjgzN0dpMTBkS3VGZFlHUU1VdDRvODNqcC84RjNZUWw5RjFNeW5RTmtCbzFv?=
 =?utf-8?B?czViK3VybHlpMWFrQndkZFRIaHJsaHpvKzFzMVNEQ3lQc1VJLzVFOUM3aG8z?=
 =?utf-8?B?ek9RK2tEYktCdkprTVZtNU5wSFNEaStxb050ODZXNG9kM29ROUtjcy9HNm02?=
 =?utf-8?B?MFVLKzNjUi8yYldlNUx3WHQ5M2NCZzhiL0sxRk1CR29VMnh2REJ3THprYlor?=
 =?utf-8?B?aHNyaXBMQVp4c2Z4ZE1HV0Q1Q3g5d2pMa1Q3VFdLbkJmeEpLMGxYMUY1QmJU?=
 =?utf-8?B?bFhqTFRIVzJ3SitSR1RqYnZ3VU95UGZVRTNuSkhueDJnYmJ3eXl0VzNKNVp2?=
 =?utf-8?B?eWRzb0tFWHh3T29DZlZmMzJiS29BbEdBRTZaMHoxdkRSWHk0bGJSR21XcUxU?=
 =?utf-8?B?ZTFIZXFUdUF4b2piendObDN0aHJiaEhYTDVsVnlibFRnOGJLdWxkMmFFeVpP?=
 =?utf-8?B?d1hWMHJ4UUJtNklBR2kxYnZzNkRvcjVhWUZ4bUthSk1kYUZ5THZIdHVpdG5i?=
 =?utf-8?B?bThPR283S0wrcFFSb01hOVhRbkg2MXRMNHkzb0sveVp3QVdaVldBVVFwQkU0?=
 =?utf-8?B?Tk05cnFDWitXMFVUY0lFdHpjM2RINWhiRUVuSXd3Ry9MdEd6SXJUTm9CUS9j?=
 =?utf-8?B?MGQ5MGRqM0MveWhQbG1IcjhTRHpCWVh2a1ljaC9CZlllek5hOXpSQWNKa1hm?=
 =?utf-8?B?ZVpTMzVFNGhpK3ZoZWd4cTg2WUorSzAvUWNySDlacDNFd0tsdkVDT3RPRjRK?=
 =?utf-8?B?Tk10WmVNcExPY05jNW5LaDhwZ0VyKzlFYjJZdWprVXhsekg2Qnc0V2p2YThD?=
 =?utf-8?B?MjNiMUJoU0ZOaTRQUFBCUWhZeFdqS1pWSUN4MU1Ba2o3czAza0E0S05Rd1ls?=
 =?utf-8?B?QzVsRW16clZya3QyNTdFVHo0YTdkcmdPcFJzMENQS0FWSllZemZFaWFoUVRa?=
 =?utf-8?B?eFprL09pbHkzcFltbHIvWVB6VitDY2FxNkhWUXQveG9aN01JOFU1aXIwc1pT?=
 =?utf-8?B?dDNPU0wwYnBDMVFPR21oelN0QXBJZVB1cFgzOTFURnc4RWk4SkFaSXFsblJ5?=
 =?utf-8?B?azlZdzhBL3RWUm5IV0JVbGdobkV6cWY2cFVDcmQ4M0tmU1R1cXcrYUliQ0Z5?=
 =?utf-8?B?WUpFVHRIeFN5d0tuK2NiQzlmVnpjbkNXWkFaRkFKRGplL01nRVJRWlByTGI3?=
 =?utf-8?B?bjdRSVd0b3ljcHVVTFhQS0paRXBMUWpNSUVMVkNFODBXUE4zc3R4WHl5RlhC?=
 =?utf-8?B?OWphd3lFcW8xSW5QMDJIMU14a2xQWWNFK290SHY2akRha1UrSFNtMGNpRmZW?=
 =?utf-8?B?em1VMHZCVUoxL0VIZG9ERkpyYU55TDNaZnFwM3V2M2FTRlFSY3MrNjgrenRU?=
 =?utf-8?B?OE9QYUs0cjNDc1E4UTE1QnFPaWYvTm5ETStyeFBBMzBvTExEcXI1djhhWnlE?=
 =?utf-8?B?RElNdDlWYjhQYXAwSitKTS8vTEhvMlRyL1RKaTNnc2haQWR2VEwvZGZjbTY2?=
 =?utf-8?B?Zm1FNGRUSnhpNkVhYXh0YjZiYXFxaEI4cHpjTzF0TndxQkIwTVN2ZWloNkRO?=
 =?utf-8?B?M3BHT1NUZEtVbDYvUExYZG1wVXJDQ2hZQU1rbkNWcTJtUm9nakNycURlUEwr?=
 =?utf-8?B?QU1TeU1KOEFmYXlpaEpIUFFvbzlUaCt4dzVqN0FYSi9DcTlvMS96bVRCWkxj?=
 =?utf-8?Q?bFuaA+dLPXpJKxNgT31PlarAG?=
Content-ID: <F7E2F9A381DCE9449700A998E8BB449F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 743a2344-be57-4ae1-6177-08da8cc630ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 09:33:27.3894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xD4dl94cstug7AbjmCuJ18n8x/1YXhTFqsCdFVqW+3ecYs1MyOYGCfHBPs25eadTGY2EUzrSS11YEs6wgi8Z1WjYM9knJg2hcBsoLGMPYlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2363
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_023335_001841_2BC49A3B 
X-CRM114-Status: GOOD (  18.45  )
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

On 02/09/2022 02:06, Guo Ren wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Is it a Fixes?

Looks like one to me, seems a fixes tag would be good to
have here... Either way:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> On Fri, Sep 2, 2022 at 6:28 AM Heiko Stuebner <heiko@sntech.de> wrote:
>>
>> The t-head variant of page-based memory types should also check first
>> for the enabled kernel config option.
>>
>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>> ---
>>   arch/riscv/errata/thead/errata.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
>> index a6f4bd8ccf3f..902e12452821 100644
>> --- a/arch/riscv/errata/thead/errata.c
>> +++ b/arch/riscv/errata/thead/errata.c
>> @@ -17,6 +17,9 @@
>>   static bool errata_probe_pbmt(unsigned int stage,
>>                                unsigned long arch_id, unsigned long impid)
>>   {
>> +       if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PBMT))
>> +               return false;
>> +
>>          if (arch_id != 0 || impid != 0)
>>                  return false;
>>
>> --
>> 2.35.1
>>
> 
> 
> --
> Best Regards
>   Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
