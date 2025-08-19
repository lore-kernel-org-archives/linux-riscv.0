Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA06CA0EE6
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 07:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvgCrYAjeuPFVMxLOeflIubseJkIsKzYGdDQLusAo/g=; b=XT+rTpBo9jiLAD
	b4wOw2djs+ebL84W8s9AxvfYhQhwrNk3BZUkQhGcqxbAq0zc6dWEN5eIeIFQF5nVq+PcdOJJn7PAP
	Pu0eREI1gkn3kwK/TEfhpIyFnEtHxuO8mnOAZx0nKJLE7sVuGul11Jyi7UXpdSLVV/ICXSNswoBgt
	IjjRzsFle0CrUFfx1XQlM4mzHcFRyj3YEAPikvd8vIhe6UaPguu8OaAa0csBRKa10zysQldxcGTlw
	K7mKDPRZ2rf3AzWeO1oc8dsCS3kgcsqzxu4fMMd0+Zpxua0LBpqLa4bmvgbP2uBFMNFrD+NFCojIY
	sgeEYQZEzaIXuAZdjc7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoH3d-00000009iRU-1O8v;
	Tue, 19 Aug 2025 07:47:01 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGeV-00000009edR-1I94
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 07:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755587967;
	bh=6GXKO/OSeIUD3NFhD4xkJWy9owCpecXpN1wJWziXETk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=KSdxxmg/squyJLOgxmJaNxvB1gmJRPUDeBBERmEb+v22Nq4L+EcgJuL5EwNfuWQvO
	 TZviJMJHWYU5qW+RfzGrR16XYT7lCPWRMEn01kMmqM9vUZQdD3NTxLezrT/LH4wwhf
	 tOjCZRa5a0sFeT3kqoWQjAwF70GnVQE3Kez1Yepk=
X-QQ-mid: zesmtpgz5t1755587959tb7026c59
X-QQ-Originating-IP: bVF3pNTnsEAaLtygWLNeH55OqNdWT2+5WcRDKPuwz/o=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 19 Aug 2025 15:19:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8562983801700431660
EX-QQ-RecipientCnt: 15
Date: Tue, 19 Aug 2025 15:19:17 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Jimmy Ho <jimmy.ho@sifive.com>, linux-riscv@lists.infradead.org
Cc: troy.mitchell@linux.spacemit.com, ziyao@disroot.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, cyrilbur@tenstorrent.com, cleger@rivosinc.com,
	charlie@rivosinc.com, kees@kernel.org, ben.dooks@codethink.co.uk,
	jszhang@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: fix using wrong load type
Message-ID: <B1669DA80470EE6A+aKQldVbfZ9rnlD9o@LT-Guozexi>
References: <20250819071318.21103-1-jimmy.ho@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250819071318.21103-1-jimmy.ho@sifive.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MoIKForzQxXwiaNOB0+wTI7a8pdZ6VGfWsxqiq+fdS0912n9JT86ce1P
	LWs21Lu0/e57UfAqN+PYmPecNQVuINjbBYdkoh6leZMytZXUTkp4Z6uPiSFJQ70kxMkGFpP
	zZyNPGoMPa6K848hA09Fe9HhaVBwYaBd8A5irq02GpH3FUDIcj2PtQNbDbmW9LsgBvmHaHq
	zmJdmZjU/Y2x4NQZzQg9gxR1uYRholp/S5rNLzBweIg1CQtGrLHnF8x4f09ztK4IWLBqqoY
	Ceegz/pxSPYL44fuVpzCemZnOnT46FEgguyiPGtSBva28LUV/16468bvAa5LUBR+qUmHQUp
	lZ/9CARPWeGv/Ot95d1jcA8zlYGPpYZ3K49cpbcbyeMmNlrP9kSjwzxrxlBzBzUJKTIdcYS
	Qss9c2kPI8gAPLdArwZcvhIPRh1f8iEb0psO4M1jwRSTxVDpPKEBXEtBf87OrVB8Zk2JjO7
	s6Ia03mpvABlRq8TMR3KHCU48aF++scAmoFSkjwrkUr0RsqS2xBrRHMPZFPoNirkg+QoFEe
	Z1jxbtgHahR2YcQhxHY33e1QJ4WOcGETfy4c4Cdkqn4fpvbR9RZ5jruS6Dm1akdTm0d/MVQ
	R337tEz+O6/OhxWv9wghElaPTJff9/VGh7ZqyQ0MJg19mOi6TuPv9FKN6/o3k2pjYEieTdu
	KdY7djKAX2zKf3rGpcwThuuEXtze8PF7APqdXCBKQaIUpfbmm3k779m+BYz8h6JVqbJhxZN
	SGvDosQmL8Bf5Q2FVAGOYFL+tAaxMeEp7dtIzmws0dtZ4VMluxPhuWpTcIlFtLkHI8vlrgP
	AfTvRn2g6vFQEiBgNX//ZqNDV6SXXN06zCKXCAZwZ1mOzszCQtSW4U1WPKSiOjDDwfjGgz2
	SYA04pGRcz2pxY1nqpP4rGi1Dj1o5S9rSrA068XxCZ/qI3Y0rd6g2C22jpH1aNJdWzAvD0c
	kPhwZRoK84l6Hwr/P69FFJ2qT8BiWzF1vC9T+XciVbL9OpvVNll0fpoLE6w9fwLkFCaH9HZ
	BV7JhVF2BQCtQJXSic9l4G4ypLeZ1/+t0XCHBsBcxL9fYnHt+zmpvNBeE5e2gxa7KYWXcPW
	g==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_002104_167525_50B2DCF5 
X-CRM114-Status: GOOD (  17.56  )
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

On Tue, Aug 19, 2025 at 03:13:18PM +0800, Jimmy Ho wrote:
> thread_info.cpu field is 32 bits wide,
> but is accessed using an XLEN-bit load, which might be 64bit load, fix it
> 
> Changes in v3:
> - replace space with tab to keep it aligned with code block
> - Add "Fixes" tag
Please add previous version link.

> 
> Changes in v2:
> - add a comment to explain why use lw instead of REG_L.
> - correct commit message
ditto.

Additionally, I see a patch here that serves the same purpose as yours,
but it's more comprehensive and was submitted earlier.

In any case, if you'd like to proceed, here is the:
Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> Fixes: 503638e0babf3 ("riscv: Stop emitting preventive sfence.vma for new vmalloc mappings")
> Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
> ---
>  arch/riscv/kernel/entry.S | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 3a0ec6fd5956..492ae936dccd 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -45,8 +45,10 @@
>  	 * Computes:
>  	 * a0 = &new_vmalloc[BIT_WORD(cpu)]
>  	 * a1 = BIT_MASK(cpu)
> +	 * 
> +	 * using lw instead of REG_L is because the thread_info.cpu field is 32 bits wide
>  	 */
> -	REG_L 	a2, TASK_TI_CPU(tp)
> +	lw	a2, TASK_TI_CPU(tp)
>  	/*
>  	 * Compute the new_vmalloc element position:
>  	 * (cpu / 64) * 8 = (cpu >> 6) << 3
> -- 
> 2.39.3
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
