Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7009C7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6d0AFVKwkd+Wuculu1HGJfnos0Zv0oDN4uF+mvFKZk=; b=EY56T68Kso8r8y
	NvZQvHvzPP8BGAM1HfPZTsM9yuA8Di5ai2Qu8VQdS0iUB5SdaCM1BDYyYB+93ze4w3vX3ERIfbUeo
	0l8bsQ6H7WEybsR4XXUp4Dltsoz/iHCAOPJgXDVA7K9iFSEt6Fh9it5fuQ989nkM0Pyg+WtsuRntQ
	/Yl3Z3Bo5hqTy5UhxZZ1t8Prttr00CuIvwFyiXjjicUTxnrb7r6MUxUKMY9tV7HiI3+ZsHlioYUye
	h3CxknZHfjk5nqOGMSAyOEKsKW3q2SrY4SaV9Gjk3GyDoqBWlhme0SMpumRUtL8Q19Ff404BtKqbk
	XwraLNRuwFZJ33TChVfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CLB-00G036-0u;
	Mon, 05 Jun 2023 15:41:53 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CL9-00G014-0c;
	Mon, 05 Jun 2023 15:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3J27GNOAaYAcg2/OQpiA0yRvMrVxHWe6WRS5SogWUdA=; b=AcmY/rmEf670csICl3+kY3/qC7
	4N7jlG3KOUDmJFdIr8kZzpjCuNW2vMhasTAmcEOQWwouLwnBlUh7xYJylSeBtoYe9eI0p5kmSCM8X
	tSTlsqlJOCVmt2VAY1IFngp5ios6YwCSoYfbcwXQVsODXNGD5Gi3ydx/iTxz+1nbOejxv+n5OuKk4
	o7lGGjyMTosXMrCzH2ysnwk5lIWaa3CSiqH/vj7tAQqMfoCsl+k47c28TbYlEsJQS8DrK2bYPAhzA
	JX3rfUvXmlqQPdCsHhaXjt8PnPaw/74gdGDueJqnTwOi9spmQpj/bhOMobeopfKfeyX7NC3idwcPu
	FfEnrNYw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6BCn-003MxC-1t;
	Mon, 05 Jun 2023 14:29:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91DD461361;
	Mon,  5 Jun 2023 14:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5852C433EF;
	Mon,  5 Jun 2023 14:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685975345;
	bh=hZ87ZYTbpDOaTiFT09YI6BJw7NRtzjXefqSYa6e0NqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YkFIZcwvKrxwZMZ4QVYNpyLfbt4KUpf5M8zr3ZdHC6RtfW7UqKbn/gNUtc0ldQK/W
	 ++5AcyzPv3Ei5fshhQL5/+Dk4QFyUpsUFZ+G2TmRxCkmPQGXX+S8WJkJNS3QvmAHEG
	 LoFFb9o1fCMurmj20vEZXK0lp2VCjsUW279AFo6Klr5ltnKowH4HINIh4Wq0pM1HIs
	 UsevQ+8/vI9bzLRGuLet4bA5A7QhrMSZlx6C2SdEA99/gQYs45t73Kg3+0HTcSq4Hf
	 ax1ETZm5L8ks2//V6Qj/How4qf0VbBOv+X1163Frad0anoZ8aIyx4D11udTTSVgg+K
	 OJ8WXGnkkptOA==
Date: Mon, 5 Jun 2023 15:28:58 +0100
From: Will Deacon <will@kernel.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: catalin.marinas@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, chris@zankel.net, jcmvbkbc@gmail.com,
	steven.price@arm.com, vincenzo.frascino@arm.com, pcc@google.com,
	wangxiang@cdjrlc.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, jeeheng.sia@starfivetech.com,
	leyfoon.tan@starfivetech.com, linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] arm64: hibernate: remove WARN_ON in
 save_processor_state
Message-ID: <20230605142857.GE21212@willie-the-truck>
References: <20230525025555.24104-1-songshuaishuai@tinylab.org>
 <20230525025555.24104-3-songshuaishuai@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230525025555.24104-3-songshuaishuai@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_152909_813340_99D9732A 
X-CRM114-Status: GOOD (  10.80  )
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

On Thu, May 25, 2023 at 10:55:53AM +0800, Song Shuai wrote:
> During hibernation or restoration, freeze_secondary_cpus
> checks num_online_cpus via BUG_ON, and the subsequent
> save_processor_state also does the checking with WARN_ON.
> 
> So remove the unnecessary checking in save_processor_state.

This is a very terse summary of why this is safe.

Looking at the code, freeze_secondary_cpus() does indeed check
num_online_cpus(), or it returns an error which then causes the hibernation
to fail. However, this is all in the CONFIG_PM_SLEEP_SMP=y case and it's
far less clear whether your assertion is true if that option is disabled.

Please can you describe your reasoning in more detail, and cover the case
where CONFIG_PM_SLEEP_SMP=n as well, please?

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
