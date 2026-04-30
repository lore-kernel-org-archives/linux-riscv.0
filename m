Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BA3FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+DSdc5auPzvfqQ9ECQk+Z9Ahsd0URGEfXgBKrJvCe4=; b=CTVmSFTDzM5gTn
	bsIk7ErcoyGbHmWhtfezbn2KtWOl3bUmbkVE++QOcDGdZ6cXEMU7MfotcGZ1gFBVsiT6eVmAgwHKQ
	IPZ30ARfHaqTxsWCldhpDwQQPMS92TCJVBeEmid/CH3I+Ou3N3z3v10J8GWP8VDClr44wxK9dubXg
	Z/x63INolrEWcPFF05BDfC0Sqa5jzxrSAsCh49+UCMHL9Z6MzSVO5xk9z49kf50MjaDC1j70dyyb6
	61o9YDO8h5h+sDLq7qe3Fhkj0er69VOp2TqZFd1BBDvZo3SR4c1IODXIX7LtJoGDw0N+P1DpnsEJA
	zqSBPzINfXu1/fxwsJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQVT-00000005SXN-3YUF;
	Thu, 30 Apr 2026 12:28:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQVR-00000005SX5-3QrH
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 12:28:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5D4C6015B;
	Thu, 30 Apr 2026 12:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3113DC2BCB3;
	Thu, 30 Apr 2026 12:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777552116;
	bh=6B0X6HrcdX6z6dBIJfJ7PomqkAZaJ9Jzm+7wSfebQDI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M8AWEWWWyxV2EuxEvVIMWWA6vnsHj7Sga3jbF6L1GllCvHd97bns6VBGOKnf6w6CY
	 L382QOdzUqjfcGa82LUuLzNbe0MFlmdvusi1gB1c5xcJF15GdIZrN+tpSQHncA+W4f
	 giDu0fjHmNj7JCDBMe+2eFpegxbs0QzS1KTh549z7tq84tBK0+a245Cf6h/anUxadp
	 fkYB4AsFvh5KDNzfvzoz/HM1Fc6T3t/DGYfoBtZKE4bsQ2cLRMQCWbsi3RS3YQsA0a
	 PGBdaSmcFtRAMiq7QqqGTLAmtu/9OkEmJKM3mInyb7xwwVTASf5qe6LbUxulz3gq/f
	 Z2lC5WidB1+mA==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev
In-Reply-To: <20251102230352.914421-3-aurelien@aurel32.net>
References: <20251102230352.914421-3-aurelien@aurel32.net>
Subject: Re: (subset) [PATCH v5 2/2] mfd: simple-mfd-i2c: add a reboot cell
 for the SpacemiT P1 chip
Message-Id: <177755211394.2550722.15714399977264400993.b4-ty@b4>
Date: Thu, 30 Apr 2026 13:28:33 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev-ad80c
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

T24gTW9uLCAwMyBOb3YgMjAyNSAwMDowMjowMCArMDEwMCwgQXVyZWxpZW4gSmFybm8gd3JvdGU6
Cj4gQWRkIGEgInNwYWNlbWl0LXAxLXJlYm9vdCIgY2VsbCBmb3IgdGhlIFNwYWNlbWlUIFAxIGNo
aXAuCgpBcHBsaWVkLCB0aGFua3MhCgpbMi8yXSBtZmQ6IHNpbXBsZS1tZmQtaTJjOiBhZGQgYSBy
ZWJvb3QgY2VsbCBmb3IgdGhlIFNwYWNlbWlUIFAxIGNoaXAKICAgICAgY29tbWl0OiBiODRhOWFj
NjEwODA3MzViNjE1MjMzZTEyMzFkZGQxOWY2NjI0ODY5CgotLQpMZWUgSm9uZXMgW+adjueQvOaW
r10KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
