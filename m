Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E33EE7FF4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbvMEAFsYISVb61vIqLFkcr6XZOypC9Pt6hzXOcncvU=; b=nNgwj1oqYW5+IJ
	iqjN3+/odpDaWipy8P53OzhWgC/edZEYgsOi0iv5zCb1eSEEItMPiYG0Na5mX1SNnmjbQ8mSHl5lq
	IZSh7YalzdBx/u+lw6ltmf/muao0OHZzk5dEescK7M4V4gL/D2MJQ0APaCimTFgDEEhyRtUdDikuN
	45wnf3rKRw/fQiEbZFrcmCquIR7Lmxwd126lHXZUlbKwLTw67p57VuLX7BL5QySuWgi/TD57VmL80
	2JQTp+hTxhaWTUk4RuJgP/zfUssLXQsuyMmnhkd6gE3jqI+uWuASvUTc5/w00HGdRH7sZnM3xChA6
	m0g+2dIQmP4RY+wfBvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgcz-000ZE5-0X;
	Mon, 11 Sep 2023 13:06:57 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgcv-000ZDC-1Q
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 13:06:55 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-68fb71ded6dso860290b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1694437612; x=1695042412; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UC0qFPbWeIAnNY2crnDoiyfH4L4DNcPUzmyIOiPmNaw=;
        b=PyZZWgzkPQ1WYY0f58ia2Sdb+Yd4AnTsb7g+CIVXQbSqxCsvzDFd21sfT3whkHPgH1
         Iqy8uFyxNEyZC3aRmQ8vx+cXGliKIADrT5Eowg5bTT85A+jC1Z5Xdf5rO9uk0PwHVJY9
         Pt+2Nqnine8Hso/mFLQTXnhp23aimWhHAqah8RYan3shFdisBKFWXNbmYbqJhYZ//zBY
         xIY7kjGa6uhuavnJmaOpy3nSmgfxgAwMMaLCdAfvoo29FpvOZVv5hSBAI1AboEtiXzKi
         poXP3rKvUUHduZ9WMLq6puFOBhrxCpakzyCKLNiFx5cvSrWfNCtVF4yptd60qR4t9Zgq
         Ou/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694437612; x=1695042412;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UC0qFPbWeIAnNY2crnDoiyfH4L4DNcPUzmyIOiPmNaw=;
        b=qdvnkRmm8dUtETSwxOEzBpsRwzN2NkEkS92eH4MPBx02/wm0sifN7fC98DfGsdTo6T
         XWD6eYVk9aTENjRHjOjRBJAz/TSqr5FZlJ9ViGnQiL1n+E41XaGHJhyQ3/DfyLyk8hf7
         Ws0or14J8ldl/fbllDs6PsmnZMjbMHEP5trEyDbPs+gFT5OYmwBkI3g9WZoqB4j22OcS
         br8iHcsMK4LMLU5AOxjFb1bJHfAb9am6SIv0JfwiGpybaAE7eK+7s8V/CmO4ETSKcDfo
         VMEsUEgSyBfrzri3WJbMlP5XQVbqp/fcojRl7+okpHU4tTRNziBQoXL/+FMTr4o8JG5T
         x0JQ==
X-Gm-Message-State: AOJu0Yxj35e5xhzxbpYA7qMKU0skvZxAwC2iS5GxVXCmad+bRWmJg9Y5
	Vsr3noIeqLzECkPLDNLnBn+tHw==
X-Google-Smtp-Source: AGHT+IHHHsd8mK5/qRvQGb/rxDKfPMV90hFOs3PpoPszjaiqIs9Gy83oAs6eYTFLtxvjaV6gsb9LYA==
X-Received: by 2002:a05:6a00:22c2:b0:68e:2c3a:8775 with SMTP id f2-20020a056a0022c200b0068e2c3a8775mr9544336pfj.33.1694437612188;
        Mon, 11 Sep 2023 06:06:52 -0700 (PDT)
Received: from ?IPv6:2402:7500:4dc:9c7e:4872:7ce3:318e:18f5? ([2402:7500:4dc:9c7e:4872:7ce3:318e:18f5])
        by smtp.gmail.com with ESMTPSA id s21-20020a62e715000000b0068991abe1desm5787400pfh.176.2023.09.11.06.06.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Sep 2023 06:06:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v4 10/12] RISC-V: crypto: add Zvkned accelerated AES
 encryption implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20230721054036.GD847@sol.localdomain>
Date: Mon, 11 Sep 2023 21:06:47 +0800
Cc: Heiko Stuebner <heiko@sntech.de>,
 palmer@dabbelt.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 christoph.muellner@vrull.eu,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Message-Id: <CCA32056-CCE2-4FB5-8CFC-62444CDDA89F@sifive.com>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230711153743.1970625-11-heiko@sntech.de>
 <20230721054036.GD847@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_060653_497372_663E05AA 
X-CRM114-Status: GOOD (  13.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: 20230721054036.GD847@sol.localdomain
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Jul 21, 2023, at 13:40, Eric Biggers <ebiggers@kernel.org> wrote:

> I'm looking forward to having direct support for these AES modes, especially the
> modes needed for storage encryption: XTS, and CBC or CTS!  None of these AES
> modes is actually implemented in this patch yet, though, so they can't be
> claimed in the kconfig help text yet.  This patch is just a starting point, as
> it just adds support for the bare AES block cipher ("aes" in the crypto API).
> 
> (BTW, I'm much more interested in, say, AES-XTS support than SM4 support, which
> this patchset does include.  SM4 is a "national pride cipher" which is somewhat
> of a niche thing.  I suppose there are already people pushing it for RISC-V
> though, as they are everywhere else, so that's to be expected...)
> 

We have further optimization for RISC-V platform in OpenSSL PR[1]. It will include
AES with CBC, CTR, and XTS mode. Comparing to the generic AES implementation,
the specialized AES-XTS one have about 3X performance improvement using
OpenSSL benchmark tool. If OpenSSL accepts that PR, we will create the
corresponding patch for Linux kernel.

[1]
https://github.com/openssl/openssl/pull/21923

-Jerry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
