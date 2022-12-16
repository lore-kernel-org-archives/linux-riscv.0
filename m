Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0676BC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CB1U8Gud2ulRGOPAC9/cBCOV8NKwW+KiEzxJkHZ5kWQ=; b=ALWM2OmZGDR6g7
	FEPAiEr5jlOSmDAib/+g41LMbkjmoGrDu7zVgxleV5hJpYZTCxtk1yb9/MxsKivWPnkd7LVc+pwrG
	KkOrXEh4QQn6Je1CQGFdpLzYR07CQYXmBTkRlvNrWqQRcgRVPjB2/4gsdEinbPYTHBHFR6/i33yba
	fC0boIHfzDPN24zpvbaRXyb3iG5aozQM/a2yHek0X25eo9aB7+s2vWyS88BFxYuMGaXhlb9WdzGC2
	ql4eSNFo5BqQj7Wo9VSjSgLZDkGwGzYTRJsUAl5pDJs8VhcFvvg1MdWgp5NomL9mv8CzSU5R3SI6N
	VaeuCKzlrCdYqw4c/5Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p66HV-00De1A-Sn; Fri, 16 Dec 2022 08:41:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p66HS-00DdyK-Q1
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 08:41:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1671180082; x=1702716082;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pm0koxHyfMBGuYDvQx+NMSf1P5GTSYC+H/jU+bF+RL8=;
  b=dXyLBQa6VAz+Mrjji/KmzLkbl+CPkG7CaddR+3uI0GabIoLoigy77sMu
   3YMYuwISX3BHW+wGNUCsen+wuG3dFRpgx47NSLJXDjfJCCgrRxVUXSjDs
   1z7uzKyVKTFzPPWhPaiWY4RlwuBgcULVrPZN4f6e1/pDze2zxRTADOomT
   XBKaoGtOeASoNMsRFb3AZ/dK0ABxQaLpZPj3YP+N5qaA68NNhGTWJSV6Z
   Pu1k6j5jskCf5F76CBnn6Yr1KxerjtvbdROUvxoGN1RecbJtdVUQOx8lh
   b8DiB6S5F9XnCpras9ZxTVvbUV1ZQa/6WpE5pJ2Cya3j7bDhve9Guh2AK
   w==;
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="128459365"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Dec 2022 01:41:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 16 Dec 2022 01:41:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 16 Dec 2022 01:41:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZUN1hvzrztqwG18AEPOOts+APVgwtcfqk8fLqI3RlZWCEIGpXy0RXM+u3RC8miQJvEVQdzAE9kbC+YiwwGzXipnVdpCb2QiHElA/BKd9VOcTNrhv+jqhRND91UBJ0PpLIk42QzZU2EktYPsPb7WcXavu3qhSNho/Ep+PbN4MEs96FWS2R+j/vLRPeZsgc8bJ1WggcKKP02x5t3wPbrN3UjV8m3cewi0KHRSTAQXm4qkl/Ms3k6m5rahxU6S7xl4skW8cOzaIsCY31IksgP4NJZ1RIGOLQGA0DjVif0AYCVMoZgA1t7NKwxqEZdyPciab1wMPLKgQaDAjemz4QWZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pm0koxHyfMBGuYDvQx+NMSf1P5GTSYC+H/jU+bF+RL8=;
 b=Zy4DyAHSjTFKJKemltxnu7bBel2ggizvaHb16DQgUesa2863A1JiH0DEQJFk2iDw2azhJYVwQBoEg1vpkVchwSOhvV71TBx55+dJ9q95W0St+xW1TxlFDHzbLgp0HqE9P3SFQSUxmvwEOH+C1cnozsW8HRXWoFO6O7z3AvUQ8sXCXWC4wY7N5WgsHh5cGVTF446y9ln0938C+hDKFSHuNlT5J+M3kSkrq6H4hHijGlb6VKv9f2zL9745WwX9nA4b9rij8fHAsXJf0yHyh9a5pAZQndwSBVgSrCSI/YVtNJk/lSVNeAu7wmqK/Yp2baa81GgoHrOZKpR44Okt9pbulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm0koxHyfMBGuYDvQx+NMSf1P5GTSYC+H/jU+bF+RL8=;
 b=S/DyIuZLU3kKmkrI5HJpCoRxn711CuXK9droQKTN03i5Ci89lT+vq3W0qZ294XMJQujk78z4+OXGsOU6z7ELC22FjTQYOUCGCil8QLoeZIarjr5kblHWquqJ2RRfSRp+LIs81EkWJw93D5xBJSDsqAs7SEh9OK6Ibp91IwXvee4=
Received: from DM5PR11MB0076.namprd11.prod.outlook.com (2603:10b6:4:6b::28) by
 IA0PR11MB7404.namprd11.prod.outlook.com (2603:10b6:208:430::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.19; Fri, 16 Dec 2022 08:41:10 +0000
Received: from DM5PR11MB0076.namprd11.prod.outlook.com
 ([fe80::9b7a:7604:7a30:1953]) by DM5PR11MB0076.namprd11.prod.outlook.com
 ([fe80::9b7a:7604:7a30:1953%7]) with mapi id 15.20.5880.019; Fri, 16 Dec 2022
 08:41:10 +0000
From: <Arun.Ramadoss@microchip.com>
To: <netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<yanhong.wang@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: <andrew@lunn.ch>, <robh+dt@kernel.org>, <pgwipeout@gmail.com>,
	<kernel@esmil.dk>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<edumazet@google.com>, <richardcochran@gmail.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <davem@davemloft.net>,
	<hkallweit1@gmail.com>
Subject: Re: [PATCH v2 6/9] net: phy: motorcomm: Add YT8531 phy support
Thread-Topic: [PATCH v2 6/9] net: phy: motorcomm: Add YT8531 phy support
Thread-Index: AQHZESj9G3G4fYxfE0unq8YQO7Ikka5wMfYA
Date: Fri, 16 Dec 2022 08:41:09 +0000
Message-ID: <ea9ed7f72adb0bd83581e9f55f99fb8630e7bc48.camel@microchip.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
	 <20221216070632.11444-7-yanhong.wang@starfivetech.com>
In-Reply-To: <20221216070632.11444-7-yanhong.wang@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR11MB0076:EE_|IA0PR11MB7404:EE_
x-ms-office365-filtering-correlation-id: fdf2249c-b4bf-4168-cf5e-08dadf4147ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tddTr0zvTsGV2fB61ZyEzx5lQTIFgIWOq3sST5IHC+RGRalU8CIJkIgw2lPf2J/IWv4FAObZOoMyF3FDqykMwa7PsC5PI3Vxhh8X8TE1bKVCkw8WE4FUJFLjCOCUcW6kVvpXG3Rc1Vnz7lVsDDrilD+dECXx+zeavzcelwuJdDkaQNujMNnE67cHQ5dcYEasLcWncvCwgQnlN7TXRvmGt+DiLt4WcmT/JHsNSSYuoX17WhdsOarXTQuqwopmRGgOJaBOLONhHe1azpTb+scO/HVtM18RfVd55dbwITrRpxzMmZYLgcvynV6e9E5wsEsJvnOwzeGIKEZrhV8Akq7YFbvjMpG8+L9Gp2uhFz5rqSDiKiWBbkQg3+aDFnN+hNEG1AU53GbkBm9yFI5mxO/iSj5b3PXniXCBuAIK1VSWe9rtnlw6SG7CmuqiJS0NjeUWPh6ItKZWcTKz/6mWNq/8LbPgt/gY8P1Y/hlzAwAHRfxi/8OT9FkyKnZzbJ4gqOI1pCwCFDBfJsRQOJfHthPP45JlXsyVen4OYNeDvZDjoxISXrgaeTT+I1P5FLuLZuAmbaKOc3p+AuU7NpY9wBtj6oYyNlq1j6mJTuCDhbZKodTxslGsXq38bwhbxqqjkFTym6rtcFiTNDDNfLalrrohHf9j4dvUe0bnYsiIt1lSQMPhIwLpZR1VwcgS3xSxAwVXaV2V9kH5d3oKLuneTVmUN/rw5P582vBf7cVQZvvMtok=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199015)(54906003)(2616005)(2906002)(38100700002)(4001150100001)(122000001)(110136005)(71200400001)(38070700005)(316002)(5660300002)(8936002)(6512007)(36756003)(41300700001)(26005)(6486002)(7416002)(186003)(83380400001)(478600001)(6506007)(66946007)(66556008)(66446008)(4326008)(64756008)(8676002)(91956017)(86362001)(66476007)(76116006)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFVtS2lzYUw5U3RNOERFbk14cDJVcW90MlV4REpmQTdUMW5qSlRqdUhtc3JO?=
 =?utf-8?B?ZzFIYnlyaUVHVEdvS0huMGlJckxTZzZKQlVzMUFEWjE0dnZRRlpYSktlN1ly?=
 =?utf-8?B?VEpwOU5STU1ZY0xZRW55THlocFd1RzZVYzFwTUdlNG5MRmwyMG9jd2N5bXli?=
 =?utf-8?B?eWNXdnlCMkFsWUh5d3hqUFpZcFczU3h0aHByNVg1aWk2Y3FUQTVhNjFqODMr?=
 =?utf-8?B?Q202RGRDUjU4MW5OMi85ak1DaTV6Q3dpTjlvM2pacWFrbDEySkt2aURvUlFR?=
 =?utf-8?B?dWJhakV6bElzVFBTRy9DMHg3WGFKM1NlZkorTFJIUW1CTEs5bmpnMlFMMURm?=
 =?utf-8?B?ZHpUbW80SHFVWHBENnJjei9WbUpoZXNOTVE1M2ltZGI5Q1hTZm9Bai9wWWpZ?=
 =?utf-8?B?RjdWMWEwNzh2QTFZZjUxaU8wTmprV09YeG9sQ2FXcWlnUkd2Si9rMGNzU0sx?=
 =?utf-8?B?OWNmTmlXWHluVHJKVGUvVXFnVVI0YTVtb1gwbEo2UHhPN25qV3lZSGhURkVB?=
 =?utf-8?B?NlhFN0FVVVIreUdlWVMrOTQwT2FHNTAwNFZrOEdjdWRhcDJrU0I0Qm9LeEE0?=
 =?utf-8?B?WjZPNktENDZoSmZXaFBVQU11dVVpdlRTZnpNU3FVQWNVUVUzRkF0MFlDeUNG?=
 =?utf-8?B?UGJtRit3WFBsclRsUWJ5cjllRDVwTmt1enhtVHVndHU4Vmo4amRMOWJXTTNr?=
 =?utf-8?B?bVFjODlxVXJ3ZENQdUx1eDY4Vmh2Ry9sYkIyYWNlaEgzdTJPVjh5NHdDUXNn?=
 =?utf-8?B?NTRlVm0xSVpxZXNOUkdhbERMOUk1S3h3SXlySHpCdFFPem5VeVlEOHBoZE5B?=
 =?utf-8?B?Rk4zcFNWUk93dlhnczZTc1RNYlpsUUZRQWh1RGcybGg3enNYS25SVEU5M3ZL?=
 =?utf-8?B?b3A2b1NNQjVnSEcvUTdPb3dLL240MVkxMllHakkwZmY4NVJ5RXRUelNyV1R2?=
 =?utf-8?B?ZUltcmtVdmhBWGNHWHZETlNMTGxmYk15VENvcW1IL1IzSTJxMUtsWVdrUjhY?=
 =?utf-8?B?bVJIRTcrZ1hzbTlEOE9GK0xpR2pNcXkzZDI5emJEbkNwUWFQNDIxWWJqRG90?=
 =?utf-8?B?RzBSbGNqVzEwM3JaV01rN29ycTBYTnFxVG9ucTJZTlhrU3dGTUdHR0lMMzVx?=
 =?utf-8?B?UHdIbnJ2STJRVU1Pd2JFMXBDUktNUXNwSE9NcXpTSVkwTnYzUjFzakVZYWhC?=
 =?utf-8?B?VkwzaVd6WjZwKys1ZUlIQmhPdjZ5ditYRVhGSHg2T2hGZVppMk81dWdVTlIv?=
 =?utf-8?B?VThBZDZpb1VtMEZrZ0IwRk9aY3FqMzlSM2hhQjRCWXBjcXhhUCtZa1ViL3FO?=
 =?utf-8?B?WXRSZ2ZlbkN1VHlyL2pmNzhJUFpTakNQVnFMeFhnOVV6RjdKbzB3UW5PMXdK?=
 =?utf-8?B?Q0tsQlZmM2xKYzZya3pGejBjTXRVMWxQdEpJa2l1TXBtOCtvMGRQdlUrakl3?=
 =?utf-8?B?OHhxVFQ1emRQRTRnUmxhMnhQeCtGK040Z1JjaTY3cFlUTG5tampjTXVVaXBM?=
 =?utf-8?B?bi8yTU96TzZXd3hFZlJOTEVTdXc0QzBUd0ZLQXJNekVMSzZSVFFoNzRwK2pm?=
 =?utf-8?B?a3hLdHpVRDJLRHY2UUEyUDk1WHd6dkZMSkp0bjZhc2o5RlFMaVFoMVUrRTVt?=
 =?utf-8?B?Zlp4Nmt2VElXT1dpYzYzYWwzaDY4cy9ycllPQTkxdmdCaGw0NUYxM0NjcHQ5?=
 =?utf-8?B?SXkxcVFXOUVsSUp1SngrdFpRY3lkUHdqRkYrT1cxMVZCcEFEeVdOcWh0Y1dP?=
 =?utf-8?B?U3RhRVJOODA4M3dCajhLY3JWNTU3RFQxOHY1VE8ydGQ4NHV1ZTRhVWdNbzMz?=
 =?utf-8?B?NzdTN0xMT1Z6RFFWMjJ2bjhrZTlVbjUvK2Z6U1ZENXN6Z1lQVHd0UmduUytM?=
 =?utf-8?B?VlJDdmR2UUFNejFLbmQwcGVNS2pYYUtDencrN2VZVjdiMExqTHZpdkU3NFBI?=
 =?utf-8?B?eTJDOWE1QWVyWTJYMkF1QnhlOGxMODdkMjd2MlZDR2l6OERKZVpaamdzRG05?=
 =?utf-8?B?dGRFNUpVRHlYcnZaZ2xvMFBoRWJWZWtpa2FyOGtIazcyRC9WVDFzU043MHEz?=
 =?utf-8?B?WnJmMVN2eG0zaXduNmNoRCswYWxXajJTRldPM0lUcFdoUzJYZ0g3UGxVV2ly?=
 =?utf-8?B?NGFlcVZySi9JZUJneTlBeHdaTnphMktyai9RVWovSkVudm9NMUlsak0yZmJ2?=
 =?utf-8?Q?5LX6Ef5PYB3nTyMk9+awOW0=3D?=
Content-ID: <570DC99E0F9A564A9FAD7D2A002D2F2E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf2249c-b4bf-4168-cf5e-08dadf4147ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 08:41:09.9693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0QK5/9odhpiUU5cXe2BRlhuuVTpd63/a9ObFN9OGseRIXm/S1iEIri5w5yeOwgIbmC0fJoG1nTWH0TFx90TcJ6OLk0lL61PXfH4wAPXAf3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7404
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_004122_978643_1E86B3B4 
X-CRM114-Status: GOOD (  21.49  )
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

On Fri, 2022-12-16 at 15:06 +0800, Yanhong Wang wrote:
> This adds basic support for the Motorcomm YT8531
> Gigabit Ethernet PHY.
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  drivers/net/phy/Kconfig     |   3 +-
>  drivers/net/phy/motorcomm.c | 202
> ++++++++++++++++++++++++++++++++++++
>  2 files changed, 204 insertions(+), 1 deletion(-)
> 
> 
> +static int ytphy_read_ext(struct phy_device *phydev, u32 regnum)
> +{
> +	int ret;
> +	int val;
> +
> +	ret = __phy_write(phydev, YT8511_PAGE_SELECT, regnum);
> +	if (ret < 0)
> +		return ret;

You are returning the error value as well as the read value in the
function. But in the config_init, you are not checking the error value,
just using the value directly. So instead of returning both the value
and error, you may consider return error and for value use call by
reference.

> +
> +	val = __phy_read(phydev, YT8511_PAGE);
> +
> +	return val;
> +}
> +
> +
>  static int yt8511_config_init(struct phy_device *phydev)
>  {
>  	int oldpage, ret = 0;
> @@ -111,6 +191,116 @@ static int yt8511_config_init(struct phy_device
> *phydev)
>  	return phy_restore_page(phydev, oldpage, ret);
>  }
>  
> +static int ytphy_config_init(struct phy_device *phydev)
> +{
> +	struct device_node *of_node;
> +	u32 val;
> +	u32 mask;
> +	u32 cfg;
> +	int ret;
> +	int i = 0;

i initialized here as well as in for loop.

> +
> +	of_node = phydev->mdio.dev.of_node;
> +	if (of_node) {

to reduce the ident level, you may consider returning here by checking
if(!of_node)
	return -EINVAL;

> +		ret = of_property_read_u32(of_node,
> ytphy_rxden_grp[0].name, &cfg);
> +		if (!ret) {
> +			mask = ytphy_rxden_grp[0].mask;
> +			val = ytphy_read_ext(phydev,
> YTPHY_EXT_CHIP_CONFIG);
> +
> +			/* check the cfg overflow or not */
> +			cfg = cfg > mask >> (ffs(mask) - 1) ? mask :
> cfg;
> +
> +			val &= ~mask;
> +			val |= FIELD_PREP(mask, cfg);
> +			ytphy_write_ext(phydev, YTPHY_EXT_CHIP_CONFIG,
> val);
> +		}
> +
> +		val = ytphy_read_ext(phydev, YTPHY_EXT_RGMII_CONFIG1);
> +		for (i = 0; i < ARRAY_SIZE(ytphy_rxtxd_grp); i++) {
> +			ret = of_property_read_u32(of_node,
> ytphy_rxtxd_grp[i].name, &cfg);
> +			if (!ret) {
> +				mask = ytphy_rxtxd_grp[i].mask;
> +
> +				/* check the cfg overflow or not */
> +				cfg = cfg > mask >> (ffs(mask) - 1) ?
> mask : cfg;
> +
> +				val &= ~mask;
> +				val |= cfg << (ffs(mask) - 1);
> +			}
> +		}
> +		return ytphy_write_ext(phydev, YTPHY_EXT_RGMII_CONFIG1,
> val);
> +	}
> +
> +	phydev_err(phydev, "Get of node fail\n");
> +
> +	return -EINVAL;
> +}
> +
> +static void ytphy_link_change_notify(struct phy_device *phydev)
> +{
> +	u32 val;
> +	struct ytphy_priv_t *ytphy_priv = phydev->priv;

reverse christmas tree

> +
> +	if (phydev->speed < 0)
> +		return;
> +
> +	
> +static int yt8531_probe(struct phy_device *phydev)
> +{
> +	struct ytphy_priv_t *priv;
> +	const struct device_node *of_node;

Reverse christmas tree.

> +	u32 val;
> +	int ret;
> +
> +	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv),
> GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	of_node = phydev->mdio.dev.of_node;
> +	if (of_node) {
> +		ret = of_property_read_u32(of_node,
> ytphy_txinver_grp[0].name, &val);
> +		if (!ret)
> +			priv->tx_inverted_1000 = val;
> +
> +		ret = of_property_read_u32(of_node,
> ytphy_txinver_grp[1].name, &val);
> +		if (!ret)
> +			priv->tx_inverted_100 = val;
> +
> +		ret = of_property_read_u32(of_node,
> ytphy_txinver_grp[2].name, &val);
> +		if (!ret)
> +			priv->tx_inverted_10 = val;
> +	}
> +	phydev->priv = priv;
> +
> +	return 0;
> +}
> +
>  
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
