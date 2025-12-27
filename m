Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BE4E92704
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 12:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPoALxXnjdyRfupuc7LsnlSsPOekJ+r90NDbcV5bGYw=; b=R/+0q2rrcEBlG2
	DXH1pCXQrFM3xceD+CvTCGo8r47rBg/Qbp8/9Nvu2gM7DCag8Sd6ngbJJWhExnUd1HSl0vxev6ua6
	WfmyKECPVwVRDWBStjKSU5Ij8fJjZU/uQLn+DmlMyUhf+woPqc+VRkvYD0vjVdc5QTJN/d0wY12He
	HGmwZOaErIJHVLILp+1Sz5CHGhIAsB8N1LiehypG6V+uUVdmW4O+TF2VhNiCCcf1Nfqs/ql8AWDJo
	DED2wEqIczQ2EEnUx/AourrxERNndIJG/svwMlNQz2oNafkfkeNbasDmEKNeHn0YitlZfVVTRVs62
	ZNvV1tnYTLbNB5v6XWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTsn-00000001zUs-1S9l;
	Sat, 27 Dec 2025 12:58:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTsk-00000001zUI-33Pw
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 12:58:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D7E34025C;
	Sat, 27 Dec 2025 12:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75D5C4CEF1;
	Sat, 27 Dec 2025 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766840334;
	bh=k4FB5zVKTKqkWa9q1H2Dj2JT2mpBhRONcOMtrdXSqvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3tfka+8fd5bfBRBJw4GDpHKx+C9QZYi1/1GeoC0lJDaWrWmz2VbKlF6Dh5Gbmxt3
	 zFQRB5XBreiQvlF+27l6rjI3wh4CZq3vneXmiIaSEH5dHmX2IIdtfKUOEy/04LSQnw
	 JzJA2jc1HLPsmmx8IC/WMYAzGRJLiGM+T/sNtiUGc8eG9hb1kRLXhyAlRgCZ/BGfGA
	 h/HbRz8vyBaJrY/NTTMoR2ovlKY1sbXNHYeoBFV/Ixxj0Ase55sFq/pqomiSrhtaOe
	 hlthOFUkZc5w/rXIcge7f5zzB6ze7sPtrIVA+g0Xx0wkP/qYJjgMB5bC2aYOChjeJl
	 PEgXCD6uSt8og==
Date: Sat, 27 Dec 2025 13:58:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: add syscon property
Message-ID: <20251227-lavender-turkey-from-camelot-ab6aec@quoll>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_045854_783168_6A4F3DB5 
X-CRM114-Status: UNSURE (   8.07  )
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

On Tue, Dec 23, 2025 at 05:11:11PM +0800, Troy Mitchell wrote:
> In order to access the protected IO power domain registers, a valid
> unlock sequence must be performed by writing the required keys to the
> AIB Secure Access Register (ASAR).
> 
> The ASAR register resides within the APBC register address space.
> A corresponding syscon property is added to allow the pinctrl driver
> to access this register.
>

Also:

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

You are not adding syscon to all pinctrls.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
