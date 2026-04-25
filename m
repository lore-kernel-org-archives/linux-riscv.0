Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3415FF8862
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 09:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNTDKswV/AT4x00ezn49deuyGXMfmFIFQcvCLuij4M4=; b=tAyggGm10jfxWf
	bnuARtfHQBOQKAoaiLSWVZspCxf8m6o4f/z8ZeOeuo6+uSpwVbsdswzOmMWrueio0XkH2rws+ZSwL
	hEipVKyRpqUgJxXwSdKHiKe0aJbtit/xRf3rxi3na+YOo2IPBeoSArutf2sbYxP+qctrZkLxBnfZy
	4yI9jNao861d9Dt87MQk5zVvIqk+4rVIgQ6z/62dgHydd2RwdAu2b4HQyIr1OX9gCC5ObuC5Lm9In
	5j3W51hQ4sEhufn3bf7X/A1xvgUhQ7VO9219Dx6BZpgC6O51nGkTo6COtFeGL4HEKNLJzaklfn/xb
	aQs2V9sfvpzngeayH7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZOA-0000000EIeI-2nwS;
	Sat, 25 Apr 2026 09:33:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZO9-0000000EIdq-1oMH;
	Sat, 25 Apr 2026 09:33:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FA5C60052;
	Sat, 25 Apr 2026 09:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AEDC2BCB0;
	Sat, 25 Apr 2026 09:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777109604;
	bh=vTnWUB3963217PH6E98v4MIyJ/E5FD6u2p/ki3Ycw2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kT8Q+d6o6nw+n1KPS+w1ZpJZl3Yc/tDH77v0iMYo8pnCj7XYzNRzqn66o/+5loj06
	 us0LWHBLCY0Uds+AjizRvxUzdDxpq3OEqzBhXN2rZVTAMXy+1f0/ElBO/GRYjTafII
	 ldWiYfqhzxYU/08LZsfArV9vUlP5cCPZcSqTpvY1DmjbiIjpyE5zlnOTAyKkpa/TEz
	 kYlnNDET7XxapKrMtaUi5ICdwN0WGH4T5M8XKc9kB6tRx9nDKJ6mbKKcGns/l2lZmQ
	 l8DJu3YF8zaf7wa6vfbTLogAeRe1ENAnhvwLfA+/6d+R4wvi/Nmd5X+oNQN7v3KF1Y
	 GNFTzaymKptEA==
Date: Sat, 25 Apr 2026 11:33:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.chevallier@bootlin.com, 
	ningyu@eswincomputing.com, linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com, 
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com, horms@kernel.org
Subject: Re: [PATCH net-next v6 3/3] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
Message-ID: <20260425-woodoo-righteous-earthworm-0ed34c@quoll>
References: <20260423085501.760-1-lizhi2@eswincomputing.com>
 <20260423085650.820-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260423085650.820-1-lizhi2@eswincomputing.com>
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

On Thu, Apr 23, 2026 at 04:56:50PM +0800, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> Enable the on-board Gigabit Ethernet controller on the
> HiFive Premier P550 development board.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> ---
>  .../devicetree/bindings/mfd/syscon.yaml       |   2 +
>  .../dts/eswin/eic7700-hifive-premier-p550.dts | 232 ++++++++++++++++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 103 ++++++++
>  3 files changed, 337 insertions(+)
> 

Please split the patches.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
