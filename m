Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860D6C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 06:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJgyc8t0sWb67eoIyTMDdBF4U59BuElJokRP/0HCTHQ=; b=Ecl++NWE+o1eX+
	CvmcHRiMwclHNqegalqqzBDXkx2VGu0l/Hz2X5VxXTSv5r+Q88FuM83PsKN8F8tL9/PjSBDCeCV9T
	z/F5jGhaj8HHBm2Lo+6oSdzBhwvtt/R7i2Thiji6dQgPq2nS1/H3mk90xdO4SJJvFny3FnZIKHlYq
	DjYaq4o59jrXHG1RsAyAxgKHUhVGYHtHpwvlxNkgNI7dOLAin5YVcaeT8GBtyqVqpajSifoEnrET4
	mjcetGlS/1BGBCiIyXL2qnPXuQo7B+6pg7JHojSG99utT4N/s55N6MZx8Qd28wklGY/fW9XPyOCib
	+TRQjROxKuawLnifoa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAn8v-00GUZk-9M; Mon, 11 Jul 2022 06:43:41 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAn8r-00GUX9-Vu
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 06:43:39 +0000
Received: by mail-lj1-x232.google.com with SMTP id m16so5049682ljh.10
        for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 23:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vYeId4FzfbuwrX6U3p5/rmTfl4tv1rUClzoqMxiZMbQ=;
        b=OEZ3pKq9AQqAy4Bh733PBdPOLzRL0KnqVzSny9JLxvLxWp4gkQTJCWfCQRSwZ2m0Ws
         /djDxRTF+BiIp+TAhxHBCAVpPDmroVO76Zp6IGD9iYvI8De45PQ8W5x3Lw1TDtTbY7CF
         /lJp35CeEOy2RxJTwJlZyf4DJ2shF2Wnwkv51TB5dIk5TDn6CXDynR6tIB9rnyi1BqTu
         ngvhjWPrZDN5nM3zCYyQ/SEql92rDpswk7E8XKrvC63mVvEdM1MmcMtPKRs2UrLmuQZ7
         QK89okjW9fiPEvcKAwdaPd8VFTsZ66C/m+4iJnIH8hgCn62FuPVKzXkf+we8CgO3eNPb
         61pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vYeId4FzfbuwrX6U3p5/rmTfl4tv1rUClzoqMxiZMbQ=;
        b=3IcMoNB43iXiUZlXbFCXduQD52aiCJckZxVj7Z9lb13YvM1u1wrTZ92eh3wq8yOtgc
         ldF3U1aWbuVb2yVwzminZlMhBO96V/QsoH2s1ZqLAGoSFGQHX2FDPZdA3TpO4kXLsTGs
         ndU6Y5MWcQ5i5D2pyzsHBlsjQ261BSzJfSEHmmCQ6ow20Yt1R+Ph/g8SGvtJ4E2Wug/e
         xOAFoBq7ovjdxBf1FF4LuNraaOF5k4uMiNSf90hqzLtUEa6MvjEa6KGC2t2Cwbw64QgP
         8za4uobQlfHGO50WNNtflMDPWzMY8jQBujxLMM2KiEoWBdIOQwm2tZEp660qz5jSMEFU
         1RZA==
X-Gm-Message-State: AJIora/NJoDceU8Xm2NfXuc7IOHGqKqnAWHlqBTwwprnXNkjvZLVR0oZ
	bHCfDaWWPshQdPLfyMolgFbcanlr1aUx4Q==
X-Google-Smtp-Source: AGRyM1tvKuX3k9C4iqlfJhl9HsB6ZPRBOY6V8lB6SMUAG9eiulT8vIicnb4fHX1wGdbyY3x3eErqmQ==
X-Received: by 2002:a2e:880a:0:b0:25d:73af:52b5 with SMTP id x10-20020a2e880a000000b0025d73af52b5mr47027ljh.298.1657521812776;
        Sun, 10 Jul 2022 23:43:32 -0700 (PDT)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id v12-20020ac258ec000000b00489dfb5d622sm375808lfo.257.2022.07.10.23.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 23:43:32 -0700 (PDT)
Date: Mon, 11 Jul 2022 09:43:31 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 1/2] perf: RISC-V: fix access beyond allocated array
Message-ID: <YsvGk+ybtFZ9wQk1@curiosity>
References: <20220624135902.520748-1-geomatsi@gmail.com>
 <20220624135902.520748-2-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220624135902.520748-2-geomatsi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_234338_041503_750FDF57 
X-CRM114-Status: GOOD (  12.29  )
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

> The root cause could be related to the interpretation of the number of
> counters reported by SBI firmware. For instance, if we assume that unused
> timer counter with index 1 is not reported, then the range is correct
> and larger array needs to be allocated.
> 
> This is not the case though since SBI firmware is supposed to report the
> total number of firmware and hardware counters including special or
> unused ones like the timer counter. So just fix the range in for-loop.

Hi Atish,

Just a friendly reminder.

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
