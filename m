Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFC3C38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 14:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3aD+GsGgjIGY3Q+pTRVBytmq1KuTpzbCxM+tx3bbWo=; b=B6ADJdVEz7gTJw
	lkfTtV6jXPf68mOfbmC4/P7Rpeg07/a1Mv84ZgbAeFMVKtz4o8PUTeXqamMnzKprNK2VCNv0TmMNa
	5g/2P0SpeeJMEbfuLmpw+xc/rLze0LKJQXoqBB5vvxhCH//WAwWvjJ0ltYGjW7E0agm4gWD+IKjF1
	0QQ5cobJYdDzLGXFlaFfiqre5B2F6mcfxE+EJWVLoTBrWe+LXoy+f13BV6bqW8Mg/DlPhOK7S18j1
	B5nhr+no9mOiLS+onCbohF3wy3ZABrWJjlihIUSbTMEl3GsJNTlxAImdQSR8MGdKqzTt1lhD4s0CH
	GCR4d6Sv8a2m+Pgm8Elg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxtl-00Hb0y-Gy; Mon, 23 Jan 2023 14:34:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxti-00Hb01-S5; Mon, 23 Jan 2023 14:34:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C35F060F37;
	Mon, 23 Jan 2023 14:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6061C433A7;
	Mon, 23 Jan 2023 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674484448;
	bh=fv90DLxSNUyq75Uc0NF4OVPP2Jf8l+GYo1D9d2yeH50=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aGZ4hhwBZ0bpifYuGqsvMGtHLlgr/I0PvWfrO4Ns2CWZ+phPLVfDKIul2KDXM8Tri
	 kMCd+gLP6rQ1TOlwWQY7DTa33wh74H9VqVGM4sOgaNRu5UPVEZedMdJCmmqusB8Rjs
	 tNADsgz1pFb6t445sYa1Eympox4cwl9PxBm1ae8JfawrQ7VKbSa7Okp4FVNarDv+03
	 yCVtVoPywm+7XTl6gPVORmOr3XB8abbH9muOxhtbXzkD4P0k+6JvI5OoUPvf0kozs9
	 dgJ8qHC8yD79rUqyENblOB4614DEYz4UwS8cJRj2DirMwrbTRID5uHjEaiwjUnrZWh
	 dOwijEwlIY/lg==
Received: by mail-vk1-f169.google.com with SMTP id b81so6033695vkf.1;
        Mon, 23 Jan 2023 06:34:08 -0800 (PST)
X-Gm-Message-State: AFqh2kpjuAIpPDXOT90YhtsN8VWOv4LohnPLFjG+kb3SqViZ81+AcSXk
	eRdVCQZoCxKfTMEoCqu7SbtatMCoASkwt+LJIg==
X-Google-Smtp-Source: AMrXdXvwn1fOtAuVEIQOMYCMQNkQED9CGC4Ikw9gmuAsxNbhdzwdyToo56sVPCO9D4cVHzM3M9H5yOYIHxkN7JVsrBo=
X-Received: by 2002:a1f:edc2:0:b0:3e1:6dc2:d562 with SMTP id
 l185-20020a1fedc2000000b003e16dc2d562mr3310553vkh.35.1674484447503; Mon, 23
 Jan 2023 06:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20230122191328.1193885-1-ajones@ventanamicro.com> <20230122191328.1193885-3-ajones@ventanamicro.com>
In-Reply-To: <20230122191328.1193885-3-ajones@ventanamicro.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Jan 2023 08:33:56 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+SqFOVYZdf5YCELNo7nnU-T32V_Ec1C+RmUv_eLiR0Ng@mail.gmail.com>
Message-ID: <CAL_Jsq+SqFOVYZdf5YCELNo7nnU-T32V_Ec1C+RmUv_eLiR0Ng@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Document cboz-block-size
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Atish Patra <atishp@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_063411_001593_D65B2FC1 
X-CRM114-Status: GOOD (  11.66  )
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

On Sun, Jan 22, 2023 at 1:13 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> The Zicboz operates on a block-size defined for the cpu-core,
> which does not necessarily match other cache-sizes used.

Please use get_maintainers.pl and send patches to the correct lists.

I have no idea what Zicboz is. How does it relate to Zicbom for which
we already have a block size property? I really hate one by one
property additions because they lead to poorly designed bindings. So
what's next? What other information might be needed?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
