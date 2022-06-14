Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653A2C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 07:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYPzewz6Okg6yV2pjlzHHyUDL+UnAuwDtba2K+TnvPE=; b=0mcbB4V7GVGx9m
	L9459qgZ5CmVRjK5gkSQYD0ANVqtXvRwOT0uxZijhrGPi/AQmZWNhNQyaI/les21tNoDaJ5Wpus06
	hFQArDVaKdBZVfkB5VCE/RSZSyGLoy0NL78yoDYdIXbhrngHY/ZZuxP66G522KXbAnqnLTGTDkcR/
	JwtlgTrkJcIqeiUtPzDp7XXG07OghsQEij+lFQ0bWETjpCiq8nwqNSuj0x9aT8eBIKZaxCpH5vCx8
	So28Hvn2kxQe1fQVS19XO+Z1P8joStTsvrlW3YgjrSXcikp199EdnceeDUiwDl5ix64DOKwshbQw6
	C2Nz8QVSirURCxFh/ZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o114G-007wxm-F5; Tue, 14 Jun 2022 07:34:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o114C-007wwE-7N
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 07:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655192065; x=1686728065;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YQlvglWZ55hdRksxKTRnOhH/sa/Y+kfKWv2Uf4JfexQ=;
  b=i7rvEavXJM4eKobk3gzm5KCbQVapgKH9oWQCpFb0P4CFmoN5sEPdkvqp
   +kLwwoz/2h0T9Otnpdo2HR1sn23175S+++Kc8SRdLYaEflIvw5/e0xoy8
   x3XhhdAfF+9TLq+z401peiXF3/Qs7ZMCeM3FablwsFldpv1ELbESFqVbK
   u5ayTbiH72nvAwQtjxyk6w1jEq6+Qjv5q74s32BL3T+6J864pMHhZzeOt
   9xd9TLHn9N6bSPxea/eM+mhSNjowau6zs26NwzzW673a52f2kHFyQmqQ6
   FvKTH5+oKYRnCCjsq+2WHZdlsRUssFlY+RjTafeuml1EJvuBXVXPAf7GF
   A==;
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="168007932"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2022 00:34:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 14 Jun 2022 00:34:23 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 14 Jun 2022 00:34:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGyWVMurBRRLhXPynXVU48HAMjc2tBoK18T27Fad6WsI+TF5bljAAcwi8/em/+GGjpCqPw2ZGfnFruPPCZMh/T3p5avoMeg0mN01qTalS08ufOFvEjgu7TpyVNuFqBZnY7QaC0y64Z9ZiukfyQfjd+XKPl6YIQ3YeewNX0cnVGnvLAqogx/9mwfnVwhICmTcqdO+tvp6EHwivz46CZBBQ1diT8JuXmxc+zjEK/b0soE4+b36xJqpn2tlaJsLWalMy8m1GNUOqGaW/eUMA4fAKKxvi0wUjoM+Vxa07/8YBJhygK/Hw1gj7p99fWC35nbUTC9gieNpHxMfKaPNHb9m3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQlvglWZ55hdRksxKTRnOhH/sa/Y+kfKWv2Uf4JfexQ=;
 b=CRu9SBSzpRHLxCooBhQlQ+ixbfeUB4rgF0GQKr336sn4P8cS88+B/7x2fY+izF9WDzBoQKUjweKpEBw7n+AvAlih/kBze6Ic1KditIh8400e8FiFmdzH7nGjJD8NaRf4VHcMoVrwa98TsrD4v5zYnf9PO2lo91rROvynyULXL8cij27HfM1yzaxZ1AjgU3/FKNPP082icdPNth1yf82ThDv1PfpBFR5f11BvLPcF4fsvwJBioWQQcYsuSnrssTTFvWn37hi4J2TfczOb99J72ozkBKuL1PlMszTawuNi4dNeHk3e4nVYu//qWR3qVAmeJokGAnXzKepzIHIBy+sO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQlvglWZ55hdRksxKTRnOhH/sa/Y+kfKWv2Uf4JfexQ=;
 b=V3/SP0Gnx782eNMrR4bMItGSsIjtnNSsmku8Sdn3aCiv0Zmr1dr8HbgkyqXUgQ3oUVz/bhyWLXwN5nC6H7i7ULE1uXCNxt0oIHfwLQ/nZHtelr6FEX3J3N+XzxwqwwG5cHh23Y50paEOwtIRRYGGj846dg6GYyqKIRgrzEU31zc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1976.namprd11.prod.outlook.com (2603:10b6:903:120::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Tue, 14 Jun
 2022 07:34:13 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 07:34:12 +0000
From: <Conor.Dooley@microchip.com>
To: <broonie@kernel.org>
CC: <Daire.McNamara@microchip.com>, <Lewis.Hanly@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH] spi: microchip-core: fix potentially incorrect return
 from probe
Thread-Topic: [PATCH] spi: microchip-core: fix potentially incorrect return
 from probe
Thread-Index: AQHYf7xzEGi/kb1sIU6g7Gbwta1Ds61OgmEA
Date: Tue, 14 Jun 2022 07:34:12 +0000
Message-ID: <cdc59a04-20cb-0462-830b-2f16e69d3125@microchip.com>
References: <20220614065809.1969177-1-conor.dooley@microchip.com>
In-Reply-To: <20220614065809.1969177-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb8010e4-d5eb-46ac-99b0-08da4dd84732
x-ms-traffictypediagnostic: CY4PR11MB1976:EE_
x-microsoft-antispam-prvs: <CY4PR11MB19767AE2AAB5C2579D26E7F098AA9@CY4PR11MB1976.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wd0vNOhdS/kS1RzqVmKgFZgiSE/DWO7jsAWuyVXuldDWKYo/xTCtAFUEcXg1g2ymI+vebyjQIumvem2iDsRg7xUljnXiurrnTxGLxtTz0Fl2bA692D5AOA7AMLd0zW622dK8vxU/jPoigxw2f1EquLxDbwA0BxYYR/hH2I4IXNMmo2CDY4St9ITGhPzw1OtO46xR0axpq50pVewMl2h1XYi105izZt+3BQvZdO+HehkwAba9X0PFFDbhy6gPu1RFWN4fX9CReS1kEHAPMWLVI0mWgWTzhKcRDFz7MIRhqOZYcMbB9Te9qwsxuwo7Q0n3dGczr2b1QLi57dKPqZRSijPDsmishu6qbhCqadXVhtezAf35rhmd+SwX6qhHWT3jK8z7xvbhKISQojKo2moh0c6UrZ158xwhKkrsrS3z9GaP4P6w7HWGD7NL+vSN/fvZ/rFbKasa6BnmD3EYjZxPmtjXUeaybXC/r7bDj3GkBri+5bvJUujYDT1eiAuo+xNkaiX3An4T5kiMd7kf6HVePaP24owS/Z1gDQ+rqWJsPfzECW4sqzi3vaeMsDx3IoM+8ChXg2OssY9HrJQZ1Lh+bmmvh2p9Ex4Kr0z9x6YrgWlgE9iCdxyJRKxELkK9l8bgxgfE/uUpArJQg85HoOfBpbj50gzADeCCJEquyOxPtPczShyj9sXWCMKRtgzQ4XLv3saXFHbvPtd5yMNG47d8LLXQnJ12GoNTBcl3JBiqV1PLyOy2T9yvv7c8ZE1KeLN+hZZnKP+F9/TecxKKlSx8Jdbx0a4SDBzoMnMkb94Xa23PTrnGa+/sMIVM0qeP1DdV+vqlBqPakYR/RrEs6eRLN6ZXtj/dxHjcvv86VJpaXTE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(64756008)(66556008)(186003)(8676002)(66446008)(66946007)(4326008)(66476007)(38070700005)(76116006)(71200400001)(5660300002)(36756003)(53546011)(2616005)(91956017)(83380400001)(54906003)(6916009)(6512007)(6506007)(31686004)(86362001)(966005)(38100700002)(2906002)(6486002)(31696002)(122000001)(8936002)(316002)(508600001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ti9YVUNvcDRDTUNXNk9mbjVFWmVoUGpjSlp2bCtNd3JMYUw5TVlPbGNobEhC?=
 =?utf-8?B?UTFuQTJTbHFKQUl6TmZzZkZLQUtVTjd0eE5NdHErbzhEMHM2ayswYmM1dEgr?=
 =?utf-8?B?Y1pCQi9XUldJQjVMUXA4TlpmdFhoMU03NkVJVWc5VFlhV1pyZVlhZ1NTbk8w?=
 =?utf-8?B?U1VYNEhVQ2NqM01zRWlzV3IvTURkNG56R2ZsbXZJM2ZrdHoyV0QzaGgwcFVB?=
 =?utf-8?B?ZjBXdTVQaFdmVGN4djYzU1pZVWdhK3NSTTZYQ2ZnRGZGQ01lOVdMSk82UjY1?=
 =?utf-8?B?RndydDN2aEJLQ0NwQVQ3S3l3dkFVV0dWYXJqQVkwK1BBbWVOWmJQVUt1dHhn?=
 =?utf-8?B?ZUlmcXliOHNONUhzTzhLTVRkd2Z0NkhTKzQ2SENadENJaGxXTkZyOVl4TmI2?=
 =?utf-8?B?SDArZDJSL2lTQ2NpN1orTHJDc1RTL3c2N3dxS3VYTXVBanhqaVZEWXdDR2py?=
 =?utf-8?B?TnVHbXBjZHJ5VDFiaUVIby9FSXNQdWxlVUs2N1YzWkdjOHFvK0d3THVVRkxy?=
 =?utf-8?B?TEI3SWEvdTBZWkZ5NDFWUldtTzNBaGZsdEY2NHBWM1pIcFh2SFd5ZzZEWlAv?=
 =?utf-8?B?OTRKaERnaldndTZtajhLTUE4Z1E1NXVrQ1lHa2QrT0FvdEo3akFUU2FxZXZw?=
 =?utf-8?B?VVRMTHBLK0pvdkRRTWNlUFZtL3Q3Z0taa1dWcmwzYlBDZlFGSWRhVDdEbDBW?=
 =?utf-8?B?TklrclpPR1JTU3pmVTIyb1BVaWh2VnF5eWtMeDFXa1lWUFd0bWk3R0hkWTJa?=
 =?utf-8?B?a0YwZWhEYWFYeloyblRSNGFyVEJ6ajAyRXZNdDRQM2hSY0d4WWNmb0RZWmhW?=
 =?utf-8?B?Q0tkWC9aNm5vMkdIei9uQURsUFBWL2lBT2lKYlJ0czdtZFRUdElaWFZheWZt?=
 =?utf-8?B?azRlT3FUKzVTMmg2SlVZV0syYTUwQVJpLzVkVW1pU3BxL0JLaWdEaWZNZGhW?=
 =?utf-8?B?dnVWeDhkUXNvL0t5ZGRiRGx6OWNLMS9SdHRPSDVoaDh1NTN4eDJkK2xYUm8y?=
 =?utf-8?B?Qk5GTUJGUDlwRGorMEpua0FjUFBWRlNOV3QvOGVYV0tja0pycERBYmc1SzZi?=
 =?utf-8?B?M0FydXRMNnQ1WGZEcTZuTm1qd2tiYVhjdG1OSzlEdHpOWDFLZzE4anVmbHE1?=
 =?utf-8?B?bkhIb1lHMDFMOTRBamJNZnNpS1NFNTlVQlFhQ0dYczhTdTZtZWF4L0ViejFo?=
 =?utf-8?B?VGErTTFSMDIyMnNudjBDcHFwZmYrK1ZwdXFCdUZGMlZtT0RzcnV4WlUzbVFt?=
 =?utf-8?B?VGdUR2ZscE4rUHJVbkpTc3dEb3JPaFhhU2VRNXlhRTEzMzhBcTlOWm91VmdE?=
 =?utf-8?B?bUVuNmpqQ3pkRUpPRkRGMHlpM1hKL1pPbDY2VldzNGZZSTBZeU8wbUNrNGw5?=
 =?utf-8?B?c2htVzFUS01TNjlFOTJOZHcvVkxGcGczSnQyaUFrdW8vZnB1aDJBcEROaHNL?=
 =?utf-8?B?ekQyaU1nRWtkN2hHOHVYNmorTXo1Ni9QYSs3dlZGbVlnRHQyMHg2MVVYOSs5?=
 =?utf-8?B?dWlmNnFkYjJDYmJWZkFlZnZIam9jNmUxOFIwRnd2RlhZYlMzZDJpcHA5eXI4?=
 =?utf-8?B?RFZRU2dFSE5wTnQ2OFNGUEFLZDBVaHdJRlVkM3VqM1hkTlVFZ0JKQi8rQXk4?=
 =?utf-8?B?UnU1WmZBNnU5YkRzSVJGTVkvSVN5ZGF0WUFZMDAxc1I4TVlybUhIcVlrNktp?=
 =?utf-8?B?SWlWL01lbCt2YnhFbTk3UlB4Nmg5WFU3YVo1RUsxL1IvcGdES24yRUVwQTBs?=
 =?utf-8?B?cHdwR2RadFk1d3RxYlBtbk9oWTFSY09QdEFNaWxaY0dYTFUvMFFOcWF1Smp5?=
 =?utf-8?B?UHVtdUlMZDFtY2dFcVgyam9TMDFvZ3NPNzUxQnB0ZnlwUTlRSHNZalp4WkhN?=
 =?utf-8?B?UXUvcXZMNWxQdFZ4ZWt1cmc2bXZXY0xmM2J2c2diZnJydEZLdUc4aVZCWjlN?=
 =?utf-8?B?aWRGRklyN3RkRXpmdUhmM0hGWmxCcVY2cTVWR1BGR1lkcUdIOUMvbnNtbkw4?=
 =?utf-8?B?U3JyR1Z1QzExSEEzTFR5SlY4QXFSOHV3WjNML1NaY1BxNmhsS0ZXVmhXTUhU?=
 =?utf-8?B?Y2FXbDZyRUpaeDZqRGxXUEx2bCtsNkI1Z2tKUFZXZWJLSUxHYmN1cUlnYnRr?=
 =?utf-8?B?QURsd29nckJlcllNVWlqbnBqaXhVWDQyODRsN2YrNm4zTDNqZlo5d1VlSHpL?=
 =?utf-8?B?WTJoRDFaZW9JRDVEWXpUanh6QXdlTFJkSkZjZ001YUh5TE5ZeVpnREhiUUNI?=
 =?utf-8?B?UENOZEw2WncwUTIxNDh5ZVNLa0VKd1lsRlZmVFB1ZjA4V0V4RDI3SlBZdmxR?=
 =?utf-8?B?QWRKOFJpVGdRWXZ1Mi9TamlxMzlqaG5XV0NPSndPYytDYnpoMVhWSXlkZWN2?=
 =?utf-8?Q?tJPvzBGzj2ncdBW4=3D?=
Content-ID: <0086220AF6DE7D42B56174DBA1CCCEC4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8010e4-d5eb-46ac-99b0-08da4dd84732
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 07:34:12.8807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UTplL1i+xf/90adYXuVukPRtxUiaqmjhNPyHm/RT2k9ml/o2x+3hGqnW6w+bXPefMG7DRaR48YNE7KzbJyovSJVlusQbmOqYsjI4+vPQCA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_003424_341070_E33F66E7 
X-CRM114-Status: GOOD (  16.43  )
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

On 14/06/2022 07:58, Conor Dooley wrote:
> If platform_get_irqi() returns 0, the error case will be triggered but
> probe() will return 0 rather than an error. Ape the other drivers using
> this pattern and return -ENXIO.
> 
> Reported-by: Yang Li <yang.lee@linux.alibaba.com>
> Link: https://lore.kernel.org/linux-spi/20220609055533.95866-2-yang.lee@linux.alibaba.com/

Woops, forgot this one:
Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers")

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   drivers/spi/spi-microchip-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
> index 5b22a1395554..856a68fd8e9f 100644
> --- a/drivers/spi/spi-microchip-core.c
> +++ b/drivers/spi/spi-microchip-core.c
> @@ -541,7 +541,7 @@ static int mchp_corespi_probe(struct platform_device *pdev)
>   	spi->irq = platform_get_irq(pdev, 0);
>   	if (spi->irq <= 0) {
>   		dev_err(&pdev->dev, "invalid IRQ %d for SPI controller\n", spi->irq);
> -		ret = spi->irq;
> +		ret = -ENXIO;
>   		goto error_release_master;
>   	}
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
