Return-Path: <SRS0=sGlk=O2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59166C43612
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 18:37:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E6702086C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 18:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MHR5poeM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E6702086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6HUTJmfOYpeDFoUnn65e6QhNdldhxtIdSZhlg3UfsA=; b=MHR5poeMg9XDg5
	iFBrS9r0z5DwCsBMyCoYcqYOrYvlXcLPy87x6XrTPVw3TnsA5vvYGn+aCfanRfZmQEanoZp07UOGB
	WbMabk4OEphwOEA1jxC0aYY9qOvFH5M/+ZepJKWDNb1nPKD0kIlzgAP1HTmkMlzycQ4lkpHJWqlFy
	t/xtw7LZ7Kvut9ebr13TQ5g0gV0jPf30TmpJP2g/r1kcR/tNTtmS++0qrovATf8s6YNBUBRHxF1qp
	SARiawjX55ewz7wqxX6nNXRaQBPNJaolF0c3aFS0UR0EuNXnzQfvnAO8g0yqjsob1R03rij1eQC94
	ODbFKTqOBzBOFMUTBOiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYxlw-00082J-3u; Mon, 17 Dec 2018 18:37:44 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gYxlt-000824-Ea; Mon, 17 Dec 2018 18:37:41 +0000
Date: Mon, 17 Dec 2018 10:37:41 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Stefan O'Rear <sorear2@gmail.com>
Subject: Re: [PATCH] riscv: Add pte bit to distinguish swap from invalid
Message-ID: <20181217183741.GB23353@infradead.org>
References: <1544983416-32532-1-git-send-email-sorear2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1544983416-32532-1-git-send-email-sorear2@gmail.com>
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
Cc: schwab@suse.de, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Dec 16, 2018 at 01:03:36PM -0500, Stefan O'Rear wrote:
> Previously, invalid PTEs and swap PTEs had the same binary
> representation, causing errors when attempting to unmap PROT_NONE
> mappings, including implicit unmap on exit.
> 
> Typical error:
> 
> swap_info_get: Bad swap file entry 40000000007a9879
> BUG: Bad page map in process a.out  pte:3d4c3cc0 pmd:3e521401
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Stefan O'Rear <sorear2@gmail.com>

Looks fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
