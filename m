Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504B8CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 10:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jmz9cas1FyVrPVjg+JAdgIerZnsOqIzldiRZVThWq0g=; b=z28wjgqVV+CHo0
	D3qchdDFPnDueUavw1e7atBItXBIO26sVx+GnsZUoN9t4zLLfJvH0mbJJInF7r9zYtw4r51iRIWyd
	6/rfrfInxybQlXh+tm9QjC/0XebPQhtUYbbo4UiVsyZibkh3x3z7Nq29yOnH7VuEiNwcesYGWNVm5
	VBDzsqkyEgCUjmNYtWLo4ce7i+DH/LxUlyAsIkzHDn6pF4XDcSiMTixvnrwE04gxoql2g1hBJglX2
	8ze1qAcUOXVlHCh2tKJH03cDoS1fpwZcfiMJ1yKXjHMvlCu+xQ5r++/xMUSk/giwyce+7JZf9nQN1
	mEOqBySK2Hf2lU5T5PHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVRZ-00000006TJY-1QQj;
	Wed, 10 Apr 2024 10:44:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVRU-00000006TFo-1X5q
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 10:44:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 87152CE2710;
	Wed, 10 Apr 2024 10:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CDEC433C7;
	Wed, 10 Apr 2024 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712745873;
	bh=d+0+LR6L1IBAup/75jhlBSGYcw5/zriWC81MfvfVkUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JAMREDu1dIcEcDV+g0187w85+XnxoAL7Z3ymPOCHjQtuoM9LAYXtv0JlvF4pj66Ba
	 tODxA4yYGGU/pRF1u0TCwX1mvm04SgYtnI6qTieo4C4kwm0+Y/znmPM04grT5qRn1J
	 q0bPrWPNvaDs/Ip7k9bpxR+TLiyiLALgyEOFGS4+u4I3bFJWn81AtQ9jCfmi5etT3F
	 tVC5UEvTqSrez89WnhfsaA2qALK2gihRxR9Pi8XyrBFADfIJW1dm1aTgtfs+DaKrWb
	 onGQrQWk9oxtzVkcomGlTBnyXUT/VBKqxGkgQVVeIctVJJQkpPdXVHmAT5kDRJ1dam
	 qY3XzikKOMnCg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH RESEND v8 0/6] riscv: add initial support for Canaan Kendryte K230
Date: Wed, 10 Apr 2024 11:44:17 +0100
Message-ID: <20240410-endnote-falsify-f22d7fe308cc@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=622; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=aOAuGM/qQpYkpIQU1B2iLXnrNX4jsQerO8QnmDLtYho=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGliuQ0ffnoILznYbvc5PODQu7f8/olHPkYm7yu7nftUI MjmS7ZDRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbSuIXhfx579IwcVSftd59d 9x9X6w/a6FsXWZ5+NnGi1gyOo0c+sjEy7P+4o+YIc1bvxaXyvkLGNV48RV41Ue+lixcHRzS0fa3 nAAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_034436_734361_0D4B01F8 
X-CRM114-Status: UNSURE (   8.58  )
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

Applied to riscv-soc-for-next, thanks!

[6/6] riscv: config: enable ARCH_CANAAN in defconfig
      https://git.kernel.org/conor/c/cd899f85b1e4

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
