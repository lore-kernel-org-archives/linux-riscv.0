Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9F0C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 20:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isacp3lsMBhliNs/IOTKKvwdOUAzLPRwl6Lf+fet0iY=; b=xRHvpaiz1LwPwD
	EOGZxqUR21q9Nhav+iDNN3VrFcfKyoXaB1cRgUChZ3w2KKMtqGKIg07zWz73um8BXdFLrbl02bkyo
	4S38v8GcV5ojyeZiz/dbTs0yVBtFCg69qGxlTkUx//+VrrJlKdHj++JPJBzq4YH0MH0tEBKbni9Hc
	iulHtAy3Z/rHHlXHRfhjzMbC+FilE2MEk2Ivvm+E5+ImmWcFzFwUqT8bcCjkBYymADF8wjcaghhaw
	bglFl9pOh5/7/n/UlU1WooXCXHwmWBzJtJuLoVM0xC0R4hro+fbbDRFhZ6ZvLy/906r1ZJDlUGXvB
	bQEbFrm4vdBAfemyeRHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNgLS-004VlT-6f; Mon, 15 Aug 2022 20:05:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNgLO-004Vei-Kz
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 20:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660593950; x=1692129950;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jZ/JKSqfF8dKrtx+ZgiNmxIkL2DGKSS8qAwIiQmHkmo=;
  b=uXqhjG6Z5t38Z0ODxLxKqIRrvdkO6JNWpRybS1na76508qaK1DvR6vUM
   yzRv0Jz2skUooPwyYaBI2XtU/L/0jjCzS1O/wiw6WIaSEUs5wcRMbCg8W
   di+eUhOKup4PM3dDeC4VqjN/gD6hvegNrvkr7lNWAumC8mTAJ4wvGnItz
   0hHmd/r+5GUk/KWIjK59BBuvWUAQuB4IOE6+4FVBGv7SvJFxt1Mf7QeuC
   v+5WpDLE6MNk228OZpGuhEk9dM8AR4mGZIEiFYEfuQqwEFbdQxcdw0o5B
   iyX6WLiNMyDeYZ/TswkWWflkSq+Xr6hEZXnT4oZAszzyCkIpRb+yaVHLy
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; 
   d="scan'208";a="169382920"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 13:05:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 13:05:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 15 Aug 2022 13:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyZZHOwQcPAYROLATQkuQlIbT9orMcP5hpCG6C3N9XRqrVm7P5dADZHd/9njpcXWXx/3/sa0En2An8oO7G+a79PmquRaDYAyFNDzVINHjpVcLkyT8dQ63uN/Ayc4oi9O/t4Nkecg/45O83Zi+1SrLhwAY0SNNf5fILu0hOjGugBKAjlFIGWOvqVnW1hOkuV8es5Gn/R6CQ6AuirmJK61wt7GqPLx2pPXQxvGht8ydpFP4ZgV4oQlBlmz8NwnlclCtRcQBNxgiCUr9f0l4K7+CNcF3vr7C7RkuFqDqNYPBSAhdmRy1ihi2xoExi4mu4GZehQFxWBei481nAANp3QeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZ/JKSqfF8dKrtx+ZgiNmxIkL2DGKSS8qAwIiQmHkmo=;
 b=BNSKAWFSiLEwIA0eF2M15mCoiqlNMIW2DYxQVYnO9ImmUB1A1HrAFn/7LVYYoN5X6sy8+HmLjKH2yioW215IpbnH9qhDWnhue1FiNU4FuKejhzT8wZaP+c2W0pyd69po+qY2AHfnN0D0FW3ziG/fiqdQIZZNrXfok8U3cTgob9+oqzW4410X0W57nRPKe2+yZcCRoY7nX6eMJpUwyyV2WK2sDPwMhjPYpvmuW9scIVI+9c1anacyv0DlEs+88YQ0VtzvPFpx6OhYx8UudcYxyCvPW7HdrbSuUo1KGM6aFPKcFPxDyNTvEvQeaQs8QRgsqsUw6aWjCCu+KZtre93Phw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ/JKSqfF8dKrtx+ZgiNmxIkL2DGKSS8qAwIiQmHkmo=;
 b=RbJX9a8s2h8xlcMXvPH4TbSe82wtTjLm4scYEHpAYP3Js3WkBcR8Grg5oPvZs0/OlDj/b3EZOuBlRsOCvREXnfYeTdQKxvtyFEHApj1kfisWqJJmkSnyoOztVXygJRZzet3xwy4befcFctgSLqBiHRjLeobOKWuujPtxzGGaHis=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 20:05:41 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 20:05:41 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.csengg@gmail.com>, <Conor.Dooley@microchip.com>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <geert+renesas@glider.be>,
	<anup@brainfault.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 4/8] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC
 kconfig option
Thread-Topic: [PATCH v2 4/8] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC
 kconfig option
Thread-Index: AQHYsLoPyzdSi5rmak2RSuYw1tRBkK2wU8sAgAANYYCAAAIoAA==
Date: Mon, 15 Aug 2022 20:05:41 +0000
Message-ID: <cb3eb397-cc27-c8f2-4194-5c401f6dd690@microchip.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <d9d0deef-92e1-05b4-a195-d2ca03801129@microchip.com>
 <CA+V-a8utT6UE=rc62LPE=UoU0DTJ2dDt7KO9UJ1vAG9r80E2pg@mail.gmail.com>
In-Reply-To: <CA+V-a8utT6UE=rc62LPE=UoU0DTJ2dDt7KO9UJ1vAG9r80E2pg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c207cc33-7c63-4b7f-d258-08da7ef98792
x-ms-traffictypediagnostic: CO1PR11MB4961:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 16anoyz8Yk3rd1jly5EIyEKNRpRgWW9EaQpoADClw5rRROeJ3TIyYZ0QjF4UtjZZlklFh/i440bWbpufkdV3ohH+uu0WhXczja0J7eKgW72YBtsf2v3WMClMXdNxnVxz5ZDZegtU9JOcS7/Cjbkh9dgLJxyFuVhQln3q1a0gGGtB63BQaFfr/nZLrTaewCjBWEX5H3bhTziUpdxQrqFLYh82VEv6EwoVLius3KHdNCHUdePmycLw8dY/YKCFLo7XZRHuWGopnh3Qnm2a2yq8gxQ8CGdMH68RZPY/lm+PiD1wCpalw4fFmSOTVrQErjVFv68cXI6q205IXggPPdAmd+CZOEfDdUIafchZksq4YxRcQB+GBhj4ryaGVxRo1QddGfnAxXks8pa35ur+L37SKtiUIhdO0maJUQfKtau/XsG77h2us2i0M35enUGFUBvkE2U0XvJHhnJAfqcRtQL8/7lsCN3kMehj1HVsMp3Dv5Sl2N+uHJim317l6ftytpg9NTrU9nTEXO2NOYi5h6nZckJ2tWOwZmkWqIaFIGd4YwetmbGGQvzUAunAH90DItsLmK3MEjud54NPXuvK3i+VAhwhORko+lQJiD5X1lo5MvWvfNzLBRpc2gQOJyvoNOsNOONIH5SMyBq6b7O36e0GKuYYb98/GwQPoW6Ty9TF49u+FCueDjngFClpEKYjpP7NGZR7dT9npR5AwhldHnlXVaj4A4DebkgGZYa16rlTtPwF+MGqjL7IRNPM9Hq83eO22KGBX5rgnGaDM/OfgpeSGPpglXbRoLIzj5dMx2nAYALLu6etO4V0Lkv9jZO+eRlRrAElkykSjTFqEFPkM7RpJfVKQ0tY2FRfqnWGpvyQcnPN7zwUV9363smzPAwJ8SDV9s2oPgNcNOss8nRrg9+FLQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(366004)(376002)(346002)(110136005)(54906003)(5660300002)(41300700001)(7416002)(91956017)(76116006)(2906002)(4326008)(66476007)(6506007)(66446008)(8676002)(26005)(316002)(36756003)(64756008)(53546011)(6512007)(8936002)(66556008)(66946007)(86362001)(31686004)(31696002)(38070700005)(83380400001)(186003)(2616005)(122000001)(38100700002)(6486002)(478600001)(71200400001)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZThEMG93SVBTVmRrQUgwSmphTGcxNWJ6QVpoRTRuWGhoeFlEN1RSVVE4ak9F?=
 =?utf-8?B?U01LMkdwZ0dBRmphMjVkeDBhaytxRUtXbUg3c0xUdk9JUXM5aDAxWHNuZXYr?=
 =?utf-8?B?OUlzODNlVGx1d3lmS1o5Qm5VSEJrM2pUL2xFZ1VNUWZ0V0tLVVdZSC90MENh?=
 =?utf-8?B?Q1BGYkJTN2pCeHFwSjgxK05CSlVVZ2IzMWVjZkxQUWlMZGRJWllKQ0lFemFU?=
 =?utf-8?B?Q0p2QmdpMXNodW9MY0lpN2w5MWwrWmd3WWU3QisxNEs3a0k2ME1Ud0g5T2tE?=
 =?utf-8?B?Mnl2dnBoNU5YSWNCUG9qQUhXelkyQmhYaHVna1Bod3RyREtwdVoxUFptZFhT?=
 =?utf-8?B?QmV2TFhHS3dvc29aSVZ5c1krTnJGd2hVMTZqdHY1M0RYcCt0TnVUMUJWL1Rz?=
 =?utf-8?B?Z3FHM0k4R2VGY3BJYlVRbWYvNFhHU3g4cDFTZk41cUw5RzEyc1A5THFPWDFw?=
 =?utf-8?B?dHh3WkdJalZ6OXBhSnNmRVZmNlB5SS9reERVOFF3L2RUUmM2bUsyYmZMdVY5?=
 =?utf-8?B?VHVoTk90bXNlUzVKWVFFL3hNdWFMMjFVSXJGWFh1d1dLM3kzUTNsMVBlUWRi?=
 =?utf-8?B?WHdMS2x1NzFEZk5DT213T1dlcE9EUEtoem9hTyt1UGhuVEt5SFN6OWUxcHV6?=
 =?utf-8?B?NnhRRFpaWWFjZEVFcWcvSTI0WVk5b1lXZHJpRWkyQzJ2Y3owYlNFVU5pTGdJ?=
 =?utf-8?B?aHRBZFFqRjJWMTZsYnAzak41WmEreU1BZXlTSUZNdWo5VW5FOFBxT1RZSmM2?=
 =?utf-8?B?aWZtR3F6NWFhcEQrSjdvMnBNUExZb2lsYktKeUYraFM0VThMbXFjYjJQQ0c1?=
 =?utf-8?B?azZCeGtVTkZocGQ0bzFYVER2MG83cHQ4M2Q1cktKMzNMWjNVNHJFTnJmUXFN?=
 =?utf-8?B?K3MzUXFFeHdLaXJXWWdoL2pIRmV1V2pTTG01NEd3a0dFOVlkN0hUN3Z1US9M?=
 =?utf-8?B?cGgwcStRd1FlL3RPZkQ1bWpNeXN4OGtCdzd2Y3pqbnhBL1A1LytrT3l1VjNW?=
 =?utf-8?B?VU9SbllhQTRjV3Z5RG1pN3RpSGNMK254Yld0Q083enFrYmFGbmlFRnNtYU5V?=
 =?utf-8?B?SVhONzB4bHhsTFRaZExkQlJBR3kyMEQ5ajViNWRJR0dRdjZVblo4dG10bWlR?=
 =?utf-8?B?bVV3ajJhckJPcldrS3p6UWt3bUhjWXJXREtPbjNvekVKSXpNNGJBMEhHZWJP?=
 =?utf-8?B?M2ljQXlZT2ZmdnV5bUdIU0FWVzIvUGNPYVhpTHU2Szg1b3kvNXR2cWI5WjlV?=
 =?utf-8?B?bWtqb210R1NxYkJoVW04N1cwckE5WlNYY0FuWFlVbDJtbVY5WVZvOHFwek5j?=
 =?utf-8?B?ejBrL0IwMXRwSUZocjRxdzlsTktSS0d5bmVHUTk2NlRkQU53WVlETXdQMXB0?=
 =?utf-8?B?N3BPM0FXT2tmSFlYQnJNdDZQZVFtdk03MFNLU09GSWJDNytocmtFTURMVXRW?=
 =?utf-8?B?dmRXWFBETjcxQjlXUGROOTE0Qi9pMHlJUGJuU25QdzBqb04zZE1EMERLSUlp?=
 =?utf-8?B?UWZ5OVhUdzZhQVFGelVUNUlrYnMwSEplZ0R5TWJMdFZwNmlhWTZ3ZXhGU2E3?=
 =?utf-8?B?T3ZxaWJOOWhtUmZCWXFmbEZhdnMxV1JzaFJmVkN2MUt4TmJPdlV3RkMyWGpx?=
 =?utf-8?B?QVl1R0NrdFVnY0RHOTNLMFllK1JJYnBWeXBTcTd5TFVxZmxLKzlRTFNTb2Vt?=
 =?utf-8?B?dEZZU0M4SjJ6dWgrVWNSbHUxRytKS2JEdXZjQWNNU21GUGpMaUFkUERpcGpa?=
 =?utf-8?B?Yys0ZnhTZXNLaHBaQ1JlYXVQeTVaNTU4dVZDbWp3eWtDU2VLV21RdWtqKzRV?=
 =?utf-8?B?WlJHQitlYWdMSWZidUpJY3ZHRmlJTkYrQmtwNFF5akxDNmp1RGwza205aWF2?=
 =?utf-8?B?MkdnUDJGbDMvWWMwQitxOTB6V1hJcTA0TnFPbzdGSExEZzFxZmR2TkwzTVE1?=
 =?utf-8?B?UlpkdzNDL285aHZhNWdKRTZLbEIzS3g2TGtvNU83dGxjMG1Ub0JBM1hqYUNZ?=
 =?utf-8?B?NjdRb0E1MklGOU5DMWoyQWZabmd5S095TVJGRlhBMHBXTVhtd3kwZzNrWSty?=
 =?utf-8?B?djc5bWJOK3UwVXNTMm03ZXFiTlU2VllPcXdvdE44N1Q0cmdCL0R4OGV1L3d3?=
 =?utf-8?Q?mYPuUyPu1nd7XocupKefKDM2z?=
Content-ID: <47A72B4C2681A741A806A1261EAABE6F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c207cc33-7c63-4b7f-d258-08da7ef98792
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 20:05:41.2380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fi5ao9x7pbuPGpll31U45fr3k/PMt6X3PPK1AENZyC8Cpvv/q9pnXl3ywukIfubdD74pazQtnj4aUkm+xn0azaMdkkXNWgNawt2BU8t/gq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_130550_840254_D8C6B3DF 
X-CRM114-Status: GOOD (  29.92  )
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

On 15/08/2022 20:57, Lad, Prabhakar wrote:
> Hi Conor,
> 
> Thank you for the review.
> 
> On Mon, Aug 15, 2022 at 8:10 PM <Conor.Dooley@microchip.com> wrote:
>>
>> On 15/08/2022 16:14, Lad Prabhakar wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Introduce SOC_RENESAS_RZFIVE config option to enable Renesas RZ/Five
>>> (R9A07G043) SoC, along side also add ARCH_RENESAS config option as most
>>> of the Renesas drivers depend on this config option.
>>
>> Hey Lad,
>>
>> I think I said something similar on v1, but I said it again
>> to Samuel today so I may as well repost here too:
>> "I think this and patch 12/12 with the defconfig changes should be
> patch 8/8.

It was a direct copy paste, hence the quotes ;)
Your patch 8/8 lines up with the current symbols while Samuel's
doesn't.

> 
> 
>> deferred until post LPC (which still leaves plenty of time for
>> making the 6.1 merge window). We already have like 4 different
>> approaches between the existing SOC_FOO symbols & two more when
>> D1 stuff and the Renesas stuff is considered.
>>
>> Plan is to decide at LPC on one approach for what to do with
>> Kconfig.socs & to me it seems like a good idea to do what's being
>> done here - it's likely that further arm vendors will move and
>> keeping the common symbols makes a lot of sense to me..."
>>
> Sure not a problem. But delaying patch 4 and 8 will make RZ/Five SoC
> not buildable. Is that OK?

No no, I prob just did a bad job of explaining. I meant more
along the lines of "I don't think this is the right approach
but I will defer reviewing until after LPC, when we have picked
one approach to use for everyone". I'm sorry, poor choice of
words maybe. I didn't mean drop these patches so that it does
not build, keeping it buildable until then so that we can all
test/review is the way to go. Not your fault we've done 4 different
things so far!

Hopefully that makes a bit more sense?

> 
>> Also, for the sake of my OCD could you pick either riscv or
>> RISC-V and use it for the whole series? Pedantic I guess, but
>> /shrug
>>
> Sorry did you mean I add riscv/RISC-V in the subject?

You have some patches with RISC-V and some with riscv.
What I meant was use one of the two for the whole series.
Thanks,
Conor.

> 
> Cheers,
> Prabhakar
> 
> 
>> Thanks,
>> Conor.
>>
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>> v1->v2
>>> * No Change
>>> ---
>>>  arch/riscv/Kconfig.socs | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>> index 69774bb362d6..91b7f38b77a8 100644
>>> --- a/arch/riscv/Kconfig.socs
>>> +++ b/arch/riscv/Kconfig.socs
>>> @@ -80,4 +80,18 @@ config SOC_CANAAN_K210_DTB_SOURCE
>>>
>>>  endif # SOC_CANAAN
>>>
>>> +config ARCH_RENESAS
>>> +       bool
>>> +       select GPIOLIB
>>> +       select PINCTRL
>>> +       select SOC_BUS
>>> +
>>> +config SOC_RENESAS_RZFIVE
>>> +       bool "Renesas RZ/Five SoC"
>>> +       select ARCH_R9A07G043
>>> +       select ARCH_RENESAS
>>> +       select RESET_CONTROLLER
>>> +       help
>>> +         This enables support for Renesas RZ/Five SoC.
>>> +
>>>  endmenu # "SoC selection"
>>> --
>>> 2.25.1
>>>
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
