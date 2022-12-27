Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2A0C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 10:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUKPwdvsHUGH9kFBHvRGt5ooEVCFOaMsKktyrA+Zd2c=; b=2OZwZQQfDhfYME
	Xw4UZlzZQNGSg43dXffb66KdSd1jsSlo/3/o5+3HOw+9SOsbV7/nFZVLxQcd8Um6nh1BlxvWN7qXL
	qEZdR2LhPBvAZ/Ojn3gvisf0mRPK7TnUYcsVXVG74Xq8XzKJD56a8I6FdbKMvWaxDrYHXaPpcBwV1
	Jzhh3irrM4XonMPf3JERFGLQAR+LSb2JqTTRL14gzMVlfuCUjMHWHqdb+fbXz9atIFBokETUCaSUV
	O7tyOQ7fB3dJfLF9qkqnI259sMah12y/bibsFTvFaaDXifzdqPSQPgFqFzutjZ2qGoUQe2+Ampts+
	pUGzc2owPT6qmYMmfuOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA7Ev-00C6KN-7m; Tue, 27 Dec 2022 10:31:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA7Eq-00C6Hj-E5
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 10:31:18 +0000
Received: from [80.120.31.194] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pA7Ek-0004nx-Jl; Tue, 27 Dec 2022 11:31:10 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH 1/2] riscv: errata: fix T-Head dcache.cva encoding
Date: Tue, 27 Dec 2022 11:31:09 +0100
Message-ID: <5894419.tdWV9SEqCh@phil>
In-Reply-To: <20221227020258.303900-1-uwu@icenowy.me>
References: <20221227020258.303900-1-uwu@icenowy.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_023116_534457_27AF9091 
X-CRM114-Status: GOOD (  21.24  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Dienstag, 27. Dezember 2022, 03:02:57 CET schrieb Icenowy Zheng:
> The dcache.cva encoding shown in the comments are wrong, it's for
> dcache.cval1 (which is restricted to L1) instead.
> 
> Fix this in the comment and in the hardcoded instruction.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> The code is tested on a LiteX SoC with OpenC906 core, and it
> successfully boots to Systemd on a SD card connected to LiteSDCard.
> 
> This change should be not noticable on C906, but on multi-core C910
> cluster it should fixes something. Unfortunately TH1520 seems to be not
> so ready to test mainline patches on.
> 
>  arch/riscv/include/asm/errata_list.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 4180312d2a70..605800bd390e 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -102,7 +102,7 @@ asm volatile(ALTERNATIVE(						\
>   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
>   *   0000001    01001      rs1       000      00000  0001011
>   * dcache.cva rs1 (clean, virtual address)
> - *   0000001    00100      rs1       000      00000  0001011
> + *   0000001    00101      rs1       000      00000  0001011
>   *
>   * dcache.cipa rs1 (clean then invalidate, physical address)
>   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> @@ -115,7 +115,7 @@ asm volatile(ALTERNATIVE(						\
>   *   0000000    11001     00000      000      00000  0001011
>   */
>  #define THEAD_inval_A0	".long 0x0265000b"
> -#define THEAD_clean_A0	".long 0x0245000b"
> +#define THEAD_clean_A0	".long 0x0255000b"

the original encoding came from a chinese document from one of the
t-head repos which only containted the original instruction as
"dcache.cva" [0] ... so I guess some part was lost in translation :-)


It's really great to see that the documentation improved a lot with
that new repo with instruction encodings you mention in patch2.

Using that new repo you mention, the change looks correct
0x4 -> 0x5 for the instruction selection, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Though I'm on xmas vaction right now so can't test it on a board.


Heiko

[0] https://github.com/T-head-Semi/openc906/blob/main/doc/%E7%8E%84%E9%93%81C906%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C.pdf
page 233



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
