Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817FEC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Apr 2022 21:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oj8FKDCH+UbO2igFDnmHYiBTso5fy3Kk9X6CWnUWwfg=; b=aabF1dkzy3ituC
	Ri1z76rNTIQzSLC0FogTyM0tzeE0666IO9o7AJMEaWy8dUkIhy3Szjw4lrxeJIOJhOPB5xGSCqoNU
	z2M9ghUk2LdY52jZp0Maa8P52ua1j/6XLlr/4kC44Y6CSV0pU14heYRa8pR5B4T0r+nd5x+Vbhtuu
	HOubUWalLae2phneg4RFG18YqYT/SYEsU2pj0xcAxGmpyZcnxqZb7OsDbOBp9N+uc4DqwTlz35Qqk
	1cAYhQL4FhqTOFt93dQcy8KLrIOYo2RAFppiSQvtH2iXpRbGO1UURN+MoO9iVW1E/PljVy52b2cmE
	I+kfMHhlG5V7wNTGv4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndfH3-005Yj4-Qz; Sun, 10 Apr 2022 21:39:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndfGq-005Yfq-VV; Sun, 10 Apr 2022 21:38:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9091760B7F;
 Sun, 10 Apr 2022 21:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A56CC385A4;
 Sun, 10 Apr 2022 21:38:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mQKc+L2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649626729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I6zxkOx/mC7wvk4Gsn1jwFNXEhXgfgnf3fm3eSnaMTE=;
 b=mQKc+L2L0qb8oX9EFSCGVA2PpGP6oelHubudq2ohXhOE6P+6NljNFsVp6GqS8iL+oT+k9q
 LGI5PK2p+2BiALxT/T6pIAo7KftvO9nHhIH9r+fMxCdjDf5qv+R1/+DkNZGFSEYS81DGcA
 xi/IhUlyGuJHHZJHeRNPtpBlzzPGPPQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1c27d595
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sun, 10 Apr 2022 21:38:49 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 i11-20020a9d4a8b000000b005cda3b9754aso10070282otf.12; 
 Sun, 10 Apr 2022 14:38:49 -0700 (PDT)
X-Gm-Message-State: AOAM530NA7WSG1vch/TNKuwLNWg+88FLdMi/d6XgQ2OImBJqt8X7cPCy
 E+vH2iEC2sY5nDpT4jEkADnVRhy1BxT5PrEWgVw=
X-Google-Smtp-Source: ABdhPJxCzbFmXJJnJDjilSYbyEeJmRI5ZgW2uJj0owOPOVmeurf2ZjKdIlY+6WnsdQt+BKPLZm+7uOHIZCWB5lGl1tg=
X-Received: by 2002:a81:6a84:0:b0:2ec:c59:9d22 with SMTP id
 f126-20020a816a84000000b002ec0c599d22mr3204724ywc.499.1649626717509; Sun, 10
 Apr 2022 14:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220408182145.142506-1-Jason@zx2c4.com> <87wnfxhm3n.ffs@tglx>
 <YlLo8JVOS6FDmWUM@zx2c4.com> <877d7whd29.ffs@tglx>
In-Reply-To: <877d7whd29.ffs@tglx>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 10 Apr 2022 23:38:26 +0200
X-Gmail-Original-Message-ID: <CAHmME9pa+52JPuewOybZE6Q0i+RGKb6crC6_Tropc7ygff7H2g@mail.gmail.com>
Message-ID: <CAHmME9pa+52JPuewOybZE6Q0i+RGKb6crC6_Tropc7ygff7H2g@mail.gmail.com>
Subject: Re: [PATCH RFC v1 00/10] archs/random: fallback to using
 sched_clock() if no cycle counter
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 "Theodore Ts'o" <tytso@mit.edu>, Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "David S . Miller" <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_143857_114474_B16A38F7 
X-CRM114-Status: GOOD (  14.86  )
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

Hi Thomas,

On Sun, Apr 10, 2022 at 10:57 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> > Not yet having too much knowledge, I'm tentatively leaning toward the
> > safe side, of just using ktime_read_raw_clock() in the current places
> > that return zero all the time -- that is, for the purpose this patchset
> > has.
>
> That's probably a good approach and it's init/runtime discoverable.

Alright then. I'll send out a v2 and we'll see how that looks.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
