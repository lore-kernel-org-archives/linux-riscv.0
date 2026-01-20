Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAECD2ECE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ziN0Xy2g4YqSmhuqildEkO+Ng1ween4c1jWRoBGSbNg=; b=sLhGfQmCiiIM1B
	EsMg/XA6fwWEznwjCJWmmzQgFHjTlAWac/9ZY/rynlF0eTI3gKtaezGeUkeDtWGQoN8yOV5NTXhn4
	cOp1J8p3zapUiDJ2AiYBkvWu9ur4kfmqw3qceUNfDzFNmc59Wqgifc8oOL2ZW7kG++FYmV0NLWxRr
	pqZeuOZr2El9+Waeiyoy1svVxhgZOZm+g3lYE8ZH6MzoafAshj306I4nfpGsr/jRQhsmiA576dvG8
	f4B0Y/VejRNmYV/xqIAylMcECcxB28QqmNOIqDXhtjIW5A+mlMttrhCNbNKh/uN0BV2BDuW2kLdGE
	PK0/Lrmsfzl5cjzA187A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCxJ-0000000410c-3cpw;
	Tue, 20 Jan 2026 14:43:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCxH-0000000410B-1yeX
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 14:43:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so31706455e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 06:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768920217; x=1769525017; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BBO7s0q0gk9yVOm/GXGA0GPwp+Pc4tuwtNZFcNdboA=;
        b=Dy8n6833f0cyNPK3Ql3a1bX0Y1FlUS0AHAGtvjLrVHDuXQ7KCBRlqMHj/+hR6xB+bx
         ibhHxP0LcfPZt8DAElcGbbZu6FaedT9gZguP/Z7AodJxQAKgvYuKmaTErF4BmFyDW2BJ
         PvIxvBGcjPpbObvyl14b33GcDEwQWbmJZUdXBRuaU/2v5dsbn2zG8xJqMCkipckXaXQ8
         0q1K17z9sr8IwtefR5YWxOZD00NZkCqiGguJEn3wAZJqpqYwEv6yQSE/FOgYV5fpZc+O
         HIPEDBZABMU4Lo2q8o61kUZ48ZKcmAoywcu/4EluNErlPz96mfonJr8SyX+Ow92P+dQy
         n1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768920217; x=1769525017;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0BBO7s0q0gk9yVOm/GXGA0GPwp+Pc4tuwtNZFcNdboA=;
        b=A+OH22NUySzdPxH6Cz7CtoRF0IBO+BsmCcRJLTcbVsQjz38Nk4ur2tLnsKuBBW/Ncy
         tv7hgUdL6Xn1OODSJEtLXy10r3FCQ11VSSPuq4xr8XDn+TYgOYrLkUrqp+4vWLMIDm7Q
         HiZmPQPdaQxmUyCaZ0Z46zjoGTOVL7zt16kDbdu47DMUVYOKjNPflDnHH02jq3cJXcs5
         lEB16gViKLJxs8H3b23G4riQ2g7lSYEkopw3Ywd13Q8HGydVtq/KHSJzwh3PvREErsAB
         wSfhCTFt+EtdYLsxxJF4A9RR67z0kXkrbLpQinD+fphHNeOSXL5RMLd3k8KO70is4WB/
         MH7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUltGU7Zzc89DnHZd76e3NJN8X68kfq5N6OIOnsJwwyY85vOFgvEULtC06QSzEBSo519c5REkXrK2yvaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVHMQ6BzRO2sJjc297sqEg4evBx7s/tpztupitfMyt0/MdGENS
	5f8r5/qNaEjH0aYPuV1V1RFtJ9ADOyI4iDqbXdybxaFHwvfAFxdoJtPK
X-Gm-Gg: AY/fxX7r56u3fJqKqYVag2eJPVUIdkzcRNex7lWXx6WRjmc6OZx6S3iGFumNe54USGT
	jlVz2IIl5ZpWXAUes7qcNPAGcxFgd68OD2l0RxCLpIjW4C1+SuKtc4hexLqUojIXdgcaskJuGDH
	d8RMMgEdkEWeGpFgjYlGjz+roHyCQfftCKIhybWHQk9tGuRzfgXlxhlA/26eMYFydUJqwZAZRpG
	Kl96ir+0XbPEucHqtvjuoghlqeFndg2SIzhc/TbX+Q3SFi3wAMEsz86ohFZTS87H0kU/f10TkPc
	v/T2RPOvt6x3VLk/ul1uqo19Yfcgkdqget677Z1m/4Tg0QobMY/PO7wueXQpSytMKlnvIf1w6P+
	cW+ToEu0da5Tte6eKNHinYp3zSGF7BUlQlH6y3PaWY40aBeEmRQkb49ngVwhVMVjaTISuhGCQN9
	s+SDdt0vz08e3/wq1WkA/17+pwZA8WIutu/Ex/O4yVtKoQiRCHt4OvGJw=
X-Received: by 2002:a05:600c:60f:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-47f4289abb5mr153488945e9.1.1768920216949;
        Tue, 20 Jan 2026 06:43:36 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4802dc90068sm192581885e9.7.2026.01.20.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:43:36 -0800 (PST)
Date: Tue, 20 Jan 2026 18:43:31 +0400
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
Subject: Re: [PATCH v3 3/6] dt-bindings: codecs: sophgo,cv1800b: codecs: add
 ADC/DAC
Message-ID: <aW-TRX8Bv60Aq-W-@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
 <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
 <20260120-rapid-turaco-of-discourse-fe3fe6@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120-rapid-turaco-of-discourse-fe3fe6@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_064339_527903_801E9E0F 
X-CRM114-Status: GOOD (  13.96  )
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

On Tue, Jan 20, 2026 at 11:12:23AM +0400, Krzysztof Kozlowski wrote:
> On Mon, Jan 19, 2026 at 08:30:44PM +0400, Anton D. Stavinskii wrote:
> > Document the internal ADC and DAC audio codecs integrated
> > in the Sophgo CV1800B SoC.
> > 
> > Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> > ---
> >  .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
> >  .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   | 43 ++++++++++++++++++++++
> 
> This is not what I asked. I did not say squash patches. I asked to
> squash into the binding. COMBINE the bindings. We do not need multiple
> documents.

Oh that makes much more sense. Thanks. Will do. You mean single file for
both codecs. Combined description and "compatible" like this?
properties:
  compatible:
    enum:
      - sophgo,cv1800b-sound-adc
      - sophgo,cv1800b-sound-dac
everything else seems to be identical. 

Can I keep single commit for this?

> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
