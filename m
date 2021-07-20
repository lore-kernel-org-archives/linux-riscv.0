Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470CFC07E9B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 17:28:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0200660C40
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 17:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0200660C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+i7r4ZRPm1yzgZUQyX8f3KH2F3oZCwmrwWWfh3i33Q=; b=sDZRBiNrQ9Ftrh
	LAfU8PDKtpU2q62s9Xb4N7NbwNll8u1QB25NYOpV9IpW3LdhFYzMC2mTzrtBMut1wEbv7KeesgSyy
	yYvV0A3xAhimXhqWsFd+ZuQ2Vb/D42csmD79yNRbrYY7U1mdeyCXN2LTQElizDlfGJIA6WRCoz5r7
	Fn1fENzMW05Dx/BT5ZO39DtxnmlplEiOWmg+JumWo/CHKgKb+qqMEcqLM8pzPuDyvgw51HR4nXmVa
	W8vMImILVQAS8RkJvJBppH8EQsN9klyoplYm2mVHfncNlr2LJEvfPeoEb3pMzQAwce8345yfktnIq
	/9xPUEoOA2LEO+hfWaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5tXC-00Demc-GV; Tue, 20 Jul 2021 17:27:58 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5tX9-00Delv-9n
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 17:27:56 +0000
Received: by mail-lf1-x136.google.com with SMTP id g22so25018998lfu.0
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 10:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ysYGAPlEUtPyYg//R1Cs+lssPkAFmUxi9IYzMZWM+Fo=;
 b=P69YrFBat/2pZNt4YSDYC2y9cog2PQFIuOwdMUCxuksX01mRbTN3crCCK6yJM98b9k
 b9xBqKgUUzYcn/TqYJDDahiPWWNM3HULYE/paVqy4wuYo90ZhILdwbzMzKkJ0UHU29Jp
 bmexrZLfodKGLiNjAMufPMkrGweXti5bBsnB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ysYGAPlEUtPyYg//R1Cs+lssPkAFmUxi9IYzMZWM+Fo=;
 b=pVVNzYtbm78wluQNkazFjLLpSCYGYr7QkowTw62wseblFyepccYjxfG0crS7119945
 jT2+BbY8ciHGcjNbamKAKL8InY3h+PVkr2hCuoGPP3OupdGfTMa+JLtCrONIcYQtv0mv
 uMlN4VvI5nuda9ZEMQt0+Awyk6Reau63Jl74SBZqa8FHkuLcinQBC5B6gR7lvPtJZnwX
 dHRBKoz/cj1q7h3kGp3ugQQ4SNyKrt1E0ZY+SDV6GycSwAzRSjId7Aps6iTi/ipl3Sm1
 tMicI7zF27STtBzNYUWOfjcw3sbGsdfiI9aNNEyZ6w47HshC8eYJAHb3uJkcCfxp/ga5
 I1xQ==
X-Gm-Message-State: AOAM533r0GAtZd+tPTzruQf3onSl0rk7ctUpW0LDO0MSNtUfYc/mqh7O
 8Bsg0g4pRd+GQCheZ6cmModYLv1ShMHxvJNf
X-Google-Smtp-Source: ABdhPJzKATpw4y+I6DqXy1ZRdhz3nTTXT+Az21k3N0wu4VXhgSRNyiLeiJj7LwaxyEYCFPM8BwARbQ==
X-Received: by 2002:a19:c7c3:: with SMTP id
 x186mr22855896lff.219.1626802073705; 
 Tue, 20 Jul 2021 10:27:53 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id b13sm2283985ljq.53.2021.07.20.10.27.53
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 10:27:53 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id y7so31640168ljm.1
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 10:27:53 -0700 (PDT)
X-Received: by 2002:a2e:90cd:: with SMTP id o13mr11205084ljg.465.1626802072978; 
 Tue, 20 Jul 2021 10:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wjYghA5O+ZsWKVNApMK3j4V1EibO5P+c4MrHnqp8YhY=g@mail.gmail.com>
 <20210719140437.GA2178213@roeck-us.net>
 <CAHk-=wivYZGxR4oumBk_rTAstRx=WWpwBAgS7n3M5ydbd0rTzQ@mail.gmail.com>
In-Reply-To: <CAHk-=wivYZGxR4oumBk_rTAstRx=WWpwBAgS7n3M5ydbd0rTzQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 20 Jul 2021 10:27:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhcFUW-iauLkZ61-J8V4kNAAGq0GVdbGTUc6MZyvSF9w@mail.gmail.com>
Message-ID: <CAHk-=wjhcFUW-iauLkZ61-J8V4kNAAGq0GVdbGTUc6MZyvSF9w@mail.gmail.com>
Subject: Re: Linux 5.14-rc2
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_102755_396007_C181A513 
X-CRM114-Status: UNSURE (   8.32  )
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

On Tue, Jul 20, 2021 at 10:24 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Don't know if you guys saw these mainline -rc reports:
>
>   https://lore.kernel.org/lkml/2c03b355-86dd-1fa6-dbaf-5857f4a45a66@roeck-us.net/
>   https://lore.kernel.org/lkml/20210719140437.GA2178213@roeck-us.net/

Duh. Wrong link for that first one. That was a reply in the same thread.

So the two links for rc1/rc2 test results should have been

    https://lore.kernel.org/lkml/20210712015619.GA3547193@roeck-us.net/
    https://lore.kernel.org/lkml/20210719140437.GA2178213@roeck-us.net/

mea culpa.

          Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
