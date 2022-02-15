Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7D8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 01:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DD0CK7eUVbHRQLymak+n5RVmrsLx8KxmWBuITgRH5/M=; b=mLPE6gwjoh15Ju
	f132NCLHOlH1Et9zVTqtZTf9R/pwtwySbEKB41EcLK+FE8RkNcczk8ECFdm3q1oEp6imFTLcaY7aA
	0HB2X/bv/w9NStJSlk9ghDVPBZwTtgZdrSFuHgzlkg/bzo0A+gPDwj7gm6q+F0NLLX77kRJyQVntG
	2T2r/uttyYaFvHQiHj9q39IiHxjB5skAINTejmEOGNLS6My4/AJJLs/u1wKcBRgKAFZw+t+AgwanP
	aFzk7ZYHU2uTNSh7VwOwkOh1ey/TngGeK/t7zpRUXHtpTMSSayxPreZz8eGyrYyNi77PF7u97CcWh
	iLT6GveJH1KXXIiSz8Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJmz5-00HTf2-D1; Tue, 15 Feb 2022 01:50:27 +0000
Received: from mail-tycjpn01on2070d.outbound.protection.outlook.com
 ([2a01:111:f403:7010::70d]
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJmys-00HTag-0q; Tue, 15 Feb 2022 01:50:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfsXyQhtdYVyhix+gzWWp41cyfozl76Zdqt5C2oZAqmtZm9XnTCwaTocfAk/bEM/mLj7aLleAa8HNLBwpkcX5VrvXwnnNIj6dQiq8XeIEY2tyd+9qOeOV6whcqzl6sBqp5QWca1KJra9A5uH8hpaCNRSpOj1OcDnjgM0fsw2ZOpTlkyzeeULxQvvzBiQena0UyBR5QxcoIck2xS4WxRya8AOetDX4B9AczRrujUnE6NbAEzlI/WWV5HON/qh52WnMruaUuqXt1vNINcDMW6h2pOY17VrlADuD+h2eo5Y8mz01G0jkBYIh1sLh0V3DyuqoZOmGqk0aO+sjYSRX+zgeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuJX7MvfaRPaijabiV4hJ3C1wX9UQ55stJs/PwZoKJw=;
 b=O/1JaIO9WE8QSeh+g7i7QzCi5pNIs/A/QtV9h4Md0aR13d1H41lbbhWcy9QDKzhTExHqBp0xhpl9j1rThE/mNY9phKXuXpcQKz6UNVNnU2r5+fOBNL62F1rfLO1DOlfKsgpp/1/XCguCHpkdAGAIEbmIt4bN+UalAIEIjrmbCpzSA6749hvBWxX0fTiXC6ztPpdj44Fp/7zZnMGvE8uKF7qGPX6FzIFS+ELkOS6t1diY9ttG6zuXPs6t8WMCULlTEgPaJE5tV9yREibq34CirRrgACB3TjmZ+D7AHhm4+wAmbNvE8h4rIt2gRuNi2AC4CM7bZAhDqjEcTtxB6a565g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuJX7MvfaRPaijabiV4hJ3C1wX9UQ55stJs/PwZoKJw=;
 b=MLHw1Y9XQGoCb0CA5P4m/AqUcx+IDU062i6+Ailv2bpwBE9B0487vJrx6M6/jUuOogYYGFB20qJyBRWxGVK2Jin7B1jxBmG+f1Wi7c27N4x0P+RgFoX23+Et5g9cZ6Ni2S9yq7hLi3aw0Z0KjaPdW8w3OHGWmawE7B8uJEFuEfM=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS0PR01MB6082.jpnprd01.prod.outlook.com
 (2603:1096:604:cb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 01:50:04 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::346f:1a56:ff4d:8c0a]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::346f:1a56:ff4d:8c0a%6]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:50:04 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Thierry Reding
 <thierry.reding@gmail.com>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>, Rob
 Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nobuhiro
 Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Philipp Zabel
 <p.zabel@pengutronix.de>, Anson Huang <anson.huang@nxp.com>, Vijayakannan
 Ayyathurai <vijayakannan.ayyathurai@intel.com>, Rahul Tanwar
 <rtanwar@maxlinear.com>, Jeff LaBundy <jeff@labundy.com>, Yash Shah
 <yash.shah@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, Vignesh R
 <vigneshr@ti.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, "linux-pwm@vger.kernel.org"
 <linux-pwm@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
 <linux-rockchip@lists.infradead.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 08/15] dt-bindings: pwm: renesas,pwm: Include generic
 pwm schema
Thread-Topic: [PATCH v2 08/15] dt-bindings: pwm: renesas, pwm: Include generic
 pwm schema
Thread-Index: AQHYIejx4cCufnUoqkGcsytdc5q5l6yT2JGg
Date: Tue, 15 Feb 2022 01:50:04 +0000
Message-ID: <TYBPR01MB53419E93835DFBC730F84AFAD8349@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
 <20220214212154.8853-9-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214212154.8853-9-krzysztof.kozlowski@canonical.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ded43489-008b-4469-b487-08d9f0257c63
x-ms-traffictypediagnostic: OS0PR01MB6082:EE_
x-microsoft-antispam-prvs: <OS0PR01MB6082D7C035F5EADC8E25FC91D8349@OS0PR01MB6082.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9wLW5++76DV3GNeN8oSnJapg3NrljW1/i04j8UNj9L3SREvaWWWF7g/zxuXoGEojRltaYZmTLA3AMPyXA/uLHslu/w7ZdvoTDJ16sLhYcMy/6FrOCoREUZDf3+ChfJCF2CqCtpJkEYROU8sbe0ZUIyvRTvU3h4XXLQ7VbVYNfyOReDVE68qEVWH7bpVDT1gi+ZEqWrwZ304jB5DsAN5d6MpoapUv0zWZY/phbw3iyewr7CUyWOJPL5ZWmfKNdTUtW4H5Uz97R5MDRhn8eKFxrZEdDTuV6jxbaNwng8TOQ6k8r3HoH1rfVsbYRpS4hJ0jbbB/qjc2YUkWLvplEvPE33EaJwoDEJyS0mR4fWfvIiK+hWPD3ZIjFaAnhzsXRWVoens8hE9xYnM69P4HD4EnRm4O+Md31IfjtvYQ4M5zxVw5QhMsIQ6miD86/pTdVe7psHtdNAjBBwX2xBaYc3gbvz/DkaNDwtNh5ywBnk6MFiQzTQFlIbuM0uFA+KYd8ZnkxMIvbYJAlVGbmTF3sqGQlPK4cdnIvp9Hndjc7HKecW/n0ZPfCVSQXrN95H71xF2hypE3uWKJC4E05mtA1gD/TeUH6bnzxYfywbtlBVykTW8Xmr5oNtcRZeA8Emb/uzzVyhxX8dnbz1/dtikfnBV0IcEsT0yCqEWZPvi3VnvULFj1F7HtbnuLZlfL/6FrFO5GHIvylcC/GbCxyfalq6W6d4lFbTL5wRwFVZeRfFRmO7BDYC6o4Sey1JhS/b7mcW26
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYBPR01MB5341.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7406005)(7416002)(5660300002)(186003)(6506007)(2906002)(4744005)(921005)(86362001)(8936002)(33656002)(38070700005)(52536014)(316002)(122000001)(76116006)(8676002)(66446008)(55016003)(66476007)(66556008)(64756008)(66946007)(110136005)(508600001)(53546011)(71200400001)(9686003)(7696005)(38100700002)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5okCqj/82PKnk9tBkuUySvgSJFXSt9ZQdpCkntRCkWr5fTOQbUNjKwGLr9?=
 =?iso-8859-1?Q?t+23lYTTW9IjeDWpcrBabbZLo2ePq4IlvbrxGqTV8aEtG/ZMuWhg+RcMD7?=
 =?iso-8859-1?Q?786dbuAFd9qG+UrmVzXWKHaluNm7Wrmrd06sQ1qaeh8nZbsPSeHqTtQsZs?=
 =?iso-8859-1?Q?t3n+iMgzkkMZ0nhMumVe5Cy2qV6RLfZD28vQF5ISK/dURUwJICZEUNjfOX?=
 =?iso-8859-1?Q?AYbk2IKoBZPiYwq6bK9RI4YPWpExZ+LeAZUsa/nWoZrDyAhMnY1QIjMl+n?=
 =?iso-8859-1?Q?+o5Nl81NbR1Wg/a0lBTuzWZuYa7vrI0eIHp+3B95sHyrKera64KmPNe/Gh?=
 =?iso-8859-1?Q?BQzj+aD7kniXCaBTU9I1N7e4IHN4oLvuH6T+voc28XpOm/itiU6bsZ3z6H?=
 =?iso-8859-1?Q?4o2IVeYe5Hhozz3NHzgB3IF7g3AIFWLBmysdCcpL0WtcaiFFIS2lHKoJck?=
 =?iso-8859-1?Q?xjn0fwKQnHJ4o3WBw7AFUKZKG2RnncgPOmBsIK79WJ3girjr7TEMzSYJZW?=
 =?iso-8859-1?Q?+2V/NA899M3p10F9O8uv2AEvaQsOcRZX4lBhTaiUNUVFkE+iiRkUiQ9v73?=
 =?iso-8859-1?Q?b0rlpbEm2wnMSfRlfurfdte5n+juZG4tRoJcNz8uThsuNFeuLzAFk90LQu?=
 =?iso-8859-1?Q?2srsgqlwQWA1puHQ4XlhW8nes1iiKN5WfiS9rMjylJ6UjxWZz6wpeKm69O?=
 =?iso-8859-1?Q?N6AwJ3BBm9KabpcdMI4UwPOO27ZOFiGoEjqTRlS49qUuZrMY4yWYGnWbfm?=
 =?iso-8859-1?Q?SG7DWeYv3Eqjz/ZZRYJ178cHVvaSme2uUDIHnmpEApqJSuAYqcQb6Nodxh?=
 =?iso-8859-1?Q?IUmbXU9zxw66+4xyYOFK5lncMxTqedcjE6s2f7Ovnj1CK/13fRc2C4I7m+?=
 =?iso-8859-1?Q?XwkdrvF6pv026rcy5kE06Vy2/zD/EkuhRcZZqIx9Vcq2v5R3TF5m3CYL4O?=
 =?iso-8859-1?Q?3vCvBMhlVwPDi1rRt3KiyR36cfLR7/1wSO137V3MH+QqR+fbpVWYkYGdH0?=
 =?iso-8859-1?Q?bkrGdRZTTS03GL6ImFjR3wr0wmCoHKM75Yv93cRmjWK6qTrAbD1yJAnByP?=
 =?iso-8859-1?Q?T2k3HBtT++OntvNcORz1FbqLEuMa7J4OrgEdiXhGyrGRwASYXy8vnw5Gh9?=
 =?iso-8859-1?Q?Hgjoke9vm5urt/rAIu179JivrIledI5lvj28ODyv+ETmhmqjFJu1CHo/Go?=
 =?iso-8859-1?Q?wPm0WdEgfuqy3Ct41BwRM65VCalEDHuD4ZVMv3nk6eXHzjRfmzQf1mbttE?=
 =?iso-8859-1?Q?iTHfkOaP3ptG7hgxcETeJ49sbNBIfxx1HuAJb5ZIWwQvcD77Nrx+neNc/+?=
 =?iso-8859-1?Q?0vTQfLM1NaYIf6AVd9Ew5Us+NO6n3qW/R8uSoAJ+uahcbEOYziZRWwSKKc?=
 =?iso-8859-1?Q?uNsdhX57qcyP7I0XFNoohFdsl8wgT7vo2PnZ59h7M3s1Ud4GrFSynOcuE/?=
 =?iso-8859-1?Q?/GGxJsL4IaZ31jfbPdiBd0Y8+pHfctpp6/yNB4GnFs97Y3dC0hWi27SGTk?=
 =?iso-8859-1?Q?+f4LYAx9aqacG5ti3z7uz0hK/WX7H7/dvKz2PbDBi6Z+K1tj3UiizhL1+6?=
 =?iso-8859-1?Q?6RHa5v1SUCDaX2+R1NeVB7XvcjmrwemQB9ovpC4p84v0zLKrydZZ5IH+VK?=
 =?iso-8859-1?Q?LpiE4bkq2kP91OV/v/oHFr8hn6LbW+l03Q6ylNo/ygE1qq24U7OBrZAaPM?=
 =?iso-8859-1?Q?Ls9udHzaYpJePKNxD1+u+d1eTicOV7k+18QmctfR3Cg4GiKS2fa54/eNPT?=
 =?iso-8859-1?Q?BVB5qUFTacTkmEgJnpkXXvuGaaaPghDEavY+7d4JjMgRxXLkcboOgNw8Sn?=
 =?iso-8859-1?Q?iWQfv5ZXWNQNCAOjfTO7vIpgQLFSf87b9Qc5c+NfcPFQX9Nlrv2u?=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded43489-008b-4469-b487-08d9f0257c63
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 01:50:04.0220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BaQx2rFqLsNbLYIj+Rod35NmItzxwAzLrgLM8bhtkfSquYA2SzJ+bEUXSK7UDTt22316foakzbF1u51vR9Afaq4dLQvtZ1XhiN2h97jGeMdP2QNYFuC5Ks0aBA+7oQVx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_175014_099675_CE0E7C1D 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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

Hi Krzysztof,

> From: Krzysztof Kozlowski, Sent: Tuesday, February 15, 2022 6:22 AM
> Subject: [PATCH v2 08/15] dt-bindings: pwm: renesas,pwm: Include generic pwm schema
> 
> Include generic pwm.yaml schema, which enforces PWM node naming and
> brings pwm-cells requirement.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
