Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCD1C4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 14:14:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A623220896
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 14:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y/Nev4q4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A623220896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OUHc3VtmMNZfhhXa1VQ4dVc2bMrywQHxV4AeE79AUQ=; b=Y/Nev4q4YjGO3j
	BxRzrj/ghYXz5LqOCVrJnTX3ea3SH+SBfAwLXUcYxGoR60FHtWOWttHKYGl2WOYpvvsUT63wUxnO0
	N+xuVqwTREYhGDfK6Zefr8VZaqvSYqtfvhdFt/GuQ/84S2IdOnJwo8tVnKDpyCKAq8SgaNgJSrJLt
	XwfqL71o/a86ScaOGH6oxr7ij9sQ9SNIeQSkXxpBORzCEFCUgGgPAtviEHQELBtMmqkdTLAdTbYEi
	hyCkSI7jXBreG5ArfSINEjGSVFHnHdxTAVHHyUFMPlVcEnk5Rfo9ysNomoGTkUylTWKs8xcfYoImL
	lMI+CLWs4SC54LwBXK4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hahXa-0005BP-Qg; Tue, 11 Jun 2019 14:14:22 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hahVp-0003y0-Dy
 for linux-riscv@lists.infradead.org; Tue, 11 Jun 2019 14:12:35 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 94B04AEEE;
 Tue, 11 Jun 2019 14:12:30 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] riscv: export flush_icache_all
References: <mvm7e9spggv.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906110648120.16050@viisi.sifive.com>
 <alpine.DEB.2.21.9999.1906110701210.16050@viisi.sifive.com>
X-Yow: Didn't KIERKEGAARD wear out his TIRES in VIENNA during a SNOWSTORM of
 FREUD's unpaid DENTAL BILLS?
Date: Tue, 11 Jun 2019 16:12:30 +0200
In-Reply-To: <alpine.DEB.2.21.9999.1906110701210.16050@viisi.sifive.com> (Paul
 Walmsley's message of "Tue, 11 Jun 2019 07:02:47 -0700 (PDT)")
Message-ID: <mvmv9xcmcs1.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_071234_365240_EB17F7F1 
X-CRM114-Status: UNSURE (   6.46  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@lst.de>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Jun 11 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:

> Just discussing with Christoph now.  Agree with him that the lkdtm module 
> is too niche, and in general we don't want modules calling 
> flush_icache_all(), so dropping this patch for now.

Fair enough.  I'll remove the module from the openSUSE kernel.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
