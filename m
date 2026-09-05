Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6095CC624DB
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 08:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJ3qHwb65uEu2AV47YdKEpWsn4SjvDGp0bQK3RUpJmc=; b=Nm/XewbhmF6Pkr6yc3Hw/ug7Ld
	kbaxYYDaCEQY3R4hixsQkYnolXkv3GHoMaL1F/qQlQIcb8X/mjErBeAf7sAZDMKCxy7GeQZCdyRAz
	Puij+GAaiDDvXMGug8iYQbi5Jf2hMMqI+4MdJCwTvLLZi0J0ZEs0daPDIJWimWhVb4NeEty2wZyTz
	Cp0WChojJgxNcxm4wtEWUBH2HvYGLSWeJD5TGZ/nIzIQBmPwUtu+MczvdPoVkAqlay8BU0XrYnQdW
	ovJb8XTg5EGwrUhPMrahqBBawp6RnwM2UHmCUclC5MJ5S14ZM9JDnGyxyUMeG2k28AJG/3iF2Qkqn
	0GXK6HuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lJw-00000003ozz-2VeV;
	Sat, 05 Sep 2026 08:00:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lJu-00000003ozd-3U6O
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 08:00:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F68760209;
	Sat,  5 Sep 2026 08:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74461F00A3D;
	Sat,  5 Sep 2026 08:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788595212;
	bh=gP9G6nGDbEt6seiJf/e5HFhvzZwqPiQgpFOg/RjaH6s=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=UrWmeRH0V7G3RqAtg8JnHdCkMuNInzwII1uDMmThveoy65V7BLl3fGSOZfrHiLMzS
	 TloF4wVWA8r+eTv6cQxbGdHOZnc0ssYgKzFuOJAx1bOOciRUazqP+T/YDPenM+HNOV
	 +7R8h+DoxFNszyoQGGeCbUYbbTOUfH+7POKrNsjQ6+adcaYhatlw+pfhjyeL4syJaD
	 TBYwqMZdt/jhqFP036Vw2sdBv3Efcqhf4MUXi3yg9er9eUS6zPJd9QdPaO1bJ41CBn
	 oU8pRXeDDQyGk/GCasPOhqK/ZY5LFHV9PK1O6nK+pBg5RQeOb+WEqFndMOCfqdbcHZ
	 dVVIFNeORQ+Rw==
Content-Type: multipart/mixed; boundary="===============0877743137689148681=="
MIME-Version: 1.0
Message-Id: <27b33e8d655c23498a546736e58ef01721ddc18462164e181864295a3b01ef42@mail.kernel.org>
In-Reply-To: <20260905070409.4141522-2-pulehui@huaweicloud.com>
References: <20260905070409.4141522-2-pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v4 1/3] riscv, bpf: Remap BPF_REG_0 and RV_REG_TCC
From: bot+bpf-ci@kernel.org
To: pulehui@huaweicloud.com,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,jiangfeng@kylinos.cn
Cc: bjorn@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,puranjay@kernel.org,pjw@kernel.org,palmer@dabbelt.com,alex@ghiti.fr,pulehui@huawei.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Sat,  5 Sep 2026 08:00:10 +0000 (UTC)
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0877743137689148681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index e7378be171a9..aac128b9f0a4 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c

[ ... ]

> @@ -1075,7 +1075,7 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
>
>  	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
>  	if (save_ret)
> -		stack_size += 16; /* Save both A5 (BPF R0) and A0 */
> +		stack_size += 16; /* Save both T6 (BPF R0) and A0 */

Should the comment read "Save both T6 (BPF R0) and A0"? The patch updates
regmap[BPF_REG_0] from RV_REG_A5 to RV_REG_T6, and the stack slot at
retval_off - 8 is written via regmap[BPF_REG_0] in the save_ret block
(emit_sd(RV_REG_FP, -(retval_off - 8), regmap[BPF_REG_0], ctx)), so the
comment still naming "A5" contradicts the new mapping. After this series
a5 becomes an argument register (the 6th BPF argument maps to a5 in a
later commit), which makes "A5" actively misleading here since a reader
could mistake this slot for argument spill space rather than R0/return
value storage.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33952202002
--===============0877743137689148681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0877743137689148681==--

