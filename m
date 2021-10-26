Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E07C43219
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 10:17:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07DDC600CC
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 10:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07DDC600CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpN0DDgqjSntO7hwTUsfj8AU1L0tFp7J/HfwpeQHC8A=; b=m7ztv18azL0LLl
	7Sr8kpzlS2nWcCU7aFW3kvMsQ1vpE87ySxGkkvyLLWVPA0sV7Sis0O4YO8O5xSCdbyjHZDTKTffdE
	GVftzLzfJo8pdDctXXf+94F5/KvZR5aVZ1HP1g3ngpN1LgGrFQXObtLiInaw3detTYj2xHHX0ZsyD
	yz6HamJPfW9dDemkYu2pdFmNmCPZuVTSPk5gIzHqbvC+4hjdvFVTeNARIEQcGTy5BNJ4kiPD8ZHO6
	gfcvlo9dG41/rX8Z9YTzYxh7yXLkjSnCduTcx0sP/Un63hzm1hPnkj9RH0U5wex+aP4zOPh8m9T9e
	DvZYpU8abstGElI8104w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfJVl-001SJu-2u; Tue, 26 Oct 2021 10:16:53 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfJVX-001SEo-2F; Tue, 26 Oct 2021 10:16:40 +0000
Received: by mail-ua1-f48.google.com with SMTP id k28so23802885uaa.10;
 Tue, 26 Oct 2021 03:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eNj0r0yYtbYaRBmFTkNSJ9P/S2xKrXUmhGE0uyRbugk=;
 b=GfGLV+xwgxneaO34KF9IfcP+HtKM3AIzt0ak4RBLn79NboHJZU0tk9AS144/JWmrY4
 yD5bUECwSSpvLac59UF6LaZymRuy17iPls/QDOrultoAeCyrHVIb65xBnodiMPuZMZDX
 3K3fvbQt/XuoSGodIxG79Ki2V5YuiVptnuHo9eKheSZBQZuumO5E21cUP/92Pob2WKM4
 YIjxXwH70BYZ2cfMmnpE4ovLAglA7WxIuDesWXWGWmFuConajK42T826yzN11GHw2O8E
 xQ0AMvjpV04ZrBpuzQmVm23jbq6O1kUCLUuux2LCN98pfGk0yfvVOPQZMNUdP+fY0q+u
 3X1Q==
X-Gm-Message-State: AOAM531L59FBbmyX7wRpa/mu9gjZcDe8IFPpGgoSkTJ4b19tUjqVjrw/
 6NjtiVnnLZe8frBDGqJ07nriQ08TXNJ/lw==
X-Google-Smtp-Source: ABdhPJzJiGAAe4bnUuC3Vja+SGZshlMzgV1YSmlWwTQkTmn1GdkAjjZgmWYOr9i0irITblHOwvm3Vw==
X-Received: by 2002:ab0:6154:: with SMTP id w20mr21859398uan.25.1635243397487; 
 Tue, 26 Oct 2021 03:16:37 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id v187sm10974074vsv.26.2021.10.26.03.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 03:16:37 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id b4so15908232uaq.9;
 Tue, 26 Oct 2021 03:16:37 -0700 (PDT)
X-Received: by 2002:a67:f84d:: with SMTP id b13mr18437374vsp.41.1635243386319; 
 Tue, 26 Oct 2021 03:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211026100432.1730393-1-arnd@kernel.org>
 <20211026100432.1730393-2-arnd@kernel.org>
In-Reply-To: <20211026100432.1730393-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Oct 2021 12:16:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0RPpbmCaixYTdKFLPTZGp=3WycHK1xiyryKku45f6_A@mail.gmail.com>
Message-ID: <CAMuHMdW0RPpbmCaixYTdKFLPTZGp=3WycHK1xiyryKku45f6_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] futex: remove futex_cmpxchg detection
To: Arnd Bergmann <arnd@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Rich Felker <dalias@libc.org>, Jeff Dike <jdike@addtoit.com>,
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Darren Hart <dvhart@infradead.org>, 
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 arcml <linux-snps-arc@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_031639_130672_5511ED42 
X-CRM114-Status: GOOD (  20.65  )
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

On Tue, Oct 26, 2021 at 12:06 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that all architectures have a working futex implementation
> in any configuration, remove the runtime detection code.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/Kconfig             |  1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
