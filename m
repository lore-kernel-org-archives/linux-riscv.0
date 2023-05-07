Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7675DC77B75
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 22:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tjg8SO5t1o7axaIYjBWrV7w7+TXkGN0nLvBwkTu3++A=; b=nlWWiUKCC6UR32
	zJZtNOo1ACue2d1xwheIU5a6A3e3zuvlfJBuT0rzO4yVYsb2TqhMKQX/SbjcL1PlQxbJ4YgqmfQDl
	wzIottOouBAythla8Oh/BbsXMni+YGB8ZI2iwwf79li0xSSyP1f/Uj6AacHbFUS3xBbydNQemCiSG
	sYhn4FOKhGuGS2TrpaLhJkIsrTmvGBnOsZ1kF46pmSJzDA8feWZxmT6Kxa8lFVhbriQ1fa2u7hdft
	2tR3MGCEQdqTs0WoctEGkSlDovvWIyX+D7uPwcqlVcUToCAPvhUElEKbAguxC6OhcUPNjoYqwx/gS
	EU/E9F0zo4h2Din5Zh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvn36-00GmOU-2r;
	Sun, 07 May 2023 22:40:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvn34-00GmOI-32
	for linux-riscv@bombadil.infradead.org;
	Sun, 07 May 2023 22:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u8qrVUKkpnc7eDMIz44844ObC0UG2RYkpwviLP3BiwA=; b=BpP4Iwq/GIPL60aHjzWE447FxJ
	vq5K+bvctxr+K1/v9pi4EuvNq4oB2eH/jRAd3IeplXK3GHlvYxob5QymhSo0mq0ewzrq0peJEYTee
	u55f1OE8Ow/a70WQQvgcYlsVMn8zDAJL3saNO0J6gZCLwADZpuwkkIADriKzDKsiyOxuPt/pddZOj
	LxKiWQE8otEalryTnbHfBVxMXjiNt9+y7txQrynCa4nnMFRf9Mbg+MRkZD9LnVuH1yzSqhOQqq7qd
	350ysDS5M3dKB030STOQN6IWbqyUF/gErQtQNTOlYvCI0GMkfl7eqaDPgXacsFz3ZNxHA8pyr2SF9
	AnZks7VA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvmSY-004bsE-00
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 22:02:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A767611E6;
	Sun,  7 May 2023 22:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06239C433D2;
	Sun,  7 May 2023 22:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683496937;
	bh=lUr5DJx14jSLb7rYH9+kf1WwLxuk5uRuK/hO1R4NA/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=giyjCb0S7lueLzdCduoZ/1iETKisQEPgo9z6Z237xWXxauVkgOs1N2CK0IcnG2pq6
	 fIhI+77kYctKyuJsDbesY5tZ9HD+khjEfM8qFcW43OHX16IBqHkQl3/ffsTxIHX6jh
	 6zUy/n79kMYrlQ/nBJqPrEsbDq38Tz4HVZSkIm9+sAProh+5NQB5CYeL7Hc9kvGbNv
	 DUa8w6NN+jWkXfSwPoCpnL9p4KdLdj0OXQLIT6BvbwlUtBQtn9sN23FtwYvDZCksIB
	 XvlrWFPfd3Py5c68+rR3EGoeefwzB3F3mWwmgtpPulM72YN7G9W5ydeDPETQHYPahV
	 XqWEWHl5Qrxbw==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] MAINTAINERS: exclude maintained subdirs in RISC-V misc DT entry
Date: Sun,  7 May 2023 23:02:09 +0100
Message-Id: <20230507-fidelity-rising-e13fdafd7123@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504-donor-unsorted-6f0c4067f506@spud>
References: <20230504-donor-unsorted-6f0c4067f506@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=406; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=M0mP22InyaxaBOJrRxm7gNmGMrhz5g2/Tkx4bH5gXMQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkR8g/alC3n5KXUnVBbk6i99MhsX6sfPO+Wbs402dMwc /HEBOWTHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiI1WZGhr9L6uJij62vEbB+ mbnBZ8Xu9n2mnfohUdK2mVyflvF/WsvIcCRNXl0mPMJsOV+WC7+Y/ayDdeuPTztXvMeZr//xemM 3PgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_230226_302694_72D1D6B2 
X-CRM114-Status: UNSURE (   6.93  )
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

On Thu, 04 May 2023 23:06:06 +0100, Conor Dooley wrote:
> The Allwinner & Renesas stuff doesn't go through my tree, so it is a wee
> bit misleading to have them match against the "misc" entry in
> MAINTAINERS.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] MAINTAINERS: exclude maintained subdirs in RISC-V misc DT entry
      https://git.kernel.org/conor/c/b3bd64bc457c

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
