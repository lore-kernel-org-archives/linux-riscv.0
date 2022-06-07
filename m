Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEFAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 08:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mgtXOEE96U3catk6RKtwQpZ7voCPo11QoF2OEzxMD0=; b=31DKd2z0CgCFSF
	kReDtD5fCsLyzSxcGtbJHlr9tavPcqap5CZfH4me1UvdzwMQgJP7pWymlu9BU32qoQLJiJwfq75qx
	0RlcwLD5vkqMDnDN+o2WDnV0JqV6TySfpTpaFXZ+hSIBC1ytOWPUko92Xjpfdjgy5xwygtRPZyZJe
	E0z76/PJKU8TcNb0IQvLMWMZ8VDy9/XMVjV6TdF4klVl/frcB5PQEHI9HZ7TPNqFydUKV5QVx/F8P
	Wn9Yx+HeHettUtA7ghFOWILKv0Ov/DT3ULL9YHgTPWbdw65xmfgy5j0YhckBh3umD3L2F2w9RAmgX
	bLI2Tsd3xilv5TGs3nRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyV35-005zRx-3v; Tue, 07 Jun 2022 08:58:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyUzH-005xMI-1v
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 08:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654592094; x=1686128094;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RASF/PM4SvbyByFOgqxVWC+5p40NYta4Yw/fNEJCVZ0=;
  b=MVZQUWoeFK0X/o0ardjO+Pk658fbIh78tIw7V9b4RuPxZb60UBrY089I
   KnPcT5WbnHpJIoOd/6bOHXadzd1yJu9l4VHgrri6kj7E6KsDuP0vsubpx
   OXR8B64qfyZ7xMOuqvbsbsaBFhaCn7NKElcy7pMx1YnDGWHsqzdl9OpWv
   ma5WQa5XTIuC5S4kpayjSxjk8t9SgS/GKj/vOpRJWPEjLzz3EPXewbHrd
   hBw1VkjovOsUb4abOqn0TJneTHtgzWuTuuPcbVnopo1TdyTW0YNiSudQ4
   k7FDwuiMqfSuX+oc5PkQtfPzy75nFAPn4mPy67ft2SvTGgDaHHlP8oFvW
   A==;
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="98889168"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jun 2022 01:54:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 7 Jun 2022 01:54:52 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 7 Jun 2022 01:54:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIFkNUbLK9k6R10sm7K/KaHLlreLdHyTip0GATOf0zyWELhc91hjM23veuD7gMqIow0Zekjs+VIwEz+s7lR5gQSIowIPlFXoV2XUtglYRYBRPDCpsM5GKxKPLMe1Jc5QBIEcgl70F0mFpkDGAqLOfnaL3rLkem4FRTyMUGmBqlR63SLE0kd1Wz6jp+ybdRtXgMZGEqaocZfyPJLa1R2tgJVSnp5OTuPb1kMCsNhlpoRepNqOJs9+dMnchlCwsw2jYRbtloOkMLmTzBHnKymjLG3cRXbg1yHt6eBxjWZBt7XuPVGMcB2oBtbHU/eeYtfSmtSIig8H3fhWmdTmDRwNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RASF/PM4SvbyByFOgqxVWC+5p40NYta4Yw/fNEJCVZ0=;
 b=Q+6+5ob3uZHVK22EvWyQNcRb8HbqV2KilL/2Sei8qDC0BoLn9Z01Qrq9f2gwXZvEqq2B41yAxQnpRn5ReyiFhHQ1ze2+e2EmRmnS5dm7FOfvrES624Hxt6W8dBAYyaqs87z2BDdeY+4TQPoM1QYKnDAGaZf+vz3M40OH9Gro07jwQTblcnTkXyHNHugISnHZkpBBQQ2qiHHAtKroone9mZjr0KRouWDCX3j/75ITqEild/7/Kzf/b+VX2NfnAUgTRGcN8SH2EvFMbjpIJBW0c6frlq7rr+q7XFxTEFnR7FNPG33vWFIGTt9ZHxMVRTcKT5uuiqIpm8nrv535+vA5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RASF/PM4SvbyByFOgqxVWC+5p40NYta4Yw/fNEJCVZ0=;
 b=b7SmHtoa0ZOuKN8i3kPkux0/BVsoMazlsqDWPdPrch0OOq4QWbgko41WiqOGT9dntQZOmf2zCSlMXRjR+OOdrAuNo4fgCU1Wy4Wy2tdbouLbzoSDH4tmAE5pp1NhlPYIzjmIH5zHaro4yT6gvVR2C67Q9Xx108GfgQ4c+bs4JFw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA2PR11MB5196.namprd11.prod.outlook.com (2603:10b6:806:119::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 08:54:50 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 08:54:50 +0000
From: <Conor.Dooley@microchip.com>
To: <mkl@pengutronix.de>, <Conor.Dooley@microchip.com>
CC: <wg@grandegger.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<Daire.McNamara@microchip.com>, <linux-can@vger.kernel.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH net-next 0/2] Document PolarFire SoC can controller
Thread-Topic: [PATCH net-next 0/2] Document PolarFire SoC can controller
Thread-Index: AQHYejvb6k0j61Qol0aP+WnBuEsVo61DiDiAgAAJ94CAAAp4gIAABvEA
Date: Tue, 7 Jun 2022 08:54:50 +0000
Message-ID: <0f75a804-a0ca-e470-4a57-a5a3ad9dad11@microchip.com>
References: <20220607065459.2035746-1-conor.dooley@microchip.com>
 <20220607071519.6m6swnl55na3vgwm@pengutronix.de>
 <51e8e297-0171-0c3f-ba86-e61add04830e@microchip.com>
 <20220607082827.iuonhektfbuqtuqo@pengutronix.de>
In-Reply-To: <20220607082827.iuonhektfbuqtuqo@pengutronix.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97f33d3e-3d23-4ede-2e7f-08da4863617e
x-ms-traffictypediagnostic: SA2PR11MB5196:EE_
x-microsoft-antispam-prvs: <SA2PR11MB51966B8CD132DAA30A6B013A98A59@SA2PR11MB5196.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hRBYo1Rqs/VMn+mi/AacZD55FbBlKyLtqPipnBoHU3ROL59X5Pb5VAFZoW8rA3ZRvSV9XMXrjSihV4xsCwnsfD9fuUPHMjlh76wf0nTBbnosiIi4hUnIt8VT8vaphIbasg2j4fHIuCtkashNZLxazXmpAj1BV49nc9C4uI+7BZIL2Y6tf7PZIE5NeXbTE969EFL/MYttF9Gg/dGiZ1M/ZL9RPItslfLBNApBCeBKx9PCjM6ubssElxiE5uMLbAj4UwMW3rCa4lfgdEIzSfzQolgEx7H9b36AdX7iBaSGeVtbRoKTVlstRPkxEbxbRrd4W6D8IsZstjxjPScqpaic0+h1JhpJr7AGu2uYphKJg1P428VH1h1t3tbCGbW/vQ5LCqHxa7fWcqwmr3pu6NVz5aKKHbmM2TnZCanqVKeNxGjkSdqVi2QBJS0m5wwjEz4Om4Ugzt0Y+L21GDrTKUumkbYQlQWtwztrIqdP9TkXt85268lZingS2fEg0IeE3XAAnGJpzfBSfb2JtvN2DY/Dv0ec+CBJJzOg6gm3a2dC1LWt5Wh20xLIIyhoZOE5ZTKTqGUOV/ACD5U7FO+VquR1A3cIteI5Gtt/ZBzU1cdIDe7NWVeLypL/BTREtdNksospHrg2EDe9PNK06eP5+4AOszCBQRhGR6ohqAUEBWZLNp8sDGTf1AUhjdmpkYyPOH+pTZB2ffahWnYaQJA9Udcj58e9i86vR6NNT3RzdG22z3MI/Rn4BCX4hcbdueK6HgQGzaHiKW3VvhmJ1+1ZPzDRwubafwg76UvT+azKrRhqK67kt2seCfoyvxX7sZ5HLPC+eln0HkS5JzUuCYigLqI7RvR7EyeXmvNAcsFPGUYcwsxjiVn/V5rkgPtfH28stfctnznEHTk3BYtrlKAxhAQrdg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(53546011)(64756008)(83380400001)(4326008)(66946007)(6506007)(8676002)(508600001)(6486002)(966005)(186003)(86362001)(2616005)(2906002)(110136005)(91956017)(71200400001)(76116006)(36756003)(8936002)(54906003)(66446008)(38100700002)(31696002)(7416002)(38070700005)(31686004)(26005)(122000001)(6512007)(316002)(5660300002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUtYN1BmaDJGNVlCOXR1bGhWaEljV2lnNGFkWEkva1VQaVBuUmpTWW1STkhs?=
 =?utf-8?B?Slc3OE85S1FpNHZwMWlwRm9mMmh3OUYvQTBNL0Rvbi93SVhVV3dERXh3ZnRk?=
 =?utf-8?B?ZXRjNnE2MTRQcTVIN2tUYU1PckE4MzNaNFhlNXRqaitYOEJ6N210MS9kanVK?=
 =?utf-8?B?R1hpcm5oaldXMXAxVmszczVWcHA5TTZyN0VzTU9lbXQ4WHU5dlZaRDNXb2pv?=
 =?utf-8?B?UmxMbmdpbEcxSGNFU1FlMlE3cVpPNURNRjM0MW50VUR2emxMdll2VU1jVytj?=
 =?utf-8?B?b1dlRDNvQmVpQjl4cEtDODQySTV0LzlNb0hzWXdFRnNYSFdwS3ExeStVZmd4?=
 =?utf-8?B?QnZmT2JYZkhRVkc4bUU0Q0NTTkY0T3B3K25QS3lBbFRiSHd3UmZrTzZqMlVt?=
 =?utf-8?B?ZXZrbk5aS1JZVDhPNENFSWV6T3V5Z01idW9rNW9GRVcrWnNvVzEzR2k1MVBt?=
 =?utf-8?B?bW02SVlkdXNwUmhnbmFCaDNoRGgxd01JYkF2bERHVkE2NUxBYUdnSEJqUlFX?=
 =?utf-8?B?blZ1bmZ1S0pBZ3gyemJDZ1Vpem1LbGlRMzhoRzZUTTVMY1N1ZG10ZHNrMlpX?=
 =?utf-8?B?dXBoMjRDL1praW1ZbWJqQjhXbWo0THY3cXJ0ZTl3ckhaaXppTFZqWmlUUFBw?=
 =?utf-8?B?U2pvenRHUEZscGxEeXFrd3JrSFBDNmQycUx0NkpmbVlMOFJhUERJclBzc1ZB?=
 =?utf-8?B?ZklqTlRrZlpqa2NvYmhlN1Y1WUxmdlprbGpPNEFvejhKeUtHdlJ5T09XMUdL?=
 =?utf-8?B?YVFVMEpsMXBqQzh1MlBMSEIxSkpwdHF5UmpDdC9uN3loSklQYjh6MWhrT3dZ?=
 =?utf-8?B?OUpqRDRibm9xeWtXWDVhRkxXbWtrNEV1UXduU3gzOUVWSjhsYzlnV245MmFQ?=
 =?utf-8?B?T0s0bERUWHB0ek9HZnNKSlRXZ1JuNWE1ajFKZlJCbzVXZGVESEZkcVZGdElt?=
 =?utf-8?B?dmtsWW9tNjYyTEwyM2NrRTllUjgxNXkzaXlERWFWVlFaV2RVTjBEYVVmZ1Jv?=
 =?utf-8?B?NTRHZHpzNXNYaEwxYUxHbG1odTBERERMZ1FTUkRiWjFuQ0IrL2ljNUtwMkNa?=
 =?utf-8?B?RnVMQzRZbU1xcTB1TjAxTjNnZHZ2bzV1OTYycWNGeXdmeHVJU0pRUkRrUGJl?=
 =?utf-8?B?RHo1RElETkxqcTZYeFV0cVVOS1dHMkNIaEJxMStCdzNicTZPUzBCMDkwUHM0?=
 =?utf-8?B?TmFjbS8wRFYxMEEwMUZyMmszU1Biakk3Njd4QTRYZUw1eFIxUnpteGtFK05C?=
 =?utf-8?B?YWJuQlVDalFva3dqM0R0UGpPUFcrSDVwalRtclhWNkpDTGRCTUV4VXd6THNU?=
 =?utf-8?B?UjRXTmJkUWFrYjhrVDhrSEFScHRKMWlaYThHR2JCcWUzTGRVSlNOaWduSEt0?=
 =?utf-8?B?MVp4SWdBUUh5aG95QkozaHNkYnd2UVpoeHFRanpwRzRxMVlBTmV6VDNVQzY0?=
 =?utf-8?B?R1hOZGFLTW90QWZQNGZpL2JISTc3MjFDak1PMlN0S3hSbVEwOFJSSC83ZE9Z?=
 =?utf-8?B?bXdreGlJZEJDbk10ZVFqMlF2djR4TU5jTVF0VVdJVGZ0NVJUaUtKaThLSU5t?=
 =?utf-8?B?cU96TDJUUGRDWG9hR0NOcWxRZk5tclhJVXNNZGNhRUd2Z0Qxczl5dzFHSWgy?=
 =?utf-8?B?Syt5WlJUc2RYdWExVXA5MDdDSzYzTG1qYWZudjlrK0FkN3RvOWFoTDJRWStK?=
 =?utf-8?B?MGFzamFBSTJOZGREYmZwcTloZUpqc05lZE1Rb09UMzNVRURxbnV6UmgxUldX?=
 =?utf-8?B?d3Y0eGxqcEIrLzFOaTNwWURhS2xEWU5rWnRTY3N2Tk56V2x2a0JvZGpMUXZQ?=
 =?utf-8?B?cUNPRlBoRVlVdFM1cGZFOWFZZHJJa3RjSHBVK01tNVN4R1BBaTlKaDRBMFIz?=
 =?utf-8?B?NWZObjk3LzczbmVxRFh5Titnckx3YW1qenY5cHJZZVMvY2l4TVFDQ2lJQ1pH?=
 =?utf-8?B?cXRyd25mK3ZFR3lPZ0d0Q29SMDl1WThHM2RQb1QrRmZwdzdyN0puR2pDK0g1?=
 =?utf-8?B?NXFjUmRFcmNLM0hobUlEWXZUM0NLcXk0QzVLd2gwSkRlR2xrTVFmdjFsTFg0?=
 =?utf-8?B?L1BYVzdHZ2xSYXdoTi9yU1E5OTl5MUE4ZEU3R0pnSVJMWGZ2T1MySWZnaHFM?=
 =?utf-8?B?eDB2cXRMS01nQ2g1UTJoMmxuME5IMWNzMkIwOVI4Tk8xaFZpQkNWTlZjb2Vs?=
 =?utf-8?B?c1hiemdCOWNMVkR4UG5aaWF1ZU83UlU3YkFwSldJNmJ5YWg1TEpRL284ZUZk?=
 =?utf-8?B?dEJXSzZZYnlsaHVBYS9RVmFJcmpMNXlpYlk0eEwrV1o2b1ZzZ1pmUWFvQjc4?=
 =?utf-8?B?WS83ZTRac0pQejF0Y2pKUGdOemYvZUNZS3pFTU9nYzlmVkxqTVV5dz09?=
Content-ID: <C50ADCB16A3E35439955439C7D1F54F6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f33d3e-3d23-4ede-2e7f-08da4863617e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 08:54:50.0655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R7W6woylHzZxbIaBycwP6gJGmqhOUCAU/ynu8BKVi6ZwEsW7FezKc7sSl4SMPEjoP938JCbyeMHt0ZoT1a1eBvnKLbavsv9GKzY4Y3r3oFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_015455_389841_EBBD11CD 
X-CRM114-Status: GOOD (  15.37  )
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

On 07/06/2022 09:28, Marc Kleine-Budde wrote:
> On 07.06.2022 07:52:30, Conor.Dooley@microchip.com wrote:
>> On 07/06/2022 08:15, Marc Kleine-Budde wrote:
>>> On 07.06.2022 07:54:58, Conor Dooley wrote:
>>>> When adding the dts for PolarFire SoC, the can controllers were
>>>                                              ^^^
>>>> omitted, so here they are...
>>>
>>> Nitpick:
>>> Consider writing "CAN" in capital letters to avoid confusion for the not
>>> informed reader.
>>
>> Yeah, sure. I'll try to get over my fear of capital letters ;)
> 
> :)
> 
>>> Is the documentation for the CAN controller openly available? Is there a
>>> driver somewhere?
>>
>> There is a driver /but/ for now only a UIO one so I didn't send it.
> 
> Brrrrr...

Yeah, I know..

> 
>> There's an online doc & if the horrible link doesn't drop you there
>> directly, its section 6.12.3:
>> https://onlinedocs.microchip.com/pr/GUID-0E320577-28E6-4365-9BB8-9E1416A0A6E4-en-US-3/index.html?GUID-A362DC3C-83B7-4441-BECB-B19F9AD48B66
>>
>> And a PDF direct download here, see section 4.12.3 (page 72):
>> https://www.microsemi.com/document-portal/doc_download/1245725-polarfire-soc-fpga-mss-technical-reference-manual
> 
> Thanks. The documentation is quite sparse, is there a more detailed one?

Nope, that's all I've got...

> The register map cannot be downloaded directly anymore. For reference:
> 
> http://web.archive.org/web/20220403030214/https://www.microsemi.com/document-portal/doc_download/1244581-polarfire-soc-register-map

Oh that sucks. I know we have had some website issues over the weekend
which might be the problem there. I'll try to bring it up and find out.

> 
> regards,
> Marc
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
