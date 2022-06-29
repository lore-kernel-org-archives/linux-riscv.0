Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361B8C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOAZHm38vPfsWjZ10n5OJjkste2eeQtsIllU9qU2oAM=; b=w9CL+L/gDfvoAx
	MqjBujXORgYSesUoLpmS3uONc6Yzu/odyzNBjtQXa1Q7CV0SyV/dp3Vzlxwdt0SQ8+9mKuHPI7QNT
	tiLmZ2Z5YycfTaMs47+wvVvkwexdOjSIIku3HGvccwpmX7WAgah838pJjmFknjrgo7Hvk8lM4+I2W
	rCosf0OwbiXptY/nJdR8CsOcTMi8e7V9K60OJk+hsYJVRTEKnjr2d+xwPnAPCBb6E7BUAQ86nPgnZ
	EQpDX1ByKTwplXQOPsmKZ8MRFo3sn3LhdVZyCADN4eqmlho0dOVtHXsOjwmcnh6TU7kxsgyLcajAl
	OyXQbGsrRiIL2gTYWYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cs4-00Delz-7Y; Wed, 29 Jun 2022 18:57:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6crr-00DehK-4x; Wed, 29 Jun 2022 18:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656529010; x=1688065010;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Hh77io0eb8E4om6Bi30U59MY8r6yPN4M5qKDdCZaX3k=;
  b=nFGJW2urOHFryPE5dzfKNFJxXPnWViaGrN8ouZBRhjyMEBS/ZYW7e9WB
   q/C/pzSXfqZxS9Vx4GW5ZeDl5YFpng8TE3OcOWNlwmDkStSFtPhaarI/3
   QKblAK3AtPgVZMgK60v4P3+x544Re9beAkgMsU7uFZ/jO8r3342L1KcFU
   cM/yLVD15PimGg7AcLLxwicTaw1WL5QcWsI9swtwN+BIqxXAm70sK/GIk
   ydpPHCZh/RopY4NfsiRyQQGtbUjfFsU61msNArYou42vwEOfl84rMnGlO
   mbzuAD2iGyiTaTveZ6mbwKHrn7dE8VWF8tscymDNezISB6Ji3rAO6SI+j
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="102341092"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2022 11:56:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 29 Jun 2022 11:56:43 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 29 Jun 2022 11:56:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMfZWG+LBegJma2JLZx8VDg01xM1r+9iFGrejapRm5Tya3IFxmQNtcUJ5fRkyehd6Qcq9OkvHYyVgl4WBsqCRBhyKdnzs9NR4Bv/ZlbleZLuwJuKUVB0nL05YVplQQlS92j6EmzSHz2JfUMcNf2DQb01Fb9tzPh3hZfQQUATXYVZcty+GQPEnnz67rBbtmUyklMpkxLNPxBL6b5a+9f+fXzsBC1+WDMmDIfJ/Bq/YBOMD/mFGUC/Gu+wKqGlAXG47SPb4nE94Vt0HKjiVNSP9I91hdY6pM17shIKCibr4Jyk3BtfiC7DiC5svybUTyRLJIvOjjoC9Is4WQsUaOf1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hh77io0eb8E4om6Bi30U59MY8r6yPN4M5qKDdCZaX3k=;
 b=oJcISOuGYGEsFw+3oC0H98LVg0UDMpPa2gYr5+emp6f0Kjj7upPjcYCY2+oNVKNVy5+Aix3LFtr6hheOGp9Z0GwUbKaeihZbEXyOff8gDT6LobMLgPJEvHmw/a5nGMGtKNv0s2Qnu4rGLieGPFjAEBGuxrY9seUITBNF12xG1F60ohg889YL7oyPFaJS1SDMJCCI6SOFQM83FULGnCEv7AOJC11DhwcFThbXrvcx3/7dDg2aglWfDwl81nh7wtb+VAlQgCZeO2vItLO4v05eVitazUCPt0d9t1FOylaMKxzo12qsqbArLIBazWX/evPtYn8qsvz/Nuxv1iN+TNbZSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hh77io0eb8E4om6Bi30U59MY8r6yPN4M5qKDdCZaX3k=;
 b=oobhJgNvWC6D29MMW774fPI2H3NTcmy+gXOGmFKQV7GENYhk4vWZH3Nf5n3YOeJYm62IHBlfLRhfqyn5LDhqR+qXl+wqkGX8IQ8dxXq+IE6+ApexzgLbaJO4keQBXEDVQOZGHljYG8IeAtg4LGQTUxz2PHe4fgfczt6cIw5uW1Q=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR1101MB2298.namprd11.prod.outlook.com (2603:10b6:4:53::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 18:56:29 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Wed, 29 Jun 2022
 18:56:29 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <Conor.Dooley@microchip.com>
CC: <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<atishp@atishpatra.org>, <atishp@rivosinc.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <wangqing@vivo.com>, <robh+dt@kernel.org>,
	<rafael@kernel.org>, <ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<gshan@redhat.com>, <Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Topic: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Index: AQHYikaSsliGXUqkU0W62iFZL9A2pK1mrJEAgAAIIICAAAgGAIAAAp2A
Date: Wed, 29 Jun 2022 18:56:29 +0000
Message-ID: <88ef07ea-fbde-b997-6c0c-99f5fb7be201@microchip.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
 <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
 <20220629184708.x5exgjoy4sblyqml@bogus>
In-Reply-To: <20220629184708.x5exgjoy4sblyqml@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70957042-bf3d-4e45-b9f4-08da5a01139e
x-ms-traffictypediagnostic: DM5PR1101MB2298:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WEKsjGinm/B/yabfeunvDNK3SrHs1aoNuXl3UJMcmElYcmSp6m5NWvpLwH2sLv/ow61BQyw5aHrgXKyy5uOO/VdvbfPqbwb1dlNYw7E8Du/2topd3KjP8Abu3KW7j994nB62cCYlDTF+IIdV4+r2czh+jaUiPijD1X++E0Os41kdgnFUXmJikmFeUN+bhprYTzNabFsvcxOip9yaqn1TgSpqHDhbJES+zvQJguQRg6woi/2u2YOC18ec9P+zSGvH/706BlstVFSm0iF3j6RE4OIYPypyhRRSyFr/gBvUxxq1HRl78L39ewVGw6xMEa8ACcpOZri/9vBYXEEEoroLbWcbK+a3kOQfBQH7wiFIGe55PbxKigdG+K4nM5d6GD57GKHNM2YL54oRQ3AYnty3W9iu4bD0GsKNpxzNCJEN4aEcl2Nd2EJOsgz0EccA2C/NX1GuTZ99NyL4/Zu0/Zqu3ByP01PytQUIQtt8hwr71kXeTox3D7uCrfmGCK3q2HDOf3IomcyU3mPipj7RltGnI+7vwmXB6xI8hoV1kkXTRABKht+GKS4TaL8Qm80j6+oO3Jdew6H0l80ucyGsFQBx2u5aBnxv0yGPINUTNyxmcCgeIxnC4fbQTT8Jp1ux53cliNaEMFb3rcSzb9LvaM8PN+eAru3IrZ7oAn+e7oPiB1uapvgJ88qKUy1wn4czo5Qma8UZtEacGJqS2NLL+H6q1+5lUZC2eo0d7y2n9vkG0SOUiuyq3xxB7C6EGoysHPb2mOQIe8BGWwW1LfPINgHxDEbFgQJngTXm0WDIT9RyNWdvtc2gkx+1JScDNy4o7l6qs08DWSzjIYs9NOJtUQZjSj0fFd9GvyplSBYT0RYELLc999ny66alYOcCcXf/ExeWLjb58Aepyo9KXD0OkfA3rA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(376002)(136003)(39860400002)(366004)(186003)(966005)(8676002)(107886003)(6512007)(91956017)(66946007)(31696002)(66556008)(122000001)(53546011)(4326008)(66476007)(6506007)(8936002)(26005)(5660300002)(66446008)(64756008)(6486002)(76116006)(71200400001)(478600001)(36756003)(86362001)(316002)(31686004)(7416002)(2616005)(110136005)(38100700002)(41300700001)(54906003)(38070700005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVYrMGpMcWs5eFQyV25aU3lZWjhpWlQ2QVZqUldhY1IzQ0MxNnlRN2pFb2My?=
 =?utf-8?B?bWlWZGo3WmxZN1NmL093ZTNwWElveURPdVQ0cGpyL2YyK3RPUUhaQWNvcGww?=
 =?utf-8?B?ZzVqVW9LREFyeTZKTzNRZUFzTnNyTkFjTG1IVENxbHN5ZW41YTBGNURFQis5?=
 =?utf-8?B?N1FBbEVVdUN4VkdTOVI4TlRuc0Z5TDRKSDlWc3UzcEwrSFpnTG5UV290WmNT?=
 =?utf-8?B?RWgrcXQwL3FycmlQVWtEU3N2N21jOVZad3hNTm5lcU9WTTcvVlNFS1hLWW1G?=
 =?utf-8?B?ekc5SnNucWlKU09JRzNlaGYvbnhnNWF5RDFnZGpTRFZyczJIZ1MzaVVUVTlN?=
 =?utf-8?B?cUlWQjh0cklYOWVROFloZnNYUUdXMGRWdzJ0cm83UUhON2g0RjFPOWt6VzNi?=
 =?utf-8?B?eUlFTXJCaXVOS05NS3o4UW1hVGRzSloybVZVcGlPblp4WVNrOW5nNzVGc0lp?=
 =?utf-8?B?WUpPSVVqRjZDSm01TFhydU93bEdCbVQ1cllzd0RGdE5GWDV4SEdBVU5ZTmVW?=
 =?utf-8?B?RmJ3TThTVkY0VVdIQ3JRRXdSSkIvRzNnTXRQTnZGdVlDc2kyemdkY2hSeExy?=
 =?utf-8?B?VElEMUJyazU5V1BDSUFscEVGZDBOdHg0SFRTMW5yVi9RTnEvZnlpMDgyTDFy?=
 =?utf-8?B?cFRPR25UTStSR1FTOS9GdCtWVFFJYU5vYjVTNVl1OG5Fb0hPUWlTby9YQmxJ?=
 =?utf-8?B?Q3lYWWNIV1Y5SmU0NkNKL0hacmZpays5dmRFcXovRllOUWo3VlludU9vVHRV?=
 =?utf-8?B?dThGZisvN001Zld1NXBWZmdCTmtlWjJ5eTFOTGVYZGNZN0RNNzNuazRIYk9E?=
 =?utf-8?B?UnFkVFpmQnloekx5dHhvbmltOENoWkNoRzRpMXNoZE11T1BvYjV0NFhoV3B0?=
 =?utf-8?B?YlU0ZGpwNTFTYmdmSEhDc3hzaWNHR09BaVc0amVFdHdQR09zcWVTbnYzeENR?=
 =?utf-8?B?SDhRcHY0dVNxY1l4T0hYQloyZG94V1RET0RtTmpnK0crNFZLUExxRUFWZVNV?=
 =?utf-8?B?Q3pLM3EwQzVvcDhFeUwwWmZPbjZQT2dnRmh2VzRJcit2SGRNSHZydUhGWWkv?=
 =?utf-8?B?Zk9Oa0VEUk9ybmJqZXEzdzhuVkNSb2NFYW1TMWxPaVdyMWtVQS9ObDJtdVlH?=
 =?utf-8?B?azFIY291WjFtYUNSU0ZpOTZuYkh3WGRIL3lpK0FNQ2FQNWxwMEhpV3M3S2sv?=
 =?utf-8?B?ZFp3VVpua3MvaGtjQTdnRDRJSUtWcWZNajdGVC9zQWViTlBjaHU3TTU0RFd6?=
 =?utf-8?B?NWI5RGk4TEpnOXVKOEJSU2ZFTDRjL3BEelNNOVUvcGF4czk2eWJmQzRxT29v?=
 =?utf-8?B?cFdrSnZUaWNLdi9yWjJrWmpGYXdCbllLdi9abUhyR0Z2cFZJT3I2Q1dQK0p0?=
 =?utf-8?B?U3RyMldqb0dWblJUU3Z3Y1AyVE56cVRiSEludnpUNHZlcW51TUpvQkpGRjFj?=
 =?utf-8?B?bjJZMUR1VlFGcXZ3QVVYYW1mV200ZjdqeDhXZTdOUDh3bDFSSmh5djlsbVdk?=
 =?utf-8?B?VzZ4Y0VOYVJTdlQ3MUFwTWlIa0VyaFBDamd2RTZZdndKdm5zbVFwS3BBS3hn?=
 =?utf-8?B?Sy9OM0lGZUExSkNxeS9oNTh2b0NoRVRHMEFMUmxtdGVRVWdzdWQ2WnM2Q251?=
 =?utf-8?B?eFlRbjRvWnR3Szk2TEhQM1BuVlE1aU5nT2QvZi9EOW9NUTdoaEdKaXlLUklx?=
 =?utf-8?B?WGhDK2dwNW80bVcyMWF0U3ZneDBtNnFOblZydkorZmZ6VVBXdXRaaXJGQnBY?=
 =?utf-8?B?ZTFJUEpudy81RzRsbWNIVGd0QlJONnJvZnF1d21GQTRVR3pZT09CV2lDdHps?=
 =?utf-8?B?VHpoNGdEVU9RbElpUVlyRXBEKzdiOVVPbUx0dFVGR0NpRkx6L1hDQ2UvSTdS?=
 =?utf-8?B?VHlHWHNzTFZEMGRZQk5mMWdhVklzeWE3YXcrMUZGT20xc0ZEc0EwdlRUNUl1?=
 =?utf-8?B?dnFlU0t6dWNzNTk1cHkzb3FycXhuUHUwQkxRenRnTHV0WUZuNHVpV3BCQ0pl?=
 =?utf-8?B?NVBqamtjWms3VXViK0N4SE9jM08rNkJrVkxnNExKVXRvRVN0ZWNPMklwK01l?=
 =?utf-8?B?M3VsRDdibnZtaW9leUxYTlluUXFaeExDQ2lwdi93Nkc2dFdhZGkrL2ZuOUdl?=
 =?utf-8?B?N0tXRHNHSkJ5MHRwanRuOGhIZmVuR1IreWpFVlZ0TW0ycndtZHRuNlovbng3?=
 =?utf-8?B?YWc9PQ==?=
Content-ID: <4A0A16713BDD1E4B82B1BD64C2777575@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70957042-bf3d-4e45-b9f4-08da5a01139e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 18:56:29.6670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SDjpaG/jYzySNbLchaAQKdGNCySkz8w7+eVo1kLhOaz6SzLGe6fYVt5y8UuOEIDYEflo6OUnVLMas5PAE8l4+o7mlrc5PNZaGVTIVKKJXyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_115651_524648_9CA63B05 
X-CRM114-Status: GOOD (  18.21  )
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

On 29/06/2022 19:47, Sudeep Holla wrote:
> On Wed, Jun 29, 2022 at 06:18:25PM +0000, Conor.Dooley@microchip.com wrote:
>> On 29/06/2022 18:49, Conor.Dooley@microchip.com wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 27/06/2022 17:50, Sudeep Holla wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> The cacheinfo is now initialised early along with the CPU topology
>>>> initialisation. Instead of relying on the LLC ID information parsed
>>>> separately only with ACPI PPTT elsewhere, migrate to use the similar
>>>> information from the cacheinfo.
>>>>
>>>> This is generic for both DT and ACPI systems. The ACPI LLC ID information
>>>> parsed separately can now be removed from arch specific code.
>>>
>>> Hey Sudeep,
>>> I bisected broken boot on PolarFire SoC to this patch in next-20220629 :/
>>> I suspect the issue is a missing "next-level-cache" in the the dt:
>>> arch/riscv/boot/dts/microchip/mpfs.dtsi
> 
> Good that I included this in -next, I had not received any feedback from
> RISC-V even after 5 iterations.

I'll be honest, I saw the titles and CC list and made some incorrect
assumptions as to whether looking at it was worthwhile! I am not at
this all too long and what is/isn't important to look at often is not
obvious to me. But hey, our CI boots -next every day for a reason ;)

> I also see this DTS is very odd. It also
> states CPU0 doesn't have L1-D$ while the other 4 CPUs have L1-D$. Is that
> a mistake or is it the reality ?

AFAIK, reality. It's the same for the SiFive fu540 (with which this shares
a core complex. See page 12:
https://static.dev.sifive.com/FU540-C000-v1.0.pdf

> Another breakage in userspace cacheinfo
> sysfs entry of cpu0 has both I$ and D$.

Could you clarify what this means please?
Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
