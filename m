Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB40C636CD
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 20:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQ8e6pQKcXG1ZrSGAURqeANjM8MGhn1tPUTxUz05Ouc=; b=pV7DKblkd+zsjQ
	ywJSk/ETL4bEe1998tMQG5jDLCK2wqh47+1dc6dTKsLNCQWRs6nUwb1gepnGH/RSoPHQaD12y7Na0
	H55oPvIpZDnxxOVNedgvDfq7tuDE3IU0O4WWEZfenh+yvNd8EurqxBgWBisaqAMy78Q1nh05gZwg/
	DGJ36mTyLifKLmxDaEV5IqNfjB6T/x1jpALhkRHtX7Ogf4NZV2OGZT11Hz/kjmxoTeOQCJV8+RCJG
	1OUBdbGYdK+UV7f3ztBHTNnEQP/akH6ALw3N5GGHQIP22nFK6LzPJqTweVstBsVCJMKw19jbIreZa
	+9eG3IMuAkwKryXbhP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOlpZ-006oaE-QT; Sun, 05 Feb 2023 20:41:45 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOlpX-006oZG-Bb
	for linux-riscv@lists.infradead.org; Sun, 05 Feb 2023 20:41:44 +0000
Received: by mail-ej1-x630.google.com with SMTP id ml19so29136991ejb.0
        for <linux-riscv@lists.infradead.org>; Sun, 05 Feb 2023 12:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nA/a76A+HUu/p3q1j/ksBjPXLniSmCFkRwLsRUtoauc=;
        b=RAXg4fKD/6SPLwBhZz74xHccwCI6WZIYpGpGHWQ9ObJeCvGoohTSAtwCqfiD+ZaDQ1
         aIRLI8OL+avYEEBlM4uINCdq7A3GKoZhraxTCpB9pYCimwQ4kIElEWhkml7G/7PEKTT6
         Vy21ly1st4HkkM+1bI4kXV+bK57J6A6HvWAas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nA/a76A+HUu/p3q1j/ksBjPXLniSmCFkRwLsRUtoauc=;
        b=AwRrr21ry1qcFY3eOYDEuSChYUOOy9y8Y95GWQGONR2Skq6e/Lv1aQt8z9K3HREN1M
         h2MVMt0vWH8BmH+5ylSvITzClUFWIoupaJF096DYOwVdLHSXXBq93Y7QYrsgVOSWO//m
         9pNIVLDFikAI9iVEvIcRYsXjUTM1XqlLrZlHKiJyCq2mKQ/YGtLU4T3sYNiurp7EQFXH
         +9wLFhiID6NqEFxHDrcayi75rttHhuGhSwbZSL+Z9kRyvsIpH2UFX/KE2HPkfAcncb/n
         v9AuIy7RwZ7/cCETUQLvduafloLw07xfFqtWr41vUGoAFDc11CrgJxanwCYxTsFuL6X5
         kdPw==
X-Gm-Message-State: AO0yUKUWQhKG7MjmRDefHVrtf1YY867UI7Cpp7xzQrAFgz/Igb47dtEs
	UnHSPz4OjdbyqDujtxW51rURnBE4e738Ois46SU=
X-Google-Smtp-Source: AK7set9peJLvXfuapMBjbNJib4atAz3FOpREfGgFU0bnO+pSRlFgQY6PDLpDRMHsJDl0WOQsj3r6EQ==
X-Received: by 2002:a17:907:a4ca:b0:87d:f29:3a16 with SMTP id vq10-20020a170907a4ca00b0087d0f293a16mr14939399ejc.34.1675629696965;
        Sun, 05 Feb 2023 12:41:36 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id p2-20020a170906498200b00878803d4049sm4553884eju.93.2023.02.05.12.41.35
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 12:41:36 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id ud5so29003632ejc.4
        for <linux-riscv@lists.infradead.org>; Sun, 05 Feb 2023 12:41:35 -0800 (PST)
X-Received: by 2002:a17:906:892:b0:87a:7098:ca09 with SMTP id
 n18-20020a170906089200b0087a7098ca09mr4402604eje.78.1675629695651; Sun, 05
 Feb 2023 12:41:35 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l0aBPUEpf1bci9@ZenIV>
 <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org> <Y+AUEJpWYdUzW0OD@ZenIV>
In-Reply-To: <Y+AUEJpWYdUzW0OD@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 Feb 2023 12:41:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh8+LsDDd8AFMwaYHAA+eLT8O2ziEJfpoeo_H6MCg2NKg@mail.gmail.com>
Message-ID: <CAHk-=wh8+LsDDd8AFMwaYHAA+eLT8O2ziEJfpoeo_H6MCg2NKg@mail.gmail.com>
Subject: Re: [PATCH 04/10] m68k: fix livelock in uaccess
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Finn Thain <fthain@linux-m68k.org>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_124143_416208_9BCB5EB5 
X-CRM114-Status: UNSURE (   8.43  )
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

On Sun, Feb 5, 2023 at 12:39 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> BTW, since these patches would be much easier to backport than any unification
> work, I think the right thing to do would be to have further unification done on
> top of them.

Ack. I'm not NAKing the patches, I was just hoping that we also have
some way forward.

So "fix the issues, then unify" sounds like the right thing to do to me.

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
