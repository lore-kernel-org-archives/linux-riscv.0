Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653FBC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 20:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGKLIhMX68V2t0lIaZ9UvD1tZzjlYtjr8fOUhuKQC8U=; b=CVBdVdOx0TFxJ2
	P6fyYRFVswI7CUsRypxvK/4Yk9vhQnEca+vbs5PMJKWtC/gd0d++zadhk1LDg3KzbczQkqpw0sAYR
	rvtcwNr5RjU4WjT/IhX/YDiBPlJAEYKLV0prh4MSEvOcT99IWpywP5hxvVib7eWjiXh8uOYnneymm
	Oo8r1Y99ViZ4rKNxClNayadJxZAuAD/KvZPzQDifiK0ZJvgTAyiQfc2yl3IJuR1QzIlWO6eojqcNO
	7LLPINwUGtpfM6vKoyXvtoc+BiF1dsXBhq22rUNNSUCWrChsTiX5JFYs7XylPt6fBFr8M7qfPhFqH
	B8Zwa673LCnZbd4LXyAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MpD-006isD-9e; Fri, 01 Jul 2022 20:01:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Mp6-006ipB-L1
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 20:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656705664; x=1688241664;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=o7edBRoI/TB8YhvADBjtgqDcnShvqjCi+nRi0YcfcK8=;
  b=P2M0vs3gYDX7PLIfrzEj2IREndXGEq61hBXgnPvM9LqrodyO9QeGnaUa
   ecv2HaZ2uAhkb1iioGhgeJRTkRJhXC8bap/ujmkviAlQ3n5bH335m9AwU
   8UlGYdWiVSPTYnY8LBqULpZ6PF6ebvFSCZ9esPaQVnqcEuDBVSMmNonPN
   MQPX54pcmlECvB0GKmkhxLPO/5c2MaeUxBquwib33+p9q47fxnQkJnJUW
   q0GpJEftULc0wU+M6NHvvanhwkC+QAvFjXhIZZbqB8ClCIQpgZ1DaICmi
   fSSFbkJcUyf8UkFIaMkKYsdEeTJWizWcJI2VGLs9OCjo5+6Jo0nMuOs+l
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; 
   d="scan'208";a="170742992"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Jul 2022 13:00:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 1 Jul 2022 13:00:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 1 Jul 2022 13:00:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=De7ZJALr7iicDyVlIkSn9jJaDaxJAwLFDRIJesiiSzLy3h+Km68noWR0dO5c7FJ3Dkwx2Pp8USdsJ5TMRymNbg89zWqavnGNICItX60jQwkNBeU8PsYTLjHeSJRuCGwdajqBqwl+tJQJ4kB+kgNWy1nv9Km2AE4lTPJoW3tp/Y2dUoCH6wnefQKPTiGrSmr94Y7/VjnvuxdWAGQHf8vpOitrIprwYCQ32qEn5YsLRqTjVQoswBZyvQKJdpQZOiE7S9S/JCRTQKFoetFGvdCgPjIMt7z0aOz6y0tM//46zAlU8iE0vDEgL+2i0j4VcrPiKaQftD+V7hOaIs+WEPYXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7edBRoI/TB8YhvADBjtgqDcnShvqjCi+nRi0YcfcK8=;
 b=jALhm1tuWNegiEdjuKpxtg/JjxJ/3AZazWa7DcQxXm0+KT7hXJKUmXsrN9aGgRkJz3aAKNuvnYwtdjxsWdI3je7xBkhkNt+U0wJvp6iAq/mRNVLGH64pKxfFOjCo8r35VHqmD23GvdK0u1B6R0AptGzQWFQWQ+/yXsnHarK97XTcIvb2uOm0PHp1GnM4uuE3/AhFbbzfOAdRwLK67gHZWhMGMsQx3/prk1gALEUlhf6YXTgSFC0j5BOgJDK6wniIqoQ5RB11J5vBZaQm19xq/Nlm0edYuIo7K9KypoJHmAreRmpIFb6fBux/Wm4tdGQuVqYS184q84bPGinbh54X9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7edBRoI/TB8YhvADBjtgqDcnShvqjCi+nRi0YcfcK8=;
 b=dhZK4vr6XhR6Q5+FjxrRZ5RvHA0wy94ryh3aZo+FoNvxk7NULS+xFeDVmRWEXqf9TEaRsJlgEmSHN+b9xl39wPDLDLjz7zfLu9cQTAFxnNH2agQKXsKrS0TP00u1euXpdJCdnugRdmeGMwR8xZOwIf3GmZIUW9R7EWp3BSe2CHM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MWHPR11MB1760.namprd11.prod.outlook.com (2603:10b6:300:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 20:00:54 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 20:00:54 +0000
From: <Conor.Dooley@microchip.com>
To: <atulkhare@rivosinc.com>
CC: <palmer@rivosinc.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<robh@kernel.org>
Subject: Re: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Thread-Topic: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Thread-Index: AQHYe5EWlaN9eJ6DkkaWySyozCpPXK1VKhaAgBTmLgCAAAMkAA==
Date: Fri, 1 Jul 2022 20:00:54 +0000
Message-ID: <fb861221-2e9d-7d4a-dd52-b16b3b581fd6@microchip.com>
References: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
 <7ba0c325-bc1f-f6e4-dd8a-b5d13a04ef93@microchip.com>
 <CABMhjYrDyOoDusE4-y4VzM87Vg=NhPbow_dQ+1C4EcX50LrMHw@mail.gmail.com>
In-Reply-To: <CABMhjYrDyOoDusE4-y4VzM87Vg=NhPbow_dQ+1C4EcX50LrMHw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f79c44d-3155-4df8-77ff-08da5b9c682f
x-ms-traffictypediagnostic: MWHPR11MB1760:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E7+5hzGSTsMEkQvvkj+d3QF+WQawFMEa/vOUCJTpkqIYczldpG/oUOV3J59UKGLvTZu2z3cx3xlY3Mdo8Igj6WlcTtt1WmXJwqgc70OlqkxoLjRqO2+1K8uCJ40N5sv6l76mS2e2oPxgPOoI7G/qCDCLvxgOqxUPC9kpLI7NvhUoaHdHhR0utyPPE/akEFbJMDXnIROkr1YcE7DGO7nTnAPI6JX4KrTUdDJ2O/m7UOJpE1tfheIcsmPJ+HdSh8cI9Y0vUdV5av0OKuMS45a60j57sXoKNOPK0MMC8anELGRCnXIgPMaN4sLcr7XLBk+sudqSvxDwUNgDYvyWO/Ve62gDzb3bo4cpuII8xPcPbqPdHBh33slrrDI63hGgBeLTIxjmYVIU45dZQohB32GCA8GU0ScAumbLZEenQ+jSWcosKoQWggFvnkV0tka1UomaCsT0FszOHPUzShcMMaIX7Lh9qr4usQpr2PiMovUJU/AklxtHo4bzV327zQzFs5DeinzSQRZHPPgU4UQxpcFRdPbtWixxEjJnHm43iDRDY45NWqzM0D4b6nHhNPSRdNhyYS8/ZGGFssp0aSVzBVyzpwaKGl9idFhxwGOgwBGE++WHDNBEGax6J7oKMIociR1gj2jn4g7djDT//uY9CgykcBFe5mtxNFPq891QF0rrh+QqrOACg6md+m5AUyImkMxQduEmmr5RRSsZBDiu40oEogVczfubDC9CqC57ZPo/RtuhW0FiBD7YRVe7BA3sscAFlWhUTBCSsIpTiOifDC173EpJdWd7zl08isJnP8BEFulX4qTF9kkYQIPcVl+pWcm4qDwXjy1DB+YqiMnAd9ryicxBAz3TU+NMmhzDHz8HDKHq36MIJkLlcJe55jFoonDx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(346002)(376002)(366004)(136003)(53546011)(6486002)(76116006)(26005)(6506007)(4744005)(91956017)(2906002)(6512007)(66446008)(66556008)(31696002)(8936002)(86362001)(66946007)(122000001)(64756008)(8676002)(31686004)(66476007)(4326008)(5660300002)(54906003)(6916009)(2616005)(36756003)(316002)(38070700005)(71200400001)(186003)(478600001)(38100700002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czNlS3FmVCswZkJVNWlOeXZ5K0NGTHN5ZG5pOWI1Zi9LL0JnQ2tvTDE2U0sy?=
 =?utf-8?B?N2h5RS8vbzJVai9GT2xmM2FtZmZTckpqMmxPMVRwNjVFVGk0WDlVZ1JvOExs?=
 =?utf-8?B?dmwxM1FQaHprTm5yRmlUZ2ROY2hxMW84bUl3RnhqdW51bG1wQy9VeGZ6Z3FB?=
 =?utf-8?B?aXRZMWdwVWJsOENvUjBNTWcxVS9ZdFFURU9OeVZoSkJTZkU4eU1tVXF1aW1w?=
 =?utf-8?B?UjUxRmkyOHRIUlgyaXlXYUlJL1BKNnpzaS9BK3VIMnpZK2E2eDVReG91N0Zx?=
 =?utf-8?B?ZlJNZzUyV0lId2I3S0NWQks0Yi9MV2V0SUMycm1hOFkzcXB2UENkSDQraXUy?=
 =?utf-8?B?OVk2Nndyem1vNk9ZVmNoeG5RTUxEZzBuMjdiOG40RVJLek11emJJbTFraFFs?=
 =?utf-8?B?KzlEdmRlazZ6K21BUG1Ubm50clc5UllyV21XWFRZbVoyTE1ZekFRWXJlQ3NM?=
 =?utf-8?B?cHRpUytibXRNdmhTVW53eDlKM2JoenNjRlRTYUZ4eGMwOUQyakdZZW12aFcz?=
 =?utf-8?B?QVFSN1FadzV6b2hVbk5jQWtmd0R4Ym5mYU42TEE2Y2owcWpRNmtpVnUxYVQ3?=
 =?utf-8?B?ZDhKemducFcvTWZYN1ZNZTdsc0VuS0NjVVZNRWFGakFkMDRENnV3ZzdaM3Fx?=
 =?utf-8?B?cDhUa2V6MVFZM1NhcG5Sa3pINDUzTk5ZQjJJTWthQlFlUnVZRlVpOVl4VEE5?=
 =?utf-8?B?OWVnSjQyekJ1MXptVkhldEVnSG8vN3V2UjExaDIwcnFtcFZyd0s5cG5aQmNn?=
 =?utf-8?B?ZHlwYkxIRHBsOVhOQTB6cHc4Zm9uM1dnTGV0c2dvRjdIamNHNGRpU3Q0NU1F?=
 =?utf-8?B?d1crRzFpRGFPc3FIMTRMTkIwUnlBck5NemptWGNacldLWGdzSzc0QmY2M3NZ?=
 =?utf-8?B?WEErS3Z0U1dNMjNOWFpIOXFtWHl0YkxlaWNVTFpFbEl1anZUV1dyZFRaUHFv?=
 =?utf-8?B?d2tzclorUmlsRGY0OFdkeGo2Vy9jUkR6dGlINDI3Q1dVZ2IxSEp1b3ZOVVFI?=
 =?utf-8?B?RkZwTWNmK2w0V01aOWZzVmhoL3Z2T3BwMEZKSWFzV3hxOUJaQ0FVSFIzeFJl?=
 =?utf-8?B?VUxmdlQzUXBuODl5ejhmNkNMQllVbHJWaVpkV0NyL2ZNSmM1aTM2NHB0SkFQ?=
 =?utf-8?B?TE5HcWRNMC9ENDcrZ2s1UzJ0ZXdCMmVMcU80b1Z1d3RaMjBQVFhBcllsVG0x?=
 =?utf-8?B?ZjlYdWRxcXFXSEUxWXhBNkNoZDVnZXhXTko3NFBWbWdEZkJidWQ3M1pJdHl0?=
 =?utf-8?B?ZlZ0M013Ly9zTUtsVVdJa0o0dWZNVVVPVXM3dldMdnZoWFYxWlVJdE02aGcz?=
 =?utf-8?B?bS92WFF3VE9WWFZ3NkhnNkhvdGtCZTlGQ0pnSUtzMmpabnZoOHIwMGFkcFN5?=
 =?utf-8?B?SDRmWFAyemxPNW9FNUsvSEU0RHZ0bVBIN0VLT1A4ZkpCdk5SSTJvUllRT0lk?=
 =?utf-8?B?V2kxbnowMTdiMDNaR3pEUnlEcWZBcDRuWG9OKzlxa3VsZ0hDNUcrQVhVYlg2?=
 =?utf-8?B?MWpLY2l4clhYcWgzV0d0eklOOW1HS05JYjF6enJVWUg3a1I5SEk0MTVjRTdN?=
 =?utf-8?B?VXF3R2RLb2tlbU0yaHpyU0EyWk0xY05VZUFxbVJwOWM2d2NHTXdlL0FkNEpt?=
 =?utf-8?B?NFR4YzZhV0Rlb3k5R25GaEJJUU5VeTZTMnBPNlk0MW44eTlZMmRUcWtKaGl6?=
 =?utf-8?B?K0lIRzZsc2pqamFyVk5vbXBVc0RoNUh2TWZFQUVqa1pXTjBzdSs1d3RwS1pt?=
 =?utf-8?B?aExoTWpuQ3Z0NzF0WmJtTkxyRlB6RUcwTGtZSFpCeGdXUkFEdEhPZEdmcEdE?=
 =?utf-8?B?M1Z5M2FKNkVWd3BlaEFOTHRNbDdHMERXQlRodFJwS0lvVmJzbktUU1lwUGdh?=
 =?utf-8?B?QnhER0FqRFI0OGN1UjFaU2pXdmpuTnVCM3VWZkVLMzc4b0x0NnJkeG91NFVu?=
 =?utf-8?B?VE5sZEt0RTBwL09pUEVhOFE2Q1hSL2pFZGcrd3R2cHorUWFZYStUWVArWDBs?=
 =?utf-8?B?d3p5SFlKQzNWUGNpOXNpWDhwNG9HNXhaSU9ZbmlZclZWclZVa0JYNFNQVytW?=
 =?utf-8?B?ZVpJa0djSTZZalB0VDBlWEh0d0hpU3BPSXZFTWJuU3FlTFpCRWRicUsrU0Ro?=
 =?utf-8?B?Q3BzZTRFK3hPNlJJMFYvOTFpYlFBeG1hbDI1UWVHUjBxMU5LUjRGbHcwODc0?=
 =?utf-8?B?ZWc9PQ==?=
Content-ID: <EC8A47526795B445AAEEE4A2EF9B1737@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f79c44d-3155-4df8-77ff-08da5b9c682f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 20:00:54.7157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7x25oaYvIMsXl0ocDdSSHgRy4Z/IrKImZd6t6QrtSLwLzVY32geDy+WrOE8/VCcG4Zm21STz0FUq1K1TwrfcoNo3ZpBSya8GkSYrFn5gW8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_130105_056209_72540D96 
X-CRM114-Status: GOOD (  10.12  )
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

On 01/07/2022 20:49, Atul Khare wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Conor,
> 
> Apologies for the delay, but my laptop died a couple of weeks ago, and
> I have been scrambling to get things up and running on the
> replacement. I will try and get back to it ASAP.

Nothing you can do about your laptop dying :)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
