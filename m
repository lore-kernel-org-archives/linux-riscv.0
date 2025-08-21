Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23756CA0EEB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOsn0M0wEbxmU68IHe3kf1ee4RGYX3g/60j8633Bn9o=; b=dNqrZngGTp6USa
	Elrg6vnk6g9b5yWUHuHoPi2xKARGh4296AGxhRCNwud3VYRKoRpemiC1+6G95z/xElTqe1/RzzzkE
	GtWgUCi615F04nFYGwDqkkcy9NIqQCW2xz61p56Z8OX3O/fYWUSBImjILgoq39hEEdNXSNkzSmw4k
	4YBsfbT07YGVpMGZ1YlC67/6Jz+ZganAyLONrSUoN2nK9DSYqVKD2qRilXfEv436QCiFk4m705mCx
	oSODX+CxF+UWyzrfxBJ65c2kKzclrms6kY9zS+ho0tyy4703I6N0FCgkJZGZFOs5jbg1HAeaLBAQT
	myxx0wbP8DnRgSZNbO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1mh-0000000GRkS-1uhC;
	Thu, 21 Aug 2025 09:40:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up07f-0000000G9t7-21Xn
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 07:54:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9073447D4;
	Thu, 21 Aug 2025 07:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3D8C4CEED;
	Thu, 21 Aug 2025 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755762850;
	bh=IPUilLuvpTBBH6sPGlI6idGeP+t2/3AiJ5bzLQuzi4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aW1yJ47zmSPUHgdPC4EYbN1/1lCNd7kl9uuDMieVhuOo43n8Y8ivXbxNTbx+f4x8p
	 DXu4NBjGWGCZLDxpjoSBAaQmx5Rkop/kE6zIpIkvhBdKSNloW4mZGc3ISRCBdzUX/U
	 tQJATBa3WsYkw6cpQhAyzByLzczEWiY1VuepkbS/TTL16HsKKEwntMdRpCzAcfolpC
	 TwuXXqqbVKX0Io2Aq7NULsbcJs73hT+s5G/AbRFPS/JvVpEHJrUnH6Rfyz98nCWhi1
	 Y6k0Kf88lVBi249eXJVqcO+1Qr0N/SMZ9pDd2iiEbbqzOeR6hyJK6vuY6P8mefHbSS
	 5yX5bpfUxoekQ==
Date: Thu, 21 Aug 2025 09:54:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: reset: Scope the compatible to VO
 subsystem explicitly
Message-ID: <20250821-bizarre-pigeon-of-unity-5a2d5d@kuoka>
References: <20250820074245.16613-1-ziyao@disroot.org>
 <20250820074245.16613-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820074245.16613-2-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_005411_564901_043E84A5 
X-CRM114-Status: GOOD (  20.85  )
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
Cc: Drew Fustini <fustini@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 20, 2025 at 07:42:43AM +0000, Yao Zi wrote:
> The reset controller driver for the TH1520 was using the generic
> compatible string "thead,th1520-reset". However, the controller
> described by this compatible only manages the resets for the Video
> Output (VO) subsystem.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> 
> Using a generic compatible is confusing as it implies control over all
> reset units on the SoC. This could lead to conflicts if support for

No, it won't lead to conflicts. Stop making up reasons.

> other reset controllers on the TH1520 is added in the future like AP.
> 
> Let's introduce a new compatible string, "thead,th1520-reset-vo", to
> explicitly scope the controller to VO-subsystem. The old one is marked
> as deprecated.
> 
> Fixes: 30e7573babdc ("dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller")
> Cc: stable@vger.kernel.org

Especially for backporting... Describe the actual bug being fixed here.

> Reported-by: Icenowy Zheng <uwu@icenowy.me>
> Co-developed-by: Michal Wilczynski <m.wilczynski@samsung.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../bindings/reset/thead,th1520-reset.yaml      | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> index f2e91d0add7a..3930475dcc04 100644
> --- a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> @@ -15,8 +15,11 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - thead,th1520-reset
> +    oneOf:
> +      - enum:
> +          - thead,th1520-reset-vo
> +      - const: thead,th1520-reset
> +        deprecated: true

This you can do, but none of this is getting to backports and your DTS
is a NAK. This basically means that this is kind of pointless.

Compatibles do not have particular meanings, so entire explanation that
it implies something is not true. We have been here, this was discussed
for other SoCs and you were told in v1 - don't do that.

You are stuck with the old compatible. Is here an issue to fix? No.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
