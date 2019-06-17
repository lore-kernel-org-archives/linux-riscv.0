Return-Path: <SRS0=4kCy=UQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6523C31E57
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 09:58:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EB8620848
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 09:58:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zex+0Hjp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GztjFeCg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EB8620848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qCmGvEyPp9qqzDRxyYRmxiBBAcRk90iccwtHVED1Ug=; b=Zex+0HjpQSsz3Q
	GOJSplPcTZeQAJxX3FeHWNOc+8p/hGvBMzJImyoiySL8aqgt6Fxy5VFClAIOGX+ZQHkWUrAu43iWf
	A+LgfWfuChLa1MwqbocaLt1E4TJbBLd+L5XlH0cOh9BWkeSjkbCTfqEuSd0+m389rHAPZqCI3Rxg3
	637zcWdvnc4w3KcfEuKr+2O7bxuINqzxNzHWEpDPk0ehidzJvhukgny6gjZFM8woKeg6Iar9UdPe6
	SHK82Dg4urViFI9csR5dFZYFl3/jxdRo0FIcuLoTPLQaLXpizkZaQ6pDF41QiOlSxlaRy0xqWsWOJ
	fngV1HTrloSVoC+Bt2lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcoPB-0000YM-S8; Mon, 17 Jun 2019 09:58:25 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcoP9-0000Xs-6U
 for linux-riscv@lists.infradead.org; Mon, 17 Jun 2019 09:58:24 +0000
Received: by mail-ed1-x542.google.com with SMTP id s49so15332372edb.1
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2019 02:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=k/FkMrNeRTkozEqierq2rmbV5zRaMHg6J2eVIWl4duU=;
 b=GztjFeCgsx2WVQQlaCXYbhcPsiu/7YqqR997H6U3zan9rYs0xa6xFeiRivc/RtwM4x
 b/Q9XQ210Gv+8E+J7NDLQUrKd2naU4exI1G+xlsKnjxh/RGc/6gcZqi2NpV2DfMZRC5K
 uidbnB9l/Kn69qIo4+cWA4rb4+B2Fbf4QJ/WAvydPHIP2SHKcIj6K6yDJx+lbjldoNwQ
 UP6mmVLBfZ9zo0ukP6Krhe016u7ATMe7UCtiXsIHvD6jCTsMINZu9tNSxpgXv2A5W3EG
 yp6OIeyJeWq7Gzf4F/jGva/OHSnuOxtAeQ0eLKUmMQ9+PLwB9QJyd3EX1UeD+D7wl7ni
 xSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=k/FkMrNeRTkozEqierq2rmbV5zRaMHg6J2eVIWl4duU=;
 b=JB7D/qGwON4qiTWlGQYrXBHg44LvRLAhPGmyYi9ZF1AD3vlKRRVL1PyhOttedMMwTW
 bh7dMBYNgN8MZAtz3ckHm3vK2avg87JeUPD31f5ujdbFO5/ZTrUClo+1g/7+4luFiOO4
 M5DNrH9sy2ZK7vUwSKRGcrzESk/XDOy/AkazZJfp8D2915yoMqH5qXiy9PgAiZERJ+hO
 M6dxkdFIpIuXZX2J7RK6T+lkveQ/WjZGK8sDbzKGd8AsRPiqrjwferbLYWhTClIvtWzQ
 alQF3nwC/YNyc0Xy+HK70/893kUNZMezKB5QlWBG/ciwLPesh8RQpAJ+fHk6EScJ5YeB
 SRWg==
X-Gm-Message-State: APjAAAUU0PEhW7LkLfE13basFDhl2lMfsD+1ckx3vrtuBvEUuHJcZI2X
 qfgAZ175vWNMuT9BrAcBMFh7WQ==
X-Google-Smtp-Source: APXvYqzzFOn2TYEUiWfO5QA45ng6P677kxEghJAuKXYs/UNNAuPRaE//NwSmVe/Dj1EArVjJXXbs+A==
X-Received: by 2002:a50:ad45:: with SMTP id z5mr95083437edc.21.1560765501430; 
 Mon, 17 Jun 2019 02:58:21 -0700 (PDT)
Received: from localhost ([81.92.102.43])
 by smtp.gmail.com with ESMTPSA id d5sm2095575ejk.71.2019.06.17.02.58.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 02:58:20 -0700 (PDT)
Date: Mon, 17 Jun 2019 02:58:20 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
In-Reply-To: <mvmtvco62k9.fsf@suse.de>
Message-ID: <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com>
 <mvmtvco62k9.fsf@suse.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_025823_276488_E4B845BD 
X-CRM114-Status: UNSURE (   9.98  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 Andreas Schwab <schwab@suse.de>, palmer@sifive.com, ynezz@true.cz,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 sachin.ghadi@sifive.com, robh+dt@kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yash,

On Mon, 17 Jun 2019, Andreas Schwab wrote:

> On Jun 17 2019, Yash Shah <yash.shah@sifive.com> wrote:
> 
> > - Add "MACB_SIFIVE_FU540" in Kconfig to support SiFive FU540 in macb
> >   driver. This is needed because on FU540, the macb driver depends on
> >   SiFive GPIO driver.
> 
> This of course requires that the GPIO driver is upstreamed first.

What's the impact of enabling CONFIG_MACB_SIFIVE_FU540 when the GPIO 
driver isn't present?  (After modifying the Kconfig "depends" line 
appropriately.)

Looks to me that it shouldn't have an impact unless the DT string is 
present, and even then, the impact might simply be that the MACB driver 
may not work?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
