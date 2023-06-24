Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CEAEB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 06:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IyiIrYC/7Dv7RnjXlUocQHxU7rOmwV/gNtuq4Dy1P6Q=; b=thYFAVSmLlJZKO
	0Ww4LepzZShqLtqn/OmVA92xjxmcWOqse1CEBFqSGRvI4GHvK1EyTGr5YSPRaP9ItsmBWwsRA5XQk
	yftwTrk6UvvagPVb5pxhA8VMIpo4R5WxZgAhpR6F0jQPwK9VgqDZf0uL+phbVMZ8NeeWcc/o6cx9W
	y6A+kC61VfEqm1lez+F5H6mFDJuf1BbWBXAl1Z9k7hwIwA+zbUk1RgEN4Vthm+2x21h7nuYzuHCuz
	5WJC4Z+K0wuaSeG6Ex1qPOm2ZrToyg3gfmR19JJpd+lC8NhYrRoKWx9Xk/cQ+7XImimL2shOf+QTd
	o9xND73ybqEKE2Kc5MoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCwzA-005NWN-1l;
	Sat, 24 Jun 2023 06:43:04 +0000
Received: from mail-dm6nam10olkn20823.outbound.protection.outlook.com ([2a01:111:f400:7e88::823] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCwz7-005NVf-0a
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 06:43:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuZ+xUkmLHAKVCuIP/GprTzdK3+3YUDK9JkWb++KfJdAtk+BkGj2Qqbc952aiqC9WXiHoWeGd8j9K0K3ajw9rxLxFDPyU6oVEk17A+6p51Dr5QR+ky0srJ+lulmd3aysokEX5lEo1AoXjr0E4tJwhYXWUlTqtGrRyq/G9vt+8SyVeQ+JJwlpAxBuiv/ASnmaFnJPOr1wbN87TSYF0vXQtUoVnJFyZ4RrdLkNpllb/jTbjhUywIJ/k9ZxHOzYasp8uj643f/FRXKQ4F0pEpI5u48hDUlew73D3M1QVLwsapVhJ4Zwxfuhu34XmIL9B/S+BdYCCLuG5kDKonFJfnQjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwkIOUe4U+b8RAuw4CPLEUxN0fAQxg0fkSh822G2rJM=;
 b=P8bSiIDF7PrQAFM+kBgHa6iDE2TX+Tb56jGxZWpv9iM1rYoo5cp2zC4JV9ZUK3Sk3xW06FVEacYhBiNVRkYurHzqopzRkzbVMqZP1lYlZveaRoFv/kzIFvMk520RMtgHYWM8B+KaIJ71VzGi3vkDKJ36q8DPxFAAkkkf3DF97gHcy7u+aBykUhaEzGMEo9t/qf7k0LHnEhieN8fuEHQ56ID1iVNXVEwyLAZ4QtzzcqUbRkrX5X8EnzI05ai4+OhJZASiLrkzca6SzsyXZxQ2w5QLSS+wLTrPOWSUSM3bfspAAmezFEm7Aza0mO16jck6LSEOpthCMibeha8ylFbbwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwkIOUe4U+b8RAuw4CPLEUxN0fAQxg0fkSh822G2rJM=;
 b=NF9/gUlo2oJ0hJLKDd8IPvtfKNVZvXsvK2ME3Wrez7rjA8OLsfoiYXHF/lZ2+gkq/bhYrXHiFuDJ3cDTT6qSS5BOn/5XqMbGrmdXmOMz3IJnfSC6Vhb4UaFifxMpi3n6rXl6kRf9hgDIWwURlNgOWQEy1rP9E3SQQ0xkdQKh9mmJn6OMaFp38rVmSIPSmu/SpEQtzvSareFquDMpqv+fvgP0GZQIRua1VXOh43UKXDSTxwSp5nFB36XKhE9DfjYG3wV2cyMNvATJXiY6kyGRDmMNOyW3Fb/lbGqLLUMA0JHHsNDqbVIaX4xf9ZYeQFTDt6x1yOKh1XXYrf0RXZYmsA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS0PR20MB5687.namprd20.prod.outlook.com (2603:10b6:8:11e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Sat, 24 Jun
 2023 06:42:51 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::1818:77d9:407b:dcd6]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::1818:77d9:407b:dcd6%3]) with mapi id 15.20.6521.024; Sat, 24 Jun 2023
 06:42:51 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nikita Shubin <n.shubin@yadro.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH V3] perf vendor events riscv: add T-HEAD C9xx JSON file
Date: Sat, 24 Jun 2023 14:42:27 +0800
Message-ID: <IA1PR20MB4953E87F213C869DAF43E69BBB20A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <CAM9d7cis-rb0fozK+T6R8MCEcT0ZF=RRNpv1qAWsLkMfsG6KxA@mail.gmail.com>
References: <CAM9d7cis-rb0fozK+T6R8MCEcT0ZF=RRNpv1qAWsLkMfsG6KxA@mail.gmail.com>
X-TMN: [85rBhpa4gDFPZ7usTjzM6ejtu9IXg4W7JleeOSuQ1ecHEkHB58PCdOD9O2mRKdaW]
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20230624064228.774138-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS0PR20MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: 31eeb946-dad7-4789-35bb-08db747e3b4d
X-MS-Exchange-SLBlob-MailProps: ZILSnhm0P3nDUp8bIAwOWCqxT2NJSXd52YSPdpO4fY+QMor2YIhn4aaG6uniUAOhcCLYODqEjLSMWzqJ3DbtQt+M0CI+UcScpfDxmGmKo7pqCW+3aV6cPERn8MUyDvIu4IV0CuAzT2QjrL6IPGaFwDGcF4scCJAbx6G8k/s4fLZSjiBbytE8WMiG1jmEKwwbMx90VPIh2iV2bSsISzzv9GFacu6Aj1ODn9UMDlctIYmVn0nMLeP8xjmGwB0AJMvoz6Dx5otTCW6lXAuMeIrogqJLn4q0vcp4Ln8h33oV0wTCNu677qFPdXbeLXhZolwXCleILSKKjiynDcUMzjrZYsWvEwII++SmDMJveK5ZmwhvhmOEyBixEliHndlvIHgtrNGuw7yhaJvoS8hjYWvDFIEXRm6fKSxjuz9LKPuUZx5EpRln7i1Rcqt6wemESGF5pJ0cvXzUuwzdn6cAr4k4mswW/pmroT1h7v2GL4x6SUDYDAyD9kJ7npYAszWOWRzv6O0BOmjgxNC8hyAiebUhlj/WyWgAMk4lHxxh1KLLvrG7G05vLuNL5pqWgzUBAsV55JwqhZqK+eVd8vfN1l/OfaBebqzEfjR9FpXSRWpooH+NUOMIK/55Mn1E2QHrjll5g42VJTlx+WBy2g2rnpXCUBW00lFe9FJ6rt4VfF6dUiOB1e1dnrA8Ig4HoEkhobsc2VWzXYxm8jnJR5CX2YTmTlAxvADtc/w5AorzrmTPxYAAffiGX8ZcNGN44vqCN3izXCjWxDzPfCZuCAHH+6yyJvur0BNdSEl1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GN7e2dHfi7MkOZ0immjqr3Y83Wv/+kA0dMUWx3ngayJ5/NaYg85B5FTuPQUoSr1YFfQDITpeCHZh6KHSXPaWT8nC+oug2utwhRjQyLBJscSmpOr/t5PD1FlclILesCMc7KBq8yOZt9wv6zHeXkHX2OIffJZ45TYer7YwbZk7t5jZLgd0l43dFw7bdzsJR+U0Jk0DbTUUyF1Q5t3QXG1u+iNSYIRJaCHjT8f3CvdATfkogkqmN7wMzPTNKoMvIwjeBLHR3UYPpJlmBstt0JklSZ19m8SPT4eHJuovYPEDncVrrBfoOXqacIDhdjmhkYLBlC2/YffzknV79hIP2J4xu23JhrGZjvFXnOl+g+3lOAHLu8tmPIMlfEafYagjSmnH5BTcdIizdSxA1RYC8ghT5c+GEeTnZ7rY0lorl4PGC27zwadZtiB+D6fmMr9QHCHsXICbsR1ncazYxTK8lOYwz+5L5PArAEEWXNQAVhke/SJN8yywFdgsLJXdJy5pWTLGXIQaBdacZCY7xCR+XXcicoRPs4knHFE7rZjVDivZkaueSX5CUP3ApMdkf7Zp1pLNsKyB50maQ47i2kRaQjV1adfygws3LAj9JRMrcOXE+PFjxJxY847RT5XwYjssAr+A
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VklNMFBzUUlYK3JnQXNzRzV1Zml1cFpxYmhMTFdHMXlTMVZIWWl3RnZqR2VO?=
 =?utf-8?B?cHR5YmFnRzNxZHpxSVlHR05sVE9OSjdBUVozZ0FlV1RJQVNyUTBCbUNjOFV2?=
 =?utf-8?B?bFlSM2ZvdzJnU0VML202V1pQRndkY1pOUTc2TnJXT01NTk9PNUE4KzE1bTRH?=
 =?utf-8?B?aE90QVB4aTZ3b0NmL05RODFqRVA5dXFoVC9sWFVpaFZkRzlINjlDMzBMaWxZ?=
 =?utf-8?B?VnlPdUFMVmRXSG1CZFl0S0NKa0V4L3M5a1prclNiM3lzckw2RElxUyt1WlFx?=
 =?utf-8?B?Z1ZKVEVNV0FjZWRYU2FWNVZUMG56aEhhMlRsYW80NG9MUDdLLzlKNjBkQUZ3?=
 =?utf-8?B?L3Npa29vUi9WZlpsaUdOeDZya2lOVlZaYk0vcFdqYTNMVDR6NXhIdVdLOUFH?=
 =?utf-8?B?NjB5UDRiYWx4NFBqN2NjWDN5UGZiU3NBMElLOXEyM1FDL1RlbWZuamY3ZGQ3?=
 =?utf-8?B?VWtXWlg1RHl2cGpvZFBDRWw2enNVTnJlNkdVWTdrOFNTM0hjZURZTUYvMXBK?=
 =?utf-8?B?TllCODNwdm1OTkxoVDJ4dkZjd0pzcWlwSTg0WGtjVml2di9Nd01yRVpyTDRT?=
 =?utf-8?B?anAzY1duNkhsQ1poVStrWkFRaFBrK0VrZnl3WVdwaE95UThtS0FQN0laRDNG?=
 =?utf-8?B?ZFZMRGdxR3QxN01raHVVbFVPbE43Qy8yWkozdGx6YXRaSVdId0lMcEU3QmJp?=
 =?utf-8?B?Yk8zQ0VXcklzU01naXVLMk9JRTBmOUVnN00vcWNJNlZMY0psYkdGNGNISm03?=
 =?utf-8?B?bzZOVHhTWjg2REdubkZjZWVtdFNMV2VrN2dTanAydGIxU2U4NnczTHZxZU1k?=
 =?utf-8?B?V1h5OXRaWGR1Uk9zemp1TDcrQlh3cnNCeWVVMGw0b1RLOVpubXFhNnZGRWYw?=
 =?utf-8?B?cjd4YitJZjlGbXlJMHBpRkVnVG9ZQmRMcUlkRG10NnlqRUdNWW5YODg0Z2J0?=
 =?utf-8?B?SXFNcGsvTUl0d2NZZU9wcnBDVWE3MGFjdVJLQVEyL1R0aFpTamhtN0hrQ0Nm?=
 =?utf-8?B?TVY2SFQ1WEdEQVVRd0dMRlgvYUZSVXRJS1BJNTF4TUhTeWhuNVR4WFMrcThL?=
 =?utf-8?B?RlhhczJ2TURHNFVRNWN0dnBvY0tvaWROVnpzNndVK1BieHpPYkFWdVdXQy9K?=
 =?utf-8?B?QU9OVnFrb3pRTnROaUFKNzkwOWhWMy9YbEZybWc0MnRTaXNpWnVoVXJsZ1Yw?=
 =?utf-8?B?b1hObzJ0aFhpTjk3VkJDcHRCR0pFL1NGdjJrL2RaQ1dJUXNoeU1mNm0wS3BO?=
 =?utf-8?B?NjJVaWd4MlMrZ2cxTXBDaHUzN0lGVGE3dFRDYWdxVnBiN3V0bjBLMmFkRkty?=
 =?utf-8?B?d3ZZWUxCWlUvdFRwU3pNdmd4WXlGQk90dkcrdlpWWW9aVzdyT3VTSzJnUUdP?=
 =?utf-8?B?ajZmaHRsMTdFN1c2aEdIdVlUQWZZajFMT3NCaUpqV3ViamlQYkxKUnF2UGpJ?=
 =?utf-8?B?eDVFSEc4SEdBKzhZdkVzUHVpUG5YeDdKbW1HR0VEMU94clV2aVl1aVZKTzAv?=
 =?utf-8?B?bFk1QVdFcGpGSHVnbitTWkhjK1BXUUZlaG5GYUU3T3MxaE5MeEU2NDFXVmI1?=
 =?utf-8?B?aS9GTFZxY1pYKzlQVDM1ZldpODJoTE9FSmdidmcyRnhBZG5ONkdxMUFsTnNv?=
 =?utf-8?B?MmFvNCt1aWRZd1grUjU2ZVVPNWl4VzljQ0E3TVFSNFVMRVl0Q3hRcTExdEFp?=
 =?utf-8?B?M2ZMd0VZbi9XTkwxemExOVFlUlJLUVlaWFA3QWNlSzlqYmhXQktub0pBPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31eeb946-dad7-4789-35bb-08db747e3b4d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2023 06:42:51.6765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR20MB5687
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_234301_235221_545E38EC 
X-CRM114-Status: GOOD (  30.58  )
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

PiBIZWxsbywKPgo+IE9uIEZyaSwgSnVuIDIzLCAyMDIzIGF0IDY6MzPigK9QTSBJbm9jaGkgQW1h
b3RvIDxpbm9jaGlhbWFAb3V0bG9vay5jb20+IHdyb3RlOgo+ID4KPiA+IEhpLCBOYW1oeXVuZwo+
ID4KPiA+IFNpbmNlIHRoZXJlIGlzIGEgZmF1bHQgaW4gVC1IRUFEIGRvY3VtZW50YXRpb24sIEkg
YW0gbm90IHN1cmUgd2hldGhlcgo+ID4gdGhlIHBlcmYgZXZlbnRzIGFyZSBjb3JyZWN0LiBBcyBh
IHJlc3VsdCwgSSBzdWdnZXN0IHRlbXBvcmFyaWx5IHN1cHByZXNzaW5nCj4gPiB0aGlzIHBhdGNo
IHVudGlsIEkgZXh0cmFjdCB0aGUgY29ycmVjdCBldmVudHMgZnJvbSBpdHMgdmVuZG9yIHBlcmYg
ZHJpdmVyLgo+ID4gSSB3aWxsIHByZXBhcmUgYSBuZXcgVjQgcGF0Y2ggb25jZSBpdCBpcyBmaW5p
c2hlZC4KPgo+IFN1cmUsIHRoYW5rcyBmb3IgbGV0dGluZyBtZSBrbm93Lgo+Cj4gPgo+ID4gQXMg
Zm9yIGM5eHggd2lsZGNhcmQsIHRoZSBULUhFQUQgcHJvdmlkZXMgYSBgTUNQVUlEYCB2ZW5kb3Ig
Q1NSIHRvIGFsbG93Cj4gPiBpdHMgQ0tMSU5LIHRvIGdldCB0aGUgZGV0YWlsIENQVSBpbmZvLiBU
aGUgZm9ybWF0IG9mIHRoaXMgQ1NSIGFyZToKPiA+Cj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+IHwzMSAgIDI4fDI3ICAyNnwyNSAgICAyMnwy
MSAgIDE4fDE3ICAgIDh8NyAgICAwfAo+ID4gfCBpbmRleCB8IFdMUkwgfCBmYW1pbHkgfCBjbGFz
cyB8IG1vZGVsIHwgV0xSTCB8Cj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiA+Cj4gPiBBbmQgZm9yIEM5eHggc2VyaWVzIChvbmx5IGluZGV4IDAw
MDAgaXMgdmFpbGQgZm9yIHVzLCBhcyBgTUNQVUlEYCBhbHNvCj4gPiBwcm92aWRlcyBvdGhlciBp
bmRleCkuCj4gPgo+ID4gfCAwMDAwIHwgeHggfCAwMTAwIHwgY2xhc3MgfCB4eHh4eHh4eHh4IHwg
eHh4eHh4eHggfAo+ID4KPiA+IFRoZSBjbGFzcyBjb2RlcyBhcmU6Cj4gPgo+ID4gQzkxMDogMDAx
MQo+ID4gYzkwNjogMDEwMAo+ID4KPiA+IFRoZSBDU1IgaXMgYSBNLW1vZGUgb25seSBDU1IsIHNv
IG5vdyBJJ20gZXhwbG9yaW5nIGEgY2xlYW4gd2F5IHRvCj4gPiBpbnRlZ3JhdGUgdGhpcyBDU1Ig
aW50byB0aGUga2VybmVsLiBBbnkgYWR2aWNlPwo+Cj4gSSBkb24ndCBrbm93IGFib3V0IHRoZSBk
ZXRhaWxzLiAgSXMgdGhpcyBDU1IgYXZhaWxhYmxlIGZyb20gdXNlciBzcGFjZT8KPiBJZiBub3Qs
IHlvdSBjb3VsZCBhZGQgaXQgc29tZXdoZXJlIGluIHRoZSBzeXNmcy4KPgo+IFRoYW5rcywKPiBO
YW1oeXVuZwo+Cj4KClRoaXMgQ1NSIGlzIG5vdCBkaXJlY3RseSBhdmFpbGFibGUgZnJvbSB1c2Vy
IHNwYWNlLCBJIHdpbGwgdHJ5IHN5c2ZzLiBUaGFua3MuCgo+ID4+IEhlbGxvLAo+ID4+Cj4gPj4g
T24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgMjo1MOKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBvdXRsb29rLmNvbT4gd3JvdGU6Cj4gPj4+Cj4gPj4+PiBsaWNoZWVydiAjIHBlcmYgcmVjb3Jk
Cj4gPj4+PiBbICA0MzIuMDE1NjE4XSB3YXRjaGRvZzogQlVHOiBzb2Z0IGxvY2t1cCAtIENQVSMw
IHN0dWNrIGZvciAyNnMhCj4gPj4+PiBbcGVyZjoxMTddCj4gPj4+PiBbICA0NjAuMDE1NjE3XSB3
YXRjaGRvZzogQlVHOiBzb2Z0IGxvY2t1cCAtIENQVSMwIHN0dWNrIGZvciA1MnMhCj4gPj4+PiBb
cGVyZjoxMTddCj4gPj4+PiBbICA0ODguMDE1NjE2XSB3YXRjaGRvZzogQlVHOiBzb2Z0IGxvY2t1
cCAtIENQVSMwIHN0dWNrIGZvciA3OHMhCj4gPj4+PiBbcGVyZjoxMTddCj4gPj4+PiBbICA1MTYu
MDE1NjE3XSB3YXRjaGRvZzogQlVHOiBzb2Z0IGxvY2t1cCAtIENQVSMwIHN0dWNrIGZvciAxMDRz
IQo+ID4+Pj4gW3BlcmY6MTE3XQo+ID4+Pj4KPiA+Pj4+IEJ1dCB0aGF0J3Mgbm90IHJlbGF0ZWQg
dG8geW91ciBwYXRjaCBhbnl3YXkuCj4gPj4+Cj4gPj4+IFNhbWUgaXNzdWUgb24gYzkyMCwgYnV0
IGl0IGRpZCBub3QgYWx3YXlzIG9jY3VyLgo+ID4+PiBMaWtlIGEgc2JpIGlzc3VlIGZvciBULUhF
QUQgY3B1cy4KPiA+Pj4KPiA+Pj4+IEkgYW0gc3Ryb25nbHkgYWdhaW5zdCB1c2luZyAiYzl4eCIg
d2lsZGNhcmQsIGkgd291bGQgcHJlZmVyIGRlY2xhcmluZwo+ID4+Pj4gdGhlbSBzZXBhcmF0ZSAo
ZXNwZWNpYWxseSB0YWtpbmcgaW4gbWluZCB0aGF0IGM5MjAgaXMgYzkxMCB3aXRoIHZlY3Rvcgo+
ID4+Pj4gLSBBRkFJSyksIGJ1dCB0aGF0J3MgdXAgdG8gQXJuYWxkbyB0byBkZWNpZGUuCj4gPj4+
Cj4gPj4+IEFGQUlLLCB0aGVyZSBpcyBubyByZWxpYWJsZSB3YXkgdG8gZGlzdGluZ3Vpc2ggYzkw
NiBhbmQgYzkxMCBjb3Jlcy4gQW5kCj4gPj4+IHRoZSBldmVudHMgb2YgYzkxMCBhbmQgYzkyMCBh
cmUgdGhlIHNhbWUgKGFjY29yZGluZyB0byB0aGUgZHJhZnQgZG9jdW1lbnQKPiA+Pj4gb2YgdGhl
IGM5MjApLgo+ID4+Pgo+ID4+PiBBbnl3YXksIEkgYWdyZWUgdG8gbGV0IEFybmFsZG8gZGVjaWRl
Lgo+ID4+Pgo+ID4+Pj4gVGVzdGVkLWJ5OiBOaWtpdGEgU2h1YmluIDxuLnNodWJpbkB5YWRyby5j
b20+Cj4gPj4KPiA+PiBJJ20gY29sbGVjdGluZyBwYXRjaGVzIG9uIGJlaGFsZiBvZiBBcm5hbGRv
IHRoaXMgdGltZS4KPiA+PiBJdCBzZWVtcyB0aGlzIHBhdGNoIHdhcyBub3QgcGlja2VkIHVwIGZv
ciBhIGxvbmcgdGltZS4KPiA+Pgo+ID4+IEkgdGhpbmsgd2UgY2FuIG1ha2UgY2hhbmdlcyBmb3Ig
dGhlIGM5eHggd2lsZGNhcmQgbGF0ZXIKPiA+PiBpZiBuZWVkZWQuICBJJ2xsIHByb2Nlc3MgaXQg
aW4gdGhlIGN1cnJlbnQgZm9ybS4KPiA+Pgo+ID4+IFRoYW5rcywKPiA+PiBOYW1oeXVuZwo+ID4+
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
