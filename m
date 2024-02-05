Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6C0C4828D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 17:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofcSfV04la9igVXs3pvMDga1W8Kb27bpfEMDbre6lRk=; b=CUtOitCtNiElY7
	U+hiUg19iBrKuvMUGhfuA0aoblImlRYyk0IVJvo3eLRXCTCemJ5zxdEhJ+hGSoyLjOcDG/VOTefQ/
	xOoPjDi/usI1hy+BhS5snBgcaqDES/+lXU3uE87qHs9TRt60iuuyCF71qR3uLOmWraa/BQADox7sI
	UQp5SnV9dEjogyJwiB+17YOMth8kUBqW+xakG1FxCLAUzWmlFInU2A7FkBdhDL3fPP8HWV3Hqn7KV
	stb5E98seTvlmja1hnFX7WHQmfrfjI7wm31xO2VFLgffDtOT1qd0DaO+pGT60RKuEdWqZ7PSfwoMb
	LEDXn08zHEcm6/f0N6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2fa-000000047qK-2kyd;
	Mon, 05 Feb 2024 17:22:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2fY-000000047p1-1d5v
	for linux-riscv@lists.infradead.org;
	Mon, 05 Feb 2024 17:22:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C476A611D3;
	Mon,  5 Feb 2024 17:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2266C433C7;
	Mon,  5 Feb 2024 17:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707153727;
	bh=Et6Ae8kKVfkwexIZgZibcIr2o12bANsTHAJ7mXeWTHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rH5KnDyEFEFfgQ0g9h6NChGENuZo0wYudf5fBhcNDE1xepWPY15eDz0bV1KrcszzW
	 6Ea+R37M/gcLFJRLPtO4hZDqW3dWsI4MnFWOoLaAnJhOg0AHax3W7HUnJXEhtPnAMq
	 GbrRhCOhxDVsxoUeUprR2R8sqDbQOwxdrCdsSqt6wMBspz8u4yy0znGMDTtN1cBf39
	 TPoIBqVIAEdyPiinmu1cJir3ekzvG2WHlB/M6VUQZQgFdJqKaOGg73afv1jsbY7oAU
	 caEKAseZ2VMAeWlqV3eEjgdQVngYjcIREVIpaEkMp31LOIKSpM3B061X+wD4lNy8gC
	 u3ohm2+idj4+A==
Date: Mon, 5 Feb 2024 17:22:03 +0000
From: Rob Herring <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: guoren@kernel.org, Chen Wang <unicorn_wang@outlook.com>,
	palmer@dabbelt.com, sboyd@kernel.org, haijiao.liu@sophgo.com,
	paul.walmsley@sifive.com, xiaoguang.xing@sophgo.com,
	devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
	jszhang@kernel.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, samuel.holland@sifive.com,
	inochiama@outlook.com, linux-clk@vger.kernel.org,
	mturquette@baylibre.com, richardcochran@gmail.com,
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
	krzysztof.kozlowski+dt@linaro.org, conor@kernel.org
Subject: Re: [PATCH v9 1/5] dt-bindings: clock: sophgo: add pll clocks for
 SG2042
Message-ID: <170715372308.3643466.1804804263763287247.robh@kernel.org>
References: <cover.1706854074.git.unicorn_wang@outlook.com>
 <bf3b8178a013004f259cd9254b13279254505852.1706854074.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf3b8178a013004f259cd9254b13279254505852.1706854074.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_092208_489082_412FB432 
X-CRM114-Status: UNSURE (   7.84  )
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


On Fri, 02 Feb 2024 14:41:27 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add bindings for the pll clocks for Sophgo SG2042.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/clock/sophgo,sg2042-pll.yaml     | 45 +++++++++++++++++++
>  include/dt-bindings/clock/sophgo,sg2042-pll.h | 14 ++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml
>  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-pll.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
