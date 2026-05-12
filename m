Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334A6CD4F24
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hs3Hnrkz7DFct7NwowfG+ioOYCYW+Qc2M2GNVEt801A=; b=AXrJsGkCjfBABwtw1okkeHvb1e
	MQYhVGC0/7ZfIk5f90L3n41Rs23cNdcxE5IHZUkw6tuyybS+s8sj50EuzoNsGysMP+iEttKVOu7jy
	K3+JisIl+R9MkubQRZQEdTCcOQiADaxR9dOEohgyObr/1CHFWvOtaHVDdHxeOwwT3OtHKRg0rjWCO
	f9/VDO+YPyB2X620k4MQJH1Pu4Kgqi/0oE4XjuMhnvjS4oQsC+CcWiarQOw4ORPBF/n+9w9fVAGc2
	/m44uakKCDM7hHSY29KRf9n46+PwBwHm8XuTyg3a9FIeCSSjy+fCBP0F20Rt9pT6+Jdxd+vq5C8HH
	R+SO7YAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMs1X-000000007Z7-0cwC;
	Tue, 12 May 2026 18:40:07 +0000
Received: from mail-japaneastazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d405::1] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMs1U-000000007YW-0nWG
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 18:40:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyjhlUj6lyIO1b+gWPWVNhSAnOi5ujaIO3PHlENp+vZRcmW3esNPSynkUVYlW3RyWtTUP4rmXxzNnREDGpN7y5kj7VV8sDklHS9rdgTZWJpsSEByuidpwcA4j15dmL5P4CCM/diXToiMEH8KXELzeelMbELmqLTXROQeUY0jcToJL19dMvWI9nM7ISy5NaX4zK5XlSOXbqqwUhBuUNNTSpFKnCSb4YjAF6D+Een+ZJWuct+ncmeUBggmfTLSovd94jCcMX+Yg9KWC9zMu71539HO4ZHzkJd5gKwbV5ha2hmDrRgSO7TBsflDnMPJ5E0xplyZaVckU4tB257beEnHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Sg33Ykk0n9c92b16qY0zYMonqKNKEpxGbGlM0jZyHs=;
 b=pZO9DVm72kAaYg0bcYN+qIWCwx0oV+Mpv1Jiq6B6uoJ+RVl8893SBXJHS7Gtu+2oftm0y3FC6oPFDLgw7/YyMUcCAAnpr3mdcJ4E9QqEJm0Iw11j+Udy1IrRknTKeDRJbXLSIWAUb9XvhWZfiYpJdWtLYZ9vqzo1E2G2qeiS4s92F8oKO1IJl4qP07K++nlUHaeLX0Kqr1DB8sD3qioX6vrGxrpIcE0ezCflWH/ypJT8di35Yj2PBmsLvJ90nMZX+aaa4XwSL2deGeedTF+LqRKjePMqhDEXuEN2bB6o0acMX+shvVSf5hV0b99xUen7vtb/FlSnUUbAv8Fk1MHQjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Sg33Ykk0n9c92b16qY0zYMonqKNKEpxGbGlM0jZyHs=;
 b=jRu+3CZ2YnjJBIh6L7e5gI5+4Oebrl3xOk9Zc5UDY38ey0lbLM8DKKywaBpHRvAAUgQ1/nQFQylmrW5T7BNDZIC6XuxEGwcGG+0iuXEW//oZ02s5RDaM4c2n0JYmSQzSt3Vo5DTAFLNnJBKnE/povY9CXdy9fUC6f/Bm3vi3CbAeLFNfL37qti9oWs+gbpxhXtcEOotwnT8zsuZS2v/UQmaPrid2YuyH8icehIgnLnUCHAjWsCZeZvfyOT2jhJu6irDM5W0z+xccipQkyf4KJRj6sV0MOVRAtp5cE9OE+DVXirzyO/89cNkorf5Hr6cOKXdQdwl94Vp/k0lxciN73Q==
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10) by TYRPR01MB13660.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:39:55 +0000
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::de2b:6c81:9bd7:99c2]) by TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::de2b:6c81:9bd7:99c2%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:39:55 +0000
Message-ID: <TY4PR01MB14432F2BBDFF6E2C4AC79DD1E98392@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Date: Wed, 13 May 2026 02:39:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Enable wifi on the BeagleV-Ahead
To: Thomas Gerner <thomas.gerner@muenchen-mail.de>,
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511141119.155369-1-thomas.gerner@muenchen-mail.de>
 <20260512173440.163179-1-thomas.gerner@muenchen-mail.de>
Content-Language: en-US
From: Shengyu Qu <wiagn233@outlook.com>
In-Reply-To: <20260512173440.163179-1-thomas.gerner@muenchen-mail.de>
X-ClientProxiedBy: SE2P216CA0165.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::14) To TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10)
X-Microsoft-Original-Message-ID: <b016a0ee-9425-41fc-a079-542892765ba8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB14432:EE_|TYRPR01MB13660:EE_
X-MS-Office365-Filtering-Correlation-Id: 73054ffc-a571-42b1-2b93-08deb055dca0
X-Microsoft-Antispam: BCL:0;ARA:14566002|24021099003|20031999006|6090799003|39105399006|8060799015|19110799012|5072599009|23021999003|15080799012|1602099012|41105399003|40105399003|4302099013|440099028|3412199025|10035399007|26104999009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFB6bFRhUHJXcU4xVDUxczdrcENlTzhXbUdsRllIY1pyUWMrUSs0SVVaVFFJ?=
 =?utf-8?B?c3JWTmROYUNlL3krSVlCN2YvSEMxd3JTZFJycHRTY2pJNFZkbWN1VW5sVXVz?=
 =?utf-8?B?NTlyZE1Eb0NqTGtVcmgyZGI3OGtLNjZSOElNdU5ZZUxXRlh0OEkyVXFrOE1Y?=
 =?utf-8?B?NGMwUCt0RnhGaEt1VFJQOU13ejdUWWpZUkYxSFgzcTRKZ0FEalAzV0gwVlcz?=
 =?utf-8?B?RGc1dXBIM0hSMGpuTGNqMzZkZnBKbzhjOFA2bmlmL0NXWTUzK3hDcWEzdzZN?=
 =?utf-8?B?YlR6b1E1YUk4VmhIQSs4c0JMemhkM2ZVQ3M5RzBRN2MvL2ZQaFh3VGkvRHU4?=
 =?utf-8?B?dmRiUlVWNUxVOExuc2pSSU1wSzNQb3h5UXo3NTlJYnZWQzBFVnJzbVFkWHRV?=
 =?utf-8?B?Y1krRkhrcUF2S3hrckdRWVpKbStadHIvaDlXUWNzNngwNzFsSEVzM2E1SmMw?=
 =?utf-8?B?a2l1M25uQzFzSHlpR0JycG42OTZveldSVWllcVd5TnhkbEUrYWozeU84WkpY?=
 =?utf-8?B?RFZqUjRvY3VCTS9Cb0tnVDN2c09DaDI2Zzg5MDBsam1LTytrSExxTGpvRTNo?=
 =?utf-8?B?R0FuL0JkNFlCeWdiWi92bzR3cnhMWmxYSmZwYU8vUTRNbTJtdG9PUjFwTDV5?=
 =?utf-8?B?bWF1ZzJhRWFrVGd4RTgrTDFzZGIxWStyQTlkZzB6R3Y0SndlODJnb2l1N2VG?=
 =?utf-8?B?amxUeDJNZldJSnU1OGtMT1pUOUNTamdhY2JqaVdtb0RnRk50bWxaRlFiTjM5?=
 =?utf-8?B?WWFNSW44OHFCQ0ZWUTZsRTI5V0JyVE03UjhCeTJMWEdFcHhYa0MzVkwya0Zs?=
 =?utf-8?B?aTJ5S1RXbkdmY01xUUdTeGNETThDSjlvc0VKencreXp1K3hwQVJhRTZDeFdo?=
 =?utf-8?B?YllRUDRmbHBEMDdSOExFQ2ZRdGtUZk9XeEZOU3o5NldRSklJajhqVjIzK3RQ?=
 =?utf-8?B?K2h3VXp1eWpEaGF4c2d2cVpaWlJKOFlGTU9qWnpwdXhSejVwcTB6c0dzZWJj?=
 =?utf-8?B?UjRhcWtoWm16NnpaQVhhQXhVVk01RnF6UkREbldvbGI5eWZZaldOS1pPTmVR?=
 =?utf-8?B?M2RMZ2I0OFEwWWNXZzNiSnJNZVpSc1BQdzdTaVl2SG1hNDFqa1dCMm52TnNI?=
 =?utf-8?B?Um1QR1R6YjNiK3hRS0JqMk1IakxJMTVnQUIzR09JSHk5U3dGakZCNjRSb0NR?=
 =?utf-8?B?WmtMZm9GL0k2YlpONExNNzE5YUR2L3RzOEdGczF6TDFEU25FK2FUTUhtTGhm?=
 =?utf-8?B?YXFkSldPTG11MlJMY0RQdUI4YWpibGlGVUhSaTdTeWhzNjZLbWJrZXZrUVoy?=
 =?utf-8?B?YWpnd2xDdmNnaG1PTWZ3MzZLNUdQeVdxV1JKN2Q0Z3NEZ1o3TEhnV2RCR1RI?=
 =?utf-8?B?bDR2L0JmdXBJUGoxVnk3cEdrRFhvaExJZ2NoRFVBbHk5TWRaWGRQeUprd1o2?=
 =?utf-8?B?eVgwOEg3WTBZb3ptVHZjVlJiMi94NXVBUzhnM3RBSXk1NEozYy8xZTlFdDZB?=
 =?utf-8?Q?KnCDGWdk4PwAvaJpzzmZzXqzBaj?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2hvT0h0eHNuVlZWNHFoK0l5WXgrTDdMeGxGUXJMeEwwTXA4cTNEcHNkbTlJ?=
 =?utf-8?B?VllnY3lPdXlNdk00azBFOTlhU1Ywd1BBdTZ6ODIvSklpTzNmaDBsSFJZK2RZ?=
 =?utf-8?B?T2x5TXgzWnNOdjhwNHJWSWE3TWtEcVpiZklBYUI0b2hPd3J1STI5Zy9kVXpP?=
 =?utf-8?B?OTdMTXA2VDJnRGU1NWFuVE83WllpNG1jRVFLOWVTbzRySVc5NEl0bnhxS2dq?=
 =?utf-8?B?aWtFQXhjSXp4SUNjRXQ0anU4L0U5Nm9UYXNZZ3NXN0hQSTZZSFhyaWI4eWNC?=
 =?utf-8?B?dmtQVGlEcDZ4Q3N6eFAycm1YWGUybmFzOUlIVmlRbFRyOHhPeExqZXZqRVh5?=
 =?utf-8?B?OTJWdlBLbFdzeHB1eGNDM3I1eWRUWTU3OXM2MEtWOXBYbVIvdTkyRjg4amhY?=
 =?utf-8?B?bkJ2RVIxWlZvc1Fpa1U1NUU1TmQ2LzJGcEJZQUxMbTNuZVRWZDJjSDg5cm0z?=
 =?utf-8?B?ZlBUeld1ZDB1QVdoenl5NkVOYktQRm5oOWduczNycXNLQ2pUMndYNmtQTWUy?=
 =?utf-8?B?RjE3TlYvTGtYaVk0bDBZY0J4Z0tjVGlIWmdoRVd3U0E5aEovMmVxenlTNGlM?=
 =?utf-8?B?UXdlSFpaY3M3NytudlRiS2V0dmJSRXhaSjExMzFjYmxWL2lvVGpDMHllRW0v?=
 =?utf-8?B?UWNIejJuQ3lCZE5RMEY2WjAzMjNlTGdxMVZjbk8vb2VLMUdvR0RzZm5sZS9z?=
 =?utf-8?B?SWFjeG8yMy93NXc0VGRCUzF0NkNPNVNSdEtsMFVXWllFcVJNbnIvSmVJZm1U?=
 =?utf-8?B?OTAwc1pFN2x6NGovMGg3UENyVy93empTSFRoeUJVQnlGZkdqTDlNMEhXd2JK?=
 =?utf-8?B?cjN1UGhOY3NJN08zblZLTWgveURMbVVKQnIwT0V6T1NvdDh3SFNQNDdWTUlG?=
 =?utf-8?B?djdIN05ZblRnUFEvUktHRmhDSC9SeGpWcHJldEFERW90ZXZSQTErUmZ4ZGFU?=
 =?utf-8?B?Si92OU1kdGlhYnUwc2FjNmVWM3lob05TdkRYWWRJaWhOc0ltejNtbzNTeDhq?=
 =?utf-8?B?aHhJMU5aRDgzK3hNOGgvVVdqZkpPZ1lkdzk2clAvOUprektsWk0yWHFoNWlz?=
 =?utf-8?B?SE1aaU04TVFZbmsvMWFiclpQanpZcDNVOXEzNXBTWE82ekNUTFl5RnRmZ1pt?=
 =?utf-8?B?VEZ2Um1DKzBiZUREcWQ2VVdicWYySFU5aXFhQW9FWHVSbjQrclZhZUhia3k0?=
 =?utf-8?B?SE1mZm9CYXh2T1hmODFDTWJnYXRIdVBMbVRsNnJDTFgvZUdYNmJhUUxhOEgy?=
 =?utf-8?B?QnA5U2NQQkZiTUJFSU1DU1dVRXo5ejhMU0ZnMk85a3lmS2tVMnZXOVlTSzhP?=
 =?utf-8?B?QnRtZlJlVTNsUnR5TFh5U2dqVFUxM3hVYnlQMC9GZ1M3bVV4UHNQaXgxWThy?=
 =?utf-8?B?cEpXQzVDMVo0dGZ3SHdQR2t6NWc1aDlZT1lqUlhPZ3luZHFUcmgyb0Y5N2JF?=
 =?utf-8?B?R3dQaVMrYjJJL3VOT05XaEJOeXlCMm9wSHBDdUJSclhxMWNHTEtVWnJnZWxK?=
 =?utf-8?B?M2xMZ1Y0NWxRUlpJbVpDc005ZEFpOVhJTUNkcTJuL0czWjhsemdFVGVQV3B5?=
 =?utf-8?B?UURLZjc5ZktFckxUcnhsTTNSYVlnaWYvNVpJdWxDeDlYeXIrbWUzM0ExZ05G?=
 =?utf-8?B?K2dEaHFRdkVKdFU0aGlTSzVza3BVYm9wOWVjNDRhVG1qMHdreHlYN2Y2cDR5?=
 =?utf-8?B?UFpNYStmYnNhUUppdlAwdFJrR1dLNEIxR0lMU1ZIRWg4WmtUUjU3MDBFWThT?=
 =?utf-8?B?S1NQMzk5SS9aNDgrTzVWTjNTTXk5d2R3bGx5MjB5Q3FhVEovT3l4Yy9Bc1pS?=
 =?utf-8?B?MzRtaGdKZnYyZ3NndW9QMlJHTjB4QXF0RFU3aWp6UW0rU2lwOERBcmZNa2ta?=
 =?utf-8?B?aytpUG9ENVF6NVZwR0NQWmFFRWd1bHBWKzB4MnBMOWY1ZGc5THVHL21zcDJJ?=
 =?utf-8?Q?pHpjcZtc2JqTbLo3PUPyuCLW5EEBY5lv?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73054ffc-a571-42b1-2b93-08deb055dca0
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14432.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:39:55.6713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13660
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_114004_260506_1776B370 
X-CRM114-Status: UNSURE (   4.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> +
> +	brcmf_pwrseq: brcmf-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio2 31 GPIO_ACTIVE_LOW>;	/* WL-REG-ON */
> +	};
>   };

I think such pwrseq won't work? Need to set timing parameter, for example:
https://github.com/torvalds/linux/blob/1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524/arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts#L71

Best regards,
Shengyu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
