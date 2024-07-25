Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD31C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 04:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWM4DkCNm6+ReC44hYqeHbCn/c+OXvpkSVNWI3IZgBw=; b=eJ612Q0CZZ7wYO
	vhwuOCbdrMYst7mOShNcQnVSX17tpxBtrcheMxcdEGpNeVq3+XhEOeED9DPHtKl6lrjU0p1lE91+V
	d1QgcpLCtdKaKgyKiHgTojhdP/c2+gNuWA3uPlxFhOP+F7bHGkgMNa9BOkJuHPdP/SHC+3IuRlEr8
	OtlkQ+llaEc6ZyAiSFrUQf5mbdvaOw3RjmlXcSboZiVhq2QqDLzb+rhIMP51ahnAXTHX+ZRwcRjCn
	wMIvNcsp16z9axVioCyymlV8Vnh3fnR0t8l5AviAxBoQqHfeXr1c2nkIXhClOf4IatoQIBYRro0ts
	zyY6waSTwxZhPabtN26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpvA-0000000HJ8U-3Fwx;
	Thu, 25 Jul 2024 04:17:40 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpur-0000000HIqb-3SgR
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 04:17:23 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70d18112b60so372371b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 21:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721881041; x=1722485841; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+VMdQmHWFgj58kNWJtoryibFDwz3t5+vVkcIVzkHLE=;
        b=OwQT2389WV9i3dExCjq8Fz1t9vYTppqfPO32h98jrZEPvu9wqgu5FO5FvHBHJcoQaR
         qzjcd5Sz3FYn0SOD8vXmPpGh/B4wldZlOP2720tEiBSVVBUZgZPtYauPcE8D58dDrDEA
         VX+98TbtN6c4eujszwW5gApgHQUTwiJuTGMWiuB4nTYcryTRajVVFwGEmLoBdEZ2f0gi
         QIcavEpcQZy7EWQxH5HO+alSuFBGGdaj/0ECNOV6/VgowkQKkmjP+xGl7rIySUYPCmh4
         m/OVeXh6AC1JItPT570BgU5ANdqVFqWfHHpdC6+/5Fk42XNcYs5yoUiDXTZN3jgAGO4y
         +uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721881041; x=1722485841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+VMdQmHWFgj58kNWJtoryibFDwz3t5+vVkcIVzkHLE=;
        b=AoaDhU2PKcTch+VG4VkXg2159nMFwFhkoWC791I/T1p/4wXIan3gVM2wg0I8Tp81VW
         uL1H6JgWy3jPktMvZDqN82/wwOhrhlqzReblN7eS5sylfhA1BakyiqpUItjEbdKGxVZ+
         C8303T1dQ6Ts4VDuwm9raa+AQQNql3buG6zUiwUdeY36AXff3Cb9XFfK0Dz08HgNlkld
         mxGzNmLMQ6T+FI1hY+aFP1a1yQ7McoV0DZqGThVyCVv+ztrIKKMTkM8vYlboAY2MB+uF
         lbrYji0icSj8p0DhY2Ww2EYyYofRSBo4U4Q0JDLGdUL4jyDdQvHQTJBtc6xTY1IScXi7
         BhOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX+9e8fBYyI6lcUw7oEPx6i16xq/s9Js4IQ0qZd7ZSy/c4OzpfRqbNE9VefHzuQZ/6Gdkzz5cZoEBqKHt5OgCGL/vDKyWQXGWWO53WKKeV
X-Gm-Message-State: AOJu0YweDkDBFfhFNRYk1/rZEBpGUxihD9rdNHlkQpcLMkmPOSZPschs
	wTAE7wGQdcjZa4xSzGQbUFF9GWonzLUGC8Fh10fHqd/1+01Yn0xFwC//E+W56Pk=
X-Google-Smtp-Source: AGHT+IG8/lGGFfeqD0yKL6Ukrgul7u0XCxEnqHsWKKVCOGqLNIttHBNHSYlpgXB/YPJd1O/zSdOyZQ==
X-Received: by 2002:a05:6a00:66cd:b0:704:151d:dcce with SMTP id d2e1a72fcca58-70eaa1e2e1emr2589164b3a.5.1721881040621;
        Wed, 24 Jul 2024 21:17:20 -0700 (PDT)
Received: from ghost ([2601:647:6700:2d90:4e8c:b287:20dc:e447])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead874b35sm322537b3a.167.2024.07.24.21.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:17:20 -0700 (PDT)
Date: Wed, 24 Jul 2024 21:17:16 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	jszhang@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, samuel.holland@sifive.com, corbet@lwn.net,
	shuah@kernel.org, guoren@kernel.org, Evan Green <evan@rivosinc.com>,
	andy.chiu@sifive.com, jrtc27@jrtc27.com, ajones@ventanamicro.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 09/13] riscv: vector: Support xtheadvector save/restore
Message-ID: <ZqHRzAI0O+zsZd3A@ghost>
References: <20240724-xtheadvector-v7-9-b741910ada3e@rivosinc.com>
 <mhng-28424e23-c9b4-407e-97d8-9dbb09101781@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-28424e23-c9b4-407e-97d8-9dbb09101781@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_211721_948292_2756FD89 
X-CRM114-Status: GOOD (  19.92  )
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

On Wed, Jul 24, 2024 at 08:23:27PM -0700, Palmer Dabbelt wrote:
> On Wed, 24 Jul 2024 12:14:00 PDT (-0700), Charlie Jenkins wrote:
> > Use alternatives to add support for xtheadvector vector save/restore
> > routines.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> b4 isn't applying this, either on top of your last patch set or rc1 -- the
> base commit in the header isn't a hash I have, so I'm not sure where it's
> mean to apply to.
> 
> Also...
> 
> > ---
> >  arch/riscv/include/asm/csr.h           |   6 +
> >  arch/riscv/include/asm/switch_to.h     |   2 +-
> >  arch/riscv/include/asm/vector.h        | 225 +++++++++++++++++++++++++--------
> >  arch/riscv/kernel/cpufeature.c         |   5 +-
> >  arch/riscv/kernel/kernel_mode_vector.c |   8 +-
> >  arch/riscv/kernel/process.c            |   4 +-
> >  arch/riscv/kernel/signal.c             |   6 +-
> >  arch/riscv/kernel/vector.c             |  12 +-
> >  8 files changed, 198 insertions(+), 70 deletions(-)
> 
> [...]
> 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index bf25215bad24..cb48092fdc5d 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -845,10 +845,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> >  			riscv_isa_set_ext(ext, source_isa);
> >  		}
> > 
> > -<<<<<<< HEAD
> >  		riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
> > -=======
> > ->>>>>>> 0f260ac829ca (riscv: Extend cpufeature.c to detect vendor extensions)
> >  		riscv_fill_cpu_vendor_ext(cpu_node, cpu);
> > 
> >  		of_node_put(cpu_node);
> 
> This chunk isn't applying, and it's got a conflict marker in there.  So I
> think that means something's gone off the rails?

I really messed that up... Okay I sent a new version that is based off
of your for-next that should work?

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
