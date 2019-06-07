Return-Path: <SRS0=Yvo4=UG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE1BC28CC3
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2019 05:12:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF48520825
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2019 05:12:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cm3IPGDQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fTGcb3xX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF48520825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxjUmv8VqQqKT/01UhQ751nFsJqANZB61BirI2p0B4I=; b=cm3IPGDQ82dmbV
	gjh88sgH6ra1SD8k7rVMAXiqiXq3io4str9hXuE9eRgZmeO/GmuW3MHn1ludGAqkFO2sup+O2cktp
	fSPBwC3Wl4hbtpMMIChqyFT8UrzuVpM+uwIlR8jz8Ex6Mh06ICyQwZp6cZPeY16gH1yUbzVPCIShh
	JVgowpq7cq5SS6pgN+O58i3UP4YaQAeBYxMq/iWUXL/xTWSGZWKRQ24Kd7Q6vmFuhEy46w5IfEzJz
	Ujd6llMs5Mm+2RWNqwUPk6j3C9I9vFY8aMTbCGkdOmUH253vztYW9PajYp/wK/UY8JT4cwFm0EmKH
	fFv1BSmpxQSyMQHEwZ3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZ7Am-0003fu-2c; Fri, 07 Jun 2019 05:12:16 +0000
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZ7Ai-0003ex-Uk
 for linux-riscv@lists.infradead.org; Fri, 07 Jun 2019 05:12:14 +0000
Received: by mail-yb1-xb41.google.com with SMTP id p8so329001ybo.13
 for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2019 22:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=h725Opt78hWUyZOZqX4v0aqrQEDyoY/2hkomdBMgZww=;
 b=fTGcb3xXFdKONaPH9oQkjj23XRMg52QneHQ3o1/4KqrqzSi12zcaigy3bSDfyazyLb
 Yv+wiciiZCv/vzQSO6JHLgU4RlC3O5041wRfg/AzvszqmwncR+0lIW5ICXpf4Ex55m9k
 9gF9bl4930Bgid8pc3kehhY4qG1W2vCxcvtSjiyXPS34bIzB6ccC+c1A1whp80FT9+dl
 1Lss1mEbGdGzUxbM9AK0zHSTa5V11ydtv8qyKgarRrJ6OMwUha1UBHYqXgjsNDIqDLpr
 LXT4RbfkLpuxNPDXSIv+jUiyebXiKmdx2bromMdczIgNi2DEcHc/LgWpXmzjigwRZIrZ
 OTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=h725Opt78hWUyZOZqX4v0aqrQEDyoY/2hkomdBMgZww=;
 b=bHzyrz6119yMcKFRMeUtxs5N+uXCh16Eb1Ya4xitELOseV9CpS7YsfKWnjVoXGUyqt
 d25GcmXbVev8tKeLb0jiDCOzifDzRiQyVUDuVZ0zTmbkDgsSiAe4JPouVsJ7C89sHBvf
 cB803NviXkQFIfePJnKbj3y2boJJ+88up8wlDZq2s/1d6ecukwOlNoQBeQ9/5jovOAHe
 0XFnG3Wai115xmAw7Fn5Qw8mT4qBqVme7jYlZID0213SOJmEAoXQwysGxn0UX2eTOsyk
 3LrjpA7Pp6+5ORYD5EgcfPWClx0xdLVpZocRIb2Mfwaug6nEuc+GTlxS9TeoEhCvHv4S
 +ytw==
X-Gm-Message-State: APjAAAU8JdH4eoWUi8SoSYVSoK1F9bNxttYtqVkhIGNvNaziwq7uX0jF
 wfCzYMA2E+zJm3KuvXohZ4OXh/L1i1M=
X-Google-Smtp-Source: APXvYqw9Ntq0WkyHFD6oP3tUDeWJS3376kczaCJoqdE1ou8pDAsvwRtVSzBjiAcz48pEQTefOP7PkQ==
X-Received: by 2002:a25:bc05:: with SMTP id i5mr22535739ybh.335.1559884330298; 
 Thu, 06 Jun 2019 22:12:10 -0700 (PDT)
Received: from localhost ([14.141.105.52])
 by smtp.gmail.com with ESMTPSA id f6sm282977ywe.81.2019.06.06.22.12.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 22:12:09 -0700 (PDT)
Date: Thu, 6 Jun 2019 22:12:05 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH v3 1/5] arch: riscv: add support for building DTB files
 from DT source data
In-Reply-To: <86v9xlh0x8.fsf@baylibre.com>
Message-ID: <alpine.DEB.2.21.9999.1906062208280.28147@viisi.sifive.com>
References: <20190602080500.31700-1-paul.walmsley@sifive.com>
 <20190602080500.31700-2-paul.walmsley@sifive.com>
 <86v9xlh0x8.fsf@baylibre.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_221212_995057_9E76AD55 
X-CRM114-Status: UNSURE (   7.08  )
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
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul@pwsan.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 4 Jun 2019, Loys Ollivier wrote:

> Always build it ?
> Any particular reason to drop ARCH_SIFIVE ?

Palmer had some reservations about it, so I dropped it for now.  But then 
as I was thinking about it, I remembered that I also had some reservations 
about it, years ago: that everyone should use CONFIG_SOC_* for this, 
rather than CONFIG_ARCH.  CONFIG_ARCH_* seems better reserved for 
CPU architectures.

If you agree, would you like to send a followup series, based on the DT 
patches, to make the SiFive DT file builds depend on CONFIG_SOC_* instead?

Thanks for the comment,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
