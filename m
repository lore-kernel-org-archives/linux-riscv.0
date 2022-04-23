Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5875C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 02:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ga/vQZws4J0pCU6elOMBkX+PLqCe5npaDuOQcy0dY00=; b=HZmwMnTZuR6/BF
	/iZjgNjGxTNH8XeI/TtNJVRCJIYS+7YcZNyWr5noQoljqdNrIpsxuyFd8CPi8/myQU2F0bkyeW5cM
	0iylie6C5DhBkEo1Zm8mly3k8vMGjcLzu5HJNPPl5pj4DdOwIzaPcs1UGeopWmgD+AJUnrsGGNMCm
	QOJXpY9T2N1RuUvVzdAnhlClgjEPACNCvfVSHlnQr++h4poxi1VTuShY/fJo1SN1QXq117Tk6E1ub
	qV6KGbXOr/xTJ9d8i/lkjKoqYqfX7CnHyisLJEVpNepZBpT9dYjzxg2ZwyCPK4FsEcb/UAi5DX1B7
	Xu6CxCuJdQYXD7r4A96w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni5Rr-003Gub-LY; Sat, 23 Apr 2022 02:24:35 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni5Rg-003Gqz-84; Sat, 23 Apr 2022 02:24:25 +0000
Received: by mail-ej1-x62e.google.com with SMTP id lc2so19507580ejb.12;
 Fri, 22 Apr 2022 19:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qqZdE0u9CYPlQ6MQcqOeN4oZEKzgzl5ZlEVKxJ+FAHk=;
 b=OE7s3CPe37nMb1dGmVaIey7JbUtRJ7f6vav2gncQroL5ziOpNrqKAczdsVbRdftZTp
 lvDGoua7DfR0a3ih2mXvBGp/pr8YIwFWvJ7rYtm1KItJ7lzb7bsnCbr0XO6Al/bLSqmY
 wShQ3Q4PeDbaGhthAQmvyUaYMWSIREyHdWzLfIHLlO4xqjeROrsWMsY/13vozvUovkD1
 TOAKaEV8j7EP/9ImivPEP7f9+9yBUR0jy0QdxfQqm1cDoP57+Iq+yV30nc+nepkuJNn4
 1e6bTF9LZV27/+Lsu7KDZ5aSI6QmdhEq2BG3Q9STkKqaymG9HXWUrXc+hO38EBpNkLCd
 yQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qqZdE0u9CYPlQ6MQcqOeN4oZEKzgzl5ZlEVKxJ+FAHk=;
 b=RgPwdMrjETWV+wt44TCC48bPq6i0ieIvfetZ9C6cxgAI5YPJxy6pv8q8PCpkBiqyJB
 Mu1pU8BYFn/eGcwQzhc+G1f07V8OJrur3Nv/0QYQj5DnlUB4rvclCh+J8O7DvqrI3IFW
 QdsT6qfbOU292+2DNnizAyTQKJbwmRMNwLEnAG1orQ1CrkIDvts2h+ZmAgdNvSodBm/0
 m0JxkVRpnMmQgEDXCaFWhhu5kvpolPbUd+SuwosUeLqCK1tg81q/Y39wEGGntfzyKhyb
 VQHgpMlds2PqH087EBy/rEzMrf8uAH9fgN77Ub50Sr7XBjUuR34WQmjFBH93e+lesS0y
 kHCA==
X-Gm-Message-State: AOAM532ZUrb9dpDPhNigUEQRD8KTPWh1FUajRFFeuvOUrmH/kF27Qygv
 Rsuf7+/N+g5zzj2Uwnchl9IBr1JlIc8/UkimWMc=
X-Google-Smtp-Source: ABdhPJzcIFiqsw8tqvA51BF/kojpRX8faca/GR9O0BKNi3Ttrspe1sgBeJ1OHPMIBfTzzBlAO8IBPBsJXGKx+2s4Z5Y=
X-Received: by 2002:a17:906:d108:b0:6e8:7765:a70b with SMTP id
 b8-20020a170906d10800b006e87765a70bmr6585155ejz.436.1650680660905; Fri, 22
 Apr 2022 19:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220419111650.1582274-1-Jason@zx2c4.com>
 <20220419111650.1582274-12-Jason@zx2c4.com>
In-Reply-To: <20220419111650.1582274-12-Jason@zx2c4.com>
From: Sandy Harris <sandyinchina@gmail.com>
Date: Sat, 23 Apr 2022 10:24:07 +0800
Message-ID: <CACXcFmksd3cw+xa-c2gEdd4=96PO8GCCMF6q2d6JHnJum2LjiA@mail.gmail.com>
Subject: Re: [PATCH v5 11/11] random: insist on random_get_entropy() existing
 in order to simplify
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, "Theodore Ts'o" <tytso@mit.edu>, 
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, "David S . Miller" <davem@davemloft.net>, 
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
 linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_192424_330241_E6E23853 
X-CRM114-Status: GOOD (  10.67  )
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

On Sat, Apr 23, 2022 at 6:37 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> All platforms are now guaranteed to provide some value for
> random_get_entropy(). In case some bug leads to this not being so, we
> print a warning, ...

Would it make sense to test at compile time? If there is no hardware
RNG nor a cycle counter, then the kernel should be compiled with
the gcc latent entropy plugin. Generate a warning suggesting that,
or even an error insisting on it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
