Return-Path: <SRS0=IJcX=SV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84753C282E0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 21:13:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F4CB208C0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 21:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TBFn4+t4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="H9HwqyWy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F4CB208C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTQtVc6Vx56jYC744etfbka5zjUQccO2qjePTAfns3A=; b=TBFn4+t45kT2GU
	OW6A314M2+lak50ZpjyJWQZEPzAZYWat0s0QDSKmDU7s2H+sN+PY69sVqWzEZCis75wrPWmkjKFsQ
	kXVgbRSmCBAPobU2SkBw1cqXZRMCCeH7u+s2QtNjjAz174NZaFsQshALlLK3m7vm0A3wCu0D4Khs0
	mF/QDpU5zDxJPt6lQqkATgI7ysOP3KyuTRngXfJTPpd5IKGI99fZZCdV3HrMjJVdHkdAldXk9RRO9
	DJsDirOIwEmFhWsMZPMnzGlMInjTyw2opJyf0/L078dA7C7YfTvmJiGWM9vA/UO6Tu5MEp79XqZoF
	QCA8sb4HAKP+YMzYwFxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHapI-0000FF-1t; Fri, 19 Apr 2019 21:13:40 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHapF-0000Ev-Cp
 for linux-riscv@lists.infradead.org; Fri, 19 Apr 2019 21:13:38 +0000
Received: by mail-it1-x144.google.com with SMTP id y134so10121871itc.5
 for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2019 14:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=PDbWxb27fzlzzWLDxv2f+CVVkrb2FlVAONWimUJDpDE=;
 b=H9HwqyWyJ66jfkcOgCjeTmJ/A/Z3Lqv9zJQUjiVfODxEYXxFaLd6bFt5k/9Cj27RpD
 k5ghRtuoHeQ3xo+KGz67aaUO4CUFzJ2ViKX83lwXJ28Mln1M+y0oxhUq8ijdcruaShko
 LuGNKLr7ydsacRgR5/NtiYQokOEJrdG2YiWz+dkHWGiBnfq+rRCjQk14ceqPnX5DsHOu
 UAo7GEUYbO+XCuUwavtfuDaXqN7CqzKt0BGeM4S9nO+EQlDMvR1DP6KfxRM9YUHWgztT
 zMJh4DpAc8/THc0h5iTqNpmvgvyatbyLKfCgfkH0hZXc46gqMVL0ouyF9744Xgt8iBYt
 Ouuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=PDbWxb27fzlzzWLDxv2f+CVVkrb2FlVAONWimUJDpDE=;
 b=NK+ZzDeG6AtYzTHygoXJ7S0F8mEPet6/t7C0yQn7JwzDykmyxtAPFf3By7OzOaM8Em
 ZRR3m3S+m/0g5v/ru8oFAAb/xXePYEppjPYPyBe4JB/nc2mpayUdxhNQnBFYqwimzMrm
 STd2oDMU6+5qx+HMHmSzKKloCui9VqRy9p4reEsv+uXVScA5asm83M6rcCKj+8ZT+Zv1
 HfxAvyUdQbggXVMYOckTorZmEsr9oIOGKfc68cfm2SLGf6ynZWRUSyIxPh0GaMK4skyt
 KiD/yZhnWOLMICDCLHc0a284Y3gS/E5ScrD6AiT2so1FNOOeDQ6JWRVGs/oToH0HPdo/
 xSMw==
X-Gm-Message-State: APjAAAUXnwq7VsaL37jAUmW9R+CwNFO9qm6L15IGHZ2Ubw2FxucDHREB
 W4OKYGHhLR33wIuqrT9p/srvjg==
X-Google-Smtp-Source: APXvYqxefgCQSLJJmbb1fnAb05JCxgT0qx3hF+pjPtWqkbr8h20/Alu3bYVrwshxLXn/4Aqof7iv3Q==
X-Received: by 2002:a24:549:: with SMTP id 70mr4632419itl.108.1555708416119;
 Fri, 19 Apr 2019 14:13:36 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 65sm2987763itw.1.2019.04.19.14.13.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 19 Apr 2019 14:13:35 -0700 (PDT)
Date: Fri, 19 Apr 2019 14:13:34 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v5 0/2] tty: serial: add DT bindings and serial driver
 for the SiFive FU540 UART
In-Reply-To: <7htvetbupi.fsf@baylibre.com>
Message-ID: <alpine.DEB.2.21.9999.1904191407310.5118@viisi.sifive.com>
References: <20190413020111.23400-1-paul.walmsley@sifive.com>
 <7hmukmew5j.fsf@baylibre.com> <883f3d5f-9b04-1435-30d3-2b48ab7eb76d@wdc.com>
 <7h5zr9dcsi.fsf@baylibre.com> <f2bb876c-2b44-663b-ea06-d849f721fb6c@wdc.com>
 <7htvetbupi.fsf@baylibre.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_141337_467019_7F6F861C 
X-CRM114-Status: UNSURE (   8.84  )
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


On Fri, 19 Apr 2019, Kevin Hilman wrote:

> Looks like Paul has so far only tested this with BBL + FSBL, so I think
> I'll wait to hear from him how that setup might be different from using
> OpenSBI + u-boot.

I'd recommend testing the DT patches with BBL and the open-source FSBL.  
That's the traditional way of booting RISC-V Linux systems.

The goal is to transition to U-Boot over time.  However, right now the 
U-boot port is still new.  It wouldn't surprise me if we need to modify 
the kernel, U-boot, or the SBI layers as part of that process.  In the 
short term, we need to get some sort of baseline DT data in place before 
more chips and boards start showing up.

I'll post a separate message with details on how to reproduce the test 
setup that I'm using.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
