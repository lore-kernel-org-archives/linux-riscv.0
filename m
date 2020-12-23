Return-Path: <SRS0=SHZ6=F3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BD4C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 12:04:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20C30223E8
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 12:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20C30223E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:In-Reply-To:Date:Message-ID:Subject:From:References:To:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dgxiwpQrv/30t8Fe6toh3F5gcoy3QBIefSDU/ZhT1Lo=; b=GXScfReT4grg3Et0gQKHGlQBi
	PKaW2r+L0L2Q8n2JsX1h/N7CQP7ORuuI0mwmYkCIO2fAY8aMLFXz2Z64vcUtuoKX783OMg1QCjPRa
	/a3iOm/ZTI9KQZfADjKJ26NlC64K0W1F/lTeMkRXW8+nX4aMx7xQvxJ+PMUfWfi7Z4SOhEFZWk8nf
	6XHeAm+yPgazFPrLKbDe74tCdldSQUpIVbz6L4j3q91zZ+gB81TsX1fncxb1oOoJiyX5EeE1Acf05
	f5ZveTdtsubxZkC0Ccn5/cVh5FIaOUPQZf2xw9pP1xeU/KBJ77WiS1RMQn76uHLJrjWKOu9T8pUfZ
	RxrndbhFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks2sG-0005vD-Gg; Wed, 23 Dec 2020 12:04:12 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks2sD-0005un-9G
 for linux-riscv@lists.infradead.org; Wed, 23 Dec 2020 12:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1608725046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yHC0yIDapfRzM85Rcmmz49S4V46Q+sfNaNizaPcufVY=;
 b=kdDDMVbqjNB3Y4emLcmxhtjNyCFNz7Bd6OdsUQ11MKlzjbtwBt76Nxz8iRRHqIoEIfnsIm
 MXK68BCZsWim6Hgx7VD+5/FCLGpFlnyiqc6DYxoF9nlwJqVCSw5w8qasbgjb3SkR55/eUb
 eyVnLDI9xlnxfzXFEpGbMOq6nT9RglY=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-44eA8Nf8NTuPn8If3_qlXQ-1; Wed, 23 Dec 2020 13:04:03 +0100
X-MC-Unique: 44eA8Nf8NTuPn8If3_qlXQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IS2SDy/SDkbEu3mzEI1x9qKYMZhA1SgEFsV214UlTTe9yyhuWvPCjUsigzLF83qnu9pF/D4ZxCJJiUdJNlC7DkN3axwvQObMEBuf7YqI97quUjfzA+uAstEJjxdWEu7Jxqx53Dv8rp4Qys9cHL6heB2AOTcmsykl4SrZFXF1vbLe0NCkVZ4HjntJgIqdiZdqkvE3dzm2M4YKYkJNJK0Z3Q+bxiGfyo5uEFkOmb5hKI+R25ae7FFhLNnPx0jNoIXBXOUZD1su57uJSGkNIrcupaKdLgV/tqWHMW7n+SrefFDcsLTaTN/+U+Ptnbd+ymWQ3mDctuA12KZ0nBSUuGeTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHC0yIDapfRzM85Rcmmz49S4V46Q+sfNaNizaPcufVY=;
 b=F8CpGxsb7BeXBbty+7Kcr9d7ggJ2QelrV6NOVEOEAOsMpU7SfuwzZgujKE8MLD1KuQVmx/Er/wMXxzcxv/d1VNN8d8mmfTXFePdanlZUJ9aeu99yQMVyt1X1enQ+vdkPZN1jbIz+RC6pbVBA73c0AiohOHjEYa8rbkV0dSrx1yyJcJN7/6K4J+Pd/XDv31y7EEG1YKg7v8M9yYHCB4XcFLg/mDp7dfdQodgxT9uFp/K7Y5mD8ThlA/LhFrbarD0WSrp/I8CoR1/aogK2TuPifz5FagJyMlKbZu5JT6HOqAcuCBNorEzkGaEUqMz1CQ6wMqWHlEs2gC+KwcltdHsisg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=suse.com;
Received: from VI1PR0401MB2384.eurprd04.prod.outlook.com (2603:10a6:800:25::8)
 by VI1PR04MB3102.eurprd04.prod.outlook.com (2603:10a6:802:9::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30; Wed, 23 Dec
 2020 12:04:01 +0000
Received: from VI1PR0401MB2384.eurprd04.prod.outlook.com
 ([fe80::9dc6:f79:6538:f425]) by VI1PR0401MB2384.eurprd04.prod.outlook.com
 ([fe80::9dc6:f79:6538:f425%5]) with mapi id 15.20.3700.026; Wed, 23 Dec 2020
 12:04:01 +0000
To: Atish Patra <atishp@atishpatra.org>
References: <9b57034f-a4a0-1602-d331-5883f961cd7a@suse.com>
 <CAOnJCU+RXxiP+_qK=H_d30tUg1-GMo5PDk+WBVFLumquXYUNNQ@mail.gmail.com>
 <CAOnJCUKuywqBd+E2gtPnsJMdcQUqS2P734CYWuOPavprhkAa3g@mail.gmail.com>
From: Varad Gautam <varad.gautam@suse.com>
Subject: Re: ftrace_init doesn't patch _mcount calls on boot
Message-ID: <04c8cecf-9707-821d-913a-9bcd5a26e247@suse.com>
Date: Wed, 23 Dec 2020 13:04:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <CAOnJCUKuywqBd+E2gtPnsJMdcQUqS2P734CYWuOPavprhkAa3g@mail.gmail.com>
X-Originating-IP: [95.90.166.89]
X-ClientProxiedBy: AM4PR0501CA0057.eurprd05.prod.outlook.com
 (2603:10a6:200:68::25) To VI1PR0401MB2384.eurprd04.prod.outlook.com
 (2603:10a6:800:25::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.77.163] (95.90.166.89) by
 AM4PR0501CA0057.eurprd05.prod.outlook.com (2603:10a6:200:68::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Wed, 23 Dec 2020 12:04:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 112f9aa9-0af9-4f03-2891-08d8a73ad654
X-MS-TrafficTypeDiagnostic: VI1PR04MB3102:
X-Microsoft-Antispam-PRVS: <VI1PR04MB31026409238B6E88D198CDFBE0DE0@VI1PR04MB3102.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RUg6V/P4bomV0cjbK7CJ8kStaj7ubnt1il84mrzMcw23YNGQSNxFOky9bgrNSrMBcajCVjRxStOC62Ys48gKTWxc7Wdmr2iKob2k12CSf5ysDqDYUF0n0oFTAboym/zlsjQpVH7aEecvichkaciDg1ti1JpgoM9Fosl83MRjY/EFJj+IvddxAXwlMc8XtxdicDzJ3XiYHRFfAMSfFOuyGnEwDZojTkiqz2xXNEuMcXah5/8Iy3r+y3uiAkTMPdUiS+espzswXAFs0ZzT+Z7HmnLhsoImIZwFjnsbWpHAW8jWpYB/LSlk2xIcb1D3XrXv1PxRUoDSsA3cloO0ArWdZ8GJaMVAGKAsokbGbpS8KKungbNt3uMIDYyvh1LkSXmrAHvOWoOvBzrIuS16BYcFBPZfx5ME7+0RjQ/YbS0sS6A8gDWvkjR9SIxR8zbZISbsxVLfZ714GqoTJ5haqD7WpLsFJIwuqv2KgJlkCTarQXSzTFV/u7L3yPsBnDXxfgOtgaYph2FkLC/1YCM035JRuiGI3H0Cpmy8tp/VzdhCbHSvxAaVC025nP1va/EnzBqZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2384.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(396003)(39860400002)(346002)(956004)(26005)(21480400003)(966005)(8676002)(53546011)(5660300002)(2616005)(235185007)(33964004)(66616009)(4326008)(16526019)(36756003)(186003)(66946007)(52116002)(66556008)(6486002)(16576012)(44832011)(31686004)(31696002)(316002)(66574015)(66476007)(83380400001)(8936002)(478600001)(6916009)(86362001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QzU5UGF4TEZhdno1Z2xpbHcxUEROaGhaT1k3bU9oOHM1TnFUa2FnL1YzdVl5?=
 =?utf-8?B?aGUxYm5jdG5MU2hudGNoZjRPWkxwVUFESjdkM3ZSakNpYUdrRUxjSElzdVVT?=
 =?utf-8?B?YWpSeDFPcWVRYkQwek5tMGdTdGNZRUk0dkNpZ1V4N09tRjNadEdCa0J3MlRL?=
 =?utf-8?B?V1l0SFhHazFRbTVBazVET2JoRmorYUhuM3pWdXlXdURxWVFlYWZ0SWdlU3E1?=
 =?utf-8?B?OXNPU0dPMFRYYktIcVd6Z3ROU2tDaXFEMy9XcjBieHZaWkFmNGNwcHBQdWVY?=
 =?utf-8?B?ZU14d0VsTHhoUjNtN3FIeGE0REM5NVYvTENkV2FQUFBncXAwYjJudjZ1emI5?=
 =?utf-8?B?MnlBV1EyOW5uT0FsM2d2dDVINXRJZHg4aEsvRElLT2VPSmJ1RjNpQ1A2c2I1?=
 =?utf-8?B?c1J0MkVNUnAvTlFSTVRuSVBLOHp1Y3J4bE9jK3JJWGZscUM3aDJKNnpTY2xD?=
 =?utf-8?B?Z2lrVlc3ZE1lVVgwTnpiZGRieUFEdWIzQWpyRjhERUp2dXhWRE9XeEkrVWx5?=
 =?utf-8?B?c2hiZkhqNHMxRE5vWktzMG4wQ0hQVnc4WXYxd00vRHNBQk93Q3dvY1owRXBJ?=
 =?utf-8?B?N2ZQSjRndWxiK3MyRUdZYVhBMUJPY25Gc1ZJbE1YQ1ZTckJQKzNpNTRrMUc4?=
 =?utf-8?B?OGlZTTYxNzVkNDU3NlRYQUJhYmIxbnRiTCtRbEcwbW5zT2NvczhPNWlpS1NC?=
 =?utf-8?B?RXBob0JPZUt4VStpNVd5L2pweFNkWDJFSHpjRmNyRW5IUUJPRFNpZE1URHBt?=
 =?utf-8?B?WTZrKytjNFEveE9CemlzRHJiSVNONy9UL2Jtb3l0eHZ5Q3o4V2FxMGg1SjBF?=
 =?utf-8?B?RGptZ2xuTk9qTENnU3pUaVMrWG1qVWpUWmVkL0dDc09VU1BzVEtNaEJsVWpp?=
 =?utf-8?B?T0hqMVJXcnJrL2Q5Wm5RSFBBeFh5MmpkNHhUNHJnM2tONTkwNmh0czlNUkZi?=
 =?utf-8?B?cU0rbis5YnlJZXA4YTd5dVdqTUtrUFFQNnVCS1hhVzhwQkMyK1VBM2trSyti?=
 =?utf-8?B?cEcyRDRmSEQ5bmRxeUdEMUtmd3FUMkJwdzVtaG44U01mN25VMzZ5KzEveUtM?=
 =?utf-8?B?N2xBVEEycFpQQ0hLQ1dINnNsNVZjZklvb1Z3MXdhaHF0SHp4V3BIWTRBanRm?=
 =?utf-8?B?Z0dLdnYxNlZpRk9RTmhsVW9ab3Y1U1VGT3g4d3NDSU1iWEdmTEU1L2dWSTZa?=
 =?utf-8?B?YzdxMC95T0E0Y2tYMlRkT201dGhPRms3TlRIeGZNSUU0cGlKT2thQVA1ei96?=
 =?utf-8?B?TXY4S1VqeDI0bHJVbGRPM2phckx1UjhOeWt4dEk1WmVxdzBwejlpcjA5aVRr?=
 =?utf-8?Q?1vkT1eG/sZHLA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2384.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 12:04:01.6947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 112f9aa9-0af9-4f03-2891-08d8a73ad654
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iye9MXcCg1554Gk08URYfNy1dEUUrxLwpaULoD1+JhAtyCMtsQS2RK82E7ow1hPdCDCCazH5FVkkf4I5364jeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_070409_566812_A47FF834 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============2183146926025438984=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2183146926025438984==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JKuCh4ktwPOd4m72Wpv9A1AxLyJP4yJAG"

--JKuCh4ktwPOd4m72Wpv9A1AxLyJP4yJAG
Content-Type: multipart/mixed; boundary="Ko4O7GGjRIAOM8wZNWa4L3X2wP26vywNq";
 protected-headers="v1"
From: Varad Gautam <varad.gautam@suse.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Message-ID: <04c8cecf-9707-821d-913a-9bcd5a26e247@suse.com>
Subject: Re: ftrace_init doesn't patch _mcount calls on boot
References: <9b57034f-a4a0-1602-d331-5883f961cd7a@suse.com>
 <CAOnJCU+RXxiP+_qK=H_d30tUg1-GMo5PDk+WBVFLumquXYUNNQ@mail.gmail.com>
 <CAOnJCUKuywqBd+E2gtPnsJMdcQUqS2P734CYWuOPavprhkAa3g@mail.gmail.com>
In-Reply-To: <CAOnJCUKuywqBd+E2gtPnsJMdcQUqS2P734CYWuOPavprhkAa3g@mail.gmail.com>

--Ko4O7GGjRIAOM8wZNWa4L3X2wP26vywNq
Content-Type: multipart/mixed;
 boundary="------------598CE19598DD6B630135521F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------598CE19598DD6B630135521F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/22/20 9:28 PM, Atish Patra wrote:
> On Tue, Dec 22, 2020 at 12:18 PM Atish Patra <atishp@atishpatra.org> wr=
ote:
>>
>> On Tue, Dec 22, 2020 at 2:53 AM Varad Gautam <varad.gautam@suse.com> w=
rote:
>>>
>>> Hi,
>>>
>>> I'm observing the following on qemu with CONFIG_DYNAMIC_FTRACE=3Dy:
>>>
>>> root@debian:/sys/kernel/debug/tracing# echo function > current_tracer=

>>> [   73.674265] (____ptrval____): expected (00000013 00000013) but got=

>>> (00006097 a38080e7)
>>> [   73.675144] ------------[ ftrace bug ]------------
>>> [   73.675665] ftrace failed to modify
>>> [   73.676548] [<ffffffe000002010>] _stext+0x10/0x3c
>>> [   73.677641]  actual:   97:60:00:00:e7:80:80:a3
>>> [   73.678534] Setting ftrace call site to call ftrace function
>>> [   73.678842] ftrace record flags: 80000001
>>> [   73.679088]  (1)
>>> [   73.679088]  expected tramp: ffffffe000008020
>>> [   73.679687] ------------[ cut here ]------------
>>>
>>> This comes from ftrace_check_current_call(), which ensures that the
>>> patch target location is set to NOPs before patching it with a
>>> `auipc/jalr MCOUNT_ADDR` sequence when ftrace is enabled
>>> (ftrace_nop_initialize -> ftrace_init_nop -> ftrace_make_nop ->
>>> ftrace_check_current_call).
>>>
>>> Dumping a few function prologues from memory before enabling ftrace, =
I
>>> see that boot-time patching didn't work as expected. The ftrace_stub
>>> call sequence still exists, which should have been patched over by NO=
Ps.
>>>
>>> (gdb) x/10i blk_put_request
>>>      [...]
>>>      0xffffffe0003169ba <blk_put_request+14>:     auipc   ra,0xffcf1
>>>      0xffffffe0003169be <blk_put_request+18>:     jalr    446(ra)
>>>
>>> (gdb) disas blk_put_request
>>> Dump of assembler code for function blk_put_request:
>>>      [...]
>>>      0xffffffe0003169ba <+14>:    auipc   ra,0xffcf1
>>>      0xffffffe0003169be <+18>:    jalr    446(ra) # 0xffffffe000007b7=
8
>>> <ftrace_stub>
>>>
>>> Digging further, I find that the copy_to_kernel_nofault() wrapped in
>>> patch_insn_write() returns without the write going through. Replacing=

>>> this with a memcpy however, makes ftrace work as expected.
>>>
>>> I'll be looking into qemu's emulation for copy_to_kernel_nofault() ne=
xt,
>>> but I'd like to check if someone else can reproduce this behavior wit=
h
>>> CONFIG_DYNAMIC_FTRACE=3Dy.
>>>
>>
>> Does this fix the issue ?
>>
>> https://lkml.org/lkml/2020/10/21/77
>>
>=20
> and this series. It tries to move to fentry from mcount. Guo fixed a
> kernel panic in this as well.
>=20
> https://patchwork.kernel.org/project/linux-riscv/list/?series=3D403685
>=20

It turned out to be this one [1], which explains why replacing=20
copy_to_kernel_nofault with memcpy worked for me. ftrace works for me=20
with the current for-next.

[1]=20
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=
=3Dfor-next&id=3D635e3f3e

Regards,
Varad

>>> Kernel :
>>> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commi=
t/?h=3Dfor-next&id=3D7d95a88f9254b711a3a95106fc73f6a3a9866a40
>>>
>>> Thanks,
>>> Varad
>>>
>>> --
>>> SUSE Software Solutions Germany GmbH
>>> Maxfeldstr. 5
>>> 90409 N=C3=BCrnberg
>>> Germany
>>>
>>> HRB 36809, AG N=C3=BCrnberg
>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
>>
>>
>> --
>> Regards,
>> Atish
>=20
>=20
>=20

--=20
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany

HRB 36809, AG N=C3=BCrnberg
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------598CE19598DD6B630135521F
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

--------------598CE19598DD6B630135521F--

--Ko4O7GGjRIAOM8wZNWa4L3X2wP26vywNq--

--JKuCh4ktwPOd4m72Wpv9A1AxLyJP4yJAG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE49Yg7kstuyLsNGvS7SNinMIwFfgFAl/jMjMFAwAAAAAACgkQ7SNinMIwFfjf
cQf/US+zXpdTkYEqusmkwGQRq0P8SXamMLiQrFXnb9IG8z1Xmgzog2UJcSixHVvQzt9KgQ+QCaop
CeLDEke9HZvhakXCYFasf3Aja+WoLzx4k62PryBGi//k0R8aMvYgV0cjOXOyBwQ6TEJfXmsFmizx
NL1nUjthGjnrpf+Ug8YUmLPjRMEyzzT5T/JuWo6vc89ybQgd8BaQzYl2dXXfRBYwp5Ldv1Q3542j
2LdM0zTbg8W2RNMt9/QsmQWddmSCeHiqcQRVTrKcIgvZr0s3mgslulhYixG2gglyHVQEDSEN4RAP
W30mTRFvy9XThg8BnAqoLeg+jx8R59cKg1ZQ7DrKvg==
=zxqw
-----END PGP SIGNATURE-----

--JKuCh4ktwPOd4m72Wpv9A1AxLyJP4yJAG--



--===============2183146926025438984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2183146926025438984==--


