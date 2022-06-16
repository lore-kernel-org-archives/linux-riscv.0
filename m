Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B06C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 06:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8g4+abNPGraXYowkrj4ij1Ms4teNQJW4Qo0jhM/VKI=; b=q3ilxa1MpUtLJn
	J/v9TWIsfc4HRAPDye6LSMW5bpPlCiKFg5IL3nAS8S0xWpHRN5xCBOfNZuHFyV+P8eBw+dXIIg0Fd
	LZ9KivxZ7eWbd5hDTnaH0qnFAC5JGmR6MUjcNZMepAUA9MeKzh1FkCGTCQqlHmigfNjtNYp8omV++
	S2oe+w30KnB31LpA6FDlAQwOH+hI+khDjkD7VOO0tDN4/qBbf+5rW4rRtleKLgbqji/+eCrXMVoVY
	R/ahvfLG3noM6ccgOLr1nHDT3so8QU0xCE9bfwRD/R3yNGmfM/hbFLzXZCNX1J8V/l7WQkSXTDA75
	KxqroYyBN/YNiURQrIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ixr-000iB8-Pr; Thu, 16 Jun 2022 06:26:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ixV-000i2K-Cv
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 06:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655360785; x=1686896785;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Nb89pH8h9wR0WLVhKBI6AK9AMbHSM++P7/ERs4gA90c=;
  b=iRnD+OZDIHs7K6NE126vCclcL/3D7louI8RafkcffIFcUQ/wZAoTLiv5
   XCI9h/inHXiuDnTj45Rbsjk83E9JBOd0CnDqDJZQdtA1jwqzjvGxCfCdf
   f+rKDmIt+VbxeYV1VOzU5/9Xu7BDrdnt1CJB3D80NvdE+hoQTPn42JLS5
   lNsjrZsIFtZiTHLDmrnc9SoQSndm5agRVQS7T1YwnbUOVfPKl8XvLrMDR
   W08BwU3n6WXPo5+tdC62oVAP5CJ5Q64bpp6ZiobZUXF6CZ1afDcZ5V5W/
   0p21pkdrupSWhR1+TH+jcboIcyWW9sXrjG6kh0j6a1S0RUYGXnOCE8wNQ
   A==;
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="100274952"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2022 23:26:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 15 Jun 2022 23:26:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 15 Jun 2022 23:26:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+hHQH7iD06r4LSf9JmZUrtgsMrQri6WavF7Tc8wS8140Tpt0Xtb0GhmZFOx3Sj7QjWTYQEF3nJEsM6+1GEBbTQSG8GireDk3fr/ckS5Tt+3aC62gk6xAOF5vQzGLoQEE6cfD77WTAtqmkiVUHOal7O3b0XqKSzKaQkmwcttz1za9G/nj6poZLyxV1lYMkWvU5qUhnTEJi0unnoWKIWr0LgD70e6FoB3druokxtinWocozdrTa0iaeL46CnpHUYzD2Dvzu3j37/80qYnFB5Eosj2ukuMKSgAIjyq1mRxkDmm7llTC2oXJfvDOfm9bRP2tnzTzdzC61zF9Sa/+y7AAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nb89pH8h9wR0WLVhKBI6AK9AMbHSM++P7/ERs4gA90c=;
 b=Q+avsluDceGaSfTclguzlHgYqDLWFzNwnF63TmBPfkit4VY1cJPOxzIkzRviICeTo+1wMY2+YqGvp+f7aX4JZoww+b5lCpJ4BhyaUcb/YDlviFeuvaEU0B1j6/XrYiKvFGFk+bkzx++kFbEUA8t8eQ0D9rqZwmQ3BiNlPxVFGYeHbnpapnUt7RdCjcaOR96e55JNUBc6rCj+XJiDakYi+ghkbDb8Bs9lLmF7ZqkZqeoIL2PM4EXMmf54GN8N2oXS8jtRag7IeLQGZf+oXivvWsIjs0oSDo8K3SDqrEKuIvF6u6wxc9+fFAqTOtBBvu4A4K0+lhlnx8hJ1K3lWiL14w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nb89pH8h9wR0WLVhKBI6AK9AMbHSM++P7/ERs4gA90c=;
 b=vZwbt/lDD6OfyVHzgTyZb3ZlbqqpGjgDFSWLqKjhj+FCv8mZBnOsnu3RRaciYh4JVfMGbe8Q5xrriAvTB3Lw+aergi1lKYRie+vWLCssAaDIYsn5SwkTQ9x4wZyDZ9lIT6viEa7OHQmmxyrAPA99mfu1bYwDN7PRClmSA+zPVuw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MWHPR11MB1678.namprd11.prod.outlook.com (2603:10b6:301:e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17; Thu, 16 Jun
 2022 06:26:17 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Thu, 16 Jun 2022
 06:26:17 +0000
From: <Conor.Dooley@microchip.com>
To: <windhl@126.com>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lkp@intel.com>
Subject: Re: [PATCH v2] soc: sifive: (sifive_l2_cache) Add missing
 of_node_put()
Thread-Topic: [PATCH v2] soc: sifive: (sifive_l2_cache) Add missing
 of_node_put()
Thread-Index: AQHYgUn8SukD6dFAFUCiRY+y1/CvAA==
Date: Thu, 16 Jun 2022 06:26:17 +0000
Message-ID: <fe1c23cf-dab4-d926-ffef-7a8a5489a071@microchip.com>
References: <20220616044915.3978097-1-windhl@126.com>
 <28cd6700.3e2d.1816b13f1fa.Coremail.windhl@126.com>
In-Reply-To: <28cd6700.3e2d.1816b13f1fa.Coremail.windhl@126.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3add941a-fec6-4aea-d603-08da4f611ebd
x-ms-traffictypediagnostic: MWHPR11MB1678:EE_
x-microsoft-antispam-prvs: <MWHPR11MB1678CD0D65F24F894D13AD2698AC9@MWHPR11MB1678.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X6ddQ23vmqHrnyaPmQ77slmrkfnN/AkBNer75usAtPSRltquJ4CeRxUbrVjMLdlk4xmD/g9XfduzWWuVpN66tBsjK/2+yRE7RIHShdijWClmNHfJ65/TAEPSkMJ2peIx4IZvuGjmAK4Cqfndz0uV88BeCbTkexDxl0y7TlH3q0wEazOomQHhyXHs0Aqclf2nRsa3XXXUB8PvedFBcG7TpOCQOj4lAbx0dzQCNeZu9ij7h3NtIRet2rFNW3Pt8XQRkln9u65d6+naZAgsahRiX85DfN78DVUWvMpSCwQ24xQOLEM5iInMtAauZHunfSFtewuG1pJkHxfI04PS49qmMme3CSPGrZH/rc27IlWIDY7jRt1Nu4xd/fOSoXCQhES3UnGduJ30emv439dp8pljb9KcTidOu5icHBQCW6Li3s7TyL2ljYjcsytv41o7QKCpsTtdZmHJIMjgmFjylVvpfIJV0T7j0TAzTXvf62ROTy2Ib7vI1UmPfwu3Ib+GVQ91ZH6k4eQeiJjJmoYu7X1NCjd/OG8AshtwGbB2JOdee0uz0o9uJnZvpYqVz4w0Jsfi5EIptEj9k59W8kDXMi5vI7czHD+VRB4n2ZT8FKHBZaIfQtxAc3uynvCU/49OVcrZpuQx0aSeFT1k1E8XEa04R6d68NNnvYbiuIMZ54UYrnUhC6+ufVdJLrbKeuohPR05TzbZFBn4zpJ8rEcX8e61MfdRKrJqSENSTu7104WA78/yAgyrV59Ek0z/NscLG64yS8mosQpbRqqZhvd13bHyBw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(4744005)(5660300002)(2906002)(8936002)(31696002)(122000001)(38070700005)(53546011)(66556008)(6512007)(36756003)(66446008)(8676002)(64756008)(508600001)(71200400001)(6486002)(38100700002)(4326008)(6506007)(66946007)(316002)(76116006)(54906003)(2616005)(110136005)(186003)(91956017)(26005)(66476007)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGpSUmJKQWpvOG9vclNHRXl6bjNocDNxNEYzcnRDazRrMWNwR2hhb04zei95?=
 =?utf-8?B?L2ppTlc3bG5yTGtYWjdwTURkNzFpaVlhckp2ZGVaUk9aZnlpalhPdWg5Y3Yw?=
 =?utf-8?B?RHFlMGVMVTBIcVdjSm9ONnAvd2VHYk1xRk5nVTVyTDM2UHlmUjdhSm8rYXNh?=
 =?utf-8?B?TzkyM1dURGd0MEx4R1JXaW1nUFRrV2IxbDJGb3pqZlFCZ1FsY2pqTHF3Z2pQ?=
 =?utf-8?B?NXRHdHM2RW9lcEQvbDNTWE9WKzRrKy9qWlZNbGowRnhRTlpoZ20zNWJKQzc2?=
 =?utf-8?B?SExYdkp6T3ZDSndQSVpvTThNays4L0VYbnJ1V2h3aTFPUmdNZWFjeEJ0azZi?=
 =?utf-8?B?Z1pXMU1Lc2ZHdGdiN1hFMUptc2hHNWpDSGFkZVhGVVVMNGtNd3ZlenpYSGNn?=
 =?utf-8?B?SHExbS8xNmFtOTg2bjdSSTM0dDhNTDk3aStNWW1KL05xek5OZldWSFNXbWpk?=
 =?utf-8?B?bkE5d09TVXFtOXFkZ21HckU1a2JTZVU1dU1VNEpkcXRhTCtKQWVFUXJPRTdy?=
 =?utf-8?B?NFQ5K0x3VGo1ejIrY3ZRS2ZaaXJBRFQ3L2Y1OXdZU1FXMjN3L0F2cmcvZkcx?=
 =?utf-8?B?VWRuV01NVFI3L1JHM0UvL2ptd3NEbTZMUGVrS1MvVWRMa0k4b2o3MXhKd3pj?=
 =?utf-8?B?M0RKZUNOSzVjRGMrU2xTanFYVWtZdkxYeFFTUWxsdVJxcVZVVU1GUkx3SGVr?=
 =?utf-8?B?ZVdrOFZ6N2ZGeC9QOUZrU2RZaDd1M2c5QjV0L09HRlhaWWRCL1pwRXVhUlE4?=
 =?utf-8?B?T1MyTitHNmQ0eFY0ZmxyN3VmOXBDbXVrZ1lpVzRkeENhclZPQWdJVXBiTTVr?=
 =?utf-8?B?TnVkMUFoVnByRlpGY2tzS3BOL21uNWQrV0xoZDh3R0l6RktZS0k3cGVFM05a?=
 =?utf-8?B?a1BTVkpCRGE5eWM4dzByY1l4M2wyY3RVaVo3SXN3cWIzcmtmN3h3cE5zeUtv?=
 =?utf-8?B?R3lsUURFVXplS21sNEZ5UG5JR3p4bmRqdE16OVFxNXppKzB2aHAra2FkVzNX?=
 =?utf-8?B?TExPZmlCeGZNRVFCc1VXZGRRaFhpamlsOWxFNEFhV0JuUWFycmk0bG1jRmF4?=
 =?utf-8?B?WEJOVDdpdGZFNm9EeERBYXNJS24wckdVRFNYMnFJNy9lTDZCSy9RM1h2VFVX?=
 =?utf-8?B?dldXaHZGRytLZWJnWFFtRys5dGh2NHd3R3lpNU12bTV3bnhvZG9hOTEzK0Zv?=
 =?utf-8?B?TFZNSjRhQU5OQWVMK3pQUGJHZXRLMzVVTUZ6MjZBc0RCK2hjaTJvSEpSNnhp?=
 =?utf-8?B?bVUzci90NncrY2w5dnBpbnl4emxZeE5qMG9BaVhla0lUOHI0UzlWaVp6dDBh?=
 =?utf-8?B?dzZHbWxzNkNMV1hjQ0FxNjlydGZzUG4zMUxicTVvSUtJZnZjWG5RYlBqa1U1?=
 =?utf-8?B?dzFNS0JZS1cva1lhcWdESEV5YnhrOTQ0MG9uM2RSTkFrenpBWFVhbnRoOWFY?=
 =?utf-8?B?ZTFFeW5zZVhXMDgvYlNvSHZiSWpMREY1b3ZDaENodU1KRWZ0NnVLeFhLYVJV?=
 =?utf-8?B?V3FYV0sraU9wbGxnSW96aWdKWkFXWmNpYkNONDREbDREWkJIZVBXYks4cGZU?=
 =?utf-8?B?L1duRHNmemMyMWhSUXZ5ZTFqOFVLVWtyMzM5UEZ6RVFjVVVkUEpqbTI1blFZ?=
 =?utf-8?B?VHcxODBBeHIrQkNoS3FSSTYyOTZWclJkNVZ6dnVkSjRPbndsS1ZjcXVQemdp?=
 =?utf-8?B?N3dWY2JIcDlMZmlFV3l6WlRvSC9COWs3K0UvTGF6STc3ZFAvMVY1RkUxYUc3?=
 =?utf-8?B?elMzdkUyK2Vqek9qNU5McS85aUFBamdaNzVJQWljMDBmWTcxOEdIaXVyeUgw?=
 =?utf-8?B?WDRQeHIyenVoTXNRRllzVXlEaTFSVmtjdy8ranRPb0lHRUNxOEtwdHY3RU9M?=
 =?utf-8?B?RXljbWZEa25EL3p1REpwVWpsOU5SOGRiekpMMmpDdHZRa2NDMFZTV2tCTnF2?=
 =?utf-8?B?STBCTHQ4UHJxRE91NGZLV2lFdFBKSWt1UmZkUTlkenVTMXFJVkNnODlyTExI?=
 =?utf-8?B?N3BqNmE3K3ZNN3VwQlgxUVhOTWlFRHlRZ3dvZUhhb044YWZ6QzcwUXNiS3N2?=
 =?utf-8?B?QjgyUE9BMlNtTmIwT3g4R1dtdlhud1NXcG1kZWJrT0NZZXBEaEtjcUhLMERE?=
 =?utf-8?B?T1VKMUorK3VTQTArOUswWlJvOURMKzluVjczWUdxUnB1UGxuREwvUW51R1pu?=
 =?utf-8?B?SDdIQWRsbW5qTEhnVGt0Y0YvcGNQcXVwRkMvOVdaWXY0Zm1JeUV0NCt1MzZN?=
 =?utf-8?B?YVNZUW9GT0RTaHdkZkNsK0hEekZLOTZBUEdrckJzblc0ZGNUNnZMWmFrS2o3?=
 =?utf-8?B?MFQ5dlVJcVJkL1RKZDJycEJ4L1dXZFBDdDlkMGptWnplblBzV1o3UTFYSHZx?=
 =?utf-8?Q?72ajse3SXNP9N93Y=3D?=
Content-ID: <BD83169253777E43B7F349F03ABC37CE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3add941a-fec6-4aea-d603-08da4f611ebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 06:26:17.2057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QeKtXYd+7avMx8/Er8v8bXh9Fgnu5CQjP1jHokkDpSXfHEJazpB0ErQxfdYHnjy7SVO2fjNNXYuC1h4Kwi2drOVSYFI5TEhAbS/iBKCebZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_232625_797481_727C0BBC 
X-CRM114-Status: GOOD (  13.65  )
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

On 16/06/2022 06:54, Liang He wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> At 2022-06-16 12:49:15, "Liang He" <windhl@126.com> wrote:
>> In sifive_l2_init(), of_find_matching_node() will return a node pointer
>> with refcount incremented. We should use of_node_put() in each fail path
>> or when it is not used anymore.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> Signed-off-by: Liang He <windhl@126.com>
>> ---
> 
> 
> Sorry, please ignore this version as it still has a bug.  I will have a strict check and compile the code before my next commit.

While you're at it - drop the Reported-by too.
You only need to include that if LKP found a problem with
a patch that's been applied already. If it's on something
in progress, just fix what it pointed out & resend.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
