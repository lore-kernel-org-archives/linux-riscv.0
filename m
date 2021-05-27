Return-Path: <SRS0=ju53=KW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBA7C47089
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 13:26:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97CE8613EB
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 13:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97CE8613EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8l9t//F94vzdKD8XgwwAWxOHuWnLRht7H/4yRNgN5S8=; b=BwnljgZx1LfSK8
	nM87/+jF0Xv22KIK8ZNAoMsO+X3HskmqaRryggdZw0oZWG06Yvq1wq903VnpiTGL1az+AhIzuPpc3
	/YbTNxelD23YRQKiXygPPHxqWr7+eaU67ZgIS/yE9cgBq90BMMe6bvMZrtKkZYAhEg76Hv4mVOHrU
	FWDfi51wfMRMYY0Y3B6mII00jnDKfZLfgoeUCgc3y0JdCbF/zY6c4m2RtvhR+XBTAmvpaoSydOBA+
	oGwh9eY66kVSukCUQMUjsv151MXdKX0vwQc+gnzqqctWAL5hZpwG9z95wismBB+pjQUniwxsWT1Wu
	9e8ma0bv5G62fLAXVCNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmG1e-006FVQ-9p; Thu, 27 May 2021 13:26:14 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmFsw-006AWP-P9
 for linux-riscv@lists.infradead.org; Thu, 27 May 2021 13:17:18 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 17A2868AFE; Thu, 27 May 2021 15:17:11 +0200 (CEST)
Date: Thu, 27 May 2021 15:17:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@lst.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: remove unused SBI helpers and exports
Message-ID: <20210527131709.GA26019@lst.de>
References: <20210527072047.2572741-1-hch@lst.de>
 <CAAhSdy0GQNmXeOwhhaxPAPNgK+zP=EGzNc3LUPg_BhEaqv6yBg@mail.gmail.com>
 <1b8c5e1b-8997-74f1-b18c-feba8bb1711d@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b8c5e1b-8997-74f1-b18c-feba8bb1711d@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_061715_003174_656E65AD 
X-CRM114-Status: UNSURE (   9.82  )
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

On Thu, May 27, 2021 at 03:15:09PM +0200, Paolo Bonzini wrote:
>>> -EXPORT_SYMBOL(sbi_remote_hfence_vvma_asid);
>> All sbi_remote_hfence_xyz() calls are used by KVM RISC-V module.
>>
>
> Why aren't all these added by the series that add the module (not talking 
> about KVM only)?

Yes, that is the way to do it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
