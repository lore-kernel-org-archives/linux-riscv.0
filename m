Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43921C46CD2
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 02:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcN+aiun9/vrFLB7C5o0hZioliqe7BQ9c1udegTkCU8=; b=WAuRhUfUpC2jqiH3F0Bo2M4obV
	UzkpbrLRttpG+PewDZ2ZpAWAgL/v3plQYCvbTAqqnP9opPpbM54hDH6CdRTnufhLtjqwObg4mz/ok
	dKNZycv7Y8wfz4laX5GykW0kVw5VOiS73NQIj+GaIScfW5Y6lQ7Z+gZrQg7naWtZCn6ai6G+XAN3b
	MZOutievBTGnlvxYm1478e5SF0oEoCHz+nKhfbGTk6v+CrAeqQpiNfp5yI1xnAfIGCufWK2S/yTw2
	OIi4ULg5gjhxiB8MYuYGBysRqdxQ/u/ZKKnUjrhDCbx7ifXL5wkjUIZJRwPe0wSKswBwro4r0UAA1
	aCKBEMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSpit-005voW-1o;
	Thu, 25 Jan 2024 02:44:11 +0000
Received: from mail-dm6nam11on2071b.outbound.protection.outlook.com ([2a01:111:f400:7eaa::71b] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSpip-005vm8-2q;
	Thu, 25 Jan 2024 02:44:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCT+ijVp3+gouV994/1nQ1WcOXat/Wks7BoqVn3KZ3rtrsN6tUUz8ygW28zeu03bxb6Ytk7NcbXDllzX6wtcgrFIRf5vLmDzFCwoO3bj7Slake8vn8cz0cyJXzecLLJypxFOCkAm24hSQiwgUNaCXvTqSeQ7YZcK2gv+3V/c0zakUs0nq4tg8SNTe3AV9tWSOO0acxilrJJdTAtUu7pNYX2dbjNESyYL2ViHqb1u8D36TR7y4iFsXPYlZCFK8uNJVHvxkPzVXXelzqSpvulrkdwFi0Ci1snkfrPnptGWVWI7FUXutQ3S3F6nGOaKADnQe0491+xRxgG2uapw4kcL3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CvYZh0mBvkHRbO98yoKxSDYL76ErX9PbNvBNpOsjCo=;
 b=KlfgdeC46KkO9/Tc+em85dqb93r4W5DYxdEdWL1OhFa1FQP1FeDH4tl9oVuNuKy/RGSy7oRPmxss9wQfmKjsbXhlVeYY4eznwUsoXJKA79/dkUhRiHBsvksuv3hdN8zNY0awNFREZUHF+Iz1nHdtrm1XYVx8xO9A15dbb/fJSvV/HsmBKmWmCYUtJ2R65QUUhMEw7EqGADRdzkxGFbYxV7UmwsGQnDCjBckzKt4WNiLBKgjx5awO9AYoBruLVOaELQupbt5gT+T+2xEt99nAE9nf7cV06GmtjVNhxoecNNHFfK6ZMoDiNaJ3+BI6P9yL1kGs61tfDbgyn3CiRTYiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CvYZh0mBvkHRbO98yoKxSDYL76ErX9PbNvBNpOsjCo=;
 b=RpcjYoH4g6a/lRcM18rxnL0fv6sfZqAvtaFhiOMnQjz1Z6uAgXIwxy6Bk347wcaA3BuYAaat33DA4X3oQX5RihRDKmePM22Kgic7Uyd3vb9Do5JHpeQHa121NbjiKQ3mo/39QXU3J0D2/W/2LBLhvEC+cV0caEOHDnMYg3XMSwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 SA1PR01MB8252.prod.exchangelabs.com (2603:10b6:806:388::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.34; Thu, 25 Jan 2024 02:42:44 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7202.026; Thu, 25 Jan 2024 02:42:43 +0000
Message-ID: <2c7c6afa-7750-413d-8d35-048d6813d93c@amperemail.onmicrosoft.com>
Date: Thu, 25 Jan 2024 10:42:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
To: "Lameter, Christopher" <cl@os.amperecomputing.com>,
 Huang Shijie <shijie@os.amperecomputing.com>
Cc: gregkh@linuxfoundation.org, patches@amperecomputing.com,
 rafael@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, yury.norov@gmail.com, kuba@kernel.org,
 vschneid@redhat.com, mingo@kernel.org, akpm@linux-foundation.org,
 vbabka@suse.cz, rppt@kernel.org, tglx@linutronix.de, jpoimboe@kernel.org,
 ndesaulniers@google.com, mikelley@microsoft.com, mhiramat@kernel.org,
 arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
References: <20240123045843.75969-1-shijie@os.amperecomputing.com>
 <4a13353c-cf4b-a388-5776-389c61c63ec0@os.amperecomputing.com>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <4a13353c-cf4b-a388-5776-389c61c63ec0@os.amperecomputing.com>
X-ClientProxiedBy: CH0P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::10) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|SA1PR01MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2648b7-57b1-4a81-ed36-08dc1d4f4dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhhCCEyaq9KxvLAhwtyT2Mdd1tJkmWepEzkfDPyQ3mur742++CErcC0DzUz+dZKeXLEHn7aV2hOH7hikWOqqxo/x4gV7pogArIlVx5jHSYdW3Wj7B4CeGSxLyaM7s0Vi2w43nSrwXgyDAcY/pokwAlaQVUEG2SPHf215kVr3a5eYMp/I2zaiX6C2S1P9iR/bw4f2cpiRlISmGwmffjUqZjguUMXjdXZiWknZx2LeVSfvR9I6DmhYfU1vUeipn0dNx5ENsYCZayLNqJbaIwqmJI+QSid+J8CWFtCYDZn4P9Uz2pH8q85fxqhaXV4XTxVgj72wp9fjwywNH6wXhrwO1F31/4VdFW84j6NQ/z6T3Z7Ok67Meq/En325JwQ37nPmVQPEIbwa5prnTgo15ug9A36JB4vUSVmtdgzMg5586gAJbUNv2oZHxILgSqB5yEgv11FpmeYR1pQZlGTnoj7qQjXWQZQwwC6OYaYn+mqfLZBJiagetCZ8HapO/liNUp/8v/s1bBPK7juQuNCLDI/6kVBMz2sRzhmg2ycH+rxxZGlrOxz6QwNXH5K8HK2c9K0TYYZjsapG6npaPgm80UmQicD+Qw0ScMdKV7b5jLOM1Ds3Y8biX632oj4p/wEzMtgr5WIOM/t3KA3Vjyfwfz5B+MgXlp64CyIqLAKKXwFSARo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(39850400004)(136003)(230173577357003)(230273577357003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6486002)(6506007)(6512007)(6666004)(478600001)(26005)(2616005)(2906002)(83380400001)(7416002)(5660300002)(41300700001)(42882007)(4326008)(8676002)(66556008)(66946007)(110136005)(8936002)(316002)(66476007)(83170400001)(31696002)(31686004)(38100700002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGUrRWxjTmlTOXBHeFhvTWRyb2E3QkE1SmcxRHVFWXFleEQ4QjRNNGtPam4w?=
 =?utf-8?B?SlFXRXE0cGxaNTZIMzlqUVQyb1l0R3BzWVB3T1NlUk9jRlppbG0zU0sySnp5?=
 =?utf-8?B?bTJiT2Y3Yk5FNkZKZ3E3RmI0SDlHS2FrUGYvSzJZaGpRQ1A1Tm4rOVc1dlRv?=
 =?utf-8?B?L0tCVXUyUUNrNys1TmRRa3Rwc2ptWU1JTkhNS2c3SGNWZjNiSnNxUkN2SjJN?=
 =?utf-8?B?ODdUa202ZGZnT1oxVGlIK3FWRUE3UXFmYVBqbGxnRU1nT0ozcXFDdTg1UzBI?=
 =?utf-8?B?S2NKTFMzQnJ0WGhGMVlxbkJFR05jY2lPR1Jnc0Z2TzZ3WXVFTWtyVmhPbldX?=
 =?utf-8?B?ZmthNkdUeENmVVJmVFQ3QzB2aE5lOTE1cWJxZXpDVEJpaS8yNm9xMXRVWWQ3?=
 =?utf-8?B?ekpSOEdvcUdycS84VDNiSy83UDFYcExYdWRrYjFLcUdRaHlRRUc5MGVCTGYr?=
 =?utf-8?B?OURxYlZhbmFjekFJSUg2Vk41UklUMHBROXFoZ3NzcHlsRGZCTkhHbzRnandX?=
 =?utf-8?B?SnFuODlkWnY0Q1hsM1IvbzBBNGJDVE5WWFRzcXVtUUNPc0toN0s5MVNYSC90?=
 =?utf-8?B?cm0wTVZGS3pjdjNDcEZJNjFrbnpra3lHV2FWMTBPWUphSzFwekJHaUlyNkFn?=
 =?utf-8?B?YWJHeFBzYVBRLzJkMit1UnhmNlFpKzBJTDlqNFE1NFZINkhYVXZMcnZZNDhZ?=
 =?utf-8?B?SGtxRjVkaTVkZDRqclR4QjVGRXJpTUg5RmJWLzhSTGhlaEVqWTgvMDd4RjAy?=
 =?utf-8?B?QTM3ZnBHVjVLeW0xcElUQnh1R3ZFQkZZWUlHa2QrVDhFMEhac2s3cjJQMXJh?=
 =?utf-8?B?Z2hYS1FWOWVyWEY2U0xjMkh2UGFXNWo3Vm5wMnZPTzVjQzVOK241cnJDMmtm?=
 =?utf-8?B?aEtmbTYwbjBWYmhhM2FkTWJ2WGJpK1hVWm9Pbk0xTkJqUldYTjg2MUpQako4?=
 =?utf-8?B?Z0tUMlhNcXlLbXVBR2NBYVRhMS9KLzRsZmNFUlJlb2kwSTJ1YzJiTEtHcFU3?=
 =?utf-8?B?M0VRcTY2RXhtZVJ1WWpSR2xPWi9ZWEZLQSsvVjM0UHFkeXhNcFZodTVNZWZj?=
 =?utf-8?B?R1BmUFl4R2NMSVVpTzVDY0NBYzJQemhvS1pUL1ZWUjE0OG55aU5raVBQKzg4?=
 =?utf-8?B?R2g1WUUycTQrcXUvK0UrenJrK2FZejVIR1BEQ1MrdENTNnBQc1BoOHJqVEVP?=
 =?utf-8?B?Znl1ZmM4QjdibW5oSnV6MDI2blJudHZsQ2JSa0VxUzR1K0RvWkV2dThjajNT?=
 =?utf-8?B?S0RoNzRXcyt4bDFhTHhHTVo4bktHMlBVN3d4eFRDbm56R09vQUxncmVrK0E5?=
 =?utf-8?B?Z0ZNYlRQVGhzZVFlT2pvWnJ4aGl0VDdYNlNEUW9RNkhScU1wQUxLOEJRZUtj?=
 =?utf-8?B?dldZNWx4YXNKZDZiUDBTNkFIbmRYQkFrd0xFN2Q0YVFiOUVLcFgvY2hGMGJs?=
 =?utf-8?B?OTZwNDV4ZlJsRlRWaVRKc1d1eDhlL1Bla3RteFlSYVFEWStuYng0VDh6dy8y?=
 =?utf-8?B?d3d6cXZTV1lBN0xXUVlPSmI3TmdyVGZrYUhOM0NBVmIrTzA1bmlzcDhwYktm?=
 =?utf-8?B?dGt6cFhjZnAwRkJhTWVxczFiV0lLWTZraHF0ajFyc25CcGdhQ2JBOWJXSEdm?=
 =?utf-8?B?M2QyRFpOM1ZLU1FVV3ZkQmpYUURhelJuenp5UExDV2s0OW5WZ1FjVjBxM3hw?=
 =?utf-8?B?dGpDNmE4Uk83WGFuOGdoM1ZlRHBpQWlPQ1BjdldvUjZtUEt5WkVZY1JydllQ?=
 =?utf-8?B?dmNUMVN0WlhoNkptd0llN29Ybnh1MVNqODhSOFE0RjJoeWVhR1EySmgwRWxh?=
 =?utf-8?B?UFNpNGNUQnNpaWh5Vm5ud0RHZEkyWEZXR25ub2wvMUJWSWtpeXVpRlAvYzJs?=
 =?utf-8?B?Qit1UXlWSmE4NnpZeTNTYUNNNFM4dU1hbUtmVVU1M3BrSDYxbUN0TlM5VndX?=
 =?utf-8?B?Q3dRS0ZGemZvajFNOFFoUTNWWEFDZTVyakN1ZVNmVVJxRWtNaHNTdnZOSGZx?=
 =?utf-8?B?TS94djYxU2F6SzBNMHZKeHcwMEkweUtFbDVOS0szUjVjdlFXcUJqM3ZQWDN5?=
 =?utf-8?B?d2djdDlPNFN6cU8zUVdiRkJZazN0d0JuZDRJOHRUcVV6MmtMdDlRR2ZDNUtJ?=
 =?utf-8?B?SnB4YkV0WDZLWUhWQmpVb3loMWlMWm11UHVPa08yYzY3RFI3MzA0ZHVsRXc2?=
 =?utf-8?Q?N/c14SdkrGfuTJvileArV8s=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2648b7-57b1-4a81-ed36-08dc1d4f4dfd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 02:42:43.3496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41q/FE+kcUBSq0XcZ9pvymbvVxbh2aJqWriuXtRweZZziHOvTBo/rRp/nmww4ANTTPBN5ABYXMEQTxx/0134NYm7D9h9t3nzLQGPlVYlm6C0pXqEQwl9hRU5S/Sp+ZA5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB8252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_184407_936367_45259241 
X-CRM114-Status: GOOD (  16.80  )
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

CuWcqCAyMDI0LzEvMjUgMToxOSwgTGFtZXRlciwgQ2hyaXN0b3BoZXIg5YaZ6YGTOgo+IE9uIFR1
ZSwgMjMgSmFuIDIwMjQsIEh1YW5nIFNoaWppZSB3cm90ZToKPgo+PiBEdXJpbmcgdGhlIGtlcm5l
bCBib290aW5nLCB0aGUgZ2VuZXJpYyBjcHVfdG9fbm9kZSgpIGlzIGNhbGxlZCB0b28gCj4+IGVh
cmx5IGluCj4+IGFybTY0LCBwb3dlcnBjIGFuZCByaXNjdiB3aGVuIENPTkZJR19OVU1BIGlzIGVu
YWJsZWQuCj4+Cj4+IEZvciBhcm02NC9wb3dlcnBjL3Jpc2N2LCB0aGVyZSBhcmUgYXQgbGVhc3Qg
Zm91ciBwbGFjZXMgaW4gdGhlIGNvbW1vbiAKPj4gY29kZQo+PiB3aGVyZSB0aGUgZ2VuZXJpYyBj
cHVfdG9fbm9kZSgpIGlzIGNhbGxlZCBiZWZvcmUgaXQgaXMgaW5pdGlhbGl6ZWQ6Cj4+IMKgwqDC
oMKgwqDCoCAxLikgZWFybHlfdHJhY2VfaW5pdCgpwqDCoMKgwqDCoMKgwqDCoCBpbiBrZXJuZWwv
dHJhY2UvdHJhY2UuYwo+PiDCoMKgwqDCoMKgwqAgMi4pIHNjaGVkX2luaXQoKcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaW4ga2VybmVsL3NjaGVkL2NvcmUuYwo+PiDCoMKgwqDCoMKgwqAg
My4pIGluaXRfc2NoZWRfZmFpcl9jbGFzcygpwqDCoMKgIGluIGtlcm5lbC9zY2hlZC9mYWlyLmMK
Pj4gwqDCoMKgwqDCoMKgIDQuKSB3b3JrcXVldWVfaW5pdF9lYXJseSgpwqDCoMKgwqAgaW4ga2Vy
bmVsL3dvcmtxdWV1ZS5jCj4+Cj4+IEluIG9yZGVyIHRvIGZpeCB0aGUgYnVnLCB0aGUgcGF0Y2gg
Y2hhbmdlcyBnZW5lcmljIGNwdV90b19ub2RlIHRvCj4+IGZ1bmN0aW9uIHBvaW50ZXIsIGFuZCBl
eHBvcnQgaXQgZm9yIGtlcm5lbCBtb2R1bGVzLgo+PiBJbnRyb2R1Y2Ugc21wX3ByZXBhcmVfYm9v
dF9jcHVfc3RhcnQoKSB0byB3cmFwIHRoZSBvcmlnaW5hbAo+PiBzbXBfcHJlcGFyZV9ib290X2Nw
dSgpLCBhbmQgc2V0IGNwdV90b19ub2RlIHdpdGggZWFybHlfY3B1X3RvX25vZGUuCj4+IEludHJv
ZHVjZSBzbXBfcHJlcGFyZV9jcHVzX2RvbmUoKSB0byB3cmFwIHRoZSBvcmlnaW5hbCAKPj4gc21w
X3ByZXBhcmVfY3B1cygpLAo+PiBhbmQgc2V0IHRoZSBjcHVfdG9fbm9kZSB0byBmb3JtYWwgX2Nw
dV90b19ub2RlKCkuCj4KPiBXb3VsZMKgIHlvdSBwbGVhc2UgZml4IHRoaXMgY2xlYW5seSB3aXRo
b3V0IGEgZnVuY3Rpb24gcG9pbnRlcj8KPgo+IFdoYXQgSSB0aGluayBuZWVkcyB0byBiZSBkb25l
IGlzIGEgcGF0Y2ggc2VyaWVzLgo+Cj4gMS4gSW5zdHJ1bWVudCBjcHVfdG9fbm9kZSBzbyB0aGF0
IHNvbWUgd2FybmluZyBpcyBpc3N1ZWQgaWYgaXQgaXMgdXNlZCAKPiB0b28gZWFybHkuIFByZWxv
YWRpbmcgdGhlIGFycmF5IHdpdGggTlVNQV9OT19OT0RFIHdvdWxkIGFsbG93IHVzIHRvIGRvIAo+
IHRoYXQuCj4KPiAyLiBJbXBsZW1lbnQgZWFybHlfY3B1X3RvX25vZGUgb24gcGxhdGZvcm1zIHRo
YXQgY3VycmVudGx5IGRvIG5vdCBoYXZlIAo+IGl0Lgo+Cj4gMy4gQSBzZXJpZXMgb2YgcGF0Y2hl
cyB0aGF0IGZpeCBlYWNoIHBsYWNlIHdoZXJlIGNwdV90b19ub2RlIGlzIHVzZWQgCj4gdG9vIGVh
cmx5LgoKb2theSwgSSB3aWxsIHRyeSB0byBkbyBpdC4KCgpUaGFua3MKCkh1YW5nIFNoaWppZQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
