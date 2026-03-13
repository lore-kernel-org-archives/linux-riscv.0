Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFE5105F7AC
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8JD8q59t/t1oawa4ndFVPVfXV5FGx8TJCO1Hqcmr8Q=; b=s1df3VbOnJlutI
	7eWd4DK513S0agdExzfI0tx0tcDQkQUn5afZHbKGzn3gXiGtTmkorlHHj/FlBhzSJzBX8m1nSeAbB
	h1jY3YiqWODmHXbPz5Sd1fvt8TBQOcPUqGl42OjYhdytlP/YdYwdPtOYw00B0OnX4+8CaOGPPis6K
	xfbJ+ektbqU8oluQxkO02wXX8g8RzGq9A3KaCwB0h5xbIk2/VSRlTe8NMzNaNCthA/OBs2zpkC5rA
	PAseSL13CVy/NRxnoNs70Y5g3n/ES8Tz9z9KkKoYT1qLfX+CanJ1aniHJgS6HuyCVeOXDIRg2O1EY
	66jWliWMg28xFhGdNE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12mk-00000000JCT-2UQW;
	Fri, 13 Mar 2026 13:42:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12mj-00000000JCM-1qCK
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:42:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2A966012B;
	Fri, 13 Mar 2026 13:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED71FC19421;
	Fri, 13 Mar 2026 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409356;
	bh=N404hNd2TZwFuhFt4ZSZsbQMNcJjqVfNAm4y3u8q4ZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9ZwP6i6m4lvgrH6TkmdU9FHOc/5nxCrIIjqs0xUVbDpcxqZmvGGnZnS7FFYhcJSD
	 TyXZS1qkxnnXhCL1lf5bx5lfvbu8/185OzyaAMkvdeasxA3+st8DB11XrSbinVtYt0
	 ItYmWKJde/J0GuqaSOQ4W0FjaqPF/V8ZxTPD9fBGB5pkteypSTjFJK7xNImDNaO4BJ
	 1x7ct0ZqJNNe4DSc/uWm4IG7aJLQQiNobpiWcBoE08N2LDrVCTMF9BQgbVE6Hnk6z2
	 eiJnPeaoELBP3as4y6pLdN6iYeUJkfaYUC3kvgvEALF9V9MVCfOmf8S62ny6QpCQuX
	 fScm25gHof3lw==
Date: Fri, 13 Mar 2026 14:42:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Junzhong Pan <junzhong.pan@spacemit.com>, Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: spacemit: k3: Decouple composite
 reset lines
Message-ID: <20260313-certain-idealistic-urchin-001e96@quoll>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
 <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
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

On Thu, Mar 12, 2026 at 10:34:19AM +0000, Yixun Lan wrote:
> Instead of grouping several different reset lines into one composite
> reset, decouple them to individual ones which make it more aligned
> with underlying hardware.
> 
> The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.

Either this is ABI break, which would need explanation, or it is not,
which also needs explanation and then fixing current bindings before
they are released.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
