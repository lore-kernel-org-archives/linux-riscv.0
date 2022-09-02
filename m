Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F628ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 09:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2F6b9n0jNf9q7u2elC9Fi9yw5RgDyAZzi/P2X4HMJrk=; b=FhIne1B0a0rvPZ
	gHa4WY6G9VP4Gxcp3N6FhrSszTpFH2yyL82ZeOIDB7wOSe9B0rCeOv4Wfksa/FJT25zLi3fZNq6w1
	KHd1HxQZpQXbIde99v3CrULR0Hqfhnl2pHZIGnyvytDZTwSUW7w0Sbgt8iJ8e/t26jtZTnvgKwAFY
	KC5+IMH8PdzHBdIP7A104BAzFBov+ZocKXGGH+/CWBnUVieraWTA5bHKPK0QE30jcelWHLwz2Tf+x
	/lD/4Ehiabn1vwJYGfFSagttlgLsQlnO6Li8NWJ6zd7brQJlJxI2QjOnZ04dgVqhQEKuZ6XbtXVxv
	iDfQuEKm0gvXj97kHVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU34U-002hpb-2R; Fri, 02 Sep 2022 09:34:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU34Q-002hn5-HO
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 09:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662111278; x=1693647278;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SjUidDsK66jkKYWHzSxTlmudVcXfzE+2mYHlgiaNvac=;
  b=I6oNSzmrIKszNV3p/RaP2SE31EYuwyPTRkZmMqlckW715lgd1SUlsoq8
   x0U2WlOeKy/2MgmVq88EcR9Srtnkq8fdLzvtv1GQvscoylLTIhrplw3Lo
   11m/3m6LZd/7wCBe2RHsOJ+A8utKlhzS5yzADbJxUKLM2seiR4dr2Q8Uo
   9C2KSglmT7z0a1ZiY0BiDi6YYrKWpyamGzGK/ymziCYgmfjpC6nPSHQnZ
   LojzlZR+ZDFVVhxaXredW0l/TizvCU5Gpz3ow3uOJktGLFWSrfrEpo7pf
   qlp8uBiN8MqeNudFJ0GKSGxQCmCr8V9ftNSRMgVU/JD7vJZl7b7PwZ6SB
   g==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="178899645"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 02:34:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 02:34:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 2 Sep 2022 02:34:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PO1svi+AghabSDZFlMt7hRf+cx+NbUaVtUly431yBdZFcDdGRzDhMLR7DLyqM5ZbQYMjcJYMlUtseMAR0+e0v/4ljEHI2tfEkDgNFGvzri3RETYThRCHzaD1VuyME4TGtYqQl9p2t+BR+N5xBugdI6WaRsEOiOk4TZXBTVnvM14ot70ighFI1vT5Gqf1BzhFanCZHSr+YM+AlJgJbftGeXkfxNVoAsrWyZS8Vuk0WJeOZacU2vZm5f7lhBXZibg8e1WO8wt2EXf0HvBjMx15j8zOoyuUdMfIOB9rMQ5d1KtoC9jawWPOORCOYOO2NVhLIELB7WhgpNc2jS77F0pYfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjUidDsK66jkKYWHzSxTlmudVcXfzE+2mYHlgiaNvac=;
 b=EIcLk/DOTQtHfZYRz3GXCmANUYLQpKTAQQCSSCkrRjOG+r+xsXvt5f/GLv2iolWc6kwwY6WZe8s9BOyjPZdFH07MQZTTQDgq8oNbOOpJ4DAU81BVGNffvzT6/qhWk8PFXeJxcdLHWbBjTLgb/hAbYoH2F5J+J3fMum1lNVebIL2zNaNjPIIMmd48qOxaPEtSI/SzNCsi1eMrbluE8ZA/+MQXyGINQvXW41liQ+K5For0TTyMHfDY/Y0q4BXeR8FcTe1kLCbciJKnXd9jcylxPvct2N/KTg5q1nqBl9mgSVhx8+aNGlsL9IGBygJdgc68szgpsVSIM4etWUUh3eQGDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjUidDsK66jkKYWHzSxTlmudVcXfzE+2mYHlgiaNvac=;
 b=bUxIEKOPOslM0R2rXcCPLcs1nWI2zjq8CGoSuQ5Hfe5fEFum2u07URZ/7IlcdxMN07dSNOV1V6CUBgJfKNAPRtDRFBeS9BVi2hqU/DXNrfiPLTyl6Zmyp5nmWiBK7dcXzmy13p7A+s8ihtC/3ReYdJO1oecZis8XZQ+bb0qciLc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR1101MB2363.namprd11.prod.outlook.com (2603:10b6:3:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 09:34:35 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.010; Fri, 2 Sep 2022
 09:34:34 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>
CC: <guoren@kernel.org>, <apatel@ventanamicro.com>, <atishp@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] riscv: drop some idefs from CMO initialization
Thread-Topic: [PATCH 2/4] riscv: drop some idefs from CMO initialization
Thread-Index: AQHYvlI8JmMmetiEwU67UJJvfvrvQ63L4bOA
Date: Fri, 2 Sep 2022 09:34:34 +0000
Message-ID: <88b6ecea-31e7-0439-b25d-6a48f43a19e3@microchip.com>
References: <20220901222744.2210215-1-heiko@sntech.de>
 <20220901222744.2210215-2-heiko@sntech.de>
In-Reply-To: <20220901222744.2210215-2-heiko@sntech.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06868077-0a23-4d31-6be9-08da8cc658e6
x-ms-traffictypediagnostic: DM5PR1101MB2363:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dUxgzNTdcbrZKjd+G+p81eQsiG6L05Xkl6TrK5CN6IUkGP/dhnS3guxhmvHTNZIogdezn03k+MJITk7G4BwdnEonTWB8sYvC1cxHn7Sp1pBWcT+1/oG7OFnCcnLZSU1zzENUI1tNUKfSYkGZ8O/7fVmb3n7nsgh50hLa9EUBovFmZXNZFtoFP5zaRoKqvXTxB192KyCE88h+K4VpjdUO64gd7Iue7IE39VFwBpB1YqtKMnKlfTKddVKYjRvwB/NVwUyhau2i0CRYM4zY2DfpKGg8gsB6Dgyg1qpoSLoy8b8sVRt5AG39Zhnrnu8SW9HSZgg67oQ4LlhCUm6gj00rZZSKlcn/vwD2ZN/3VXwZ0ZJNfImy5Bk9GTaZL4jloYK9sSxuTv0Dfb884LphtKR5e6Sgqjhl0whphCg3buzf2TVyFQKvijIow6jTzLaQRNrZJzR/BBWdwIB67nJ/uDsyRne03+U1wtZct9zMXC1EUotZJ+b5Tc4WewYKanx8aV85C0Srj0KpCnFwGW4eO3EStO+iPXJpzVNUwQpkwInZblVeWIAqqEVnj9V9iCrWziUNZNS98SjBuMRpnyM3FVGDN482tcEZ0w8lBy4f5aMDvpQ0JJgoraGSiZ36l8cKdnZDGUrUh5k5Sj+FD4dP8GeSXot5XWjVwAycR7Nu3PVevKPlAKT09TgRlP70bqk9sxRkMoXNwgcB29/FcaFryBH1iSbGTYItPj8APyzZVNw6B+JYY1ZefloHAns3oc9hsyboIAKJrwMEkBC1HyWwDcdStkfEdXAAPlkgIIZ3lN4GA24sOc9wA9sz6VZlz0gGHpuzufhhc/fKxc2i1SaZn1G9mw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(346002)(39860400002)(31696002)(38070700005)(83380400001)(122000001)(38100700002)(91956017)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(110136005)(54906003)(316002)(2906002)(8936002)(5660300002)(53546011)(6512007)(26005)(6506007)(186003)(2616005)(71200400001)(6486002)(41300700001)(478600001)(86362001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUVyQnRaV1ArSjZpWTBIUVNwRzZZZ2J3dnlDMFc4M2lCdHZpSTBmQWQxOVJx?=
 =?utf-8?B?U3lsNklIWmxBbTBLc0NLL1R2ZHdtRGRES2JCVHp3OHNVaitrVDlvQm00NWtt?=
 =?utf-8?B?TkRDRTFGNWsyeXk5YTNCczZTVE9MdXgyNEdBMTE4aWpQTWpMQXI0Yzgyd2ZN?=
 =?utf-8?B?akZCdDh3cDRYLzZQdXVncjNIamEySkQxdVNLUUNPbDM5dnVLbmdQRy91VHpN?=
 =?utf-8?B?TW9NSU8xUEZoRmJHTHMvSlpPUnVTZWhhWlVpaHVJWXBZNElQckN1cG5PQlh3?=
 =?utf-8?B?YW0yYmdSaVFtTnZkVU9sL0xXNWZ0bXFoNGJvcnpYVnMvVldmRHpZUjlEWU0v?=
 =?utf-8?B?ZmZtK1lLNVNlbFRHd0p4NkN2UWRxZlEyK2FTYXFoRmNmWUo4RVVzcWhKUGNs?=
 =?utf-8?B?N0R5ZDR4MVhKSUdPWndKbHZUU3lidUZySWJLYm1iNUpYNFk3RzVDL3lHMFJn?=
 =?utf-8?B?SkhYMGFTOC9zNFBLUy8vVXhYcE1sRjZ2elZCNzhCaVYvVzhLdS9lbUJ3SU0x?=
 =?utf-8?B?SkM3bHZ4ZUtQb0VsK3R4ck5GUXdmdjlQUXV4NlZkL3BBYjB4eU9CUWl3cWZ2?=
 =?utf-8?B?TnZLWnErWnZ6OVJHS0Rub0gyZ3VLeTJiOHRGbTN6OE1tVU15a05sbiszd3gx?=
 =?utf-8?B?dC9zS0xLM0pmZDFPdVV0SEJsU01xQXUrU0lpdG1zWTUxWEdUeXpIVTgySXor?=
 =?utf-8?B?YTlMeVZpNW93bWFUcXN2VG00Qm1yUWFiMDRrSkpYbmVoNUUwZ0NiQUtuU0dy?=
 =?utf-8?B?SnVQYzVQQ0E0RkhQNHBaYU5IOXRSd2RaZ3pxM0RoQVVPdnN3L2xWSURiSzBO?=
 =?utf-8?B?QmQxa3BuODREanpnQjBNMnV4Y01qZnBBaXJ1Z1ovQ3p6STRUdFhPQzJ2TURB?=
 =?utf-8?B?Yklxdi9aV3E5dWtyTVFKaGJIUXdqUitBaWhwRHVjMmFCRUZqYTU4SzdxVGhZ?=
 =?utf-8?B?VTlSSW53YU9CT0ZWWFJPL3MxcDc5T3d0eFVyb2pnNVpJL1NwU2dUaTU2VFoz?=
 =?utf-8?B?WGFIazdyZmp3ZVAwOHhudVRGVFJ3TnRDZXJGWDE1TUpwUTBCS1I4YVdkdnZC?=
 =?utf-8?B?VmdaNXI5ZkRvWHhxOVhvbmUvajFJcmdrSUtBTnMvdmJkUjRGK3JFOW9hRE5v?=
 =?utf-8?B?USt2RFdPeDkrbW5HOHdDTVphTDJkQitGVys1cFVseWtic2MydmYwVEZ3S0F0?=
 =?utf-8?B?Tzcwc2lUblplQlBscnFia0RQdGVPTGN0Z1JrOFRuUG1DYkdocVBGOWw0dzho?=
 =?utf-8?B?NTFFWHI3OVlwdUdnRi9OTkg4V3hZcFN2WEFLL1pDR2p5TVM0dVlqdnpsekdp?=
 =?utf-8?B?QnpNT0FiZFZneFBqb0s2cjc1QVNsWU9XZWptdG9hdURQMUkwYUtERHRkY3Qr?=
 =?utf-8?B?aXhwTk9ybjdjY0Zob3g0VnZQY3lTcFNQcUZaemxMclN0YnFIVDNmdGtHdGxC?=
 =?utf-8?B?a0l4OEF2cHdhZno3N2poaGlnNkZrVFFEK0ZWc09IT1Awd2ZIUitZYndwc1E0?=
 =?utf-8?B?RVhUMkNHTzcvMXg0NGFrZWk1R3MxN1oyZUF3OFp4NTNhUmJodGVwMWVISkZs?=
 =?utf-8?B?MWE2b2pEVTFkOFlONXBpUzZXbTZvNXBQdkhpdUZOQ3ljYWg4ZGRCb1IrVUpZ?=
 =?utf-8?B?QlhwV3lubXdaeWhUTGhoZk40MTN4SGZ5T3B6NXFuK0RGeWhsVzRHSjBNZ0VT?=
 =?utf-8?B?SkdxV0dmNEFuSk45QXc4SWFLRmYrZGdlcnZ6Z3R2OWM0R2RZdS9MaXJWdlh6?=
 =?utf-8?B?L2c3b0l6UVozQUFmcjVRemlibHd2ZG5Dd2lhNFJZRzhSZnVXRnBwNVlYQ0pp?=
 =?utf-8?B?ZENsYnBkNzhBQStWZEx0VkExY1RLc0hNK1Q3RUo1SHlGWUtHNkxvc0RiT2dw?=
 =?utf-8?B?eGs0OTEzeE5ScHUvVHQ0TnEwdWU0NUZrbmwwSCtxK0k3QmNSb0dhODBhMzU0?=
 =?utf-8?B?dDdmMGxsRXg1M3BQV2ZnaDBxNC94bzh0QjQ0UXZ3VlZzRnk5KytGSzlkZE5X?=
 =?utf-8?B?RzV5ek9VQWhXZFNoU1JhelR0MDFoUEp4bmJxSGx6ZitqNXNXQ2ZRZkhIQ0Ny?=
 =?utf-8?B?SmpPb0k4T0tiQTlkT01Ub240SEJhVXJlWC84YURuNUNNOThSRHJ5djZPUE51?=
 =?utf-8?Q?FYDPB69obb86Z0Lq3qQ2Gtv3d?=
Content-ID: <A4CFCC9906B6CA4396681A66243F00C0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06868077-0a23-4d31-6be9-08da8cc658e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 09:34:34.8942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wlO3+U9p+5J+7sPMAZNiz3aVRVghPTO5prf9B2vHs0aXpLJCK+Yn9awiiOvMZ9RA+CA8pvvXXb1n1VbEK9YvLSPf73+iclHc52uwVqA49jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2363
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_023438_604749_8D478973 
X-CRM114-Status: GOOD (  20.95  )
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

On 01/09/2022 23:27, Heiko Stuebner wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Wrapping things in #ifdefs makes the code harder to read
> while we also have IS_ENABLED() macros to do this in regular code
> and the extension detection is not _that_ runtime critical.
> 
> So define a stub for riscv_noncoherent_supported() in the
> non-CONFIG_RISCV_DMA_NONCOHERENT case and move the code to
> us IS_ENABLED.
> 
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>

To my "sensitive" eyes, this looks a lot nicer!

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   arch/riscv/errata/thead/errata.c    |  7 +++----
>   arch/riscv/include/asm/cacheflush.h |  2 ++
>   arch/riscv/kernel/cpufeature.c      | 22 +++++++++-------------
>   3 files changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 202c83f677b2..bffa711aaf64 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -30,7 +30,9 @@ static bool errata_probe_pbmt(unsigned int stage,
>   static bool errata_probe_cmo(unsigned int stage,
>                               unsigned long arch_id, unsigned long impid)
>   {
> -#ifdef CONFIG_ERRATA_THEAD_CMO
> +       if (!IS_ENABLED(CONFIG_ERRATA_THEAD_CMO))
> +               return false;
> +
>          if (arch_id != 0 || impid != 0)
>                  return false;
> 
> @@ -39,9 +41,6 @@ static bool errata_probe_cmo(unsigned int stage,
> 
>          riscv_noncoherent_supported();
>          return true;
> -#else
> -       return false;
> -#endif
>   }
> 
>   static u32 thead_errata_probe(unsigned int stage,
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index a60acaecfeda..4363d0beb38a 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -50,6 +50,8 @@ static inline void riscv_init_cbom_blocksize(void) { }
> 
>   #ifdef CONFIG_RISCV_DMA_NONCOHERENT
>   void riscv_noncoherent_supported(void);
> +#else
> +static inline void riscv_noncoherent_supported(void) {}
>   #endif
> 
>   /*
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 764ea220161f..729f7a218093 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -264,21 +264,17 @@ static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
> 
>   static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
>   {
> -#ifdef CONFIG_RISCV_ISA_ZICBOM
> -       switch (stage) {
> -       case RISCV_ALTERNATIVES_EARLY_BOOT:
> +       if (!IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
> +               return false;
> +
> +       if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +               return false;
> +
> +       if (!riscv_isa_extension_available(NULL, ZICBOM))
>                  return false;
> -       default:
> -               if (riscv_isa_extension_available(NULL, ZICBOM)) {
> -                       riscv_noncoherent_supported();
> -                       return true;
> -               } else {
> -                       return false;
> -               }
> -       }
> -#endif
> 
> -       return false;
> +       riscv_noncoherent_supported();
> +       return true;
>   }
> 
>   /*
> --
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
