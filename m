Return-Path: <SRS0=kixk=WB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52678C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 00:10:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2632720880
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 00:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YuKLMAaY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2632720880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1D5saLmCApZmAjklymTxa/LFKuUH1X5MY3EBLgzKvXA=; b=YuKLMAaYA9uxJQ
	fQq0McfhWPU73Pze8teTnaVtP4cERDa5rb3p+UXX3VCH4BNorxmdhlEvtFRH+IU3rgy/ezUKukX+m
	IrGsd8gxQ6V+IEYoclbWLqpWykXFsLx8OCdcr1u/I+ovwkjffcF9NaSvnyYHH/i37cLvAKt15g1ij
	Zy19Fk1qtr1X0gjUt337sr+SeHQtRuVJEO1tbuAez03Bpjkqguw7lZHn71iz3Rzh13STkn55GtZdv
	OBFfnM4E3Rh4jSDVqL0HsB85S8tAvReS98kwXdTc1axxjYK+3lrrhpOPFt3D4NG2PTdh/tJBuqsP9
	6brJJMKbatYTl/1OQ6uA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huQZi-0005dR-BY; Mon, 05 Aug 2019 00:10:06 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
 Hat Linux)) id 1huQZf-00055K-CZ; Mon, 05 Aug 2019 00:10:03 +0000
Date: Sun, 4 Aug 2019 17:10:03 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Sheriff Esseson <sheriffesseson@gmail.com>
Subject: Re: [PATCH] Documentation: virt: Fix broken reference to virt tree's
 index
Message-ID: <20190805001003.GA30179@bombadil.infradead.org>
References: <20190804154635.GA18475@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804154635.GA18475@localhost>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "open list:BPF \(Safe dynamic programs and tools\)" <bpf@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 "open list:BPF \(Safe dynamic programs and tools\)" <netdev@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Yonghong Song <yhs@fb.com>,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 04, 2019 at 04:46:35PM +0100, Sheriff Esseson wrote:
> Fix broken reference to virt/index.rst.
> 
> Sequel to: 2f5947dfcaec ("Documentation: move Documentation/virtual to
> Documentation/virt")

'Sequel to'?  Do you mean 'Fixes'?

> Reported-by: Sphinx

Reported-by is used for people.  See
Documentation/process/submitting-patches.rst section 13.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
