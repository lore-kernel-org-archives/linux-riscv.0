Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ECFE7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xZFLx6nHUyIqGhnLke3BzCQuz7gWBb5hm7qOBUNt8A=; b=EitvVe1MFO/9KoPOOHFlbPJLaX
	csDQV3qIcUaaOSCfCNoEgYBMtESQDLjzxzKvRhtUk1R+UgTPGycRixCqKDrzAt63kOYlO0Oyiwl1A
	AoEb1ZEQTqxKIP1BE/tf6RuoyimSVTt8JxT9NAO24SXiR52dSMxOU/itFxsYmyrNqpJ+Q0gjw11Qw
	G715VDj0PQSwmh7gprpy554QvdxJeUgCKeq2YzBU4SQXN7vtdft+K3F7qi8SgqAh/kvlJ/6KKi4JH
	r47pXYOAM7/3t/F3tDsLHfUG80Ev0mpCWz+jovwNJEGDWrg0dbxcjTAtZih+kN6vNceGWrqOxt05i
	qsbjWCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIbM-0000000EKFr-446K;
	Wed, 11 Dec 2024 09:01:48 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIah-0000000EK4P-392F
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 09:01:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBzFL4spw+wAIx5j77ksebVUpy4XRo9+48jkh9rU88cCYsAXu8xlvtYB5R5kJskSRJ9iQ3ek2nXcsTv0D/fg0m68SA1OrZnXyNwg1Ya2HAwwMcIFBXYxRp1O4R/biKNqkr96JkQLe9TyFSM0xg7Z+Er6RqYYrfmA0MZj8wFUt2UQ6ivntYDS5rwcRtSEjEew6LMf+JAG2ziWh7w39raCTOfUGuxhQS1BEh317eci5sgHdG9mkDdcg+awGfI6RTidnUWkl/DEu8fBZ7ibZHpvhfW9EgBr6grtP0Rx+dikQXt/ZVX9tXqhZdsog/dNcXn0w7edlj5WCWVtM/rQprsv9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6pMR4zrBklJEknNRNWg6wl6duICDMw7i8fdWyTcChU=;
 b=Dx32cYXAQkyZ2QCL5mXRCYR0dZlXdLh0l6rNhRh8Q0mHiqCCkhn+otbfpLES+znYUv9Z7EPE/yvFa787StiPQ3MOGmLE7TgThYM3bEMB9KUjQUR+Fas6f7G39ULxm1VTOO25mHCb8gKcanNbzINa9SAkX2/+ZGGsCc8NgLTEWxrtk4p/mxvbErcwYYUg+p45svTknf4WTFkTnmkQHMR0nwP9N7UQnnsh72GoYFsJvMGaCKVpk2ePJMIrMOCkihdMsFWBxHbAB1c/yL+P+lPH4gT7fvbCOORlC8kayo3BGqZqE/V0vVdtImv3mZo/LE8pVtTUzR/LCn2BU60b3UQJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6pMR4zrBklJEknNRNWg6wl6duICDMw7i8fdWyTcChU=;
 b=TpWuLp5vBTaShTEwuwuTB5VUbROQbI5PvRYbgGaslB7Lw2r5lEWt/YaAxo4x7mfv45ysJldekUvBMNdd0RjW+DcelIK7zJNYudUgz4fXh9fwGIddxuSN5h4Cx2W0Cr0PMYFKTUiJ7LSbc4WPK2jkr3v1utFssBAcapAB7Ijxa/FQCWge0sq1oe10pBqwGlYBCmX8CedtKDnCoJwZMZKylNYQFGr01wy8tNoE103xGc2rqz7m9KJ8HzR9deJS1nR7r+lDwOaUNYUjsDUGKb591kAWdR2V2ZEtxuPEc0s7qXv25mIprqLxjDUK/ZjCPFItbHKxvQU8RPse6jqoolc+ZA==
Received: from BM1PR01MB4515.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01:13::10)
 by PN3PR01MB6683.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:81::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 09:00:51 +0000
Received: from BM1PR01MB4515.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b0:ebc1:c2d0:d13a]) by BM1PR01MB4515.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b0:ebc1:c2d0:d13a%6]) with mapi id 15.20.8207.010; Wed, 11 Dec 2024
 09:00:51 +0000
Message-ID: <BM1PR01MB4515ECD36D8FC6ECB7D161C5FE3E2@BM1PR01MB4515.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 11 Dec 2024 17:00:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
To: Bjorn Helgaas <helgaas@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: kw@linux.com, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
 arnd@arndb.de, bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
 lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <20241210173350.GA3222084@bhelgaas>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20241210173350.GA3222084@bhelgaas>
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To BM1PR01MB4515.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b01:13::10)
X-Microsoft-Original-Message-ID: <012506a1-0358-475e-83da-7c2331336ed2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BM1PR01MB4515:EE_|PN3PR01MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: 653cf6c0-fe4a-41c3-8e1e-08dd19c24f8f
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|7092599003|8060799006|19110799003|461199028|6090799003|15080799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0JEYW9jWWpJQVRWeDBsMjFVSzltSUlQRllYSXo0THRpQ3hkcGtnaUVhcFRj?=
 =?utf-8?B?ZnRITm9BZ1NoK0I1RGFaelN4RWQ4VGUydzdOS0VyeTh4SDhjRll5QUtOMWl4?=
 =?utf-8?B?cmNnTWg4ZEkwYUpoM2o5d3BpMDc1OXJLWExCQkNWd1FWV3RRM3Y1TDBwTGNn?=
 =?utf-8?B?a25NMnEzT2Y5Nm44blo5dGdSYUNYM0I3WGVWTDBSa2hSbzdqTGp1eml6eDNR?=
 =?utf-8?B?UDN4UjA4a1JhQUU3OHJuRnpHZ25ITTIzSWh1ZElSL2xnNFRDZWtvQitCdFRi?=
 =?utf-8?B?ekpHRENKREo1S281ZTdienNMZVdOMmVMNVBNYjhHZWJsMkE5MlBvK1NvOEVT?=
 =?utf-8?B?Tzl0bWdSY3FmWVZKUjg3VUJBcjFwT295MTVOd0NIekRFWnlFNjVRd1IzbUFy?=
 =?utf-8?B?dmlBa2c2VGU5WWlBVjczY1Uxcy9qYWdjb0RJRE9nbFVxM1FqOWdIaWszK1ZD?=
 =?utf-8?B?QnVobEx4dTRJVEhVc0tVTmg5Nmo2RDJZQ055UFltY2VOM2xnOHZtNFRvSUdm?=
 =?utf-8?B?ZStoR1l4cGc3cWRleHNnc2dEaE5jWkg5NmxZUDE4RDVkbFB6WENiclZSS1hi?=
 =?utf-8?B?blV2TFJsY0NXVlpmZjVxZ0RXaHpBckJBKzFPNXBIZFJWVFZBa2NrVDQ1ZVdt?=
 =?utf-8?B?Y1hhK3FhNk5hd0V5b2d5L1hjR0ozN1VoYlFLZk51WndiSGpkR25IZ0ludWFp?=
 =?utf-8?B?MHpxZmM0TWtTYmRqM29DZllOc0gyZmh0QU1BZ0tYRnpFbzU4Uk5oTm1pY0Zo?=
 =?utf-8?B?cDZlcjY1UUJwSUI5WjM4NUZlNHlJSWRDUlVaWXNPSnZPdFhwVGdpNWp6dlpZ?=
 =?utf-8?B?UVJubnhoRmZWNnJDL0dURFQveU9EMEg0ODc1K2FiZmtnT3V2cWpxQ0FtV0Qv?=
 =?utf-8?B?RjNoSlFXN2xlUkN4SmFVMUZkeVFtUkZmT1dnelZ5WDhqQS9uR3d3dnVsLzBK?=
 =?utf-8?B?YWNhVVdhWXNNTDV1czR6RVVQYWlqKzJYSkxBOFJxZVlMZ3ppSDRoeDdHVkdw?=
 =?utf-8?B?SmZvZ1ZSU0RBN3p2QkJ3U0hBZkNYalQ2dW8ydjYwdFlsVUZPRm1JR08xRklJ?=
 =?utf-8?B?YXNZWVlCQ2xNN1pZZWFCNkYxSTNmamdsNURZN01TWHBkOU5jVFNkdmdKTzNT?=
 =?utf-8?B?b0FVUUE0Yk5Bc3FDS0lSeDNsYlEzczlha0x2NmFqY2J0VlJqdmFDek1tbTNH?=
 =?utf-8?B?elZLNmorY05HZFNoMnByYnBzbTNCWTFTUnRueTkrMzNPTXpqYXFUSTF1VGtz?=
 =?utf-8?B?ZFdCQ212aG1FNlcwZGJLbFlnRWtYWVJYNkZmQ25hNTc5ZDc3V1VJeHNsOWpk?=
 =?utf-8?B?cTNDUzI1dnJKdkhVNVF1NlByYkxZNmYxZ3V3S1IzeDVMckk5anNsbGs2TFR2?=
 =?utf-8?B?bW5VK3IxeEpaQ3ZLZXBwZkdNYWFxWlpOYkFGbkJFYzhxaTBUNGltdnZoOTd2?=
 =?utf-8?Q?mcw0s8xL?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGdaNWVZNGVJcUJETy81NWdBVkZMU251NkhzbERGWDBlVElMYVRBQXRwc0dS?=
 =?utf-8?B?VHlLbDBlVFZXK1R2VXZkSWxkS1EzelRGbEF5NW1uVXhMZXBRSEdmS2FyaWFh?=
 =?utf-8?B?VUp5cjR6TmdGZ2lTTW5pbWNlaVFMcU00blVxbzFOL1kzNlJ5M0JNVFMwb0N0?=
 =?utf-8?B?UnhyaFNZNWV3WEJQZGpOZ0g1T1o5cmlqVzZyb1J6SnBzZTZjS2xyY2ZQaTNi?=
 =?utf-8?B?WUJVYUg1ZTdqYjhtaU9INktsaGF2ZjN0NUV3OWtkS1JDYkZhY3phdnNqN1Fu?=
 =?utf-8?B?LzNpbVQ4K0NxaFhYWDZEUWRCSFVkb3JCdlpIQXdyZ2dOcnJWU2tOZDRZcHZ0?=
 =?utf-8?B?eFBtRXBickRmMTFBWEp5NEFTWlJLQ0VranA5VFRiVlRVWE8wQmhDd2ZyS1V2?=
 =?utf-8?B?UFZJT0x4bDNQb1N5eCtpaTNVT0tJeVdvU1JQRHpBVUxJNFh5WGFZY1IrVVdT?=
 =?utf-8?B?OHlLaW9RRUxDMEsra2d0SER2dHZLejFGNmRrNUlIbXYyUW5WT01oRDF5cVNp?=
 =?utf-8?B?emhGQ0E4RHc0cEZMR28wQXB0MFBTd29TNFB3UFpzNEYrUHNneGM1eVdrR0Zz?=
 =?utf-8?B?L090UWhjcWFxRzdJd1Arbit1bmkrWmp4aVJVbXVGT2JrZXl1MGVYMitoN0JH?=
 =?utf-8?B?ZkVWck9rWEs5Q2l2YVZzNVFXbEMvRW1zdFp3MzlYRUt4aGFIdTVYVWRoUXdi?=
 =?utf-8?B?ZGE2MXZSTzgyak9ZbGhSWmdKZ2JORzVQL2ZnSlAvcy96RXNCcExXb3hUbm9Y?=
 =?utf-8?B?ZUIzeGl4NTQrOEVOOHQ5V1BJM3JqZUxOQVQ5ZDAxenBTamxCUTIrRFd3K0dP?=
 =?utf-8?B?dzdOaTRHTnQvQVozNzRPYjJzeFp6ZlZJZXRGN2hydUx2dzUzVWRFSTVhT1FR?=
 =?utf-8?B?STgvOWxJaEdxdC9yL1Z4cjZSUTltbEloSlVYcWpkY2xHd3NHemNjWDlLcUQ4?=
 =?utf-8?B?VjU3SnZiWS9TeEpzY0xGVmgwYW52Ym4rNWt6SUtWL3ZRSTUwaWF3Rkx6WmRv?=
 =?utf-8?B?VDhpY2E0K29Pdk11T3BOVGNSc2FoSmYvMkwraSt6dy83LzNyVjZXR2NNbnBy?=
 =?utf-8?B?MEltUjNUWHlheWJzOXA4ZXNvQk42Rjc3S0dmWjRZZFFxanFjbTZwTEdFelps?=
 =?utf-8?B?YUtTbjAzbVpTZ2x5VFlCYlVGVVpnQ3dZTk9pMFRyU0FleHVjU1ZoTXZMVXBK?=
 =?utf-8?B?YnJtbGdncXZoT3pHbzNlQ0xNYURMR2Z4UzZtaUNlV3hvVjJOWHVXbDlreVJm?=
 =?utf-8?B?djBLQnBqWVBXQmkvR3N6aVVkWmZxeGJTZFUxYTd1WGdKWlN2Nm05eWpHR3U1?=
 =?utf-8?B?dFdGMEJRQk1rSGlvcHdKRGtEVjhLOURtVjUwS3RteTI1U2t2dkNnend1Mjdk?=
 =?utf-8?B?bWlMd1NRSmJSOTFIVXM2ZGFVL0dGTldVSGpXMGpyaTNibk1PSldacVE3NVhO?=
 =?utf-8?B?R1F2MUU1R3prRzFEMnlJUXJaeDlvVEkranF0ZHdtME84UnViYWtFRGdsQSs3?=
 =?utf-8?B?UU5lTENLb2RTRE8rRTB0QlZvTEkrQ3AvYW9zZlViS3hCNUJWRTdIQ0w0YUVy?=
 =?utf-8?B?cGtYTzd0aFhVQUtqWXgvcHhkVHF1R29lbnRXNlNkUjczTXBQaGJjb2VZWG93?=
 =?utf-8?B?K29DYTNGZDhMQkxseW9aa2NsQVl4eXZSVXZhYnlCVWVaL0k5bEo0M2lrcnlY?=
 =?utf-8?Q?E8RFHDtdITidQmKXNaIv?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653cf6c0-fe4a-41c3-8e1e-08dd19c24f8f
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4515.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 09:00:51.1487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6683
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_010108_022644_68EBB931 
X-CRM114-Status: GOOD (  22.86  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjQvMTIvMTEgMTozMywgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPiBPbiBNb24sIERlYyAw
OSwgMjAyNCBhdCAwMzoxOTozOFBNICswODAwLCBDaGVuIFdhbmcgd3JvdGU6Cj4+IEFkZCBiaW5k
aW5nIGZvciBTb3BoZ28gU0cyMDQyIFBDSWUgaG9zdCBjb250cm9sbGVyLgo+PiArICBzb3BoZ28s
cGNpZS1wb3J0Ogo+IFRoaXMgaXMganVzdCBhbiBpbmRleCwgaXNuJ3QgaXQ/ICBJIGRvbid0IHNl
ZSB3aHkgaXQgc2hvdWxkIGluY2x1ZGUKPiAic29waGdvIiB1bmxlc3MgaXQgZW5jb2RlcyBzb21l
dGhpbmcgc29waGdvLXNwZWNpZmljLgpJIHByZXZpb3VzbHkgdW5kZXJzdG9vZCB0aGF0IGlmIGl0
IGlzIG5vdCBhIHN0YW5kYXJkIGF0dHJpYnV0ZSBkZWZpbmVkIApieSB0aGUgZHRzIHNjaGVtYSwg
c3VjaCBhcyBwY2llLXBvcnQsIHdoaWNoIGlzIGRlZmluZWQgYnkgbWUsIGl0IG11c3QgYmUgCnBy
ZWZpeGVkIHdpdGggdmVuZG9yLiBJcyB0aGF0IHJpZ2h0Pwo+Cj4+ICsgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4+ICsgICAgZGVzY3JpcHRpb246IHwK
Pj4gKyAgICAgIFNHMjA0MiB1c2VzIENhZGVuY2UgSVAsIGV2ZXJ5IElQIGlzIGNvbXBvc2VkIG9m
IDIgY29yZXMoY2FsbGVkIGxpbmswCj4gQWRkIHNwYWNlIGJlZm9yZSAiKCIuICBNb3JlIGluc3Rh
bmNlcyBiZWxvdy4Kb2sKPgo+PiArICAgICAgJiBsaW5rMSBhcyBDYWRlbmNlJ3MgdGVybSkuICJz
b3BoZ28scGNpZS1wb3J0IiBpcyB1c2VkIHRvIGlkZW50aWZ5IHdoaWNoCj4+ICsgICAgICBjb3Jl
L2xpbmsgdGhlIHBjaWUgaG9zdCBjb250cm9sbGVyIG5vZGUgY29ycmVzcG9uZHMgdG8uCj4gcy9w
Y2llL1BDSWUvIGZvciBjb25zaXN0ZW5jeSBpbiB0aGUgdGV4dC4gIE1vcmUgaW5zdGFuY2VzIGJl
bG93Lgpvawo+Cj4+ICsgICAgICBUaGUgQ2FkZW5jZSBJUCBoYXMgdHdvIG1vZGVzIG9mIG9wZXJh
dGlvbiwgc2VsZWN0ZWQgYnkgYSBzdHJhcCBwaW4uCj4+ICsKPj4gKyAgICAgIEluIHRoZSBzaW5n
bGUtbGluayBtb2RlLCB0aGUgQ2FkZW5jZSBQQ0llIGNvcmUgaW5zdGFuY2UgYXNzb2NpYXRlZAo+
PiArICAgICAgd2l0aCBMaW5rMCBpcyBjb25uZWN0ZWQgdG8gYWxsIHRoZSBsYW5lcyBhbmQgdGhl
IENhZGVuY2UgUENJZSBjb3JlCj4+ICsgICAgICBpbnN0YW5jZSBhc3NvY2lhdGVkIHdpdGggTGlu
azEgaXMgaW5hY3RpdmUuCj4+ICsKPj4gKyAgICAgIEluIHRoZSBkdWFsLWxpbmsgbW9kZSwgdGhl
IENhZGVuY2UgUENJZSBjb3JlIGluc3RhbmNlIGFzc29jaWF0ZWQKPj4gKyAgICAgIHdpdGggTGlu
azAgaXMgY29ubmVjdGVkIHRvIHRoZSBsb3dlciBoYWxmIG9mIHRoZSBsYW5lcyBhbmQgdGhlCj4+
ICsgICAgICBDYWRlbmNlIFBDSWUgY29yZSBpbnN0YW5jZSBhc3NvY2lhdGVkIHdpdGggTGluazEg
aXMgY29ubmVjdGVkIHRvCj4+ICsgICAgICB0aGUgdXBwZXIgaGFsZiBvZiB0aGUgbGFuZXMuCj4g
SSBhc3N1bWUgdGhpcyBtZWFucyB0aGVyZSBhcmUgdHdvIHNlcGFyYXRlIFJvb3QgUG9ydHMsIG9u
ZSBmb3IgTGluazAKPiBhbmQgYSBzZWNvbmQgZm9yIExpbmsxPwpZZXMuIFNvIHRoZSBuYW1pbmcg
b2YgcGNpZV9yY1ggaXMgd3JvbmcsIEkgd2lsbCBjb3JyZWN0IGl0LCB0aGFua3MuCj4KPj4gKyAg
ICAgIFNHMjA0MiBjb250YWlucyAyIENhZGVuY2UgSVBzIGFuZCBjb25maWd1cmVzIHRoZSBDb3Jl
cyBhcyBiZWxvdzoKPj4gKwo+PiArICAgICAgICAgICAgICAgICAgICAgKy0tIENvcmUoTGluazAp
IDwtLS0+IHBjaWVfcmMwICAgKy0tLS0tLS0tLS0tLS0tLS0tKwo+PiArICAgICAgICAgICAgICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
fAo+PiArICAgICAgQ2FkZW5jZSBJUCAxIC0tKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCBjZG5zX3BjaWUwX2N0cmwgfAo+PiArICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgfAo+PiArICAgICAgICAg
ICAgICAgICAgICAgKy0tIENvcmUoTGluazEpIDwtLS0+IGRpc2FibGVkICAgKy0tLS0tLS0tLS0t
LS0tLS0tKwo+PiArCj4+ICsgICAgICAgICAgICAgICAgICAgICArLS0gQ29yZShMaW5rMCkgPC0t
LT4gcGNpZV9yYzEgICArLS0tLS0tLS0tLS0tLS0tLS0rCj4+ICsgICAgICAgICAgICAgICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICB8Cj4+
ICsgICAgICBDYWRlbmNlIElQIDIgLS0rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IGNkbnNfcGNpZTFfY3RybCB8Cj4+ICsgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICB8Cj4+ICsgICAgICAgICAgICAg
ICAgICAgICArLS0gQ29yZShMaW5rMSkgPC0tLT4gcGNpZV9yYzIgICArLS0tLS0tLS0tLS0tLS0t
LS0rCj4+ICsKPj4gKyAgICAgIHBjaWVfcmNYIGlzIHBjaWUgbm9kZSAoInNvcGhnbyxzZzIwNDIt
cGNpZS1ob3N0IikgZGVmaW5lZCBpbiBEVFMuCj4+ICsgICAgICBjZG5zX3BjaWUwX2N0cmwgaXMg
c3lzY29uIG5vZGUgKCJzb3BoZ28sc2cyMDQyLXBjaWUtY3RybCIpIGRlZmluZWQgaW4gRFRTCj4+
ICsKPj4gKyAgICAgIGNkbnNfcGNpZVhfY3RybCBjb250YWlucyBzb21lIHJlZ2lzdGVycyBzaGFy
ZWQgYnkgcGNpZV9yY1gsIGV2ZW4gdHdvCj4+ICsgICAgICBSQyhMaW5rKXMgbWF5IHNoYXJlIGRp
ZmZlcmVudCBiaXRzIG9mIHRoZSBzYW1lIHJlZ2lzdGVyLiBGb3IgZXhhbXBsZSwKPj4gKyAgICAg
IGNkbnNfcGNpZTFfY3RybCBjb250YWlucyByZWdpc3RlcnMgc2hhcmVkIGJ5IGxpbmswICYgbGlu
azEgZm9yIENhZGVuY2UgSVAgMi4KPiBBbiBSQyBkb2Vzbid0IGhhdmUgYSBMaW5rLiAgQSBSb290
IFBvcnQgZG9lcy4KPgo+PiArICAgICAgInNvcGhnbyxwY2llLXBvcnQiIGlzIGRlZmluZWQgdG8g
ZmxhZyB3aGljaCBjb3JlKGxpbmspIHRoZSByYyBtYXBzIHRvLCB3aXRoCj4+ICsgICAgICB0aGlz
IHdlIGNhbiBrbm93IHdoYXQgcmVnaXN0ZXJzKGJpdHMpIHdlIHNob3VsZCB1c2UuCj4+ICsKPj4g
KyAgc29waGdvLHN5c2Nvbi1wY2llLWN0cmw6Cj4+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+PiArICAgIGRlc2NyaXB0aW9uOgo+PiArICAgICAg
UGhhbmRsZSB0byB0aGUgUENJZSBTeXN0ZW0gQ29udHJvbGxlciBEVCBub2RlLiBJdCdzIHJlcXVp
cmVkIHRvCj4+ICsgICAgICBhY2Nlc3Mgc29tZSBNU0kgb3BlcmF0aW9uIHJlZ2lzdGVycyBzaGFy
ZWQgYnkgUENJZSBSQ3MuCj4gSSB0aGluayB0aGlzIHByb2JhYmx5IG1lYW5zICJzaGFyZWQgYnkg
UENJZSBSb290IFBvcnRzIiwgbm90IFJDcy4KPiBJdCdzIHVubGlrZWx5IHRoYXQgdGhpcyBoYXJk
d2FyZSBoYXMgbXVsdGlwbGUgUm9vdCBDb21wbGV4ZXMuCk9rLCBJIHdpbGwgZml4IHRoaXMuCj4K
Pj4gK3JlcXVpcmVkOgo+PiArICAtIGNvbXBhdGlibGUKPj4gKyAgLSByZWcKPj4gKyAgLSByZWct
bmFtZXMKPj4gKyAgLSB2ZW5kb3ItaWQKPj4gKyAgLSBkZXZpY2UtaWQKPj4gKyAgLSBzb3BoZ28s
c3lzY29uLXBjaWUtY3RybAo+PiArICAtIHNvcGhnbyxwY2llLXBvcnQKPiBJdCBsb29rcyBsaWtl
IHZlbmRvci1pZCBhbmQgZGV2aWNlLWlkIGFwcGx5IHRvIFBDSSBkZXZpY2VzLCBpLmUuLAo+IHRo
aW5ncyB0aGF0IHdpbGwgc2hvdyB1cCBpbiBsc3BjaSwgSSBhc3N1bWUgUm9vdCBQb3J0cyBpbiB0
aGlzIGNhc2UuCj4gQ2FuIHdlIG1ha2UgdGhpcyBleHBsaWNpdCBpbiB0aGUgRFQsIGUuZy4sIHNv
bWV0aGluZyBsaWtlIHRoaXM/Cj4KPiAgICBwY2llQDYyMDAwMDAwIHsKPiAgICAgIGNvbXBhdGli
bGUgPSAic29waGdvLHNnMjA0Mi1wY2llLWhvc3QiOwo+ICAgICAgcG9ydDA6IHBjaUAwLDAgewo+
ICAgICAgICB2ZW5kb3ItaWQgPSA8MHgxZjFjPjsKPiAgICAgICAgZGV2aWNlLWlkID0gPDB4MjA0
Mj47Cj4gICAgICB9OwoKU29ycnksIEkgZG9uJ3QgdW5kZXJzdGFuZCB5b3VyIG1lYW5pbmcgdmVy
eSB3ZWxsLsKgIFJlZmVycmluZyB0byB0aGUgCnRvcG9sb2d5IGRpYWdyYW0gSSBkcmV3IGFib3Zl
LCBpcyBpdCBva2F5IHRvIHdyaXRlIERUUyBhcyBmb2xsb3dzPwoKcGNpZUA3MDYwMDAwMDAwIHsK
IMKgwqDCoCBjb21wYXRpYmxlID0gInNvcGhnbyxzZzIwNDItcGNpZS1ob3N0IjsKIMKgwqDCoCAu
Li4uLi4gLy8gb3RoZXIgcHJvcGVydGllcwogwqDCoMKgIHBjaUAwLDAgewogwqDCoMKgwqDCoCB2
ZW5kb3ItaWQgPSA8MHgxZjFjPjsKIMKgwqDCoMKgwqAgZGV2aWNlLWlkID0gPDB4MjA0Mj47CiDC
oMKgwqAgfTsKfQoKcGNpZUA3MDYyMDAwMDAwIHsKIMKgwqDCoCBjb21wYXRpYmxlID0gInNvcGhn
byxzZzIwNDItcGNpZS1ob3N0IjsKIMKgwqDCoCAuLi4uLi4gLy8gb3RoZXIgcHJvcGVydGllcwog
wqDCoMKgIHBjaUAwLDAgewogwqDCoMKgwqDCoCB2ZW5kb3ItaWQgPSA8MHgxZjFjPjsKIMKgwqDC
oMKgwqAgZGV2aWNlLWlkID0gPDB4MjA0Mj47CiDCoMKgwqAgfTsKfQoKcGNpZUA3MDYyODAwMDAw
IHsKIMKgwqDCoCBjb21wYXRpYmxlID0gInNvcGhnbyxzZzIwNDItcGNpZS1ob3N0IjsKIMKgwqDC
oCAuLi4uLi4gLy8gb3RoZXIgcHJvcGVydGllcwogwqDCoMKgIHBjaUAxLDAgewogwqDCoMKgwqDC
oCB2ZW5kb3ItaWQgPSA8MHgxZjFjPjsKIMKgwqDCoMKgwqAgZGV2aWNlLWlkID0gPDB4MjA0Mj47
CiDCoMKgwqAgfTsKCn0KCkFuZCB3aXRoIHRoaXMgY2hhbmdlLCBJIGNhbiBkcm9wIHRoZSDigJxw
Y2llLXBvcnTigJ1wcm9wZXJ0eSBhbmQgdXNlIHRoZSAKcG9ydCBuYW1lIHRvIGZpZ3VyZSBvdXQg
dGhlIHBvcnQgbnVtYmVyLCByaWdodD8KCgo+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUK
Pj4gKwo+PiArZXhhbXBsZXM6Cj4+ICsgIC0gfAo+PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KPj4gKwo+PiArICAgIHBjaWVANjIwMDAwMDAg
ewo+PiArICAgICAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDQyLXBjaWUtaG9zdCI7Cj4+ICsg
ICAgICBkZXZpY2VfdHlwZSA9ICJwY2kiOwo+PiArICAgICAgcmVnID0gPDB4NjIwMDAwMDAgIDB4
MDA4MDAwMDA+LAo+PiArICAgICAgICAgICAgPDB4NDgwMDAwMDAgIDB4MDAwMDEwMDA+Owo+PiAr
ICAgICAgcmVnLW5hbWVzID0gInJlZyIsICJjZmciOwo+PiArICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8Mz47Cj4+ICsgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsKPj4gKyAgICAgIHJhbmdlcyA9IDww
eDgxMDAwMDAwIDAgMHgwMDAwMDAwMCAweGRlMDAwMDAwIDAgMHgwMDAxMDAwMD4sCj4+ICsgICAg
ICAgICAgICAgICA8MHg4MjAwMDAwMCAwIDB4ZDA0MDAwMDAgMHhkMDQwMDAwMCAwIDB4MGQwMDAw
MDA+Owo+PiArICAgICAgYnVzLXJhbmdlID0gPDB4ODAgMHhiZj47Cj4+ICsgICAgICB2ZW5kb3It
aWQgPSA8MHgxZjFjPjsKPj4gKyAgICAgIGRldmljZS1pZCA9IDwweDIwNDI+Owo+PiArICAgICAg
Y2Rucyxuby1iYXItbWF0Y2gtbmJpdHMgPSA8NDg+Owo+PiArICAgICAgc29waGdvLHBjaWUtcG9y
dCA9IDwwPjsKPj4gKyAgICAgIHNvcGhnbyxzeXNjb24tcGNpZS1jdHJsID0gPCZjZG5zX3BjaWUx
X2N0cmw+Owo+PiArICAgICAgbXNpLXBhcmVudCA9IDwmbXNpX3BjaWU+Owo+PiArICAgICAgbXNp
X3BjaWU6IG1zaSB7Cj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAic29waGdvLHNnMjA0Mi1wY2ll
LW1zaSI7Cj4+ICsgICAgICAgIG1zaS1jb250cm9sbGVyOwo+PiArICAgICAgICBpbnRlcnJ1cHQt
cGFyZW50ID0gPCZpbnRjPjsKPj4gKyAgICAgICAgaW50ZXJydXB0cyA9IDwxMjMgSVJRX1RZUEVf
TEVWRUxfSElHSD47Cj4+ICsgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJtc2kiOwo+PiArICAg
ICAgfTsKPj4gKyAgICB9Owo+PiAtLSAKPj4gMi4zNC4xCj4+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
