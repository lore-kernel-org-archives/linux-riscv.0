Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003F9E7C710
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Feb 2026 05:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HikxC4ol3EkUBTSMJjbTi23yf67D7luXSOJ4ccFwhiU=; b=JZlbHfNOv54X/4
	paXbUKJsl7YUVA8S5mi2drKXdMKmNf1BViKZCv6L+rLCVzlKAH6P38w3aP3Wd8mlwwUa1xovmC8V0
	wsVPKUs6Rbwt7o3mtQ3nRdQ/H2aCDXG5HNqgTwCkq1tt7BlDZGJJ5x1H0gwxdZKEcqRI2yEh48NHG
	YuVdHkhbWmsmF5p3N/0WtZh0sYfux8rPTI99w510dBSNPyrd8xS5Pvj0ITAb6E3ajyRsYW+nkz6dQ
	1BwEMrzWHxZ4aWr/tfsPXxMuxHtbdvU2w84WoU7vRnQUP5r/LDI7dGa4h5cKfKlYgc/klS0f54yRM
	VVsQI1hofceUkq5cQSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmPql-00000003Gin-00i4;
	Sun, 01 Feb 2026 05:18:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmPqi-00000003GiO-3wmC
	for linux-riscv@lists.infradead.org;
	Sun, 01 Feb 2026 05:18:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6058B601F5;
	Sun,  1 Feb 2026 05:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1186C19425;
	Sun,  1 Feb 2026 05:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769923095;
	bh=1le60W0oigdWByY/8TD5ojipz7cEh6LqP0syr4z+JTo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Nxpw8i57i+vomNkiGk7QHu0zC+/5rO+7z96KI0B/h8rGqcyWlUMPYDn8VcXtldeM3
	 rQ8wvzRfo8+veCVX3nFKD2f28+fBpld4fXAHTK+3sm3Mqnpibg+rMUj6qrtZiwPDo/
	 QQVCjCBpW83EAKpKe/6P12FJ+ujtAqQYW9B0pS4k=
MIME-Version: 1.0
Subject: Re: [PATCH 5/7] riscv: dts: spacemit: Update PMIC supply
 properties for OrangePi RV2
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
In-Reply-To: <485bf9935397707158529bb7c0eec6cb20ffbcc3.1769895215.git.gaohan@iscas.ac.cn>
References: <cover.1769895215.git.gaohan@iscas.ac.cn>
 <485bf9935397707158529bb7c0eec6cb20ffbcc3.1769895215.git.gaohan@iscas.ac.cn>
Date: Sun, 01 Feb 2026 00:18:01 -0500
Message-Id: <176992308158.607015.980372835663972481@lemur>
X-Mailer: b4 0.15-dev-da43f
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

On Sun, 01 Feb 2026 05:38:12 +0800, Han Gao <gaohan@iscas.ac.cn> wrote:
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts 
> b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index d8d0baaec731..c0a0c96f2ac4 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -134,7 +134,15 @@ pmic@41 {
>  		compatible = "spacemit,p1";
>  		reg = <0x41>;
>  		interrupts = <64>;
> -		vin-supply = <&reg_vcc_4v>;
> +		vin1-supply = <&reg_vcc_4v>;
> +		vin2-supply = <&reg_vcc_4v>;

These per-rail supply properties (vin1-supply through dldoin2-supply)
are not declared in the spacemit,p1.yaml binding, which only has
vin-supply.  With unevaluatedProperties: false on the PMIC node, these
will cause dtbs_check failures.  The binding needs to be updated to
match, or these should remain as the single vin-supply.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
