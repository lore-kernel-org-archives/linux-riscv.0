Return-Path: <SRS0=hxTO=OU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBB8C5CFFE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Dec 2018 10:33:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD29020811
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Dec 2018 10:33:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vgnf5nXU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD29020811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3z/vJaPPKwAU7znMdoQun/eLT/jLqFbGGfECgBTuTuk=; b=Vgnf5nXUKN7aSo
	CJ0hrqEQh3Vi+PKbPqvlI2GsnwYrFspupo+CPpVYntk0QU8wlGePVnBGrIpiOj9lWbYQ8IQyEpHEH
	Yag1axvClA7RT7VVvHdnzylO8E1MukN9Qo+JcVHgaBLhbyuJNUopqLzQk6y9Wq1QNoI9a6j0I0ylT
	k/rsG0I6nkM/G7esJUpQN5QqrUf19x41TwRgQ5VQ4hcOmlLkoXc+bp6bZAEB6Y2PUC/ogU+FyG9kO
	Xdl3dtYQyLb+a3Rlzs1VazOx2Nw/g8MUosC/niDW3Svtqa7jUVdvt4mP+b/3G/KU/ZIcaNTKQCJSN
	zzmXnKGYwhMz6OHLqZHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWfM8-0007nP-2W; Tue, 11 Dec 2018 10:33:36 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWfM0-0007lO-G6
 for linux-riscv@lists.infradead.org; Tue, 11 Dec 2018 10:33:34 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1C650AF4B;
 Tue, 11 Dec 2018 10:33:17 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: BUG: Bad page map
References: <mvmd0q9bhob.fsf@suse.de>
 <alpine.DEB.2.21.999.1812110833360.19013@utopia.booyaka.com>
X-Yow: I need "RONDO".
Date: Tue, 11 Dec 2018 11:33:16 +0100
In-Reply-To: <alpine.DEB.2.21.999.1812110833360.19013@utopia.booyaka.com>
 (Paul Walmsley's message of "Tue, 11 Dec 2018 08:34:57 +0000 (UTC)")
Message-ID: <mvm8t0w9wur.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_023328_677739_006E1F3A 
X-CRM114-Status: UNSURE (   5.11  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This is the reproducer:

#include <sys/mman.h>

int
main (void)
{
  char *a = mmap (0, 4096, PROT_READ | PROT_WRITE,
		  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
  ++*a;
  mprotect (a, 4096, PROT_NONE);
}

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
