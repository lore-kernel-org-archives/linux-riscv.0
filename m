Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC32E92FD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 02:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6L5fcrOk5d0KPYvzvLsU19x4ekh/Y/KaNiHvKCnDAw8=; b=oo8hf6O0CRWhEP
	LhTxNrT2vz621EM4CdlztrMlvLMdMo4BQL3HR7AEaqjDXmsAcUodMk6sypiT8d4IRkoB/AEAtU0EI
	uT7wOSEt0VnutMbANtks6N92+2oWceD9O7s9MLStlKdh10zuq1PKzt2VuT9P7lRwd7JtuSvmrQH2x
	50FacoY+hPfeTCC1x/JZz2vRBBXYMXMgk2OiWMMhMII8j8MG7+r7ETE0DWPe6uCTCBY6cAn66cz/B
	mJuV4JZ6dyaq1ltmp6ZEVWWGofs+FA41vpthYO2i9NItFlwVIgrhQTfES3JKGODh7P9i/ZEAUpA26
	gXukC2Q5iT94UjjqPRag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPEU-00000004IFY-0KnB;
	Tue, 30 Dec 2025 02:13:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPET-00000004IFS-0ubY
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 02:13:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05CC86000A;
	Tue, 30 Dec 2025 02:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8767CC4CEF7;
	Tue, 30 Dec 2025 02:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767060787;
	bh=ujZ1P5lBfgwx4tIvimvvLGd3ecXpSBouVkmJT85mccE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tO5bdLtO41d5F00M9eL2DiNwnBmycH8RX0eeY8cU9C018ar4bwq3t03A7MoZfZzUz
	 9FBHnO+00LiF1B+K7zKr/Oz9AOJk4J1orJWhkDCBCs4ikFjOPDWMYyVFseD4Hq0/1y
	 uH8a7PQsFR5ibtYPiQVz1zhYq27LxP8C7x5tjaJKQo80xY5c0owDKGqFxcxzAXhRRp
	 HMlUD/RzwJMZssgwuBo4y4+DyYLMrFAFcbEGVA7ZtL+BNZP5s2Sn1qVi5WwE+XiNJy
	 Jysl5qkbNDmh3ZSmjYd6t4gElEQTv9kPzZe/NkqZlAc1SN02Alkec98FX8b2vbQOgo
	 zcoI/C3d6MY9w==
Date: Mon, 29 Dec 2025 20:13:06 -0600
From: Rob Herring <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Guodong Xu <guodong@riscstar.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension
 description
Message-ID: <20251230021306.GA3094273-robh@kernel.org>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
 <fc719e92-10bc-455f-b402-c93bdbf878cf@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc719e92-10bc-455f-b402-c93bdbf878cf@riscstar.com>
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

On Fri, Dec 26, 2025 at 03:28:47PM -0600, Alex Elder wrote:
> On 12/22/25 7:04 AM, Guodong Xu wrote:
> > Add description for the Supm extension. Supm indicates support for pointer
> > masking in user mode. Supm is mandatory for RVA23S64.
> > 
> > The Supm extension is ratified in commit d70011dde6c2 ("Update to ratified
> > state") of riscv-j-extension.
> > 
> > Supm depends on either Smnpm or Ssnpm, so add a schema check to enforce
> > this dependency.
> 
> I have the same general question on this, about whether it's really
> necessary for the DT binding to enforce these requirements.  The
> RISC-V specifications are what truly defines their meaning, so I
> don't really see why the DT framework should need to enforce them.
> (That said, I'm sure there are other cases where DT enforces things
> it shouldn't have to.)

Does the specification have some way to check it? What happens if a DT 
is wrong? Are you going to require a DT update to make things right? Or 
the kernel has to work-around the error? Neither is great. So having 
this as a schema makes sense to prevent either scenario.

> 
> And now, having looked at these added binding definitions (in patches
> 07 through 11 in this series), I wonder what exactly is required for
> them to be accepted.  For the most part these seem to just be defining
> how the extensions specified for RISC-V are to be expressed in
> DT files.  It seems to be a fairly straightforward copy from the
> ratified specification(s) to the YAML format.
> 
> Who need to sign off on it?  Conor?  Paul?  DT maintainers?

I generally leave this extension mess to Conor.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
