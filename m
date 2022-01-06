Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F392C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jan 2022 01:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycB0cJVGJFr5O1MKbICPoaEzdNbhFyWSz3yUCod3uX4=; b=seNLOD82wH0CZb
	IOLk8RI2LeZKuHt4Kn/OQMFdEJjR6GLSmYW9FjoXPo41JOcv41HD9zjflAG+AGC3FX1PlwmWh6jKN
	mJTkg9HazHPxm5U/mPu9VB6ZPuZ3jsI48eN5GqK6DwLmrfHDbuLctGcj0hJxhU5z/L8i1JGhMl6AD
	DRnGkZ6YHoVoWqc/i3HbmNpD6ioA4DEtNHlsjU6cgJe/PeE8CVpqBvzNxLtpinIv7vaJxA21bBAY2
	lsLBCgBi9CUY/h1zLlJ9spALjJzo1KNJA5rvuh6356jbgQ9tuuOEckfjJBqzwjwNq1/VX3Hkmga1j
	4/LeBFI6kqT9HxRetKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5I0E-00GCCF-38; Thu, 06 Jan 2022 01:55:42 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5I0B-00GCBt-QY
 for linux-riscv@lists.infradead.org; Thu, 06 Jan 2022 01:55:41 +0000
Received: by mail-lf1-x12a.google.com with SMTP id x6so1861273lfa.5
 for <linux-riscv@lists.infradead.org>; Wed, 05 Jan 2022 17:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OY3uWewQtYqbmVzvOMrfMhsghQBKU5B87qtjpHzkHwM=;
 b=ipUfJrPtuoM3OX+8XpUGTuzwp8LIrxnrnVTCz/NKRTFLj0eDItJI7MINOV2zCJh4fP
 DUBDZ5m8TOKZUoat+Zen2mZLg4iwATK4/TJ8oLpzCYdJDwzIOephdvB2QCmrmbdnET3w
 t2pzXnxwlHCX06cLahqhBDjbwBeAxW2KUAPXgGX1rnTpvBRDzHUtNNFJVUyjr7/kgF+p
 sZxWdQP4r9PAFgBmZobrpKewDOjY2CyFHi9mf+Wb/TiVoOEQG/X4et0ZajC9Mt2d2zM4
 m2QmFoKsHMYZzptDMyHI8PE0L+rF/Icb/slVZUei4K/YTUoFNBAvqFWPjsyM8f/4VBpw
 ZGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OY3uWewQtYqbmVzvOMrfMhsghQBKU5B87qtjpHzkHwM=;
 b=VJGEcCZh/pUXx0LUF8UHdXp40MvN+lLU4vPSBqtV57jqBllHWdN3Gz1m22WoAOGpUe
 I2cAJbJHkv8eKakOI/KciSanAkFdgCr9onsHbRZw3pPE4NGv6ozWW8TVLP0ABQfV8PgQ
 duXfksTYtzR6zIvZCk9dkBDqZUyqWRK+ODnptteVKbmFnl0cs4PDkO7G4zDLMmr3e9yo
 rXopjy2HqMR8aE7Xw6OMKVvzTCo7JFG+xdrLATbBlIXb7LoYgUTPwTayJIfhz7vtPtM1
 EfRijWjUDtI89SLCXkyjwLyhU3xzDwjTcPn28nbeYKF8kmkBBx0i32tDczKFtyOYeI/S
 cwog==
X-Gm-Message-State: AOAM533+didlgMVgIBqddtvWNK4lPxWF6pWaNObZM1wxpk29yHWtrjWp
 OwGbRPh6efcVs0qSUglO2Bthv/wVV6ogR+zojBKnxQ==
X-Google-Smtp-Source: ABdhPJwpOpaROeBcJuF5ML+cbQJ+6ZpxXluAtT9hh8WQwOGx1lb+lORNlbJeI+rM8pjhVvPrEb8pwtAYLIOeVAUeufk=
X-Received: by 2002:a05:6512:10cc:: with SMTP id
 k12mr44602930lfg.5.1641434134779; 
 Wed, 05 Jan 2022 17:55:34 -0800 (PST)
MIME-Version: 1.0
References: <7823666b57c105aee8323e6896f83f3ed249d9ee.1638957553.git.zong.li@sifive.com>
 <CANXhq0qdNxxi=jmrpMO-NKbxbHwaqoj=VGqphCw8cz+9DAyBDw@mail.gmail.com>
 <20220105234103.D597CC36AE9@smtp.kernel.org>
In-Reply-To: <20220105234103.D597CC36AE9@smtp.kernel.org>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 6 Jan 2022 09:55:24 +0800
Message-ID: <CANXhq0qVsgposTnYQStHGP6c0NTgZP7W_QpzzG54kKwRqr=72g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] clk: sifive: Fix W=1 kernel build warning
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, lee.jones@linaro.org, 
 linux-clk <linux-clk@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_175539_921904_551D5771 
X-CRM114-Status: UNSURE (   8.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 6, 2022 at 7:41 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Zong Li (2022-01-04 20:24:28)
> > On Wed, Dec 8, 2021 at 6:06 PM Zong Li <zong.li@sifive.com> wrote:
> > >
> > > This commit reverts commit 487dc7bb6a0c ("clk: sifive: fu540-prci:
> >
> > ping
>
> Please don't send "ping" at the very end of the mail and trim nothing
> else. It wastes time.

I got it. Thanks. Let me resend the patch with the change information.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
