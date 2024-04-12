Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A04C00A94
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 21:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hb4IVDS4KG/8K/tGAokc8JLiRxKHWMCJ7mzUq6xV1NQ=; b=EP0bvmjLSJyC1B
	+4ecOCRcwhYaK1QlovCWOAr93Ga7UJXVBo/kV/ZsFs92W0ta+w5rXfMjEkXaSiTx3H0/wKj44xRfH
	mBX0GF3IVqJrH1cbhRLPImUevn7Y82MTszTCiHVS7w9jXlaMlz1idz5C5qFxbphVTbxMP5w9il/Vo
	c4iEiyTUQmYOoh/HcOaekJmS+ivwADgnjStrgEiWL7QS2hKB1rKoG+DTOatFWAm732e1BEfDPWnad
	gjXU9HPTJCnAoAsvY2BSMdloFk1MLho41HZ6Y9xFzjQaGbDftjOhdvX1sXj9wB8rHM5Gt4Ng5XDmQ
	2MelnDadDDlmfNJfd2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvOUw-00000001ObC-1aU3;
	Fri, 12 Apr 2024 21:31:50 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvOUs-00000001OYL-1VRQ
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 21:31:48 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6eced6fd98aso1260513b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 14:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712957505; x=1713562305; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=voVXHLevuqJNzT+bs7/EqrNPPg6u1fkprZIxe/QalLU=;
        b=WM9oG7NF8CwNDThqTuvJWxR2eJACH9Hb5U5WEtntycbRpT5uQw/k5RQW3EhnYf7837
         YSiqYYGpvhWBM7SqYlIkZ9JlxmW/S2QeI+wpZgwpgJtA88mgtj14nmQNHqboocwHukek
         qB265OG9gpqBa0HbsDiK23fRBtJtGoVZhqcmDvlSw3z+al8AWp5ZDrTU0gL2sFu5RbP0
         WBMcGO8p+2GPASQ8uHt+14IBpKLREctFTI22zhNtOVloJnaOIwc2yRKFNCFEDUG29rwW
         qvS9FSsoPqxJD50AJgoC+K2R8PuG28GfsgmP1B1lEb/syUpLXQXx5CsZW3KHfPv2ywto
         A0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712957505; x=1713562305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voVXHLevuqJNzT+bs7/EqrNPPg6u1fkprZIxe/QalLU=;
        b=FCvB3qeKt4dxiorBIq0wlFYpMI9gkps0sLShXxTicdgU4QvcETTN/Vjk6gzrkb88LH
         j0TC+XqeBn51KE4D+dLqpq+AL6dXwHXlxM7W9U8CxDG8+/ZCjUddqZgz0p+q+rLJ14fy
         bkkFzKgWZ0SKsTgM2R/TqNQcoc2aCC7TQFY9AkS3DFwiLfrMa/dXXkxkwuv9vT5ed9Wm
         cE3iUQeCmhBxvLeJY0KbaRdB5IZqX8xMVjIzBFz7iHTa5uTp8+xiSF+OxBx2x24TyEbZ
         tGW5vrZTKO0izeUakyZ+jopFeYunFlaTVIoP1iiS5sBIX0uZfJhgeVDsvFOhEHVD0xt9
         ikrw==
X-Forwarded-Encrypted: i=1; AJvYcCWgNvnLabcpv8Wl/VJldRxa0mHz7IGA4nMKP4a3iL2BkOM2cL3CyBgRDy4Q2QCL21QWKH5yGT/+Sjt9Ul4oUMzRjCnFIDNba78lXWp1tQvk
X-Gm-Message-State: AOJu0YwoeMh8RPaW7UpgwqnNmohWrXDTrHRic0VwQ8ZwLWOtHnsR+cvn
	ML9z1S6Fmaq0N/1yNRJTMpPyX/dD3vvCRSpdp7/4rxfHG7wRoaRglb4BWWGTHTUUWC8L0AWb5FJ
	B
X-Google-Smtp-Source: AGHT+IERI9B+BrmtTh0aeho0vx1NlGjhWinYXb/3YQQZhSK7SAPG1+V9dZjVR23iA+HJ2H/wGMNAgA==
X-Received: by 2002:a05:6a20:5d92:b0:1a7:3d5f:dd3b with SMTP id km18-20020a056a205d9200b001a73d5fdd3bmr3547889pzb.16.1712957505558;
        Fri, 12 Apr 2024 14:31:45 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id h15-20020a63384f000000b005dc5289c4edsm3063267pgn.64.2024.04.12.14.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 14:31:45 -0700 (PDT)
Date: Fri, 12 Apr 2024 14:31:42 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <ZhmoPuoR00aS6qZp@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
 <ZhlrdGXfSushUNTp@ghost>
 <20240412-eastcoast-disparity-9c9e7d178df5@spud>
 <ZhmeLoPS+tsfqv1T@ghost>
 <20240412-chemist-haunt-0a30a8f280ca@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-chemist-haunt-0a30a8f280ca@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_143146_532795_3CC25FE9 
X-CRM114-Status: GOOD (  55.52  )
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

On Fri, Apr 12, 2024 at 10:27:47PM +0100, Conor Dooley wrote:
> On Fri, Apr 12, 2024 at 01:48:46PM -0700, Charlie Jenkins wrote:
> > On Fri, Apr 12, 2024 at 07:47:48PM +0100, Conor Dooley wrote:
> > > On Fri, Apr 12, 2024 at 10:12:20AM -0700, Charlie Jenkins wrote:
> > > > On Fri, Apr 12, 2024 at 11:25:47AM +0100, Conor Dooley wrote:
> > > > > On Thu, Apr 11, 2024 at 09:11:08PM -0700, Charlie Jenkins wrote:
> > > > > > The riscv_cpuinfo struct that contains mvendorid and marchid is not
> > > > > > populated until all harts are booted which happens after the DT parsing.
> > > > > > Use the vendorid/archid values from the DT if available or assume all
> > > > > > harts have the same values as the boot hart as a fallback.
> > > > > > 
> > > > > > Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs")
> > > > > 
> > > > > If this is our only use case for getting the mvendorid/marchid stuff
> > > > > from dt, then I don't think we should add it. None of the devicetrees
> > > > > that the commit you're fixing here addresses will have these properties
> > > > > and if they did have them, they'd then also be new enough to hopefully
> > > > > not have "v" either - the issue is they're using whatever crap the
> > > > > vendor shipped.
> > > > 
> > > > Yes, the DT those shipped with will not have the property in the DT so
> > > > will fall back on the boot hart. The addition of the DT properties allow
> > > > future heterogenous systems to be able to function.
> > > 
> > > I think you've kinda missed the point about what the original code was
> > > actually doing here. Really the kernel should not be doing validation of
> > > the devicetree at all, but I was trying to avoid people shooting
> > > themselves in the foot by doing something simple that would work for
> > > their (incorrect) vendor dtbs.
> > > Future heterogenous systems should be using riscv,isa-extensions, which
> > > is totally unaffected by this codepath (and setting actual values for
> > > mimpid/marchid too ideally!).
> > > 
> > 
> > I am on the same page with you about that. 
> > 
> > > > > If we're gonna get the information from DT, we already have something
> > > > > that we can look at to perform the disable as the cpu compatibles give
> > > > > us enough information to make the decision.
> > > > > 
> > > > > I also think that we could just cache the boot CPU's marchid/mvendorid,
> > > > > since we already have to look at it in riscv_fill_cpu_mfr_info(), avoid
> > > > > repeating these ecalls on all systems.
> > > > 
> > > > Yeah that is a minor optimization that can I can apply.
> > > > 
> > > > > 
> > > > > Perhaps for now we could just look at the boot CPU alone? To my
> > > > > knowledge the systems that this targets all have homogeneous
> > > > > marchid/mvendorid values of 0x0.
> > > > 
> > > > They have an mvendorid of 0x5b7.
> > > 
> > > That was a braino, clearly I should have typed "mimpid".
> > > 
> > > > This is already falling back on the boot CPU, but that is not a solution
> > > > that scales. Even though all systems currently have homogenous
> > > > marchid/mvendorid I am hesitant to assert that all systems are
> > > > homogenous without providing an option to override this.
> > > 
> > > There are already is an option. Use the non-deprecated property in your
> > > new system for describing what extesions you support. We don't need to
> > > add any more properties (for now at least).
> > 
> > The issue is that it is not possible to know which vendor extensions are
> > associated with a vendor. That requires a global namespace where each
> > extension can be looked up in a table. I have opted to have a
> > vendor-specific namespace so that vendors don't have to worry about
> > stepping on other vendor's toes (or the other way around). In order to
> > support that, the vendorid of the hart needs to be known prior.
> 
> Nah, I think you're mixing up something like hwprobe and having
> namespaces there with needing namespacing on the devicetree probing side
> too. You don't need any vendor namespacing, it's perfectly fine (IMO)
> for a vendor to implement someone else's extension and I think we should
> allow probing any vendors extension on any CPU.

I am not mixing it up. Sure a vendor can implement somebody else's
extension, they just need to add it to their namespace too.

- Charlie

> 
> > I know a rebuttal here is that this is taking away from the point of
> > the original patch. I can split this patch up if so. The goal here is to
> > allow vendor extensions to play nicely with the rest of the system.
> > There are two uses of the mvendorid DT value, this fix, and the patch
> > that adds vendor extension support. I felt that it was applicable to
> > wrap the mvendorid DT value into this patch, but if you would prefer
> > that to live separate of this fix then that is fine too.
> > 
> > - Charlie
> > 
> > > 
> > > > The overhead is
> > > > looking for a field in the DT which does not seem to be impactful enough
> > > > to prevent the addition of this option.
> > > > 
> > > > > 
> > > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > > 
> > > > > > @@ -514,12 +521,23 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
> > > > > >  				pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> > > > > >  				continue;
> > > > > >  			}
> > > > > > +			if (of_property_read_u64(node, "riscv,vendorid", &this_vendorid) < 0) {
> > > > > > +				pr_warn("Unable to find \"riscv,vendorid\" devicetree entry, using boot hart mvendorid instead\n");
> > > > > 
> > > > > This should 100% not be a warning, it's not a required property in the
> > > > > binding.
> > > > 
> > > > Yes definitely, thank you.
> > > > 
> > > > - Charlie
> > > > 
> > > > > 
> > > > > Cheers,
> > > > > Conor.
> > > > > 
> > > > > > +				this_vendorid = boot_vendorid;
> > > > > > +			}
> > > > > 
> > > > 
> > > > 
> > 
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
