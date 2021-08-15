Return-Path: <SRS0=ocBP=NG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267C8C4338F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Aug 2021 15:25:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D956120D
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Aug 2021 15:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7D956120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LF6/Sb3+q1kb9Q2g0CMsv9XHUzYz3D3GLc+K/iGW0sQ=; b=B7ryW/X3dj5xUG
	AnVto3fVFB3Cmw7dRoRSSFK2M556+Km6bRvl15o8Bpy8jDC9ce0sLVFGcY10BYOa01dZUU+1bkAB+
	NE84lK3xtok/09RZrVrbUDcU8lFotOzu4tCVVWKbapFzN5HfJAVdw4gyYyy61PPw/3wiUuNJolrtY
	4i7/ToXsGK3gAIN0LDsZL/4Ux/TUP/yJZYxDfQAw3y/kkkQK9i4TLMuuqMj/T6RPFmql+029djCyp
	QAaxS2n0N/OI1MrP0FlMQ8NJOcT/1kR9pp5xUZlh5pHg5nSGD6EWxCjqQFzpATgMIfgMnpBfjXFrg
	eNHHD67TfgUBAoWYg7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFI0n-00FSe9-4l; Sun, 15 Aug 2021 15:25:21 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFI0a-00FSd6-Ig; Sun, 15 Aug 2021 15:25:09 +0000
Received: by mail-ot1-f41.google.com with SMTP id
 c2-20020a0568303482b029048bcf4c6bd9so18071704otu.8; 
 Sun, 15 Aug 2021 08:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ekgt3OAtYmB5Rrl1lZKK9+oa72a0Us/2FQEAMO/EQak=;
 b=i2+//hJ3xo0gSmpcxnpY+aS0ysOzpgBcCZqwYPRmynO0Rzp8EgCMlPuEiB64309SPk
 Y2NyTX9/fc3f+lxMHlFK6BVayumYDfrHp+GByL04LiIcKAj9HDDB9RgcIqi92sVmX5Jz
 /l7+hzMJgaHyKeu6Zf3cV0iK+29SFLulkK+FtZ4vGGlKXD7d4r5cuhTAarrcaGYyxitB
 wmuFBonO6Q4cTl6R/9jR5UTnougk35O2bqM5CD0EtnfExjdbVLsi9AWS5lbrnZmixQWO
 O0zE6VFdgqRcT/mz+6+a82Y8JfSGr7oWSokYpJCbzyEDePPidzcEtyjkfvvSB6RVJ1nh
 RIvA==
X-Gm-Message-State: AOAM5329+rO8T8n0P4NhQs0TH9FIZ1+VYZctga6K7tFPpWHsfMTc5Cu5
 DG0HTHDPc/RUNJiQP7n1UA==
X-Google-Smtp-Source: ABdhPJzjr4gT4FE0xwAVG4uG4LG0+RSUbEqBTWj+LfaNdV32tQZ0vqtZTO/Ia6yG79/x3EO0MD/S6w==
X-Received: by 2002:a9d:6306:: with SMTP id q6mr9594009otk.290.1629041105852; 
 Sun, 15 Aug 2021 08:25:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p8sm1717971otk.22.2021.08.15.08.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 08:25:05 -0700 (PDT)
Received: (nullmailer pid 3767739 invoked by uid 1000);
 Sun, 15 Aug 2021 15:25:03 -0000
Date: Sun, 15 Aug 2021 10:25:03 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Russell King <linux@armlinux.org.uk>, Nicolas Pitre <nico@fluxnic.net>,
 Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Kossifidis <mick@ics.forth.gr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>,
 Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/9] Add generic support for kdump DT properties
Message-ID: <YRkxzx/1XM3r64Ee@robh.at.kernel.org>
References: <cover.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1628670468.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_082508_666734_C19CA361 
X-CRM114-Status: GOOD (  21.62  )
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

On Wed, Aug 11, 2021 at 10:50:58AM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series adds generic support for parsing DT properties related
> to crash dump kernels ("linux,elfcorehdr" and "linux,elfcorehdr" under
> the "/chosen" node), makes use of it on arm32, and performs a few
> cleanups.  It is an evolution of the combination of [1] and [2].

The DT bits look fine to me. How do you expect this to be merged? I'm 
happy to take it if arch maintainers can ack it.

> 
> The series consists of 6 parts:
>   1. Patch 1 prepares architecture-specific code (needed for MIPS only)
>      to avoid duplicating elf core header reservation later.
>   2. Patch 2 prepares the visibility of variables used to hold
>      information retrieved from the DT properties.
>   3. Patches 3-5 add support to the FDT core for handling the
>      properties.
>      This can co-exist safely with architecture-specific handling, until
>      the latter has been removed.

Looks like patch 5 doesn't have any dependencies with the series?

>   4. Patch 6 removes the non-standard handling of "linux,elfcorehdr" on
>      riscv.

I thought this should be applied for 5.14?

>   5. Patches 7-8 convert arm64 to use the generic handling instead of
>      its own implementation.
>   6. Patch 9 adds support for kdump properties to arm32.
>      The corresponding patch for kexec-tools is "[PATCH] arm: kdump: Add
>      DT properties to crash dump kernel's DTB"[3], which is still valid.

This one can be applied on its own, right?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
