Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E360FC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K33ETBHjAbO0oGTOi2T6P6eH7xpnOsAcnhW06MYBrCc=; b=Z5cW7WMQURxICD
	/0S8rEoTRey2+vIr1SmdTuQmxBJDm7XkJc4sM+orHN+JHLKQa3WFs9HwwiJk5Yr5niggqQfV+FsSa
	pHq+zgUCPfv6puMrcWBqzBMeamUoGgXiaRYZVL1h5TODP8GohGTAgV3FbX84d2iipX75mA2zceQiu
	Ik17v3Rdfoa2b4F09Wt31Oeo0ph6r+7xZHbqpu5DGV6XKbafLcZ8Qt8scOJLyPlYkZBr7wM0d8/71
	zt2W+f0Crg7BJsD8Sr/rtv7qSBMZV7aEzQrkRe9JU4EZrmLZzNyb9DuYKRyXCSzTNBl77bC189raI
	wDO2k851/sWLekhZT8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8c3Y-002vbC-2i;
	Mon, 12 Jun 2023 07:33:40 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8c3V-002vaR-2K
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 07:33:38 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6b2a4cb5776so2339952a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 00:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686555217; x=1689147217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sH9+9VxCvpbiTFFppMcfbBVPxw/EPavqd6zQGr7R/aM=;
        b=ab6l2ynLF+WlLZBwPOh7ztGUYxo2bBmUbFYFnGtyQwZcZP4M8yJF0/F5lmG5viTGpz
         knbf3Ld1Lj0CNFYXZrjbbLNjvPxaX2zjuKn2DwwzRgat7BKBZK93ysa99iufetol5zu/
         Gf0jcHfXMIJ73z2Z+Yw2/PSbp7++05yH0ANI2h1iUBz1gD+5yzXmoDKGYAICPaCNu/A6
         w155h7ldm51mQAd4/NKfDoKVhrvBcNqfQYJdboLr+Zz8elrVM/XrCQ8hq2XgHgsczDXr
         NRQtVl1zz2VWgrO0PP84LKGcaKP0pcIWPTtmFnKTLsc/3FMtcAoG2KyQKGSlcchYHr+4
         9XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686555217; x=1689147217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sH9+9VxCvpbiTFFppMcfbBVPxw/EPavqd6zQGr7R/aM=;
        b=lixseXXeiveb6ZXK0EcNid7eOPToE0EgyfmPCA2FzoAwko35DMEnTy3smng9x7/BIQ
         73eGr+z62vZkLFtancglSdyZPp1OBsbqteU6V3+zt0/UnXDHZGa2b4fIgb+dONgxgyPN
         9ACQg3WmPfDjnoN6ezcVsy3tHkKIjB+JLdWvAsIRR3F7O4Zx7vwZ4B4s4mBtpelvvIPJ
         QRHVG+WSXA8XuzD1lVQrJmrT/mLZJbdyKF/QMdobnfHBp3DF5IMJnB+6Pz8jaEbtyNYv
         sxkDtJWZauSLLH3axdHtR0QOk6ZGx3rXWlpCTu8i+syxNyDnT1Nau5mdf5yQgCGM8wXb
         ZVTw==
X-Gm-Message-State: AC+VfDw+wl8rBBQq81FccIv6k/7pM6NqXkGcE5jiqmlnU4GbgA0qILZl
	qyJaoLbrpB3Ziw+7xjaFaTIpWA==
X-Google-Smtp-Source: ACHHUZ68MTAY1eRJRYgYY8ftiOpK7rEOI/BZIFxKXhEmd7X2tHL3vMnLcgTrb1o8pV5N1uUWvlY49A==
X-Received: by 2002:a05:6830:18e5:b0:6b2:ab63:6e6 with SMTP id d5-20020a05683018e500b006b2ab6306e6mr5995178otf.26.1686555216945;
        Mon, 12 Jun 2023 00:33:36 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id c8-20020a9d4808000000b006b296562566sm3651491otf.79.2023.06.12.00.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 00:33:36 -0700 (PDT)
Date: Mon, 12 Jun 2023 13:03:28 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Yangyu Chen <cyy@cyyself.name>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/7] RISC-V: validate riscv,isa at boot, not during
 ISA string parsing
Message-ID: <ZIbKSDHSzHhXf5c9@sunil-laptop>
References: <20230607-audacity-overhaul-82bb867a825f@spud>
 <20230607-guts-blurry-67e711acf328@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607-guts-blurry-67e711acf328@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_003337_758379_F32C07E8 
X-CRM114-Status: UNSURE (   9.43  )
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

On Wed, Jun 07, 2023 at 09:28:27PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Since riscv_fill_hwcap() now only iterates over possible cpus, the
> basic validation of whether riscv,isa contains "rv<width>" can be moved
> to riscv_early_of_processor_hartid().
> 
> Further, "ima" support is required by the kernel, so reject any CPU not
> fitting the bill.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
