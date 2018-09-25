Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CE6C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 16:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69A6020867
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 16:00:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j1KTy16b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69A6020867
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYr+tNtvFTnth+9Kkqc9NMZA531EeRYscdrbn+GyjyI=; b=j1KTy16bGebch2
	eRbzDQ2fWLmiLGeUH5GOyamHEgS5Z71kjT822G7iSHOk6K2DNHXGMuppH2w5Z0x85m3jKDqZKo5zB
	USxG/fWZwInp9emsjRD2MIwMnsB9E5qOkRacoA3+NvJmstdesxO0OoOnsiSFNRCmG696QZiQ+MsaP
	WpDnKVzefC6mA0+KudurPZ9waIZ9A7VJH5g7Pb9KIyZDvr7Nsn7mLnlJa6bFYcOqfLlVe5XMycXnt
	WMXsaOH2VawqKiG/XO2G2Ig7V2VvGkVuLy5LmGpiWkw15UttIJwVqQT/XN3/8aegBNwbJ2y3NUJ5h
	Wp6rGf3L1h4Uu2WQX1vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4plM-0005hk-Gb; Tue, 25 Sep 2018 16:00:36 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1g4pD2-0006oZ-Ly; Tue, 25 Sep 2018 15:25:08 +0000
Date: Tue, 25 Sep 2018 08:25:08 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Zong Li <zongbox@gmail.com>
Subject: Re: [PATCH 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
Message-ID: <20180925152508.GA24002@infradead.org>
References: <cover.1537260207.git.zongbox@gmail.com>
 <2ccc6c0758624dbb22f6fe451a3e476a000108ef.1537260207.git.zongbox@gmail.com>
 <20180921070006.GC8401@infradead.org>
 <CA+ZOyaiJv-NZWk3ec_3zhRTSn7G-NGgyaiPTXOmuWfTWD7KSJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+ZOyaiJv-NZWk3ec_3zhRTSn7G-NGgyaiPTXOmuWfTWD7KSJw@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Message-ID: <20180925152508.bxHyEMhl7rYF-5-ybnn3tz9vX45AFI4oV2W3ZjACQGA@z>

On Tue, Sep 25, 2018 at 10:19:55AM +0800, Zong Li wrote:
> The RV32 need the umoddi3 to do modulo when the operands are long long
> type, like other libraries implementation such as ucmpdi2, lshrdi3 and
> so on. I encounter the undefined reference 'umoddi3' when I use the in
> house dma driver, although it is in house driver, but I think that
> umoddi3 is a common function for RV32. The udivmoddi4 and umoddi3 are
> copies from libgcc in gcc. There are other functions use the
> udivmoddi4 in libgcc, so I separate the umoddi3 and udivmoddi4 for
> flexible extension in the future.

I don't think libgcc is GPLv2 licensed, is it?  Also please retain
the copyright notices from libgcc.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
