Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5425ECAAA4
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqOYx8DYxdAydTDz5dUuBdrDQEl6kk0VlJ1vrcZQraU=; b=GTi1AJRaBzEZM7
	REF25b1kEOPJjL63UR2hPRqMDjUKPiAox5cZ4yVX/eEPZAtbbMhgnUJPqpnRXkcrEyUA1PKDSSn0A
	GrfbKW4N9AuLTnj80bd8zMkq+BxT7dJIkVC1ldLaddqQPQUWMjQeQgfSz9kH1Jeh5qvwHHSuGrumA
	2vZT18eliiqV0AiChlgeXnwnoRB/j9HqSJHiWDhfvk4lmoJvrmk9s/1wyQ1G2on68AzHcjAp0E9jc
	DIaZFg5qWmPzHsW0rkttmxlFr5Nxq82QeXa55lmzoAbeJ4CgCxAKsqF1J5a1oYOM2CkpH5X/7XJv7
	916gXd2i0GJgGYYXapmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSiYM-00C2e3-Mu; Mon, 29 Aug 2022 17:28:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSiYJ-00C2cS-8E
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 17:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661794079; x=1693330079;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=w7L6jYey9pe0Tnv9QAKp2d9ZC3gi8hqfxQN91PAiCd4=;
  b=PoaHP7+9WbOSijyrFPkLlkLZ8EE7j/vrnRCGCMS0ezjpoYoyjP2o3EEb
   k1eGrzmY1CAmRz3AREnDzNG37hzb//vhmtr3SlJavB0LCCcMeipxDpCvK
   aMJ1soBvy26vdYXRh9pBKEBaotaU2kgDpSFTcWsWpIPIYvtyw+roCFIQo
   Sskg5y+g/FR2iLQs21++eH8MvduDCrtSAeUghb79KCd7JuAgt8wxdWxhr
   eAG3+46d+lesyOdljz21+71zRg81n/9qwzw0xFCP9mMcq/YH0AiUrxcNj
   hjZPDeybjmIbsVPtS0M3kCIdZJUr++T4A6OQFDotawiBgVTsS1A6kCBDV
   g==;
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="171454599"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Aug 2022 10:27:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 29 Aug 2022 10:27:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 29 Aug 2022 10:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOXae9K6Jm/ea/ahX1Fm38aqq5qNH3YwHErN6bHr+Nw1lPbFHKxfCMAqwSoB60OSgPiJxky43ACArGnhmOiiLnXvgHSGuIAMZhrhdVNs0JfuIH8u2r3Fxru84MmJxB4XivMbXKh7nmuBwQ/UlyJNQfT5lxK5XPpMwDHmzqzPLVuhstSR/u1/CunQIqaSL1FnqwfFSeVb8qKQKafGscjukU6UEVKaCfyZfyz33N+TidWEJu4EVxk28Vu0uL2fmux4+s1lej/QGXuuL68lZb7/Jb17dU9RsIz1z1/V0e/VonczCiPY7iNEmCZ+eA5WKYIJpYHD9U5Gl3VOs9kI5snn7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7L6jYey9pe0Tnv9QAKp2d9ZC3gi8hqfxQN91PAiCd4=;
 b=MN9nmrjFfSo089oF7L216+svwkXPnzAykF+uHhMSLJ/PeMiXvaaEpkPK1Vo599o7Je3kvmoUdVdkHSdjOo0Uo0Wu+P+o1RheJorygfVqJ90w1VwTHiC6akRAEQcAY/vjTb9mC+1YwRJzbhrL76syD0cx0F/VeTo0xj48JVrUpYXrs2wbiy/UNouTZ+Ld+LPIiCsZ3UGHSwDT8fgmFJg0XCZixaWfbT2B5vA+sbpq5UOgC2qjTxbQkBpmhx4m5jhapYTZ/myld4dqUlY67PaSsaHMvGt+XpoKS2+S/xthil/541hlGYsL6NbclrQywNSzKNYi5I/6aTRPSxZrAt6oPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7L6jYey9pe0Tnv9QAKp2d9ZC3gi8hqfxQN91PAiCd4=;
 b=MiAteAY16JMASNbkycgduoafKMN8M2TMffEeq+uYFjPKjRrGrkQhWSolKZjM206VEgwvr8UBd5Cdl7TvxYDfLcGlIivjwsbwpmeVts6uLz2BoBmCodLEoIHLEHR98n7jpug0rrR2SPrYptvvIoS8YQkdFaq47vZ50vWhOccepso=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB1889.namprd11.prod.outlook.com (2603:10b6:404:104::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Mon, 29 Aug
 2022 17:27:48 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 17:27:48 +0000
From: <Conor.Dooley@microchip.com>
To: <jszhang@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ajones@ventanamicro.com>
Subject: Re: [PATCH v2] riscv: enable THP_SWAP for RV64
Thread-Topic: [PATCH v2] riscv: enable THP_SWAP for RV64
Thread-Index: AQHYufzf4JJbBuNch02tBI9sTRPCrK3DP5sAgAKut4CAADcFAA==
Date: Mon, 29 Aug 2022 17:27:48 +0000
Message-ID: <4037b310-47c4-ca30-d4b6-a284e87da437@microchip.com>
References: <20220827095815.698-1-jszhang@kernel.org>
 <0256a458-440c-171c-2a6f-e88a50c16f82@microchip.com>
 <YwzI7VmfFnOvYWgf@xhacker>
In-Reply-To: <YwzI7VmfFnOvYWgf@xhacker>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e1be365-7380-4aaf-3d96-08da89e3cb2a
x-ms-traffictypediagnostic: BN6PR11MB1889:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OvNDcsJE/UijG5JGJcJUHcTAYY+yfiW52Pvxj54kVYLb/TCl2uCEGJmp07JXqujI1bLkvoJU90TRR3HkayT2sKWofrkQeWDFUsYEiL7C49oBcPeKrY+Lr4537i/lAuv3jXRToAAoDcJpIG/kbaJ/OOz0SNnlGZnFD/jMsXNSJ70Jh3CtxkUvwevB6m4YE8hQnDoXCrqCxOvulxqE8jUwe6hohBwwRYlXy2aRoR2yb169HBg7WLYLRSb/t+lhasqYBsJPSu7/BbweHkZbvf6pKNi4HFhLjJ3NLDKaWkKeaBy6GdkmY0jgVsgmJnr+Cv+1wMLon3Zu5m8xf9yK6p5rcHT9khOaGGxArDPYWUFILudGANRI/KxdAfL4qToaoOOiJA5xmn/bKaKaVfLTJLAVbyhwrMxb1eyn5+aG3UsmOcEc+IafZ/PEu/KCIgBi53FhRj4gXDYS9DnGUXfcSOeQViP/OnlicJEyNM2u5+ZKCX37FTe9u/EOthpd75EKMOriovOS4/e2WCBdhTRzkVN7f/xkZsidvUx/qYO+tUdC3vqvJdzzQcqsiKA3mEYokwrFAiOvHlOaY21Xnbu08heRvGYRiA9jDHtd2tPxgUTJKhFFxukg+/KuLtRAsPhPqDOyU24RgbwVmPo0sQNaANTUBmM7hO3oxnLnTjoye/bskWq+N2VSzMqR16vZrrgWT5ecBJY3OJNOz/JKkeZncutY/wDnrl35HxodnrA5TmE/FeU8/ICdx4VXcmLk8pwbHNeUmx5KNhhk+cB6dEaVKwMtGFfBbFTZ9hdWGeMyFUoHKXfNaWr+4nMd39rPl2XOAS1AvDJh6Mc8hJTduvTkZeZSqg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(376002)(39860400002)(366004)(26005)(71200400001)(41300700001)(6512007)(6506007)(66946007)(91956017)(316002)(6916009)(54906003)(66556008)(66446008)(4326008)(66476007)(5660300002)(8676002)(64756008)(76116006)(6486002)(38070700005)(36756003)(86362001)(31686004)(31696002)(8936002)(53546011)(2906002)(478600001)(122000001)(2616005)(38100700002)(83380400001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0NhVUQ1SVc1eVNiWnNmV04zTklJSFNXMExTZ0ZObEN1d1I2eURCVGVETVZI?=
 =?utf-8?B?ZllPeGg3YUVVYUpKT1NmeUk3dXdXRjJEcFBONm5KQlp4WlpEb3dnWHo1aVVI?=
 =?utf-8?B?dXMyVEoxSEF6T3RYU3JJRnJteGlTVlpZUEVGMlZOMmhORTRLR1BrZHp0ZnZa?=
 =?utf-8?B?NE51anI4L2swQ2lTYUtUSTB5Y1lyRDNKNE1INFlBK1poaldhU1ZFUnZRWHdX?=
 =?utf-8?B?Q1NzcW9kaDQ1VjFtczl4Q0w4MGF3alhyZzcrRkRyd2wwRHVrcmMwa2JnaFow?=
 =?utf-8?B?em5kNXRVU0pzUXJ0bXVpVTM5VmZ4U3NVRG0xNzkzVmc1eVN0dUNNdFNFNFQv?=
 =?utf-8?B?Tk81Z3NHU2VnRitWOUdrOG5TaVFia05VVXFjbFoxckVoS2JMRzFjVzNiNjFL?=
 =?utf-8?B?YmRGQ1R6ZVlyN1A5amh0Qk5jeE0yN0tnbTFsaHBoNzNPb0E1UmNMS1ZWTFU0?=
 =?utf-8?B?RUxFT3lwWFRBeFlQNVI1N2x1bmpFM1lLanh2eHdxRzBFcUIrOEdoRWdQdFFD?=
 =?utf-8?B?czltVVBUVTlPMjFOeVhSekJTMmxKTGhxeUQvc1ljRWRmbHFJOGJkVFdEQkh3?=
 =?utf-8?B?WHREbFdJSjJVZnZaSklSOGN6SW1nV3FDSC9QZXdsZDVQVlZJSGpxRys3WmVt?=
 =?utf-8?B?UHJDbzNURFo1SFF2UWZxcXc2WDBSU2FQSm1yNmRZYnVQaHlsZUVkOHpYVVpM?=
 =?utf-8?B?U09DMG9MN3lRRjUvUFE3dXgyV1EwNWJ4Q1diQXNoSmZSWTgvTERPQ1dSd2tv?=
 =?utf-8?B?VXBSWXl4VWJ3NnoxcGs2UnJFSFJ4dm5yTjd0QWE2QVpRR0dLWGdjQnhOR1RF?=
 =?utf-8?B?N0RLZ3ZZZzdERnMwN2c4YUM4c011VFAxbGtoTm96bzhwSVltM1J0TCtYRXdp?=
 =?utf-8?B?Q09mcS9YVlpPRWdXd1FWT3BGK2psSS9wODV0SW5rcXlIaGlZNkZTblBZMFFr?=
 =?utf-8?B?eFZWR2hNT3ZzT0N3NjAyWDEzMGFqbnV1cDhOVVlUTXhlM1orSnhyd1g5eFNT?=
 =?utf-8?B?dUpDTEdkZ2N0eUlxbmpGZW9OMXY0WlUvYktjWmNabm5CS0xudjBPNTJFU3hj?=
 =?utf-8?B?ME5pZHVKL3d3ZUFNdnVlaEpIU2N5UktWb21EZitHL3NtbVZqS1pOa3pGSnVU?=
 =?utf-8?B?UUJFMHRVenhNWWJ0aVhTckoweFBaSnBOdkgrTllvdGN0WFU5MlNhNWQ1bFlk?=
 =?utf-8?B?TXNodHV6QlAvNC9zVGJQMHVFMVRRRUFoaXlpcUpnOHo1c2ZpU3RBVTFYYXNI?=
 =?utf-8?B?Y1lWT1kzYXlnMWxoUENWTDZ5T2gwdzRJbmpKR3BON1NYVC9KVGNJVXdOVisv?=
 =?utf-8?B?WG1hV0tvWjNKekRMdzc0eStNOVZTMVowNU9yVktZQ29XdHpqMUtYNVhlVTFY?=
 =?utf-8?B?WVFzWThrMHI0eTJzLzlPMWRWRFZWMFliT0pHMU8xdnQwV1V1ZTFJK3Babk1x?=
 =?utf-8?B?UjlBRWEwellUWGdtZnFoZUJEWnNnaTRONmVqcCtNQ0lvRURyR3FKSi9pOE5M?=
 =?utf-8?B?b1NZSXZ3SW5pNnBZNEdEWXJ3NXJUb0Q5cms1MGVVUDVITm52TEFyMXBZQVhJ?=
 =?utf-8?B?Z0J1d01GM0xvUS8vT1NMTW15cGgrakszN1lnV0VEeVJWM3R5dUhWaHUyWElT?=
 =?utf-8?B?NW0zYnNmQ0grZUVXUVVRR1krMCs4Vmo0dWFveFVQcTBkNHF3L1oxb3VUQlVC?=
 =?utf-8?B?SkZwQ3ZMODkxRnpiLzV6Vjd1MnEzYml3MnlHeWxocUtsUnhpalc1dGRYdHJQ?=
 =?utf-8?B?S25pQXlManNMa016ZWhJWk5jaU9Fb1R2Ykd6OGtZTEpVa1ZFYkpTdGw5UEVW?=
 =?utf-8?B?QUdpUWE4OWFtZnZQR016aWZOY3BnN0lEUG15cGJRT3JRYjl1eVFiZVRWVFR0?=
 =?utf-8?B?VUxBc0plT0xlVmh1cEFOTjBSSGZFVDU0RFVTeWNVT3MzR2llMndOL0tsYVB2?=
 =?utf-8?B?RHZub1BDN1pGYVo4NWx0c1h6L2VuTmhCNHdRcndMZVNBMTI4R282ZHAxV0s0?=
 =?utf-8?B?dXZRWjBmdDEvamRhdUYxaktHaTRQSWZxU2V1M3BhcnRBOW9vODFDNEVSdElT?=
 =?utf-8?B?OG0zTVpvYTA5VTN6b2JYT1hKZzA1UW93NEdyYXhiOG01eTljYVl4bVBIenN2?=
 =?utf-8?B?ZnBtYXZlOVRXUUtnT2IybkZYMDgzN0JIdjlIMzdtaGRXbUFRRk5jKzRlOUlE?=
 =?utf-8?B?UHc9PQ==?=
Content-ID: <D3201983CDC12C46B6396CF67BC63AA2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1be365-7380-4aaf-3d96-08da89e3cb2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 17:27:48.4846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6m6lrQG9GfZ/fhnBg8ZJUy0lQBJNJYRrmOM83VKmN/jtgb7V2CrOPsPb9AaR/h14nkhf8UMcvQA+JiwGpHu4hOufhavCa/uSSfro7lpqmoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_102759_636422_CE9B8797 
X-CRM114-Status: GOOD (  16.71  )
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

On 29/08/2022 15:10, Jisheng Zhang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Sat, Aug 27, 2022 at 09:13:03PM +0000, Conor.Dooley@microchip.com wrote:
>> Hey Jisheng,
> 
> Hi Conor,
> 
>> On 27/08/2022 10:58, Jisheng Zhang wrote:
>>> I have a Sipeed Lichee RV dock board which only has 512MB DDR, so
>>> memory optimizations such as swap on zram are helpful. As is seen
>>> in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64") and
>>> commit bd4c82c22c367e ("mm, THP, swap: delay splitting THP after
>>> swapped out"), THP_SWAP can improve the swap throughput significantly.
>>>
>>> Enable THP_SWAP for RV64, testing the micro-benchmark which is
>>> introduced by commit d0637c505f8a ("arm64: enable THP_SWAP for arm64")
>>> shows below numbers on the Lichee RV dock board:
>>>
>>> thp swp throughput w/o patch: 66908 bytes/ms (mean of 10 tests)
>>> thp swp throughput w/ patch: 322638 bytes/ms (mean of 10 tests)
>>
>> I know the original commit message contains this, but it's a little
>> odd. If the patch /enables/ THP then how would there be THP swap
>> prior to the patch?
> 
> hmm, it's swap I'll send a v3 to correct the description.
> 
>>
>>>
>>> Improved by 382%!
>>
>> I could not replicate the after numbers on my nezha, so I suspect
>> I am missing something in my config/setup. zswap is enabled and is
> 
> swap on zram rather than zswap ;)

I think I tried about 30 different config variations, initially not
using zswap and later using it.
My zramctl looks like so (although I did try zstd too) after running
the demo application from that commit:

NAME       ALGORITHM DISKSIZE DATA COMPR TOTAL STREAMS MOUNTPOINT
/dev/zram0 lzo-rle       241M  22M  8.4M  9.1M       1 [SWAP]

I am using the default riscv defconfig + the following:
CONFIG_ZRAM=y
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_ZSTD=y
CONFIG_ZRAM_MEMORY_TRACKING=y
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
CONFIG_THP_SWAP=y

Am I just missing something obvious here?
Sorry,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
