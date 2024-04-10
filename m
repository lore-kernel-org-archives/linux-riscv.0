Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D0DCD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 11:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xcra9MTy0ICY5LCKP9qjy6Q1n2vEvt1/43IwdiL36L4=; b=FMaL0Mx1QlL1OY
	zc2dY+o0f6/6SEeCbZnBwcgRmJ70zMcbnTRV7/bSM3kdiHyu9GsJaURVoqossFoVZCaVsqaOueRkv
	+yrjSkMeTKkjmIR4cQ7NnMMF+igVIhWTTxBd0goM8Ipd5LDOFfHpv5OawT4DxceUYrzvXCio2JUQ9
	0lLwE5MfDvyPv4wYFyaaNP7uV1CODItmgbE1vmNa9O7WESWq7DqnM+nvjqv6RI8eEq/qo5PvZLNZq
	mEIPZ+RO5WDlWlHiRg7GeskGn4DC92TrlwkAlqltsobDREi7jhAUshWAEjxXHibqfBa2lGcbAogSr
	cTgNEvljSiCyt4Yy0MYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWal-00000006lS8-3SOb;
	Wed, 10 Apr 2024 11:58:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWah-00000006lP8-3awd
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 11:58:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AFF2CCE1345;
	Wed, 10 Apr 2024 11:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EFAC433F1;
	Wed, 10 Apr 2024 11:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712750288;
	bh=NNn9PFSTYD7cqCl6hz0HImhdmwtK0pBHKxKy9hV4DKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CzWGbFT0pQPr5PGe5Mcpjxw+oeW+QocsoylRdvqaI5HLgB/f62hSvN+KLluR14H3A
	 smtVRLg7hWq30aJc0OtF9AkgPjXk4vdGiUZTqVnIiCWiuq9ym6kXsvJrz/sR+f8LIX
	 3vG8UsYAU08EoVHW7xqRYL0OeFU0whxwBhRaKMuYc1emqwVMTYOQOxCy69w1IsYpjy
	 qvvpk7I1MXLnliKVw6Eh0e9XcgtmXLAOtcLSyXjCnUFC1C1G5UjslgeuhsKAJC80VB
	 JVZz7+uAoUUFLtMnpOcf4GaFRMGB86qujVcjf2mXX39UZ0Elock/AgrsExJQtkfL2a
	 7xzQfVgNVQLxg==
Date: Wed, 10 Apr 2024 06:58:06 -0500
From: Rob Herring <robh@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	lstoakes@gmail.com, shuah@kernel.org, brauner@kernel.org,
	andy.chiu@sifive.com, jerry.shih@sifive.com,
	hankuan.chen@sifive.com, greentime.hu@sifive.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, charlie@rivosinc.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 04/29] riscv: zicfilp / zicfiss in dt-bindings
 (extensions.yaml)
Message-ID: <20240410115806.GA4044117-robh@kernel.org>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-5-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403234054.2020347-5-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_045812_462784_2E1EADD2 
X-CRM114-Status: GOOD (  12.89  )
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

On Wed, Apr 03, 2024 at 04:34:52PM -0700, Deepak Gupta wrote:
> Make an entry for cfi extensions in extensions.yaml.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 63d81dc895e5..45b87ad6cc1c 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -317,6 +317,16 @@ properties:
>              The standard Zicboz extension for cache-block zeroing as ratified
>              in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
>  
> +        - const: zicfilp
> +          description:
> +            The standard Zicfilp extension for enforcing forward edge control-flow
> +            integrity in commit 3a20dc9 of riscv-cfi and is in public review.

Does in public review mean the commit sha is going to change?

> +
> +        - const: zicfiss
> +          description:
> +            The standard Zicfiss extension for enforcing backward edge control-flow
> +            integrity in commit 3a20dc9 of riscv-cfi and is in publc review.
> +
>          - const: zicntr
>            description:
>              The standard Zicntr extension for base counters and timers, as
> -- 
> 2.43.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
