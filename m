Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04420F4181C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1aNBuUISFVzkJ1Ap7A+St1h1csplO8JWs3ytZ2g1aU=; b=KOrKIOYOQBLy9j
	3gU6yosOAJFyPW9BTs78CtBPg804v2P37Uhz7QGWEO0991B4h9OlfAs8fWvMNIqvtyOSiPTTeZuee
	jx9id+6dHuRPsqHnRpd8AYXWY+WwWKSRbQPlt17l/e2jBbh0Mmmg4SFeUeymbJyqYkqomlOgrK99L
	gA4Jau4yvhuEGDwLMtiXr5kyDc63VCtd1Kra6icJQFaOYT5G+CyTQCfUUSgqG5A+j/tmWbZ4BwVw+
	NPb4NGu7CAoO8LJD9Zzzcr3nL0cYezzu25bWlqw0KCPQK8UibrLwjlLRHRVsqsSapg8DeZ1sUWnQQ
	ImNS3Wc6WYzcV0b2u9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vze2o-00000007mye-3Faa;
	Mon, 09 Mar 2026 17:05:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vze2l-00000007mxd-301J
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 17:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F3E640BB8;
	Mon,  9 Mar 2026 17:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D212C4CEF7;
	Mon,  9 Mar 2026 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773075921;
	bh=7mFmtwKAjHDNBjNMVvTL8eQDcm95bdWppDiHo7JVF7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FMHQUAOlIOAgKcCLbR7qra8Btp+cpIbCBuvNprCVJlM5TQU7w5+pU6s7ClMSjNxTj
	 UCRP6QAGV9EQAPA1yTwywfLJKauXd6b6lDt6RegeMbLUtiWhl6XSqEiX5847BsMfao
	 awbn1pHYTMJXP80ChIhgjDnO0YDntwu1vKHFRaqyx252oN2PSxCQKh7gCb0TBefwQf
	 pXMD5jf5CGuu48t/iB5w9Quq0Fekrbnc/irBiMHKsLPXW4h9i345LCFig5ThicdQp5
	 4BAbSPzRCuxb7rKk/XlnYubVq8jQ3x7i7DjB5V3aWHsY5xnQYLatvoLCIj4OaUCjH+
	 +tpGjLwz+/QwQ==
From: Conor Dooley <conor@kernel.org>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Felix Gu <ustc.gu@gmail.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: microchip: mpfs: Fix resource leak on driver unbind
Date: Mon,  9 Mar 2026 17:05:12 +0000
Message-ID: <20260309-envoy-immorally-f8eaa8e3a52a@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260309-mpfs-v1-0-0dd89f34f962@gmail.com>
References: <20260309-mpfs-v1-0-0dd89f34f962@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=376; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=D95J7xZl8XDm6aGzadwknRB6ejZ3iUfEVbOWOaOb2lc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnr/p4QSt/9SUiKe/+fwJ1XpL6di3CNf1Uww3e9QMtt5 blZvb97OkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRY/IMfwVFMlzn7X8QllIo xP32gfa0mqsTWzu/tLxyyvViPVnH8pfhv5vCoUnnJde2WZyU4Yjadkv74JOXktadWifurrVhLpX +xQcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_100523_779901_2F25961B 
X-CRM114-Status: UNSURE (   4.34  )
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

On Mon, 09 Mar 2026 20:16:13 +0800, Felix Gu wrote:
> 


Applied to riscv-soc-fixes, thanks!

[1/2] soc: microchip: mpfs-control-scb: Fix resource leak on driver unbind
      https://git.kernel.org/conor/c/3d8388c2009b
[2/2] soc: microchip: mpfs-mss-top-sysreg: Fix resource leak on driver unbind
      https://git.kernel.org/conor/c/f632c4e84c8e

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
