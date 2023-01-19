Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B983AC00A5A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 17:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBuOs4NxKKAyuKQULyFgkiG014qnHVdFXo0LDjjLz2w=; b=K5ROJsl3Y5C8lA
	Vei8lprrHLArCaVK0Mug+oEHPCzr/1zc5er14WlJAs93z6FCv1OCTyPeUtAvc3jUbq/I9Tjtip/bB
	9AQ3q+oEzVC5OqKVuACVBwWfO8u9D2SVSCFToJm3oTRsk+MYLvLlfit1n+5nuXkV7psojbJCdjg/E
	B0ngvjDlTMRjM8Aqf1M1QH1d5DelZYs0lFCAmGJOCqmHmB02q5q7JlEz7y/zAbdZlsRPtKef6OYBn
	3HiyvWW6+NljhuZdytyQcjPJWr6j8zPbejFMNL6Dv/TkGfmspd2Z+Wtdeiq+XYBXXukScC+C7UfGy
	TNy95gvmTuzH990CIpMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYbb-006Ew1-MA; Thu, 19 Jan 2023 17:21:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYbY-006Eur-CF
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 17:21:37 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pIYbR-0005F1-HO; Thu, 19 Jan 2023 18:21:29 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>
Subject:  Re: [PATCH] riscv: alternative: proceed one more instruction for auipc/jalr
 pair
Date: Thu, 19 Jan 2023 18:21:28 +0100
Message-ID: <1748643.VLH7GnMWUR@diego>
In-Reply-To: <20230115162811.3146-1-jszhang@kernel.org>
References: <20230115162811.3146-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_092136_463520_563FEF4A 
X-CRM114-Status: GOOD (  10.07  )
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

Am Sonntag, 15. Januar 2023, 17:28:11 CET schrieb Jisheng Zhang:
> If we patched auipc + jalr pair, we'd better proceed one more
> instruction. Andrew pointed out "There's not a problem now, since
> we're only adding a fixup for jal, not jalr, but we should
> future-proof this and there's no reason to revisit an already fixed-up
> instruction anyway."
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
