Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382B9D4A5F4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 12:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPsUZz1qCN4Z+0NIOnYDQdDTOdI383zJj56vTlHOznc=; b=kheZ+7PkvsWAS6
	2X7ZwX+fBNCOlMkJ3FhJYVxw7ByJHfwRrHs8LBmk3lW++nnXnmgLs2nfXbp1eG5tjf5ou/PAi7/AX
	OiZm/4rYcdGyFFdY9vM+XcQDxlhqOJQNizovTGDaIZzKvyd/WmJlVsgD8VsBC3OtZ5yt56Rob7HsF
	Xsmw7N5FNBXz6BQaxFM9eOtfDQW0+dZYSANjsFCkPDHV4JqFOiPlOOkGWNt/IMaGJU1/moKx3da3n
	5RQIwYOZKyvPBb8MAzuJiZXXHEPTccgBp6MlJ2aAHydnBuj/hG5Nb2paPtjGymLXYcwc02g1MUBCQ
	McHsgAr2dB9xpTVAFupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhRkE-0000000HYU1-0xJ1;
	Sun, 18 Jan 2026 12:19:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhRkB-0000000HYTK-1XK9
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 12:19:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso22180015e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 18 Jan 2026 04:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768738737; x=1769343537; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WD1wzEbaoKZKhuZNexa3nkG79kI0GKZ4I1GLpFTxDis=;
        b=F0OVckZPvZC0rhlkmKVjCtCJn5/NKKEj55XrLLfRpokDciCjqttYI6i+kE2jZKqwdb
         JSkwtxJ7UdxB067l7NzGz0EUFvCHiC2DGIIv6mN/UpaTVbF54QKeZnSdt9G0qGTQJ99f
         z/tfSoQy4s96/sw6ln6BcVHIEXGnh8i71b9HfewLEWeTfgQiNFk9GwErlOzTUKNtN5SC
         HqJaPKR/OYJUm8oGp3uh8rZF00J7K4+ZUeSlc6DTLlinhfid3ze1IAEnZ0l9CU3+FbNS
         b1cRWgeTmnTJz3m70CqfNBcF0/z7Z9SPSb8dGfmCdtG5XQt/RWzrCUKkM0VT2TXuxGlP
         45zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768738737; x=1769343537;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WD1wzEbaoKZKhuZNexa3nkG79kI0GKZ4I1GLpFTxDis=;
        b=vq2boCjL0Npb9hNceZu8X8Pgq+UTlKVAOrEI8cNSILEnxunCQK5ciMp2Fg951o+SJr
         jXOMT2UhwSYtbIi6oCaC6g1iVbOB2zCmixLGpDe1gA93kaS/HEJHaoH5oIf/EFhTEHDC
         L103EM91NTNHBjz4f2ErimBcuOsUoEendBqeK7YJEDaLynP6VDqXil9LHYeEuNzjlisC
         7lk+qWKkr79IGCwUyb6XPrKb6jVZjaz+dEf8tizOQJcvgyxTlHpWzaD4akJiNtXgAOKF
         MzX+lqnhaT6k7Fku3gGTuQPZ+5TBfDPT6+R2rb9e/qva/12sTk/EGUOjQ7G/apu+/kHx
         H/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHBicebpms7dXucH7ABWoZ/JujfcND810t7nuycutlYr/kddu0kZrv0Zj/n4kA1ZpfBdvs4WNQYJ9uJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNCyNp7+FBP1YNahHyDkVzJeMaITChYC2zlmdtJt659hcP3Zqd
	N2x2gdXn8dwsXiLNsr5IMJHKUDOkM6B3v20RrYciUU0bSdAna0M2krxg
X-Gm-Gg: AY/fxX7tpbs616lwd0sJuY+4CHr1xGVMNhBg4TpeXXuBNoXztFPMmWqRauyx0s41jRr
	UkOTm0foQNs3YtXeujFk/cOZA2fzNn7bMSCJKh4V6wc39CRhXiAhG5ia6j1Rz6yfuJs2WNj/iFv
	3iH7u2I/pmxhCCMHiFTv+bdj/DUc99nn5w+pl0CEAyX5FnZcvt37WgqBA2eB60lIgliKTQrcuDx
	KUDVuB5AofONkP/+se9rtbMKbg2rgMJE4BVTz6W+Xy+NnsY9USiHsin8zdNlzC4+Nn63OC3d8m2
	6wVMqcOkV+VZgWxVsjZvpzcostVnXbfnbLhidu2b+o2INvI8AlHor0WuQIk3y72D+A9q8/tnl74
	hL2KFFC/B/8zG5auTupIUrusxFAECl9nJtbKqBRCunHCb3IX4iYsMpWzpH5v6yccKQsbNJmjNH1
	zShCAUVMx5xGGCHmmQ2IGfKyznAwgIVJJ1V0tUc789xYk=
X-Received: by 2002:a05:600c:8b33:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-4801e30d72bmr97350495e9.10.1768738737157;
        Sun, 18 Jan 2026 04:18:57 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f3b7a5f94sm207544765e9.0.2026.01.18.04.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:18:56 -0800 (PST)
Date: Sun, 18 Jan 2026 16:18:51 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Message-ID: <aWzMvqzh-QXWRTWP@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
 <20260118-famous-magnificent-peccary-474ba8@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118-famous-magnificent-peccary-474ba8@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_041859_687523_F5722888 
X-CRM114-Status: GOOD (  35.10  )
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

On Sun, Jan 18, 2026 at 11:14:34AM +0400, Krzysztof Kozlowski wrote:
> On Sun, Jan 18, 2026 at 12:18:53AM +0400, Anton D. Stavinskii wrote:
> > Purpose: introduce DT schema for the CPU driver
> 
> Bindings are for hardware, not drivers. Drop the purpose.

Noted. Will do in v3

> 
> > The driver uses dma to transfer data. The dma it self has 8 channels.
> 
> Describe the hardware.

Will try to rephrase. Thanks.

> 
> 
> > Each channel can be connected only to a specific i2s node. But each
> > of dma channel can have multiple purposes so in order to save dma
> > channels the configurations allows to use tx and rx, only rx, only tx
> > or none channels. I2S controller without channels can be useful in
> > configuration where I2S is used as clock source only and doesn't
> > produce any data.
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

I will do my best in V3. And will read provided links again. 

> 
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> > 
> > Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> > ---
> >  .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 75 ++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
> > new file mode 100644
> > index 000000000000..cf30880a62da
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-i2s.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV1800B I2S/TDM controller
> > +
> > +maintainers:
> > +  - Anton D. Stavinskii <stavinsky@gmail.com>
> > +
> > +description: |
> 
> Do not need '|' unless you need to preserve formatting.
noted. will be fixed. 

> 
> > +  I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
> > +
> 
> Miss allOf with ref to dai-common.
> 
> > +properties:
> > +  compatible:
> > +    const: sophgo,cv1800b-i2s
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> 
> 1. Why is it flexible?

It's my mistake. 

> 
> 2. And then why names are not flexible. These should be synced in
> constraints.
> 
> > +
> > +  clock-names:
> > +    items:
> > +      - const: i2s
> > +      - const: mclk
> > +
> > +  dmas:
> > +    maxItems: 2
> > +
> > +  dma-names:
> > +    description: |
> > +      Names of DMA channels. May be omitted. If present, one entry
> > +      selects a single direction, while two entries select RX and TX.

Will drop.

> 
> Drop desription. Don't repeat constraints in free form text.
> 
> > +    minItems: 1
> > +    maxItems: 2
> 
> Again, messed constraints.
> 
> > +    items:
> > +      enum: [rx, tx]
> 
> No, it has to be a specific/fixed list.

Here is the question. Can you please help to understand how to describe
this properly. The idea is that TDM module is usable even without
specified dmas. Each TDM can work as clock source, only rx only tx or
both. I can force to use both channels but the user probably will want 
to not consume all the channels for if it is not needed. DMA can provide
channels for something else like SPI/I2C/UART etc. I'm asking because
I'm afraid I will do some mess again here.
> 
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> 
> Why? Drop these.

noted. Will remove. 

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - "#sound-dai-cells"
> > +
> > +additionalProperties: false
> 
> unevaluatedProperties instead

Thanks. 

> 
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/sophgo,cv1800.h>
> > +
> > +    i2s1: i2s@4110000 {
> 
> Drop unused label.

will be fixed. Thanks

> 
> > +        compatible = "sophgo,cv1800b-i2s";
> > +        reg = <0x04110000 0x10000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> 
> Drop useless properties.
> 
> Best regards,
> Krzysztof
> 

Sorry for the mess. It is my first ever patch. Thank you for your
review and your time. Will do my best to improve the patch series. 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
