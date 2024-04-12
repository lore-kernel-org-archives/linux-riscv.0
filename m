Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E202BC00A94
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRAHVMT0QKgR0riSQmzEWyVsGV+qeFvcyJ1ml/IeKg0=; b=xHn8rq4qLQ2wJ+
	KMr7vu7FZ2RbeQCvFNxdfx9RBDc4lqlk3fz4kiNL+Ojp8V98UJeHqOatdUlXuIIyJb0jdK+ZqQQQb
	v45yurQy4wdbnPr3buPlQNqIDTlITE1HXQavp9cfTQbEA9yI/g0amonUK21kSqYRI3XNWNhats8qU
	GQxJ2IiNwpTpcTzzsHjsJ0HZV+z6b+6mqwhFcUPnzAKhhOGk0n+oPCSVssUkA4b2XmyrQ+dvOnwUk
	rE/h6hcQx9fHnndr7PdIiSQl9uhrEA92pekUGkaBMX0ovITdSxGJJFDgXXsqHM/0+ZSa91uZo+/xL
	6wJRDHyfTkkD3okSJPGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKnV-00000000gRq-0W9s;
	Fri, 12 Apr 2024 17:34:45 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKnQ-00000000gNr-3uvv
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 17:34:42 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso859879a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712943271; x=1713548071; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PEydYnVIUiV6lB5t0xe0YqzJX4OVoeUrqtT1X9ALVoM=;
        b=fv7eHrMDMkgAQv6CmhaTvjfTfqzvXG6owFgmv5IcQf2uquYdXvPnjznMenH3l6i2ia
         erqnp2yV7yIXo+822cAhyPnnDVHdcTB4gCzABVKQnQh9MBV8hsBrmiB28nIHo+ThXouN
         eIL0KrB/R8dcFjn3QpZVYU5n3M53dRz6HJw1B1CfkdsYSwtfLOS7cXayFHuPN4QBBFfm
         mHwUO0hNe5e98LXc9TDJ/mWR30Bs0d+P3KtrhDwXit5WOLZZaTa02wBum9R0u5h1nlHQ
         sc9WZyNsCRwX5rc4mMMa/dOSWYQRTsEUzMjPF1Jr/EssQY1mYMGQ8KFAELY6Nud7mWUS
         DZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712943271; x=1713548071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEydYnVIUiV6lB5t0xe0YqzJX4OVoeUrqtT1X9ALVoM=;
        b=J/903PDnkVA8e3wdA62/YhextG+kCgOHWBEhLSxF5ipHfUIHNG2BR53IXbNWUt9snD
         lTL7SaS4FAr7cJU2/pJnwqC4Mjw/eTZX17gwSBd4aWHyN6aq7LmXjHHtG2rv255NGpyi
         57vPVUlwht1ZpgrxjKvdZkd+gxQkXAyXNAE4r+h+++AyfgVx9OxPeX3ecCMYkyh3jBxP
         DqDDWLyx9oz1MitkD471zT6JUyT1pZbne4gwbD9esOleN7utekVM6fFLzbZMyjqN27QZ
         NkeHmAIIXNmR2uKowl04uJhJnBWgGlqc7/o0TyScwYcqndj9XRDRP2jRWQGkKEglY0Xk
         Lkww==
X-Forwarded-Encrypted: i=1; AJvYcCV+Env0zjm7nNbU0yh4/+2YE6d/N+bt1gSj2rARQmhcDVRMA01KaZ/Ood3lkijUIkqMPpdpLKTrnhieMlCLm1akUsPgTKTtlDXSQwBUioJr
X-Gm-Message-State: AOJu0YwMDkdton5V4P8WzsFGlRHNQI774cGE9bJoKoupmqN5yKIELhCo
	IVY/7c+8jAJftMknHWY2vWjrV+QqX+kXCGd7/2lE7UrRPA01yLQHjohYpSGI/8s=
X-Google-Smtp-Source: AGHT+IGecMdCX/L7b/b4jRRmemcxcjENo5rWeeIe8AMz+k5W0w7mlpSYqVctJhJ2M4+aY/mVz0JUCQ==
X-Received: by 2002:a17:90a:2cf:b0:2a5:733c:3105 with SMTP id d15-20020a17090a02cf00b002a5733c3105mr3650134pjd.26.1712943271582;
        Fri, 12 Apr 2024 10:34:31 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:121b:da6b:94f1:304])
        by smtp.gmail.com with ESMTPSA id fs6-20020a17090af28600b002a4e331cc69sm4732571pjb.20.2024.04.12.10.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 10:34:31 -0700 (PDT)
Date: Fri, 12 Apr 2024 10:34:28 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 07/19] riscv: Optimize
 riscv_cpu_isa_extension_(un)likely()
Message-ID: <ZhlwpKuqVkQCr6u+@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-7-4af9815ec746@rivosinc.com>
 <20240412-aerosol-heritage-cec1eca172fb@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-aerosol-heritage-cec1eca172fb@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_103441_008947_6077061A 
X-CRM114-Status: GOOD (  21.77  )
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

On Fri, Apr 12, 2024 at 11:40:38AM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:13PM -0700, Charlie Jenkins wrote:
> > When alternatives are disabled, riscv_cpu_isa_extension_(un)likely()
> > checks if the current cpu supports the selected extension if not all
> > cpus support the extension. It is sufficient to only check if the
> > current cpu supports the extension.
> > 
> > The alternatives code to handle if all cpus support an extension is
> > factored out into a new function to support this.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> 
> >  static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsigned long ext)
> >  {
> > -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikely(ext))
> > -		return true;
> > +	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
> > +			   "ext must be < RISCV_ISA_EXT_MAX");
> >  
> > -	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && __riscv_has_extension_unlikely_alternatives(ext))
> > +		return true;
> > +	else
> > +		return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> >  }
> 
> static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
> {
> 	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext))
> 		return true;
> 
> 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> }
> 
> This is the code as things stand. If alternatives are disabled, the if
> statement becomes if (0 && foo) which will lead to the function call
> getting constant folded away and all you end up with is the call to
> __riscv_isa_extension_available(). Unless I am missing something, I don't
> think this patch has any affect?

Yeah I fumbled this one it appears. I got thrown off by the nested
IS_ENABLED(CONFIG_RISCV_ALTERNATIVE). This patch eliminates the need for
this and maybe can avoid avoid confusion in the future.

- Charlie

> 
> Thanks,
> Conor.
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
