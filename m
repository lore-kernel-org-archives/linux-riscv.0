Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5110CCF856D
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 08:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=TW9vFWgcE+C5Vd
	uir2L89xqBY5rwhkpCRHMrvZ9VfcYfQdoe6qgZdxEh1k1woam2gcRA4eVDlSqcS1AdmyMuCJDWDU+
	FlG+1LEqywVv1+ILPqxvuABTQfvH+l78joxrui4aN5GPEXh4ir58iC88LnDSjGRrZ18SqfMPsNnkU
	6qDRiMgu6P0NZ0DbFqAW+DrbB6Tq+qNMlwo+7ljfIYymgilQLfl7eE2aMzMUv3JpVfF1N9eBqmTuV
	YnrgX4+0NUuqFhFKdRVjC5gkBqBbSIij/03oDHbtwIyV7Zx0TbB/NDgbQXojJvfPldjkHIjyqbyDf
	M7JLksgLTZK+wEuYZGkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swH0v-00000008Wqo-0yfr;
	Thu, 03 Oct 2024 08:16:45 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swH0s-00000008WpO-3xYG
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 08:16:44 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 2CB3626496; Thu,  3 Oct 2024 10:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1727943401;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=R/ArYwNsnnd8k2uIXO9xPl5XbtYDNHGQ52FB/p2H8cseRDpxLk4TAp697vYuSsq4k
	 Xlm5gMth5HMaMKUfNq5u3EJip+nzHkQVvKSwUVI4efoz0AC2eHzTGZN4cQVdqLcK5Q
	 9tuWDPZrIc3cs6evOlOTCMaXlWNH9zAevwlJe157T35+Hxx++ceeHYjWZjZtWipp0C
	 5E/sh6Qm/F4tDZttMje539/4jWza7tLpq/uf+VpMQDygBRz6AIDmTj5xU6LwalJDuF
	 lVYjAxxbq9kxW6LfXqe9hdf4CersOghIAFN1qNyItWH57TFDiYywrf2uw9zITiakyF
	 ktTBNKrj1FTlg==
Received: by mail.completesolutions.pl for <linux-riscv@lists.infradead.org>; Thu,  3 Oct 2024 08:15:48 GMT
Message-ID: <20241003084500-0.1.dz.1ebzk.0.mgqhp1o0ij@completesolutions.pl>
Date: Thu,  3 Oct 2024 08:15:48 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_011643_133643_039B55F4 
X-CRM114-Status: UNSURE (   0.10  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllCk1hcmNpbiBHYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
