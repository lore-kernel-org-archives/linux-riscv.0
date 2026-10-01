Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3E8CA5FD2
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 19:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tbl/7EkejS4Ll257kdSKa3Sv39PajnnmU2LRzzsF2pQ=; b=PtT5iYQqKac4xL
	Ud5OC02jrjLmKq9XEnX3Sq7Fj3x9lL3+BJkDd+u4f5of3FfLaPHQT5sdvlCe1us9wuuSaMa8ak4FW
	DqWBBxAKDakVWS4e1gfrnZyAWGyWlXHOBwNnqqUP/iCM93Cbi40a8sUzVhO99oj7WJjrPboQ7rL/t
	xWSqvGkmrIkR1OVRiqzAavjRO0s2GDfRLWQzqtBH0kWQThtAk/1vpFRbc36iIVeRne3guAtsOJ26n
	ZMxxt0zDb72jr41eAimc8IisvGG7bORNJ1N7gyX+SK5z+8YVK1XtS81NbSfDvH7Vp0JJcQmrlMI8G
	nuYZ5qXxq0tl8pdbFXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMXh-0000000A5RU-0ia1;
	Thu, 01 Oct 2026 19:34:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMXg-0000000A5RO-1qKY
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 19:34:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B8D9602C4;
	Thu,  1 Oct 2026 19:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91761F000FF;
	Thu,  1 Oct 2026 19:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790883247;
	bh=XS99Gu5jVlETiHxHAwkhjbPk/afdzbNu3ftUMxADtWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YXMgunGheOvK5G7JMEFUEg0V3pFyJIW/7csXMwIB0cqtuVfRVEmQa3kK7m6Yqyu4v
	 TS/WR7Cf2uksj7hXtOS8ywSYgdVRnswJX6xqYNeffTZ1t2GkaQ2dF1wJ00QbmuqdNk
	 s+JZjS4Xk4fY98PcNiqlbs8NEPdadt1xYcYkAalGqgguV4GNJLN3+ZNp0TfeW/lD+j
	 uOzbktdj5zzYIDbjFn4STujDpdvt7TXlmaQJPRK9QM1bcu2ywrKCI071e7BK1jXqYq
	 kO1cTI3yOiy507a504xrAjuKWvJGMSFhUeAe46O4ylh3R7s+l78LvMilQWEAu1vUno
	 w1A+ZQvG13n4g==
Date: Thu, 1 Oct 2026 12:34:04 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: thead: add Milk-V Meles
Message-ID: <ar61rDeXPKDOd8T5@x1gen8.tail89d63.ts.net>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
 <20261001-rv-meles-v2-1-c61052262f84@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261001-rv-meles-v2-1-c61052262f84@iscas.ac.cn>
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

On Thu, Oct 01, 2026 at 03:44:10PM +0800, Han Gao wrote:
> Document the Milk-V Meles board compatible with the TH1520 fallback.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/riscv/thead.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
> index 301912dcd290e60f816d380152591106de9415b4..e8170915f4d6d63fbc10a0e6863ea7d5000e3643 100644
> --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> @@ -17,9 +17,11 @@ properties:
>      const: '/'
>    compatible:
>      oneOf:
> -      - description: BeagleV Ahead single board computer
> +      - description: TH1520 single board computers
>          items:
> -          - const: beagle,beaglev-ahead
> +          - enum:
> +              - beagle,beaglev-ahead
> +              - milkv,meles
>            - const: thead,th1520

Thanks for making the change.

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
