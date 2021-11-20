Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2302C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 04:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDAwcA5/BF+64JVIU9W49c2dq+d3ipHPcwUDR6SGh8o=; b=IKZ7QzjxEEmsSw
	H68XEyFro1BdGqPySQgjNf+ujCT96HMXV35equyFbHfv54s5R4lWuU5sOfJl0wyaWSWFNo/xJuSse
	3mElg3jdY8EzTO/VZJUFxcnBHFSla0izCzq2SXJf4g4sZfDLLuyX8z+kJY1ch7N+ld3khNuRCQOh9
	2/dJdydvIotTSoqlrPUXWn0RIGO4qURjyc9p0WDIRyQZCWnvyVVB0Thi6D++8A//yREHp+XJUQW0V
	DnPaLx67Hcn0xiLUVi5ujq1GWGwZxQSVUAHjxzf+rozYLUKPAlNjGMd7v5ByOGH/hBWjAHZDJbPSF
	U98zZKgFl2Rhnoh/y1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moHj6-00C1ps-K9; Sat, 20 Nov 2021 04:11:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moHj4-00C1pA-00
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 04:11:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id c4so21471111wrd.9
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 20:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JWLbJkpo6Rm01+cE0Cdbx5WIjgwCuoHArS5V+/RayoM=;
 b=V5a0P2h2KZAGPmi0Y1Ajp4Sg4CJ5JSJyQBUC1R2mOr9bI9AvjBwSZu7+FRHG+BJtaV
 P+s44AwkYt6I6LwyJVSn+Ra+SQS3oskNcqbRTAkTOkmX6z2q5oL6/nxYajJ5Scradvpa
 ca5HP7aaShn9kDjjiR2J85SBJtjACUtkeu9KlUc6tDeGmWLkc1m7kx9prPN47VN23Pzo
 fU59Q1Z5+YeXpTeGO0H9z0TKUSFycXgeOtBRPUjCKxWVwiN+4CreV+ZqPkStBiV0jl52
 kXae5QdB14DIYufgq0WFq6nNTeQmEjUtYWHOMJZ/NbpXxv6bqR0+Xo8QNcPIYqbgEC+N
 j6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JWLbJkpo6Rm01+cE0Cdbx5WIjgwCuoHArS5V+/RayoM=;
 b=h4DzckgGhBD51ZO2AADyD1kO7sg/j9UA2m8ZTjlJqphjL9wm/mCm3wxCUFWYukhsNi
 gw++gl4x+j0WuZ11TysAqlBr1tnd0r25ejkJ8BuRddfpF/h5Fn9LTBr35x67iyxagc62
 XOFWJn6bPRJWl21lfIBz1/FSyIe7lDfqyeBD/xAupuRebg5BrxKvnppO7VlxNwz3Btao
 kObwIocC00VckiAJweKBwwWD0nxiuGGmMpUApQMdNnI8JKgENbeV/L7G8p0aBLjdHLFW
 hdxWMQp5kQz8W50j7RzYE4gJ76rAOodnSWUVgBp70floLRcykqyifK38W863G1uRfaPm
 RfBw==
X-Gm-Message-State: AOAM531uj+/nQ5L5z6WxcBQc8virYn0uH8IGfC/PjU7+rOn8uaCKlA98
 CYyIRT5opnynSYuLLbYxgFHikkHWAt5z7QnD64vF7g==
X-Google-Smtp-Source: ABdhPJz4aJsW/UOqF2dYULYVm3gPT0c2VUiQ/Wv+ZVkXA7hT5IVeD10iCbO4KEbry22s9NLos02JcyrZJCZ9DmUly4I=
X-Received: by 2002:a5d:628f:: with SMTP id k15mr14458898wru.363.1637381500428; 
 Fri, 19 Nov 2021 20:11:40 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-1-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Nov 2021 09:41:29 +0530
Message-ID: <CAAhSdy3LgDmv5dfuOnBXpJsD_noPecgpjzf7V8v2UjM8WVHcjw@mail.gmail.com>
Subject: Re: [PATCH 0/12] RISC-V: Clean up the defconfigs
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, axboe@kernel.dk, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_201142_062521_7FB5FB33 
X-CRM114-Status: GOOD (  16.53  )
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

On Fri, Nov 19, 2021 at 10:14 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> It's been a while since updating the defconfigs, so I figured it would
> be good to go through all the diff to make sure nothing was lurking.  It
> turns out there were two minor issues, which I've fixed with the first
> two patches.  The rest of these are just cleanups that should have no
> functional change.
>
> I don't have a K210 (I might somewhere, but I've yet to boot it) so I
> can't test this to make sure, but I think patch 2 is the reason we have
> a special !MMU PAGE_OFFSET config.  If someone does have one it'd be
> nice to be able to remove that special case.
>
>

Using savedefconfig, I used to always get a huge diff so thanks for
doing this cleanups. Going forward, I suggest that we insiste everyone
to always use "make savedefconfig" for creating defconfig patches.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
