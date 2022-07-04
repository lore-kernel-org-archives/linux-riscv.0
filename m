Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22641C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 05:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SH99X+TtNbxwbl1vgWXec9+XlFZuA2lt58cnEssnOpA=; b=4k3nadXcX4MaHQ
	oiQTpPiLaVp+Usoh4GKDT3GTwJf7WZk5tka5jC0zxYceEOvCrsgwrEJqtfALFvBrEalI2GjI6RDUk
	UNbwYz+iFSJzrlUjtU4J8ky/sW1L/MSZOamxbSGVqrEfhxtCkBRkC634UnCA/fHXd8iLUUwdOcB9B
	H+wY1vFaOBdUl/1ZYoPCoblKjKQl3dIPLV0CS5tBIEG/Aq+/p0vCaV6n+zqTOE/f54fEL/wegu0Il
	4GIKdhsKG/uxyVKTxpLvEJGSCNHusfYiYWIpzqFoXzfmrhussHS56pZA9yi5ZetJ7kmX62XuqwMM6
	xFlZ8UB7+TQeeOP6Rdcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8F1k-005BxU-5K; Mon, 04 Jul 2022 05:53:44 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8F1h-005Bve-Ib; Mon, 04 Jul 2022 05:53:41 +0000
Date: Sun, 3 Jul 2022 22:53:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH] RISC-V/bpf: Enable bpf_probe_read{, str}()
Message-ID: <YsKAZUJRo5cjtZ3n@infradead.org>
References: <20220703130924.57240-1-dlan@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220703130924.57240-1-dlan@gentoo.org>
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

On Sun, Jul 03, 2022 at 09:09:24PM +0800, Yixun Lan wrote:
> Enable this option to fix a bcc error in RISC-V platform
> 
> And, the error shows as follows:

These should not be enabled on new platforms.  Use the proper helpers
to probe kernel vs user pointers instead.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
