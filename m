Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB59C3ABC9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 01:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tTG/d7NF2lsHBRrgfzUqEM7T+c9uus7ejpgEeIU8b0=; b=ZCMcjbzP+kxO3Z
	yCIWJ6yC3SAQzb1pwMRqfnBOQIDeWLrFAm7TNj+qAVWw6lDt1dhCAcKQogML1Lm9EJl9O0atZy5tR
	LGZEDggDog+FxjQVXBtAyNpoyjC48CkpojXpd2Q7xfZTyUbJ6wiYp9+lB53oNdiCYw83vmjjCOyRV
	2x2piiONdbTl5GG0lcMaKygNj6BkKEMTV7DN143ZEAOvqSm+vRu9Avlkh/pPLeyEjZ6jb0dUnnuM7
	+bumQCN0foSU87mYkydaCoZcGAeTMqizLVMr0nlX9SXcaccBsf00fJScgATXAvsWranGZ9oMtCrY3
	eVhAHMNqm05e7KmS1xbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF0kB-0000000Dpz3-2q8E;
	Wed, 14 May 2025 01:17:11 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF0k8-0000000DpyW-43Nv
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 01:17:10 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-476ab588f32so95118591cf.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 18:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747185427; x=1747790227; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEaVOh/9lfsZXQCmNPE6lSqX4P2H8nzTwz/gMp/qKyg=;
        b=Q4HfVCVAJ4AcqwSnMJDA7GgixiiL5lJwL3Sxg5zwGUb0MCbhPACKJIquO2hePMFk6z
         SWiDydR6mk8PfxLiTRXCYylOPobyI1l94JS3Zk1qObmP/w/fkLstw/W+Ue7mp+xK5pt5
         p4aLthqaaamG6k0PxHkskEI3m2IJj5WFYl9G3BFA0dxQExv+Zs9xe4GKgZ6X73R5kLiU
         nAnVLxt3ublWQfNGCypbxUWFTsW+YF5XTaoGZX+TPJl6EOMfekc/BhTZZClGTPGrPUyp
         Iv/maqyK12NwhMR2osluvcNTcNePulSWMgb+lh4jOcXtxmvNRa+HzwsFq5ugNLLTJ6zV
         3crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747185427; x=1747790227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEaVOh/9lfsZXQCmNPE6lSqX4P2H8nzTwz/gMp/qKyg=;
        b=nVrMSeQxQyJQ2+dMljsMjdYWZQdx3d8Fbep2KJ+xHtgcONxKu6Lo/6vOemBsEwjz4N
         kpkDSHTOxrboUYlYk5jviqg2AN3wdENn4iu+phet9L40SDMXTygOER19SCMlBfQ/p19K
         wY58z/q2nyfoaCVzHsjkaGe32xPIJpQcx5vVe1lmqV5A1QSiCJXM4mnIJ8PtAD98kK33
         FQRH6GzALcgPtnFamWejretsdwdvIaecer438OpHt6pQnTx/GdWHeerl3FpfOI3eLzQ8
         hnhxj/S2Ly0AFt3/MXTSYNYNtrJ2Zk5N1lRrK9X8KJ0oeXcNxEfsl1zIKnyJo4NUru9W
         GHYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvomyJjpbCK7fs5/shbGBs+M8VuFytEZoZ4/5h8dutaEvy42YqIyU8fbxZVGiQsB0n4Vn7/5vwvsF24Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiM9ssqTgI0uqIkcGUx4/H++BHgbjGAFqp7YwOU4bfWYRYyqOX
	+Nwp5fAHZLyDROBT5z41yS20wKd0kulPOM+26iR8MOZe5OUC5LOB
X-Gm-Gg: ASbGncum2J2PmAU4O4FwNB7+cEve+NmcgVaRAlAPVphddrHwzTK7ejrzhA+paz7qc7c
	vblh5UVvF9wstV109rwwIGzJAmKrhE5OgJ/MvpMurKrnltPC4b/3vwFRi3HaxPisrnEbEtHDN1g
	pPoTvjfAyOTLEIc6Y8ATRlwwORIzBXWfDHOTksr4FVI/g6Hvqulba5IwzPNlBoxICVlDmYZ7vwT
	lhGJP0pf0sgMiGvX+F0M05B+2JQl7Mt2+0VBO2/8VYNeA7ER3ChtlQ8Rz+VFvHDj7kPtxaJGPbK
	S+ZmhIrQxDOVSbS0GWXfRMLpFa4=
X-Google-Smtp-Source: AGHT+IFq80xt7wr+N4Is1nsHfkVqlHuQBXPmL2/8vRvaUgO/7OiqL00yD+wmu1pLVR3Zg8H9LoV5EQ==
X-Received: by 2002:a05:6214:2468:b0:6d4:238e:35b0 with SMTP id 6a1803df08f44-6f896e4c936mr24184336d6.17.1747185427543;
        Tue, 13 May 2025 18:17:07 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e39f588asm74175596d6.49.2025.05.13.18.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 18:17:07 -0700 (PDT)
Date: Wed, 14 May 2025 09:16:35 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: timer: Add Sophgo SG2044 ACLINT
 timer
Message-ID: <g45xqtuit7apkduwsfsmw7giqttrb7kjtobejs44rtslx37ynp@ugic2medlczo>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-3-inochiama@gmail.com>
 <aCNYItP6SWImMvFv@mai.linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aCNYItP6SWImMvFv@mai.linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_181709_002639_8ECD7DB2 
X-CRM114-Status: GOOD (  11.94  )
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

On Tue, May 13, 2025 at 04:33:06PM +0200, Daniel Lezcano wrote:
> On Mon, Apr 14, 2025 at 06:34:56AM +0800, Inochi Amaoto wrote:
> > Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
> > compatible string for SG2044 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> 
> Applied patch 2, thanks!
> 

Thanks, as you take this patch, I will drop this one in our repo
to avoid duplicate.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
