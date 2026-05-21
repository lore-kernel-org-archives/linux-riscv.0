Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C1FCD5BAB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 22:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwPghCfGBmJUv+maE492xJVYAejnik74J47pgzgIki0=; b=qyhtYaxZpmuh3r
	KKMiyDGjApJmMe8xLz7bvmY+99plDmxP5I9ZQKF8Ljxp9st4Q8MDLumno320xkPEPorkVjtEKD0Qh
	DYOpPvqz4DmKw7oklYy3DO6aJXTywMgN58depwjjdKJVJtP7OSeWLRC1R43HqUaviJuif0Ak0GKkE
	HifQDIAatCESD0Twfx+O8gctzs96dD3TA47AeAKzYYVneXXbUTDivkYN1NXmeky7qq5GvsfyOSa2F
	evP07cPyd6VrlqfKTsYW1CB88bGjkISrkXteSwxTSkdxpzDJ3i1O0iB++RakTtILgaztrJLqbTIL7
	rjRKKpAs5gL7qgTbYkMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQC83-00000009FsQ-3CCQ;
	Thu, 21 May 2026 22:44:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQC81-00000009Frg-26dl
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 22:44:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE1AC41ACA;
	Thu, 21 May 2026 22:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0EF1F000E9;
	Thu, 21 May 2026 22:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779403472;
	bh=rnB4kN/tOx2ErVQGUg/PDWLqnB/m3dv/ZnSJFKt4sdc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=PqW/l0fU6W2G3j8NXCtAaMb5ldJy+ZhIdyKjJ/JJFfmZ7iRkYz0HdCoS6MyYe9lEb
	 /5nDxuzNVZZqnVPcBF+d8Mp+xr4qnLPO7OVvnhBUGStSvuWFPBMDmXQ6zPGMxW4MCu
	 qgpQ1nOhZRMxRe7bhCcPXPfAp7auVjXoEv1LeRuqGmxgGZK5DH1dlfFeuyCmwN7gk2
	 +S28eCC8GFQ0j616qZDwWmuJ56LlbkHNB3qlW0kQN3VCGDxAFECdDE85uRGUXDl7Z9
	 jPVVR9YJX4J6OrN6pGxrXFgQySNjjXV68cJWi4tDBS31odP/3l5qqcvcz7DKMjRvWq
	 TE1Mrdrvdjs1Q==
Date: Thu, 21 May 2026 16:44:28 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zishun Yi <vulab@iscas.ac.cn>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    alex@ghiti.fr, kees@kernel.org, charlie@rivosinc.com
Subject: Re: [PATCH v2] riscv: Check the return value of reloc handlers
In-Reply-To: <20260509074046.1747927-1-vulab@iscas.ac.cn>
Message-ID: <c38d8041-6cbe-fafe-1a34-1bb9f8510b86@kernel.org>
References: <20260509074046.1747927-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_154433_554823_96D06AA7 
X-CRM114-Status: GOOD (  11.10  )
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

Hi,

On Sat, 9 May 2026, Zishun Yi wrote:

> Currently, process_accumulated_relocations() ignores the return values
> from both reloc_handler() and accumulate_handler().
> 
> As a result, the kernel will proceed to load the module with corrupted
> or incomplete sections, which can lead to unpredictable behavior or
> kernel panics.
> 
> So we need to check the return values of the handlers to propagate the
> error, and fall back to the cleanup mode.

Thanks for the patch.  Rather than continuing to loop without purpose when 
an error occurs, can the function simply be exited?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
