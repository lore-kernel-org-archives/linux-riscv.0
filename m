Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B90C3ABCC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 15:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9/VztHT6JT+Cu7eER0bEE/tNAAGEEJqsUyzLQ9p3wg=; b=4E22X9rzdaKr7n
	AygRtgmwEcQd+a7iF/Q5mtqVlYA93B15zoke1gwrEQoXZBmdpVp+ekyAN2xaheil74cLgLhviuZ94
	eWyT5abzep3r+nz39AJibuwr/aoj2Fe+AjXYHmHAUe5iPH9eDPCF9RZwCr0vA+l3treKeTn7jYw8h
	y4cPVbuS044gmJehTsAoXqVAx7IpOUjSywaVbXXO+xLYVCjFhHcjzTw+sp67VNg6EggOEIgCTsrak
	DZ2FslCWd55/fk4oPxr++KXv7oGVdg1NPPRK9tJEQ9rj8Azuumrf2I/r5WYjicDDVwV/tsariVF+l
	IOYKLwmIRPhGAku7oRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDmN-0000000FXON-24ee;
	Wed, 14 May 2025 15:12:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDTu-0000000FTwa-2zoJ
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 May 2025 14:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GqSuR8MBofTLFbwivIFbt+fy/cQ/iBO9kDzrv+ov3jA=; b=IrElC+StaPVeqNoKZK7Kqk0e7Q
	gNKO5GS3TYwjDrz5zl2Qo+G43/3lr+lXtlOWZj8RgnBwYDm6ywX64XJHCOmUjZajRwB9rP4HJXDlJ
	CGd3xV+xjyOl5jHm6butPrBzfJml4GEhMe7daPovW1yauYoRARe1OwS7bqSYDYCYczgEZIcDnwv2r
	aFKSCMXETURVNeRyVCaZOYjSOc6FUFo5QnA6CF8pdPJcyYQL0QyL8NT/YXjjrDTQ4dfOjIZg4/lQp
	bMU7W9MjJ8rfDC3jI12T7h4+ysUda5KW1NEuMuTi4Fxlg+1Ozwln7oCh4NxI6+VxlVkkGn2SjP9at
	VGPFjY2A==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFDTr-0000000HDf6-2I7s
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 14:53:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22326A4DBAD;
	Wed, 14 May 2025 14:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960F6C4CEE3;
	Wed, 14 May 2025 14:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234389;
	bh=HZpq70PxcZCLy6lilP9mOIlfD5LkNvndpjxNjMCCUrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FB4+ROQn+Q5DpRPNLHwehrsFbFQ5dr3MSn6uYe1BHxtuMTN+OAxZ+/1oX5Qb82aLR
	 ANYbhtLPPk4KjUUZGmTMPkCurUi+m4dFJhAz7MBePwhKbJg2b5EIkg/zbn0fXIM8eF
	 4hFjBlHTfu4neZHW2XHVjLKs/dPwbN50pO7mYSmAZ2JWGL1oeHsAyl/DqKDCIsM6bs
	 P2OgHfsY3ekYNzIm+S9QwuqVTaWCt0NJa1Eqmieqhkv3ZwMpgWIjSrh+9dxl3rqeDY
	 qLNi8VqQkdjfzpt69LqE2xqIUTREQOAx1XkEveOy6dQpiZjrayNORg2z6GtHH3KQ41
	 C9jjkuXaskr/A==
Date: Wed, 14 May 2025 09:53:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: krzk+dt@kernel.org, tglx@linutronix.de, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, paul.walmsley@sifive.com,
	alex@ghiti.fr, daniel.lezcano@linaro.org, conor+dt@kernel.org,
	aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
	tim609@andestech.com, linux-kernel@vger.kernel.org,
	geert+renesas@glider.be, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/9] dt-bindings: interrupt-controller: add Andes
 QiLai PLIC
Message-ID: <174723438154.2170160.6461910184012543621.robh@kernel.org>
References: <20250514095350.3765716-1-ben717@andestech.com>
 <20250514095350.3765716-4-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250514095350.3765716-4-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_155311_790746_1C3C7C1E 
X-CRM114-Status: UNSURE (   6.72  )
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


On Wed, 14 May 2025 17:53:44 +0800, Ben Zong-You Xie wrote:
> Add a new compatible string for Andes QiLai PLIC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
