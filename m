Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7C3D6EBF1
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 09:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3QZCAwubxQalY18PTPFtOv/xWBQXox2lhqiDJfFs3s=; b=pOl86Lc9MHiPDpEOrM7ThlNxDk
	Aj2uv9H900lc1eLR9+XBCc/IC1yjk8+q+CdAzZt1AtNibvquuctJooDDFkj4J0HiAhAevQF76Nvfg
	QX6qGYT0tMN4jiNwcxUCf9d/TOL6xGHtiwTG2SSJfLRRqEe6j5P/uk2Xz6gmMf6jsOl1hisjrVfRx
	8RH9p4jBkUybM5lvd3t+bAi0mxuEfgkeQIGCC55WIwzJuLtgkmVNfvBl9/TVnPIQSSeLwjr4QQfIB
	PITRs1t3I//o+Y+ON4Qf613VKrPG5Ksad3qvZFiPE2rOCB2RELQgaOtF12pUIpNAV/w85wCvCjbrS
	QLDEOzOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGxfR-0000000HMrb-1z0g;
	Fri, 29 Nov 2024 09:52:05 +0000
Received: from mail-centralindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d409::1] helo=PNZPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGxfO-0000000HMpw-0Czm
	for linux-riscv@lists.infradead.org;
	Fri, 29 Nov 2024 09:52:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ig1X5Uw/s2KpTdum1fqIIC0zd3C1x19e6hgZOvjgHe/4rGZK3tD4nK/xbEMYMKvbY8iewqSLCXzC1brCUzlzgaLkF0NdRPAAfpurcIiFrjK2C7vaHEuu4vtQukQRqp2+AcQMWO6QcAUgaVe/EE5fsUKPf3DWPO9DDEGLseDqdBRC6YfzZ4btlXAvS8JvzUvXsSE5UUelE/lEnoDmX2iXQo32vdVS8Kbvu9BNhD5uwnt6UAdnP+xZZPL/2KfSrgJXWYjsIDj/ijjfpoKpX8+PvRYYv1fhu9vZ9ACwDcNTnuBg7DnkX/UKpI2wksBPgb9jlbXdQi/+gIOvco4MGauLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SH+Npp7zGYpYM+WO4iZx2VW/zbMhGhXlzkbgJ821i4=;
 b=Unkax42Rg8YvZxhNw3jEA0Ve4mYmq6AGUTI0p3ZLVMZ9O5Zn72xezETZ2Xmk21Rf3QmLbTjqjl1S5taDpmE4oFlZaR+DrnDK8c8XIcMqOQ6iJWcwXIALNcv/MGnOGt8pFqa3xBgn8jw/MZ3uqA/5OVwwXw18kLfC08fGlfBh4TmFD13DfF9g4EmiNa0QU6QsZHZJqZkbbPIK8dCR56EdtXyose4pUFwwzUiY1UlUanZh/EOgm9qGNxKwpcDywC8zscVck3BKOySdhPTc1gpmKJkgE8v2gp/YXbQYEkkgNLQyvBAsv0JQ1vACiJJoCHaj1T0Qx718fN6HkuEV/WBB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SH+Npp7zGYpYM+WO4iZx2VW/zbMhGhXlzkbgJ821i4=;
 b=VsIV0nnbvIsd0fJ6aP18fY/U0+GiSICD184XhqlT+2Dc59pzaF7eFvNKUwvaxlAjDD6LDSNSEB8o8QOi18ICdDN82eVXtoF/ly593wzuucwdI2/h+BcD3q23vp011Je3og/5u5TFTmyR/hE7WO6tL6A0M/DHdr791FxRJ7kN/MlbLxK0hggWPk8DzdVWESS/EvVF+g7RGTfuJgu25wbP28XgwvxdqJ7/UEyOFY+zvjGWwtHxhu688YfuaqVGyxPCrAlTUGbRciNzBdxz3PYIyGzQkGeRt6yioHGodGDaMXprtOWf6mCusHhx0ZpjkUNDEtKDZc0DdigsTDUYIHycYA==
Received: from MAXPR01MB3984.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:68::20)
 by PN0PR01MB6547.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:74::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Fri, 29 Nov
 2024 09:51:43 +0000
Received: from MAXPR01MB3984.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::285f:e601:b80b:465a]) by MAXPR01MB3984.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::285f:e601:b80b:465a%6]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 09:51:43 +0000
Message-ID: <MAXPR01MB3984C307B163E615811A25AAFE2A2@MAXPR01MB3984.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 29 Nov 2024 17:51:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: kw@linux.com, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
 arnd@arndb.de, bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
 lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <20241112212055.GA1859446@bhelgaas>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20241112212055.GA1859446@bhelgaas>
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To MAXPR01MB3984.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:68::20)
X-Microsoft-Original-Message-ID: <2f2a60cb-265d-49db-af8d-72ca67d75a16@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXPR01MB3984:EE_|PN0PR01MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 90278b0b-9649-4e6e-f44a-08dd105b6e30
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|19110799003|461199028|6090799003|8060799006|7092599003|15080799006|10035399004|3412199025|4302099013|440099028|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTJxVHNlRW5SRlN1NUZpcjh1MjhiaGt4NW5MSENBbUduYzR2eFJhTlBqWm1B?=
 =?utf-8?B?UGwzOExFcmFpN1hoMUpuRkdUazJvY0RpRzMrQ1NubFgrVFJqV3Q0V1cwelc0?=
 =?utf-8?B?bXR1S0NCSVlvWkRkbXUrMlhqSzY5YXZzamhPOFprQkpOSE1RRmZDR2pGVUxw?=
 =?utf-8?B?MjB1SVdlUEczNDdjdDZ3WVpsMnBBeDVOcXBuc3pJYmdlZk95OGlLTGVmR0JW?=
 =?utf-8?B?RzJobm5JZ1BCNG9GdmdyTVNOdXR5bDhtaDBEa2hZbHplc0lQRWhDMUNUamRt?=
 =?utf-8?B?OE5Uclp6eUZiZ3JjWkQxUmxLR0JlL2Z3Vzd1c1k2MERGWmNFTXdUTGVvOWJP?=
 =?utf-8?B?cENWSEdtczAvUTcxU2Rsdnk4RzF1K1MvNFFwM2dZLzltVUdwZU41MjlvTnF1?=
 =?utf-8?B?a2lNQXpMQ1cwVnRrZ09nZHVzTkZJV2hVL1krMDJEYVkvTG5WRGZBQTg0TC9r?=
 =?utf-8?B?enFDdHN3ekhyS3pDYmtIaHAvVitKenRwQTVDaG9vZXZKcUtXRmZjd25TcVlh?=
 =?utf-8?B?Z21ZZVhsL3BVTjR0ZlhRUUxDMjRNdXZUZFJyRVZ4akRUTjZxNEpjNmlNdGxa?=
 =?utf-8?B?QjBsd2RsSmxzNEdxNUk2SzFYODZMQWFBS0ozRzQxZVVoL2d5RXh1ZDdhc2No?=
 =?utf-8?B?MWpwVUM5TlVCTnBSU0F4cVVESWpaWUFkcVJad2h5UmNWSDd5Ly9TS1BWTnRC?=
 =?utf-8?B?b0loREM3V3hyWDNqbjkwbWhhZ2IzQzR3ZStRZjFYOGFTYXM5VUxNOGh1VFFq?=
 =?utf-8?B?QlRsaXcwQ3FiUWJTK0NDOWpHTm9rQSt6QjRkWXNZa0U4b3dFbmthcjVwSDlG?=
 =?utf-8?B?RFlxckg2UnhUbktOMW1WRWV4dWFkSU93NmNBUGxYSHgwU1Q2SXY1TkdTRHJQ?=
 =?utf-8?B?TnFzT0V3ZjB4bzdGVkhyTytPZXZ6M1lENEw3bXJDQmYwYzJBODVOZlRtQjh4?=
 =?utf-8?B?OTNKWUFod1lHclpZZTYxSHNFeG83UE9JaVFnbTA3cEloK256OUt6dmlLQU5L?=
 =?utf-8?B?MGs0bGxkV1E3RkE2RTlRNjAyREVQYzExZGVVYkcraFZTTy9sQmVOQjdHR1FD?=
 =?utf-8?B?eUF2bHBjcW1RZEloWGpjZ1VtZ3I0K0RQK2ZLSThkMDZqNmRySmpOUm9uL2Q5?=
 =?utf-8?B?aVBUM0pqMDZaOU9mZFFieHZtVW5uS3BaMGxQU1V4VmxycEllMExWcXRNcVpI?=
 =?utf-8?B?eU1EWCtBK0YxTDRCQ21jTlZBWUY3OU1kbUhHSlVnWDVJaHNZZFdmL3pTTXVP?=
 =?utf-8?B?dFI0RWVTQ1RVSDE5Tlp5RHpzVk0yeFJGcEVDSHF2em9RenAxUFJxUm5mT2RH?=
 =?utf-8?B?N2NqcE1CUk1QV3g3TjBGZVhHV1lDRGR6MVRtWmk3NWFoVXdSR1dXZXRKQ2ZP?=
 =?utf-8?B?dS9ybmZSS3VON1o2RU9NTnhoRUF1a2dKSWFjZE1YY05MQU5MQnFSaXNVOWN6?=
 =?utf-8?B?L3Q4VWNZN0FTd1NJbTZoQ1ViZ1gycksyK0hBbERxS1RPVkxER3FzaEVBV3pr?=
 =?utf-8?B?Q1FtOUpCYnQxK0N6ZklMSTd2S2JVM281Y3ozbzNWN2kzRU1PVDJmUDZsS1M3?=
 =?utf-8?B?N2VCSnJqMVUxVUl3Z2pNdlpnLzVnWERLVjJRZ3lGOUxHKzBOcjVLc1h5Z3Rh?=
 =?utf-8?Q?aN41BPNcMP5LQ/lbj+KcNlNKBCoVjQxFyhH75sfIFNtc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1V3Ykc4cDM2eTlGWjJKeU9WN3VuM1ZZc0xPVUFxSXE1OVgwc1VTOWVmWVAy?=
 =?utf-8?B?UkZhZHRMWVhyY2NBS1pmZXN3bWJrdlVjZkY5bWFWaGZhbi9WbWNQVzFxbFpJ?=
 =?utf-8?B?YU1VU3FnVnpuaW05WmNTZHpyeGltQ3BnT0xHTS90Q3hrRVVkbk51cjNtUEVH?=
 =?utf-8?B?UUwycHZ3WEUvR1Ria25ONTBaRlBFVnkyRlluQzNET1AvK1Q2MlJwZTgzdTRU?=
 =?utf-8?B?U3ZaVTFpZnh1L1JZMG01MktWM25xZk9uQS8zZlllT0p2YmV6VllwTEJVM0Vq?=
 =?utf-8?B?UTNtcHJ0VWJqOHYzZTh5bjZ4YndvQ3VRL3NWbTFxd1REWGJzdzdNdk5mczYw?=
 =?utf-8?B?QTEvQ3RIOEQzVTQ5cW9mWGlYYURGcFhNbm1VK3NJOVgzZi8rTFlSTXBxY0hv?=
 =?utf-8?B?QWREeVVkUFRiYk1HVE9hemJ3SHFyVXYzYjh1TXoycnM0ZGYrZCtra2xBYmc0?=
 =?utf-8?B?clhTVllmQ3o0eTJXanIzRHE2cGwzQzhtcUp5R0pxZW5ueGVUSTU1Vlladk9n?=
 =?utf-8?B?b3hrYWtpdG9XR0NWSk9CN1pjN0Ewek5HTkU3c3VMM3lRTXE5dFQxZXl0YUla?=
 =?utf-8?B?UGNYNnN0cDhSNVZ3UThjR3RaQXduVkdLcDBNVnlTMTJGMWYzY3pWU2JZdW1k?=
 =?utf-8?B?MEl5aFF4ZEEzZFlmQ2U4d0xUZXVuS0l3VDc3TmFacThBakM5WlNzaXBkOFFy?=
 =?utf-8?B?d0pqL1liWitFR0puMXZ2cTlqSHdDVXF5MVRySFhRT2pDMWdNQnpydTVqemJt?=
 =?utf-8?B?Z0gveWJJVm96TU1LNDBhaEZ5QXQ2cGwrelh5OWVvc00wc1IyekxlZ2VGdWVE?=
 =?utf-8?B?N3o2eDlwVlI2YmdKVEM5UG1TcFdvcHFsSG1tRGdVV3BobGdvZTRacVgrTnZO?=
 =?utf-8?B?UnFUaW9iTFFWNnAyUXluNWJWeSs0bFdxdkZud0ZTVGtmUlFPc1oyY2ZtSjYy?=
 =?utf-8?B?MmE2akZPa1dqejl0R2gwVC9ueDgrL1FvOE4zdWVHWnRrT1FYWmI0eUZnSk9V?=
 =?utf-8?B?MGVOaVh5VDNHSFdlNi84VjhFa01XOFRpblZUTTB6ckZtZmk5dzBvdlhoUVZa?=
 =?utf-8?B?MVRTMXVqYnRjbFJkcTBycE5uWVRkR2wwelRnZUVyTjQ0TE1SVWVHWjc3anJr?=
 =?utf-8?B?KzFzZmxIKzljR2JaRjhocDlUUEJqbDh3bVAwYUJzdkowR3ovTUJzZDgyZ3Vq?=
 =?utf-8?B?ZlhjTHNyRHExaXhaK1RVUjZsVDVNSG5IOE1vVVJQdHFGT3hnM3lzOUpwOG1F?=
 =?utf-8?B?YTJxZFNxWjZybCthQlY0ZTExWVp4akdoM1hqRzhmdzllK2lOZW53bE54dXN4?=
 =?utf-8?B?S0tKR0pmdzZCV1ZMQUgxVjdJWVlvQmw0bnlvZG42VGFYbzhPN0p2RElDekVU?=
 =?utf-8?B?QllxN2FJOHNrWE5nMStXUzNrdzdvRGtvdjBnaHcvdGlHdnUrV01MRllpRG9G?=
 =?utf-8?B?YlJud01oQVlNMmNSLzAvWS9ibEdzVmd0d2VvUXlwbUhYWXlIb0NuLytQMGhy?=
 =?utf-8?B?K2tlL3hEcXo5Q2hUb1RHUG5xMGsvQ3hkMW1ZMm1RbGZwL2Z5YXlaN3R0enpj?=
 =?utf-8?B?N2tuSmhreEdvNy9zeW9iekN4WGs3eHVUL01RWEJzQndhMmlrZ1VhSThTbG5G?=
 =?utf-8?B?aFJZZFhPa0dLQWpONnNVb2hNVXFEV1YxT01xaUhVQ3NXelIxZlZNVGkzZ2F1?=
 =?utf-8?Q?3zauP1m1V0FM6EtNJbC2?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90278b0b-9649-4e6e-f44a-08dd105b6e30
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB3984.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 09:51:43.7661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6547
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_015202_303796_EEC65EE9 
X-CRM114-Status: GOOD (  27.78  )
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

SGVsbG9+CgpPbiAyMDI0LzExLzEzIDU6MjAsIEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4gT24gTW9u
LCBOb3YgMTEsIDIwMjQgYXQgMDE6NTk6NTZQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+PiBG
cm9tOiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4KPj4gQWRkIHN1cHBv
cnQgZm9yIFBDSWUgY29udHJvbGxlciBpbiBTRzIwNDIgU29DLiBUaGUgY29udHJvbGxlcgo+PiB1
c2VzIHRoZSBDYWRlbmNlIFBDSWUgY29yZSBwcm9ncmFtbWVkIGJ5IHBjaWUtY2FkZW5jZSouYy4g
VGhlCj4+IFBDSWUgY29udHJvbGxlciB3aWxsIHdvcmsgaW4gaG9zdCBtb2RlIG9ubHkuCj4+ICsr
KyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9LY29uZmlnCj4+IEBAIC02Nyw0ICs2
NywxNSBAQCBjb25maWcgUENJX0o3MjFFX0VQCj4+ICAgCSAgU2F5IFkgaGVyZSBpZiB5b3Ugd2Fu
dCB0byBzdXBwb3J0IHRoZSBUSSBKNzIxRSBQQ0llIHBsYXRmb3JtCj4+ICAgCSAgY29udHJvbGxl
ciBpbiBlbmRwb2ludCBtb2RlLiBUSSBKNzIxRSBQQ0llIGNvbnRyb2xsZXIgdXNlcyBDYWRlbmNl
IFBDSWUKPj4gICAJICBjb3JlLgo+PiArCj4+ICtjb25maWcgUENJRV9TRzIwNDIKPj4gKwlib29s
ICJTb3BoZ28gU0cyMDQyIFBDSWUgY29udHJvbGxlciAoaG9zdCBtb2RlKSIKPj4gKwlkZXBlbmRz
IG9uIEFSQ0hfU09QSEdPIHx8IENPTVBJTEVfVEVTVAo+PiArCWRlcGVuZHMgb24gT0YKPj4gKwlz
ZWxlY3QgUENJRV9DQURFTkNFX0hPU1QKPj4gKwloZWxwCj4+ICsJICBTYXkgWSBoZXJlIGlmIHlv
dSB3YW50IHRvIHN1cHBvcnQgdGhlIFNvcGhnbyBTRzIwNDIgUENJZSBwbGF0Zm9ybQo+PiArCSAg
Y29udHJvbGxlciBpbiBob3N0IG1vZGUuIFNvcGhnbyBTRzIwNDIgUENJZSBjb250cm9sbGVyIHVz
ZXMgQ2FkZW5jZQo+PiArCSAgUENJZSBjb3JlLgo+IFJlb3JkZXIgdG8ga2VlcCB0aGVzZSBtZW51
IGl0ZW1zIGluIGFscGhhYmV0aWNhbCBvcmRlciBieSB2ZW5kb3IuCgpTb3JyeSwgSSBkb24ndCB1
bmRlcnN0YW5kIHlvdXIgcXVlc3Rpb24uIEkgdGhpbmsgdGhlIG1lbnUgaXRlbXMgaW4gdGhpcyAK
S2NvbmZpZyBmaWxlIGFyZSBhbHJlYWR5IHNvcnRlZCBhbHBoYWJldGljYWxseS4KCj4+ICsrKyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9wY2llLXNnMjA0Mi5jCj4+ICsgKiBTRzIw
NDIgUENJZSBjb250cm9sbGVyIHN1cHBvcnRzIHR3byB3YXlzIHRvIHJlcG9ydCBNU0k6Cj4+ICsg
KiAtIE1ldGhvZCBBLCB0aGUgUElDZSBjb250cm9sbGVyIGltcGxlbWVudHMgYW4gTVNJIGludGVy
cnVwdCBjb250cm9sbGVyIGluc2lkZSwKPj4gKyAqICAgYW5kIGNvbm5lY3QgdG8gUExJQyB1cHdh
cmQgdGhyb3VnaCBvbmUgaW50ZXJydXB0IGxpbmUuIFByb3ZpZGVzCj4+ICsgKiAgIG1lbW9yeS1t
YXBwZWQgbXNpIGFkZHJlc3MsIGFuZCBieSBwcm9ncmFtbWluZyB0aGUgdXBwZXIgMzIgYml0cyBv
ZiB0aGUKPj4gKyAqICAgYWRkcmVzcyB0byB6ZXJvLCBpdCBjYW4gYmUgY29tcGF0aWJsZSB3aXRo
IG9sZCBwY2llIGRldmljZXMgdGhhdCBvbmx5Cj4+ICsgKiAgIHN1cHBvcnQgMzItYml0IG1zaSBh
ZGRyZXNzLgo+PiArICogLSBNZXRob2QgQiwgdGhlIFBJQ2UgY29udHJvbGxlciBjb25uZWN0cyB0
byBQTElDIHVwd2FyZCB0aHJvdWdoIGFuCj4+ICsgKiAgIGluZGVwZW5kZW50IE1TSSBjb250cm9s
bGVyICJzb3BoZ28sc2cyMDQyLW1zaSIgb24gdGhlIFNPQy4gVGhlIE1TSQo+PiArICogICBjb250
cm9sbGVyIHByb3ZpZGVzIG11bHRpcGxlKHVwIHRvIDMyKSBpbnRlcnJ1cHQgc291cmNlcyB0byBQ
TElDLgo+PiArICogICBDb21wYXJlZCB3aXRoIHRoZSBmaXJzdCBtZXRob2QsIHRoZSBhZHZhbnRh
Z2UgaXMgdGhhdCB0aGUgaW50ZXJydXB0IHNvdXJjZQo+PiArICogICBpcyBleHBhbmRlZCwgYnV0
IGJlY2F1c2UgZm9yIFNHMjA0MiwgdGhlIG1zaSBhZGRyZXNzIHByb3ZpZGVkIGJ5IHRoZSBNU0kK
Pj4gKyAqICAgY29udHJvbGxlciBpcyBmaXhlZCBhbmQgb25seSBzdXBwb3J0cyA2NC1iaXQgYWRk
cmVzcyg+IDJeMzIpLCBpdCBpcyBub3QKPj4gKyAqICAgY29tcGF0aWJsZSB3aXRoIG9sZCBwY2ll
IGRldmljZXMgdGhhdCBvbmx5IHN1cHBvcnQgMzItYml0IG1zaSBhZGRyZXNzLgo+PiArICogTWV0
aG9kIEEgJiBCIGNhbiBiZSBjb25maWd1cmVkIGluIERUUyB3aXRoIHByb3BlcnR5ICJzb3BoZ28s
aW50ZXJuYWwtbXNpIiwKPj4gKyAqIGRlZmF1bHQgaXMgTWV0aG9kIEIuCj4gcy9QSUNlL1BDSWUv
IChtdWx0aXBsZSkKPiBzL21zaS9NU0kvIChtdWx0aXBsZSkKPiBzL3BjaWUvUENJZS8gKG11bHRp
cGxlKQo+Cj4gV3JhcCBjb21tZW50IChhbmQgY29kZSBiZWxvdykgdG8gZml0IGluIDgwIGNvbHVt
bnMuICBBZGQgYmxhbmsgbGluZXMKPiBiZXR3ZWVuIHBhcmFncmFwaHMuCkdvdCwgd2lsbCBjaGFu
Z2UuCj4KPj4gKyNkZWZpbmUgU0cyMDQyX0NETlNfUExBVF9DUFVfVE9fQlVTX0FERFIJMHhDRkZG
RkZGRkZGCj4gUmVtb3ZlIChzZWUgYmVsb3cpLgpZZXMsIGFmdGVyIHNvbWUgdGVzdGluZywgc2Vl
bXMgdGhpcyBhZGRyZXNzIGZpeHVwIGlzIG5vdCBuZWVkLCB3aWxsIApyZW1vdmUgaXQuCj4+ICtz
dGF0aWMgdm9pZCBzZzIwNDJfcGNpZV9tc2lfaXJxX2NvbXBvc2VfbXNpX21zZyhzdHJ1Y3QgaXJx
X2RhdGEgKmQsCj4+ICsJCQkJCQlzdHJ1Y3QgbXNpX21zZyAqbXNnKQo+PiArewo+PiArCXN0cnVj
dCBzZzIwNDJfcGNpZSAqcGNpZSA9IGlycV9kYXRhX2dldF9pcnFfY2hpcF9kYXRhKGQpOwo+PiAr
CXN0cnVjdCBkZXZpY2UgKmRldiA9IHBjaWUtPmNkbnNfcGNpZS0+ZGV2Owo+PiArCj4+ICsJbXNn
LT5hZGRyZXNzX2xvID0gbG93ZXJfMzJfYml0cyhwY2llLT5tc2lfcGh5cykgKyBCWVRFX05VTV9Q
RVJfTVNJX1ZFQyAqIGQtPmh3aXJxOwo+PiArCW1zZy0+YWRkcmVzc19oaSA9IHVwcGVyXzMyX2Jp
dHMocGNpZS0+bXNpX3BoeXMpOwo+PiArCW1zZy0+ZGF0YSA9IDE7Cj4+ICsKPj4gKwlwY2llLT5u
dW1fYXBwbGllZF92ZWNzID0gZC0+aHdpcnE7Cj4gVGhpcyBsb29rcyBxdWVzdGlvbmFibGUuICBI
b3cgZG8geW91IGtub3cgZC0+aHdpcnEgaW5jcmVhc2VzIGV2ZXJ5Cj4gdGltZSB0aGlzIGlzIGNh
bGxlZD8KVGhhbmtzLCBpdCdzIGEgYnVnLCBJIHdpbGwgZml4IGl0Lgo+PiArCWRldl9pbmZvKGRl
diwgImNvbXBvc2UgbXNpIG1zZyBod2lycVslZF0gYWRkcmVzc19oaVslI3hdIGFkZHJlc3NfbG9b
JSN4XVxuIiwKPj4gKwkJIChpbnQpZC0+aHdpcnEsIG1zZy0+YWRkcmVzc19oaSwgbXNnLT5hZGRy
ZXNzX2xvKTsKPiBUaGlzIHNlZW1zIHRvbyB2ZXJib3NlIHRvIGJlIGEgZGV2X2luZm8oKS4gIE1h
eWJlIGEgZGV2X2RiZygpIG9yCj4gcmVtb3ZlIGl0IGFsdG9nZXRoZXIuCldpbGwgY2hhbmdlIGl0
IHRvIGRldl9kYmcuCj4+ICsgKiBXZSB1c2UgdGhlIHVzdWFsIHR3byBkb21haW4gc3RydWN0dXJl
LCB0aGUgdG9wIG9uZSBiZWluZyBhIGdlbmVyaWMgUENJL01TSQo+PiArICogZG9tYWluLCB0aGUg
Ym90dG9tIG9uZSBiZWluZyBTRzIwNDItc3BlY2lmaWMgYW5kIGhhbmRsaW5nIHRoZSBhY3R1YWwg
SFcKPj4gKyAqIGludGVycnVwdCBhbGxvY2F0aW9uLgo+PiArICogQXQgdGhlIHNhbWUgdGltZSwg
Zm9yIGludGVybmFsIE1TSSBjb250cm9sbGVyKE1ldGhvZCBBKSwgYm90dG9tIGNoaXAgdXNlcyBh
Cj4+ICsgKiBjaGFpbmVkIGhhbmRsZXIgdG8gaGFuZGxlIHRoZSBjb250cm9sbGVyJ3MgTVNJIElS
USBlZGdlIHRyaWdnZXJlZC4KPiBBZGQgYmxhbmsgbGluZSBiZXR3ZWVuIHBhcmFncmFwaHMuCk9L
Lgo+Cj4+ICtzdGF0aWMgaW50IHNnMjA0Ml9wY2llX3NldHVwX21zaV9leHRlcm5hbChzdHJ1Y3Qg
c2cyMDQyX3BjaWUgKnBjaWUpCj4+ICt7Cj4+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gcGNpZS0+
Y2Ruc19wY2llLT5kZXY7Cj4+ICsJc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9k
ZTsKPj4gKwlzdHJ1Y3QgaXJxX2RvbWFpbiAqcGFyZW50X2RvbWFpbjsKPj4gKwlzdHJ1Y3QgZGV2
aWNlX25vZGUgKnBhcmVudF9ucDsKPj4gKwo+PiArCWlmICghb2ZfZmluZF9wcm9wZXJ0eShucCwg
ImludGVycnVwdC1wYXJlbnQiLCBOVUxMKSkgewo+PiArCQlkZXZfZXJyKGRldiwgIkNhbid0IGZp
bmQgaW50ZXJydXB0LXBhcmVudCFcbiIpOwo+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4gKwl9Cj4+
ICsKPj4gKwlwYXJlbnRfbnAgPSBvZl9pcnFfZmluZF9wYXJlbnQobnApOwo+PiArCWlmICghcGFy
ZW50X25wKSB7Cj4+ICsJCWRldl9lcnIoZGV2LCAiQ2FuJ3QgZmluZCBub2RlIG9mIGludGVycnVw
dC1wYXJlbnQhXG4iKTsKPiBDYW4geW91IHVzZSBzb21lIGtpbmQgb2YgJXBPRiBmb3JtYXQgdG8g
aW5jbHVkZSBtb3JlIGluZm9ybWF0aW9uIGhlcmU/Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRh
dGlvbi9jb3JlLWFwaS9wcmludGstZm9ybWF0cy5yc3Q/aWQ9djYuMTEjbjQ2MwoKVGhhbmtzLCB3
aWxsIGRvdWJsZSBjaGVjayB0aGlzLgoKWy4uLi4uLl0KCj4+ICsJaWYgKHBjaWUtPmxpbmtfaWQg
PT0gMSkgewo+PiArCQlyZWdtYXBfd3JpdGUocGNpZS0+c3lzY29uLCBSRUdfTElOSzFfTVNJX0FE
RFJfTE9XLAo+PiArCQkJICAgICBsb3dlcl8zMl9iaXRzKHBjaWUtPm1zaV9waHlzKSk7Cj4+ICsJ
CXJlZ21hcF93cml0ZShwY2llLT5zeXNjb24sIFJFR19MSU5LMV9NU0lfQUREUl9ISUdILAo+PiAr
CQkJICAgICB1cHBlcl8zMl9iaXRzKHBjaWUtPm1zaV9waHlzKSk7Cj4+ICsKPj4gKwkJcmVnbWFw
X3JlYWQocGNpZS0+c3lzY29uLCBSRUdfTElOSzFfTVNJX0FERFJfU0laRSwgJnZhbHVlKTsKPj4g
KwkJdmFsdWUgPSAodmFsdWUgJiBSRUdfTElOSzFfTVNJX0FERFJfU0laRV9NQVNLKSB8IE1BWF9N
U0lfSVJRUzsKPj4gKwkJcmVnbWFwX3dyaXRlKHBjaWUtPnN5c2NvbiwgUkVHX0xJTksxX01TSV9B
RERSX1NJWkUsIHZhbHVlKTsKPj4gKwl9IGVsc2Ugewo+PiArCQlyZWdtYXBfd3JpdGUocGNpZS0+
c3lzY29uLCBSRUdfTElOSzBfTVNJX0FERFJfTE9XLAo+PiArCQkJICAgICBsb3dlcl8zMl9iaXRz
KHBjaWUtPm1zaV9waHlzKSk7Cj4+ICsJCXJlZ21hcF93cml0ZShwY2llLT5zeXNjb24sIFJFR19M
SU5LMF9NU0lfQUREUl9ISUdILAo+PiArCQkJICAgICB1cHBlcl8zMl9iaXRzKHBjaWUtPm1zaV9w
aHlzKSk7Cj4+ICsKPj4gKwkJcmVnbWFwX3JlYWQocGNpZS0+c3lzY29uLCBSRUdfTElOSzBfTVNJ
X0FERFJfU0laRSwgJnZhbHVlKTsKPj4gKwkJdmFsdWUgPSAodmFsdWUgJiBSRUdfTElOSzBfTVNJ
X0FERFJfU0laRV9NQVNLKSB8IChNQVhfTVNJX0lSUVMgPDwgMTYpOwo+PiArCQlyZWdtYXBfd3Jp
dGUocGNpZS0+c3lzY29uLCBSRUdfTElOSzBfTVNJX0FERFJfU0laRSwgdmFsdWUpOwo+PiArCX0K
PiBMb3Qgb2YgcGNpZS0+bGlua19pZCBjaGVja2luZyBnb2luZyBvbiBoZXJlLiAgQ29uc2lkZXIg
c2F2aW5nIHRoZXNlCj4gb2Zmc2V0cyBpbiB0aGUgc3RydWN0IHNnMjA0Ml9wY2llIHNvIHlvdSBk
b24ndCBuZWVkIHRvIHRlc3QKPiBldmVyeXdoZXJlLgoKQWN0dWFsbHksIHRoZXJlIGFyZSBub3Qg
bWFueSBwbGFjZXMgaW4gdGhlIGNvZGUgdG8gY2hlY2sgbGlua19pZC4gSWYgdG8gCmFkZCBzdG9y
YWdlIGluZm9ybWF0aW9uIGluIHN0cnVjdCBzZzIwNDJfcGNpZSwgYXQgbGVhc3QgZm91csKgIHUz
MiBhcmUgCm5lZWRlZC4gQW5kIHRoaXMgbG9naWMgd2lsbCBvbmx5IGJlIGNhbGxlZCBvbmUgdGlt
ZSBpbiB0aGUgcHJvYmUuIFNvIEkgCnRoaW5rIGl0IGlzIGJldHRlciB0byBrZWVwIHRoZSBjdXJy
ZW50IG1ldGhvZC4gV2hhdCBkbyB5b3UgdGhpbms/CgpbLi4uLi4uXQoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
