Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803ECC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 07:21:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17D6E208D9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 07:21:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jtJmi/UZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17D6E208D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Lh7U5r/7qbJ+r4J5DYa+gP42r/BJn56KGlHzoVvLW4=; b=jtJmi/UZ8BBi8H
	R6yPiNZJj5mhSmwauS+ZJOkmW++m3t2Um9irTSbyXcvypZ3uSKRU1DkGrSoaAIWR6gXgPhNCrD4vI
	BWs1nQsM9XefIDL4BJVMLopvTYQpLZD9jAruKaUCFpX9iAwyHnhFEBm8Ev5xMTJXXBzLnChKhSb9N
	UYO5RzudnpzcsIDuW+aME4bG2iqBjY40zA/R97JhKxJp1oOTrne+DA/aaKiv0d5XQN0kbtfj0Va7t
	j+UCNw4Ps7ftnn6K/xupuucNLkTM65YMJPzcRWmBOOetOovyB8UyUw8MrKK1NR4s3djxa7cNjv2n4
	usgc9tRkB9ncaZxnCz1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4hfA-00040Z-Ur; Tue, 25 Sep 2018 07:21:40 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4heW-0003gx-Ms
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 07:21:03 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E59BAAF41;
 Tue, 25 Sep 2018 07:20:25 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Zong Li <zongbox@gmail.com>
Subject: Re: [PATCH 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
References: <cover.1537260207.git.zongbox@gmail.com>
 <2ccc6c0758624dbb22f6fe451a3e476a000108ef.1537260207.git.zongbox@gmail.com>
 <20180921070006.GC8401@infradead.org>
 <CA+ZOyaiJv-NZWk3ec_3zhRTSn7G-NGgyaiPTXOmuWfTWD7KSJw@mail.gmail.com>
X-Yow: I think I am an overnight sensation right now!!
Date: Tue, 25 Sep 2018 09:20:25 +0200
In-Reply-To: <CA+ZOyaiJv-NZWk3ec_3zhRTSn7G-NGgyaiPTXOmuWfTWD7KSJw@mail.gmail.com>
 (Zong Li's message of "Tue, 25 Sep 2018 10:19:55 +0800")
Message-ID: <mvmefdicabq.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_002100_906038_C5C4DAC3 
X-CRM114-Status: UNSURE (   8.77  )
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
Cc: vincentc@andestech.com, aou@eecs.berkeley.edu, zong@andestech.com,
 palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925072025.w8Dbmi752pPz-oRltHg_ZurLqQqWaBpXjkAyoLey_0Y@z>

On Sep 25 2018, Zong Li <zongbox@gmail.com> wrote:

> The RV32 need the umoddi3 to do modulo when the operands are long long
> type, like other libraries implementation such as ucmpdi2, lshrdi3 and
> so on. I encounter the undefined reference 'umoddi3' when I use the in
> house dma driver, although it is in house driver, but I think that
> umoddi3 is a common function for RV32.

You probably should use the macros from <asm/div64.h> instead.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
