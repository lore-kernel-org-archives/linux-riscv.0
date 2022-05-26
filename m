Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00F3C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 08:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twgULgObUneFOUFngrkW45dZ77KAq5SwJ3uKWnC4FfI=; b=KmDiKt2xhkyOXF
	qKJ1S/cnKfpKH4U+UcYHC+0Gsj8cGLa0rvd49/0bfFAXS/RKaBapeCbWC5tOBz71lkuKVOsCm7rxF
	SKRd3D4+42PLdwaZAMiPZoRPDG86INP2hYV0EFtJbZO7eqAFrWB6hRiEjX21D2036GxVNXkkvxYiv
	b+obAoAR09QO990G/6dzyjkR8AGsTSw1KWmvNUG+uZd3me579L4LE645AwSW612bKTa2a+HaJgo72
	9PomoPZJXyhkgy4p9CU5vRgId6xarfMhz3lufEzey1Sx3u4KedHq6/RsaS1q/MstRpBj+I08KjjLC
	f5Yr48PvSnoprlo5HnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu8vm-00E5yU-59; Thu, 26 May 2022 08:33:18 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu8vJ-00E5kE-H9; Thu, 26 May 2022 08:32:51 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MdNPq-1nL5De3AtU-00ZOjl; Thu, 26 May 2022 10:32:42 +0200
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2ef5380669cso7861857b3.9;
        Thu, 26 May 2022 01:32:42 -0700 (PDT)
X-Gm-Message-State: AOAM533Z8g0KcL4qL3YWzX3GUhk4RJmZWE2H5rXO8AO7i2jkw50G1NR1
	RU6cNcdB/UcIYNUeM8zJh9GSwZdi6QPmIEL3kPs=
X-Google-Smtp-Source: ABdhPJzd1Td84PUKl1aMompoBi/CI7Ij8UKcDh3J33F17cieCWlpkBhuvBB90C07npKSjm4gZ1dqj3OUo1L9/csGNzA=
X-Received: by 2002:a81:488c:0:b0:302:549f:ffbc with SMTP id
 v134-20020a81488c000000b00302549fffbcmr1085051ywa.495.1653553961173; Thu, 26
 May 2022 01:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
In-Reply-To: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 26 May 2022 10:32:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
Message-ID: <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION 8cb8311e95e3bb58bd84d6350365f14a718faa6d
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" <virtualization@lists.linux-foundation.org>, 
	Networking <netdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-rdma <linux-rdma@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, linux-parport@lists.infradead.org, 
	linux-omap <linux-omap@vger.kernel.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, kvm list <kvm@vger.kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, bpf <bpf@vger.kernel.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
X-Provags-ID: V03:K1:B3THVKwekTJkQPYpwS8162h8XISQ4O0Yi43/UpvkrXa/cSk89Ab
 eqLyynA2mWd09LMiLvw0CySAY2JpMKrWD3uDno0JimWyT3DSlsPp3Ilj5kFarXZhLY+DY8u
 uFapyUSXesPGGmsbwaH6Jq/ZQU67jpKJMJH0XOeem4d3aXohYB+NLckGcJJKhb4TW2bVgg6
 lj/QYybIIxzAXx62umpqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1fsUcbg+4DU=:3O+1p5fjI28HA/atLrC0WS
 cu4Y3ZaHjYhfZsj3v7SRr9T1MslE7Y5HQPPA3vwX5ACLqnSoRgSqm2VZ1kehHAlqyCcSLwzyc
 UeJujwAShEXLsfRKYJL0M09IR+cDH8dm69zQO0q4poMZaAK9w3anp3ChQZ9aNd+kO1LRczOBH
 pt1bVSAu/i6uMDzO0QG88lTZs60gZweVx8hsE9TkLHHEQtY5BzO4FUJNlv6BUzPNC8KhU88/e
 bTCH2snZWDuBzQg+xZBxr4z8uH1xWupY3gWGhBCtdPC2SXtrFpdJA/4TfVXYmHYt2uo3mUuqm
 1fM7ztd2mNSATX243avv65XrfbrTmT46HLOOtuciYfDsoqGulB2DkvE0q7Qr5Py/JvxNtbDNZ
 QZRW1IrdCoKUw/2Fa1y/eq3Mu3NZ6vbgTWQyGZIJnruZJsXOQ6L35ZSVrgOw1A3K3qOELcbm7
 8Fyd0bHC7wlEygvl+sCk+i5J9hnie24l9abGJm+2QNqprJ84jYiJyPkR3FwKPIIGrTOtkNf3c
 bIjdwR4cKAx7Jd5k+nYz7FuYFkWyFBPIX0N16hbOZ92ztnGdiEcKWfv8Hl9MTl1kyd62W2tJT
 V5fJecRILJGGc1H+q94Sz9Kdu0EvMA0pdB0aZ5zmKaU58PJ1ZMHsk9gZZlvVwH2ShdT9/0t6G
 LCxUsFg7dVUORhwZDC2/7GZIqtXNQM0biOKZKuv1A5d50QLYtt7iA5Btm2tDmWZgnYF0J5UH0
 Fd+VqfZUbhYJxXSY/Wl6kPrAK8XYcfjsxwNhwJti8rPE+BH7dPZrl17EtLcW8GJGsU4/uyQba
 5XPiyZ7iwvicG8aREIyQoj8YUYBDkYP9yodkhyGiwknZiG3++H/nQz+wHKAMv21903FduyPeC
 kE63HcFZ9I5VrVlcUzpA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_013249_894896_21A249DA 
X-CRM114-Status: UNSURE (   8.92  )
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

On Wed, May 25, 2022 at 11:35 PM kernel test robot <lkp@intel.com> wrote:
> .__mulsi3.o.cmd: No such file or directory
> Makefile:686: arch/h8300/Makefile: No such file or directory
> Makefile:765: arch/h8300/Makefile: No such file or directory
> arch/Kconfig:10: can't open file "arch/h8300/Kconfig"

Please stop building h8300  after the asm-generic tree is merged, the
architecture is getting removed.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
