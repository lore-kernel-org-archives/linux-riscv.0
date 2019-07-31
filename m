Return-Path: <SRS0=UPnX=V4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCBBC433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2019 08:14:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E218F20693
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2019 08:14:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dJbHsm3u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="rlWpJl1j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E218F20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTlvsAjDf6YSOB6iPq10QvXyO5sZldLYfvRWtUFJwMo=; b=dJbHsm3u/9j/hG
	ta63SKJukEb+4FJ08b+EAcY+HSdP6hJ6tW/9yj7myQcOe1B2pZGGpIuFjSVCq5cXXfX79zB/KtMOp
	25HlN6kgbLlec7hItkXbboGVkeqfE79Izjf117CjcnKgESSVAM22Fv+dcJFRKrN5+FFodhQSR0nRM
	8yKleau1C2b/N7FCrr+Hei2qHmHEZNlTFmKeXeQAFqOSwlXb4I1p3B9eLpE8dmOOARhUvSuHkFa6X
	uVdl1msTBL3/vsRlrDQ/Kd1i1guSDXe4jJ/wwlJgwfsST+6Hgloar4Ea+QO6Ubx1LH3kQwvEmIhKC
	wMWsCmgx58rVt46joqLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsjkf-0001RD-AE; Wed, 31 Jul 2019 08:14:25 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsjkd-0001Qv-Kk
 for linux-riscv@lists.infradead.org; Wed, 31 Jul 2019 08:14:24 +0000
Received: by mail-wr1-x442.google.com with SMTP id f9so68578821wre.12
 for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2019 01:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3cJQtj4cYKlEWwlcNF/ez8GtnU/e+6D/NJYeCOVsu1g=;
 b=rlWpJl1jl4NSYz9nk/cEcm6gMqVKcX3lC8ESlgMmXt52G0C7QvHnjmnRqHdzBettze
 Im2jo3KPzgWbDZt9XlngsnrQbIh97Lagm7gBGpr62Pyu0T3yTukAGkxzzA0frSPcmC0l
 BQQFNtgAfz+Gib4zsxswzpU09WYbRSucD604/B7gBoMWfRe8QoA16nkZJN28/fqfp0S4
 aE/AHpJVSXVBOw0zkGa2zIeCcx5vFUpVfTMcsuv5797jrv52phRqAzAvmomL99O2Fr/2
 fymislffMQuhjbPBWScFW7oPJ4FX/ZS+efesVeJPHvbmqRgGYxGeo1YFqSK7f8pxcar6
 7eiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3cJQtj4cYKlEWwlcNF/ez8GtnU/e+6D/NJYeCOVsu1g=;
 b=B0rd1Ecw/DtMN2l6wit8+XPylgTRc0g+XuXpWRldV6/YGeM7uzIVVHi9gJT8N477Jw
 cugw61SYIcgRAgpGdvjtaTwPc+zuPItOvdaV/GXuBEr3TPJVpzFXsPkhnBB1UliaMF1M
 16eOCtslZbIPMlza4YtGq5ZvOOffeW2JvXygAdOU1ersZoKgxgyu6+mnQQMnjWGQI8Mu
 jeOcIXUtF+esiH/y9GSly/O2Si/Pbu5D3IzqveFo9fWgp8MZstyEI8bxLYS7sAOrBh7q
 3ZuP50tnuOISas0tbpzNO7ItfeykfIZZYoLRwtNu6/TnLSOB+8hKhRzIFaGjqOFz5fIv
 ocpA==
X-Gm-Message-State: APjAAAV4NOQeaHAmaxw/wLc3W+sOVvOgzouUrSu/uLLZfhv7B2UmS0Zc
 lNo9+qRBJXGJ8Oze5Dhvw1W3eJwejIGYqr0e+m4=
X-Google-Smtp-Source: APXvYqx2rkdqhfeusdmS7RFoOYu3BqyIrV9CvhySIfI3OfbuG3GpkQz6iq9bd49a/IZQn9dB8F52u6V5lE6mjOHWEWk=
X-Received: by 2002:adf:b1cb:: with SMTP id
 r11mr124882595wra.328.1564560858012; 
 Wed, 31 Jul 2019 01:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <mvm8sshcdwc.fsf@suse.de>
 <CAEn-LTpM-0TMxkNNh6nnLH9Bnr9Zm+VFLf=z1y9sER6RXrQooQ@mail.gmail.com>
 <mvm1ry8au3f.fsf@suse.de>
 <alpine.DEB.2.21.9999.1907301709510.4874@viisi.sifive.com>
 <mvmo91a8xgh.fsf@suse.de>
In-Reply-To: <mvmo91a8xgh.fsf@suse.de>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 31 Jul 2019 13:44:06 +0530
Message-ID: <CAAhSdy1-OQ8h1v-xsMsHqBdJxCcbEFeV9bSanVm+M0D3dgnp5w@mail.gmail.com>
Subject: Re: Random memory corruption with v5.2
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_011423_675852_588A2A21 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 31, 2019 at 1:09 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Jul 30 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> > - Commit bf587caae305ae3b4393077fb22c98478ee55755 ("riscv: mm: synchronize
> > MMU after pte change")
>
> That would be my favorite.
>
> > - Commit 6dd91e0eacff0a5c822ca37565d6b5740c4d2a80 ("RISC-V: defconfig:
> > Enable NO_HZ_IDLE and HIGH_RES_TIMERS")
>
> I had these enabled forever already.
>
> > - Commit 671f9a3e2e24cdeb2d2856abee7422f093e23e29 ("RISC-V: Setup initial
> > page tables in two stages")
>
> I don't think a one-time initial setup can have such a subtle effect.

The initial page table setup patch is not present in 5.2. It was merged in 5.3.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
