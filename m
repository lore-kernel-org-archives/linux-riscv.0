Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17415EB64D9
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 19:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjwXRIugx7ll+MeKX4WjiBTcIyW1NMtBl+hhKXi/ClM=; b=uHsMxwL/LPRuTV
	wSflIeE13eEtUF4KUM+IVbiVK/jjwjZKups9l5+DtvoWIIwwhMAlwQ2DfR5FTIIbPZnLRmGceEYs6
	kGvotgEnx0CRjVuP8HIzpKzKEzILupPw7jRcIardxJmkoL1ZNf5TRu4en0YhVgOENS8sU0+UVrFSK
	iLju+yPUrIEdA3SRINPr03M4z+6mPnO7zvDM+yEme+ET1ZIMPbU6mC40X8PH6Q3WK9iDCEcqXGJbv
	38hjPJOroSMyONL6nFEt8oK4vPvTMLpRncS0NpvazTf0udF59R6Q/xNE0jnppuczuQLK5j2GhpjpJ
	lvnyZzBned5TkZfvsBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2pk-008TZJ-30;
	Sun, 02 Jul 2023 19:34:08 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2pi-008TYt-0d
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 19:34:07 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 362JY118017547;
	Sun, 2 Jul 2023 21:34:01 +0200
Date: Sun, 2 Jul 2023 21:34:01 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: thomas@t-8ch.de, arnd@arndb.de, david.laight@aculab.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 00/14] tools/nolibc: add a new syscall helper
Message-ID: <20230702193401.GL16233@1wt.eu>
References: <cover.1687187451.git.falcon@tinylab.org>
 <cover.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1687957589.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_123406_524349_0FF8D8BC 
X-CRM114-Status: UNSURE (   6.88  )
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

On Wed, Jun 28, 2023 at 09:07:16PM +0800, Zhangjin Wu wrote:
> Willy, Thomas
> 
> This is the revision of our 'tools/nolibc: add a new syscall helper'
> series [1].
(...)

just to let you know that I've read them all and am fine with the ones
I didn't comment on.

Thanks Zhangjin!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
