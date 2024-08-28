Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C8AC636ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 17:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ocyfWNYqeFYGjdC4FXw1RY5xOi1Sr2AVOFYya5aRXOE=; b=G8NIsmUdfggVka
	nezCuYuf3t0YNzVafggxz2Y9OosW8AKeuvuEaHEq3c+PY36O8ZBy8GhpIitsCarYSpUIlm0b6NyW6
	NmKm0yakL3yulrj1XT6BdbQ+IlXMXRvTLx0voTyNfIfPc5RNcW6VLa96bwUl966DoXc9C/Rswzp6S
	1ZxHwBfO3Ypg/r4Shs6d44+XVthzl/QuY0b1t1Jrjs/YvcbVVai/z5Vi2GShQ/Vds29UzcV28nz7O
	yqUtsbaYYeL4ziOg1ZkkB9fjeIKtnTJDYwXSN0y5WaPrsssG8DZxzVt0Pmn05/Elmkxtzd5wbk42T
	116z745QyTCZ/r6bpuSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjMsN-0000000GRl2-3wZ6;
	Wed, 28 Aug 2024 17:54:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjMsJ-0000000GRk8-2di8
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 17:54:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D8EB9CE17AA;
	Wed, 28 Aug 2024 17:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057F7C4CEC2;
	Wed, 28 Aug 2024 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724867668;
	bh=l/ZNIom6N7B5N0r4yLqJa5E9u6l8R83pQOwCw712860=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlHtseyYUnvzFrDhzTzOTDq6caNJFit2vOYHfsQ+Ekj8CEW13UuLXQH3KjwZsWF4+
	 RFt3qiPIs+z3LhA2g6O9sXyZOSbEqfj22du1mkvyIUPyDeI9+exV1r6FCpN31RNc97
	 roAS4+/g6VXIG4d4vkMpR7iaUbsQLJMX5owG01QAYRxpGBsIYiUTvpPjp5ti2wPpii
	 HHGVAPlT0vCv3wkdncqs82GwIIAf+XjYkVyhJ9ltNnavsG4Xn/YjF3HIQULHMfgp62
	 o3vt63T5D2+P9UPPR5WXU2fpYk0Z3l0ZkXxYz3EIR+6UdYkADuqCT5i/N4qP6vvSZZ
	 yFX48MWaAGLAQ==
Date: Wed, 28 Aug 2024 23:24:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 2/3] soc/sophgo: add top sysctrl layout file for
 CV18XX/SG200X
Message-ID: <Zs9kUAeapWeN/4GS@vaman>
References: <IA1PR20MB495396729244074C36E51E11BB942@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953E0D56CE4010C470E4A71BB942@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953E0D56CE4010C470E4A71BB942@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_105433_859534_2A69815D 
X-CRM114-Status: UNSURE (   8.19  )
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

On 27-08-24, 14:49, Inochi Amaoto wrote:
> The "top" system controller of CV18XX/SG200X exposes control
> register access for various devices. Add soc header file to
> describe it.

I dont think I am full onboard this idea, but still need someone to ack
it

> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  include/soc/sophgo/cv1800-sysctl.h | 30 ++++++++++++++++++++++++++++++

is soc/sophgo/ right path? why not include/soc/sifive/... (sorry dont
know much about this here...)


-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
