Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F49C53210
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jan 2023 11:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nUtC4zxwMkNVYqRf+LzBl7F2Ispn5mf1+f9grEtDE04=; b=HtSchRPNPqxAVi
	nEMIm92VAg8UhpcLAaAuXiHGPY6Id/aXzjcAC6RMCw3KIp+Oxieaj7hjaQj62Qu+2iv+DBd6wZLhW
	QGO6KkOdum6UjrqbTeDzmrNPVm5s33T3vmTUMzfFFjny7J5PdBhPYtaZgYI9Vuf7kylMvYfH42QQE
	dIu5SkTyyet7ZLfpdQhYyDXmnntSvuXCInmw48vt25NAgWEZcgafPAoQW5SViv1JaO+fcLneh/2UT
	2opR/SAJYukUUvX8UdIakhxkYtWFIF/gXCMkZnPPnp6cBYiWe8d+s/RBH4rdb9FInVFO+jkjIPkc4
	ULY0YQYAwxRA56CzLjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pETaA-00ClJq-0M; Sun, 08 Jan 2023 11:11:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pETa6-00ClI4-9T
	for linux-riscv@lists.infradead.org; Sun, 08 Jan 2023 11:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673176274; x=1704712274;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7rqgZMpQ6jkIftWSpVeoorFslU7orWXKQuY/mx293zc=;
  b=lVE1Yo/2Xjp4qAzcJ/SoUdsRP2YH31099Dth8N3tsrsXvA0iIa1hmuYC
   QIe4BOQo2+7GNjKMISagEZI+LieKGoA2pW38LVJIupngZI3b3CVpJkCFk
   lXlopzw0ggRJOq1I4j/0TRzxtpJDo5r/oOQfFVZTFoXDLAllegJDOwYBP
   dtTv7NCwQAOVDw5ZoTVdYZPjd1tzjJcddFzICRIrIPR/+2nmq3GNhO14o
   11+qKeBPyx9ovKYvHe3az0BhEm+xxct1KCtwN1FYBaUUQAgWKzhQFf81G
   gjY5zA7Us9teD/XWVuID7vCzcLuq5HqToOWk1jaQReiFtHbYoyO8ZiKci
   g==;
X-IronPort-AV: E=Sophos;i="5.96,310,1665471600"; 
   d="scan'208";a="206832692"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jan 2023 04:11:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 8 Jan 2023 04:11:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Sun, 8 Jan 2023 04:11:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZReG3xWGOn51XadzrIeL1wJao3pNcby7lJnBd2d0tmUYQvtPJDwbEabcfYVmgOumKI7mBFD19Y9fH7mLfribDbPlsfvrxbkBtv9V9Yc5gwoRO7yvC2iHxqemottNXbuIukJBnzGB/UpsD+/vqcOmvNBLMMsayiOLLoAhly6/n2Q3y2Y27l4l55CbBcr5cj6X351z9yCUVqMpA349kV2OtlQOaYIMhtVgzcdmMB/rt4liu7sv6aZQKZF7ZjHrazyrBFWZ/5kQrmLRNkNnsSEA4DF442651m0ibgzT60dv08yHUNzDBOTNR51CnfgPKkrgEb0byu9gfhuDrDs5zV8lug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rqgZMpQ6jkIftWSpVeoorFslU7orWXKQuY/mx293zc=;
 b=MQ9ADq8kUzu9EWU2p6/T0Mx26EfLI15Dxq47AHD8OCYKommmOsssfx1KRBNDNkFcdLl7DLJHOZ6GP4Nb5Oobudk2Dwwe/nbjxsytI48N4lgf/Ufg3TNT6lidwqtepqB6Z1VjR0dkuZr3ufRTZIdCCoI1NtWW6WX9R3R4dnok8iOYgcbcKMW21swjJcxvzwngygoz8BoZLjWuHk97YtgTPR5Mu1Dm/Avf0Z1uMFuG8+WF4HvOTEZekxCM0JNU+nXzHfolRms2YQB6Xno1HKwDp0zAaSPghxSFIFc4rp0bQvfQOxmZwgITGC3Zc2r3/WUZXPeEW/QO2AHAX2+PwNNa1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rqgZMpQ6jkIftWSpVeoorFslU7orWXKQuY/mx293zc=;
 b=p8w5rrggpCfrPrciWdP/uwJtHM/tNMDJ1OMcpT6mFn/31UbA9IyNhikepIRlPtT7CjpgI3MhqtDyn/9YrnsKodln495wM7viYExYxxQ1NrvC+Kj3ieOkkDmBNUQlPpe29B3JonUPKILnh4BR71ds3Ma8t/XFhewdRGRoRnVE/Gw=
Received: from DM5PR11MB0076.namprd11.prod.outlook.com (2603:10b6:4:6b::28) by
 SJ0PR11MB5919.namprd11.prod.outlook.com (2603:10b6:a03:42d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Sun, 8 Jan
 2023 11:11:08 +0000
Received: from DM5PR11MB0076.namprd11.prod.outlook.com
 ([fe80::9b7a:7604:7a30:1953]) by DM5PR11MB0076.namprd11.prod.outlook.com
 ([fe80::9b7a:7604:7a30:1953%7]) with mapi id 15.20.5944.019; Sun, 8 Jan 2023
 11:11:01 +0000
From: <Arun.Ramadoss@microchip.com>
To: <netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<yanhong.wang@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: <andrew@lunn.ch>, <robh+dt@kernel.org>, <pgwipeout@gmail.com>,
	<kernel@esmil.dk>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<edumazet@google.com>, <richardcochran@gmail.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <davem@davemloft.net>,
	<hkallweit1@gmail.com>
Subject: Re: [PATCH v3 5/7] net: stmmac: Add glue layer for StarFive JH7110
 SoCs
Thread-Topic: [PATCH v3 5/7] net: stmmac: Add glue layer for StarFive JH7110
 SoCs
Thread-Index: AQHZI1EmAE6NG2kyd0WD9IW4crckga6UXSQA
Date: Sun, 8 Jan 2023 11:11:01 +0000
Message-ID: <720bffcd0dde99d6a87aea6baa8b5ccefe65a178.camel@microchip.com>
References: <20230106030001.1952-1-yanhong.wang@starfivetech.com>
	 <20230106030001.1952-6-yanhong.wang@starfivetech.com>
In-Reply-To: <20230106030001.1952-6-yanhong.wang@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR11MB0076:EE_|SJ0PR11MB5919:EE_
x-ms-office365-filtering-correlation-id: 1f3e7536-1aac-42d4-b79e-08daf1690708
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TB8VV9kh1ZVs5Fo8arRy584XNtovE1rttMa8OwTNIAIoOJeiQ3gu4hrQQbGuZn178tUKTN/+Lwcgpa3g4oQaxg4bHiNHW1zx1sWDbztGgY8VDJN3gdHFvj+EEEmTPIBBbTkke3zwtPEU0LsMSp4TxJQxdXZdJdmBFZBIwggguJp+QxvVbR7f3Mf+3D6dzAS6aitCqOUGOXFjDe68EtoipXFxVgzWhDGayC33nz69nFfYKNjV3UYLFdxw9/hMQQSFWXHoxzFvNPVqmEDCBEHkAvB1i8+xniqTjX0uQhVrIfP/E+Ool+tOIyiVAevl8qw+MBzdD/Mv7MX90aQa0SqQq6XJCJzrVea3yGWGiufL009rimyloa8x/HJOCgCLSOY3kb0JK+KDPap4RLtrW8hExzc6nkWOSVuP3GZldtKjt/Rr0JfwHgshIyZqR7RaE5KuswABOAmUAkXzi1MfkULX0YGMw/vw/owRwUakNfQWWK7MqeCDoW6CPY1YeWsnSIUo3g1HcbtsxMCAuI7WGjZcwgWP8VgQbp6cXOOYKfrWkAUbZ6eTbILYe+vJKPf6OBaa41pOArB7hpfitpM+hvo6tBFfvwsZITlEs3BVb338Glo0d+Q4kuuqNL4Kwfa3GfcV9KO9Vgj886Dg3L5mt3dlVKu6M8rF9LdD5XAcOSn0QLGLwwdypx4sNOIpPT5Ccawrsb7eFjafway9CPJh7wehfZYwWamHm4GpkZB0J/Py6CA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(6029001)(396003)(136003)(346002)(39850400004)(376002)(366004)(451199015)(478600001)(122000001)(36756003)(38070700005)(86362001)(91956017)(66446008)(316002)(54906003)(8936002)(6486002)(38100700002)(2906002)(71200400001)(2616005)(110136005)(41300700001)(5660300002)(64756008)(6506007)(186003)(4326008)(66476007)(8676002)(66556008)(76116006)(83380400001)(66946007)(6512007)(7416002)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0FGcGk1bXJrdkVsdGZWTGxDNWY4SkRJY055dkY1dTdDNDBZTjhsSW9TeUhS?=
 =?utf-8?B?b3JQQjF6Vm42QWRRWHkvMFRUQTBaWDZ6bXZBZ2lvOG5TaVkyZldkQnVWQlJV?=
 =?utf-8?B?cDNJNnJvblV6S1NNVkw0Qm1SSDJ6OUYrQXJodUdNL21ubStpL28zMStLTGJQ?=
 =?utf-8?B?dlM0NHZ0cFBsdFdNSEtDOWJzVm82OVZTV0xVcmhqNzlXbzhuU0hCK0hwZkFk?=
 =?utf-8?B?M0hCU3RaaW01c0E5MUhWR0tRckpBTi9jSC9VOTloMUp2NFNpS01jUzF5akxJ?=
 =?utf-8?B?UDJYWTA5ZGl4SklpZ3FXdHIyaGFCNWU1bThpSzFKQzN4eUMrZzVweEhPNVIv?=
 =?utf-8?B?RGNHN0hMRXNWSXdNdWdtSWRwS1R0cjNyUEtLRG1aL3Q1bXFCYlVMek16RGdo?=
 =?utf-8?B?SFpLU2d6Z0RoTzRXN0pFWUlsQ3FkSUl1dUpCdHJZWmlCbEFFQlI1Q2owV1oz?=
 =?utf-8?B?M3hRc2tSeXlVaG9sci9oNG5xak13NEFHdEIxVjBXeVptUmZwQi9Fa29hSVQx?=
 =?utf-8?B?d3VET2RNeCtwbk03c1VSVmkzMzQ2dW5OdlpyYktzWTdiM1lmZXk0ZERqWDlm?=
 =?utf-8?B?ei8yWXNMRHN2eGxTeGVBOUtETTd1ODdYbjJyY0VERythZmNDZWhobHcrSnhP?=
 =?utf-8?B?S2p6NHBPYVBnRWkvTC9QMlptTUd3QmZVL01mclI0RHZXbks4d2JUR0tCQTh5?=
 =?utf-8?B?WjJuMHQ4d0lncXlSaEh6VTl5VlQ5ZWJ6WGRPTjFNNmRsYmVOLzZVTmtyZGFS?=
 =?utf-8?B?ZmpRNlBBYXh2YTEvcGFhUEVWM0tocDd0Ti9menFXODRuQkFHbUJvWmlMdE9P?=
 =?utf-8?B?anVYejBObEU4ZmtwMml3ODV1WlhlVVY0Zy83QkNMSExXVWt4MmppcWorTk9l?=
 =?utf-8?B?MnV5T3U3UUFBUkhKOVFYWVQ5NEw1M3gzM0t3SmI4NjB3YlVaSEV1dkRzV3JG?=
 =?utf-8?B?bGtnVHpoY3R4c2hRYi80VEN5b04wY1gzZitnYUFYR2tZdllVY3pCN1I1TXV2?=
 =?utf-8?B?Y0pHd3FhN0xqeDJkaCs0TW1HcDR6d1RBZlc0THNWS3UrV2dpYlJGRks4QWl4?=
 =?utf-8?B?OVFQSjhFaUFFNnc2SVdDY2hTUXpIN21JVGlxSWxlTnd4MCtWM2pML0FEK3Fy?=
 =?utf-8?B?MHdha01UOEJFRW8zTXU4RlJNbG9PazNCam55MnRtWFVaVFRRV3llY21uY2pm?=
 =?utf-8?B?eDF5amtaWGM5Y0cwZmd0Tk0wNWpGQ2lEQ3NrMytLdnU2ZVhJa0JHUVhLUXZ0?=
 =?utf-8?B?MjBtc05OYnpnamdkOHVoRFk4TGVQTVF4aUVLNXNnMVB6VkZHc2dRWVQ3MEp6?=
 =?utf-8?B?S3dxVXRtWmdubHlHcytYWklrUGtxWm9KeTJoQ25JL00weS9hYlVtWWFtaDJL?=
 =?utf-8?B?cWUrbklSNmNPS3ZLWDgzZk5pcTRvOG84dklwT05RNHkwaDlmYmZaSmQ2STI5?=
 =?utf-8?B?R1gwd2lZbEZvYjBCY3ZIYis4TDIrNXJlcXE5QldBdjZHTWVpOUpYZmZoT01r?=
 =?utf-8?B?TkFZcEVQU0JYbmh1elZ5WVg2NUtSOE9id1V1WE56cmppc1MxbmRzMDZoM1lC?=
 =?utf-8?B?dG8yaEVFaEVwckRwdlJjVmFwUE1rcXNtRi9acVp6VG9Od0VmeHNPSTVJV3Zn?=
 =?utf-8?B?QXVTMFN0bVJ5Q2ZvMUpQVDB3RWVacjJ2bTBTMWNVaE1FY0ZrSW5RVjE1bSti?=
 =?utf-8?B?Ykp0UjcwU2UzUzB2SHE0NU00V25LbXhUeXNqRGl1ZENQTjYrVmhiNDNSYVZG?=
 =?utf-8?B?K0l0ZWV1cTdiRm84bkZoaC9NOHN1dGlIVnBRL0FTSG1hL3pWdFFWNGp1N2NT?=
 =?utf-8?B?c213aDNKQ05Td0tLNzZHMkpmNmNxTysxQjRTWHR3RERKeHJ1WmsxSERibGxu?=
 =?utf-8?B?MEpuTjlXdm1VMWVDTUtmcml3WVAwWi9rZnhUWTJZemc2NnlJVkc4L1drTk9V?=
 =?utf-8?B?bkdIN044b0pkQlAxNldUT0JjZG03M3paZG9kKzNydkdqMVdPdnBTemt4VStP?=
 =?utf-8?B?V3lsV0NVM21KRVdxc3JjS2FrR01PZlhkdldqMmVZcGlCTW5MZUJpNnlhZW53?=
 =?utf-8?B?MXFDZEVIdFRXQkx3aWpvU1RqSWl3STFURTdFSzBmK1NIMWVFZzJRTFkvaFE5?=
 =?utf-8?B?dVNidkZqSjExcXdtQWdPOTVNUWVRQjdvQ0Mwdld0eVlNcDI0WVFBeWxoWThB?=
 =?utf-8?B?RXV1aWV1UE9COW8zR0RZS2pWRy9KdlpRSWpLQm0rMFBPUXNESEM3RnNyanha?=
 =?utf-8?Q?O2e9GvOc5YJuMGVdUknhE0prmSAJ/BuwO1PZfOReVQ=3D?=
Content-ID: <1CB4934DB5A6744C8C5E9C470AA4C671@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3e7536-1aac-42d4-b79e-08daf1690708
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2023 11:11:01.8061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4SJuKirN9Oc6HFHHd5H/EllRUrlBtG90lAmogzMA+quChDi8ZGDcs35eg7R9cvY7qzagmr1Bby19ewaOWtGYhKHjZt4eKyOg06abq9qZeTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5919
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_031114_672999_52D23C8E 
X-CRM114-Status: GOOD (  20.45  )
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

Hi Yanhong,

On Fri, 2023-01-06 at 10:59 +0800, Yanhong Wang wrote:
> This adds StarFive dwmac driver support on the StarFive JH7110 SoCs.
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../stmicro/stmmac/dwmac-starfive-plat.c      | 123
> ++++++++++++++++++
>  4 files changed, 137 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-
> starfive-plat.c
> 
> 
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-
> plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c
> new file mode 100644
> index 000000000000..910095b10fe4
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * StarFive DWMAC platform driver
> + *
> + * Copyright(C) 2022 StarFive Technology Co., Ltd.
> + *
> + */
> +
> +#include <linux/of_device.h>

Blank line between header with <  > and " "

> +#include "stmmac_platform.h"
> +
> +struct starfive_dwmac {
> +	struct device *dev;
> +	struct clk *clk_tx;
> +	struct clk *clk_gtx;
> +	struct clk *clk_gtxc;
> +};
> +
> +static void starfive_eth_plat_fix_mac_speed(void *priv, unsigned int
> speed)
> +{
> +	struct starfive_dwmac *dwmac = priv;
> +	unsigned long rate;
> +	int err;
> +
> +	switch (speed) {
> +	case SPEED_1000:
> +		rate = 125000000;
> +		break;
> +	case SPEED_100:
> +		rate = 25000000;
> +		break;
> +	case SPEED_10:
> +		rate = 2500000;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> +		return;

Do we need to return value, since it is invalid speed. But the return
value of function is void.

> +	}
> +
> +	err = clk_set_rate(dwmac->clk_gtx, rate);
> +	if (err)
> +		dev_err(dwmac->dev, "failed to set tx rate %lu\n",
> rate);
> +}
> +
> +static int starfive_eth_plat_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct starfive_dwmac *dwmac;
> +	int (*syscon_init)(struct device *dev);

Reverse christmas tree.

> +	int err;
> +
> +	err = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (err)
> +		return err;
> +
> +	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat)) {
> +		dev_err(&pdev->dev, "dt configuration failed\n");
> +		return PTR_ERR(plat_dat);
> +	}
> +
> +	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> +	if (!dwmac)
> +		return -ENOMEM;
> +
> +	syscon_init = of_device_get_match_data(&pdev->dev);
> +	if (syscon_init) {
> +		err = syscon_init(&pdev->dev);
> +		if (err)
> +			return err;
> +	}
> +
> +	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
> +	if (IS_ERR(dwmac->clk_tx))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac-
> >clk_tx),
> +						"error getting tx
> clock\n");
> +
> +	dwmac->clk_gtx = devm_clk_get_enabled(&pdev->dev, "gtx");
> +	if (IS_ERR(dwmac->clk_gtx))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac-
> >clk_gtx),
> +						"error getting gtx
> clock\n");
> +
> +	dwmac->clk_gtxc = devm_clk_get_enabled(&pdev->dev, "gtxc");
> +	if (IS_ERR(dwmac->clk_gtxc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac-
> >clk_gtxc),
> +						"error getting gtxc
> clock\n");
> +
> +	dwmac->dev = &pdev->dev;
> +	plat_dat->fix_mac_speed = starfive_eth_plat_fix_mac_speed;
> +	plat_dat->init = NULL;
> +	plat_dat->bsp_priv = dwmac;
> +	plat_dat->dma_cfg->dche = true;
> +
> +	err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> +	if (err) {
> +		stmmac_remove_config_dt(pdev, plat_dat);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
