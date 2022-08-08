Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2766EC00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 06:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXFJ4voD+4h/1EZtONABFudI0s7m6zwGtQj0gweWedM=; b=MjXdfDhhYqSnRG
	SiHpyX0YMG4yZ3fNLcfuZJf4Hja3Vi60T++d0lrRvPkd0nh2DiMRYohucYQ2T3n7g2HnQdJxJteuT
	iydZKjisl0suMJiDnl75T0igbZ+l5ex7RrEPcD/vDzBr3DX0/4lgs+50cagbUCSCcDkSgdqBvnMQY
	jyqluZ0zEYH6ebPzmXXtq4OehS88ZV0lOztuAdyYAKwOO5kbYd5qEEGillvXXBvB2xquyP4Hqr2wa
	6hd7yg0NY0aVD0n/7NJCjS76jzl/xegiK+pLo/TziTnxhdyi6swzWby5oZBvZBGwOxwoOP/j6gD55
	xbrwoOktZNNtYEniP0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwiR-00ByaJ-1i; Mon, 08 Aug 2022 06:58:19 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwiO-00ByWY-4R
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 06:58:17 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MLR5h-1o4FCy02gF-00ISbX for <linux-riscv@lists.infradead.org>; Mon, 08
 Aug 2022 08:58:11 +0200
Received: by mail-ej1-f50.google.com with SMTP id k26so14876118ejx.5
        for <linux-riscv@lists.infradead.org>; Sun, 07 Aug 2022 23:58:10 -0700 (PDT)
X-Gm-Message-State: ACgBeo0oX15PfPoNW1+04YiU0fQqo9WWRsrnURDl3gvIzqWXVl0a5xIy
	UuI5C3EsLRgl05lq9o24Grr9AJ+Gh7cx46HMwNM=
X-Google-Smtp-Source: AA6agR7+MNBPFkwjMYrs9F5cklCO3PmGk+NVWugFBet3Tm9GK726GURnSLhj9K8pZOtw7GOLS3S01sY9ymEq4UpWwag=
X-Received: by 2002:a17:907:7395:b0:730:b636:2c89 with SMTP id
 er21-20020a170907739500b00730b6362c89mr12935429ejc.547.1659941890680; Sun, 07
 Aug 2022 23:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220807220934.5689-1-rdunlap@infradead.org>
In-Reply-To: <20220807220934.5689-1-rdunlap@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 8 Aug 2022 08:57:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1-NxPazURDPdKYU0Het+pjL6E3BZMskjQD=aCU91Q=rw@mail.gmail.com>
Message-ID: <CAK8P3a1-NxPazURDPdKYU0Het+pjL6E3BZMskjQD=aCU91Q=rw@mail.gmail.com>
Subject: Re: [PATCH v2] kernel/sys_ni: add compat entry for fadvise64_64
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Josh Triplett <josh@joshtriplett.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-api@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
X-Provags-ID: V03:K1:NDxKtlEXtI5w63OvMxQriaxs6pKojtjp6i33BnqLiDyPWT+AN9m
 NmMZztJN1SjYvsmaKSLLqjuuT9LJt6jypwsqdfFv1k4CHq5578ka9gcAjG72zQSJuZDXB2J
 WeBOEKJygUQ2NtuuMogyMR6mLNoMrBsjmKEAa0wNOpFmCnoMt3My/NNdlPJxkbDuFC2YUO3
 TioWGbjLP6+OLOQVSEy+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wxaCQEA3A8w=:PGAeqjtj9HoRKXSjpsHtn2
 VTghNGFVvCL49Ryrt/ibHDg+bUQu1QO3buam8g5fRM8mjVKEoHSNUTMuUEwdBCBOnKiOJcwNa
 XD92yJcdtdrIhyYYdHicESoMjYxYWn1rnZdrKKmjgJAsw/xqWsCU91YSOfEq9921GXymKXEH5
 3VSFj4IXD3psfVVCUEBtSntZiUhz5M7frGZk35gu+qhnv6/f9DVOj6OFTU0Ac+ST9cbRYyX0y
 TVLfcDb8kDcjcxK9ohhJBHHZJcu+n3ypka+pWJGCNzXULB3wpfPUFXLUwCr+D2NqTyvWg/nqU
 oAHeqBzUJG3A4ypLvKoxnzyLTHV09fxywMwhpwSn5NvhPsSTVKACSvt1tYo9A527zBmKqwaVe
 ZlQptbuDA7QbjiWOybb4bEBkxc/LBwBiQUqD9tMfDfmJ5+ZmwlI55Kcr1645C8f11wpwMcftL
 TaGRrv/cxZjCpW2X7kY8BAkJbseAexKAARPWe5U06Lpsyvuyi2p2TcxB7NSvQTiA3hg55Bon4
 2wR9TuO0PXLXfPt5AlqLZHVWAMiMlvW0BljAa7vsMBGAc+PmP8poPEVwMN8uKJT/Wp2SyECYv
 b3lMutvLPfG50pvyHlsKdE+pXt6cPBR0lpqWeAEJAYcjBagYrZetdvgq/Z0NBGLZx7MBt6ROi
 pYWYZkUhLlNCVF559Z+7DsCo9LHWMt5EhHOtEvhAlEIZJD0nkwcWBblEKHH1zwjeZRFJcU45n
 IOkUHKZMjQK3QHW8DyFXlsse/ay7hW/R9esO2jKzDSfOd8oEdF9M3keV3sRsadnUfRxYwlh+L
 QUDRFWVzo2qQGL3SETFxyMZYAEb3T14iBBLivM6MxOwI2+OKvVGqx5S9JRDCYZ8Nf4KU0x3tv
 SP7u+nmzZfPjRDbjlJsw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_235816_493558_CBD50783 
X-CRM114-Status: GOOD (  12.44  )
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

On Mon, Aug 8, 2022 at 12:09 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> When CONFIG_ADVISE_SYSCALLS is not set/enabled and CONFIG_COMPAT is
> set/enabled, the riscv compat_syscall_table references
> 'compat_sys_fadvise64_64', which is not defined:
>
> riscv64-linux-ld: arch/riscv/kernel/compat_syscall_table.o:(.rodata+0x6f8):
> undefined reference to `compat_sys_fadvise64_64'
>
> Add 'fadvise64_64' to kernel/sys_ni.c as a conditional COMPAT function
> so that when CONFIG_ADVISE_SYSCALLS is not set, there is a fallback
> function available.
>
> Fixes: d3ac21cacc24 ("mm: Support compiling out madvise and fadvise")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
