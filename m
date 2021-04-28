Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24035C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 03:09:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8264361407
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 03:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8264361407
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V2CaQi99W0ddB1a/S7tIib3Iy8e2DyUkEDL1Lz/BIpc=; b=gecq/ti5rtxEACGPNCMd9pm5q
	CUh1av/w23EkzbSByfEtTyyx8R6EywDG3qKPwwNAmyjHQuygXgFL1k+PeAxOZg1T1jnhdY3T00jS6
	qzs6SCha9Idy8WP7Pd31tkdG3Bn9RJiDPJm8Ha76nKuKR1Do/O1hQwFJctrJaVYqk4GaNcGqM3sk4
	b1iW8NtCUPtuepcFGn14mwYXTvsVluFMxajB5n+XKDMahsNrOLpqRpGv+MGgF0dPgnDez2PO+eIbm
	91PLCqo3LfU70Gr1+BRs8fNP7gMJEiawwdbKCyhmn47VNhCtqd/kRFTcmMo06wUiSZB8FFe+DG5cm
	5w0M/Vclw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbaZ5-002fJa-Ts; Wed, 28 Apr 2021 03:08:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbaYw-002fJQ-UF
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 03:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xmdTijoDLORkIw+0S7iEnTgDeNz45rM1GzMm3pB0r3Q=; b=X5wo/pAVo7bzAuBQzzmn3fH3c1
 6j/MNBRk5H7+MDRfBkuFOPGi4JbI+RzYLNexLw+cpeDnLOWfWy3uIhXpirrFTpl5gnG+8vyb67TZG
 xmn+YWr0c8Gs7lMTV7/bN/mjJ0/EekXoUTTv57S4igkxzu2QAzEPemnrH6CDt7dxIPcG7ngHw0W4n
 lAF18jXGhhUl5Zci9hjXPMBLD7nb64N0QYzFQWiGlVn/VXHbbM5/+0EnS4w5o7nFvrxKF4tqZ0rxB
 /C1Y8/UPsGXkwQdN/pbbSxeQXcGPUPWPRE+kqyWRD9+RBNqHrcbZarTeScXltlVrE953NVk31Hfqa
 V+gkD/cw==;
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbaYu-00H9fa-7z
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 03:08:29 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 u21-20020a0568301195b02902a2119f7613so10306669otq.10
 for <linux-riscv@lists.infradead.org>; Tue, 27 Apr 2021 20:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xmdTijoDLORkIw+0S7iEnTgDeNz45rM1GzMm3pB0r3Q=;
 b=E60PKqhPnsx1RoPd49Ttuy5V/jjnnjy4s9nvsECw8d9ngkX5kWx0bNYKmWs6Fvdg+9
 dEQdLAg92vqDJvk74alawcgoe/uOPVPkB424s3heEtWZ+1whQi+3BIoUlVP6gYV9RBbR
 MZzJUct8HsbrHz3f8ZwhocvVgBUI3XDAPa0DAwWpOJGJkdA4UQdP774SGpiJVhtVtgxz
 MRUg9ZO5NCXqQW7r7c8U8+gELYFsS3tm2hAPto5ScBYU+3E6UYxKeHRZkJeU7mGu7mtj
 m9RUcnXpXLIvdMEf1ZHpwIekmZnkxhvnOQfddMT5+4kbq9fetdOFoipz6Lua6YTFuQx8
 QuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xmdTijoDLORkIw+0S7iEnTgDeNz45rM1GzMm3pB0r3Q=;
 b=QlK5ZxT8WA6BOqq3tG8SENa9BGyrSw2wPpyFkVkQE5cxpSI0H9h8YTc7Yf67Yfn1tK
 hhOniHZxeIOeleITIgYfnn1eLAW/Bao1a3fOeuJPuV0ANrIYaKNfkpfszTTD6P5CJ+Wt
 DjVbvzS8Ygqbojkv1oejZp3Q1EUKboJfPTNYdINnUqyJgZ9HNce1u9SXgvgpV5Nx3x58
 e6V49AUPxUuJW6lp6yiopmyd2EvF2BLSLfNwPju8V2u9WLaV5jGhGOe4hHxuopjBl8a3
 9ICqIFFXkXJAzvmqTU5oWu9eBI6l/lByPJUn5exANae7QpggKw1TD500KaXG8ueDF5de
 YffQ==
X-Gm-Message-State: AOAM532AgniNumiceNSOtNH1+JIB3p/bEJLx20IX9orYzU40UbStF27K
 V03fM2D8C4Zlj1rn1t6s/Yk=
X-Google-Smtp-Source: ABdhPJzdcBqIFjDHQrLChMKxRJ/luB0o9IU9eSINrCUpaZi5mgzUz9WKvQPRptFeTxvyKw9TPhTvpQ==
X-Received: by 2002:a9d:2de3:: with SMTP id g90mr12058195otb.274.1619579306483; 
 Tue, 27 Apr 2021 20:08:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id z2sm434333oto.24.2021.04.27.20.08.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Apr 2021 20:08:25 -0700 (PDT)
Date: Tue, 27 Apr 2021 20:08:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, Vitaly Wool <vitaly.wool@konsulko.com>
Subject: Re: [PATCH v8] RISC-V: enable XIP
Message-ID: <20210428030824.GA196954@roeck-us.net>
References: <20210413063514.23105-1-alex@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413063514.23105-1-alex@ghiti.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_200828_308894_6CEE87BC 
X-CRM114-Status: GOOD (  15.94  )
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

On Tue, Apr 13, 2021 at 02:35:14AM -0400, Alexandre Ghiti wrote:
> From: Vitaly Wool <vitaly.wool@konsulko.com>
> 
> Introduce XIP (eXecute In Place) support for RISC-V platforms.
> It allows code to be executed directly from non-volatile storage
> directly addressable by the CPU, such as QSPI NOR flash which can
> be found on many RISC-V platforms. This makes way for significant
> optimization of RAM footprint. The XIP kernel is not compressed
> since it has to run directly from flash, so it will occupy more
> space on the non-volatile storage. The physical flash address used
> to link the kernel object files and for storing it has to be known
> at compile time and is represented by a Kconfig option.
> 
> XIP on RISC-V will for the time being only work on MMU-enabled
> kernels.
> 
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr> [ Rebase on top of "Move
> kernel mapping outside the linear mapping" ]
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

In next-20210426, when building riscv:allnoconfig or riscv:tinyconfig:

arch/riscv/kernel/setup.c: In function 'setup_arch':
arch/riscv/kernel/setup.c:284:32: error: implicit declaration of function 'XIP_FIXUP'

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
