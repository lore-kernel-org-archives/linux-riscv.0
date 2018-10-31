Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A900C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 00:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 461DA2081B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 00:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q3L06tAe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="WPojO0Ya"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 461DA2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/kat8GBVaB3HCEEKoUE5HkuDxEIR5nrFpyTfZrPxLY=; b=q3L06tAemnNhca
	nztPdbSbq7dVVQzNpTiOrZXQgcyoA09ljN25w7/7GIxj7W8VTDA8zuC6ZMKsjBF4NdOuBU0Tf7cCX
	HNuPrsKJseHpZf86/sAI7UMCBZOs+E8274F4I/YhCT0cS9CDTGhEFsKH0MFJZPDcjVJIYm1WIqXTh
	Md5HAjdUTO24axRSYH76BpR2GpLPpstQkLH0POA7DB3s5IM4qloVV/LwG0vKe1pCczlaDtsnxp18X
	X3924yn83Ldr3FFRPU9gvpx+3++LchF9u1esusDeXI7Zy133lu11g4FApu2rKiy8taYeGYQ/gt36c
	xYa1dv63jFTyhoIWu0sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHe17-0005ac-G3; Wed, 31 Oct 2018 00:05:49 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHe11-0005a1-R6
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 00:05:47 +0000
Received: by mail-lf1-x143.google.com with SMTP id p17so3850155lfh.4
 for <linux-riscv@lists.infradead.org>; Tue, 30 Oct 2018 17:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1HGKQkZ0x9VDbHVEWHqz1X0ZBPrUJKkfMPJCs5/d60I=;
 b=WPojO0Ya00bA4iWF9MZRlRSEHl8/slpLTdYMI6ZLlaAoBD0XWV31qihIBNvgvpehXn
 53keo9sYp+rFG/hw1ujqdMpth4lSbvAWXoj2KhZMUkc+gKBVDqIDQzRdUZPqURyhL4jS
 KAERDMFWUdRdFA+/4PzFQtrxITDV/3dS8PHzxsdpSegzpDSAUaBqd/umupWvoQo2HTUw
 EOY6/t66f4JdoSDB9V+ssNTA0hLmEkEnDlGH9AZIo2pfg4agXOEAAQqz9Mkwx+LD4Lhu
 SjVZ5C19b7TinCNOgyAAcX0uDB5tmlVvafjTw4k/Q5AWh7N/PiIvRZIdC+KGRAjEBKUl
 9cWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1HGKQkZ0x9VDbHVEWHqz1X0ZBPrUJKkfMPJCs5/d60I=;
 b=nohi8f5m6OYhAhWtieI8mab2U8SiWKJZPn60Aym37wc4PnyuwzHVqItuHiwCMlOzxI
 9oXuf5IhS+8AJ7qShziIqO2JXZN7s0PdJhMrYmef4aaXJB6lglmz2G9pjq5RX8PSJ+ta
 E4UulOiC9QA8BuEMPGO0cgYIXaXArHgNasvjxDMoyLmk30yhpPXW2pvnFF9cYoqagJV0
 nGD5uqQL7QbX+cSzQsUGFggUUqYacgCMJV8TEzfYCMDaaQG1En9nrzVpM6Re2dFVP4ec
 4xVend2b00i+hxKpa+JWInJ7AICw4dkurS8u7d8TyRrBBnUNteYJ5OwLn0Csyog2s47/
 wI1A==
X-Gm-Message-State: AGRZ1gLYAVU1V+TSssP3fypz/cny4JZm9q+2FxqwjDOxTx1WVEEuIHcF
 Sy/lWCjI97zBJr+NRKTNhLI8ZbfMFpHKb0WwlRxVnA==
X-Google-Smtp-Source: AJdET5fajFyox5n/k/jGYa5UwDThDBSyzxFQxIx0qqgp4SNufc5lz0f1LUTF9ZbD+l+U6KPrQAIrgRCANC00oleR0xw=
X-Received: by 2002:a19:a28e:: with SMTP id l136mr469719lfe.87.1540944331471; 
 Tue, 30 Oct 2018 17:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20181031000413.30123-1-olof@lixom.net>
In-Reply-To: <20181031000413.30123-1-olof@lixom.net>
From: Olof Johansson <olof@lixom.net>
Date: Tue, 30 Oct 2018 17:05:19 -0700
Message-ID:
 <CAOesGMg6L8+=ZFbH_ThUG3VrePrbBY0Bg5HWi+AiaEbNSOn_qA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: lib: Fix build error for 64-bit
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_170546_756521_BDE6F1EC 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zongbox@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031000519.qc4g1THqO6dOTXEhDex5vgU8RsBVVN6yMoGwSNlVG8M@z>

On Tue, Oct 30, 2018 at 5:04 PM Olof Johansson <olof@lixom.net> wrote:
>
> Fixes the following build error from tinyconfig:
>
> riscv64-unknown-linux-gnu-ld: kernel/sched/fair.o: in function `.L8':
> fair.c:(.text+0x70): undefined reference to `__lshrti3'
> riscv64-unknown-linux-gnu-ld: kernel/time/clocksource.o: in function `.L0 ':
> clocksource.c:(.text+0x334): undefined reference to `__lshrti3'

Err, fixed the whitespace in tishift.S while I was at it. Undo if you want.


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
