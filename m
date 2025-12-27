Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0207CE9271A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 18:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mtkBQ6uL4j4IhjtRxH1aM+hM4gFTx7INfp0YviUzBnA=; b=caOCB1JJQwlAkf
	IgDIwLxpH1Q66uH1UxqZLA2ruA36C35mZH01W3wUxe5K4JZ/jlbCI/lPZkhJ5rNMzbeKJp7X9Dxv9
	8WJ82lcZvOeaZ0iYYDxynsCWZtxWOqJ6+AeykHrwdOFLvzYWtrWLGt1poNF/X6L9V6RO+d5QGY6Ho
	yQ/WkY97JDJlL5pMYaq1NAMU6XGwo3CHmp1kCbfiPghG3lpgFOLIYKPyskisCGLSmJ4ayuf0x6Xjx
	e7GZrgovIzP+FP1OrA3BaUJiTUnIw7v5+Ju14mXuasJIm/Zqck5b2HdNts9LLwIjaQNBbpZ+IdSig
	9m3IALNF8O5KURxFQEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZZPG-000000028dY-32C3;
	Sat, 27 Dec 2025 18:52:50 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZZPD-000000028dB-2EVu
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 18:52:48 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7FCE0340F7B;
	Sat, 27 Dec 2025 18:52:42 +0000 (UTC)
Date: Sun, 28 Dec 2025 02:52:31 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: spacemit: add k3 syscon
 compatible
Message-ID: <20251227185231-GYA2018741@gentoo.org>
References: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
 <20251226-k3-clk-v3-1-602ce93bb6c3@gentoo.org>
 <20251227-glaring-aromatic-raven-cbe30c@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-glaring-aromatic-raven-cbe30c@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_105247_596136_7F16A6F5 
X-CRM114-Status: UNSURE (   9.23  )
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

Hi Krzysztof,

On 12:25 Sat 27 Dec     , Krzysztof Kozlowski wrote:
> On Fri, Dec 26, 2025 at 07:01:16PM +0800, Yixun Lan wrote:
> > The SpacemiT K3 SoC clock IP is scattered over several different blocks,
> > which are APBC, APBS, APMU, DCIU, MPMU, all of them are capable of
> > generating clock and reset signals. APMU and MPMU have additional Power
> > Domain management functionality.
> > 
...
> >  
> >  properties:
> >    compatible:
> > -    const: spacemit,k1-pll
> > +    contains:
> 
> No drop, there is no such syntax for this property, so you copied here
> something completely different.
oh, will drop it in next version

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
