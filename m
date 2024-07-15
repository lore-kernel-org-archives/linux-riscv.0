Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2657FC3DA4B
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 13:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbkW2Hlc53LFyPhZBmXvKCWk+WvxmxF5twzb1gspyl4=; b=RvmjO8tmrb/9TN
	fp+OBMguMJpIKzL5c+7/AVFYMIlFGFNgNFbeAehebfEiPKAzeDjDPHiKQmFNIWPWOU7q3qlYZQv74
	TSlYekIzasKxRCpSZNd1K9g8G/F5Unl/myA0uEyGPrQTWQH3rzur0fzHr6m8RFBLjW3TjtfeTshpA
	QvlKw4FV98yXQtWxLRUlhLDciSmpvJud5TmNcJztrTkOsloYVIkNF5tfnaT7TLR+5xL1RZUKdydJq
	ET359bOb9lK2jxoUOB5gzDKwzUI+GhIovb9VGbb0R9q3VDgwsAXxj80HETGzYZzm/W292JD1P1KSI
	+joNF7OGCp9Uz/lKm9Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTLsA-00000007E8Z-3CtQ;
	Mon, 15 Jul 2024 13:36:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTLs9-00000007E8N-3QFp
	for linux-riscv@bombadil.infradead.org;
	Mon, 15 Jul 2024 13:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=275oTcn22xyjv3pIUoHoQnMkygOo6Cyv0P4cxMnU964=; b=Wimmw+fOz6RA0z/RMgWkIGb5EU
	KhQ/YnLdjdEnjnYlmLMWPX3YNkS9phieouIMZtLS5JYmmZaZKWSzcoUeV4slQZBhPhfwzciWpH578
	Tq8KCfzV1TzlEO+cskilpA9Syl4rhs2Z4Ukc11ztHjNnimWY/yUVa5sJGStqbanmKFqik0kabCbXe
	lAKFnpe/aNdItN3IFYNoikvO4y7HJcRgDH5bdqh2CJajz+MItey9Hx4MpCgkVnoGuGU2OtXLxPPM/
	Ndw9dYphSDIYvhQ9/u+W2HJFuGGhFiLmUIedqXVXch0T5jj6g53rh91hxcxtPQf0P+yx6WTDCK1Ap
	EQANjoJQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTLs5-0000000FrAB-2WmG;
	Mon, 15 Jul 2024 13:36:05 +0000
Date: Mon, 15 Jul 2024 14:36:05 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Zhu Hengbo <zhuhengbo@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Suren Baghdasaryan <surenb@google.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: add tracepoints for page fault
Message-ID: <ZpUlxa2yqtkVvUBb@casper.infradead.org>
References: <20240715101400.39103-1-zhuhengbo@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240715101400.39103-1-zhuhengbo@iscas.ac.cn>
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

On Mon, Jul 15, 2024 at 10:13:55AM +0000, Zhu Hengbo wrote:
> Introduce page_fault_user and page_fault_kernel for riscv page fault.
> Help to get more detail information when page fault happen.

Why be different from x86?

        TP_printk("address=%ps ip=%ps error_code=0x%lx",
                  (void *)__entry->address, (void *)__entry->ip,
                  __entry->error_code) );

adding the instruction pointer (ip) seems like it would be useful.

> +	TP_printk("user page fault, address=%ps cause=0x%lx",
> +		  (void *)__entry->address, __entry->cause)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
