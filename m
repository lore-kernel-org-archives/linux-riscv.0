Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B52EC44507
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=704/gyVm9/Y/FJUJoO1/E65wm49KS5oSUI0YKKvdoS0=; b=PFU570AImrGWkc
	0Bi0szyV1mi5t8mzdeGcsSdjXX+gjox0wLHyidDHOYJpWFNVpgPcPysX0iioO/WVkoyz1jmWnbxrI
	0luYem8gCa2c1iSEbLXK/CoIlH87CSczeKo16HQ+QIu/FjlcQS3bsG4pdWpiGCuwyOal3Jx4NPuMl
	Y7lINgDrtwRyf09iz2hf9P9mVzw3bZm5Z3ISVDTiZRaY6Jf8h4A38rag2BiNq/vye/eM8lFOTDgJN
	6m11ufN9gZlRB/4ZrGTo4OEoHOcg4z8X5gARTVD9cHbXa0kjfBV+bEBD/8eF6cbzyNcFI7gONjAH4
	8GtbzYD3N1phOL8HCqbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfzA-000000020XD-3rGE;
	Fri, 17 Jul 2026 10:40:04 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfz7-000000020Vw-2u1A
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 10:40:02 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cee9b74ee1so41731035ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 03:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784284801; x=1784889601; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=96R5fXs7tEdkAuUM/Lc10ei+v25C9Sc1yLyFN1koBqw=;
        b=TwV60u0k64KLXEGdrET1YltM88x/aCVr41vU4Kao42rkPx1ux7UbDCH3ROjQ9f30xt
         KeDWjQdzqJ8iDH46rQlBLE2etEHAgRv/D5zqKrp2DRVj+5A5rsPjoH/xtLnKlSNk4kUu
         NCkGfPS2EEjT7Ho5JNYJFdp4TDgN2cUyYyb09AlG6LGv44iV3ubQ21XpegQnMGzaxhNW
         KHMsCCZ5VvaGUN8HwEaUxos4TjQItYPy49WSPQrhMgZ/w2ExKupJgHEvXF3etN6UzzW4
         z0oGnIUn4jAUr+3sKaHcj+CCeMY9FW5rlRA/DxLcw/9pU/hrtRLWIMB1ELDqsLv9krBQ
         qz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284801; x=1784889601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96R5fXs7tEdkAuUM/Lc10ei+v25C9Sc1yLyFN1koBqw=;
        b=pNZV226wEDUx4mmP/uHEzhfzYqs+kubgR8k7UVsQqjd7k3JM3/+MvSHrdOjkPa9ljp
         F0eC2cyTNszv8u6bn9OEQNU6aez1ZQkkWYtTHrc3Jb0ZIMXBQYLIKzPYDliZAJS1GA4A
         e/u2c35op66JZLZTnTDi1QuCU4XvPiJkszySlTHE0aaxKYgn1guiR773zuJQO6FcPca2
         NBXowGUAM+lJfYcXyndLaZlVmav9Eg6wApyrfazC0ppFMsRLQvEMVmxIwuOa8V1K2bjM
         EQi1Ey3yRH0G4c7idnEkTEeYSHBEt7AYyFEiUOKKK/6vw78VcWFcuk2vly6WY6h1PVNd
         5J3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrMwb31fnNq+iTnzjK9IoCryD39UTGxXn3rvyAIdlcaCx2DvcHYLPX49C+Ak4jMoqvG+dqd9DRjLM96yQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCUaRsOlN2SgGt6X0hi5FAWxFaBEUWV/uMIoJh8wa9iHa44nCD
	H4Ut4pfVx49MRHVKEBX6pqkNlamHByQFU9wUG7uvDNlzr+Ei4tAVHJMflk+ESrMIVMR+EnRuooC
	A6ebtoIwm0g==
X-Gm-Gg: AfdE7cl5lRxJiaJ1nunjr0nPCKZLC700dFdMVCYm5sZ1xqn833Q/M5eIj0zkXZzPFgi
	XeKbE9ccFVcimQ4wbPxRB+lX3LYgXMkYCcl55NouZwed34M5BEAPlyziS7x+lVyReNqKfUI8PbP
	DNlHhmFqmQEgthPuMX9yZCZQqw6bJS6MUTFOc4ePX8UySIvCvuq0H0ESSMsW7S02mqXzr97koal
	+zMuKpd/7DTF8KQg7jroza/266sVHLdaJ00isYV29wmmHUdsHwvgeAjl6Fco154k+XQlwvYJ405
	wO+zr0Ho54kaswVR13Zs0iVoQOMfFAsHj2lLsm89nXVRxm/CTdVGEV5eJqXsA9FO9NMSQDkVQk4
	BHWiCfQ3A2oFlwPY52YOmqsGdV1402nI8VWJ/A6k63lFEcGH7RKu2qijO/Aap6/tTLX8XnCY/AQ
	IU
X-Received: by 2002:a17:902:f705:b0:2ca:f16c:87b3 with SMTP id d9443c01a7336-2cf348bc566mr21191395ad.19.1784284800621;
        Fri, 17 Jul 2026 03:40:00 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34743105sm8286085ad.69.2026.07.17.03.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:39:59 -0700 (PDT)
Date: Fri, 17 Jul 2026 18:39:51 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	pawandeep.oza@oss.qualcomm.com
Subject: Re: [RFC PATCH 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties
Message-ID: <aloGd39fAlev7+4p@plin-1878>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
 <20260622-profanity-herbs-1cc1bcf6206f@spud>
 <aj5m00m4KxRAPAnB@plin-1878>
 <20260626-chitchat-purity-33af51f88380@spud>
 <akOkXpPi46LBHuIA@plin-1878>
 <20260630-frisk-excavate-7d562df75585@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260630-frisk-excavate-7d562df75585@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_034001_755131_BCF0F12C 
X-CRM114-Status: GOOD (  48.94  )
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

Hi Conor,

On Tue, Jun 30, 2026 at 07:06:14PM +0100, Conor Dooley wrote:
> On Tue, Jun 30, 2026 at 07:11:26PM +0800, Yu-Chien Peter Lin wrote:
> > Hi Conor,
> > 
> > On Fri, Jun 26, 2026 at 03:36:38PM +0100, Conor Dooley wrote:
> > > On Fri, Jun 26, 2026 at 07:47:31PM +0800, Yu-Chien Peter Lin wrote:
> > > > Hi Conor,
> > > > 
> > > > On Mon, Jun 22, 2026 at 06:12:47PM +0100, Conor Dooley wrote:
> > > > > On Fri, Jun 19, 2026 at 06:58:33PM +0800, Yu-Chien Peter Lin wrote:
> > > > > > Add per-hart DT properties for RISC-V Worlds architecture:
> > > > > > riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> > > > > > platform-defined values are primarily used by M-mode firmware
> > > > > > to configure World ID CSRs and restrict WID usage across
> > > > > > privilege levels.
> > > > > > 
> > > > > > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
> > > > > >  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
> > > > > >  2 files changed, 98 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > index 5feeb2203050..4b5778b6d3e7 100644
> > > > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > @@ -26,6 +26,7 @@ description: |
> > > > > >  allOf:
> > > > > >    - $ref: /schemas/cpu.yaml#
> > > > > >    - $ref: extensions.yaml
> > > > > > +  - $ref: worlds.yaml
> > > > > >    - if:
> > > > > >        not:
> > > > > >          properties:
> > > > > > @@ -120,11 +121,31 @@ properties:
> > > > > >        thead systems where the vector register length is not identical on all harts, or
> > > > > >        the vlenb CSR is not available.
> > > > > >  
> > > > > > +  riscv,pmwid:
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > +    description:
> > > > > > +      Platform-defined M-mode World ID (WID) assigned to this hart.
> > > > > > +    minimum: 0
> > > > > > +    maximum: 63
> > > > > > +
> > > > > > +  riscv,pmwidlist:
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint64
> > > > > > +    description:
> > > > > > +      Platform-defined bitmap of M-mode World IDs (WIDs) that this hart may use.
> > > > > 
> > > > > I don't understand what the difference is between this property and the
> > > > > one before it are.
> > > > > Is this one meant to be used by m-mode software to then select one which
> > > > > will appear in riscv,pmwid?
> > > > 
> > > > pmwid (single value) is the reset default, while pmwidlist (bitmap)
> > > > defines the allowed set. The root-of-trust M-mode software may select
> > > > an allowed value from the pmwidlist and write it to the mwid CSR.
> > > 
> > > I don't understand the point of the property then. If it is the reset
> > > default, just read it out of the register?
> > > Unless I am missing something, it's useless to s-mode because it may
> > > not be what m-mode chose and useless to m-mode that has access to
> > > the csr.
> > 
> > Smwid is optional. In the no-Smwid case:
> > - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/SoC
> >   registers, exposed to software via riscv,pmwid DT property)
> > - S/U-mode's WID depends on opensbi-domain configuration [1]:
> >   - If next-wid is specified: S/U use that WID (via mlwid CSR)
> >   - If next-wid is absent   : S/U fall back to pmwid (M/S/U in same
> >     world)
> > 
> > So riscv,pmwid serves two purpose:
> > 1. Source of truth for M-mode's WID when mwid CSR doesn't exist
> > 2. Fallback value for OpenSBI to write to mlwid when domain config is
> >    absent.
> 
> So it is not the default at reset at all then. The reset default is
> something else entirely and this is used to overwrite that.
> 
> > - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/SoC
> >   registers, exposed to software via riscv,pmwid DT property)
> 
> In this case, it seems like pmwidlist would just contain a single entry,
> and there is no need for pwmid.

The pmwid and pmwidlist properties cannot merge because pmwidlist represents
an optional hardware mask. On physically unrestricted platforms, pmwidlist
doesn't exist, making pmwid essential to define the hardware reset default.

> 
> Quite frankly, it seems like you need to decouple these properties from
> being 1:1 mappings to your extension's CSRs and both name and explain
> how they are to be used by software.

These properties are actually not 1:1 CSR mappings. pmwid, pmwidlist, and
pmlwidlist are the exact terms used in the RISC-V specification to describe
these platform-defined hardware values, so I prefer to follow it.

> 
> For example, how is software to treat the value in riscv,pwmid when
> Smwid is enabled? Must it be the same value? Is riscv,pwmidlist useless
> in that scenario as a result and should not be populated? Should
> riscv,pwmid not be used if Smwid is enabled?
> 
> There's a lot of extensions defined in this series, and there's no
> clarity on how these properties behave depending on what's enabled in
> the binding. There must be.

Yes, agreed. I have summarized the possible ISA extension combinations
and their corresponding Device Tree property requirements in the table
below:

# | Smwid | Smlwid | Smlwidlist | Smwiddeleg | Sswid | CSRs Present                             | pmwid | pmwidlist | pmlwidlist | Notes
------------------------------------------------------------------------------------------------------------------------------------------------------
0 | off   | off    | off        | off        | off   | (none)                                   | REQ   | NO        | NO         | Base: single fixed WID per hart, platform-defined only
1 | on    | off    | off        | off        | off   | mwid                                     | OPT   | OPT       | NO         | M-mode control only: lockable M-mode WID; all privilege modes share one WID
2 | off   | on     | off        | off        | off   | mlwid                                    | REQ   | NO        | OPT        | Lower-mode control: M-mode assigns WID to lower privileges; M-mode WID is platfo rm-fixed
3 | on    | on     | off        | off        | off   | mwid, mlwid                              | OPT   | OPT       | OPT        | RoT M-mode control: RoT M-mode configures regular M-mode WID (lockable)
4 | on    | on     | on         | off        | off   | mwid, mlwid, mlwidlist                   | OPT   | OPT       | OPT        | WID list restriction: M-mode can software-restrict the mlwid set
5 | off   | on     | off        | on         | on    | mlwid, mwiddeleg, slwid                  | REQ   | NO        | OPT        | S-delegated control (M-mode fixed): M-mode WID platform-fixed; S-mode controls U -mode WID
6 | on    | on     | off        | on         | on    | mwid, mlwid, mwiddeleg, slwid            | OPT   | OPT       | OPT        | S-delegated control (M-mode programmable): M-mode WID lockable; S-mode controls U-mode WID
7 | on    | on     | on         | on         | on    | mwid, mlwid, mlwidlist, mwiddeleg, slwid | OPT   | OPT       | OPT        | Complete feature set: all CSRs present; M-mode lockable WID, mlwidlist restricti on, S-mode delegation

  REQ = REQUIRED   - Property must be present in DT
  OPT = OPTIONAL   - Property may be present; provides optional platform defined values
  NO  = FORBIDDEN  - Property must not be present

> 
> > - S/U-mode's WID depends on opensbi-domain configuration [1]:
> >   - If next-wid is specified: S/U use that WID (via mlwid CSR)
> >   - If next-wid is absent   : S/U fall back to pmwid (M/S/U in same
> >     world)
> > 
> > So riscv,pmwid serves two purpose:
> > 1. Source of truth for M-mode's WID when mwid CSR doesn't exist
> > 2. Fallback value for OpenSBI to write to mlwid when domain config is
> >    absent.
> 
> Again same point applies here, why can a single-entry riscv,pmwidlist
> not suffice here?

As explained above, a single-entry pmwidlist cannot replace pmwid because
it would fail to represent the exact hardware reset default for platforms
without physical WID restrictions. I hope this addresses your concern.

> Additionally, if it cannot, you may need to introduce mutual exclusion
> and the relevant extensions because it doesn't seem like in your current
> design that the two properties are intended to co-exist.

Agreed. In the next version, I will introduce mutual exclusion in the
YAML schema based on the table above.

Thanks,
Peter Lin

> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
