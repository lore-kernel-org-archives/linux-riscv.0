Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC021C00140
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Aug 2022 15:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ByF9up6+Z9BdA3Wvqlp0sPkwocIY9JDxOYdrxHhyO4=; b=aFd/Ara61UJqUD
	BMyyYx4Ki+cP0kILWexL7NZUbK7pwpKFeRZT4CAb65UYml6elFhHD/lv/eHdiFNDdOR9kwqr5BhF2
	xX+9d7sryjd4n/7SqFucdZ8+JOiHTkEmT/gT3pVweQuhXQuOLnH+TIV4ThrullVHkTYuzEuYfRKtK
	oCpXaHcOzkfDQ5HABS846plelEuPS4YfKwgHO4tviia7zeIVCRP7/BaGt2uMcaD7sT9pROAODgRc4
	Jbx98GVBtkv6h+ccSi9GkcPtbaNc4Rddhl4CLauj80FQqr0geQj8nLtOY9Fqc5ueecDRsCQ8hYcBo
	fydIWevrM4KQ3vp4TJAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oItWW-00FFeh-FK; Tue, 02 Aug 2022 15:09:32 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oItWJ-00FFYb-MR; Tue, 02 Aug 2022 15:09:21 +0000
Received: by mail-il1-x130.google.com with SMTP id w16so7158212ilh.0;
        Tue, 02 Aug 2022 08:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TnTubc6T2moNEJDYoN4cgfDzPxoHQtes0c+6H3Y5Dww=;
        b=pkkYVaCXoDjN3BxJA9fdnVundUXhEs1ZNjfqqqRGarF5AV++es8DHqocJO+FlDtBo2
         K9VLQBHIKirR+kBAZXEW9X3tax+LPb3OLjnPtBLoJhQvOpYVhyum0CDwjRQmi8N3QLG9
         qVZKGbs47r3RtFLMkEjxsxA5QRB0Pkop+q4m7mjlwSgMKR5zZqDQjBomHGV1Us1vun9a
         vz+DnLQ27XHfdmEC6MvRGoByNQNFIbb1wMouC5XlTA9YXSvZ12GajCS96japFxJgfg9b
         tHVgeXFpFd/wEAlJhB2ZChsOmOVxsmNul/LP5dMDpuISoJLCiJvTU58sqjiz4XsvWNCB
         Ou/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TnTubc6T2moNEJDYoN4cgfDzPxoHQtes0c+6H3Y5Dww=;
        b=AScwzL90p31dgq1XIfKC5G/Cs6nnGr67Rqf03FMuFu+R1b4vSSBP/oYDQkm9WPL2ze
         ozW1u0KWNVfFwFg3XFx5p7ziHNhefAjb96lrPqKDfjTZzL3o0JRLo/Mys+UALjr88ohJ
         yX3GO8gL3e6ae1FKhoX/ziydqCcBiDa3lYhFNNyQ/lIuJ8MKOBg0yVw6KLq+HKXC8c06
         ktMjGjvBG9xUH2tFz3l3x8bRyQ291ItmM1xodBQYux+j1FivATzIW0+j34+jRoZtJddA
         U4lC6zJoQqMxYiqZ6gaxVRaeW08cYQqFOmHi+TphYXv+XAr5rtlXX8j/CnHjAnmE6MqF
         WwyA==
X-Gm-Message-State: AJIora/shxYqnxpJxuVEwdjVJ709N/Nd4mXmAAU6YDGmxKdiEbGvTOnZ
	l/mpKb8HfaLQFd32cr4U/rDnRw5Jj95j1KE8T7M=
X-Google-Smtp-Source: AGRyM1s/X7XdR0/a8lkQRbVcBP+dwZOZipEH93h8R/VlEWYf/KISRMdds5FIhduFNaDE0FsZQymaRLP6g1Da/s6WJVw=
X-Received: by 2002:a05:6e02:17c6:b0:2dd:d9dc:6387 with SMTP id
 z6-20020a056e0217c600b002ddd9dc6387mr8296085ilu.321.1659452957891; Tue, 02
 Aug 2022 08:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <YukYByl76DKqa+iD@casper.infradead.org>
 <CANiq72k7JKqq5-8Nqf3Q2r2t_sAffC8g86A+v8yBc=W-1--_Tg@mail.gmail.com> <YukuUtuXm/xPUuoP@casper.infradead.org>
In-Reply-To: <YukuUtuXm/xPUuoP@casper.infradead.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Aug 2022 17:09:05 +0200
Message-ID: <CANiq72kgwssTSE7F+4xkRrXBGVgHeWxCyjeZ-NHLUXWnFjMyTg@mail.gmail.com>
Subject: Re: [PATCH v8 00/31] Rust support
To: Matthew Wilcox <willy@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-um@lists.infradead.org, live-patching@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_080919_871829_F491236D 
X-CRM114-Status: GOOD (  16.15  )
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

On Tue, Aug 2, 2022 at 4:01 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> No objections to any of this.  I love the idea of being able to write
> filesystems in Rust.  I just think it would go more smoothly if
> linux-fsdevel were involved more closely so people at least have the
> option of being able to follow design decisions, and hopefully influence
> them.  That goes both ways, of course; I hardly think our current
> operations structures are the optimum way to implement a filesystem,
> and having fresh eyes say things like "But that shouldn't be part of the
> address_space_operations" can impel better abstractions.

I will send the patches to fsdevel then!

As for following development closely and design decisions, we have
been doing it in GitHub so far pre-merge, so the easiest until the
merge (for us) would be to ping you there. We can also send you copies
of the `fs` related patches too if you would like that. I would highly
recommend joining the monthly informal calls too.

(I appreciate the kind answer, by the way!)

> The obvious answer is to split out the 'fs module' into its own patch
> ;-)  I presume it was part of the kernel crate which would have been
> either patch 17 or 11 in that series?

Yeah, patch 17, exactly (patch 11 is the `alloc` import). I have asked
Konstantin privately about them.

In any case, I will split the patches further for v9 which should help.

Meanwhile, you can also see the `fs` module here, if you are curious:

    https://github.com/Rust-for-Linux/linux/blob/rust-next/rust/kernel/fs.rs
    https://github.com/Rust-for-Linux/linux/blob/rust-next/rust/kernel/fs/param.rs

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
