Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71302C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 16:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HmnvYMCckq0esjcwxk9cF6G/V1y5H63WTOzaqRiIzW4=; b=shB9rra5W4QSFg
	5BwOuGCS0Je6V5TQNe66UYak2D+Mir/ivT6HHEE1PpuVbLOHSWydFiKfbK66CKkNB72aSzgV9GSli
	Xrw6v+C8BnFlTLi6FuVgY5WpXTpQh2/DIGE+97N7025zOZmvWFKX/fA6EAgdd7d2unOdv5lD2ZRM6
	l2SdxReQvh3PSROYU7fi/gJfXgr2etxO1UqmxyQ/UoDnjsM2CSrmc+r+HARPByxBLvvIdk14WdB8g
	yd4ZDaAVDA3swJ/ziuc21lMj4AHgkUuh0xVIEPkg2wmmrGeJAkqYGLtZlLigZ3j0AJeaAsgpc/5w5
	/Ha8mgY7LNGK8xJSmEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEw6R-00Crp3-VF; Tue, 01 Feb 2022 16:34:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEw6I-00Crmq-FB
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 16:33:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 07928B82EF1;
 Tue,  1 Feb 2022 16:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620EFC340EB;
 Tue,  1 Feb 2022 16:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643733227;
 bh=Arb/BWLua2YlFsMeKijCGl7aXZyD3XcJWl8aMJ/fCGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rwNVGsaezjiDoPndaeYAKZLw+SBLpc15zCQwh5u0NUK9/UhllQpERXi5FdRjcr/fZ
 5DTM5DUPZAxX49dkyt9xlyL0OhLbH/TY1XIRauJfYN8SwjpoOafocGp5AlafmHF8n6
 hmFFlOtRoVenPbnobV8qNQIqcD1/CNb8GzKUhPzuHUFg7UnKCr++AhL4L2aJd0DqZG
 0QqTT9UrN7HHlLzmyGia47qOxZ0QDUse7FvX/rWfVbthFw8p2EOoCh7YbVojrUb6xS
 aXpJtZk4CKy9sAAfGnO7OTE8GsW3I5YffMLpJwYsjdAenuVQ3HSo75vfpIsYWCtNft
 5lLHaFo7LIZoA==
Date: Tue, 1 Feb 2022 09:33:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Changbin Du <changbin.du@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] kallsyms: ignore all local labels prefixed by '.L'
Message-ID: <Yflg560OtUrCNt7F@dev-arch.archlinux-ax161>
References: <20220201013257.17926-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220201013257.17926-1-changbin.du@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_083350_693087_7DEB1C75 
X-CRM114-Status: GOOD (  20.54  )
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

On Tue, Feb 01, 2022 at 09:32:57AM +0800, Changbin Du wrote:
> The llvm compiler can generate lots of local labels ('.LBB', '.Ltmpxxx',
> '.L__unnamed_xx', etc.). These symbols usually are useless for debugging.
> And they might overlap with handwritten symbols.
> 
> Before this change, a dumpstack shows a local symbol for epc:
> [    0.040341][    T0] Hardware name: riscv-virtio,qemu (DT)
> [    0.040376][    T0] epc : .LBB6_14+0x22/0x6a
> [    0.040452][    T0]  ra : restore_all+0x12/0x6e
> 
> The simple solution is that we can ignore all local labels prefixed by '.L'.
> For handwritten symbols which need to be preserved should drop the '.L'
> prefix.
> 
> After this change, the C defined symbol is shown so we can locate the
> problematical code immediately:
> [    0.035795][    T0] Hardware name: riscv-virtio,qemu (DT)
> [    0.036332][    T0] epc : trace_hardirqs_on+0x54/0x13c
> [    0.036567][    T0]  ra : restore_all+0x12/0x6e
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>

Does not seem too unreasonable to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/kallsyms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 54ad86d13784..8caabddf817c 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -108,7 +108,7 @@ static bool is_ignored_symbol(const char *name, char type)
>  	/* Symbol names that begin with the following are ignored.*/
>  	static const char * const ignored_prefixes[] = {
>  		"$",			/* local symbols for ARM, MIPS, etc. */
> -		".LASANPC",		/* s390 kasan local symbols */
> +		".L",			/* local labels, .LBB,.Ltmpxxx,.L__unnamed_xx,.LASANPC, etc. */
>  		"__crc_",		/* modversions */
>  		"__efistub_",		/* arm64 EFI stub namespace */
>  		"__kvm_nvhe_",		/* arm64 non-VHE KVM namespace */
> -- 
> 2.32.0
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
