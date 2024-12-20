Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C6DE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 16:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HorN8NwiSAJDTa0gycmpIHFuM76ZpAA+Dt728JX+aFA=; b=xUYX4Pw95cWgRc
	yEUoGlHpwLA8dWvlRwMkvbnjF8965tR/8ltzizGFdlRctxno1j+ozXdfO1pz0lUY1FztosYIEQUIm
	dhNXqNxi4qB2AFOEQBRrgmhIpDBCAhtAc0qXpHKlCuY34flVPp/UpXk6z46CJa12B5OW1y/LrqG06
	8ZUITYapfwBtwCc3kRgoLvmVc3Ikr/rFLYhiTvFj/gp4bJgMiyE2awHjNIGZmyeMiaMMoH0BewHay
	b6Y9aP0xxwJkiOaZvGVygYkUJOUZJWi0Dxz+QsOrcIJYl1tUA/muKT1dX5CC6vU5QQ8w6rdswUM+R
	3WKW6enlivnHNS+QA+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfZP-00000005QQO-1rI1;
	Fri, 20 Dec 2024 16:09:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfZO-00000005QQC-1pIq
	for linux-riscv@bombadil.infradead.org;
	Fri, 20 Dec 2024 16:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=5jUyvcliTWq/zA4LB6ZBAPw47QQ3JG1r8KxL9sbTAtU=; b=JFr1ATRWBHcESLVqviU8FgFw2g
	0LfD+AftdKsYD7mwD9lUsH4buj8vkqNLKSfYj0Jm7hFmHhe6nb4S+D9l0jWu+FCsqo4TlEedjk35/
	5DntPIo3YppSgu4TZsGUZ1FIm0yfJAZSfUcD31avJzOw4f9XLu7EzQOarGrySf7Rn2Yo3o+U6a9pY
	KhFf1F23rhEg8GroN1HfZbLqK4wy/QRqkz7/UcByVBLrnz2DNwbwtiJMRRW8fAmcpKu+zrtMawPJ7
	Ind+0myuKUFLOS1PImHk0g7idWh0lGo1xVtDTkqxt3KobGXiv4R+5gFocpZulnl0RjiFSN3+JipJA
	lZ+YoFjQ==;
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfZK-00000001XiO-3t5D
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 16:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5jUyvcliTWq/zA4LB6ZBAPw47QQ3JG1r8KxL9sbTAtU=; b=XUG4NWuWND9VzcO++6nv12EymV
	GeSwS07uj0VfBNS2i3nOFXYIYAZDS4KjL80XgdL0pv3zoyYoNHTQEP0IlAwAqAEwXVFcr7NrVHLs5
	jVVeF9b4phZTVSwQNODozIS1f0TIfSwU+Lu7uGy0WjjuQHAt+uXSUm5+geOaLMCgJ5fSAcvOVWoQu
	WXnHsffWk8Bgu9ZbS9dG38GtQdE/IBuqNnmoe2hs3S7cGaaBa3WrK4x8Lts8OZjgZNCQYcm0JrCyx
	JzhlntlGp2IPouMpgzdlN8gVv8PmuOQLjO4640CMyzx++CBCjJTFPRqEFYT52RUkluq0x0ZmVSarm
	QcElHkmQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfO8-00AD9n-3c; Fri, 20 Dec 2024 15:58:04 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO7-00000008LST-3gt8;
	Fri, 20 Dec 2024 15:58:03 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Subject: RFC: riscv64 big endian system attempt
Date: Fri, 20 Dec 2024 15:57:46 +0000
Message-Id: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_160939_257099_6A845FAD 
X-CRM114-Status: UNSURE (   3.05  )
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

With the latest spec adding configurable endianness, we thought we
should try putting together a proof of concept riscv64 big endian.

The full information is documented on our gitlab[1] which includes
source repositories, build information and project documentation.

We have a minimal buildroot, qemu and kernel working on QEMU.

As this is a work in progress any review or help is appreciated.

[1] https://gitlab.com/CodethinkLabs/riscv_bigendian



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
