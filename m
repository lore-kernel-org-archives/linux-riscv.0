Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B44ECAAD2
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 06:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LE806YILtmSeXVPaTFrXQPQ9BsaxGqC/eLeBUbULu/U=; b=yKAJitFFdJizDk
	JHptKqVHfLROTnh5JGwZ6vEyq8ebDa9L4kXvPZyJDsyRl5tff5DiaZbb0DvJY5ioAMRc+WrKAmWg5
	NGgzYhTYiVMiAjxRx8mXtHxkLjif1ceDDYwdf+7jRxO0ooMsxNoQKent81Re4qAXDWsps103+6yR2
	Sycp/AnIcn08ukk4ygA8QAAu28eEL3S3K+Xvf1+5sO81wXvPl/sEI2V0SJyiH7PH3af7hNzOrW9L6
	NnACxFWTzrqEWAQiMus5QEiNmhKNQJ1Ut+vrkSfRqOYhQ3U7+5EQHCmV4PEGWZJD26al2G9fmQ43l
	C/YUBfl1RgJoxHp+8nrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRT30-00Epm6-Vm; Fri, 26 Aug 2022 06:42:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRT2x-00EplP-MX
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 06:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661496147; x=1693032147;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SBpJfT0w5Z9yL43bFmVkTivm+qFTxAkhqB3b4uBc6Zg=;
  b=cDwho3lhY6CpveyNlvfDXJn/idNturVo4oioMXekx1UUN1Ker9DCrGDd
   bsXLHRF//F1ocwmp5Ir9oI71w86skgZ6pshijdpKa1OwIe9SbwqDB9boD
   5qbru8iO4sEKpncttHEEFhhmRgDvxkNVT7Mf011gwh0INEuOtcpABXdxX
   76xUeTNWvcb93vwJACD682738b7DpkXt6iqUQ9dUokwfU+c3zADNNTig8
   100YThtRsqX8kcMYXPDOtf66XxdMHzPyJcjL/uvsnIQcqrwsbsg5CBFVD
   5O8uMsdg5W8Ia5GhtgJXQ+ZLk2uCLs4wQFU16Gk0EIpPiiySrLKwci/1+
   w==;
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="177966160"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Aug 2022 23:42:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 25 Aug 2022 23:42:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 25 Aug 2022 23:42:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZpd2/qIe52sYWQ/ZDA+XHZTQQHtnBzZm3loOcLJrsi1pDF+P2e6G4XF7sxsGiqqzKLmdZp5M8OTJCxztr+TrHl7BWHyczPdDnvy3vLmN/dgyUSbkdX/fcHmrDJGe3lRsy/S8D3BiWoPMFi/26SEAZzssjSnNg7bhBSxCsBspHOFyzBcSYzWCPOSevXuQI1+Fz7JPUjZDhiLGykbRn8GkgRSWKK/q72hhfuw9e3LxbvsR36ip5yhtCQCTfwt2IIXMfjzF8GGTkQ/iZHRwyGRoo/23Etyq7VUQGt81F2VcurrqkS5XUDVuka4O3uRtUnDgb2XGhsAKE9Mqi5GGlvt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBpJfT0w5Z9yL43bFmVkTivm+qFTxAkhqB3b4uBc6Zg=;
 b=JmrQnMh3vW6a6PrsqFHWgdSu7P/ybtSC4kyCmThldFTrhxQax8YI5qZvdncSwSr+aaKNSMpNn9H4OBAM9KT8QpxgPNuTVBqJ4Atvsgtq8cvX1yqDFrizRWCoOr0fuTX0rr5z1+hWrQwVR2lIDKLZxT2q78hC5Dcrk18dxkQ0nJwJcC7G1loBhSBqic3t+MSBIhuKOZ918oTVsR4TRND93t/rpo9ccyZ1H1StA22hqdaik1AhLMHlrZr2PGw3omUPoZKEA/zqClA5PdwYcG6CbhCY4PnIOW7R8wHm2OB/tM6grtYr1PNHlaBWHyv7giS1aNklYjW+fWVUKAnNBFWq5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBpJfT0w5Z9yL43bFmVkTivm+qFTxAkhqB3b4uBc6Zg=;
 b=ldXNoeHe/I7jX62w1lq/j1q/3/8T+UBi1DhEkE1GphzckC32TINuGEocYrdUQHdgwqn8fiCJr7gRbOoEP+pItbE+R5eUhHMdX1nGqxE7ZS/0P4g1/CH675nVhbva6vypk/YlvI1eINik1sXZququ/ao2ugTQ9oTE7bQNiMyLlgk=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by BN6PR11MB1233.namprd11.prod.outlook.com (2603:10b6:404:44::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Fri, 26 Aug
 2022 06:42:19 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610%10]) with mapi id 15.20.5566.015; Fri, 26 Aug
 2022 06:42:12 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>, <Hugh.Breslin@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 4/5] clk: microchip: add PolarFire SoC fabric clock
 support
Thread-Topic: [PATCH v3 4/5] clk: microchip: add PolarFire SoC fabric clock
 support
Thread-Index: AQHYuRb4LBQCdLCrEE6SIWRxlmEl6Q==
Date: Fri, 26 Aug 2022 06:42:12 +0000
Message-ID: <6764b456-2e06-54da-2bbb-1efda2dbf52e@microchip.com>
References: <20220824093342.187844-1-conor.dooley@microchip.com>
 <20220824093342.187844-5-conor.dooley@microchip.com>
In-Reply-To: <20220824093342.187844-5-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 663bcbaa-7c41-4269-db9e-08da872e1b6f
x-ms-traffictypediagnostic: BN6PR11MB1233:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0KrenBvD/Mmk0EeEwOdqx7OaQu065R+rVy2vRICoCRekMDCVZd1OLgBvkoAXU1DgwRwmiS8VbpEe9rX9s8V1L/bkFkD0U49LVwY/470+aBGFUeQxJ3INt8K1ujRaGikDtrHuHNIOIPAPRnymkbPAulXge5oTSbKazH8OCGyPoRs9Yi9XLXB8s01Asq8G1fh+ISvBKtvxacUig+SM2ULHfC6T1OGANl0FBlOxk5pt0aQCagnSSCPIFqDDRok5wah9YVur/+4fIhG/dSwHw0fQCj5EMGfFNB8DFKkzf5q5orV6N1Va1x08V56wgL5ypYTMbXwNC4mO9P0iBDWh2m+APe7ddsdgXwxqUJpegnxKGROri2fK/kRZ/6EPADzvcqXcMGWp4DgCk9BwhwN5mSIQFJyHYB6ZoAQE/Xg+0KN7fC71ayJbZhsTzflcl8R6KJklNULlBZTnG4/BGlWdFdpW4S1Z3MoUwGK2v8OhTD9v1CrxrsM2R96wPAUu+ATCTCvcPYINfuO5rNCM6/MktZx/KVO0gdy+N+uWN4+QA7CzStGGskUgRq706e81ZzhgKV0Sp8RQENdwv0kGSYKb1lNgwgrMvyAgwdZlAnZxBtxnxJUKiuqD2dgz+E7fSbIQQItFVlWb4Jf+83ye43gc4qF7TBaAURvIdRu7DCA542GSK5t1XyS11iUwjQ0P3d2wmY8NVBXzdrlaIZaKz+9Bmdy1UIanFPHsvFLOwr2m3bRZ9zQ+7DVpBYD/GQhOAcnpYzDU/z2wwXcX9dmnHVbQb3iP0AvukWNNIOSwbL+qMGCpr8SlB1Tft3IGtQvB5An5ruUY2e9O4w0L+6OcP050EUHrvwteOjIlysdfAU2fGE5sY/U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(376002)(136003)(39860400002)(91956017)(8676002)(4326008)(66446008)(64756008)(66476007)(66556008)(66946007)(76116006)(54906003)(110136005)(316002)(6636002)(86362001)(31696002)(36756003)(7416002)(8936002)(5660300002)(30864003)(2906002)(122000001)(31686004)(38070700005)(38100700002)(6506007)(53546011)(966005)(6486002)(478600001)(6512007)(26005)(41300700001)(71200400001)(2616005)(186003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmEwVXF5TkxtTmZ6cTRRcUpXQXpVZDFsSkQzR0xFZXhWYlA4eU9GTktCaThD?=
 =?utf-8?B?YmFPSnZyMjRjNXpDSkdOZE9XZzJGZlRJVXFRTFdNY2czQTBOWmk3bCtZbTFs?=
 =?utf-8?B?SFdieEZYbHRuVUdQRU5yUUs5TCtHNFZ2cVBDZ2R6L0xWeFNHUmk0WlBsTkJI?=
 =?utf-8?B?OTVadHRhVUN0M3BzcHZhcUpnSUY1bko4bTNxVzVhY0VhM3FTTkJDR0ltNHEv?=
 =?utf-8?B?amdzc083TUpoU2dIQWE2TEM3UmU1aU5BODBxMjFpZWVEajhFSEFsSURpUVBK?=
 =?utf-8?B?OEhuV3cvK2t2V29ENXZCWGlic1I5bFA2aGszVkdCQk5uU2k2WmpqczRBeE5N?=
 =?utf-8?B?aUYvbWNMRTViQXFBUEpQZkh0MHlpODVHSXV1OHpLUkVNUzUwN00vYXBlSGs0?=
 =?utf-8?B?cm50SXlvQk1lZnpkTFVRZm9McGJzUmx2R2duU2dlVXhqZmlFWWY2enFkUjc4?=
 =?utf-8?B?dmEwanVsbk9ObGt3ZkovRExNbjNEZkpTV3dLM0JvZ2pPenNCZEJlS0c4WEh5?=
 =?utf-8?B?ZFd3Y1Y4YzVnN2hocDBRVElLRXQrcmJWcTRSVnJHeGN6T3JPLzBLVjZBZUZz?=
 =?utf-8?B?MU9Idk5Mbml6YVpwUjRCOVpYejZPdzZkVW5UMUI3QnZyMjlUMVhwd3FQZ1Fz?=
 =?utf-8?B?ZEJiUnB1UStrUTVGeHpoYVdnUzBZQ2g1cmM0Q3R6blhXMjVveVo2SUI3SnIz?=
 =?utf-8?B?bkwrNHJYS0RtekxJK0VRc2hGenlwYWt6bmswR0g2dGFocy9vY1pVamJRbkxl?=
 =?utf-8?B?OFA5WjlyL0xOOG1nc2hjN3dJQnpxc1Nob1BONzlhbkZOcnR5N3JYTy9yMXZZ?=
 =?utf-8?B?RDlndHdlckZvZi9uQ0NvLzBTTHl5Ym84VWtOR28rQ0N6Vy9XZW12NW0rL3Rn?=
 =?utf-8?B?U0NSTEdLUXowQ0hkdXFGeWZYOGRsTVFDWkMzM3Y4emxKNmJWUzRsUVpWdEp4?=
 =?utf-8?B?RUtRbTVpTDNXUXB3cldJZ0N1VWU2UEZkOTRRZmpDa0poUjRMMy9YbzV4VVVy?=
 =?utf-8?B?bzJpK3ZhV0hmRkk4R2grZXNwcWxybDk3elZCTFVrdEtLYnc4cGJzOW9oRFhQ?=
 =?utf-8?B?TGRuZ29kS1VsMlJzdy9jSm1aQWNNWmVmck9OaUowVDl1Tkg1aXRieVJjRVNZ?=
 =?utf-8?B?cVdNWEk0am1CUTNJN0lTcXJuMVVXZytpSVhzYlM0cmJkNy9ZSWV1M0QwYzJD?=
 =?utf-8?B?bGlFRWZVaFJ0NFRYVXlYcUQzV3E5MExxaWlZOGFiYmVwSGh2QkR3clI2R3JX?=
 =?utf-8?B?OHA0VVdqK0lUamNFRE1OMHRZdjE0K0xHTitxOGtxYm11WmdieDdCMTZ2allW?=
 =?utf-8?B?UklTTFlEaXh2ZHoremZrUmN0cmwrcGVSUW9RamRuVVYxallZVHYvN1NSK0xQ?=
 =?utf-8?B?TTZYZWw1UlcxTjZvaFdzSzRWYlhzUktXM1ZjQk1ycVoxeGEyN3h6YTg1alha?=
 =?utf-8?B?OVlacmVhOFkvYTF6d20xL3RucEZOUHE2b3EwV1JnQ2lxbS9SZ3lGSWQySFli?=
 =?utf-8?B?QjMxM3VZUWkrZkdGUGl1MjFFeFhxcVpjRTFVRWtSREw5RTFpdytMc2V6bGt1?=
 =?utf-8?B?NVNxNGtFdjR0TkJKYUNBM3Q3TTBTNkpmVE9XbVdGaC8zTWNJcHh2Z0xkbUZ1?=
 =?utf-8?B?d0E3cC9Td1RMZ2oxQVc5djBJeEI4QXI1bG80eW5FZVBseHNSSGUyTlZ4ZkFN?=
 =?utf-8?B?cGI5K2FBNUttSzJDaFFmZ3FYTTJNa0NLQnVCaUZTK2c3dlJUYjJEcmZ6dDlt?=
 =?utf-8?B?Y0VBVGNoZlp5RDNKTEZKU1FCTGZmUFZXeEx6a2NPNUx0UFdDSXZXemcxa2lI?=
 =?utf-8?B?U3A0d0FwYWUvU2huQ2pVVFZ4QUgwbzZ0THN3dkhIUmtiVXU5YjBTaEJYKy9G?=
 =?utf-8?B?RllZSnlHQkN3K2ZUZVN4ekdhdkhyZU9ITkRQZURwS1czZ1pWd21TQkJBcjJB?=
 =?utf-8?B?aEp6QTVUaE9Dc2diYTRSZWxNNmErL2QrTElFVS9aeWpYa3lSdEozYXYrUWY2?=
 =?utf-8?B?RExRM01wZG9wdGVyaDdaS3JVRHM4bkY2ak1iOWczVkREb2JoQW1qT0hKb3FB?=
 =?utf-8?B?cldUd2FFTnhONnVBcFFVWVp2c1dXbkw0VUt2dGJDemtkcW01cElNRUZvQ1lK?=
 =?utf-8?B?aHJ0aXRCQVpDY1dLL3hDMVpjT0s3ZW9pT0E4UjROMzdYY1lyYlo1UGNhL1VK?=
 =?utf-8?B?OXc9PQ==?=
Content-ID: <61FE971785A7954BBF7B59D6B387404E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663bcbaa-7c41-4269-db9e-08da872e1b6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 06:42:12.4438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2+6WPvEz7AI6JIcq+Uj47g2I7GmJ+9lsLTl3NtWwtESxiz4gNKuzWzV8HImI9M2Hx68Nx/gbbWU2FIPv2M3X+BL9kKOZSbgQ33EMp1S+QAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_234227_947364_6612FEA7 
X-CRM114-Status: GOOD (  22.29  )
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

On 24.08.2022 12:33, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add a driver to support the PLLs in PolarFire SoC's Clock Conditioning
> Circuitry, an instance of which is located in each ordinal corner of
> the FPGA. Only get_rate() is supported as these clocks are intended to
> be statically configured by the FPGA design. Currently, the DLLs are
> not supported by this driver. For more information on the hardware, see
> "PolarFire SoC FPGA Clocking Resources" in the link below.
> 
> Link: https://onlinedocs.microchip.com/pr/GUID-8F0CC4C0-0317-4262-89CA-CE7773ED1931-en-US-1/index.html
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/clk/microchip/Makefile       |   1 +
>  drivers/clk/microchip/clk-mpfs-ccc.c | 293 +++++++++++++++++++++++++++
>  2 files changed, 294 insertions(+)
>  create mode 100644 drivers/clk/microchip/clk-mpfs-ccc.c
> 
> diff --git a/drivers/clk/microchip/Makefile b/drivers/clk/microchip/Makefile
> index 5fa6dcf30a9a..13250e04e46c 100644
> --- a/drivers/clk/microchip/Makefile
> +++ b/drivers/clk/microchip/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_COMMON_CLK_PIC32) += clk-core.o
>  obj-$(CONFIG_PIC32MZDA) += clk-pic32mzda.o
>  obj-$(CONFIG_MCHP_CLK_MPFS) += clk-mpfs.o
> +obj-$(CONFIG_MCHP_CLK_MPFS) += clk-mpfs-ccc.o
> diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip/clk-mpfs-ccc.c
> new file mode 100644
> index 000000000000..2a34034c2c6e
> --- /dev/null
> +++ b/drivers/clk/microchip/clk-mpfs-ccc.c
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + *
> + * Copyright (C) 2022 Microchip Technology Inc. and its subsidiaries
> + */
> +#include "asm-generic/errno-base.h"
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/microchip,mpfs-clock.h>
> +
> +/* address offset of control registers */
> +#define MPFS_CCC_PLL_CR                        0x04u
> +#define MPFS_CCC_REF_CR                        0x08u
> +#define MPFS_CCC_SSCG_2_CR             0x2Cu
> +#define MPFS_CCC_POSTDIV01_CR          0x10u
> +#define MPFS_CCC_POSTDIV23_CR          0x14u
> +
> +#define MPFS_CCC_FBDIV_SHIFT           0x00u
> +#define MPFS_CCC_FBDIV_WIDTH           0x0Cu
> +#define MPFS_CCC_POSTDIV0_SHIFT                0x08u
> +#define MPFS_CCC_POSTDIV1_SHIFT                0x18u
> +#define MPFS_CCC_POSTDIV2_SHIFT                MPFS_CCC_POSTDIV0_SHIFT
> +#define MPFS_CCC_POSTDIV3_SHIFT                MPFS_CCC_POSTDIV1_SHIFT
> +#define MPFS_CCC_POSTDIV_WIDTH         0x06u
> +#define MPFS_CCC_REFCLK_SEL            BIT(6)
> +#define MPFS_CCC_REFDIV_SHIFT          0x08u
> +#define MPFS_CCC_REFDIV_WIDTH          0x06u
> +
> +#define MPFS_CCC_FIXED_DIV             4
> +#define MPFS_CCC_OUTPUTS_PER_PLL       4
> +#define MPFS_CCC_REFS_PER_PLL          2
> +
> +struct mpfs_ccc_data {
> +       void __iomem **pll_base;
> +       struct device *dev;
> +       struct clk_hw_onecell_data hw_data;
> +};
> +
> +struct mpfs_ccc_pll_hw_clock {
> +       void __iomem *base;
> +       const char *name;
> +       const struct clk_parent_data *parents;
> +       unsigned int id;
> +       u32 reg_offset;
> +       u32 shift;
> +       u32 width;
> +       u32 flags;
> +       struct clk_hw hw;
> +       struct clk_init_data init;
> +};
> +
> +#define to_mpfs_ccc_clk(_hw) container_of(_hw, struct mpfs_ccc_pll_hw_clock, hw)
> +
> +/*
> + * mpfs_ccc_lock prevents anything else from writing to a fabric ccc
> + * while a software locked register is being written.
> + */
> +static DEFINE_SPINLOCK(mpfs_ccc_lock);
> +
> +static const struct clk_parent_data mpfs_ccc_pll0_refs[] = {
> +       { .fw_name = "pll0_ref0" },
> +       { .fw_name = "pll0_ref1" },
> +};
> +
> +static const struct clk_parent_data mpfs_ccc_pll1_refs[] = {
> +       { .fw_name = "pll1_ref0" },
> +       { .fw_name = "pll1_ref1" },
> +};
> +
> +static unsigned long mpfs_ccc_pll_recalc_rate(struct clk_hw *hw, unsigned long prate)
> +{
> +       struct mpfs_ccc_pll_hw_clock *ccc_hw = to_mpfs_ccc_clk(hw);
> +       void __iomem *mult_addr = ccc_hw->base + ccc_hw->reg_offset;
> +       void __iomem *ref_div_addr = ccc_hw->base + MPFS_CCC_REF_CR;
> +       u32 mult, ref_div;
> +
> +       mult = readl_relaxed(mult_addr) >> MPFS_CCC_FBDIV_SHIFT;
> +       mult &= clk_div_mask(MPFS_CCC_FBDIV_WIDTH);
> +       ref_div = readl_relaxed(ref_div_addr) >> MPFS_CCC_REFDIV_SHIFT;
> +       ref_div &= clk_div_mask(MPFS_CCC_REFDIV_WIDTH);
> +
> +       return prate * mult / (ref_div * MPFS_CCC_FIXED_DIV);
> +}
> +
> +static u8 mpfs_ccc_pll_get_parent(struct clk_hw *hw)
> +{
> +       struct mpfs_ccc_pll_hw_clock *ccc_hw = to_mpfs_ccc_clk(hw);
> +       void __iomem *pll_cr_addr = ccc_hw->base + MPFS_CCC_PLL_CR;
> +
> +       return !!(readl_relaxed(pll_cr_addr) & MPFS_CCC_REFCLK_SEL);
> +}
> +
> +static const struct clk_ops mpfs_ccc_pll_ops = {
> +       .recalc_rate = mpfs_ccc_pll_recalc_rate,
> +       .get_parent = mpfs_ccc_pll_get_parent,
> +};
> +
> +#define CLK_CCC_PLL(_id, _parents, _shift, _width, _flags, _offset) {          \
> +       .id = _id,                                                                      \
> +       .shift = _shift,                                                                \
> +       .width = _width,                                                                \
> +       .reg_offset = _offset,                                                          \
> +       .flags = _flags,                                                                \
> +       .parents = _parents,\
> +}
> +
> +static struct mpfs_ccc_pll_hw_clock mpfs_ccc_pll_clks[] = {
> +       CLK_CCC_PLL(CLK_CCC_PLL0, mpfs_ccc_pll0_refs, MPFS_CCC_FBDIV_SHIFT,
> +                   MPFS_CCC_FBDIV_WIDTH, 0, MPFS_CCC_SSCG_2_CR),
> +       CLK_CCC_PLL(CLK_CCC_PLL1, mpfs_ccc_pll1_refs, MPFS_CCC_FBDIV_SHIFT,
> +                   MPFS_CCC_FBDIV_WIDTH, 0, MPFS_CCC_SSCG_2_CR),
> +};
> +
> +struct mpfs_ccc_out_hw_clock {
> +       struct clk_divider divider;
> +       struct clk_init_data init;
> +       unsigned int id;
> +       u32 reg_offset;
> +};
> +
> +#define CLK_CCC_OUT(_id, _shift, _width, _flags, _offset) {    \
> +       .id = _id,                                              \
> +       .divider.shift = _shift,                                \
> +       .divider.width = _width,                                \
> +       .reg_offset = _offset,                                  \
> +       .divider.flags = _flags,                                \
> +       .divider.lock = &mpfs_ccc_lock,                         \
> +}
> +
> +static struct mpfs_ccc_out_hw_clock mpfs_ccc_pll0out_clks[] = {
> +       CLK_CCC_OUT(CLK_CCC_PLL0_OUT0, MPFS_CCC_POSTDIV0_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
> +                   CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV01_CR),
> +       CLK_CCC_OUT(CLK_CCC_PLL0_OUT1, MPFS_CCC_POSTDIV1_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
> +                   CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV01_CR),
> +       CLK_CCC_OUT(CLK_CCC_PLL0_OUT2, MPFS_CCC_POSTDIV2_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
> +                   CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV23_CR),
> +       CLK_CCC_OUT(CLK_CCC_PLL0_OUT3, MPFS_CCC_POSTDIV3_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
> +                   CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV23_CR),
> +};
> +
> +static struct mpfs_ccc_out_hw_clock mpfs_ccc_pll1out_clks[] = {
> +       CLK_CCC_OUT(CLK_CCC_PLL1_OUT0, MPFS_CCC_POSTDIV0_SHIFT, MPFS_CCC_POSTDIV_WIDTH, 0,
> +                   MPFS_CCC_POSTDIV01_CR),
> +       CLK_CCC_OUT(CLK_CCC_PLL1_OUT1, MPFS_CCC_POSTDIV1_SHIFT, MPFS_CCC_POSTDIV_WIDTH, 0,
> +                   MPFS_CCC_POSTDIV01_CR),
> +       CLK_CCC_OUT(CLK_CCC_PLL1_OUT2, MPFS_CCC_POSTDIV2_SHIFT, MPFS_CCC_POSTDIV_WIDTH, 0,
> +                   MPFS_CCC_POSTDIV23_CR),
> +       CLK_CCC_OUT(CLK_CCC_PLL1_OUT3, MPFS_CCC_POSTDIV3_SHIFT, MPFS_CCC_POSTDIV_WIDTH, 0,
> +                   MPFS_CCC_POSTDIV23_CR),
> +};
> +
> +static struct mpfs_ccc_out_hw_clock *mpfs_ccc_pllout_clks[] = {
> +       mpfs_ccc_pll0out_clks, mpfs_ccc_pll1out_clks
> +};
> +
> +static int mpfs_ccc_register_outputs(struct device *dev, struct mpfs_ccc_out_hw_clock *out_hws,
> +                                    unsigned int num_clks, struct mpfs_ccc_data *data,
> +                                    struct mpfs_ccc_pll_hw_clock *parent)
> +{
> +       int ret;
> +
> +       for (unsigned int i = 0; i < num_clks; i++) {
> +               struct mpfs_ccc_out_hw_clock *out_hw = &out_hws[i];
> +               char *name = devm_kzalloc(dev, 23, GFP_KERNEL);
> +
> +               snprintf(name, 23, "%s_out%u", parent->name, i);
> +               out_hw->divider.hw.init = CLK_HW_INIT_HW(name, &parent->hw, &clk_divider_ops, 0);
> +               out_hw->divider.reg = data->pll_base[i / MPFS_CCC_OUTPUTS_PER_PLL] +
> +                       out_hw->reg_offset;
> +
> +               ret = devm_clk_hw_register(dev, &out_hw->divider.hw);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
> +                                            out_hw->id);
> +
> +               data->hw_data.hws[out_hw->id] = &out_hw->divider.hw;
> +       }
> +
> +       return 0;
> +}
> +
> +#define CLK_HW_INIT_PARENTS_DATA_FIXED_SIZE(_name, _parents, _ops, _flags)     \
> +       (&(struct clk_init_data) {                                              \
> +               .flags          = _flags,                                       \
> +               .name           = _name,                                        \
> +               .parent_data    = _parents,                                     \
> +               .num_parents    = MPFS_CCC_REFS_PER_PLL,                        \
> +               .ops            = _ops,                                         \
> +       })
> +
> +static int mpfs_ccc_register_plls(struct device *dev, struct mpfs_ccc_pll_hw_clock *pll_hws,
> +                                 unsigned int num_clks, struct mpfs_ccc_data *data)
> +{
> +       int ret;
> +
> +       for (unsigned int i = 0; i < num_clks; i++) {
> +               struct mpfs_ccc_pll_hw_clock *pll_hw = &pll_hws[i];
> +               char *name = devm_kzalloc(dev, 18, GFP_KERNEL);
> +
> +               pll_hw->base = data->pll_base[i];
> +               snprintf(name, 18, "ccc%s_pll%u", strchrnul(dev->of_node->full_name, '@'), i);
> +               pll_hw->name = (const char *)name;
> +               pll_hw->hw.init = CLK_HW_INIT_PARENTS_DATA_FIXED_SIZE(pll_hw->name,
> +                                                                     pll_hw->parents,
> +                                                                     &mpfs_ccc_pll_ops, 0);
> +
> +               ret = devm_clk_hw_register(dev, &pll_hw->hw);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "failed to register ccc id: %d\n",
> +                                            pll_hw->id);
> +
> +               data->hw_data.hws[pll_hw->id] = &pll_hw->hw;
> +
> +               ret = mpfs_ccc_register_outputs(dev, mpfs_ccc_pllout_clks[i],
> +                                               MPFS_CCC_OUTPUTS_PER_PLL, data, pll_hw);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int mpfs_ccc_probe(struct platform_device *pdev)
> +{
> +       struct mpfs_ccc_data *clk_data;
> +       void __iomem *pll_base[ARRAY_SIZE(mpfs_ccc_pll_clks)];
> +       unsigned int num_clks;
> +       int ret;
> +
> +       num_clks = ARRAY_SIZE(mpfs_ccc_pll_clks) + ARRAY_SIZE(mpfs_ccc_pll0out_clks)
> +               + ARRAY_SIZE(mpfs_ccc_pll1out_clks);
> +
> +       clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hw_data.hws, num_clks),
> +                               GFP_KERNEL);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       pll_base[0] = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(pll_base[0]))
> +               return PTR_ERR(pll_base[0]);
> +
> +       pll_base[1] = devm_platform_ioremap_resource(pdev, 1);
> +       if (IS_ERR(pll_base[1]))
> +               return PTR_ERR(pll_base[1]);
> +
> +       clk_data->pll_base = pll_base;
> +       clk_data->dev = &pdev->dev;
> +
> +       ret = mpfs_ccc_register_plls(clk_data->dev, mpfs_ccc_pll_clks,
> +                                    ARRAY_SIZE(mpfs_ccc_pll_clks), clk_data);
> +       if (ret)
> +               return ret;
> +
> +       ret = devm_of_clk_add_hw_provider(clk_data->dev, of_clk_hw_onecell_get,
> +                                         &clk_data->hw_data);
> +       if (ret)
> +               return ret;

You can skip this or even directly:
	return devm_of_clk_add_hw_provider(...);

> +
> +       return ret;
> +}
> +
> +static const struct of_device_id mpfs_ccc_of_match_table[] = {
> +       { .compatible = "microchip,mpfs-ccc", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, mpfs_ccc_of_match_table);
> +
> +static struct platform_driver mpfs_ccc_driver = {
> +       .probe = mpfs_ccc_probe,
> +       .driver = {
> +               .name = "microchip-mpfs-ccc",
> +               .of_match_table = mpfs_ccc_of_match_table,
> +       },
> +};
> +
> +static int __init clk_ccc_init(void)
> +{
> +       return platform_driver_register(&mpfs_ccc_driver);
> +}
> +core_initcall(clk_ccc_init);
> +
> +static void __exit clk_ccc_exit(void)
> +{
> +       platform_driver_unregister(&mpfs_ccc_driver);
> +}
> +module_exit(clk_ccc_exit);
> +
> +MODULE_DESCRIPTION("Microchip PolarFire SoC Clock Conditioning Circuitry Driver");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_LICENSE("GPL");
> --
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
