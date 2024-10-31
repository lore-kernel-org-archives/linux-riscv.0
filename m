Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80BFE68954
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 06:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2alGwf+8dAhaOoIh/GQyYOGbRijkoboMpveukaQ+0kM=; b=jd97ZdkCmUTP4U
	sqCqWUKyAmK0nRrMIlGx9zBr18xVa7aZd8zZB9g65ApZ17jFdAkyoG7Oi2bwqirctTQE4BCw0Mwa8
	QQ+4ju4Fve2XW0SjT6BvkaidqU79DFo4A17KgSqZsMhi70rcZJiW3UWEowS/7QlU45p4nuFOc/UzF
	dm90a4q3xlRPCb/AmSnNK79s9DXgmq7c1GXW28pA72Ci6B0uoTfGYUWxZAYUOwgz8BEiAvvlTU4Cu
	ia4QuYGH3Jbyk9ZJw3tT8eKSs10feKPPs8EUxLbfD1rMU8K7XtHG6CotWZaAqNmZ48zwwPodXU4b9
	LeknkjTAdFuIIa0M+jIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6OSt-00000002f8x-1Nxe;
	Thu, 31 Oct 2024 06:15:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6OSr-00000002f8A-0t3G
	for linux-riscv@bombadil.infradead.org;
	Thu, 31 Oct 2024 06:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XNHizp3vdR2jJwWfWzhOjHw4wEUjGKp2hXV+t4+ArSE=; b=GkHQCuuGe/iXCgKa/4Udb0I9JE
	cdLhxFSVSxE7MNRYHsnietvZXMO3u5gj/VsNSRmcwU+SiwlHDHulf2cPvZ7NTlcUaZYt/oHNo00n6
	vJ6h0sBv29eriz10KI/RcfMsxQl0hxQ+g3DPAtRyIfbCcZEjntp4+DkETElSH0OgiP8t+4mpf2HyP
	KPGBbSR4sVAqNH56lp7FFoIcsEXgGfBAjwTRL0Jenl+3vz6UWuvlavMxXEL+yHDVpbhdMMDYMN/N1
	F33w5sI2fVUcKsQ+5wjXgIGOy2Qgrz2T+USL9w9gSGb1dMdqHKCaTEsBE0VgP/VmXi/7XYw/kUzKB
	5g3DbVtg==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6OSg-0000000AOoo-2xCe
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 06:15:22 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso436494b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 23:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730355309; x=1730960109; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XNHizp3vdR2jJwWfWzhOjHw4wEUjGKp2hXV+t4+ArSE=;
        b=hS8TBB+ivEgCZrBbcZ5jDUhqhjWQfwkYVUyBLXcJ+FEYv8laSMwz0qtaWd2D9wtZAb
         Jagc/KhGwIvuSAdi43jxdneYWZWmgrclHLp6jCuWCY1P3TtoEh2qy+yqAafcg103lGOT
         551Qb9WfK8cuEQN9BHs+z300I+eCS97RXz0/RpY2M7zw5BkGkdBVuMLtsI8PeT1EO2Og
         y86P/UtJ1dDJ5MuPoYFww7q0G1AYa0jgmVQw/IppDKqd88wx/S2/YbnmXutWJpTamsOZ
         8HVLeDRgVj1VRvkfE9ADWigtjx+5FslMviL5/Ngy2/jB9qiApfClCSKpgzeLhRnPR2NC
         kDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730355309; x=1730960109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNHizp3vdR2jJwWfWzhOjHw4wEUjGKp2hXV+t4+ArSE=;
        b=caduQ+KNs4BfL+vZOkst1IfSST3tbgur7R0wS3yU6ZnWvUVBLsM2zsNGTlz/eYHLvy
         4dEdhgIixVpt5FMYmiQeB3710w+JuX9ErEsZ/GCBvveYS+WThvEZVA0hGrVNVH3v6tFV
         wMYWTrBOXUjxKrAy0aDGxdAmHnIdY1DbgUiXnm8jnEE1oKUoH5hQPY48bKRuudn+HQGA
         RpuzGSIL7Vt5BpNUUgGBneycCjwJkmymrWCEWGmFbe8pN3KGcVsPv83GBW7qK2I3KBiG
         OotFn9t1yNCIeEo6+GPq7OmyDYBfVckI8WHTAzom4tZL3/rR08RKzo2op93q+gjTiEJv
         AKBw==
X-Forwarded-Encrypted: i=1; AJvYcCVf4C6LjJXQB5/WcHiBiScywu8r0rugJ1zmYGXcxyfXgm5iK/fRO96hT70DjBEG8vBlKuW6IthxT+v+gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNWVntg7wB+M7UIOi5O02GFgoEbiRnswAZO9HeHUkrLhJA7ygJ
	W5xSu/RT/MatleS+0uEYJb5c3qJ+B0WznFaEBPR0UQvGFt7Bdvgu
X-Google-Smtp-Source: AGHT+IHe8ZlhfO4mUD9OaBTVRSTp19pxfjwgeX5Q24Oh31kpwAwy3z/U7oVNpbqUXJpwMzMLLWNxEw==
X-Received: by 2002:a05:6a00:b48:b0:71e:69e:596b with SMTP id d2e1a72fcca58-7206306de29mr24794428b3a.17.1730355308831;
        Wed, 30 Oct 2024 23:15:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c54c2sm567916b3a.134.2024.10.30.23.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 23:15:08 -0700 (PDT)
Date: Thu, 31 Oct 2024 14:14:40 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Guo Ren <guoren@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Yangyu Chen <cyy@cyyself.name>, Anup Patel <apatel@ventanamicro.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: interrupt-controller: Add Sophgo
 SG2044 ACLINT SSWI
Message-ID: <esuteqvz37blehx6wa5cj5ixlglcbullhuls3rcvjtuiviqqpb@ojho3arlnwst>
References: <20241031060859.722258-1-inochiama@gmail.com>
 <20241031060859.722258-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241031060859.722258-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_061517_310832_6720F457 
X-CRM114-Status: GOOD (  10.07  )
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

On Thu, Oct 31, 2024 at 02:08:57PM +0800, Inochi Amaoto wrote:
> Sophgo SG2044 has a new version of T-HEAD C920, which implement
> a fully featured T-HEAD ACLINT device. This ACLINT device contains
> a SSWI device to support fast S-mode IPI.
> 
> Add necessary compatible string for the T-HEAD ACLINT sswi device.
> 
> Link: https://www.xrvm.com/product/xuantie/C920
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Hi, Conor,

Could you review it again? I have updated the description of
the binding and mark the device is T-HEAD specific.

Regards,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
