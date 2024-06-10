Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E652C27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hk6kfJoVxAUi6WfPhz6wlmaV6Gi8OrTFzEwEdZo1cc=; b=yyZVW8g2JVIfD6
	mlSD2UDKNkbeV8wlbIlm6dOlNAxUXcZBaNV/Sb5zz8QO4rM8vO8LuyL3/aQzWpXHNHUgoySWtzxl7
	7o7/8kdg7Nxkgi8tvPvkwS9URfStcQ0GjgYvCA1cJHu23oVQl4nyYioBiC0XvhXsOaZtc9tTTaG1a
	3KnyNz0yzTkeXxAelrwMEAkCLa97KyhG2iApwyyubhf8Yw7VnvUA07jcaONiIIByNKMLDFwXj42eS
	uwksYMO+Lg9WjRMJbn86hvgn2X8GllqIxzvAGeCGeHH+76UxH/GRv7JcyYmXb/EdbvSubop0Qlonm
	y1/w1aDtito2BvBuhldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGi2B-00000005pYL-3aX5;
	Mon, 10 Jun 2024 16:38:15 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGi28-00000005pXr-3SPw
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 16:38:14 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-704090c11easo3305515b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 09:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718037490; x=1718642290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NXoCBXdsY/M+q0fRNH+4Z39Lx/Z6bNhqTdLOeE8sP8k=;
        b=tuJfm0c7cSXz9bRK8czp2caCyXEnb+/Am/c4YyyILGVLRvn2ANHTL+BGdpCPgX9UZQ
         dYbebD9KWHfAGDglIOmvyTqMe2XQrkft8cxFbmmW5IzKdXYWASarGkm2RhA0vKEr1THt
         5SUVhoFpE/2iBqdGP8mEFlT1/zBYUGXLFKUXarsJw2hxTouVQS4sMwd9gGyIn5TzXqAX
         qmF2k17gKCAWMpECqwyBr0fZ0DgJ5109KkYEes49BstIC6iVDcXbf9gZuxla+OQzmNP/
         bhFnFpSOWZQbm9x62D+NnuQb2iHjyXjnNFTgXNAZJX1Of0mPLOwTL2Xbpj+8CL1TgmZD
         g/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718037490; x=1718642290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXoCBXdsY/M+q0fRNH+4Z39Lx/Z6bNhqTdLOeE8sP8k=;
        b=pr3F/2b9fT/kuNTut3nwAn1INHfwbUY/NXPYl52gMkoz9TLQmryq3iF+PpBfRWN8h/
         Za42IMLiOROtf1UW2L4U+t0hQfYnn0jdlqYoVoIWHksPKWFHuGs0SieMjhZ3CdEcjSiA
         /HtHIJ04lu8wFdElb43BELm7wC54+pKbrsXd65gQijvjpjv60a4jfsYW35Xg9quZFKxD
         HqOWtWdr1woSOqzMKyZH2hrPoBQF5ugTArTexPQrgsfUL/JZ9nP2uFQNJ5LgdCDKqrxA
         De0PxgP4O8d1V74ACCbIOs8rLNxrcT5aonG2QPYSXcjOWsWFDqoUm7YHiMo1dCBokohF
         BApg==
X-Forwarded-Encrypted: i=1; AJvYcCVJK+EcjOb2fTzy1X/Wut0JvLi/8L4o/XPyZEEIQWK0Ck4mE+sV2ArV8KTwIaS53b7MOT6GPfyDaZeB+U1JUSt3I4LkWQYQ93/HZ85wj7ID
X-Gm-Message-State: AOJu0Yz5tbsA1oeuOaFmO0pFpgMvwcu73/Y4NUDkGqtpkT7s2XX9RR7L
	K+Dhp50TFnogPepwqRFEOCVHhT6ouzfSltTNkz5g6i99/PZem5mQqyoCdCYD20w=
X-Google-Smtp-Source: AGHT+IE55hp5TAOsUAoyvyS756iP3CfmNdcn1/vY5DaP2UtK03lkcl/o+b2HM769MgzylCW45JEhTg==
X-Received: by 2002:a05:6a00:138c:b0:705:951e:ed88 with SMTP id d2e1a72fcca58-705951f1f4cmr3638587b3a.25.1718037490325;
        Mon, 10 Jun 2024 09:38:10 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:129d:83bc:830b:8292])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6deb62efb66sm5525307a12.12.2024.06.10.09.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:38:09 -0700 (PDT)
Date: Mon, 10 Jun 2024 09:38:06 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/13] dt-bindings: thead: add a vlen register length
 property
Message-ID: <Zmcr7pP+XEWHYTsy@ghost>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
 <20240609-xtheadvector-v1-2-3fe591d7f109@rivosinc.com>
 <20240610-unaltered-crazily-5b63e224d633@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240610-unaltered-crazily-5b63e224d633@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_093813_016022_6208B628 
X-CRM114-Status: GOOD (  24.86  )
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

On Mon, Jun 10, 2024 at 05:29:23PM +0100, Conor Dooley wrote:
> On Sun, Jun 09, 2024 at 09:45:07PM -0700, Charlie Jenkins wrote:
> > Add a property analogous to the vlenb CSR so that software can detect
> > the vector length of each CPU prior to it being brought online.
> > Currently software has to assume that the vector length read from the
> > boot CPU applies to all possible CPUs. On T-Head CPUs implementing
> > pre-ratification vector, reading the th.vlenb CSR may produce an illegal
> > instruction trap, so this property is required on such systems.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/thead.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
> > index 301912dcd290..5e578df36ac5 100644
> > --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> > @@ -28,6 +28,13 @@ properties:
> >            - const: sipeed,lichee-module-4a
> >            - const: thead,th1520
> >  
> > +thead,vlenb:
> 
> This needs to move back into cpus.yaml, this file documents root node
> compatibles (boards and socs etc) and is not for CPUs. If you want to
> restrict this to T-Head CPUs only, it must be done in cpus.yaml with
> a conditional `if: not: ... then: properties: thead,vlenb: false`.
> 
> Please test your bindings.

Now that I know `make dt_binding_check` exists I will use that in the
future!

- Charlie

> 
> Thanks,
> Conor.
> 
> > +  $ref: /schemas/types.yaml#/definitions/uint32
> > +  description:
> > +    VLEN/8, the vector register length in bytes. This property is required in
> > +    systems where the vector register length is not identical on all harts, or
> > +    the vlenb CSR is not available.
> > +
> >  additionalProperties: true
> >  
> >  ...
> > 
> > -- 
> > 2.44.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
