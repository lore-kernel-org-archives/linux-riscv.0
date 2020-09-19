Return-Path: <SRS0=zSrB=C4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22629C43464
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 10:26:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9A1A21D42
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 10:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cJhqQkSq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dhs4E9cC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9A1A21D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Be+49TZ7P8KNQLxBz6pnxFLfvYdyXS9R/MYMZpKmFE8=; b=cJhqQkSqC11z4WnrIGySUV7Ol
	33XTsJJKLYg0bWZqPpkNu/7o91WE1J14WAA/mgQjclasoxzfKPreY6QngH2KAEJpYNxhMUhdcAXCe
	jiMuXoDswVEGl84IoXnXo+SxoCR/JU5m5S1s0Hw//PT4Tkrhc9Rag6YAsg2Uq9xKiP0gvgcDLJI5w
	f3m7fi3+6cpAhUENbAJ/iyfFsVFLg3AkDCyxWX50pnGb99CGgEt9LqDZMBDJ76CGnMXOQlLGqm4oA
	v6Sw2yL+jBW66SGAMDiFGlKoKDtphma9lObhnv4g19JQkPszRhQPGcB7d+sbUcT4G+7f/Rm2lBZQe
	BGeu6H1nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJa4R-0000Mz-WC; Sat, 19 Sep 2020 10:26:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJa4N-0000M3-WA; Sat, 19 Sep 2020 10:26:16 +0000
Received: from linux-8ccs (p57a236d4.dip0.t-ipconnect.de [87.162.54.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EEFFF207FF;
 Sat, 19 Sep 2020 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600511174;
 bh=QS+/7ck8Ms+3NScVBhWMouEzmGA4XUAFNHh7y81UkaA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dhs4E9cCPWR5U6/L6w+Ot0AP6OfHcv183sxqnUkXXz/AnXJDt0AXHHvcqCMVei5i6
 GKnSZS2OKXzMu25vZ30nutYcHd1k1XhpuBjem46GWue0KNcO/LOyTnnK8hzbEj6OMj
 lh64cXJ94R44/ThRRJAbdzF0qE+FcmC0n0GycrxI=
Date: Sat, 19 Sep 2020 12:26:01 +0200
From: Jessica Yu <jeyu@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2] kbuild: preprocess module linker script
Message-ID: <20200919102601.GA22693@linux-8ccs>
References: <20200908042708.2511528-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908042708.2511528-1-masahiroy@kernel.org>
X-OS: Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_062616_181034_3F4C61A0 
X-CRM114-Status: GOOD (  12.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-arch@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Michal Marek <michal.lkml@markovi.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

+++ Masahiro Yamada [08/09/20 13:27 +0900]:
>There was a request to preprocess the module linker script like we
>do for the vmlinux one. (https://lkml.org/lkml/2020/8/21/512)
>
>The difference between vmlinux.lds and module.lds is that the latter
>is needed for external module builds, thus must be cleaned up by
>'make mrproper' instead of 'make clean'. Also, it must be created
>by 'make modules_prepare'.
>
>You cannot put it in arch/$(SRCARCH)/kernel/, which is cleaned up by
>'make clean'. I moved arch/$(SRCARCH)/kernel/module.lds to
>arch/$(SRCARCH)/include/asm/module.lds.h, which is included from
>scripts/module.lds.S.
>
>scripts/module.lds is fine because 'make clean' keeps all the
>build artifacts under scripts/.
>
>You can add arch-specific sections in <asm/module.lds.h>.
>
>Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>Tested-by: Jessica Yu <jeyu@kernel.org>
>Acked-by: Will Deacon <will@kernel.org>

Acked-by: Jessica Yu <jeyu@kernel.org>

Thanks for working on this! 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
