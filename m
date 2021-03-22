Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AD5C433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 12:05:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4440B6198B
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 12:05:43 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oudkpm1E4pMm2D2hQ21ZSEEyD2qbNPIQwwqyZ3u5Kfo=; b=XHmd+MuKNDeKSaSD1bMaH1jGM
	8LmKmIJpcurzJu+P1HRSvl3bhk63vPV+WixHuOMLVxBYdBGRzLWyptVjbhHZTKXFwRMSvF0YqBEr+
	L4QBjfGJUYC4Oilsnc8DkoTq5SDy9GMD9s+kaAHCbqbVZMhP0/h75Etf+VMu48h0Db++nrbhJQ90G
	O7JKAqrGtxHK7gQkABRZYLx0cqSpkB3prYA24QlzANJGJOVdPVL0BFTjl67tOqSdjrrY2+0MjUv0l
	4j6AlkoU4A8yu7TkK1CnN9crgdT3IRaV6xPl9oB0psMJ/vBC1OqdR/nA4gqxBHgYrplHKD31wQLKe
	w6rSQzHjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOJJE-00BXDc-Ct; Mon, 22 Mar 2021 12:05:24 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOJJ9-00BXD7-Et
 for linux-riscv@lists.infradead.org; Mon, 22 Mar 2021 12:05:21 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lOJJ3-00026c-Of; Mon, 22 Mar 2021 12:05:13 +0000
Subject: Re: [PATCH] RFC: riscv: save the SR_SUM status over switches
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Alex Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Terry Hu <kejia.hu@codethink.co.uk>,
 syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com,
 Dmitry Vyukov <dvyukov@google.com>,
 Javier Jardon <javier.jardon@codethink.co.uk>
References: <20210318151010.100966-1-ben.dooks@codethink.co.uk>
 <d745046a-182a-2854-8fd4-d6f120aa3bce@ghiti.fr>
 <451e8f69-248d-82fb-f368-e2972eea83c7@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <368890fc-d1c6-ec1f-f211-e49bfde3e8a9@codethink.co.uk>
Date: Mon, 22 Mar 2021 12:05:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <451e8f69-248d-82fb-f368-e2972eea83c7@codethink.co.uk>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_120519_915609_DB5F5E92 
X-CRM114-Status: UNSURE (   9.59  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 18/03/2021 17:42, Ben Dooks wrote:
> On 18/03/2021 16:57, Alex Ghiti wrote:
>> Hi Ben,
>>
>> Le 3/18/21 =E0 11:10 AM, Ben Dooks a =E9crit=A0:
>>> When threads/tasks are switched we need to ensure the old execution's
>>> SR_SUM state is saved and the new thread has the old SR_SUM state
>>> restored.
>>>
>>> The issue is seen under heavy load especially with the syz-stress tool
>>> running, with crashes as follows in schedule_tail:
>>>
>>> Unable to handle kernel access to user memory without uaccess =

>>> routines at virtual address 000000002749f0d0
>>> Oops [#1]
>>> Modules linked in:

[snip]

I've had syz-stress running over the weekend now with no further
occurrence of the fault. I'll put the put_user() patch out now and
will further investigate flags over __switch_to()

-- =

Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
