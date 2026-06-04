Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A75CD6E57
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VIz6WKhb5zi5OeRWPaPlu4yIgd9+3ioNuWbuuPSBd38=; b=B2G5/77w2BcChP/Amj97jraJ6Z
	4Sm87IGcIX5UB1tCdXvfCXvPg83o/Wu+nIrv6QWC+rkF6PZqLkvtFGuMu/8aBSS+MKlmt+3D/7E7e
	N5V+vo2M6TiEBCpQMmWqz05A2P5Xqq03RylbL709qT+AL7VSSGOJRmbNhJDAxTdMv2ggAk652hlKt
	KAXZI/Bt3KnyrHO18+VUCs+nI1RdhCU9VK5ff1ZkVFZ/ua9XltfPKuDuuDVsNjVxsFrNMkfQuBsdx
	7qI5ZqDRbZhLdoNXQwPoHpU9BELYmLQqWdNAiwBGEzx4k9J0aCS6HULZnIfQRqr3uvikh02kg16Kw
	S2n1V4nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV655-0000000Gcs3-0SVn;
	Thu, 04 Jun 2026 11:17:47 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV652-0000000GcrT-1Jnt
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 11:17:45 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45ef3aeeb41so421312f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 04:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780571862; x=1781176662; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vMPINAxbwMQr+CA+jaOG7PHibBNPmddYJIp5CCiKSfg=;
        b=QUNyb4QFr8uE3rsyyLOGN0kcmGdXi8128/D5sZw/nPSm9/vOYls8XbaBvtpgT6M+kX
         5sW4xovLCd84Cjt73ydjR4gh7kTxzv7pzZc08TTbbBVRQ5ITecaQOy8hm15Kkp3MXiZZ
         iCI5ma568szdAU+QZCa+AjynzTYuwh2Kfp+nhC5xN+2WqV6gMaqvInd4jcCBVSd/iMxt
         HIn84Aoq3+ZDYea5GOJBHM+wO3KDhvbD4Fe5Cg8JROjB+5EXuTT8nnOhtd/XEF7UlvcU
         ngmMryeuHJm8RRNG0/4tFCywUjHJ5WIsDdMpBVeDgapdGFc9BYRH3gnw8hz5zKZDkoy5
         N1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571862; x=1781176662;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMPINAxbwMQr+CA+jaOG7PHibBNPmddYJIp5CCiKSfg=;
        b=sjd6CAQXGpKmvnGaAC3OY2Yq1fqSowaMVqMXlyoc9yRSMAFSOmo58rfSrCTCCCwuXw
         BNkgmSgkLErBE5vDLjzhMeEAEWbGcbGjG/fjpVV0OGGpM7rcFdHZlWYu05LGs35VDBnB
         IM1AuGT4imy6cKCSQ3rbh08YmUdTc6RoZpw+AGcQWy6qEGpMaz4spLTXTEmaMoJT3p8v
         xSSZxs+JBIOpNg/4x6rGnVXYbQ67JYiBfKFeRu5U1ayWh8eMmRrkzNalR48eykB24dFL
         HLHb5JVgwiIRy2FdLFARhvdtIZ8M8JoeSP6iRgHoo7zN3stbhLBBHIp1W6nG+Z/TRCa2
         uEoA==
X-Forwarded-Encrypted: i=1; AFNElJ+uadELDdEa0tjrOD5LbYjJPrj35J6i75zL8HiKldE9je30Nz5e390gM55vZ+hKvN+9k4MEzY095GMr4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPqLo7qGn3QmPnUWp98puookF8IbUawOf1TfKt5c+RZ79AHRrx
	Fi5yEQ6hil0CVNPtnBT6KU4fDP9cP0/61lXYVTkYUlFakO1t51wLl5qe9SL1U2YDwyfK8pKvn9O
	1wQFK5xFFkQFAH+Tsig==
X-Received: from wmbz1.prod.google.com ([2002:a05:600c:c081:b0:490:af44:67a5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a016:b0:490:bc46:1a58 with SMTP id 5b1f17b1804b1-490bc461b57mr60168765e9.18.1780571861570;
 Thu, 04 Jun 2026 04:17:41 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:17:40 +0000
In-Reply-To: <20260526-rate-exclusive-get-th1520-v1-2-34cf034e1764@mailbox.org>
Mime-Version: 1.0
References: <20260526-rate-exclusive-get-th1520-v1-0-34cf034e1764@mailbox.org> <20260526-rate-exclusive-get-th1520-v1-2-34cf034e1764@mailbox.org>
Message-ID: <aiFe1NSoQDs1YOj_@google.com>
Subject: Re: [PATCH 2/2] pwm: th1520: Lock clock rate with clk_rate_exclusive_get
From: Alice Ryhl <aliceryhl@google.com>
To: mhi@mailbox.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	"Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_041744_355459_CE23D6FC 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, May 26, 2026 at 07:04:58PM +0200, Maurice Hieronymus via B4 Relay wrote:
> From: Maurice Hieronymus <mhi@mailbox.org>
> 
> The driver derives period and duty cycle from the clock rate read at
> probe, so a later rate change would silently miscompute waveforms.
> Switch to the new ExclusiveClk wrapper to hold the rate for the lifetime
> of the driver data and drop the corresponding TODO.
> 
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
