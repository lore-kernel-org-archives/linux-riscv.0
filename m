Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C355C7619A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 09:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGiaAZtAvb1vep2AbHcoljN4/p2h+JQ2uD/ib3414EA=; b=iRZ3UoiBBBpnkH
	ddZes5Hr0jmPGEdT9YOgTPsKCN6EU3snedg9U7XOfnCuS4A+F8CYO7uENY7h14hhYOX1ijH9jxmVe
	NqLopHcFFhMOaHlVaO5NKpDxUJugkM1/DQv87pF3egGRSAj3M0HQvHwe1MwkhIupnlLm0Oe4tU6F3
	aonxjz09DUp0nGsf9prW734g0nr6qSm6+t0Lmqgq/zFgFS6kQQS9x8AAMJEl5IjmwDY0ar7z+uP86
	tcorahhAOdeuuNAzhcKF7vRTELD5wfgu+JjL2PnsU9DKm06HDdjymZZz06G5uvORFH8Uy24LENsOq
	rdsVyM7NGEkPjCgO8YFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjKO-00AVXO-0x;
	Mon, 27 Mar 2023 09:39:48 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjKL-00AVVm-0O
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 09:39:46 +0000
Received: by mail-ed1-x52b.google.com with SMTP id ek18so33348227edb.6
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 02:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679909982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4w0LfZxV5gGkIvt3krujIxED/ZFU4CmkEbwpWDDfN9M=;
        b=E1SkeH1Z1buglgC+NNtXnvpC93AjrvqcWBnjND14dCcXq6i/LOkkD/KCnOdHK9ffjQ
         +FDXfynnNTMv68vHz3XCzlikO0Cx7su96Kj2KdRdAuZMwgk+/KI91e96elRbM9GpyC/s
         tFjsgiPlPeDRx4PnFc8Zku5/4t/NawHFXjN0kxB5X4lZOs8SVVlFOlZZRmXJiLykpr5d
         cVxR/p1z7rPSrDn4SP+4N3xMoZWJRG/GMc6WVy5myNPSnZ8HIfR0h7uZSWIw2+iQHqat
         kAu6wSXdawVYEUTFtgoa10sFbTQLVLPBN3V3oFMfzQtQF/B8sKki1EQ2IqH8jNxyvWX/
         6yBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679909982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4w0LfZxV5gGkIvt3krujIxED/ZFU4CmkEbwpWDDfN9M=;
        b=VbSX656njR35ovukxeUGwOLsuu5pS4bOIbA0GFOGwG4YJ1gP5MT1PrGr8WP8m3r4DR
         uuIOpLJZCAe+nW+CyGOaIYWSyoru9WU6xgAsg0Pk07jF+eqbOWJhS8m6W01Uv2+A9p2m
         PUmKop3ucQYO+rfwR//rPxVSAMkoKJcM5TAdE6ne84wKOaUUuIzJdcmv6lBO3U276psw
         ghM6ElcagTnNyaC0jp5V93U3uVPyRl6eRuj6YIMPjtTSW9dEYbQur3HIaWKdgEg8OI1l
         AjgJjkX0v4+TO7PAKh5e7LhJh1dnMEnpE7rrlIbYfZxamXil/Gm2k1YQwjmxJTCvuQ5Q
         Evmg==
X-Gm-Message-State: AAQBX9dzDvczdnQ3G+Js3T6UjDaQSu+kcNjZvT7ne+H8EIrWRlsEJZcF
	sQ9u/mShvs2qNAqiwDtNy2683g==
X-Google-Smtp-Source: AKy350Y8/SsxbaZDej/BKzJeejjyFYUsPO3oWonL2cImHpeJe6RjpY24fLH7mPEJt4nmazcjeFiM+g==
X-Received: by 2002:a17:906:380a:b0:93b:943f:6261 with SMTP id v10-20020a170906380a00b0093b943f6261mr11485304ejc.74.1679909982354;
        Mon, 27 Mar 2023 02:39:42 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v14-20020a1709063bce00b0093344ef3764sm12028358ejf.57.2023.03.27.02.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 02:39:41 -0700 (PDT)
Date: Mon, 27 Mar 2023 11:39:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 2/3] riscv: Move the linear mapping creation in its
 own function
Message-ID: <20230327093940.7cxqh52mwiaibzeu@orel>
References: <20230324155421.271544-1-alexghiti@rivosinc.com>
 <20230324155421.271544-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230324155421.271544-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_023945_157238_F40A7527 
X-CRM114-Status: GOOD (  10.30  )
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

On Fri, Mar 24, 2023 at 04:54:20PM +0100, Alexandre Ghiti wrote:
> No change intended, it just splits the linear mapping creation from
> setup_vm_final: this prepares for upcoming additions to the linear
> mapping creation.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/mm/init.c | 42 ++++++++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 14 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
