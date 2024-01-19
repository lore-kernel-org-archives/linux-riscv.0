Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0EEC4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LA4Nrg0LOHMr0Q54F3zAsEQzLyD+a6eJoHqZ2gC+4Ps=; b=z/Q3CE7bdosulqOZSNTevozmSo
	ZDnhgRi9uRhU3f/A8jbZDL8+F6KT9GBv9jTALbjs6O9sB6/H9YKZJ/Z/JBSnhyf6knjU8X5fUTMyW
	QXxxl8QmXx20e5pEw5k3e5ZgB8bCFnpVxuX+wwScJxWA2iQ03NtqsF2MAlM0a9Cgscm0zuH5pPQHb
	mHyPqodbnUbfWQqsWQF8I2T57ZlqDTkLe1jlQf2FH5S3HvvSMgrbAbJqB8YnvbBNDWT6S/CPeufhY
	p1K0ntqbXOfR1cQ+QbELiXCpnvxCeBjCVnUqYQ4Ym+vcdkbxQTUCVtSyp+Wr9K76Hq7BOndgGfWP6
	1oGTBWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkat-004tbr-2p;
	Fri, 19 Jan 2024 08:51:19 +0000
Received: from mail-bn8nam12on20701.outbound.protection.outlook.com ([2a01:111:f403:2418::701] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkaq-004tb7-2l;
	Fri, 19 Jan 2024 08:51:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8pk2QU1FzDr8062uRLLFJpsggKrIoB+Xy6I7pEXHsl26OYCxtT5FqFJCxu3C0hLcAIfM82Zxmb8rrMs/WpG0QeaaPFuSfV7vJPrxZy0F4Z/O5IxNHB1av/esREU23WXL/EEoerRsIGzFYDJZw/E+4XW41bvs+TSU3o7BTf96Ztbesa5YUjN/iqeH5SGjUoYBgw8AdNuIEVdrwPGXiqv1gPv5/Kd9TnMet48iPbkQ618ClVABpWHthgsnbKtCZriHFEip+oM8L1AJxto7pCkemjHAgxxPUf3xkf8lcab/WkEnw9U7FXndLX+Uk3dlsuZRassKp0EIzgCD9cWfimVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3iiGy0ADGM92s0ECxkPq4rJLSIGVElnc9D6RypFUaw=;
 b=a6Bd7BWGkoQW0JUXDSFUTXE3SnpJSVmJuYygr6Bvscmmvor+9fgU1/PKNJEzC1JwZEaKfo8N7fyn87W3GzEklQ8Xh9BXAQFuRXl7WBkY7mjyAj23FFILLThVPmfZCu314P8WvyDTvCyWCOLXZ3IWyNi0shioftZ7Bv2Ci5iBAu6KuwGBbubNX+IBPnbwNDqXg+E3zV91kReNItwSoycpO2iEJ7TJilrPeFAi2HXmcxDn9gaewsaMVfgHpWFMBQkL8hxJsrrg8BvPy2UOgaW8hBgfPnC6w5bQI9L0l7HpAhZYdiKaQDLtblEgQJPSR9/9X5mmvrPG7wv+9wjQIyrkUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3iiGy0ADGM92s0ECxkPq4rJLSIGVElnc9D6RypFUaw=;
 b=zXID8gJxcVBcFK+w9E0GCEMrsYEQudH3NvjVimUWnJAtzoztmdKf724zjDxhqNEiTJhQOA74XB91pwnXC8TJgxXqINuuVGR3L21F4IoC72eutmQf8O1/WdK4h0TL9iYXim1K40KWO2nNSwOxJqhcGduKZhrthiux3t65tWWYqV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 DS7PR01MB7567.prod.exchangelabs.com (2603:10b6:8:72::15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.23; Fri, 19 Jan 2024 08:51:08 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7202.026; Fri, 19 Jan 2024 08:51:08 +0000
Message-ID: <b8786c38-d6c4-4fea-a918-ac6a45682dba@amperemail.onmicrosoft.com>
Date: Fri, 19 Jan 2024 16:50:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of the
 correct node id
To: Mike Rapoport <rppt@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>,
 Huang Shijie <shijie@os.amperecomputing.com>, gregkh@linuxfoundation.org,
 patches@amperecomputing.com, rafael@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, kuba@kernel.org,
 vschneid@redhat.com, mingo@kernel.org, akpm@linux-foundation.org,
 vbabka@suse.cz, tglx@linutronix.de, jpoimboe@kernel.org,
 ndesaulniers@google.com, mikelley@microsoft.com, mhiramat@kernel.org,
 arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
 cl@os.amperecomputing.com
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
 <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
 <Zao13I4Bb0tur0fZ@kernel.org>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <Zao13I4Bb0tur0fZ@kernel.org>
X-ClientProxiedBy: CH0P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:ef::20) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|DS7PR01MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 43278f3c-1f53-4962-2382-08dc18cbc760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0iwyAJVQD3Od9QS419cmU0MoRt+Mjm2gw66INIrJ5uQVAmupcDRo0/CDE+mm2S0aNFp+Ms/eNc6AxKW6/Ar9oRILRROB3GGzaCGV/venrE67WBuq3UUQnlq1UvfuJOLMj9FyBRPeM9Jlh3UU1xKTVSS4pd1m27lWge8MbaP/QuGPTIXt1nmYEp2rAjlMdMo9aJRda2BwmTwo64spZtC2GJ9p5VIyq3cHMarZj3mMtMZifDWFODWR8YEYGyJM8punqfSKkf4GkKZCTPH+M+BB64uXZMaJqoWCFHIPc1fMYqJPAkAqZVhRvcTbMxhN2WIWMqbPZDGsT5acT5CW5kyLinucLUziJ4NgxxxXtdVamFT31bi3zigpa1TSFmHzYHgFpLpJtlZyyTUkHKJWnuKuiTFLAf3SaY0Gyaa+92AE7vSBrxJMV9IZc528bVNZjDStrjTl41uqAGRj1TGXN+bc+of3lwvtNeMCICQH+4ZPJ6uT6tKnNQUKT9K2aCUSCGztTnixV7sDSgamh0ZuoLLxypqupasLaN5U/ClzA9vmfFue/JGuto7YkHUIGydIT1vwxOC8XLg+d+M072gouSuZI/MyiSWOAD6yxwi9DZPvxdhO/F88HcwnkkLAvVkD77Aa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(366004)(136003)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(26005)(7416002)(5660300002)(6512007)(2906002)(6506007)(6666004)(107886003)(42882007)(2616005)(66556008)(66946007)(316002)(8936002)(8676002)(6916009)(41300700001)(66476007)(6486002)(31696002)(478600001)(38100700002)(83170400001)(83380400001)(54906003)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWFzRU13N202REFWU1RMTkRMNHRpSEtzRVdMVVFFcVkyMUlVNDFOamdqUzdh?=
 =?utf-8?B?U3lTVFRMRE96ekFaQzVzaXQ0c2FHcGdkRkRTYld5UHFZQ3hZbVc2eFREeCty?=
 =?utf-8?B?SVNvcktKZjM4WU1XbzlJS2VpOGYvalcyT0tGdXVpYU1NdXdGSHZDaklJMGVz?=
 =?utf-8?B?THovdk5ZcDdwUGJqYUxCV01ITTFETU1jQTNTYTlsRldBekhHNjgzeHNQMUli?=
 =?utf-8?B?Mm5RdE5BUXdxYmZ6eEZ6eVVkUUFLR1lIdjZySW9VWHhlT2Y0dnFXUzNvNlVQ?=
 =?utf-8?B?ZFVDSU9neDA0eC9neXQwdEF1aEdZTUc1Um5vaVYraCtCckFoKzc1c2hXOTU1?=
 =?utf-8?B?SXFZMGdwUGtDR29pOXJ3TEEwTWhOOGJJcitFT2hkZGI1cnJtU1VEaXhMTWND?=
 =?utf-8?B?QmpLSlpKNXhxT2lSTVhCUjd3NnB1QVdVbjVXSDJrSlpMb2JkK0o1d2s1ZXFl?=
 =?utf-8?B?dkI4dmVDN2QyQWZ1dTNneXUxWU9jOUZLWGpEaUttZUJxZ2xheldsVmdSdU1N?=
 =?utf-8?B?VXZkTklRSDcrUmQycnVXVUhxTlNSUVc1T2hjeHp5REo3cmFuSGZQajZ0VzNt?=
 =?utf-8?B?N01hTzd3N0JZZ3VGbUl0WE1aQ1RMbDA1VktHUXdJSmFUZzc1QkxvTUhsVEVS?=
 =?utf-8?B?VFNleW9aZlJjemVlVElDVHJrdGVSaU1UeTU0ejRnM3dJQjhzSHg2eWtMb1pV?=
 =?utf-8?B?bXcrU1NYUmNQZU9nLzZXRm9kd0ZpVzBwRTRvMXVodUVma24zaG0xRjc3blhQ?=
 =?utf-8?B?Q0xOUnhLcXphTjhaRCtVNVdXWVRHeUZnZWlVQ1o4aHV5elg3QTdiZ0QrempH?=
 =?utf-8?B?STZKWGZjM0tqMTdGUUM2LzY1QXM4Y09oREZISlo5RkF3aXFMUy9taXBRb1Vi?=
 =?utf-8?B?TWc3TnFLQXF3WmVPemdVb1VKdlJFOU9oVEpEMysvTzJ1Q1ludWRXZGxkRzR6?=
 =?utf-8?B?dmY4L1hQTWJRcURXdEZNQTZDclNEMmRCVHBUVFh1Vjk3bzJTVjV2Z2ZKKy9D?=
 =?utf-8?B?eDNtVmhKa1BjT1o3WWJUZzIxZy84d3dRMGJhalFKREFWNmlKdWw2dmVkdDVD?=
 =?utf-8?B?YmF6VjJoYmU5clduaTdmK09nTHIrSTRNdCt1d0lvOFZnQXdXVkwvYW9TanU0?=
 =?utf-8?B?eDZCYUw2SG9SbFM1K2lNTkRtKzNiaVpORk5NNm5wM0FXUVdSMUlFMlhQSzBI?=
 =?utf-8?B?b2lZcTlXdkFQV1NjUE1QRzFuWWxuck1WMFl6UHB6YzRNblhvWVIza2JxeHRz?=
 =?utf-8?B?OXA4L2E1dCt6eTdhZHBGaUhKcERteXpuMlo2VG9uQmFieTNvNTJFZStVUDdI?=
 =?utf-8?B?SWx3OVBXZ2FMb2VXZ0hPL2gvV0p5S0hoMVAxajBPTXV2cmRjLzYvaUs3Y3ZY?=
 =?utf-8?B?ZmRIUEZBU0xDa0ZzeHBCZzZkYS8xaFd1YStnU2c5NUU0c0ZpWXNWdG01SlQv?=
 =?utf-8?B?RlMzOG44eFNQbkVkTDBxekkrL3lRcVVpYUJSYVlNN0xPK0ZBakJzWVVRbXNS?=
 =?utf-8?B?UGp6dXN6YmcxK3RmZ3R0ZlRVOS9OekluVDBTN2hIa282bjRnbEk0aGMwb0dx?=
 =?utf-8?B?U3ZQVDNTZFBWTjVXNVg5WDhIdlFSUVBsTUlaYnlVNk9LYjkwbEFacG1aQXMy?=
 =?utf-8?B?UU4vZFZKMDJ6WDRIZmkwOGY5V0VWOGc5aEJHMHZIMGtmaWpYcjNMbkcrdnQ5?=
 =?utf-8?B?aUJYcll2U3VYZXFNV1ZTTnd6Z2FiZ2xNMXFZYUtVbERZUy9aRGhVNHFaMS81?=
 =?utf-8?B?V1NYaUdKWllDQ2VGZnZnWGNQVElhbml6VHJTTmJxVFVid1NvUzM0cXVXa3Yw?=
 =?utf-8?B?UUhlcVFtRWNGSy9NNUd1Y2JlQnRZcG1vSnBLWHViVExrWkkvVkJzRTlBZFhq?=
 =?utf-8?B?bDZxSVBVUHNPbE4rVEtFU3hRWXNrMjJ5Z2UxKzlaSE1SckREM3BNYzh3QnRG?=
 =?utf-8?B?K1ZhSmdoZ1FMbmppeThwRE8zRm9od0NMb0l6WG9DUkVVRlp5b2hnYS9QNGpm?=
 =?utf-8?B?VWJBRzc0MDJMclRzTjVlZnBhSnFrNElJNTNVeGc1N2I1a3VBRHZHVFRob05M?=
 =?utf-8?B?bDNKcmJZY2Vqa2lDUVk2a29mT21BM0k1V3FodnNiMU0vdi9pQ2owMEFseUph?=
 =?utf-8?B?dnJJVlNRd3l3VFVrT3pJTGsrZmttaVBhemE5WjNrK1dzaXUvWUg4Z3ppWStK?=
 =?utf-8?Q?eO7bIPr6cgVldQDrJWm/mA0=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43278f3c-1f53-4962-2382-08dc18cbc760
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 08:51:08.3731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oSkGiYmlqXlfiQazflNhxShN1MZpL3lSG9oeuX8F0LigO0LkyeKwCUxRAJzZPGsKAAQGTKHcmUGglVxzjpAPcwdysF2MncRR7KbIWYT09Ys9hCJtDaOXQkF8sox5ifU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7567
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_005116_926397_E68F0BC6 
X-CRM114-Status: GOOD (  21.67  )
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

CuWcqCAyMDI0LzEvMTkgMTY6NDIsIE1pa2UgUmFwb3BvcnQg5YaZ6YGTOgo+IE9uIEZyaSwgSmFu
IDE5LCAyMDI0IGF0IDAyOjQ2OjE2UE0gKzA4MDAsIFNoaWppZSBIdWFuZyB3cm90ZToKPj4g5Zyo
IDIwMjQvMS8xOSAxMjo0MiwgWXVyeSBOb3JvdiDlhpnpgZM6Cj4+PiBUaGlzIGFkZHMgYW5vdGhl
ciBsZXZlbCBvZiBpbmRpcmVjdGlvbiwgSSB0aGluay4gQ3VycmVudGx5IGNwdV90b19ub2RlCj4+
PiBpcyBhIHNpbXBsZSBpbmxpbmVyLiBBZnRlciB0aGUgcGF0Y2ggaXQgd291bGQgYmUgYSByZWFs
IGZ1bmN0aW9uIHdpdGgKPj4+IGFsbCB0aGUgYXNzb2NpYXRlIG92ZXJoZWFkLiBDYW4geW91IHNo
YXJlIGEgYmxvYXQtby1tZXRlciBvdXRwdXQgaGVyZT8KPj4gIy4vc2NyaXB0cy9ibG9hdC1vLW1l
dGVyIHZtbGludXggdm1saW51eC5uZXcKPj4gYWRkL3JlbW92ZTogNi8xIGdyb3cvc2hyaW5rOiA2
MS81MSB1cC9kb3duOiAxMTY4Ly01ODggKDU4MCkKPj4gRnVuY3Rpb27CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
b2xkwqDCoMKgwqAgbmV3wqDCoCBkZWx0YQo+PiBudW1hX3VwZGF0ZV9jcHXCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDE0OMKgwqDCoMKg
IDI0NMKgwqDCoMKgICs5Ngo+Pgo+PiAgwqAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLih0byBtYW55IHRvIHNr
aXApCj4+Cj4+IFRvdGFsOiBCZWZvcmU9MzI5OTAxMzAsIEFmdGVyPTMyOTkwNzEwLCBjaGcgKzAu
MDAlCj4gICAKPiBJdCdzIG5vdCBvbmx5IGFib3V0IHRleHQgc2l6ZSwgdGhlIGluZGlyZWN0IGNh
bGwgYWxzbyBodXJ0cyBwZXJmb3JtYW5jZQo+ICAgCgpUaGUgY3B1X3RvX25vZGUoKSBpcyBjYWxs
ZWQgYXQgdmVyeSBsb3cgZnJlcXVlbmN5LCBtb3N0IG9mIHRoZSB0aW1lcyBpcyAKaW4gdGhlIGtl
cm5lbCBib290aW5nIHRpbWUuCgoKCj4+PiBSZWdhcmRsZXNzLCBJIGRvbid0IHRoaW5rIHRoYXQg
dGhlIGFwcHJvYWNoIGlzIGNvcnJlY3QuIEFzIHBlciB5b3VyCj4+PiBkZXNjcmlwdGlvbiwgc29t
ZSBpbml0aWFsaXphdGlvbiBmdW5jdGlvbnMgZXJyb25lb3VzbHkgY2FsbAo+Pj4gY3B1X3RvX25v
ZGUoKSBpbnN0ZWFkIG9mIGVhcmx5X2NwdV90b19ub2RlKCkgd2hpY2ggZXhpc3RzIHNwZWNpZmlj
YWxseQo+Pj4gZm9yIHRoYXQgY2FzZS4KPj4+Cj4+PiBJZiB0aGUgYWJvdmUgY29ycmVjdCwgaXQn
cyBjbGVhcmx5IGEgY2FsbGVyIHByb2JsZW0sIGFuZCB0aGUgZml4IGlzIHRvCj4+PiBzaW1wbHkg
c3dpdGNoIGFsbCB0aG9zZSBjYWxsZXJzIHRvIHVzZSBlYXJseSB2ZXJzaW9uLgo+PiBJdCBpcyBl
YXN5IHRvIGNoYW5nZSB0byBlYXJseV9jcHVfdG9fbm9kZSgpIGZvciBzY2hlZF9pbml0KCksCj4+
IGluaXRfc2NoZWRfZmFpcl9jbGFzcygpCj4+Cj4+IGFuZCB3b3JrcXVldWVfaW5pdF9lYXJseSgp
LiBUaGVzZSB0aHJlZSBwbGFjZXMgY2FsbCB0aGUgY3B1X3RvX25vZGUoKSBpbiB0aGUKPj4gX19p
bml0IGZ1bmN0aW9uLgo+Pgo+Pgo+PiBCdXQgaXQgaXMgYSBsaXR0bGUgaGFyZCB0byBjaGFuZ2Ug
dGhlIGVhcmx5X3RyYWNlX2luaXQoKSwgc2luY2UgaXQgY2FsbHMKPj4gY3B1X3RvX25vZGUgaW4g
dGhlIGRlZXAKPj4KPj4gZnVuY3Rpb24gc3RhY2s6Cj4+Cj4+ICDCoCBlYXJseV90cmFjZV9pbml0
KCkgLS0+IHJpbmdfYnVmZmVyX2FsbG9jKCkgLS0+cmJfYWxsb2NhdGVfY3B1X2J1ZmZlcigpCj4+
Cj4+Cj4+IEZvciBlYXJseV90cmFjZV9pbml0KCksIHdlIG5lZWQgdG8gY2hhbmdlIG1vcmUgY29k
ZS4KPj4KPj4KPj4gQW55d2F5LCBJZiB3ZSB0aGluayBpdCBpcyBub3QgYSBnb29kIGlkZWEgdG8g
Y2hhbmdlIHRoZSBjb21tb24gY29kZSwgSSBhbQo+PiBvYWt5IHRvby4KPiAgIAo+IElzIHRoZXJl
IGEgZnVuZGFtZW50YWwgcmVhc29uIHRvIGhhdmUgZWFybHlfY3B1X3RvX25vZGUoKSBhdCBhbGw/
CgpUaGUgZWFybHlfY3B1X3RvX25vZGUgZG9lcyBub3Qgd29yayBvbiBzb21lIEFSQ0hzICh3aGlj
aCBzdXBwb3J0IHRoZSAKTlVNQSksIHN1Y2gKCmFzwqAgU1BBUkMsIE1JUFMgYW5kIFMzOTAuCgoK
VGhhbmtzCgpIdWFuZyBTaGlqaWUKCj4gSXQgc2VlbXMgdGhhdCBhbGwgdGhlIG1hcHBpbmdzIGFy
ZSBrbm93biBieSB0aGUgZW5kIG9mIHNldHVwX2FyY2goKSBhbmQgdGhlCj4gaW5pdGlhbGl6YXRp
b24gb2YgbnVtYV9ub2RlIGNhbiBiZSBtb3ZlZCBlYXJsaWVyLgo+ICAgCj4+PiBJIHdvdWxkIGFs
c28gaW5pdGlhbGl6ZSB0aGUgbnVtYV9ub2RlIHdpdGggTlVNQV9OT19OT0RFIGF0IGRlY2xhcmF0
aW9uLAo+Pj4gc28gdGhhdCBpZiBzb21lb25lIGNhbGxzIGNwdV90b19ub2RlKCkgYmVmb3JlIHRo
ZSB2YXJpYWJsZSBpcyBwcm9wZXJseQo+Pj4gaW5pdGlhbGl6ZWQgYXQgcnVudGltZSwgaGUnbGwg
Z2V0IE5PX05PREUsIHdoaWNoIGlzIG9idmlvdXNseSBhbiBlcnJvci4KPj4gRXZlbiB3ZSBzZXQg
dGhlIG51bWFfbm9kZSB3aXRoIE5VTUFfTk9fTk9ERSwgaXQgZG9lcyBub3QgYWx3YXlzIHByb2R1
Y2UKPj4gZXJyb3IuCj4+Cj4+IFBsZWFzZSBzZWUgdGhlIGFsbG9jX3BhZ2VzX25vZGUoKS4KPj4K
Pj4KPj4gVGhhbmtzCj4+Cj4+IEh1YW5nIFNoaWppZQo+PgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
