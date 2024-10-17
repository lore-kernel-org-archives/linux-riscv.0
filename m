Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3476D3C525
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufn/tV2gzpQsRSpyEZvDmtPLl4g/IQ+x1aMfEGRUFJ8=; b=SfwojI8XUoj+CE
	h8Ol4GePU1XMwu4vzq5yw6fImuLAVwkObpUAjfzt8e7BmL1rTKVG0Jz8ffW5RMwx8hKSilgZ9qu9g
	YKp/crFMAXaaYyVs4pwQ9c6LWd2AbfsSpPTIedbOqzOaiB9itJ2TMCdcANwlan08W1s/nI1g27AGc
	PC9OMa0GKe4Sc5zhE7yHjyG4AIk3bzWoLfY13L/Hx+sTMOaXJBzXI0N8Rly5aoATRyiqFLN54vL7c
	MUZ+YN/zw8tywreRfU9EKPk8AhELRdkApNdc0dYKeT7hxP2A9YzAZEZwLXw8XSBMv36L0WizvctIk
	zbgoki00+50pF0rhkpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Tdk-0000000FZ7d-4ATb;
	Thu, 17 Oct 2024 16:46:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TZY-0000000FXo6-3Psc
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 16:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8AA45C5038;
	Thu, 17 Oct 2024 16:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E96C4CECE;
	Thu, 17 Oct 2024 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729183320;
	bh=QqrRnUwymrsqzMxSXyNZsLuECVKOAXLr+MYFiH2M1Yg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VskhPH9C8+8Fezn+LmplL1DfXkP9BLZ/ZD3N4w/dUsQiEprnLoOGCxGOpmNfMWyKk
	 kjYCZSYWvtlhD7zm03OIwq/8GqyrcEVM5Z64X7bBdx6watf8/hKNp/dh1p6ASjc2AM
	 HiWovBrs99Gi8T8r0Ww2KFtIxrwCEXeEI/8AnLuMeaFcDlqUrfrb272WpXO5nywzF9
	 l1krSKNY64SFg6rTq/LbS7TQf/WF3vDR2wGJ5ws16MtzOqlm0ZjDmt+OML8kXS6F/6
	 DOSj72YczCYh8ZzQZXH6RPJgVEEqnuZup57T1zZHA1xcx0Zr0sGNpwh2uEQWdWR5y6
	 vrkbfagBbH0ew==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jamie Gibbons <jamie.gibbons@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: starfive: disable unused csi/camss nodes
Date: Thu, 17 Oct 2024 17:41:50 +0100
Message-ID: <20241017-bagpipe-mouse-340040a59684@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016-moonscape-tremor-8d41e6f741ff@spud>
References: <20241016-moonscape-tremor-8d41e6f741ff@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=697; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=YRrnZgb3occ2u8F1+5WNnbGzA5NEL9mMGByZT9UlAU4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmCdn67Nm1hWLZiqfJBtfWsu/6yPHs4P0n3wqnlR4KXf +tvuD11UUcpC4MYB4OsmCJL4u2+Fqn1f1x2OPe8hZnDygQyhIGLUwAmcuYkw/8qm3eLzFzcGY0n /HxurFnOJ7f21uGHi7deOHuo/0KkS8hxRoZG7iksD76eLff4ez/jcp3kiqnOVYH+Dmd397pUvpr 6u4ELAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_094200_932501_A911C3FF 
X-CRM114-Status: UNSURE (   9.09  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 16 Oct 2024 21:11:15 +0100, Conor Dooley wrote:
> Aurelien reported probe failures due to the csi node being enabled
> without having a camera attached to it. A camera was in the initial
> submissions, but was removed from the dts, as it had not actually been
> present on the board, but was from an addon board used by the
> developer of the relevant drivers. The non-camera pipeline nodes were
> not disabled when this happened and the probe failures are problematic
> for Debian. Disable them.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] riscv: dts: starfive: disable unused csi/camss nodes
      https://git.kernel.org/conor/c/2e11e78667db

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
