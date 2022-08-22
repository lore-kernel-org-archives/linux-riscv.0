Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B632C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHl2M0rvpGr8RJrqAcopcMs1jp6ibs2eGThuEj2qWlo=; b=31VntqgrmmhgGD
	mq57cWb3TDy4D4Wo7bc2IuZbipMErhvZtlpTDGzC1FwkV0/1LPFLJDB5kiIV6mz6r3vZ3vJ7weGG+
	hfaiR+M34Yc9uaYjkE8hZkBSKIocRIwO1yy/A6vcvV1Hz+rG2YPhvxWD5MIrz/kFj9c+LP/epkyy+
	ef6tlWMNDxPlqV5BlKuLQYM3ugeze2VIWCH28XZC/43ya3jpiSUYipyzZ9oBXo0YthfQEZjvchYQr
	Prakdvh48CF0yPXI6vh0rZpOl48d83LO00EFF99l5vnW8zvXhHtlPb+w5nz+XHt3RFNr4nmSPXtt9
	MvCRRFDqeFaIz4Ui1j4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ4JR-007LKJ-Bk; Mon, 22 Aug 2022 10:05:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ4JO-007LHw-Nh
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 10:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661162738; x=1692698738;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6UNEm1y2Fbm31eA/NEntmgeKSpeH2BSlb3j4bi5ls5c=;
  b=GOgZ899jZ4+LHTbajq0NGsZjyCKSVo/B9zWBo/7YM3f842NF4KbPJXpX
   YhBbXepdv8tpPaxtWdmts9wBIqs45MCXFIufkB68newCW9i5lCmVmdoBs
   BNptcq7ZiB2HkhhwEJWlPiw27IpIwwtK19ftDRlZS4jf7OOaywGshZzij
   7+j8rSamkctHJpkx1DD6jHlZ48h3NVW43G5sqz9kp6XpA1HzTg2mznRyg
   viPUCKqRFVPEcPc4OwaDnFbQUgttEySPuLzBThKajvLq/Pg4cbkcMZZMY
   lnJtfnOUNEorMsM+m8rigYXfAZs2zV1cXBjh+iJVdEfshTZRYfT2XH0vf
   w==;
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="170316298"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2022 03:05:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 22 Aug 2022 03:05:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 22 Aug 2022 03:05:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgbhL2BiuuzMwV1TJ8TVsvPALrYkS8/e5Wd6S2E+GOCG/3ln0AyPYySmasUnkL5HaICb32KbomYERtsw1YFsWdAcgqly/1/k+nqGlQjWL5SdB367odmSIqa1xD/Cc/vKL2nDPGq1Cr5EjQ8eD16W04KM3G1sKMqOk9Sta1B6oFRfiksbuOvWMBK9SWkFhQItLco8Nca4/hwSIiZG8C0KqMxRDhTF1brorKGmsgEukvkGfRagznRaEws12SZ1hZzvoPsRNEmu4tFQXzHNOkmNzJmwykn83cmO5szsMXa1HsdCVTqXNmTHPaVI27TfZi5vl85fVwp2wXNHlli2TnT2Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UNEm1y2Fbm31eA/NEntmgeKSpeH2BSlb3j4bi5ls5c=;
 b=YnxlmaEXjjL7oGILf6F5WyZoOUtHqwneYovFtzbqjcb23eDmxue4r+wipm4G6maAhrOWZYcaytzG9fDgps69Cn8FWkxReSM7EEl9SmVdE+Y7FqwvOGIafseVviZ6liyZZn8a1oi7SjVILyGwJo/Aqc775Bxg3tc2FZZ9tM/DxozAuu09jGuYzZFd3u7L6fPr6Pq5dbr16tDXlT5tVdMOV8FIkpE1cBNefijQqufmc4lNbRtypqnpGg3JYcDq7i21prgzDKz7aVUf2UI0ZkKUD6ARJcVhqjZITrP45l29BxCFN7avWhHsddDavRNnkKExH4bi1p0x9ueDaB3FoA83Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UNEm1y2Fbm31eA/NEntmgeKSpeH2BSlb3j4bi5ls5c=;
 b=Yuc0fFqKoCvxnAKckhn/MmxaXbXc7FFo32YGMUatkwXJGRU9Vpsys4XfbsM+rCgqXF+WZ3CkxIXdTFMl1mzZnYB5ffm97PXAdzk58vvxapnMv1HSVtruwQhersF9dE7mcxhtsRK2lcGDnhiXIQMy6NeVba/ySiEdMF0c3ENANYo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MWHPR11MB1838.namprd11.prod.outlook.com (2603:10b6:300:10c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 10:05:29 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 10:05:28 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>, <mail@conchuod.ie>
CC: <monstr@monstr.eu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <hca@linux.ibm.com>, <gor@linux.ibm.com>,
	<agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
	<ysato@users.sourceforge.jp>, <dalias@libc.org>, <davem@davemloft.net>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<arnd@arndb.de>, <keescook@chromium.org>, <peterz@infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <linux-arch@vger.kernel.org>
Subject: Re: [PATCH 0/6] Add an asm-generic cpuinfo_op declaration
Thread-Topic: [PATCH 0/6] Add an asm-generic cpuinfo_op declaration
Thread-Index: AQHYtVJChkSniyNly0+RQA1QlMixr626qsWAgAAH7AA=
Date: Mon, 22 Aug 2022 10:05:28 +0000
Message-ID: <ac6eacdf-81ad-42ec-3f3e-2db4c5ef76cf@microchip.com>
References: <20220821113512.2056409-1-mail@conchuod.ie>
 <CAMuHMdV_dpijX7YqSR+24wWDQr4roi7EBm1nbhJuWkoidAcCng@mail.gmail.com>
In-Reply-To: <CAMuHMdV_dpijX7YqSR+24wWDQr4roi7EBm1nbhJuWkoidAcCng@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bab0b000-ee86-4863-3fd9-08da8425d756
x-ms-traffictypediagnostic: MWHPR11MB1838:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MEMb1FU1LonvICSO0MW25woeICACrFPoE/rK3ad+ZKkVqOHOhKDUTTcJqeFQu9bZSl/82QaDi/o9GiWVJS5yeWp6cPjqp3jyUuXJ2JMTdsAZAi0+B3By62nGSjB29e0uqAJs7En/N/fHkQTtK9o+EzZFTpLzDk9thogvZ024C94DICoypSO4YoLMtkUsO2x8k2rrWZJpXUmVUQkjOKwnOo7r5ING3J/gnkxXMB4JaEwYzM/hN0bs5hrEbdqWxjTEl6iNDhsSzV2diItQ4LedSMIyh6DCc4ZnhTIsznhNfYpVjLKfoRT3rw/boWRS/1cVrHFP5P+Wii8PfvTN0rmwxf6aUdGujFRcqfaQs9QgclRViGsEKYEKih7wggjdvpMGCnRjg0/x2C07BdzUTYhr4QdFKRJqcsV4CIfvmZdKmvg1mW//EdF5OQX2ynSuU44mhtb5yhLPiAcNSP+VDsoQCAMTYslqBqapuS0uNMSch2usCKjkUBFYj6aOE6FPOyUrRsnEdizi9EDvm1RDcAGqLjpW9tZdNhORJYFSRmsjye6DfO0x9Mby0XujVOwcRVw1No4+nKY7a6+pf/X+0p6YdJ33YrDCMfdss6XbkOT3C0ecj66AE/iGnGE5rtQ4BIFbFehlyKvYy0aMy+J2B4jTeEz74u/luXpIzJLotrHzUTaJJ7KZKoynasFoyXYGZQMzSL5CX9JteMxpdU9vyZz3X2VYSUhoISSWWsSsljP3aKerM1SdTQ/8jseYUXO9t50JXsvC8iSkP9KTHCoLHCNhAUnea+sCoMjVj4VmsgfH40xvAnwVuUWLfO4aJVb29pPUIiLn291JEVGEWegOU9r14uUqUQBLbwX6iC/jyQ006OM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(346002)(366004)(376002)(396003)(478600001)(41300700001)(38070700005)(53546011)(6506007)(86362001)(31696002)(36756003)(26005)(6512007)(186003)(83380400001)(31686004)(2616005)(6486002)(71200400001)(66946007)(76116006)(66476007)(4326008)(64756008)(66446008)(8676002)(54906003)(91956017)(110136005)(66556008)(316002)(38100700002)(7416002)(5660300002)(8936002)(122000001)(2906002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODV2ZU9nK1VpOVNpYVhOWko4RG9aeDl4Umx6a09GUStpNkVDelJYVFVwdzVM?=
 =?utf-8?B?ZldHbFlHTnkzd09Ua2M2Z3FvNWN4SC83NE9qOGZmR21RbENjWTBobENDSnFn?=
 =?utf-8?B?OGNJZzNhaW42cXBhWVQ2S3dNMm5OcFE1amJRZ1djMFFpSTNRSllua3RDK01K?=
 =?utf-8?B?cDkrMng1Y3lBTmt0NGd4NE0vZDdqOWl2UWo4bmJOWkdKZm8wSTZ6N0ZndWtT?=
 =?utf-8?B?aExZdEhRemhoMHBjcTRwNDNTMjJPdWp3cmVYMTNDWjZiNHZidXZUalo0ejd0?=
 =?utf-8?B?UENaOUdZZkYxT3l1OG83bERnTkFrYkpreWhvS3hPMUp5Kzg0TGU2c0pZaGtW?=
 =?utf-8?B?M21hSXRpdVZJQlFheFRYVVVUMzJCL3BZZHZLenVNTkRuYVJMbHZ1NmdUdm1p?=
 =?utf-8?B?WUdzZGxYYUprVU9EdFkzRmwyNkdJY3VjNC9CZ1gxQm1zWVJ3cVF2L2pHMXgr?=
 =?utf-8?B?bXhTbjlGM3RaTnZmbVRNV0FSZUVwMlJhYS9hT3p1VnpsZGk0cElMdUdJUmQv?=
 =?utf-8?B?R2RTMDl2MzI1bnF4Rkx1RDF3dWdzcTRZdjBUMEN2SDJnMEN6aE9JVVBXeWQ5?=
 =?utf-8?B?NHdPb2swUVRMVVVHVmp3YUV4UXB0VWMvWlpEZ2hwUy9MbWkwL1FzeC9xc3Zv?=
 =?utf-8?B?emtNUVIvZlgrUnMzUmM2bWhQVFNBZXp3RjZWR1p6M1ZjUUNPK0NjUzVNeEY5?=
 =?utf-8?B?eUlqMzBCTHVoYXNtblBDNUJmVFRjajBqKyt1UDBLdXRQT0tOaENsV214WW1P?=
 =?utf-8?B?dThTUDdBdUttRHdkUWZGSXpSSlZYZHowVHdjVmsyYi9WZ1ErTXF6eWZXUC8y?=
 =?utf-8?B?aEp2YkFQUE1MTVJjS0QwVTI3bEU3djR2WUF3NzEwRThuL3A5WHlWZi9zaERl?=
 =?utf-8?B?aHJkbjQ5Zk1FMlhXMXVERXVaVEEvT1p5WkdmOG1MWDFiaXF2bk5ZZkxJU2E4?=
 =?utf-8?B?UHhnNXpjNmt1SE1SWDhWZjNjL1Z5MXdzc3VvN3RnMFpLbEUxanNnaXU0SHVn?=
 =?utf-8?B?ZzJFeEpGaHpNNnhUQ0UxUG1Gd0JvdTM5UHRDcXVxUlBzYmFFaTRDRlhDQ1cx?=
 =?utf-8?B?K3ZkVGFOekZFbVZMNmxqM2FsWk9tNG53QnBVRVUxZ2dKaHZ4ZkJ6c0xSVG9S?=
 =?utf-8?B?ak15UGRQTCsyRUsrSTZ4Nks1QXRjakFDZDBCN1poVGJwSk9pREtpSEVhZllC?=
 =?utf-8?B?R0tkVTAwc1RQZVpXeUJaSzk1NFVlakpsSEY5cng2bXUxdEFvRTFPSmlnWWhk?=
 =?utf-8?B?VWNqSi9ad1dwYnJjUUlFc1BQemd3QnVjWU1UWjdyMmRJZDFlMjNUSkJaSGZv?=
 =?utf-8?B?N3VSUmViK3Q4RXBTckZIUnBlbExCdml2UktlVXNLOXBFYlhGZTNFcm01bEM2?=
 =?utf-8?B?RHlkYnpUbnh0ektpS3JlSkFSYzBZOWpHcjM4RGxPWGcxTTBVWmdMWSt5NHkz?=
 =?utf-8?B?RDVBMEFuVEdqL1hSQzVhWjJtVXVjTnZTdk1Xc25rc01vNUhkQ3ZrTTB4UDBv?=
 =?utf-8?B?d3ZNSU80SFhRUWt2aFlZODBxYVk0elc1VXloZGxnYjgrZW1HNnpyZkdxNHBq?=
 =?utf-8?B?WXJYWjhkVUNsOVVQdUdlYjFwYXJxZnF5dXplUUU2SExiWVhVY2FLRC9HL0tv?=
 =?utf-8?B?WEVLMU02VVdSYUlYSkRKeEpxMkl2WU11aWgwRzFYdExqYUZDcC9XK3JROEVm?=
 =?utf-8?B?cGNTY0g4cGxwOWJQL1ovcUFNQ1JRU3Z2dHBNOGxZRk1LT2tFK1h5SzR0WTV0?=
 =?utf-8?B?Z1JpUzUzcHpOdEMxTTFIZUlwSVdCTDVEZWgvbUI3MWtBRjRzb3I5Smc4V29I?=
 =?utf-8?B?c1A0dUZsNzhOZW5xa2R1Q3laMVc2dnRpOUxxV0ROUit1SmtBVnFWSlpDcFJH?=
 =?utf-8?B?K1ZneWFRenR5d2Q4S2pxT0wyQ3Rkc0JaNFdtZnRmcFJKWVgxdVBSanFyN01u?=
 =?utf-8?B?NUEyTHlDbzVUOXB3VDRTRWxoVitaeE9ZODB6RHc0Q2pRMWk4eEloUHdSVEJt?=
 =?utf-8?B?RjQ2aExPNmQxSHRiSmhwSjNmdzFYRm1PTEI1b1ZYRDllczZNVHNaWm1NeFVx?=
 =?utf-8?B?RktOQXRFQUdwRm1HTVczWjZtS3YrNlJBV2ticzMyaC9XVWFNYnY2VmFOdkEz?=
 =?utf-8?Q?3GOayPYyHTyJ3Dgm4094sqtkc?=
Content-ID: <32B50BA269D7734F94F5F27BE240E897@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab0b000-ee86-4863-3fd9-08da8425d756
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 10:05:28.7600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eM++GabOJdqzbyxXPgxMq1H8VX2CYpwgrZZ1Ry2uXqaEojX0HgspWoBiYRSKvSazZR6cD4GfFOnK1dwIC0N3hl6fhxSPoCFHaKh23r7cNhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_030538_871209_0E88F9D5 
X-CRM114-Status: GOOD (  16.28  )
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

On 22/08/2022 10:36, Geert Uytterhoeven wrote:
> On Sun, Aug 21, 2022 at 1:36 PM Conor Dooley <mail@conchuod.ie> wrote:
>>   arch/microblaze/include/asm/processor.h | 2 +-
>>   arch/riscv/include/asm/processor.h      | 1 +
>>   arch/s390/include/asm/processor.h       | 2 +-
>>   arch/sh/include/asm/processor.h         | 2 +-
>>   arch/sparc/include/asm/cpudata.h        | 3 +--
>>   arch/x86/include/asm/processor.h        | 2 +-
>>   include/asm-generic/processor.h         | 7 +++++++
>>   7 files changed, 13 insertions(+), 6 deletions(-)
>>   create mode 100644 include/asm-generic/processor.h
> 
> I was a bit surprised not to find fs/proc/cpuinfo.c in the diffstat
> above. That file already has an external declaration for cpuinfo_op,
> and uses it rather unconditionally (that is, if CONFIG_PROC_FS=y)
> on all architectures.
> 
> So I think you can just move that to include/linux/processor.h, include
> the latter everywhere, and drop all architecture-specific copies.

Hey Geert,
This is the sort of thing I was really hoping to hear, so fine by
me.. When you say "everywhere", I assume you mean in every arch
and not just the ones listed here that already have it in an arch
specific header?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
