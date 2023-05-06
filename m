Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED754C77B7C
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 00:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jl7WBUl/UNuECZxKsndFA9Bkh++srWoyk6rYIAzVTyA=; b=P/zEAM042KwtLd
	TUUofta0tmn5mGZeczSM58XF6x19czd83UwVFLNyvmjRxyHoNCPOEdfJKrggIRqRirxY8bHZcJ1Ex
	3iFNaj7YrTxoUxvzZ57vq+ddAz7/Q8vOf3feJX9GrEfGV8Pzyb91hsu5+sq9WrXIFzHYHDD32LBNa
	10oE0CSaZWVmPFkC4/0ygjebHCoHsGmp09omBCkcCsFPNuMqw29xLmKTk1LYwpTxRnqxeTvvIfDON
	aGkz5vWHF+RXcfzw1jDn1o9CeU83hYsnaF5xYljeZTDFx8zsLNnswMwCf3EncxaFKZmxdimYgca29
	rUBDBlYCX/wk3nF9mRyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv6BX-00CDX1-18;
	Sat, 06 May 2023 00:54:03 +0000
Received: from mail-cusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c111::3] helo=DM5PR00CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pv6BS-00CDV8-2E;
	Sat, 06 May 2023 00:54:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LS1MpF61S0SiLXzXzkxI7LfoQ3vW7euzQ8IObApn5AwVo268iqb2hPiVgffH26wRbnOSvoININAgKdMuHZtzm/XhuFSWDLGcRFjtEEmWto3/vQ8r0hupl8d3Kp3Ca/drU8weVeKiFev/5xlgvAYeXP9SuaXKQxx1EzWiKNU/bSA5eqkbzPF78UkbeFqs4vXGuHjgC0kS6cIvJmNIyzlTIDtYTtn/kh9N9dru1Dz1Lm5bNgmHM3wC/yq0A/DLCX20Nvwr2+ChjmPjIF08Xnpx2eoOpKVKbFaxM2OBaQW3sM5U6mACJPohKTBzIrjRnUjIkpSI71ntOmR+WY95rdOAoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sK/IQvGZxUgMCa0K1Eigw1rYj2UhiPgrotGAq3MSiR4=;
 b=kHfC5XSovSYGyS/+5jTV0QwQSwNaV9i7AbzrU842xsrZOvuXe4PaMeRdSjeA0tGIhfwLOiGlmhfbcetXSZJgbfsv6/QAjCuebaxkCKLMzSyLTgwmklbBVw+SzcWaqfT9TmBUOpiQaEjikyVMvNQo1Y1WD1+zeuTVjc9v3Kk+VpHErHFtjBNeUSvZFJ74Ffy4JWr/eHFxyIe+W66n7/aVh0NRoI2HEyScVohriKYD9xtcoLS38mNHCVYW+Ckthx3YPLkvTnmAMt19fpoib/1He0tIdm7eeZwKM0VQuTO6sSBPwO/a2QKcafw0ubfLmUc3gTnlrilHtWMoXmSMRiAW8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sK/IQvGZxUgMCa0K1Eigw1rYj2UhiPgrotGAq3MSiR4=;
 b=b/hnm1GFlBHcj/2O4ssVnTDvGc/uQDdR+tpq5T/NLUTGLwLHywgdHx/bCkEsGChRv9b6csldT8JyqwDxaGT6WwxxBRewBKNFvGp+HKBcpSyfUYL/2zLgIQyrCUhHOEXHjyeJCeery1RjvkNPQoTh+JcjUURgUMWkGFp5q84viWE=
Received: from BYAPR21MB1688.namprd21.prod.outlook.com (2603:10b6:a02:bf::26)
 by CY5PR21MB3447.namprd21.prod.outlook.com (2603:10b6:930:c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.11; Sat, 6 May
 2023 00:53:50 +0000
Received: from BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::9a0f:a04d:69bd:e622]) by BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::9a0f:a04d:69bd:e622%4]) with mapi id 15.20.6387.012; Sat, 6 May 2023
 00:53:50 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
CC: "x86@kernel.org" <x86@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Sean Christopherson <seanjc@google.com>, Oleksandr
 Natalenko <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
	<lucjan.lucjanov@gmail.com>, Usama Arif <usama.arif@bytedance.com>, Juergen
 Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Russell
 King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
	<guoren@kernel.org>, "linux-csky@vger.kernel.org"
	<linux-csky@vger.kernel.org>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Mark
 Rutland <Mark.Rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>
Subject: RE: [patch V2 38/38] x86/smpboot/64: Implement
 arch_cpuhp_init_parallel_bringup() and enable it
Thread-Topic: [patch V2 38/38] x86/smpboot/64: Implement
 arch_cpuhp_init_parallel_bringup() and enable it
Thread-Index: AQHZfrsPO9aHmT4GeE2OzCti+2hGJa9Macrg
Date: Sat, 6 May 2023 00:53:50 +0000
Message-ID:  <BYAPR21MB168869144087644F89BAC89FD7739@BYAPR21MB1688.namprd21.prod.outlook.com>
References: <20230504185733.126511787@linutronix.de>
 <20230504185938.393373946@linutronix.de>
In-Reply-To: <20230504185938.393373946@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels:  MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=48817eed-6fcb-49bc-9a01-6a43bf5b9b82;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-05-06T00:42:24Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR21MB1688:EE_|CY5PR21MB3447:EE_
x-ms-office365-filtering-correlation-id: ede41693-710a-42e8-4c62-08db4dcc5b7b
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  UOc9Db0wWrh2du3sbXN0q2e69LdewzzfxnEuAoaxPnLtsxOnJnAB9i5KvkPtcUvLUcYvZBqs2LsO/Op4kmGLXv3b53PL7TZ3cuVWyzCXcqCI2qnWoM6iAmETAT7kQPx8lNlJE3c5M1LfwEirdynbOqzw2x+ZnesUsUcpgjqKJZMp9fuIYAzO4+vyNgmeueiyEMKZgt6vRRLoszEtZeFrGzCjHQmN2Fkiz5T7qtnh6Vwxl7aZ5g5ywZtikNZK6HURstJAg8bBygsc49lnxmKrpknDPNVprVXI+KQuGFuJtguW0sayTwbCSyOiRE02N1L7wxFWU4MMYpqrAE+e3keyXLsHgB5Tz3v8Xb/TnXJwyQqNrkwnbMmY3Uorg6zno8dOiyAJiTtyCwTVWosokiYsQaJbqlTRpp4oel/CKQl+VSOT92d8tUsEa2mpDh49VwwMjvbWPlZoZ4wzG9QY388dS5Ea07jeqR6cpjlmLlcvfLyLeA6W/n0kxpzdaL5oimNGNxsQ3s/xc02EOcvSJLguKtDrIuZ2243EzD6Y3kYG438lBjO56Di1RKYe75hDOLB/nXrbxgoLqb7WEQv803wlVcmQKAflpagVQoN5fXvd2+m+MF1yqCgj280TK7fYzgcHQv0G/aKj5gsn0iT9WlGYD6a/UJ4/6N2HCHcxbOnl2eI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR21MB1688.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199021)(38100700002)(8676002)(8936002)(5660300002)(7406005)(52536014)(83380400001)(2906002)(38070700005)(82960400001)(316002)(82950400001)(786003)(7416002)(66556008)(4326008)(66946007)(8990500004)(76116006)(6506007)(26005)(66446008)(9686003)(64756008)(66476007)(71200400001)(54906003)(110136005)(41300700001)(122000001)(7696005)(55016003)(186003)(33656002)(10290500003)(86362001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MVVTR0xkZ0lpelRrMnRGYXB0dDVnNTM1Q3dPVnhheXNHRkIyRjlvYVEvdjFL?=
 =?utf-8?B?RFN4cjB6MS9talI2MnNIZTJtZHViUCswNkMrMUU4UVZ3TDFxRWZpUllGQW9I?=
 =?utf-8?B?bVJOVncydDR4TXdvNWZmL3NJd1J4bW01U3pncjFlZ0hJeDJPOEpBZWpUd1Vt?=
 =?utf-8?B?YVgzMkJhY2ErVVRsSDErYVZwM3pkME45MG8zYy9Sd0NHSFI5RkNtUzRLUjBJ?=
 =?utf-8?B?dHdVUCt1THlsYjErWDF3ZHZsU2hhL1J0ODdJcWVoWGpGejJtWWdyeS9UcFU4?=
 =?utf-8?B?SmFIeGF3YUx2cDZqNktSTERYSkhrR2tIQjZBaHZHWHBlS0tSVHFOWlppUW9T?=
 =?utf-8?B?dUE1WXhxbG5tNnA4R1FzZ3lXdzcwMXFsNURPTmRSSWpYY1g4UGVzK211SUp5?=
 =?utf-8?B?WVNWcml0NThtN3Y4cU4xM0l3S1Npb3RJV2swMzNOVDkwYnBWN2UwclhsZTJq?=
 =?utf-8?B?bEFYMTBnWHRIUDN2cWkrNlErdHd4TWxIdnBBNHZWcTUxWFBrbUhIZ3VFMzZY?=
 =?utf-8?B?WkN3bVdrWGdDbE1RakNUSEREcVJOWGNBV0lULzlCSysrN0Y4ek9wUWw2ZXp3?=
 =?utf-8?B?WGZMRWlUQkx3dDBXUUtoa2RUQ21GSlFlQ2xXOGhGdXQwdElwbTZwdDZsczVi?=
 =?utf-8?B?QVBSTDRiQkpNNms1MTJUanZRa0F3QU1lb2FDLzA0S3pCYzA3SGFzL0ZGRmdF?=
 =?utf-8?B?L1dlYUplcS9rZEJiVFRpM3VIVHpTcTYyZ2Q3VkpvY0NSSFNMWjliejM4VHVu?=
 =?utf-8?B?dWRQaTlsUHZUMXhyMStQMjBkdjU3THNhMitDa05NL0JKT0NycHJPWExZbXpI?=
 =?utf-8?B?N2dObEFueVNsbkV1ZXp4R1laWHZKOWE0ZmdUTVBrY2lYSnJONWwzS2VYMjNX?=
 =?utf-8?B?dlNhSWlsMWpqN3ZHSXBtWjZ4VzYxaFlKbG1uR3RIc0tJZDR3TXZyVDU1NTVt?=
 =?utf-8?B?dlB6VzNuQjRVa0ZOMUVjRkYvcDZPZFYzTGZDOTQwM2plQVQxS3llK2FHT0NH?=
 =?utf-8?B?QWxhbTVsdW1yUEJoaWk0QWpUK2E2ZDZ5NDVCUUlNdjdyMTZHbk84R3lCMFp5?=
 =?utf-8?B?b0xqWkV6MktvWkYvbDk1TGc1RVFKbHgrRVBSUjdmS0h5V0tCV0pUK3ZFZHR5?=
 =?utf-8?B?ZlFkN2xvcGo3S2pmNUZ0c0k0VTNQRW1GRXhCUlhZbW1YZ3hHK3g4eHpsODN5?=
 =?utf-8?B?Ni94cFgxeENZeWlWK0w5cjRxM0pKL2ZGaXFjYXJ3NEM3VXh0ejNUaDd6dzda?=
 =?utf-8?B?YnFXTWVZWUpZOWlqeU9WdEMxMDBTQUhyZmhZcUZPYlByUmVPMmlYNDRwR01B?=
 =?utf-8?B?cjMvb1BTcUZVVDNWMDNnZmp4V0o5WGpIRnJjN2c4dVZacFl4c2szcStnM0w1?=
 =?utf-8?B?eTJ2QnhMUjVibHZvWGN6bHEydGl1cGw2cHoyakFUdUExblF0T2NNSTVacEFS?=
 =?utf-8?B?T1o0a0Q4TlVQMmgxZkw2VnNEVC8xRlNXekFUcGkzWk5nMlJQNVI0eVB1OGdr?=
 =?utf-8?B?UUg3UGdGcGhaYk55WHhQMU1sNHJlNSthTThIalpmT2sxelhvWWtkbVltMW85?=
 =?utf-8?B?UnVaK2VnUWxMRlpSdkhhS1ZTSHlHdUVIZE9IOENoVGdPN2VMUUNMTE1JVEhr?=
 =?utf-8?B?bzBrRTEraXNVNFEwZFViaUxROENpNnYrM0x6M0dYNjR3RFZ3SE80UXFGclow?=
 =?utf-8?B?RytDZlNpbllzNFRNamcyc0F5MUxUN3ZDSnNwdnRBaDRQdFgxOHF5NWhSbUNh?=
 =?utf-8?B?OXRlK1hQNG5LV3czbEdaeDR0Qlk5UzFkdUlGbURoQjRPVnRDMmZ2ODhBRXAy?=
 =?utf-8?B?WDM5Q0NrMFBXVmVtdE1wZkFpcTJHdXAvMWVpaVhSQlpIb000Q0hSWW0zZzRz?=
 =?utf-8?B?SjZHY0NBRm1RSUgvaHNFSy9NdXoxSmxpclBmeForY0RiY3RWYm9oVzROeVpK?=
 =?utf-8?B?WldOMm5sVm5Pd2dEbGdCRTJWK29aRmV0YVFmbmQ2N295N3JmTllaV0JWZjRa?=
 =?utf-8?B?bnpJMGsvbjZZRFNld3pNaXJkUy9scFVKV1U5VEJYRU5XUit0N0h2NlFoWlFq?=
 =?utf-8?B?TmRMUW5CaTdtMmNMK1J4RzFET3VJdXdEWkg4NXQ3RkxaekdwZmp0M3FIVFlF?=
 =?utf-8?B?bE5ucTlNOUFFZElDYk1JbmI3Z1NUNEdOUS9HWk15TEthWG5aVmhPeUxpdmta?=
 =?utf-8?B?Y2c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1688.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede41693-710a-42e8-4c62-08db4dcc5b7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2023 00:53:50.6070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5f63waM6CyyNfW9fBBr2sRx9cC18cFX9lz+N40ZowcuYvVqDxvJLM4ohL5Diajh7fXh+UFKh20WcZBTRuMpfqoZiiLRuRDrQycKnms7QMlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR21MB3447
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_175358_802480_0E15B8F1 
X-CRM114-Status: GOOD (  24.59  )
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

From: Thomas Gleixner <tglx@linutronix.de> Sent: Thursday, May 4, 2023 12:03 PM
> 
> Implement the validation function which tells the core code whether
> parallel bringup is possible.
> 
> The only condition for now is that the kernel does not run in an encrypted
> guest as these will trap the RDMSR via #VC, which cannot be handled at that
> point in early startup.
> 
> There was an earlier variant for AMD-SEV which used the GHBC protocol for
> retrieving the APIC ID via CPUID, but there is no guarantee that the
> initial APIC ID in CPUID is the same as the real APIC ID. There is no
> enforcement from the secure firmware and the hypervisor can assign APIC IDs
> as it sees fit as long as the ACPI/MADT table is consistent with that
> assignment.
> 
> Unfortunately there is no RDMSR GHCB protocol at the moment, so enabling
> AMD-SEV guests for parallel startup needs some more thought.
> 
> Intel-TDX provides a secure RDMSR hypercall, but supporting that is outside
> the scope of this change.
> 
> Fixup announce_cpu() as e.g. on Hyper-V CPU1 is the secondary sibling of
> CPU0, which makes the @cpu == 1 logic in announce_cpu() fall apart.
> 
> [ mikelley: Reported the announce_cpu() fallout
> 
> Originally-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V2: Fixup announce_cpu() - Michael Kelley
> ---
>  arch/x86/Kconfig             |    3 +
>  arch/x86/kernel/cpu/common.c |    6 ---
>  arch/x86/kernel/smpboot.c    |   83 ++++++++++++++++++++++++++++++++++++----
> ---

[snip]

> @@ -934,10 +961,10 @@ static void announce_cpu(int cpu, int ap
>  	if (!node_width)
>  		node_width = num_digits(num_possible_nodes()) + 1; /* + '#' */
> 
> -	if (cpu == 1)
> -		printk(KERN_INFO "x86: Booting SMP configuration:\n");
> -
>  	if (system_state < SYSTEM_RUNNING) {
> +		if (num_online_cpus() == 1)

Unfortunately, this new check doesn't work.  Here's the output I get:

[    0.721384] smp: Bringing up secondary CPUs ...
[    0.725359] smpboot: x86: Booting SMP configuration:
[    0.729249] .... node  #0, CPUs:        #2
[    0.729654] smpboot: x86: Booting SMP configuration:
[    0.737247]       #4
[    0.737511] smpboot: x86: Booting SMP configuration:
[    0.741246]       #6
[    0.741508] smpboot: x86: Booting SMP configuration:
[    0.745248]       #8
[    0.745507] smpboot: x86: Booting SMP configuration:
[    0.749250]      #10
[    0.749514] smpboot: x86: Booting SMP configuration:
[    0.753248]      #12
[    0.753492] smpboot: x86: Booting SMP configuration:
[    0.757249]      #14  #1  #3  #5  #7  #9 #11 #13 #15
[    0.769317] smp: Brought up 1 node, 16 CPUs
[    0.773246] smpboot: Max logical packages: 1
[    0.777257] smpboot: Total of 16 processors activated (78253.79 BogoMIPS)

Evidently num_online_cpus() isn't updated until after all the primary
siblings get started.

When booting with cpuhp.parallel=0, the output is good.

Michael

> +			pr_info("x86: Booting SMP configuration:\n");
> +
>  		if (node != current_node) {
>  			if (current_node > (-1))
>  				pr_cont("\n");
> @@ -948,7 +975,7 @@ static void announce_cpu(int cpu, int ap
>  		}
> 
>  		/* Add padding for the BSP */
> -		if (cpu == 1)
> +		if (num_online_cpus() == 1)
>  			pr_cont("%*s", width + 1, " ");
> 
>  		pr_cont("%*s#%d", width - num_digits(cpu), " ", cpu);
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
