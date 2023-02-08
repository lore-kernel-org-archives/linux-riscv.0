Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3524CC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 23:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXljAJsvrVEThVHogJna7RA3zMTCFW+e0LoSw+N8TFE=; b=WqEreHTFj1oJmv
	p/runkghfZ7Pf5bAruMG9bwftTGyxDCg8UFZ1rnWnGkyWa3cmPcJieyvpD5iBLZ37O4obcrZ3Ug65
	TT6lkrV6L2IjSc9bbwwZIk48QYlXkFguoUdOFPXidOztFMKuQiORGPA3alel9jCJ/xlYidt+uhKYB
	Vaaq5uTvgPZXA0LJsRUneZ93XAuhFiGyBIB+E7yWKDAqp9B1+NAkq2yujsV7VhjWzUCj0JyKne4/E
	WnrXZQqNz6/nWNwaxxuZAqF+/qxqBLfSl+qZxH7vXptsSHc1EO01S4JOGkkJ5tiNbY7hYkkq2/jIb
	w+XBUACJegkuUuUo+dgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPtjh-00HAoh-Cm; Wed, 08 Feb 2023 23:20:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPtje-00HAnm-Gn
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 23:20:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ABA2B61820;
	Wed,  8 Feb 2023 23:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9496C43446;
	Wed,  8 Feb 2023 23:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675898415;
	bh=40KDbh9yQUF8FPl1H4ih3NBtJXrxGdDQYYikp1QWG/8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=lorDt2UYnrxLxu+JIs8ExivCnkceibDIzMwiJP8Ayh4qHx4+9MtJnhbzX9c5TMrkr
	 P/mhxJtVHvWTlZMwKfUxbpTNYpKd3O6lD3PHmGBFYL4PqkqKj3E1hbOtwBJnsKx3qo
	 j+Su6DnRQsyCswqYku5SaxzOuh/mu2jMNgtkMRLstoeXZNW82RtoINIMWzk2YZ1wJF
	 7GooWYmhGxxu8YTLETWbAS1MMGf2oXKoyIqf0dlZaYIabtgodF24XsNIwbj5RSR5Yy
	 BePyDnn9erZTiCMDCVpLd7O9tThLoKIVzfagJwqTef0f5veHe+73LBiEpzUup6H+lo
	 ADNUZXBs5ZCIw==
Date: Wed, 08 Feb 2023 23:20:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, palmer@rivosinc.com
CC: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 christoph.muellner@vrull.eu, ajones@ventanamicro.com,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 1/2] RISC-V: fix ordering of Zbb extension
User-Agent: K-9 Mail for Android
In-Reply-To: <20230208225328.1636017-2-heiko@sntech.de>
References: <20230208225328.1636017-1-heiko@sntech.de> <20230208225328.1636017-2-heiko@sntech.de>
Message-ID: <C32D5495-F772-4887-9CAD-66206ECCFC3F@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_152018_613136_50A29BD0 
X-CRM114-Status: GOOD (  10.14  )
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

Hey Heiko,

On 8 February 2023 22:53:27 GMT, Heiko Stuebner <heiko@sntech.de> wrote:
>From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
>As Andrew reported,
>    Zb* comes after Zi* according 27.11 "Subset Naming Convention"
>so fix the ordering accordingly.
>
>Reported-by: Andrew Jones <ajones@ventanamicro.com>
>Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

The whole "getting it wrong immediately after fixing it up" ;)

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>---
> arch/riscv/kernel/cpu.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>index 420228e219f7..8400f0cc9704 100644
>--- a/arch/riscv/kernel/cpu.c
>+++ b/arch/riscv/kernel/cpu.c
>@@ -185,9 +185,9 @@ arch_initcall(riscv_cpuinfo_init);
>  * New entries to this struct should follow the ordering rules described above.
>  */
> static struct riscv_isa_ext_data isa_ext_arr[] = {
>-	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>+	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
