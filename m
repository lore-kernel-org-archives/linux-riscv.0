Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C964C32771
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Sep 2022 09:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8bnV/wfmhWVCls+3BP+J0qKO4Jqk7lpKOnmg2Qd8aU=; b=lpnbMwKjYXIt8w
	gAhE++ZtC8FK/D1Uf19mYofT5o/rcXvkoBcmYmOqZ5F2yShsyHJ8Pj48/33HwgRzOIjYkrtx8UrG4
	vSofqGMeY1UBOAScY00OBRlzc9oH/Tnie+PevWrt/j5tR17wzHBkgKKjbicitMs86w8Dhzm3szhEo
	K3CSrUMm5FSk1Fd8C4HRDdU8YK65JWUxGTeKI5M1VNqiKzsGOO3kpyYcRZ5RN0XwLr+awTopvqstz
	zCmmwLFe08eYloPQzYT4UqF4yA2PO9K4mBwHOW/4xpYmKcNXtcuvDo50CDm5+sEZ+fG0jCEfs0koY
	Qpb/cKaCKg7vDvyJN+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ock3B-003RmR-Jv; Mon, 26 Sep 2022 09:05:17 +0000
Received: from mail-qk1-f182.google.com ([209.85.222.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ock38-003RjA-Rw
	for linux-riscv@lists.infradead.org; Mon, 26 Sep 2022 09:05:16 +0000
Received: by mail-qk1-f182.google.com with SMTP id o7so3682463qkj.10
        for <linux-riscv@lists.infradead.org>; Mon, 26 Sep 2022 02:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uWYE/4qSbOTZOS7uaLKLWNqkuYOYcqwLcFlGIB+GgOM=;
        b=CTFChy44nQu/ATOsO+jkk/0rbYNtZ182ycr/fFRz6WJUeBEisTdzQ7AGL4EHVFyAOz
         Kh1nZCQuMbI0cG47/JkzvxL/FhnMtC3RQB4fR1NVwX/YKQolFcc8BCOKiHLm9fIOAD78
         g/26i8oMbJp6FMqsozB5JlWW02+hasHClIBCSb/w8h+l1HL/PJM9y95bwr92liW3MGNK
         fkI61/Gs1UYg97KKj6kd8L7d9CisYTSCiy32/6XWsEKkQAcmLlimK6jpqJbH9NotgMjr
         VM54WRKuOsyoPFuyapYSjD6ksBJAt/GUg+n7fkpNGJHRVfylDpLST/wJ06HNo9DkqlyT
         UglQ==
X-Gm-Message-State: ACrzQf1ngjoOCfaHqA3ZxdjQWH2fbqbKIq14UZ7/RqIW1BP1tlwIDwJD
	ReWsv6x74/bcRID0PDlXqTgN5TamUVortQ==
X-Google-Smtp-Source: AMsMyM4pkgnjbM24fdwxxuUkD230fo4vQ5zpKHB+SdgxPTJ/ntZDIbGfdSUBqVO/WTm8BmMlUqu5BQ==
X-Received: by 2002:a05:620a:2627:b0:6b8:c8c3:78f9 with SMTP id z39-20020a05620a262700b006b8c8c378f9mr13243366qko.641.1664183111746;
        Mon, 26 Sep 2022 02:05:11 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id r1-20020ae9d601000000b006cbbc3daaacsm11249500qkk.113.2022.09.26.02.05.10
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 02:05:11 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-3321c2a8d4cso61605517b3.5
        for <linux-riscv@lists.infradead.org>; Mon, 26 Sep 2022 02:05:10 -0700 (PDT)
X-Received: by 2002:a81:758a:0:b0:345:450b:6668 with SMTP id
 q132-20020a81758a000000b00345450b6668mr18850169ywc.316.1664183110510; Mon, 26
 Sep 2022 02:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220923185605.1900083-1-conor@kernel.org>
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Sep 2022 11:04:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxx7_im2wtb_Hszf2P6EuxEDjA95sJtkM9Jf9KV3xO4Q@mail.gmail.com>
Message-ID: <CAMuHMdVxx7_im2wtb_Hszf2P6EuxEDjA95sJtkM9Jf9KV3xO4Q@mail.gmail.com>
Subject: Re: [RFC 00/27] RISC-V: Convert SOC_FOO symbols to ARCH_FOO
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	damien.lemoal@opensource.wdc.com, heiko@sntech.de, kernel@esmil.dk, 
	arnd@arndb.de, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_020514_976980_37C6E88A 
X-CRM114-Status: GOOD (  22.89  )
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

Hi Conor,

On Fri, Sep 23, 2022 at 8:59 PM Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Following on from LPC, here's the start of my efforts to clean up
> Kconfig.socs.
>
> My preference would be to take the whole thing through the RISC-V tree
> for v6.2 to make things a bit less fiddly, but I am sending this as an
> RFC in the hopes of getting some opinions on how the series should be
> split up & merged. I guess it would always be possible to create a few
> immutable branches for the individual subsystems that are being modified
> & take the series through the riscv tree unless we hit a conflict in
> -next. Obiviously for that route, maintainer acks will be needed.

Iff it is decided to make this change, I suggest to do it at the end
of the v6.1-rc1 merge window, or even better, between rc1 and rc2.
That way the affected subsystems can just base their for-v6.2 branches
on v6.1-rc2, and have all renames.

If (a) you postpone this to v6.2, there will be more users to handle,
and (b) you take this through the RISC-V tree, you will miss all newly
introduced users in other subsystem trees.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
