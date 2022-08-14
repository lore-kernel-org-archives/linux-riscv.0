Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17197C25B06
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E75sgV4G/mb3b482o/0mSAnvNeDcPT6U9r9t4llVsTs=; b=Tb1WOmzOSf5VAC
	FOc/D0LfIuEijiMpUdEQCdogl4VGS7j1k6XclZY9IeAiZ78DkQfb18So29DftffHqbgRPyWMz6ZbO
	t520NMIYmMsdA6ve7wieSJqwZjCoCXC4YW5qao8fsRvKOOWP77jdJ51S5omHFLySs6uFSYjpMx4ii
	noc38Wflq7l3tQ/LbSZrQ5OTitHwR3FTVrfrT6mFbXI3B969D2m86uB7hEpoNE8iMSgHj4OXWP3ES
	9d36Mr/y1Kcr8ObPV7ZAUpc99o7KR+td7AfeHUBZwO6JUFh4NRjWZtXf6ZwipQRlYOnuuT/pZptsP
	JFPfsT9aPZh3vgt4mTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNDyR-006txr-PM; Sun, 14 Aug 2022 13:48:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNDyL-006ttD-SZ
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 13:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660484890; x=1692020890;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JkJ7h/v9rs7+peGmqYrCSmY80B1vr3Z2rakPAeyiEUc=;
  b=1gsU+QEICqv522KVIa7FjULNd9XYfB1yhJENGwST/LQA1lzHU5tbhT9L
   dnnQCR7zgRmbxBYz3qLCFz8rHe4Py+OMAvmSdYUtPoTNiI9I8fkGZGPbb
   nwgB2f5ilg7apySiS35uWzO+6O5jRPdkdyzP9uqD3JcTENU51rnGVVun5
   6/EDntIXvgTQun8PH539ojAzzZnSeLu+Ww9MUcP2tYS1Lp9XODeK7vxA6
   pqWptSdM7FPMURMfbVgnpP0C+M9s/7DUqhtUys09zoNnGqFa+1UqxCRdH
   2SWAsbQMc6PZjLjHeh2a3B9nt+YT+NgW37/jnUsXJ9vRkqMpkDVT+A32+
   A==;
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="176173911"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Aug 2022 06:47:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 14 Aug 2022 06:47:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Sun, 14 Aug 2022 06:47:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZbUR+tPKXXzHdYPr4r4pVzyYIO8WwRV2GZV5SuxBwDHTEESK/m0MeRhi1TrDqOKhYsc3Xbuuo71at+Q5m7E1Ul+Xw87B8KIs179jMuJB2wkpbs90wCt+npYkcUC3rX8xPstr/qZXti8iHeZRgm2/qJSga+Ila6JDH5JmKqee2JWm3C2lx+JUh1dpLK6dJHR/SioYT55tJl2tgB8NkaKSyaw2TCNgD0wAp3qFommmVqxyGKrX/sbELs8krhLzoH+m/8pAr9iX1+nrnnzFXZWE7jQH/GzEbNmrP+fdDy6VVmN4q1ia/nx7TpuNdrv02AjGmCsw2c8WdfLkgEG/ihWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkJ7h/v9rs7+peGmqYrCSmY80B1vr3Z2rakPAeyiEUc=;
 b=IhgOlzprB/1bn0wrfUyDIPBo0ABBzdnHJXWndrGNQOJ858xCc5jOl/xNOpT5veT2cZxRY8AI/vAuW869mm7YF4MPzWQptpYUzLUuxeeIj+rOT1Ko59p7wottp3vnNwB7+sHXcZ4IaX/678Om1qBbyPs+yXrf0p4/poPs5BwmXZIMf1X2qAGKhdZlizjL9o8BW+MfbKbJqhzZ9OWvlXGpxCeJ4AfbXsqwcXakN9SHeOvuCicKfxBHLdnZ50EgM7rNe8+v7igF0WFrNGrY6yrhVSvL5fAy4VcbK0eAiKd0nA/czwM3pB3fs9zU0PQ6LpfHUQ8pcBZImyqjgbWklC81aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkJ7h/v9rs7+peGmqYrCSmY80B1vr3Z2rakPAeyiEUc=;
 b=GX1rzUoAorraFzefz/6AX0UmbEU8AIOulZ2TFIU2bpTk/+V01NEglnxxZ3AdJt83yhcmwsj0P4FugeeDAC/RiiUPXct3zTg0x8zgnI02q3XAgn+Z0uFwHPQr1Id4V3fXHz24c0+aa5YrZ3mhfxr+Mq8SnP7Osr9MJd14vdOdkN0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH8PR11MB6610.namprd11.prod.outlook.com (2603:10b6:510:1cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Sun, 14 Aug
 2022 13:47:56 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Sun, 14 Aug 2022
 13:47:55 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <mail@conchuod.ie>,
	<Daire.McNamara@microchip.com>, <bhelgaas@google.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<greentime.hu@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<lpieralisi@kernel.org>
CC: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/4] dt-bindings: PCI: microchip,pcie-host: fix missing
 clocks properties
Thread-Topic: [PATCH 2/4] dt-bindings: PCI: microchip,pcie-host: fix missing
 clocks properties
Thread-Index: AQHYrcGqVjwwy0+GMkSA5AgZisgzK62q4LmAgAOMrIA=
Date: Sun, 14 Aug 2022 13:47:55 +0000
Message-ID: <d25f8901-b9d7-ae8e-0061-2a033af16693@microchip.com>
References: <20220811203306.179744-1-mail@conchuod.ie>
 <20220811203306.179744-3-mail@conchuod.ie>
 <99b5bddb-4a09-a3ac-e01b-d0ae624ad2f8@linaro.org>
In-Reply-To: <99b5bddb-4a09-a3ac-e01b-d0ae624ad2f8@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c318897-de56-489a-6789-08da7dfb9787
x-ms-traffictypediagnostic: PH8PR11MB6610:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1It0ltidBiM6e6BjOgwqiyX3Q5nwo6YvKpjboHFVvhinrbcHs0VulQdTivT9ZayBck/SD9RvFrJ+4IcbY0k4+iwVIe2S7Bn7gaqbfqQ6sUotqXdYIST/Zq1rKmK/Mnlh/ZoT2B0Bb4KFif7pPMQmLO85zfMxWCSWQoO0Ww9ipN0e6FWCf5DxtQGB8Y+LEbQUpyC6cJvRBGgMhSi2Ydvry5urXiQfwuuySNX7qVTmqAo6zKpu1hBkjnII4DT+Xk7boMqxC4z7ScpQkiVP+SEByAiH6csuJ/oEBQBMYZiJ0T5hJ6S5wuFUglalPyLjAS001XYPIGlQxloQupR2O1RQoA2RARyoKDEoRb3MVScENOGG0fZ3thXZ2E/pjkDBjMbaxcrs4CuITApZrUN1r/v+9T0ci+O6+DT0DgpKwdkoTGbe9qS2W4R01582W1OFWC2DQrj6Hls/P3Yhr8Xbzrt9PioQamogox3R0+Qyrm9Jy1cTlvNb8bKfSplqJPuac8z3xG5lwm7nggnrON1KIK3S/pCK+y3eCVJInKByY9Ba9ILNRn803OuOtB/+egTF/czUEW2eEAym4JXCY+xzysDURWNNOxA/POczHDoM91Hk37ru30EQbEDFrlKWflR6scfEAM28Wyzm5hZ46PEhTM7Ch6jQbwhC9XHDpt4yECW6eml3NNtCP/NoZo5a1AFfmHlRH4/qIrdfL9ZA/JoQdXEoDlQKtei3kNp18T1O6J+teQUgXSfCxVH0HC5H4QlJLz6ePIEqC+Rf9LQst4Sbg3bCF64vnF/CvZPaU/KAPxFdIpZozqPxJcVGP3Gj3G6xXmRNrXibNaRnM11tLQZIexLXUF7fYozhJpOF0Vs7Bi3pbaP2uKm1nWvhlTpvMiVnExZTgJbzmMyk7PVu4CZqoUXUtw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(376002)(136003)(366004)(396003)(346002)(316002)(38100700002)(8676002)(91956017)(64756008)(4326008)(66446008)(478600001)(66556008)(83380400001)(31686004)(54906003)(110136005)(76116006)(66946007)(6486002)(36756003)(26005)(31696002)(41300700001)(2906002)(7416002)(921005)(8936002)(5660300002)(6512007)(6506007)(122000001)(38070700005)(71200400001)(66476007)(186003)(86362001)(53546011)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmtZRTRNamZtUUxTaExJcElZTm1Va3BTcGlPdVJtQ2J5dzJCeVF1WGRIcDJz?=
 =?utf-8?B?dkN0UG1qQ3E2TFQ0SW9hWGFqZjl5NTduTzdSb0xFdm9hZk9iZGsvTjcxeC8v?=
 =?utf-8?B?QTVVbVRENUJTRTZtL25Hb3BWcHZqbG95bHZhMVRiMzdOMDN1aENmTjBaT3pa?=
 =?utf-8?B?YmR4amhSWE5FUnB1eEtmNmJpVVJYdlVCODZyQmZ0MVhwa0lYbmhIUjlZUkQv?=
 =?utf-8?B?dnloYWo4SVcyQlE2cThHU1JZRHBudGJDeDZSSHBqc2s3NEthclo5b3FLRlhy?=
 =?utf-8?B?Z1RJei96RjVlTXQwVVp6NUthRVR1WVFoaHBPNnVnZFA1amlHdit4MTZhSmk2?=
 =?utf-8?B?OW5uc1JybGt2djYzWE55MkI3WUplV2U0a3JiSUxBMUdlYmhXSFh5TXhFUXd0?=
 =?utf-8?B?ZFF1TEJmbldRMmdqQ1QyZDM5MkZ1VXhmVFZlcFVTazJ5cHV4U25hSkpmS002?=
 =?utf-8?B?OE9JYStGY3RWYVZ1dzZ5WkdIdDRQU09xZ0EwL1pITzVPU0xhcU5GZ0xOTFM5?=
 =?utf-8?B?MlBPOVRuVDVsbnUyUzJwakl2RU82cWFYOW1OODZJTlc0QlNwcHFGWE9lTWFw?=
 =?utf-8?B?TDdRWUFqdUdEUStaU2tTLzFzSW5lTTFPa1pseEZaODBGeHhwQUlXNk5xaHlO?=
 =?utf-8?B?TGVFcjh1NnF4RVFYV0gyTWVtNzQyZUNMMUVoRnQ4Qm1rWWdCQldkdkRKRUt5?=
 =?utf-8?B?ZWdxMG0yTFFTQVNqaUtQaHBMWmE5eG9JclBncXBjL3dteFdQb0dpRlFaV09V?=
 =?utf-8?B?SE5SU1hJcFlaV0JwcTduTXY3Umk4Y3NPSm5mekFlVFNCQ3JjQVZHY285d1F5?=
 =?utf-8?B?azlZVWw4MDRndVAzVis4MG1XVHUxZmR2SXdLajArTE5sdGxBeE1QQlN2ZDQ5?=
 =?utf-8?B?R0lXbFpRamkrc3l5VkdJUmFXOVRDSkFHRndCT1Z5OEZzbDZrSXVRRTNkVVUy?=
 =?utf-8?B?SmErQmcwVlBOUDlwRjJ1TDFQQ3V0VDY3Z3c4cUxIMG9MTk1BU0ZxNnhFd1Bx?=
 =?utf-8?B?WUlXcUEvUWdYc3g5R09GVFI2bGdjVXRiT3JoM0VES0l4azlLNzQvVGRWaThN?=
 =?utf-8?B?MlFVNk1nZCtPQWU0MXFac3pUMkF6d3ZIL3BWL1l4eDJvR29FTUt4Y2tKNkJo?=
 =?utf-8?B?QzVZc0RpczZPaXJuOVVXQkZhTnNlR2Nac2U0TTlWSTRwVnVTUkV6OEhTUG9p?=
 =?utf-8?B?d0dEazNrSnRsVzBnQk9URU5ZaVJpc0hucDNWVW5GU2xoajVMcmRxREJUdUQ3?=
 =?utf-8?B?N3ZvQ2VpNlM5ZGtrQ1IwZnFmS1Y5RHNzSmJmN3lKeDV3VStDeGJqOGJDeWhW?=
 =?utf-8?B?UElHdGxqZ3hUcU5ibFkxYXUrOVJxQXdzVUt6am1Ia0kvTHcwZTNsRXJWQWpW?=
 =?utf-8?B?QzRKbU1xRzFQL3JDYkI2RmxqZVNPcXVsVVpSMEVsaUMySG9xWmhmRUp0ODlJ?=
 =?utf-8?B?dkJJSDRoK1QvVE92cEJkQnUrL2NnU0tyK3VWS1JXdVZoSDJxdjV3WHVQdUdS?=
 =?utf-8?B?UDAxMVZrZmZwRVJMM0E2WkQrRUZmamN0OEtDR2FjQmtnaW1KY0RxZy9wK20v?=
 =?utf-8?B?VUN1UmJQZFVjUzFYUzJmWW5qbXdqNmJxZzlEWVpaK3NFMm9mQmpNNVNoVjJz?=
 =?utf-8?B?c2VpSTZSVFZReWJmMVIveHRWVklyb2ZyTW02NDZPSkpLdHFCaWdrRFpqT1BY?=
 =?utf-8?B?S3UvMk1WMjlpanBPVnFnYkpQczlDQjg4SzZaTVRZdUZLMFJTMFZqTTg4ZGQv?=
 =?utf-8?B?bXhWVW85U0F6NGZXRHpXVVF0MDJiK0x4NGNwbXVNbmZJT20yWUlvWGg3Y1Nq?=
 =?utf-8?B?Vk5KdUtnVHp6a3B1R1JhZ1hCaU1OZ1MrV1JNYWlvS01JOTYrRXIydXZtYkJE?=
 =?utf-8?B?MGF2RWpEcDZhMVpOb2VTM1IzUDBURDZtcmJqRXJLRkV1REJlTVRRdVM2cUIw?=
 =?utf-8?B?SzhjR2RXaVZLc1NCR0QzbnpEYTZ3NXg2Z3JHc0dvaloxbiszcmpZN3ZYSHhU?=
 =?utf-8?B?eVpvWU5vWkVqb2FXcmpNMHozKysxK3l5eTdObUMxcWY4WDdCMkc3cWo4aGFX?=
 =?utf-8?B?UTR5Z0FIaGgyZFg4eXFIYWZocTJ6Ukl5UGlyYW53ZnNlbGdwVEVHMlFsT2Zr?=
 =?utf-8?Q?VBLYW7eHwFwcNw+jvn8bRiEd9?=
Content-ID: <288EE4FEDFBA474C9D3A01E0E8229F80@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c318897-de56-489a-6789-08da7dfb9787
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2022 13:47:55.8530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ngh8E/zyi7mAdsqZ37L/mT7BbzGSD3Vjvz53z1yHsZruymyHOE1gz0p6ZdlTJeHPO83cPH7EmvgU6zGFRMQRcunzTOD/BX21OU++J2tXlXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6610
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_064809_962716_AB198EF1 
X-CRM114-Status: GOOD (  23.82  )
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

On 12/08/2022 08:35, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 11/08/2022 23:33, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Upgrading dt-schema to v2022.08 reveals unevaluatedProperties issues
>> that were not previously visible, such as the missing clocks and
>> clock-names properties for PolarFire SoC's PCI controller:
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'legacy-interrupt-controller', 'microchip,axi-m-atr0' were unexpected)
>>         From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>>
>> The clocks are required to enable interfaces between the FPGA fabric
>> and the core complex, so add them to the binding.
>>
>> Fixes: 6ee6c89aac35 ("dt-bindings: PCI: microchip: Add Microchip PolarFire host binding")
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../bindings/pci/microchip,pcie-host.yaml     | 25 +++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>> index edb4f81253c8..2a2166f09e2c 100644
>> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>> @@ -25,6 +25,31 @@ properties:
>>        - const: cfg
>>        - const: apb
>>
>> +  clocks:
>> +    description:
>> +      Fabric Interface Controllers, FICs, are the interface between the FPGA
>> +      fabric and the core complex on PolarFire SoC. The FICs require two clocks,
>> +      one from each side of the interface. The "FIC clocks" described by this
>> +      property are on the core complex side & communication through a FIC is not
>> +      possible unless it's corresponding clock is enabled. A clock must be
>> +      enabled for each of the interfaces the root port is connected through.
>> +    minItems: 1
>> +    items:
>> +      - description: FIC0's clock
>> +      - description: FIC1's clock
>> +      - description: FIC2's clock
>> +      - description: FIC3's clock
>> +
>> +  clock-names:
>> +    items:
>> +      enum:
>> +        - fic0
>> +        - fic1
>> +        - fic2
>> +        - fic3
>> +    minItems: 1
>> +    maxItems: 4
> 
> No need for maxItems.

I brought this up on IRC, but transferring it here since it's been
an (understandable!!) few days & just didn't want things to get lost
if my net died. Cutting out the back & forth, in summary:
"
I'm trying to remove the maxItems from the clock-names array you
didn't like - but I can't figure out what to do instead that doesn't
trigger errors. All 4 clocks are optional, the only requirement is
that any one of them is present. Either I seem to get complaints that
my property is not an array (simply removing the maxItems) or complaints
that because I have clock0,1,3 and not 2 that clock3 is unexpected.
The root port is physically on the opposite side of the FPGA to the cpus
& the AXI connection is through the FPGA fabric. There are 4 AXI
interconnects to the fabric  which the PCI controller could in theory be
connected to all 4, but it only needs to be connected to one.. I had
done done minItems and maxItems a la:
devicetree/bindings/watchdog/st,stm32-iwdg.yaml
b/c that seems to have two clocks that it doesnt care about the order of
"

Rob then suggested:
"
I would remove the 'items' list in 'clocks' and make the description
clear that any of clocks is possible. It's not ideal, but it's a case of
that's what is already there.
"

I'd then have something along the lines of:
  clocks:
    description:
      Fabric Interface Controllers, FICs, are the interface between the FPGA
      fabric and the core complex on PolarFire SoC. The FICs require two clocks,
      one from each side of the interface. The "FIC clocks" described by this
      property are on the core complex side & communication through a FIC is not
      possible unless it's corresponding clock is enabled. A clock must be
      enabled for each of the interfaces the root port is connected through.
      This could in theory be all 4 interfaces, one interface or any combination
      in between.
    minItems: 1
    maxItems: 4

  clock-names:
    items:
      enum:
        - fic0
        - fic1
        - fic2
        - fic3
    minItems: 1
    maxItems: 4

Does that seem reasonable to you?
Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
