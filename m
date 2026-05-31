Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45538CD5BD1
	for <linux-riscv@archiver.kernel.org>; Sun, 31 May 2026 12:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VepRc9gtpTfNoUOs9A8hDL/nz5LLIJvVP9g5jVNi98Q=; b=fHh9zxFnyTYVy9
	ifA9/jlzcju2SbYYCuYzDHc0W/Ar24TK9k7qHUM82KX0SWx5RrP6a5wzYodq2l6HudpvHVmjLpEk4
	o/C0THsDEzmwTRFBZ9MJJHC0JBBAPOfjYz8+oecsAVzJDxP+qno8C8+4S7pAV+Z4F4JwrDykVayvm
	/DwwlcVXGoYTuPex9i09ny0Ie4709y8A7EvR+frXuXhhKQxUNim6Zl0Qemi1uTvNBMTNvsK0i0hBe
	hXISY+sZ+/JopXJJ/rTpqWI7/w5owgkkAoSu+lzMsAdDJnI3q6HY4UsDNaXYjKJYg4+w3gZ0Rkayh
	RocVoi9Wan4nfc1aD5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfIV-00000009aRX-3zEG;
	Sun, 31 May 2026 12:29:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfIT-00000009aQs-0IT4
	for linux-riscv@lists.infradead.org;
	Sun, 31 May 2026 12:29:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EB284375B;
	Sun, 31 May 2026 12:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047481F00893;
	Sun, 31 May 2026 12:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780230580;
	bh=WXRV6sAi8yFeVuYsq2n7V6bVtDWoC4H6LM4N5Tr7BVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fU6kBq5bqqZvg6CC6U2Kl1RsEoRniC2eGyFBDFjA2NP/hcRt60kHh2aPspavgAC/1
	 wrzgEd0ey5lj9aG1p56HaVNimRn4EXrOS1M7x4oPB4mCkOaJNw0jMFlr/CjLcrgqfC
	 2G9DVQ1g3wWUW1SKK/ImX/X9jHyEaHEDcYSa2zsh5Q8ElL0fNeuA0cfJ+drnFzHeZ1
	 xyIcsHjn5YvVKGdCjPto49rxhEaUPWRAafVi7BYkQlnFsitkcmY2JvsXIW7cEZrS51
	 aBgC+m3d5SUJha8qqQWb+QbzQ5bcogTVWA6e6nrq6fZyYQ5z3Ya7mLHlzfLBq+2asi
	 vbdgIHY+hkHvA==
Date: Sun, 31 May 2026 14:29:38 +0200
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
Subject: Re: [PATCH v5 RESEND 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S
 board compatibles
Message-ID: <20260531-beautiful-furious-raptor-e9ef21@quoll>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-2-josh.milas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530173347.33533-2-josh.milas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_052941_124938_EB78CB1E 
X-CRM114-Status: UNSURE (   7.82  )
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

On Sat, May 30, 2026 at 01:33:43PM -0400, Joshua Milas wrote:
> Document the compatible strings for the Milk-V Duo S board [1]
> which uses the SOPHGO SG2000 SoC.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
