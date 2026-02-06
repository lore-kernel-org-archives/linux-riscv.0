Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DD5EE6B5C
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 20:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fwiz6n/LuxXGkxY366T6lJVC6l5Bt0WD+56TbP852g=; b=CP+EfVPQx3xx+K
	wnZSMCHre3jxiYacGckTxKXaFz8CEpY0DKO86H1A7rWhDM0GjBpdMxvtmY3jDsul0wDTi3ofqjTGQ
	sunQgyug8OkM8bRBdWYp7ksLIKD9xsylf2B+iY+KPHxhOp5uujOX50WjqpsfNVMEfE7JaW3DU7LEq
	+MpCSNnlK2No80ehZbU2faM+LykjYS6X8hLVAPAg8XKXNRuOrWkyVp5Uh3NE+FQ+zV66yPBO27lXc
	0skJFKgwbRKwkyuKFSkqBvAoXkE5QaZc66AcEACNNCEmX+f2sl/b5boWFcY9Oyz4joZ0aKoEHn3+Z
	oRY+MmukDF0Q/fzIkDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSRo-0000000Bnlj-4APO;
	Fri, 06 Feb 2026 20:29:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSRn-0000000BnlX-48EK
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 20:29:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FC4660137;
	Fri,  6 Feb 2026 20:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D85C19423;
	Fri,  6 Feb 2026 20:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770409739;
	bh=qZTbVS/JaPkFufcDnorgSYb/rg9wuh7ic7gwFOqBzH8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KQrsd5Gtqw7NOT1QAFVbMpIU9j9Mq2CAhuOEBp21X13IGO6A/RQAY9r0YnJ9ZiQTz
	 GN9Eo4OQ2pGCyRpJE9DLIdo3lFcWLimePiezEvtpxZ4VP65x59iW0ibuMZK493OU4M
	 xZnDnpnFx01/weBGJUX8EkXU8zMw/j1eGSo7Ur/HzHD6/qY6AY83s3tIKS3yLMxCAN
	 or/S83fU8TLpGG772wDDyURGNlAoD5LQku3f8i4Pxp5/MqBHzBeZc8D8cwwZWSEUmt
	 r3x0Xu4Tj+StVTjKRu91G/l4m8eSQGOzKLiqNExjPdI2Uni1qcWKBcxZPs3aKsHl1C
	 GpPDM4xuwihTA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Felix Gu <ustc.gu@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: ax45mp: Fix device node reference leak in ax45mp_cache_init()
Date: Fri,  6 Feb 2026 20:28:45 +0000
Message-ID: <20260206-shaping-scorpion-63604d9e4949@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260131-ax45mp-v1-1-a566905c5c8a@gmail.com>
References: <20260131-ax45mp-v1-1-a566905c5c8a@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=602; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Jqmwk48etHBlEGjkMxHj3nrziUNVHXPXWiHSxyYgaOg=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJltfn+9ov8+VNg1a+MHqwWHM8Rzbc5+FTX8MDVpasalL 1nv8mf6dJSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAitx0Y/tnrb2ENsb5krbY0 uHMi9615ITJv93Q6q7VPEZjnI1h51YqR4YDFtwh2T7PJ85SWN57g2qs7qWaS8wXpyHnZ1pvmHW7 iYgcA
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

On Sat, 31 Jan 2026 01:49:09 +0800, Felix Gu wrote:
> In ax45mp_cache_init(), of_find_matching_node() returns a device node
> with an incremented reference count that must be released with
> of_node_put(). The current code fails to call of_node_put() which
> causes a reference leak.
> 
> Use the __free(device_node) attribute to ensure automatic cleanup when
> the variable goes out of scope.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] cache: ax45mp: Fix device node reference leak in ax45mp_cache_init()
      https://git.kernel.org/conor/c/0528a348b04b

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
