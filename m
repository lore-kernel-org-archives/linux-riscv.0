Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31305CA0FF8
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Sep 2023 01:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GfgQjXw3npmaB3k8eCtfqavgpyD6xkJpScPefxpZMc=; b=dOtN50wCrXAsae
	A17FAwLXXybG3gk1kKpeyGa1W+gXJwnrsegyHM9BOp1AVvzpVs9QVrPfZRUsPcGGoY7D4+Xs+Nqn6
	HMPIs6Wcf1rJVth3pREVcs6bCpMMeYeq+WEnktHBVsCeGLLtuUnOQmlXOFPJ9jbKDn4JPgcY0E1cB
	1Mqc0W5BkWjPotd83fAVTKKdn1kbmvMT5a6ylXYZHR5Nkhvg/30XtNBk50aGOvZWs0yeIc3NvwKb5
	ev637EWtf0f2kdsO+HJ08/vqcomjkOMZlRqkBILtCDSwLttz29VPQXEWrg5lbNlvIfbqA+QhFdUwE
	ACq3n3I2D1WqKNBE/slw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcFa3-000ide-1l;
	Sat, 02 Sep 2023 01:37:43 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcFZy-000iay-1W;
	Sat, 02 Sep 2023 01:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693618650;
	bh=jmoXZU5xgGIhtHU0V+fopcmXqY/zvLC3ThLQUQfiwJA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ir9Ia+KMa8kP3kdjlB5RMtlq7/v/ajVVR1JjU3X+NDfK2jZtkWp71i2BMrrmrHuTC
	 AddeqMlhnxIfrzRwERIHysj3MX3YJGMlfMNcR57BGQXWeQYzUj3uF1XAhH89IkG6dm
	 I6W9lGIMowGFf+2IxcKKUFCEd6s+R+Yk4UQqLEfc4O/sitzlFK3BL/f1gdWF36+8Ui
	 rzUHl/92BtSgVZ9kFuIMFUoWS5tyMbLRLiY/oQo+vhxhMp79ubNgi6FU3nMCXk6ubl
	 5Y7eQUUwhFvCrKh/SaFIHHeJ31a15epIyw+hxi+2pFBgByIlG8S40jCeU05uaGsl+H
	 fDSRcsD8tyoIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcyFJ6359z4wxR;
	Sat,  2 Sep 2023 11:37:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: Show marked Kconfig fragments in "help"
In-Reply-To: <20230831191335.give.534-kees@kernel.org>
References: <20230831191335.give.534-kees@kernel.org>
Date: Sat, 02 Sep 2023 11:37:22 +1000
Message-ID: <87fs3xicdp.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_183739_786294_04CA5503 
X-CRM114-Status: GOOD (  10.61  )
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

Kees Cook <keescook@chromium.org> writes:
> Currently the Kconfig fragments in kernel/configs and arch/*/configs
> that aren't used internally aren't discoverable through "make help",
> which consists of hard-coded lists of config fragments. Instead, list
> all the fragment targets that have a "# Help: " comment prefix so the
> targets can be generated dynamically.
>
> Add logic to the Makefile to search for and display the fragment and
> comment. Add comments to fragments that are intended to be direct targets.
>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: x86@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> v3:
> - Use Makefile logic from Masahiro Yamada
> - Use "# Help: " prefix, but only on desired fragment targets
> v2: https://lore.kernel.org/all/20230825194329.gonna.911-kees@kernel.org
> v1: https://lore.kernel.org/all/20230824223606.never.762-kees@kernel.org
> ---
>  Makefile                                   |  1 -
>  arch/arm/configs/dram_0x00000000.config    |  1 +
>  arch/arm/configs/dram_0xc0000000.config    |  1 +
>  arch/arm/configs/dram_0xd0000000.config    |  1 +
>  arch/arm/configs/lpae.config               |  1 +
>  arch/arm64/configs/virt.config             |  1 +
>  arch/powerpc/configs/disable-werror.config |  1 +
>  arch/powerpc/configs/security.config       |  4 +++-
  
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
