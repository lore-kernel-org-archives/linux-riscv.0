Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D856CA1013
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 20:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uu2huEGtqOihzwxx8RHQpH+SPfsncHusl5BjrgKScIw=; b=aue9LviwXfoytF
	aoueASImZiDhgPIYLGlBZU0DqbfQGpVsvRZxExP01O3qjQuX+77dEx9AA6BIIZh0Y2ujmbSDGOqus
	ITg4l6PRm+tQlJZVAcyZM/Szw/bccwqINfc1TiZTDYczN7z8vUjd//yJI5Yz9JS2dV7xVRqBQlJLk
	l3pOAjcMv0hf2P0h/d/lz2m0kt0bSIyXHRnv3TcAKgz8lbCVpPtc8+DLgI8bAqn/yhq2KD6JDsNbw
	ffw763DxsZ4yb7jnQLyefF05m5TJesQy0+Vt1/6/2LNWQ+oQ1N3ZqmZY0rRM0gdAVSxZESBolc6ud
	frvGOqk2oWf8GXZaCzhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGc2-0000000EGe6-0Dgm;
	Thu, 04 Sep 2025 20:31:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEDy-0000000DPqs-0fr3
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 17:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE03D4050A;
	Thu,  4 Sep 2025 17:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DCCC4CEF0;
	Thu,  4 Sep 2025 17:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757008697;
	bh=7elZHPtlC8l1IoBhLhG19SetZaPA34oBP89NcJL1vZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jSwL9s7Y4bphJ02iOcCICAt0fmm9wSRhKUHQtPF8wWT1kgZIA6nbpXgr9OP/mk7X6
	 UKxo3ceeO9UBqgT7UgI8EHwSiV8p8pEz4ROt0wNKhrBcCJn7Kp6PE5COvNBZisQSQX
	 fYLPnekQBa2mdR4NsRWZO4WFuL/DLk7iCBSgYaNGLyowAbDlkhzjBtL7AcTJLer+nQ
	 4rHOmXaGgIM6jtgf264SmOqcIE2PFdRPwfkFh55myqQJT2q9uv0k7/l+zDBRL0Mi3B
	 uPNzY9g/oFSSvuLmn3kJLRTPCzVh8/7tit8SXI3bGgYu4izi1E1Y8GwmW7KVBpdtRf
	 mGcUNexmUCCfw==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>
Subject: Re: [PATCH v3 RESEND 0/3] riscv: dts: starfive: jh7110: More U-Boot downstream changes for JH7110
Date: Thu,  4 Sep 2025 18:58:08 +0100
Message-ID: <20250904-grape-convent-8c36463138e2@spud>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250823100159.203925-1-e@freeshell.de>
References: <20250823100159.203925-1-e@freeshell.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=863; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=DvqGObKk3A0+efhmDIZrcZyaCaRbYupeDJa2E7LAsUk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBk7L+s3Snxw437T+XjHhfpo1+ZZyqa1CyYcUDCa73HDc K8Pu+GMjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkRwPDX8HiCjtDnrZgptXG O+N+/p7ye42ynqfAw6TIU77BZ7+q9DIytE1lc26Tvv/uYj+7u5SNzZdflfuPB7KFmlUeMz1g1dn FBQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_105818_225672_6F58B666 
X-CRM114-Status: UNSURE (   7.36  )
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

On Sat, 23 Aug 2025 03:01:40 -0700, E Shattow wrote:
> Bring in additional downstream U-Boot boot loader changes for StarFive
> VisionFive2 board target (and related JH7110 common boards). Create a
> basic dt-binding (and not any Linux driver) in support of the
> memory-controller dts node used in mainline U-Boot. Also add
> bootph-pre-ram hinting to jh7110.dtsi needed at SPL boot phase.
> 
> Changes since v2:
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/3] dt-bindings: memory-controllers: add StarFive JH7110 SoC DMC
      https://git.kernel.org/conor/c/f5e36ecc9e4a
[2/3] riscv: dts: starfive: jh7110: add DMC memory controller
      https://git.kernel.org/conor/c/7114969021ec
[3/3] riscv: dts: starfive: jh7110: bootph-pre-ram hinting needed by boot loader
      https://git.kernel.org/conor/c/8181cc2f3f21

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
