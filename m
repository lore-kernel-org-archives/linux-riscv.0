Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF5DEEAA7A
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 23:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dm9ctxHvq189n4M7UawnBEQo9bWWXyxv4t5yKUEOkjM=; b=28BaY4D/S82k2o
	fnuFpXnu1O9z6VkefHBjdeVQO8ko7LHSIBnjYX8nzik5WA9wJYLHST1H7JrCViAkEEAQKUSbh2iia
	58st0vXzDj0xyafd5E1oPiJGxhK5CJUvFQQbi6KifX8/ydo+5ym0EiRNA94hwQRaTr5LEboNeVxUP
	X20GICKuKphnJO4DzdE6UjZdI/AVI8BQqj78vJlMe8D4HTHv9mg2D3dSO8+qVVa2cvPS3K/hKx0Xo
	mkL4JcW2b2cXaHOGNf7mDR4RssHC1Vj/9U3dQvrSWqCrY4GQSldBinZkt2DTbvzUjkMJ8DaKeNMO7
	QII5yBSu0m7+8gufQiwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgvnG-009RWO-0N;
	Thu, 14 Sep 2023 23:30:42 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgvnB-009RVg-1m
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 23:30:40 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-271d9823cacso1297962a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 16:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694734236; x=1695339036; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L5Atq17mYlT6kG+rBiO4juTIlMt9CxnTqo+M16pkWhM=;
        b=o3GChlhRsWbaWwx/ueBK0b9XYgj05YEQeSbPatKlRecx7CxPA6a9Zml+hiSJECdVBs
         VyDr5kkfNJn65vOU5JdbOo1EvOqZqGRpErDfKFEHJFoET3HQGATN+M2Qf8rh3NhcJyWV
         OaAzXxLQOrDKSENSIHFMSOkkkgUVXnF4MWhQtniKYfXyGX+rvHvpMrvRKTTNcUHkDl5i
         Ioh0turGvwRooUS85EAMiV7OvFQBPUHYtl8hg9ZTYBYg76HXTbdeelM9deKG+aoDojwh
         3VyxthUc7Xwry4kebCwwGSW7WokJ3FowKcU20WpUBy/QmuCw6Cl1HixTPcawUcMce+Kz
         BcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694734236; x=1695339036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5Atq17mYlT6kG+rBiO4juTIlMt9CxnTqo+M16pkWhM=;
        b=gCoGi8y0Dzl+EbHR/4CWdlNx/Lzo/GQku3985Asyv9g9I+FwebTiMgWVJIbw7lY8I6
         GuRDVcrf44zrj+GzfCfpkpjO7hxP/q3gSeaoOoyPeKKP1/M4kvdKJa6FU951rpaxsfC4
         BIMkYrm8fGezArJA/pfVTU3r3tEt15hbvNZXmwzj6ltU0Ut5/jDZ49DJ4YwNYLL97a5I
         3HPPs7cGeA7+zIJ2rycKcuC0JNU9Ly6sUBTw9PVL9JztRxAzvP6+vZPcpvWd4bKkRy06
         jgv68f5j95VdxsNsYmPclCkq2USmbmWx6KG1na3XU/9o0SYkfqJUBxKDj77Z/2pEgRSc
         TW1A==
X-Gm-Message-State: AOJu0Ywuy6gamwcIesc3UxOMGpbVUdxYOaia83nyrzsm/9bqW96ByUvj
	Q3NGssNVGaZZMfxRhgjGp9tAYQ==
X-Google-Smtp-Source: AGHT+IHTae6MGOouJH7+uAsD0l07KjxO1N76fOI883eWFzpYbooJalY2ts/KiMx+iHvSfJFWDphUKQ==
X-Received: by 2002:a17:90a:7f91:b0:273:f887:be17 with SMTP id m17-20020a17090a7f9100b00273f887be17mr6929040pjl.47.1694734236251;
        Thu, 14 Sep 2023 16:30:36 -0700 (PDT)
Received: from ghost ([50.168.177.76])
        by smtp.gmail.com with ESMTPSA id w7-20020a17090a460700b002746d2a54fesm1713196pjg.8.2023.09.14.16.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 16:30:35 -0700 (PDT)
Date: Thu, 14 Sep 2023 19:30:30 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v4 2/5] riscv: Add checksum library
Message-ID: <ZQOXlsCeA92mVSK9@ghost>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-2-77cc2ad9e9d7@rivosinc.com>
 <20230914-mural-deskbound-0e37d0767f6f@wendy>
 <ZQNJ0LQhZyJWlcSy@ghost>
 <20230914-thinness-overtly-70c49b219c26@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914-thinness-overtly-70c49b219c26@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_163037_818885_3CD0A59F 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 14, 2023 at 07:02:29PM +0100, Conor Dooley wrote:
> > > > +#ifndef CONFIG_32BIT
> > > 
> > > These can also be moved to IS_ENABLED() FYI, since there's no 32-bit
> > > stuff here that'd break the build for 64-bit. Ditto elsewhere where
> > > you've got similar stuff.
> > > 
> > > Cheers,
> > > Conor.
> > This is an ifndef, so 32-bit compilation would throw a warning about
> > shifting by 32 bits if IS_ENABLED was used instead.
> 
>  Fair enough. I did accidentally invert things in my mail, I did notice
>  the n, I just thought it did the elimination beforehand those checks,
>  sorry for the noise.

It appears that LLVM is smart enough to not attempt to compile code that
will never execute but GCC is not. Pretty interesting because it allows the
".option arch" code to be encased in IS_ENABLED because it is only not
supported on LLVM, but the shifting code needs to be in ifdef because
otherwise gcc will complain.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
