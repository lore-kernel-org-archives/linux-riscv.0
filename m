Return-Path: <SRS0=jpEU=45=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FD8C10DCE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2020 18:10:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0C1A20716
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2020 18:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BktvfWCF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="I4zPX1hA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0C1A20716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ThxoAdoQSQM9pAlbZPWqw81MdUwsTZ9Y6+LWvRbfZ+E=; b=BktvfWCFP7yb1aPmPfuYO/d9p
	PHxC71+UNc2LkUFrjx0NCw2HFGyAtV8x9S22Fgj0C6E1zHxj45Jbo/4aYxD2XYEt7mnP2MaQwhb+p
	Yt5eBSOc9XkA4ff0+ceSL4a5sk60U74WB/RZRQyuMtU26Skkolr/zdME/ZSygdj3RZt0xqGohQNiF
	NiANpwmyv+T1plwitFx1JljKlUSR4N2jx80VnGUmqPAH7Cx3bjktCSxvREBmP8F5GuzKxdXYN2OY5
	UT0Dv7GmZptRkI3Pyc+TWbSBIX0o7Yytx58XAiKQiXlPV7QIGgssGi1SYzhV724UP+8Ka6GpVDrZ1
	6oKHWKiWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCSHl-0001NY-0N; Thu, 12 Mar 2020 18:10:21 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCSHh-0001Me-Qf
 for linux-riscv@lists.infradead.org; Thu, 12 Mar 2020 18:10:19 +0000
Received: by mail-wr1-x442.google.com with SMTP id s14so8717283wrt.8
 for <linux-riscv@lists.infradead.org>; Thu, 12 Mar 2020 11:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ThxoAdoQSQM9pAlbZPWqw81MdUwsTZ9Y6+LWvRbfZ+E=;
 b=I4zPX1hAqqwWQr+KD7wIdNB8IDc8xVCFaQqpcf/QBvvt93eCe0UKU1GokWP6FUNkSN
 3avJ8B/nDOMF1Wy+vod24ROtU7gnar4IzKwGlQ3cts+oZLT3+2AoxvSHBCByMULRxcmw
 SkNS0e6zPlNNHxs9B4CKU4IQk+TAbBjfDVo8Ha2whoHY51lkWrdy06nf07Osu2TCRWcn
 kc/67yhqR08D0je3wvUaF0KkeV2JkdSPMesncQHZD6reiwgv38kYxKowy3DFCovR+GGu
 NR6539VibfizdOJS2RGLypnaqRAgXc0A54y9z6WYR1ZPIFP4QfqCK1DJtFGsd/rL3Zaj
 zLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ThxoAdoQSQM9pAlbZPWqw81MdUwsTZ9Y6+LWvRbfZ+E=;
 b=HqnOce82RReNUTEox05rUxgzB3RhcM2CXsxW6aUYVHvjwdPrjDLl5eMRl0W3vOReGR
 //KXet9dawxULw1BPNS/Le9C0pBaVYDHuzyQZOyRkPxrSWP9Br+wn08rgJWxQ4YGJOTd
 Mi12F1A1bexpefjjidjQDPps8JmGNmfFtM20uz5AwnzfWeaK1YuQxyZOLEdhN6OjRcbL
 lClr/4HRLv0J9XTWoekBJOr5Gxf1l0HaL4Dle9K+HHV/4dnmWvY5uwqrY5w/4JxBiWkZ
 ubxkOkiBIsqAsqY5SAtB8Bm2F72Oz0uLK628Hl+gkeJQrX1l2Oc8w8IStr5X2LhdWjj1
 RfTw==
X-Gm-Message-State: ANhLgQ2pH8kz2XFfrwQTzIkhYdHpOHtemCMxF4+IT3RqmA6USbU11Z/W
 Za6xOyHgf9SglCwdZFbOQLUbU5pba6h69FmRF3Me
X-Google-Smtp-Source: ADFU+vsAKi4xd8G4idFSFlde8NxwfZ79bOricTkjLOphH8joDiSEkJuvkz9pa2jQo1q+a34sKZqI1GUmsOK5hwgACP0=
X-Received: by 2002:adf:ed86:: with SMTP id c6mr12951970wro.53.1584036615160; 
 Thu, 12 Mar 2020 11:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200312051107.1454880-1-damien.lemoal@wdc.com>
 <20200312051107.1454880-10-damien.lemoal@wdc.com>
 <47a2207d-6c16-b007-4c35-7c1a0649ecc0@gmail.com>
In-Reply-To: <47a2207d-6c16-b007-4c35-7c1a0649ecc0@gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 12 Mar 2020 11:10:04 -0700
Message-ID: <CAOnJCUJjLB2fwW+ZAKc9nixUeJJm7pg8KxuOkqF5pvY1c0nRsw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] riscv: Do not initialize PMP on Kendryte SoC
To: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_111017_866501_B6DBF5D4 
X-CRM114-Status: UNSURE (   9.20  )
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
 Palmer Dabbelt <palmer@dabbelt.com>, Damien Le Moal <Damien.LeMoal@wdc.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 12, 2020 at 8:20 AM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 3/12/20 1:11 AM, Damien Le Moal wrote:
> > Commit c68a9032299e ("riscv: set pmp configuration if kernel is running
> > in M-mode") added PMP initialization to M-Mode. While this patch is
> > valid for any SoC following the ratified riscv specifications, the
> > Kendryte K210 SoC is based on earlier unstable specifications and does
> > not seem to support PMP initialization (the SoC crashes if CSR_PMPADDR0
> > or CSR_PMPCFG0 are accessed).
>
> The PMP bit has its polarity inverted in the v1.9 specification, and is
> called the SUM or Supervisor User Memory Access bit.
>
> --Sean
>
I don't think supporting old specs in Linux is a good idea. As per the
patch guideline
for RISC-V Linux, patches for only "frozen" or "ratified"
specifications are allowed.

-- 
Regards,
Atish

