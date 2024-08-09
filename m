Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29741C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 18:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ym9fzxBi7BslQYq2sjCg0etv5CopeE7Hea9+D8wtvMo=; b=mrolJXcx5iD2ns
	ga7jNYkwGPLP9O+ml4JCIuMtUoxSn/T4iZoqX4qF3ftLteVfLWdVGJ6oX8BrWaQwtXkdpH4hyoEkB
	kolbuM5VndCc06Fxn9iu5TCBtjOv4M2SvM8FWUqhu/2M1bhcUp50eKt9If9F/PesmZsuRKatylfUR
	xbBQGRGZ+Kf7SJ+ll70FgOXMwKB71ZkznNlnWX52Qb4m/EdF1pmZvdrmFpQsdEx74z+Yc31g7VNP+
	MdaMsqunY7IcNOKph+QpBaJu/xQFK9LrSA9YfTCn/fU+zOIXtbL6FHmZpPBAU3e9sKrJHd1D2//zX
	uTh4PxEeN11+U5KIaWLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scU9Q-0000000CBIQ-1W4Q;
	Fri, 09 Aug 2024 18:15:44 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scU9N-0000000CBHs-21Po
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 18:15:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 490BCCE180E;
	Fri,  9 Aug 2024 18:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF74C32782;
	Fri,  9 Aug 2024 18:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723227338;
	bh=DkIXjXMgQ2h07LfBy7/0VFM/IS/1mPxjxgWjjpNWjN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MR1X+5yBrVzw/2nz4GlMf1V6E4gE7fxoO2XGRiXRrOAuUhV6qeBbyKQaWkc+Kgajg
	 BXN+XH1/lJhEwmFp3XzqEqRyCR1Amd06zB89gm0eRqQkRyNb15RmFvGEWDeZMTsvEV
	 C9koFvqzCCWgRmG/RkCXDLU2K+M3QHgTwA7RVydwVRJgZ0IyNrEMrFYO0Sxc7L12WK
	 r/Vg6shac1/0N7FkLv1g5Y3B+eO613m7bG3h+Ehn8HDDVoROmp3RVGz1dMN5k4X/fH
	 o1wU3EfU58F5VIQ1aDA4dekfX0qj+Vbkz1Nf+oRY17CMt+poRUh8oVEz37gK/VGaVP
	 VqpBVMFQEasQg==
Date: Fri, 9 Aug 2024 12:15:36 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 2/2] dt-bindings: riscv: Add Zicclsm ISA extension
 description.
Message-ID: <20240809181536.GA976083-robh@kernel.org>
References: <20240809162240.1842373-1-jesse@rivosinc.com>
 <20240809162240.1842373-3-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240809162240.1842373-3-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_111541_722655_A52C0FB4 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 09, 2024 at 12:22:40PM -0400, Jesse Taube wrote:
> Add description for Zicclsm ISA extension.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> V1 -> V2:
>  - New patch
> V2 -> V3:
>  - No changes
> V3 -> V4:
>  - No changes
> V4 -> V5:
>  - No changes
> V5 -> V6:
>  - No changes
> V6 -> V7:
>  - No changes
> V7 -> V8:
>  - Rebase onto 2d1f51d8a4b0 (palmer/for-next)

Please also put the version in the subject. '-vN' is the git-send-email 
option to do it for you.

Rob


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
