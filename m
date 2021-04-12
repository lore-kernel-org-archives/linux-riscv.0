Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B318C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 09:46:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A532A611AD
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 09:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A532A611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xEhTktwKr03KEj0oW0Uftlr5DgKRDLWcdDXuiZPyVmA=; b=lVn6Mn1i1mVlbofsyU764BIKb
	nQoobEyazNLrLFcE1ukujRwH7G/o7ZpK8VwKk5k7iZz+/YP8HIaMIbztBFPoDp0kINFrdjPy9tnTd
	/l9jVyebKX26X2x6IhyzTGORewruQgoj4gmqAwlsy0yMX1X9zed7CrzIa+Rdey666qB4CR056LX4H
	a8+TNbn+8JGjmS8FSnmGT58ZhRX5SXz03BoxRfinUO8LmAm/uQsNWfCElcbpvQP40Lw8k5bAD4gz3
	KARZrbQbLjoC7GBn4elgldtMg7xKSycD3V5wk3O+D3rPZnooNfsZZe3YsSq+OALMah52wYuJ3qFYO
	UmMurDBBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVt9G-006LFm-Hs; Mon, 12 Apr 2021 09:46:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVt5w-006KJu-4G
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 09:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=WLNtCqzXzIp4Lmsi7SVcrQMWzDBgGfFv0Fy9YpWj6rk=; b=oORuMo2GvRdebJ1yZfbxcYS+b2
 7Cs3HOLKk5L2PwCAfbU1h2kAPgHE9cJVD8LZmBGzojEAIO+3cO13OR62t6hNbn4YOCo8FQ/34YgbD
 WTzQG5bvegC/Sz/rubEkCiti2HK2BjiqCHyyuRitZagyOAE7spW0AB2Mo5cnBy8mrNx+6HyYHEeLI
 UDSEUvgwreaT3fCdOWXvSfoF46oCofTIWMKBZ+N+T4o088u1fESBxPoOyRAtrgg75u//nLijhJbRu
 WRrLaxlay9mRlI9SIuiVsdOm8Ss2grXhRqdfRmlyvPJ52o/Aj0STy8oiwhDHHVQIfxt/iGLlLz+rD
 MH3rqPQg==;
Received: from mail-dm6nam12on2084.outbound.protection.outlook.com
 ([40.107.243.84] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVt5r-0065C7-QC
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 09:42:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHfJkZIQjrYkAK8XQSl0uygvIgnDfJ4YmFAmRaP+4xyQeM+zthA9QZ8n1OxsUG/4/ZQhoyPY5VGSxqcxqt5jcyvLLm0nL59useyLtHL8bWOr80kIfxPJkC/t2xHwghwuzH6LsflXZW8EPsi5bB//ddRBy8WgTbLjFf1Hk+/Ah5p7mtG6G5MecAzhxWmVGXYqOJeXSxMRWTxXRoDnBgONUQcUw6ztqgGHEq5Zw6VMGY8Z6VMFlu38uH7qZA85kMl8P1cljX5x6EIZYuW3ajMkULK80F1sicebixbI2fw4J1StptL7XMuULb0VK6MpT3V277RtD8foSmjvifPw73Gt5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLNtCqzXzIp4Lmsi7SVcrQMWzDBgGfFv0Fy9YpWj6rk=;
 b=P3ziMEp+q1MlFUUXmmcp+S1+2bQwjqk3AJyyWJTWAk6Ijep32HAzIv7yLQWc9V7X3ePDFf30jqsBHc4FZY42qA6mzIIHq/16fWOE3mkyzeuHxpnInAl4sVHt9U4M/6T8RGlC4ksJ0+TJzrrz2Z9kgYDtfT1SaCD3KCDZ+Mm9XtM/IsxWOia3SH+xitJJH83mebc3t+nD5nnU3QN+HjyfoOrNpb0gex2+kOH+kgqneNxl/NZguv2mjjagkAtg84QnGwpq5yHkdICKcUULZXTx9G5o/JBdzKJ5gpECrP2Cgxn6qdZNbqAH+KwUBrM37Rrz9mLMHtfQfzV9/vkHEVf3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLNtCqzXzIp4Lmsi7SVcrQMWzDBgGfFv0Fy9YpWj6rk=;
 b=AfAAM11foseS8Xpk3rxqZSxBcTikVZz1JSNSmzW6BtTAdztDceRbxMovBlLuHOMuBNOEc0TDmgdzwxIvSVNyy6FV2/MgL9PSELnCrP+u8xzqtljOiK70s7qeCv3eEPzPCO+01Wy1rniyBKuSsdCnWui8Zmi68n7ytP0HBGm4I2w=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=synaptics.com;
Received: from BY5PR03MB5345.namprd03.prod.outlook.com (2603:10b6:a03:219::16)
 by SJ0PR03MB5504.namprd03.prod.outlook.com (2603:10b6:a03:28a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Mon, 12 Apr
 2021 09:42:53 +0000
Received: from BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72]) by BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72%8]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 09:42:53 +0000
Date: Mon, 12 Apr 2021 17:42:45 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: "liaochang (A)" <liaochang1@huawei.com>
Cc: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <guoren@linux.alibaba.com>, <mhiramat@kernel.org>,
 <penberg@kernel.org>, <lkp@intel.com>, <me@packi.ch>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv/kprobe: fix kernel panic when invoking sys_read
 traced by kprobe
Message-ID: <20210412174245.75f0f717@xhacker.debian>
In-Reply-To: <2aed1884-39d5-4573-71c7-89f805a8a92e@huawei.com>
References: <20210330081848.14043-1-liaochang1@huawei.com>
 <20210408192040.746b0fcc@xhacker.debian>
 <2aed1884-39d5-4573-71c7-89f805a8a92e@huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: BY5PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:180::37) To BY5PR03MB5345.namprd03.prod.outlook.com
 (2603:10b6:a03:219::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 BY5PR13CA0024.namprd13.prod.outlook.com (2603:10b6:a03:180::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.8 via Frontend
 Transport; Mon, 12 Apr 2021 09:42:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6941c3c-b97e-42b8-1aa1-08d8fd9757c4
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5504:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5504C788F6CFBC565015F9B0ED709@SJ0PR03MB5504.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RSmI2p5ALAFKO7O/NkDllLm+oIjIkAKOclesCTvFjtVnyZlSmwZVJOqsvtgUteViJ6Y0Ry+cuu5P4gwzr8V10wZOKFyG4PIRv8jzPrckARRUY5JeXFuhwoYCWuovyS1pO1pw1/oIiQO1224KMz36Pm4zcGZ5Cz2iYwicjXer8eRQ9pppHJi3oglLIOR66j0oM3LUGTjKHu4a6jxJi/amr9AVBVq3cpnXK64HyBNH3ReRiHFSQtL++LqRPZjCikig8pDAgoGhfGetuHEDGhNxbKTO8UQDuyKqqvYeZo+tlwn2191CduwRsC23zN32N9SLjZ/kZwmbeDfO2fH2cHt7z1ECwYM9xbgmbDYbWMX1d+Z3ov7IFlsO/rD5gm8wJ4+4sLWMWGy1WL68HEH64hiOmeAcV0goCb1gntPpAsstzimcaUMHOD8Xvxz9mlkoL6RwzZCajf0VY72m78AjQrEFvkze/idhz5FS+Dd4WXJgQBL9ee4xyUmZos3DrqCtDfQlm9ka2mL2fzTUynzHtPjpOD9SFDE/d5Lv8PrYpiXUnzDh4ridWMGL670QMajVsKuiY9IT8kPqbDJUQm8782RhjztrTWog4DcBqLyDv4JwjqGKvvDQW/ZWmIGo1Glic9qzkx1r1C7x3C4FMiiZVeICmaqkjRimqQXO0Re3tMqwr28=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5345.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39860400002)(136003)(346002)(396003)(86362001)(38100700002)(2906002)(9686003)(4326008)(7696005)(52116002)(45080400002)(66946007)(1076003)(956004)(38350700002)(55016002)(6666004)(316002)(478600001)(16526019)(186003)(66556008)(6506007)(83380400001)(7416002)(6916009)(66476007)(26005)(8676002)(8936002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WUVBaEZnMUlzcW5tL2MreGpWNTdPeDNFb0ZObWhaMkduTXdKM2Q2RkRmbCtF?=
 =?utf-8?B?MzlDRXIrdmVGY1RkSFUyWnZkS1JIQXNQUXplYzlFbFJ0akZXM2NpZE1VNHBj?=
 =?utf-8?B?NjhYMkJmVTBzTkZnUllZeXhFam5GOUliWjBVdUltYVZqd1pmdmdGK0VBVFM1?=
 =?utf-8?B?RkRzSm9MOWRPMVlzUWtvbVE3WjUzbk5BV0Q4VGtmSmw1SWh0ZmlkUHJtUVhS?=
 =?utf-8?B?TnRIOVo2eWsxaFB4Njd0UUpoU2VqbFZibUFwZGZQMlRPeUdMNnNSUHJHUDZQ?=
 =?utf-8?B?UENYbktVRmFMNVVIdVNNemJhZThXdkMzR3RtdkR3U1V4aTBXckg4aFZ0SEVE?=
 =?utf-8?B?VUN6SC9USnRRbkJST3p1bjJqeU44ZEwrY04vMDFpS2U5d1ZYWGFsaHpaa1BK?=
 =?utf-8?B?a3Y5d1lhT0N3K2RlYU9RRW1hYnA2QjFXOUFXMWVPajc3WWI0VGFiSmJZWVkz?=
 =?utf-8?B?OGlsM1Z6ckQ5UHJZVU4xeGJ4d0VGd2U5QmFNTVJPZjhDcXNkS2xjUU9FTzZw?=
 =?utf-8?B?eVpYdnZOdlhkbkRINmVnVDQ1NEVGNndBcUQzS3I1TnRMNm54NmFTaTlFeDNF?=
 =?utf-8?B?dHFtNDJzM0YreWNzZGpaSVBETUdWSkI3bG4vNDdHYlRnVTJlZStJcEZaSWpm?=
 =?utf-8?B?SXVGU2h6YlB0NU5Gbkg2WFdqdUtlT3I4OTcybS8zam1CZmFEZHZ6S1hJb3l1?=
 =?utf-8?B?UExNMW0zNURQaHQzZ3dzb2dNb0RoY0ViQXBLREczVFRzVi8yUXZkbzNVaGhw?=
 =?utf-8?B?MmZwTUUxSW5aYnRXQ1lJY0FPZXR4QklDNXErMnJrdkNFQkJQQzJ0a2VXUWRG?=
 =?utf-8?B?ekFVbTFHVUU3MXhpdGlUamtoQzJEYy84a3dpYkorU3laVFRqNTZyUVJFZTdy?=
 =?utf-8?B?R3VPU0pOODhITi9Ea0tsYkRZa3FaUXlmT29QYVNiem1DNXBweVR2SEpaT3JB?=
 =?utf-8?B?VXFXM3dzYTk4NGZHUjFvam5FaHdudVhoMUk0clhjdmRaWExzNFdkbWUxUHNB?=
 =?utf-8?B?Q0NBS2ExL3pwODJUVnRuOVBmRXZKdW1uU0dtYjh3bGtwVG84aHM2ajVvWWkr?=
 =?utf-8?B?cDBNY2MrR2RENjhBK09qQkdqUFFtTldsVGRhb0oraWdoQnFKUVZXL3B2UzRR?=
 =?utf-8?B?SmxtdnlKaFd6V3pJby9XaHJhMzU2Qmp4OGt3RFlJOHRVUDFmQURHcG15MmdB?=
 =?utf-8?B?QmlWa01JV0JMMjhRVWpUNWh0Z1YwVElFa1NWc0J3ay9oV1NpM2hCcmhtVDNx?=
 =?utf-8?B?T3dyMlFsMWppa01jYmRHeXhsYVZscGp0bmpjNzdvSzV0eVgrblhaNXFIbjU3?=
 =?utf-8?B?L3lQbWd4cWpQWGFoZUlLTjJ5NjhHeW83U1FuMEkyTllhSXMxeXRvWDcvVWxh?=
 =?utf-8?B?WUJNN2Q5MkpoQlF5bG5jVVMwRTloejBSMVoreW8yK0dpY2g3Z3lHWVJaTSs1?=
 =?utf-8?B?ZHMrU0s0QTBOL1ozZW5uYi83eER2THJsamQ1NDliaStQbkpkcU93VkpRUDky?=
 =?utf-8?B?cFBhM0dGdEE2bUNZZlp0cEFJU1d3M3JTSXFWc0t0ZCtNUm92bHo2T0tzb3RW?=
 =?utf-8?B?WG5DVDFzYXV5M0cxSjF5M3UwbWt1aTFHbldCc3JwOTBNbHRZWmxyc2tReGxx?=
 =?utf-8?B?WlUwM0N1M3RlTWQ3a21LdXd5eE1BdWFNRStlQ2R0NVhqeEVlZnFDMk85ckth?=
 =?utf-8?B?ejBBMkxqTzllQ1hYVHhLbHRkTFgrc3djdzhpaTQrc3F1UGNBL2ZVdjBWVU1U?=
 =?utf-8?Q?FPsg++oLjmz+Y31eB22LMBJaGpJlMyARqW8B4Xd?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6941c3c-b97e-42b8-1aa1-08d8fd9757c4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5345.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 09:42:53.0280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GYQJCfpuOLDqi8RCCpZkIPYx1Qg6l2aByYnGHwkOcQn6NMQ7EbZEC/BhBc7M/d42wOwgBGakT3ofWDfjGfFoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5504
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_024255_883868_6E96140C 
X-CRM114-Status: GOOD (  24.05  )
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

T24gRnJpLCA5IEFwciAyMDIxIDEyOjE2OjI2ICswODAwCiJsaWFvY2hhbmcgKEEpIiA8bGlhb2No
YW5nMUBodWF3ZWkuY29tPiB3cm90ZToKCgo+IAo+IAo+IOWcqCAyMDIxLzQvOCAxOToyMCwgSmlz
aGVuZyBaaGFuZyDlhpnpgZM6Cj4gPiBPbiBUdWUsIDMwIE1hciAyMDIxIDE2OjE4OjQ4ICswODAw
Cj4gPiBMaWFvIENoYW5nIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+IHdyb3RlOgo+ID4KPiA+ICAK
PiA+Pgo+ID4+IFRoZSBleGVjdXRpb24gb2Ygc3lzX3JlYWQgZW5kIHVwIGhpdHRpbmcgYSBCVUdf
T04oKSBpbiBfX2ZpbmRfZ2V0X2Jsb2NrCj4gPj4gYWZ0ZXIgaW5zdGFsbGluZyBrcHJvYmUgYXQg
c3lzX3JlYWQsIHRoZSBCVUcgbWVzc2FnZSBsaWtlIHRoZSBmb2xsb3dpbmc6Cj4gPj4KPiA+PiBb
ICAgNjUuNzA4NjYzXSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiA+PiBb
ICAgNjUuNzA5OTg3XSBrZXJuZWwgQlVHIGF0IGZzL2J1ZmZlci5jOjEyNTEhCj4gPj4gWyAgIDY1
LjcxMTI4M10gS2VybmVsIEJVRyBbIzFdCj4gPj4gWyAgIDY1LjcxMjAzMl0gTW9kdWxlcyBsaW5r
ZWQgaW46Cj4gPj4gWyAgIDY1LjcxMjkyNV0gQ1BVOiAwIFBJRDogNTEgQ29tbTogc2ggTm90IHRh
aW50ZWQgNS4xMi4wLXJjNCAjMQo+ID4+IFsgICA2NS43MTQ0MDddIEhhcmR3YXJlIG5hbWU6IHJp
c2N2LXZpcnRpbyxxZW11IChEVCkKPiA+PiBbICAgNjUuNzE1Njk2XSBlcGMgOiBfX2ZpbmRfZ2V0
X2Jsb2NrKzB4MjE4LzB4MmM4Cj4gPj4gWyAgIDY1LjcxNjgzNV0gIHJhIDogX19nZXRibGtfZ2Zw
KzB4MWMvMHg0YQo+ID4+IFsgICA2NS43MTc4MzFdIGVwYyA6IGZmZmZmZmUwMDAxOWYxMWUgcmEg
OiBmZmZmZmZlMDAwMTlmNTZhIHNwIDogZmZmZmZmZTAwMjQzNzkzMAo+ID4+IFsgICA2NS43MTk1
NTNdICBncCA6IGZmZmZmZmUwMDBmMDYwMzAgdHAgOiBmZmZmZmZlMDAxNWFiYzAwIHQwIDogZmZm
ZmZmZTAwMTkxZTAzOAo+ID4+IFsgICA2NS43MjEyOTBdICB0MSA6IGZmZmZmZmUwMDE5MWUwMzgg
dDIgOiAwMDAwMDAwMDAwMDAwMDBhIHMwIDogZmZmZmZmZTAwMjQzNzk2MAo+ID4+IFsgICA2NS43
MjMwNTFdICBzMSA6IGZmZmZmZmUwMDE2MGFkMDAgYTAgOiBmZmZmZmZlMDAxNjBhZDAwIGExIDog
MDAwMDAwMDAwMDAwMDEyYQo+ID4+IFsgICA2NS43MjQ3NzJdICBhMiA6IDAwMDAwMDAwMDAwMDA0
MDAgYTMgOiAwMDAwMDAwMDAwMDAwMDA4IGE0IDogMDAwMDAwMDAwMDAwMDA0MAo+ID4+IFsgICA2
NS43MjY1NDVdICBhNSA6IDAwMDAwMDAwMDAwMDAwMDAgYTYgOiBmZmZmZmZlMDAxOTFlMDAwIGE3
IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4+IFsgICA2NS43MjgzMDhdICBzMiA6IDAwMDAwMDAwMDAw
MDAxMmEgczMgOiAwMDAwMDAwMDAwMDAwNDAwIHM0IDogMDAwMDAwMDAwMDAwMDAwOAo+ID4+IFsg
ICA2NS43MzAwNDldICBzNSA6IDAwMDAwMDAwMDAwMDAwNmMgczYgOiBmZmZmZmZlMDAyNDBmODAw
IHM3IDogZmZmZmZmZTAwMGYwODBhOAo+ID4+IFsgICA2NS43MzE4MDJdICBzOCA6IDAwMDAwMDAw
MDAwMDAwMDEgczkgOiAwMDAwMDAwMDAwMDAwMTJhIHMxMDogMDAwMDAwMDAwMDAwMDAwOAo+ID4+
IFsgICA2NS43MzM1MTZdICBzMTE6IDAwMDAwMDAwMDAwMDAwMDggdDMgOiAwMDAwMDAwMDAwMDAw
M2ZmIHQ0IDogMDAwMDAwMDAwMDAwMDAwZgo+ID4+IFsgICA2NS43MzQ0MzRdICB0NSA6IDAwMDAw
MDAwMDAwMDAzZmYgdDYgOiAwMDAwMDAwMDAwMDQwMDAwCj4gPj4gWyAgIDY1LjczNDYxM10gc3Rh
dHVzOiAwMDAwMDAwMDAwMDAwMTAwIGJhZGFkZHI6IDAwMDAwMDAwMDAwMDAwMDAgY2F1c2U6IDAw
MDAwMDAwMDAwMDAwMDMKPiA+PiBbICAgNjUuNzM0OTAxXSBDYWxsIFRyYWNlOgo+ID4+IFsgICA2
NS43MzUwNzZdIFs8ZmZmZmZmZTAwMDE5ZjExZT5dIF9fZmluZF9nZXRfYmxvY2srMHgyMTgvMHgy
YzgKPiA+PiBbICAgNjUuNzM1NDE3XSBbPGZmZmZmZmUwMDAyMDAxN2E+XSBfX2V4dDRfZ2V0X2lu
b2RlX2xvYysweGIyLzB4MmY2Cj4gPj4gWyAgIDY1LjczNTYxOF0gWzxmZmZmZmZlMDAwMjAxYjZj
Pl0gZXh0NF9nZXRfaW5vZGVfbG9jKzB4M2EvMHg4YQo+ID4+IFsgICA2NS43MzU4MDJdIFs8ZmZm
ZmZmZTAwMDIwMzM4MD5dIGV4dDRfcmVzZXJ2ZV9pbm9kZV93cml0ZSsweDJlLzB4OGMKPiA+PiBb
ICAgNjUuNzM1OTk5XSBbPGZmZmZmZmUwMDAyMDM1N2E+XSBfX2V4dDRfbWFya19pbm9kZV9kaXJ0
eSsweDRjLzB4MThlCj4gPj4gWyAgIDY1LjczNjIwOF0gWzxmZmZmZmZlMDAwMjA2YmIwPl0gZXh0
NF9kaXJ0eV9pbm9kZSsweDQ2LzB4NjYKPiA+PiBbICAgNjUuNzM2Mzg3XSBbPGZmZmZmZmUwMDAx
OTI5MTQ+XSBfX21hcmtfaW5vZGVfZGlydHkrMHgxMmMvMHgzZGEKPiA+PiBbICAgNjUuNzM2NTc2
XSBbPGZmZmZmZmUwMDAxODBkZDI+XSB0b3VjaF9hdGltZSsweDE0Ni8weDE1MAo+ID4+IFsgICA2
NS43MzY3NDhdIFs8ZmZmZmZmZTAwMDEwZDc2Mj5dIGZpbGVtYXBfcmVhZCsweDIzNC8weDI0Ngo+
ID4+IFsgICA2NS43MzY5MjBdIFs8ZmZmZmZmZTAwMDEwZDgzND5dIGdlbmVyaWNfZmlsZV9yZWFk
X2l0ZXIrMHhjMC8weDExNAo+ID4+IFsgICA2NS43MzcxMTRdIFs8ZmZmZmZmZTAwMDFmNWQ3YT5d
IGV4dDRfZmlsZV9yZWFkX2l0ZXIrMHg0Mi8weGVhCj4gPj4gWyAgIDY1LjczNzMxMF0gWzxmZmZm
ZmZlMDAwMTYzZjJjPl0gbmV3X3N5bmNfcmVhZCsweGUyLzB4MTVhCj4gPj4gWyAgIDY1LjczNzQ4
M10gWzxmZmZmZmZlMDAwMTY1ODE0Pl0gdmZzX3JlYWQrMHhjYS8weGYyCj4gPj4gWyAgIDY1Ljcz
NzY0MV0gWzxmZmZmZmZlMDAwMTY1YmFlPl0ga3N5c19yZWFkKzB4NWUvMHhjOAo+ID4+IFsgICA2
NS43Mzc4MTZdIFs8ZmZmZmZmZTAwMDE2NWMyNj5dIHN5c19yZWFkKzB4ZS8weDE2Cj4gPj4gWyAg
IDY1LjczNzk3M10gWzxmZmZmZmZlMDAwMDAzOTcyPl0gcmV0X2Zyb21fc3lzY2FsbCsweDAvMHgy
Cj4gPj4gWyAgIDY1LjczODg1OF0gLS0tWyBlbmQgdHJhY2UgZmU5M2Y5ODU0NTZjOTM1ZCBdLS0t
Cj4gPj4KPiA+PiBBIHNpbXBsZSByZXByb2R1Y2VyIGxvb2tzIGxpa2U6Cj4gPj4gICAgICAgICBl
Y2hvICdwOm15cHJvYmUgc3lzX3JlYWQgZmQ9JWEwIGJ1Zj0lYTEgY291bnQ9JWEyJyA+IC9zeXMv
a2VybmVsL2RlYnVnL3RyYWNpbmcva3Byb2JlX2V2ZW50cwo+ID4+ICAgICAgICAgZWNobyAxID4g
L3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9ldmVudHMva3Byb2Jlcy9teXByb2JlL2VuYWJsZQo+
ID4+ICAgICAgICAgY2F0IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvdHJhY2UKPiA+PiAgCj4g
Pgo+ID4gSSBjYW4ndCByZXByb2R1Y2UgdGhlIEJVR19PTiB3aXRoIHRoZSBhYm92ZSBzdGVwLCBJ
IG1heSBtaXNzIHNvbWV0aGluZy4KPiA+ICAKPiBNeSB0ZXN0IHBsYXRmb3JtIHZlcnNpb25zCj4g
S2VybmVsOiAwZDAyZWM2YjMxMzYgTGludXggNS4xMi1yYzQKPiBRRU1VOiBmZGQ3NmZlY2RkIFVw
ZGF0ZSB2ZXJzaW9uIGZvciB2NS4wLjAgcmVsZWFzZQo+IAo+ID4+IEhlcmUncyB3aGF0IGhhcHBl
bnMgdG8gaGl0IHRoYXQgQlVHX09OKCk6Cj4gPj4KPiA+PiAxKSBBZnRlciBpbnN0YWxsaW5nIGtw
cm9iZSBhdCBlbnRyeSBvZiBzeXNfcmVhZCwgdGhlIGZpcnN0IGluc3RydWN0aW9uCj4gPj4gICAg
aXMgcmVwbGFjZWQgYnkgJ2VicmVhaycgaW5zdHJ1Y3Rpb24gb24gcmlzY3Y2NCBwbGF0Zm9ybS4K
PiA+Pgo+ID4+IDIpIE9uY2Uga2VybmVsIHJlYWNoIHRoZSAnZWJyZWFrJyBpbnN0cnVjdGlvbiBh
dCB0aGUgZW50cnkgb2Ygc3lzX3JlYWQsCj4gPj4gICAgaXQgdHJhcCBpbnRvIHRoZSByaXNjdiBi
cmVha3BvaW50IGhhbmRsZXIsIHdoZXJlIGl0IGRvIHNvbWV0aGluZyB0bwo+ID4+ICAgIHNldHVw
IGZvciBjb21pbmcgc2luZ2xlLXN0ZXAgb2Ygb3JpZ2luIGluc3RydWN0aW9uLCBpbmNsdWRpbmcg
YmFja3VwCj4gPj4gICAgdGhlICdzc3RhdHVzJyBpbiBwdF9yZWdzLCBmb2xsb3dlZCBieSBkaXNh
YmxlIGludGVycnVwdCBkdXJpbmcgc2luZ2xlCj4gPj4gICAgc3RlcHBpbmcgdmlhIGNsZWFyICdT
SUUnIGJpdCBvZiAnc3N0YXR1cycgaW4gcHRfcmVncy4KPiA+Pgo+ID4+IDMpIFRoZW4ga2VybmVs
IHJlc3RvcmUgdG8gdGhlIGluc3RydWN0aW9uIHNsb3QgY29udGFpbnMgdHdvIGluc3RydWN0aW9u
cywKPiA+PiAgICBvbmUgaXMgb3JpZ2luYWwgaW5zdHJ1Y3Rpb24gYXQgZW50cnkgb2Ygc3lzX3Jl
YWQsIHRoZSBvdGhlciBpcyAnZWJyZWFrJy4KPiA+PiAgICBIZXJlIGl0IHRyaWdnZXIgYSAnSW5z
dHJ1Y3Rpb24gcGFnZSBmYXVsdCcgZXhjZXB0aW9uICh2YWx1ZSBhdCAnc2NhdXNlJwo+ID4+ICAg
IGlzICcweGMnKSwgaWYgUEYgaXMgbm90IGZpbGxlZCBpbnRvIFBhZ2VUYWJlIGZvciB0aGF0IHNs
b3QgeWV0Lgo+ID4+Cj4gPj4gNCkgQWdhaW4ga2VybmVsIHRyYXAgaW50byBwYWdlIGZhdWx0IGV4
Y2VwdGlvbiBoYW5kbGVyLCB3aGVyZSBpdCBjaG9vc2UKPiA+PiAgICBkaWZmZXJlbnQgcG9saWN5
IGFjY29yZGluZyB0byB0aGUgc3RhdGUgb2YgcnVubmluZyBrcHJvYmUuIEJlY2F1c2UKPiA+PiAg
ICBhZnRlIDIpIHRoZSBzdGF0ZSBpcyBLUFJPQkVfSElUX1NTLCBzbyBrZXJuZWwgcmVzZXQgdGhl
IGN1cnJlbnQga3Byb2JlCj4gPj4gICAgYW5kICdwYycgcG9pbnRzIGJhY2sgdG8gdGhlIHByb2Jl
IGFkZHJlc3MuCj4gPj4KPiA+PiA1KSBCZWNhdXNlICdlcGMnIHBvaW50IGJhY2sgdG8gJ2VicmVh
aycgaW5zdHJ1dGlvbiBhdCBzeXNfcmVhZCBwcm9iZSwKPiA+PiAgICBrZXJuZWwgdHJhcCBpbnRv
IGJyZWFrcG9pbnQgaGFuZGxlciBhZ2FpbiwgYW5kIHJlcGVhdCB0aGUgb3BlcmF0aW9ucwo+ID4+
ICAgIGF0IDIpLCBob3dldmVyICdzc3RhdHVzJyB3aXRob3V0ICdTSUUnIGlzIGtlZXAgYXQgNCks
IGl0IGNhdXNlIHRoZQo+ID4+ICAgIHJlYWwgJ3NzdGF0dXMnIHNhdmVkIGF0IDIpIGlzIG92ZXJ3
cml0dGVuIGJ5IHRoZSBvbmUgd2l0aG91ICdTSUUnLiAgCj4gPgo+ID4gSXMga3Byb2JlX3Npbmds
ZV9zdGVwX2hhbmRsZXIoKSBoYW5kbGVkIGZpcnN0bHkgdGhpcyB0aW1lPyB0aHVzIHdlIHdvbid0
Cj4gPiBlbnRlciBrcHJvYmVfYnJlYWtwb2ludF9oYW5kbGVyKCkuCj4gPiAgCj4gTm8sYmVjYXVz
ZSB0aGlzIHRpbWUga2NiLT5zcy5jdHgubWF0Y2hfYWRkciBwb2ludHMgdG8gdGhlIHNpbmdsZS1z
dGVwIHNsb3QsYnV0Cj4gaW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdzKSBwb2ludHMgdG8gdGhlIGZp
cnN0IGluc3RydWN0aW9uIG9mIHN5c19yZWFkKCdlYnJlYWsnKQo+IHNvIHRoZSBjb25kaXRpb24g
aXMgbm90IHRva2VuIGV2ZW50dWFsbHksIHRoZW4gd2UgZW50ZXIga3Byb2JlX2JyZWFrcG9pbnRf
aGFuZGxlcigpLgo+IAo+IGJvb2wgX19rcHJvYmVzCj4ga3Byb2JlX3NpbmdsZV9zdGVwX2hhbmRs
ZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gewo+ICAgICAgICAgc3RydWN0IGtwcm9iZV9jdGxi
bGsgKmtjYiA9IGdldF9rcHJvYmVfY3RsYmxrKCk7Cj4gCj4gICAgICAgICBpZiAoKGtjYi0+c3Nf
Y3R4LnNzX3BlbmRpbmcpCj4gICAgICAgICAgICAgJiYgKGtjYi0+c3NfY3R4Lm1hdGNoX2FkZHIg
PT0gaW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdzKSkpIHsKPiAKClRoYW5rcyBmb3IgdGhlIGluZm9y
bWF0aW9uLiBJbnNwaXJlZCBieSB0aGlzIHBhdGNoLCBJIHRoaW5rIGFybTY0IGFsc28KaGFzIHRo
ZSBzaW1pbGFyIGlzc3VlLiBJIHdpbGwgc2VuZCBvdXQgYSBzaW1pbGFyIHBhdGNoIGZvciBhcm02
NC4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
