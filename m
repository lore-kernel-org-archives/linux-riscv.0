Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47452C6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 11:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZUcqxuWSCr0UmhAThbJyJh7+W32nfglrc9qmBx2H4c=; b=uZClwYSf3kfZUw
	GC/51MnlOFbo8hzbCfjshVDFOgTCY6dKsH67ErqLQrdDUrJdqvWSbULRLx2uj8ZoYcfPIsBHFmPxo
	D/zzZDHc7PnBZzLcgRyxFtaR/ArskyvIXdM+G9Zg+K+cE7ehh2NRp9VxAHEybdAmFfy0UZpq8mhHw
	I29RBqhHega9fd4N/ocUSUE13JhVKyYpSkdoXomcCgvT/7/6xbXjlwutq/Ro7s2BYJWtz+zulf4/J
	ovKQVwqYqmPGfRH63bWFAAlA7/LH/NJW4W3DErHwgKLO8I1S1jpq+TGLafyfyx/Wh4gnt+RaC5No2
	wIucNUlZPHWfCzDXv/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcldN-00GDRP-03;
	Thu, 16 Mar 2023 11:19:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcldJ-00GDPt-0Z
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 11:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678965537; x=1710501537;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=HFV1jeg/L+Z8YNpqFU8VhNl8Dt6Cptg2f3YLKwdyE8I=;
  b=veahAL5YZEOB8Y/xZuoYJX2wvf/H9p4Gi8TJ5Gq+MlFXDHhAbcZ44Lpa
   Bi9opT+2N2S9TeLKMEXwHhMdL9hONJ3iA2o76o/zxkjESWMRwEb608gWb
   RQc7qZo9HmnfFN7CiqReGMfceDRz+juIp0lCI+Ub1w+s+ZzmpExNqp2ad
   HCF9m1+oJ/PG0zPZVfDyvGVySfca/o+V8KTIwexaf1nygkREANbAKtcYL
   PNjq6aME8Nd3XrEniy0XafkUyeC66kXMivVovpQNfGgexGYSTtAq69Scm
   4kMXKx3Qb8AfSKqSEtLkRO6WJ/HuDOGpf7H7mULY4mzAergEXxo3VAduX
   A==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673938800"; 
   d="scan'208";a="205723392"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Mar 2023 04:18:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 04:18:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 04:18:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qkr8GbFZh6N1/muxEI2UShDzD6qdh+GGTTLFePkPpxX1y6rfFeCLFGKbOEh1GkyY5IG6xThWdB7ybYRlU/1sw/ekadpsmyCaDhSNLgFk2SAmuAGuK8zes4vZdPqIm3hRoRu3WHYuKKd/eRN4j+PmZMsBQ7p8CX0Ugx4EWQv2IFaFhGl83HT3+OjuABO29imse5mYgesq0TzHb9L/MzKZcC74hpeDnon1u5dPOGQfes9C2CtZyHntrsWckg8ZdUG2JajqGEeZvavanpdhcr3n7U0Tkwy9Ixhd3Xp8j+gxi+OlUT31anpOALLSugZQGbbalVUPVh7k7Y38khGhxEwXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFV1jeg/L+Z8YNpqFU8VhNl8Dt6Cptg2f3YLKwdyE8I=;
 b=FYkUaEFITEXMfDPQ+I8Aa11FXtB3Yd3GeDk54HDFoOiikJE5SFxbF6JJV7FkvvvOvHz7YXeRlPmy9ohI9ixxFfYRJxaUM0YKXJkZnZJRimkbVld7pGfCUbdiiZLab+X83MGsapJvHIsIB1Q9Xz87Oi3PSLm50PFKofPhwjPT6dDTD8AS1vSOPQP1oDas2ZKp74azFD7cVoOAezR196TaLD4ie1mjOOpsoAvYvfJ/124vk7uwE4L2sp8tvzrZXcUF0H6uqWEL0MnX9UNv0ldwVkt4RlBv3AbFfUnORNHIB/W6IIV0EYnWtyNBMGBIVYblCTPFEGPeqgglsLcC2sAT8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFV1jeg/L+Z8YNpqFU8VhNl8Dt6Cptg2f3YLKwdyE8I=;
 b=SvWy2VIUrwZMASJNDD5k+BC+0qT5snhoFpyXWlbeNS0mw6MDhWd+tqpo9iIpCVlURWFojT2Mn351uVDI0rrXZcO2NgYNLFKPBRCuUerU0GTfBAdQuUH+VM2KHVS46o63RNDHOlu8T+tUJqB7LOgW/SXPjTqMn+BwihPmFv//s7A=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 11:18:52 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:18:52 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Durai.ManickamKR@microchip.com>, <Hari.PrasathGE@microchip.com>,
	<Balamanikandan.Gunasundar@microchip.com>, <Manikandan.M@microchip.com>,
	<Varshini.Rajendran@microchip.com>, <Dharma.B@microchip.com>,
	<Nayabbasha.Sayed@microchip.com>, <Balakrishnan.S@microchip.com>,
	<Cristian.Birsan@microchip.com>, <Nicolas.Ferre@microchip.com>,
	<davem@davemloft.net>, <linux-kernel@vger.kernel.org>, <edumazet@google.com>,
	<kuba@kernel.org>, <richardcochran@gmail.com>, <linux@armlinux.org.uk>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <netdev@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <pabeni@redhat.com>
Subject: Re: [PATCH 1/2] net: macb: Add PTP support to GEM for sama7g5
Thread-Topic: [PATCH 1/2] net: macb: Add PTP support to GEM for sama7g5
Thread-Index: AQHZV/kWO8w3ULUZBkKMSIDf5/SrTg==
Date: Thu, 16 Mar 2023 11:18:52 +0000
Message-ID: <96a4e3a8-3d1f-052c-3338-ad0073fb7fa6@microchip.com>
References: <20230315095053.53969-1-durai.manickamkr@microchip.com>
 <20230315095053.53969-2-durai.manickamkr@microchip.com>
In-Reply-To: <20230315095053.53969-2-durai.manickamkr@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|SA2PR11MB4937:EE_
x-ms-office365-filtering-correlation-id: c2b25695-4be6-49a2-1c15-08db26103925
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Np0TLrKtS1wZ07NTRD7r0r8aYWZtDoFd5ipGEVBvNFwzCkgx/aDcsyfiA7ubE0yHsZHd9B4qSFDtrcZH9roQYo4Vqr9JGsx2rCvaE2GNEL2qDaOCrhPeqLLs55gaCg/spUM2HVquqz9PlOuF3JOuu7GfM8Gz/WT7HsmOti9vHP165JX8ai05HLJBvVjxTqFmQPud55T6boIDDZrpynqinjsr/V5wB9ho7dXxgWA7LnX6G8sxvCss/FhSbmxTqLG3PLA+6q2heyd7LBNoI8zy3gcq/lNiyxC58V1yLKJSy2qWbv0cbNPbRVdr5odQMVcOtn3yPOF/UmDHSlavcwH/Hw8ZBDqhsBaIbkWSTFjtX+L7mbuqAamDpMUxSuhNb7g5ouY/prjOGREHSGkc1mfr6ltTj4udgP6wwyKTj6/+wvmgkUu8ksg6RolV+XJTZjl9sZMqhHFw9tZtCK4XAg+L/PU5BqyHVu+jGrsDSnLNJ0+84C4L0MgTsWvOxviwJSKlDcpiN+qdsEL+sG5tWCM7WrCr1y6pqbm/Un+90hRUOxxILJqNEkq/ATNpQ9ivxAGJc5dlJslcKPZcmMhJCMal/zyaPYrgcSEE74ABvclCUeTSh00YF2IRAez/VEYlfzSMY+I8a0h3ou5QifKiBAyppd4dYXB/eYHa82OHTRHcDQz7EzfeZsj5r6rb45gTiZmrUXtQolFvKmSe1Z2Sa7/QzNiUW+wF8b6MoCBhnsQVpDWx58+Gk+xKUPTHFrdwZhK5O1t0mHdbcC0f0IK+2jIRs4CMl9irZJjJoYsL0FxC+m6K2vx7VqWO9lSWSiQMs9sj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199018)(921005)(31686004)(86362001)(31696002)(38100700002)(83380400001)(122000001)(38070700005)(2616005)(53546011)(6512007)(6506007)(186003)(71200400001)(6486002)(110136005)(478600001)(26005)(66556008)(66946007)(66476007)(5660300002)(76116006)(41300700001)(91956017)(316002)(66446008)(64756008)(8676002)(2906002)(36756003)(7416002)(4744005)(8936002)(138113003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekM4bEpGTENpSmxyVW0valBUQUltNXdjOWVkNzJ3NXBPcG9WZ3RzOWhrZEVy?=
 =?utf-8?B?bWxQd1J0ZnAxYmhQRG9UR2FMVERVeGtIUlNHMzc0eGZYTnNwcGpneDRHNW5q?=
 =?utf-8?B?VmloLzRLSmtub01HSFFjVjB4WVltbVJOTHUzYVNIYlcwOGRxSmliN01rSzgv?=
 =?utf-8?B?cVlzb0lLUEo4cEYweGRzUjdtTW1KVkpQK0I3T2NBdkw1OVovWnVHS0IyTUMx?=
 =?utf-8?B?dkJsWCsrNkhsVHgxdDNNb2ZSQ0ExTmd5aXhnQXhTODM3ZHNwVSs1d3dydVM1?=
 =?utf-8?B?UTFpY0RRb0pEMGFHRFFtQ0toYklsZWRIRE1peEFPUlVUVEpaQktwVEhvK1lk?=
 =?utf-8?B?UlIxTk9oNXBIayt4eWVtdDIxUkFzQVpTT0I5bDR1S3NMdmV3YXlhWE5GWHNB?=
 =?utf-8?B?eDNwckt0Tk5DdHVwNVp3M2JzV0pKc0UzZUwvbU43emozclFCY25LVGdNOGd2?=
 =?utf-8?B?VTJBSHZHajYwdDZIcDV3RUU4Q2c4WnQ1VUZSUUs4UXJ5d243QW5VQnBOVWJO?=
 =?utf-8?B?aTFSZTYrdHlvOHJFdUhSbWNOZk8rMWZGbVFWaURVbG1ONTZDbHJ5RSs1Ky9L?=
 =?utf-8?B?cURTTWIvaUNrWWFZTjBZcG5NTU44QjlUMkEzVjU4M1RxMjhWSE4yVUVkL0NX?=
 =?utf-8?B?QXBzY05PTWdvVzN2UDlKa0NNMVY4ajBEckloWmZ4NEl0K1d6TGxMN2dRdEVs?=
 =?utf-8?B?QktHbmkxazZtS3VEWi8zRm9OakVzTVQwNTlseVFPcUh0dEswS1RFVEd0V25B?=
 =?utf-8?B?Uld3Tkk5RXV3SzlSU3BCM3NMZVdGcHNUc2IybStvZU1RMkZaSG54RlJzejdV?=
 =?utf-8?B?RWNxMnlSMGFkYVlUNjFkSWdYWXBLd1ByZUdHMnBzNzRNWlRmSk0xaDA1N0tV?=
 =?utf-8?B?eUt2VFpIVFZ5NmpaN1ViNys4aG8wdzRzVktRYXJuK0RJOXU2QkNLQUYwalBm?=
 =?utf-8?B?bTlnazZwL281YjRWYVIvMkxuRnRhMmpJQkhwSUFZMXppY0NnRnd0S0U0UW91?=
 =?utf-8?B?OVZMNTlURHFXayt4MndMUTY4S3AwMVc4NkRXc3ZiUnBEL2x0TFp6SEZ3MWdw?=
 =?utf-8?B?SlAvMTdMNFo4MEg1OHFnSEc4Z1R0M2ovZHpXOGZ1cUg2dTVlRmd5OFRFWnoz?=
 =?utf-8?B?N0xacDF4R251NTIwVmRtdXFHdEo3YTFSb1MrL2t1Z2RPblcrQ1c1TUdFTEZS?=
 =?utf-8?B?Ukl0UXNJRklDekdmWElkVzVoSzQ0VWpscC84aVdTL3BJWHdVNmYvNHhDdlVS?=
 =?utf-8?B?U0RsVEpUQnE2SFA3V3RSR3g4aHlmYk1udUo5dDVnT3Fsb3IzcUR1eituWGR6?=
 =?utf-8?B?NXYwREd0a2tmTHpKZUZKcjFRU1NxQWpROHFCR1FoUzVnUnV0dy9lUnAwT3d3?=
 =?utf-8?B?b1BKTDhuM1ZueWthQkhjU0huRWsrc1A1bGZBWW5OekpBNStkMWRnbUZKVUY3?=
 =?utf-8?B?c21uRm9IanVacWQzNWpLTG1QSkhtRG9LV0s3RG9RVXVreG5BelJxRFZlNzhH?=
 =?utf-8?B?cHY0WUNGOTdTd1NvMmtBL1NlVW1rRHhJd1ZkbmpQUlZIM01pcTNoM1RYaHJI?=
 =?utf-8?B?V3ZyRER6bW9uM2hlZktpcHYxbUliZWtSZmlCd1NXVWlST0ZLWlhlMFJKQUhN?=
 =?utf-8?B?MFhiaTJwMHk2TVpvcmN6RVI1ajVlcVNiRzRxZktnNnlnOW5hcDJXTzlzeUxu?=
 =?utf-8?B?eS84YTBHdk1VRFpWTkpNSG1nczNSckJKSGxNMVY1NktNY2pYcG9DQTdKeUVm?=
 =?utf-8?B?MDJLcFVwaU4zNnpmaHBpc0lCWS9XcWlGT1JybGFPM3BGTTAvVGZUTy80aVBu?=
 =?utf-8?B?YlJOYnJERkFzSEJIajNvbXhkQ3pETU5RT3J3OUY0MjVpSG5aTGdYVThOeTlE?=
 =?utf-8?B?VXNrOHdZR29kV1NBNmFLYkVHOVh6ZEx3Ri9hQzgwVWJ2RnBUZGkrM1ZVUU5i?=
 =?utf-8?B?Lzc2ak01SDRwc082S0lTNGhtK1FuZzRqUlVsYnc4MUNBOUMyZHdyTlJuWkQy?=
 =?utf-8?B?RGFCNG5pK1BnVzlDeUJCbEUvV3NqYkFqMnU1Z0lWSERRTHhiTXhkU2hnZ1kz?=
 =?utf-8?B?MXVIMmJvLzczVjRXUU9saFB1MzczRWlDVSsvRTR0ZFNscFAxYS9VU3huMHB2?=
 =?utf-8?B?c2Fkb2l4MHBKNEpybUZQcnhJTFNQUHk2Y2xIQllqT3RsQVRONDJveXJCeUZ3?=
 =?utf-8?B?emc9PQ==?=
Content-ID: <F4766F319F333342BC0455766201C507@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b25695-4be6-49a2-1c15-08db26103925
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:18:52.2653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPUTikggBwBKARaS+sQ1ID7855I0LP/RUfxKbBcRLkyHU5cY8iBkhD6Wn/U1IjraFpuqHUsB7zh+KobwAwqs+jZ/8t+dFWuExbu9SoCj/Sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_041857_282186_45E5E09F 
X-CRM114-Status: GOOD (  14.01  )
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

On 15.03.2023 11:50, Durai Manickam KR wrote:
> Add PTP capability to the Gigabit Ethernet MAC.
> 
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>


> ---
>  drivers/net/ethernet/cadence/macb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 6e141a8bbf43..27fc6c903d25 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4844,7 +4844,7 @@ static const struct macb_config mpfs_config = {
>  
>  static const struct macb_config sama7g5_gem_config = {
>  	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
> -		MACB_CAPS_MIIONRGMII,
> +		MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP,
>  	.dma_burst_length = 16,
>  	.clk_init = macb_clk_init,
>  	.init = macb_init,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
