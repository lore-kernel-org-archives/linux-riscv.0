Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A1AC46CA1
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 02:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgzI93jOjwp4wj20Xqrhxt1HBT7q1/bPF7ea+pU7cAg=; b=xfgHFTqIahNQJ0
	JujFvT574oqWX5VlfZIMioGHQGlqvlBZOGvqJ04bBJBvFshmPXZAF9+JkFSwR5O6wuHvBmdVXW7kc
	cOpwlo9b46gqAY5zQbptqscWEqbI4FfA8qOmiXsTMb6cwukzGC2g/tQ/5CbDx8NK4VlwerXkz32xN
	nFLqgaWhokwRBm9EsAe2p1C/dCWCDm55dUKc66tOVdX055k5AUO/jsW3hsM69oTIMAwgpGjHtUf1v
	V+4TEwSoCswm/+LlwpMvyNxDenqvcN5WF/6HZmCbKK14NBULuXxJkUcaDsjhmwk4WljTlZpZUHoXZ
	zgWHGa7FnUPM59coXJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhhrZ-00D23W-39;
	Sun, 17 Sep 2023 02:50:21 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhhrV-00D238-1V
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 02:50:19 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 38H2nnj8009853;
	Sun, 17 Sep 2023 04:49:49 +0200
Date: Sun, 17 Sep 2023 04:49:49 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/4] selftests/nolibc: allow building i386 with multiarch
 compiler
Message-ID: <20230917024949.GD9646@1wt.eu>
References: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
 <20230914-nolibc-syscall-nr-v1-1-e50df410da11@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914-nolibc-syscall-nr-v1-1-e50df410da11@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_195018_510291_F06539DC 
X-CRM114-Status: UNSURE (   7.45  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 14, 2023 at 06:01:17PM +0200, Thomas Wei=DFschuh wrote:
> When building with a multiarch-capable compiler, like those provided by
> common distributions the -m32 argument is required to build 32bit code.
> =

> Wrap it in cc-option in case the compiler is not multiarch-capable.

I think it's a good idea. Zhangjin was also using a single compiler for
both archs.

> Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>

Acked-by: Willy Tarreau <w@1wt.eu>

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
