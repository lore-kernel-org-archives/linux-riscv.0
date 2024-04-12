Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B8CC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 17:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6A4xfq5iuAqR5I6O+T6GaSTwwQFwZRTFcAC6Gc/leE=; b=oc5sceCOctvNgN
	Ce8K7GLT/GqPayBepBEQdd7Th+EkZYGu0wqqnW/O6H/2zXuzFC94xSRuMAFrn/TE3jiDhxV9Un2zT
	zAsTbGuFiczV5AOSz9gLjEDXIy6Rk3g0x+2OWFRQVgXLA9bVRWrMuPRQgyOZ0poT/vLRStUU+lvL8
	hpu6+CYWppHKKzd5wwXSiKluB2b28vRlmg6opPCSXOlHKXbKKEVgJK3Iavz1jCHMKjBErrTDBCfKJ
	Ps/vWVYiPsvVGWRjHF4kYXup/yWW3H7JzNj9W6X4hzKzWpChLaSOTDtA1kLy1z1Qo+FjgbnoCSZTG
	jPrLhj2OYZvtyli6rAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKSw-00000000dEa-2jw0;
	Fri, 12 Apr 2024 17:13:30 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKSu-00000000dD8-34rh
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 17:13:30 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so695292a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 10:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712942005; x=1713546805; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Soc0+QXn5W8zbaSk+coOpUVEhCceV3S1TAiuN1SZpPU=;
        b=YOJOjQfeixh5yxKhAMiaq9twE7F3Gb73qsrSVqKxhuZuqt40+L3lqn5EK3fY8bkPoO
         xVEKefUph+irBW8tfdaV1EHa+CcBjp65EzdHlWpVQlOIysvj/TTJPxUocYIv+5lZqgxv
         /2BP+zPEPSyubZKSHE4z4tYo5BKfm190mvWjEBbYoDDqwN6/MQzaX+4KwMjhjEmzUxsB
         mBoJRf49uNxEbTOneiHNOKhNTckOOZCFvDFIgzn+r6IPx/TlJJFz0JmRxPLchn8fYNnf
         xCww7pQveIIkxYm4/cZDZtsMqp5Xv9zUApHoBVqoVPjOurYWFmZ5sNshCfiKeCSuVime
         KT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712942005; x=1713546805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Soc0+QXn5W8zbaSk+coOpUVEhCceV3S1TAiuN1SZpPU=;
        b=v7T46EU/BCiofFtjxJ26lA0TpBmMogrJZXF1qj42KLxVr2xQusDxlLYoAEUTaCsMQw
         eU6QvrUCbFPrGSsDBmb4Sp2M0KJfZ9FomZxGBtNYlpoPV1wdOe8tOVmKZdTraN212fXV
         jaWjiXOsK4EVOTiom3KU0SqR0IYErYZy4KtW0p8js5eU8i8Yy9KDyNRj8cndAEOw6j1q
         tm54bKNIWNFKORQoloDTtRFE8bjtEI1Qw29ofUiI8WEE+q/qdONuMVFTksn4fdRLtFVw
         3AJQMqyaduUIe2bsjM8VC8F9lMmnotZtHUzA3WCBECzX19pQk4tQElYwDilyHqhTSLA9
         ZfbA==
X-Forwarded-Encrypted: i=1; AJvYcCUF1OE/0rMK5vtyxcE4zdj3eToRSlJ5SUIHHTczl8VTMXqA4ogLxR5M0k52kqfxFm9IM3CxjG2y8QrcKX/IjZ4LM5Wm2yTFaQhxHQweMJKT
X-Gm-Message-State: AOJu0Ywc2up7qvcYij1z3wyxo5Ja/k11qdyeyMhiNeHWpaD1vx747CrV
	Vo9XCyDSzhbYfJgRag7CiR0aiNCryo8JEJIvlNwOHeXd2e+xM4cy25W4L4Q+SKs=
X-Google-Smtp-Source: AGHT+IF776zoVnfiTTi5WIsaQ3v4fo6KtFc0W2tiXFHOJ67WtrOcZCtTV47KUhKhuAyowf9bIsmn8g==
X-Received: by 2002:a17:90b:1001:b0:2a2:775:9830 with SMTP id gm1-20020a17090b100100b002a207759830mr3316998pjb.11.1712942005487;
        Fri, 12 Apr 2024 10:13:25 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:121b:da6b:94f1:304])
        by smtp.gmail.com with ESMTPSA id ge21-20020a17090b0e1500b002a6e67e197dsm1458645pjb.45.2024.04.12.10.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 10:13:24 -0700 (PDT)
Date: Fri, 12 Apr 2024 10:13:22 -0700
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
Subject: Re: [PATCH 03/19] dt-bindings: riscv: Add xtheadvector ISA extension
 description
Message-ID: <Zhlrsl7CKcl6cdSC@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-3-4af9815ec746@rivosinc.com>
 <20240412-ream-dwarf-8cdc3d0f279c@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-ream-dwarf-8cdc3d0f279c@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_101328_800896_9B763C9C 
X-CRM114-Status: GOOD (  18.89  )
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

On Fri, Apr 12, 2024 at 11:27:23AM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:09PM -0700, Charlie Jenkins wrote:
> > The xtheadvector ISA extension is described on the T-Head extension spec
> > Github page [1].
> > 
> > [1] https://github.com/T-head-Semi/thead-extension-spec/blob/master/xtheadvector.adoc
> 
> Link: <foo> [1]
> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/extensions.yaml | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 468c646247aa..3fd9dcf70662 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -477,6 +477,10 @@ properties:
> >              latency, as ratified in commit 56ed795 ("Update
> >              riscv-crypto-spec-vector.adoc") of riscv-crypto.
> >  
> > +        # vendor extensions, each extension sorted alphanumerically under the
> > +        # vendor they belong to. Vendors are sorted alphanumerically as well.
> > +
> > +        # Andes
> >          - const: xandespmu
> >            description:
> >              The Andes Technology performance monitor extension for counter overflow
> > @@ -484,5 +488,10 @@ properties:
> >              Registers in the AX45MP datasheet.
> >              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >  
> > +        # T-HEAD
> > +        - const: xtheadvector
> > +          description:
> > +            The T-HEAD specific 0.7.1 vector implementation.
> 
> This needs the link and a SHA or some other reference to the version
> of the document.

Okay will add, thank you.

- Charlie

> 
> Thanks,
> Conor.
> 
> > +
> >  additionalProperties: true
> >  ...
> > 
> > -- 
> > 2.44.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
