Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16918CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 12:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7FEte091QqyOZHndMOrYUUvqla6xeDbK7ApA4saIh+s=; b=Y9tgffHIjbeU3O
	nit3f3KCemtcH31qZ/TX5y8yWdyyNCTGenC7opnelCLXr2FjPSLdodc2DwDK6HhHC9PSPHK90IoDR
	oE3ygXEH7V0r1QnSKVkgkCgZfd8r1Sn6n0mjjljsx2byFx8SUJu1XZQJdDRk76cda2DRZEt09apdS
	ftvbJ8z1ZE7JmDWSd+lJvOHCObO1Xl/heJLJZbbSVlld6jz8Sspz5xNWeLEEopIHN3iHbkXYrJhEr
	G5QKkGjHf226XA1iRPN8rkn1RZXrYOZUrbNchUUzyOeeLi9ZeJhMdfafmiJdKx5/Nu2GG+N0V2JPf
	UevXwAKIp0atu7kgqD7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5O5-00000001AkC-2fop;
	Wed, 29 Oct 2025 12:34:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5O2-00000001Aj1-3KCM
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 12:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38296463B1;
	Wed, 29 Oct 2025 12:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31C3C4CEF7;
	Wed, 29 Oct 2025 12:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761741284;
	bh=wCMm5SMLDdbe9NGRhjkjnjQ3ipki5USRE6K4jHu3HZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RAoZkdnDmGj3UyvKdz6+m9HHFwbxnJj2IVJ8/pmiqDkA1pdcx7bSjLZsgRSfT+CQG
	 p/dtNIbPQoOukYZ1NwnGe5ble2MK9Q0ggUt25EejCyGs3fhNqM8FOgNGiVEHcSZCUC
	 cQbaNn9y0uI2JjZ+82xdL2LTev2Pi/S+dD8EUCU5HzWzvieHXUb5Sv98vPnifX3CeM
	 2i3DRAtYIRzcv4p5XErrinObDzOE1OfbgAA25sUAq/BxNWnG/Pwo3q0AJtWvByA+08
	 +Ev561SFthENk989DpbA0eMqEHeza3hEvbrMF5lD2lS85dVGbKDgvHtiDNpRsAcRyr
	 wd8aeTiGVloPg==
Date: Wed, 29 Oct 2025 12:34:36 +0000
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: reset: thead,th1520-reset: Remove
 non-VO-subsystem resets
Message-ID: <aQIJ3Ei9lziyQc8s@gen8>
References: <20251014131032.49616-1-ziyao@disroot.org>
 <20251014131032.49616-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014131032.49616-2-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_053446_849282_8DF2E0B9 
X-CRM114-Status: GOOD (  10.53  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 14, 2025 at 01:10:28PM +0000, Yao Zi wrote:
> Registers in control of TH1520_RESET_ID_{NPU,WDT0,WDT1} belong to AP
> reset controller, not the VO one which is documented as
> "thead,th1520-reset" and is the only reset controller supported for
> TH1520 for now.
> 
> Let's remove the IDs, leaving them to be implemented by AP-subsystem
> reset controller in the future.
> 
> Fixes: 30e7573babdc ("dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  include/dt-bindings/reset/thead,th1520-reset.h | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
