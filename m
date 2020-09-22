Return-Path: <SRS0=X0/G=C7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B083C2D0E2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 23:50:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D95A820715
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 23:50:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VvBTYH1g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D95A820715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gN3Bh4IONUGOEK7Hajx6EbcAW7ePespI5tNeQAtvaOw=; b=VvBTYH1gPdVrsBhvaPtmnbXnn
	sm+cAHir2rJ/uw0kzbD105qLAnh7wGcm3+N9tErUzZmiWQuP4Jww8tM5uUdkTNao8fbSblu7/Lqdj
	eR7dsb1bpgDzN/Fxzn62XAhXwIlAPC06+hRdTEQipeBTpVX15OaSCG4ayBR4po70qntnqND/J4v0f
	WDI+HFbnX6aD/p3RjTgbQtaEdBDYVlQ4lpxXfmdbwefgift1olxJhY8uHlOGh65o54bFwlMK3EQFZ
	klAvWr4FB4gxsYEooWjmxWFjKhoP+wKzZQaJRwWrELrgW9thXhiqJIX+XXHEQeDK6f40kteefYl7f
	VvOde8JLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKs3Y-0000s9-Sf; Tue, 22 Sep 2020 23:50:45 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKs3S-0000qh-1Z; Tue, 22 Sep 2020 23:50:38 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 4A6F113BF8150;
 Tue, 22 Sep 2020 16:33:46 -0700 (PDT)
Date: Tue, 22 Sep 2020 16:50:30 -0700 (PDT)
Message-Id: <20200922.165030.2291105439162323404.davem@davemloft.net>
To: morbo@google.com
Subject: Re: [PATCH] kbuild: explicitly specify the build id style
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200922232140.1994390-1-morbo@google.com>
References: <20200922232140.1994390-1-morbo@google.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [2620:137:e000::1:9]);
 Tue, 22 Sep 2020 16:33:47 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_195038_307798_750AE69C 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-s390@vger.kernel.org, michal.lkml@markovi.net,
 linux-kselftest@vger.kernel.org, linux-kbuild@vger.kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, natechancellor@gmail.com,
 yamada.masahiro@socionext.com, netdev@vger.kernel.org, tglx@linutronix.de,
 luto@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Bill Wendling <morbo@google.com>
Date: Tue, 22 Sep 2020 16:21:40 -0700

> ld's --build-id defaults to "sha1" style, while lld defaults to "fast".
> The build IDs are very different between the two, which may confuse
> programs that reference them.
> 
> Signed-off-by: Bill Wendling <morbo@google.com>

Acked-by: David S. Miller <davem@davemloft.net>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
