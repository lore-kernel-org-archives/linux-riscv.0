Return-Path: <SRS0=YJ0P=FX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C64EC4361B
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Dec 2020 09:54:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAAD823B08
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Dec 2020 09:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAAD823B08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eYwPPU8CGsldCaKYP5Ry5xyeOdQQuNfJOIjxNOStOfk=; b=fajFoXQn4QTlsYOUkcztmp7em
	Cts/zuZqvwsjb+jG11qWA4FimsEnndtcrkBfkSf7x2C9ygSP/3Iraifa3KWu+OA/debBjvxr0z5Lg
	yMcc2V96uQWChO2I41lCJyMCnpIpr/Cdrr+HYeBqZCpHrAxvRAloH52Dn7cbuO/UhdF6VmyS/6uf5
	U6vy53oPC8abPFYS5X6/W9hmGbIP1VuxHwZcM2a+2OzafYoh65cSde8oasw33df5kzhGvkYGn12dE
	Rk+65RMZPha8ysWEUrkoYwsKU5EuKPXJNAfzVqKMEC2eATQlP1kn2CdhPJNiAeLARHq8Ci8DQIt2q
	XlT5upkDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqYwm-0002vb-OR; Sat, 19 Dec 2020 09:54:44 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqYwk-0002vC-FG
 for linux-riscv@lists.infradead.org; Sat, 19 Dec 2020 09:54:43 +0000
X-Originating-IP: 90.112.190.212
Received: from [192.168.1.12] (lfbn-gre-1-231-212.w90-112.abo.wanadoo.fr
 [90.112.190.212]) (Authenticated sender: alex@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id DE4B240003;
 Sat, 19 Dec 2020 09:54:35 +0000 (UTC)
Subject: Re: Looking for a Roadmap / TODOs
To: Atish Patra <atishp@atishpatra.org>, Varad Gautam <varadgautam@gmail.com>
References: <5684d662-b0ae-15d7-687a-3cf9daf174d4@gmail.com>
 <CAOnJCUJvg=9pMezhbEtRfruh1CadZvKcnfwSf5aJQ1MmGCPGrQ@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <80f809f3-3b30-2ba4-1399-b37717abe1b8@ghiti.fr>
Date: Sat, 19 Dec 2020 04:54:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCUJvg=9pMezhbEtRfruh1CadZvKcnfwSf5aJQ1MmGCPGrQ@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_045442_609197_7B46D461 
X-CRM114-Status: GOOD (  22.07  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Varad,

Le 12/17/20 =E0 1:43 PM, Atish Patra a =E9crit=A0:
> On Thu, Dec 17, 2020 at 4:26 AM Varad Gautam <varadgautam@gmail.com> wrot=
e:
>>
>> Hi linux-riscv developers,
>>
>> I'm interested in getting involved with kernel development on the
>> platform. ATM, I only have qemu available (no real hw), but I suppose
>> that could be a good start.
>>
>> I've started looking into enabling CONFIG_RELOCATABLE +
>> CONFIG_RANDOMIZE_BASE as a first task, since I found these missing on
>> for-next [1].
>>
> =

> Alex had a series on enabling CONFIG_RELOCATBLE [1]
> Zong had a series on enabling CONFIG_RANDOMIZE_BASE[2] as a part of kaslr.
> =

> [1] https://lkml.org/lkml/2020/6/7/30
> [2]https://lkml.org/lkml/2020/3/24/131

I did not have time recently to work on RELOCATABLE kernel, but that now =

changed and I'm going to pursue this work.

But you can see that my last patchset was not well received, so a fresh =

look could be great.

So maybe you could:

- review my last patchset v5 (and take a look at what I tried before in =

the previous versions) and check how other archs implement relocatability
- review Zong's KASLR implementation and see how KASLR could fit on top =

of my v5

And all along this process, we can discuss to find the best approach.

On my side, I will now rebase my work on top of master to refresh my =

memories and I will share a branch here when it works.

Thanks for proposing to help, relocatable kernel prevents sv48 and KASLR =

implementation to be integrated so that would be great to "fix" this.

Alex

> =

> =

>> Since I am new to the riscv ecosystem, is there a checklist/roadmap of
>> things missing from the kernel where I can find stuff to help out with?
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/?h=3Dfor=
-next
>>
>> Thanks,
>> Varad Gautam
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =

> =

> =

> --
> Regards,
> Atish
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
