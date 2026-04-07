Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989E1EDB7C5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 07:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWF7q/aHyFLOAzXE2Hu2DOoHdpnqvxNi8Yspg7+kr0I=; b=3oqwqQC8tjLsSX
	M98EWbqLggOZYqjZ75PhK0zWZT3JcR+E5MGepxt6AszRXgoyAXxV3LdoBiPYxFQPPCaVDZNCid5va
	7nNLqqTeCyNtmv0YLNyvwyH7c8Bk/RsNXj9pLO7HVfDEqCCdjE4YzQ6ScSAUimxAuLwXKtmriYSCb
	s8Ip+8nTz6E6zctevuO/yDvj/cDEaztPFcEz5LNifhfHpQ0JC7p03Q7q2AcfdT/OcPHROcs+0xqnC
	TgsFR99Ue+31Z/QDVyhwbI1tKRqO88aIZYLqO8Ty0zaDEQr1OWzxaamE+ZcKmeiyF7vJFZjlJAdG4
	x7KlN0M19vrOsAhxLG/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0f1-000000063Vq-33bU;
	Tue, 07 Apr 2026 07:15:43 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0f0-000000063V6-0bVr
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 07:15:43 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775546138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iUFp+O5EtBAiEaUUWnqZaZkuO8VjWkhg5QNOTwvremo=;
	b=OV5cZRu/Gww7Ff+EMZDyC/de8sRB24qQsA+lN8H6qbntBmYXpZLdzV0lHG8u37u2wDM8VA
	1htROkf/O7YbbMJVmhqofGSkZwRb2ZEGGrxJo+xGJ56+mjnRSLdcD3E3YvTE1vqDLIXv1w
	gIN+DL83FbBOqJ/TnVDDqnaeC3ikkR/B6NBXA4eOQtHyl0i7iSME3BLYHQV74f7khVA43O
	TseePlh9SKSBOe1gFLJnTP95rtTZc3kMHrATcVQRNaBMaZbDekYG8jpcJegOAVZSGnYFg/
	zVjGkiy7/3Qi5OfJYQt2PIWtLaIelYpGuY3ETYo283fVNIBOAtRJAVQVL4g7Pg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775546138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iUFp+O5EtBAiEaUUWnqZaZkuO8VjWkhg5QNOTwvremo=;
	b=3KEWudwqnkedlRGGf1CsSEHnWvY3mWEzZ82YB0LL6OrC9KgURmSKCHBhmSaaoDoIiRA1xx
	9ezsHPtAVV6qPsCA==
To: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] riscv: Define
 __riscv_copy_{,vec_}{words,bytes}_unaligned() using SYM_TYPED_FUNC_START
In-Reply-To: <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
References: <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
Date: Tue, 07 Apr 2026 09:15:37 +0200
Message-ID: <87zf3f44x2.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_001542_320476_23D47873 
X-CRM114-Status: UNSURE (   6.49  )
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

Nathan Chancellor <nathan@kernel.org> writes:

> After commit 67bdd7b01387 ("riscv: Split out measure_cycles() for
> reuse") and commit c03ad15f7cf6 ("riscv: Reuse measure_cycles() in
> check_vector_unaligned_access()"), there are CFI failure when booting
> kernels with CONFIG_CFI=y:
>
>   CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_words_unaligned+0x0/0x50; expected type: ...)
>   CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_vec_words_unaligned+0x0/0x24; expected type: ...)
>
> The __riscv_copy_*_unaligned() functions are now called indirectly but
> they are not defined with SYM_TYPED_FUNC_START, which is required for
> assembly functions called indirectly from C to pass CFI checking. Switch
> to SYM_TYPED_FUNC_START to clear up the CFI failures.
>
> Fixes: 67bdd7b01387 ("riscv: Split out measure_cycles() for reuse")
> Fixes: c03ad15f7cf6 ("riscv: Reuse measure_cycles() in check_vector_unaligned_access()")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
