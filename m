Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102FBC4452B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 08:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KuQrAJEYYLOPDKRAoiLjRtx1wSuEPkUV7/YCld+S2Wo=; b=CfYCNPmScFmK9W
	q/jBQkwsbFfHqAYkngwI1oKv0Z/11CzwjylDuVCs9E9DFWklpH2ko189S7K7qVhLmT4fGM427hKea
	rPQcd6F6GOCPKV+rtr2qartjIB5opCpvhpBFVdnmcURMSQYs8WUMFB36Zq6THiLp0cCndugjezYPb
	lJ0kafH/NK8wSirYSvHOt81D7assZsIoVwf3ZOHJhfshUBLWOJ0WbDBKDne2mwejCPJP9hMVbnmAz
	ueZX3Qy1ZG5dRB0kpqyirJdJyv+ms6jDZLdrjAouH+xwEEltQ1hjSYVwmzNvchRqMrV4fc/c/szr7
	es/kBsPltB+FSr+WiMwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5dH-00000008lk1-2vyA;
	Tue, 21 Jul 2026 08:15:19 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5dF-00000008ljW-2wQH
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 08:15:18 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cacf197759so125458385ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2026 01:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784621717; x=1785226517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aQhiaBXb4FQySqVLoPouzb2vEhitkvmWNOzmKqQGHqM=;
        b=atpCQvXugJBFzK4Bcwjgjkurcs/B3Wvc7bec5nIPbN8SMTGuWO4JURVOu4OV7Eg12k
         0YoD7GmPb4fzzIzEmtm9tm/dXgQw35Ja/Dq5YhmNGZznHzjXgpKannX836CLAJjX2omp
         Cu4UYEXn9BRhaoenDOfehhJTmhaosDw/hquoNKhBOfAcAwdI9TADMquoVFfaZFdIPnT9
         YgU8OdwCxS3HDns2+ZGinFFycrZrdugbFKU1XPPindnWUFs4D0bRxTuH4dvYUkfLjjGb
         gq6k1eZyV19fIBfBIkkGLNemnyrmXwrkqNFkkL4BfPTugRMNcPRetKbgw9N27i3Hbp8F
         T88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621717; x=1785226517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQhiaBXb4FQySqVLoPouzb2vEhitkvmWNOzmKqQGHqM=;
        b=BJwkO5XmY6HkGdOwsqh6eIjiwL9ma7J2hKR18zvuuOsMTvNEoSr7OcTXPVzoAW055n
         Ddf54MMVVTvf1ViNOwgv2A47MabK6KsDkVjXftFyrjolxgfme1k4XczwIBLTCQMrpHZC
         dqqr2CUc3lyekzY13CcvSNMNU04S8Hf8v8RWGbVVfOjxNPdZ8o6FVJ22Q7AiWbCrWGWK
         WKpZ7vuPtvRSxlEulCD+pmrweYhFRhmhYAszfLwvjyEguR8UKwEAQUD+9EARNzEI9DZ0
         6C5N8+PuOCYf5JAlHQYcJeM1dNQaaygcTthhx/vH7F+jd4mEDRA3WsG0HfafETJwjOYI
         srAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqc70CAQJJrxgjimc0qDdhSpMPrg2uNTCasHmb4SRgXeNUrbRMwuJKA3TuZz26wNwKygSyiVDkofZ6MZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjYXDgSV8k0y7+gX0GF5P5mH1Pfra9kuQ4yNbqehIzXY723l5P
	bk0aUzTSaShi3o62SXiFrQvI2ueJ4Paao29z8IkI2oKJOFItSgAViEWSsq/kxju6CkY=
X-Gm-Gg: AR+sD10LeLOzV3EMCk5y6k3+RBlT75I+r+nnP65i/WdTvwNTfzlIGwaTB8syCXSI42B
	XnmQmUjgUSDOmKpVN95Vh9n+G/Sf1fH71r9kfyo9GwRC837AnN6mWV2XgFbHwRlP9tSTg7taaQr
	+C2orwaJzVw5L9SYrVCUv2kSdCc+xOFfXLPJVblEO9Y2XiHs6BODf+m9qWw6PUPnlH7n0POfmKx
	G09gzk+UCUg4RxLuCNLEleCkL9KsNbD/C0pJxg89DSv/as7vOFZK/HXUA6mNCCP/qOJsxEc8iJa
	zXu32qZCTPFelZroOn54FJjnEUEOGKROKIVUUdUPdX5oxwFPVN49Wz3E0UwM402/YJWsEje6cJB
	SqodniyAausp5UiT+RKeApT3STkE4buwWCgMnSJ8MWc9EyCVGOw/BtlTFEljyjZ7IigvdLyMFR2
	o7
X-Received: by 2002:a17:903:240e:b0:2ca:bb6:e7c6 with SMTP id d9443c01a7336-2cf349ab740mr197154885ad.37.1784621716761;
        Tue, 21 Jul 2026 01:15:16 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b36f9sm74117275ad.23.2026.07.21.01.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:15:15 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:15:07 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, samuel.holland@sifive.com, dlan@kernel.org,
	guodong@riscstar.com, dfustini@oss.tenstorrent.com,
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
Message-ID: <al8qi7k4LUlSTvhb@plin-1878>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
 <20260622-profanity-herbs-1cc1bcf6206f@spud>
 <aj5m00m4KxRAPAnB@plin-1878>
 <20260626-chitchat-purity-33af51f88380@spud>
 <akOkXpPi46LBHuIA@plin-1878>
 <20260630-frisk-excavate-7d562df75585@spud>
 <aloGd39fAlev7+4p@plin-1878>
 <20260717-imitation-corridor-ce127d4093fd@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260717-imitation-corridor-ce127d4093fd@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_011517_758027_8BEC5EB9 
X-CRM114-Status: GOOD (  50.13  )
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

On Fri, Jul 17, 2026 at 04:55:00PM +0100, Conor Dooley wrote:
> On Fri, Jul 17, 2026 at 06:39:51PM +0800, Yu-Chien Peter Lin wrote:
> > Hi Conor,
> > 
> > On Tue, Jun 30, 2026 at 07:06:14PM +0100, Conor Dooley wrote:
> > > On Tue, Jun 30, 2026 at 07:11:26PM +0800, Yu-Chien Peter Lin wrote:
> > > > Hi Conor,
> > > > 
> > > > On Fri, Jun 26, 2026 at 03:36:38PM +0100, Conor Dooley wrote:
> > > > > On Fri, Jun 26, 2026 at 07:47:31PM +0800, Yu-Chien Peter Lin wrote:
> > > > > > Hi Conor,
> > > > > > 
> > > > > > On Mon, Jun 22, 2026 at 06:12:47PM +0100, Conor Dooley wrote:
> > > > > > > On Fri, Jun 19, 2026 at 06:58:33PM +0800, Yu-Chien Peter Lin wrote:
> > > > > > > > Add per-hart DT properties for RISC-V Worlds architecture:
> > > > > > > > riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> > > > > > > > platform-defined values are primarily used by M-mode firmware
> > > > > > > > to configure World ID CSRs and restrict WID usage across
> > > > > > > > privilege levels.
> > > > > > > > 
> > > > > > > > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > > > > > > ---
> > > > > > > >  .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
> > > > > > > >  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
> > > > > > > >  2 files changed, 98 insertions(+)
> > > > > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
> > > > > > > > 
> > > > > > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > > index 5feeb2203050..4b5778b6d3e7 100644
> > > > > > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > > @@ -26,6 +26,7 @@ description: |
> > > > > > > >  allOf:
> > > > > > > >    - $ref: /schemas/cpu.yaml#
> > > > > > > >    - $ref: extensions.yaml
> > > > > > > > +  - $ref: worlds.yaml
> > > > > > > >    - if:
> > > > > > > >        not:
> > > > > > > >          properties:
> > > > > > > > @@ -120,11 +121,31 @@ properties:
> > > > > > > >        thead systems where the vector register length is not identical on all harts, or
> > > > > > > >        the vlenb CSR is not available.
> > > > > > > >  
> > > > > > > > +  riscv,pmwid:
> > > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > > +    description:
> > > > > > > > +      Platform-defined M-mode World ID (WID) assigned to this hart.
> > > > > > > > +    minimum: 0
> > > > > > > > +    maximum: 63
> > > > > > > > +
> > > > > > > > +  riscv,pmwidlist:
> > > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint64
> > > > > > > > +    description:
> > > > > > > > +      Platform-defined bitmap of M-mode World IDs (WIDs) that this hart may use.
> > > > > > > 
> > > > > > > I don't understand what the difference is between this property and the
> > > > > > > one before it are.
> > > > > > > Is this one meant to be used by m-mode software to then select one which
> > > > > > > will appear in riscv,pmwid?
> > > > > > 
> > > > > > pmwid (single value) is the reset default, while pmwidlist (bitmap)
> > > > > > defines the allowed set. The root-of-trust M-mode software may select
> > > > > > an allowed value from the pmwidlist and write it to the mwid CSR.
> > > > > 
> > > > > I don't understand the point of the property then. If it is the reset
> > > > > default, just read it out of the register?
> > > > > Unless I am missing something, it's useless to s-mode because it may
> > > > > not be what m-mode chose and useless to m-mode that has access to
> > > > > the csr.
> > > > 
> > > > Smwid is optional. In the no-Smwid case:
> > > > - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/SoC
> > > >   registers, exposed to software via riscv,pmwid DT property)
> > > > - S/U-mode's WID depends on opensbi-domain configuration [1]:
> > > >   - If next-wid is specified: S/U use that WID (via mlwid CSR)
> > > >   - If next-wid is absent   : S/U fall back to pmwid (M/S/U in same
> > > >     world)
> > > > 
> > > > So riscv,pmwid serves two purpose:
> > > > 1. Source of truth for M-mode's WID when mwid CSR doesn't exist
> > > > 2. Fallback value for OpenSBI to write to mlwid when domain config is
> > > >    absent.
> > > 
> > > So it is not the default at reset at all then. The reset default is
> > > something else entirely and this is used to overwrite that.
> > > 
> > > > - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/SoC
> > > >   registers, exposed to software via riscv,pmwid DT property)
> > > 
> > > In this case, it seems like pmwidlist would just contain a single entry,
> > > and there is no need for pwmid.
> > 
> > The pmwid and pmwidlist properties cannot merge because pmwidlist represents
> > an optional hardware mask. On physically unrestricted platforms, pmwidlist
> > doesn't exist, making pmwid essential to define the hardware reset default.
> > 
> > > 
> > > Quite frankly, it seems like you need to decouple these properties from
> > > being 1:1 mappings to your extension's CSRs and both name and explain
> > > how they are to be used by software.
> > 
> > These properties are actually not 1:1 CSR mappings. pmwid, pmwidlist, and
> > pmlwidlist are the exact terms used in the RISC-V specification to describe
> > these platform-defined hardware values, so I prefer to follow it.
> 
> CSRs or terms in your extension, it matters little.
> Your properties should reflect how software will actually interact with
> the devicetree and wordguard. There's no point having a bunch of
> properties that relate to aspects of the extension if software is not
> going to actually use them. 
> 
> I fundamentally do not understand why software ever needs both both the
> singular and list properties. What does software actually do with the
> list property when both it and the singular property are provided?
> 
> I expect to see something simpler and/or much better explained in the next
> revision.
> 
> > > Again same point applies here, why can a single-entry riscv,pmwidlist
> > > not suffice here?
> > 
> > As explained above, a single-entry pmwidlist cannot replace pmwid because
> > it would fail to represent the exact hardware reset default for platforms
> > without physical WID restrictions.
> 
> If there is one entry, use that, and if there are multiple entries, pick
> one?

Thank you, Conor. I am reworking OpenSBI part and hopefully PATCHv2
will address some of issues here. I will also rewrite description to
focus on software usage rather than hardware spec terminology.

Regards,
Peter Lin

> 
> Thanks,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
