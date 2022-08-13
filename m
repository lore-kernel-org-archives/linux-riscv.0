Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75255C19F2D
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Aug 2022 17:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTGsmJ38ZOt4pzBEJOKUC5h8EKpXHaFaDaKexMSDcMA=; b=MHF2IcJTa81w/h
	H//GO08fDj5jSRUxfxbkfm7x3SuWi5vbarp1JJ6epb8VurUaYSUe+cYBoH5nkdB7MGXkgQ1l8axeL
	2lMOWff7DwyamgXbFa3We3byZNXKmqelxQN84Jl55bGvV/odfGGJtIMJw5L5GVYpES9lDzpUzPfdV
	6HCaIcqslAsL5nu2wpk26D2y/65rSVVp3v1iJfowlSf9o/3XV0NZI+hosXUWO6uaHF2jGo6qNiLSI
	ncu1jNg8k7japFrpT4YmPLlrXLbMn1uERhBPlQta9Mtc1E1On14FaKi0eZE+KMLebwgjoULm+ACDb
	PbAvnEcRoAA+PQLNRdVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMuY9-00G1fu-MD; Sat, 13 Aug 2022 17:03:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMuY5-00G1Za-Jn
	for linux-riscv@lists.infradead.org; Sat, 13 Aug 2022 17:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660410225; x=1691946225;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gnnW6ETQuZxUWI9ILGit84WOmjm169dqeZGvOKwAJts=;
  b=ovPALxUI1nAtUQCu4yaFb3M9iNQBE0fIv+4qI99pwNw5fKxaD4v8TFVH
   cKIX13WuRolti4Rg6joMxmbcI7m1fGEkHbmyXK2e4IBWt+8qc7DGhVcHQ
   X6RcHqk4fekzk7ECerVoWg80KGr+X923nijmqdhD2D8rBLoFM9em3Nbhn
   ik5oLHvhAfhyzxaa7E2q+b/pAzE7ak26ntYtwQqegfm0iMev/bde4kmgU
   ppaoRdYiLaP2ltVUnEq9MTMRGmvBMiqrSvuIeBm//zgUy/d929+bK0Six
   WSJGeoBI26hUgUteH3FrWDxRJcwLDbIDsc2xy+QJKDBAnb/cvkIyWe/n+
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="176267796"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Aug 2022 10:03:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sat, 13 Aug 2022 10:03:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Sat, 13 Aug 2022 10:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0+8Gdd6uBppBQesRSFbFst17As/ogcjDX/N8OEtmpOx5v0QUFN1VBjvQdrqDx7qyJgxFUQXmW7syr/IpwjyVRaiQdszoILIMq/FL36XhVBHwnLb7zmIBo/bdhEoAYGMQsxNnPZMso21+eD06qWl38USrGaQVoM8rHny8BAIS2jN6OrIv+DxOjfd5/3RkBD65ltiP09y47thWMybWFeYLJ9782RVEPniIOO4jobIJXEGb4WhKV8sPhZ81aV5vZh1NttiZoa/DJz8oUBTNvzXnp0jzaDR3pHi0TDCpoOOt1USmkyv+w7ZYe5n7Nw9nbjHdPsVRoSjZb1nsWgaLwkcKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnnW6ETQuZxUWI9ILGit84WOmjm169dqeZGvOKwAJts=;
 b=aX9XbYb0vswfc1LbLq8FU8C+CMyqF9o9tc8k62oIopVQ9TjcguqWRbyliX72lNrwj7LXCPPadiKhRVOFjeH2uT/ZqWyyAUcjNhXjtWza+BYxTO1LiZp+Ga1mESrNK0e1+Qli5vSQAII+K92XeZAxLdDIvqgSZoD7j2aTcmqmCT5GDJMzRiIkOPiKpTTHgKsBABeyxvXL5JgPTgvr72bt5zHv11m6eEpO7bLHHFFtOnsURx35t6u5IefDceRYaRVI7zXVLoD4EQAUWDG/NPlgsuU8Xk3sdd61fDPDaMz62f5VssTy7CcOs487sCPU1AWkWFl5AWvYJ8A/zOh838YRDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnnW6ETQuZxUWI9ILGit84WOmjm169dqeZGvOKwAJts=;
 b=Sm6BkIXwLO/24RsFKd7TKoy88u/bCxej4OKVYn2bsvIUT6aTXe9AvQzIlwClcACBgNTFnUYwu5BdZa/7rybtBD406mB5Vq1AHWe7qAQcne5qfAG/AgsIXbraeWpGYfOk+0poNeAF1htyiEUqD0/qhGJc9IOlIh3vZl0BG/qsuj4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR1101MB2086.namprd11.prod.outlook.com (2603:10b6:910:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Sat, 13 Aug
 2022 17:03:25 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Sat, 13 Aug 2022
 17:03:25 +0000
From: <Conor.Dooley@microchip.com>
To: <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
CC: <arnd@arndb.de>, <josh@joshtriplett.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-api@vger.kernel.org>,
	<akpm@linux-foundation.org>, <linux-mm@kvack.org>
Subject: Re: [PATCH v2] kernel/sys_ni: add compat entry for fadvise64_64
Thread-Topic: [PATCH v2] kernel/sys_ni: add compat entry for fadvise64_64
Thread-Index: AQHYqqqKU1/CfoP7C0edtMKZS35Sga2tF90A
Date: Sat, 13 Aug 2022 17:03:25 +0000
Message-ID: <03c5f897-d4e2-8408-6116-ad7619ca385d@microchip.com>
References: <20220807220934.5689-1-rdunlap@infradead.org>
In-Reply-To: <20220807220934.5689-1-rdunlap@infradead.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 885b6399-3fd1-413f-4361-08da7d4dbc62
x-ms-traffictypediagnostic: CY4PR1101MB2086:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iDoxD0rPaCEFNTP/j0+6hgXUoV9xx+/misauFs9SvdRpWECeAZ5sIS0WRhghNOI/In3/Hft1hYKcR2bLDerzhTbmvZPCSZqTyqIJue6aLI8Y+rqLcLzjGlofoYMhLc0r0lj/zKBSndl0JyokUdEx3izHkK4mwHTuxFuq6r9mIi+Bh9Oln2kOjzsX6DumawcGbrJIFK1bIasDxOUjqR7GP9eq8IXOe/k+Ak+OCuRkMTQv3C8UXmRRd6+3eEYMgK+7UFpqOBiRCkbNOFnuCLeKCmr74vJieeac5puHXNfx15WLWlBbyRPffULWKFG7ODq85OB+qeUB7jk+b4zwcsUuMwzUxP6sA1ngfVHy0640edQzwG9twc4Fsa8fR5jWfzE/5Dqj65Pr6bYy5fEPowdodlQJCbkBHPDQNojO9/KHASFwizGW69eQBmSGKLwjIvYLck2rICLyqH5TMnEFYl/VNTkHGRI7ZJtISMEQFJ8qF9w+5uvs0inrwW1aI44bJ0PJZWCDMZ/Rt1+POBHBxIQB1fCTdxayxvpdBMLthO85fl0DGl5npibq3iRZbS6++aKKPk8dETSD0Cv1NBeqXAGBiCn3a6tljJYvvMerEIID6m8jRuZVzdqUvs770kSdwPdFhLHP0wr2k7FZSNEk6icBpMjeJjdfGcY+09pQ33pjTVcxD/wPBbUyoswB83FD0HwuI5p2y8y1knsJiKRzHgD6ju7EsdlxklAIfP2S7PKDpHHOJSGA8uqS72YD9akO4UbridSI7p9iVmIFhWeIytwC6nLj5UsKryaf3V79+4XkAx8MyQpHKrcNSU2Jdsx49ZVsKV8lZrYhTxFoSbsFCINhhCwoJ5n6B0hi6ARDKI7FQWWZknEewvZbDqSMAN6J15eG7m/BOmbbIs0CGrFlySQsCQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(39860400002)(136003)(376002)(366004)(54906003)(110136005)(8676002)(4326008)(966005)(6486002)(41300700001)(7416002)(5660300002)(186003)(31686004)(36756003)(6506007)(2906002)(53546011)(26005)(6512007)(2616005)(38070700005)(86362001)(31696002)(8936002)(83380400001)(76116006)(66946007)(66556008)(91956017)(71200400001)(64756008)(66446008)(66476007)(478600001)(316002)(122000001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmVWS0RETUYrWWRDZUhmODIvZEhBMzhCdC95YmhSaU55YklDRUdXL3RoVFlG?=
 =?utf-8?B?ZnpmcEFKcmYvalNnbHU4Y3d4eTNVbzE4UGpJMzdIMW1HRTdrTEo3TFVkYVZr?=
 =?utf-8?B?V0xNL2Q0VEgxRERNZEZ3MDFNNjFsR2FrRFhFcnFsSVdhd1VyQUVsOUJlYjEv?=
 =?utf-8?B?N00wekxkMml2T3BDS2RxdWlIdHhvdHVpdnhPdlUyNEFQTENUd2FoSDRhWEtR?=
 =?utf-8?B?WDhyazdPVGNhODdVUm44WTBOZEk2SnV3WTU4SHZRTGFKWSt0dnRBT0syN0xq?=
 =?utf-8?B?bE42QWJrWDVjeUgzd3JncTdnYjVpbkVhS0xFNjRQZzVRYmpoejh4NkxBc1dU?=
 =?utf-8?B?VDlBN1VKcDEwMUw2aG42Q3V2bTJDRWYzUmhFbjZyV2wrcGpNUXBIZWxuc2hy?=
 =?utf-8?B?Q2NHcHVPRk5BM3hGTU5CNkwzQkhHb1hIc0tUUy9QTzBxR0Vnc2R6MHA0V1lB?=
 =?utf-8?B?dWM1MGRrTGRHQkZyQTNTWDVleXFidGMzNkZ4aC9iRFYvdnAvOUZIckRheGtY?=
 =?utf-8?B?WXd3NnZEZ1JZYkNTWE91RmV4N2huV21pRXI4b2F3NnorZWdUVDRKWGlQN0Zx?=
 =?utf-8?B?N25mbmludE5MengzWW5iWXdtcUNMdGE3YmNXd0l3bmNLNUNUTnFJMzZLNk9x?=
 =?utf-8?B?Q2RWcVMveDRWRGpZbVErT2RoUjJ6bkU2Q2xzdjc4cVZFY0lZM3VyZTNqYnFI?=
 =?utf-8?B?eTVMNDRSRnZIdEl5cHJkQllqcDA1TW1MMjlLc2RWTlBWSEZoNTl1OFg3UWJp?=
 =?utf-8?B?TzZvZkdzTjVtZWM2TWFudjBYanlHVmlsQjdsUjB3NUp0MDI0WnVUcGlZSFFU?=
 =?utf-8?B?WXdtWFZyVjF0WDhXNlM1OHdrOGhxeHZBcklnbm5MbGhtU3QxN2VhaGZJNDRF?=
 =?utf-8?B?dzdMeElYeWZFVmZuemRQL3NEcjluNzc3dVRTT2Z6bnkwNmYySkVJUThRMGsy?=
 =?utf-8?B?R1pGeHEvWWNsUDY3N1VuQUp4TkdjMFFrVXlkZ1UvNU1qcXliNEdHSGJRZktT?=
 =?utf-8?B?ZkRTRnJiUy96a1BEeXIrTGhSYTNkV0RsTStidHIxaTZUYjZhWmN0MkFtSlFI?=
 =?utf-8?B?WlVYaUZOMEExNFY0NkdTL2IxZUNGNFFIMFpVUitpRHpMSzI3d0wrOXdYM2pY?=
 =?utf-8?B?VGRtd2JkVDY0NHdrY0NhTFUzN29pNXo3TElkK0V3NzdEeGVSRzFCaFQ2S0Za?=
 =?utf-8?B?bVVkeGdlZ0xEMTFVYnVVaGRIRDlvRzFyQmFWdkVIQ3F6c1IyVVRPN0ZCVlVz?=
 =?utf-8?B?UEs0dnRvcEl1Tk9NMk5IOHV3NUorNEg5SWU0NUVLQVNCak9XdmFQSW5yRVU3?=
 =?utf-8?B?M3MyZHlRcExTbjNYNUthYXI5VC9wRVh1RDBqNTRuZ1d1M1d2NXBJa0NmQ2NX?=
 =?utf-8?B?bzhVYU9JWXQrM1dGRmtyaWE2OENLcmJITmRPVXR5WUdQYTdLZEJCRDNYSklO?=
 =?utf-8?B?Q0REMTlZT0ZNcjVnK2RWeFFsYVg1ZWJVUkhuR0FLWXQybEIxMHdPNmUwc2tW?=
 =?utf-8?B?TmowRkQzNkdFV1dqVmlrS3NtRi9qeWwwMHJobS8rcHZjSkhGWFcxK2tic2J5?=
 =?utf-8?B?eDBBd1JldEllekxrTWZBdXVlVzFwREZOemNNWDh5RVQ3cEp3SGpwa1JMU0RU?=
 =?utf-8?B?d0tpUEd2aVZPZk9KbVJrMmxDanQ2ZWZma050eEZxcitmSzFKUk1Va0FDbXdZ?=
 =?utf-8?B?WksxOWxlQTFZVkNjdytvczlsM2NxWThIKzJZODlYWWh2cm9vNGFnbzhVSjgx?=
 =?utf-8?B?MkdhWm56cEl0UnFCbW1QblIxU3ZlMTRodFVtUjBCOElxTFUzaGM2eUNDSmxq?=
 =?utf-8?B?blR4K2NPTHJRdXpJUGhPRi8za0FIejFvU1hYNGtqZmN2YysxSkkrTzB0U09U?=
 =?utf-8?B?ZFAvaHkwbkM1cFl2RXllVVpFWWh3VWRMck9DcHo5YitIN3hJd3BwVXl3VWp5?=
 =?utf-8?B?cXpKWFZlK3NsT2h3ck9FZGVvanl5ZC9xak82U1FTdmpGNEY1ako4aHhFTWo2?=
 =?utf-8?B?U3FKb0VLeStxUlloZ0RXd3JYZzdNRVEyRXpUWDg0dGQxN2dWYll1UTV1bEI1?=
 =?utf-8?B?UXRqVGJjczFYT0QyMmVieUlKUkk4T0k0VUNWYkZBMSt3cXg4V2NzcnNGVlc2?=
 =?utf-8?Q?+Vkcv59pdTYOZSmkw3rw9FDpn?=
Content-ID: <08585A0326D2B4438AA2EE541C09CE6F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 885b6399-3fd1-413f-4361-08da7d4dbc62
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2022 17:03:25.2700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z2mjNPOAnR/LZmYjOkbzmQ7GLWVEE9E7ngqcAN0CzftQEpg9odZwAhlA+rtnsjEf4ODeP7TnsupWH3Qe+bE3CTPPpbkv4t/+ofrhmi2bi1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220813_100345_678535_4C2C7A7D 
X-CRM114-Status: GOOD (  18.33  )
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

On 07/08/2022 23:09, Randy Dunlap wrote:
> When CONFIG_ADVISE_SYSCALLS is not set/enabled and CONFIG_COMPAT is
> set/enabled, the riscv compat_syscall_table references
> 'compat_sys_fadvise64_64', which is not defined:
> 
> riscv64-linux-ld: arch/riscv/kernel/compat_syscall_table.o:(.rodata+0x6f8):
> undefined reference to `compat_sys_fadvise64_64'
> 
> Add 'fadvise64_64' to kernel/sys_ni.c as a conditional COMPAT function
> so that when CONFIG_ADVISE_SYSCALLS is not set, there is a fallback
> function available.

Is this in a 6.0 destined tree somewhere that I've missed?
Bumped into it while looking at an unrelated LKP randconfig error.
FWIW:
Tested-by: Conor Dooley <conor.dooley@microchip.com>
Thanks,
Conor.

> 
> Fixes: d3ac21cacc24 ("mm: Support compiling out madvise and fadvise")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-api@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> ---
> v2: patch kernel/sys_ni.c (for any arch) instead of arch/riscv's
>     unistd.h (Arnd)
> 
>  kernel/sys_ni.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- a/kernel/sys_ni.c
> +++ b/kernel/sys_ni.c
> @@ -277,6 +277,7 @@ COND_SYSCALL(landlock_restrict_self);
>  
>  /* mm/fadvise.c */
>  COND_SYSCALL(fadvise64_64);
> +COND_SYSCALL_COMPAT(fadvise64_64);
>  
>  /* mm/, CONFIG_MMU only */
>  COND_SYSCALL(swapon);
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
