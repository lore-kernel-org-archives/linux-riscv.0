Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A576CC38A02
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 13:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=if/M5HuqUwlB40VzePk13xlOqMfwyrQl6m0hK68nRB4=; b=0Eifxfdta3sHbl
	oh9kPivCeOJSVNsxgywCUZhKib9PyJtwG1wfoYtSkdSA1NNzlt6utCCdixY6tUJQKRuOMDlpIA3ti
	XLOPN3C7YqESc7Bw6M+oldjj1vopybmSXMfzCddytFL2Efq88+xh5KXfolFRfHjPYNn+o6MOvR4n3
	bXSLxTA78rZDamHLGcBNcFMxddHBO3N8l7VzVDce4Cv/By8uuii0ASj2RN8uZfQSdU25wGdrL0x8c
	JOpZZvjgxNzUee1uKgsTjRDiAuYEhewpO3i7LNNFsIp4ZWlx4fQD/rYlMCqpG2WI0MDhznKoSRd9j
	wZWyZbPjwj9i5TVSLm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op8Dr-00GLv3-TE; Sun, 30 Oct 2022 13:19:31 +0000
Received: from gentwo.de ([2a02:c206:2048:5042::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op8Dp-00GLqm-5i
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 13:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.de; s=default;
	t=1667135962; bh=7ZB8QhocN2s3hPoZ/1bKqbKsfF0/49Hms0o4+0l6fFc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FJRwjXgF1aJxSRirzjcSCeGAYHYxhTCdgxhQP+kVRDy0d7hWm3nSp63mBkgXq96+8
	 iGq1Wjed2murfyBGX0nw14/IK1PoRaTBaivR3dQ4M/rlEkIs1JOSbOLDbTrlO10bFa
	 GrMLlrvXU4X2Y0jDFMbkukp0zNbls+4uu8U767nktHE7nLDq0LDf+5EQ+0vb7tmRVN
	 a7tAga2rL2KS1v0GR+6LF/aFYfMNW9R5RIOZTr7F+w73/Cm2iBmyICjrWIkBfJoyZ7
	 aKyhmzQ2UE5XzWw8qkh+mNBogZel2JsmjEn/ZfXaAEzRzUtSbR0nNwCo012/cBC8uL
	 jdX1mwR1vE58g==
Received: by gentwo.de (Postfix, from userid 1001)
	id C310CB001C0; Sun, 30 Oct 2022 14:19:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.de (Postfix) with ESMTP id BF90AB000A7;
	Sun, 30 Oct 2022 14:19:22 +0100 (CET)
Date: Sun, 30 Oct 2022 14:19:22 +0100 (CET)
From: Christoph Lameter <cl@gentwo.de>
To: Wen Yao <haiwenyao@uniontech.com>
cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    dennis@kernel.org, tj@kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/2] riscv: percpu:Add riscv percpu operations
In-Reply-To: <20221026104015.565468-2-haiwenyao@uniontech.com>
Message-ID: <f1b82a9-a88b-50f5-8b49-69e52d7bdaa9@gentwo.de>
References: <20221026104015.565468-1-haiwenyao@uniontech.com> <20221026104015.565468-2-haiwenyao@uniontech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_061929_398709_08F5B698 
X-CRM114-Status: UNSURE (   6.73  )
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

On Wed, 26 Oct 2022, Wen Yao wrote:

> This patch use riscv AMO(Atomic Memory Operation) instructions to
> optimise some this_cpu_and this_cpu_or this_cpu_add operations.
> It reuse cmpxchg_local() to impletment this_cpu_cmpxchg macros.
> It reuse xchg_relaxed() to impletment this_cpu_xchg macros.

Are you sure that these changes gives you any benefit vs disabling preempt
or irq offs? I dont know too much about atomics on riscv but it looks like
you are using full atomics. The performance penalty for the use of those
is usually drastic. Often irq/preempt off is better.

Could you run some of the synthetic tests to establish the benefit? F.e.
run the synthetic tests for the slub allcator with and without these
patches.


> +			__asm__ __volatile__(                                  \
> +				"amo" #asm_op ".w"                             \

amo = atomic operation?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
