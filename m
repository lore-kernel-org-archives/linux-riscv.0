Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DF2CDB483
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 12:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sq3Xun7LgMo1ebimPb+6Ldtz2xxADTb80WnpNUVpkHg=; b=wt6smbp5ltQwwN
	fQP8UA4Kd1eo4D1B34ajtmZearRugM9FvsZVEDvA+5UAK8BfF0adw2tabNX+eeq3InNl4K1kn2V7e
	YWMx4ONgatqmfciq5dJmAb1WKRZyj29S1tdmieMwIGECKk1OHUrN5em65AqmIWDiQ7NjAwskkY7o6
	z1vmrtmasyuP+5eOIyoc+cMhNFexJ7+VqJwcYTikUH1FdGF9OOamBBWQVgRXMyBFT4ScqF8NR89YN
	YFiTN+a+33jhQgS58VHdmmGk7AVWlz1Gc+1P46yBd+m+RyBfPAzUC1eS156UXI79DPnbjhpcycZMr
	fu1wVoAPLTb0EWazjYfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsitH-00CH4I-0c;
	Tue, 17 Oct 2023 12:09:39 +0000
Received: from mail.avm.de ([212.42.244.119])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsitE-00CH3c-1v
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 12:09:37 +0000
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 17 Oct 2023 14:09:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1697544572; bh=KD3DEtP5d6DCBHOitoR8vzNgmhwKZ20ThM66mmXaQDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3xiTCRTfXo07q+mWSyekXKERZRHw8/lwaQcPG8H37jzuclELv0P1eZcewRqi9xfm
	 4FjwkD5E/CAI7Jsf1jt27JdGi4xolHrKm534XM7mLulgUbh3foeFQbVeHZrkGEgsx3
	 6NcIgfurfJnD3rsiwm/mEe1Iw8nhHG8j82oJD9DM=
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id CFCFB81EAD;
	Tue, 17 Oct 2023 14:09:31 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id B9EFA1819D1; Tue, 17 Oct 2023 14:09:31 +0200 (CEST)
Date: Tue, 17 Oct 2023 14:09:31 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: Re: [PATCH 1/4] kbuild: remove ARCH_POSTLINK from module builds
Message-ID: <ZS55e3ZyzoNDchD+@buildd.core.avm.de>
Mail-Followup-To: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
References: <20231017103742.130927-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231017103742.130927-1-masahiroy@kernel.org>
Organization: AVM GmbH
X-purgate-ID: 149429::1697544571-C3E340EE-41584499/0/0
X-purgate-type: clean
X-purgate-size: 585
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_050936_837644_48B6471A 
X-CRM114-Status: UNSURE (   8.99  )
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

On Tue, Oct 17, 2023 at 07:37:39PM +0900, Masahiro Yamada wrote:
> The '%.ko' rule in arch/*/Makefile.postlink does nothing but call the
> 'true' command.
> 
> Remove the meaningless code.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/mips/Makefile.postlink    | 3 ---
>  arch/powerpc/Makefile.postlink | 3 ---
>  arch/riscv/Makefile.postlink   | 3 ---
>  arch/x86/Makefile.postlink     | 3 ---
>  scripts/Makefile.modfinal      | 5 +----
>  5 files changed, 1 insertion(+), 16 deletions(-)

Reviewed-by: Nicolas Schier <n.schier@avm.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
