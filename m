Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 526F7C04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 02:31:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FA9B2082B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 02:31:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V2H9NAn2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Etj0mYAw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FA9B2082B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZeHk6AuMddKKQSxzO3bidmS1Q5FL6S4gfunvEpV7kQ=; b=V2H9NAn2bqfhRi
	g5dhRHJVmUN3gA0ZLaLPXTWVBBYWjQSixGVx5AzEgFAX+lacDTH2tPO9P2t8/9FWmcfr9DXKVwBdh
	q7BfOt5gukMuGGX4IfSN/EZkVnBBRaYcLBFyI+r5d7WJBOAbov6J1YtfrZ152gRll2LxogleVMDkK
	ymfIUmWqxY7XSsgj0H/4E7yI5LMpC5mUQBs8vkR7v5UFalc+Of8iebRgFS7f/kiIuYgmiPuv7C9cp
	haqU97m75HJ656Z8jYHSdkOHrlGrPOyKjwhvppWoI3f17yxYWFI6COpxUcux+70oKV4t7wGcgBcEh
	s2UiwwCyoSlvld1HvW1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUjRQ-0007yV-Is; Thu, 06 Dec 2018 02:31:04 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUjRK-0007wq-0Z
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 02:31:03 +0000
Received: by mail-yb1-xb42.google.com with SMTP id x144so5789978ybg.10
 for <linux-riscv@lists.infradead.org>; Wed, 05 Dec 2018 18:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=zC2S0O8x2BqWz4XPnEW4Ujvl3xqsv0EQz+TgQBAGvqQ=;
 b=Etj0mYAwVdBYrcofq7zlhfWwMYxhR27yRzX0cBNo0gdVyU2pi1xDziRB8gdXpG8/5T
 OdGgjt0dC7/OtfyXcbQVCjpeOwIi7lRgTtscFT1P0sLVW0V2t6PZ7MXplrW2eee2xg7a
 dkjmZvYtI5hRzVppALjkx5MM/6IiOt7Di/v8ejmXTyT93Fewskg8o4ipQSi4PXD28DGd
 pzKVJIfO9ku1Eso27+iaLAx8ysjtjd93Wb68joEgSNEawcdmu+zuLMDyRIzOlXzMSAJV
 AoHpAK0AEN/n/fnFEFYrAsaU2v5ZElOh4NUke/dEs2y5QhfgMD5RxonJMQtaOCG9Z9L2
 HBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=zC2S0O8x2BqWz4XPnEW4Ujvl3xqsv0EQz+TgQBAGvqQ=;
 b=Z3Nej0f1pZLSzDd8m5MLKEGGrM1Y1zykpqaHEhafoTldPNxLwwNHzr19KDmgdGLJf/
 Y0+URg2XIcGnZtOEpPEglbC7LFilFC5W2GKRH6m/Vj4h7K5YaTa8Zy1XvypRpP02Gkdb
 /gKoDKy0pKxmRdWbooWBIjf8wTwOzl7tA3+xadtZH2NLuFxMWYfpQy6Y0siqV6bz236V
 8adUjpNM5JV1ASvWG+Kg1DnwCMMp6T+ujUbmT4OnOo6N5+j2YcxfJyHi1m8VQBWO0lzL
 qymNKfjtLrsyl4bQzrwhK/CMEL8gpbkTHkTw4aSy7KRz9awskSD85hwGUBNiUjgcVsw7
 DPLA==
X-Gm-Message-State: AA+aEWbQtw7zVIDkErJpOD633426rLAgE0iDoQ6zBRxceoT07AeP2aCq
 UCm9ryucAs8zYgkOt0e0MPBy+Q==
X-Google-Smtp-Source: AFSGD/XcxfBMFrH+0mgfQpJ9Qmc09m/hfdAIEMJLv+SvslB7cNNw5+7d+QRT4wGK1co3Kky6spXZSQ==
X-Received: by 2002:a81:a109:: with SMTP id y9mr26779268ywg.269.1544063446990; 
 Wed, 05 Dec 2018 18:30:46 -0800 (PST)
Received: from localhost ([208.115.86.73])
 by smtp.gmail.com with ESMTPSA id w77sm9229093ywa.9.2018.12.05.18.30.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Dec 2018 18:30:46 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Wed, 5 Dec 2018 18:30:45 -0800 (PST)
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
In-Reply-To: <eda63b4a-4371-7d34-38a0-d7136dfc417f@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1812051829540.16511@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
 <eda63b4a-4371-7d34-38a0-d7136dfc417f@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181205_183059_073550_BB6AFAE9 
X-CRM114-Status: GOOD (  26.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "paul@pwsan.com" <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>,
 Megan Wachs <megan@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

On Wed, 21 Nov 2018, Atish Patra wrote:

> On 11/21/18 5:07 PM, Paul Walmsley wrote:
> > 
> > For IP blocks that are generated from the public, open-source
> > sifive-blocks repository, describe the version numbering policy
> > that its maintainers intend to use, upon request from Rob
> > Herring <robh@kernel.org>.
> > 
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Palmer Dabbelt <palmer@sifive.com>
> > Cc: Megan Wachs <megan@sifive.com>
> > Cc: Wesley Terpstra <wesley@sifive.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-riscv@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > Signed-off-by: Paul Walmsley <paul@pwsan.com>
> > ---
> > 
> > Hi Rob, please let me know if this document works with your
> > requirements, or if some changes are needed.  - Paul
> > 
> >   .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
> >   1 file changed, 38 insertions(+)
> >   create mode 100644
> > Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> > b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> > new file mode 100644
> > index 000000000000..b899e5c6e00c
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> 
> It should be be under
> Documentation/devicetree/bindings/riscv/sifive/sifive-blocks-ip-versioning.txt
> ?

These IP blocks could be used with any CPU architecture - ARM, x86, MIPS, 
etc. - so it probably makes sense just to keep them under sifive/, rather 
than associating them with a specific CPU architecture.

> > @@ -0,0 +1,38 @@
> > +DT compatible string versioning for SiFive open-source IP blocks
> > +
> > +This document describes the version specification for DT "compatible"
> > +strings for open-source SiFive IP blocks.  HDL for these IP blocks
> > +can be found in this public repository:
> > +
> > +https://github.com/sifive/sifive-blocks
> > +
> > +IP block-specific DT compatible strings are contained within the HDL,
> > +in the form "sifive,<ip-block-name><integer version number>".
> > +
> > +An example is "sifive,uart0" from:
> > +
> > +https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43
> > +
> > +Until these IP blocks (or IP integration) support version
> > +autodiscovery, the maintainers of these IP blocks intend to increment
> 
> /s/autodiscovery/auto discovery

I've changed it to "auto-discovery" per your request.  Let me know if it's 
not OK for you

> > +the suffixed number in the compatible string whenever the software
> > +interface to these IP blocks changes, or when the functionality of the
> > +underlying IP blocks changes in a way that software should be aware of.
> > +
> > +Driver developers can use compatible string "match" values such as
> > +"sifive,uart0" to indicate that their driver is compatible with the
> > +register interface and functionality associated with the relevant
> > +upstream sifive-blocks commits.  It is expected that most drivers will
> > +match on these IP block-specific compatible strings.
> > +
> > +DT data authors, when writing data for a particular SoC, should
> > +continue to specify an SoC-specific compatible string value, such as
> > +"sifive,fu540-c000-uart".  This way, if SoC-specific
> > +integration-specific bug fixes or workarounds are needed, the kernel
> > +or other system software can match on this string to apply them.  The
> > +IP block-specific compatible string (such as "sifive,uart0") should
> > +then be specified as a subsequent value.
> > +
> > +An example of this style:
> > +
> > +    compatible = "sifive,fu540-c000-uart", "sifive,uart0";
> > 
> 
> Just for the sake of completion, should this document also specify what should
> be the style of any possible closed IP as well?


Let's handle those separately, as Palmer discussed.

Thanks for the review,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
