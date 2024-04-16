Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C72C04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 23:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=go5diqTMmKJvhpSApVvjDmdC1E6PnPx2BxqrFP1Qu8E=; b=ygVkxH0V+aC0cr1waXQLASum7F
	gP/PZ1jSkE+NfJOt04PbtFzaahgjhEgJqCgbfR7jaLZSO+KDG3QMbgf2PWazOTVuCdq1EBDRBtlDo
	mU8rno/EDViGinOmJIY/OQmBRyobST6bwqD4CGO9YKtXwCB4x6UGacbe16zxH2UFStgsBDJLFAtgO
	5oQI8e8Vm3D6p8qsqV7yFolSSUxqqwEePKX16Gx5IoxvmT51SM7db+VnbL1w3jp9wGiHUDbib9OwA
	7Pdfrd2YeHEWtBfBkQ173kdMsar/sFc39oVy/7Nz2aO5edTnjFUKA4FRN8eNUKlni5i3Qhi6Er/s0
	wzdg1Exw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwscO-0000000EEXS-3JRC;
	Tue, 16 Apr 2024 23:53:40 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwscF-0000000EETa-3G0g
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 23:53:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=II5pv2yMkLqO46du7BiwvqMVmLb846EcZUOQgNuAbXDaH03So9+LW0rBfF/WLewgG0dStYk7CPKd1ArqRj6sByBAVL9ch4cZlXrdAHt8qoXUjkKa6koI/Nae6KGzqWLf/HOfxKl4Zb9/QJFi8PD6GWq2bMSjimXFOhMET8DU2qgKfYz6zPKZ0/bsCGQ9OdiSp+bjLScszkkaO+etx8B1ZNnRnDctjyyC7MK0ofArK3fmwCUaxUVfPxQhPfdwVyZda0Yxk7EoC3O8WYHf15Fpr4OzC7OCuIQ9Kjk+i+Cv/5aLxe2jVR8P2JZBIoEdmOnS8kk4oCVMwkNLKIAjci7k2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIvRWIOZNYc1YQjMUB/y5I9aaYtyFift4nEnGKBx0Pc=;
 b=lH1QHf2laovJLXdO2dMU04KCJwqVctSp41wmdRtrHZuY4BAcOhstnGHDJOQAorKuMEdE37vEY0TsNZxDXxEGmlTHus5H+6bljSpW4QiING5faclmrXgum0Qr/Oz99XkZ6s36oiP3gEwChcqRWlg6RkMj3vZhMfx7CvkNI+x8bqLLDQEFvlRPwOyFmN3VD0l8I0vzJkJ+pdT9bij8kIUcHsWJTFGZKYrsmq8NfmVMVWVedesNglsK9NdCOzUW2O7KIU3GMY72nEQRIWjREP9b2cCj8CA/dB+8BiTiQQRHUL0a8I5EaIh9ku5eKdabIPy1jow6idMF6aO/haYVtRWoXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIvRWIOZNYc1YQjMUB/y5I9aaYtyFift4nEnGKBx0Pc=;
 b=m0e0OL5p0JB2yJNPm/2u/T9V2ELNsjwoJqDdyFNqXKPI9sWrVA//SGHmloChXv4MZsq6frFcmPaLQ7Uhx1T4ZR1mnc/o583E+KGNEQ9qS02lCMhcQKt9hmsSoeVqRclWZcquUMlJ3BAc6UOJbrox8bsvCO7GxVQERGRY4QvvrJm95eQwye50Y9KGMedn01TxxmuyL2+yhR2AipyPdMRApP3r4EhKoXQhXu32zek4Iy0smZKTMkYapFWE5bSShkAZNJLlTqSkE0sjpdipwXVjOfYc2wEu3KvoAGMpR9QCAFx15a1QDlXWuL46SwJ8ytFlf/aTIfUW61XkmCtnF0k6Pg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MAZP287MB0558.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:112::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.51; Tue, 16 Apr
 2024 23:53:11 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::664:2ecc:c36:1f2c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::664:2ecc:c36:1f2c%3]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 23:53:11 +0000
Message-ID: <MA0P287MB2822A5D78558176D9B23240CFE082@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 17 Apr 2024 07:53:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mmc: sdhci-of-dwcmshc: Add support for Sophgo SG2042
To: Jisheng Zhang <jszhang@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: adrian.hunter@intel.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 guoren@kernel.org, inochiama@outlook.com, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org,
 ulf.hansson@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, tingzhu.wang@sophgo.com
References: <cover.1713258948.git.unicorn_wang@outlook.com>
 <e5aa1338d74504e141ba833b484d588cafb7ab38.1713258948.git.unicorn_wang@outlook.com>
 <Zh6bM2EQnAFYFhiV@xhacker>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <Zh6bM2EQnAFYFhiV@xhacker>
X-TMN: [tHilUJJeHqepzmerUrJyU0QckXI3onGW]
X-ClientProxiedBy: SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <df6c2ce8-b956-4f1a-9bb6-8f207921ed78@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MAZP287MB0558:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c792ea2-e148-4491-1493-08dc5e705dfe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MaYWgKjdnYxiCFW0cSSDQo4CsQniJgAWPPFNokfaUWGHy3mtlqftBhLicRMX9mENk/Ax1E/grylHw5l0HvVW7QHrETh2Q9qRo28U3bRN7COzhhBqiCF7+n4XdZVfMLjVHXv3ZUBkvmoUVgF9zNXdv8rCKWNbw8zWu0+OAE6L/Vg11YB/hZzTQlcpJB2ywRUsWYmXWCUJhpt0dOA4fp0BVkTix0bTTkTP1WKcc/2H834XDSbN7r1qy4/b6ZxArhk5AYRbqv02zhXwGSE9LT0un2D1G1/tXUL/QEAnm8cpPAQmnFEK+BZKsgcZv2vdrDenK8AR1cS7w/G67VWonIOEeAN97NGkUXG6dSsB/hktsryVbWNxVDIQdUiLn8oH4nKxYb+4QL3XjymI80Yl3p8uiR8tSYE2+Jrb5hhCFVK70quaojH5SdN8XI35LDxx8/sz8JwZDsnzT7zqKR6cv2dCsd0bcPiVTkmXtCCoI74xQHzUPy8sH/qIZN802E2Q5H8dM7+b3pg39TAzWf4d3ErXiTyLudWYEoNIumWW1lUTfG/s59IATA7eFEyxhYSGpdMg
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVR3MmE3dmQ2c29oRnhiOUlIYWs3b0k5TWUxNHVlbGE2TTd2VlQ4OE5MRlJZ?=
 =?utf-8?B?bktBSHQ4RFZBb241Z1BBT1F1aWJhVFNLUElDN09Vems5WnNZTXhaUUpBMko1?=
 =?utf-8?B?S01MZTh0bFJOY2ttMVFGRlR6N2FzeXF1bG0rVDlpQ3FpdU56WXUrcC9hRkF6?=
 =?utf-8?B?eFNoNHVKQmR0WUxCeVBjMzlCeCtpOURxOW5xTW1mVW1xdHBoYWwrK05BOWRs?=
 =?utf-8?B?UW1rU1FMbUxhU21QWlgrRDU1T0pEZ1Z1Y09yVHZMSXBtQVNmcy9lZFRKYzVh?=
 =?utf-8?B?eXJHVTYxVi9xaTBxTjdMQWZCZVdKRzhBL1pSSllMQUZxZDNCeTlxalNyU1RF?=
 =?utf-8?B?amxPR240QTFOVDMwaTRaRVE3OUpGbkFGZ3E1TDZNZzI2NWRhUkxDTW9Ca0RQ?=
 =?utf-8?B?TEx0RlpreVlLZVEyWGFadU9iN2tHUElreHA0VmRjK1dVTE9OaG90RFdzRGNL?=
 =?utf-8?B?S2NVRU5FcTVoSEF1M2lpdnJHUlVBazJONWk3ZDdUMHIyVERMTjU3MnV1bVlZ?=
 =?utf-8?B?a2tNNjVxMHgwQXZ1VVVSeHlnb1ozcjNxaFRTTHhJb21xVWRSZWx1VzZRSW4x?=
 =?utf-8?B?bldRN1FCYkRQazdXRmtLa2h6R0c2bmdtZDlvOTJCOGs1SkpvaWRRV3ZNWFdu?=
 =?utf-8?B?NUg1S2Rwa1ZqVWkrenJhS2tDb0ZKVitqR29BcXJMVUFTY0lwaWVIZmYwQWs5?=
 =?utf-8?B?UVlnL0paTnRrTW1pQkNsTElvTXFzaDZ3VW5FQURkRWI2UEcvWDV0ZkkwTjZU?=
 =?utf-8?B?MERlNHN6dTR2YnlEbEsyV3FiR2tnZnNPU25kSGNSQmdwempOUlhkdW9IY3Bv?=
 =?utf-8?B?TTRXY0lTRVR6RFE0YWtsUk5nZGczWE5IcnFRSzBYRWZVbWZRRWErUDZkQ3kx?=
 =?utf-8?B?MHpaVUZ3dDh3dFJXejR6NHdyWUtyWXlnbmhwR0psejBWQkVJS0E2aTYzQ0ZI?=
 =?utf-8?B?V1dDV0s2ZysvdVVvVGF5QzZacFV2NEdtY29xK0ZveklBYkJBQS9ZazliR1VL?=
 =?utf-8?B?b3lSbENXNlQ5OEdMQlJIM3ZjeWtxTEF2SXJocWdNcHFhTEJJSGJjKzU1ZmJ2?=
 =?utf-8?B?dDdqV1RZZm1VcVcyNmhqUHgwVUFGMk42L1FFM1ZBZ25MMFhlWXJ3VEhCNjU0?=
 =?utf-8?B?bFZGY21yK09oWmovRklpVjFSSnZROHhrenhuVDE3Z2pSOWJ3VGttUzZYQytF?=
 =?utf-8?B?bDV5dVJ0NjJrKzIxaW50RVNDcmRtN2NKSHdieHNVb1ovMVFPVjhsLzV3eFZX?=
 =?utf-8?B?YkxmbzhGK3Z6S2taMEpvUXBUSlFMcytiVXV3aDRVcFU2OTNWZy9vRktueTRw?=
 =?utf-8?B?cVpzS2hTbmV5UFlhZ3I4Q1RYS0dwV1Q5Z29IVGpTWDh1ZTZHNk9KQzJYZisz?=
 =?utf-8?B?bEQ3UWI4YXUzaTlJWjJrcnVKeHE3dHVyY25MdHo2YlltT1ZNY1NLMWM4YVNn?=
 =?utf-8?B?N2ZYblFqYk4wODRzK2wrWURQb2xQbXAvUm9qZVRlZ2dCRHZqZ01OaWUrQWFX?=
 =?utf-8?B?cWJwZXR3N1ZoTnpEUUZ4c0IxMEo4djRHMUZieStVYUc2ck9hMmNSU2hUajhX?=
 =?utf-8?B?RS9oNVlQemFnYUV6WGdkTWxxcVp1emRRd0FVYkNLQ3R6d01PT0dFdVUvTXFP?=
 =?utf-8?B?bGYybEhsTXRQQ3VhZ0t6YnFSWENpcHZwekNWdjBONFY4Y25tYkhKZzhURDQv?=
 =?utf-8?Q?26SG5wgKwnirN1o40/8n?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c792ea2-e148-4491-1493-08dc5e705dfe
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:53:10.0954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_165331_827526_521FFA56 
X-CRM114-Status: GOOD (  11.37  )
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

Ck9uIDIwMjQvNC8xNiAyMzozNywgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiBPbiBUdWUsIEFwciAx
NiwgMjAyNCBhdCAwNTo1MDo1N1BNICswODAwLCBDaGVuIFdhbmcgd3JvdGU6ClsuLi4uLi5dCj4+
ICAgCj4+ICsjZGVmaW5lIFNHMjA0Ml9NQVhfQ0xLUyAyCj4gSSBkb24ndCB0aGluayAiYnVsayIg
aXMgc3VpdGFibGUgaGVyZSBmb3IgbWF4IDIgY2xrcywgbm8/CldpdGhvdXQgImJ1bGsiLMKgIEkg
aGF2ZSB0byBwcmVwYXJlL2Rpc2FibGUgdHdvIHRpbWVzIGZvciBlYWNoIG9mIGNsb2NrcyAKYW5k
IGhhbmRsZSB0aGUgZXhjZXB0aW9uIGlmIGZpcnN0IG9uZSBmYWlsZWQgZXRjLiBJIGxlYXJuIHRo
aXMgZnJvbSAKcm9ja2NoaXAsIGl0IGhhcyAzLiBXaHkgeW91IHRoaW5rIGl0IGlzwqAgbm90IHN1
aXRhYmxlLCBwbGVhc2UgYWR2aXNlIG1lLCAKdGhhbmtzLgo+PiArc3RydWN0IHNnMjA0Ml9wcml2
IHsKPj4gKwlzdHJ1Y3QgY2xrX2J1bGtfZGF0YSBjbGtzW1NHMjA0Ml9NQVhfQ0xLU107Cj4gdXNl
bGVzcyBlaXRoZXIKClNvcnJ5LCB3aGF0J3MgdGhpcyBtZWFuPwoKWy4uLi4uLl0KCj4+ICsKPj4g
KwkvKiBTZXQgQVRETF9DTkZHLCB0dW5pbmcgY2xrIG5vdCB1c2UgZm9yIGluaXQgKi8KPj4gKwl2
YWwgPSBGSUVMRF9QUkVQKFBIWV9BVERMX0NORkdfSU5QU0VMX01BU0ssIDIpOwo+IG1hZ2ljICIy
IiBuZWVkcyBhIG1lYW5pbmdmdWwgbWFjcm8gZGVmaW5pdGlvbi4KCkFncmVlLCB3aWxsIGltcHJv
dmUgdGhpcyBpbiBuZXh0IHZlcnNpb24uCgpbLi4uLi4uXQoKPj4gICAKPj4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3Qgc2RoY2lfcGx0Zm1fZGF0YSBzZGhjaV9kd2Ntc2hjX3NnMjA0Ml9wZGF0YSA9IHsK
Pj4gKwkub3BzID0gJnNkaGNpX2R3Y21zaGNfc2cyMDQyX29wcywKPj4gKwkucXVpcmtzID0gU0RI
Q0lfUVVJUktfQ0FQX0NMT0NLX0JBU0VfQlJPS0VOIHwKPj4gKwkJICBTREhDSV9RVUlSS19JTlZF
UlRFRF9XUklURV9QUk9URUNULAo+IGlzICJ3cC1pbnZlcnRlZCIgcHJvcGVydHkgYmV0dGVyPwoK
WWVzLCBsIHdpbGwgdXNlIHRoaXMgaW4gbmV4dCByZXZpc2lvbiwgdGhhbmtzLgoKWy4uLi4uLl0K
Cj4+ICsKPj4gK3N0YXRpYyBpbnQgZHdjbXNoY19zZzIwNDJfaW5pdChzdHJ1Y3QgZGV2aWNlICpk
ZXYsCj4+ICsJCQkgICAgICAgc3RydWN0IHNkaGNpX2hvc3QgKmhvc3QsCj4+ICsJCQkgICAgICAg
c3RydWN0IGR3Y21zaGNfcHJpdiAqZHdjX3ByaXYpCj4+ICt7Cj4+ICsJaW50IGVycjsKPj4gKwlz
dHJ1Y3Qgc2cyMDQyX3ByaXYgKnNvYyA9IE5VTEw7Cj4+ICsKPj4gKwlzb2MgPSBkZXZtX2t6YWxs
b2MoZGV2LCBzaXplb2Yoc3RydWN0IHNnMjA0Ml9wcml2KSwgR0ZQX0tFUk5FTCk7Cj4+ICsJaWYg
KCFzb2MpCj4+ICsJCXJldHVybiAtRU5PTUVNOwo+PiArCj4+ICsJc29jLT5jbGtzWzBdLmlkID0g
ImNhcmQiOwo+PiArCXNvYy0+Y2xrc1sxXS5pZCA9ICJ0aW1lciI7Cj4gSW50ZXJlc3RpbmcsIG9u
bHkgImNhcmQiIGFuZCAidGltZXIiLCBzbyB3aGljaCBjbGsgaXMgZm9yIGNsayBpbnB1dCBvZiB0
aGUgaXA/CgpDb3B5IG15IGNvbW1lbnRzIGZyb20gYmluZGluZ3MgcGF0Y2ggaGVyZSBmb3IgcXVp
Y2sgcmVmZXJlbmNlOgoKID4gU0cyMDQyIGRlZmluZXMgMyBjbG9ja3MgZm9yIFNEL2VNTUMgY29u
dHJvbGxlcnMuCgogPi0gQVhJX0VNTUMvQVhJX1NEIGZvciBhY2xrL2hjbGsoQnVzIGludGVyZmFj
ZSBjbG9ja3MgaW4gRFdDX21zaGMpCiA+wqAgYW5kIGJjbGsoQ29yZSBCYXNlIENsb2NrIGluIERX
Q19tc2hjKSwgdGhlc2UgMyBjbG9ja3Mgc2hhcmUgb25lCiA+wqAgc291cmNlLCBzbyByZXVzZSBl
eGlzdGluZyAiY29yZSIuCiA+LSAxMDBLX0VNTUMvMTAwS19TRCBmb3IgY3FldG1jbGsoVGltZXIg
Y2xvY2tzIGluIERXQ19tc2hjKSwgc28gcmV1c2UKID7CoCBleGlzdGluZyAidGltZXIiIHdoaWNo
IHdhcyBhZGRlZCBmb3Igcm9ja2NoaXAgc3BlY2lmaWVkLgoKID4tIEVNTUNfMTAwTS9TRF8xMDBN
IGZvciBjY2xrKENhcmQgY2xvY2tzIGluIERXQ19tc2hjKSwgYWRkIG5ldyAiY2FyZCIuCgpXaGF0
IHlvdSBtZWFudCAiY2xrIGlucHV0IG9mIHRoZSBpcCIgaXMgImNvcmUiLCByaWdodD8KClsuLi4u
Li5dCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
