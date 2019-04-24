Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC52FC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 18:58:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CF5720835
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 18:58:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dKKxU5pn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="H71LRfRp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CF5720835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTHYfp03P7hz240rYXWTAa/RszDtD46zGVMZHcu75A8=; b=dKKxU5pncakt1s
	EAk5EBNh9B36RhCyhpziRQqVooWRoy3vigbejYR/f6iSCOnoeqnLchy/6ILb8s45ISbHHgQCrmMvV
	b7IpJoc0/rKGF66eyWdTDuAJ/WK25hTIdynSbAN7z8Ag3jWtvQw1iDHjUnGCo3bnVits8nXAl1tOc
	JKf3E0wF2lvQ3jGpCt00kT/WuezOT8XlxkBFxUAVkkHERMEqSQcirXpAqh4FbDum8UXTfjG3pw4ue
	i+YSvT+G9gzA03kPrQ+rf+Zraj39gGzuEVCacOFq7vjdcLwz0Dssl0gM9fgYxGuZ8iAVhDmk9l+/V
	n03en4Mr9/eZPWZIykow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJN6I-0002wY-De; Wed, 24 Apr 2019 18:58:34 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJN6D-0002nl-GO
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 18:58:32 +0000
Received: by mail-it1-x142.google.com with SMTP id e13so8057261itk.4
 for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2019 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=/T1HbxMN+ndVKYcaRHpxcbbsgU7fYHok3PpEnUoeplU=;
 b=H71LRfRpXjOawAclrjyT7fhPMqFOBOoNK2XAXlDKv3IuwkWprFIjQS8CTPb3Q8HlnA
 YrHBEl4Qs737X8U5ZnYDQyO5r9tPwvf0AyTiFp1OqPYsodGcp0lot3Kgul+apeYsCiJm
 PEWJSulmnEHM9BKAJSpgR/kB8MYzPxZ3GvV7LjWaXHJAsSmAYe6GsIj89eJZ4JUOM0kt
 GildtIh80ZbFgsl6E0EDjLJAecayxtc7zhFCD5vyzzdfZJC/EfsmXgcb5x4mfIPheSqJ
 ZZCZ/HeMD54FqNQ7wQzC36Kq6cIvxLHwQVXJktuxupjo9PyVZJYz7uZSiHZEGSeT+5Iv
 MN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=/T1HbxMN+ndVKYcaRHpxcbbsgU7fYHok3PpEnUoeplU=;
 b=btJaf93KqkVxcKjKYNLdFTRaYe32k4qNHV2NrH3EZv1GcylSpwdfvAmYEYmjR3JbXl
 iIPVbCDyZzp8LcimOcAT9FAhSvho3Hx/TfEFs+kgcQnulM1oYH4M6TO9MYFBnQE2bIEz
 H5vQUVtsKdUnMBnuKpoij7lPrqs3CWoy/gBqBG6ItIOgZbSi1Rt592BHK1Mu5g5zJnMn
 tlHoC6oxZDfvatfYnQa3ICltuaRL3BDf+kYWi2jNUAnMcjaYojvWHFYBxCx3wuEVNVve
 xSXbWG+it3faQCK3V6a7W6yLUp1iGnbaX9cpF3AOlSPZ0NLenw862MOND2swMmIrTl/K
 9UTg==
X-Gm-Message-State: APjAAAUsg2JY4eYx78KlMAL/He2oGwtnZthsLNTob6YX3eifEsscqTf5
 UhXI6nd3jlsvDnD1qOEaL2cOaQ==
X-Google-Smtp-Source: APXvYqz/ZiejlNwq5qfqJFkIbFpH8jXSloDXM+ua64jl8aMMMGziS7/ZV48R7ZX/9TlMjnBd9u00+Q==
X-Received: by 2002:a24:3a13:: with SMTP id m19mr439055itm.88.1556132308063;
 Wed, 24 Apr 2019 11:58:28 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 s8sm1075669iot.55.2019.04.24.11.58.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Apr 2019 11:58:27 -0700 (PDT)
Date: Wed, 24 Apr 2019 11:58:26 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v5 0/2] tty: serial: add DT bindings and serial driver
 for the SiFive FU540 UART
In-Reply-To: <7h5zr9dcsi.fsf@baylibre.com>
Message-ID: <alpine.DEB.2.21.9999.1904241157300.10713@viisi.sifive.com>
References: <20190413020111.23400-1-paul.walmsley@sifive.com>
 <7hmukmew5j.fsf@baylibre.com> <883f3d5f-9b04-1435-30d3-2b48ab7eb76d@wdc.com>
 <7h5zr9dcsi.fsf@baylibre.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_115829_871298_6E695257 
X-CRM114-Status: GOOD (  12.56  )
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

Hi Kevin,

On Fri, 19 Apr 2019, Kevin Hilman wrote:
> Atish Patra <atish.patra@wdc.com> writes:
> > On 4/18/19 4:22 PM, Kevin Hilman wrote:
> >> Paul Walmsley <paul.walmsley@sifive.com> writes:
> >> 
> >>> This series adds a serial driver, with console support, for the
> >>> UART IP block present on the SiFive FU540 SoC.  The programming
> >>> model is straightforward, but unique.
> >>>
> >>> Boot-tested on a SiFive FU540 HiFive-U board, using BBL and the
> >>> open-source FSBL (with appropriate patches to the DT data).
> >>>
> >>> This fifth version fixes a bug in the set_termios handler,
> >>> found by Andreas Schwab <schwab@suse.de>.
> >>>
> >>> The patches in this series can also be found, with the PRCI patches,
> >>> DT patches, and DT prerequisite patch, at:
> >>>
> >>> https://github.com/sifive/riscv-linux/tree/dev/paulw/serial-v5.1-rc4

...

> I've just updated to u-boot master branch with SMP enabled, and build a
> new openSBI (also from master branch) with u-boot payload. Using your
> v5.1-rc4_unleashed branch, I see 4 CPUs booting:
> https://termbin.com/kg13

Now that the serial driver is working for you, care to send a Tested-by: ?


thanks,

- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
