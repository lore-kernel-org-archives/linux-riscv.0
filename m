Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4536DC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:52:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FBFB20840
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:52:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BQNslEL3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VKOCxHMQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="W24weull"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FBFB20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yux+VNb/4ZlV4jtv3yig+YIeOdD9KHqn29ejHvFV9+w=; b=BQNslEL3B3k0MX
	weK3oNfyzDF+awaWUJzWhDEtfkRgo9a/OtYttApu7qKJYGWP+33qer8r0agFj1/0YWiP4Z/pyDnOG
	n2lgjsy5wvukHYaGFmbXz70cl1CKuh7zFOB6NVxxcB35az5Ef/J+wvUXkoatQiXmU3oF04LT+CnYV
	0nG01FmUFzHR8uG+WAraLOw5GZLyy5X7WiFrgiNaJPX9Da9YYFealwhjyGYDOLg3HRf1nQ/c6azaE
	EwOowLC6otQ5xVQBAxz6z50F92R2cJ5AVgxPoEqKEH/R3OoY6PSzroz+P5erfjwnvCBJltz7G5lmO
	PJHk10zxfIpEj68KBM6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXQw-0000FN-W2; Sat, 10 Nov 2018 17:52:34 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXQv-0000FB-MY
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 17:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MPvpBLTh99gruqpo09tdx4qHGwWrf6FdxWPUJ8v4njs=; b=VKOCxHMQuA4WWpuMrkji+/UaW
 MRjg7eLrSF3+1Clry5VIcIUH8gyGNYQ+Nin0sjTm9VzKPF8z6hNWmINHdubSlbCoT5ivapWy+SrrO
 RjyP9VoiTEz4vK8FnpK1O7oDlUMYr2J1ciOPWw68ZaJNTZ9HtnkoDPEeFkUQU+GsdEzoAzzyLFcf4
 3e8uVg4w2kCKN1lb67R+31FvAnoQMWh3SWIZ3eKo2lIVo8+CL4TClI/LA9YpfGMzoaGwzg18uStyF
 KHxcKmEVxATPB7tFI8ykdmYiJgIHfoQ6ApuRihd0p89l6tSQLryVlzCr19Q2LKrNbVdQSEFscRI8b
 FuLLOQ5wg==;
Received: from lkcl.net ([217.147.94.29])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXQt-0006TH-7p
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=MPvpBLTh99gruqpo09tdx4qHGwWrf6FdxWPUJ8v4njs=; 
 b=W24weull/fofAdtINfXNVaGcWUdXBLYzhS5tTJTAguqGuOOwpW8K9TClO7ZmmFr5dJfiT53DXVmbvWMDr29SqZ4nEzwZmmLK3LrHaxpsIKfmEXKzd2wsfSaYrCU5+xNIU6xs7/HCi0NSafcgmJZptib6TH+XYUdnxJIA5M3QbpQ=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1gLXQh-0008FK-TV
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:52:20 +0000
Received: by mail-lf1-f52.google.com with SMTP id i26so3526158lfc.0
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 09:52:04 -0800 (PST)
X-Gm-Message-State: AGRZ1gJT9z9Aei9V0VQB5M3L0rqZvnKaWwBJ4U6V3RAseB+u5f2kz+qj
 SoTLGSIxcRZfO97opyjvjWjCQCzESESxXAxPpLw=
X-Google-Smtp-Source: AJdET5c3YuHU+cChFwX9u1byiCMPkrBkM0cjpXJt/pX5FQqhqI+/avLf9Ag9J9aRREtKTTjwItzS4YM50wCvmCEvqo8=
X-Received: by 2002:a19:e01e:: with SMTP id x30mr7561049lfg.89.1541872318543; 
 Sat, 10 Nov 2018 09:51:58 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <70910d55a0046d9ddc7d4308cb56e581@mailhost.ics.forth.gr>
In-Reply-To: <70910d55a0046d9ddc7d4308cb56e581@mailhost.ics.forth.gr>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Sat, 10 Nov 2018 17:51:47 +0000
X-Gmail-Original-Message-ID: <CAPweEDyEk4=hd3_o2g3L4azcuZxB0KnFGBn3jWz9AT1F+mFwgQ@mail.gmail.com>
Message-ID:
 <CAPweEDyEk4=hd3_o2g3L4azcuZxB0KnFGBn3jWz9AT1F+mFwgQ@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: mick@ics.forth.gr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_125231_395715_BABC0E40 
X-CRM114-Status: GOOD (  10.52  )
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
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, atish.patra@wdc.com, sw-dev@groups.riscv.org,
 paul.walmsley@sifive.com, Alistair.Francis@wdc.com,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110175147.ZK6uEYHa9d4_8bY16aoHSYrg2HiujS9JKf5i8hPN9gg@z>

On Sat, Nov 10, 2018 at 5:45 PM Nick Kossifidis <mick@ics.forth.gr> wrote:

> >  yes, it should [have]: my feeling is, it's a little late in the game
> > given that it's almost certainly baked into pre-existing hardware, by
> > now, so the next best thing is a new function call.
> >
> > l.
>
> Late in the game ? Who's game ? Is there any "standard" way out there
> for mapping consoles to serial line indices ?

 any implementor that has put a SBI v1.0 into a boot ROM in production
silicon (or even has put it into a design that's already had USD $5m+
of engineering time and testing done), would be absolutely screwed by
changes to v1.0 SBI.

 if however... if a way could be found to negotiate v1.0 being as-is,
and v2.0 declaring that there was an extra argument? yeah that would
work.

 i don't mind either way: i just really need to not have to have the
financial burden of augmenting and maintaining special ports of half a
dozen applications including minicom.

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
