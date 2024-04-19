Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD309C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5YkyPYestlc9YsJcX/CgQ9bDWyQYOQSKd7pQRfHFG0=; b=oweRxdAZoyzCRb
	hAS4hKckyzh11kkEVeBTSiTZ0sOeVwVqlYKrlKAfSkDu/ung0o5+DcX7o+U9oiQBzmVuUQc2ZJJ5d
	P8UI6qjOsc63TX3hibRcq4ezGvNr9vd912fTcVw6EKLhGSEEOq8bBq+6Ome7wf+fc+z/Fx2iA3/nz
	H8kmlezRYa+1ULOifUrG25sk9NRyJpnfcTDXoPpvfZNfLxiNtMhOWX2RqwtVmd/UqkUHwzrci7fPM
	kSD3NCVx9X32sXMY55bzHTRww2n1sMA12T1sXqeBkgSsUW6YaPSnau1BbMYTuOfELN1IIZ41wZHl5
	1AlG77r4cSChB2hTbmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpyG-00000006769-21LV;
	Fri, 19 Apr 2024 15:16:12 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpyD-0000000674r-34Mj
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 15:16:11 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5709cb80b03so2698498a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 08:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713539767; x=1714144567; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u6YucdO4K8yZi5V+dQEJqXTSFfZz3kMPmJRccLrDNog=;
        b=Dpf4SGf3bPLC6z1Oywma3lO00OABIdBFGUIpi+QUJaBZyNrpubfKheHiMBTB4RYQfd
         +aJ3tvAZafsysdjm9hrJ/RMTxfDwYuIQuHAw5Z77JMuBn69Cy8BnjGLad1QkPb8q/PhS
         OFZ9Nf4Wou7wtLINUkPfGB6MQqKdn6ce6cSJ9GvgtH3S7BqRynn611bAGtLRXMZvpLYp
         4omFbXHGhCXhsQ17QCrcZaXvx6QtjCYAVpdzgyYzGQOMvVluuY2jQ4/gR/6v+A57ZsVL
         YFUdAmLUJMsNreSimkEAndJ36E0EI6eyb++oF8DKbv2F9sxJGfkSWwWg189p7OkU+vDm
         QkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713539767; x=1714144567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6YucdO4K8yZi5V+dQEJqXTSFfZz3kMPmJRccLrDNog=;
        b=Vuz1sNA6Rsx0Pl+zvwAuiX+s16qpfOpYgFqKak+MK/KBK/mLwZF0eeq9FtbZ8OT/F5
         ZkUYZtk/gnkYPbovYOhb/xPT6t36aK+DO6MU1LSs2m5qQGP51xhcWRepnKask1HsUQ4Q
         hR6z0zmrglqzO9Ihtl9rrYmwOiwtMZgqjrh8rc4ttG6wTwcq/1NaBwRvYaJqgjH7ZXw8
         3sYzsgwCGNEQsPvgCTWlHisBNTZYGmcxjtjsmqTZpvsywiZ87bLUoSFjS8xzD/h8DAoQ
         1etLYEfmIHjnpZB5IHjatjVg4rN1ytJQKvKVvkTftOUJcSD3kzH9+A8S/pgGFNR0qth6
         Y/rQ==
X-Gm-Message-State: AOJu0Yx66Bm6FFBgpo9Px+w2Qdzadb9q7W5ofzWv5WcIxnhCT7LL9OWp
	S4yd8F1xaaEANYXcHW3PljME2Kw3Qp2imgP8Nvrf6kDj1QUD+BfqEnHZHdysUZw=
X-Google-Smtp-Source: AGHT+IHWUy4L5O6lQOo4wGH3aAUFprY7PTwgE+/Ra0Yf532QkMea1q+/O3Qe16MpYhG4dHCa5bUKrA==
X-Received: by 2002:a50:8d0f:0:b0:56e:230c:d686 with SMTP id s15-20020a508d0f000000b0056e230cd686mr1757366eds.36.1713539766857;
        Fri, 19 Apr 2024 08:16:06 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l10-20020a056402124a00b00571bec923bcsm1948242edw.93.2024.04.19.08.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:16:06 -0700 (PDT)
Date: Fri, 19 Apr 2024 17:16:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, conor.dooley@microchip.com, anup@brainfault.org, 
	atishp@atishpatra.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, christoph.muellner@vrull.eu, heiko@sntech.de, 
	charlie@rivosinc.com, David.Laight@aculab.com, parri.andrea@gmail.com, 
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
Message-ID: <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240419-chafe-leotard-e5daee19b1c8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_081609_801137_1DC2FBCC 
X-CRM114-Status: GOOD (  28.27  )
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

On Fri, Apr 19, 2024 at 03:45:46PM +0100, Conor Dooley wrote:
> On Fri, Apr 19, 2024 at 03:53:24PM +0200, Andrew Jones wrote:
> > Add description for the Zawrs (Wait-on-Reservation-Set) ISA extension
> > which was ratified in commit 98918c844281 of riscv-isa-manual.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 468c646247aa..584da2f539e5 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -177,6 +177,18 @@ properties:
> >              is supported as ratified at commit 5059e0ca641c ("update to
> >              ratified") of the riscv-zacas.
> >  
> > +        - const: zawrs
> > +          description: |
> > +            The Zawrs extension for entering a low-power state or for trapping
> > +            to a hypervisor while waiting on a store to a memory location, as
> > +            ratified in commit 98918c844281 ("Merge pull request #1217 from
> > +            riscv/zawrs") of riscv-isa-manual.
> 
> This part is fine...
> 
> 
> > Linux assumes that WRS.NTO will
> > +            either always eventually terminate the stall due to the reservation
> > +            set becoming invalid, implementation-specific other reasons, or
> > +            because a higher privilege level has configured it to cause an
> > +            illegal instruction exception after an implementation-specific
> > +            bounded time limit.
> 
> ...but I don't like this bit. The binding should just describe what the
> property means for the hardware, not discuss specifics about a
> particular OS.
> 
> And with my dt-bindings hat off and my kernel hat on, I think that if we
> want to have more specific requirements than the extension provides we
> either need to a) document that zawrs means that it will always
> terminate or b) additionally document a "zawrs-always-terminates" that
> has that meaning and look for it to enable the behaviour.

IIUC, the text above mostly just needs to remove 'Linux assumes' in order
to provide what we want for (a)? I'm not sure about (b). If Zawrs is
unusable as is, then we should probably just go back to the specs and get
a new standard extension name for a new version which includes the changes
we need.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
