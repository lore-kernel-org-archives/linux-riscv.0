Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D321E9B36D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cbbFjr0UpBF3LZX4s1hYH85zeH1d4sqRgmBJu+PEtc=; b=fbued5Dr6K+7Ma
	x4rmovu4Fm5dyalmOo4e4G+9YwcIEVn6DWdicZn3wHJpKJLdY6HH9zmK9AgQTZr1YOP3L0Cn5vBrZ
	1ISMxwAOwENNDnEZTJ5/2u3h924oHNvJTLRXuSh10Lm7gV65ykO+KmeGg+rJSzl48OtMNmx/8H7mv
	Nu8onbQo75z+u+lvEHduHSIbUUd5/AChM1O5cbXJaaCBetH1kC24yy5RviwBZ1B+sjwkChieGXPqt
	aP9+ryCEXnhOhNcuQ6e5J3/jWkXTNlXCfhF5mqE9toEhss1nZw48q8oefb800sr2nJqztOJmYv5O9
	rVKcha22of/K0UgCE8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1fz-0000000Cr5S-2DtU;
	Mon, 02 Mar 2026 11:43:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1fx-0000000Cr5G-3UNt
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 11:43:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB56060121;
	Mon,  2 Mar 2026 11:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68FCC2BC87;
	Mon,  2 Mar 2026 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772451780;
	bh=vvw9tnQE0DZbUNAHHgzgVlHQIekrFHzWJj4ctIf+n54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAnRn6o+bjCxh8a/Y8JG+TiH34Xpz1Dx7Akkb5l9I4sJVKFADLI9eWpT5rSKB8PPT
	 Hx1pkPOJM4muunsjPAdCc+Kaor2DGNF2G4Vx8qRayN3wEgcZMFHRug0hu8wr96UWIu
	 l3jDZy4T1Z22xdFgKhwbzKMqiZh9UQQRY3LIwfzbiNSGNNWYsmI/E2fAI4M2UkoGtQ
	 ytgMVphMHDv0c3JjgivGrY3Nl5rqsBhPoJ4xvVCRI51H/zH2aIh6QWQR086X3tcsCR
	 rW5ur+LdWUUbaZtpkjOZGU0Ifs72kOPytu6YWl2zMDtR3m2yE6X+oz7yPh08v6bJHf
	 5FRI8xczQMOhg==
Date: Mon, 2 Mar 2026 19:42:57 +0800
From: Yixun Lan <dlan@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: adapt regulator node name to
 preferred form
Message-ID: <20260302114257-GKA289813@kernel.org>
References: <20260226-02-k1-regulator-names-v1-1-e87695d50159@kernel.org>
 <87o6l6vd7l.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o6l6vd7l.fsf@ocarina.mail-host-address-is-not-set>
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

Hi Javier,

On 09:37 Mon 02 Mar     , Javier Martinez Canillas wrote:
> Yixun Lan <dlan@kernel.org> writes:
> 
> > The preferred node name for fixed-regulators has changed to pattern [1]:
> >  '^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$'
> >
> > Adjust all SpacemiT DT regulator node names to fix this.
> >
> > Link: https://lore.kernel.org/r/20240426215147.3138211-1-robh@kernel.org [1]
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> > In Review of adding DTS for OrangePi, Chukun mentioned fixed-regulator
> > has preferred node names [1], so let's change it now.
> >
> > This isn't strictly a bug, so I've not added the Fixes tag.
> >
> > Link: https://lore.kernel.org/r/20260123145015.1926865-1-amadeus@jmu.edu.cn [1]
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 10 +++++-----
> >  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  4 ++--
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >
> 
> Looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
A little bit late, I just picked this patch, but I can amend the commit to
add your R-b, thanks!

> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Core Platforms
> Red Hat
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
