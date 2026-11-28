Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9E7606A323
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 03:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lbfLwECe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PVW7ywo1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PoD/eRTu49Y1IpXEns7z7WJRUy36r+zooR6zF8JPZMM=; b=lbfLwECemF0O94QMx60wLEGcWL
	XdmZ6e6kz3LxFd9BQD2LoURo9Mr6xy8/nrshy6drnpL+F3nesXc+IF1Xv/bVnPcbUvvgesWLXFy9i
	2DKKVhFQtlMsYugDk9sh+7k0v28n3lSanIk7r4C6RkkmiwcyAhb41f+C0LsuhIUX5ApAkPMCJ6lYl
	lF7mJ/sdz5SqQ6o02ZopZcLHZHoVqUkRv5lSeXn10RMY2nSk8KT9lsFqXKHMXEuv/+9GyGmO4yzjH
	P2ASp/NSR3CmBAmY9Fr+nOPmNCX8ojLCLeQWTX9Buii12vq4AIKQ2mf45IFZWpdgrfLu0fM9tfHB2
	ZIlNHdBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX95x-00000000L7h-0oln;
	Sat, 28 Nov 2026 03:27:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX95w-00000000L7b-0Xy2
	for linux-riscv@lists.infradead.org;
	Sat, 28 Nov 2026 03:27:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9223E401CB;
	Sat, 28 Nov 2026 03:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365611F00897;
	Sat, 28 Nov 2026 03:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795836442;
	bh=nR1K8tu58+gvV+YrFMkIazxdzdFlb7lyRHlnMbvGTr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PVW7ywo1pvif7WLAcfA7+VoCJZ6s6PF4EpzHaIHrFkZGFLwHKSAnt6gT6ftypL/yU
	 yVwTy4MXGv58lyKret/8z2NBk2jkREB2+8sQA9fk6dF8zETPDBAejkfuUA6jovuBPK
	 1m2dNriEgk7S5EWKaQlijcTJKFT3yeoq7rHevP+bN2uAWinPTLiHMULUH7sGbr9TRw
	 Isp9nHykFvg5U09kulEBwE1DvmoHqYK8xwZevzF2geme8CygFWCw/HkglvEB+eKafT
	 A2WM3TYSCK6J2Vubn5WdUMeDciG5644n4Ic0UUnZdfX4OW1/h7mGM4mKDQ43sosh8v
	 kUZ2GeocSr9RQ==
Date: Fri, 27 Nov 2026 19:27:20 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: matches th1520 in filenames for RISC-V
 THEAD SoC
Message-ID: <awpKGGPVJawHTK5E@thelio>
References: <20261126-th1520-maintainers-n-clause-v1-1-c1315e68e5be@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261126-th1520-maintainers-n-clause-v1-1-c1315e68e5be@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 05:53:32PM +0800, Icenowy Zheng wrote:
> As more and more device binding / drivers are coming for TH1520,
> indivudal filenames now bloats this MAINTAINERS entry.
> 
> Use N: to match th1520 in filenames instead of listing them.

Good idea, nothing drops out, and thead,th1520-dw-hdmi.yaml is now
covered, too.

[..]
> -F:	drivers/clk/thead/clk-th1520-ap.c

for clk I think it would be better to list the directory like the entry already does for pmdomain:

   F:	drivers/clk/thead/

I can do those fixups when applying if you agree.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
