Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5A6C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 08:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuF6dapvMlyVGmqYadc/PO8Wn+kB4m7xFfDdYBQgcAU=; b=RcAeCN/o+DftPQ
	I/v1H+Q+pundOLFXZy3Ro1u0U/f9131MfMoFr0lF6huTv+bXpsPuir0SF97eHbYOyeJiVa4ps8M9b
	7kDzL7Fa8TT6saJTYcgStlSBxh1pfrOfj+h7KFzOpJ1/0tt5CJW1u6upeA/zFLX88luy7Yva9XFHI
	wj7blZg9fR8uVqedYrfe2pLKvTCsxWgvsVP9ZTnrKCL7H03b5LevzuP5N49Rr618bGOPCea8kDE5N
	dIoibr5ivf4xAx2wQR4SJu6Ppk7WsZhB2QkNgrAm2PNRtlR5RL8amQo6KCSRSbtGWQbs0pHBrWRWx
	u4L+3Gpm2FZsecXZ/huw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcsW-000G66-CF; Tue, 03 Jan 2023 08:42:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcdf-000AaC-7c
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 08:27:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B5C9BB80E57;
	Tue,  3 Jan 2023 08:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2705BC433D2;
	Tue,  3 Jan 2023 08:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672734432;
	bh=/7Ir17x6sUBFne3FTmiO4fvH6wQq9v5ncXOlJYzqp9E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sw0t0e+EuOz/wt6XBY5yMn2qzHsAeQsHZt8siJHdPdhAhemMd83atmAH402D7z2Qv
	 /jdqA0tliYvhQK8eDsdpuf5iZQjYftZmwDEE0wVyomdaqOEgd9XZLAiLXcBYPc1Pup
	 G1dZ3B08kC3STtdrPiA/qk5ATISJKIlTvxYLoC1SkAJK1UCytFzHyrpu0IePWmANVc
	 ks/mz1C+caJednsN+c7wsGIMSQhOnTwkbwGCDa5Mpru+LC9Kxxw1eqEdnTZ2RUYC4E
	 W8vhl2wKBRNZNCecXrpJ7L1kxHMOJ+aoIGQYv1EMXcb2r6RtNB7qbkEp17hCaZpMly
	 YNP6rvjXsRlIA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: Re: [PATCH v5 3/9] riscv/kprobe: Prepare the skeleton to prepare
 optimized kprobe
In-Reply-To: <20221224114315.850130-4-chenguokai17@mails.ucas.ac.cn>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-4-chenguokai17@mails.ucas.ac.cn>
Date: Tue, 03 Jan 2023 09:27:09 +0100
Message-ID: <87358sxbtu.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_002715_453275_D2FFF97C 
X-CRM114-Status: UNSURE (   8.18  )
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

Chen Guokai <chenguokai17@mails.ucas.ac.cn> writes:

> From: Liao Chang <liaochang1@huawei.com>

> diff --git a/arch/riscv/kernel/probes/opt.c b/arch/riscv/kernel/probes/opt.c
> index 56c8a227c857..a4271e6033ba 100644
> --- a/arch/riscv/kernel/probes/opt.c
> +++ b/arch/riscv/kernel/probes/opt.c
> @@ -10,6 +10,54 @@
>  
>  #include <linux/kprobes.h>
>  #include <asm/kprobes.h>
> +#include <asm/patch.h>
> +
> +static inline int in_auipc_jalr_range(long val)

Leave "inline" out; Let the compiler decide.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
