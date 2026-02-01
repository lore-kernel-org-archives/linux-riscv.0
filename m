Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5E5E7C711
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Feb 2026 05:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GGZ//v40ssA4Ev90yTLda8hv8Q2gY6pt7z4HZYjZks=; b=r9RmWsy/zHbQpQ
	+RTZvpnXdXcvZOa4U4m1PtgC8HIXKJuwfuRculg01J3yzmrcoyGhs2OJlxQkcHsl4NLrZgYzRtH/a
	QJ7THYnsf3fiyn7+yZMis0zhVY6ypf0tYkcJQ0sVeBH2/BZ2lqWqBD1hVCAoh5NIgQq3EGGE1ye8p
	xZT9XCCxplvNkjQDlc8LCM1Pb/OWOk9eRMR2iyFLPOX+DLrUNytEl1njt8SUPBwp2ec+fUEPj/LqZ
	sa6UsUKsSYrOCBbgw2LhKjFQTjCt48+5PJtNWViJ7F6e6TGv1jpdeRjXDZRyLHZyIOtZq2PAc0N0O
	zX9Cx4X2zjfaKhMx2l+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmPqk-00000003Gid-1cM9;
	Sun, 01 Feb 2026 05:18:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmPqi-00000003GiP-3pvJ
	for linux-riscv@lists.infradead.org;
	Sun, 01 Feb 2026 05:18:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E61BC60053;
	Sun,  1 Feb 2026 05:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAC6C116C6;
	Sun,  1 Feb 2026 05:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769923093;
	bh=+kybUpnrtFuQGoWMBCIC3fHFNqt5wBdFD/Eo2b7zfE8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Npbid27TLuRheWz30x8RMRnI8qh8TRjYy3rqMGSvdaKHAg4144DvCku3jAsBRtkN4
	 I08P2T33RIwwsysKE1Y3t65K+MEQUeVptS81TKdP5YyvaCny8f00KO97KCKChhbc9o
	 IEjaIdEc6q1U+P8hCtV6lLh3QTYAZkGCwp9/dom0=
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] riscv: dts: spacemit: Define the P1 PMIC
 regulators for OrangePi RV2
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
In-Reply-To: <83affc871efc5fa1c1a08643e66a2dc42b47f24c.1769895215.git.gaohan@iscas.ac.cn>
References: <cover.1769895215.git.gaohan@iscas.ac.cn>
 <83affc871efc5fa1c1a08643e66a2dc42b47f24c.1769895215.git.gaohan@iscas.ac.cn>
Date: Sun, 01 Feb 2026 00:18:01 -0500
Message-Id: <176992308158.607015.4408866122835179459@lemur>
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

On Sun, 01 Feb 2026 05:38:10 +0800, Han Gao <gaohan@iscas.ac.cn> wrote:
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts 
> b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index bd1e45e95e38..f87c6ab417c4 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -110,6 +110,116 @@ &i2c8 {
>  	pinctrl-0 = <&i2c8_cfg>;
>  	pinctrl-names = "default";
>  	status = "okay";
> +
> +	pmic@41 {
> +		compatible = "spacemit,p1";
> +		reg = <0x41>;
> +		interrupts = <64>;
> +		vin-supply = <&reg_vcc_4v>;
> +

This vin-supply is replaced by per-rail supplies (vin1-supply through
vin6-supply, aldoin-supply, dldoin1-supply, dldoin2-supply) in patch
5/7.  Consider using the final supply properties here directly to avoid
an intermediate state that is immediately superseded.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
