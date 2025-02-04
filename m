Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8B3C02197
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 17:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWGWKpCOLdxaaQ6ndqVvGYUF6rfNcpUdQoR7/qmH/r8=; b=pzy0IadbetfKgP
	rs+XircJ+PQBnsbZuuhxYZ3MfkJ2mMohuPz8STXuYYC14UBUkGaIJERxPJtwK0blFIY9CjUrunYWl
	BQV6LMjyfjSrX3FvLlLKpEODf8cEaOUdVMakWbLjhZai6ej/KJbTqNiwbhV+CwOzf9L08Pgd8f4Lf
	rzNhjy5gfFAiiD0HXUPojiXRpXxC5MFh81N5D/PMaQpfZFYrnVjVexBIC+KiSyCbZ5zq/Cf2wbB2C
	dZNdprK7yx1AcGqGMEK+Q2teE5Nwj8sUXOZ+GjrzTfLE4EFqYZlAF21Q5JK8DTse1pNN9F0FB0T1Q
	7gakVsWe6IE73IF3NXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMOS-000000012rx-0ceB;
	Tue, 04 Feb 2025 17:07:24 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMOP-000000012qR-0Kc3
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 17:07:22 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 078C1404FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738688835; bh=QOAA7tsjw5Gi+WdBavWeRcNGWzbHxYGEg9V95OUlx64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cRJeK8NDdrlDpvFUBvLrUzsgMnj/j5M5EE27LvZJMcJQ2rfsAPgegL5P/8iK810+b
	 JM03wUrITvezOFt4H2UrZx4cS0XdxIL+nrNPRR9h5gxZnEFdinJ4BY24Cdfg2RavVA
	 kIKqJnZfBHByL8cxI057goXGNLZf8zIBO8trxybF2acD+c0clGl1EBKEOSEfy6m920
	 lc6HXWinD9MInWj6T/djtYpGF/w+w6zk+LUyrTvMQFi0nBMmfGw1NfDWOaBHnGmAsq
	 0FC071z00l3Xmx3NuxWIEPCgVC49svtaD7OaqfI7Xax6lihuIwTnMGdj9xC78sRKXD
	 oEPep5qVCTLrA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 078C1404FA;
	Tue,  4 Feb 2025 17:07:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: cp0613@linux.alibaba.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Chen Pei <cp0613@linux.alibaba.com>
Subject: Re: [PATCH] Documentation: riscv: Remove KPROBES_ON_FTRACE
In-Reply-To: <20250108020342.4172-1-cp0613@linux.alibaba.com>
References: <20250108020342.4172-1-cp0613@linux.alibaba.com>
Date: Tue, 04 Feb 2025 10:07:14 -0700
Message-ID: <87h659fxkt.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_090721_115702_05258CC3 
X-CRM114-Status: GOOD (  13.45  )
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

cp0613@linux.alibaba.com writes:

> From: Chen Pei <cp0613@linux.alibaba.com>
>
> Since commit 7caa9765465f60 ("ftrace: riscv: move from REGS to ARGS"),
> kprobe on ftrace is not supported by riscv.
>
> And commit 3308172276db5d ("trace: riscv: Remove deprecated kprobe on
> ftrace support") removed the relevant code, but left out the
> documentation, so fix that.
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  Documentation/features/debug/kprobes-on-ftrace/arch-support.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> index 02febc883..d937b7a03 100644
> --- a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> +++ b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> @@ -20,7 +20,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: |  ok  |
> +    |       riscv: | TODO |
>      |        s390: |  ok  |
>      |          sh: | TODO |

Applied, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
