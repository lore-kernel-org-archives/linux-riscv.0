Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498DEC021B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 15:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGCfUNsRLMc6sTiu0sIkaPusFwShTP+68+yh8P8JKRM=; b=rK2qCaxky1tHnvFrSatnyIZw4S
	1VzrhQaqT6YVIt22obdjSsSLxddi0UYVkUMzFyJC6KkXKYpyXeWKQ0uPoy0ZighXamPKHNaOUXFXT
	z3TS7wwSsnB6LRly67oQ9JEhqUn0tDfuHAZYlPmP/bdrXSktHSdbDypP334+y6f2Rlq3P0fchhItR
	+S+ZFLsUOL18FgDs3e+WrhIhLAiXhGhZQkkx9SCTXfPV7vLjiXRy3JdMQ5QWAlp3pVKTfs3X/3w8l
	aJOo5iIvMZs0uBzs3t4HQsjK16ud3IufaqJWOInihuKllSSM0PbTxMm42MstZSzsrHlHkzbNI/qmg
	ZAtpQ+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkltd-0000000DWDe-05C8;
	Wed, 19 Feb 2025 15:21:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkltb-0000000DWD0-3mEK
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Feb 2025 15:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XxenyQmpsC6nEdCAFBQzPGy6VJEFVMeu0MEn2p9V+Qg=; b=KJ5Xs/AKHY0lq9zVFHkCmAK6l5
	v1+kZdbSfaegfriS9Mr6HPyxgDGnykz8zTy5UKn0uZYvocTdLvWt2oJgTw4joEqEbKTJv4vNUxC3U
	ZqGNYOwbijNbAbr/a9G5KbS16J8/qBjpl5JRH+0E7zzz5vwzCzDVQDLj3+pp92YE7YQSkDCAzF0Iv
	BwARJRI9L3HWREWloZiUqtvmrqjL0suHlu9qV9fQalwjSh4OQ01AYGineosdosPykh2XPScLomvzd
	GCQM/R/AwQi5vKHuM8tLripQTPuyp6NsVb4tC79UrxPceJsd4e85VG2DPwMfbJsMXTv9DcTRYwONb
	g9PYutzQ==;
Received: from mail-vi1eur03olkn2082f.outbound.protection.outlook.com ([2a01:111:f403:2e0c::82f] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkltZ-00000002FEj-06Kw
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 15:21:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxmt5XKdsF9rcxPfcGdggxg24pDZWuwCUJcIKB80jHO0VGcXifgrXoYvF6+VqJG8+LxZduS0ovWtJAYLNa4NkdBAKshp7bZDHzYS8qiqZ8s2iJ5tRVu+h7cNepaU55c3Po55YgUKsD2uWDihMAoFAJR1K2+mMr64F+ya9hxvUpehO+alsCRFKmgjgVcjHdtcjfOlb/9QxTNCo0Bdf3uFbGeuKv0b7vfDm+YJ3J/AY6WwyKNfIhCDLdKMGGL0nRvWgkJV+tWxay0MkSdliiXLP6wi3H2pFOPTXa51x4sYSyyBnYpFKxPB106FV5Y76oP2RmDVTPHoe8iglkEok1OHaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxenyQmpsC6nEdCAFBQzPGy6VJEFVMeu0MEn2p9V+Qg=;
 b=mCUZLlDzHYmHY6GudVD7gUwC2KwZZU1eqrvuScWxZjL8v9H0cKuWxRTKfcKIm149oStrn75p4OAN8479OWcUyXMW2brFVNR4oqO4sVeRjTGKEMonNscGtBccVteanNeUHVapirQ6ap6dNKlxFmaAVyddgxx4q3F5LIW4TnTWL+00mFmxpqT36PbcUuQk5XqL0pcBCU1o6HfuJwJJpgdsqZOjLTVOXlwv+4y5csnS6KLYhdWSy+lSWnbElLmCkR+xhGnZG13+p3L5oJp+k+nT6SYXPDJ2MWcCgsbc96CX2RSV6BTyQSIPzlxW3cAB8zDGldlhfjytssrmQVPVKfsjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxenyQmpsC6nEdCAFBQzPGy6VJEFVMeu0MEn2p9V+Qg=;
 b=C6oc98/clVRTG1iMazzWYMuOlCJ78Y8iio9TRw559r8n3XJNejsReu/XSHkahscbwM/wmKnymtwGr24JPpRPwHZIcTBQSIn1p/p5Nz0tYfxUjGxk4y28FipjyyJlGbrLxSnd0fMDK0RfzCxOZoJ8RvgMLrgE6IH8HrDIhbyaip4tCqnBIbQ6tubIFw3I4NOV82eBEp6CGkaHI3etvv8K/MXaau5KdHXBne8rBY5XhdQGwFimJBfgYpH8gnSpjC6tv+kyOqqTnrW8FKNW/hGq7/DnKzgIYDz3RVZgaycwz9TwmpjIE1MSXBXpATnJo04hEPgHXWEzJiNxnYFv4SicJg==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by AM0P189MB0675.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 15:05:56 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%2]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 15:05:56 +0000
Message-ID: <AM7P189MB100973D1DC0164099067E2AEE3C52@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Wed, 19 Feb 2025 16:05:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: fml13v01: increase eMMC bus speed
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>,
 Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215-fml13v01_emmc_speed-v1-1-e3bd224ae0e8@hotmail.com>
 <CAJM55Z9GJr3BtbQeFpNU2P=nomsOvQ6dsVYFX_s=tHznu75ptQ@mail.gmail.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <CAJM55Z9GJr3BtbQeFpNU2P=nomsOvQ6dsVYFX_s=tHznu75ptQ@mail.gmail.com>
X-ClientProxiedBy: AM0PR01CA0171.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::40) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID: <4f84e2ce-9f0a-4cba-9610-9a087e297169@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|AM0P189MB0675:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bbafeb3-ff85-4578-76b6-08dd50f6e92a
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799006|5072599009|461199028|19110799003|8060799006|6090799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUhqWkM1WXM0bVdmS3BmMEN6WHhCc1ZEZjQ5K3I4UGVuMDdoZjBxOVJ4VWpH?=
 =?utf-8?B?VmtlcTd3YVJ4ME4yb3pWVmt0OXo2eDNXdVFobkhpZE1Fbm51VUN2Y2lWaXJZ?=
 =?utf-8?B?QWxJdlNmVzhLMnZMWENCbUtVakQyNmVGRkxOUzJVMDFoWXZlUmN0MHVmb1V6?=
 =?utf-8?B?aFlhMTROSldxZEV2QnJvSmwvY0RQV1JrS3JEUGloOU9RNXdsTDd3UjdMb0pz?=
 =?utf-8?B?dGlMWDd1dHhHem8vL0hFM3dCYmxTTUxVbjUzOGI1dVF2ZHJEblkyL0cvTVNV?=
 =?utf-8?B?eTFSamRhdzhnczBqL1h3MWZ6QTh1ODFsKzZXZUVvSTZVeW1RR05ZTStPU0FP?=
 =?utf-8?B?cG40N1N6OHFzM3lBNFU5bnkrYm1SK2RscVozTDV6R3M2QkhEczJCVjlGRUpX?=
 =?utf-8?B?K2J1ZThIQTZ2QjZ4Q3lrb0R2ZzNJd3pCWUdLTVNXMVJyMDRUbld2YUx5MmMz?=
 =?utf-8?B?aERkRjE5VTNoK3c1QnpwV2tFVnZ5WkNVQldPRmFEbXNsZzE5SXdLRW9oUmpn?=
 =?utf-8?B?SGt3djNwYWFJVWxFWkk3UmJKd0Q0akhBd1FlUmppeVNmS0NuSHVsYk5ZSVVW?=
 =?utf-8?B?Z3pxOWYzQkhLNVYvblR6MkNaWHFwVDcwdmRyczFKcmMvZGdDY0YzOTNpZHZY?=
 =?utf-8?B?Y1FvN3E0VVU0Umx6aVQ2cE90bU9EWFhEbGZibWlNWnZjZ1R2M2tWS2dpWDhx?=
 =?utf-8?B?N1MwaXJjeGZwVzNqcEtDSThTMVhiNTVmMHh1bk44SDdub3JRRFhoQUFwVUxj?=
 =?utf-8?B?TXhyYitoQ1FKTHA2YjNVUGhhZTZMSjRVL0MvQTlQOXNsKzNhaFM3d3VDOGgv?=
 =?utf-8?B?TGtHQkw1ZXd4aW1Uc29TTURxbDBTRmFhVEw3NHcrUGQzeERoakR4Q3hhT0ow?=
 =?utf-8?B?OVBTTXVwQjRjNG8vUmdCYUhSeDVPM25lbmRkZzdCbGdoWlRrUmZpWlBpUDk1?=
 =?utf-8?B?dmRnb2dwWmlYTW40Z2dYcVJHOHpxVGdySDdrbW9MVVQwRm1ZcCtwVkswNWpP?=
 =?utf-8?B?T3p3bzlNNXUxaUFVc0dvM2lYM3ZxcFB2dHQ5SCtyR21Zc25Pb250VEMvaWE5?=
 =?utf-8?B?c0UrcG50T3ZJd0VtNXRHSDZqR1VSdDNUVFRFK28rOGtKY2hUMGYzMkdWT0Zi?=
 =?utf-8?B?cWFCQmhYSUliN1JFTjI2L0R1TnpWekdzWHpzY1ppTWhPeTVRTWpERmQ4cWow?=
 =?utf-8?B?bmVWRVJoR0V5RGJ5dXFPRk4vb3NsSXc5anpuOW5RNXZpWXYrUGd3bDFEZzN2?=
 =?utf-8?B?b2FwTGZUbTVvTWV3bHhPN3F4U0Z3cEoyejZmYU8wRUFkNVBsZzZPSFZ5U3BI?=
 =?utf-8?B?enllU2ZjL3kwWVJDMlJsRWY1YmxEdGV6alNSb0RVck1sNCsvRnhMenJZckhq?=
 =?utf-8?B?U1ZmQWFocUZ3UEhsMHdRWjROdDRGYzZlT0VNQVUvNFVKbkdVM3l1VDkvQk5n?=
 =?utf-8?B?WmVHSVJzMWlsUEtWdDJYbkZyV1ltMlJFaENvZUh3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1ZaNXBGcUszcEtKVlBLRjA3bGVxNzAvQXloRzkwemNxVi9XcXkveGhyZjZx?=
 =?utf-8?B?b1hDN2RwTEpPL2VrWTcrNVlRL1JOdWVIK1Y3SWErNVBiTG9TbllRZFNOOWov?=
 =?utf-8?B?OSt2WTNCa3Z4QmhxeDdBeVU5VHdNdEIxMzJTd042WU9xUk9WOFdyMWRGcUZi?=
 =?utf-8?B?Mld1cXcvV0hyV1VKNm1MZWdsTEV0ZkEzdTNUM2E0TGx4QitkT3JMdnVtZFZ0?=
 =?utf-8?B?MDl2Z01hWitrYnorRWZsUVdnS1QvMzhNRk5sZ0tjRjlrYUpIREkrTHh2Z3NN?=
 =?utf-8?B?bUtnTDBGYUIydjZvTHBnVnJ2WVYvQjFzcExxL2dWRmxOaU02Y25kT0VlSE1Y?=
 =?utf-8?B?S2YzQ3dqT3ZrWEI5NENvR2tDSkVHOFlFcHZ6OUllSTdtaG9Ka0ZqRHFQZEQz?=
 =?utf-8?B?cFlneW5kd1Vlckx4a0QzVmZ4MG9LUHdJVUh6SDJFWS9aTDlpcTJ1WmFEdWRZ?=
 =?utf-8?B?bHhKS29UYmlDbFJJWnhPcXpSMEllWjdBQWR4UkZKSHhnbytWVVowMzhwdHEx?=
 =?utf-8?B?dHdzcTdpVDhjMm9JK3djRFZodzQreFhUdEFPU1ZpdzBhNkpGZTgva3FVeU9h?=
 =?utf-8?B?U1lLZjJhL0o5VzIrSGozNmpGSkFKYkVQNDlIZVZpV1BMempRUFkzU3Y0UDRK?=
 =?utf-8?B?aDFSR1pnb0c2aDBlK2JqZndMdDgrUDlFeW5CalEwY3dFYUNXeTVPR3p4cE82?=
 =?utf-8?B?UmdqL3F6SkNNSlhjVjdQNElSSVBjNnE3T1BwL1Y4UDdrVXRScW1EVS9lQk9u?=
 =?utf-8?B?SzE1eHdLQkppaFR0d0gzbVU2d3VLUFV5aXFhbkhiQTZrL3RuODdaTDhNU200?=
 =?utf-8?B?V2FteDF5Z21ndVFzditPV1VkaEJ1VHgwWXhuNnlPQnp5MFpUUXFWTmN0MkVF?=
 =?utf-8?B?eTJsT3hFaHVrYzVDMlJDbzZ0eGVQSkhHc3VXZzVlQUp2aHdoWHBDNEwvcGZp?=
 =?utf-8?B?dkxBekVLcGZPcUZtVG14VklNZ0ZXdEdhMnZOQzA4dUs5a3VoQUNtZ2RKUXFJ?=
 =?utf-8?B?d1p4WEdnbkZ5Q2Uxbzd4aHlTVjZTUHRzNTEvSUhQdCt1b3AxRU1Ra1llbkdF?=
 =?utf-8?B?bHU4U00rb0I2QVFuTmVDK3ZSK3NKM1g2VGU2eUV2VHdXN29TTGdMbHZad3kv?=
 =?utf-8?B?WmJNeTdDeThDL1NyZ3FKS1ZmYjY4c0NROWx0Ly8xVDVjYjQ1NzlabmlQVUV1?=
 =?utf-8?B?dFU0Y25lbkNjN2VNR3NMTkVHdDZ0RnRwTXZEREdkVXowNWxuTERrdHFTMFhY?=
 =?utf-8?B?cFFTRlVLS0lKYXJYRTFXRmNNTDM4R0J4RUJGTG05TFB4c0N0U0cwYWRZMXRn?=
 =?utf-8?B?YU9yYXc2MThGWDJYbURWQWs3RzVGUTd3RVdCVU1oeS82b2RPRmV6azNqQmdn?=
 =?utf-8?B?VHNWT0FGK1BEcU1vOHE1bWxja0xGc0txR3E0ZGxHMXRIcHd5dHNTeEo3SytD?=
 =?utf-8?B?bGFlZ3NKOEVKOWFNdzFhTVhKV1dGNnNhcCtmSHg1Z1ppOUJzdm1Ebmk3eFBi?=
 =?utf-8?B?UUQyV3RMMEw5eUxHbzJ5N1ljUzB1SkxhN0VyUzlub2pJQU9kd0lUelVYZmFB?=
 =?utf-8?B?cmYzbWNYUm9mWGpDWE8zbkY5dzBqQitWRm8wN3U1VG9HQzlEVlU2MlNQL0ll?=
 =?utf-8?B?OWVKWUxlcXFrZlF2N3hiTUQ2aXhXWE0vMERBcEpORjlNMFRId3ZBcHh0ckxO?=
 =?utf-8?B?VDJQblhEZ0NJN3FOVmVJMDB5eDE2MnMvMlluTjc3TllQY1cxZTJOdC9MZkhN?=
 =?utf-8?Q?7QzLdcO50S0N/k9gZUuok+VXpzV4vQp/C2XE3c5?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbafeb3-ff85-4578-76b6-08dd50f6e92a
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 15:05:56.4814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_152153_172497_54F69EBB 
X-CRM114-Status: GOOD (  18.00  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/19/25 3:21 PM, Emil Renner Berthing wrote:
> Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maud_spierings@hotmail.com>
>>
>> The assigned clock speed of 50 MHz is and max-frequency of 100MHz are
>> limitting this interface which is SDIO 5.0 capable. Sadly at 200MHz it
>> fails to mount an eMMC drive, 150MHz (really 132 MHz) is the highest it
>> was able to get.
>>
>> This improves the seq read/write performance by 2x~
>>
>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>> ---
>> I put this in this specific dts instead of the common one as I cannot
>> test if other boards are also able to handle these speeds.
> Hi Maud,
>
> Thanks for the patch!
>
> These settings work on my Milk-V Mars board booting off eMMC, but I'm not sure
> if that means we can just raise the frequency across all the JH7110 boards.
> The eMMC on my Milk-V mars is a detachable module that identifies as
>
>    mmcblk0: mmc0:0001 DG4016 14.7 GiB
>
> I guess what works might depend on the module too. Is the eMMC on the framework
> board soldered on?


No it is also a detachable module, it supports the same interface as 
most eMMC modules seem to.

> Raising the max-frequency to 200MHz seems right for all boards since we're
> already saying mmc0 supports HS200 mode.
>
> Maybe we could begin by raising the max frequency to 200MHz for all boards,
> but only assign the 150MHz rate on the framework board?

That seems alright with me, I'll send a v2 with max-frequency adjusted 
in jh7110-common instead.

> /Emil
kind regards,
Maud

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
