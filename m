Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F30C5CFCF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 05:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7AjayeWYHkTEy3dYnMakruI+ksHLX72fxdMoeRLNy4=; b=MsE2MMziiJzXI6
	eUgxLZr6HiT+AnM88sYG+vVS5V75EXxvFpEckSE/WKHNkU2iDBm/nCQhgbyLEHLv9+y0oyuMOsBkh
	vYAPXwDR1Kx3sE0FYJB+BeiD/I7eWDkSAncmAV9wuMdk/nZKkqfdUocapfBGFaSZK8u5jWKbdx4G8
	8Unka46wqIwIAZ2zVVrcZ7q3rV8AGSwCEnxNzPhRIxzAliztLrQUz38d+EqVO4ohBii0l0zEmWChY
	yY0OSzMrIFEktHd8wDvJe9xnDAUigWwDFZyYv3xXulxw2rAzwVr6JLTIDF2J9xWJ12vgKPZh/pgWE
	WWknbhTRHEwTH63e5ijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuktI-00000001znf-2eaU;
	Fri, 14 Aug 2026 05:55:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuktG-00000001znY-3Z0C
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 05:55:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 321EA43964;
	Fri, 14 Aug 2026 05:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791631F000E9;
	Fri, 14 Aug 2026 05:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786686938;
	bh=l49uZpMY8QahNeQU4c0J9viiUOI5hPpb8Zv/YIAf+IU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=AmESKaJyfbpLSaZx2SenXHP5hpIHTa6v0eDk/KVdPrCRbAbJnW3MpH2+Mk88RHJe1
	 H0Nz7eYGdD3CrKbTHf56GP8OjdMejbl6+Zwt6k95DkA+vTuYB3oPKgwdZ+cKV/lnUr
	 8DuVngRQ7CcuwebAGryr4U/z+XnLYV4iSBjwduHQsv8dw9EcyXF15i+M2XE3AP7L7/
	 Cu68EQ8+ZXzdRkTRF1VEwPCBQA4evDuKXJ2sN8CG74HdYQTIcCIGplVDAtwrxeMWtT
	 RjEWf4Iaso1boGZ6ogG6cU5n7aCwWkc+ehLIM19ow0hAM4vlkn7pLsoPPmWGLw9iG+
	 hPAPpY5xKJ9XQ==
Date: Thu, 13 Aug 2026 23:55:35 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Xiaofeng Yuan <xiaofengmian@163.com>, Nam Cao <namcao@linutronix.de>
cc: Klara Modin <klara@kasm.eu>, prabhakar.csengg@gmail.com, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] riscv: patch: skip fixmap mapping when kernel
 text is already writable
In-Reply-To: <8733wjzvkj.fsf@yellow.woof>
Message-ID: <d8d4f892-ab9f-3baf-52aa-f269efc08ffd@kernel.org>
References: <20260720032258.5188-1-xiaofengmian@163.com> <20260720032258.5188-3-xiaofengmian@163.com> <ant_8TaBbov_GS4i@soda.int.kasm.eu> <8733wjzvkj.fsf@yellow.woof>
MIME-Version: 1.0
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

On Wed, 12 Aug 2026, Nam Cao wrote:

> Klara Modin <klara@kasm.eu> writes:
> > I have MODULES disabled and thus also STRICT_MODULE_RWX disabled, but
> > still STRICT_KERNEL_RWX enabled. I saw that an earlier version of this
> > patch[1] instead gated the first branch behind STRICT_KERNEL_RWX. That
> > version works fine for me.
> 
> Urgh, I got confused between STRICT_MODULE_RWX and STRICT_KERNEL_RWX, I
> suggested the final version.
> 
> Xiaofeng, can you send a patch?

Just dropped it from riscv/for-next, so, no need to send a revert.  
Xiaofeng, could you send an updated patch?

Thanks to Klara and Prabhakar for reporting the failures promptly!


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
