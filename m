Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FFFC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 07:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvLuGcsYKMJIv5gilapli3c+N/LpVCG7WoHYvJCvoFk=; b=QDe2TwzS0wYTt/8oMb3pyaqFV/
	++husNlKRxXPYH5AUkUyRJks3gGIY7Glp0g+YLkK/tcxWGDHjNqF0pAqX5IZHSJwThZG3NNh3gtcz
	5FeJfE8De1avb36aHZNK4qIEIQK3SoZ5u+oRP7yoATwbn9KYeoll+d85hR1CziVdi9s6Cjlq8+oEz
	rPdY9NGad9OWqe3q0WVQUpB17CgRXAMl7WYdOVhMFUuVundsTLbsJPIsSQN6NsR5/GKR1LcFa8Mmn
	yaMQjPxl8eWKnXKH1ElljsMDHrwq9LJg/uzQvJ2aBnsIYPo1Aays1Q2ytsMaC9SIXM5TXFTZJcJLr
	FaoO3IvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5iuZ-00GLBV-NP; Mon, 27 Jun 2022 07:11:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5iuT-00GL9u-TH
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 07:11:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40486611B5;
	Mon, 27 Jun 2022 07:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DDBC341C8;
	Mon, 27 Jun 2022 07:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656313908;
	bh=3ZJgubkywmPCQXxuzIKF21Hw0LO/rSvHT701i/ePCy8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uga18B0SlsewNvR4KCHLd4KdoS/UqNG7uKWUexXeEaQPQzn8y0r1XAkFc4u2YnSQf
	 h2tElg1l0cEtEub5FgdKTOpBaWnAZi98Gf775BauWNgWnAwlntKJeorQlZIeZsfUM1
	 8hjaG9FyFH/TjSBaDhFaOoRn49MyJOlCg2ouCkC7xYfYVDNZB+w8F9pv+nHYGjyGDy
	 1MlDxIEJbyDTR43AZ4KBUTZPIvKfSXgFJdejDZi1W0lmltRR3U1CLhjD2RIJLYxSsW
	 XwZkHfiNC1Nkm1RnyhMMbosD41t8t8So9XZIcKXf0fOJUvlZtZmlUDPATd1OH1ktf6
	 O4Th7Lu46laCw==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1o5iuQ-003L1w-D5;
	Mon, 27 Jun 2022 08:11:46 +0100
MIME-Version: 1.0
Date: Mon, 27 Jun 2022 08:11:46 +0100
From: Marc Zyngier <maz@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Prabhakar
 <prabhakar.csengg@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-renesas-soc@vger.kernel.org, Guo Ren <guoren@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner
 <tglx@linutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/3] irqchip/sifive-plic: Name the chip more
 generically
In-Reply-To: <20220627051257.38543-3-samuel@sholland.org>
References: <20220627051257.38543-1-samuel@sholland.org>
 <20220627051257.38543-3-samuel@sholland.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <20511a05f39408c8ffbcc98923c4abd2@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: samuel@sholland.org, prabhakar.mahadev-lad.rj@bp.renesas.com, prabhakar.csengg@gmail.com, sagar.kadam@sifive.com, paul.walmsley@sifive.com, palmer@dabbelt.com, linux-renesas-soc@vger.kernel.org, guoren@kernel.org, geert+renesas@glider.be, tglx@linutronix.de, biju.das.jz@bp.renesas.com, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_001150_035116_0B6F25FF 
X-CRM114-Status: GOOD (  11.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-06-27 06:12, Samuel Holland wrote:
> The interface for SiFive's PLIC was adopted and clarified by RISC-V as
> the standard PLIC interface. Now that several PLIC implementations by
> different vendors share this same interface, it is somewhat misleading
> to report "SiFive PLIC" to userspace, when no SiFive hardware may be
> present. This is especially the case when some implementations are
> subtly incompatible with the binding and behavior of the SiFive PLIC,
> yet are similar enough to share a driver.

Too late. This is ABI, and not changing, exactly because userspace
sees it.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
