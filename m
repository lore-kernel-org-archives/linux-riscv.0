Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22447C38145
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 09:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWJeRSSyxW/bzM7gTiF1XhOJjn07yyAZHneqfyUoz2Q=; b=n6AHbl80QYvyo+
	RcpTYADjaKwU1pevMJxGj4OkwaZcqVhNdBiEKpd2zBWPpMQsH0yR7y0//W00wt2fI63txmlYXi2TG
	26+zRBc59PZEw/69+h82pRDqq7aX7RttLiaywECra+i5cwCQzRuRIcq4f58qBVL4ZYV19qawtuEaV
	5C7qyri8KxePUobftBIPKB5vGipFImFLh51mi/wPvaue4UYzakP6P6zvIElTo/XNserccdnuW2oKn
	XxCTlLBofFPsrVCDoNRknKf2RmoW62HjXL/rUwvY1AkbkWDmRbzv50r5iBAHSjQZ2padsLvDbhc+R
	fb3/b43ooIUZXjDfi86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3Oo-0031UP-14; Fri, 02 Sep 2022 09:55:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3Ok-0031Ob-Fq
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 09:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662112538; x=1693648538;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0XMP2CpXyNxcQaYRbe7PKCPpR41a3tHZZe13UP/7+fE=;
  b=lJiV/ZzfmBnfzexUYva4eyHRLD+UpCdwvfO3U0LS7gHi3ci3aAi/hH3l
   iqzSXBsWGmRnvPimV+e6In0HW0XlzZ0X6Rpp+PAjd1kgvA628G0GhyMKF
   dPE/BG4HFjS0ysQfloAsyo1euFvyxmk4eQKu7u+CunIYyTWjeEPGotXMh
   xdjNWdWkoYvpj9IZjiyOKeKuaRboWikVvKA7OZehosRakPrf/zXQ6ARG2
   TlXMYSfoFu7l55d5cx+J6LtaESSXuq/mreXSa/aVQ24uh/XAanfnErIMz
   vDq33xbQdocszYvpbl5BPCJWjTx4TU26W1pksCAv7OvK6QXFsyocOL5VC
   g==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="175353484"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 02:55:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 02:55:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 2 Sep 2022 02:55:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mv/s7OUJ+snfCHUVfgUMCRmhDkhZrnpi6kvUxP+pOWfLi5eV1guD/xwM/61vdMzm7FbG+krVIDIkSSK2kyZJPwNhfjJay8J2JfOM4Qqz2InTkGc0Dh+4y0VhD+TN9Q6FhlUewoq6qKbRbxlrIzEf7ndNzlV9/t34l4Q9SHT4EGpl2pvYjczd6hQm/2B1WSLYO5tOEhE8ANbCwe6pfOFDNpfOR8QwxcmqkQiSiIF6FP+uQvyjCxeUiLIcQ0PqArYuOwOLzgHdN5TXuGrgfng+tykYseKBswmMDGe/QIERAiZBa7Pg0JdrCWayC+jVTwAFYv69WWjo3HwnCxeLzhLLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XMP2CpXyNxcQaYRbe7PKCPpR41a3tHZZe13UP/7+fE=;
 b=CZ9vlaqs9PPscsi+EOwS5hMO7gfRNkUnFvjnooDT6pmXp2IIdCUT5QgxY1ha4jsPnuRKtrmhKJN6b0on0Q8j0zEyX9osz/BH2L9z58o552LVUCrR/EqBgDzo2YSzOMnqOPQGJMwvEC8Zx2av48Hj5JPb+tQvzNcvC1ciSzyPhhxLvyplDFvQ4EOPlPl6ZwpV66dGtsDqaawLHZYy8lUdGRi32OwmlCso1V75ItTrravvP+mzZ3drZR+AuHvkylzyD4ma0S5i4kqxnlgPM6z9550Yr77ieN+41vfUIkMQ0xmQY6n7eSs5KzgUnheZ8Q6uFAIkpfInf3UQo59pXg01dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XMP2CpXyNxcQaYRbe7PKCPpR41a3tHZZe13UP/7+fE=;
 b=OG+pVIjT+U2/IeQ/0eagjGpdTrN7pjx8PPwGiRJIR/OumO1ntMlVlwoPmduZesAMQ1q3YQOkrGZ4rhexlgmNOd3sSAuJClReC9AneTbnCzHojTMZVyugO0s68qq54VbohmHlsP6DcHAdtnyiKgd1AXYNFd3wrVeZt94wvjbMt0M=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH0PR11MB5109.namprd11.prod.outlook.com (2603:10b6:510:3e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 09:55:28 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.010; Fri, 2 Sep 2022
 09:55:27 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <linux-riscv@lists.infradead.org>,
	<anup@brainfault.org>
CC: <palmer@rivosinc.com>, <lkp@intel.com>
Subject: Re: [PATCH v2] RISC-V: Clean up the Zicbom block size probing
Thread-Topic: [PATCH v2] RISC-V: Clean up the Zicbom block size probing
Thread-Index: AQHYrmWTaMkFgwggr0icYeiN4P0UD63K2iaAgAEtPAA=
Date: Fri, 2 Sep 2022 09:55:27 +0000
Message-ID: <34dd1ff3-7202-d6dc-55b8-fe2830902995@microchip.com>
References: <20220812154010.18280-1-palmer@rivosinc.com>
 <4581901.fW5hKsROvD@diego>
In-Reply-To: <4581901.fW5hKsROvD@diego>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 675a728a-7016-4aa9-2520-08da8cc943c3
x-ms-traffictypediagnostic: PH0PR11MB5109:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KCwUWW/VdKTa04cH8US18r3fyf3fEVPoRo155UXzgawPRW3O+17Zy+2TmJN4extD9xzeaYqXKvf0BQHvoohCHKyhQBe2ztj8HBKLjGnHACMJ8EMCSaeoeIBAhBO2RWJFgXL27mptfx8H+0HQyx9GJwtnNTNo8j2FYz0co1jlygZxNM5Wcze2fJdCSaLZ7pgAyvzdOvxMDhwK8e03pqA2VowUMoYHRKt+X0VguGPPS5VZRFnn/R/dtQWS7fiS27Gu1riLYKSqNmSjiVkWJ69OBKIPjLLwMOfJckN0wXGGphHur++aRfWsWW/+LVJMShP6Un7DG68qRKlMyerH5EENYI8Sx55wGZUTm8jfUQ/MXUZjAeHZTer+iJSBRV8tyag7Qfgu9Yo0BtLpIgWJCjCYoOVHK+hZLmOiBfC+C0WyYrZE1U3br5pGXNfxi/yLA1ws67C89efIAdaBcgxda413B61CxLN6kI7Gm45juK/9Mhi5kLW5qORmkim7KgfiMqB4OOyn/RuEo71K17LaEYs1VqLSkpUE7XtGI8dOA7uZn/2heUtNOJ/MiWq3hwlG2BkM88mEQFSHfCVk1saR+q3Pitp/E1r8jGelX9uatcwwwzmdyHIEsEkT/g7FhrSoJpOV7oXl8zTQigHS68ZFDoDyUH9N1fa0/cmuiQyudVxyj9odOIb30R1Gp4GHuPOM/D1myKpiRZ9zrE+kJojBAyq+LEt4R38RQazpEjkBnfHMDkqOim0MNyZ4S99ma0vgHxHWOLLtT4w8/VhPCyhD0q6ZVdggsX21cMvU6/xJwUZr0NCp5ARbcqEGwgc3y2JtPXBlC7q5Yyx7vcYJoaTEEGu6etIIl/n5zDLY7i7cYFcw2PU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(376002)(366004)(39860400002)(396003)(66574015)(53546011)(31686004)(86362001)(31696002)(122000001)(186003)(6506007)(41300700001)(8936002)(110136005)(71200400001)(316002)(36756003)(54906003)(8676002)(6512007)(2616005)(66446008)(76116006)(5660300002)(478600001)(38100700002)(83380400001)(2906002)(91956017)(64756008)(966005)(66946007)(38070700005)(66556008)(6486002)(66476007)(26005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGU2R1FTTCt1QjVIVzM0eEpKdGhkQ0xid2owSHc4b3Rremg0WmZvRlN6SDg0?=
 =?utf-8?B?L3RUOTRVR01qbldaWFZuenk5ajFjcnA4UVZkdWJSeHRQU2IwYnNmandaNndw?=
 =?utf-8?B?dkFHM0laOEdPVTQ3VkpNNldBQnoybm40MTNQeGVGNFBmTk9CRXYvejFCUDkv?=
 =?utf-8?B?K2xxVjZ0N0FTYlNNZndnYkhsZThETkJDUC9sbUdUT2p6ZmNtWjZqNEFvMVFp?=
 =?utf-8?B?YW1ZKy81T2JSMFFyTlZpT1hvMXlUelF1RXJVTDkxK3dTZ0dCYUQ3VnkzTFB0?=
 =?utf-8?B?cExPa0l4M0w3Yk93dW0wem4rR3dQcmpTeUtKd245dmovaUxVV0xpeU9FNVhw?=
 =?utf-8?B?ZVdxY2tydUZVNW1zZFloZk03c3gyVUthS2tWdnBCaEd6bkJDZW40dVRDZ2VN?=
 =?utf-8?B?bFNPcWZrdE0vazNCSHBNVSs3MmFoQ1FMeUF2NHEwdk9JUG5rZDQxU0g3YWxT?=
 =?utf-8?B?dzk0bm5wR2RwalNLOUNXODQvb2dBQy9TZEtHeWNieXB0NjhnYmY4Uy9LTkxv?=
 =?utf-8?B?SjdnbEw1TFhLTFBkZ0cxN09lUjhNdUQwb2RVRmVQWnd6cS8xM2dKa203YUlk?=
 =?utf-8?B?OTJ0dXN3NERUcVBtdklMbjJTazlMWE45bXArRWhLWTRqay9iMVNvYzRRZTR1?=
 =?utf-8?B?VVhDOThjOFpkOWJidGpoVUp3Z3grU054cW5vamhMRENYNG52YkhFcW1LMXRR?=
 =?utf-8?B?TlJEeGNHbkxReEdqZ0ZzTkVVL0d4bWd1YUljNENRZlZmK0llWXlKd2MyN2h6?=
 =?utf-8?B?MHNSRk1FdmxWUXduTDFwQnRBaG5FSmw3NUpsc3JpdEhoUGQ2cUppT24rWU5J?=
 =?utf-8?B?ZGdVNDE2TEsrdHNtTWRKTDFlQUd5TWtzaXRob2lIUFZQUThDU2dIUmUxQ2pt?=
 =?utf-8?B?eGY2SThRRFBpT2NWNVhLN2R4VFFNRnRubkI5N2d5L3c0WUdydE1nMzV6UlVz?=
 =?utf-8?B?eUdBNUZKUm4zQjkwZ1paSklEbXZvbWx4NTZBR1Ficld5cTZYZVpSRG1obTFG?=
 =?utf-8?B?TytqclFEME1HR2s0Q1Rod1NEZTQzZUc2bERPbEJvVktyR29xK3pwc2ZXSzd6?=
 =?utf-8?B?NTFBRy84Vy9uaVQ0N2NiRmdTS25BdlJZY1VBSGlQb1QzdSt2ZEo2Y0xFbzFR?=
 =?utf-8?B?SGdmWFdwTmpOTG9NalRUdyszWjkwYmgwcjczSkpnbDNHOHdadjFtYWIyazJv?=
 =?utf-8?B?VkE1elBqb09jZ1VSZzF2TnJmcGRYTVhyeDkzWnNOaWlpeHJnaXBVVmZ2WGtJ?=
 =?utf-8?B?N3dLUkhtbjVlNVpEcGhTMzJlcnRwb0tMVWljUmlWR1ZqN2w3VlZHc3E0bkM5?=
 =?utf-8?B?VE9VQks4aXQ2Q3llcUkwWERyVWI0Y0p1NnNrNkF0anVyWkwwYTA4ejYxSGxh?=
 =?utf-8?B?R0hzVngxcXJIYW9LRUcvckpqU1R5aVhieER6V294ck9WQmwvVC8vTHNNTzRC?=
 =?utf-8?B?MFVWcXdrMkJvZnVRdDNidXpCTGlGRFk2WUtZRzhlc2Rxc2o2QzNSRFlRUmFN?=
 =?utf-8?B?eHNnOHFUNTdERU9nTnlUb1hva0J6dDM3NGRqMUdBNi9GYlhwSmdtaFJUTXBL?=
 =?utf-8?B?QmNRdWdMRVRtaS9jVDFDWlNCeVVOOHdJRU1uZFFUbThmQlNvbExFblM1MC90?=
 =?utf-8?B?b1JhdVd3MjlDWHlTY0MyMVR3Q2hJRUNIbTN2alBHQVhhaFlPcUpmY2JtZklP?=
 =?utf-8?B?d2VWZXd4QWFxYU4zbFdaNHpSSXRicVFCMXYwS2cvcThSYk93RmZjcG56eTIw?=
 =?utf-8?B?aG9lL05vZG16cFdjVE9YM0FWcXFLNW82YWoxSUx1SUsrRStNRmhyWDI5VVNL?=
 =?utf-8?B?ZnVQYWNiUTZvc3NhSjZiY0ZBejVKRzFGVENuRDNGWWVsdldWNzBHU05VaUxl?=
 =?utf-8?B?VTRVM0NrQWU5cFl0NmlvRUJEcFBTQVBJSnJKQzhVeEtBMVZOYXJmbGV3aWFI?=
 =?utf-8?B?Vjg4NmxsdEswSDludEthSkg2bUdZclFRd3cwRGlrVFBwQkJrcDdLVmc5VDJ2?=
 =?utf-8?B?Ri9UM1pwVWVxa08wQ2JDWmxCb1V0alZHdW9iNG9wNGE0K2k3eHZ3TXZLV3BB?=
 =?utf-8?B?QUo3T0pYejd3YjhXU3JTeUZZbURvRzlTQVIxblVVZWN3UXl3QUZRNUxZazh0?=
 =?utf-8?Q?RTpoMaf2gV7J7+Fq3yzhvru2Q?=
Content-ID: <4C6911EC97714344B1C997CD6B390200@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 675a728a-7016-4aa9-2520-08da8cc943c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 09:55:27.8899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HzvUJuxVX/JbkfDKcBgl4rYw172YI80ZcACvpaBToux4swammqDWWct9r2JS5DhUApwxMCp8/bvdV9/5/ioyVuIRsWOwek+8/v36HIxmLCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_025538_694367_0C39A373 
X-CRM114-Status: GOOD (  20.99  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDEvMDkvMjAyMiAxNjo1NywgSGVpa28gU3TDvGJuZXIgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQW0gRnJlaXRhZywgMTIuIEF1Z3VzdCAyMDIy
LCAxNzo0MDoxMCBDRVNUIHNjaHJpZWIgUGFsbWVyIERhYmJlbHQ6DQo+PiBUaGlzIGZpeGVzIHR3
byBpc3N1ZXM6IEkgdHJ1bmNhdGVkIHRoZSB3YXJuaW5nJ3MgaGFydCBJRCB3aGVuIHBvcnRpbmcg
dG8NCj4+IHRoZSA2NC1iaXQgaGFydCBJRCBjb2RlLCBhbmQgdGhlIG9yaWdpbmFsIGNvZGUncyB3
YXJuaW5nIGhhbmRsaW5nIGNvdWxkDQo+PiBmaXJlIG9uIGFuIHVuaW5pdGlhbGl6ZWQgaGFydCBJ
RC4NCj4+DQo+PiBUaGUgYmlnZ2VzdCBjaGFuZ2UgaGVyZSBpcyB0aGF0IHJpc2N2X2Nib21fYmxv
Y2tfc2l6ZSBpcyBubyBsb25nZXINCj4+IGluaXRpYWxpemVkLCBhcyBJTU8gdGhlIGRlZmF1bHQg
aXNuJ3Qgc2FuZTogdGhlcmUncyBub3RoaW5nIGluIHRoZSBJU0ENCj4+IHRoYXQgbWFuZGF0ZXMg
YW55IHNwZWNpZmljIGNhY2hlIGJsb2NrIHNpemUsIHNvIGZhbGxpbmcgYmFjayB0byBvbmUgd2ls
bA0KPj4ganVzdCBzaWxlbnRseSBwcm9kdWNlIHRoZSB3cm9uZyBhbnN3ZXIgb24gc29tZSBzeXN0
ZW1zLiAgVGhpcyBhbHNvDQo+PiBjaGFuZ2VzIHRoZSBwcm9iaW5nIG9yZGVyIHNvIHRoZSBjYWNo
ZSBibG9jayBzaXplIGlzIGtub3duIGJlZm9yZQ0KPj4gZW5hYmxpbmcgWmljYm9tIHN1cHBvcnQu
DQo+Pg0KPj4gRml4ZXM6IDNhZWZiMmVlNWJkZCAoInJpc2N2OiBpbXBsZW1lbnQgWmljYm9tLWJh
c2VkIENNTyBpbnN0cnVjdGlvbnMgKyB0aGUgdC1oZWFkIHZhcmlhbnQiKQ0KPj4gRml4ZXM6IDE2
MzFiYTEyNTlkNiAoInJpc2N2OiBBZGQgc3VwcG9ydCBmb3Igbm9uLWNvaGVyZW50IGRldmljZXMg
dXNpbmcgemljYm9tIGV4dGVuc2lvbiIpDQo+PiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyQHJpdm9zaW5jLmNvbT4NCj4gDQo+IFdpdGggQ29ub3IncyBmaXhlcyBmb2xkZWQgaW4sIHRo
aXMgY29tcGlsZXMgYW5kIGJyZWFrcyB0aGUgVC1IZWFkIENNT3MNCj4gYXMgdGhleSByZWx5IG9u
IHRoYXQgZGVmYXVsdCB2YWx1ZSA6LSkgLg0KPiANCj4gQ2FuIHdlIGRvIHRoZSBmb2xsb3dpbmc6
DQo+IA0KPiAoMSkgcGljayBBbnVwJ3MgcGF0Y2ggbW92aW5nIHRoZSBibG9jay1zaXplIGluaXQg
b3ZlciB0byBjYWNoZWZsdXNoIFswXQ0KPiAoMikgYXBwbHkgdGhpcyBwYXRjaCAod2l0aCBDb25v
cidzIGZpeGVzIGFuZCBhZGFwdGVkIHRvIHRoZSBjaGFuZ2VkDQo+ICAgICAgbG9jYXRpb24pIGFu
ZCBhZGQgdGhpcyBvbmUgYWRkaXRpb25hbCBsaW5lOg0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jIGIvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJy
YXRhLmMNCj4gaW5kZXggZDRiMTUyNjUzOGFkLi42N2ZhMDc4ZjMwM2YgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jDQo+ICsrKyBiL2FyY2gvcmlzY3YvZXJy
YXRhL3RoZWFkL2VycmF0YS5jDQo+IEBAIC00Miw2ICs0Miw3IEBAIHN0YXRpYyBib29sIGVycmF0
YV9wcm9iZV9jbW8odW5zaWduZWQgaW50IHN0YWdlLA0KPiAgICAgICAgICBpZiAoc3RhZ2UgPT0g
UklTQ1ZfQUxURVJOQVRJVkVTX0VBUkxZX0JPT1QpDQo+ICAgICAgICAgICAgICAgICAgcmV0dXJu
IGZhbHNlOw0KPiANCj4gKyAgICAgICByaXNjdl9jYm9tX2Jsb2NrX3NpemUgPSBMMV9DQUNIRV9C
WVRFUzsNCj4gICAgICAgICAgcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKCk7DQo+ICAgICAg
ICAgIHJldHVybiB0cnVlOw0KPiAgIH0NCj4gDQo+IA0KPiBXaXRoIHRoYXQgZG9uZSBldmVyeXRo
aW5nIHdvcmtzIChhZ2FpbikgYW5kIGxvb2tzIGdyZWF0LCBzbyB3b3VsZCBiZQ0KPiBSZXZpZXdl
ZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4NCj4gVGVzdGVkLWJ5OiBIZWlr
byBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPg0KDQpXaXRoIGFsbCBvZiB0aGUgYWJvdmUsIGl0
J2QgYWxzbyBiZToNClJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPg0KDQo+IA0KPiANCj4gSGVpa28NCj4gDQo+IFswXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjIwODMwMDQ0NjQyLjU2Njc2OS0zLWFwYXRlbEB2ZW50YW5hbWljcm8uY29t
DQo+IA0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
