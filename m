Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EFACD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BIQcJ9AZwceVqfZZoY7SX34yptB01e5FswQYrRsHizk=; b=msXjWE0FFj02C2
	KbEknkLmmAx+VupN5xAkq/k8utD84nimGYjlCzsIUWQbINzsmjXes+08eJp4KCSOKXDJf03cHA1/r
	V4+ZT9/eN+jmhY/pkE5WZL0fNfg1DCE+2+s28PPAuvlkP8GjIDQkoC1fb00GXMz+PorrDKoWdD3nb
	PRs6Hq1k7pD4jTdJ04Pin2X/3ZhvcwgXU/XB+WT9t0jTXoaFtwW1pklX3Kw0yoEwxnFBbUcR7WZ4B
	WrbDlARIIrSkvOvtjP7BkAvSweGSvOu6isASio/HQ574M+xKHI+IX83qKCvno59Kadu3fbQxnmAnT
	Y93rT/8mJXEeuv3q8uOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGtI-00000000wwz-1KHl;
	Tue, 19 May 2026 09:37:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGtF-00000000wvS-1ukW
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 09:37:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4223D44422;
	Tue, 19 May 2026 09:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A8EC2BCB3;
	Tue, 19 May 2026 09:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779183448;
	bh=qDdvmjaunk6TN/1qHnT3BTLbjQvZfSxUEzn57UVh0Uo=;
	h=From:To:Cc:Subject:Date:From;
	b=s5aXzQVyGutaB0BSXqGu5ZFm6wQxk7otbeKvXS3DBer4mkP+A8WQ7CQQCF8M39eOB
	 q8xHWMbt6OkPm34RZtvxyFeDbDpmQaZh+wkOd4ijDodKMfC2Sm7XOZPDM5x6fYxpAC
	 txd206E2PSb6UMkKMyusUxFxLVnazryLriOC5SemmIBNBLWLiiV6YkUAMciw4Rpicg
	 QnwBRDUNV9EeO3ijLKa8peNdZVjBpZqI7cTjASOFD/fbDhbQ1jyHF6yKBFfSNOcO4c
	 QlcPDR0St7kP3kLuMurLHmJCbfxxXovJW7QKyRKoCwCbq/W7jAE4CwNa1+1mNPVmRc
	 XeiDYjlk8jDaQ==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v2 0/4] generic pinmux dt_node_to_map implementation/spacemit driver converted to use it
Date: Tue, 19 May 2026 10:37:21 +0100
Message-ID: <20260519-germinate-ageless-631033d22797@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VEO/EDA8mz9uAsDtHOb/ghhDWuVIsYgsMIHjfhrwfRQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFk8+kEeU15YZOz4/WGtsoukUPPPOMW/D91kWPpfcvQdy ROI7RDvKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwETmdDIyPJV6MUXw86Pwu/1p qVeS1oWp+87PWOjz4FQ265L796fIdDMyzPfbvvfftgmfz866x/ynbpPmU1/RnGibYo17GSYVF3I /8wEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_023729_512508_1A36A255 
X-CRM114-Status: UNSURE (   8.15  )
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

Hey folks,

Here's a real version of my generic pinmux dt_node_to_map
implementation. I tested this on my bpif3 but the dts in mainline is
very limited in terms of pinctrl use so I would really appreciate any
testing that could be done with a more complete setup.

If you try to apply this, it's on top of Frank's mux series. It's also
here if any of the spacemit-ters want to look at what I did to their
driver:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=spacemit-pinctrl

Cheers,
Conor.

CC: Linus Walleij <linusw@kernel.org>
CC: Yixun Lan <dlan@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Troy Mitchell <troy.mitchell@linux.spacemit.com>
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev

Conor Dooley (4):
  pinctrl: generic: change signature of pinctrl_generic_to_map() to pass
    void data
  pinctrl: add new generic groups/function creation function for pinmux
  pinctrl: spacemit: delete spacemit_pctrl_check_power()
  pinctrl: spacemit: move over to generic pinmux dt_node_to_map
    implementation

 drivers/pinctrl/pinconf.h             |  20 ++-
 drivers/pinctrl/pinctrl-generic.c     | 124 ++++++++++++++----
 drivers/pinctrl/spacemit/Kconfig      |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c | 177 ++------------------------
 4 files changed, 128 insertions(+), 197 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
