Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0B4C02183
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jan 2025 00:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmUBxIHRdYdFoW5C2sHf7F7tkD0ePwGL1hkxIQ6wpfU=; b=sGsqAajR4Ob8Hs
	hmyADFDW6jwqhVY5lUc5CVgm/3jwEJ7JkghUKNvfHwBgZ2busSxgBiwL2fPpAQs0MlL2Pd5h47fDG
	ehGR/hzYRohfzQXJn4UeHm2Wzt1QIw5kU38nK/P4+d1H8DiUZtSadACEJYVvESLfierC/xoFcXAJo
	NGQa3/EtqMcE6rqC7oMzo47sW2FI7lepwQEaa8fVb71b8V11g4MBWGcKa2IRaNmJJ6qCXhqFTaBiZ
	qUk1YvEx6vpwfVSwM2S6JtDN5YIA/Pc751eRa4rsTsFbKdc2clHhbWcrsRLj1Ep/7a3KXwAxAexho
	uTCLEqWLEpNWfK1FPwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYx75-00000001dMS-0jyd;
	Sat, 18 Jan 2025 00:54:59 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYx72-00000001dM1-1gOp
	for linux-riscv@lists.infradead.org;
	Sat, 18 Jan 2025 00:54:58 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21628b3fe7dso50624665ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 16:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737161696; x=1737766496; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oh7xoLJnLSSPfOBgNZ9CVgKPTBxDOvq1hKFuaUcbeH8=;
        b=zIzCN3di2d7PrWrCiCF+zOd1qmIZ06pzVW7+P2GD46tNxfEUApU9xMV9J7unuZfNBY
         0Y1qRS6SUxzX7eOI9D1Fq3121+efiQPUTXPSPw/arNYfZKPU3+NmIhjrFKu3fanUIMQq
         05U8o2EQPO8ILVoKFOASKYXR2+i45aXi2NY4HfCp2rV4e4r56+7JM2XArxg/nS/FCeR8
         583mEVKAIDdT0DD5Y7wcClaFciY2ffjHoPlHjMpq9ShhDnMVuuiwKlm1VBVZcVjay1td
         NQfSsCRG80RWnHEIN/z79q4VAn3JbMqIi+/9EETVfRXahm4HzuW4nDS08ZFuTOfmiDWz
         bVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737161696; x=1737766496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oh7xoLJnLSSPfOBgNZ9CVgKPTBxDOvq1hKFuaUcbeH8=;
        b=pazxS3ochlBCKP8debd4YLVyz6xgCenbxbzCGXMQXl75lnRC/r2vdmSHMQ9ldwK+L1
         2oQqPzeihffDbOiW7tkVVK0HDY033v03WUFxUqK0YRHUtCXId+G1XyiHHpZq4dVps4qG
         EUf2znge4FiAqnNVA9O+mMNi/UX6Y3E1BqQHGdQS8ZKWKrmuxoLADPAcBHeD0WKVLpfH
         Y2YZjtCKysLfYto7iSM7XIQHKl+Ru7jjWrHvQYH5IxFegwSOSWKALJcmVIpEIj6fGoDV
         FB3B272bYcyrBrABXvYT3eSbLk9JFwPr+j5GyQE2OPaVb9vqiMo6bWx2RldBJ8IJZn7Q
         uAnA==
X-Forwarded-Encrypted: i=1; AJvYcCXxUcpwP2vh1sz2PbdLd2bIXoWut2S6qcfG9K2NCDk7AMjxAA54xe0a3kXo2Q3bjl+G5ELMM67Bw7uQ7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYKnLYf4LbMGhjPiGpbPfl7ukevoLucOxn36L5GUQc8n7cl6KW
	iCtk9STYoCF0jvoJnwAnWsEYMFPnCNWu+a7RdwcClpEcTKILprueK0ojKTbB0Qk=
X-Gm-Gg: ASbGncs0C2Sa/DGOygEcPoaFuMGUqpCj2lWs8VGYEhnZ7tW0DEJi+OBHfalncEsDLW8
	8S1awHmWBfDi65YyBKK5mpa8nAS5mS8a76isIbYae80P7FAMK0rZ70MaIkMbwCOXNgz/5iLmVcc
	sbI/A4CksJ9SbwzYNeWe9fe5EdAmgs9UOAFfI16GXHT16pvRkErWPEFOnNYuh+N0N7+pnYFuWP0
	mYIUhvaKiWH3SejU+yZawgkXNnNf9iSSrcur16Pqw03ovuiKm7JBS1gwLZGpAO6rQ==
X-Google-Smtp-Source: AGHT+IH+QJ6x1rOPrK+moxSefvMOt20/u1r/HPVB4Hmq9pgG4JuLRNbdKxVVE7KEC65D6Zs6fmYniA==
X-Received: by 2002:a17:903:2342:b0:215:cbbf:8926 with SMTP id d9443c01a7336-21c355b053fmr66620035ad.35.1737161695697;
        Fri, 17 Jan 2025 16:54:55 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:d0ea:9b9e:5556:aa82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d4042desm21920935ad.242.2025.01.17.16.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 16:54:55 -0800 (PST)
Date: Fri, 17 Jan 2025 16:54:52 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: riscv: document vector crypto
 requirements
Message-ID: <Z4r73Iq5IWM8Z633@ghost>
References: <20241024-fanning-enrage-bcc39f8ed47d@spud>
 <20241024-pungent-lasso-42dd3512a3c8@spud>
 <20241025022411.GB1781@sol.localdomain>
 <20241025024224.GC1781@sol.localdomain>
 <20241025-defile-blaming-12fc1e3a62e0@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241025-defile-blaming-12fc1e3a62e0@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_165456_706798_35E7A1CA 
X-CRM114-Status: GOOD (  18.19  )
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

On Fri, Oct 25, 2024 at 05:53:49PM +0100, Conor Dooley wrote:
> On Thu, Oct 24, 2024 at 07:42:24PM -0700, Eric Biggers wrote:
> > On Thu, Oct 24, 2024 at 07:24:11PM -0700, Eric Biggers wrote:
> > > On Thu, Oct 24, 2024 at 01:34:33PM +0100, Conor Dooley wrote:
> > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > > 
> > > > Section 35.2. Extensions Overview of [1] says:
> > > > | The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly the composite extensions Zvkn and
> > > > | Zvks-- (sic) require a Zve64x base, or application ("V") base Vector Extension.
> > > > | All of the other Vector Crypto Extensions can be built on any embedded (Zve*) or application ("V") base
> > > > | Vector Extension
> > > > 
> > > > Apply these rules in the binding, so that invalid combinations can be
> > > > avoided.
> > > 
> > > It looks like that part of the spec is wrong, though.  The Zvknhb and Zvbc are
> > > correct, but the list of the composite extensions that at least one of them is
> > > included in is: Zvkn, Zvknc, Zvkng, Zvksc.
> > > 
> > 
> > I am attempting to fix this in
> > https://github.com/riscv/riscv-isa-manual/pull/1697
> 
> Looks like at least one person agrees with you, but I'll wait til that's
> merged before submitting another version. Thanks for reporting it.

It's been merged now :)

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
