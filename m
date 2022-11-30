Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AE2C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 09:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJR/9QBPedqgWUqDJ+2fslznwovcYg//GB0lanliAGQ=; b=Rh9gPQrbhnRZS3
	QQUF7BSF4bLz8MytsSZpqsdlEULDZtEYvUIxM4Ft2HrfKqhTZOJuDKRXfrNgiiA8YjA+VqE8pzDKV
	9NmhGmfgeAEofl5T5ILDcm0JgcfOXOO6+uL9zTTj7EBMZWqOSwsV2VBnEQvD16nP1U1UKrQkBTrFa
	qfKz4q4tS/25Y18I1Hn3vmLFzu/pi3jKgI7r1QTvOElKWbvcLZ400lpmrNc/pYqswm0DoF1RX4ECt
	dQCkzzuBr8w4BbrPCGKy9bGJsENLIOgfyGpaRE12cz2kxE6Zw9biEJ2gzcayANu7AfBmqjwyluLuk
	ed+o6WqlMpcjMxKshloA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Jfh-00FCcA-N2; Wed, 30 Nov 2022 09:46:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Jfc-00FCYW-ES
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 09:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669801584; x=1701337584;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AhI9C+lfFxqDTimt+6Yn4G5HU0DgqVqBZ5fdV2bWw3s=;
  b=xie4JFMyOg1KEoQTAmg6jjcALlQZm8Wm8CuNZ/wrPUfchfsIdZ7GRzNs
   QekNGvGhOxP9jywpZS/fMUxX5adeHLs99DMbMHtiFGG1BMlgxM/NRbPfk
   cmfUTy0BU2CQ4puPOdRZ2HJ6uZUoZpfLj9ywzfWSVOUdNrJsgjkqoBagY
   FvG3AB8ZCUinHrxCe/YzuP0CWqdni1f2NJkfUKztfkmJ6QimlaLyiHTX7
   F/9EW52CeO4LIXTM18lu/ulvSFgfQqKk6I1ZCN7D0Vu8/7jHcrwpP6RUk
   5wrfBXs2BneyQh6fWbLRtCXyGEpvXmMkqRtMifsN0eomA5l5vx9MMDX6w
   w==;
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="191114064"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Nov 2022 02:46:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 30 Nov 2022 02:46:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 30 Nov 2022 02:46:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8rdBmiKc4H8Xh1eFwiI8Dhj5onSxTmc6hYXCPUwiOh4//VGoXKOLBa9Nn2d5ZB8nXSNmFZqXKuoDZLIPlqrhqiJ8uFStd7sdW60n0QAd4IKznUDaJEA5Ejk+tyf6J15bRrZJzlttF0u8R3w/Ft84O9pRQ97VrzuzSOELa7UGd+tcPGGjxx4+iE8chXGFAB6El4PNTJxIIF4VFSc2gwPE5uPPGbrp+Z9eULAQrqZlzRImPdhYRFQuXfdUjc9kBFn0wQVbfZ8dv6HOhJSUIzZXaeNEA/iS6T2vFsL/QhtSID9tbwZgOXGCsZvKY0V65MVD7oMkdd6FTffpiCQNae9xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhI9C+lfFxqDTimt+6Yn4G5HU0DgqVqBZ5fdV2bWw3s=;
 b=RWwF8FQuEvl2T7GSnPDjwsYPe4o7Mj0aGda/pCtzlSruGjGiZ8GfnEOEgHFQhCP0ydFdJjpf6xIde1O0Nnd8RBLY/4pau9f7moI4tmNOrK4BrNxbQdfqxqt0eAzyZWm/7/3RAvMShcLHmq1bUQvdaxr3asev4EuzgicY9pj4kifxrdWE8Dwg05OuVbPgCWp5cI3SVjM8mLhpTz1one5uHsnaIe3yFWtBRurf4yggVLj1Lic+XEzBjyLGzPDzRzwM6RzceEXVHNOqByzEFpf+eORdJWBKlDFcOhNdcLpCcqYbIy5VUhhL1hBLt3+k9xv417i3xIimGdaLRbrEULtSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhI9C+lfFxqDTimt+6Yn4G5HU0DgqVqBZ5fdV2bWw3s=;
 b=bJM2o5tKs7LmaeQWNjwIB+LBuraZznu3pn0D2T+2WuEfQtinCPYG7PwjYvfMXK7AI6yBy9Y0iIqJ3CtuO12PCaG7d5h2bPoPbJc05EoPZgzeeuivUthZf2XmWnSEkICON7bBgGtSaeqUKZdaf+yxpx9ncUzjxqnpALjRgULkEnw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 09:46:21 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%5]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 09:46:21 +0000
From: <Conor.Dooley@microchip.com>
To: <conor@kernel.org>, <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <heiko@sntech.de>,
	<apatel@ventanamicro.com>, <atishp@rivosinc.com>
Subject: Re: [PATCH v3 3/3] RISC-V: Ensure Zicbom has a valid block size
Thread-Topic: [PATCH v3 3/3] RISC-V: Ensure Zicbom has a valid block size
Thread-Index: AQHZA//L8KTmIEGzV0+hnjNXgPsPPK5WTjmAgADq5wA=
Date: Wed, 30 Nov 2022 09:46:20 +0000
Message-ID: <3c64b508-a629-0c34-1119-e854b1968a2f@microchip.com>
References: <20221129143447.49714-1-ajones@ventanamicro.com>
 <20221129143447.49714-4-ajones@ventanamicro.com> <Y4ZhT3R34cE35a0K@spud>
In-Reply-To: <Y4ZhT3R34cE35a0K@spud>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|DM6PR11MB4692:EE_
x-ms-office365-filtering-correlation-id: dc356b97-8c8d-463d-6958-08dad2b7bc8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IM7hWrb5062oyvWavcW9KpDMrxfdyRscJZbIK/9rcc0zi81SF+chwDozmKwH89Icu2u1Tn8CIngoJvn6/ytzZKG38ZVQVg6ibZtcsgDAPgzLfgf6/T934fJCtOtbMfWRrvyjE52OOPod9GQx5v3Omjr66CUB0ITPCM60t1GKUpDMseZnqFJJw6sDkNCsaBYqL63h4fsoac9zzrfzLWMdlqxrp5MRTUVreCpi1zJWtfpNogSg8RsduFxNrfLlUwIcLosqC/9Fc2lP+FThme43x+aOg7q2pVjgX3hq4fc3oDiQqoKxe/kSWouC2pxpDUFcBfszGLifLHB0byyg50iCQE/IvMgLOKrIQ3kxiR7iuatsu9TeytwCh/g9IIW5yjUHRGbndoosTGSg9tf+uhOKBGq++nSXbP3Gsj4zVGvRLkHVwhAhTdHQU4tK0UlLJREp7Aog7QduYjd79J6TuP1qFh2eEUoU9bBqmHdDTZUIULr5qoRDIEBQlwGP7VmeokwRqTSU/5qb5T8F0WdXcv/URDAKSjdLDKaCwG2JmD83Mms5oMJH+0t/bB8jT9uEgnbvPopaKoUwPTKfSNhyMT5aaBVeCirQOY/bX5h6WsG47oBAjBj1DGjGQ+IlfetdHeGMD9rOEWrKzlA7NoefZnJp94kNiac3aKP2ccCXZ2lq/UFq+69GATJUWWKNWfvcv3gkJ+0r3+0+aY9f/0akX739IcEzKdGrJwQqXuW2gO5+WslNrmfCoZAxpvKR3pFRRIPUNn9QX6Eh1MuGN0ugo/hHV7wXs5edTzUsZmP52lqIJoU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199015)(2906002)(8936002)(76116006)(66946007)(31696002)(66556008)(41300700001)(66476007)(64756008)(8676002)(86362001)(66446008)(4326008)(36756003)(5660300002)(6512007)(186003)(71200400001)(966005)(6486002)(6506007)(478600001)(53546011)(2616005)(38070700005)(38100700002)(26005)(110136005)(122000001)(83380400001)(91956017)(54906003)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVJKWGR3STNSSlZiaXZoQlpoOGdXOGdiV1FQbU9lSzh6dUtBdDFHOGhZdm84?=
 =?utf-8?B?bmhaWW9UcDVyb2VSUWNnSW84ZEJjUkVoUzl1bFpkOXljTVpsam5VS1VSdm1k?=
 =?utf-8?B?T2x5cCt4Y0wybHM1VmJkZ2hJVXRrZUVvR1RCUlBsL0NEcVJtcGM0VFR5RkRt?=
 =?utf-8?B?ZVl6S3ZkNlExdU9xM2l1TlI1ODM2aVZEUnBWM0xzMjZkd1JQUTRib2tYeUdI?=
 =?utf-8?B?b0NjSCtLMW1SWXdjbW1Id2xSeC9YR3hVY1BFR1J4TDgwaDZSQy9iTktkelhH?=
 =?utf-8?B?K3lvZjBDb1BEbWg2SC9heXZuQkppOTZRVHFTam5TcUczNnJqQUFzS3VHa1dt?=
 =?utf-8?B?MWxYWDhNcUg0cHFtelBFelZKOXN3RFF4SDRXMHdNcHZIMFZhSkpneVdCYnQ2?=
 =?utf-8?B?TE5DcFg4VVBPR0JCeUVIMVJPM0RQd3BYOCswU2hhYStKSkhYSXpXMTVMOG1O?=
 =?utf-8?B?K0FQZmJUcDhQckVmQ0gxM3ZDTlk0VWFkdlhDdHFHZzlIWGVNK3UxSkVPMTU5?=
 =?utf-8?B?eWE1RW1DVllRRHN3K0s1aHJjdy9ySXQ1L2FMOE5QdHdWTC90bjlGT3RwR1ZS?=
 =?utf-8?B?V2g2NUgwa1JrQU9SdzE3eXBEL2xobi8rSHczY09CUTl4eTNUeVlRc2hMb2hs?=
 =?utf-8?B?RzlmQXZNQVdMd0pEUy9IUlNuZGNOUlFFdTM1c1JIdzZCTEdYbEUxaUttemdk?=
 =?utf-8?B?ZUMyc1BWTmlXMU1UYU1uZUpKcG5TNlpzcVNyTWlCcktwZUFnNDBwNm0vVDBB?=
 =?utf-8?B?cjhsQ1Z5M2VXSU9zUk9yK09MQ3lacnJrY3dxUTlVTlR2UzFmbzBRN0YySmhp?=
 =?utf-8?B?TUVOeXlySzBkV3Z3TTBuZjFKT2wzbDNVWWw3c0FEdnk1dVViRGpKcmNTaFdw?=
 =?utf-8?B?T0NVVmRvNXMvTkpJL3Q3ZUhtUmhGQ0F4ME9PdmtvMlE0WlNEcjBFUTRXNkdT?=
 =?utf-8?B?M1IzaDdQbFphTXNXZitCLzh4ZEJmKzFGMnphZzJnbTVqc1hxL1ZSSDhzSEdk?=
 =?utf-8?B?OGdRSlJ4aERWWlFmNkVCMWtVdVVaMjBNZnM1ZnczZThBVWp1MGxFQ3NpbXho?=
 =?utf-8?B?T056WWtpN3NaVWk3Q1hPd3ZUdFRvZGkvT0xST3pLQzBsY1VXN29zdnNCSVRh?=
 =?utf-8?B?eVp6SXc1eHc3SEJyQ2oyK0dJVHg4VmozaXVhQmk5T1VsUDBoZjRtT0FmRUti?=
 =?utf-8?B?TGkyMXo2NTBEalJpVzVuREVmVmsxZTFLNHRnT21iRW9vK2t4aEZBc2ZpT3Qx?=
 =?utf-8?B?UmRnWVFxclZmbUZWSTBubkNDUHFhN2pDajBLWU5pKys2QmJGNVlVQ1h0WDZR?=
 =?utf-8?B?YnFENzZTRDRzUVNoQmxqM3Q4c1J2UlRwQTV2eWpnTkNpUmRWS1NqclV5MXpm?=
 =?utf-8?B?dWlHTTZJcDZvbDBYSk45cmNZWDJTQXNqOERlaGZXYmtNNHpyOFJZZWV2V0pY?=
 =?utf-8?B?RkZGSnlMUW12aEdvQzhkSUVYT1Z1ZEllOHBzRWtSQjJwYTliRHBiV3U5SHhi?=
 =?utf-8?B?eGU1d0R3Tm1wbU5NUkpkVjlqWUVkeXJCdy90UlJ6UkR2Vk1OUW5xWnRzWjhh?=
 =?utf-8?B?ZGlzbzBvOVpSME9SbFVDUDR1RTlmVzJ2VE1sTk5HanJFNmFOMFI5NHI3Z1BJ?=
 =?utf-8?B?V0Q4SVRsS3ZEM1FqbXYwZWU2YlFJRTgvbG1KVEx0T1FEYXNvTmJYVXhyQkdC?=
 =?utf-8?B?MDI4ZUVObFlNUCs2UjJVV2Vrbm1CZnZDR2lXTThRdGx5aEpOSE0zZlV5MUE2?=
 =?utf-8?B?Q2JiNmtXdENGbFJGdTVJQnRYd3BvdzFyeFRTYnA2M1gwR1V3aXlvblgxUVRZ?=
 =?utf-8?B?Slh0N0UzaC9ubnR5WTN6ZHBJMnJXMllmNUNDTW9iRXlTRzF3WDFpQXRSdDlN?=
 =?utf-8?B?REhLNElrd1d6Z2RPcmprbkk5YUEvdy9iWVQ5RGpPczlETzRVaWNwc3JXUmNI?=
 =?utf-8?B?bVJOcVVYbmdPK21qVGUwQTVPL3RKM2NKK1FDcDFRd2tGUHR6djE5Q1NmRzZF?=
 =?utf-8?B?UmV2K3NDME9jcXZhc09oRzNpa0ZtaHZWTHJ1cGVaRmVoWG44RUZhbEErRnk2?=
 =?utf-8?B?UTlFNmxscmhIWVBmdFdKYlJNSFNGclVzT3ZLNEE4UlcwSVIxaHFuS3JHNlcx?=
 =?utf-8?Q?LZw5rq6iYvVrwERQG0TtHSLMG?=
Content-ID: <0BC94EAA87A5334DAF366F20E601B715@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc356b97-8c8d-463d-6958-08dad2b7bc8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 09:46:20.9979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5tdw3pQ8G73zZwCMBJkOJ+ZmpxOBGS+qMxFbEVfOOImLyLmi/8T6InThE7wHydYtgKnjT/GohtnoDzQmlEirNNuKtcCKWMoYujkJnvFQZ9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_014624_865018_E20A379E 
X-CRM114-Status: GOOD (  25.72  )
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

On 29/11/2022 19:45, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hey Drew,
> 
> On Tue, Nov 29, 2022 at 03:34:47PM +0100, Andrew Jones wrote:
>> When a DT puts zicbom in the isa string, but does not provide a block
>> size, ALT_CMO_OP() will attempt to do cache operations on address
>> zero since the start address will be ANDed with zero. We can't simply
>> BUG() in riscv_init_cbom_blocksize() when we fail to find a block
>> size because the failure will happen before logging works, leaving
>> users to scratch their heads as to why the boot hung. Instead, ensure
>> Zicbom is disabled and output an error which will hopefully alert
>> people that the DT needs to be fixed. While at it, add a check that
>> the block size is a power-of-2 too.
>>
>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> This seems to be failing on nommu :/ I've got host machines issues so I
> could not reproduce it for you lcoally and paste an actual log, but if
> you build rv64_nommu_virt_defconfig I think you should be able to
> reproduce.

The actual error is:
riscv64-unknown-linux-gnu-ld: arch/riscv/kernel/cpufeature.o: in function `.L0 ':
cpufeature.c:(.text.unlikely+0x8): undefined reference to `riscv_cbom_block_size'


> 
> Thanks,
> Conor.
> 
>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>> ---
>>   arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 220be7222129..93e45560af30 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/bitmap.h>
>>   #include <linux/ctype.h>
>>   #include <linux/libfdt.h>
>> +#include <linux/log2.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <asm/alternative.h>
>> @@ -70,6 +71,18 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>>
>>   static bool riscv_isa_extension_check(int id)
>>   {
>> +     switch (id) {
>> +     case RISCV_ISA_EXT_ZICBOM:
>> +             if (!riscv_cbom_block_size) {
>> +                     pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
>> +                     return false;
>> +             } else if (!is_power_of_2(riscv_cbom_block_size)) {
>> +                     pr_err("cbom-block-size present, but is not a power-of-2\n");
>> +                     return false;
>> +             }
>> +             return true;
>> +     }
>> +
>>        return true;
>>   }
>>
>> --
>> 2.38.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
