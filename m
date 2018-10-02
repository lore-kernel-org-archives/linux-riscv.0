Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92F1C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:50:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93D1220666
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:50:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EFVO1cST"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93D1220666
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ComgL5tWXn7gbU+GvWOAcXCnbPA8XZ+mQ7bLIoFmfk=; b=EFVO1cSTrWNcKS
	+MxqIMATVOQoNAhY/ieYtYi8q5ODlknelXxIw9XuNJ3pNImvOQbjBPNRwoiS8Gf+NFF5RXO5JKoyf
	pFj2nONq82/C3zkkroswOfN+BVqcEpudZXS6Tgsr4+nmYu+ExUZvKrmgZfGhcHnnR+WxB9mHyuM9s
	AusOoXDQujX5/QZf/d9d6KImFY7Y/XV0zP3HbBlKuoQKqiJ+lFAyi2tLqV0bcL5ciU9HTr53PyQMX
	PsiIvI2r7lq2ipGPd3Jd6Yuhf0TMxDTAhwC24bNOgptQmhFQjIiTy+WQx9gUXvdBigNXQ4DwD9w4X
	/MMsi3+7zxgrWfplcy4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7M0o-0002mH-FA; Tue, 02 Oct 2018 14:50:58 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1g7M0n-0002lx-9s; Tue, 02 Oct 2018 14:50:57 +0000
Date: Tue, 2 Oct 2018 07:50:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Zong Li <zongbox@gmail.com>
Subject: Re: [PATCH v3 4/5] RISC-V: Select GENERIC_LIB_UMODDI3 on RV32
Message-ID: <20181002145057.GD3889@infradead.org>
References: <cover.1538470103.git.zongbox@gmail.com>
 <3f1967e8be0c25910bf04181e84b46a788a156d7.1538470103.git.zongbox@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f1967e8be0c25910bf04181e84b46a788a156d7.1538470103.git.zongbox@gmail.com>
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
Cc: zong@andestech.com, aou@eecs.berkeley.edu, palmer@sifive.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002145057.0k3PMdRY6JOpWdezIvT04QhQUrE2x2NfwfSpu4g2Gjs@z>

On Tue, Oct 02, 2018 at 04:52:30PM +0800, Zong Li wrote:
> On 32-bit, it need to use __umoddi3 by some drivers.
> 
> Signed-off-by: Zong Li <zong@andestech.com>

Which drivers?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
