Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1856BD5E39D
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 15:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCm9BN9sWbjz0Q4JGmzcr4uc57PdtT1fzHi8BLsJJtk=; b=iqj9ssBwpW8weo
	39tEW4cEg3lU0IpMn3rYqpIm+zLNtjB85kkG8trCRRlqwlO7zacYZRX9zGOJKkK1jI47eoZoTJ+2X
	tFL/sy+n3lDHwG6zWrcZQjYxjxPE1Ngq7SJlvbp19n+ZanodPVoRGV8zO9OmPEX5Z5Gn5t4VbzDat
	jF1NxcU5tc1gm+8GftD/DgzI1oUw0rg4hDC7DcQD0gBRRsbfUmZblBm61iNrYYUhb8KbEv+bOR596
	EQ0hfvrT5HMbtX4NxHfB6NT8/+6To/ZUmyPPy9xuAlYRu4mLGpqraMqPHNvfNr6i88lyc+Troia5G
	6tC61dvHGSWkplTp+kHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWcY-00000005PK8-3bc7;
	Tue, 16 Dec 2025 15:05:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWcY-00000005PJr-1RbG
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Dec 2025 15:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OHreVBKjGF2j1Pq/Jgx5M+c9zG2uR52iZdSiy1kKuNY=; b=XFo+BBhjKpA9I5gVVdSykwN1wR
	qrn34sM3UeTXf/U4vbYnyaOmJM7OKnevn3MH27QkvcsR87lvPfcfmPHTzMFWUb3tZ5Lqunhe7bUXO
	uq9e/AePuBKQbwVQNKIwgwF4NrgQax9aopfqHavfIjVE6pgUxD3PwCB7XQCfoJ91Jf55KdgyxFoSG
	iO4+kvts8EdfVBWFVba26S+qfS5Gd+C9je5TBuyUVDQfwraQhKXOVM2N1wG7bA8SRMuyrLmnQEXWj
	5tmEu3RZ1xulUMSG2zAQH8tbCX5OsdvFz2XYK0K0EXedsMdzca4n4IZqTs68Q6wIf4k0LDcslsGbY
	5UhB2jBw==;
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVl1-00000004zBv-3spI
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 14:10:33 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2E93C3408CF;
	Tue, 16 Dec 2025 15:05:36 +0000 (UTC)
Date: Tue, 16 Dec 2025 23:05:30 +0800
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
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH 6/8] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
Message-ID: <20251216150530-GYD1903981@gentoo.org>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-6-a0d256c9dc92@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251216-k3-basic-dt-v1-6-a0d256c9dc92@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_141032_292703_CB52480A 
X-CRM114-Status: GOOD (  12.08  )
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

On 21:32 Tue 16 Dec     , Guodong Xu wrote:
> Add DT binding documentation for the SpacemiT K3 SoC and the board Pico-ITX
> which is a 2.5-inch single-board computer.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> index 9c49482002f768cd0cc59be6db02659a43fa31ce..003b0bc1539b621e39172a0565dfea1274cbc8b8 100644
> --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -8,7 +8,8 @@ title: SpacemiT SoC-based boards
>  
>  maintainers:
>    - Yangyu Chen <cyy@cyyself.name>
> -  - Yixun Lan <dlan@gentoo.org>
> +  - Yixun Lan   <dlan@gentoo.org>
> +  - Guodong Xu  <guodong@riscstar.com>
please simply use "one blank space" here, it's more consistent,
trying to align them like this would result in even worse situation..
 
- only email addresses got aligned while not user names (first, second
  name?)
- adding another maintainer in future may break the alignment (if long
  name)

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
