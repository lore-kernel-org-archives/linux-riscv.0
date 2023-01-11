Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5622C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 11:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mixx5xd3+YpHeSwrsje45WSPNSUOwePC1xQS47OR0Ts=; b=EYIPwxYTcptVNN
	VOjGHY7q9XnADjmPx/RC1TsNzSWEhQD4Lhr/dfzLmefFVSTbPlfCmFqbi8Bjf6+/BhKjsfz0Kqegk
	YD00u6IOs0v8e1YkGI/1uqk6diPORwKUSNGMVvtKUZCt2OfO+Sg7Kmj/hPw3g5quKaV09Lv1ndGxN
	mUTDg5s/cJAhidWcIz8K/KZDVeIVZhaFPTQpz2RdpNNAVM2kLIR57GkPoEyZIS06OTTePZZfrW3Tm
	P/MYsp0kOXfzYhn4igwfUeLoPjgKLfw646JHmGBudIAgxhhsV6LKBg//pQC7YMWGKFSy5tONmEyPt
	aggcSZ9thrcW3ncAd9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFYvv-00AyVt-4U; Wed, 11 Jan 2023 11:06:15 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFYvs-00AyUl-EP
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 11:06:13 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-4c15c4fc8ccso190588437b3.4
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 03:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnIMhUJreYVaLuI8XQlGkKbqeavEbvGlpnBYefbtzMU=;
        b=5LK02EcwtJQR27At/yTUpHxy0SM1x3FIaZe5REL5wthSu1GodyTpIlNvhpKKukVQqZ
         QgBYMvIOxvDRcp4rAhR6Yl/kkpuDTEkTygj905/EOjB4H0Dpn8dS0SY+0iwO1ns9+Pnr
         Oh7RvKMHluJd/8EuECslXuuEofXwFgGf0iF5CoHRwnHn5Fu/EfwSfMd8TGOcPO2SgxJO
         uEaxEbXtcjcefh/rz1Ue/jLDT2uuungGSnzORMVndpZGkkAn731C83nG9Y0bJsJMfXn2
         Ad6CIjQekFrolUPpgIH+KSYgSUwX0VSC5YnOCQYlOMAR1yHotJiGxrFRtEVS47FKYGFn
         O2SQ==
X-Gm-Message-State: AFqh2kpRwdDoEYogR91tkiym6QiZxg6AvRULWeM2Qoii7B7THxSBW3XK
	pXnytL/HNHj62Jpgn72/FI6xm32q4l7AhQ==
X-Google-Smtp-Source: AMrXdXvrvQ8RcFFQrp4EblgywRQTKyKNXCH0+/tt9YqemxYrwUOqi0RD060ZgLEZLwdcN6L+khSaGA==
X-Received: by 2002:a0d:f405:0:b0:40a:2f7a:d0f0 with SMTP id d5-20020a0df405000000b0040a2f7ad0f0mr2616085ywf.8.1673435169021;
        Wed, 11 Jan 2023 03:06:09 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id bj30-20020a05620a191e00b006bb82221013sm8736353qkb.0.2023.01.11.03.06.08
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 03:06:08 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-4d4303c9de6so39709177b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 03:06:08 -0800 (PST)
X-Received: by 2002:a0d:fb81:0:b0:480:fa10:459e with SMTP id
 l123-20020a0dfb81000000b00480fa10459emr297238ywf.283.1673435168667; Wed, 11
 Jan 2023 03:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20230111104848.2088516-1-conor.dooley@microchip.com>
In-Reply-To: <20230111104848.2088516-1-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jan 2023 12:05:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWsuq4M9TC1ZCoky6uO6JDNRjiT5LWe4vQ3HULQDF9vZg@mail.gmail.com>
Message-ID: <CAMuHMdWsuq4M9TC1ZCoky6uO6JDNRjiT5LWe4vQ3HULQDF9vZg@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: fix incorrect type of ARCH_CANAAN_K210_DTB_SOURCE
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_030612_504514_8DC37899 
X-CRM114-Status: GOOD (  20.11  )
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

On Wed, Jan 11, 2023 at 11:50 AM Conor Dooley
<conor.dooley@microchip.com> wrote:
> When adding the ARCH_ symbol for the builtin K210 dtb, I erroneously
> used the bool type for something that is quite obviously a string.
> Unfortunately, there is no such thing as "def_string", but in this case
> we can use "default" to propagate the value of
> SOC_CANAAN_K210_DTB_SOURCE to ARCH_CANAAN_K210_DTB_SOURCE.
> ARCH_CANAAN_K210_DTB_SOURCE is not user selectable, so using
> olddefconfig etc will update ARCH_CANAAN_K210_DTB_SOURCE to reflect any
> changes made to SOC_CANAAN_K210_DTB_SOURCE.
>
> Fixes: fc43211939bb ("RISC-V: kconfig.socs: convert usage of SOC_CANAAN to ARCH_CANAAN")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
