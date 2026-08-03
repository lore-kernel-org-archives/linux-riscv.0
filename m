Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C23FC55182
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 14:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43RQieCQ/gbbc0EEZRE9rNBVJsRqDBSq1h0EqL0NRWg=; b=YC69oLTlm6SvXg
	TO/iJIofpl1gU6tkpsbp80KJk6VcuOhXbOoKSQWokPa540eVW10K6AoVC34mMqZ6Z9axPBiMYI/FN
	FdY7Qoqm73fFoM4CogNB10pGlmLq5tX7Y/rid3AUIgOYxKiFX/n2/WBSeMxg7JRcO9T4PJQItGPCR
	AM9EbgDLkgbE0lW95hx3yNqiQmEoS70qls1zxLioAGBFcZB1u/B8KzinsS5M4hC6CPILwElPUJ5mL
	GTB5e9QiCAMhG41aeyiwUZfIsyxb/tYxHXcK/kw1L42biQWwgm9zMR2c6rweYVUoz+zTMtH3cc3QJ
	28TxfSRO0S3/cSj9Bhtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtPj-0000000HJJK-2H8D;
	Mon, 03 Aug 2026 14:13:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtPi-0000000HJIw-1fiR
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 14:13:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A354960A79;
	Mon,  3 Aug 2026 14:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3744E1F000E9;
	Mon,  3 Aug 2026 14:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785766388;
	bh=ZvuX3gYi0iFYh3K/3zoFONlt8miaxRz0FW6PbvfW+CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HNVNklkBqBtRhyKSY3TW0c2Sapiig58cPzEbfBnhyKxG4P10SiQaKB6BBl6NAoxNQ
	 4Z5dcmbqPljiloJsSoFCXTEqkqmt42ziFjCX92AlLpD/cwQCIjDLrwyCfB8/ci3mEY
	 dV3uDK1opzozzNEO978RkJ+pk2z+h5+U79HnrShlRxrZrxBC1HhQULxMSXrMHXXy7F
	 UuRuy5E73wa+7gU1n0ppdCIRb6kiCe5WSNLwnn4RBbuvRtXYP1/F0LgJ1GAz2cS/S5
	 77HLDo+sQTXpHug6B1+boWye8T5KubiEaQVPN2UkiW+efTOmTVG7s7WixwPNbA+1C4
	 OuL8NT6PEeiIg==
Date: Mon, 3 Aug 2026 09:13:07 -0500
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v4 01/21] dt-bindings: pincfg-node: Add property
 'input-debounce-ns'
Message-ID: <20260803141307.GA3243695-robh@kernel.org>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
 <20260801072711.153217-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260801072711.153217-2-changhuang.liang@starfivetech.com>
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

On Sat, Aug 01, 2026 at 12:26:51AM -0700, Changhuang Liang wrote:
> Add the property 'input-debounce-ns' to specify debounce time in
> nanoseconds as an alternative to the existing 'input-debounce' which
> uses microseconds. Make the new property unavailable when the existing
> property 'input-debounce' is selected to prevent conflicting definitions.

Why do we need this? Why is usec resolution not good enough?

That's what your commit msg should answer, not explain the diff which I 
can read myself.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
