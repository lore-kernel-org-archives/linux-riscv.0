Return-Path: <SRS0=LGYn=NG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D01C46475
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 01:51:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0C1620824
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 01:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iP/8WPsO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hEFvPNr6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0C1620824
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qwtKronhsvYtx2AL8U1TSXqWzDzDl/BBet21S13AaQ=; b=iP/8WPsOtU6zLI
	+k+gTRVF5jL7EjClQY2J2BNmscsMV3yRY/XdYA9AYhdVoRnhkNMa/whNNl61vUYpRK8F4zu3wppSY
	IzG5ykCzdwQktiv/YDEqquMF668CzNTe/xFQIeP5kWREtMpfuxEt30a1Q92s9gCM/TGSh9IwDHaIE
	IXltDEXRDu3wr6sIa3Lz0oFb9nVhYc2ctih/l5azwMqtzcrnNWflvAZoIFYoy3OUHjp61XIituMhP
	KfwBzt+l1i5XseA9n15e1hvmLIGJBnuMSJLx1Y8ZSvBvUt79ggDamikpumQqVy0jJdgVLEYWWLd8i
	v74RY7N6P3WFPYWjljRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFrHi-0008H0-Gh; Fri, 26 Oct 2018 01:51:34 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFrHf-0008GH-Fc
 for linux-riscv@lists.infradead.org; Fri, 26 Oct 2018 01:51:32 +0000
Received: by mail-lj1-x244.google.com with SMTP id s15-v6so10053091lji.3
 for <linux-riscv@lists.infradead.org>; Thu, 25 Oct 2018 18:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YlshRK5JZz44bbe2wyN1oqlLyTr3ZumtAPiaOfDgcto=;
 b=hEFvPNr6z4Kd4ywAMeNIeaEwD34AwW4S46sxAQUHJu8zO5nICL++gCA4VRbQTzP+2Q
 FcBUhcABbg2RWagntjAnDF4rT588cZRQ26msDPp5+nJNwHpcpzYY4FFsDN7a3crQ30hU
 qtmiKUNorxtZOJpYtozRm0PrXElj7L6VaSdnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YlshRK5JZz44bbe2wyN1oqlLyTr3ZumtAPiaOfDgcto=;
 b=oF2QqgZw6w+5j8oo/9xM1OeVt/q8rcdAiS/G22W/Ve+QPrhwcbdK5+AHCe8pxybHq4
 2xygBkIXYrparj44sIpRkRXrWOiguMJJ1m+aHpo4P5dVpAvbHYGWu0hRXvQuZ2xiR8PT
 4LwOjeNSrvo8ZjSJtsxsM3wlOQHKSbnqibG2GjRrlEqAJf3nGYqcsjG1iC+RX4DSTNtv
 tfVd2r9GWWEdPX1T3CrFnVUd+3iNS+GS1Ktksutbby/2/LLNCXK6fnDVL1cMr/KUVHFO
 rJWPbRUNIDzENVmw2iEfv9S89u4AiNP3LVTjK+kWoNVi8G7GhW10FFeV2is35urNw4iG
 ZhyQ==
X-Gm-Message-State: AGRZ1gKtjEoaTQ9AXDCmRPT7jrs1OKUX85Dtg2y0DYhI097/sTBjMon4
 D57GHxKpeUdC5IMwsdJwAT4yFkC39BY+VQ==
X-Google-Smtp-Source: AJdET5fvo2gRRjiwWY8oxKrVZw8UvxeUteeZ4cVaQNccHpQkLWlTu3/j327O5dvjWU7NZTHETPx1cg==
X-Received: by 2002:a2e:29a:: with SMTP id y26-v6mr946543lje.62.1540518678836; 
 Thu, 25 Oct 2018 18:51:18 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id t4-v6sm1461087lft.77.2018.10.25.18.51.17
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Oct 2018 18:51:18 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id q6-v6so7552596lfh.9
 for <linux-riscv@lists.infradead.org>; Thu, 25 Oct 2018 18:51:17 -0700 (PDT)
X-Received: by 2002:a19:288c:: with SMTP id
 o134-v6mr957397lfo.124.1540518677398; 
 Thu, 25 Oct 2018 18:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-80deacac-267f-4b3a-ac60-4e24f120d86e@palmer-si-x1c4>
 <CAHk-=wimJ+g2O7DND0XZ54XZSrY_aiVWsiyyAXL9T1+=BG9Ptg@mail.gmail.com>
 <41b34e47-57de-bcc1-c86e-8b98f663367a@sifive.com>
In-Reply-To: <41b34e47-57de-bcc1-c86e-8b98f663367a@sifive.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 25 Oct 2018 18:51:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiHy+39PkEjUuQRJdOO7aNytYXeAGD-tZwOfOEj6ZhTKg@mail.gmail.com>
Message-ID:
 <CAHk-=wiHy+39PkEjUuQRJdOO7aNytYXeAGD-tZwOfOEj6ZhTKg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 1
To: paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181025_185131_563948_A41C70CE 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-riscv@lists.infradead.org,
 palmer@sifive.com, zongbox@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181026015101.oUDWKxjtjFvpdOECRKsyw-gZMPjVhXa3GjDAPisu8-8@z>

On 10/25/18 6:12 PM, Linus Torvalds wrote:
>
> Almost always, the 64-bit divide turns out to be entirely pointless,
> and the code can be written as a (much cheaper) 64-by-32 divide
> instead using the functions in <asm/div.h> instead.

The other common situation for the kernel is that something was
written as "xyz / abc", when it turns out that abc is really just a
power-of-two.

So it's not necessarily always that the 64-bit divide can be
re-written as a 64-by-32 divide, sometimes it can be rewritten as
simply a shift. Which is even cheaper.

That's the reason I try to actively discourage full 64-by-64 divides.
We have had situations where people end up using a divide that can
take hundres of cycles, where alarmingly often it can be rewritten as
one that takes tens of cycles or even just _single_ cycles.

People don't sometimes appreciate just how expensive 64-by-64 divides
are when you don't have direct hardware support for them, and how
often there are much simpler and faster ways to avoid them.

                 Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
