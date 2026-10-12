Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C692CA9ED0
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 23:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JYntAoZcPkozPwlUjq7IpShrR8HQMEEqlixhucGSjE=; b=nJbiaUUkTgRxUf
	PJh0xxKbH3KYtCcf+tCgvA14MJbQrkOWOJ+d6IRHTKXsmsU9inJeC+myeQoOsrmXLT8+d1/b1Le2I
	aocw5EDPip2aiX06GxzIY/dTaPVI21MJrazUXMQ3TuWLKijw7hqX9e7j0Dhr6WUrE0/IyWbjjgBNr
	WAlxU68sn59MsbDL83AgkZ2kXO1Vuo+SG8zOH2fDSo8T6W4V0+PjjabCDNWld0p17tULxEhj6ob74
	aKCVi9XMVqxLxXrNrS0wp5BZqxsQ6nAH8OR8KQwPvIkiJAAiUwFFYGqYvkQjmzY2IJNU3DOwlWE3E
	6xxvBtYvg2FnF4qk/5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGPUy-0000000BfKh-2O91;
	Mon, 12 Oct 2026 23:32:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGPUx-0000000BfKb-01uF
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 23:32:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26BEB600D4;
	Mon, 12 Oct 2026 23:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955531F0089B;
	Mon, 12 Oct 2026 23:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791847921;
	bh=et+fSNpAgASLBKfNUi/A2UyBeZSgDNV1kqK5yCpP8hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EeSBCjv75gbokJ2stAxf5eiUhk30zOW3R4JE+07vST5nJjF8txuMIxjam3c5Dh6TK
	 TZIn2byMOf8JGCcqB0q+jI5YmEQ6xjPntEmApdR3C1VklhKd5M3DPD4GGSZkpK3BV+
	 vhPulGmkDJKuZBk8jhuk6OcEmwcaAPrNIdMkWKDh9knd8kTq94VGgS1cclH2Zcp88T
	 DM/m10rQRJ+1CHfGNKdmdSkpAL8qIpyEuuIKTjgMC8m18qNOstncoGGmUtSoEW6RsW
	 /DGDetbXVrMJm2zJ27EDaBjAyHuujIoDEBj6VPdLpqCj2iPMtCwEmcLYzu3ksVLAIj
	 34JXPGbeKcpgA==
Date: Mon, 12 Oct 2026 16:32:00 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] riscv: dts: thead: Add Milk-V Meles support
Message-ID: <as1t8Ln4isRWfgO9@thelio>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
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

On Thu, Oct 01, 2026 at 03:44:09PM +0800, Han Gao wrote:
> Milk-V Meles is a single-board computer powered by T-HEAD's TH1520
> SoC with four C910 RISC-V cores. Add the board compatible and device
> tree for the Milk-V Meles.
> 
> Enable UART0, eMMC, microSD, Gigabit Ethernet and the PWM fan, and
> name the GPIO lines exposed on the 40-pin header. Add AP6256 Wi-Fi
> support over SDIO and enable HDMI output through the DC8200 display
> controller and DW-HDMI transmitter.
> 
> Board details:
> https://milkv.io/docs/meles/overview
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
> Changes in v2:
> - Group BeagleV Ahead and Milk-V Meles compatibles in a common TH1520
>   enum, as requested by Krzysztof Kozlowski.
> - Explicitly select the GPIO function for the Wi-Fi host-wake pin,
>   as reported by Sashiko and confirmed by Drew Fustini.
> - Add Drew Fustini's Reviewed-by tags to patches 2-4.
> - Link to v1: https://lore.kernel.org/r/20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn
> 
> ---
> Han Gao (4):
>       dt-bindings: riscv: thead: add Milk-V Meles
>       riscv: dts: thead: add Milk-V Meles
>       riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
>       riscv: dts: thead: enable HDMI on Milk-V Meles
> 
>  Documentation/devicetree/bindings/riscv/thead.yaml |   6 +-
>  arch/riscv/boot/dts/thead/Makefile                 |   1 +
>  arch/riscv/boot/dts/thead/th1520-milkv-meles.dts   | 346 +++++++++++++++++++++
>  3 files changed, 351 insertions(+), 2 deletions(-)
> ---
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> change-id: 20260929-rv-meles-25d10148dc0c
> 
> Best regards,
> -- 
> Han Gao <gaohan@iscas.ac.cn>

Sorry, I forgot to reply to this thread that I did apply all 4 patches
to thead-dt-for-next.

  [1/4] dt-bindings: riscv: thead: add Milk-V Meles
        https://git.kernel.org/fustini/c/2c8613ec65f4
  [2/4] riscv: dts: thead: add Milk-V Meles
        https://git.kernel.org/fustini/c/8360e1bcc246
  [3/4] riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
        https://git.kernel.org/fustini/c/a7f2539005c4
  [4/4] riscv: dts: thead: enable HDMI on Milk-V Meles
        https://git.kernel.org/fustini/c/d43b33e0253c

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
