Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727EDCA5FFC
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 17:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAdMPeHJJ2jVuNjARxNja5JjUy/Up+UHlAL4z7FxSIc=; b=WSeQO7GdVrn1Li
	3jeIUql/wjgWrvT2951Ekk7i31ecc+8nycMClAq9cHo18T9DWFDdeiUG4MEF7lccNsDMZdCGPiwzm
	VcqQAFpHt8kOfv1gmrZc0Iznbgbbh5TTQc3W6ZiHFNNdBQ5a81x/Pa479DVg8p8dLWpeecC+F6rh9
	u4NAtRTM3A5zmIKJOBleDwpatI5HLArYc2T/xUQh8QxaXkVgXrrjkFrN8tpO+ZDIuTx8qhtTtSj4t
	OWbJT4ldkCDCWwPinWnQhb8+cURFlTCrwe18NTZ0vnKyN8MR+GOLzGtnU+n20d4T7hy1aGWVfEbKJ
	gpZG6PEBlQv73dhjDLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmK1-0000000GuGr-1t3m;
	Mon, 05 Oct 2026 17:17:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmK0-0000000GuGj-0z5H
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 17:17:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ABE0344057;
	Mon,  5 Oct 2026 17:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD7B1F00898;
	Mon,  5 Oct 2026 17:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220671;
	bh=Ymq6W5k88Rw+hVc9kKcw2Uav+weX0N5PgaqyYjKKNzI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=kDIbKGuZoC1H8ltVNn4uWnWUp1ldMPvq/u8Zj2BBGCDSqORZyRdgOMO2TLyUGTSsJ
	 Z9L6yEB1cWsuDPJH1YYIDKBYQtFPaFa68GKHWjI6i87C5lMW5gRHCT3HCNT55yqO98
	 bhH/Rr8vk2s4kscDewWiXMPTWYuoc76rbS5Nxxnihhy0xNiDXKhXUika2+HIjD+5Uu
	 lMP/EDxJCU/OiFKpkQtqf3Y7gNf/sEM3MTqNZOaZb+HK3jNwVPToUszWF3sKRhPSXt
	 NfrGzJnBZL7vwdh8HUhadqBuwRJaszf+3VgyWoAQsqbfrLG0pJ3+GXw5VeIwLlVcyC
	 ijkvN/gls3aVw==
Date: Mon, 5 Oct 2026 11:17:46 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: gao.rui@zte.com.cn
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    jiangfeng@kylinos.cn, david.laight.linux@gmail.com, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    jmontleo@redhat.com
Subject: Re: [PATCH v3] riscv: fix strnlen() overflow in Zbb implementation
In-Reply-To: <202609300948576198tT3nfO5VwsTwUw23gA9v@zte.com.cn>
Message-ID: <501e0def-c7ab-0f0c-cc19-7de5d253ca0d@kernel.org>
References: <202609300948576198tT3nfO5VwsTwUw23gA9v@zte.com.cn>
MIME-Version: 1.0
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

Hi Gao Rui,

On Wed, 30 Sep 2026, gao.rui@zte.com.cn wrote:

> riscv: fix strnlen() overflow in Zbb implementation
> 
> The RISC-V Zbb optimized strnlen() implementation can return incorrect
> results when very large count values are supplied.
> 
> The previous implementation calculates an end address based on the
> input pointer and count. When count is close to SIZE_MAX, the address
> calculation may overflow, resulting in incorrect termination checks and
> wrong return values.
> 
> This issue was observed while running device-mapper tests:
> 
> dmsetup create testname9 --table "0 8 zero"
> cat /sys/block/dm-*/dm/name
> dmsetup remove testname9
> 
> Rework the Zbb implementation to use a word counter instead of an end
> address. This removes the dependency on end-address calculations,
> avoids overflow entirely, and simplifies the termination condition of
> the word scanning loop. The final length is calculated using the saved
> original pointer.
> 
> Performance was evaluated with string_bench_strnlen:
> 
> New Implementation Previous Implementation
> 
> len=0 : 71 ns/call 70 ns/call
> len=1 : 82 ns/call 81 ns/call
> len=7 : 83 ns/call 81 ns/call
> len=8 : 83 ns/call 81 ns/call
> len=16 : 94 ns/call 90 ns/call
> len=31 : 117 ns/call 113 ns/call
> len=64 : 175 ns/call 167 ns/call
> len=127 : 259 ns/call 258 ns/call
> len=512 : 802 ns/call 833 ns/call
> len=1024 : 1512 ns/call 1536 ns/call
> len=3173 : 4581 ns/call 4640 ns/call
> len=4096 : 6256 ns/call 6068 ns/call
> 
> Results show comparable performance to the previous implementation
> while fixing the overflow issue.
> 
> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
> Suggested-by: DavidLaight <david.laight.linux@gmail.com>
> Signed-off-by: Gao Rui <gao.rui@zte.com.cn>

Thanks for your patch.  I took Shao Mingyin's patch for this instead, 
although I would have preferred that he work with you to clean up your 
patch instead, for the reasons described in

https://lore.kernel.org/linux-riscv/970c63ed-9fa8-9d1f-4521-0a7119b9d6e5@kernel.org/

If you think that Shao Mingyin's approach can be improved upon, please 
send a followup patch.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
