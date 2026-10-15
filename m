Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086C3CC6B33
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 13:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:References:
	In-Reply-To:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZStydQry8ycQnB2DBsEVdtC9rWm0NpG4u6OpCBb9tpo=; b=yb6EuSi3J5Q6/g
	Jmc+0W+ZYGXvk4SBiTGDbpnPjdP9jEusPqKAtv9lMYrw5GW3kcihxPcXH1jXNOsrtPTPmTf783oOn
	A3BCACpYvUVmhae7KAUd1sWMGIgjDMcwf+r6Bv53+6ulmO8x97+X2nOfWWXUYn+wEjQBQzKqtHMCz
	OSI6TR4tKyPCmxYupgnqYXMbsE3enxH9eAce7BLBQvlSlOBpKBzS+8Wv9gl5IOZgVbHWzeYKvhyNe
	jhgvrp5HuaHGK8pIXIZGW6waicYCgWQk5O5BPHyWqyinqp8dXkq4kLmvLbGlfbYymU7ShrlXKJcp+
	nkRMAxvTeCTxr2SUQZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLEF-00000000DkE-3tyv;
	Thu, 15 Oct 2026 13:10:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLED-00000000Dk4-2PTU
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 13:10:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B4D22601EF;
	Thu, 15 Oct 2026 13:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F52E1F000C4;
	Thu, 15 Oct 2026 13:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792069836;
	bh=SQFo5wC07ThRu0a3yHnNYmLfM6ZYz/KtYif9hkram5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dSgNKyB6EpoRDOEK8z036qCP/tiQSqx+4QRnnSXT0QiGb9X6/m1ph2n8bdnx6M0ry
	 KYywAriuDYE785XEva20qbcUQvTxELqpYVBpsZ8eMn4Nx/PUfxhnPDdDzQaCZym1Ro
	 JOBi+Waom34zkhppl1bGlBwYXhzw7l+pPzyIks2OF99o+BvkQf0pHhqPJlKfQR178H
	 Zkx7KPSGtLBq374Ln/fSDm0S6J2BfX6idfuZXCV9XdDE7c7r1YvH+nbtP5jM8+1roU
	 n8lB7xdVCdPRxmjAvcw46tKyeuu90naP+x6t3xQ65Q5YvYGis1zwWuI+U+hFes0+8d
	 su+sZXpQM4i/g==
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Nam Cao <namcao@linutronix.de>, Naveen N Rao <naveen@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] riscv: kprobes: reject probes inside LR/SC sequences
Date: Thu, 15 Oct 2026 22:10:32 +0900
X-Mailer: UndineD 0.1
In-Reply-To: <20261014094415.374-1-yuanxiaofeng@eswincomputing.com>
References: 20260828091202.1124-1-yuanxiaofeng@eswincomputing.com
 <20261014094415.374-1-yuanxiaofeng@eswincomputing.com>
MIME-Version: 1.0
Message-Id: <20261015131034.7F52E1F000C4@smtp.kernel.org>
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

On Wed, 14 Oct 2026 17:44:13 +0800, Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com> wrote:
> A breakpoint trap taken in the middle of an LR/SC sequence clears the
> load reservation, so an SC following the probed instruction always fails
> and the enclosing retry loop re-enters the breakpoint, livelocking the
> CPU.  This series makes the RISC-V kprobes implementation reject probes
> placed on an LR/SC instruction or between them, following arm64's
> approach for its equivalent exclusive load/store instructions.
>

Please do NOT reply new version against the previous thread.
It is not easy to find a new version in the message list.

Thanks,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
