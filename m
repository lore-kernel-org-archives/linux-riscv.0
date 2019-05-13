Return-Path: <SRS0=1KMB=TN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5E1C04AA7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 22:31:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1198208C3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 22:31:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W78RphKu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mG/THQWe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1198208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5vzMf2bqaPbp3ai1NwC+PN3INHGj+d2x155PBhtdCL4=; b=W78RphKu5u04C5
	BceHchuCtAkvqyg8Ql4xjc3eb67m8815cvtKbTEPg6azpLCTrq+SCPGDQWuAIRCkWR5KDxHw6ikJ4
	jec5uBSUneFXBm6XnJi6PDyU1Hu7WVdFIYcu9rjbgVG68ROyqcOCv0MGK1Gx+XtEvb18xnKIHebgg
	WwbsIzBsWbxI+pphyvxvtCz3bBzIXh2g7sgHewD0RBKiGPql6GDhQhZp/DtqXqO3QKapjInjHC4p0
	P/noSRGiMbqeI8bnWik77elLH9oQErlBzNdQhdydE1v6vMUf6ESmmpI4CuwQTX+VcO4H5NDU0R6GZ
	KY80lY3ZCgpu726mVC2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQJTd-0003i4-Hh; Mon, 13 May 2019 22:31:21 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQJTa-0003hk-7i
 for linux-riscv@lists.infradead.org; Mon, 13 May 2019 22:31:19 +0000
Received: by mail-io1-xd44.google.com with SMTP id x24so3975987ion.5
 for <linux-riscv@lists.infradead.org>; Mon, 13 May 2019 15:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ZTesufEDxec+5sA8PoolbYSfD3zUTYkwZ95SB2LoCtU=;
 b=mG/THQWen8d9t08ReVXM/a4ba8YySpitPWAsXt/KNMLaALTtLfL2x+XjbBwHg6/dDT
 jnYtVVRVZiYOeoCmL38LjdVXrHpbjVlR2mhfGp2mqAUlpw0/xYDUOhVJtk4U/HWSZQOi
 s7kjzCf7KUV3xOayKwlKeYEMsMakNSWOX5xBAJto1mbmlTvsR0xZZwvojS5J3nkPvsDI
 ZDLU2mAFOFKZNjd0kf8RCrCmHUgxoeC3XRa3ftrzRQot4vTvpKbK/WGUszS8qCEub6XR
 WOJB4DHsMpVUJVqmuCCLG4FrfjPWqgt2mjRii/pYhZrPlSf3bKrUCgEZ75J3ns1zVyD+
 TMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ZTesufEDxec+5sA8PoolbYSfD3zUTYkwZ95SB2LoCtU=;
 b=kF3wg94dOVBGZxVQunQ8FE91nYqPB/fLrCxbxgH7Bn6JmNU32jq6gRJZQU+LsKGWIe
 nU+KDPy2dtpQQKl3GyEnfaYd4NdFEtn2EQi063VoT2XJWpDwl0Bu/XzLZEnNyZ/AVflf
 a1CEWkGlZf9r5Zx93T8dzplIhbMao/vMtYCQ0S+hlXk8CwgUWDB7YEcdRIkwfo4h1t4z
 MZgFfSxBoKxgByJEsXe8z/NTZ4FXnyK5LhbauL5NH54+x7W/PCSm/JJx/JdskU+c6wHx
 s3/QZqo1t/sUQvZzDm4cQTsjmTW/dnB1MUUZwPeRptXVWW9VmoLNybQMemBv4BaXPXib
 y/Pg==
X-Gm-Message-State: APjAAAWubnrurKszmxBaClJbX59JQllwq73duQ/7MZH+vJ1xCM4yDKSs
 gysS+GhGWkrnFJWQ4Y1/K61grQ==
X-Google-Smtp-Source: APXvYqxNdwk0XZB5PFfMdoQ14j5bk/oLnEmvEFIPFapRf1016EP0cu/TyH5p23c/PgySsZ6D9t5wCg==
X-Received: by 2002:a5d:9948:: with SMTP id v8mr4043411ios.190.1557786677263; 
 Mon, 13 May 2019 15:31:17 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 c62sm368695itd.17.2019.05.13.15.31.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 15:31:16 -0700 (PDT)
Date: Mon, 13 May 2019 15:31:16 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [v2 PATCH] RISC-V: Add a PE/COFF compliant Image header.
In-Reply-To: <20190501195607.32553-1-atish.patra@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1905131522370.21198@viisi.sifive.com>
References: <20190501195607.32553-1-atish.patra@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_153118_337563_E07A194B 
X-CRM114-Status: GOOD (  12.42  )
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
Cc: mark.rutland@arm.com, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Zong Li <zong@andestech.com>, merker@debian.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 1 May 2019, Atish Patra wrote:

> Currently, last stage boot loaders such as U-Boot can accept only
> uImage which is an unnecessary additional step in automating boot flows.
> 
> Add a PE/COFF compliant image header that boot loaders can parse and
> directly load kernel flat Image. The existing booting methods will continue
> to work as it is.
> 
> Another goal of this header is to support EFI stub for RISC-V in future.
> EFI specification needs PE/COFF image header in the beginning of the kernel
> image in order to load it as an EFI application. In order to support
> EFI stub, code0 should be replaced with "MZ" magic string and res5(at
> offset 0x3c) should point to the rest of the PE/COFF header (which will
> be added during EFI support).
> 
> Tested on both QEMU and HiFive Unleashed using OpenSBI + U-Boot + Linux.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Seems like we're stuck with this basic format for EFI, etc.  Even though 
we may be stuck with it, I think we should take the opportunity to add the 
possibility to extending this header format by adding fields after the 
basic PE/COFF header ends.

In particular, at the very least, I'd suggest adding a u32 after the 
PE/COFF header ends, to represent a "RISC-V header format version number".  
Then if we add more fields that follow the PE/COFF header -- for example, 
to represent the RISC-V instruction set extensions that are required to 
run this binary -- we can just bump that RISC-V-specific version number 
field to indicate to bootloaders that there's more there.

One other observation - if what's here was copied from some other 
architecture, like ARM, please acknowledge the source in the patch 
description.

thanks

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
