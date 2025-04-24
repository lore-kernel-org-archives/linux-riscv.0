Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB42C369D1
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 07:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wug+8MRx8PWh3TE1hpDWOusS6z0y9TI639/qBeSqccI=; b=hZC9EQBx8fSLKb
	LKfWf9q2mjHHWntPY1YZRVPVWT2QQmfjzJiIoKOcSqC2wGWompkwTPWvXlqxKjJc7D+sZdm2oHVYB
	yeo6Ssj8RsV+YqYCfjKmDI2sNyrsyoZfCa5L5oCwnlAQ3Cm42Tg6OOMgS07obZzNfHX/oqVmP+CFw
	Wb9J1z1BJMuwaivXREK6/iV2b13aUwkJ0uAgJpIPnp8sAZYD9SnaNN4uEKNZHadIKP8rPyYwosPpx
	YG0X4COyLhHIL/YM5FB4GMgxtEL4L5ktXDPAMFnsyLl06v/TEYGVtZmDpjyhNOTiW0dteNXyqA9Z0
	ZlaqZFmJONAcRETPi3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7r6a-0000000DCUM-2YG8;
	Thu, 24 Apr 2025 07:34:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7r5F-0000000DCIR-3Zd0
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:33:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C07868455;
	Thu, 24 Apr 2025 07:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E2EC4CEE3;
	Thu, 24 Apr 2025 07:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745480000;
	bh=SuP8EraeigJb0KaR9dhLAlA0oVM0b7bWlw5kuLh8108=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NAn5IBCa1HR8cgzP/yQgp/EiVv3myBY0mp+DotdwTIpXvXyZ14/MJUwmL6OdMvjUv
	 KI8WGC0P/EY8lc2jDgnXraGmBOZs8wUK39z3R69blFJ54MTgb5/4QLvVHna+buVBNv
	 GrmUcxdw+gpa6jwyC87fekJTv16cFXG5mp2R97yZGECyBfgX5X/slw0jch2C+MomMs
	 wixVvFDPCXIzoGsFaR8gYX/kzKrb9Xb4PDWYfTfKK4lX13WCzgQPvOO3N2QsBISx4h
	 iSOsD7gZKVAFrCoa2x76r1X62CE0B50BtKjwitjKBVFf2P6yFFWLqLN50jK8cF++aW
	 EvDM3Pn7jCG+A==
Date: Thu, 24 Apr 2025 09:33:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, sophgo@lists.linux.dev, 
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, dlan@gentoo.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 1/3] spi: dt-bindings: snps,dw-apb-ssi: Merge
 duplicate compatible entry
Message-ID: <20250424-awesome-caracara-of-priority-57f9dd@kuoka>
References: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
 <20250422-sfg-spi-v5-1-c7f6554a94a0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422-sfg-spi-v5-1-c7f6554a94a0@gmail.com>
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

On Tue, Apr 22, 2025 at 10:27:08AM GMT, Zixian Zeng wrote:
> Microsemi Ocelot/Jaguar2, Renesas RZ/N1 and T-HEAD TH1520
> SoC-specific compatibles, which eventually fallback to the
> generic DW ssi compatible, it's better to combine them in single entry
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
>  .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml       | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
