Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86296C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 08:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/bT84OrSJW+h7tcoJJH3r8dkZY6KIJrqbfN98NnD9A=; b=jDRh/kbg8ZOy22
	DzNoYzTGBlcTar8KVJClNCxHhkbXqhscUx61PIawFAZ06b+ueYqYnyS5Fv6urcdAmVz7l9UVgjloH
	bSSKE+JImdXKgmMwde+Hnz1Wlio6grW3AHkOf+DExPr87iI3cu41QBOaNmwrB1uGqpaBS5L1ZzhtL
	r+XIT3KKUd9WPqqVRQTHI/ltRLaIcf59Rlfmsutj7FR1AinWW6Yb7elur6h//rZDSAyIpeeQlt3dw
	TbXOmxKgdXOSrS7pHbpF3+N25fgr8H/+YJm+6HP+5mn86jJfJJbhB9NDYHTGD973MVgoEQPk+r3L7
	G6oyx0JoFIUJ9JoxKf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7Dr-0000000D7cj-124P;
	Fri, 28 Jun 2024 08:44:47 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7Dn-0000000D7bm-1rPq
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 08:44:45 +0000
Date: Fri, 28 Jun 2024 08:44:34 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2 03/10] dt-bindings: riscv: add SpacemiT K1 bindings
Message-ID: <20240628084434.GA1752165@ofsar>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
 <20240627-k1-01-basic-dt-v2-3-cc06c7555f07@gentoo.org>
 <eb05af3d-85b8-4068-961e-20f2f7d7d0c2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb05af3d-85b8-4068-961e-20f2f7d7d0c2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_014443_528084_22CD65F0 
X-CRM114-Status: GOOD (  11.70  )
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

On 09:34 Fri 28 Jun     , Krzysztof Kozlowski wrote:
> On 27/06/2024 17:31, Yixun Lan wrote:
> > From: Yangyu Chen <cyy@cyyself.name>
> > 
> > Add DT binding documentation for the SpacemiT K1 Soc[1] and the Banana
> > Pi BPi-F3 board[2] which used it.
> > 
> > [1] https://www.spacemit.com/en/spacemit-key-stone-2/
> > [2] https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3
> 
> You got a bug reported by tool and you send the same version again,
> producing the same bug.
> 
> In case it is not clear:
> 
> *You cannot ignore* bug reports, comments, reviewer requests or any
> other reply to your patchset. Each one must be addressed one way or another.
> 
sorry, it's my fault, I rushed to send out this series.
and yes, I should really go back and check all the thread..

I will fix all the issues in next version (tags, dt error..)

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
