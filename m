Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2765C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJDFxl3+iY/j6822bkBIhkJXcHccn5wW4uFfq0tVSwM=; b=zx4D8ckeegK+Jw
	gstpxvn5qAz9SvTUpxpSd+8Ddm/hwQ+EUWbvhr2MoEOrNUPeCR4oVfjQmQVczGyfeULyrz6YpyXD7
	63yEiLQc7kuVfFvoVglcQ1Xqr/bowZKBUnso7VVlu9r3x5Xb2SVcBqfoC6aztF5/k99nmtrNDXXOy
	GvMOOGINEbxPShAQ3emzcZ/e+6cLk3EVU9fYt645XcP8cjmkU9FqntAIywr6H99PmDnu+tfCjDCwa
	LklEaeL9hwlt8T+Q8sXveVBg0fKTR9jPOw/GbstZR0Ur1mFfV6oHPdhT1LxKmg++nhSCRyaG5W4rR
	s8/FzEAaOVbmYx05tSHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8I8W-008JFx-35; Fri, 14 Jan 2022 08:40:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8I8R-008JBC-IC
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 08:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1642149635; x=1673685635;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gE8w0KJvgENVrosTeWOv0hZmcigSEYLvqTl9AWqwEUo=;
 b=BxkXhMfuNnxusa9dca8UX1I9MlK0TXU9dlyJzp3Qu0R0IfUakQGiWuPy
 qaS4wwnbQAntbNJuASo/qqudpMva4kNuQeWpC2ogcaH+MCnTchdFJwP3l
 AjYEN0OPeS+u/zYydohYG4eSxQwAhrtlNzjLA7L9bQ9ib/1UI3WjmrxCK
 jQfuphFP3G6LJPbO/O3uoN6McD4YoK16hvVDwMTVLRVR0quhcIMOhgbEQ
 69NKW9+93ghq7eucg8bRjJ2W1Bxc5GWlXJBNs8fpyWOA4FFBlPNHJBdKQ
 /8Egl8ovj4ruTcKxnVQ9xC7o65lmCALfM7kRO2+KPgXQ0ObnAFwed7vEp A==;
IronPort-SDR: VajrTD0xpRRBLY8VQpvhY/oQ9SG1rfqtj+UeUIglLaAVCJQXDHU9mz5e2jCk03YXBa6Jto70Ka
 ZQKjSRUrBgHwjBlNKE2d+lSda5WJdn0sCp994oPUdz9bWxuugjuiHqkG4Ds1yHVPYt186W0KO2
 id25hIMEwkFOeAspitU3tFCE1DASLFdd3brhijHhpuOPogDk1USBdUWC1nMIzcy5CiyeU20syT
 WqiXggQN+GhhjkquN3zCfQm+2CAS/FzXbEGW461NzatvpVJ1MrEDEE6bocmVY2md+h+MZGfv2H
 5HM5Kdy072bcj4heGt9OJUvZ
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="82492815"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Jan 2022 01:40:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 01:40:30 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 01:40:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fz2MJnmk74BC124t1CtZnwGqFxNsEcke4qgteL12l88WipvqjK82F8N9G3H6fB1guXe25v7d12+v37gxVgoI1e70UcYy+iX8h7ns//1yDtjbF+MyD5QJkWcJEa+3iI2Ke5sdjUR8gHdpxK0nXhR17gwGjHVafMux+oL1WucZyIWRd9Mm5HAaQOYO5rgxKJlZNBOQ427Mqe4xcsMfmXpBuZfzmAJlcWdjIKHGWlYjVheD2r+2qrJu7+uD+nJg7/i345kP/wC3NKR6dQ37TeBo6HszKI09tI8BGWzpc1yBAgxtMeIAZim1AyjubmB3bQuB7z6P1418JKWL54U2OX8lSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gE8w0KJvgENVrosTeWOv0hZmcigSEYLvqTl9AWqwEUo=;
 b=Rs4RZkLXOOXH5OpzfykSkqSZZdZS3gYUW6aY7lwqJCVvOD1iL+27mO2JGp4M6luDlHmYh/iWvamQJ3EG/FDv/8ygsATc34fCr3XIEWfv/crcqEgNoTdOfR7cemXbXvugPZ8cet/GRrJJaGCsJremQjHHIY4nprGQaBp5WgZoDTGiayT+ydquYk2U8KGZkDqZOW4RqZMLaBK8naQ8wwrkFdUXPkNTNx+yggG5tJ8kK1GHL95weoParAmCEy96NWzKhVfZfJPH5nVcLRzo2q5jjrkrbB50kggv+0tluGKjVtlvAEEhy+czo2wZ1S11WQ/gzZOhAn2Vb+m/6Sn/h7MsSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gE8w0KJvgENVrosTeWOv0hZmcigSEYLvqTl9AWqwEUo=;
 b=IWFOZrHrkmFSa6KXNKfybuCz9zPF/IkJE4MwWx5Ziftka54HhEyV8/vsBhjMCAAg0RrZp9X4igBQpwt6ehad58kkLDlJXBJknsAt2ZcPUBse5G0ib+Ndhr9Pwd66aBwq5NNp7Q+q7G3I0o+aO/iXmfSnnt7GxwEBP9QzzHQl5ec=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 08:40:25 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3%9]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 08:40:25 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>, <palmer@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <anup.patel@wdc.com>,
 <heinrich.schuchardt@canonical.com>, <atish.patra@wdc.com>,
 <bin.meng@windriver.com>, <sagar.kadam@sifive.com>, <damien.lemoal@wdc.com>,
 <axboe@kernel.dk>, <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 02/12] RISC-V: MAXPHYSMEM_2GB doesn't depend on
 CMODEL_MEDLOW
Thread-Topic: [PATCH 02/12] RISC-V: MAXPHYSMEM_2GB doesn't depend on
 CMODEL_MEDLOW
Thread-Index: AQHX3WTUaxIDE/O6EkiX+niT9lHT9KxeTu2AgAQ7wIA=
Date: Fri, 14 Jan 2022 08:40:25 +0000
Message-ID: <232b8a0d-b25d-b942-eeec-9a67b66b81ce@microchip.com>
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-3-palmer@rivosinc.com>
 <CAMuHMdXQg942-DwDBJANsFiOCqyAwCt_GwW4HuC1nh0_DNmyEQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXQg942-DwDBJANsFiOCqyAwCt_GwW4HuC1nh0_DNmyEQ@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe658835-8d22-4f5b-59ae-08d9d7398276
x-ms-traffictypediagnostic: SJ0PR11MB4942:EE_
x-microsoft-antispam-prvs: <SJ0PR11MB494259B68F37E799CEF04BE698549@SJ0PR11MB4942.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f+H6beeGlJzI7WmLg0sL8PRU0NFOOjYsRWSdhOgT+R+GhfQ/2u9SfNWShYWnfS2VOxFoy9IET7Y5TzFUko/BJQX2YC68y+TILtOpnMljOOuqaCkLrSUSAez9zDn2wd2n3xd1SQX0/gFzx7jKdBSluVbsgvXnO2vcr8pkkLD2fPumGGi3PDqbxSlFN7h+EtK30pfckCrEfW7cCaA0cbxceY0VTyc2SMIdnMQcC3dKn9KUMj/YYvUsw5K+HGzSrzV1j3wpq426R97ELjv37krhzrTEeHwE0O+okVzqf7y0g0pjtTrwnmJ54FF/+ZV1FfS9nqFNhrKOBCuLNJ1nIPcvDlQk+m+44sUqJH51dJ0Jsm67MLlzvZrHkcFMRhXH9k7hpbZFOXnTVn5I4LnThFUj4ab5qQYtl2h2IvJXb4An32Bm/tRB17dRVALQ0JkaxDLxipTCW34/k1FFTDflDWMRQp4kp70Ej1ZVNbs9LtcEFDvuFVkHmpDT/sY3fRZD9GX4kBRXcL/4qv3v6FmX0z7vi9r0RUCyLd+8NhJ5bMCuxDnewfBt0VAdWbPfCHJBTKhMOiupNKNUdIM7lNNr5w49jcmOm3lP2rg5EvkZrrMqoT2OfqxLSzkA2txkOydkKMlAfpjyl34tbfac24jmvgWkseTBbqh0CqSggNdWKpbYe+qrcLHjGRrnqwXP53NlfJiHnsCWVoSCSvDVuKZKI0OeLEJAJBkQMG/0x50Mjudbl+97YLxijusfPFjybEqumqyP6jUuTHT20heLJVLow4BK9dwmX+CN+dDJLLXWKPkWNZuPa4gFoB3/RKsRCC6/sF6lQbAlBbaE8hCuDhIc22cJMXLmbOFf0tftQJdaNRI0jVc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(186003)(26005)(45080400002)(91956017)(2906002)(7416002)(966005)(38100700002)(5660300002)(508600001)(8936002)(54906003)(110136005)(316002)(8676002)(71200400001)(66476007)(4326008)(53546011)(83380400001)(6506007)(122000001)(6486002)(2616005)(86362001)(36756003)(31686004)(6512007)(66556008)(66446008)(66946007)(76116006)(64756008)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REF3eEQxRHJKb3FhUWloWXFCUWNNaEtWY29JaDRiR0VNZzFoSkhaVC9UQ203?=
 =?utf-8?B?RlllUHFKYTJyaCtvNWhqSUl2UmphQmV2SjlRK0NtYVdlNk5IVWI1alVSZWJW?=
 =?utf-8?B?RVJzcUhpbXBJdUFOZEk2Rk9tWHJhQjFPL2RpV21reXJRdDJhYXFDYnM0Lyta?=
 =?utf-8?B?RXcrOXF4ZWtCWEFZOWxxdWg5UEI3MWQwNzZDcmhZaFN0MzhtdzRlbHNmbGFk?=
 =?utf-8?B?VzdJMUZmVjZDWFhKazd5cHdkQU8vNlV1dWZWNU5ocDFzbVpBZmgwNnBaOXRo?=
 =?utf-8?B?TkYxbFc4ZDRuTkZjN29iby92bmpZY3NPOU02VEFRQ1d3SFdWQnhQZ21SQlRl?=
 =?utf-8?B?cXh2dnY1bGxxK2dma2VTYWVEQmZ6eEVPSUxXemYzVHBaQWdqcURRcE5ONG9V?=
 =?utf-8?B?dTlqMnV6eGorbVcvY0I1QmoyQngvcEU4VlhGai81SGh6SlAvQUc2RTNLMGh1?=
 =?utf-8?B?aHduazFxVCtVMXBZSHNpVTUrc0NZbUJYM1NEK2FpUnhtS2d2c2IwUkpzV1c2?=
 =?utf-8?B?M0dBcGRzOHlKaDB2NStPTGNIdEpKcUNxZWJLRk5XTHhyZHhSMDJmQlV1TlZn?=
 =?utf-8?B?V3ZWQ3kwejJCU0lPZDM0L1VRVkVSd1U0N29kdG95NWVoWi81Rkd2Z3BPZlRi?=
 =?utf-8?B?K1Z5T01sd1dPaDRVUG12WVFiVC92eDUrMGVNeGZXOHI0V1JxTXg2YkJHelVv?=
 =?utf-8?B?Qlk3SkJYNjRVWlZINlRMZ25kRi9JL1R1MnorT2djUkd1NWJpSEtwdzY0TjB2?=
 =?utf-8?B?V3BxT05kdEp5dSs0NFFtVEEvU3NuUEd4ak0wTUdZandGVHNRWDgxdFRDeG5E?=
 =?utf-8?B?MHB0T05rYldIcFE3bjltazJsMjk3Ym1jQTc3YkRhdVRoa0o0UEdLU3VtMjJz?=
 =?utf-8?B?aTBDMWlabWRyWnA3UzFlNG1LYmI2Ti9ERXV6cy85dk9XZWhsbXJwVVM0MEQz?=
 =?utf-8?B?OFd6Q281ay8wT2lNd2tNeUs3b1k0WmcreGZIMmNlL3hHa29hWUl2bGUyTHZo?=
 =?utf-8?B?VjVEdHB6aHJkb0ROTkRabEdsb1pZSVFJb3hCUmRkQklORjA1L3RuK1hVQnlh?=
 =?utf-8?B?QkQ2azdCUExuSnNCWWtCVWpwZFlMVGMzUDhpWDE5M2NaUHlzRVY5ZzF0WS9q?=
 =?utf-8?B?UlQzMUFnMGpZMFh5ZXg5cTZmVkllZFRHc3J0aXJPR3JnNE1DbXQwOFlDcHc4?=
 =?utf-8?B?V3ZhbWw5ckN2MUJUZlk4dlBVeXQ5UHM2UXIxaSttM0s3OXE5OXdRcUFZNVRq?=
 =?utf-8?B?eE1CRnF2SUp3aEJHQUFkVFJYajY0czZueHdROE5Gbmd4Y0VtT3lGOUdBRUl2?=
 =?utf-8?B?Vlo1bG9adTlIeUs1b2VwZnM4bi82M2MzNzg1cnAvY3VScFZEWHJsbVV5K3Vo?=
 =?utf-8?B?Q0ZLWHg2bHU5VU1tTkkzNjdZdTZtUzhtNDZoWTJ5Q3M4cndDdGQxcytiRHBy?=
 =?utf-8?B?dW8weEowMk5tRTJRUldQVWtzTnNDajYzeU1kRHpycjZMclVqOTdyVmJGQ0ND?=
 =?utf-8?B?Z0wyU3hWbmdtWTdpd1c0Q1ZUOVM5MUYwa3JSUmVaTTQyV2lHeFo1SDZnWXlS?=
 =?utf-8?B?UkxnWjFUM2gwNnV0MXhMM3pZZ0xIZWxaWVNmU2Ntb0QvSXdHbHp4RkRkc0cz?=
 =?utf-8?B?MWlSRnVrZkVXWDdNZVlWZ3JzM0ZUV0FVU01kZGhRUG96d2FSbGNxSjVsSy9R?=
 =?utf-8?B?Z3dIL2pvR1dudEdibHJ4bzhNSWxIME5sa3pzKzNxV3p4WTZZamJkd2xNWExV?=
 =?utf-8?B?b1B0V1NHcXJpWkh6ZElsN3J2OU0vb1N1QTdWc0dWU1NMWFEvVkVDYlVpS041?=
 =?utf-8?B?REpvcG5lbW1FK0dOQjRDd1ZIK1U0WlJEajY3MXhRMjNhRDBjcGNMS0tTMzI5?=
 =?utf-8?B?VWI0VFlWUGN5TVB6S3lRemEzektqcUpxeTJDT2NZaGsxWnQxTHlMRFBZU3Yr?=
 =?utf-8?B?RzJ1eVFTaHdFc284QzFlVzFwRjRxaklYb0M4aE5CMzVOREVoRHF5QU83VS95?=
 =?utf-8?B?MFRJOEZGSUtEQ0VneVlQWGkzRWo3Q1Zjc2lvRTU4bHdNZ2t1YyszOEFXaFlx?=
 =?utf-8?B?dWxaemU2RitqWkY2MDZEWjA3RkhsRzMxL1lwN1VNQVJxUHdDaXdOb0QwWGNY?=
 =?utf-8?B?d0hxVGNOdXdoWUNPSDFqSFlsbkk3Z1FmVWtaMHZiN1FVRk1wRnZZLytGRUZh?=
 =?utf-8?B?a1BrVmswZlFRbGV3alcxaGtocnJzMlI5cW9UUXU4OGlocVRnWkRmS2Njc3NG?=
 =?utf-8?B?T3NQNEpzMHd5K3VzVTcyWTY5NVdBPT0=?=
Content-ID: <C52D52C7B18B41429098E5D9EECF0A65@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe658835-8d22-4f5b-59ae-08d9d7398276
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 08:40:25.0443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xNH8+fgwviGS7JBNnNhUj+4vAYRo8TDygEZhKt7i7dDFUNo97XaoU/jBHdCL1JTTp8SDmGvE8UFYEAanq4eoDy5v3FWoQXyvGkapGN9VOkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_004035_864008_0D5A699B 
X-CRM114-Status: GOOD (  23.17  )
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

On 11/01/2022 16:04, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Palmer,
> 
> On Fri, Nov 19, 2021 at 5:47 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> For non-relocatable kernels we need to be able to link the kernel at
>> approximately PAGE_OFFSET, thus requiring medany (as medlow requires the
>> code to be linked within 2GiB of 0).  The inverse doesn't apply, though:
>> since medany code can be linked anywhere it's fine to link it close to
>> 0, so we can support the smaller memory config.
>>
>> Fixes: de5f4b8f634b ("RISC-V: Define MAXPHYSMEM_1GB only for RV32")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Thanks for your patch, which is now commit 9f36b96bc70f9707 ("RISC-V:
> MAXPHYSMEM_2GB doesn't depend on CMODEL_MEDLOW").
> 
>> I found this when going through the savedefconfig diffs for the K210
>> defconfigs.  I'm not entirely sure they're doing the right thing here
>> (they should probably be setting CMODEL_LOW to take advantage of the
>> better code generation), but I don't have any way to test those
>> platforms so I don't want to change too much.
> 
> I can confirm MAXPHYSMEM_2GB works on K210 with CMODEL_MEDANY.
> 
> As the Icicle has 1760 MiB of RAM, I gave it a try with MAXPHYSMEM_2GB
> (and CMODEL_MEDANY), too.  Unfortunately it crashes very early
> (needs earlycon to see):
Given you said 1760 MiB I assume you're not running the device tree 
currently in the kernel?
But the defconfig is /arch/riscv/configs/defconfig?

I tested it w/ my newer version of the dts, using both 1760 & 736 MiB 
(ddrc_cache_lo only) w/ MAXPHYSMEM_2GB.
Enabling MAXPHYSMEM_2GB with either CMODEL_MEDANY or CMODEL_MEDLOW
lead to the same boot failure as you got.
> 
>      OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
>      Machine model: Microchip PolarFire-SoC Icicle Kit
>      printk: debug: ignoring loglevel setting.
>      earlycon: ns16550a0 at MMIO32 0x0000000020100000 (options '115200n8')
>      printk: bootconsole [ns16550a0] enabled
>      printk: debug: skip boot console de-registration.
>      efi: UEFI not found.
>      Unable to handle kernel paging request at virtual address ffffffff87e00001
>      Oops [#1]
>      Modules linked in:
>      CPU: 0 PID: 0 Comm: swapper Not tainted 5.16.0-08771-g85515233477d #56
>      Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
>      epc : fdt_check_header+0x14/0x208
>       ra : early_init_dt_verify+0x16/0x94
>      epc : ffffffff802ddacc ra : ffffffff8082415a sp : ffffffff81203ee0
>       gp : ffffffff812ec3a8 tp : ffffffff8120cd80 t0 : 0000000000000005
>       t1 : 0000001040000000 t2 : ffffffff80000000 s0 : ffffffff81203f00
>       s1 : ffffffff87e00000 a0 : ffffffff87e00000 a1 : 000000040ffffce7
>       a2 : 00000000000000e7 a3 : ffffffff8080394c a4 : 0000000000000000
>       a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000000000
>       s2 : ffffffff81203f98 s3 : 8000000a00006800 s4 : fffffffffffffff3
>       s5 : 0000000000000000 s6 : 0000000000000001 s7 : 0000000000000000
>       s8 : 0000000020236c20 s9 : 0000000000000000 s10: 0000000000000000
>       s11: 0000000000000000 t3 : 0000000000000018 t4 : 00ff000000000000
>       t5 : 0000000000000000 t6 : 0000000000000010
>      status: 0000000200000100 badaddr: ffffffff87e00001 cause: 000000000000000d
>      [<ffffffff802ddacc>] fdt_check_header+0x14/0x208
>      [<ffffffff8082415a>] early_init_dt_verify+0x16/0x94
>      [<ffffffff80802dee>] setup_arch+0xec/0x4ec
>      [<ffffffff80800700>] start_kernel+0x88/0x6d6
>      random: get_random_bytes called from
> print_oops_end_marker+0x22/0x44 with crng_init=0
>      ---[ end trace 903df1a0ade0b876 ]---
>      Kernel panic - not syncing: Attempted to kill the idle task!
>      ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> 
> So the FDT is at 0xffffffff87e00000, i.e. at 0x7e00000 from the start
> of virtual memory (CONFIG_PAGE_OFFSET=0xffffffff80000000), and thus
> within the 2 GiB range.
> 
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -280,7 +280,7 @@ choice
>>                  depends on 32BIT
>>                  bool "1GiB"
>>          config MAXPHYSMEM_2GB
>> -               depends on 64BIT && CMODEL_MEDLOW
>> +               depends on 64BIT
>>                  bool "2GiB"
>>          config MAXPHYSMEM_128GB
>>                  depends on 64BIT && CMODEL_MEDANY
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
