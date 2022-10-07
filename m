Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CC8C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 15:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fB4E88kv8IoKU5qvF7U42/Xie81NDJgTAGCB8HEIFSY=; b=PTSQvQ3Dwu+BGe
	OF8YXD6sjo7jDh+HSQJQbnFatkHqrCbYNONDBbeGy2FpjjAzZrxU/xcN2ZQH3x6inpyJaTxV3c9eH
	NlJH5SQ+cpWJopY+UFJOOIHP6pMcnxyv6srXgduqGYRJGjttLZXLDhMhpNq6f6Q6us42HAG9HPIM7
	706E6eMPyNZ4Ki+uNseXiFTvOt+6bS6zjzcx2zyFyr+PbOAZxncvpzjLpvpF1BEftfk3yPvfAAOqc
	iNCNi+5XeYcnao9q9ER0puzbFDPefL5Vk1nmqVzhUf8chXR5YL71CYvboX6fDUNqkmYYslwjzgwP1
	n+q/HAbxVk/90IaK+y0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogp0m-009QEP-2c; Fri, 07 Oct 2022 15:11:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogp0i-009QDo-Qj
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 15:11:38 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ogp0f-00082l-Ln; Fri, 07 Oct 2022 17:11:33 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 6/8] riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
Date: Fri, 07 Oct 2022 17:11:32 +0200
Message-ID: <6481137.4vTCxPXJkl@diego>
In-Reply-To: <20221006070818.3616-7-jszhang@kernel.org>
References: <20221006070818.3616-1-jszhang@kernel.org> <20221006070818.3616-7-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_081136_887314_E564723D 
X-CRM114-Status: UNSURE (   7.09  )
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

Am Donnerstag, 6. Oktober 2022, 09:08:16 CEST schrieb Jisheng Zhang:
> Switch has_fpu() from statich branch to the new helper
> riscv_has_extension_likely().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
