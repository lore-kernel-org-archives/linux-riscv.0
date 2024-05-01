Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56D2C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 20:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2UACV5rwW7iwTRNs12F+DjyUShp+mIYyDuO+akE2j0=; b=jy9DnTpQwnVgCQ
	T6Z8eOgE1fyFATpL8eK9us2kjv7vxSaZhitZPBMlR5RZhPoRR4RgERzczI+BAqIDs7XvejFPJlIFR
	L3BuECG36yKfTdextuhE/0ulbpn1iktrHp0hUy+fXrOFsCxGMF52WSj4tEPmXsX7q5L7BYgrEZs+d
	7rpqxWrrQk8m+lq+qMMj5Ae4vOhQgpIwFKGRUPMDX3ajsONP8waFi7febVwvLdqjG7GfEbDjqu3pM
	4Dgd6uzyaYP0AboQWsnsPPBzvJdB+F8o2hHWO72bNfc62npz/ECuAVRseyMsYDFUuFTyWQHxmR1dd
	jcC3IHIvPdStM+//AP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Gjf-0000000AevM-251T;
	Wed, 01 May 2024 20:39:27 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Gjc-0000000Aeuh-0ZGm
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 20:39:25 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6effe9c852eso6420533b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 13:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714595963; x=1715200763; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AKSbKmCdqNYp/TkwU1C8PV1OsGdgS8t0tRM69B6F3C8=;
        b=oMkkPVgW0ANOp4AgzuPUiEhOReV8kfKnu5AFEPvyIghqtQMmkMkGefBBxiFd6NJmQc
         dpi5OZLoeB4pQjnIhmrhK+Yh/C4/L5yQO1jupk8Uir5jT4LkWiJKBsTQQdainz+SRfHN
         PATkmmiudiLKXDCGaP10HihaO/AY3GYa2tSIR0VE5eHeGvZ73d2z6DqKnwOU3dFijqQx
         kQNkNcqCfP+t7mnIPbUVCShq+XxH0OIMR8j/puXS1IA55jHzvJayyVxcH9nTNU2nDOCY
         rHOoffFwGRrFVo4VvuuN1xmyUkKK0laJpnTkV7KbbjTza5HWQmbp29G/DXUouKMO0pou
         Vr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714595963; x=1715200763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKSbKmCdqNYp/TkwU1C8PV1OsGdgS8t0tRM69B6F3C8=;
        b=ZhHuIduBZFog1Wb0qq9q5kW7+Ap7FTkJ1ccCkxJxUR29tuvnuN3QRmII2SbliRckqC
         GRTgFhHNddCBCEYeJA9suQdDYs87d2uHET2zlgbQAzi9ub4DFsDWE+xYAfscLCeBPsNS
         6myLGMVE0sn19itWmPDoUPrAATf1TPT+D6i9Wa4ObTnqd06phQgAp2JpgIW3lwmlCbtg
         J4hXvttkO1iEtZq957LDG1tkZEJMf7KtBLfkNKohNWQ950ZBklMzjp/fC6BJHQUYWPDW
         rpoJiGuLwo/tA/9r46qgJGgl0Rz0gCnGNZwcmWN0Wr0qwNc6vtqIfn1WNRyK56HGKM6r
         fHQw==
X-Forwarded-Encrypted: i=1; AJvYcCU/xtTJg/5JwqFWQmTKBuPKp5gYDqJMCpefKY8H+Ixx5ZrpFuZbA9DdwWzkc4jG4ZO7JgEchgSmuG3QFgK4jq8FgqniDhiuFYjq17BE69Lo
X-Gm-Message-State: AOJu0YxI43L7u38fzacxX/zPO7diCPNXlOFr26/DhodP1JWQTDAhTEyE
	+BMtFvN10u5jHT1BDwzQGV/QOFDeU0IEUFtZypAqr48KMQWXKMx6KtlDgi/bFUcnGWcTlGnnNLs
	t
X-Google-Smtp-Source: AGHT+IHt+rl59slOy1iEvfvZBlyLdzZV/krFCrpw2Eo+5Hs2TZHpo6k/cWFEA5ZGhA3qB1CbXECo4g==
X-Received: by 2002:a05:6a20:5617:b0:1af:36df:5159 with SMTP id ir23-20020a056a20561700b001af36df5159mr18100pzc.59.1714595962795;
        Wed, 01 May 2024 13:39:22 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id v22-20020aa78516000000b006f03a06314esm23032553pfn.195.2024.05.01.13.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 13:39:22 -0700 (PDT)
Date: Wed, 1 May 2024 13:39:20 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 07/16] riscv: cpufeature: Extract common elements from
 extension checking
Message-ID: <ZjKoeLcs4YDsDztT@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-7-b692f3c516ec@rivosinc.com>
 <20240501-probable-unfunded-746ef6ae1853@spud>
 <ZjKcfZsWgR1AY3AZ@ghost>
 <20240501-hazy-reformist-8ff36ba53450@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501-hazy-reformist-8ff36ba53450@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_133924_318897_7FFB3F6A 
X-CRM114-Status: GOOD (  26.97  )
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

On Wed, May 01, 2024 at 09:15:44PM +0100, Conor Dooley wrote:
> On Wed, May 01, 2024 at 12:48:13PM -0700, Charlie Jenkins wrote:
> > On Wed, May 01, 2024 at 12:37:14PM +0100, Conor Dooley wrote:
> > > On Fri, Apr 26, 2024 at 02:29:21PM -0700, Charlie Jenkins wrote:
> > > > The __riscv_has_extension_likely() and __riscv_has_extension_unlikely()
> > > > functions from the vendor_extensions.h can be used to simplify the
> > > > standard extension checking code as well. Migrate those functions to
> > > > cpufeature.h and reorganize the code in the file to use the functions.
> > > > 
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > ---
> > > >  arch/riscv/include/asm/cpufeature.h        | 78 +++++++++++++++++-------------
> > > >  arch/riscv/include/asm/vendor_extensions.h | 28 -----------
> > > >  2 files changed, 44 insertions(+), 62 deletions(-)
> > > > 
> > > > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > > > index fedd479ccfd1..17896ec9ec11 100644
> > > > --- a/arch/riscv/include/asm/cpufeature.h
> > > > +++ b/arch/riscv/include/asm/cpufeature.h
> > > > @@ -98,59 +98,66 @@ extern bool riscv_isa_fallback;
> > > >  
> > > >  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
> > > >  
> > > > +#define EXT_ALL_VENDORS		0
> > > 
> > > It's not really "all vendors", it's standard. Otherwise, this seems all
> > 
> > This hooks up into the alternatives:
> > 
> > ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
> 
> Yeah, I know what you're using it for, I just find the naming odd.
> > 
> > Where the "vendor" argument is supposed to be 0 if the alternative is
> > applicable to all vendors. Is there a better way to convey this?
> 
> s/EXT_ALL_VENDORS/STANDARD_EXT/?

Sure :)

- Charlie



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
