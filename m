Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBD3EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtEHQjZqixcgpyJF2/ivzF/DcRVjN5Q09BDQbPXY6tQ=; b=glvLosmakSJxyw
	rA4u5Z1Qr0uD+axKQoCj1kht8Pc4iL2vo4KpRQIiwWDlsiIlph1GNNb8xuKenfXutuykd8bW4Eb6Q
	tCSObg3W1h33yRcvC3v4NgjWM7M2EK2y1Q7+9ydhdAxKkZnLikm55dcYPHC9xQwO11NPM0xCgJSto
	j3WV0zkqw69m/xfDTKqNS7GjQte9SbzeRURQTWgBg4TkorwsLmqqMv9/7QDy6VYpq9HlN9b847j46
	53HK9qmwDU6cUAZFr7e8z4urMwBo//P8zRzgQUrGXlx1rCSpeGXpppKP7Nf0ZdddXpernhoCFbmuM
	O4124mUxsxdQ1ftGq5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoEF-00AV5j-20;
	Mon, 26 Jun 2023 15:34:11 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoED-00AV2d-0I
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:34:10 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b466744368so51403391fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687793645; x=1690385645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TOcE0YUWkUmrq+/gOrSOJce+pS6FVzX4REjlVMYSaG4=;
        b=M130AEjsr8m4ZygKaFa7Kq8JtikEYaSZoJ6OyZg0p4wCF7Kiww9ZtERLNS4uL6SSiE
         TtEgtEOQpwvMW0Z+UbMPP0Uf3GbBy7BLasS9qGJ0m+kQlPWsg7b7A7XzNJxg1vvCGdw2
         Z3InxowJ53ImdnxUDsrHzj6D4JXPUEuux9i6pgAP0QR+7I7JWmTXJqPoJV+HamwX+o4W
         EGRRmx/DjDR7UQohfJWxybydg7UPxWsj/PzQMJUTT0jW1lTXGntWXwex6LkYxPBx6k5E
         /tF0Ni7eZ/i6Mf/INswt/oyvWs4lcI+zPyxmgucsmFBeUsQE7M8vNEqhNZt28i5I3uKr
         hCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793645; x=1690385645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOcE0YUWkUmrq+/gOrSOJce+pS6FVzX4REjlVMYSaG4=;
        b=LTAQkV8pZA6Ny0AMninuUJxvURnvYMXLo9RZmn9VnPbYvQVNZNOZPnrHszwylHlLIs
         EhnxxTH+0YER4zFDs81Nx1sNJ1UtF05jEtyULYqQRT/H+XFD+xTtWIJz2MNhzt4gCPk5
         fkC2PB44yENfZ9StBPkNhv1YP8aD79moLvQASulPXZ1lyA5PCulyGlmSQw6jVRBN6D58
         bC/ukgE9qXcFXTi3ZIP6gYX6qmFjz/eqhK+1ItTmflpsM3JflJ8L4iW9t+T4zfr4L4P3
         /tfs3vOAqe/2+DDOiRbQSgBm71Z4muQ9TlCZo9CO69eyuJdgMFRLs0JIR+i0DHw5WulF
         DSGw==
X-Gm-Message-State: AC+VfDxQ8fDXNAtP/jiZoQFmoHLwAJ7/Xfx1zFIoQmVeFfYTtwQ1qRDM
	Lq5GEvL3oWL87JKykNR2yIpWOENPJMkAmYrmfns=
X-Google-Smtp-Source: ACHHUZ5e9WFlfbtA2OGlPIGauJXFT0rXT3O/YtYVBHy4uTdeZSa4mLoM4vGGOAZsSHpw1/K1jlUbNA==
X-Received: by 2002:a2e:3202:0:b0:2b5:9d78:213e with SMTP id y2-20020a2e3202000000b002b59d78213emr5596880ljy.22.1687793645097;
        Mon, 26 Jun 2023 08:34:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id hk8-20020a170906c9c800b00987316d1585sm3421374ejb.145.2023.06.26.08.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 08:34:04 -0700 (PDT)
Date: Mon, 26 Jun 2023 17:34:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 5/9] RISC-V: add missing single letter extension
 definitions
Message-ID: <20230626-2943390be412d044fff507e0@orel>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-possible-poet-ae4afce0a525@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626-possible-poet-ae4afce0a525@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_083409_127415_43822864 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 26, 2023 at 12:19:43PM +0100, Conor Dooley wrote:
> To facilitate adding single letter extensions to riscv_isa_ext, add
> definitions for the extensions present in base_riscv_exts that do not
> already have them.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 36f46dfd2b87..a35bee219dd7 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -14,12 +14,17 @@
>  #include <uapi/asm/hwcap.h>
>  
>  #define RISCV_ISA_EXT_a		('a' - 'a')
> +#define RISCV_ISA_EXT_b		('b' - 'a')
>  #define RISCV_ISA_EXT_c		('c' - 'a')
>  #define RISCV_ISA_EXT_d		('d' - 'a')
>  #define RISCV_ISA_EXT_f		('f' - 'a')
>  #define RISCV_ISA_EXT_h		('h' - 'a')
>  #define RISCV_ISA_EXT_i		('i' - 'a')
> +#define RISCV_ISA_EXT_j		('j' - 'a')
> +#define RISCV_ISA_EXT_k		('k' - 'a')
>  #define RISCV_ISA_EXT_m		('m' - 'a')
> +#define RISCV_ISA_EXT_p		('p' - 'a')
> +#define RISCV_ISA_EXT_q		('q' - 'a')
>  #define RISCV_ISA_EXT_s		('s' - 'a')
>  #define RISCV_ISA_EXT_u		('u' - 'a')
>  #define RISCV_ISA_EXT_v		('v' - 'a')
> -- 
> 2.40.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
