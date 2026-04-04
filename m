Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E071E88D8B
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8vrtLsvljT+3eXLto+Z4Opr1raOkNd2pG0noRTsSwc=; b=JnqEk9hddzATXx
	T6vAFXPCY2OV23Y53vRSgWhJRv9Wr6eHD4tqSrWnOt8uQhRkPRYA10wXP2lmmuEqmc3NaNHnKKwWH
	FbxmE3dqDyykoFfq0IOtkx9hN3GrIxOEYJUOodP4RpPC6TK15sdpVRPl+dvrpI1CaplnVy6fqIwP1
	R32C0YdTl4hRemRbYxKMItn7JPfhUt+iUbqGI/OSSO3+yBq1cnoSvYGaRnAwKryuYktNexbRWImVi
	i23br3m9Cd5/7M5GkGqPphhBEyzGqpXi1R/ziNm25RKKa+b3hQqZCNHaDnHpF4zAqaarXUgAuw88L
	lhnC3Igs26hkJykO1/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8w5A-00000003Gmn-43Ag;
	Sat, 04 Apr 2026 08:10:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8w58-00000003GmT-3OH0
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 08:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C2BB435CB;
	Sat,  4 Apr 2026 08:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB96AC19423;
	Sat,  4 Apr 2026 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775290214;
	bh=0GCu5nkM0KBp8/WXOLonVDg5m0C5kdhGNfwrss8y85U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZ0FcM3fy6etdxKm2j9/6E0S+sOmVswILZRMTN0kE2Y6tv8SFCJnZ7HxLHQ7HwFnZ
	 GSYyGO8QDhkn+Xt4PTmqdeDi7Qhgib7KEoO/EKjm3biBCBWhlO8rhiuA2MZ2zdL7m0
	 7v7oZmnKzI0hoLCHKQ3P5W0YqKS5UKrR/CZi+X3pSOIqB5OTg8WfZoa0PK27Nw4TnS
	 jZymhR9dX1P7HX/B9RHNFo7DB9+hqva8ge1/9bTkiIm7VhOxiniA2vfz3bld+d4K6w
	 weg1O1sbRNiPztXCikFw5eIdEnJxpXqtbWIF1Fg7nhOeOxGnKbt8Q8QUGx7wSiKkLu
	 oxXGCKtgov5eQ==
Date: Sat, 4 Apr 2026 10:10:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com, 
	unicorn_wang@outlook.com, inochiama@gmail.com, daniel.lezcano@linaro.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	dlan@kernel.org, chao.wei@sophgo.com, anup@brainfault.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, hanguidong02@gmail.com, michael.opdenacker@rootcommit.com
Subject: Re: [PATCH v5 3/5] dt-bindings: soc: sophgo: add sg2000 plic and
 clint documentation
Message-ID: <20260404-rustling-shapeless-ocelot-b2df71@quoll>
References: <20260403111516.379795-1-josh.milas@gmail.com>
 <20260403111516.379795-4-josh.milas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403111516.379795-4-josh.milas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_011014_891124_F5F13C0C 
X-CRM114-Status: UNSURE (   7.54  )
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

On Fri, Apr 03, 2026 at 07:15:14AM -0400, Joshua Milas wrote:
> Document the compatible strings for the sg2000 interrupt
> controller and timer.
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml        | 1 +
>  2 files changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
