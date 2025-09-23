Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AB5CAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4eTs5wJ1guhCwsPPIuBHJ8ae9tZLOEFUp47Da5gc7a8=; b=kNXxgN+UCl0xXo
	02al9xhbUlaryiJIz2z8aquKaqB51hlTMKq7cnkJaeksQbUmwLlnJxXso47ty7bPxsfzrjz65vZPq
	x+roa+R+H0e0sKvsaCVEhmuKCi1fmXxColqXt6TUlZLAyAdzhBkphW6vWIlWlkJdPy8/U+ch1/VgJ
	BKlfpkMSxlCRCxatnHQXy0pVAIB2/llwuw16XI7GOyZIxb/Kxs7Dhlydl44AcfkdsfaThrdCSXULi
	NoWIB6ZXu7bHmGhCxq34LpwIVNZOp7nEfstCI4gNhJhuEriX08VZwyf9nb9m35vGzcYelWZ9nlymP
	kjmdcJdpyPfgLIdwZYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18q4-0000000EgZe-2yAw;
	Tue, 23 Sep 2025 19:38:12 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18q2-0000000EgZG-2rsa
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=N/nltPOP/QTmAWmBxseflmrts3lUXytkbtm/LXWfigA=; b=FxCoqPOaqRZ2R8Aur6im7m1zHc
	kq0hECdk+rLeSLs6UNViB1WNIiGTwLu3YfOC4vLjWZn7L05LcE2M23DyVERkIabZYZz9rW2+fF/m/
	+xUtDVn6VzFvKxNPo3VFOQmaFYnzhWe3jWHJOWm9qDBT29YheMTLZ2bXYhekRIFnwRR8CvHZehiSv
	Y9XtxbiBcuzeta3zqFMvj5aon4sNSDaFgXhnTPUqTP4MOllot9kNbaTfz5Cdi0ATdS/is9O8g4bSY
	ltF4F4247GUGlMHnLIW+MOAL4iHVLCV5uJGOF+O3lpV/Homxbg9fy1KS3M9s8v0xq4BjLJjJDkEiM
	uSpI0+Tg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v18pu-00CB5i-20;
	Tue, 23 Sep 2025 21:38:02 +0200
Date: Tue, 23 Sep 2025 21:38:02 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Message-ID: <aNL3GnfqVGyS9AL-@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-3-aurelien@aurel32.net>
 <20250922032158-GYA1291757@gentoo.org>
 <aNDVX9IrDbH2w7yJ@aurel32.net>
 <2A310AE601C62BAA+aNH7IfsDeD7-Vrxf@LT-Guozexi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2A310AE601C62BAA+aNH7IfsDeD7-Vrxf@LT-Guozexi>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_123810_720586_EE3514E6 
X-CRM114-Status: GOOD (  12.78  )
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

Hi Troy,

On 2025-09-23 09:42, Troy Mitchell wrote:
> On Mon, Sep 22, 2025 at 06:49:35AM +0200, Aurelien Jarno wrote:
> > On 2025-09-22 11:21, Yixun Lan wrote:
> > It seems to only contains board infos (mac addresses), but if there are 
> > other use cases, that can indeed be dropped.
> Then you can split the EEPROM into different parts.
> Each part can be described as an individual nvmem cell in the device tree.
> Some of them can be marked as read-only, while others remain writable.
> 
> Documentation/devicetree/bindings/eeprom/at24.yaml +15:
> ```
>   - $ref: /schemas/nvmem/nvmem-deprecated-cells.yaml
> ```

As pointed by Vivian the best for that is to use "onie,tlv-layout". I'll 
do that in the V2.

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
