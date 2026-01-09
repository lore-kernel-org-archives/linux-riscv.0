Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5EFD232C5
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 03:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEu9CX2DbHjqtj0jzIYEuh6NwcZq4qlhQSs9T6Ztvyo=; b=YgzoZLs2P2jlj8
	6IPD6RnGyfb+JhB2T51KI5xDJ4sWBlB5GL7CxEjb6rpm1SGKt1fxsWr9zk9kGcHOwlX+BitZDqnJW
	wIaFhjK8f/c0XQGUWGiEpZl3vt+EhtrTVbQycP4l7p/QaH3okglxnNCo4Ejc4zYnJ/Kwuko0RB/3B
	wBgiNjZpfyaBNb4P9BNyNJ3ST6KdfEAN4c2RUCQ/gbpd+XSyUqARtd46Kd+6Jt8envNFvpKDfcT+g
	+jvGPKWGokc/Y5pBHMiGO9yIyfpegm81mgIdrsJMZRDhvQyrE/cFnd8TZTvhhnutdcG2zlQVkuxa0
	FJqgn68ws5oVJNR4/pBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve3IX-00000001BSB-1XKi;
	Fri, 09 Jan 2026 03:36:25 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve3IU-00000001BRB-1CSz
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 03:36:23 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8FA63341F35;
	Fri, 09 Jan 2026 03:36:18 +0000 (UTC)
Date: Fri, 9 Jan 2026 11:36:08 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
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
Subject: Re: [PATCH v3 05/11] dt-bindings: riscv: spacemit: add K3 and
 Pico-ITX board bindings
Message-ID: <20260109033608-GYA3681@gentoo.org>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
 <20260108-k3-basic-dt-v3-5-ed99eb4c3ad3@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-k3-basic-dt-v3-5-ed99eb4c3ad3@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_193622_442406_CA08D45C 
X-CRM114-Status: GOOD (  14.42  )
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

Hi Guodong,

On 20:25 Thu 08 Jan     , Guodong Xu wrote:
> Add DT binding documentation for the SpacemiT K3 SoC and the board Pico-ITX
> which is a 2.5-inch single-board computer.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v3: No change.
> v2: Use one-blank-space between name and email address.
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> index 9c49482002f768cd0cc59be6db02659a43fa31ce..fe62971c9d1f4a7470eabc0e84e8a747f84baf0d 100644
> --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -9,6 +9,7 @@ title: SpacemiT SoC-based boards
>  maintainers:
>    - Yangyu Chen <cyy@cyyself.name>
>    - Yixun Lan <dlan@gentoo.org>
> +  - Guodong Xu <guodong@riscstar.com>
>  
sort by alphabet letter of first name?

>  description:
>    SpacemiT SoC-based boards
> @@ -26,6 +27,9 @@ properties:
>                - xunlong,orangepi-r2s
>                - xunlong,orangepi-rv2
>            - const: spacemit,k1
> +      - items:
..
> +          - const: spacemit,k3-pico-itx
if DT mainainer has no objection, I'd suggest to change to enum
	     - enum:
                 - spacemit,k3-pico-itx

although single enum is effectively equivalent to const, but easy for
adding more boards in future (no change to previous code)..

> +          - const: spacemit,k3
>  
>  additionalProperties: true
>  
> 
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
