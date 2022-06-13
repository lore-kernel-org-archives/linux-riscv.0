Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D86EC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 14:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIlmWdKOxs8/ADOdKek3sbga/LmPx86JeRmCQ2u7dfs=; b=QMxutmKUuOCXN9
	agYq/T+VxY241IoWc7hUnDc9z3ivKERYkfevYmJRXvkNz+/2WjKdyYFgNlRAvOmbrDBwqhi3u/c+S
	f1QnBYATxPTUKnvWYgu3nuLhLBB+/cMxPoatLc+1ygvixC+Z7DMgedW5WZKm5buQQHAr0W+8h5uKg
	GVtKX+czShaMBYO4AXrfbHiUracc4tjWOODoF5/sN5TdgphUjMnhKBfCqrqcyuUQCekjk/43gMTTA
	I4z8Wnn+mItNtu+6djZKEZ9iKHV66NnK/0gpAqUs8ota5saMtlrCIGN7e3xvb1n6nwWAmzE2M0258
	QTcY3kBNLgi/1SDfkujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0l4k-004ChU-3w; Mon, 13 Jun 2022 14:29:54 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0l4h-004Cge-S2
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 14:29:53 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id F264868AA6; Mon, 13 Jun 2022 16:29:47 +0200 (CEST)
Date: Mon, 13 Jun 2022 16:29:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: palmer@rivosinc.com, arnd@arndb.de, linux@roeck-us.net,
	palmer@dabbelt.com, heiko@sntech.de,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] uapi: Fixup strace compile error
Message-ID: <20220613142947.GA4110@lst.de>
References: <20220613013051.1741434-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613013051.1741434-1-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_072952_087471_D1784F7D 
X-CRM114-Status: UNSURE (   7.60  )
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

The change looks fine, but the commit log could use some work, please
move the notes from the back to the front and make them a standalone
commit log and just drop the rest.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
