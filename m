Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03D0CD4F5B
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 10:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Xm5mr2Kcr/usNk5MaMHMypWP6Z8Rqkpv9UAijifXQM=; b=pVKlBudXYOd24G
	NH62fcacmli9wy8E0oDoD9saAQcjaaK2wWqvvN+kFU+C4W9ZwcDOAJRfajdjHJcPTHDKHYT3pzKRL
	+ZLOROO/zhtFX279op7B67GtjN2mkTjzDl2i4Wl6O4mRpZiC5rFwgJ211Ko3a5RitgiVjkjhZ2dWZ
	WJKedoMoKaXeGJ76GuwhNg4C9ew6PAi/yoK6Ag8+tmI+OyCHNqPLCaHr8N5uBrBlhBbBA80SyDDM6
	2nCbaECcYthZCjQeXm08YKg7Jow7Zq6j+Epq4iLI07SvsGhRgrbzJFIvAmukNHuUbHCOHwW6Dvnq5
	lKWDxQOVCaevIRtnnEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjdse-008uL4-30;
	Fri, 22 Sep 2023 10:59:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjdsa-008uJs-2A
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 10:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695380365; x=1726916365;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LFTTb2csT2/oxPQIWJiI+BzhxkY5mdQfT2FKiyOMZmQ=;
  b=v0HN+nGCilC86HQTd9tAM+Qv4eddNLduGbCIObnZLTZch40oz3JCQDVi
   kgHF/o34k4HtHlpM17I82+HwDGe7QZrUGQtCst03zonhTFxM1xj27goJE
   STzsMVCtNi2+Vv3opH7KQwJXnWNt8ag+bPB20l6WQmRLBY0Q60JEq9D2/
   ylJp5LMoPQlKuKiuFKQTI8B8vFe/5Dt1P4s5FSCTNoxiHyveaE/u/ISnD
   2XW/aMCUbLDxug936ckhD2sCyFxxzUuir2ybNqBdF44/poE9g5CDHqPdz
   0iqT3fA0n4IiN/KDgoPZtp77cb3PE48pyj/ysjtDRpR+c8K02AmQDFvYT
   Q==;
X-CSE-ConnectionGUID: bd7qvu6HQ76RalQG4Zn3uA==
X-CSE-MsgGUID: 4YfelX45SM2Ll/wH0kSjVA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="6060332"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Sep 2023 03:59:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 22 Sep 2023 03:59:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 22 Sep 2023 03:59:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWZV4708WkmPb/1oCiAf3x7afUCUPc6FhpHvnE/EBOFsa8/+b4jCEPw2iIcbaX5poI/Y64rUOfO4Kd03bBVB9vDNPQE6rpb8B0Xaz2kRfSaTKTDe3UD/Fk7jvdAe/TwWbMTamxa28GqllGNR4EAwTnNHsmDyh6vSNFVYNjP+hsGE3GFgXrei/P/qsGZN1sMnDFT8dTxAdv49LVTaZa58FFJj/KEizIxDc2B1rGIoeuuJhE0il3zDghUsN+SZ+ZJ9yL5woadeTv7to7+EVAGjOMEoYw50c+5DQoKuQfDKrdTuK0wgXRZRVdbmcI7pUblg1r0wuBeDpwIaiuGAVe5lOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFTTb2csT2/oxPQIWJiI+BzhxkY5mdQfT2FKiyOMZmQ=;
 b=UtMnuoo8S4HhqnnKLzNi+j6Z7z69c6/UZpepy0HhCov6oZaWZX7z4UmNiCqdZ4iHnl7D0+7r0xFakqV9XxchR9jeMY0SZ19N3uNRm0Dfqca6hG09WDsUrC9DZrAJ6b8ZuaVrmMmUx2FdZTUtDQRRhnyttiq7zy9lX/uYkg2X0yFtOftGuJ5imQUy/wp1/+4gBhnlTlyVq5JYPsO7rzL2ru+KKCBGI5OfHn9QpOpIXb/UdlfGNY76aAMJ/EkhNHRFjwdHhnNJbogLrMaMCZ8wqntna8P8WjagSaz2G8DgxAipK2Qg+qXP0fCTetLRw92TtWMCL39lXbynl8hON9695A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFTTb2csT2/oxPQIWJiI+BzhxkY5mdQfT2FKiyOMZmQ=;
 b=pRWMGn8O2vrZtovdScfGTqJVoFfpR/UHL6dBjhY3mZv3UrPnS4Mz+h4KhR7TDNLij2y4Pg4oXBUy2lxp4HA4mxl/DPEDQ43XdC5e6+LrxKAcTZUhCFdzWjVT7TiQdsCIyqR0TWRSLiCWvNr94zX9ZUvp/alPFO7qr4dXe3GHwpo=
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS0PR11MB7804.namprd11.prod.outlook.com (2603:10b6:8:f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 10:59:04 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::1133:b6c0:3f07:84bc]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::1133:b6c0:3f07:84bc%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 10:59:04 +0000
From: <Shravan.Chippa@microchip.com>
To: <emil.renner.berthing@canonical.com>, <green.wan@sifive.com>,
	<vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>, <palmer@sifive.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Nagasuresh.Relli@microchip.com>, <Praveen.Kumar@microchip.com>
Subject: RE: [PATCH v1 1/3] dmaengine: sf-pdma: Support
 of_dma_controller_register()
Thread-Topic: [PATCH v1 1/3] dmaengine: sf-pdma: Support
 of_dma_controller_register()
Thread-Index: AQHZ7To1s/07Ob6QNEaD2mS2IRA+F7AmqX+AgAADPTA=
Date: Fri, 22 Sep 2023 10:59:04 +0000
Message-ID: <PH0PR11MB561162E58DA1E7F11E60DBB381FFA@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20230922095039.74878-1-shravan.chippa@microchip.com>
 <20230922095039.74878-2-shravan.chippa@microchip.com>
 <CAJM55Z-NUwzo9SKtmV_5OegznDjSQEG9DVK7=5x4qnxUkk399A@mail.gmail.com>
In-Reply-To: <CAJM55Z-NUwzo9SKtmV_5OegznDjSQEG9DVK7=5x4qnxUkk399A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|DS0PR11MB7804:EE_
x-ms-office365-filtering-correlation-id: b03de551-cd5e-42cb-963a-08dbbb5aef68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XadyD9VR31HyA2FLIc9t+AZUspFdhNlhNeOk9dzRxJRETYPh+WRTkMByjJkSCWsSptRptDNN+K4+XGBuje3gkKUWulrtQA8OAM5ROC4bHMJFYKK2BonLDfVc1N2H0UpF4HA2nfSoIeOmI+J84iIYe2MfNflsTUSeeMUZmlb6wCi6gT4hD4m/W/ru3L1bUWoaDHshDjkYXKOo28Im9hdxOu6rn3hM12wV+lQx7mRh49CW+uyL+vhzW9WTzF/V0+s0ngsSh1UhrcLj7/uW+SsVRRbZYuPWLSxKw+qOh99pnOhbNFx3p80oRfWcZ28AGk2QOQWbqcvlgaTdXhqPBOLwto3/Mspw6zyA1twZNrOt4NecnH9xuZFYD/1Un2jm9q7uSOeEqwRU7PloU4uU2pjZBMknLCRETbgLg1tkNClTQA1QU1wAjV94Gb2qTijJ92o9PG4UmXJs/2tFWkI0+VzrEY7KMwfApC7bp/pjDx4tW0pqwxT8Q/e/h9Q+VA4IBM4EvWWfaDIvR0G6vrNKV15EGr/aI0TsI1YJ700loPNRZ3xDBNTpxg8LGMJaGxiG6W3suDSXRqrx3WP+sLo84/VAWjHt/PyjDT7xVr59auejwRE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199024)(1800799009)(186009)(41300700001)(38100700002)(5660300002)(107886003)(2906002)(55016003)(26005)(122000001)(33656002)(38070700005)(7416002)(4326008)(86362001)(8676002)(83380400001)(478600001)(53546011)(9686003)(8936002)(6506007)(966005)(7696005)(52536014)(316002)(76116006)(110136005)(71200400001)(66446008)(64756008)(54906003)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTUvcUcxNEFpYUtQbFp4eWszYk9yNVdObWJZL3VSNDRCOXlURmR3V3ZpVGhj?=
 =?utf-8?B?VmFwMnl2ZllEMklvUWhDejMreGpuT2Judlh4TnpYRlZYZVNFSWFvNHJIbk5z?=
 =?utf-8?B?VFBQMndhNWtNazR3SXBBSDNLYlZWWTEwbHRnejdCQnA2eWJvQTF6SGxtSDd1?=
 =?utf-8?B?MUpOVksvQzJiVlFJSXRyM05yZ0J2cFdwaWgyN3MxOUNRK1RQcEwvbTR5UjRj?=
 =?utf-8?B?T0NFalp0a1hieG1OamVuR2hYRFBuVW9KU3I4L1dwcjdIRFQ5TWpWM0dMVG9n?=
 =?utf-8?B?Mk5jZWdLRDQ5ZThFNDZjekFocnJLMkVXK3Zucmt0cUhQa2lTSnRjcU0zUVl4?=
 =?utf-8?B?dURsNWQ3cnFMd054VEFRVS9RTFdiaG5QY3NMMVQ1TXpoZUN4dVI1ZHZ3Kzkw?=
 =?utf-8?B?bTd2SmJpRkExODdwaWlUTytITzhBRG83OFhJbzZvSHhYY1N6Y1NMdzJ0WVZ1?=
 =?utf-8?B?NUR2dWxNVzFidjhEV1FzNjFhZ2d2VjlQQzNIaml1eXhOcjRrT3RueVNLVDBW?=
 =?utf-8?B?SGtMcTRSUzl2Mm40bjJ5M0xpYTREQVhzUVhiWW51YnVSemwvRmluTVJiSlo0?=
 =?utf-8?B?RU9EdW9pRExVOU8wZGFnMStmODRzYm5hTWMzNUZmVDY5V0xMQmRSVjYxbXo3?=
 =?utf-8?B?c0RjeXVXbEEwTW5sM2EyQ1RxeGxUWjYxN2hMTFl0YndIZ0RmaElOV3VtMEZv?=
 =?utf-8?B?aWY5SktBRnp6UUh0N29Rc3hTUkhmZzhkSkI2aEdTYWc0Wmc4MVIzU2Zmb203?=
 =?utf-8?B?WitYSUIvbUE1T0tMSTYyakVkcENtSktBQThHUUJDQzh3ODdjUm1UYXNMN2p1?=
 =?utf-8?B?bDhQT01Tc2JxbnpBbDFrZ0QrcEw1dDREY2FFbFRSNzNBSzhmanAzR3VCWlky?=
 =?utf-8?B?blJZSDBNckxka0kxWlRFcWRYUUN5SlA1TUg5MDljWm13V2pnUkN5WmdOVzlm?=
 =?utf-8?B?U2hRYTJvYjVSRko5T0VlNVF4VHY4YUJJRVNDOW5wTURMakFJTTEveVl5aUVY?=
 =?utf-8?B?ZjVZanlPMjE4bTkvcnVJTnd2bHJtS1JhamJEOXB3ZnB6ZlFQV0hDSkdVMkx4?=
 =?utf-8?B?MzdnS01xSGdIaEpjSDZjQTNKWU5HUzd4ODRLNkwxQ25aTnR6U1IyaERMc2JR?=
 =?utf-8?B?U0M2SzhQMlZGSStCWTEydy9CaTIyOFl5QUNhWk5KNUF0M3N0R1F5VDZSd25S?=
 =?utf-8?B?OXBUWlo2TzZKUnBIWmx0UU1QbU5INEwxZEdSL0YxTzd3QXBMT2xjM1JUQ2VO?=
 =?utf-8?B?dEhPc1M1bnlCWXBzeWVSamhrWHZDOFk3N3hXRUhpV0pvUko5U3hkQUo5VGVC?=
 =?utf-8?B?SUFoNTFwSlloc2M2THdycStxUDdmMUdwN3YraUdtOWhlM3RtMGlNNW4rYmtJ?=
 =?utf-8?B?c0JFdnJSUHM4dmFYUnc0bG5hMUZJWkh4N3FVMjJ6YTJSQXNuT1pTN0pkckNk?=
 =?utf-8?B?eHJYS3NDak9ib3VMb2NOZjA1MEZkNkRGd0JFSFhuTHo1U04ySHVqdnVqMXQw?=
 =?utf-8?B?NUVKaVVXMW9hcEtnc2R4bUhkWDhrcVN3SlpDRWF0M1VFU0tCT3VRMlVlQXIw?=
 =?utf-8?B?a0JTSXBpY1JQelZRb1dOR1FOdlEvVXVwMHhnaG9UZE91Rm56T2lQbEFsaGVa?=
 =?utf-8?B?UkxEVTFPWHJXUGx1bk9NSFVac3dycU9YRTVHSnRyWDdqRU5IbWVocGtncGxS?=
 =?utf-8?B?dHpXUGN1eWpQenlBb2JRRGZoUC9GcjFESFFTcjVnWlQ4Y0JtT2FHdjd1M0JI?=
 =?utf-8?B?TDhMV2g4c1ZwbmpZamtnTFF1bHk3ZUk3dzQ5ZDNpOU5meXl5T3krVEtSQlZk?=
 =?utf-8?B?aVI3TTgvMFFDaTNNcnlKTU5nS3NaRUFEMXhEUUdiVTF0VnBCbEZYaVZtcTRU?=
 =?utf-8?B?cHZOVXllOHRKb05FbmtuRGxjYmdnTFhWYWJDWXZ5SmhvQ0xRY3dGYTlncW16?=
 =?utf-8?B?dmdmUTZKd2FCZVZ1T1IwSWZpUHk2M1FpZVlBZm5teEJFUmZXaHdTL1RrZk9H?=
 =?utf-8?B?dzh6aEVEQnkrWjNHbmlmNG5EVE4ySXVMeDRRU0llZEs3VWdjTHN4UTFuSWN6?=
 =?utf-8?B?QlJJd3F1YnhIN2ZSMEpKUGtaalI2QmhpLzdmQ3VYWVVWMnpyMlJwejFrditT?=
 =?utf-8?B?cVpSd2xsejlPS1M3YXZYRGh3ZW1YK2k0RktXMEVhYjYrZlFxSzJ3WnBwYmlG?=
 =?utf-8?B?MEE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b03de551-cd5e-42cb-963a-08dbbb5aef68
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 10:59:04.0824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6VkCnUIYMxrr54HiaQpqt5axLVJ5L9GPAe94aXetpI6MForXEoMcBPO6JTagQ8k5laEr9/rqB1lLW+9RZV/ujBkUs88ZgCsWq2Ue38oD/Kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7804
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_035924_735208_91A7048D 
X-CRM114-Status: GOOD (  28.73  )
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



> -----Original Message-----
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Sent: Friday, September 22, 2023 4:16 PM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>;
> green.wan@sifive.com; vkoul@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; palmer@dabbelt.com;
> paul.walmsley@sifive.com; conor+dt@kernel.org; palmer@sifive.com
> Cc: dmaengine@vger.kernel.org; devicetree@vger.kernel.org; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Nagasuresh Relli -
> I67208 <Nagasuresh.Relli@microchip.com>; Praveen Kumar - I30718
> <Praveen.Kumar@microchip.com>
> Subject: Re: [PATCH v1 1/3] dmaengine: sf-pdma: Support
> of_dma_controller_register()
> 
> [You don't often get email from emil.renner.berthing@canonical.com. Learn
> why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> shravan chippa wrote:
> > From: Shravan Chippa <shravan.chippa@microchip.com>
> >
> > Update sf-pdma driver to adopt generic DMA device tree bindings.
> > It calls of_dma_controller_register() with sf-pdma specific
> > of_dma_xlate to get the generic DMA device tree helper support and the
> > DMA clients can look up the sf-pdma controller using standard APIs.
> >
> > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > ---
> >  drivers/dma/sf-pdma/sf-pdma.c | 41
> > +++++++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/drivers/dma/sf-pdma/sf-pdma.c
> > b/drivers/dma/sf-pdma/sf-pdma.c index d1c6956af452..c7558c9f9ac3
> > 100644
> > --- a/drivers/dma/sf-pdma/sf-pdma.c
> > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/of.h>
> > +#include <linux/of_dma.h>
> >  #include <linux/slab.h>
> >
> >  #include "sf-pdma.h"
> > @@ -490,6 +491,33 @@ static void sf_pdma_setup_chans(struct sf_pdma
> *pdma)
> >       }
> >  }
> >
> > +static struct dma_chan *sf_pdma_of_xlate(struct of_phandle_args
> *dma_spec,
> > +                                      struct of_dma *ofdma) {
> > +     struct sf_pdma *pdma = ofdma->of_dma_data;
> > +     struct device *dev = pdma->dma_dev.dev;
> > +     struct sf_pdma_chan  *chan;
> > +     struct dma_chan *c;
> > +     u32 channel_id;
> > +
> > +     if (dma_spec->args_count != 1) {
> > +             dev_err(dev, "Bad number of cells\n");
> > +             return NULL;
> > +     }
> > +
> > +     channel_id = dma_spec->args[0];
> > +
> > +     chan = &pdma->chans[channel_id];
> > +
> > +     c = dma_get_slave_channel(&chan->vchan.chan);
> > +     if (!c) {
> > +             dev_err(dev, "No more channels available\n");
> > +             return NULL;
> > +     }
> > +
> > +     return c;
> > +}
> > +
> >  static int sf_pdma_probe(struct platform_device *pdev)  {
> >       struct sf_pdma *pdma;
> > @@ -563,7 +591,20 @@ static int sf_pdma_probe(struct platform_device
> *pdev)
> >               return ret;
> >       }
> >
> > +     ret = of_dma_controller_register(pdev->dev.of_node,
> > +                                      sf_pdma_of_xlate, pdma);
> > +     if (ret < 0) {
> > +             dev_err(&pdev->dev,
> > +                     "Can't register SiFive Platform OF_DMA. (%d)\n", ret);
> > +             goto err_unregister;
> > +     }
> > +
> 
> Hi Shrivan,
> 
> Doesn't this need a matching unregister/free call in the sf_pdma_remove
> function?
> 
> /Emil
> 

Will add of_dma_controller_free(np) call in the sf_pdma_remove().

> >       return 0;
> > +
> > +err_unregister:
> > +     dma_async_device_unregister(&pdma->dma_dev);
> > +
> > +     return ret;
> >  }
> >
> >  static int sf_pdma_remove(struct platform_device *pdev)
> > --
> > 2.34.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
