Return-Path: <SRS0=1gOo=UE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42FCC28CC5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2019 17:46:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 794FC20717
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2019 17:46:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bw2ovctH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DkgsWaf5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 794FC20717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dxj8H1UfEEbfZ/S9q1XQTWghBoTASdbKcA8gfXnF3mc=; b=bw2ovctHP6YQR7
	F/6ycSywl9O26qaVPxs3b6hntJOdwUPxrsl/4YINaXkldvuwa41uq+Ys2b/YOi3EGLu0LbdjcyfVa
	P3hDfVxnDID95+a7ef7BgfEaJlLY5ba6Ip1o5SPux3NL+heM2SI9J1nigHvX3ArK5TdRCWnWo15tu
	1DyXYQjqY5lhileXMmpyoan5ZuY8YJXib001A9zRpbxwmiAxjSEqI4qCteH6yUK856W67LoPnXrpA
	b1WVTTNt8LbkWCdLWJtJlIBetMZwdZQdL9T1+IT8FY3qnLAZDjmY88MnMl0vh7PhX1ZslbHSqIxKX
	ccBb5d2liMH5jA7fRE8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYZzQ-0005Mb-90; Wed, 05 Jun 2019 17:46:20 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYZzN-0005LS-1q
 for linux-riscv@lists.infradead.org; Wed, 05 Jun 2019 17:46:18 +0000
Received: by mail-pf1-x433.google.com with SMTP id c85so6471195pfc.1
 for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2019 10:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=mdjnarB+nUXz7hnRyqlS2w/7X0NaH7xvH9rt61WhNEo=;
 b=DkgsWaf5ewgbwf/bhecR7Rlzf6+bbU/HCSGByz46RTTeljIuZgxfGrTodm2URXsetz
 zYc8Igeto3YdkLx+b2ImfPB9az8pby31RZ4PzJ+65G0xUDv1orMqZhlHjjxu+tbRYEsl
 V3oDPtEn4kppz3G1ccPtcREEO19sNdRiw2Fx9zkZP69V/gPMTnXX1oyu7SBNJL8EGqmr
 xEZ5HsFSy7ThZs9E86eAK1GRltaZcazaWgfYQTbmViawm5CCU9I/bE039nd4VfrZ4+vR
 4TonpnDtToAjc0p3pVpbjana5UawaEYHmvXq5hvGHZEQNm/n86b3zr1H9Kt/wwGVwYCk
 Dh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=mdjnarB+nUXz7hnRyqlS2w/7X0NaH7xvH9rt61WhNEo=;
 b=aeCB9AYKf2i6taH1lDriU0xz+/TAW72dRoy3Rh2f/BnDYhAM0sAzPwrJvCtvZ3gGBl
 vx+QUkwAGx9FGPmNaIDa8OPI8g3HyQNmA9zgpxyPX+rvtd4qtg2BTWn73gnsJ0WblaGf
 XPLyk2Zr8G7cXZtEkn9XP439h1UWNZmwrnc05+pQ3MxPQWbbKLjnTqTSuSxGrgdvsZdc
 kPNYo53lnvvg6Nq6ZXEV/beYJoOR89x5CUen8+9Bli9mmZvWrS6m3y1JRhQRWTsZyTGJ
 puQ4UNPylc61WMIGnjrGKVyE8pzMZ4SYtZDCXqZvNf+zJg2kpvfUNQSpRg8Ru4+pjuuh
 P1gg==
X-Gm-Message-State: APjAAAW8iWXsvfoTKtduptICmaQU7e4yA+wWAYzA8ZsKeR2shaGXqg+v
 91d187hGjMyZ2WLSRfdiY8g8jA==
X-Google-Smtp-Source: APXvYqw8SKXZxXfsqJkxBQv5IYJ1v6uVYYSyGSHw1/ni2fuuBT7oUs6WpH34VbtII796X3z4xjM9nQ==
X-Received: by 2002:aa7:860a:: with SMTP id p10mr48871257pfn.214.1559756769781; 
 Wed, 05 Jun 2019 10:46:09 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id r77sm26803689pgr.93.2019.06.05.10.46.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 10:46:08 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>
Subject: Re: Patches for v5.2-rc and v5.3 merge window
In-Reply-To: <alpine.DEB.2.21.9999.1905201019010.15580@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1905201019010.15580@viisi.sifive.com>
Date: Wed, 05 Jun 2019 10:46:08 -0700
Message-ID: <7hr288exi7.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190605_104617_097448_3A23931A 
X-CRM114-Status: UNSURE (   6.96  )
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
Cc: palmer@sifive.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Paul Walmsley <paul.walmsley@sifive.com> writes:

> Palmer has asked me to collect patches for the v5.2-rc releases and v5.3 
> merge window, so I'll be doing so.  This is just a heads-up so no one is 
> surprised to see 'patch queued' responses from me.

Speaking of v5.2-rc, any chance your DT series will make it for v5.2?
I'm hoping to have upstream v5.2 ready for testing in kernelCI, and
that's one of the last missing pieces.  I just tested it on v5.2-rc3 and
it's working great with mainline u-boot.

The other one is the default defconfig, which I'll submit a patch for
shortly.

Kevin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
