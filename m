Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CF8C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 11:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HP0vrJOZ1ECeYBDVjQ4Zi4pp4WqQONuaKgvIiWypLqY=; b=aFsAge2FKJ1lWJ
	AyYHXCPBkF8DvmGpJcqrqctdq6wooci/k2T7RolfhOCC8wroUH5GnPYz/xmzikqx7SdahMYGO5TI/
	29IFd5fPIcEZ1z1TC8CG5hQRPNeLF1O+Ymsbs26f0lTMy+LLf11wxWUcU3JNN+FLW26CtltisNMce
	IQ1cJIzBLzvZzWY/F4JwF7iXCJZf9z6teCWx1wz6GDjv4ou7+L90ZrK2gpGs0hsEodeBuX4pNeAMv
	lv9I1UApu3YL3cfJMQsZBtpdVjCSEguygykA3sABACkAmSz5CDzjVRR9w2OIoJxKkWddIjWaX76Wa
	IpK5CpYK7xJ1OeQmSh1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDP1V-00Cs3N-Ux; Mon, 18 Jul 2022 11:34:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDP1R-00Crxc-0v
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 11:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658144085; x=1689680085;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AFb12P2aRm0WbwxwIAUDwyoKvzL9ZP3zR8TJEaBJFM8=;
  b=ruQGzScb9mzrTM5w7ZR5bkPHzva0rePmGBdaf/IZVZTE2MmGlSu1RFt1
   VvCxHIgKoWEPvUyEAreWStoQlWtJy8sPbKcryO/ZYK8sDz8v4O5/h7O9j
   RhKu23uwSjGWb9KApHPTIC25cphBU57L75/XOvRsBILc8YsYvu24l5oYQ
   F1KNw1xptyL2jjjCbauqRbrfVs2XPdByWRZlYuG0jtaUxxTkeArfgkjap
   sKq2w8Qhcw12o/5O80mC3ZEpG8Z8nDHl8KbL0B5MNSNNpdFbz4uV6EUan
   pVyB8W9Ol+TH11u9K3+yXhpzsq5hlJZj/l8CpQhjnd9NSXg53/QK5ipQ1
   w==;
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="165191799"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jul 2022 04:34:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 18 Jul 2022 04:34:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 18 Jul 2022 04:34:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRsBHOvMKyZdbxGELjdjOM0VmSyUYorh6dK3jZs9A4FwaUPgRfSqEiMNTs2oHxfFEvuudk1e0jBzjZIbOmvKWJXpCQ2KrGMyiKLyGiOaNrXxfVuAASAtAbl3FpAtaw4ZJz8F14l4tOicDXSkRSh0bS23Q+K5vSyPwqaIbu3zbhxV+DAwaWkaktomtdY1kot7P7cieq4k71G5yFetUxEKo03vu+qgfV5YCPwyRLgoff2YQ0LzpGnlhLZStLK5ygDfViu4b/wWI2zdRUJ2GXGQYVPgum/fn8NuTiKSmvzPCsVpv9oPrpJeJUFkIZDrvqS9qq+oh3N0TMUhqOxWQhUFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFb12P2aRm0WbwxwIAUDwyoKvzL9ZP3zR8TJEaBJFM8=;
 b=aQZIkLuBfQlTPGhhDMo1X6WoH7zQnxfwv1HbHMC8DjQeujgl9zgvFeDvjzzCv2rV72OCFBVxzcV6cHEX0Pqm2Tn3ouQCbgcIWjNWJkbF/OKDJCnlGMJIXsphoQa+52wPwxkM9M/LfECwrUcjAkqyJvaTeVPURx9UpNEWNdlIK3f4wpYT/tFEdec7Mt80Huib2l10ITOPNlpld+KEpDa9npfCH8drcEekVbcq8F1Cj8bQ7DwT8n8ncRSdquVKoUzX6LiM2chA/iI8tX1lHxjPv8x/8b4x6DoiaBpUE4JN5kPb5UElXHWgdzs0JapsjdGEPJbWZeSWcstnojqDvyeVBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFb12P2aRm0WbwxwIAUDwyoKvzL9ZP3zR8TJEaBJFM8=;
 b=BWmgNaEGoGGXflrnriSxC4EaGF+TrI/FYNAdftkCyCEviDyDLJ6JSJnTj9w9V6SaTcJGDffrSgdkBC+oNFx0oj+QwjIkkNPR+Fj/ShGgaz/vIEOBqB1zm59jdGODXrQtTo4QOzSE7TOk7gH2o09Wsz874D91oF2tVdJQjwutatE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR1101MB2235.namprd11.prod.outlook.com (2603:10b6:4:52::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 11:34:22 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 11:34:22 +0000
From: <Conor.Dooley@microchip.com>
To: <p.zabel@pengutronix.de>
CC: <paul.walmsley@sifive.com>, <Daire.McNamara@microchip.com>,
	<sboyd@kernel.org>, <aou@eecs.berkeley.edu>, <robh+dt@kernel.org>,
	<palmer@dabbelt.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <mturquette@baylibre.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 03/12] reset: add polarfire soc reset support
Thread-Topic: [PATCH v2 03/12] reset: add polarfire soc reset support
Thread-Index: AQHYj5/vPcB4mHXnY0e1IrfO0oJ0YK2EFXqA
Date: Mon, 18 Jul 2022 11:34:22 +0000
Message-ID: <22d3a11b-a603-8406-77ec-51ec038560fc@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
 <20220704121558.2088698-4-conor.dooley@microchip.com>
In-Reply-To: <20220704121558.2088698-4-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27d93aaf-d27f-41a5-8830-08da68b1761b
x-ms-traffictypediagnostic: DM5PR1101MB2235:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bCUamAv5CpKzADuJDoVKe3qDNsttiuxet+9U7c1ukQywANP7N9Cys92s/Uc6ELyuyVUGrxtiDdEPpzeICg+6bH+tQpifEhrxOPK0x5F+NJ0ddIHyIRQLTpljr02A+CtgR8zACx1tT3T7Vytulg1q7a7Xh7pJ5ViJkZidPYDx5WdXf1z1djj2fvJP+bhwcge3Z3AJYq7kbznjoxJRSgvH1j6QMzj4sUjH+7aVFWpLjZ6cURl+2L8gcmLjluhT+wag0uy7amS0in7k5no5nVRicN4caCDIcQYml55f5mGObfUMstsJdJjkHfy5cmrKWQxzlR0Lzh+nlsO3uLEzhpBpNWQiNnGi+Hd4uWn9vcxH3j7xkvRW46yxc3ZY6BE4kfem17ML4rOR2UYZDrWk+RI7qfC8EzFz7AB/wd4a69rU655ZTNg5juaoMJMvSJLRliqQyUJGlU3Ee8i6bomJmKcAXxBdVtCBXu0tkJMTlvP+0cOtPxBAtKpO52FUFJ67TwzWFWVQx8S5YF7z+PEujmd0J537MJ4Ki+DgeGSsvUwc4ZggcGqayxUxOF75ncAn/AXTC+DbxDsmL+/1ghCmj+XyyOEskQhMqxw/2bP/wxI/idd67WUraYnVefPu3bK5oZo3PRGCr+x7Sx+/nnr/bBIkkYoWQ4LhDv4u/SO1ae+oMSAVUbFGai3d6xF6gCmGRRKUtkv+GWgq5c2KPWB7RZ0wi/PC9nqWlaml72bk5XK0XjEx+W6ccSId3NMyB3yOl6gsagsNMRzVdNSgsjBhHjBqDuMgeDDkMr2EqIcdEj2rk/kT1gJj4hgU8mxVSLUKONve4C8Ja+vUS4FovqXraXmNW5ObaRPNdZvg1xZF3dp1WUxDEUBWDymwSXCOm+JuTrIc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(366004)(39860400002)(376002)(83380400001)(2616005)(186003)(38100700002)(6486002)(122000001)(478600001)(6512007)(66946007)(26005)(6506007)(71200400001)(41300700001)(38070700005)(91956017)(53546011)(8936002)(7416002)(2906002)(31686004)(64756008)(5660300002)(36756003)(8676002)(316002)(86362001)(54906003)(31696002)(66476007)(6916009)(66556008)(66446008)(76116006)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjM0dFNNMUFUVmtTZU41T2cvM0VTQWlFb3ZhUDB0TVVKeVpjcFp0RERvekhT?=
 =?utf-8?B?ZnFCSHhWWGE5NUtybXRCa0tuVzBCWXd2UXlIQ2RFMk9rMEdVZ1Q4dzAwdlZu?=
 =?utf-8?B?ZW03eGVhSHV2b3dkQmdON25Ec3F2WEtoODg1bUIwOUtIWHVXZEpWY1luVk9P?=
 =?utf-8?B?bU5wZGp5N0ZSSngxNEhKeUw0YVJZNXVSeFZYL1dkVjk3R3NOdmZOVTAxZmpD?=
 =?utf-8?B?cVF2SjIza3JNYjlqbHB1K2RPSmpMdXRHclB3TGdNMkRHc252WURYbG14MGsx?=
 =?utf-8?B?Y0tJOUVEVE1mVzdYamFqUzF2SXFBM3FiMXM0UzR2bS9hS0Z0V2h6bFJXNjMx?=
 =?utf-8?B?RjBUV25rVk9sSWxPZ0V6aXFlSUo1NnhlOEExOVUxTWtZVDhCV3FGV0NNVWox?=
 =?utf-8?B?V0c1ZW1YWldYbmFDKzlHN0YrV1VZdndKY3VxVGM2ZFFha3Jpbk5CUGgyVzdQ?=
 =?utf-8?B?K1U3aVJCdGlMNzJVSVplV1VpSTJhcVVFRjdSSVFJbzdERW4vaDNTYTRWaVE0?=
 =?utf-8?B?UlJqMXFKbG9xcDdpVHBxUTFLazU0L2hlRzIyeEZPQ1RSYlBXQ2R0RHFDcXBW?=
 =?utf-8?B?NGY0cU84a252VXFPQzZlbDF1dmkveG5IcTBDYTNoSGtIUlRmS3lZd3krZ0Vp?=
 =?utf-8?B?OUI0WXZDeHFZWUd2a1dqQmhSNlNwemw2K0pHZjcwYnVxOGZrU1hXS3lNazJW?=
 =?utf-8?B?SzlXeExPOEpTRmhESjJGL1ZKZlkrS1dMOWxKTDhSSGM4bWI1T2k4OU1IQnFQ?=
 =?utf-8?B?VWU5aFdScGJwa1VGWlN0L1ZKbng4K0k1d2IyeXVuVFJFeHNaS2VuNE9kcElS?=
 =?utf-8?B?enFsaXQ0eWNZYUFQb2trQ0NocjVZSGNxbXA4aDZON1A3djFuZWNMdjRWazho?=
 =?utf-8?B?Wng0aThSOWpPcHE0Z3hsZHAvUHUxRDB4VCthZzVPQWxaZ0dCTmpVZFVzYkRZ?=
 =?utf-8?B?dlhDcWVucTN6cFI0c0ZLRnBCQkFxRDNxbGtCcG5PcHRKeXdUenM4SEhmSmhP?=
 =?utf-8?B?YUV3OHJVV016emI2N0tVaWRwWXV6SlBrcUJqUUNlNXZ0SGpQVVZxSi9pTUZX?=
 =?utf-8?B?Zk5GY2ZTQ0RycGZDQ0VXZ0ZENkJDVjVyaWVGT1hqNWZKUjl5VmRvbjFueC90?=
 =?utf-8?B?ZHRzTzdOY3NNL28xbElnQm1zRTk0ZVk0YzVMZHdhVjllcFg4ZjRvM3M3MnRH?=
 =?utf-8?B?ZjN5d2lnTEtiRkpOckZPR1lGT3B1NEY1aUVkNXhtLzB0TFVyWGpIZ3IwUjhZ?=
 =?utf-8?B?N3JOZXNMays0c1BhaVBDOU50cjRjMnFHZ012UXRlWlpQQnBFUlIvbnZLQTFj?=
 =?utf-8?B?Z0xjTEN4bjZRTzFET1Zac3l2SFlySzA5QzR5Y1l1eC9TdWFvWno2VWxJcmhX?=
 =?utf-8?B?WkdWY0NWTEcvNmQxZjF5ZURBdzMxNzhqakZqWGxmcGo5TXdVTStrQ3RibEZ3?=
 =?utf-8?B?WDY1cmNqTUJWUVlqSmZQWkk3NVlIRzd6RDhaK1lFYVdMRHA2NWdyWWhwZ2pS?=
 =?utf-8?B?SVAzbVRJTVdnV1VPN1pFS1grL1N2NG53QU14RzFraGcvbGFsM0FPaHk3dVhD?=
 =?utf-8?B?TWg4ZFRyNnFKR2NmbzU0Q1BZY1krMkdMV3RBWWFHdWYzWXFWdUEzWHUxWjc4?=
 =?utf-8?B?aWl5MmpQMHh1RHZNc3VmL1dZQkpsaUo0YkFzMUhTZFY3MElzblpRZmthNHo0?=
 =?utf-8?B?RUVwUDRDbmhDVjRCRk9yN0o0eU5raC9qRlo4UVJIYWZOd1I1b2pOZ2UyQWYx?=
 =?utf-8?B?RXdCYXEyekV2cmNoVjBmL29samlRbjFGUDZsMzVrdGI1QStsajAvUFlyblFI?=
 =?utf-8?B?Uk55OGl1STNXRG5ObGl4NGU0TVFoZlpxc05YQUNoWWhDRGR4eUptWWVuSkV6?=
 =?utf-8?B?cWM4ZDdyM3JQekN4bHZ1TUVvai9ySThiWnNJT0pPQWZvVGlUV2lFWWVGa1Ro?=
 =?utf-8?B?dUdFVjJoMWFNU3RVeEdKVXJWU1Z1Slh5ZEpyOGtmU0VUQnZMbUdjQU1iM3VF?=
 =?utf-8?B?ZzRIb1NmNTRHRTFZSkRNTXA2emE5RlFBZ2JQeHpZUDdaVTVMTUZzN3J5OXJB?=
 =?utf-8?B?N0dyeWpnYWdzdkpKMHRwOHh5by9IbHNvZFFEenFCVFQrZ1lTdkhzT0FsQk9h?=
 =?utf-8?Q?kVv1Opsw4oIu22uYcSPZR8Fzm?=
Content-ID: <B49983C680133644A1B8E1E49DD0F0FA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d93aaf-d27f-41a5-8830-08da68b1761b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 11:34:22.6206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W1GikhTXbe7N95yBsyT/HlVVzUFCrP43T4QnADOuLY/ILeDPZPDCll4yRcsDqzTxGoub6q8GJpEIh58EWvrkx7lc++v3D+z/94q+O0e7ow0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_043445_430364_B24D2747 
X-CRM114-Status: GOOD (  26.25  )
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

On 04/07/2022 13:15, Conor Dooley wrote:
> Add support for the resets on Microchip's PolarFire SoC (MPFS).
> Reset control is a single register, wedged in between registers for
> clock control. To fit with existed DT etc, the reset controller is
> created using the aux device framework & set up in the clock driver.

Hey Philipp,
I resolved your comments on V1. Do you have any remaining concerns?
Thanks,
Conor.

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   drivers/reset/Kconfig      |   7 ++
>   drivers/reset/Makefile     |   2 +-
>   drivers/reset/reset-mpfs.c | 157 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 165 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/reset/reset-mpfs.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 93c8d07ee328..edfdc7b2bc5f 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -122,6 +122,13 @@ config RESET_MCHP_SPARX5
>   	help
>   	  This driver supports switch core reset for the Microchip Sparx5 SoC.
>   
> +config RESET_POLARFIRE_SOC
> +	bool "Microchip PolarFire SoC (MPFS) Reset Driver"
> +	depends on AUXILIARY_BUS && MCHP_CLK_MPFS
> +	default MCHP_CLK_MPFS
> +	help
> +	  This driver supports peripheral reset for the Microchip PolarFire SoC
> +
>   config RESET_MESON
>   	tristate "Meson Reset Driver"
>   	depends on ARCH_MESON || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index a80a9c4008a7..5fac3a753858 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_RESET_K210) += reset-k210.o
>   obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>   obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>   obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
> +obj-$(CONFIG_RESET_POLARFIRE_SOC) += reset-mpfs.o
>   obj-$(CONFIG_RESET_MESON) += reset-meson.o
>   obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
>   obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
> @@ -38,4 +39,3 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
>   obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
>   obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
>   obj-$(CONFIG_ARCH_ZYNQMP) += reset-zynqmp.o
> -
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> new file mode 100644
> index 000000000000..1580d1b68d61
> --- /dev/null
> +++ b/drivers/reset/reset-mpfs.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * PolarFire SoC (MPFS) Peripheral Clock Reset Controller
> + *
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries.
> + *
> + */
> +#include <linux/auxiliary_bus.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <dt-bindings/clock/microchip,mpfs-clock.h>
> +#include <soc/microchip/mpfs.h>
> +
> +/*
> + * The ENVM reset is the lowest bit in the register & I am using the CLK_FOO
> + * defines in the dt to make things easier to configure - so this is accounting
> + * for the offset of 3 there.
> + */
> +#define MPFS_PERIPH_OFFSET	CLK_ENVM
> +#define MPFS_NUM_RESETS		30u
> +#define MPFS_SLEEP_MIN_US	100
> +#define MPFS_SLEEP_MAX_US	200
> +
> +/* block concurrent access to the soft reset register */
> +static DEFINE_SPINLOCK(mpfs_reset_lock);
> +
> +/*
> + * Peripheral clock resets
> + */
> +
> +static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +
> +	reg = mpfs_reset_read(rcdev->dev);
> +	reg |= BIT(id);
> +	mpfs_reset_write(rcdev->dev, reg);
> +
> +	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	unsigned long flags;
> +	u32 reg, val;
> +
> +	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +
> +	reg = mpfs_reset_read(rcdev->dev);
> +	val = reg & ~BIT(id);
> +	mpfs_reset_write(rcdev->dev, val);
> +
> +	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	u32 reg = mpfs_reset_read(rcdev->dev);
> +
> +	/*
> +	 * It is safe to return here as MPFS_NUM_RESETS makes sure the sign bit
> +	 * is never hit.
> +	 */
> +	return (reg & BIT(id));
> +}
> +
> +static int mpfs_reset(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	mpfs_assert(rcdev, id);
> +
> +	usleep_range(MPFS_SLEEP_MIN_US, MPFS_SLEEP_MAX_US);
> +
> +	mpfs_deassert(rcdev, id);
> +
> +	return 0;
> +}
> +
> +static const struct reset_control_ops mpfs_reset_ops = {
> +	.reset = mpfs_reset,
> +	.assert = mpfs_assert,
> +	.deassert = mpfs_deassert,
> +	.status = mpfs_status,
> +};
> +
> +static int mpfs_reset_xlate(struct reset_controller_dev *rcdev,
> +			    const struct of_phandle_args *reset_spec)
> +{
> +	unsigned int index = reset_spec->args[0];
> +
> +	/*
> +	 * CLK_RESERVED does not map to a clock, but it does map to a reset,
> +	 * so it has to be accounted for here. It is the reset for the fabric,
> +	 * so if this reset gets called - do not reset it.
> +	 */
> +	if (index == CLK_RESERVED) {
> +		dev_err(rcdev->dev, "Resetting the fabric is not supported\n");
> +		return -EINVAL;
> +	}
> +
> +	if (index < MPFS_PERIPH_OFFSET || index >= (MPFS_PERIPH_OFFSET + rcdev->nr_resets)) {
> +		dev_err(rcdev->dev, "Invalid reset index %u\n", index);
> +		return -EINVAL;
> +	}
> +
> +	return index - MPFS_PERIPH_OFFSET;
> +}
> +
> +static int mpfs_reset_probe(struct auxiliary_device *adev,
> +			    const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct reset_controller_dev *rcdev;
> +
> +	rcdev = devm_kzalloc(dev, sizeof(*rcdev), GFP_KERNEL);
> +	if (!rcdev)
> +		return -ENOMEM;
> +
> +	rcdev->dev = dev;
> +	rcdev->dev->parent = dev->parent;
> +	rcdev->ops = &mpfs_reset_ops;
> +	rcdev->of_node = dev->parent->of_node;
> +	rcdev->of_reset_n_cells = 1;
> +	rcdev->of_xlate = mpfs_reset_xlate;
> +	rcdev->nr_resets = MPFS_NUM_RESETS;
> +
> +	return devm_reset_controller_register(dev, rcdev);
> +}
> +
> +static const struct auxiliary_device_id mpfs_reset_ids[] = {
> +	{
> +		.name = "clk_mpfs.reset-mpfs",
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
> +
> +static struct auxiliary_driver mpfs_reset_driver = {
> +	.probe		= mpfs_reset_probe,
> +	.id_table	= mpfs_reset_ids,
> +};
> +
> +module_auxiliary_driver(mpfs_reset_driver);
> +
> +MODULE_DESCRIPTION("Microchip PolarFire SoC Reset Driver");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(MCHP_CLK_MPFS);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
