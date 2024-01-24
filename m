Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386BAC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 14:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXpBzWm/b1TeQMfrjnn8e+kR8MYf5r6iaz20vMZ4p7M=; b=H0Zx8CT7thzV7m
	ZPEoRKxl0cAS0mMM4y/rLEeKlB+t3HFF/6u20YHn9AdeEUmGIW9WCAhJZ+WSHCzf1Vxmp7My4y4EY
	fu7tELJKazidSK4qY6LkvccW/uaLa9tdpa9TSPgROY7VbCzmhblGt1EWJIG+QtGFZDmpt/RywGlRO
	Ez+gAvWlu08OTmTUFW76uvV9QQvLIUSH3m+kAOZBqfoyanBpr5uXLbemkDgohP/E7elSSGz/xyjxp
	80dIy/kNV5I21c8GhKmeU15A5f89BBnqHbEj0y29AJqEvLpxnQy1Uq2KkY9CZ9Zv/eEUqToUJpFQ2
	zmNJMHNVyu4+0z61Y92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSe1B-003bIG-1s;
	Wed, 24 Jan 2024 14:14:17 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSe18-003bH5-2C
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 14:14:16 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-55a8fb31fc2so5015242a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 06:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706105650; x=1706710450; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RVt0ZnKeByvzhrfkzssJmlz6f1Lvfiy149b2/exZGTI=;
        b=lBbhjASRuoC5LbGq4Wm3qXLwjQtnBg1QplNiOm5s96TqhLFtyeEp2QH7LMz/O1VXPD
         wy/DpHH7584t7wTBucQi/UpajbLxXkpTGmIkS5xxvKW6MQ3D8K8HwbU6h5qHCvPPvNzK
         wHRFoNRp1BC2wOKBjXDMHwtczvjLP2UpkgUU/RkiZJvQSDSQfY6oa2C4kFkfKU0z8RkZ
         vH/7DfWsWf8B1o/xvEUsx/kw0NptuVQJoQIFWrhlPyy/QvwD4s0i3dk8g1vBKmcRpamT
         vRElFcMlP2ZqkHlYd8jsByTNvbrZ7mGW36v7FaDvDvy3Db2BOA0SHrO4kWI1u+oRjuyQ
         Lu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706105650; x=1706710450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVt0ZnKeByvzhrfkzssJmlz6f1Lvfiy149b2/exZGTI=;
        b=ACJGTLmtHFbLiN2v7LeElQeeHsl74JD1ONWeWDq66s1HyC/20rmAXSogZfNMsHjra6
         sLE8QhDT33km69/19qAnXMgQbD1uFBNrNfd3aEPhna/Jnyyv29GJIZYlMuqZ0kADBJSC
         d1MSzBDAXT+XAApfr6AeR8Ld8wikJkK34Az+DYCQYpcd5PP/AYsia/Rawl0sd6UZ8Ruq
         rxJME0q5J+Tv3A6bQQrLbD9Yc60UC2K9sSxJKQ7M04Ei0IiwbA5n+dKedPGj5ZEGbI1N
         0Dcc/khBeU3LYaHT02lyq7mmN/LYSGdJt+Tcn5WGq5TZ+Oal8QppA2b4ezYzacaxKGVn
         BGeg==
X-Gm-Message-State: AOJu0YxbJ3gem68xycomh4uYrVh6LTg6k4ih5RaDhr5Xa7qoO3ZA4ydr
	4v2R+3XFNnX7s+9e5G8VUjrliNeP+bykVznCgtob0OniS9TKO8si
X-Google-Smtp-Source: AGHT+IF9Si4NHAOAqa3uYGeUJLR9rrnIrYwH+j1jIF67RS+3PdY09F2BJ2FydAo0qGhNxG2VPd32pA==
X-Received: by 2002:a17:906:f197:b0:a2f:71f1:b9e4 with SMTP id gs23-20020a170906f19700b00a2f71f1b9e4mr780499ejb.53.1706105649844;
        Wed, 24 Jan 2024 06:14:09 -0800 (PST)
Received: from andrea ([31.189.8.91])
        by smtp.gmail.com with ESMTPSA id vb5-20020a170907d04500b00a30f04cb266sm1142517ejc.5.2024.01.24.06.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:14:09 -0800 (PST)
Date: Wed, 24 Jan 2024 15:13:58 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	mathieu.desnoyers@efficios.com, paulmck@kernel.org, corbet@lwn.net
Cc: mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
	charlie@rivosinc.com, rehn@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] membarrier: riscv: Core serializing command
Message-ID: <ZbEbJpnUoFPW0fhd@andrea>
References: <20240110145533.60234-1-parri.andrea@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110145533.60234-1-parri.andrea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_061414_728020_697D2C2D 
X-CRM114-Status: UNSURE (   7.15  )
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

On Wed, Jan 10, 2024 at 03:55:29PM +0100, Andrea Parri wrote:
> Changes since v2 ([1]):
>   - amaned inline comments
>   - drop ARCH_HAS_MEMBARRIER, create membarrrier.rst
> 
> Changes since v1 ([2]):
>   - add smp_mb() in switch_mm()
>   - introduce ARCH_HAS_MEMBARRIER, amend documentation
> 
> Changes since RFC ([3]):
>   - introduce prepare_sync_core_cmd()
>   - fix nosmp builds
> 
> [1] https://lore.kernel.org/lkml/20231211094414.8078-1-parri.andrea@gmail.com/
> [2] https://lore.kernel.org/lkml/20231127103235.28442-1-parri.andrea@gmail.com/
> [3] https://lore.kernel.org/lkml/20230803040111.5101-1-parri.andrea@gmail.com/
> 
> Andrea Parri (4):
>   membarrier: riscv: Add full memory barrier in switch_mm()
>   membarrier: Create Documentation/scheduler/membarrier.rst
>   locking: Introduce prepare_sync_core_cmd()
>   membarrier: riscv: Provide core serializing command

Gentle ping to the riscv&membarrier people who have survived the merge
window: any other thoughts on this series? suggestions for a v4?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
