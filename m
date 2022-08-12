Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C603CC25B08
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=thR0LWopEE0FQHoMsSOEsEzR1UiuzrKaGTrg0ztDagM=; b=2Rz6SVQDkQj3Of
	iDbnLlyWRP/MkWsG+zeCHuSfju11zGKCPCA8OUdHKl3lONK4NXnLItWru6SNnn9KifgP3kE5HbGk8
	NED4dVixaKYMaza0uc1ol9T/z1EvOTi68fPSSfBT+Ydbou/KAdzmV8B4nwIwlmYyLUF7ERBlO7xOi
	1zjpyW8AC4Mii78bfGm7kJSFCzEBEz8+lVcKWrIDNPpkwcG+XhJUgKu40tgKXXRrcPkQ+tysxkztQ
	d3XBMUoSMna2Tv830HJPV/JeH1FRHEdNL5aaYLpGiK8FkiObDRoyfAhH4rDmHGF3IiDUAF66SaCHl
	6d2oN+w6MD+XFF4NhDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMVWP-008r04-0V; Fri, 12 Aug 2022 14:20:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMVWK-008qwR-GF; Fri, 12 Aug 2022 14:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660314017; x=1691850017;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mSSHtUeVM+A4C8f4M1t1LHXxuMVjfYh8bn5ikOhx3jg=;
  b=N0LiYdG+GpzLiHkHk0gdeD9zvSB2ox/IY/5sSRw/GI7rUrYDOFLOwGhx
   KebmUhflsHJcIW/nbDPLlJimARMOOWTN1fkuQgzUeWOGiFNMpJ2zY8nsy
   /kvB9Ct9TuNVyw0othi9zNN+DM3k7iWFa8rJEftz3neQaYxPkXqfcswgR
   aErb4bAPycREYQzxuoVxNGzWXzFugf+gOJvRb6hF/4m21Izv22V21xpUL
   V2FZ49XwjpSfuMgBTHbQGGfyM/riM+oktx+sT17eoXBuBKbGyjBMJmXH1
   NbutKB6BGrM51El2A8cPpgfYE5mYmlIIIMsvbo2tZHVi5wyN+e4qiM+uC
   g==;
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="169043945"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Aug 2022 07:20:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 12 Aug 2022 07:20:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 12 Aug 2022 07:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0gxg7lHXyJDVIx5f9+0Fdg6Okg+5IwTwfst1lH7IjnNFLO88F9bq5OgV6gYauJVeWrqNjkwwY5EWvWWBfuHHCrvZMUaDRuwSeJf+ns8CrgFbkWvQcaN/vFifBsxXDpjQAhI+XxyDAoZ3d+GZ0VmkgLz/xbvyAsugd0HsfvTsHO/CDuhV+6NEOu6oHwKcjXaBJ4b1s1vDv2vY0JmTXk6R71CPlyusGBIibWV3l0vt3f5hXYVy2FncAIGi+kVLT2w5Oj4csYNsEJhIC89tMYYNjHBtiQ8NzV4RPSfR4V6gGuZKr/VUQwYjTjXA4av+dB7D5XhDczKC1JbGX4LcWZsRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSSHtUeVM+A4C8f4M1t1LHXxuMVjfYh8bn5ikOhx3jg=;
 b=ZtMZmbCTV87gEflX1lt6VU2m0qpMcFmYzTxmf0dVSFNxnsSBTOCot4dEiKkXvqfIU1ajowlPtltcxwXv0xb0U+kW5KqjGBlQSh0/vI544NrnCSkGxvybweROYFTWy9Umsg/ByiFauCGSgmbouAwNWr4n0HQzoC0I+Pkq0+Kdc4N58jLvlB26ZFgTizO/yE0jIkSeakfkg4e3UKk5MBiD4mQkvCRSCGwsA3he+MjQ5L2Stc6vmSVtjoSlqYUgLcmit7UD1hd1dLmsJM/kredVHBFMaFURrGHWFdmh/PvYbj9N/jaBm6VZTNfvgmjdUPpu6+ScHdkpKlP3kHv4stBCcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSSHtUeVM+A4C8f4M1t1LHXxuMVjfYh8bn5ikOhx3jg=;
 b=CWyAOKnR/xiNjH1nDdwGKEY+Q6FdYNKG2B/4vm5RH35+N7PKZUSL8t2n7DZtPjDA4LwtSqI2detlIBut/Qu/3YVFFp9kQI7jHZRU5W87im7FCniwosLdQbi2cW/eeY0lN+tDmQifuO1JqKql0X20KIylBcI5/KWfN6MqdIuGxGk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1706.namprd11.prod.outlook.com (2603:10b6:3:b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16; Fri, 12 Aug 2022 14:19:54 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 14:19:54 +0000
From: <Conor.Dooley@microchip.com>
To: <jrtc27@jrtc27.com>
CC: <palmer@dabbelt.com>, <palmer@rivosinc.com>, <atishp@atishpatra.org>,
	<anup@brainfault.org>, <will@kernel.org>, <mark.rutland@arm.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] perf: riscv: fix broken build due to struct redefinition
Thread-Topic: [PATCH] perf: riscv: fix broken build due to struct redefinition
Thread-Index: AQHYrlLLJJmuNPzJiU+k51rJJC8n162rTtwAgAABmgA=
Date: Fri, 12 Aug 2022 14:19:54 +0000
Message-ID: <84e4739c-0197-f9d9-5529-24f6037c85fa@microchip.com>
References: <20220812135119.1648940-1-conor.dooley@microchip.com>
 <2055040C-D443-47FD-B6E2-C4C6B3E600B4@jrtc27.com>
In-Reply-To: <2055040C-D443-47FD-B6E2-C4C6B3E600B4@jrtc27.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bd406d0-de11-4fda-93db-08da7c6dba12
x-ms-traffictypediagnostic: DM5PR11MB1706:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /m41IsnzLhfvGGBALFf7bY95pxHzB515+r5l6khfHURiMGEAjI/D5XNe02QQeUHsKPxHNqZPf/p+xonqMH8FIe83i0hNYON8xEqIHAAeDm9vDTEylOdBPQwSPTQGOcq1cdKwxfympJjuOIR6rTH6SrkmumEjD4PHZWYWohnsQvgyfYF4XrLS6nuvkPmYI6chP+Y9/lOahabhqCyQvl4lIZVWHSy8OAEVMYNjJc30EqDdHVDJpjVk4gujaKEJlGx2BalBrj3JC9tTmaF2Yl0fua+0q5LnDBhWc86cdPiZhk2SZF5mRTGnI9HLDJ8OLXNvMSiUXUesFLv52QRTvEThInIjqgRH0VHvUWHqjvq/356eXUsw2a00Ar7r/cEup99vk4zN1ec6GjcUq5eYvIMi7IqsNL/0mtQIB4T3VVICJxnUxiFhWl4D2GrRz6iBkAV6WL3WpuEoxsNPg6HGnCIiiKOvWoA13w0dyhfp7kFkB1UWViWVYflm07DFTbErphjZ7es1po76ZH8pwexkawjkJtaB8NdivP9V1FwoSJ0PvAgD5molL1bu/p3Bp+YPeu+3Knz/9XgJFBiwP2I2t5anH3vEQhyHrQCXqgjOgZisTSTuENUsC74xtIp+fjNNDnsmSUQUv0Sg4sJeZLG5Ut4qOFMhabNN0YyoyPLYFXDbzEM9AJ5hoQfwRZnB6B7B3O1SJGO4Gxvk6Mx/0Gitr9rH75kLQwnLCEnoo/m0PWAIl8DuLQJZt7JT1jzhoXNRKyMUlEaIxVr2gNDsPJ9bWg32wyOIhZel78T8o0Hg++O4lHfyqC3eMXLoobGbRhAYNyClqy0DFPwBx/E/SYPB1jQeIvmNYqkJh6a1BR6pUhKlM268IA1LA8W3py9rPBxpMaIyLpLGWba8O/QV7kqU3y7cHQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(39860400002)(376002)(136003)(366004)(186003)(8676002)(2616005)(64756008)(5660300002)(26005)(71200400001)(31686004)(36756003)(41300700001)(53546011)(83380400001)(478600001)(6512007)(6506007)(6486002)(966005)(38070700005)(122000001)(31696002)(86362001)(76116006)(316002)(6916009)(2906002)(66946007)(66476007)(4326008)(54906003)(91956017)(66556008)(7416002)(66446008)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3AyNklFN2pQajNIbjdwUUN6aFF4b0dqTGRJNld4UEl4YnZHRFNWZm5Ua0U5?=
 =?utf-8?B?eHJQNU41d1ZYNHhraXBMZ2QvaDFVRUNpSGNoQXc5dlBhRVVpUjBhZHJPU2hs?=
 =?utf-8?B?OEZIdjlYMVJ5R3l5NHZCcjlqTTdBZEFjZ3YwTXI5c2JJUk5nQm1HQkIvWmtK?=
 =?utf-8?B?RnFSR1JTdEVJRzIybHZrYzd2ckM0OXVWNU9lQis5TnlDTTc1dEVJN0ZKUGt0?=
 =?utf-8?B?eUZmbjgvczJhSWNyVm1jOHJmU0xobXVSWk5oZUtwK01ZTlU2RWlLK0t6UWRP?=
 =?utf-8?B?TFJVZGVvdzFsZUwzU1JVbldPU0Y0MXVwZGd4eUZSZWRlcy9WVmNlQ2I0WE8r?=
 =?utf-8?B?ZHoyUjVTWFhnYWplbWVaK0pmbkU4QXZZdXo1YzFWM1RKR1RnY25GSlQvRFVV?=
 =?utf-8?B?UUZWamhEVGg5NktodWR4MFBUQ29ENUZVYm5iVzAwdzZhNzJNb2QvTjVxczhu?=
 =?utf-8?B?M3o2Z1Q3K2VTaG1EY2RXWTRvLzMwTmxBaExMci8yZTMwMXBTRjB0ZnF5N0VL?=
 =?utf-8?B?bCsvWXFlMlFhdmx1UjFKM2RMSVZJeHU5WFJtbWlQSmUwTitGbm5sQU5BTFpw?=
 =?utf-8?B?NVIzNFFzZ0FCcVplWEJIbksyWjhZbUcyVU5OWko1TzJvdDNJbDhKa295eFBY?=
 =?utf-8?B?TENyTVhrQXY5YjZPRmxiMmpBcVNmU2hXZXdHQlFMWkkwWmxtZUxVV1Q5VzlI?=
 =?utf-8?B?NTJGY1E5Um5uU0hUc2d6eXQySDNicFVTdkh1OVdnTWFmUGp0dllFd2FaRW10?=
 =?utf-8?B?eGdxOWhaSzBxY0IvNFlnMWJlck05dDY5eHAxOEpCSDNUT0tFL0ZKV3I3a3pZ?=
 =?utf-8?B?MkFNYk9WTGpscnQvTTU2elNuMjA5QnZvL1JiTUtQeG5jYVVNVTROb29yU2NL?=
 =?utf-8?B?RVR6aTR5cGQ5T3RWbGQwRWpCWEg1cW82V1hQWW81dFdMZ1RVeUZDeEVtU3B1?=
 =?utf-8?B?MzdsY3FXT3ZmUDZsK28ydDlxQk9BRVVRVkYyT1JPWW1yeVE1c1Q4Mm5YMHh2?=
 =?utf-8?B?SHNIeDJoNHFNMFR4RXFCUDQ3cTdlVVB4TERPb1M3ZmFrd2hwOTVwMUI0VjBS?=
 =?utf-8?B?WVZzS2FDNmRTajhSUml0NUtvVzlXRUFsZDd6bGQ3M2s0R2dlRHN2RlJtRW5q?=
 =?utf-8?B?R3dpQlhkeXp4d0VLek1TSDY1MTJsSzhXWDJodE5yNFpINmtnNzVDNkx1WHZv?=
 =?utf-8?B?aWZjeDdWWHlVdlBWbDIyTytHUXZBZDlwTzVtRCt6aFlvWHo5OFZuSXYxWWIw?=
 =?utf-8?B?cnRCd2EvbFhYVDNHaVowT0RsRGFaRGtOQlNxaHpmNEJiUlBwTlBXcnRWWkNR?=
 =?utf-8?B?VDJDZG5zLzVvQTFWZmNSaTFUZjBCWlRrTnYxSVpMOU9leklMNVc4YTY5RFBX?=
 =?utf-8?B?U09pZ050Vm82Z2tEQ3Voa3Z4bk1pQlJIOFhNb1BaTTdrSE5KUUI3L1g3TU81?=
 =?utf-8?B?Qm8xcDA2UlBNaXgrcFI1MDdaVVlXZTNtb3A0ZWdzTDNUSDgrSGhFMDE5SDF0?=
 =?utf-8?B?ZFgrMFRtMm5XbW8vbjk0R1J6bHBYNDBhMEFwYS9TME9iekZIdVNsTUljc0hJ?=
 =?utf-8?B?M09QM05WQmtxTkNhQmVGZkF0Y1IzanVYd3NJUExoNjAvQUlzUVpxMnAvM1Iv?=
 =?utf-8?B?L0JqcWh3SWRrN3JDQWhPYWZLRk1MUlJXbjJubnBMb2FyUS94QUR0cHNDRThY?=
 =?utf-8?B?ekhBdVhKMml5d1BDaUo0KzJGVmpjeWxvaVBMRk9YaXdhcjYxeGozUCtheEVI?=
 =?utf-8?B?Vzk4QU91QXhPVDJBMzF1cjR5T0FscXVSMXlVQ01KbkYxNkNybDYwMEZtVkVk?=
 =?utf-8?B?d3pkZTYzbTFCWlVsOTBOa1F5UHFDSGM2cDZUU0tzOUkveVMwMm51TU1JbGp5?=
 =?utf-8?B?RTJFNFVmSURicFRjNVR0RXowVzY4aHBkQmtOS04xYzhKdnplVWJZS2krUkhL?=
 =?utf-8?B?OEY4cjV5VERrMTJiYTE5YUJ4dm0ybE9vN25aV2c0TWxvdEd6dDAxRldQYUUz?=
 =?utf-8?B?UFhoQlFFUUlld3R4M0ZPeWR1dXIySkQ2aFA3bmZTUEZyTTkzQ1h6SHphOWxk?=
 =?utf-8?B?clFhbjVWL2U3ZkhZUkRzQXBmOTIrSnpYdDR1MVF0OG14Wnc3QUhDOFhYWkt5?=
 =?utf-8?Q?jH7ScN/yyiBg0AF3bUXBAcR/o?=
Content-ID: <DE306BA35A2554469981DD0DD1660A3B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd406d0-de11-4fda-93db-08da7c6dba12
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 14:19:54.0936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: By1k4vycwj78Y4eU8Ej4EMXDsq9bCFj7fUtSATXyLqHeedjlooZ7nPrpbG4yQzUiCptXwICvq4MwQnYzANo6+Y0sdwuEnUP+pJ1tkAhCobE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1706
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_072016_860625_560E9170 
X-CRM114-Status: GOOD (  14.70  )
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

On 12/08/2022 15:13, Jessica Clarke wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 12 Aug 2022, at 14:51, Conor Dooley <conor.dooley@microchip.com> wrote:
>>
>> Building riscv/for-next produces following error:
>> drivers/perf/riscv_pmu_sbi.c:44:7: error: redefinition of 'sbi_pmu_ctr_info'
>> union sbi_pmu_ctr_info {
>>       ^
>> arch/riscv/include/asm/sbi.h:125:7: note: previous definition is here
>> union sbi_pmu_ctr_info {
>>
>> This appears to have been caused by a merge conflict resolution between
>> riscv/for-next & riscv/fixes, causing the struct define not being
> 
> union, not struct

autopilot, thanks :)

> 
> Jess
> 
>> properly moved to its header.
>>
>> Fixes: 9a7ccac63f9c ("perf: riscv_pmu{,_sbi}: Miscallenous improvement & fixes")
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> drivers/perf/riscv_pmu_sbi.c | 14 --------------
>> 1 file changed, 14 deletions(-)
>>
>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>> index e7c6fecbf061..6f6681bbfd36 100644
>> --- a/drivers/perf/riscv_pmu_sbi.c
>> +++ b/drivers/perf/riscv_pmu_sbi.c
>> @@ -41,20 +41,6 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
>>        NULL,
>> };
>>
>> -union sbi_pmu_ctr_info {
>> -     unsigned long value;
>> -     struct {
>> -             unsigned long csr:12;
>> -             unsigned long width:6;
>> -#if __riscv_xlen == 32
>> -             unsigned long reserved:13;
>> -#else
>> -             unsigned long reserved:45;
>> -#endif
>> -             unsigned long type:1;
>> -     };
>> -};
>> -
>> /*
>>   * RISC-V doesn't have hetergenous harts yet. This need to be part of
>>   * per_cpu in case of harts with different pmu counters
>> --
>> 2.36.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
