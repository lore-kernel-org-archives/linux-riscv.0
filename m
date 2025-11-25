Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC32D0EE18
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 22:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zhm7NmSbfPI+Zg9X/+6AySJXjiFRH5Bi8vdP3mHCNw8=; b=veizmUc5jsXdOG
	4N5+0s4tUKhjFyr87q3PuaPhjADe7V7nZ58z2gnJlW/7lul1H0YjD+gI4Ts/Pp/0cjeBbFE63PkG7
	QiyimTjf1uz7jxCBhL0rynDqYvmFXQTUQ3dwHd0AXZ6BTeECA0UsFjp+kLg2N2gr5vx1zHJA+KuNG
	yPP4DC80obigO8j3+Pe5KY6K0jCZMegohULjY45RIGzstichXpWlamS4GuIgr86KM8s5iwUjxosAq
	srNJ2pCW12cROFr9e4LFTsaLGlY4iUaeT3PINO7qDIJSadWkgAP3DXVnbQpK68zLO30qIyQlyMlWH
	b0wd/xut2ikAqQeyYlRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO1UZ-0000000E0L3-3sVl;
	Tue, 25 Nov 2025 22:26:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO1UY-0000000E0Kf-0HOP
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 22:26:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2936F600AA;
	Tue, 25 Nov 2025 22:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22604C4CEF1;
	Tue, 25 Nov 2025 22:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764109592;
	bh=I1UXB6JthLwvWGpoEbA7H3OftO65su2/Qx6qU9nsIyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZSjbMeR2t+HWEzQ+KzMdA5IPI032/CGJOCmnt3AUa9nliR+waToZ/+QSAL/EaIz87
	 S5+fvJRetpTp1J4Y69doJYw0tqTynE/6fWbC35dg99KhVp3fYf4l3Hy7nC51/0UcFQ
	 qThD0WOnNY5+aRYvbia8MfQaK41fbMAuN0zNIZnc2u8HjOBlc00kGmkuo/48dvu6mz
	 wlEuhLTqw0dm5svibMyQFKUc0EjSV2G7QJdig5V2cogIZu826sL3+6L/8DWdI+LBAb
	 7oF2MyJI+3dWR+nCPsnXT/O5m+SQYkHNJ6WMD/tLpZ5o8G/ZYV4Hcob5Fz3ozIy902
	 6fwSW/KsMUByQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>
Subject: Re: [PATCH v3 0/2] riscv: dts: starfive: Add OrangePi RV board
Date: Tue, 25 Nov 2025 22:24:37 +0000
Message-ID: <20251125-maternity-undercook-b63205b44225@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251123225059.49665-1-e@freeshell.de>
References: <20251123225059.49665-1-e@freeshell.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Oly6Yplrra9GN4anHWynjV7GRot3Cv7JXe68gZ1jswI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlqOks6fPeYBxudm77ir4fNcnmXi8e9/+3Z6y44O+nph +/qUzev7ChlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEHgcwMtzZmv19jinrSpcl Yq5TV7geyZA4aJXnw9Zkys+cIbpGSZjhr0Cqr3g746Vnl8LNq5x8jRpDiu8pxs+plGm+8pebY0I LFwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Emil Renner Berthing <kernel@esmil.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

On Sun, 23 Nov 2025 14:50:43 -0800, E Shattow wrote:
> Icenowy is busy and so with their permission I have applied v2 review
> feedback. Additionally I revise the commit messages. This should now be in
> good shape for -next
> 
> - E
> 
> Changes since v2:
> - enable active high mmc1 card detect gpio
> - drop delete-node from mmc0 reset pins following commit fa939a287224
>   ("dts: starfive: jh7110-common: split out mmc0 reset pins from common
>   into boards")
> - sort phy0 properties rx before tx
> - revise commit description of SoC peripherals as list
> - revise commit description of compatible binding
> 
> [...]

Applied to riscv-dt-for-next, thanks! I know I mentioned waiting for
Emil, but this stuff is actually fairly simple so I just went ahead
with grabbing it.

[1/2] dt-bindings: riscv: starfive: add xunlong,orangepi-rv
      https://git.kernel.org/conor/c/d94ebab404b0
[2/2] riscv: dts: starfive: add Orange Pi RV
      https://git.kernel.org/conor/c/5b70764e1019

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
