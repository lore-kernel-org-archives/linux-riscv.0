Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DA1C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 06:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Al+0apNfXxugMnHVhkuc9d+cf0eYgbCkPfrA8IYzvH4=; b=mrGXVitAMH0pk/
	vK9RqihuLIm7JBYGiicALrhLaJoTK0jqayVBtmWry9HkzQ6vXhFSllPFaW1Z1s5HNRXWuKgQIy+bT
	K2vuB0sa4Y94PKB2hnfA5NSq3hSm8wkUmLncAOSLiVwhsEBv8MzUlX/yk1ThYaI5qE2CilLap9RS4
	NnqP73bnzp087gxH4FUo7A5C8h7y/LTVYl2jGRZGRsi7rIw3tj4vFRTKMelLO68WYRD9WYcxikBnL
	697nR7AQQvEBGw7pbAZvK6ayoFidZIn9AUWezStfvdETHAz7TlHAMERkhADcHBx4ED++czpTRoxdG
	5HJ98fUae/ivof+avw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBIj-00HWwJ-Fk; Thu, 08 Sep 2022 06:46:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBIg-00HWqv-Eb
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 06:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662619570; x=1694155570;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Vln5LI+vqhf4s7pntgvF/ssMr6HDAHOcp9J4DmbyLYY=;
  b=uPY4g8gRMxRK8Yq7s6/JMm9kzQktcwVv0eZvVfa+5iFDn8CJQEfW25mw
   QoQtTA+Fn/WlgZWNWK2A3gWTO/f5VfTUcPCeRtV1o8xyox3VM1fnvVs0h
   r1gQ4qy9+XgEJ4gUVoHAeogKm7T9DF0HJ/ibZU4/tdOk6rC1qRyh03miL
   igX1ua+m1g/XGrpkL5n27AXC6Oul2DAGUs3dmakb1Z1I3q1owvTtUPL38
   /fFnnq2UkwEaHOq6USPuvl+ootce++Mi9nElMQVOfI8VIfgsqjvxkiS0u
   8Goa2OB3PHfsXr0x0/vNFE8+lljzDzb9Br8RY6GR6CfSPBt8KuYxLgcrJ
   A==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="112686474"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 23:46:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 23:46:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 7 Sep 2022 23:46:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhBtD9Fbhzpa29Li5UU5JaUjdW4V/jJhwBgnesnaEU8gaE7OwaN9QqSIGEScZAbPzohJVKaZEZdfDbo0htq4Ukdt7CuTS0S75ZfX4eh9WLnkiNAWi3GOxp2VJrTdEgFl3ChodiEoxVKqGhwPX6nt7oTtWrS9zM5VI4ROUkriOhS0xvShYXK0B5JNwIi70lLXaBV5zsS7rmhkxRHTFIaQAHFlXuDEMWpvB495OVG/lrhGs2SMV+zPXgtHpBDPR1v6JrgzQVol8SG/mj/m1smXqr7wzxrbpcWtK3++mk1Uu1U02w65WGvFsPtDf2lY2eaFxGt+SLCZhXVyN1nFjgbPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vln5LI+vqhf4s7pntgvF/ssMr6HDAHOcp9J4DmbyLYY=;
 b=Ha2yRZY3/o1cNynwNpGjLMslE+WT6YJ1nvLDFGeazG0QQI+DzCaOfe27zNLYuwP/KXKjKu04SWeCOkUdVWsGLAmOtXkhgBVwbyKgrFXT6l78+Uhs1qcOOzXx5+LdoGZQU/x/OvqX9vW9vlFl6eiauBX5aVUKiPBhr41iuhAulyhDGRXNND40LpRKFfdwCu8CtSopGeVlJ5X+lqn5eyJNt3vDuxd+7fuuuYG2TrVdD3y7aLwzO1v38j4J6JVzJXCjFl4+tRcA7ugnnI78/Y33+nDfFetVkpDzQQT5RzNfGxXkA81aPMFpnCh7rD2ec1ELkCG3VaGjsp3wr+ozLjVJog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vln5LI+vqhf4s7pntgvF/ssMr6HDAHOcp9J4DmbyLYY=;
 b=H/O8hYQ5i5ObEIzPphOpECKtUcULY4pURjTDtI8M8AA9BpKFzD5CRwYRjrRGKlKlYN8zkJhVW5eh8NPQr6+A/Oox2gyhL0bl11oFjQO04won8UDQcfjQvV/6CDA0dOYjkH0vBepfFrupXd4xD5eTIW8JEuCBld2/mqHbsagg/bI=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Thu, 8 Sep
 2022 06:46:07 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610%11]) with mapi id 15.20.5588.014; Thu, 8 Sep 2022
 06:46:07 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 07/13] clk: microchip: mpfs: add MSS pll's set & round
 rate
Thread-Topic: [PATCH v4 07/13] clk: microchip: mpfs: add MSS pll's set & round
 rate
Thread-Index: AQHYw06sm5R2YjJ26U6gCcikco3ZFQ==
Date: Thu, 8 Sep 2022 06:46:06 +0000
Message-ID: <b7304717-a14a-a677-1a5e-09477a5ac6c6@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
 <20220830125249.2373416-7-conor.dooley@microchip.com>
In-Reply-To: <20220830125249.2373416-7-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5db4a95-fe75-4c4d-8da6-08da9165ce98
x-ms-traffictypediagnostic: PH7PR11MB5766:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2LwMJTpQfmA1/3O/xXjB9HpjVZRxmDSVBVO8xzkqETjx9tskV0SxLdk/zuypT9izEzDnbO37WCdyH7VntXWg9ZADeOmjjh1eaPLIxHM4y+4ZOhTYrPau5UW8UDuFFbJLVAxKnNlRBMrHO3sAc0dVgPdgx2/arhwZ+RWB72LgWIM9ftRcwAIy8JWqrCiQBhhG5caVwV/g8SEiiphskxeu9Y8br5DyLsERMo/i7PDvacacykBzsM/BKDnA/AIwKBTASbXoUfNTAlXPeY4+fI0iN2B/rdGUzgV9nRRVrEgtJxY7oyuGXuGcmwuSCjqfSJ5wlTOabL1PHKOH3/nkZDhQY9/63UnzLLx9vblq20HJaHjhfYmDH/DCarXQecmBHsQIvBGmrYvpQMAMm0CS+pOh96QoZEvksQKCd+ngMQEUjRlTZBuZg1ENIbvtwLMa1TGrJ6uxKk23JYJvxSNHb9lsrebM9NuvzJEvU0T7N7ajy5xpiWpKCxSJ6lp9hrKqSOVNcK0AMi3v95KFQE1jSZX5fthENBSbJTLKLEL/iZeXSJZ/nkbErucbGv+pllKEZqpfohLx23Wt2Ruw1o27Dndzeu2eetat6BT1NsV/g6lNuHWZ3cAVEj4HoYvAXTeTWHuAFMFFXJVTgQRZtOtZbGB4bSqwwrMUENc9e/FramNoLMj/5O354Xyls5Ow0/Os3dXtCLZR22aZ87OY1Mkb/U2dFtuu/QPXjy/smj88jEEKBhbHJwuCtRVar780wnKv6hJ2N7M4vxlcbyrLmBwKyeXxwy4X7F4UMK4A2K+02qc8C0SPQgUNtga7EDNBs1QZwsu9A+DWDMB1khEW1Z2nd2uakw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(66556008)(110136005)(316002)(2906002)(6636002)(83380400001)(6512007)(53546011)(6506007)(478600001)(54906003)(26005)(7416002)(5660300002)(38070700005)(31696002)(36756003)(86362001)(8936002)(66476007)(91956017)(66446008)(66946007)(64756008)(8676002)(31686004)(122000001)(4326008)(186003)(71200400001)(41300700001)(38100700002)(76116006)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFpIRVZiWmdZUlZXbElqbmVGZmZPeUZXTDl2TVZZdHdqUEZ5eERBLytNZDdB?=
 =?utf-8?B?TDd3YmpERTY0K1FCOGtWVjhOZ2w2eGRSd3c2TklqRE0vaEVPcm9qYS9XMU85?=
 =?utf-8?B?bEZKeitlWHZ4MWZGaGxPb3ZHdmdnSWVtbTI3YXJybDR5VnhQb2V3eEZJVFVj?=
 =?utf-8?B?bjcxcUFDZEM5V0I3TkFEQzgvQzBlbTVSZWU5TmI2Sjl2S1BZbk5tKzZFbDFn?=
 =?utf-8?B?dzZMUnk3NG1jMXVFME1SanpLZ21saHQ5NWZiZ0ZIdWx1NDdRTG5TU01oN0N2?=
 =?utf-8?B?RlJYakxOWUlJQ2ZKQ0dGUUZXQU1CLy9BVTB1NDYyMHpScTNWY0V4NGlrektp?=
 =?utf-8?B?d0lUOVVLTEZUYk03MGNseVBzWFlVN0RhbDBmZ0dXWkl1NXVlOXF2R3RUZTFp?=
 =?utf-8?B?bHVEM3BMTUZMRjJMcnRTMWxHMGRPSjJpbWZMWU12dEpYM2J3cHVSWERhMUJG?=
 =?utf-8?B?NTJ4WktIZ3h0ZTZBSzc2T3RWaXlIQ0lVQm5Sa1BYMlRvN1VPdmtPcUJQaTFq?=
 =?utf-8?B?Umk5dTk1bDZNMGNTZy81cmVaMDZaaEl3SThUYVMxU2FKYXR3TWJYZVdWYndj?=
 =?utf-8?B?cXh2S2QzemhTSVg3aXJnWGEwdjNnRDRGQ1Q2L01adXlGcTFkeERxR1MvK0NX?=
 =?utf-8?B?MU9XK2lWaGRicit5SFA0Smx0QVFvUFEra0xjemY4c2Jkc1F0Z2NENHBnRnJ3?=
 =?utf-8?B?L3NTMUV1cmg4WDhjMEJYb2Zzc0hJVnZpYmZLaUQ4bG4wN0k3MkRQaU5sWHpH?=
 =?utf-8?B?Y3hJZFpjUm5tbzcwaHVjY3F0R21UOWRXYW5KTkNkODlVMEk2Q2xUbm1ZdXpa?=
 =?utf-8?B?RDVoMHk5WUNFR2FHTGlaZVVtVGh1NDFTaytqYU5EQ1JFOE5wTjdPbVlSR2Z0?=
 =?utf-8?B?dDFsdE16ME9IVm5qb3dYTXlmWjZCQ0Q3NEhkWXBRNWRXZ0VYRk5KUDhYSmwy?=
 =?utf-8?B?dWhFWXcwUDdLT0tIRGpOVlQ2WXR0bkFDQXdsQkFJMUVjbkFRbUdrZGR1NGY2?=
 =?utf-8?B?QUtBQmhTaFRmWU05aXFvNjN2T0VBRDdBcGZ3bnU0OStoWml2MTlpc0lEcGEw?=
 =?utf-8?B?dEZ3NWoxWTF0bmU3TVluRVJ3czhnVEt3c3ViN0hFcDRmamt2VXROVUtoVGVV?=
 =?utf-8?B?eHR6OVYrV2ExUWZrbVllSmh4aTlSaUx3dlUyek02STZ4OFd4Mk9UZk5jTmVr?=
 =?utf-8?B?cThNdEt5VzNnT0hhdWZ5WkkxaysyVXVrZEF2ckF6anlsL1VqR0VtM2hQcCtR?=
 =?utf-8?B?Q2FMdzliMVdtbmdXbGdBWVBGY2hMS2VhQzcxNXdvVDZGS1QvdUx6VGpBNEdR?=
 =?utf-8?B?TmRhblMvNUp4MVVxVkYzbUhkYS9nZzkzQjNoWlRHQ1JmRG43a0t5ZlEyUnU0?=
 =?utf-8?B?d044K25tVnAwSWUxOTZYTTJLRlZjd3QyNDB5cERiN3puVmhYZ0NOVzllSlhn?=
 =?utf-8?B?YU01VnJTbndNVjVDdkVyNXNDU0RGVjduOWN6Yzl4OU90VW8yQVVBTjh3Qy9o?=
 =?utf-8?B?Uk9uamJMY2NYMER2aVgyb3o5V1dxYTlOR2JjQXF4L296YU0zN2kvaXpWWGxm?=
 =?utf-8?B?aldFRTJINjRFcDRNSHh6VzNwTUM1b1htcmQvS0g5dnplMDhsWlU4RnBoQjlv?=
 =?utf-8?B?bUg4VVJXZEM5QWx2ZWtOYWJLa1kvRHFXVjZhR1U5aEQrWm51QVpJTGlTQlUr?=
 =?utf-8?B?T0h4T2VKMG5nOFFsT0Q2UjNPbGtlbmh4Wk9ON2tOazdRSGpjQnd1Z1U1MTRV?=
 =?utf-8?B?MURaNWl0V1NyVUVqcmFVRzRMTVJYSjFZakNHeHB6aDI2c2w0bStqejZad2M4?=
 =?utf-8?B?OGxzdTRaV21wMkNqZ0swb3VEWkR1OGlsOW5ITHpGSGw1dEMvVnkxU1Z5WTAx?=
 =?utf-8?B?b1BJcjNKdUh1d1pBRlcvVVdIVlh6Yyt6Z2JtaEk5UGY5c2xoWGk2N2hXb1FN?=
 =?utf-8?B?M1k0R3NXWVFOSldMWjBabVIrQVpoVkFoVWcrVENzcHZEZjFjUERWWVBIOWxY?=
 =?utf-8?B?dXpKVHV4NHR3N0JlcWJkbXVwbFhCR3BxUnYxZTk3UVMydTFScTFKZE5VMW5F?=
 =?utf-8?B?SllVYlhhZ2pweHdzTDR1Ym44MVlSdFpZYWsrL0FMelVxdnBCZGoxTGJSTXJa?=
 =?utf-8?B?cmZQU0I0VjRPaHJ0Ui9xRzd0ZUxOZWJlVDZBb1dSanNoczdKcmV2UW9uenND?=
 =?utf-8?B?T1E9PQ==?=
Content-ID: <BAAD12D67A14BC46B20C32C99751F04A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5db4a95-fe75-4c4d-8da6-08da9165ce98
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 06:46:07.0018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lo0zw1OcrH5/dYX93VrDG7JO0kcEJ+wBvITqxKoSUDAkcGYRRQjy9JwmVPgflKsc6Km1k+b2ETn4YOYpbS3jXTKha/bDymryhsXCug8lIMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_234610_636867_B1215022 
X-CRM114-Status: GOOD (  20.22  )
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

On 30.08.2022 15:52, Conor Dooley wrote:
> The MSS pll is not a fixed frequency clock, so add set() & round_rate()
> support.
> Control is limited to a 7 bit output divider as other devices on the
> FPGA occupy the other three outputs of the PLL & prevent changing
> the multiplier.
> 
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>


> ---
>  drivers/clk/microchip/clk-mpfs.c | 54 ++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index 43cc9583cd14..008b76d81485 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -131,8 +131,62 @@ static unsigned long mpfs_clk_msspll_recalc_rate(struct clk_hw *hw, unsigned lon
>  	return prate * mult / (ref_div * MSSPLL_FIXED_DIV * postdiv);
>  }
>  
> +static long mpfs_clk_msspll_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
> +{
> +	struct mpfs_msspll_hw_clock *msspll_hw = to_mpfs_msspll_clk(hw);
> +	void __iomem *mult_addr = msspll_hw->base + msspll_hw->reg_offset;
> +	void __iomem *ref_div_addr = msspll_hw->base + REG_MSSPLL_REF_CR;
> +	u32 mult, ref_div;
> +	unsigned long rate_before_ctrl;
> +
> +	mult = readl_relaxed(mult_addr) >> MSSPLL_FBDIV_SHIFT;
> +	mult &= clk_div_mask(MSSPLL_FBDIV_WIDTH);
> +	ref_div = readl_relaxed(ref_div_addr) >> MSSPLL_REFDIV_SHIFT;
> +	ref_div &= clk_div_mask(MSSPLL_REFDIV_WIDTH);
> +
> +	rate_before_ctrl = rate * (ref_div * MSSPLL_FIXED_DIV) / mult;
> +
> +	return divider_round_rate(hw, rate_before_ctrl, prate, NULL, MSSPLL_POSTDIV_WIDTH,
> +				  msspll_hw->flags);
> +}
> +
> +static int mpfs_clk_msspll_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
> +{
> +	struct mpfs_msspll_hw_clock *msspll_hw = to_mpfs_msspll_clk(hw);
> +	void __iomem *mult_addr = msspll_hw->base + msspll_hw->reg_offset;
> +	void __iomem *ref_div_addr = msspll_hw->base + REG_MSSPLL_REF_CR;
> +	void __iomem *postdiv_addr = msspll_hw->base + REG_MSSPLL_POSTDIV_CR;
> +	u32 mult, ref_div, postdiv;
> +	int divider_setting;
> +	unsigned long rate_before_ctrl, flags;
> +
> +	mult = readl_relaxed(mult_addr) >> MSSPLL_FBDIV_SHIFT;
> +	mult &= clk_div_mask(MSSPLL_FBDIV_WIDTH);
> +	ref_div = readl_relaxed(ref_div_addr) >> MSSPLL_REFDIV_SHIFT;
> +	ref_div &= clk_div_mask(MSSPLL_REFDIV_WIDTH);
> +
> +	rate_before_ctrl = rate * (ref_div * MSSPLL_FIXED_DIV) / mult;
> +	divider_setting = divider_get_val(rate_before_ctrl, prate, NULL, MSSPLL_POSTDIV_WIDTH,
> +					  msspll_hw->flags);
> +
> +	if (divider_setting < 0)
> +		return divider_setting;
> +
> +	spin_lock_irqsave(&mpfs_clk_lock, flags);
> +
> +	postdiv = readl_relaxed(postdiv_addr);
> +	postdiv &= ~(clk_div_mask(MSSPLL_POSTDIV_WIDTH) << MSSPLL_POSTDIV_SHIFT);
> +	writel_relaxed(postdiv, postdiv_addr);
> +
> +	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
> +
> +	return 0;
> +}
> +
>  static const struct clk_ops mpfs_clk_msspll_ops = {
>  	.recalc_rate = mpfs_clk_msspll_recalc_rate,
> +	.round_rate = mpfs_clk_msspll_round_rate,
> +	.set_rate = mpfs_clk_msspll_set_rate,
>  };
>  
>  #define CLK_PLL(_id, _name, _parent, _shift, _width, _flags, _offset) {			\

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
