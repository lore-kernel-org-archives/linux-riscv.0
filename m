Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18A1C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 21:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPi9Kn4CburnphjLz1uKHFYPV+FHFWNu7Nbx4gVIuAA=; b=ugPLsErDfekKZI
	5udDFQOq690hlmXWHZj7VnGtHu8xZ/F/kbMYrQxhx7kiDLcAXS1pePFSK7cpeCPwp4l62aCuIDKE5
	loCvPciE4MIffLY88SHTZwlkoUYB58S33YUXoKRknQSLa2MTxIiiv2VTGndZu7Zh8pKjctEKcjSrW
	ryZf04EhUwbe1wu6WkjiuCm15mIxsIgGn0nC8N8ZuRYHLSqlyhBGpWEPn6P5u65aVZz3TngW60Sfv
	a6ObDNg+x56BvvTrEwSyRgRYKWxxLDXhl4oPmeHdU6o4zTwvFn/mXDxQzLQPm+1yKtOZnR6XpNN74
	VuEFYskGrAurvnBA126g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDsys-001JAB-26;
	Thu, 14 Dec 2023 21:10:54 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDsyq-001J9A-16
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 21:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9ID6E51wXAKn7Ezg5ykW3DY/29a9sY2cYsFnqwiNNi8=; b=ZTEFJ7oFYCxmuqRe9pouzKHXcM
	vA49XHnKOrNMfyKjL/tqpbbQZjfGxyIxA9U5quw/GkIHoTPr6sg7MeqpJlyCoNkO3LTM3D6zn4XZA
	6EVxoMLNssmFdaiZjjLfTNClUTILmaeRWhL8ut/m7/aVnwVkyENWBaWYAo8UZCCN2mgWXgcHxBrBg
	o0xf3W7nRBfhQy7vOn+1e381I/5qZPNIjC6oyLw4UjVAgvhAmQYTr8CkXlIaOQ0tqDwJR4G2sgEmC
	p5IwkjnM3ZPQkynrBNWaQD6P3pwx2kkcIh9KzGLAJ6cTQ2YRykOiAgtGpRmuO4LX4iGsCO0mnP5Xx
	qHY+QUAA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rDsyl-00CSEB-03;
	Thu, 14 Dec 2023 21:10:47 +0000
Date: Thu, 14 Dec 2023 21:10:46 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: microchip: mpfs-ccc: replace include of
 asm-generic/errno-base.h
Message-ID: <20231214211046.GS1674809@ZenIV>
References: <20231214-dipper-earshot-72eef3059961@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214-dipper-earshot-72eef3059961@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_131052_446464_AF9B4787 
X-CRM114-Status: UNSURE (   7.89  )
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

On Thu, Dec 14, 2023 at 10:59:57AM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> As evidenced by the fact that only 2 other drivers include this header,
> it is not a normal thing to do. Including the regular version of this
> header is far more conventional for drivers.

ACK.  Includes of asm-generic/anything.h are fine in arch/*/include/*
and (under some circumstances) in include/*; anywhere else they are very
dubious, including outright bugs (io_uring/uring_cmd.h include
of asm-generic/ioctls.h, for example).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
