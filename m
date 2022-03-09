Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA16C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Mar 2022 10:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlqOy1qKKCTrhaF6wR3bU27PRJITsD6zLWrmMlLT2jM=; b=srORFvALz94fbH
	EbSOOdKi3mmRRZcpywYg9Oa9wj8oXmDGQaNaWHe4eec136HUDZls0T3btBrdC9DL6tQYTHG9UcqQ6
	7WCXt6d11RoJOGXvkKk4WhuCPBpi5K3y7aAjsrx6FsYmn49utyfFS4Jz/v8qiYYaYdhpB6gwvJqZK
	X1wQ4Uj3svR2qsQaQxnP+W8yYMV6fIG51imbNcs2IwUFFZljnnTPQNP1mc1IpIEGgfwuvdyA/Qsuu
	EePB6EaNEZqPNvzR5/9NuU+uHTLrWY0Ph9nw+WADSiMhET8XpHERHrSY+5OEBWS787mADh84feKGB
	1Pq1ooqqciU7xKzvFktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRtB6-0083gs-N1; Wed, 09 Mar 2022 10:04:20 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRt9e-008351-R6
 for linux-riscv@lists.infradead.org; Wed, 09 Mar 2022 10:02:54 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MFbFW-1nMsgq0mZ4-00H79D for <linux-riscv@lists.infradead.org>; Wed, 09 Mar
 2022 11:02:46 +0100
Received: by mail-wr1-f44.google.com with SMTP id r6so1722108wrr.2
 for <linux-riscv@lists.infradead.org>; Wed, 09 Mar 2022 02:02:43 -0800 (PST)
X-Gm-Message-State: AOAM530KGcISZo95F9TxtmfmDd6pZJC9myDp2yIliJSCYZyn2eIjxjMC
 yq9gXDFz38YE7NWNPlnM2IBU7vxp5JlZCXNvCyI=
X-Google-Smtp-Source: ABdhPJwgkE8297GnOt7TTEbR/TrVC0SZLwL1B0Ochv9s5Yu6J38a4vXCAEDpRuE4kakjuYoCPOko8LRH1gaACfFyprU=
X-Received: by 2002:a5d:6810:0:b0:203:7cbb:20be with SMTP id
 w16-20020a5d6810000000b002037cbb20bemr711554wru.219.1646820163359; Wed, 09
 Mar 2022 02:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20220309052842.247031-1-michael@michaelkloos.com>
In-Reply-To: <20220309052842.247031-1-michael@michaelkloos.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 9 Mar 2022 11:02:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Mr_z6h7eg1O8ZN5_qE-o+8KFFBum3CxyuDYeF50s1dw@mail.gmail.com>
Message-ID: <CAK8P3a2Mr_z6h7eg1O8ZN5_qE-o+8KFFBum3CxyuDYeF50s1dw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Work to remove kernel dependence on the M-extension
To: "Michael T. Kloos" <michael@michaelkloos.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:/QF0IGMPcJfb5Vw9Ym9zZe01xxex0I4HV5yIpkUB4Z+q57xhQBl
 iZln5S5p49U+2rxKIlySpx4BqRNkFcVSl5u1iVESEmtYs1DKC9CJrkzJZFsIrIJ962nECoP
 kOcR1YdAuWFeweSIq2jbmYG75OFxh91xCAyMNAckAP18fiuU31Jw7y3eC9cEJ0V530eHvCI
 vpbD2DzR+JhclHfwsOK2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XlLB9jSzGZo=:X81Hg56/ClbCcOn7op3bgk
 zjRvLZwK+hKDqIk4GMcAps7VCqiPmbFl0gUaBlW7jEwGwH8YfQ9JtxQ8de2bqH74Q3WgzRHTY
 66Cdtgsy0eoaZD9MUDejr4PxUnscHVnkkYet69Q4qr5VR8gF5oKhUzIvgLXD9WGqEznB3+sXs
 BxkG/8ZgK0ol7y5VrAPHL3wDjCBMAMvgERGbh1+4e/1xIUTjuFl7epVyhhB03vwJb7AN43oR9
 IzoMU7m2MU0GYFo2HCLhjDALKMcdb1/faPP2GX1D6W0llLWxbGs5XucBqpf4V1bRUX723jvjY
 PJxpCRJ4b1GnKLrVAkVfIzG/12Ci3lVEJj6MLpR5zhKo+dVI8LJGIzVuzCcIkhB5bcr18qvSr
 KGoLmtzitpDDRu2VPuzR9hugqrt43atDOlpjsGzEWiVWdnl8RT6m2jPhaoacFDcQTbQvqfBGK
 euxsiIW7eEmUApS/N9nxJArRBPaMePDPGG9Q1IMXdPjTcFRhPlEHbt5MQuG+yCUoKBf3Avdg+
 W6dN/o7O5szYVaIgy3/W30PJ4D3ONnDJNBaSur27pV3wdKKAjfUcmZXl1MJ16vL6n8LfFkgu/
 HGZqbtGz/JtFIgtYBPDdvZSV/FHAkzEUCIWINMlxbrAvzy/0eEzFrTuL2VlRITBlpPqYDzAvw
 nGV83eutu8BYaQOZFtxgdqxzSYiKaDwQ7OrxND4UbkeHKewGR1OcI5Atc9ssZDERIq/c=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_020251_213884_CD5F7D9F 
X-CRM114-Status: GOOD (  17.79  )
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

On Wed, Mar 9, 2022 at 6:28 AM Michael T. Kloos
<michael@michaelkloos.com> wrote:
>
> Added a new config symbol RISCV_ISA_M to enable the usage of the
> multiplication, division, and remainder (modulus) instructions
> from the M-extension.  This configures the march build flag to
> either include or omit it.
>
> I didn't find any assembly using any of the instructions from
> the M-extension.  However, the BPF JIT is a complicating factor.
> Currently, it emits M-extension instructions to implement various
> BPF operations.  For now, I have made HAVE_EBPF_JIT depend on
> CONFIG_RISCV_ISA_M.
>
> I have added the supplementary integer arithmetic functions in
> the file "arch/riscv/lib/ext_m_supplement.c".  All the code
> contained in this file is wrapped in an ifndef contingent on the
> presence of CONFIG_RISCV_ISA_M.
>
> Signed-off-by: Michael T. Kloos <michael@michaelkloos.com>

The patch looks fine to me, but I increasingly get the feeling that the
entire platform feature selection in Kconfig should be guarded with
a global flag that switches between "fully generic" and "fully custom"
builds, where the generic kernel assumes that all the standard
features (64-bit, C, M, FPU, MMU, UEFI, ...) are present, the
incompatible options (XIP, PHYS_RAM_BASE_FIXED,
CMDLINE_FORCE, BUILTIN_DTB, ...) are force-disabled,
and all optional features (V/B/P/H extensions, custom instructions,
platform specific device drivers, ...) are runtime detected.

At the moment, those three types are listed at the same level,
which gives the impression that they can be freely mixed.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
