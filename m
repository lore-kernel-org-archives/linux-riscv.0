Return-Path: <SRS0=1KMB=TN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15044C04AA7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 17:20:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB76220873
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 17:20:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cNJtTgiS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB76220873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pwsan.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONDHP+hixJmrUzDbxGkikJWqQ2gHYhIszyJlJqoDyO8=; b=cNJtTgiSn/BQK5
	8gDqgyM03nRNaNTn3xJrQyv6LuzOiX0xq27IO1D0iQ+7YLrgzYzeV9obUFKli6+6dIB3zj/hPPA4n
	YTIcqDBI2G5m20tAm83+NHeAebQAM/OxV/0BjWT9bpj6w4kTiq1HqgQjHQdMPZXZ3V7yxbrb5LlmV
	xLitFwin9fzh0J7LoFPyBMQTjxD9RulTO1v48BbGTSMzpaKqP3SreoCl9Rwp9GhIeVXVdp3DQWRHc
	ctXSt7AVmAH6zMnXhLbkd6Tcs0HoRNO5wCSPGZz655kQVN0WixXHCHAWlHWx9NmdI4XhVrqbyAfN/
	lBYfvG9PYCFqpjphErdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQEcv-0003WA-63; Mon, 13 May 2019 17:20:37 +0000
Received: from utopia.booyaka.com ([74.50.51.50])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQEcs-0003Vi-G9
 for linux-riscv@lists.infradead.org; Mon, 13 May 2019 17:20:35 +0000
Received: (qmail 5883 invoked by uid 1019); 13 May 2019 17:20:33 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 13 May 2019 17:20:33 -0000
Date: Mon, 13 May 2019 17:20:33 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] alpha: move arch/alpha/defconfig to
 arch/alpha/configs/defconfig
In-Reply-To: <20190513021405.12428-1-yamada.masahiro@socionext.com>
Message-ID: <alpine.DEB.2.21.999.1905131720150.5613@utopia.booyaka.com>
References: <20190513021405.12428-1-yamada.masahiro@socionext.com>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_102034_608209_D59CDA23 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 linux-alpha@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 linux-riscv@lists.infradead.org, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 13 May 2019, Masahiro Yamada wrote:

> As of Linux 5.1, alpha and s390 are the last architectures that
> have defconfig in arch/*/ instead of arch/*/configs/.
> 
>   $ find arch -name defconfig | sort
>   arch/alpha/defconfig
>   arch/arm64/configs/defconfig
>   arch/csky/configs/defconfig
>   arch/nds32/configs/defconfig
>   arch/riscv/configs/defconfig
>   arch/s390/defconfig
> 
> The arch/$(ARCH)/defconfig is the hard-coded default in Kconfig,
> and I want to deprecate it after evacuating the remaining defconfig
> into the standard location, arch/*/configs/.
> 
> Define KBUILD_DEFCONFIG like other architectures, and move defconfig
> into the configs/ subdirectory.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Paul Walmsley <paul@pwsan.com>


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
