Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5ECC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 11:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U10zbeVRFVM7BJ8scT/uJ9rE3mRrHLuTTnpA8LcAZCk=; b=pIJqBHVB/FlOx4cdh/exucFUZ7
	kN5gUs2vEs6mlOsN2sQRsdLVO5ENQe3s6BBSFe4FHoiE7NYiFUcLSnPCZUdshrvEj2ZwUWhXoTKgH
	qQKfVDBKgmESV9yo3Ir/QQlm7E1pPOEgdGcpRoyMVHDjJVztXsY6FDB9dFwoX31787P33Cwce6vcg
	98wIkcq/R6sryv914e0T9GdOLz5Ao2drNkRCfVAUz6B+LZw6G7l/c6+CtfnfZchRyTDA6r2dTEOcr
	OJL6tNxXad1pAvjllDGBqqT1DXRMcSPUtRVncdPa3cf58MfjmxQJ+q9AbZR13TtXjqbPiLNFxMp4Y
	f/PVHEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8MD-00000002x5O-3AaY;
	Wed, 31 Jan 2024 11:02:17 +0000
Received: from smtpout37.security-mail.net ([85.31.212.37])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV7HK-00000002aom-49EG
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 09:53:13 +0000
Received: from localhost (localhost [127.0.0.1])
	by fx301.security-mail.net (Postfix) with ESMTP id 5F9D59ECBD7
	for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 10:53:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
	s=sec-sig-email; t=1706694785;
	bh=n3uXrrzzWaWWDlrViIwRreUQvbzXibng4An8pHcosoE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=C72om1JJ0NN5DvK7v0pUWOsunocLJmcc7UM8seT9u4GIoQWSzxO+MR8pjYsCwCROV
	 u97CVsfXLB7OECKEA8IxwAnidmViN7S/4XM7DbFN+rsAIYZavvwssqscQNYoo95U1/
	 C2RVy2fWYt/kCSjZMRQ4uTj5AtUjTcqWEDJqvf4k=
Received: from fx301 (localhost [127.0.0.1]) by fx301.security-mail.net
 (Postfix) with ESMTP id B17AD9EC9D5; Wed, 31 Jan 2024 10:53:04 +0100 (CET)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0100.outbound.protection.outlook.com [104.47.25.100]) by
 fx301.security-mail.net (Postfix) with ESMTPS id F29C99ECD8E; Wed, 31 Jan
 2024 10:53:03 +0100 (CET)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by MR1P264MB1908.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Wed, 31 Jan
 2024 09:53:02 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1300:32a9:2172:a2a]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1300:32a9:2172:a2a%7]) with mapi id 15.20.7249.024; Wed, 31 Jan 2024
 09:53:02 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <13599.65ba187f.f1ba6.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U79dQDTEBjwqiCFZ78Vyc7MfRTY4cumqMgNo+TfllVxy4Tn9JENnZ6a17EWfHHIaaVQfQ1f22nQ+ORyf2i8yiD+Z8G8ES7O4zSt6tAP0yahA98PAnsRvS1isWRdBDnb2c/aiZtJBntuEhW4c2dM2miWZxr3uEzSzP0ci2wDj3dfxjConL6/dvy35vUG5ADDG+yy8OImcO3TQ9JmbtaCRpXodT2ylofnGbkaeaufWDL0CXjXLJR4OPLiOpWvLoJ4XfqvDJ/5f7H/dys/FNNEaA7DbFJUbJb+swJMpIjg6ZYQdsnWUEs2iAuiUPZ1uDx3Jt8eIo/4lRptpXqNLDv63JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qYdWYzfUcnoQWYfh/DWYXPiPJlj2xh/vdvzaU9qDf4=;
 b=GmYxeP44j6y7MnL9fxcFfU/o2Z3xHhB/013FQOrvTsbjPobzqWsbpZmsK3ijnnQxf0eI5qTO8HqBj5HljJQacmdVFaUDY41wbXC0yRxJQqd1AfGeI6jehNFmZ210A+m1S/GwypUV/FhVJyY1b8yYSWuZMWb+6N0HXZMOVeHFMiBjV4t5wOOcuyc4kBzuUzH8EShddyNZZ/0tAUl1SwwNlN7pPSu1O+r3I/XtdYwl8O7IFW4tMrn/lqE8p8aahFKpdK1keBrwZfCOltj/AdkizVu2d0vZ6q1T86kiIZdrgKcKxtRJWx6Rn2sm3Qrv1aw6zB/X8NErwYrnq63UbcCUmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qYdWYzfUcnoQWYfh/DWYXPiPJlj2xh/vdvzaU9qDf4=;
 b=fFUl5Gz6NCqbTByjbL0OUFRPg8nxlADMd+5CjiILMQqJQNvWf57nZfkaW9YOUAuauigTpI6/XiXlPf3VFxQ3KoYuxl+ZA83EJxKCUcURiRE4+i140WWofOsZDqfus4AtNAtnZ8XustfnVaGEjgL0DBzCDZ/4qTpdjw8PnAvvl8luztV3XUQeCZMQYHHDsYrjMVwdzVy8i9GpmjXIoq8BffQy8zpns1HxfbN5VD9gycb5rTSeKa06jCOPXe+6SIFOAigzD2TQi8X2kYS3K3QwSbj82NGnh3t354g08ZwRMlKuIpcalyAAcX0PxqWNkiqe2fOtUOeOZXnDcsvelYVBMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <269edff0-d989-4ac8-b0c3-bce31283806b@kalrayinc.com>
Date: Wed, 31 Jan 2024 10:52:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 31/31] kvx: Add IPI driver
Content-Language: en-us, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yann Sionneau
 <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet
 <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Mark
 Rutland <mark.rutland@arm.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>, Eric
 Paris <eparis@redhat.com>, Christian Brauner <brauner@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jules Maselbas <jmaselbas@kalray.eu>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>, Clement Leger
 <clement@clement-leger.fr>, Vincent Chardon
 <vincent.chardon@elsys-design.com>, Marc =?utf-8?b?UG91bGhpw6hz?=
 <dkm@kataplop.net>, Julian Vetter <jvetter@kalray.eu>, Samuel Jones
 <sjones@kalray.eu>, Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis
 <tcostis@kalray.eu>, Marius Gligor <mgligor@kalray.eu>, Jonathan Borne
 <jborne@kalray.eu>, Julien Villette <jvillette@kalray.eu>, Luc Michel
 <lmichel@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet
 <jhascoet@kalray.eu>, Jean-Christophe Pince <jcpince@gmail.com>, Guillaume
 Missonnier <gmissonnier@kalray.eu>, Alex Michon <amichon@kalray.eu>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <git@xen0n.name>, Shaokun Zhang
 <zhangshaokun@hisilicon.com>, John Garry <john.garry@huawei.com>, Guangbin
 Huang <huangguangbin2@huawei.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Qi Liu <liuqi115@huawei.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark
 Brown <broonie@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Alexey
 Dobriyan <adobriyan@gmail.com>, Julian Vetter <jvetter@kalrayinc.com>,
 jmaselbas@zdiv.net
Cc: Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-audit@redhat.com, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-32-ysionneau@kalray.eu>
 <995eb624-3efe-10fc-a6ed-883d52d591bb@linaro.org>
From: Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <995eb624-3efe-10fc-a6ed-883d52d591bb@linaro.org>
X-ClientProxiedBy: PA7P264CA0309.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:395::10) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|MR1P264MB1908:EE_
X-MS-Office365-Filtering-Correlation-Id: e310339f-977f-4e5d-50dd-08dc22426a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zY3OBspCqhZ7BPk4QYArZqQWGq1NNy94C0x7+KA8xUJotEwy8iPZFmmTgy+K44yfZnfUhZJoImM0Vw6dMkKKZqYnxhF1QoSD7Ar819xSS7+6nOZPrBsmcbRha+o6bzxYeNYTHrmS4NP9/TEr/nL+pRGdd6zQbT1no8poVJMm/2TjuA5P0FQUt7/GopTuXvpjrrEzMHVe2MUd7fP+0WuQllXQo40mkBelxX4TCxPizSErnzf1vp3WSTdbt1nrE7oDPVecCeedB3YiW52tp/tgv9Q3XXRxdA6qFsc09nWi8iAMh6ILBum15fJGbjZgkMFozEtNvW3BqvNfwi5QwjIkRvHwUV3fT4LHkliBF8sbq+UA7j81JCxLt8+MeV+nlPPQdxcxx5ag18ihurvjD+9gUYx0TxW/HFXzPtimg74CYstI/GjO4NWASeyz3p7QF0TPdosIAZYTppirMoMJAZh7op96+nSvfHVpDyZArr9UcgEudEDGpirTtNggeDEpOT159S7IghNg0qjouSIp4VkND1aFsOagoLspd4bai9vljLgC+BsBuiDbEhm5W0fhmsPEYPJzJQ1vjrG+ECgD4rRdJfaKQLQo7fdAM6ivXKaBNgXNoCaQ3Fs5tgsXTG6b6uU0OYfUqUlgzo7WuB7eDhk5PJ6d0ATJ4njtD1TpxWGj7Kmy2CdaJwXUDymGbpZ3uj79
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39850400004)(366004)(396003)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(921011)(31686004)(2616005)(41300700001)(1191002)(966005)(316002)(66476007)(66556008)(36756003)(6512007)(478600001)(53546011)(6506007)(83380400001)(6486002)(6666004)(38100700002)(66946007)(31696002)(8936002)(5660300002)(7366002)(7406005)(7416002)(2906002)(110136005)(86362001)(4326008)(8676002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aPFlMx0h7/7NT0uP9FPvxJkJqKZTWGf2n8FZTBmMWdvmHPxy5lQwIYMLwNIa59JNDZabgLkcLIJ0EEOhocDk4nyF2NUCpqnlaCO/4sOXxyZRUpacuL0PL8xW5tbpXM9MSWHgbeQLe+ktpaL1mJAH9cmzrALd5bPBucagM2MXjSD9mbzXsMzRvCoSjqwDQAXWqydUCeUUhzOymSjMueo5aNqXZTvfDJiLqImF5ckxDTwQ9xrMznQ2XTTNgmQ/PhK+q6R8pT/+9ZtmHLqy5ffIVF1d6zvIAAaqKiSPWk834ihFHcLti+gmYY8VhXYlHOzsnfYeVivsjFRd8usmZ81jueL6Tm5fihc7whq8BdP+XtkUh7Xqk3QDvhgZlJUh/Yf2jiY34xyePrUnej/qTKYriz2hNLEiiYvxLcB3gBUj+EgHujcvBlK2HZF0g351pcEH2h/Pbe4mkb6ZTxlaGrrY+NgDu/F0h1jKoxCxGLt/ToCuF9QE0MXx4H/gRZReDqG6KobpTafoy6Kf37fumohI0KkLgqXc8RU7Sf5+FBxBoPuWRBHjy6cD0923dkpkv7TsTFw1gfFWek/WKI0OG+2j3LXvDMwSWEHa9wTIq5ZAaO14gF4DqqslgbAkDXSSDAp5avdZ8pOL4TBwr/9IOFG+pqxRpmjpviILylFY8jiOjIcUSVlEd664qBKmC1wRW4YD/TsTxlVJcY4Fqlozg9yJe0d+dUDXfWFgZle0OZSZAYC9gXJlmHXKL3B5nDx3CNFQHuflXd4hoDZvVNpJNCnBYxg2vAGXpE88cNEV2NhxBIUQl+dtakEYUjym7+eXSbTMl364AXnMUcy1jUFSHRz6JtDq+9wJ8gDyb0xMsai0ICXB0JoitDjBE7+RNw/ifKqmiIle6lw7YriVAM9a33wS4eNZHBDohPVy8FT1oOgIXLA6lG5LP1g57COeRmvvcopF
 c9DrDlSRGLr8B0/SbWvXyCj06yXj2KSucyXo7/ty+8AwREbNb1kQwF1n9Mxkin5BN9v7nWeqV78yQD5k6IL8y5AGMeQRzjDyXd1RlkBFcMwxl988h0dxWIl7iQbWdm7i+GnZ/44cacozvPD6yRt6D/o76k5dcpKefJYIWTkSq5/aSDR/MN4bS/TyVzuItYXjRmeotIiIQZuaZwXTDc97WojT869ftUCYfrJ7IT9R0xdYIemw5pAE4RN6eRA9GYaGU677L5F9RuDAn4kOIToq+gVzAUB11eaEMn2BOjHCmV3g9Le9UwfQiwVn1B4IyK7SvUwZUx7GOvVy+B5DBsAV00PPjUOssnoXD4dgTNpJlqzvbBXjNaPb82WIpGgOEpCFzGvOIhTHqumH+S2dvV9zbX1R/IJ7+7ns0h8JYOWOg+gNBwczmx6aIw9KvHNjTo37oWqMhSMETtL0hdJdZFlb5/he5rpa+UuqSmq59tPzqha/5iHKtwkUGNFG0AhB0gOpgx1BgQO5GMvcGUleS6jtpC/WOUF2S1NmLyf5j8G54l3uT1MPFsv7bUn/NzqPeHNppMvi6yuAGVtajuVZ2gXR4YzS6ZwDfXgkEIu2fdYUHklTwrY32dKetWwMjQ61zvGRkMeM2N7hzrHhR1KLhddCXyAm3A80T0gEmGGUwwMnTAJlkZNdGKSByVi3iX5SyZqa
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e310339f-977f-4e5d-50dd-08dc22426a1c
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 09:53:02.5194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqkoUnkmcthhkHleNpTEnFGg/mK1DRUeyozhbzc6IDZz5aj47WtMkzx4Cn9cge6BEaQDBueQDfVJJJLXoyaiGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1908
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_015311_323058_1D023D42 
X-CRM114-Status: GOOD (  25.54  )
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

SGVsbG8gS3J6eXN6dG9mLAoKT24gMjIvMDEvMjAyMyAxMjo1NCwgS3J6eXN6dG9mIEtvemxvd3Nr
aSB3cm90ZToKPiBPbiAyMC8wMS8yMDIzIDE1OjEwLCBZYW5uIFNpb25uZWF1IHdyb3RlOgo+PiAr
Cj4+ICtpbnQgX19pbml0IGt2eF9pcGlfY3RybF9wcm9iZShpcnFyZXR1cm5fdCAoKmlwaV9pcnFf
aGFuZGxlcikoaW50LCB2b2lkICopKQo+PiArewo+PiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7
Cj4+ICsJaW50IHJldDsKPj4gKwl1bnNpZ25lZCBpbnQgaXBpX2lycTsKPj4gKwl2b2lkIF9faW9t
ZW0gKmlwaV9iYXNlOwo+PiArCj4+ICsJbnAgPSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZShOVUxM
LCBOVUxMLCAia2FscmF5LGt2eC1pcGktY3RybCIpOwo+IE5vcGUsIGJpZyBuby4KPgo+IERyaXZl
cnMgZ28gdG8gZHJpdmVycywgbm90IHRvIGFyY2ggY29kZS4gVXNlIHByb3BlciBkcml2ZXIgaW5m
cmFzdHJ1Y3R1cmUuClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuCgpJdCByYWlzZXMgcXVlc3Rp
b25zIG9uIG91ciBzaWRlIGFib3V0IGhvdyB0byBoYW5kbGUgdGhpcyBjaGFuZ2UuCgpGaXJzdCBs
ZXQgbWUgZGVzY3JpYmUgdGhlIGhhcmR3YXJlOgoKVGhlIGNvb2xpZGdlIGlwaSBjb250cm9sbGVy
IGRldmljZSBoYW5kbGVzIElQSSBjb21tdW5pY2F0aW9uIGJldHdlZW4gY3B1cwppbnNpZGUgYSBj
bHVzdGVyLgoKRWFjaCBjcHUgaGFzIDggb2YgaXRzIGRlZGljYXRlZCBpcnEgbGluZXMgKDI0IHRv
IDMxKSBoYXJkLXdpcmVkIHRvIHRoZSBpcGkuClRoZSBpcGkgY29udHJvbGxlciBoYXMgOCBzZXRz
IG9mIDIgcmVnaXN0ZXJzOgotIGEgMTctYml0ICJpbnRlcnJ1cHQiIHJlZ2lzdGVyCi0gYSAxNy1i
aXQgIm1hc2siIHJlZ2lzdGVyCgpFYWNoIGNvdXBsZSBvZiByZWdpc3RlciBpcyBkZWRpY2F0ZWQg
dG8gMSBvZiB0aGUgOCBpcnFsaW5lcy4KRWFjaCBvZiB0aGUgMTcgYml0cyBvZiBpbnRlcnJ1cHQv
bWFzayByZWdpc3RlcgppZGVudGlmaWVzIGEgY3B1IChjb3JlcyAwIHRvIDE1ICsgc2VjdXJlX2Nv
cmUpLgpXcml0aW5nIGJpdCBpIGluIGludGVycnVwdCByZWdpc3RlciBzZW5kcyBhbiBpcnEgdG8g
Y3B1IGksIGFjY29yZGluZyB0byB0aGUgbWFzawppbiBtYXNrIHJlZ2lzdGVyLgpXcml0aW5nIGlu
IGludGVycnVwdC9tYXNrIHJlZ2lzdGVyIGNvdXBsZSBOIHRhcmdldHMgaXJxIGxpbmUgTiBvZiB0
aGUgY29yZS4KCi0gSXBpIGdlbmVyYXRlcyBhbiBpbnRlcnJ1cHQgdG8gdGhlIGNwdSB3aGVuIG1l
c3NhZ2UgaXMgcmVhZHkuCi0gTWVzc2FnZXMgYXJlIGRlbGl2ZXJlZCB2aWEgQXhpLgotIElwaSBk
b2VzIG5vdCBoYXZlIGFueSBpbnRlcnJ1cHQgaW5wdXQgbGluZXMuCgoKwqAgKy0tLS0tLS0tLS0t
LS0tLSvCoMKgIGlyccKgwqDCoMKgwqDCoCBheGlfdwrCoCB8wqDCoMKgwqDCoMKgwqDCoCB8wqAg
acKgIHw8LS0vLS0tIGlwaSA8LS0tLS0tCsKgIHwgQ1BVwqDCoMKgwqAgfMKgIG7CoCB8wqAgeDgK
wqAgfMKgIGNvcmUwwqAgfMKgIHTCoCB8CsKgIHzCoMKgwqDCoMKgwqDCoMKgIHzCoCBjwqAgfMKg
IGlyccKgwqDCoMKgwqDCoMKgwqDCoCBpcnHCoMKgwqDCoMKgwqDCoMKgIG1zaQrCoCB8wqDCoMKg
wqDCoMKgwqDCoCB8wqAgdMKgIHw8LS0vLS0tIGFwaWMgPC0tLS0tIG1ib3ggPC0tLS0tLS0KwqAg
fMKgwqDCoMKgwqDCoMKgwqAgfMKgIGzCoCB8wqAgeDQKwqAgKy0tLS0tLS0tLS0tLS0tLSsKwqAg
d2l0aCBpbnRjdGwgPSBjb3JlLWlycSBjb250cm9sbGVyCsKgwqAgwqAKCldlIGFuYWx5emVkIGhv
dyBvdGhlciBMaW51eCBwb3J0cyBhcmUgaGFuZGxpbmcgdGhpcyBzaXR1YXRpb24gKElQSSkgYW5k
IGhlcmUgYXJlIHNldmVyYWwgcG9zc2libGUgc29sdXRpb25zOgoKMS8gcHV0IGV2ZXJ5dGhpbmcg
aW4gc21wLmMgbGlrZSB3aGF0IGxvbmdhcmNoIGlzIGRvaW5nLgrCoCAqIEV4Y2VwdCB0aGF0IElQ
SSBpbiBsb25nYXJjaCBzZWVtcyB0byBpbnZvbHZlIHdyaXRpbmcgdG8gYSBzcGVjaWFsIHB1cnBv
c2UgQ1BVIHJlZ2lzdGVyIGFuZCBub3QgZG9pbmcgYSBtZW1vcnkgbWFwcGVkIHdyaXRlIGxpa2Ug
a3Z4LgoKMi8gd3JpdGUgYSBkZXZpY2UgZHJpdmVyIGluIGRyaXZlcnMveHh4LyB3aXRoIHRoZSBj
b250ZW50IGZyb20gaXBpLmMKwqAgKiB0aGUgcHJvYmUgd291bGQganVzdCBpb3JlbWFwIHRoZSBy
ZWcgZnJvbSBEVCBhbmQgcmVnaXN0ZXIgdGhlIGlycSB1c2luZyByZXF1ZXN0X3BlcmNwdV9pcnEo
KQrCoCAqIGl0IHdvdWxkIGV4cG9ydCBhIGZ1bmN0aW9uICJrdnhfaXBpX3NlbmQoKSIgdGhhdCB3
b3VsZCBkaXJlY3RseSBiZSBjYWxsZWQgYnkgc21wLmMKwqAgKiBRdWVzdGlvbiA6IHdoZXJlIHdv
dWxkIHRoaXMgZHJpdmVyIGJlIHBsYWNlZCBpbiBkcml2ZXJzLyA/IGRyaXZlcnMvaXJxY2hpcC8g
PyBFdmVuIGlmIHRoaXMgaXMgbm90IHBlci1zZSBhbiBpbnRlcnJ1cHQtY29udHJvbGxlciBkcml2
ZXI/CgozLyB3cml0ZSBhICJkdW1teSIgaW50ZXJydXB0LWNvbnRyb2xsZXIgZHJpdmVyIGluIGRy
aXZlcnMvaXJxY2hpcC86CsKgICogaXQgd291bGQgY3JlYXRlIGEgZHVtbXkgaXJxX2RvbWFpbiwg
aW9yZW1hcCB0aGUgcmVnLCByZXF1ZXN0IHBlcl9jcHUgaXJxCsKgICogZGVjbGFyZSBhIHN0cnVj
dCBpcnFfY2hpcCB3aXRoIG9ubHkgaXBpX3NlbmRfbWFzaygpIGNhbGxiYWNrIGRlY2xhcmVkIHNv
IHRoYXQgZ2VuZXJpYyBJUEkgY29kZSBpbiBrZXJuZWwvaXJxL2lwaS5jIChfX2lwaV9zZW5kX3Np
bmdsZSgpKSB3b3VsZCB3b3JrLgrCoCAqIFRoaXMgd291bGQgbWFrZSB1c2Ugb2YgdGhlIGdlbmVy
aWMgSVBJIGNvZGUgbGlrZSB3aGF0IG1pcHMgYW5kIHJpc2MtdiBhcmUgZG9pbmcuCgo0LyBjb25z
aWRlciBvdXIgImlwaSBkZXZpY2UiIGFzIGEgbWFpbGJveCBhbmQgd3JpdGUgYSBtYWlsYm94IGRy
aXZlciBpbiBkcml2ZXJzL21haWxib3gvCgo1LyBjb25zaWRlciBpdCBhcyBhbiBtc2ktY29udHJv
bGxlciBzaW5jZSBpdCB0cmFuc2Zvcm1zIGFuIEFYSSB3cml0ZSBpbnRvIElSUS4gVGhlIHNvbHV0
aW9uIHdvdWxkIGxvb2sgYSBiaXQgbGlrZSAzLwoKNi8gY29uc2lkZXIgdGhlIGlwaSBhcyAicGFy
dCBvZiB0aGUgY29yZV9pbnRjIiBhbmQgYWRkIHRoZSBjb250ZW50IG9mIGlwaS5jIGluIGRyaXZl
cnMvaXJxY2hpcC9pcnEta3Z4LWNvcmUtaW50Yy5jCgo3LyBEbyBsaWtlIE9wZW5SSVNDIGFuZCBD
U0tZOgrCoCAqIGRlY2xhcmUgYSBmdW5jdGlvbiBwb2ludGVyIGluIHNtcC5jIChzZWUgc21wX2Ny
b3NzX2NhbGwoKSBmcm9tIE9wZW5SSVNDIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L2xhdGVzdC9zb3VyY2UvYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMjTDI4KQrCoCAqIGRlY2xh
cmUgYSAic2V0dGVyIiBmdW5jdGlvbiBpbiBzbXAuYyAoc2VlIHNldF9zZW5kX2lwaSgpIGZyb20g
T3BlblJJU0MgaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9h
cmNoL29wZW5yaXNjL2tlcm5lbC9zbXAuYyNMMjAyKQrCoCAqIHdyaXRlIGEgZHJpdmVyIGluIGRy
aXZlcnMvaXJxY2hpcC8gd2hpY2ggZW5kcyB1cCBjYWxsaW5nIHRoZSBzZXR0ZXIgZnVuY3Rpb24g
KHNlZSBpcnEtb21waWMuYzogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0
L3NvdXJjZS9kcml2ZXJzL2lycWNoaXAvaXJxLW9tcGljLmMjTDE5MSkKCgpJIHdvdWxkIHRlbmQg
dG8gZXhjbHVkZSBzb2x1dGlvbiAxLyBiZWNhdXNlIGl0IGRvZXMgbm90IGZpdCBleGFjdGx5IG91
ciBhcmNoIChjb3JlIHJlZyB2cyBBWEkgd3JpdGUpLCBvciB3ZSB3b3VsZCBoYXZlIHRvIGRvIGFu
IGlvcmVtYXAoKSBmcm9tIGluc2lkZSBzbXAuYywgaXMgdGhpcyBhY2NlcHRhYmxlPwpJIHdvdWxk
IGV4Y2x1ZGUgMy8gYmVjYXVzZSBpdCBmZWVscyBhIGJpdCBkaXJ0eSB0byBoYWNrIGEgZHVtbXkg
aW50ZXJydXB0LWNvbnRyb2xsZXIuLi4gb3VyIElQSSBpcyBub3QgYW4gaW50ZXJydXB0LWNvbnRy
b2xsZXIsIHRoZXJlIGFyZSBubyBpbnB1dCBpcnFzLiBJdCdzIG1vcmUgbGlrZSBhIGRldmljZSBn
ZW5lcmF0aW5nIGFuIElSUS4KNC8gYW5kIDUvIGZlZWwgYSBiaXQgb3Zlci1lbmdpbmVlcmVkLgo2
LyBJIGd1ZXNzIHRoaXMgd291bGQgd29yayBzaW5jZSBpcnFjaGlwcyBhcmUgaW5pdGlhbGl6ZWQg
ZWFybHkgZnJvbSBpbml0X0lSUSgpLCBidXQgaXQgZG9lcyBub3QgcmVmbGVjdCB2ZXJ5IG11Y2gg
b3VyIGhhcmR3YXJlIHNpbmNlIGVhY2ggQ1BVIGhhcyBvbmUgY29yZV9pbnRjIGJ1dCB0aGUgSVBJ
IGlzIGdsb2JhbCB0byBlYWNoIGNsdXN0ZXIgYW5kIGlzIGFjY2Vzc2VkIG92ZXIgQVhJLgoKSGF2
aW5nIGNvbnNpZGVyZWQgYWxsIG9mIHRoaXMsIEkgd291bGQgdGVuZCB0byBlbmQgdXAgd2l0aCBz
b2x1dGlvbiA3LyBidXQgaXQgaG9uZXN0bHkgZG9lcyBub3QgZmVlbCBtdWNoIGNsZWFuZXIgdGhh
biBvdXIgY3VycmVudCBwcm9wb3NpdGlvbi4gVGhlIGZ1bmN0aW9uIHBvaW50ZXIgZGFuY2UgZmVl
bHMgYSBiaXQgaGFja2lzaC4KCldoYXQgd291bGQgeW91IHByZWZlcj8KClJlZ2FyZHMsCgotLSAK
WWFubgoKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
