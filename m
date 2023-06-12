Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C935C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 07:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAdv8KAUOvMpGGE1I3jqsgWvFNH7YqHK8yiKFG65WH0=; b=hqGXEVgYi1Y4Nm
	4qGcQ9cW8MPBJ/pBKiKX+XeUpBJakpKmjiuKS429Bsx+89M4pKhJE89T0/O74IBeuX1h2zX2BXbGr
	rlwWP3sgvgOIXD5lLlAlOZVOaKdhYf9qlLfYyeQvEyILj16Oj5VRRoXcITJaHBPPywQm2B72mD1Q9
	J6HWe5+bQZpddNdD13WqM4RfpXHcOmHWcEf1y/UZdhwgZTZRijhKwsHRkHkaxfFdJhW3vd70WniHe
	FSF9mi0qFYwnmpdjWaYdmGRcKv4cwdB7sXDTMfASeeNS+kHp1lhKFBzqOR2kQuiAWf8zfMyG/B7hE
	heLBFGNT6JisWA9PEgfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8beq-002rN8-1G;
	Mon, 12 Jun 2023 07:08:08 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8beo-002rLR-1t
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 07:08:07 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-19f3550bcceso2089045fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 00:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686553681; x=1689145681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ce2/2PowFKOkbwSSqlzAwxL75uI80kMVjfjZLZKhUGs=;
        b=TrTdE71E4SVBK9jMj03ZUwJRANn91iHlLy2uhtBOZhgqFzNby8vsSi1/zbanIg2lIT
         cegWa/7V39RE6Xt0a+f0tvBtDTLoDs6Q+Q59SiBYRamXIBQ0zSEKsbpLT1bytQ09PlB8
         q0kRwJpC4XQ2IHcWNwtZfiPDBD04/k7OhMQBI0yq1i/RBSqh8u5p9dNNpO34Je1NW0Tb
         VJqJiIMUhp3MoyFuP0/z625kylp9L3CxJcxHh2YO0Le5shsZz5JV8qun2769c7M/ed7z
         qbfi1y6L87gM+S04pfu2glCYT2Mn9CUa9lwWFW6Ltb2qVqqRt6xjzL9kIY7W2m9tMs9l
         6wEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686553681; x=1689145681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ce2/2PowFKOkbwSSqlzAwxL75uI80kMVjfjZLZKhUGs=;
        b=QBycs5aZ7XZihXFOW3Y3i19Clm2PfrKOp6GmIej7uLf+Po/8KgjCU7LQTMLxvYihXU
         EtEFIVHck9X1tZ8UUjYS5WV+ZLjK+yqM/nIGD4yM3949s4J6fFgM0iXqJiRY8kiiQxBA
         DlDTBBjkxFsHoFjIR+Rbj+UzZMEeJOLEF9e3urh7KZeGz62hQTtEhSZWXAdwdjWKWd1a
         s9jo6JroNHKvFfV0ElaPBbv3WxMsIN84WKt6EEMcw3LMQ7CMamYI5GNyh0cwfl1p+BSL
         ONxQgUGaiAByiLDEGcMwOUaBYBp1fu/Rs7G4fxA3F5+EXeH3RIVKGu/XQgOn3H44oLzx
         +R+A==
X-Gm-Message-State: AC+VfDwECS1tI8NLev0UYczMYyjZ/OneHswm9fYauOK69/SMVmFmn+jI
	LrwsT67j400pXGbJm/KDa8Vizg==
X-Google-Smtp-Source: ACHHUZ5sJYvL9TZNLH0BQd1Fc9f0cmvZomQa3cmFnFMy60vmYr203ADmIaa55NWbbJoZiVglLnaglg==
X-Received: by 2002:a05:6870:9545:b0:17a:c612:ae0d with SMTP id v5-20020a056870954500b0017ac612ae0dmr4979103oal.49.1686553681749;
        Mon, 12 Jun 2023 00:08:01 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id eh11-20020a056870f58b00b0019f188355a8sm5530728oab.17.2023.06.12.00.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 00:08:01 -0700 (PDT)
Date: Mon, 12 Jun 2023 12:37:53 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Yangyu Chen <cyy@cyyself.name>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/7] RISC-V: simplify register width check in ISA
 string parsing
Message-ID: <ZIbESTLWl1hjw2FJ@sunil-laptop>
References: <20230607-audacity-overhaul-82bb867a825f@spud>
 <20230607-splatter-bacterium-a75bb9f0d0b7@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607-splatter-bacterium-a75bb9f0d0b7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_000806_627040_3E5089CE 
X-CRM114-Status: GOOD (  12.15  )
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

On Wed, Jun 07, 2023 at 09:28:25PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Saving off the `isa` pointer to a temp variable, followed by checking if
> it has been incremented is a bit of an odd pattern. Perhaps it was done
> to avoid a funky looking if statement mixed with the ifdeffery.
> 
> Now that we use IS_ENABLED() here just return from the parser as soon as
> we detect a mismatch between the string and the currently running
> kernel.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
