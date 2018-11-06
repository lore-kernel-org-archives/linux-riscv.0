Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE20C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 22:22:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39A6B20830
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 22:22:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FG4cYbjh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="n/ggGP2B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39A6B20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mh3O//VQSzEJrghEtpe/tH4xgB9MseAJMBvT5NeId3M=; b=FG4cYbjhwAEJdR
	TJA9DCQ1uiC78wLJUpCRE4PJGK5zY0YRJ/cYXT0kEzHxIQ/mkDealUXj5f8hDueE3Mxq7zfrxlad+
	lTDfWXCF4Ak+2M+xIicP8bpmtOVq+zfIt9to1EMJKZxhrEjlc2a29Lmy8404vskZ5CW2js/V10Gds
	8Az4rVqF6yTMVUL/lxHRi0IfVBXXsJKh3l4Wz3/ENJDPRDYuhvV1ilEltcFZi52XXmvRvgbeAuL36
	8CTV5Ys23g+tJjzZNquHWr/+LS5VE7TbpfM3QVgXXhQNtFMQpHYdjkLUZnNGpohNtW194GBe/JOF6
	IgXjKAzU7AmicUzNbYZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gK9jx-0007fa-EA; Tue, 06 Nov 2018 22:22:29 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK9ju-0007eG-4I
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 22:22:27 +0000
Received: by mail-lf1-x143.google.com with SMTP id u18so10046897lff.10
 for <linux-riscv@lists.infradead.org>; Tue, 06 Nov 2018 14:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9zZvvPwsGBroj85YG3ziNGW9xNZkOTOpbiaqB60/LG8=;
 b=n/ggGP2BJd1lXWFU0191zC0w/Cg6DNSsF/cDJXRQ8HenyHNtajv6X2hqfG4y35S7XU
 MAB3uL+uRWBbiiCccKWm5x5gguZOYxVI6SrpDQJzhB6Y+49oCtNpoTWGga3FdLYvFhDL
 cz3y5UBQXsEk7NFsn/SYB0al69LBRo1ZD1CZRbqY0XMzvhRZUn6gOUqB+7hxf9an9f/e
 d4dlNNXW09A85WbC8pvOJifpRoaWjCVozP6JKhyCc5Ceoza9ZfV72K3t1DKuzUHqwcsl
 US/gTceVppSmEAW3y/B0lJsrC7enYDGwtcYhGPn1xb3zntsuaZvtCcTEFCYGssqw295Z
 6KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9zZvvPwsGBroj85YG3ziNGW9xNZkOTOpbiaqB60/LG8=;
 b=Lp/UAIqq8s+ui8d96coSqD4K73IgJ0/v/JhESIabiv2xx97FGDgq+ve/vLsDdA5U40
 5wPw7JSi/5DUaSv+bqBdDOUWg/5wpfRCJsInvk7AmpfyoFKe4LCl7IXRxHXDpTwF03pG
 9zoPNF46a048KAbFu4vWGD7cRdQ+fkZTPppTqdq589gXCTXjkg5EIYS02ToRryfwyrXt
 o4AqkRVoBJgteAU91eO6Z4vsfLWGPqniGCcJzE4bAAzfx+yNs6YzDRy8vn6kJI5u0rmm
 bfA0QLpuGk8XKIAvuFmsHoMQrV+cjiSzBYVTENh7xoljyL7pEekjwsCLgkal6KPYVm9U
 Afeg==
X-Gm-Message-State: AGRZ1gJMO36HTFxqvP1wiODvLl/GV+CMuOqND5ArlBhkwLDGP0w7rjjJ
 nRi/4yor4CLmeE5aLYCDTBSeuFs9Ac8QV/NJHCHnrdog
X-Google-Smtp-Source: AJdET5d91v6juPzlnj1ui0xgvN15F06CW+3BWfT904Gf4NE8XfOz7qbEfoOzy9TWi9jkHLU+jc3qG9vMlFdLHKOPPaY=
X-Received: by 2002:a19:4c02:: with SMTP id
 z2-v6mr15718648lfa.48.1541542932548; 
 Tue, 06 Nov 2018 14:22:12 -0800 (PST)
MIME-Version: 1.0
References: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
In-Reply-To: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Tue, 6 Nov 2018 14:22:00 -0800
Message-ID:
 <CAOesGMiKMfvLQaqmruMs_sGcJ6i9z=GCApmMBn+CkO+8z0-=7g@mail.gmail.com>
Subject: Re: [TECH TOPIC] SoC maintainer group
To: ksummit <ksummit-discuss@lists.linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_142226_244823_1716E4C1 
X-CRM114-Status: UNSURE (   6.47  )
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
Cc: rmk@armlinux.org.uk, Arnd Bergmann <arnd@arndb.de>,
 Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-riscv@lists.infradead.org, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106222200.SZUyRnV761Yr7602mn-WdVMlzgy1YzB1PtKIBrZRW_8@z>

On Tue, Nov 6, 2018 at 2:16 PM Olof Johansson <olof@lixom.net> wrote:
> Mike Brown (gpio/regmap + more)

_Obviously_ Mark Brown, not Mike. D'oh.


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
