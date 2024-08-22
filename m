Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED43C5321D
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 19:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBHQFhe5DaqEl8D7RjNa+oO7GGo1/ew58Bta/54dfTw=; b=kosWTd989rIecw
	ncEKKsA87ipavMqhAQm4oTdl26tYyNgC/lusXv7Sofk1p6W3b0+Hwxwjykjv9WoEoc0q+6l4WTQsI
	51fesqolE+aqnf08pFsX3Z15txn4CDK2DvTZBDA3c4qJlq81VxHv205SxbSkhMjWpnacvyyOgTC3w
	8An2eABXw5iQJ90AwKeyyXajl4UwykXOSV2F4O78usOaJBhsqj/FtR4Z/xaKs8/x5m8ZvyMzmd2AC
	DB4G/kepOTXdt/HuuinHF1E/n4/eAMPkLbMzYLLlxDay3XfHOQviuqf8treL9688wLqeKBi0X7XqP
	uu71yNWCywsh8oTP4KFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shDmy-0000000E8pO-3AjY;
	Thu, 22 Aug 2024 19:48:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shDmw-0000000E8or-04lT
	for linux-riscv@lists.infradead.org;
	Thu, 22 Aug 2024 19:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3EA8561199;
	Thu, 22 Aug 2024 19:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A610BC32782;
	Thu, 22 Aug 2024 19:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724356084;
	bh=B/7n1iDkDM9S1I/I5MGVGNZ/BzLhUiUzeHvKd5ek8bk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BdMB55xV605LWffCmP6sntGwpQ3yiV1M8J9tkpP5gP9/avEaEUoy3qwK1xNoK6x77
	 QqVYQSdLJ747gdv4CxylBDumSlUUBPgNW7NhfZ5Vaw3RqyzmiTplU06LBKh6WhAMoW
	 Qih+mz/fyuFRJYdvZhdulyzeme28N0LTUwcEVkn1apDzBTUzpp99wnwVkyWv9Dsltm
	 XxzfqBWksvF2FJ3jGPmiJjHupRpDwohKu3ken42bs8nXQAwwn4uTW3i5TSrw3/ivpc
	 u/c9dlNvPzmbSUvWryPIB9XYNaAHW0vZosEBz5eAGQL3jrXUJqhNkQ+Sz3nl8ICLWZ
	 oXi+MqC+MAA7g==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Steve Wilkins <steve.wilkins@raymarine.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] firmware: microchip: fix incorrect error report of programming:timeout on success
Date: Thu, 22 Aug 2024 20:47:48 +0100
Message-ID: <20240822-undercoat-boozy-5f40ee13dc24@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809-acclimate-droplet-9a782ab70193@spud>
References: <20240809-acclimate-droplet-9a782ab70193@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=538; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=u657phBycd0WhGA0VPLz0UrqZOe2t9Nm2H4SbvRtGbE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnHpz4R3XexVGVCSLxfcpLvr2cNL+S4+SONC5dvicrZn XZt7/rJHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiILxPD/3LWPceZrzlZ71K9 /tOML4ZvX8Ks5RylyhdNZ25iVClr6WBkOOMounKPaj33ehXNVxsj1M7ce9CWdVxJ8Z5H4Ru2U75 BrAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_124806_127212_E8F22900 
X-CRM114-Status: UNSURE (   7.21  )
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

On Fri, 09 Aug 2024 14:47:44 +0100, Conor Dooley wrote:
> After successfully programming the SPI flash with an MFPS auto update
> image, the error sysfs attribute reports programming:timeout.
> This is caused by an incorrect check on the return value from
> wait_for_completion_timeout() in mpfs_auto_update_poll_complete().
> 
> 

Applied to riscv-soc-fixes, thanks!

[1/1] firmware: microchip: fix incorrect error report of programming:timeout on success
      https://git.kernel.org/conor/c/591940e22e28

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
