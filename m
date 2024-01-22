Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F45C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 07:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJAclaGnFTjQl8OEmN339eXL6npYFJhhRmoeU/xRNLE=; b=ZX7eV43DwTjGZ/6S/YLiftFtNj
	ZVSxOBtX21TsF0wQo2O84z1OaKVKR7ul58ECXksoOpUhBFn3yJuhsaGZjq97Y9CViF21V9Qy99jbG
	tFJ4B8zYKxjD1+dXakYKIpeiWXH4FXDOq9qrKSZktskDDQclR8tl3rHfSqNaIyZGFlFmQFY/vXaYu
	SEmss3T+93CqqclBgOCjuP4VV64aCGh9lm+S9nuGyCLrUeqvteKcNYR+jI9pITjiUrtvd8cvVK06k
	/C8r+YIZ6Dth17FvWYnRESb6M8/mWbUQdvHVNCNfP0F+1Dkt3Qwh8Ir3MRWGvbL4qUrA1P30E6N/g
	AWm3j4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRonw-00ArMK-1e;
	Mon, 22 Jan 2024 07:33:12 +0000
Received: from mail-mw2nam12on20701.outbound.protection.outlook.com ([2a01:111:f403:200a::701] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRono-00ArG3-0S;
	Mon, 22 Jan 2024 07:33:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDI9kMHVrQxhGhNYjuBAzDFVSobDEnvSuF/b/hUDkFB3KCYxE+0ISeLUwlkNDLcXwl+gdVxl4rzGTlsUstsbtnSYGD4X/kQmjmOmoJsTn8WXm53KQtMBOVHbQyQ+qcssxbyQAiv6hNAW89ZcZ2t7pNyzc0HasC1vIzu9Qt1fdtmeckeH9y/9otV4WNoXpzHXEd7kj/NKZ6Kff+Fl4clE7Jw8jYx7VW+mpyN5GQQvtl2lvzZSm/8YX/jWMvtczTjZXldQ5Qp4n8ch5XyEM4HEpmjbPi8d0pUhdvBzO0NCt5GdriKxxxWhCgUvqzArqoHzMQHVUo4kZvlPfVQrUABUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMmLoXFnauY9KkDUcUs7kn/KAWO9NChcXWBew8e/yJ0=;
 b=buBERJQ2PScCsyFI/7X0bkt23HZtTb1MDVmEDe0iElE/PeWtcCCG4zoXsDWA2FhRnfvEHCMKY370fAQPZ1NVvAHZykkokwe+uFeJ0xeUbUuScnwChE79FC6PugT1tdvNLO0UU7qHlXsRlPHUgmLehLvarsmrqwB57nB9IrG0iDTuZ2aP1TFNhZX5IG+QberAlNnaQ+vYeBw89jydpj52vERVA1hDldXwC/gXC+P2EePLd+2a47olrR3tfklJOe8LZL6+5YWfR+3XkYCYROxqAZsI7qi1eaWHI9sZeVdp63y4F4z5QeFjN5f0SCfUSAibWgf9xVOKB8Nk/7r0aL1cOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMmLoXFnauY9KkDUcUs7kn/KAWO9NChcXWBew8e/yJ0=;
 b=mbYCrIvTyPZ2RQ/2Nb99ZRClxgU5pxGb2W1ERiWxmMpwwEbnuefC+LSr6YHa5buqHjO6lj/qxSOBghuPveiovSGzdpOShskFXScbArNSqW2uJSLEB7BdJUfbi8zIdmABJ1z9SI8rs2BRz5ACLqVrkQF+IpbUYAgis7x6GU7B41E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 SA0PR01MB6379.prod.exchangelabs.com (2603:10b6:806:e1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.32; Mon, 22 Jan 2024 07:32:46 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7202.026; Mon, 22 Jan 2024 07:32:46 +0000
Message-ID: <1e39190e-3cb9-41f5-bd60-1f1124823e4a@amperemail.onmicrosoft.com>
Date: Mon, 22 Jan 2024 15:32:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of the
 correct node id
To: Yury Norov <yury.norov@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>,
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
 <b8786c38-d6c4-4fea-a918-ac6a45682dba@amperemail.onmicrosoft.com>
 <Zaq5JT6SaiogCEkT@yury-ThinkPad>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <Zaq5JT6SaiogCEkT@yury-ThinkPad>
X-ClientProxiedBy: CH0PR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:610:b3::7) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|SA0PR01MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a667ef-ee11-48b9-55bf-08dc1b1c53b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6TdZwVbXaJ2LXfN776XoNhi70w3d0IgW4wLwbVPcgj0PtJC0RbmhbLSII8NbY8+dPPkqhgRPB1v6wg96BG70Xc/W32bE714d/5JW7SOU+62xuWAPZDKwVLdu4nM2+u8LycBPf04hvtUKo9fVIrXGmBFX8RwHIQhWwvbkT1/s0lZF1JLZiiR6gjeNuCjKYAQ1hEOpWxZJfYAJcgsasSW/nixSqW18oHWoXKEHGGXB7doBx0v5fLpriSWkoWNPmYv4k+DGq8WsUQlvMXvuS/6HWuko5lkMKH41XpXs0xqiUeSQXHT7Gv1/LxmZ6GxEplO1Z1OlHm6ZUMR99hcVzMsfNEEht10zYufhtXWwtGAa99SYccnpGmKPdGOybP71Fp03ZY9Hpxv8fQQXRmcARY+XZdOJya+12Awgfgt18LTiIKrrnR0hGZV8WCDq4fgfbPrJ2K4no1l5cuai7tPf4ZROUnZxJh2Ks2A7Ru8yfttUTIYGy6bAsxw9LiGrP2M1hOqHYPtxOq14gxY0YSMYiZ9RmaccxQeDyv3ZG+ko75G7gtmQ0e5SW7zHO6xgroJGMZpFdNId0sErmq8pEgTE1PMqGa4ZVKOODUhesBhR76PDDRMYMJBScoDXJncLrrGWnhxmTHve5/jN6NjSko82QHeJlegLQ6Dmzlo4cSnsMPiiOjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39850400004)(396003)(366004)(230273577357003)(230173577357003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(31686004)(6666004)(8936002)(4326008)(8676002)(478600001)(42882007)(6506007)(83380400001)(83170400001)(38100700002)(6512007)(26005)(107886003)(2616005)(6486002)(66556008)(66946007)(54906003)(31696002)(66476007)(316002)(6916009)(2906002)(7416002)(5660300002)(41300700001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Szg2WHgxMEhZNlRuWkprK3F0R3hZRVZ2cUVsRjVFbCtoZjNkUGFtcW5tTjlP?=
 =?utf-8?B?RmxKNWp2V0NKVWRMcDRLNkFmVXUrQndNWHlSaXF5V1prUVIxYWF5WVlzbmI3?=
 =?utf-8?B?VTkzVFhyd3kvd0t6dDNmei9yN285UzJxbDAvQW45WmNXWStLZ2YvRzJWRzlY?=
 =?utf-8?B?b1kwRU44ckZ0NGU5cnpKRjlPdTNSQnNRRmhPL3ZlK0xGSEJpUDZaU3o3SGtv?=
 =?utf-8?B?WFBFeEE3My9Ob1lJSXE2SmdhaDVqS1dKWkI0U1VnUXIxME4xa2ZpVVArd29B?=
 =?utf-8?B?aHhMSmVpMWlodHQ0em4xL1ZkSDM0TThmZHlFSGRVYUcvUlJOS2REQ1FIN092?=
 =?utf-8?B?MEllRFZQZVFZcUFxaWFOMC9YdDc1cVB6UmNGcWJ6emdhM0tSZzlaTndpa2w4?=
 =?utf-8?B?ZklYV1JUZHJ0VjdPNFY0UGxTeVNyMDBOb3dKZndlbGJIblk5YllVNkVIM05s?=
 =?utf-8?B?TzdPWkhFQzJSaUZRd2pSWUxiYUN6aDdPMlRyRnhmWThEK1JDUUpMdWtHeWxC?=
 =?utf-8?B?dE9MbCtUd09nN2RGaGJHdHhvS2VSUXdUOW42YVZsQnh4ZEVUd3RQUm1zN2ty?=
 =?utf-8?B?UHZGWFNqNURLa3A4NjhTQ1FCTU13UUoySUtwVVArLzh2Mi83Z29rdkgvZnNN?=
 =?utf-8?B?ZGpyNUhIM0UvajJza2cxQ201aFQ2RnBhSDQ5d2JuOTZDQktNV1RabGpKZm5U?=
 =?utf-8?B?bi9BQXZxUEk3NUhjUHdvS3JRZng5YVR3L1E3dDJqTzhkbGhsb2Y4TmtKc3Rr?=
 =?utf-8?B?UHpZTWpZaWEzeW9XZDNtV0NvZzgyaWU5ajlLYi96M3dId3d1TlUzU1oyVHRY?=
 =?utf-8?B?TmFUWmJXWUIyRWkrbG5tYzZzQXpMQ2t1YzJYL0FtUkk0SVU0TU8rdHdFcmhK?=
 =?utf-8?B?dDdSZlFhNHRwekxXZnI0VTdmZW5JNThiYWZidTlTOVhFd1hDMDI2TVNhdHFs?=
 =?utf-8?B?L05RLzRPS05NVmN6Q1pjR0xQZDRaZGlmRlVJc09IVUM1TVlwWE9XQ0ZnNWJt?=
 =?utf-8?B?N1QwQno3MWt0VDNCakRqL09zVXdhbGV1c29zSlM0dUx1alJVMWp3SHdZMVMw?=
 =?utf-8?B?ZXMveUJ2c1lzd0Z1ZklOQWRqc0dOVjNpMjBzUld0TjRiZmUrZkFXWlhwc0sz?=
 =?utf-8?B?Z2hodmR4cUJKUlprNmpuNUJVYXlDQmVQY0RLeWE5Y1ZpaTRhMVljdVpsQnh4?=
 =?utf-8?B?S1dYckVlTEdEUWlQT2ZVbzVFR20vYmJ2UFJCQ0UxUFZ0VDUybTIrdWVKNkV1?=
 =?utf-8?B?Vk1kdlFySFpIbnRuOUZUTVllajAxb2ZTeTJHODJaUUZHWkJuZDdCNWFMMVBT?=
 =?utf-8?B?SStkRWxIdk9XZmZVNWtIWnVtZ2w0TGVRb1lZc1crV0h2aXdGRGZlTURzUHNn?=
 =?utf-8?B?dWxBQW5pZGUwUjhNZVRmTjVIU2xCUEFqS0FvbmJjVm5taXpXNGNBNkpxa1hi?=
 =?utf-8?B?dTlmSlBNQjF1ZjBFZW5hcEVJVU90RUQ0VmJxeHJGNE81WkRseDZtejQzWkhC?=
 =?utf-8?B?M1IrbnIrN0VVTFRZdGp2aTJRdjBtNzkzUllwSjhyazNGcENIcXFVbk5pODFz?=
 =?utf-8?B?b2xydkFycStmYXZaYllSTmhkKzZqcTFacFg4V214S1NNdEpGVmVQNFpNY2Zi?=
 =?utf-8?B?dDhiRjNwVDJMRjlMUWg4SFFobDNUeWJpM1JGQmdhL3ozZ3YxZkUrOG1iZVFV?=
 =?utf-8?B?NmxHWEdPUVQ3Mi9pYUVFeTlRQkdPcXkyTHMzaGJ0RUwweVg4OVQyckw3dlh2?=
 =?utf-8?B?VFJadS9ac0hEU2VUMDF2dURBNlJpV09UUVdrN2NmZVE5WG4xS1VFM3lKMmYx?=
 =?utf-8?B?MFZyMTFaWm13YVVDSVNlVk9PWldBeTBaUHlkV3o3NUZTRC8yaWViQURZbVB1?=
 =?utf-8?B?RVFnc2VxZk50ZlBvSWFFcnZjeDhJdVlCR2k1Um42Qkx1TFpDMXJjWDVkVXZa?=
 =?utf-8?B?YVJxMXRrNEl4VDJ6dCtDcWNSQWtKRlQrd2Q4MERla1dnd2NmVnRlY3grZjR2?=
 =?utf-8?B?c29hdDk4RFVKQ0ZIcm44OHc3Wmg1OTRmdVRFdXNyZEhoRGJyM1BGbGc2cEQr?=
 =?utf-8?B?bm5jUGtuOTNzekxFUkw2UTRZdlNkS2Nid1IvbXZKTG1aUXRyQUh1ZE1UZ2Vm?=
 =?utf-8?B?WGtRZ0RUcU1HUHhTc0lEUkRPSit0RVloeldNUTJqWTdUZ1J1RTkvS3Bpam90?=
 =?utf-8?Q?tV1q2wkOVhEQOZeaxCPZvhU=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a667ef-ee11-48b9-55bf-08dc1b1c53b8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 07:32:45.9517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dykvp/O6lEy3ZHWlYAkZ8e+2942Vu8eXdL2D3VVBxgB38l+igSj2xwZ3G8Mvyr6UzlfokbKnIipxJd9nezsFrh6PvLtt5ExW5zyiduWDR7r8iMf0oiQP09cQ0KykMjJ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6379
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_233304_201735_32149135 
X-CRM114-Status: GOOD (  23.57  )
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

CuWcqCAyMDI0LzEvMjAgMjowMiwgWXVyeSBOb3JvdiDlhpnpgZM6Cj4gW0VYVEVSTkFMIEVNQUlM
IE5PVElDRTogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gYW4gZXh0ZXJuYWwgc2VuZGVyLiBQ
bGVhc2UgYmUgbWluZGZ1bCBvZiBzYWZlIGVtYWlsIGhhbmRsaW5nIGFuZCBwcm9wcmlldGFyeSBp
bmZvcm1hdGlvbiBwcm90ZWN0aW9uIHByYWN0aWNlcy5dCj4KPgo+IE9uIEZyaSwgSmFuIDE5LCAy
MDI0IGF0IDA0OjUwOjUzUE0gKzA4MDAsIFNoaWppZSBIdWFuZyB3cm90ZToKPj4g5ZyoIDIwMjQv
MS8xOSAxNjo0MiwgTWlrZSBSYXBvcG9ydCDlhpnpgZM6Cj4+PiBPbiBGcmksIEphbiAxOSwgMjAy
NCBhdCAwMjo0NjoxNlBNICswODAwLCBTaGlqaWUgSHVhbmcgd3JvdGU6Cj4+Pj4g5ZyoIDIwMjQv
MS8xOSAxMjo0MiwgWXVyeSBOb3JvdiDlhpnpgZM6Cj4+Pj4+IFRoaXMgYWRkcyBhbm90aGVyIGxl
dmVsIG9mIGluZGlyZWN0aW9uLCBJIHRoaW5rLiBDdXJyZW50bHkgY3B1X3RvX25vZGUKPj4+Pj4g
aXMgYSBzaW1wbGUgaW5saW5lci4gQWZ0ZXIgdGhlIHBhdGNoIGl0IHdvdWxkIGJlIGEgcmVhbCBm
dW5jdGlvbiB3aXRoCj4+Pj4+IGFsbCB0aGUgYXNzb2NpYXRlIG92ZXJoZWFkLiBDYW4geW91IHNo
YXJlIGEgYmxvYXQtby1tZXRlciBvdXRwdXQgaGVyZT8KPj4+PiAjLi9zY3JpcHRzL2Jsb2F0LW8t
bWV0ZXIgdm1saW51eCB2bWxpbnV4Lm5ldwo+Pj4+IGFkZC9yZW1vdmU6IDYvMSBncm93L3Nocmlu
azogNjEvNTEgdXAvZG93bjogMTE2OC8tNTg4ICg1ODApCj4+Pj4gRnVuY3Rpb24gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgb2xkICAgICBuZXcgICBkZWx0YQo+Pj4+IG51bWFf
dXBkYXRlX2NwdSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDE0OCAgICAgMjQ0ICAgICAr
OTYKPj4+Pgo+Pj4+ICAgIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uKHRvIG1hbnkgdG8gc2tpcCkKPj4+Pgo+
Pj4+IFRvdGFsOiBCZWZvcmU9MzI5OTAxMzAsIEFmdGVyPTMyOTkwNzEwLCBjaGcgKzAuMDAlCj4+
PiBJdCdzIG5vdCBvbmx5IGFib3V0IHRleHQgc2l6ZSwgdGhlIGluZGlyZWN0IGNhbGwgYWxzbyBo
dXJ0cyBwZXJmb3JtYW5jZQo+PiBUaGUgY3B1X3RvX25vZGUoKSBpcyBjYWxsZWQgYXQgdmVyeSBs
b3cgZnJlcXVlbmN5LCBtb3N0IG9mIHRoZSB0aW1lcyBpcyBpbgo+PiB0aGUga2VybmVsIGJvb3Rp
bmcgdGltZS4KPiBUaGF0IGRvZXNuJ3QgbWF0dGVyLiBUaGlzIGZ1bmN0aW9uIGlzIGEgc2ltcGxl
IGlubGluZXIgdGhhdCBkZXJlZmVyZW5jZXMKPiBhIHBvaW50ZXIsIGFuZCBJIGJlbGlldmUgYWxs
IG9mIHVzIHdhbnQgdG8ga2VlcCBpdCBzaW1wbGUuCgpZZXMuIEkgYWdyZWUuCgpJIGFsc28gd2Fu
dCB0byBrZWVwIGl0IHNpbXBsZSB0b28uCgoKPj4+Pj4gUmVnYXJkbGVzcywgSSBkb24ndCB0aGlu
ayB0aGF0IHRoZSBhcHByb2FjaCBpcyBjb3JyZWN0LiBBcyBwZXIgeW91cgo+Pj4+PiBkZXNjcmlw
dGlvbiwgc29tZSBpbml0aWFsaXphdGlvbiBmdW5jdGlvbnMgZXJyb25lb3VzbHkgY2FsbAo+Pj4+
PiBjcHVfdG9fbm9kZSgpIGluc3RlYWQgb2YgZWFybHlfY3B1X3RvX25vZGUoKSB3aGljaCBleGlz
dHMgc3BlY2lmaWNhbGx5Cj4+Pj4+IGZvciB0aGF0IGNhc2UuCj4+Pj4+Cj4+Pj4+IElmIHRoZSBh
Ym92ZSBjb3JyZWN0LCBpdCdzIGNsZWFybHkgYSBjYWxsZXIgcHJvYmxlbSwgYW5kIHRoZSBmaXgg
aXMgdG8KPj4+Pj4gc2ltcGx5IHN3aXRjaCBhbGwgdGhvc2UgY2FsbGVycyB0byB1c2UgZWFybHkg
dmVyc2lvbi4KPj4+PiBJdCBpcyBlYXN5IHRvIGNoYW5nZSB0byBlYXJseV9jcHVfdG9fbm9kZSgp
IGZvciBzY2hlZF9pbml0KCksCj4+Pj4gaW5pdF9zY2hlZF9mYWlyX2NsYXNzKCkKPj4+Pgo+Pj4+
IGFuZCB3b3JrcXVldWVfaW5pdF9lYXJseSgpLiBUaGVzZSB0aHJlZSBwbGFjZXMgY2FsbCB0aGUg
Y3B1X3RvX25vZGUoKSBpbiB0aGUKPj4+PiBfX2luaXQgZnVuY3Rpb24uCj4+Pj4KPj4+Pgo+Pj4+
IEJ1dCBpdCBpcyBhIGxpdHRsZSBoYXJkIHRvIGNoYW5nZSB0aGUgZWFybHlfdHJhY2VfaW5pdCgp
LCBzaW5jZSBpdCBjYWxscwo+Pj4+IGNwdV90b19ub2RlIGluIHRoZSBkZWVwCj4+Pj4KPj4+PiBm
dW5jdGlvbiBzdGFjazoKPj4+Pgo+Pj4+ICAgICBlYXJseV90cmFjZV9pbml0KCkgLS0+IHJpbmdf
YnVmZmVyX2FsbG9jKCkgLS0+cmJfYWxsb2NhdGVfY3B1X2J1ZmZlcigpCj4+Pj4KPj4+Pgo+Pj4+
IEZvciBlYXJseV90cmFjZV9pbml0KCksIHdlIG5lZWQgdG8gY2hhbmdlIG1vcmUgY29kZS4KPj4+
Pgo+Pj4+Cj4+Pj4gQW55d2F5LCBJZiB3ZSB0aGluayBpdCBpcyBub3QgYSBnb29kIGlkZWEgdG8g
Y2hhbmdlIHRoZSBjb21tb24gY29kZSwgSSBhbQo+Pj4+IG9ha3kgdG9vLgo+Pj4gSXMgdGhlcmUg
YSBmdW5kYW1lbnRhbCByZWFzb24gdG8gaGF2ZSBlYXJseV9jcHVfdG9fbm9kZSgpIGF0IGFsbD8K
Pj4gVGhlIGVhcmx5X2NwdV90b19ub2RlIGRvZXMgbm90IHdvcmsgb24gc29tZSBBUkNIcyAod2hp
Y2ggc3VwcG9ydCB0aGUgTlVNQSksCj4+IHN1Y2gKPj4KPj4gYXMgIFNQQVJDLCBNSVBTIGFuZCBT
MzkwLgo+IFNvLCB5b3VyIGFwcHJvYWNoIHdvdWxkbid0IHdvcmsgZWl0aGVyLCByaWdodD8gSSB0
aGluayB5b3UndmUgZ290IGEKPiB0ZXN0aW5nIGJvdCByZXBvcnQgb24gaXQgYWxyZWFkeS4uLgoK
SU1ITywgbXkgcGF0Y2ggd29ya3MgZmluZSBmb3IgdGhlbS4KClRoZXkgaGF2ZSB0aGVpciBvd24g
Y3B1X3RvX25vZGUuCgoKVGhlIHg4NiByZXBvcnRlZCBhbiBjb21waWxpbmcgZXJyb3IsIGJlY2F1
c2UgdGhlIHg4NiBkb2VzIG5vdCBjb21waWxlCgp0aGUgZHJpdmVyL2Jhc2UvYXJjaF9udW1hLmMu
CgpJIGhhdmUgZml4ZWQgaXQgYnkgbW92aW5nIHRoZSBjcHVfdG9fbm9kZSBmcm9tCgogwqDCoMKg
wqAgZHJpdmVyL2Jhc2UvYXJjaF9udW1hLmMgdG8gZHJpdmVyL2Jhc2Uvbm9kZS5jCgoKVGhlIGRy
aXZlci9iYXNlL25vZGUuYyBpc8KgIGJ1aWx0LWluIGZvciBhbGwgdGhlIE5VTUEgQVJDSHMuCgo+
IFlvdSBjYW4gbWFrZSBpdCBsaWtlIHRoaXM6Cj4KPiAgICAjaWZkZWYgQ09ORklHX0FSQ0hfTk9f
RUFSTFlfQ1BVX1RPX05PREUKPiAgICAjZGVmaW5lIGVhcmx5X2NwdV90b19ub2RlIGNwdV90b19u
b2RlCj4gICAgI2VuZGlmCgpUaGFua3MuIEFkZCB0aGlzIG1ha2UgaXQgbW9yZSBjb21wbGljYXRl
ZC4uCgoKPj4+IEl0IHNlZW1zIHRoYXQgYWxsIHRoZSBtYXBwaW5ncyBhcmUga25vd24gYnkgdGhl
IGVuZCBvZiBzZXR1cF9hcmNoKCkgYW5kIHRoZQo+Pj4gaW5pdGlhbGl6YXRpb24gb2YgbnVtYV9u
b2RlIGNhbiBiZSBtb3ZlZCBlYXJsaWVyLgo+Pj4+PiBJIHdvdWxkIGFsc28gaW5pdGlhbGl6ZSB0
aGUgbnVtYV9ub2RlIHdpdGggTlVNQV9OT19OT0RFIGF0IGRlY2xhcmF0aW9uLAo+Pj4+PiBzbyB0
aGF0IGlmIHNvbWVvbmUgY2FsbHMgY3B1X3RvX25vZGUoKSBiZWZvcmUgdGhlIHZhcmlhYmxlIGlz
IHByb3Blcmx5Cj4+Pj4+IGluaXRpYWxpemVkIGF0IHJ1bnRpbWUsIGhlJ2xsIGdldCBOT19OT0RF
LCB3aGljaCBpcyBvYnZpb3VzbHkgYW4gZXJyb3IuCj4+Pj4gRXZlbiB3ZSBzZXQgdGhlIG51bWFf
bm9kZSB3aXRoIE5VTUFfTk9fTk9ERSwgaXQgZG9lcyBub3QgYWx3YXlzIHByb2R1Y2UKPj4+PiBl
cnJvci4KPiBZb3UgY2FuIHByaW50IHRoaXMgZXJyb3IgeW91cnNlbGY6Cj4KPiAgICAjaWZuZGVm
IGNwdV90b19ub2RlCj4gICAgc3RhdGljIGlubGluZSBpbnQgY3B1X3RvX25vZGUoaW50IGNwdSkK
PiAgICB7Cj4gICAgICAgICAgaW50IG5vZGUgPSBwZXJfY3B1KG51bWFfbm9kZSwgY3B1KTsKPgo+
ICAgICNpZmRlZiBDT05GSUdfREVCVUdfUEVSX0NQVV9NQVBTCj4gICAgICAgICAgaWYgKG5vZGUg
PT0gTlVNQV9OT19OT0RFKQo+ICAgICAgICAgICAgICAgICAgcHJfZXJyKC4uLik7Cj4gICAgI2Vu
ZGlmCj4KPiAgICAgICAgICAgIHJldHVybiBub2RlOwo+ICAgIH0KPiAgICAjZW5kaWYKClRoYW5r
cy7CoCBJIGhhZCBhIHNhbWlsaWFyIHByaXZhdGUgdG8gZGV0ZWN0IGl0LgoKQWZ0ZXIgbXkgcGF0
Y2gsIHRoZXJlIGlzIG5vIG5lZWQgdG8gZGV0ZWN0IHRoZSBlcnJvciBhZ2Fpbi4KCgpUaGFua3MK
Ckh1YW5nIFNoaWppZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
