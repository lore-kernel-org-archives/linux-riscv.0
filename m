Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3E5C02198
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 05:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvGefBe1WvGWuwUXZlQ5UWzY4u40G5r8FfXAlsRUn1k=; b=ZP232oWDs+o7no9/QNYNB+3RvN
	phMGpxOdX3apKNr9i6DdtOjkb+M5ItrnVapUnTXwYE4kWZ9buPzznOvfy+CE4aWAMcMbj0kjiiVQF
	grvj2NbxgscFRVlrGiDZiQFcqr+lEL1Uxx7ERJBBD867V9OlrGO2V7EW+eSehkf14LobTxxE30Z1G
	OTOV/O6cLQzjBvO05MPrjQNYEsraTG2jUAX9KTaJ54Gxis5Vj5wmZuk6UioM3PIsC/UAEEnvoDn0n
	AmfJvQbkx3iTDJpVGn/PtJl8OSc+UJP7q7bJ+hDIVEUl0359Fde78VoYhQt7T0grf7OP9niDl6Kb9
	WBDXWFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti5j8-00000006ITH-1jgw;
	Wed, 12 Feb 2025 05:56:02 +0000
Received: from mail-southindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d408::1] helo=MA0PR01CU012.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti5hz-00000006IKa-3MqA
	for linux-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 05:54:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMT69ry56UMJ8bn6sI0W6HJ8s+Tig6DgHOCprFHLpFJ/knSjzpZjSLdCzgBHHBdWobuwQduaVImqRtUlo2zU0+lTnMrFI5nJ8xeI9Ynip6Rf1m0bLCQmtGUm7IYVgbDzan4ZrX56wPfA43Pst6ySyRm2oPSiu2sbeB+DQYzjSQ9OIS0kvFhoExI1mCLWf6DueZm8W3WgP50SP1z9NAc9N99gyJxHJOzgPWXDvhQBYiczG3nhaxasf1fGOmuEzdC1jRUnaEXoKL8UDYNhHoezg0EyQna0fvlj7sYH9rhg+DNXl/+60Ha2I7Z35t1ECuLeptK183j9j3fMGT5JJF/3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps75ikOrF+j1RR672/viPA+tTyxs/RTA+k0jeHet0WQ=;
 b=EZFMvGhDVoWWp6mMgYbOZyC+pc8rYjw6bfs1NByp3chmKHqDwPkBGdNzt2Pc5IB6EyS0t6P8g6COhxUmHBPB/A+vHFF/8lGk7T2sl9f/X06R4fLIm3eoMuUSMOtNtQhQ1W+VvPS6igzlwg5V3WS6QCJMQd4xp18wz2pS/E9BtSXzmXllLwxgdu2twOEJxRPAOZV9+TAjiYxA88bFkc2lsKzafoRbIn5/Emi6mmXWRikRnQkzXnRUh7ZVBG8S6jqUDCQZ1D9x8gGm4gj4JhERramiPMm6C4gFZrJ4Z66/6q/LrlQE0IgDXCQlybnXgmxDR83xMJqo35yiWEa51jgOYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps75ikOrF+j1RR672/viPA+tTyxs/RTA+k0jeHet0WQ=;
 b=DJAzyyRhRo4WStqR4zrA8r5eMPRW0K/y17+Gk5c/c4T7DW7H+p4VyON3A5DPvfFXOTzqeOAN1F8bosYSrkrWEJauOJvsPxf2Dpf5FPsZHKFgZ2z9C1LkUwJ7WKsv+Aq9STHG5jpO4dR6K1rO7USUcl2YLIzIGe3yxzDyGzmT+79i/2WNVfBToxVKRbS12daYqsIZSH5YE4IY1kK3aeELrmyHZJpSA4ubaWSAsfW2oX6QlgG/KUF7EzeVPRh8FRFreK459iGUXiIRSCVwpffBAr+4Qk1KNCt9dWsj8mzgLKwDkXi/cwW1qCH1NdIzsmkOeCL7ITXEti57lTM8a3x6RQ==
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
 by MA0PR01MB8745.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:27::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 05:54:16 +0000
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71]) by BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71%4]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 05:54:16 +0000
Message-ID: <BMXPR01MB24403F8CD6BF5D4D2DDC57A4FEFC2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 12 Feb 2025 13:54:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Chen Wang <unicornxw@gmail.com>, kw@linux.com,
 u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
 lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <20250212042504.GA66848@bhelgaas>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250212042504.GA66848@bhelgaas>
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
X-Microsoft-Original-Message-ID: <9aaf1ecd-0e84-470d-834d-06ed0e25e6d8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BMXPR01MB2440:EE_|MA0PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: c25195a4-10fc-46e9-63ad-08dd4b29af0a
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|6090799003|5072599009|8060799006|7092599003|15080799006|461199028|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VExMbXMrT2dob3lnNkJNRk9ZTWYrSW5CTXZkOFh1WHBDSjlsdHhIT21TazQr?=
 =?utf-8?B?cDEraDh5VWNhdXRWdkllUENFUktIWFVNK3dUSUJKMmhMTmJZeG1Pa25HdHBz?=
 =?utf-8?B?QjlqaVJKSFF0VFgvbE56eXRiamRiZkFIU0x0ekVjSHBabUI0TlJIVkZlYklF?=
 =?utf-8?B?cE5NWWtJRjlFb2xIeGVMYnJFcHVDUTRlRzNQY0JzSkVSRzJFSDVaaENndzZp?=
 =?utf-8?B?eDZ6M0o2ZGZSRVdwaEJzcm5kWXU4TldoT1F4ZENyQzRacG1ySGZ5RHdFRDQv?=
 =?utf-8?B?NDRNdHY3YmpWM3lMdkVKeUVVaXpoamJXU0k3dmtqQm1PV0ZmN0RNTUhIeGIr?=
 =?utf-8?B?eFdxeTh2K2hQNFluOXZSR21FSkJiU0pZbzltbjE1SnlZUnRqRmgzMzhHYnZ0?=
 =?utf-8?B?eElzdURUTDEycGx3Qm95b09FcExNb205Qk84Y0NtVkY5RXFsTHNDWXVJRnpi?=
 =?utf-8?B?YWhVSmd5aytNaU9leVpnSDRSKytEMkVsMGt2NDZpazc3T01YaHdzd3J4aXpt?=
 =?utf-8?B?UlBnTVY3OGdvcTR3Y3VIVEtlRS9JR1NDYmJOTVNPSUJDendOd05LaUV0bUZi?=
 =?utf-8?B?Y3lVZkFRQ2NrbHBtSWxPZFlXZzBWd29NQ0dtRFhPT0IvckU3TUFXR3c4MEQ1?=
 =?utf-8?B?ZUUxUThmLzcxeEwwbVM5S3Z0bFIzbFBvM3dLZGo3Y01SNCtOb2hPUDRXRDJh?=
 =?utf-8?B?ZWxLU0NYZ05ORGxCdTZDODVxaWhNZGQ1NkR4QTFzb3pNMjdIZGZhVWVwQm0v?=
 =?utf-8?B?TWViRGl6K3pFTzF3U0RteU9yNmFuWkQ1TmFWMlZBZ2s2VjBBVk4vQXo0T0p1?=
 =?utf-8?B?SE9VS1prWTMyQUxGR2YzbFVTKzhGck93cjAvOGxYY3FNQnYzb3ptbmpzRkpF?=
 =?utf-8?B?UGlFamtlU0wyMTFVZ3BsS2pTbWQyMytPd1ZpZ0NqYmJnWEFUcE1OQzRCL2Na?=
 =?utf-8?B?VnEvUFdpSXR6aERpUUkrRXJHUGlNQU9CSTVmS1d0OGltN0d6N3Y4NEdIeDVu?=
 =?utf-8?B?NVVWeCtmbkttSnJiRG51eUFNOHJGN0RDM1FYc0ZiZHJOS1hIekFuSDQ2VjJk?=
 =?utf-8?B?RVp5WG9SeXRiNDdTMFptZzFLMWl2T28vdTNPYXUrTUFQbVdiSHkwRGljYWsw?=
 =?utf-8?B?dTJVK0s3RjJWNkhZSExSVlo0RDVrTkFwKzZETThoZWI3MDZJOVBGUGhSWGtr?=
 =?utf-8?B?OS9DZ3Q4REcvajc2SGVVdzNIUlZOZjV3SnAvTWlqaXZBeUtJa0JsY3g1eWVM?=
 =?utf-8?B?cWlNV0NFaDlLTkRVeXJYYzhZOUE5Y0VNR1oxZEk4ZGQ4NTdxRkVsTGdEdTVT?=
 =?utf-8?B?dnZvdXE5bTNZZ1UwLzFwWlViOFdrK0dvTFdzeXloeWV1Q1hoY1I0UzYyKy94?=
 =?utf-8?B?UVV1WGpWbFluV0hnenZsc3l3M05PeEx5N2lmMStWVjhFMUtqT1NhQmtWQVZE?=
 =?utf-8?B?VGRJQ1JtbHA0NVBSMHVYUEFZUVZZdEEvOVgzMGhSWXh4Q0d3bzg4bWIrTUhT?=
 =?utf-8?Q?sSMp2g=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEV2VlVGODh0WUxEZ0ZTelJaVnpsWGxMYkFFTlA1Mk1VZHNyZFFlRFFPcEdI?=
 =?utf-8?B?VXlLRUVxclpHWFlSdjN2U2w3NFd4SHM1N1ZHRmJyeUFvQ0hpUkU2Tk43dE1C?=
 =?utf-8?B?MExiZjBTb2JXZkwyQzRwajdGeTJ3bEg2aWdNQ0dyUFJFMWsvK04waStXNHli?=
 =?utf-8?B?ZE1GdkdmTlcxTWF6cGJmQ0tJM1NaZ3Q4MkwwWXhOY2o4VFVCUzVha0pMSTBv?=
 =?utf-8?B?NW5iOFFrTEliQ1hYU1FOcGw2UzErS0dCQVVWL1VlYTlhN1VHempSaG9TVDVZ?=
 =?utf-8?B?cVJqdHlpcGh6dkRsdGZxMExpY3ZsdElJSUZJN2drS3BJU0M4VjFldzgweUhi?=
 =?utf-8?B?NHJ2N2d3MFdPcEl1Mm9wanljLytZVnBDVmJYcDcrNUhBOSttTWtCZktTekR5?=
 =?utf-8?B?VDYxNmVzRjAwTDdoWEZDaHBxSGlTamZVVG83WU4xZEhVcXE3c1liSUdzZktp?=
 =?utf-8?B?VS9UU1d6cWRhK0Y4b0NTQ2ZiM1lQM2RxdWVyUkZERVA2SGVoWmhndUU1TC84?=
 =?utf-8?B?K1NDNlZUV3Fla1VJR1lNaFd6Y2s3d3YzMHBGRUFlSHFHWGJSQ2ovWjRLc0hF?=
 =?utf-8?B?bk9lYU9KYldlL2Q0V1Q4am1SeW05VWwwdHc4UWhKR1dTYUZZQmVQTnFYVDhj?=
 =?utf-8?B?Vk5MdE1ieEFEYjRvWXpicUdSUkF6aDEzcXB1eHoybk5NR1V4cVhlVWF6NUwv?=
 =?utf-8?B?aWtubHdhNWd0cnJFWVR0VVY2ajhQQTFEMWEreE5DcUhCUFhwL2o3ckd0QnF4?=
 =?utf-8?B?Tjd1Nkl5WWxrakNlVW9wUUg5bkp1RlBMWEsyOEhYV240RlAzdHZXSFUxQ3hH?=
 =?utf-8?B?eVlqYmtPV3U2SE1BNS9uVnB6SUpSTk1lNEFPcHNnQ25XL2JEb1VMQlVJYko5?=
 =?utf-8?B?NGN3Vng5UzJiM0drdGxPL1FXb3hUbkZVVG9oMWoyNFhjck5iV3FrUWVYWDBJ?=
 =?utf-8?B?UVRPTjllSjZCb2lhc1RpUm1uWmxtd2hlMWNtcTBTeXpCUkE0YW5VUE5YcmVa?=
 =?utf-8?B?a1FzRFZPQmFEUnJWK1hkMkN5WDNpQ21pYklNaXBPYkhONGkzMXNINUFRTTlY?=
 =?utf-8?B?anZINVhiWWtWUGpPc0Z0TnFySExmeDBYUHpXMi8wVWlyemhtRDdYL3JTZzlP?=
 =?utf-8?B?RkliSS9XZU9BYnpWR0FSUDY5TnRrdEdpSWRqME9iK2xPRm5vRXNuRUN2R3oz?=
 =?utf-8?B?U3dpeW5yays4cDBDOHVGMVZCRWJmUzdMbmJHNS9JZXpzVFZxUmY2bERRK3M2?=
 =?utf-8?B?RXY4VUlQR2YrM1RwM29ORitCN0VyeE9FeG5DK1dmNWFTcHREVUQ2TFpyc0lM?=
 =?utf-8?B?ZHE0ZTg5Z3U2eE56aXRGM09kUGdBSzJRajZGMk1MbkY4S0lqSkphWlVCMUFm?=
 =?utf-8?B?WGFpeUhHTytqaVQ3WkNNemxmMDVQalA1L0VHNkFTV3lNK2M5ejJHZjZNeUo2?=
 =?utf-8?B?NEd4Yi9tdmJ1cFBFMHVWQkYrWEp5WHhPR01kZ09GU2VCTkdaaHRiMnhzSTVR?=
 =?utf-8?B?L2dBYjBkZUZkdEFSRlVZMGN5WlFTSUZ5TWcybHEwTW10WFdSa0NBUTVSbjhP?=
 =?utf-8?B?TU9KYk0rUS95WWlVU2tLcHVkdElkUkd1T0pPRWFCRkdNU1RYdmtSVEc1bUJV?=
 =?utf-8?B?dE9ZTG9YTGxMZCtUcmpnbG9CQ001NVZja09RMWw2YXo5V0lhaHFUWW52M0o0?=
 =?utf-8?B?Zm5hNURrYUpwYUpMU0NtcWpvYlhCcHluaXo5ekE0allac2l1aGs5Zm4wWkty?=
 =?utf-8?Q?hrKjjT/SQLx0aLfcM6DWVF5djULDC9e8Z7jX6gq?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25195a4-10fc-46e9-63ad-08dd4b29af0a
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 05:54:16.3885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_215451_840282_7D030BC8 
X-CRM114-Status: UNSURE (   5.31  )
X-CRM114-Notice: Please train this message.
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

Ck9uIDIwMjUvMi8xMiAxMjoyNSwgQmpvcm4gSGVsZ2FhcyB3cm90ZToKWy4uLi4uLl0KPj4gcGNp
ZV9yYzEgYW5kIHBjaWVfcmMyIHNoYXJlIHJlZ2lzdGVycyBpbiBjZG5zX3BjaWUxX2N0cmwuIEJ5
IHVzaW5nCj4+IGRpZmZlcmVudCAic29waGdvLGNvcmUtaWQiIHZhbHVlcywgdGhleSBjYW4gZGlz
dGluZ3Vpc2ggYW5kIGFjY2Vzcwo+PiB0aGUgcmVnaXN0ZXJzIHRoZXkgbmVlZCBpbiBjZG5zX3Bj
aWUxX2N0cmwuCj4gV2hlcmUgZG9lcyBjZG5zX3BjaWUxX2N0cmwgZml0IGluIHRoaXMgZXhhbXBs
ZT8gIERvZXMgdGhhdCBlbmNsb3NlCj4gYm90aCBwY2llX3JjMSBhbmQgcGNpZV9yYzI/CgpjZG5z
X3BjaWUxX2N0cmwgaXMgZGVmaW5lZCBhcyBhIHN5c2NvbiBub2RlLMKgIHdoaWNoIGNvbnRhaW5z
IHJlZ2lzdGVycyAKc2hhcmVkIGJ5IHBjaWVfcmMxIGFuZCBwY2llX3JjMi4gSW4gdGhlIGJpbmRp
bmcgeWFtbCBmaWxlLCBJIGRyZXcgYSAKZGlhZ3JhbSB0byBkZXNjcmliZSB0aGUgcmVsYXRpb25z
aGlwIGJldHdlZW4gdGhlbSwgY29weSBoZXJlIGZvciB5b3VyIApxdWljayByZWZlcmVuY2U6Cgor
ICAgICAgICAgICAgICAgICAgICAgKy0tIENvcmUgKExpbmswKSA8LS0tPiBwY2llX3JjMSAgKy0t
LS0tLS0tLS0tLS0tLS0tKworICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgfAorICAgICAgQ2FkZW5jZSBJUCAyIC0t
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBjZG5zX3BjaWUxX2N0cmwgfAorICAg
ICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgICAgfAorICAgICAgICAgICAgICAgICAgICAgKy0tIENvcmUgKExpbmsxKSA8LS0t
PiBwY2llX3JjMiAgKy0tLS0tLS0tLS0tLS0tLS0tKwoKVGhlIGZvbGxvd2luZyBpcyBhbiBleGFt
cGxlIHdpdGggY2Ruc19wY2llMV9jdHJsIGFkZGVkLiBGb3Igc2ltcGxpY2l0eSwgCkkgZGVsZXRl
ZCBwY2llX3JjMC4KCnBjaWVfcmMxOiBwY2llQDcwNjIwMDAwMDAgewogwqDCoMKgIGNvbXBhdGli
bGUgPSAic29waGdvLHNnMjA0Mi1wY2llLWhvc3QiOwogwqDCoMKgIC4uLi4uLiAvLyBob3N0IGJy
aWRlIGxldmVsIHByb3BlcnRpZXMKIMKgwqDCoCBsaW51eCxwY2ktZG9tYWluID0gPDE+OwogwqDC
oMKgIHNvcGhnbyxjb3JlLWlkID0gPDA+OwogwqDCoMKgIHNvcGhnbyxzeXNjb24tcGNpZS1jdHJs
ID0gPCZjZG5zX3BjaWUxX2N0cmw+OwogwqDCoMKgIHBvcnQgewogwqDCoMKgwqDCoMKgwqAgLy8g
cG9ydCBsZXZlbCBwcm9wZXJ0aWVzCiDCoMKgwqDCoMKgwqDCoCB2ZW5kb3ItaWQgPSA8MHgxZjFj
PjsKIMKgwqDCoMKgwqDCoMKgIGRldmljZS1pZCA9IDwweDIwNDI+OwogwqDCoMKgwqDCoMKgwqAg
bnVtLWxhbmVzID0gPDI+OwogwqDCoMKgIH07Cn07CgpwY2llX3JjMjogcGNpZUA3MDYyODAwMDAw
IHsKIMKgwqDCoCBjb21wYXRpYmxlID0gInNvcGhnbyxzZzIwNDItcGNpZS1ob3N0IjsKIMKgwqDC
oCAuLi4uLi4gLy8gaG9zdCBicmlkZSBsZXZlbCBwcm9wZXJ0aWVzCiDCoMKgwqAgbGludXgscGNp
LWRvbWFpbiA9IDwyPjsKIMKgwqDCoCBzb3BoZ28sY29yZS1pZCA9IDwxPjsKIMKgwqDCoCBzb3Bo
Z28sc3lzY29uLXBjaWUtY3RybCA9IDwmY2Ruc19wY2llMV9jdHJsPjsKIMKgwqDCoCBwb3J0IHsK
IMKgwqDCoMKgwqDCoMKgIC8vIHBvcnQgbGV2ZWwgcHJvcGVydGllcwogwqDCoMKgwqDCoMKgwqAg
dmVuZG9yLWlkID0gPDB4MWYxYz47CiDCoMKgwqDCoMKgwqDCoCBkZXZpY2UtaWQgPSA8MHgyMDQy
PjsKIMKgwqDCoMKgwqDCoMKgIG51bS1sYW5lcyA9IDwyPjsKIMKgwqDCoCB9Cgp9OwoKY2Ruc19w
Y2llMV9jdHJsOiBzeXNjb25ANzA2MzgwMDAwMCB7CiDCoMKgwqAgY29tcGF0aWJsZSA9ICJzb3Bo
Z28sc2cyMDQyLXBjaWUtY3RybCIsICJzeXNjb24iOwogwqDCoMKgIHJlZyA9IDwweDcwIDB4NjM4
MDAwMDAgMHgwIDB4ODAwMDAwPjsKfTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
