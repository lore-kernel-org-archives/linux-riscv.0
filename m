Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33C6C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 10:53:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94AEA22511
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 10:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94AEA22511
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:Message-ID:Subject:From:To:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=tcIdt2U0yzbJLP171GamaAfjrIbTpwklNWy2/KlGr+k=; b=bxP
	3GCORotd13hT2Q/C7xEnLBDDHI4dW6QMm2BU950ZMPHqx2RqH5JMYfie7FW6YjwbuTdbtH1SqlvGJ
	SLUC6UmqbImQmOQwsYuTKBVDGrPppQku6NsRb5mjYdUcoNFU/gStmjTfAxrQPTwFLqQM1RGOB+cFM
	3OsyE8d2XJwQN/RkJ+GWmQHyb+zaDMAmAb7SmANoNV5F1stFpn8CbeSBDg0boHs3tEHuvpWJrX+SB
	MaxTagE4DpUdeGAInp0BCkXOv0z4m+TUtsJa3CF0XwVqpX5UZHd9o5snFkpXOEs7gNDBVz7FsDnon
	Z6GKEsNtfG2u5AXwh77YRX4mmL8dIZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krfHq-0000SL-LL; Tue, 22 Dec 2020 10:53:02 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krfHo-0000RE-61
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 10:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1608634376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=vftO7iDAIkLWcwwZPs5vsB+kUPjA5gv+NOtkf+GBDw4=;
 b=j7B7JD7OnwUBYvxXpwsprBvsf8EvlW3gfwda/YGrKULKIr71jJkuu/SPNyst3HOQqJvOUQ
 c40c+6A/S65eHEW4Sld/3T/nEPnkZIzRvF459zWvgGKss1x4ZuDvejAEjiHqVGfeF0tF1b
 v0qiCtP6wovTZi+dF8Jn9HvjucC07MM=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-4uxECeRhNMeo8m3Tv2YxGg-1; Tue, 22 Dec 2020 11:52:54 +0100
X-MC-Unique: 4uxECeRhNMeo8m3Tv2YxGg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6kGFzPpArpC6uklYSeRiSFLY3NSdEjTMkIKwCaz+kjIe4hLwQdRRUU5wCW3a104K0NgudIk9wePseJ2ptLasCIXb1QAVlX3zd7tTVjou+KZZapKfbvOIwKfbPJM5+cjTVrCT507RAT+3pCfSJoEN6MvfqW3IelzWmGEdCesoeyqRhD6UOTidQtDH1XWo1vvkVP0Zt/inVxNKyfl4X+JwCRmvEK2lohxWZfCZ5MefxhK6Hu8mav4FM6/2ff8IhhrQZ2hAnt+oZ7/h4WSKvG6Eznma2ETkpN5KRxSVSKRE1MednU6n+kWYacd8ZmpS98pXFzYs6OrrSGBoBjui5l+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vftO7iDAIkLWcwwZPs5vsB+kUPjA5gv+NOtkf+GBDw4=;
 b=coDKarItl0nvuTvKOEa+i9PkcWfIYPnHXh1UrdZ08yLg2cmX9ExAE45SOeUI5sS8mHtXYA1qfiheu5VSEZskTnvpG5OrnU7bkkL/eFbrOVY1e6lM9NxfLI57F+oeTAdvy9vDXm5aD8hwdSGRbyEtTjcxCb0Ov81qA8qpi1KM5eD3faeM+d1sc2NDi9d0271eE9P9RqAqswDyQtnJN70XiFWC97B9uctzMFcyVGTxYcXi7ANKG6qUVz8Jn7y28KgSSasRl1rcqKj0FK6px3rGODL2OlWQXJQ+m1eP1Mj9VNg/XMZjT7amUtgHkG6qhrE3gHtJc/XNTMc5kHFnbwqzsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=suse.com;
Received: from VI1PR0401MB2384.eurprd04.prod.outlook.com (2603:10a6:800:25::8)
 by VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 10:52:53 +0000
Received: from VI1PR0401MB2384.eurprd04.prod.outlook.com
 ([fe80::9dc6:f79:6538:f425]) by VI1PR0401MB2384.eurprd04.prod.outlook.com
 ([fe80::9dc6:f79:6538:f425%5]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 10:52:53 +0000
To: linux-riscv@lists.infradead.org
From: Varad Gautam <varad.gautam@suse.com>
Subject: ftrace_init doesn't patch _mcount calls on boot
Message-ID: <9b57034f-a4a0-1602-d331-5883f961cd7a@suse.com>
Date: Tue, 22 Dec 2020 11:52:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
X-Originating-IP: [95.90.166.89]
X-ClientProxiedBy: AM0PR02CA0169.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::6) To VI1PR0401MB2384.eurprd04.prod.outlook.com
 (2603:10a6:800:25::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.77.163] (95.90.166.89) by
 AM0PR02CA0169.eurprd02.prod.outlook.com (2603:10a6:20b:28e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 22 Dec 2020 10:52:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 016d4fba-f643-4aa7-8827-08d8a667bb96
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:
X-Microsoft-Antispam-PRVS: <VE1PR04MB7280FFF593B270E4DBD90BFFE0DF0@VE1PR04MB7280.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LwZEPZKLTHHyRQe8hGEVfSRtxLvvN7iwFRe7Z1b7LUv5P95+qbBdylh+OOxOtxyeuioLPkZAZKvs0rjRvMofBAR5aGymn2B4SSjdXgnpuRvWQ/3kP7Ug0+bJQxYk7xz8QqwjOv5XnQStP/ZnOC6GbdyY1Zgwe6Um3mA5Oe+m364is776GK7Y8eT5ZKx5g7+i46rilOePSHPQq/ZJ+53ELQ7nNUK1YVXfPnRGGyYne0Yt6pgvZP6aaJrE4hCYGRHN8P/FZvFwNX8zhP2pDp1F9aVGrL/krx14hqFTHJo7IHcJiNxXmWxIvvA9lBRR45HwQtwFyZKF1zrL9XYM8An05NCNHel1zJcGeHQIjhRgiUuI3k1octRctG4t7M5R6oDYA8CL7K5fR/n2AJVoRWLFdQj0gw3fGb8Ew/fo1MX+mn7DBZKH4wT4s9ULTUIHSQryoJWi52+KaLqq4RhBMemwE5EZVt9HMFY94J+cpcG+UaGLJ1u4tQAqZXfhYm+ezN1XbL6V/NtTGVRFquMSDDmSin5ZTI22afPbEuEpRkhNGfh44sIt/Td+JoEZXZBNloCL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2384.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(366004)(39850400004)(136003)(376002)(16526019)(26005)(86362001)(186003)(83380400001)(33964004)(31686004)(52116002)(478600001)(31696002)(16576012)(2906002)(36756003)(316002)(8936002)(2616005)(21480400003)(235185007)(6486002)(66946007)(66556008)(966005)(66476007)(956004)(66574015)(6916009)(5660300002)(66616009)(8676002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eFFkOW5CcXU1d3VGemlpQnRKZ3UvVktzRnlSYURyWTlzNkF5Q2NmcWkwTTlF?=
 =?utf-8?B?S1pNKzgxQUxOeXdNcWlXRDVBK3BlU0F6RzNKUEVzRmlQNncyWVUvV0NZVUF4?=
 =?utf-8?B?Ty9XU3lPVkRIejh4eFArTG5CY2h1ZHhmV2NsRkpyb1BCeDRSSFJaTE1vTFl6?=
 =?utf-8?B?aDF1c2VCb2tSQ2RkTlBvVEtjMEZtYWNpZFpWOHR5MGpnWVlCeFV3VlpEZS9x?=
 =?utf-8?B?U2ZoZ0J2a1d1UlkrTng1UTVGdSt5VDZFRjVmSkNhKytpa0RSVzR3SHpZQTJX?=
 =?utf-8?B?UUU3V0RDRkk3SGVRcTZFc2toUHdpeDhIbWFQOXY2bHVkMTU3MWVhczU1QUxs?=
 =?utf-8?B?SnIxUG9iM0kzcmEvVVVta3g3UU9wM1pONkxLL2NzdDE2K01lRFR4ckZCUkt0?=
 =?utf-8?B?eXhsOU1yc3Rva3huZzRKRXdwL2xLTVBGeGx2QkhQY2hnV25wa1k5blQzbnJl?=
 =?utf-8?B?V2tnMlFqTEdnQlJsV05nMkRLWlIrOEJ3cDNRVzIrZldOSFFybnRadTZhVy93?=
 =?utf-8?B?blJTc2VaMHJTZ05sMmJHeS9HaEFIRllqU1E1V3VHM0RlVVFFSmpFb3NRTWtp?=
 =?utf-8?B?NW84MTV6ODR6WWJMZFhlK0t2Yk9JY0xQK1lnRFRTR1h6M2Y1ZzJKRHdkZytB?=
 =?utf-8?B?V1hUdlhWUldUZDNiMDFlbWxwcTRITEJvaU96MHJUL1NCS1pCOXFsSHFNUXds?=
 =?utf-8?B?Uy9Mdjc5SXp6VUtTREh4RkkzUkxtQm5OUEVxYWxRNDljdU52VTlhNDlPUm4x?=
 =?utf-8?B?a3JqanhSSjBYSWR2Szc4ckpDZ3F2aE93bXAwNEZ4K0svQTZrYlJmTkJSRSt4?=
 =?utf-8?B?YTlSNEoweWV4bVRsWE9zSzl2Q1dSb2piVU9CUXZ0TjcwWC84T0R4blZaK3gw?=
 =?utf-8?B?OG0vVGg3YTJwV01DeG9UWnJLb2VMeS93MGRsVUdlMi9MR0h6VE54eFJSL08r?=
 =?utf-8?B?QUtVYVRtc2pLUWRGTXJqNGNWSzZjN1JCZHQ2SzZBdFBqZHJpUldvNlBlZnBL?=
 =?utf-8?B?Rkx2QjZaaHBUZkUyMlJTM2JrellON1BVbHNJV0Q1RnJwQ1JDVUJnbWZja2Ni?=
 =?utf-8?B?NXdBSmo0bisrWXdoTHBGd2l0dXgwT2g3RDI5ZjVvREhDbGFyaWhoaGVKLzZQ?=
 =?utf-8?B?WnZHTjdzZFdldHV3SDdUU0xIc0E5NG0yeG92TkZOdlM3ZVcyNEhDWVliaTFX?=
 =?utf-8?B?djAwSk50M1Q5NVZsd01CcjZ2WHZMdVh4L09aYW5LbVNrNWw2eUdkajF0bCtN?=
 =?utf-8?B?T3VJcTl0Z0VZa2hLOXhoSzY1eTZTL25IYjhmcndBS05oNExodHp3Ynh0MWNq?=
 =?utf-8?Q?JClvb9BVZWZj8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2384.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 10:52:53.0162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 016d4fba-f643-4aa7-8827-08d8a667bb96
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpT18DdwTyJM/0tfPRYIcVNh4agLjuzyUoaGtAbcr9lSlRFAgorViuHXLGxFTwJ2TtrOcNfvlqkhPTlWnP8Ypw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7280
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_055300_449276_9791C9E3 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1521644732106159852=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1521644732106159852==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="v6LMVag3Z9rU7GFIyWpNmrSB8WvzmItvA"

--v6LMVag3Z9rU7GFIyWpNmrSB8WvzmItvA
Content-Type: multipart/mixed; boundary="m7wG4pYBBzLPhV5SVIxZJrSm0yDVKUb6R";
 protected-headers="v1"
From: Varad Gautam <varad.gautam@suse.com>
To: linux-riscv@lists.infradead.org
Message-ID: <9b57034f-a4a0-1602-d331-5883f961cd7a@suse.com>
Subject: ftrace_init doesn't patch _mcount calls on boot

--m7wG4pYBBzLPhV5SVIxZJrSm0yDVKUb6R
Content-Type: multipart/mixed;
 boundary="------------C7FD94BBC026729A8DEEE47B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C7FD94BBC026729A8DEEE47B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

I'm observing the following on qemu with CONFIG_DYNAMIC_FTRACE=3Dy:

root@debian:/sys/kernel/debug/tracing# echo function > current_tracer
[   73.674265] (____ptrval____): expected (00000013 00000013) but got=20
(00006097 a38080e7)
[   73.675144] ------------[ ftrace bug ]------------
[   73.675665] ftrace failed to modify
[   73.676548] [<ffffffe000002010>] _stext+0x10/0x3c
[   73.677641]  actual:   97:60:00:00:e7:80:80:a3
[   73.678534] Setting ftrace call site to call ftrace function
[   73.678842] ftrace record flags: 80000001
[   73.679088]  (1)
[   73.679088]  expected tramp: ffffffe000008020
[   73.679687] ------------[ cut here ]------------

This comes from ftrace_check_current_call(), which ensures that the=20
patch target location is set to NOPs before patching it with a=20
`auipc/jalr MCOUNT_ADDR` sequence when ftrace is enabled=20
(ftrace_nop_initialize -> ftrace_init_nop -> ftrace_make_nop ->=20
ftrace_check_current_call).

Dumping a few function prologues from memory before enabling ftrace, I=20
see that boot-time patching didn't work as expected. The ftrace_stub=20
call sequence still exists, which should have been patched over by NOPs.

(gdb) x/10i blk_put_request
    [...]
    0xffffffe0003169ba <blk_put_request+14>:     auipc   ra,0xffcf1
    0xffffffe0003169be <blk_put_request+18>:     jalr    446(ra)

(gdb) disas blk_put_request
Dump of assembler code for function blk_put_request:
    [...]
    0xffffffe0003169ba <+14>:    auipc   ra,0xffcf1
    0xffffffe0003169be <+18>:    jalr    446(ra) # 0xffffffe000007b78=20
<ftrace_stub>

Digging further, I find that the copy_to_kernel_nofault() wrapped in=20
patch_insn_write() returns without the write going through. Replacing=20
this with a memcpy however, makes ftrace work as expected.

I'll be looking into qemu's emulation for copy_to_kernel_nofault() next, =

but I'd like to check if someone else can reproduce this behavior with=20
CONFIG_DYNAMIC_FTRACE=3Dy.

Kernel :=20
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=
=3Dfor-next&id=3D7d95a88f9254b711a3a95106fc73f6a3a9866a40

Thanks,
Varad

--=20
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany

HRB 36809, AG N=C3=BCrnberg
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------C7FD94BBC026729A8DEEE47B
Content-Type: application/pgp-keys;
 name="OpenPGP_0xED23629CC23015F8.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xED23629CC23015F8.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBF+EV3ABCADkXVqzozm8Uul7U4fvNw8Z56zPUXqXZv8YI0zj/SbRhColjo16ocse8omOC=
gZw
XcnmvDJikfTMK3Xd/TWznKqjukXfFqeJkCgb+u9Cq/7A/HVAHZ8c5Wj2bvINoSAdjlozkmWth=
pHm
w+OjhG395+oA7bHytIkLGHhvwNY/o6ujAJA+wj3sGH6xA/d/Zk05AMEisZYTIUthdd1BlSEw3=
hgK
1nZof1Fke80d7dMI0/RyM/SKvibtJg6gu2uZxKG7FbcokiIGxtQMYp5F1o7AZqgPuqfvc9fEk=
A2A
/JBHbbH3JyskK1DElFvVcyiEnZRlZxuA1uFd9McP3wdB8+FdXLFFABEBAAHNJFZhcmFkIEdhd=
XRh
bSA8dmFyYWRnYXV0YW1AZ21haWwuY29tPsLAlAQTAQgAPhYhBOPWIO5LLbsi7DRr0u0jYpzCM=
BX4
BQJfhFdwAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEO0jYpzCMBX4BVQIA=
M+N
Qh1dJXXvErJSs8jHZh/rJ7LPYVxxEPlNjmVRb2gUd0vKI2jBivqe4T3whDpmV557LBnCsUf83=
mRh
JyCU5RfFtbHY2tLIo9Us0gisRCQq+2NtN4ErCbktu3MsUpRgI67w3Zet7uEXrHTohrHjyPBya=
HDn
aMvAVuUQbLj+plOg+Awe5SDf7TvcFt3fq7tIn3okYHsrqNssK+TEmYe4YxkT9v8SLP/nhRt2r=
2XL
u4ef8tKoK3Smt79r6N8/pHdrE2I+GzvzCU3pav+qJ/FpUq248v7tsjOqwlAAwXFoVA2knYKTz=
ZmI
ZAqd+rqG+ATTlFGEUNaISQUZ08g1eOzEX/bCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJr=
g9H
pwUCX5vxMwAKCRCqUDvJrg9Hp1huB/0chcZzG88LJWDuMBrMUQ1edoA7OPA1yCZGxd3THWgKE=
/bp
pc/nOKQOdPBSkEtGE+pfmQrtpuw9H3oU0trgSgfbYq6xflgD0UVekjbZnTtdVqi3nguPyoljZ=
5xW
SlfZiVTXB73gIkVo+bEQO78oa69rlkHOt8t452qbIggpPv0U3kzetxGCCc/oTVN8mfkduDyto=
1C/
RZCYrPeCSfihvUtKD35+t5LFYLYozBxkYtlWp9F0WLnL9dInCRj4ectGIVjWVD2JBgobA8+9x=
LBq
ch49cVjM2VWbz0inreOzfUyOtfpQtN+pCG8o9QLXLQOqyzhJ56TnM5ZGM33oPcuz7s6zwsFzB=
BAB
CAAdFiEECxfAB4MH3rD5mfB6bDGAVD0pKaQFAl+b8eIACgkQbDGAVD0pKaRwCxAAlqFod+HWA=
0f5
9XUQP1tHvwubPod1ppgo/dGNiZp/mQET4UAvE5kuQ6PouTSjs8XiiMETqFG2RN87n3/q1xVdt=
geV
tyU7s+zwkfJvo6DkpniZ369xqtn1FrxGbNXcbXY7ssNkZquiXfM4j/fU218W/kVfjY7ET6R0S=
6hW
+/KMbrGyR5FA9lyR/0Zngourh5G3WXWFfEekBYuUY8e6ZmBiflQ8j/bQQvIMCmOZpOR9IGIRX=
9jz
ZsdN/3cuOHBiIzE9jaHE1Si+lc/yOI7VS4T4OyppYQ8PmMHdVrVHnSu64xqiCvepT6m27FZ1Q=
Bwo
I+oOKhY7EadqlyCfLsrYR1X934paiLxOSydt0P9X6bbdSn/xazzqzcXEmZ791j/Li8jWW6pfc=
wDl
G9vxw5YCFNu4wO9IMgN1hNA8Hs02Sd4h2gLMRJduSWIJbXYiBxueXyr+ZczI2E3DrtPSxrt3t=
7cV
eHeZ/4GRfGleaCD7bMZegbMZ1e+7leQqoh4e07gRImgURFvi1MucvJoH0zb69fGOTEDdX5HnG=
e+d
WKNDccZICWFBTPcOb9ZDnkw/8Jn7yglHWt1Z19MKlNMTWUDYcvA4xmzmlRzsgi045Pf3tOCbd=
J0T
rIzLa9HtMbKQ12F47s6oy56IKCCu6Cu2YPNLM406TnJk7c8n1aenqSugrKBqE5fNOVZhcmFkI=
Edh
dXRhbSAoU1VTRSBQcmltYXJ5IEVtYWlsKSA8dmFyYWQuZ2F1dGFtQHN1c2UuY29tPsLAlAQTA=
QgA
PhYhBOPWIO5LLbsi7DRr0u0jYpzCMBX4BQJfm+boAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWA=
gMB
Ah4BAheAAAoJEO0jYpzCMBX4DfcH/RggI/wZd8wVi52wqe8VMFro8RqdH87qqCI2fg+hAVQct=
W7s
BWdI9BxTMTQC9MyCp+/LmoPa/ozUvkVO5KxMwasqcHjFBDpVNRaBGO82YQ9MJJhBUtKhBJF7i=
f5u
Sr8C6RYsw8q/STdqt4+i5Zu41U71q3iLfRdhvtV9u5G1n1K4RgK8NLCF3hqBDnGDyLNq9fVdF=
EAB
FAvBDqDhajnEWCwngDxOG5XscyFonrfvrobIfcYWbDUsMZgr+ned+zlCRbm5//eGxjISeRjVv=
fyP
NyXlNd33l6uGFrqMi9ZVxS9gaMtohoxkPmXJCFoREugg2+qKxTFdjaed1q+tf7WBOAXCwHMEE=
AEI
AB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCX5vxMwAKCRCqUDvJrg9Hp44WCADTkseU8TVEB=
PMb
XYV9tq+GUa/EquPXC58IBLcCxkKgD7B0+BtbNXsW16pJP1Ipkcxe+kkXMuwzgfrI8SF2qZ4+Z=
Wef
0FsnAl0ifNFn5/o8u7Qb6MYi90B2MSVo1npI4Vk1JF3k3muUkPLny56PsWbLJc3QFNriZN/5q=
yzM
DDhB6DAOuVNdT45IN22zyZcMIMrkhk/IgxvIW9Qx/QAlm2viwZAWlb3zaHrz1hAgVFC9dgTHh=
P1M
di1yt+cp9RVdlYXiYzG2wba9rvxgOVH4wp9gfg7ewGtwEbPUenLRpajHmP2DSavkC2uKZp/RW=
rvZ
3fTRpvcWE1QwWOBbg/OZPLyKwsFzBBABCAAdFiEECxfAB4MH3rD5mfB6bDGAVD0pKaQFAl+b8=
eMA
CgkQbDGAVD0pKaSpcA/8CWkGZywZ9v4TvziQusfj1ti2Y/Bj9JksiRnCVhGxQqvWslaezgbXv=
dd1
f4JZoVNGcdcoEoYgjQ+D3FynicMw6kjvhSlfSmPjcQM0ZTcy7Fw8KtX04M67FKl1EQqRXGQ5e=
FM0
qPbvYeE5So9Rb8NueLcfotpd1ZC/H3EKVUSQZ/0nmT0NQIrd6e6qKOIwnUilBfPmklxnZYRnX=
X8M
pjNnYnCq3RCKfiYRR3Dj0HB5fGfYdFfe6K1glGkMkJdDjQROcDu9Qn6NFNJkg3dGHf1L5sI4U=
coE
OPq1bF8aC4U7mZENqg/zw9PhLYDtWz4amkeWtKTJM2eByMb4f1jHUp+Wl7AqsMmg/0KwG4yf4=
Ftn
zAUX+0zrCIMCnrmrGLssGePT5DXFT7tOqmVyQ8NnZIRd1Gve0ndMfnbjQtTAl4I+dmlPAffvy=
Lr1
lNaSoHDVxBY4f3NwqbA6Rfv4Vpse1oqWg4Xr9k0FZGUj0vLNX2CgVUj9QygDm/ZwGaRp314qf=
gIy
TUCQ/V7d6/6G3e0IXheetijFEog73E4rl6Ts5vCE3/G+961zdNp9RyaP0Bkllp2+QsRSNsABq=
cnY
n+ACi5KPjHT0CPRxWlCkL3fTewyYH38KPQjmwsIZplyi5xMYBg6zG8nK6FjTwuPyFL27/Zr8z=
5wT
uj8LraYSipno/bePdU7NNlZhcmFkIEdhdXRhbSAoU1VTRSBTZWNvbmRhcnkgRW1haWwpIDx2Z=
2F1
dGFtQHN1c2UuY29tPsLAlAQTAQgAPhYhBOPWIO5LLbsi7DRr0u0jYpzCMBX4BQJfm+cNAhsDB=
QkD
wmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEO0jYpzCMBX4icsIAKK/wJIzqzDiHU/Kj=
1yu
yRd4+ClcQ4Nf3t9W9YHuzzi171OjRoGoLq18E5E+8It0GsSf8wrVih5S7fksJ1GGS+g2EKS+p=
ycX
KHdoDrn76B8CIXyFBT7l46rXhwn4eLhswMSKpGDaA0K3Pcriq9AJUcmcfhab9Z37plurNG4+R=
mJn
LWz2VPbmH7NJavNCWjb2H9Uy+5u99m4hXs5zlAZpKiZKwdag7iVgMj9ShdEEfmDodnl8q+AaE=
T2O
Jk1OGsVGcDlsryM2SQTtvM2xAawRUnqBS7bNjYgnm87nlneXI1+65ws/W+Pq3DIQgJz0gMV1u=
o3z
mX+B3pti+jljNlBiF6jCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCX5vxMQAKC=
RCq
UDvJrg9Hp3sqB/0U2vgANJgqdPuPOXw2KYSVvLdOG82x4jW/DmQCivV0cGwfk1VJlcX2eW4Ho=
Apw
oyDmeLzZ3TUuyIrC0+OAkLdWJH6olIOQXkro+2bDXK9l5QBK+7Gcmawp1fD0b81wj6DEj7G4B=
s3B
sLyhdt+Cfe5tew4fUDtFo2X4Zmwrrkw/B9o4u3WeVPA4SI3qbVKvRYEHNik0SW6MsxPgUcr5R=
qbN
aDAUFmxHGndi/BY8kVY79o+aCTZ9KLqgv+mRSx8FlTWB0bIsOz6TAA6yN4STY3dKIJ6LiiUyD=
AeK
eWRsyEJkhd3+LgvbrUwPDx/fUcBFxKDICqX/u+zL1tCZAxY+WItlwsFzBBABCAAdFiEECxfAB=
4MH
3rD5mfB6bDGAVD0pKaQFAl+b8eAACgkQbDGAVD0pKaTTFQ/5AdkKkM73aFJ+a/NwUnnf6YGIN=
1+I
Oihis5ly/tiShmvblPzb6SbW7tliRYtB2yVdnS3BFONBC1s11EfMOmazNfkBcf1RsRjupvKqY=
hAd
7G7fCohBolrpPTavYnnsr7OlLq4Djzj1CuCKA2dfq2k0zbBxsCb7rUNXexp2pwASCZhDrET8v=
k1v
8nHbpsGvIiILOVraNYnAynyGEjBm0L78jJn361qzT1NjTL4uICSpu+/Dw3BZsFi9tbFbPIH9R=
9yt
2K1fFsl3XrNcWqrQpftDB0VtXOol0wLWbV+4S96w34Bq9Pob0Su9coRMJ/Zod22gkN3owV/zk=
uT+
PHiW8WU8ByuOnFIVlGjTnFx0Thg3Ihwg9CGm2szqVhcO9hDQGhjPxxjTT+xyOuxYoFeawJEln=
T6Y
UlJfVQnVIDwd57r1A8x1AJ5QclPbAX2HvNz2QmhY3qHFelrLJIUVqCWBU/cq9L/wvatwplBJw=
MVc
JROKHkEFkj9sG8uvRbhFrIrtsbZXNn1WFTY0zqY+nFPF9XVk0HAbUFZUzLD142iAgxjjDbLHT=
r7Q
oc1b0LQZqWmEThL1EjWribnS/eEK+QtySFSwOHX1D8Jq4vWQ3ouLZUQJ6RLeBBUfxAQjryr2k=
ere
BXMUpm7y2yfHDv+u1AtYJp19xVirnL1Uj+EzAiMCS0RRj7HOwE0EX4RXcAEIALQMRl8m1ncy6=
1zX
T0Ne0Tl2JDB+DdFEaj8jryppFxCdTa1nSna64NhvJCHgacvp0xCqZPU1TTzJs+QrbKf7pFu1Y=
c1L
e3a/dC5ynjdC9w6OVsSmgK5Uf93C1zZHRgEoieXCJlQBrFfwkZCtloasYMGXyy6D4cWcJYKNJ=
Txt
oXYeYlS8p7R4mboC5DZd1K9Lx68vCXbBO3I5La8nXp1pF88ySTUKcimfS18A4KphXfBqKWLvw=
CUl
Br364Xwmz4aGF4Y4yDgfk7B8BOG+CKk2mQpeAo7IhR1jKjRvpAZikI3lMTRIGMVD0Y3k2cwJd=
+JU
kQ6H14cTBLE8fIk8yBDp8/MAEQEAAcLAfAQYAQgAJhYhBOPWIO5LLbsi7DRr0u0jYpzCMBX4B=
QJf
hFdwAhsMBQkDwmcAAAoJEO0jYpzCMBX4YUsIAOFOJDlVXQZ2L8+QLk/6vxGtvls5c3mleDTVK=
2Ku
A5zp/2xEBxE1/mu67b01cJz8L4R6jJ3lQFTC89HKTZmlSS5YHtTxmqXCbacqZ+we0esDKyhjG=
Nw7
O3WRnmyHwylD7NEtBGZ/2a+IaEad8ekpPCC6z23oPn28tLzUpawhQ2qNCXA+xtMqcOhTOFOux=
AJk
pHFdG8NXWaxdKlTfMN5XS242TLpVxVnELTjnxNweeoP5I4OYFCFL+w/llUKlOChRoSJ558pEZ=
Goj
tqXitE+wcPtVsnug97V18N4B8bGtCbFQHKc3XkpSalsHZ2/Ddlac0XWsv3l5skz4iDIk7tqby=
00=3D
=3D9M4h
-----END PGP PUBLIC KEY BLOCK-----

--------------C7FD94BBC026729A8DEEE47B--

--m7wG4pYBBzLPhV5SVIxZJrSm0yDVKUb6R--

--v6LMVag3Z9rU7GFIyWpNmrSB8WvzmItvA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE49Yg7kstuyLsNGvS7SNinMIwFfgFAl/h0AUFAwAAAAAACgkQ7SNinMIwFfgD
SggArrawDAGNOmT8TENi72zWoIh8/8WachsEsf2j12wap6hzrvoSiuNcwYHpmYEz5RWieTLSywSQ
NbMANnFlyNoxWVb3hugBDvwIt2ch8nKMqEOv9WP6EX7P1vj5DZ27qOFhXAH8vw/Zc3Z5zkxhxnks
TGPCEozxlEX0pztZ36P5x9xEmoUMlFAnfgyR8g980rJRVuPg2ACBC0NhVNh6PJg2bnhJjczJfQbt
vMWR1y4Cv3vpJXPcKwj75J4gDE7FBYgLQVzzXprCgH/j+Mfh6JrT20QJ7PKM4lEdsUYWOybs1q0T
e6Iu1n5uPV1yDIRJCx+m+XVFeAbHp9i6QxcNdR/Mvw==
=RR4Q
-----END PGP SIGNATURE-----

--v6LMVag3Z9rU7GFIyWpNmrSB8WvzmItvA--



--===============1521644732106159852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1521644732106159852==--


