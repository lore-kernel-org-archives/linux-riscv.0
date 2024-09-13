Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EB5EEE278
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 01:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dc1Xbg3/dyTffxIjZSrw6bGMajSbyt5nzI/BpMe6Kag=; b=27UMtx+BXErkYm
	STXFEXhKzrObTdFtRDAk5BKsECAfZm/GeCjMIePs/+i97xRURTIejXPI0Kz3aci0gnNh3Nxiylu6F
	einC33gGSJ2R6Tyx3tcjsMQy/G3PRgenVswVsUwlE7ikXNRoD2OSw6/C5TWtYtH69IAdzqzTjOgih
	8PMZ6UW33YhWt/BOqOIApC2F3pIFzdv2KH4AKi8oSvoylL9ny2msL+oBQaf/o58/7A00czrEBMJTo
	JtVdrRrTb6HjsDCpPl6R01dR+a9/A0dnndBwhAHCnUiaiS0zSERv4hYv6kRlOQr1PTi8HGRhyZ8k2
	iPeh2dTfNa9h5VKewprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sounA-0000000Ed2M-3E0x;
	Fri, 13 Sep 2024 01:08:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soun6-0000000Ed1u-483C
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 01:08:06 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-206b9455460so13096065ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 18:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726189684; x=1726794484; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rX91s/6lVMum4h31lglbcRQxW0xWM2VsFWKtsLlsc0=;
        b=CRRQZ32Hmxidmk6YcHqJYWhr1/V0ffIUDGIzEt5pdn4vlf5Lw7ilqpOSVFIwWoq+ag
         QCpjgEhE/Srcyxl9JvAVNadhDgi50YIzgfmSbmt1AjB0/nvnmuEhZkE1xvucl07X0dEY
         +RJRwvBybsO1Ok6yGF7Sjeol1btp1j3Tj6n3FFF1vijqxybmEvhBmtxa//TLS4/wa1YW
         RviFtVaWfLAZoW3gh4K92UZ872z/uMIKzXvN+NbJE48624zjtHzyxpMkCQwF1ajEQ3vS
         NUJeQqQdIAXRmfnYBg3oSElTtCOwnmsnZbkpZoOxv+7yxxTmmfrQDBS++R/ImcXOZm8E
         oTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726189684; x=1726794484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rX91s/6lVMum4h31lglbcRQxW0xWM2VsFWKtsLlsc0=;
        b=Fp72SfjmqDvCX7j6k9qDvJJ+zmw4+IFqVIDbsi6NK2MQ/Kl/3JXLTVCPmx/LGWXNjV
         2QFDsfQ1JVlKsoWfwCweNuG+6U3oeI/l/FUJS/xw6dstkXKueh0EOYKLfr5ea6vndjkg
         m9H6bQrwq+cF8icaa6h9+oTVRB5QirU1ebvV6s3KSsd2IPLaeMOw6YYy1Xr1yKcp62Zu
         TAvmyb5vl4PNwfhYE8j4O2ZBUJ3ue5G/mbcdRtSBBDULQIBmCY2uiZ9dTkdiR0Hj4+hT
         iySeagaJbw4EaLewYRV47IaRwH3g32c/IKaCydWHzYUTZmEAZUKXM5qQjXJnTUgHmDJX
         /RfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRR8gvRiYlPKCofvO68CIxCotQhipRNeuHc05MjbBN6UQuqG30dUVhec5ven9tAJLFg4N55RRZASAZgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHVjQRBroDABjTDMUK3I1u3eOOE6jlfrcH3poFEN+vI4v0GQ3i
	VdSsXt0SDC7x0usVzlhqSnNPc6j3vWIcUxVD+LEbLjkmT+iIRGLFQ0Ba1OFYbfc=
X-Google-Smtp-Source: AGHT+IF5L6tJGqxt6ISyibGjC5vs/5m2udlyE6OKfyZue9WunKzM/AXevZet1WqxTKzozG9VKoF3LA==
X-Received: by 2002:a17:903:22c9:b0:205:6a64:3144 with SMTP id d9443c01a7336-2074c798c92mr160035315ad.27.1726189683676;
        Thu, 12 Sep 2024 18:08:03 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd268sm19438885ad.172.2024.09.12.18.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 18:08:02 -0700 (PDT)
Date: Thu, 12 Sep 2024 18:08:00 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: riscv: Add pointer masking ISA
 extensions
Message-ID: <ZuOQcNTVUZ5/LFOP@ghost>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
 <20240829010151.2813377-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829010151.2813377-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_180805_283652_87B9508C 
X-CRM114-Status: GOOD (  20.59  )
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

On Wed, Aug 28, 2024 at 06:01:23PM -0700, Samuel Holland wrote:
> The RISC-V Pointer Masking specification defines three extensions:
> Smmpm, Smnpm, and Ssnpm. Document the behavior of these extensions as
> following the current draft of the specification, which is frozen at
> version 1.0.0-rc2.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---

Looks like only aesthetic changes were made, but the spec was updated to
1.0-rc3 (interestingly the second 0 was dropped).

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> (no changes since v3)
> 
> Changes in v3:
>  - Note in the commit message that the ISA extension spec is frozen
> 
> Changes in v2:
>  - Update pointer masking specification version reference
> 
>  .../devicetree/bindings/riscv/extensions.yaml  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index a06dbc6b4928..a6d685791221 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -128,6 +128,18 @@ properties:
>              changes to interrupts as frozen at commit ccbddab ("Merge pull
>              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>  
> +        - const: smmpm
> +          description: |
> +            The standard Smmpm extension for M-mode pointer masking as defined
> +            at commit 654a5c4a7725 ("Update PDF and version number.") of
> +            riscv-j-extension.
> +
> +        - const: smnpm
> +          description: |
> +            The standard Smnpm extension for next-mode pointer masking as defined
> +            at commit 654a5c4a7725 ("Update PDF and version number.") of
> +            riscv-j-extension.
> +
>          - const: smstateen
>            description: |
>              The standard Smstateen extension for controlling access to CSRs
> @@ -147,6 +159,12 @@ properties:
>              and mode-based filtering as ratified at commit 01d1df0 ("Add ability
>              to manually trigger workflow. (#2)") of riscv-count-overflow.
>  
> +        - const: ssnpm
> +          description: |
> +            The standard Ssnpm extension for next-mode pointer masking as defined
> +            at commit 654a5c4a7725 ("Update PDF and version number.") of
> +            riscv-j-extension.
> +
>          - const: sstc
>            description: |
>              The standard Sstc supervisor-level extension for time compare as
> -- 
> 2.45.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
