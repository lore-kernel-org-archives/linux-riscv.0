Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896AFC25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1g2DFQzsxyI+0qTz8OjBZKjd9oVl1pthrShxLFJBvxw=; b=OemHuTbJiyWEwZ
	UC7EPvRib5R2D7hVPDb3tYpbMC1pkgpexYJ6GXt6ktliX8BbNt3k9GTj0pfOXwtjSaHRr70yGk1FE
	pKuFrQEkIccDXXmmmaE5UqMdmZaVaiecqrphc13HPWBOA5SCDE1VExOfTyEbEDuI77d0L6e1M0wYj
	K69qBqk/4KtgnGXR7cIK3rOBmqpKtqN3UfGI1jVfMWdleDaKrEj47Iqg3E56hTm5IqMTVXTKcpKng
	t+YI63GacSI+W3zixma7RHFN6fl8tcunW7rzh+GhJg+T+gjlm+bM8bbgIM8okD3de7bhAz6P/Hu2s
	e8l4nYsdS9GB77YPWe6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oONPE-004hCa-4M; Wed, 17 Aug 2022 18:04:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oONP9-004gx4-Vh
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 18:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660759476; x=1692295476;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TJ+obnNYX1oseTeRQnvAsiFWMcRJshTIfFGqkEI2EjY=;
  b=pAMwB8SY6A4JNBYFEAqnJDRxj+/kFgtut1RoV+PJoeaTnXulyM0wrc0A
   YJoP0cmcSQrmlHMQsEjEaKgpQrnWdM1Kg98JhbUta6akoFzkr4VKKUNSu
   rR3xutrLn8aSRRsY3O0bZp4h19osMZu7XE53ODNukXQj98KiMDNQkUMTm
   k3I+Q+kMlZ7IYyLi0M4tpfBf1Lb0qBZ8n4ADExdpiAXRyvL+L8mvpInU5
   GE5V8DPUULvFkty4HUezFlJRy/GGunq+axj+7r73yyKhY+1qk1nOv/vJI
   4jiNriRNz+9L1xq9yNoz4pXaEwzPFp1dJPoc3+7khCQ+80Ecb2qSIbqn+
   A==;
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; 
   d="scan'208";a="176658523"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Aug 2022 11:04:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 17 Aug 2022 11:04:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 17 Aug 2022 11:04:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkO4HMwFJ+Ho2FN3FGo56ISqFLLSnmbtsQwcQFwpHSByT8Y3cpKjWfT3qi0e2VYGgdYFJwrk1p1AxVgLCH7Y94JAcT0rPA36L68UgVBuQHgYP5Gf9naqkc4eQxq/YRwhwQV3TTkfIFotvOEOz/PT+O7xq05mZy0o9z5WzmDDdKChwTs2eu9SGU4k7jjA4+CR0Bh0IltQwC8cFKbgqXYGgycPnqplNCottvVdpYdJz7G6V09f4vz5s4bEMTN6lbq5yyc8J3Z/lstdY+TfSS1wsuGDqzCtHndfAOqOtSClVfoftZ4uOA/xu1orwQm6ZXZOZwHECN6YKsKP0xptfZAJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJ+obnNYX1oseTeRQnvAsiFWMcRJshTIfFGqkEI2EjY=;
 b=WX2WvhYgzVi7VGDQSjOWnlqIrS8aJWL+K+4Jetctd5AbUXWCYjdIVWZnGv05GEQL1OWKjwtgWqPo6Td7KemEqXJTXd1jzaSlnZMCmNgqkvsDqg3yyVWJmiyP0W3uCWadFNUWwD1rDwemoOMkZWz4+WZCs97vUNIx/+4bD+nOjDJ6hP3fEufQ9L94KcnlDfveFw8bvOMx81NDfoCtlE9MIkGYJ+tDfe/IIOzhkgOGW2TTL/paQbAjAdVvsZtYQWDz2uOaD6fPiQkznBcanHG/v3vtGm5lqECkwBRAq1ba8avh5XfqYhwaldTyt7zxJvMOR5+wQYTZDsDSuOJLhdSECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJ+obnNYX1oseTeRQnvAsiFWMcRJshTIfFGqkEI2EjY=;
 b=rGOENW9Y4g3+QFFlXBII9OMkYUF4DplSgUsdeic4sDShfRGBNACqMrxGt2lsQ2hmlmofW303CIhnr+7MplsgMNMXRNTIo66PTIlvoCk4ZD5uMD1J/t1Duy8WfXQ5WMg3qI+T/VPFMBjhfXc4zHqnz3g94bXh4A5rSJ1UhA0OvxM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA2PR11MB5193.namprd11.prod.outlook.com (2603:10b6:806:fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 18:04:21 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 18:04:21 +0000
From: <Conor.Dooley@microchip.com>
To: <heinrich.schuchardt@canonical.com>, <robh+dt@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<geert@linux-m68k.org>, <emil.renner.berthing@canonical.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
	<atishp@rivosinc.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<Daire.McNamara@microchip.com>
Subject: Re: [PATCH 1/1] riscv: dts: microchip: correct L2 cache interrupts
Thread-Topic: [PATCH 1/1] riscv: dts: microchip: correct L2 cache interrupts
Thread-Index: AQHYsjzjuV6JQqnbNU6bXELDL6GyqK2zYxOA
Date: Wed, 17 Aug 2022 18:04:21 +0000
Message-ID: <32a72954-c692-6c5d-b07b-266d426c3cb4@microchip.com>
References: <20220817132521.3159388-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20220817132521.3159388-1-heinrich.schuchardt@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 892ecb2b-58d7-4937-5e31-08da807ae95c
x-ms-traffictypediagnostic: SA2PR11MB5193:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 687vFcwiHrjYYegr6f00guxIuU6jdIqZ4vfxBgotLPvEwkA/8TK9AaxaKzhSab15ikjM8cocmkARBPiECYL/VqvCP7heNa18FK8tS8kkHIAG72Sw0sOYNis47/6l5L3d+a+zRzEmdxnh0cVrvaLLOoGdY4S+w5+U+s3Qn8Oma6Nwd9M6GbrCyJjYv//wiKeoIx82hyL++d/jnJnk3WogOuSjRsdl80HfWcUIukLVRS8E5FKhbI2Sh3WPzEUjuytWRhhC8JtO0nzP563z5TuTWEgoeNP1r+AkO2haC8ftV0yDq24ea8GQnCUb+nr7zzdPiRJsFQjFGb0lH/DBVqstU/Dmc4u1e8+MswhxObEPSUfBSrR6rdojhrHbbAnruWRfeL56TtrXRWSD8IL5zDLGqDcWFAGNFQomL6CkAdUACAqDxv4TwicUlaAeMsUxqefrPyAeDQGWyPEYaCWvGzkOKrkTahfYvuOUG0jQ3Z+sFuw4QEunbx/vg0OJwkHfvyGxI19R5H2nPFvZXXMQI91ulaBOgq9xuMXg0qaG74O7G20k/74GMuCAQuujkwW2rGw1UX2pQ/nZEb6sqmNyCujayR5WQ7cmUwLvGI+kYyatsBJAN3PGExzn6Im6orMrV+DM7DMpZD8uYFvwb0VQKGjoJPU0iisK1huIsPW6AurbIh8BtpwSCNcLm39+jFfWsVCDrT6J5J9Q0q/1FHeftueEu5S5a/4L0X2FoyZBHb/qF0o60AD8ouwlmFxnNpgiZ5r1MxA32Q8+sAaEFVpiGBfx4C9F26VaiEd+cP5C2YeVojonTHSWs3A0A7wa4EJlX7VbaFuHr0Z/TtnNaQpPXqfAarSX716/S0EpQRMgg5WOx6o9EdHyC35V6XW6fN2iTzkm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(376002)(396003)(366004)(7416002)(2906002)(31696002)(71200400001)(66556008)(66446008)(66946007)(66476007)(38070700005)(76116006)(64756008)(8676002)(4326008)(107886003)(31686004)(38100700002)(110136005)(54906003)(122000001)(86362001)(316002)(5660300002)(36756003)(83380400001)(8936002)(478600001)(6486002)(26005)(6512007)(41300700001)(186003)(91956017)(53546011)(2616005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0UwOUxCeit3VHh1SnQxb1hOTlhSR3pDMEw1SkpBQ0dKeEs1THVHWHJGMndK?=
 =?utf-8?B?ZVRqZDR0V05ZQ1ZxNFJPaHp5N3lQM2dQUStkbVFkUHg2K3pjeDNpRXZ2Y2o1?=
 =?utf-8?B?ZjFpV0ppUUYwTW9IMCtUaFcwZEZtMjZaSXdHMzFhMWlPNFBMWmxsSDErUEhk?=
 =?utf-8?B?RE1telFuVEx3eVBvWU5zbFFTZ1NKWTZqeUErcHNpVnVrSWU3YVBuNnBUQUxZ?=
 =?utf-8?B?OVZOQ0Y2bmhJZTVQaTRBd0pGR3FydDJkVXliUVBYNDVKTFg0eDlQK3Q3SDV6?=
 =?utf-8?B?eC9KK2tFeTI5TUtqRXdoMy8ySitKRUVVRmZDcGExdFBOeUJ6VWNVMlhkeWtt?=
 =?utf-8?B?WlZtSjJEWXY5WFdOZWhheE1mdEFjdDdpSnBmSzgvdUlNTkFQenlLWTNTU09S?=
 =?utf-8?B?Q0JaSnVqYkxDMXBwTTJzb2ZmVGsxM0VJQXQycXJ3VnNtMEloZTdQNW1wZDNM?=
 =?utf-8?B?ZGxPbTFNUUZyUlphUjdFNmhmWWV5YkVDKytJS0pVL00zdHc0RTJxc3lkbnpX?=
 =?utf-8?B?YzRTNTlUbFpwQUlmR2tCZjk0dzg1YWR5ZWZVeDRCeUs3dU4yRmtDYWpKT0RU?=
 =?utf-8?B?RjE4Wnl4enY5d29DVDkwbGY4NmN1MCs2UkhYOXl0NjY0U09xOHUvdjZTV2lM?=
 =?utf-8?B?WnRScVhkRjk3UUhaSWNSTG1jQUZYVnc3NU4rSXFEbHd6M1lTdThjSnh3YzZn?=
 =?utf-8?B?RzZ2RnZJWnJITENveDFCVnJYNWJ4QjRUU29xWHp1RkJXMlVTZ3BzM2duTHVw?=
 =?utf-8?B?c3cwZk5PYUx6bWF3RkFsc1FuUEVVK01rSTQ1MnZISGZQSkZEU2kxYlVramVT?=
 =?utf-8?B?ZGRjUThJT1MrOWpLaVpSczQ0M1FGclNZK1p6bUltb2s5RFVKSE85SHBEL1NV?=
 =?utf-8?B?S3J5YWNPM3ZDTGE2dUtRYml1cVVRWmdXMER0VVN6S2VMQWkwMGZoaTU1aE9U?=
 =?utf-8?B?QzU1aVVHR1hCZkQ5MHkzTUJLekJCZWtyY1dvSEVISzUzc1hjY3p3YUNVazFu?=
 =?utf-8?B?WlJBaWJiY1BqMWpGbjFsQ1JpN3hGdzEzWkVNM2xhSWljT2M0R25sdmVHZGgw?=
 =?utf-8?B?M0ZPdkRuUjBMVGRsL1ZUdnBCQlFvY0lBMkhQNXVuVUc4ZU9zbXR0Z1FXaEs1?=
 =?utf-8?B?dTdUSmZMOForQVpNMllnbU9ENWQ3ZWlBaHFhN1dwd3JkSWUyTGVtTG1FTHdG?=
 =?utf-8?B?aEdkVjZKNmJBSGh0VGVLM3ZIcStiaVZTTjBoVTNZTS9NbTdUTHNoWlFyOCtL?=
 =?utf-8?B?T1FQN0VYa0lpbllvVUpzcDZtUjk1RE9BMWVsLytCaGpUZy9yR0wyZVYxcnBR?=
 =?utf-8?B?SnY5OWI3b1RTUFhMM2ZUOWlqdFljd2wzK0pzK25vb0pZM3dWREhScTlsODVM?=
 =?utf-8?B?TWhDNTZLTEc3eGd1eTZ3V2NSVm1ZTkFReGJLUHZFVjQrQ2dpTWlydFR6czNx?=
 =?utf-8?B?Z3IvU2hvVTR0b2o2YUxOSzZmTzNuTk9YQkZuU3VYSTFvZFl3NWJySXAwMEpP?=
 =?utf-8?B?MmV6bUM0QzdkS0E0enV1Q2RHWEFnZHZ1V09CL3k2VkZaYVo4UlNEN1IrVUlp?=
 =?utf-8?B?a0ErMjJqZjViSDlJUjZyT0o5SFIyTTlneDIzL1V3bU1kREJHRU1TZGdZaVZs?=
 =?utf-8?B?WlBMNm0vUmpQcmJOVXZ1cXFJVTN5U3BLVWZ4aXdBOFdHQmpEWno1NXlpUnN1?=
 =?utf-8?B?dG40UkxGbVNHbTVTL1VwbVFtY2R2bGJlcHc0d2x6NTBuRnl5SVhERExKK3RL?=
 =?utf-8?B?UDNhcm44S0JYRmFOclhUVjdFdFh3SFRGN1RQRzZLK3c2RVhrRC9iRUZtWG14?=
 =?utf-8?B?aVdZRFQ3YXBLRVR2VS8yR2pMeXhrV3k4WFgrd0wvSEtOV3R2MW9IUHY0ZnNu?=
 =?utf-8?B?aFBvTHZXUitFbkM3Z0F1Nkg0SHdVaDBkNFoxSjhHeXIyL3F5MlE0aVZyZG1J?=
 =?utf-8?B?eCtGVFU4UHZoRnVINDJzTWZqTVQzMWFJeEZ3ZnBVTEhqTy9yeW5xbVVBYVRY?=
 =?utf-8?B?N0kvYlJXYVdGdnVnOWpQcENyL0svOHdJRzVhTy94dzgycjhDQ1dTV1pSc2dD?=
 =?utf-8?B?T2FQTjRKL0l4NGdscTdrL0xZT1RnUW9LM2hQMWNMWmcrUndramtSZy9ySk1k?=
 =?utf-8?Q?5684Z5+EE2qz2JGLEQDKRr/nj?=
Content-ID: <F0C61FA70990FA499E970D3FC0DC8107@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 892ecb2b-58d7-4937-5e31-08da807ae95c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 18:04:21.5544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xf2eiUKDCbGP9h0JsgQlxWakZUDjCcwjQMmTfGn4myuIA/Pd4RV4C5voeCXj5ZdFX0kGMxG+mIGQsjhifnYZsEbzuDYbGoQSO8AlGNwumSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_110436_095594_88109D72 
X-CRM114-Status: GOOD (  28.81  )
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

Hey Heinrich,
Interesting CC list you got there! Surprised the mailmap didn't sort
out Atish & Krzysztof's addresses, but I think I've fixed them up.
 I see Daire isn't there either so +CC him too.

On 17/08/2022 14:25, Heinrich Schuchardt wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The "PolarFire SoC MSS Technical Reference Manual" documents the
> following PLIC interrupts:
> 
> 1 - L2 Cache Controller Signals when a metadata correction event occurs
> 2 - L2 Cache Controller Signals when an uncorrectable metadata event occurs
> 3 - L2 Cache Controller Signals when a data correction event occurs
> 4 - L2 Cache Controller Signals when an uncorrectable data event occurs
> 
> This differs from the SiFive FU540 which only has three L2 cache related
> interrupts.
> 
> The sequence in the device tree is defined by an enum:
> 
>     enum {
>             DIR_CORR = 0,
>             DATA_CORR,
>             DATA_UNCORR,
>             DIR_UNCORR,
>     };

Nit: more accurately by the dt-binding:
  interrupts:
    minItems: 3
    items:
      - description: DirError interrupt
      - description: DataError interrupt
      - description: DataFail interrupt
      - description: DirFail interrupt

I do find the names in the enum to be a bit more understandable however,
and ditto for the descriptions in our TRM... Maybe I should put that on
my todo list of cleanups :)


> 
> So the correct sequence of the L2 cache interrupts is
> 
>     interrupts = <1>, <3>, <4>, <2>;

This looks correct to me. You mentioned on IRC that what you were seeing
was a wall of
L2CACHE: DataFail @ 0x00000000.0807FFD8
From a quick look at the driver, what seems to be happening here is that
at some point (possibly before Linux even comes into the picture) there
is an uncorrectable data error. Because the ordering in the dt is wrong,
we read the wrong register and so the interrupt is never actually
cleared. With this patch applied, I see a single DataFail right as the
interrupt gets registed & nothing after that.

I am not really sure what value there is in enabling that driver though,
mostly just seems like a debugging tool & from our pov we would see the
HSS running in the monitor core as being responsible for handling the
l2-cache errors.

@Daire, maybe you have an opinion here?

Patch LGTM, so I'll likely apply it in the next day or two, would just
like to see what Daire has to say first.

> 
> Fixes: e35b07a7df9b ("riscv: dts: microchip: mpfs: Group tuples in interrupt properties")

BTW, it isn't really fixing this patch right? This is a dependency for
backports to 5.15.

Thanks for your patch,
Conor.

> Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  arch/riscv/boot/dts/microchip/mpfs.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> index 496d3b7642bd..ec1de6344be9 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -169,7 +169,7 @@ cctrllr: cache-controller@2010000 {
>                         cache-size = <2097152>;
>                         cache-unified;
>                         interrupt-parent = <&plic>;
> -                       interrupts = <1>, <2>, <3>;
> +                       interrupts = <1>, <3>, <4>, <2>;
>                 };
> 
>                 clint: clint@2000000 {
> --
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
