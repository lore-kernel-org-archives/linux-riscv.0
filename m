Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8422CD8C9D
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 01:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G9iZHnMBWlwB5lX++0NShTWWLIeNV4kDxDIjk6E48lw=; b=MEpxZHy98QZ9My
	DKU5l7JXKJdRpCba8mKSwQxnUP5r57WH/eo/qX/BKVJRUy01lX3BGOEWKTOMmWjSjPOEEgjNu9LSi
	1u6Tk0lST6Fo7oiC2DzntCvSzGebYrelnG74jzyimoJ1XynIX0XTnm9ooe1f4pCVJd+kLK6KI0dam
	Le6y5Ef+iRy+t4v2R1R24Xjsgn9C8PPwnSbHIqzcM0JyPb9Ni1kzl/fPXNh701NykBL8g3MBn7jWA
	l06xdcFNJvNQ6i3xc0q0SzZAsJcyfpRs0xAN8Tt0pgJuPXvvRLjONthZeXDiMFOKhnvf9ZVqMg33y
	Zmgj1aaMhrozGEbS5FcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWlIY-00000004as1-1uOZ;
	Tue, 09 Jun 2026 01:30:34 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWlIM-00000004arL-2hWe
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 01:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780968615; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=S8CasrBqDcSvnwLoPc7FFTVmuO9W7HXHe082ZFLE2Nk=;
	b=pW6KUnXF61waTme2fMzIFf/gTcVmCVBKi1h2TcHP1raNil4M2tlk0n6m9vyq1Sp/ystqwweqvWjfMHBO536us7re+BviOVCMa1qNeEfBLrx5NLZtV38seQ9pKQ9Ag5YEf7LwjEXA3WSGL88ffKSyGzUb73gJihAM6oIc89ESZTY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X4UCqPr_1780968608;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X4UCqPr_1780968608 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 09 Jun 2026 09:30:12 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: martin@kaiser.cx
Cc: cp0613@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mhiramat@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rostedt@goodmis.org
Subject: Re: [PATCH] riscv: ftrace: sorttable: fix mcount sorting
Date: Tue,  9 Jun 2026 09:30:08 +0800
Message-ID: <20260609013008.6868-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608201904.715374-1-martin@kaiser.cx>
References: <20260608201904.715374-1-martin@kaiser.cx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_183025_811241_8D5CF241 
X-CRM114-Status: UNSURE (   6.11  )
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

On Mon,  8 Jun 2026 22:18:27 +0200, martin@kaiser.cx wrote:

> The sorttable helper program does not take into account that the
> -fpatchable-function-entry compiler flag reserves an additional 8 bytes
> before each traceable function. (The size in bytes is the same for
> RV32/64 or compressed/uncompressed instructions).
> 
> Define before_func = 8 to fix the mcount sorting for risc-v, share this
> setting with arm64.
> 
> Fixes: de04fca5d2f8 ("riscv: ftrace: select HAVE_BUILDTIME_MCOUNT_SORT")

Hi Martin,

Thanks for the patch.

This has already been addressed by Wang Han here:
https://lore.kernel.org/linux-riscv/20260527123530.2593918-2-wanghan@linux.alibaba.com/

Thanks,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
