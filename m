Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0462CD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMGFiADyjU+g63TOK7zTm5sYYRJzQaWc3CbyHoilPuQ=; b=f9P5botefqP38P
	R1fFFiY7NM4wpGFWCcyTkfATx/pSko8C8GnOiDK4Rb9G5bwPO7QyLQ0s/o9fSLfIPF5T5eZP46md3
	pJaj5MHM/EkLwoAA1ApdN6JFQYPXPk1QyGVOPaZAwqKGRJv7xQ/+Cc2RXpdw0uiTdHb8mefCQXvOZ
	/cVmZeKXj8ncSXxQBcAOKE8eYNXEzoAAlKGCqGPeCuZx8gPZp7K7DYD41DIlxBsMwNdynC68TOn6Z
	ju32uZXlHNHmdGLusRmE2nJmjOOqawGa81LSva8hxhLNH8T4s8bWNHLTjqBGJW+JaBxv/1kN3yQxi
	HNljd3hV+kK/lnOUY2mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVEC-00000006Olj-3PQB;
	Wed, 10 Apr 2024 10:30:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVE9-00000006Ok3-0sYM
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 10:30:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 812D66162F;
	Wed, 10 Apr 2024 10:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725A9C433F1;
	Wed, 10 Apr 2024 10:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712745048;
	bh=PFOYzkTQaz4RIV29s8crIVArTeI+klJddc4BaSfF6jM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c10OJVwqruArl5g5dCIgIlZ3UQywtIqmha4t4djM5xAnA40tOoewe49ZDfgnbs38h
	 kDjnmrcSFdYLitqgQsypKWVoUmWkDcXatkwBPlRgrTu6NvrT67UoxwtkRkKX1Y0pfJ
	 Dv8WAyqZxbAAD5rnFwpGkX6xcLah7Ylzn0RqYthYchZ51lDX7xdbDjs/GxU3izIIpE
	 +VSq7LX7heBJlX3KtXnAyQksjEqG6w68dA+JOgWYYz/O1cGRCAy4n3zcELfyYMEp4p
	 kT/GiIQg5C1LiGKQ6M8jPFLf7nFfqoCHRO/c+Zr895CnKGEiv18IaCub+OvG4MR87f
	 PpysPvsBYjKPQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Yangyu Chen <cyy@cyyself.name>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH RESEND v8 0/6] riscv: add initial support for Canaan Kendryte K230
Date: Wed, 10 Apr 2024 11:30:25 +0100
Message-ID: <20240410-unwoven-march-299a9499f5f4@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=g1jnmXwY+mRbkP1JjfYfibR7YG/ZdsVyF8SLWs6lEX0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGliWY7L232dpH74pq6L8PmpOyv0rfqW0Nz7DkK6ErZKi soGl7d2lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCJmKowMm6clMFUtl8+J0Rbv 1PZMy9sh+WNTGH9Jk9VBTqklmxheMfwVrewWtTDnvnTFcO2UWyI7hav2M4pdnCRn5xH9WjBVjoM LAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_033049_334980_58C4396D 
X-CRM114-Status: UNSURE (   8.85  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 08 Apr 2024 00:26:58 +0800, Yangyu Chen wrote:
> K230 is an ideal chip for RISC-V Vector 1.0 evaluation now. Add initial
> support for it to allow more people to participate in building drivers
> to mainline for it.
> 
> This kernel has been tested upon factory SDK [1] with
> k230_evb_only_linux_defconfig and patched mainline opensbi [2] to skip
> locked pmp and successfully booted to busybox on initrd with this log [3].
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/6] dt-bindings: riscv: Add T-HEAD C908 compatible
      https://git.kernel.org/conor/c/64cbc46bb854
[2/6] dt-bindings: add Canaan K230 boards compatible strings
      https://git.kernel.org/conor/c/b065da13ea9c
[3/6] dt-bindings: timer: Add Canaan K230 CLINT
      https://git.kernel.org/conor/c/b3ae796d0a4f
[4/6] dt-bindings: interrupt-controller: Add Canaan K230 PLIC
      https://git.kernel.org/conor/c/db54fda11b13
[5/6] riscv: dts: add initial canmv-k230 and k230-evb dts
      https://git.kernel.org/conor/c/5db2c4dc413e


6/6 intentionally missing, it goes on another branch.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
