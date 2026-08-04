Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C64C55172
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 08:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72IDl8GGFGISAV9R7l7ssoFpTcXYM+VN3BHxfQLz//M=; b=tHw+mDxZUod2yR
	+V8OfKoxu28U5C+efWmCU1x9rx6WDfZm3a7Uf9L/xEfbbAL0DRen2cp7q2sGURQsB98yUSVVMQqWS
	bJWq+NjKCIrlxcTNBbd9x2jx4POCPeoz/DZAj4bE4ATQJamBS9D5e16Mu/uTf9Hx7nHS5CE/7/JsE
	J0N5kckshWBesQej7G5JwbrBymPH5CZxeqr8yvBitVpO7K8DvPnRL+CZU/wcyVNmis73rAyaqYWrz
	S6g5ZkifeOhhtVg9SPtTyRHfO93zrkv3njupNEGshuLx/mu/2RU0vJv1dojnNN72IqWbdxvwUoZUD
	Vm2/nXiBqa9jzNDFoNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrASx-00000001L1P-0CTA;
	Tue, 04 Aug 2026 08:25:39 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrASu-00000001L0p-3PrF
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 08:25:38 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ced3386430so43185535ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2026 01:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785831936; x=1786436736; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5pIRJZIZuQtpYpVv500fQ7C7fCRBLkrhOWthKpIbWoU=;
        b=dsv8NjnpwCJz7uNHV0uzOxte+VfrI75fAU6fE0KZ0u7t4BZpk53gK9YTJlnJZN5uiS
         zLF2Q8gV04st+3Tvxg2zzQmykK2+F063EzLBuweTDzM9j/6Kd4/IbjqC1AbEKXuhbHA4
         7ScWbtF8rN74Lbsus7ibMJJgE0bo/mh2kY1v/DIHKpE/IgSJnHgq8/Y8IqAEQbwHKB8O
         UHXi7UxeACpNbzJPPCfYHqmVPMpF+vckB3hU6Il5YkvAJUXUxwEIHDK6e0Rnb9NXubm8
         ZNiFR9Hi4V5Jmri5Ji94lUJ7aXvHiPVxDHc3mdISRY4AUcAvHoNgZcKV3HuDRysPFGAl
         IUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785831936; x=1786436736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pIRJZIZuQtpYpVv500fQ7C7fCRBLkrhOWthKpIbWoU=;
        b=gQFcnsMXMdYyYE7/5dGCUQmW2DLxtaTl8vJ7v2g7aE8d+1bYqy9xjaMmYNqzZUiCzU
         VFqnYVNejMv8HRC292joHr2mnOLGsfMirIMvvt7oVLt4NAAMl5xbpFEyJIy3+vMkILQE
         ktLBk9mG14RJqWGd4GBoi9YFTxilYmPa2RDKGsNlKCCsP3WdvlGcNpRI31KMoQ0594nG
         Zn5gmTrbd9fjANz3dp0FlXmNFzKZ5IXXUjLXG9wfe4biqVwTzQVE5BXmIB9d+96LTRGG
         uPV/4MQuzt4iS2mrUqoMldP2N+9ltjwsJ124Ym9OK5eBVheiHrS2qyTl9KjC/wfsyCaH
         puKw==
X-Forwarded-Encrypted: i=1; AHgh+RrzeOFRTMWf0yIsnuFQ40IZwBXr7EJx4246aEBLLjyCNRhOW1NkIIucj1Pc/KOh4QX6tQ0LInV25cWnZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbG3lL1WZoqr208CFytMqLVA7J4jWNTJz4/x74YxEM5wK2Wu9o
	NZxPtHCMCweyiKS7lDs6QrRGw7Y002+ZLSBXGUe5TRWl5C6pmXgHkuie/eMfgD5Mnyo=
X-Gm-Gg: AR+sD124/Oyp2sVY4hlonkkDbyDUojCLfi1E2BoiG+rRAwuKNwJvcrfv7bFRTAIGpbR
	RyS0ghx3/rW/qHVC5sEPAFxX/qGqw55a2CHn+z9dTLcGZNHBnpiqyxnBM/Dos9CgUlWs/HFohsc
	kMC4zTJ1scds4gapv5ln+il7TKk3K4L6Hhq7fIUIn+d1N8EwzZDcPYpelY2U4UqgaQJqEO47NPi
	VT6bCPiMII+AzwGXq7k3p1Rakwt9J0EpN04kld/6mN0doxK5v5wrf+Rmkniw3TaobdHQLOgTPnp
	sQk8fh6RzGm5Cn7eeYEADD6jHU+79lUx3ZbZDxOqa6HeeqJHJhL37A3dHVsL+3/hNU8/cVA9Vbu
	3wisUuT6wgAyDFtT3b4mP/xhCyGG8qCMLLQWqEE/R3xSsnYBEQAotPsa2umFhwzIeFdXGGyOoyj
	HOMM0hd2Nz4bN5bN8ufKNO5W0xlClGNh6WT4/q6zPPL1fpXFIM64jHvpM9C6k=
X-Received: by 2002:a17:903:124c:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2d0523b7dbamr119193075ad.28.1785831935707;
        Tue, 04 Aug 2026 01:25:35 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4930e1sm2426415ad.41.2026.08.04.01.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:25:35 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:25:29 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr
Subject: Re: [PATCH v2 0/3] dt-bindings: riscv: Add RISC-V Worlds and SiFive
 WorldGuard DT bindings
Message-ID: <anGh+dr/5dCX/cHd@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <bf39e87c-c077-4ccf-a791-42ae194b4780@ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf39e87c-c077-4ccf-a791-42ae194b4780@ics.forth.gr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_012536_865800_155A196C 
X-CRM114-Status: GOOD (  23.14  )
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

Hi Nick,

Thanks for the questions.

On Fri, Jul 31, 2026 at 04:43:56AM +0300, Nick Kossifidis wrote:
> Hello Peter,
> 
> On 7/29/26 19:39, Yu-Chien Peter Lin wrote:
> > Add device tree bindings for RISC-V Worlds, a standard extension that tags
> > every transaction with a World ID for fine-grained isolation. SiFive's
> > WorldGuard Checker is a hardware firewall in the system interconnect that
> > inspects transaction WIDs and enforces per-World access policies on memory
> > and MMIO devices.
> > 
> > wgChecker specification reference:
> > https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
> > 
> > Yu-Chien Peter Lin (3):
> >    dt-bindings: riscv: Add Worlds ISA extensions
> >    dt-bindings: riscv: Add Worlds per-hart properties
> >    dt-bindings: sifive: Add WorldGuard Checker
> > 
> >   .../devicetree/bindings/riscv/cpus.yaml       |  61 +++
> >   .../devicetree/bindings/riscv/extensions.yaml |  53 +++
> >   .../devicetree/bindings/riscv/worlds.yaml     |  86 +++++
> >   .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
> >   4 files changed, 556 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
> >   create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> > 
> 
> What's the plan for this and why do we need Linux-specific dt bindings ?
> This looks more like a set of firmware specific bindings, like OpenSBI
> domains for example (https://github.com/riscv-software-src/opensbi/blob/master/docs/domain_support.md).
> I understand adding the ISA extensions in the list (although the fast track
> is still underway, it's not ratified yet), but the rest don't make sense,
> not yet at least. How do you plan to use pmlwidlist on Linux to associate
> processes to wids ? Do you plan on adding a driver for the wg checker (and
> the markers that you mention) on Linux ? Do you ever expect Linux to run
> under trustedwid ?

We do not currently plan to implement a wgChecker driver in
the Linux kernel which holds the untrusted WID; wgChecker slot
configuration is handled by OpenSBI only at boot-time.

The intention here is providing a standardized device-tree format
for describing wgChecker hardware and protection policy, usable
consistently across Linux ecosystem (OpenSBI and possibly OP-TEE).

Thanks,
Peter Lin

> 
> Regards,
> Nick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
