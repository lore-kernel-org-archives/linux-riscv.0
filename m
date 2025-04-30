Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30BCC369DC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 00:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzd4QQTGvxxju2hiRvUVu6NekfgQgfJDLAzXnOllB8s=; b=qQAUr2woqa6N5J
	6SfXTeo9po9hGfWEgT34bZOZZ5gZLLMWt/LIxPJ4uqofnnSQ6CFnqUbVNpEzMlHXd6L4G3SjL9NI4
	x7Rqz7HCn2s5dxCJkcSIbVTguneL4WJEb+eCz77tPLQ6IgUO3/A2rrLAfTx+R/pf9WA0ABJ78UNni
	T63MeIQxBopJq/8i4WwSi3uMnhVRC1cKSSI49lGrR6lcZ+hRv/MLeXlx1Amzddzq5t+JydifmeIhu
	acgK2B/8MqC2tVBg8ZzN3lde3HL+wsTxpH3Sb+oNckM28gNeqCETOFk+sgGoG40EH/8DOPMoaaRxQ
	r1omXl9v48IXOqZAf/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vis-0000000BONZ-2Xmm;
	Wed, 30 Apr 2025 00:54:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vir-0000000BON7-0nk1
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 00:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FaYzwpAA8MCcGgJIqcyu4d0FqP/Wt1wrbeHuoyHAXMA=; b=DQsDtSJ0Mr2dR6PpQ19pLmo0Gy
	+Y27X74A+T5mKlHaRN2LS6DulQNwmEL9tiHtlj0Xg7MkKWTNLh/0unXZOIoQykcB0GJxTAdWLUFsM
	atFiFfzHLVXeKUoRMSoUCZGX5XmBD/YiAyacJOD/vWWZJXSITlxAiOMF778kqnopWFWOxNa3e121t
	8UDr6/OiPZ1y93SjLhGu55mll7R8ep3uVf9AkqrgmV63HO6lApqd950IrE+jC5uHqs9fAC0XDtWKX
	FtfWyntDb6WjEuPqmMR3Wm30WxPoobAeq45jG11i1gu0iJA2e14Ub05z6oNWzzujCQ74M7W+1MYpC
	qqgVPrDQ==;
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9vil-0000000Dbce-0mDW
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:54:48 +0000
Received: from localhost (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 974E3342F9C;
	Wed, 30 Apr 2025 00:54:29 +0000 (UTC)
Date: Wed, 30 Apr 2025 00:54:15 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v7 0/6] Add clock controller support for SpacemiT K1
Message-ID: <20250430005415-GYA187600@gentoo>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250415004612-GYB29591@gentoo>
 <deb072638716e9978bd6381352cc721b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <deb072638716e9978bd6381352cc721b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_015443_561008_42953169 
X-CRM114-Status: GOOD (  14.77  )
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

Hi Stephen,

On 13:49 Tue 29 Apr     , Stephen Boyd wrote:
> Quoting Yixun Lan (2025-04-14 17:46:12)
> > Hi Haylen Chu:
> >    I'm quite happy with this version, as all the issues are solved,
> > Thanks for working on this. I will give my RY and start to queue them.
> > 
> > Hi Stephen Boyd,
> >   My plan to send a PR for inclusion to the clk tree in the 6.16
> > merge window. But, let me know if there is still problem I overlooked.
> 
> You should send the code now. 
Ok, will do

> The merge window is when subsystem
> maintainers like me send code to Linus, not when SoC maintainers send
> code to subsystem maintainers. 
Sorry, I was not precise on this. the PR should target for v6.16 via clk tree

> Typically folks wait until around -rc5 or
> -rc6 to send it for the next merge window.
Thanks for the information, I was planning to send a PR to you (clk maintainer)
at v6.15-rc6 which should eventually merged into v6.16 ..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
