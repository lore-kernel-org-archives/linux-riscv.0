Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C57C04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 20:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfTufSDBtTNdnj+RnTRARwxbK9MNDqbBRWqep8xxLAE=; b=gAsNOWNRAsj3bZ
	RjCZDSfmUxJ1N00WkcvRMzX8KlspkJ4H060UeY8aQkB3Nk0sxAGQnTj4ueI9BIxkxT4bfcepSUEpT
	f5vdQM7B+nUwQNZh59OA2im/i0AxnQuAnmVu41t3jJV8DjgVnRVQlNOb7HubLRI8sSD9s7FMyPDH7
	Mn4ofVzwVFwQmHBCvPQphWqYjqVTQ8c9QDRmG7e2uiYCoQ28HW3gfRRJxzTfUns9IJpdv6l5U+gpJ
	67kbDbKZOTB8qIGH7gF8vk7cAfXt26sCxUe6GS+/d/lrIyjHYNM1EQhzETkpjZ66R6mgKqIcsVRn0
	5mPFr+vLwAPoUsgJLE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwpeB-0000000DlD3-2KJz;
	Tue, 16 Apr 2024 20:43:19 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwpe6-0000000DlAB-3c62
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 20:43:16 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1e220e40998so32909585ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 13:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713300190; x=1713904990; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s6DlS4/ZFHRtR1n8rjuKFrNyH2RJ3e1I9x+YwBEN4QA=;
        b=Zd/Qo+svYx/AucI2rYEsjEmjnTeJqCYLdQR0CVhWEiKvEGuQ7SFsfvkgZVPqmHLEq8
         dc8LzCumB5VgGN9D5TrUYsDFxyxjqOPc8RgxWE5iSaK/fap6e/d9i9W83La2e+dn5iYC
         NtWs0eW0Y46MvBPhMpBawOtUCC4HBMLuae7x7RPDIZFaTC1XV1osVi9qvj0XCRfHWFJT
         lu+1ZVGvvCJ7My9yBr0Sd16FYzT7TqUyYm2amnEHcZOnHyM3b1VyP0GCNl0SqNCTJoz/
         UMVEAINjXasDxwMyIHAE7B/PT67vWLRi1ayioLxZy+sdusUTjuORvi2kQ7oTz5/EvgX4
         UJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713300190; x=1713904990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6DlS4/ZFHRtR1n8rjuKFrNyH2RJ3e1I9x+YwBEN4QA=;
        b=XH9NXILJjPlbI6Z/RsPMn7fnn1xvL37AgIkpovuI6Hv+MXnJnmlihchi6ZVCxSMpST
         ohv+3Ca9yC9QbGBXJ76xisPcGh/OFuLixQMIVVPJfUUKjTjzKEhtBGB2MTLsHB3O3CxA
         cTLS0ZWA9JHAHNdt+ZuzqvLfiPQ8PuuD1F+b07AhvxTEhS5be65V5Vqs+gB7iD745ShV
         3ZmLNMCOrVwYmJYq89+XBAxaAWLnKPHu6ErfYdSX4iiANgDqLjNRIXXMRjEdvnNoC4Zj
         T9Gghd6Wm8XGvtDBy3Pe7pGgt0vUNayMgebx+GuAUUD87hVy60MgnLI06KiB28W0n3s7
         DQLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2RHhdTd86unWb0yulVQr5ArX4pW3tBe3mWQN35vqpUbt+lEXb+qlaCGyR3N0dY3HzP4RQ05WiZO9q2M00RKJvZvPQA9VUtSuGyCJfkuqc
X-Gm-Message-State: AOJu0Yw+caNmwpiZg+dXB9JBZ0+9zI32NVqE5dvK4jGDQcOgkFUOZVRl
	PxbWCjJq6macjI8Sk6O6DIHQvH8A/ZmxQ5Gk2R5loMUko6wNgJ3m5EUepJZrbEU=
X-Google-Smtp-Source: AGHT+IFyoZj5HEINi8NXkextzYF7UARPdxsaF/H0cx3mKUCsmkMsWC93P8slgpGTD9NT7JEfzLALAg==
X-Received: by 2002:a17:902:eccc:b0:1e2:c1fd:7bc9 with SMTP id a12-20020a170902eccc00b001e2c1fd7bc9mr18892761plh.8.1713300190182;
        Tue, 16 Apr 2024 13:43:10 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id lg7-20020a170902fb8700b001e259719a5fsm10208534plb.103.2024.04.16.13.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 13:43:09 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:43:06 -0700
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
Subject: Re: [PATCH v2 02/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Message-ID: <Zh7i2pir0j6tXfPD@ghost>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com>
 <20240416-underwire-bright-b2ab0fa991ec@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416-underwire-bright-b2ab0fa991ec@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_134314_936288_4F25A603 
X-CRM114-Status: GOOD (  21.39  )
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

On Tue, Apr 16, 2024 at 04:16:30PM +0100, Conor Dooley wrote:
> On Mon, Apr 15, 2024 at 09:11:59PM -0700, Charlie Jenkins wrote:
> > The xtheadvector ISA extension is described on the T-Head extension spec
> > Github page [1] at commit 95358cb2cca9.
> > 
> > Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d3
> > 35e03d3134b14133f/xtheadvector.adoc [1]
> 
> This should not be wrapped btw.
> Otherwise,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I don't believe it is wrapped? It appears wrapped in your response but
it appears on lore correctly:

https://lore.kernel.org/lkml/20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com/

- Charlie

> 
> Thanks,
> Conor.
> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 468c646247aa..99d2a9e8c52d 100644
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
> > @@ -484,5 +488,11 @@ properties:
> >              Registers in the AX45MP datasheet.
> >              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >  
> > +        # T-HEAD
> > +        - const: xtheadvector
> > +          description:
> > +            The T-HEAD specific 0.7.1 vector implementation as written in
> > +            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
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
