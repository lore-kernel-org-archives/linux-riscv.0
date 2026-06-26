Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEC8CD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 11:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTLay4xKgtj8GzDY4RuY9L6XUTFa0P7SF6PPrrmw0Q4=; b=FSYFlLaSyy/UTV
	ksRdfZes+VE9Pd52JefZtrEplYRuZlSz6WGjKjccd+SS/lnklbQmfwccUi5eNsA/IGIYKNLCEmjDb
	b+CbV956DgS6KUwneMm+LCXrjwggDzPD3a2ztxoHDwvgrIfU9tB3trzWhYaiaR7T03tOboBM3+l3a
	O7p1Fxn7ve9E4vGuBlpUm82Z0sP0ZCPdwz7gLUfbHtyLGDGcnYwPdGgV6UAOvI9oiW1I55XhTnHZh
	ZCQTVCmOYK7WDQnpUP31SDOeY5WhcRNQoChBxu4Cf60yWuL8K+MCEOMQwl4N4KVfdaLOQmuC4jKQe
	IpcAb50tjtdjvakWz0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd528-0000000BFiG-3b79;
	Fri, 26 Jun 2026 11:47:44 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd525-0000000BFhn-1OLw
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 11:47:43 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-37de8008910so410383a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2026 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782474460; x=1783079260; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dioXPMSt1EARQSLrGqQkhe/4CP6WY1S+tXkvTD0rOSY=;
        b=cOCwa0at3aTrqwnFETRDP9ksIotXZDzOtusZ/O59jsMADN5gWrNFQIpBbMFKyEWnLE
         iinPHDG4bz/q4NG2xMR27x5z4FGZGkzQgI1aZUBOtcvzZvNSbKm4Pyeedby5C1DBn09r
         APDtq2W0ArG5Gu6MomuOM036+PXnbk2E+q4RgL2rH3CFZF9m+R7mwlxl+WjOv6xkWMT8
         0DHD8qepf3xzpr/OCbfXsmH9rhOj2xFbVtAhvkzWE1KuQEozkZZolr1HiO9f6FwPjdxI
         T/mIT+dmj92hsRFUkZKL7cVwW2Zj6hA6wtId1FCqvgLULZ1eKXJOhFdZSdPBRaQ4wPIP
         RR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782474460; x=1783079260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dioXPMSt1EARQSLrGqQkhe/4CP6WY1S+tXkvTD0rOSY=;
        b=CgGwaIyiiHqUGgLs73HnnY6pWLub33vGXsJDT/071sRqMubO4oJxPvkFBhG55YhQcq
         MoUcaiF7EoNJipqyw6IKudYg/QB9ApCPUv1BcTAtiX8Bj3LtWQQgyDevvmEjvnLLkTcw
         HWvIhcPgmA0fWhqBRHpNj6FKbUeUBvp1936zttEGn+Xzn85k+XPKOPp9kVhPDjgrMbtC
         R2N39JTXv/GM2m4oMKR6Obp8HF/sxa4lXvsLIJGhC8C/GdJWgkg/bgauXm8hdvKObs+H
         ZYDR+nliWwJsWtCMVTJk9fKuS9NCkKGzeSlzRx82NpCX4XC20UD9KiY0rnfWmYbHCJ38
         ZAkA==
X-Forwarded-Encrypted: i=1; AHgh+RpOrO32GreLAd0vBuBBTwCk3EkvdPX5lWLchoyPl9QqfvFfP7HroyaBuLrw6TSZ5GnyOyf9RUkh9hI1QQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwoc2Sp7PKm2kfIaV7IbKyZRQVX/E9gQPL/VUoF+EymTkHKNMQ
	NnCCuyVAMmKZxtEXq/w+VYm3iSiUWivTsvCSsQBxYmLI5cLKW1EBmII8RafEuo0/XJ8=
X-Gm-Gg: AfdE7cngpUZhGtqrMVsW0Gw6LIIwN0HWDa5o1ZX06RQ0z/O12DN03fv0kva2/HTiX3q
	IYGoBYAeGkLYNEnm1GWx9yHqoFPanu3hu0QvlSm1OujHFKDvaHmLrG5vgGp+bF/iJNkJ8sX2Ag3
	vwPcDpWnVSzrJDdqs39Qsz+K/RVe3dAL8FvffkyKzUkEwejFhGi39Ats6nVQL7wu0g7NsjFWcCc
	T/cENr+498x957cTmJOPXzOCcPlktXq46lbONecsB+dEwCipWYi5LfyTFmsiRCgHemr32is1p0y
	yryN445Eg/tlYHcd4F0MLDzBNiFJbxBmXjeyin9K0i7Qh7wDeiZxmeGGBxXmG8Q3vH3aXTVTk6w
	tpiVvRMaeFAdRaduvuZgLXpCHn0oksSU8Satm+9UCW2MciOY3hCgxwsZS13GTwRDQNE1Mze6pN3
	3+c59NhEAu1Jg=
X-Received: by 2002:a17:90b:2788:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-37f816aeeeemr169488a91.19.1782474460154;
        Fri, 26 Jun 2026 04:47:40 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3b4bd5bsm3748919a91.13.2026.06.26.04.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:47:39 -0700 (PDT)
Date: Fri, 26 Jun 2026 19:47:31 +0800
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
	dave.patel@riscstar.com, raymond.mao@riscstar.com
Subject: Re: [RFC PATCH 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties
Message-ID: <aj5m00m4KxRAPAnB@plin-1878>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
 <20260622-profanity-herbs-1cc1bcf6206f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260622-profanity-herbs-1cc1bcf6206f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_044741_398913_1C33734A 
X-CRM114-Status: GOOD (  34.11  )
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

On Mon, Jun 22, 2026 at 06:12:47PM +0100, Conor Dooley wrote:
> On Fri, Jun 19, 2026 at 06:58:33PM +0800, Yu-Chien Peter Lin wrote:
> > Add per-hart DT properties for RISC-V Worlds architecture:
> > riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> > platform-defined values are primarily used by M-mode firmware
> > to configure World ID CSRs and restrict WID usage across
> > privilege levels.
> > 
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
> >  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
> >  2 files changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index 5feeb2203050..4b5778b6d3e7 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -26,6 +26,7 @@ description: |
> >  allOf:
> >    - $ref: /schemas/cpu.yaml#
> >    - $ref: extensions.yaml
> > +  - $ref: worlds.yaml
> >    - if:
> >        not:
> >          properties:
> > @@ -120,11 +121,31 @@ properties:
> >        thead systems where the vector register length is not identical on all harts, or
> >        the vlenb CSR is not available.
> >  
> > +  riscv,pmwid:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Platform-defined M-mode World ID (WID) assigned to this hart.
> > +    minimum: 0
> > +    maximum: 63
> > +
> > +  riscv,pmwidlist:
> > +    $ref: /schemas/types.yaml#/definitions/uint64
> > +    description:
> > +      Platform-defined bitmap of M-mode World IDs (WIDs) that this hart may use.
> 
> I don't understand what the difference is between this property and the
> one before it are.
> Is this one meant to be used by m-mode software to then select one which
> will appear in riscv,pmwid?

pmwid (single value) is the reset default, while pmwidlist (bitmap)
defines the allowed set. The root-of-trust M-mode software may select
an allowed value from the pmwidlist and write it to the mwid CSR.

> 
> > +
> > +  riscv,pmlwidlist:
> > +    $ref: /schemas/types.yaml#/definitions/uint64
> > +    description:
> > +      Platform-defined bitmap of World IDs (WIDs) that S-mode and U-mode may use
> > +      on this hart.
> > +
> >    # RISC-V has multiple properties for cache op block sizes as the sizes
> >    # differ between individual CBO extensions
> >    cache-op-block-size: false
> >    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
> >    timebase-frequency: false
> 
> > +  # RISC-V requires 'riscv,nworlds' in /cpus, so disallow it here
> > +  riscv,nworlds: false
> 
> Isn't this pointless? Nothing ever defines riscv,nworlds as a cpu level
> property so there's no need to disallow it?

Okay, thanks for the catch, will drop this.

Best regards,
Peter Lin

> 
> >  
> >    interrupt-controller:
> >      type: object
> > diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
> > new file mode 100644
> > index 000000000000..cc8b3747591e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/worlds.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V Worlds Extension
> > +
> > +maintainers:
> > +  - Yu-Chien Peter Lin <peter.lin@sifive.com>
> > +
> > +description: |
> > +  The RISC-V Worlds ISA extension, as described in the RISC-V Privileged
> > +  Specification, adds World ID tagging for context isolation.
> > +
> > +  This binding describes the system-wide Worlds configuration for the /cpus node
> > +  and is used alongside per-hart Worlds-related properties such as riscv,pmwid in
> > +  the RISC-V CPU binding and Worlds-related ISA extensions enumerated via
> > +  riscv,isa-extensions.
> > +
> > +select:
> > +  properties:
> > +    $nodename:
> > +      pattern: "^cpus$"
> > +
> > +properties:
> > +  riscv,nworlds:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      Number of World IDs (WIDs) supported by the platform. This is a system-wide
> > +      property that describes the total number of isolation contexts available.
> > +      Hardware components such as the WorldGuard Checker use this to determine
> > +      the valid range of WID values.
> > +    minimum: 2
> > +    maximum: 64
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    // Example: System with 4 World IDs
> > +    cpus {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        timebase-frequency = <1000000>;
> > +        riscv,nworlds = <4>;
> > +
> > +        cpu@0 {
> > +            device_type = "cpu";
> > +            reg = <0>;
> > +            compatible = "sifive,bullet0", "riscv";
> > +            riscv,isa-base = "rv64i";
> > +            riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
> > +            riscv,pmwid = <0>;
> > +
> > +            interrupt-controller {
> > +                #interrupt-cells = <1>;
> > +                compatible = "riscv,cpu-intc";
> > +                interrupt-controller;
> > +            };
> > +        };
> > +
> > +        cpu@1 {
> > +            device_type = "cpu";
> > +            reg = <1>;
> > +            compatible = "sifive,bullet0", "riscv";
> > +            riscv,isa-base = "rv64i";
> > +            riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
> > +            riscv,pmwid = <1>;
> > +
> > +            interrupt-controller {
> > +                #interrupt-cells = <1>;
> > +                compatible = "riscv,cpu-intc";
> > +                interrupt-controller;
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.43.7
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
