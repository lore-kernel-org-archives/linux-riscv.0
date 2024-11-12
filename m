Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10567D42BA3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 16:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOuDmCLp6h+2LrgMhyksETzz0o6yPkNPWHIhOIFXDuM=; b=2TEp/pqlH0a4Ln
	s3kgwKnarb44UztP+dknAz1YKivuPPPm5S4MTB56dYVlMls4HZlN5D8iZP9AjfwKEYsB8MKLs3lul
	ROSDUQ1NwMsCFsZL+3w+MMFZkTU83Ztxx7cOuEjE1Jab3nRamHxkMGWg+YeCS8Wu7yRv2CpLRgnTK
	/l4I5PPqHtUHuUkrTi6HNUM0aSMlYLTW7KXL+YOPKIyUuvBM+2BuEOEjolVuAqizoU0OmsUROCrfp
	1SFnmhTI7GS+4VVyz9NXkxciDgExSATN7DP02GUhNUizX1fTKDhzUCmwNDmO4rIT1BDJ1wJxQL33O
	FCVfnUFLmoCcNg6NByaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtM8-000000043kY-3OYj;
	Tue, 12 Nov 2024 16:03:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtJ5-000000042xT-3R6Q
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 15:59:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BA855C57D6;
	Tue, 12 Nov 2024 15:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035E0C4CECD;
	Tue, 12 Nov 2024 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731427194;
	bh=gBjlmgJ7MyxGZeccQfr/1Hu9wSchf/D5jYM91Po354w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iWvVb36DyQUc0f490/M+aYYcPJequR1HxJGMbbA0I3/CQq4qbEwlNT2i8sAJuD+hk
	 wBTyCmyMj6nvu8P0e/3LYcunIXU86wXV2X7Z73fUWkyp1fg8F3jcZNXAFdc0mxTH05
	 JpkMAMdBRsy0OFXxr2utdrWh81QPlqEl3FFr53d/8Xz8oAwKLGblMQst2TU32q3bkJ
	 I3AuZusHyoN/TiMcAXo5OKvfE1Ug7Nc7LnMCuM5tjA+pS7qt/nZ0xToOfGde1zK6Zr
	 5FNACUBDtyW83L68lxOPIbCscNeb/uYRAx/RqHE9Cq8oJXXOBPqLHaw41uvvDgxUQ2
	 SztJmfUlN/34Q==
Date: Tue, 12 Nov 2024 09:59:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: paul.walmsley@sifive.com, inochiama@outlook.com, lpieralisi@kernel.org,
	pbrobinson@gmail.com, guoren@kernel.org, conor+dt@kernel.org,
	chao.wei@sophgo.com, manivannan.sadhasivam@linaro.org,
	linux-pci@vger.kernel.org, lee@kernel.org,
	u.kleine-koenig@baylibre.com, unicorn_wang@outlook.com,
	kw@linux.com, xiaoguang.xing@sophgo.com, bhelgaas@google.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, arnd@arndb.de,
	palmer@dabbelt.com, linux-riscv@lists.infradead.org,
	fengchun.li@sophgo.com
Subject: Re: [PATCH 3/5] dt-bindings: mfd: syscon: Add sg2042 pcie ctrl
 compatible
Message-ID: <173142719146.983081.8984976211275970968.robh@kernel.org>
References: <cover.1731303328.git.unicorn_wang@outlook.com>
 <4f030066767c2a3b3acabe24e3dfbb8d87b42bfe.1731303328.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f030066767c2a3b3acabe24e3dfbb8d87b42bfe.1731303328.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_075955_996038_72DB2439 
X-CRM114-Status: UNSURE (   7.86  )
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


On Mon, 11 Nov 2024 14:00:15 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Document SOPHGO SG2042 compatible for PCIe control registers.
> These registers are shared by pcie controller nodes.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
