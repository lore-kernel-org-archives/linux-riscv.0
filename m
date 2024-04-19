Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FEFC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 16:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WcSwV3AA5Yq7ZE1fgDp/eAy8gsHDTlqveOLeKln4IxA=; b=fuW5BETima0UNg
	vOzG+duKIm/TJ1jBY80mAZEqnTm9u65Le5DOwh0ArjB5FnG/Z3dvP7nA2iVazt772Kjs9cEGhnTEx
	6/ndLEPmbYAjXSIOKzkdJRK4a4BfUZwGjarBtj292k5BXUvruqNbApi9nKVSFtj0cXEUCRRW+It3I
	MovttR/fD5k5u/bDbugeV3uzLxOBHADgietQ7Lj7FJ2dmnGO41Wbm6b3kC8JpZNpPlYTovGxYHn9M
	Z0cLV1mBZJqfLfYDJDvBmTvXITxmSgYCx+T2Da5usJI+7SKqQowMWtHSP+ASWBrG3suyPTJdRg8d3
	C9xBrCS8Iwy26aYtDp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxrHV-00000006O5q-0vg5;
	Fri, 19 Apr 2024 16:40:09 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxrHS-00000006O4v-3AwP
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 16:40:08 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-61b2218ab6fso16507417b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713544804; x=1714149604; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BHuuiI/AP3O3oKJTbl0AoPiEMvYpTd1A7t0Ev/LsBaw=;
        b=DkgaOFZrg2hY5F53LE9mUH9FT1S1rlLXV2klp/LfzbbgcpZYsLdo0v7Sab21skfRTh
         GCrJg1C9iR/SKDHPI4n13YMAdc9q/Qg+F/JbSqNKHxv3qebJGDaLh/H+2n5KenMpnhjE
         sEUiNpekHMaX1dpTwUKMf6vX4bNAqIVY3vpb8OW+lMOE8WPTXKkPKJ+IPCQy+5Y4WmMy
         JGYMzAp/EkgHKny7uAhlHjfRlsv9DN630S0czYjnp4wKP0pPREG/y/INfTSqNNafmMuH
         TGc2f5J5mkXSZLUoDT5W1CHajZcjBs9e82iwwY4Eg+WPsjVZ+5C4XL0EpADmfsjn7h9u
         wntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713544804; x=1714149604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHuuiI/AP3O3oKJTbl0AoPiEMvYpTd1A7t0Ev/LsBaw=;
        b=d7czu3/9FMMQjMDoG4t7OfO0UEcx88nnjZSY3JxAuRz4hB0GGFS8WCtg3VL0LzAiII
         tQ5ubIGEirAM3L/iNGTH6NViQjW5iX2Jm/dzYIjzkFZaD4eBKBRMRMvKEPGy5IMbulhC
         N0DABPOXwcrm7oFj71HTVbv5RSMItQzdtdrJQ1OkdSeXtKn+CbLYLWf/BSdDdUoNndeq
         Rls5f57iZ6Z0vL/JvgE9caJVMulXDMF88Gj02C++JUbvl0HdG/50UNaHnSZi55s8oVZ7
         5IPKvEeDlJ2fPFZEIkz5kqMn3ZBhtmFwmPywamP1BHYJMoCeWFTnlNr965ENr+Mu2pfZ
         tzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiSI1QVT2yLJD08T9390dvS9Wr/1T9s6PzPq818LgGzxQEFxxejqbhSxuSSlXskFApn3oilwzvuQXy3fXwIor9oUj01DazWQa4fqaBmksF
X-Gm-Message-State: AOJu0YwkDx30JKXeQN3OIsOPCBDDryYi+1eipbXai+Dw/OQYbeBBE/41
	W/1BPBDnlH2toVoNB+PvACyaJP9O6QsKozzyyCKl8mbmTEqrAUruVRHxfAQx9ss=
X-Google-Smtp-Source: AGHT+IEJrpMfE8+b8zjBescqx1tYiC6d+c3dCk765qSjsA8szvE9daL5UaT7V3lS6jT5vGJhUb2IBA==
X-Received: by 2002:a05:690c:450c:b0:618:8b8a:b4de with SMTP id gt12-20020a05690c450c00b006188b8ab4demr2683625ywb.27.1713544803866;
        Fri, 19 Apr 2024 09:40:03 -0700 (PDT)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id z186-20020a0df0c3000000b006188902e8c1sm842592ywe.28.2024.04.19.09.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 09:40:03 -0700 (PDT)
Date: Fri, 19 Apr 2024 12:40:01 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, anup@brainfault.org,
	atishp@atishpatra.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	christoph.muellner@vrull.eu, heiko@sntech.de,
	David.Laight@aculab.com, parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
Message-ID: <ZiKeYRnXxtLUtkkW@ghost>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud>
 <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240419-disdain-litmus-82874cc4872e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_094006_897245_1E62B99A 
X-CRM114-Status: GOOD (  37.99  )
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

On Fri, Apr 19, 2024 at 04:19:52PM +0100, Conor Dooley wrote:
> On Fri, Apr 19, 2024 at 05:16:05PM +0200, Andrew Jones wrote:
> > On Fri, Apr 19, 2024 at 03:45:46PM +0100, Conor Dooley wrote:
> > > On Fri, Apr 19, 2024 at 03:53:24PM +0200, Andrew Jones wrote:
> > > > Add description for the Zawrs (Wait-on-Reservation-Set) ISA extension
> > > > which was ratified in commit 98918c844281 of riscv-isa-manual.
> > > > 
> > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > ---
> > > >  .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > index 468c646247aa..584da2f539e5 100644
> > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > @@ -177,6 +177,18 @@ properties:
> > > >              is supported as ratified at commit 5059e0ca641c ("update to
> > > >              ratified") of the riscv-zacas.
> > > >  
> > > > +        - const: zawrs
> > > > +          description: |
> > > > +            The Zawrs extension for entering a low-power state or for trapping
> > > > +            to a hypervisor while waiting on a store to a memory location, as
> > > > +            ratified in commit 98918c844281 ("Merge pull request #1217 from
> > > > +            riscv/zawrs") of riscv-isa-manual.
> > > 
> > > This part is fine...
> > > 
> > > 
> > > > Linux assumes that WRS.NTO will
> > > > +            either always eventually terminate the stall due to the reservation
> > > > +            set becoming invalid, implementation-specific other reasons, or
> > > > +            because a higher privilege level has configured it to cause an
> > > > +            illegal instruction exception after an implementation-specific
> > > > +            bounded time limit.
> > > 
> > > ...but I don't like this bit. The binding should just describe what the
> > > property means for the hardware, not discuss specifics about a
> > > particular OS.
> > > 
> > > And with my dt-bindings hat off and my kernel hat on, I think that if we
> > > want to have more specific requirements than the extension provides we
> > > either need to a) document that zawrs means that it will always
> > > terminate or b) additionally document a "zawrs-always-terminates" that
> > > has that meaning and look for it to enable the behaviour.
> > 
> > IIUC, the text above mostly just needs to remove 'Linux assumes' in order
> > to provide what we want for (a)? I'm not sure about (b). If Zawrs is
> > unusable as is, then we should probably just go back to the specs and get
> > a new standard extension name for a new version which includes the changes
> > we need.
> 
> An (official) new name for the behaviour that you actually want, especially
> if the patchset sent the other day does not have the more stringent
> requirement (I won't even pretend to understand Zawrs well enough to know
> whether it does or not), sounds like the ideal outcome. That way you're
> also sorted on the ACPI side.

What would be the purpose of a vendor implementing WRS.NTO (and putting
it in the DT) that never terminates? The spec says "Then a subsequent
WRS.NTO instruction would cause the hart to temporarily stall execution
in a low- power state until a store occurs to the reservation set or an
interrupt is observed." Why is this wording for WRS.NTO not sufficient
to assume that an implementation of this instruction would eventually
terminate?

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
