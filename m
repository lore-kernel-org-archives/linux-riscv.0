Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F52C25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 16:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3digP7DYetkOMnhWs/Jz/VdagdQlX5g6nSfTe5Ah85g=; b=a2fAlCTKlkUouh
	bX+U65/kiysT9rjOij3GzJvBpbJj3/v/8f0omo+Xvk1b1FiDcZhJFn+JPDgIZPcZcJvZH5izYrSXL
	SPoTNwXz1FZH8227QPJ/Z2yspfTD8RKXpyK9mODVG2eV+Hk9dqTE13kV4gUwUX6Uvck9CA3cG8I6B
	BFLMEs5S3VgtaDA7jjIXFt3fs3eTtOoDYAu6ZJ7w6sIJB0TfhCaOucj5FOcK3AQ3Nfu3Vql60gNg1
	ORJVtJP2qLJYekDMhyx/e5elWwJfqHAmFeCVSkMOL7xgMJw3OdRPZ9KkBFcx+MzgAKpz0jqiUWQox
	Oo+L5/xkrkILIf6fy2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNzYv-004i82-16; Tue, 16 Aug 2022 16:37:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNzYs-004i5u-CE; Tue, 16 Aug 2022 16:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660667823; x=1692203823;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AjywHmQttnW4Icgnxk6aRnicPMKgwI1pwefk4i2byQs=;
  b=GK+FLl8HeKmUOQSIlZbbhioMb7tm6mydBHyC//eBZpRrNaMcDD43+jH0
   IgXY7OPbOBiv2tRIVQuRS2zLh4Nm9ulD2kUrxL8uiQIyNGZod2P9tMMlN
   OPoa/irBuDhYaAr5juPxbl0Pt5KK6OEVRLVJuaUhC2HOKCCw9A+7anz3T
   VrpV+49f75yhXqdjqGxGFY6RSXcpu4e+plSKJ93XR3LGYcz0soiTp44Ka
   tOPNAE5EfrFYtQ4kVqi1LvlrNKxhIDqH793tzaQz/1Q2CyX5smoIT47NL
   WtHZJjNZxDpFYR+GqyFFJPwIdbUVpPHyXifUIty05zfiu5j4be5JjakGQ
   A==;
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; 
   d="scan'208";a="176480184"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Aug 2022 09:37:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 16 Aug 2022 09:37:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 16 Aug 2022 09:36:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RepKIrNKAmNtRFVaYFWuaA05gr5Senyp0KsAL/56sS9DublCnPq6kSbQunXOxZOzLyso25LplZMjn2f7C3fqWZ5ZJf/2COabcoynnAgA5UQLdlN4bGh6S+ruEtzwMbJSlwmgSiTBD63L28nqt/k+fPC+eDO37STukQrAvrYYWAfg/eTxyukKbib6cTHZ24PB+yfayB1MWx6Ux6zwTfxf+RxJyEBx9IAsULEFwVKix984UsqMc4rDCOu0oiqhrcXR/j8tFjjk/Pze8hUfsjsleYqTfu+JVQ6XMAwcRAc3k30EEZVDBrVGeT+zTmY9qWDDB5IJ55n7qwfO/lT4X+M+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjywHmQttnW4Icgnxk6aRnicPMKgwI1pwefk4i2byQs=;
 b=W2W4OD3oS+v97pSP5Nn+7etIjdCqhmIfS6kAMfmFS6oXWE+VbLKAlJ3D/AcVs/kTaCa1qZkWNS+/fvy6WOXPB4bkiWlDviVRJT+iGBdaokIbhQ9nJLe0QPz0eLA978tXIyRFMCzPtz8V/2WaySP0RvihRD6ZsNBF8r/p3PgsFt15M1N9PqvE/m1zJQItE15Ck9YGuynMUcPPLh0U5JXLy2SH8QJxby4Sx4dvO0j/h2lS5TnCiW+7fxHsD02AActKs2pBuIK0Mjx9WYw3hlMmiIJFu1/uFrxFC6r2FF+4yFbCu95nsj8+5XrW1kENhrdWy4UuYlPFmwqygzv3uWH0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjywHmQttnW4Icgnxk6aRnicPMKgwI1pwefk4i2byQs=;
 b=chlbjntdC9a1bRqt/wKvTVhkxYPCJMBmU92yegnMGsD9QXdbk7T8cYovlF1ueLMvlTaQDjN74IGauKCSzFWB4E5TgBjZbh67V1+0tTGv9fXpbLqQuNBC82tUqCGrTPeTywC6ZlyPlE4MNeToHwmSpDZgVbGA77dHzKyIDrJg5Sg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA2PR11MB5195.namprd11.prod.outlook.com (2603:10b6:806:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 16 Aug
 2022 16:36:55 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 16:36:55 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <linux-riscv@lists.infradead.org>,
	<kvm-riscv@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <daolu@rivosinc.com>,
	<jszhang@kernel.org>, <palmer@dabbelt.com>, <Conor.Dooley@microchip.com>,
	<re@w6rz.net>, <apatel@ventanamicro.com>
Subject: Re: [PATCH] riscv: Ensure isa-ext static keys are writable
Thread-Topic: [PATCH] riscv: Ensure isa-ext static keys are writable
Thread-Index: AQHYsY2eGYLw8iAi7E2kcFjuy+7hb62xua4A
Date: Tue, 16 Aug 2022 16:36:55 +0000
Message-ID: <bef1a711-506a-d07b-dbd6-3a0c5f90aef2@microchip.com>
References: <20220816163058.3004536-1-ajones@ventanamicro.com>
In-Reply-To: <20220816163058.3004536-1-ajones@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad2352db-5e62-42f2-470e-08da7fa587fa
x-ms-traffictypediagnostic: SA2PR11MB5195:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0el7w4ga0l4iOlp4iQJtSqHDKxYlRrCHQ/JhcoU2igBnr2X2mtyB1KycMWhrNRGx3sERbBKFo5XFCn0RyReI010wj2LBV24TBwSAVyKY/EPKP58orQWPbhWu1TLoqFE1thxvZLvDtNP44G8vJBXNsh3zCM388VoyJfPCVh/4X+zxgd387g4cfRUxmCtOj9XAuF9JIdQQBRTUNwyC7M3WL2YGWcRy4p8iieeFrQNdel1084Y+vFdig98SBKdSnhOjBpGJEH6Or8JNnjOqEs1Vr/yDvJngfr7XSQIFHAEusSh//KGmd+LHmIml9A1IbCXTFWyqA5HhN7rFlIBiW9h9w0zGUlpNSrvJipinwg7O60nVW3chmEd2y5W4WIx0jTGwmC+gQJV9ZbcorCeADHjqcUQNaQ+lzX/aJbOU8c8ktgDU71z2G6P86seKdt1QfW7Fa3np8DrYjax696QOwnf3oWXnmko9jcmMTqSW0UiP6DHKnuRdq1DP1vS41YX5/gd+yWZQhQzSbFn3TkbixR3B7n96JZcD6a+Cyt30IQMnLl0w9TthC4Lr18XCKCHl1/Lfyfh6HfC2Bc/O0sMd8L2frhJxnAuLJ89y2C19dUnnHr/rcy870Iwuaam1rQ10ptpV46Vt3VUdG0dK58Saf0FymAg99tTla8xWDD8QbJP2Ox02ZsTX5jmD6rOUE6BzLH0zhUbpUuPVygYP+9C7HL+vW3IDyDJ/+39kGZ146d0WutV+JJ2vuri/NVa2f/5TcSG74b1M7uHRypqHBMcAAr12ZXWvU16oH+E9J2vCE5TBZC9b9va4a7XVmO0n3I4kyNNhZszm4oklHnV8xF1f+n1qoe6c6vTW2pkZiK8LZ9V9xDo53CL1kmwpNhs5EMnSw50d
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(39860400002)(136003)(366004)(346002)(6512007)(186003)(26005)(5660300002)(8936002)(53546011)(6506007)(41300700001)(31686004)(6486002)(478600001)(2616005)(71200400001)(36756003)(83380400001)(31696002)(86362001)(38100700002)(38070700005)(122000001)(110136005)(2906002)(91956017)(66556008)(4326008)(54906003)(66446008)(8676002)(66946007)(66476007)(76116006)(316002)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2J2VmROVTlSL1ljRW9vSXNpbmRtODZTTTNKNVp3cmRkRGlwZEdvQy9kUFNJ?=
 =?utf-8?B?OEhzWEtQcVdjTFl4Q1h5clFWYzhUOERYMmdxV2RadGhoc21taEVvV29GSm5p?=
 =?utf-8?B?aDNJUGhuazJGQTZjMVdHaEdNdzJXdENyNnhCa09XUUdhMHg3dzdCYVlseDB0?=
 =?utf-8?B?SFFmUVhkNlA5WEpjSVBudHR5Q041MFYyZEhsaDM3L2FsYzhyc0tvQmdoYmNZ?=
 =?utf-8?B?K0xsUkpmWDhWbmNvY1AzdUZ4d1dwN2ZTSmlpbEs2TG9TdnRPYVk3dkxoQThh?=
 =?utf-8?B?bG1RdVJER3Q4T1lJVi9ick1WN3dUazViSEJCQ2gzdi92QWVRRVA0c0dTVzlF?=
 =?utf-8?B?MzJzWThEempFeG1uaXF2UG4xOFhPbWpjQTVVMXFWSnYxZzlmQ1RmcDhjWUZr?=
 =?utf-8?B?aUh6bDhvK2hXMHBJR2E0Wk5jZWpTUEl1S1RzV3IwZmR3a3lHcjlUSmNxS1Bv?=
 =?utf-8?B?VVdiZVg2TUdlcUpMZDQ2SVlmWDZVODhEbXJSV2crOXRwK0pHUlF5R2k4SHFT?=
 =?utf-8?B?MWlCTGoyeEpKQnhUclkrYldzUXNqeGM0b0xlYWNpSmNPKzlRdVl3VDhoRzhS?=
 =?utf-8?B?c1ZRcU1tcHgvaE5zVUpoMDlkUG11eGdBdm9HZ0d1OVJFaEdXK0tyMEFSc3R2?=
 =?utf-8?B?OWpha3JvQVduUEpZVTk5aEF4UnY3WHNEYWdHaDNpeW1HN2loRUNWS3VtMSts?=
 =?utf-8?B?emtzYlUxUElYMFhGZFpOSVRpU1VQdGFtMFR1ai9VY1Npdys1SVpKSHBmeXE2?=
 =?utf-8?B?czJvNmIrelY0eFlBdGxzYlBvYUZPV2hCTWdLQmZTbVF6RURlck1CcGhrSFlL?=
 =?utf-8?B?bExtSWxSVDI0RGpnVnNDbGRkY2JYa3RlZUJwUi90S2tMMFlsK0NzT3htbkFa?=
 =?utf-8?B?M3JUR2FjWVBkWFlOeDNnS1BiU2s0L1ZvS3p6di9Rcjg4ZjgwUnZUMVB4M25s?=
 =?utf-8?B?MEdlUFF0ODVFUE5obkRqN2xjbkkyalkvYkhZaDB4c0EzWXEwVDNRQ1gxbzVT?=
 =?utf-8?B?NFdkM1lwQjltZHZBa3BLN0x0UDVySWJPL3ZrSlp5aHR0V1FpRTMvejNPNDZa?=
 =?utf-8?B?MXFIWWQ1SDVCUW9LaEVCcVlodVdia2xMbWpZOU94SDhSNUx6cFVUZXNSeDdR?=
 =?utf-8?B?TGlsTmVXZEs2Qk0rbzBnajNDekdjUjQ0NGo3V3RiNFlsWlB4c2FNd3VLbzJK?=
 =?utf-8?B?aE9BRDFCVFJ6NUlOSUhpMk1lVTNFTUNLd1VtUjd0VURpL0pMN1BDT1lwaUlB?=
 =?utf-8?B?dTFSS0xKL2NQdVVEc2RyU0hreHR3a1NaY1BtTU1iN1pia0l1bVZ3V1JYQnJN?=
 =?utf-8?B?Mk5BZkNYMmNWcGRWa3FCSDZTc3R6Vi9sL0ZYNWRGZEcyY2JsVG5NTjJ1cXBy?=
 =?utf-8?B?OVdpUHY1bjFZWWQ5Um90MFl3c1hOck4ySWdpb0R5ZjhIc3JGbjRKWVYzYmpO?=
 =?utf-8?B?MkVOT3VXbkpxYWQ0aVdBWFVZT0pDTkdKaTJ5bWh3elBRRGxQZVlGVmJyelY5?=
 =?utf-8?B?NHFDUFdYcExRYjNtYTBudE1ORzM0dDlNejdDWmE0a1VXOVJscGZvTjhOdm5j?=
 =?utf-8?B?TWxvbU8wRkI5ZUQ2VkplM1NwaGhGNlhKalBjeW8wSG9JR1UyQlM0TlVLcWFQ?=
 =?utf-8?B?cStOOU8wd2Y2ejFmaEZlTlVhL2VYVFRBR1lvZTR3UzhQWC9GdHAwVXA3eFZ4?=
 =?utf-8?B?MkRmKzViZ0ZSMFJ6ZW1SbW5nRVdINmlHV3dqOWR5ZmVCUlZ1RGdteXBJaTRm?=
 =?utf-8?B?K3hGZ2VoZlNuRE1GcTluOHlYaERlZnhQSy9Qa0N0TTEydmlYbldPSUVrUUg4?=
 =?utf-8?B?ZlZyaU1oU2hjTkZjZnVrUGZNVisycWZUVjZJK0M1blZGbER6SlRJNXFQUms0?=
 =?utf-8?B?UjZndGVOZFVJY2orK2gwbkJkQzQ3OXNROEI2MkI3SHcrb1lSUDBiQUtPcTlW?=
 =?utf-8?B?aEI0d2FGajR1bWt1MStXZWUxQUhGQTR6RVB3bVN3b2RVNEJHS2oyQjNEbDEy?=
 =?utf-8?B?blNmd2xjWDdOcWdMLzd6VXhMbHZFRDBiMmUvcVdGbU1Jb25tWm53d1k4eUpG?=
 =?utf-8?B?NWtocjhOMElDUTR1eWRLeHhmR0xLSmpOMnExeFlpczNuL25iTXdOL2g0YWhM?=
 =?utf-8?Q?FBC2rCK5DUMKCqrhRbGW9uVY/?=
Content-ID: <8A50C426CB1ACC4598609A661654BB22@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2352db-5e62-42f2-470e-08da7fa587fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 16:36:55.3691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tN2GDFO32OOSPaBkjZgcgAW0mMnnNMysCCkKH5JaNpYAxaH0IhJyVMbphP20EFQJ+jIE4rgxXp0HH4yA91P7tpqSqJibw93DdQdYFtVhRSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_093702_481220_953D3641 
X-CRM114-Status: GOOD (  16.25  )
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

On 16/08/2022 17:30, Andrew Jones wrote:
> riscv_isa_ext_keys[] is an array of static keys used in the unified
> ISA extension framework. The keys added to this array may be used
> anywhere, including in modules. Ensure the keys remain writable by
> placing them in the data section.
> 
> The need to change riscv_isa_ext_keys[]'s section was found when the
> kvm module started failing to load. Commit 8eb060e10185 ("arch/riscv:
> add Zihintpause support") adds a static branch check for a newly
> added isa-ext key to cpu_relax(), which kvm uses.
> 
> Fixes: c360cbec3511 ("riscv: introduce unified static key mechanism for ISA extensions")

Hey Drew,
How about adding:

Reported-by: Ron Economos <re@w6rz.net>
Reported-by: Anup Patel <apatel@ventanamicro.com>
Reported-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 553d755483ed..3b5583db9d80 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -28,7 +28,7 @@ unsigned long elf_hwcap __read_mostly;
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>  
> -__ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> +DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
>  EXPORT_SYMBOL(riscv_isa_ext_keys);
>  
>  /**
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
