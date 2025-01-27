Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89771C02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 20:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=es1HfKge7JKgMj0JKInUBuaaLWQQOCBdYHkXDwVMJ9Q=; b=Y2DY7xOiF6ONUS
	y4Mri32nDNZGMB9GbGOFMID9bNXPUMMywYQzo4FU+uGtZlUKdPS4Mru7WvMfzUg6JcJkNw6j45nRB
	JmLBfDRGSewSUddtXsKaR2bTMCxRbSkRchZvXc0xKcx7LD20PnCAac4ab/1rBON7tO/mLxgZk/7UF
	NiJX0WJSFTdhGAhUxXYZVADQxAT3gwpJ2Qn/8h4nX0/CHTqb6Ms/XQ3mMg6c4KeCuXHUSUZ6UVglA
	xNMHi6dhAmop2qOJnzvpxENcURwCyoUbEUlQ703whZqkaA4JqHlBwY7UkomdHSFvwfZWmNhpiXJY8
	2uKTvES+qp9UabVVansg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcW95-00000003Fa3-2A4q;
	Mon, 27 Jan 2025 20:55:47 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcW92-00000003FZL-2cWw
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 20:55:46 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21bc1512a63so94857075ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 12:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738011343; x=1738616143; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVHaUGwMILzwQkxTtmzPwlrQrsAV/yWdWfyIAOu7hxk=;
        b=z31Y0AQH1389+Sh6cu3thZj5RFtwBaVQpx8Wmak6iu3N9O2S/EaX1XMqiSEW5cz/SF
         63/t4+lZ3iSeErtF554pIddGDXQdK9sPjwZMvAv0Y1NdCOI8rIaTxULBlFCY+XXZtdFk
         8ma0RiuNHwe3rmw8idExoVw1DZdIsR7Hdkfsj5RP+0+5woKEfcsFJsZ/t93mS9y3JiV+
         /Q7d9cp3YwwpdpoWvaXiTqO14OmJKMSGOF7JJ5JmRaR5xnuJlxztYNQjt+SkD5DX0PbR
         4/qz534YzofIl8Dt80NZifZjcbT2v2xk7zNMRiG8nJ7fVbatF1+QNNb3Wn/flYHu+SwI
         OgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738011343; x=1738616143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVHaUGwMILzwQkxTtmzPwlrQrsAV/yWdWfyIAOu7hxk=;
        b=egv1uETWv0QxiZE1KNpcj5P+apdsMMH0lAnjq5iQBkKVS4NNEXuV8c9TexaYRd2CJp
         zbQLFhjY4vYcp6TscmPR4ft7eU50pH68ZaOgKDERJJciSLsJRhDymyUSDuWd2Ld7vovb
         x4a6sP8swmYzZVR/E/f+Zbxcfp6b6aS2cZVIUFNCxk0wYqtdYrOkxoS1qb2+rrllEJrj
         aIzJRGVMPp5lcK4eLj/hwdxXlbpSbTg0bf62ro7jVUS3roffUn9leB+n3DE9NfiQB42K
         DwsNfb9q3OgzAl72vkaUjmqk1skPuHoiYjIPNlXaiR/TcGVKzKi9a3zY3jkix+jj2uVH
         K4Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXoW0AK14rXq64crfP6p2jzkKfhHrPh7b60kGC5N8AHb6vvFKZ6r3/mn6kWj7FcOfnwIagztWfDDlvAIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz95gNK2pmdKl5H/bXXWUW7EfBfX2qL41nmydwZo0WUN4aOD50X
	/W1lOSkoicz6KxLlZLY+5e3jtXe33Rqg2ZCHFYxhpTYr/hHqDZYGYOKh5yDXq/M=
X-Gm-Gg: ASbGnctrD21gqunobFgGVLYVc6Qj/iWn9qUA/hsJ8s8GltLQ1A5DKXFTDixbfgar6hi
	rY7/jLo1skl4wQqRqZcKzlmrflLm9mK0Xm9jX8bS5Y5jMix8EVbiYszBL3IwtTpVsCp4yiNuRRC
	g/4d8FvuJp/imBQy2ifND24vIScgEeQQN2/SPooVo72Wlayl4lk4AVpxl7lXF3ffB9owGKLi39S
	UgCNSCefX8GruFaygcCrQ+6S8ken00yk5ZjvvU8V67oc+njiQhxtTBTFIrkmHjoJ/mmfTw=
X-Google-Smtp-Source: AGHT+IE1NMyz0iI/G4TK23r8ZOaRjDxxIJWPoHoMwhYOSqFyTwcsoQRJGo4yrKOrcu8plwruiOiHIQ==
X-Received: by 2002:a17:902:ea11:b0:215:b5d6:5fa8 with SMTP id d9443c01a7336-21c355c84a9mr625758965ad.22.1738011343332;
        Mon, 27 Jan 2025 12:55:43 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424f39fsm67418145ad.249.2025.01.27.12.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 12:55:42 -0800 (PST)
Date: Mon, 27 Jan 2025 12:55:40 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 1/4] riscv: entry: Convert ret_from_fork() to C
Message-ID: <Z5fyzMjj_5gqOupB@ghost>
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
 <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
 <alpine.DEB.2.21.2501252313210.27203@angie.orcam.me.uk>
 <Z5aSMVZLMwmyCp9k@ghost>
 <alpine.DEB.2.21.2501272017140.56843@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2501272017140.56843@angie.orcam.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_125544_924988_3C6FBD2B 
X-CRM114-Status: GOOD (  14.18  )
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

On Mon, Jan 27, 2025 at 08:20:56PM +0000, Maciej W. Rozycki wrote:
> On Sun, 26 Jan 2025, Charlie Jenkins wrote:
> 
> > >  Wouldn't it make sense to save a jump here and make it a tail call, i.e.:
> > > 
> > > 	la ra, ret_from_exception
> > > 	tail ret_from_fork
> > > 
> > 
> > I don't believe so due to the return address stack. It was shown in this
> > patch [1] that a 7% performance improvement can be seen on existing
> > riscv hardware by performing the extra jump. Doing tail calls should be
> > avoided on riscv since the hardware can be expected to predict the
> > return address incorrectly every time if the return address is manually
> > changed.
> 
>  Fair enough, thanks.  Though no link to said patch given.

Oops! Here it is:
https://lore.kernel.org/linux-riscv/20240607061335.2197383-1-cyrilbur@tenstorrent.com/.

> 
>   Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
