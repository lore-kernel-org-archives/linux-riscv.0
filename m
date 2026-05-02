Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97268CD13DA
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 11:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQN7vniyMEfkRey5w3NMeH3ldE9W7M7SC6zxScfl/Nk=; b=BcmSS4G8elFokW
	P3h0iEpqlQ2czZ37UpsXeuYKefTG7n2+AMMCx3x5I2mug4W7eHcf5ODbRw7qkxeFj11POwckofOZp
	JOVjvv8zL0YZmfIg0uyVRQ7U+lBPhrxQ7doXvQ9vn8VavQZkJ84atwgSp99rMHo2VYTqY8NlRB5iw
	OoihpTOHZjOfTNWPlrlu+d3ebRtsALj5CeJvXERcJOuWPpX38DVU9uyWTEsOMgNDvmNkqQfmfOp5F
	3KU3p4XsOUsROOlEj/ZaqnFW+6XpVNlA0MN1Rdl4hXhAdpsgzo/oDzXnzIhdeIyznzFS92eKKkxwD
	SBECCBLgruy6wmwl2m1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ8YC-00000008uLF-0aCa;
	Sat, 02 May 2026 11:30:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ8YA-00000008uKP-14O5
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 11:30:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4589841A52;
	Sat,  2 May 2026 11:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2C6C19425;
	Sat,  2 May 2026 11:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777721419;
	bh=FuvlxJJgJU3HdpPk57g46YhaAC/85mYDwWNFIKy5F7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EUGR2lesn63umu/ojR8XZG+857Gvr10/s13Cl04FKJ5bcaWBh6W+ZolHqtQVFB5nu
	 SDZSAKPubza1VS04orBQ9G0k1U5WHAbDfDfuFl/ZkLClXKNGqU0F7eFlsqNtANk4Cs
	 i3mf+ng01MGa4zVxZVNCcAPiQ817moQwpo4rpI78bcqXm92+a7JMZhRVNfOCDlHc55
	 /ejQVtBUCTJuiQwkpQsZ9ujVDoFoIg/XeoXieGjJbeurn23ZVgROP/s5niNY6dlvkp
	 U8MtbrqUg1fW+DCHzdq/zM1SO6A8X1AbhhkKzhzWB7T+nJ6vOBjZpeIsMNTudK2yuG
	 eN1Ds6aEkL0BA==
Date: Sat, 2 May 2026 11:30:16 +0000
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: spacemit: k3: Add PCIe DBI clock
Message-ID: <20260502113016-GKA3266396@kernel.org>
References: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
 <20260430-06-pci-clk-fix-v1-2-32fdc77c02ab@kernel.org>
 <35a1764d-7328-45d2-8240-6f83eae1f1a9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35a1764d-7328-45d2-8240-6f83eae1f1a9@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_043022_313696_F320899E 
X-CRM114-Status: UNSURE (   9.14  )
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

Hi Krzysztof,

On 11:28 Fri 01 May     , Krzysztof Kozlowski wrote:
> On 30/04/2026 12:30, Yixun Lan wrote:
> > Add PCIe DBI (Data Bus Interface) clock which was missing.
> > 
> > Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
> 
> Describe what the bug is in your commit msg.
Since we've not yet activated the PCIe driver, so this shouldn't cause any
real bug, and as Conor already point out - this is kind of abusing Fixes tag,
so I will drop it in next version.

FYI, for problem I see while testing PCIe driver, 
- DBI clock is required in DTS, so it will trigger a check warning
- the DBI clock will be in undetermined state

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
