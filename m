Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4773C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 15:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdlFhwzBv25365p+vVRSFuneHgxz5VcmlwKuS4nVcIU=; b=JioDXYyfmtKpjv
	6NUGLFjefHEjahSN7wPlFvr1wVflHmSvIb/2PBmdvqqquozzoMExIftO7AYQRyx5P5B/NP9iPDr5H
	NVjeoI6wYkIDHs+gmvxeSoymtm+/TeOE2q/EX4YoG50Kx+LL2UsusbK+/e0bRmnlzl/t+bHr3/HEt
	iBb0q7F+q8qmisRpcM4FPNHu3zahPx0KrdKFdC2fQWKP+NuS0/918ItB7L3k/RymI70FNeuS7HtvY
	BlZ6bGi/Qrn+JGQeUoF/LplxxSrQFvZCBQleVg+7A6x1MqOQ01Y73AiqBLfbe6b00YBouawTmf5dr
	Xz54MLcYCBiRvdiWhiHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZ1p-009kpz-HA; Mon, 31 Jan 2022 15:55:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZ1m-009kpB-D3
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 15:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643644538; x=1675180538;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TSXdf6Xp7bzDB87xsUL/3NMEmkx5ON/vq+fYe6c980M=;
 b=YdvyTf/PF81TQCYX3umwf8vQVf8CO0jB8y6th+mWnj+UnTDRsZ1NWUiE
 NTTJ1EpchGMgF8BTI+Qcm+J2VJR1Lypv0QkfuelocJK0IQ0iVo6klZy5M
 VhVhZAQd7K+6Ydri/oec/L12dnkdGngBDeJQeHMIjvJxOuVjh+FO26+xO
 ItSdt9Gjv/1FQ8w+wHXFkEoUKPBOjEhI/hswFgvQFyjAYLumDIJtiniVH
 qV0C8+RKlNTv4TVpVagvnfRwVIM2gznWvI+GwE51HKrhyXFYD5atSaZu7
 fjScTFAdEEHgI/9jQi65T6CiRLGVCqL7rGKSCfpx+jcjIF4M4zb4b4PQn A==;
IronPort-SDR: 3umtJfL6/uXc714W4Ka3KKzr/RA1TSuhATY3tH3YKcPNkpN+qUpgqmucgSix3TWAjOHPQi5VaJ
 Sfmtok6DE34muxCbQc3uCT0xqnI595/pIgtjac5UIEIRR6IHZsNb5+HWJm3la/VizTy2MpQscX
 yjPxEr+A/5dm9mTOJnwiQfo4AuLGjSLbZ3E2ccvKNk/0WRLU69M9lN5/XHkTHuE86fl1Vz9RDv
 ZR4JYg398PmAId8fIBBOQl8q+3qAWwhiUuzXXVdS7Lu0iuSDnlHLcbonU+M42Zi1d2Bl28RzsI
 UQww9o79tI/9WaHMmlh1o2p6
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="84207470"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jan 2022 08:55:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 08:55:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 31 Jan 2022 08:55:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUdw9T5TTwKx9Fj0Jw/BXu3OBY1UiRPqHnsxU+M1HWwOOwKg+dDvcBTBn7LzlCBsslCGDjaA340rmMDXj6I+tyXf0nEc0D0t3mioSxfismgAHuWhRRdy7Q7CxxxwnE76EWWjBvCk60deaz4fTj44nzAt6tfozoUza0ooHvQKiZTcUVMbHMdhYBrVYhgbdlUH7gt/+FUHzsVfg1vTXooQqvts0MUXjnT6rRhJvsHOpVAam43yImUHR2y9kymUeO6eUVTO+hjQtCFj73u/wixJkjHr0XxtObx+92T6aGWoAE65dpppiK1foLEpcM/V4hEfwlX24mAfmayya2jm3NNNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSXdf6Xp7bzDB87xsUL/3NMEmkx5ON/vq+fYe6c980M=;
 b=hnSVlcihysiiZKVSXW/CHCwIh4PjcGWVep3cHw4aE77kpxmTY2DG4hv2Pmvw+WlkWsLn4bfyGHLQfuBFxW5sg6nB5UynJpyTjtX49tu+TONTPG00bzr50hXMDxhO/UK5r9jo88rL51mrBU1Z0RhgDk/nTge2KqRorCoOhz34SDiRUOxAWu/LXHesllKCEE1UN8ZmTKfqJo3/6SPu/UzXi5KXQJUjc21hH1uSrNmpbhTjwOfmoi1lzx1Kbrwq3FjzwoMSqhoEQ5pLnlE+/TmMwYextrEz2bZAN/aptHSgh0NX7A9IZpPkd0D/tjb9vVqJvJhVc3pUAXB0UUm5TEPURQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSXdf6Xp7bzDB87xsUL/3NMEmkx5ON/vq+fYe6c980M=;
 b=NBfhln+X5w4eoFtzaswcJe/U8se+U7L2ahAyRQKT22sTclkM9xxbAJm89ZQB98gcGh6tAH0yPZknQIfvspE2U+iAEIzWnzdPACSWvYKQ5eH1P1qzTqWqgfqxFoBkewIpTHm4LVo6aCk7vLXf0arvNFd23P5UDTW9xij97NucQAU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 15:55:33 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3%9]) with mapi id 15.20.4909.019; Mon, 31 Jan 2022
 15:55:32 +0000
From: <Conor.Dooley@microchip.com>
To: <robh+dt@kernel.org>
CC: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <jassisinghbrar@gmail.com>,
 <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <krzysztof.kozlowski@canonical.com>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <Lewis.Hanly@microchip.com>,
 <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
 <atishp@rivosinc.com>
Subject: Re: [PATCH v5 03/12] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Thread-Topic: [PATCH v5 03/12] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Thread-Index: AQHYFpggxOHKEpwSFU23yi0MmUGdS6x9REQAgAAFVIA=
Date: Mon, 31 Jan 2022 15:55:32 +0000
Message-ID: <84e1d43f-4d3d-1501-5bc1-c982272e1ce3@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-4-conor.dooley@microchip.com>
 <CAL_JsqJkFaGmpAi3eEUROWyOr_PQEZ209TneLhsOkpf3w8jQdw@mail.gmail.com>
In-Reply-To: <CAL_JsqJkFaGmpAi3eEUROWyOr_PQEZ209TneLhsOkpf3w8jQdw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d0bbff2-320d-4977-f9a3-08d9e4d21cf8
x-ms-traffictypediagnostic: MW3PR11MB4649:EE_
x-microsoft-antispam-prvs: <MW3PR11MB4649A6A1ACEFD6901B639F5698259@MW3PR11MB4649.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2MoDtsGmTrz4facBwEKgWGdgfduTc3X51nNcbf+OmCQlMXVX0MdO0RPJQnAoYs2g3cBxT/Slk+XSUkOjO/1p8m0qaPvkIHwjwNBZRdpzXfoH6sLKVA6TmQFjf5vVMk4RM7e0q4zpk6MAAmkbbWKKYhvkrI0zbb8GxAm4X+6j6Y3G5BnaWP8v3mC8Yf05V0A7Qluae5ogbdTpup07ztkE6bgKfki8k3dSB/6ENoQi/JptCFiIR+zrLTtD4u9PcnaxrD3UAW8b7GjYdkLmjqg6qZcQ6l0lkhItzeFatp0HQP0juitCgihOYfkjS8d4djw3MG7fEyWA3MOCE9uUVcgXta48i/21/WQnxS/3xQwboz6bfR19SCxSXWXSv2uHRleugA8celMCRozg0G3ZxkcRo4BkoXhzxRX9+DFmJv7bV3ZakWoCUjpaAyZBbHvIe4QRiJViU4gW2jGE/5FhwYtMxqz+p+WVfhWG4yKPbx+QkV8kz42ntsmQ8WhX6VztieL0Za8TSiV4+qj92DJhA6/BGr8WDIxqxRrlChAyjH0SpWdxjuRUWXsBfpK2QruLo4B49ONgTeZM8N1l7rY9g60fPMvxgtxkex/g1ZFmkGlEJynLp54BhNqN/wrywF2Z3+VEooc2IWyELCvoK5AZm0IV3m8pjeZxz117U598BgegSBM5VdXW6E9NIgOCqddabIlNGuzXyB5ePVZfrI3l7aeSK1ciYvdQYwdAW7vui0shV8HAAxqBvpMSOr/pQAWshIDsGOl7dldIFpCGYE4Zi9x04g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(7416002)(5660300002)(6506007)(6512007)(186003)(26005)(83380400001)(4744005)(2616005)(2906002)(66476007)(122000001)(8936002)(38070700005)(31696002)(86362001)(316002)(38100700002)(6486002)(31686004)(91956017)(54906003)(71200400001)(508600001)(4326008)(8676002)(36756003)(76116006)(66946007)(66446008)(66556008)(64756008)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cm1iVUl2d29ydWxPYUg3eXVqcWJ4WEhiTG81R0VWZzZmQ0FsT2Irbmsxd3RD?=
 =?utf-8?B?U2pFWE80MVBjc1pLSk9YVlVoaWdNSlVndVJlOU11MDZkZ2x3WS9CWVJEUW8x?=
 =?utf-8?B?Y3l5TlAra3RocnBGZE1XeWllbE5SdVBRWmg1U1dnQSs3RzRPdXAwWGVpZDdi?=
 =?utf-8?B?QytCTUpPdkxqK2xiMDFwTy9MWWZ3U0dDYXJZeEdNbElmd052TFplWWdYSXdp?=
 =?utf-8?B?VkFaOGRmMmp4cmJlZDhEa09DSTFwaTMvZVlkNTFkSzJVNllqZG9vSnRvbUQ4?=
 =?utf-8?B?QTZjdGxyaHBhM1NndjMyd2dqNjFLWGM2dlFkTzNRK3U4WWRuMDZ1ZzVrSHdy?=
 =?utf-8?B?d1ZmYlNrQk15NC90czhKRzRwNE5mMEdvWVprazBOV3RJcGF4aUM2MCtpZkU5?=
 =?utf-8?B?STMzWHM1aVlxalZBYTRGZHNXcGN6UlQ5MmlVTmVlQ2JNOWJKOG12d1RDaHUw?=
 =?utf-8?B?QmZVM1FaL3hwdmpCMm9oTmRmUjYzSklIMlVpbStBNnFJMjJJR0R6ZUZmZFIx?=
 =?utf-8?B?N2ZSZG0vQjJPNXIxVmVJWUo3cDRMeWplUENJNXNvRVYwN3JKUDQva044d3hJ?=
 =?utf-8?B?VVFlVEo1c1l1TW0zZk9KK01DM0p2NW1HVnhXRm4xUitwWlNDdWlGSkRkQUVh?=
 =?utf-8?B?UnpIallmZE9MNzB1azgyYWpsaXdNMXNDMVpudXBjU0JjL29RUzcvK1lGcXRH?=
 =?utf-8?B?c2UxSE03TUJTY3RCSS9kcmV4WFVIdlB6UjBOem8zQ21MM2ZuVWRXMGFpR2x2?=
 =?utf-8?B?Y0NGNlZNTGlXNHdCUk1nOENoL0Mvd1A4Ry93MjhqTjVHVXkxcjYvUm5ScEFr?=
 =?utf-8?B?N0hDSWNpTEZkNm5QaXR2UzVNa0NQaUs2NWt6WU1lQXlwQ3NJSnY2dVd1Zll4?=
 =?utf-8?B?NEh6SkpxN2dUWkl2N2NabkJWaVA4VnN0VVBhZjhDOVBqb1czSjBicGE5R2Fs?=
 =?utf-8?B?eERCTWIvZDk4VVJVUHAxYVNSaWU0bVVFNXpRRThJZjg3d0pZSmhsRU81OXdl?=
 =?utf-8?B?UVFNNHBNRHJleEltOUU1THRSNWZ6aUMrelNLVlBNUFg1L3VEZ3BtWGd4OTN3?=
 =?utf-8?B?cGxlVFBOKzZOTEdDaThnMkw4VTNmVDUzcEYrZyt5cWw4d0dOY0ZPeDVCTHZP?=
 =?utf-8?B?UHlzQzRyUktUcjFzaXZhSlljV1dnOGltMzRhNXlwOEthOXNxblNNbHlSeHNB?=
 =?utf-8?B?NkFKcTdVYUlPS2xZS2RIaWJwWDI2UkMyeDFDa1ViLzBiRkRYMzg2QThJV0dM?=
 =?utf-8?B?NTJMb3Z6MVJNZE1FNndTNXVQYnl5aWFBVTFaUXRKTWg0UDhBeDZRZ1N6OTd2?=
 =?utf-8?B?NmpkSUtJbHNrOEEwNE5GZTdxWkpmT0l5RUx3UWRhZU90OHg0OHoxNHlGTkRo?=
 =?utf-8?B?MEsydHlwNHN4eHdWeWszMjVWcUpreFZqZ1hMUVMwOXZJOGp4MC9NY0RhYWpX?=
 =?utf-8?B?ZWtSYnVFSzZhMlVDMmlNYVR1ZnVJSFZkb091ZlNBb3B5U0JRbDFLNWhGSTkv?=
 =?utf-8?B?YUxyWmxSOUNTc2p6VGd3SjBXeG5YNnlTbHMydkY0Z2U4akIzU2x4c0ZFYWZo?=
 =?utf-8?B?cUxXc2ltMDluTHhUZ29rMmxqaFAyR0FwcERabXRkR2VEZDY0RVV0V0VXSloz?=
 =?utf-8?B?ZVhuQVlUaGhPMFZ0WHR5MkEvcWJJaEM1NUYwem42MjJWd0Z3NzhUa3ZuS2tz?=
 =?utf-8?B?N2RtcW5WbFlOVnVybmZ3TGZRKzkzd0ZxeUVPTlpkdGJUc2ZKRXU4eWJSaFVa?=
 =?utf-8?B?azI2N3hvZUZPeERkWXo5UFE4bU5rd1FoVCt5bUQ0MDZNYTdNT1FIMXZCRUlE?=
 =?utf-8?B?Q0dGUlU0Wkt0T3pBTEg1T251UXY5V3ZJcTJKK1ZVVElWVFdYR04xVkJwaUhW?=
 =?utf-8?B?eXEvbEp4ZDdTUkd6M1JZWWw3d0RVS3NmS0JsU25Ec2VneE91aDRxeGJoNng3?=
 =?utf-8?B?cC9KVit4ZW1tdmZRSTBxOFRSTG5wNFUvNmJyMUxOdFlaTkNqQkdCZDZrWXJL?=
 =?utf-8?B?TVp3SFIrd25lMFU4eC9TU2VZUFF2cFp6QlozK2grY0x2ZktPNEdlTncwbnRm?=
 =?utf-8?B?MlhZYkNDeEoweWVrZEdpZndPRGxyMDVxUFBSb2N3c2VUOFJScytUVk9aOWty?=
 =?utf-8?B?VWFrZDAyVEJucGYvbDZTOFNnOWhQazhUZFF5UmEvT2djSGMraCtHL2lRKytF?=
 =?utf-8?B?K2QvQkpOOElqMlNIVTc5a0R2UFVXcklZK3o3UktKUGRIVFgrWWsvMHhONWZU?=
 =?utf-8?B?ZS9yeFpnUmJsbWVLTStlUG9WNi93PT0=?=
Content-ID: <8A006E2EB69DC9459A804710045569BC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0bbff2-320d-4977-f9a3-08d9e4d21cf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 15:55:32.6699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MyNR7EanWwe3GpcM1xvz+N/a00iMewlkSp2+vTFKysPpa5rcWxSP0SNxcb2W5OEtUNJSvi99d+iWUZM5ScerDGbJFz298WvBMX1Wkamd20k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_075538_537134_40020A66 
X-CRM114-Status: GOOD (  17.35  )
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

On 31/01/2022 15:39, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, Jan 31, 2022 at 5:45 AM <conor.dooley@microchip.com> wrote:
>>
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Add device tree bindings for the i2c controller on
>> the Microchip PolarFire SoC.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
> 
> There should not be a blank line here.
> 
> Also, tags should be in chronological order typically. If Daire sent
> this patch out with my tag, then the order is correct. If I gave it on
> a version you sent, then it goes between Daire's and your S-o-b which
> is the case here.
Oh, thanks. Probably been messing this up right/left/centre.

On another note, I know I'm still missing a RB still on some of the 
bindings, but what is the acceptance path for this series?
Any left over bindings not taken by subsystems via yourself and the dts 
changes via Palmer's tree?
> 
> 
> Rob
> 
>> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
