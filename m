Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB351C25B08
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 19:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7h3d0ZDCyltMqsGqVre+BF7M1jeN8DTck+aMLEjI+xI=; b=DDE91DrOrU8FNV
	0eKVIp0OdkyAjj2jkCP5RhXZ29tXESMTMWwM8L7YnRCElrqgeqh7S3bufiiRet302wTGdyh3Kx+Op
	W3lry75cX4zP1RcCpw9324/5XIJoWps/Hd8/8clcIrbXDjubZ/+T088fWW8vxrm24S4+7fAYQdHAA
	bVwZ8kCaQHA/o0dHzpVD9JjxIxz/Qg3Cd1jyT3jT6nVxnjWeYebtnvhNq7/6Fqybojelbva2st+nV
	+3UpjKShkXsySeEuJDIMLVg93ZlXoHZNne5eNDoqrZ6WwWeSAtx5dDOQAz1s4jNYVOMP+FVTyGAdU
	HFufrUi4B/RGufPhh9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNg5L-004J34-Ns; Mon, 15 Aug 2022 19:49:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNg5G-004IyA-IY
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 19:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660592951; x=1692128951;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DwWO2VSUSb1FH96MNTNsseTgiSnrDkvaB/r6HvnPJf4=;
  b=I9gssxQQPm3ke++HIHE/qVbv40BfqNv9uEhSFmb/90bKXrz12yJ2F0Vx
   bElbNlDx+xZ2kspAvqdcDS0rq5ZIdLF3J357qyuFWBlOWUbumGchBv3k8
   WJ2+15ajdj40zCfnXvKfjiDjsftMStNHA5qLxVNF8WzWWY8Z0oyXX17MT
   D7o7wmu72+eXtA7cd7WF+NGfbESrVYW+7xti4GeEIhUCkvSsj+Pbbl/UZ
   2s/44Jegb/HRZ6yIxKiU/ya5msk00eX7wbOGBSZ1M/5sGCQ3SGY8mqufz
   XwXgVAh6Rome6E1pOjgMz5IbZnLfFvREhGK7dypaAixSuLxUf4lkItwd1
   g==;
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; 
   d="scan'208";a="176328255"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 12:49:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 12:49:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 15 Aug 2022 12:49:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BerCerAtRTcNDAwxgl2KFPTtrzMyEEPcrr5mb9gUe8SYyhn6FMLfVP95DF109xmgOQPV/Ck0NQhzQdQ4xLyzrP3zdET/qMeCYx4vDADssNW9I0Szfd0cz5n8mZ88HLMj53Z1g4Try8CJ+VII8PxVnQO0s5FhNx02//dRrfHMaxP90qYCEp/6ja00RYK7rklT0dKxQDs8iWVgf5bQtRSVJofqRcMPspI/TTHza4v+IC04C+sV0xllTnb8WYD4CIImEoqdx1xE1EtN5895iHYCeZd4FBEZikTsVqCO/D962CHLarDmQuuf542a6+Wz1dM6/bsXT6MttXhUfjy4ryYbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwWO2VSUSb1FH96MNTNsseTgiSnrDkvaB/r6HvnPJf4=;
 b=lreyxzDsW2DCeHdx9Ry0Bx5Vuk9wjhdZqCEldLNWL5Jt+8AfQQssWQPv8FbAr08mqMZ8UfKx+4VerpmuPGcH82rc91fR9HI6IaHewTz34DTwmg/FSGbgkWiXLa5pNgsFS1c67RT+vgNPmSKTAmu+Mvzt/TffnLXKE3Qjjoq1wxXvDbTbRBBOtR5cvAtS2H0GxGgxjsWdwSlxTS0tfk+r6j+BHq1k5qoqSdqWynuEudn3mm8iWq9fptaGIH+nBKmp78n44saY/ZkqD6ef6U04stR2+7VHQF8/Dt+iswS2PrTmqfzMaUbLTwYiCiHA7CyJ24mF4JyDuUxPq4wRf9GjNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwWO2VSUSb1FH96MNTNsseTgiSnrDkvaB/r6HvnPJf4=;
 b=AvS+paJUn1TbXPk6z3Gr9CJFJErA0vrGfy9FZq3Y0dwEDE5Dql1XSduKr/ESQjNd4B3N8rPsI5PUuHPZeLMByGWbkPm/GwGzyMX+5ohespHw2EFQiTN+mEhcqEb++N7HV29eAdov06jGSbF0Rmsb1tst4plbkFHQOkrw0+nE+JA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4759.namprd11.prod.outlook.com (2603:10b6:208:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 19:49:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 19:49:06 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.csengg@gmail.com>, <Conor.Dooley@microchip.com>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <geert+renesas@glider.be>,
	<anup@brainfault.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 8/8] RISC-V: configs: defconfig: Enable Renesas RZ/Five
 SoC
Thread-Topic: [PATCH v2 8/8] RISC-V: configs: defconfig: Enable Renesas
 RZ/Five SoC
Thread-Index: AQHYsLoNIrzcJ1b/ykeOQ3jLymgw4q2wTvmAgAAOjYCAAAEtAA==
Date: Mon, 15 Aug 2022 19:49:06 +0000
Message-ID: <c7889bcb-c765-a30c-6d93-c6c1ac0152e3@microchip.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ca555430-055c-debb-fdb4-fa7f78129780@microchip.com>
 <CA+V-a8s=RoZmMvDqnBpYZTR2uotv6srumeoRn2=828zhAbOQZA@mail.gmail.com>
In-Reply-To: <CA+V-a8s=RoZmMvDqnBpYZTR2uotv6srumeoRn2=828zhAbOQZA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c295472-07b6-4959-e1b3-08da7ef736bb
x-ms-traffictypediagnostic: MN2PR11MB4759:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xRu2E50+2AS1l4CXlfExsMhNqVwdOmBVVky5LfHi/1xXM4ZGQr9F3pOUH/ZVqbPkFouX4CD9QaDIO4xLf2WjV+WBU5cYk4MySATZxCYn+wv03jM8XxfDl5YjFvp/tFZz1ob1yscqheUW87cYr/KZcOPJaYcgHZovKjtmJkOhubGGlv5prwVa1/M1RKuKvhcCbTZh6TJ50aGTMLyzaXPUR4b8rCoWOTS78PBBiTH4sMciMGarkjG3cONaXT1HN/gADYbMUzGQ0M9Qgc0EgvsyTaEDn24sZWqWbsl04JxfO3UcCA0LONGh9C/4MF+nKMHiQrYgoNliokol3357e2apgqw41+yAky+7/du5t5Q4Ztaf933q2IJAK4N+CValOkoHlx+R+sMS1bJ+Eq8TdUduobMzTg61yYZfJ2bUAzMYtNE8aCyqrc+/F5jI9n4Ac1CFA6SNgKrx8SAUUirwMnV7TcEgLKwQr08yLAdAqQY+OSKCPybg0T0IhCDcdnaCHX4p5Dgle4UcXYk2fRiMBCG44ZFEGntwUQVaV+WhFaheJJ2J9vV4FIHrmrArAnRt1JBHnY8EYH+8K6DGoBmfviCXvckYjsqVXtyWF9LQ4UKciV//VTjvOKuzLApMu2y57G4k46PUJgY3+uJR+tSMsFuDspR9nWoDnCg6nB2v2QaspdJ1dnPcSqy/671B+Emzhs5GNIIoFzYMBI2pEwr6LCJ7r/y9IWZMPnPEgrubEFr7rwHWFbH7Zih9orUZrKZc9XwRKwXuzubEMn85CVV/jV7J33RsyNWhnMz8i1qo+gHtBds42ZP9VOfIEgeQfsrPbYiHqQKNsma/LW/0tyXcyB2v0mY343zP38uXzqBB123sr0TH/Hbe+TGb2hJ0/ev/Q9a5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(366004)(396003)(136003)(39860400002)(83380400001)(2616005)(186003)(6486002)(71200400001)(478600001)(38100700002)(316002)(91956017)(41300700001)(66556008)(7416002)(76116006)(5660300002)(38070700005)(54906003)(31686004)(2906002)(122000001)(66446008)(66946007)(8936002)(26005)(4326008)(66476007)(64756008)(110136005)(31696002)(8676002)(53546011)(6512007)(36756003)(86362001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzNCZWwzU2ZQbEtWVXlFcFhmTEt4ZGRMc2tQS3V0ZW9tZXZoNERKdGcyc25y?=
 =?utf-8?B?RWhkd3VQQXA4cCtlOWdZR1U1aWNRWldxM3VmZlRZZ0duaitjSVBrdDV4WUJS?=
 =?utf-8?B?OTBIVXBlL2ZMUEdqK3RFS3IzQ0hUWGJZWEVSNzVYVloyQklVS3RGYWg3NndB?=
 =?utf-8?B?K2J2YWNRdlYva0wxUnAzQkdLeTFzVnpnN1RZM21NbGZiRmhHSjhISWRKUk9r?=
 =?utf-8?B?d3Y4cEdiWEFVSmpYdlhUV2NQMjZIWnJyTTBRM1kxbXFSWlU3aHRxbGpnQlB4?=
 =?utf-8?B?L1NnajgwZ1paOWx6N3ZhVGVJZ2kvSUhDcDh6UmZ5R2dEVEt4aFFvcWtNNVJH?=
 =?utf-8?B?cjZuM01CR0h0dm50MGt3Y1NYdHR2ODNVZ1JSUUFldWpwV3FQWnp4VzVZNG1K?=
 =?utf-8?B?NURXci9mQWNiSXhMV24xb3JKRk9JTWw0ZEsraFhOaWlLUXhpMHc1MHBZblZC?=
 =?utf-8?B?MkFVN1d4RGt4N09VZFRkcStJS2NiSWkrdlczR09QU2xHWEFNdEgwNEx1MHBL?=
 =?utf-8?B?ZmMxUDhKTkIwbHdwc2t1eFBJdU9KR21TWDA5eFZvdUtwSStONVNkZ1UwM25F?=
 =?utf-8?B?Q2tHSkFjWVVrMVpURlVpb2dkNGJkT2ZCQU1CL1BKYk11OE9aZUt2WnpQbkF0?=
 =?utf-8?B?blB3WHZGT3AxZzdwbDBKeTFXSi9EdWlCb1Q1TmZmQ2dxT2pxcEM5bWswd1Nr?=
 =?utf-8?B?Vmh5VGNSNytRTndBYVMwZnZidS9Ed1NrbUFCYmlMbVFyanBYV2FYSmtQbU1H?=
 =?utf-8?B?RUZwQzdKYmVoaXVPYS9sU01oU1RpL0QwN0plMnVrdUI1eHYxUkRtMHYzZFg4?=
 =?utf-8?B?MkcxVlR5ZXNzT3RUQ0RnN0QyTEpaK0NOOTBxRVdhN0swZHM1bkFLdm1UTlJL?=
 =?utf-8?B?ZG9Ld3VSeU1sdlNZcHBjTngyNjdEUjhnZTZ2Y3cwTHJCWFQxcnBxc2VBcjZI?=
 =?utf-8?B?TzFaa0VaQURKVE84TTFBbURMR3NmQ1Q1U01QYUc5TFZQM2xsU0FVY3JENEdi?=
 =?utf-8?B?aWhubExZa1lvZXluY3hlMmVVQ1hjRjArTVEwL09nekYrMG5JaFhjbWJCRWZ0?=
 =?utf-8?B?QTFoc25YOXNqczdRZWcrVUdOY3lVSTJ6QXhiNi9GRkMvTEc0UTcxbS9LL2NQ?=
 =?utf-8?B?Zk93YVBkcDVGM1g2Tzc5OThxSldzZVpMdFBMWml4NjBGTWtuWWxTekhGZVlW?=
 =?utf-8?B?aUtUMXpPN2J4a1AvYm96ZXF1aEx2elMvbmxES1pNM3A2bjgvMlRBY0JpRUpX?=
 =?utf-8?B?WHUwMkltY3RkNlBsMWdmb1l1WWNRUll3NjBtWnVOWU5HREhTM1FlYzlGQXd3?=
 =?utf-8?B?eU1NZ0d4VXVrRk80R292dkdMVE1BVGZDaEZYRUxFMW5ORHY0Q0phcDlCamV0?=
 =?utf-8?B?a3dKTHRtcjd1UGdXcjEzNTE5ZUtVWjBUKzNweEp4Vy9QUXorM3VoTDlsSURV?=
 =?utf-8?B?Z1Y0TDVmOVFnMys4Vy9GZGZ3WnFWNWw2bHZlVnBMN0ZxVjdGUUhxb3dxK01V?=
 =?utf-8?B?ZHNhcFMzNlJ6cGJDOVlXTXpHZjVjaGhyM3NMNFRDT0kvWHEzbHBWa2grZGwr?=
 =?utf-8?B?N2w1R0FKek1aak15M1BvVXczanVURjBLclNRc1diNFlicG55Y3cxbnRXenBr?=
 =?utf-8?B?RWhxU29oa3pGSlJoekRtNzlxNW1uUnhOSUJpeXl5RzhDOXZvRzhWQkpQelBi?=
 =?utf-8?B?VDM0cDJ2OFpGNjN2Z3hjTW1MTUFrQzY0RWRrOXJFQ2FoWmxYaXdIblhHYVBz?=
 =?utf-8?B?dFpWeWM5QVBKVWNkTTl0aDdFSFBkODVuMjQ1bkk5MkhmTHQzUWFzVVZFeFhj?=
 =?utf-8?B?YlBVY09IRjJXcW93QlFzSTg3OGJaek1PdytJY1k1OWkwdklyajNWWE5rZjR2?=
 =?utf-8?B?b3ViaVVSOU9YM3BOWEorcGJtMXFMbmJtdC9KWk8yaGJkVHVrYy90WSs1disz?=
 =?utf-8?B?TEgzNTR6QVFZa1dxWU96N2c0am5qS0tNV0M5bFdhVHJOYTBHbEIyN0l0c3dt?=
 =?utf-8?B?dVkvM0NaWEVWNkRvZjZBRm1ieXJEUU9PeGFnZGpTNnIxTVVwNTg3aURUdWRz?=
 =?utf-8?B?QzBlL3h0QkpGckY4VU9DRzhocjhoZHh2QXIrcGdDQXg4QktKVzVzNHNDZkFs?=
 =?utf-8?Q?jgZFor8XicPK7HyrOQZ8W2YE+?=
Content-ID: <413DDB1BFB0D9E4BA58B03DD1BA2178A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c295472-07b6-4959-e1b3-08da7ef736bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 19:49:06.6012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n5i8JT09CCOMFDl2XTL59A+1fgnpl7BxAapoJDVJNfW1Seqlgkug9Otunu3DYGEafnJ3D+x1GAOfEwRnK9OimEhHfCz3Fa/LE/5hdhurYbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_124910_643419_1BFB3CA2 
X-CRM114-Status: GOOD (  17.83  )
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

On 15/08/2022 20:44, Lad, Prabhakar wrote:
> Hi Conor,
> 
> Thank you for the review.
> 
> On Mon, Aug 15, 2022 at 7:52 PM <Conor.Dooley@microchip.com> wrote:
>>
>> On 15/08/2022 16:14, Lad Prabhakar wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Enable Renesas RZ/Five SoC config in defconfig. It allows the default
>>> upstream kernel to boot on RZ/Five SMARC EVK board.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>> v1->v2
>>> * New patch
>>> ---
>>>  arch/riscv/configs/defconfig | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>>> index aed332a9d4ea..de0ccf816c08 100644
>>> --- a/arch/riscv/configs/defconfig
>>> +++ b/arch/riscv/configs/defconfig
>>> @@ -26,6 +26,7 @@ CONFIG_EXPERT=y
>>>  # CONFIG_SYSFS_SYSCALL is not set
>>>  CONFIG_PROFILING=y
>>>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>>> +CONFIG_SOC_RENESAS_RZFIVE=y
>>>  CONFIG_SOC_SIFIVE=y
>>>  CONFIG_SOC_STARFIVE=y
>>>  CONFIG_SOC_VIRT=y
>>> @@ -123,6 +124,7 @@ CONFIG_INPUT_MOUSEDEV=y
>>>  CONFIG_SERIAL_8250=y
>>>  CONFIG_SERIAL_8250_CONSOLE=y
>>>  CONFIG_SERIAL_OF_PLATFORM=y
>>> +CONFIG_SERIAL_SH_SCI=y
>>
>> What's this? The patch text makes this look like an accidental
>> inclusion, but I figure it is required for boot?
> This enables the serial driver used by the RZ/Five SoC. SInce the
> intention was to have a bootable board with default defconfig. I'll
> update the commit message.

SGTM, feel free to add
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
when you send your next version if you like.

Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
