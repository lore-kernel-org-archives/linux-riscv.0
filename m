Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDF1CD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 15:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nc8atOK3Prg6mbF7KxRt/lpIM5wZinSWv+ypRIwKdb0=; b=oYFDB6b7XFMn5U
	kjQ9wlKTLYGg+EyjQrxrbzq+twbJgXXRWKpDw4S0DHNaVh1VxZ2XxOaV/qCtwoPeV/gCBJRp1XYUh
	34zh+DyiYAV/F+Myiae64EpslO4iXjOZTw1j3MY0leN2SXwtigiNnpB3OjDpoyOcb+CIKaOx47Kj5
	1UMlEG31/T4Vz8W5++qlsx1vU1VSJ2oGpFJ5aDrYxgFOTwnMHGQ6YaUkWQlHa/rE3HrDgtntXOjj5
	Yg4rjhBzXFQMgf+OM2pHMoJ/FVeWQk0FyybfF3ofnIiKBL0dj/qZ7C+JrldDoMRPt0cO7ae79C4NP
	DZHUr4dvKI/53bD2Frhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOy3-00000003ETF-33ed;
	Thu, 04 Apr 2024 15:25:31 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOy0-00000003ESf-3fpm
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 15:25:30 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-56e0430f714so12812a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 08:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712244324; x=1712849124; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ByPtciC+URhiVQn652U1XVXGfMYChxV1rxw8MNlXaIw=;
        b=0WdwUDvzCEkj+hzp1GlLgAyQNq3j+v2mcm+K3k4tV0gW5LpC1MZk+/KAvov2sllC/L
         deGyzmgOt0C+OTiBguzLyImFG2me4u2KzdPD19/lAU4U2uRQnVh/0i19lwiZNztha23S
         sYxaHKu+wJzAcaZYhpO7mI6EGpP4em7aOJNv8KDfvKwsEzhnEPrfF1ibmOBKJAD9aX+4
         HQfSzAc3xXRBbCcyB6kGC/3bO8ZlGMRNW7huXFR31XorgU7q1/NHHagHBr6QYAfCl8kQ
         KN2CpNrkcVRKbfi+OWny8SUlnH+LCo9LwjEFW/2Uud5Sw+wEwCbo+oC1FKCr4DGIFZpB
         kuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712244324; x=1712849124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByPtciC+URhiVQn652U1XVXGfMYChxV1rxw8MNlXaIw=;
        b=YU9v/x9COvryt6YsMM2+G0XRCp0E95uIs7zh+XK0rm+gYiI6J7tcZaoaXsRjfk0BtN
         tM43hyjr2SDeprPS0Q4D+6nfWUTCG7yjy7D+v5j1uEdM1hl+E884XF40bBepZ2Fwvd18
         OaN0cSHoly1dCOhzkv10R3imf0WG1stHzkxBts7GfwMy4a+Kq8ytuLE4IsSkz7F0XyXH
         DrINlr7cG4sCbi8sRUD3OSxck1zaeWK43cDEh7ljxttoXcU5hWw46h2RN+0JJfOcbQTz
         bG9ld2RDaQirsycJbuBBaRwaFrfA7xDfc6+Es2uai6mMTAuzsqMqHGCmzw9SsiPXsgFt
         Dk6g==
X-Forwarded-Encrypted: i=1; AJvYcCVfCY4mqMuIfdf/PR9FpihDBdWlB+ggiRLQRNY996vmdFSnc9owSPEev6I5cdnSpAnn9ZqFJQ8D5ULoK1O45Lq2dvtcNUdt7cD8TtiSK/2e
X-Gm-Message-State: AOJu0YyAMEDpV23eIzY7uW4CNx+/imyo/khgiK4cJtuIgIspRf8XhAxA
	xBazH6W/0yqzKTvwqeey4isE7KvniqwdkQbP+xdV3r0AKJDkFqNFKTz7DpBCfo6dJpJapjhYi8a
	tpT6mwkd7M9gen6e9YJwMbPSFOpXGFJvmebG8
X-Google-Smtp-Source: AGHT+IGu/Cr/TzqDAagcQzAh2crALYKXnU9saXFMj2Uan9qVNOsYqiQC9yQvytlJZqCQ8hhUrVOQhul4utm/mgjk4xU=
X-Received: by 2002:aa7:c38a:0:b0:56e:234f:b44 with SMTP id
 k10-20020aa7c38a000000b0056e234f0b44mr71333edq.5.1712244324404; Thu, 04 Apr
 2024 08:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud> <CANiq72m9YAu=dr1=WMSHOqfpszj4S6OkMEQ05vqbv_zKO5pOsg@mail.gmail.com>
In-Reply-To: <CANiq72m9YAu=dr1=WMSHOqfpszj4S6OkMEQ05vqbv_zKO5pOsg@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 4 Apr 2024 08:25:11 -0700
Message-ID: <CAGSQo024u1gHJgzsO38Xg3c4or+JupoPABQx_+0BLEpPg0cOEA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	Ramon de C Valle <rcvalle@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_082529_014238_42443E6C 
X-CRM114-Status: UNSURE (   8.52  )
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

>
> Cc'ing Matthew & Ramon as well so that they are aware and in case they
> want to comment.
>
> Cheers,
> Miguel

This patch is fine by me - the last patch needed for KCFI to be
functional in Rust just landed upstream last night, so we should
revisit this (in the form of enabling it) once we move to
`rustc-1.79.0` or later. In case anyone wants it for local
experimentation, I have a backport branch [1] which applies these to
the 1.73.0 compiler and enables it in the kernel [2] (not upstreamed
because the feature isn't yet in kernel's `rustc`), which Android will
be using for the Rust binder driver. This patch will require a recent
(last year or so) clang, as it relies on
`-fsanitize-cfi-icall-experimental-normalize-integers`.

[1]: https://github.com/maurer/rust/tree/1.73.0%2Bcfi
[2]: https://android-review.git.corp.google.com/c/kernel/common/+/2930616

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
