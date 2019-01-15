Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827EDC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:58:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B3EA20645
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:58:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lRBBJXWq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B3EA20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hvc4k2qwjVONKVD815t1+lYoRlg4wxnB3eYqfFos6C0=; b=lRBBJXWq6dJYkP
	6AWS95hIdAqX9ij6G6qe0HyQP83B6w2+Uv2AKMN6GbXLBbloHL93HoX5tO/TiDiRe7gEN6WMk94uI
	tNCbzeFtDCd7N8Q+bEq88pnJl80uuOlKz0m7QebVhAbgRnB9QBMYBBiu86t5hkd1q9aED9CiRf+RK
	LoNqei4REDIOXq0ZU8ocV2/waqpM5gUfm0+MMf5YSo273ibAFJuf7DUGvK8+N5HRmI/CljSiqgwsV
	gvH76VDvuwHSGXAjFcxGf0kjBd8uDLBn5ueIiGflenymk9SatvVEE4+uOPeozlOKlPkE6NY1DtRfs
	br2nyPm/OL1sQLX7hgiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjR6s-00065b-Eu; Tue, 15 Jan 2019 15:58:38 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjR6r-00065R-2b; Tue, 15 Jan 2019 15:58:37 +0000
Date: Tue, 15 Jan 2019 07:58:36 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Alexandre Ghiti <aghiti@upmem.com>
Subject: Re: [PATCH 2/3] riscv: Fix wrong comment about task size for riscv64
Message-ID: <20190115155836.GE13095@infradead.org>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <20181210062146.24951-3-aghiti@upmem.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181210062146.24951-3-aghiti@upmem.com>
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
Cc: aou@eecs.berkeley.edu, catalin.marinas@arm.com, palmer@sifive.com,
 ndesaulniers@google.com, mingo@kernel.org, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 mike.kravetz@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Looks fine to me, and should go in independent of the hugetlb support.

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
