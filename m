Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CDBC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:43:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA4E620645
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:43:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i+AgT7ya"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA4E620645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwlXpMtJ4g7Pafe1gJ6xyXaA5hjomP4J+1+prRLBnss=; b=i+AgT7yaO0Ndl6
	6H4DYZbd2bmD77T6ZZ1W06ZtzesK2e1itTDJzAoPAZIrstpLKaQpp3LKmuqgHBX7cwh9lxjfAVW6f
	IvkQ6jg7j9pcSK01ZFA+uNO3DcKUmZBkQMCmmReoXy5EUiPWs8/8MAUSWTiIw59JxFedfHf5ObaLj
	lNfJuxey8G5LBuyybntr70Icdppe6/o7L41NzV50Qi7G079zTHai9bYoqYJamLL2mUoHyuRCAiEla
	yr7P6a+z7Di3ReQhqLk/VbgUUznTUodUVi0nZVQmUvBE9ZdmMa8+BdNyhal2FY2NqOVD9KBc+lJ7J
	8dHXPYbpz4CA6jOnN+Mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjQsE-0007UE-Df; Tue, 15 Jan 2019 15:43:30 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjQsB-0007U3-8G; Tue, 15 Jan 2019 15:43:27 +0000
Date: Tue, 15 Jan 2019 07:43:27 -0800
From: Christoph Hellwig <hch@infradead.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Subject: Re: [RFC PATCH 2/3] riscv: add build infra for JIT compiler
Message-ID: <20190115154327.GH26443@infradead.org>
References: <20190115083518.10149-1-bjorn.topel@gmail.com>
 <20190115083518.10149-3-bjorn.topel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190115083518.10149-3-bjorn.topel@gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@sifive.com,
 daniel@iogearbox.net, davidlee@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

>  core-y += arch/riscv/kernel/ arch/riscv/mm/
>  
> +ifeq ($(CONFIG_ARCH_RV64I),y)
> +core-y += arch/riscv/net/
> +endif

I think this should be core-$(CONFIG_ARCH_RV64I) to get the same result.
Or even better just core-y given that the Kconfig dependencies should
ensure you can't ever enable CONFIG_BPF_JIT for 32-bit builds.

> new file mode 100644
> index 000000000000..b0b6ac13edf5
> --- /dev/null
> +++ b/arch/riscv/net/Makefile
> @@ -0,0 +1,5 @@
> +#
> +# RISCV networking code
> +#

I don't think this comment adds any value.  In fact it is highly
confusing given that we use bpf for a lot more than networking these
days.

> diff --git a/arch/riscv/net/bpf_jit_comp.c b/arch/riscv/net/bpf_jit_comp.c
> new file mode 100644
> index 000000000000..7e359d3249ee
> --- /dev/null
> +++ b/arch/riscv/net/bpf_jit_comp.c
> @@ -0,0 +1,4 @@
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +{
> +	return prog;
> +}

Please don't just add stubs files.  This patch should probably be merged
into the one adding the actual implementation.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
