Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADACCCA470
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 19:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ig28foX0fbBLUw+5+2RWsIMmLXel9gKbvejhIgaHaPY=; b=gyhKMC7DK2q3/d
	V3tsBlLBqb/NBiFjKaz+t2mRrA01xqJ2GWob5JvH1BvIWhItc2RebA2YZIgzPDpT6t6KuwpTHeI8S
	AqdAMccSqrhDZ/41jgsTBQfbpiSDJHu+LwdJ7nvXbHa6rNeCwMIcswEonbXfx/nSoZ2pb1o9oreUN
	uT/tYN2B8MqpK3UhkBWBd+gkTUR3Sy9tQ6WPm3mGSo8xCjJL3bExpTGSv1dnFV+eiQvpd6JMo5cM8
	X6/pAzX8lNCBnI6qZ9C/PwSnHMbvpqdMbfPzoC+EdSa+PBYyvLDBVoXyiQpS6MQNnSJ+/qyto4iW2
	Piw/BCesHOdP6pDcQrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v42fu-00000008qmh-0Yt2;
	Wed, 01 Oct 2025 19:39:42 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v42fr-00000008qmB-3Ayu
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 19:39:41 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so559697a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 12:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1759347577; x=1759952377; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EyU2xAA6jBou2pgzogPav9cxdB63oJabTBBunDFicTI=;
        b=H3u/wYayTvLHTr2cnHsODTJDaIvK/wNs0Koeo5Kv8qADhv7loSbuNTlB11QfWuZh2W
         +mhV1hO8A6oc/DEI6xf4MWOHakbSNzBD0nsKD9Eq9oE2b7mQNnZv6FtcVwxcrFJsGa6I
         mtV9j7jR9x1/KvAyVgtmqZ3QNCGS7lcxn45fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759347577; x=1759952377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyU2xAA6jBou2pgzogPav9cxdB63oJabTBBunDFicTI=;
        b=BkxNE2J92XQuJuC1psyjU6iS/bnp80jvuwLwMXsoXgV9wnuHwllNQo6ChvXrNVGIAw
         57BAriZzFXvY38crfgqxpW5J7Bp7xmCBM/Nte/p8nHp85+6PkFWcqabeATpTXELage/w
         2aCrqReN9LEyt2NKua9ajQyVZyXf5VUSWEf2U2x4OJi/LuVTb3rUkUgMHnuy2dlsvSP/
         zGi0S0vWvIDmqWUbGR3IwDMoYOVH1gYx1xuvo8WYuEOuXYE9kZJC0NBlX7OuyuVruk5R
         74AfemZwI5MyibhVwiD1vtmvc+ElKK8WEwnOXRocZKFkR62HESI1Zk5TUCM7U2+Cue4A
         oGDg==
X-Forwarded-Encrypted: i=1; AJvYcCV3OApwAvtw5/eaG59aCONi+HgHU8um1X6GmIO6w2xK4FXXBpRGR2vFbpUhCOjEPE2GLQZI3rJag/Tlrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqYgYHl8GnBRw7u6iOyI/AD6VSVfcaOCrMlRl3z6vkWn9hcBbG
	1jHpdDHnc/eRmWRuxHL7fVeyh0mnnBdFzhrkeEN+5ss0VTfZzr5DHOGvQR90P7nMYTiwd6QnwZi
	Jlx9D7zI=
X-Gm-Gg: ASbGncuzMZLuCOf2EZOgcW2EwK3rBmxGHB2nea0cwlcd0iZqvVCAeVguFrUgM1XSF5Y
	s+9xf3N/NoGGmfc+liUUWliKjyb+s2drAbzwpXpOlV/wLLaG9nsSz522LMxhH4+YByBPxhj81LW
	cYEa1cuQtAq47+EYZRUj3AF8WW7yDYuJTjJHJLbQsAWy+sbwVnECVcuOo/prb91/8oEze8nkMXG
	ema6ZRPWaei75juZc5aqVAJ4HEY4D5DnjAcFeh49YeiU3s1Yw6OC1tZ+fMYOfmxOetqTFa/AcHz
	TMI05YGF6T25ZFWcvlhVk1AapMkl+K54aoePwYnMAzZxAPRCyUO8w5PXNgUvf6l6e5jJt0TRU7R
	8By41XhFqBpEMURhdnMleKos/zvqJh6ezM7714fQm4ity3EDpTeht36sbmbT9FuHsLisnBYnucr
	deLuChNbrSsLjJCjWeQAaI
X-Google-Smtp-Source: AGHT+IHf1sqbu+t/+PXb2rXSJJ+g2yzQUwwRg9pRIc55dxJgc5pww+A/itxCdmpTZolqd9mY6DPgmg==
X-Received: by 2002:a05:6402:2355:b0:636:7c68:6e31 with SMTP id 4fb4d7f45d1cf-6367c6870cfmr3874305a12.4.1759347577215;
        Wed, 01 Oct 2025 12:39:37 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6378811ef53sm369847a12.44.2025.10.01.12.39.36
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 12:39:36 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so559646a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 12:39:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxjZQq7TxafakRKRejiN6E3fwBpPzj0gHXlQcGnhFXODmTA27+rxTPvR9a9vwrTQgYQuCdghxw0dSIbA==@lists.infradead.org
X-Received: by 2002:a17:907:7ba3:b0:b3f:3570:33f6 with SMTP id
 a640c23a62f3a-b46e92792d3mr558060266b.48.1759347576045; Wed, 01 Oct 2025
 12:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
 <066d70c7-b0a7-45e5-9337-17901bc95664@codethink.co.uk> <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com>
 <CAHk-=wgYcOiFvsJzFb+HfB4n6Wj6zM5H5EghUMfpXSCzyQVSfA@mail.gmail.com> <20251001-patrol-recapture-4bdd58ad7582@spud>
In-Reply-To: <20251001-patrol-recapture-4bdd58ad7582@spud>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 1 Oct 2025 12:39:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wji-hEV1U1x92TLsrPbpSPqDD7Cgv2YwzeL-mMbM7iaRA@mail.gmail.com>
X-Gm-Features: AS18NWAcg4y35bgDLtTylWGCwrYt77STUObMvEAm9g4dQ-aeAY5vIymwKHS9zes
Message-ID: <CAHk-=wji-hEV1U1x92TLsrPbpSPqDD7Cgv2YwzeL-mMbM7iaRA@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
To: Conor Dooley <conor@kernel.org>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Paul Walmsley <pjw@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_123939_853505_89D3BED0 
X-CRM114-Status: GOOD (  18.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 1 Oct 2025 at 12:03, Conor Dooley <conor@kernel.org> wrote:
>
> None of that was really done as a deliberate attempt to add support
> for BE, in case that assuages concerns you might have about the taste
> of the arch maintainers..

Thanks, it does.

As others have mentioned, the arm64 support ends up being problematic
and people are actively trying to remove it.

BE is dead. There is one good reason to support it - legacy
architectures designed and implemented back in the days when it wasn't
dead _yet_.

But it's a huge pain, and the world has moved on. Dealing with BE with
any half-way modern infrastructure is a dead end, since things like
PCIe are all fundamentally little-endian.

If somebody really wants to create bad hardware in this day and age,
please do make it big-endian, and also add the following very
traditional features for sh*t-for-brains hardware:

 - virtually tagged caches

   You can't really claim to be worst-of-the-worst without virtually
tagged caches.

  Tears of joy as you debug cache alias issues and of flushing caches
on context switches.

 - only do aligned memory accesses

   Bonus point for not even faulting, and just loading and storing
garbage instead.

 - expose your pipeline details in the ISA

   Delayed branch slots or explicit instruction grouping is a great
way to show that you eat crayons for breakfast before you start
designing your hardware platform

 - extended memory windows

   It was good enough for 8-bit machines in order to address more
memory, and became a HIGHMEM.SYS staple in the DOS world, and then got
taken up by both x86 and arm in their 32-bit days as HIGHMEM support.

   It has decades of history, and an architecture cannot be called
truly awful if it doesn't support some kind of HIGHMEM crap.

 - register windows. It's like extended memory, but for your registers!

   Please make sure to also have hardware support for filling and
spilling them, but make it limited enough that system software has to
deal with faults at critical times. Nesting exceptions is joyful!

   Bonus points if they are rotating and overflowing them silently
just corrupts data. Keep those users on their toes!

 - in fact, require software fallbacks for pretty much anything unusual.

   TLB fills? They might only happen every ten or twenty instructions,
so make them fault to some software implementation to really show your
mad hardware skillz.

   denormals or any other FP precision issues? No, no, don't waste
hardware on getting it right, software people *LOVE* to clean up after
you.

   Remember: your mom picked up your dirty laundry from your floor,
and software people are like the super-moms of the world.

 - make exceptions asynchronous.

   That's another great way to make sure people stay on their toes.
Make sure machine check exceptions can happen in any context, so that
you are guaranteed to have a dead machine any time anything goes
wrong.

   But you should also take the non-maskability of NMI to heart, and
make sure that software cannot possibly write code that is truly
atomic. Because the NM is NMI is what makes it great!

   Floating point! Make sure that the special case you don't deal with
in hardware are also delayed so that the software people have extra
joy in trying to figure out just WTF happened. See the previous entry:
they live for that stuff.

I'm sure I've forgotten many other points. And I'm sure that hardware
people will figure it out!

              Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
