Return-Path: <SRS0=ZHC4=QE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF715C282CD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 22:23:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7154721738
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 22:23:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PEuPjaxk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLlaWEcR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7154721738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOEwmyWiBm9n8LUpezRDDed8kWjgGmV88DDGW00h2jc=; b=PEuPjaxkhv3N5i
	DabM9u9/oaISquPrzMwZ226XSq7tB0CkyztTOnjSDCAFaUMRz8724pen/vpnVNxSqDFpRab2QMnyn
	y4yFsT3CNcGIo4atOt+NhgbWWt5ywx8SYE86C6zefowJdH9K85cpUMzADkGO396i06duF5s7pr9SO
	egujzsvFaF6JDJpQ331dZCwAWhE3XaUbgTNELdvJUvB0eFy6zOTBmHbQeVPN076hlh0WhcwHYdQ7W
	MmhAnE2hVMYkPq239SXWvCJgiw21FX/IpZ+zFfUK69Z4LjN85sPgH3HR0VQr/TQgoXOW7LvSGQWFS
	/a7Rgcyn24Tam4glzldQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goFJd-0006E4-B7; Mon, 28 Jan 2019 22:23:41 +0000
Received: from mail-it1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goFJZ-0006DQ-Jk
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 22:23:39 +0000
Received: by mail-it1-x12d.google.com with SMTP id g85so1154711ita.3
 for <linux-riscv@lists.infradead.org>; Mon, 28 Jan 2019 14:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M15jUEkq5vcXEWoiQq7zZ/y9mnOJLSDUjR48uCQBIT4=;
 b=jLlaWEcRN2ucs/P2ptIUjHBrsz0CU3PuOizt+Y9SotH30LA64WSP3vRHppvWxJ7XcB
 pOzhga6qFvbDqjCutAevaOuoPg7o2Zdc32BD9nGNcF32ih3ATykvCtGDyF9le73WggYJ
 5qd5KB09flhuLk3yi1j9DS79bzpAWyPCm/GC7Tz8K+JJapPZjWYWIUhLYuCixikYfkeD
 HwjNj+GbLixO4abUp53ATMOe6aC07l7DsJ4aNgyicSewsauwOaHuLNHR8t56yu/G1/uv
 LNw8fqRR4hO7TkYPp/BK/FApodSRbGTaB/j5uKtFNjWOXL+/I0T2UyaA7kEYYjkf2ogA
 x3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M15jUEkq5vcXEWoiQq7zZ/y9mnOJLSDUjR48uCQBIT4=;
 b=G7zjR2UiG38aNFdICOF+GJqbMCXMgCW6YgQnaeP1qrVVBN+xP2c79RS211cRnQYXLk
 6SfrzAkN73x0KwPVodeSWXMVmFzLijAattS5iMVVKowXc87uVeSKHMm9vflGJDsUQjOj
 grPqK43WgC16csvQ0+JPNwQloyZVf1t6F+6TkEUbayPwnu/E+pXiGMSqgsY8HHQDkXg/
 mwFOBfMzn/uA/cZ0YwO47876DgY2nXrUaB+DQVP95kCd4E9M8kFy4d7fSsPjSb5B5Roc
 EkFx4ljVQQ2ArbA1Rp4dzVTLGbHRHXPUFL7JD99g7jI3MmKB/weC2Lv4jikVUXP9a5/+
 s1zA==
X-Gm-Message-State: AJcUukdCPzIPWH8qekaS4c8Ui0Pf1lksxTAfD46sjz7EmyEwuY3KPw2g
 w56AJrpPWOEPcpadKH3GQENI/fEJGBT16dJrkEM=
X-Google-Smtp-Source: ALg8bN4O5BL3N1rrrA5lqqXYAqIanaLCdD2ovg5YTCa4ViUTTWqRxAOR3eXAFM5rIptfqfYzPt33jQhoRoVZuOABRUY=
X-Received: by 2002:a02:ac8c:: with SMTP id x12mr13213264jan.72.1548714215559; 
 Mon, 28 Jan 2019 14:23:35 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
 <aadef824-7c76-5784-0ec8-de4344158c15@suse.de>
 <CAP6exYJttZXUp=NAikvQ-9Orj-Ptpj4=Pnj30GN90Rzt_Rvvyg@mail.gmail.com>
 <e67df6aa-b850-4c92-6b52-5be6cbecfffa@suse.de>
In-Reply-To: <e67df6aa-b850-4c92-6b52-5be6cbecfffa@suse.de>
From: ron minnich <rminnich@gmail.com>
Date: Mon, 28 Jan 2019 14:23:23 -0800
Message-ID: <CAP6exYK3yUvK12-wL4XW=+EYRzFF2cYdx70nrO0TDw3zg4eYMA@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Alexander Graf <agraf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_142337_676772_90D952D6 
X-CRM114-Status: GOOD (  15.24  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, "zong@andestech.com" <zong@andestech.com>,
 Atish Patra <atish.patra@wdc.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 28, 2019 at 12:37 PM Alexander Graf <agraf@suse.de> wrote:

> I'm fairly sure you know me about as well as I do know you ;).

Apologies Alexandar, you're right. You're one of the good guys in this game.

> The ususal answer I would have to that is to empower system owners to
> build their own firmware (which allows them to replace bits), but I can
> see how that doesn't always work for every case. I don't have a good
> answer yet, but I'm sure there will be discussions at FOSDEM about it.

I wish that model worked. I've worked so hard to make it so for 20
years. But I know from long sad experience it does not.

I wish vendors would not keep installing exploits in the firmware. But
I know from long
sad experience they will keep doing that.

I wish it were as easy to install firmware as it is to install a
kernel. That's not
ever going to happen.

The one thing I know is that it is pretty easy to load a kernel of
choice, and for that
reason I want to allow the kernel to load the desired runtime firmware.
I don't like hardware that does not allow that.

IOW, the barrier to entry for firmware, we've found, is very high for
most people. The barrier
to kernel is far lower. Ergo, I'd like to have it at least *be
possible* for a kernel to measure, disable, or replace
the runtime firmware it will use. Measurement is a minimum and
non-negotiable requirement. If a RISCV system
ever sets up a PMP such that firmware can not be measured, that system
should be assumed to be untrustable.

This was easy before PMP. I am worried that it becomes impossible after it.

> Sweet. What if you want to support 10000 different types of servers? You
> write one (or many) driver(s) each?

that code is going to be written in any case. Do we write for UEFI
(painful!) or Linux (painful--)?

> Does that same kernel run on all the 10000 different types of servers I
> mentioned above?

It runs on a huge range of servers, at this point every OCP server
we've tested, several proprietary servers from an unnamed company, the
Intel NUC, and chromebooks I've tried, as well as PC Engines boards.
But, that said, the system needs to run part of coreboot or the
SEC/PEI part of UEFI; in the SEC/PEI case, that's a blob we will never
be allowed to replace, so it has to be assumed anyway :-(
And it relies on the early NON-runtime startup that the rom-based
firmware does. But our goal is to completely disable all UEFI runtime
services and SMM. runtime firmware services have proven to be too
large
a security problem to be allowed on x86.

> At least here we do agree (mostly) :).

Well, TBH, I think your vision will probably be the one that will be
used, whether I like it or not :-)
Looking forward to seeing you at FOSDEM!

ron

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
