Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D8FC67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRlNA02hQnKut1RmzZs4MLFF9rZnHWs5sezNwHoSlZ0=; b=CVitZVpNzrhXga
	5jozE8CfJ+Y9x/Vs1yU8+tJSHRjDvvl2vTFbj1Fwm6t0i30AV/+5k2SL7eOKeXW4r2mHgsEVJ0fhc
	yjMQ6Vs5mz1HKm5kMWadmRfEZT7mFBq59OkzEnZ5fPfZQHgWwt+jPeU0g1FE7vZs/JKnJK4O2mrvq
	qEfbE3z3OuosqcI/JkH+GN0Jb7exBuBGsmkmWkAWhyq74ymUv92tBBNh4h1bktAGDEoonLOpxQTfN
	FgjnHTXg9iY5Os0qTq+62Dl7Ve1MKvPWLEMGVqv5O03JuiKhlrCtIT6bh2iy2cQX9YTTi9Ap/99o8
	+UxVM9f/9ecR9hR6KAsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rslyn-00000007tKi-0WTq;
	Fri, 05 Apr 2024 15:59:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rslyk-00000007tJU-1PX7
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 15:59:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4162fe73594so6317455e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 08:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712332783; x=1712937583; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/+tn7yaOy1bWCod1Hwz4ffQkyy0MXOXzF4xEGdBkSM=;
        b=dNsXVzvIzjeUCDREyk69mfhFMqxZl5G91u0DID5qS8kwy+48q4fGcMMWKYfW+cjgbA
         l4cXmSw3KnbuWVSYELD1sdom+/gkq6G++fSaqdYCsD17f3tOFtI7W/2wgXlrWeRgRL1l
         TcYjhOpfjHyXpyKpPyso9ljogVIHKdiykBVWqIMnCrqYxdGl6DJIHjZZVqcRp5/lKY5C
         UFo5drJXh+u+ARxK7vWfLChSc5BGbZ9wlRnZCma1LcEs/K0bkzBlQTfzbDPKKAX+J+Sv
         RNw2WEImNlS58rM6BPewFwzrqhDppz8GWpes+CTeLrQBYD8yKYra99JCa2wsJV4mTkEX
         bKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712332783; x=1712937583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/+tn7yaOy1bWCod1Hwz4ffQkyy0MXOXzF4xEGdBkSM=;
        b=hYV4nncdSaxaACCgZ6q3M29eANCN9BNViZd9sylngnONRyvRH5KE9wXLuYgRMzZ2Rx
         J398M9kJcs78nOehLs74EW9mB1f3P+rTiqW6IgbjNq0a/f1AWlAoyRDtsJL4XmVajzRE
         e45amukdmV+w55AK5LPwtaghBi8NyI/gzqbv+6VQkBA+CSb3Gz0HDJooUrllUNwgdnqO
         aYNwSwdR+xWKRkKOwYIodWAYuFwtN56IPRb12LQpwnpW06VO7phR6q0X8jMiR632C6jQ
         hUhD1+hQqsYPONwXmxixgYgt2qwXGFYRAIOtaUmw8ErnK9cNCRUu+BnsmfhNH6TH42uN
         Gc6A==
X-Forwarded-Encrypted: i=1; AJvYcCWpp+iAgvawr8iFtz3JlfYGoc4aLm/UkJ0crSettriAJbmRXmbJvYlHFZXz5N1LdRyZzS8XyMoHBeJLPpiJZKyRJX2NM9NtWByPUkCUpT5H
X-Gm-Message-State: AOJu0YzzTBUkA3IqOX4yXvxJJhOf1R9BgP4i9ytLSFEhZ7+TbZQYTFu6
	Oosj09wNTGrEuPO5y/otgSUWZYa7IgZbksS26Iwxt4gvhiEZb+zTbYCPqgFCsTE=
X-Google-Smtp-Source: AGHT+IHm5FdCsOG2D2FwTVsRXO+4kOPqszWyczb81zB17ksFNLVDMEKpcib6RWK3ysnM3lM9cg2ZBw==
X-Received: by 2002:a05:600c:3107:b0:414:7909:6680 with SMTP id g7-20020a05600c310700b0041479096680mr1487874wmo.16.1712332783307;
        Fri, 05 Apr 2024 08:59:43 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b0041632171f51sm1770044wmq.13.2024.04.05.08.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 08:59:42 -0700 (PDT)
Date: Fri, 5 Apr 2024 17:59:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Max Hsu <max.hsu@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@ucw.cz>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Palmer Dabbelt <palmer@sifive.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 02/11] dt-bindings: riscv: Add Sdtrig optional CSRs
 existence on DT
Message-ID: <20240405-ebdb2943657ab08d2d563c03@orel>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
 <20240329-dev-maxh-lin-452-6-9-v1-2-1534f93b94a7@sifive.com>
 <20240329-affidavit-anatomist-1118a12c3e60@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240329-affidavit-anatomist-1118a12c3e60@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_085946_518502_43770804 
X-CRM114-Status: GOOD (  25.66  )
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

On Fri, Mar 29, 2024 at 10:31:10AM +0000, Conor Dooley wrote:
> On Fri, Mar 29, 2024 at 05:26:18PM +0800, Max Hsu wrote:
> > The mcontext/hcontext/scontext CSRs are optional in the Sdtrig extension,
> > to prevent RW operations to the missing CSRs, which will cause
> > illegal instructions.
> > 
> > As a solution, we have proposed the dt format for these CSRs.
> 
> As I mentioned in your other patch, I amn't sure what the actual value
> is in being told about "sdtrig" itself if so many of the CSRs are
> optional. I think we should define pseudo extensions that represent
> usable subsets that are allowed by riscv,isa-extensions, such as
> those you describe here: sdtrig + mcontext, sdtrig + scontext and
> sdtrig + hcontext. Probably also for strig + mscontext. What
> additional value does having a debug child node give us that makes
> it worth having over something like the above?

Yeah, Sdtrig, which doesn't tell you what you get, isn't nice at all.
I wonder if we can start with requiring Sdtrig to be accompanied by
Ssstrict in order to enable the context CSRs, i.e.

 Sdtrig          - support without optional CSRs
 Sdtrig+Ssstrict - probe for optional CSRs, support what's found

If there are platforms with Sdtrig and optional CSRs, but not Ssstrict,
then maybe the optional CSRs can be detected in some vendor-specific way,
where the decision as to whether or not that vendor-specific way is
acceptable is handled case-by-case.

Thanks,
drew

> 
> Thanks,
> Conor.
> 
> > 
> > Signed-off-by: Max Hsu <max.hsu@sifive.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index d87dd50f1a4b..c713a48c5025 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -137,6 +137,24 @@ properties:
> >        DMIPS/MHz, relative to highest capacity-dmips-mhz
> >        in the system.
> >  
> > +  debug:
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        const: riscv,debug-v1.0.0
> > +      trigger-module:
> > +        type: object
> > +        description: |
> > +          An indication set of optional CSR existence from
> > +          riscv-debug-spec Sdtrig extension
> > +        properties:
> > +          mcontext-present:
> > +            type: boolean
> > +          hcontext-present:
> > +            type: boolean
> > +          scontext-present:
> > +            type: boolean
> > +
> >  anyOf:
> >    - required:
> >        - riscv,isa
> > 
> > -- 
> > 2.43.2
> > 



> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
