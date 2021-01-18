Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23AFC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 15:20:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B566223DB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 15:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B566223DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NWSTeY9wY4qucQFk/xWO91X55fjtiNXPJdyQc67lyNA=; b=O4RThwEG29kaxxuRl0kLntem6
	j3Ar3rdts8ptpk1MlAwuW9tIk6RJEi8C9g3lNBjuqzGZBU0PnT52dH3Gy7iqmnOG4PI4CjNB0uwHs
	2AgXgX53Nh2WzSs89GsDDQy0Jb/Nhv5rx/gDeXfMOLAXBbxjLr6IWbwxlPPRsU2swZiJpn0t4y47+
	LKdIRTowB6NI4frvnGHbk+9tgiKMTRPZqS2eq7bTiJbYbos7apYjSOq0LYnKuxwenKfaKxwz7ycf6
	/n/KGO6DycQO2bdJi1I5HKR+4HM6HzwNoGnCFitn3Gj6QFQ9fwQimKToB+QmqiGMGFIHoMQFiBe/D
	4L8+xsoCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1WK8-0003eX-4A; Mon, 18 Jan 2021 15:20:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1WK5-0003dP-Dp
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 15:20:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E41A229F0
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610983204;
 bh=F9zx6aNlGiK2ADjiuajjxn5pHpynVe/Ym8MGgaQx9kE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r1RihukUh/1DCAH6qCsQbr95RZdSeg5Vf2GF5h4OYp/AkvE2BgICjMdMYjODgyUpv
 S6A9KJ+2VUoXrEVaLi/TZksCAxgyUI0LCT0zc/Kicmu/uiGSQdc00doTUYcSXU0RzW
 VubvERptmxyHyBaovmebBEGDiHkY6zchlvT4kYAWrmVHANplPXEeqgLGdIW+QvbdZg
 qz0IaCdnF33vzIE4KKnuuVrfGPtAjV9RIampXXOpD/tQAjeVWCHvEqfVl7usozd5v6
 9/wMrltWnB2En62eD4dh0lpN1NmUBrFL6dEl1op67EInBbh3R60Yn821+ZF62DfZpy
 lyGNoCftuYPPw==
Received: by mail-ot1-f48.google.com with SMTP id e70so1115075ote.11
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 07:20:04 -0800 (PST)
X-Gm-Message-State: AOAM532TIQq3p3e8HqJbeMg/kHZKD93EeZhtQe0qAQ3vWYHhJHTJGvl3
 jOnL7MJyJfmfiAGCZCcyxUCaaA3+FTX5cIEBKX4=
X-Google-Smtp-Source: ABdhPJx3ItoX6SB05ukriTmlj614AEls8Ei/3+EVOdnv1xH0FuJhifAfBEgrFPIWhmUl0PEM4jhVRWy4QfrNv9w8jik=
X-Received: by 2002:a05:6830:139a:: with SMTP id
 d26mr2516390otq.305.1610983203837; 
 Mon, 18 Jan 2021 07:20:03 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0dJnKiX5minsUNdAcNnxPvZkyK363f1ibj_x0L2MQiPQ@mail.gmail.com>
 <YAVynNqAwBt5GzQT@ingrassia.epigenesys.com>
 <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
 <YAWaQVBM84CaY1B2@ingrassia.epigenesys.com>
 <YAWg6KQt6hAtIR6O@ingrassia.epigenesys.com>
In-Reply-To: <YAWg6KQt6hAtIR6O@ingrassia.epigenesys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 18 Jan 2021 16:19:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3Vc4wrLvrfwkHd6HCMohk07Yi6P_jKaC_5AybCMBNjPA@mail.gmail.com>
Message-ID: <CAK8P3a3Vc4wrLvrfwkHd6HCMohk07Yi6P_jKaC_5AybCMBNjPA@mail.gmail.com>
Subject: Re: perf tools build broken for RISCV 32 bit
To: Emiliano Ingrassia <ingrassia@epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_102005_581537_47F6B62F 
X-CRM114-Status: GOOD (  12.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Bruce Ashfield <bruce.ashfield@gmail.com>,
 Khem Raj <raj.khem@gmail.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 18, 2021 at 3:53 PM Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
>
> Hi,
>
> after some searching I found this patch from Yocto project:
>
> https://www.mail-archive.com/linux-yocto@lists.yoctoproject.org/msg01004.html.
>
> I don't know if it's ever been proposed as mainline patch.
>
> What do you think about it? Could it be the right solution?

No. While this makes it work on rv32, it does not fix it in a
way that makes it work on other architectures with a time64
libc. If you fix it, please do it in a way that works on all architectures.

I had really expected both Alistair and Khem to know better.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
