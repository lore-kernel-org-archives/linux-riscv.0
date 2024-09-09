Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01E9ECE57A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVfuzdbt+Uf+PHKdn3GYcvc6R/alg6IFalTjpnMh+U4=; b=EhV0jfoyohfpxO
	rXxHi5+MvTcevy+YFRBSyJFWKuMj83g9DhxQefdTyab/z65X2iEhrMeqoLfmVU628XAg1RtjXMTSo
	uPL96Ds8iWq85a7jizLBzX/xtEueGQXm96pM+7iW02NJw+lv+Utute72jVyUShHTMqXijbABt4WOc
	1KecT5by1rsvXheJw7jVqv9+507z3sgg9z0rstm3LYbryqyT5ETDTOa6kCN2vtk/zl8NYa8CZ2+it
	/PBc2wnDPbSQv6TIqym5MDENNMMhNQ9yL+kXnXbE7Z12n0z+HdcvJWXwZVLBw6wNTCQ0ScEZyd+MY
	lUxayBdo/MD2zqk3dPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbOh-00000001Sqt-2x8p;
	Mon, 09 Sep 2024 10:13:27 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbLj-00000001SBp-3zz2
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 10:10:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3434660011;
	Mon,  9 Sep 2024 10:10:17 +0000 (UTC)
Message-ID: <03808c3d-1f19-4ef7-ab76-4219e1e66ed8@ghiti.fr>
Date: Mon, 9 Sep 2024 12:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Remove duplicated GET_RM
Content-Language: en-US
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <20240909095557.446745-1-zhangchunyan@iscas.ac.cn>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240909095557.446745-1-zhangchunyan@iscas.ac.cn>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_031024_217717_6E41E8A9 
X-CRM114-Status: GOOD (  10.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Chunyan,

On 09/09/2024 11:55, Chunyan Zhang wrote:
> The macro GET_RM defined twice in this file, one can be removed.
>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>   arch/riscv/kernel/traps_misaligned.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index b62d5a2f4541..2a9b72dcd648 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -136,8 +136,6 @@
>   #define REG_PTR(insn, pos, regs)	\
>   	(ulong *)((ulong)(regs) + REG_OFFSET(insn, pos))
>   
> -#define GET_RM(insn)			(((insn) >> 12) & 7)
> -
>   #define GET_RS1(insn, regs)		(*REG_PTR(insn, SH_RS1, regs))
>   #define GET_RS2(insn, regs)		(*REG_PTR(insn, SH_RS2, regs))
>   #define GET_RS1S(insn, regs)		(*REG_PTR(RVC_RS1S(insn), 0, regs))


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
