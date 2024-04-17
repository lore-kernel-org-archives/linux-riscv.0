Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8EDC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 22:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5y3dlLemnBcAvACaTpefVg7TNQvVR1gXBdJ+lEpF20=; b=Wpi/Ci/xJo2f5G
	4R/jUcbxzjsiTaYlcWLc1mbAO1RJl9wMdsdTldFYfQzhacHy6mSb82DOZ2PsBn1SR19QLU/9aOe7v
	mtv9+SuXHR4JWu8th0A5oPVG2pWM+DgMsjw4ZBW+NkKLbapGSe7+gc8z8tzM0LxtaZG5H7sTtsTfc
	bXTb2TGywFRZfkJwNNcLu46lCLtDVeNsqbtwBX22l5jLGlsxrosCPGL6hBOiIg4l/6Dk2Hhc5LfmK
	a6DkkmgSj4Sq2As8U0bmqJhgw4YbW8FQrW74O+G7zA5Yx4fNvkV87d7MvDcKk0Dc7kvRs+saPYjPK
	BRXxHMXvfFLRzEfES9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxE7q-00000000EuQ-3HJV;
	Wed, 17 Apr 2024 22:51:34 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxE7n-00000000Et6-1s1X
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 22:51:33 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e411e339b8so2244295ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2024 15:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713394288; x=1713999088; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTSo6mWPNg3MYfgUA4f7wbCrE3rgzEA/5uO9sngH9Ec=;
        b=PeJWkZIvmsZJ3n6iETIS41zOoPcYCFgs5MOwNjwUAptKg0cuGrby7cYTlG3TckbqfF
         pFAM1IqX3h/P+ouvWsPX/rxalPL/Eyqy/LgE8MSqTEA1BBJLL6bchPSWRrjbWw9KwE05
         vaaabXMoj6rj1nqs7RdFoHLxrn2z61vQhbHpNWkhPCgHH3a5ic13BxpXat+/Fb0XLk1x
         vi5S7/iSkReCEWxKGS88dAvZnGmNvrHpeHUpeyldO5CzjdGiHJDi/Ml2gtfV11u0I+ET
         NQ6DIvRNdkrxdzPDPwncMvCjn/0uTufA9L2I0ZgO0dI0CpXAIXHFhrAoObfZB8+JE3TL
         4rAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713394288; x=1713999088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTSo6mWPNg3MYfgUA4f7wbCrE3rgzEA/5uO9sngH9Ec=;
        b=rk4siRxbSSfg4N8MkHObeERE10QYzNGActjX239tydqnM2+FXvp/f/LsIMUMglh2eF
         6y8kPDOeH3s1NzaQHk5tGwqkNC1Ml+aeoDjn5+9JMk8fWAQITGqwdrLr58SzAt13D9Hf
         I67d/Ur8sqz5QUTsiJoz4gDGMWkLLnUDMhkPV8wX/vDujR42jBA2f0mJbuwxMqdMIfyr
         vH0MGpbclK6vX4vJEBqoj1DtxOnEcga0kFVb5qhHthgiMF4QNjEtYeb9wzaWnVYeXO2K
         VtlPEtmaoqZh/RJjLOiBGbMPPGF/9He8GkCEeITl5jkyYE+D3REKCSW9s5Uetmx2tSE0
         0xjA==
X-Forwarded-Encrypted: i=1; AJvYcCUmWVOBA9fvAAdTJfYHhfUCX3RFU4OGsoxiuEGcamBl+nQHE013AeodqUhQwW40umo58mkSPhfe+BnZyaPRd56ImnY1yv/aHHVao3V2Nqal
X-Gm-Message-State: AOJu0YzCtj6qLGb69pj9lInec6noGNcA7kaEQavxYP9+OG7bPhWK29fb
	yPWcEHhRV2pKUWd/3F5F7FWalPPvALf/wGBuOKSuR0Ypjs9OiWjZYI32Rp5hGMA=
X-Google-Smtp-Source: AGHT+IHrFjHxUYakHuwCu0KxAXJxMjlVzPR4wDunk8LV/EImWNwQf6hbQbYi/IvWQK0xsqjlBoez7Q==
X-Received: by 2002:a17:902:76c9:b0:1e5:3d8a:75fd with SMTP id j9-20020a17090276c900b001e53d8a75fdmr859944plt.69.1713394288489;
        Wed, 17 Apr 2024 15:51:28 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001e45572a253sm172327plb.14.2024.04.17.15.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 15:51:27 -0700 (PDT)
Date: Wed, 17 Apr 2024 15:51:24 -0700
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
Message-ID: <ZiBSbETx++uIIknH@ghost>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com>
 <20240416-underwire-bright-b2ab0fa991ec@spud>
 <Zh7i2pir0j6tXfPD@ghost>
 <20240416-budget-cause-c4002a9cc05b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416-budget-cause-c4002a9cc05b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_155131_516570_34F9ACD8 
X-CRM114-Status: GOOD (  16.37  )
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

On Tue, Apr 16, 2024 at 10:10:39PM +0100, Conor Dooley wrote:
> On Tue, Apr 16, 2024 at 01:43:06PM -0700, Charlie Jenkins wrote:
> > On Tue, Apr 16, 2024 at 04:16:30PM +0100, Conor Dooley wrote:
> > > On Mon, Apr 15, 2024 at 09:11:59PM -0700, Charlie Jenkins wrote:
> > > > The xtheadvector ISA extension is described on the T-Head extension spec
> > > > Github page [1] at commit 95358cb2cca9.
> > > > 
> > > > Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d3
> > > > 35e03d3134b14133f/xtheadvector.adoc [1]
> > > 
> > > This should not be wrapped btw.
> > > Otherwise,
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > I don't believe it is wrapped? It appears wrapped in your response but
> > it appears on lore correctly:
> > 
> > https://lore.kernel.org/lkml/20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com/
> 
> IDK man, looks wrapped on lore too. The other copy of the same link
> isn't wrapped & I've never had mutt wrap stuff like this before.

Oops, I was looking at the second one and not the one in the commit message...

Thanks.

- Charlie



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
