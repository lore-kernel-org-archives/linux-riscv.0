Return-Path: <SRS0=aw4H=SL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB937C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2019 03:02:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E9F920883
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2019 03:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ay/HbsEF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2bhE8Sbj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E9F920883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1PGODi6iEA64cb8hO8p/IDQngloTRAcBy2jszbkxZw=; b=ay/HbsEF5g/fI0
	P/593mydB4ahj8v5S2NovciTyjvZlYFNMv9t2/3MyqUf16Yeh5BiWkUu1H6AJJn/qqf3Dl1bxqbHo
	483nQq6ON4L9qr5jWz3GXd/gy6mgqE2wJbjm42ecfGkH8e6+qNaen5tRf26l2uTqyTLtAbs0+Rtoa
	FVyKQ6xrpKy/zSyOlmuN6fi/Fg6Y/QAJXuVyjvvyVX1qiOp89m2NGi6dsIT+60BoKmlgNsJu79VVY
	SmS2V9+51ei+SxUyFfS47alRso/RkmtbV5XAsrDSei1YZHR43lw9Eywm2H8NmZXel5SASgtRiPnQV
	NHFnniyX4st956fY4Rxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDh2E-0005ao-9o; Tue, 09 Apr 2019 03:02:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDh2B-0005aT-Fr
 for linux-riscv@lists.infradead.org; Tue, 09 Apr 2019 03:02:52 +0000
Received: from guoren-Inspiron-7460 (23.83.240.247.16clouds.com
 [23.83.240.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7EB320883;
 Tue,  9 Apr 2019 03:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554778970;
 bh=t5lw2qiEV7u1MtseXj9orZVuUVyZtBqwN7cNHwi+l4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2bhE8Sbjuk9jyJKrtShYLySVEYb5pQrGpE62ml0qxRkjLRO099Om7Qws+zEpmPRd4
 tJrBRDWYaplPia1YS1Ujm0SWLMX2DpatrJaBnvkMW3KibxJi7RFJ+Nos3Zo97PpBN/
 XU0sGymKChUEgBS/lVwKPHD/ZvHqGk4jxO8rHzNU=
Date: Tue, 9 Apr 2019 11:02:31 +0800
From: Guo Ren <guoren@kernel.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v2] RISC-V: Implement ASID allocator
Message-ID: <20190409030231.GA14861@guoren-Inspiron-7460>
References: <20190328063211.13052-1-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190328063211.13052-1-anup.patel@wdc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_200251_547558_48E06491 
X-CRM114-Status: UNSURE (   8.57  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Anup,

On Thu, Mar 28, 2019 at 06:32:36AM +0000, Anup Patel wrote:
> This patch is tested on QEMU/virt machine and SiFive Unleashed board.
> On QEMU/virt machine, we see 10% (approx) performance improvement with
> SW emulated TLBs provided by QEMU. Unfortunately, ASID bits of SATP CSR
> are not implemented on SiFive Unleashed board so we don't see any change
> in performance.
Can you tell me what is the test case ?

Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
