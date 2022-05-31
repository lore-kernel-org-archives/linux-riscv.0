Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E1BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 31 May 2022 23:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OpqBKdHt0lPwcaT0wThHnTWDWdxeBf6Md7YQH7kPnsY=; b=p44akILWDK1EPDtssTN3pPowlQ
	5hZNjev2BdvNUhqpRBzmxBTgCxlg5xg2c58+m6OCoEsJxUOo2NJ/tjciHF+1HUgQxi8T9aXG+9gZZ
	dWEmVoYjyDtQlqV0Y67YcQN+hecnXWLNYTqtHCzI3WUtKugyXDlo5OXRcJM0OZNRWW6WpzN/YQQ+6
	KDGzDTMWClY/RXNQJqTGwRRJUKrjVvPqGuoKIEz0nwC6IZhB4kpVB8LEsNCX/XZg7bLaTCSvxBz5y
	KQd6bUg9SC955hZGU2lxNHMPIp9r2oyp4JG90NL4L4BpiOXsUipfrYXNhpGkJtmb0KLAB8+iu9K/2
	1KV7bIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwBCX-00CzV7-EI; Tue, 31 May 2022 23:23:01 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwBCU-00CzTn-JA
	for linux-riscv@lists.infradead.org; Tue, 31 May 2022 23:23:00 +0000
Received: by mail-pj1-x1036.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso379200pjg.0
        for <linux-riscv@lists.infradead.org>; Tue, 31 May 2022 16:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=FKa/exg80q3Okni/CqHYIJ750Grih4tzVzwD5wDdMrk=;
        b=2jk4pcLua88t2dFrSqdSOuzeQo4JdMC8qT0jX+1K/Y2Hzl4X5eLNpSH18ruVc8z9IB
         mmhTM6Ef0Qm8P5mW/fJTWwvOhi52djawAZ4l3SmHR2zhvP6W/N8FuIzoutR+P4CdGCtS
         nWdRMMfoLy4nosxsd3Tr73cWuHnmsJ/oUloRNZnkIOpeoAr0CSl3m4o8CZqqfE/32jxV
         8yl5fweKk4s+qFBVUkrz4X7EVgRZBhueE4qpzm9PQMlRtLscQEuj6Vx0SsPBG9R8G36V
         RPr8LbAFjSGYZSRa1LQmO/HZy3G6Ge3bcPkm12VE0wrLVlNo+ohQEIueMLe0d1MLsQky
         pGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=FKa/exg80q3Okni/CqHYIJ750Grih4tzVzwD5wDdMrk=;
        b=2u+YaZHc7s0TarPFQvmX5ln/U/UdqeCd9LQ+Gk1a8lIMeQ4giM8gXgUdJbJCVKM9oC
         E8W8I388QSIQUOSF348Ix73G67bZemW0r2thvioWd2uO97+HUJzE9y3GzvdytdGVnnRO
         fRB5bIX5Kz9cao9zrIFNDQh5RBnkjQ8EiOT36tX6Po8pY7C/uADgNmOPov5OtaM7kB2V
         ORBkm9mSatJCuEzgjDBVipVWrn8ZWEqUUizBcJmOwoh3Aoa9u37b7ekTpuEl8i3h+6zG
         GDIqwZ0+PV6S4spQ86cqpj247PKfsFq7kXTUrpFweCVe8Z2t7Brmh6ZgG5FMBCBMYv/1
         coUQ==
X-Gm-Message-State: AOAM531JvUosxba4QevFF0Q9ZvACZMINcwczYi9W33sO4o9j3+SM/X5B
	tF1nUOSMA/1lkNPlOwuQuk6lGdMA9Ed/4A==
X-Google-Smtp-Source: ABdhPJwrGZs7IUC2JzbLIn3lRMOLiBR0ER03E5PHcGqnVKAOPXe5sDdBTFXcvWVVpAurdfHRc7Y/2w==
X-Received: by 2002:a17:90a:5c84:b0:1dc:9b42:f2cf with SMTP id r4-20020a17090a5c8400b001dc9b42f2cfmr30970168pji.123.1654039374887;
        Tue, 31 May 2022 16:22:54 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id iz18-20020a170902ef9200b0016363b15acasm87280plb.112.2022.05.31.16.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 16:22:54 -0700 (PDT)
Date: Tue, 31 May 2022 16:22:54 -0700 (PDT)
X-Google-Original-Date: Tue, 31 May 2022 16:22:51 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.19 Merge Window, Part 1
In-Reply-To: <CAHk-=whMTEAuBRAS7aonfVM9wgupOok4HO6gX9X0FBzE3Uv2sA@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-c2485265-8142-4d5e-9b9f-2b63d1e01647@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_162258_896770_FEF463BA 
X-CRM114-Status: GOOD (  19.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

+Arnd, who probably saw this already...

On Tue, 31 May 2022 14:52:16 PDT (-0700), Linus Torvalds wrote:
> On Tue, May 31, 2022 at 10:13 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> I have a single manual resolution in the fe510 device tree, just the result of
>> some conflicting fixes.  It's not showing up in my merge, but a bunch of other
>> automatic resolutions are which is a bit worrisome on my end -- I don't usually
>> touch other trees, but we had a handful of big cross-tree things this time.
>
> Gaah. I'd have normally preferred for things like this to go through
> Arnd, but it looks like he at least ack'ed these things..

Ya, makes sense -- I don't really like touching other peoples' trees, 
it's a headache for everyone.  There is a bit of overhead involved in 
doing one of the multi-tree merges, though, so I'm never quite sure 
where to draw the line.  We did one for the spinlocks where it was 
pretty clear that was the way to go, as it was used by a handful of 
trees and didn't take that long to get the RISC-V bits cleaned up.

The compat stuff was a mess for a cycle or two, though, and RISC-V was 
the only user of the new bits.  I always feel bad trying to dump messes 
on other folks, so I figured it was easier to just fix it myself and by 
the time that happened it looked like everyone else had stopped paying 
attention.  I poked it a few times both before and after putting into my 
for-next, but with the Acks I just took it.

After seeing those conflicts I kind of wanted to push for it to get 
merged a different way.  Had it not been both before some other 
stuff and a persistent headache I probably would have just sent the PR 
before that merge and asked folks again, but I guess I just wanted to 
finally have this one done.

Though now that I say that, merging something because it was a headache 
is probably the wrong message to send folks... ;)

> I've obviously pulled it, as you can see from the pr-tracker-bot reply
> that already went out.

Thanks, I'll try not to make a mess next time.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
