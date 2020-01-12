Return-Path: <SRS0=A2hO=3B=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5CDC33CA2
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 12 Jan 2020 18:12:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6786121569
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 12 Jan 2020 18:12:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TiEjgByX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WFSsG2/y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6786121569
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e3CTVqfwVB8ZiU/Nlsteqsk0IzbNSugwDXW2au/cyRw=; b=TiEjgByX5efz3ToZ6Y8Ny/9Cf
	8bmdlL6S/Mq31+GNMvUhmJ24spayPsZt6BRP/mzXgGbUiTKBe9hC2nRso3lUvvBzu0THIUEz9djwo
	RWsEvXvBwriMy1m7lKl4ETkK2A3PnV8pCLALlDgRFrebi1te3m6nc2t4SMUhJTgWMCP1o81VH3ocL
	eSWYQ2mMzkRpFQ7VgUvFk0lHOykr8n/uX9BqtEDK1GmePT0ImfcTXac6Dxr3tDRZkjxbCZzyGdzj/
	2LEDJoyKOW4ucZ46Z46MDUyH3+42DbvpkZt1c1KMXV8k/pdaKW7UdIEUNHycf9ERE2KTXcNzbHj2F
	bI0mZQd+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqhiv-0005GF-S5; Sun, 12 Jan 2020 18:12:29 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqhis-0005FC-6n
 for linux-riscv@lists.infradead.org; Sun, 12 Jan 2020 18:12:27 +0000
Received: by mail-il1-x143.google.com with SMTP id t2so5974835ilq.9
 for <linux-riscv@lists.infradead.org>; Sun, 12 Jan 2020 10:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=e3CTVqfwVB8ZiU/Nlsteqsk0IzbNSugwDXW2au/cyRw=;
 b=WFSsG2/yf3wle5KTOl/qmjFIRIKTF5AF+9fGE9V+3GLXs8NGX7DQK4xKIVd7dLtMFF
 9HahEOH1PIQ433mvns+NP4lp5Cl05pA55L4575fITfrFfeV+Wm7ATvqdiwXBf8r62MTK
 wkMDKIgnMd4HpRqGrGJPuHo2oFJJ7ao0M5VN+t7t8pOV8GE4pU7W1JEt55JnXO3uGyrS
 YnUNzarWKyVsY636bzkmd9/cOKf2HJPhBg7sQbEeQF/OrhReJFVX1wnOcqpXpSsPtgaa
 bUDDUxxxh/t1/7fQKvstNqtJbTw4P8fLT4RiRlIuv3H+gfCzFl7j4A9Cun/u8DlYYaMw
 +WMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=e3CTVqfwVB8ZiU/Nlsteqsk0IzbNSugwDXW2au/cyRw=;
 b=hpYlDPa6HPE+Ge91+cdZeX4JuLUrL39M0d363gEiKbScwQuynZCt0ho8uxyaMpaaPM
 cAJcTaWhGRe5ETAbjeZ4QkWxpnEqDeEqRi1rNgm/LAxfXI2kXyqXVy3ApgkQzQi6PxRa
 sAvE1XOb83ThAn+dIHpkOOlyrFYDB0dDeVNPfFLuvBOVV4xlOGGz6dIkuEhMx3CS3Ne3
 CwXWU8G80zHPgjLrZJij5ZV7m0FXtmNpq8glYi8tayPFUzcbVF5gQZFucMxWcBdf08Xv
 q8HGf4W6cI4PMAEmTHyUGTsxgUnH4jolcoAmjqhZCr0LyNNp+bcehDnMGLapk/fqGulP
 /nWw==
X-Gm-Message-State: APjAAAUv/t99w9Sa7DuybQu86Q5PRlWj9Ol0tj32ovinhN6gHY8yCAgg
 /SirwHQEyhM5ckPyjuEt33S5KQ==
X-Google-Smtp-Source: APXvYqx9xtCFFybB8/4h3gLqXwDMu4zv4xw5vqc48ZNym/BcQuFJaDGJ7EuiIDNzweQ8PjnWqsJjOQ==
X-Received: by 2002:a05:6e02:d05:: with SMTP id
 g5mr11426851ilj.272.1578852744782; 
 Sun, 12 Jan 2020 10:12:24 -0800 (PST)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id a3sm2146879iot.87.2020.01.12.10.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 10:12:24 -0800 (PST)
Date: Sun, 12 Jan 2020 10:12:21 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH v3] riscv: make sure the cores stay looping in
 .Lsecondary_park
In-Reply-To: <alpine.DEB.2.21.9999.2001091126480.135239@viisi.sifive.com>
Message-ID: <alpine.DEB.2.21.9999.2001121011100.160130@viisi.sifive.com>
References: <20200109031516.29639-1-greentime.hu@sifive.com>
 <alpine.DEB.2.21.9999.2001091126480.135239@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_101226_464020_3FE35148 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: schwab@suse.de, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 green.hu@gmail.com, anup@brainfault.org, greentime@kernel.org,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Greentime,

On Thu, 9 Jan 2020, Paul Walmsley wrote:

> On Thu, 9 Jan 2020, Greentime Hu wrote:
> 
> > The code in secondary_park is currently placed in the .init section.  The
> > kernel reclaims and clears this code when it finishes booting.  That
> > causes the cores parked in it to go to somewhere unpredictable, so we
> > move this function out of init to make sure the cores stay looping there.
> > 
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> 
> Thanks, the following is what's been queued for v5.5-rc.

During final testing, when building the kernel with an initramfs, I hit 
the following linker error:

  LD      .tmp_vmlinux1
arch/riscv/kernel/head.o: in function `.L0 ':(.init.text+0x5c): relocation truncated to fit: R_RISCV_JAL against `.Lsecondary_park'
make[1]: *** [Makefile:1079: vmlinux] Error 1
make: *** [Makefile:326: __build_one_by_one] Error 2

Could you take a look at this?


thanks,

- Paul

