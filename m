Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21348C61DBD
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 01:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+kivSSGDCJEG59rNTn6YikDRdQkb6YkGt+kbbe1kyE=; b=yhvqrdTR0trW75SHe4qBzKDa44
	Rj825+8TlUZrGfh0tCDfvT9Ul4puYr1bSN1RTQyFoW/8BK92wzp2N6FsonSirBeuV/6pXwEOQ+piE
	q5VaE1lKK5KrMuKkor3RIUZ0L5XR2/zEGs6HhQAoAQxzM5Cy0ggevCn5C7my6JXQWyhRxnoleBlZ9
	mTOs45H0t/dAUeKn4klknLjVgJze5WFxRv37yTfh2MdlJeoag3JcOK6BlIket/3GoHJ6xzvDOc48e
	Po9KSsgXqBs210yp3zHfECHaGrIgIGh/A2qAKf9DRpdyFZxFcMTENxwUsIj9Pcn3d7eCMZjKI/dT4
	Kb3/FkrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2O3-00000001kl4-1QZG;
	Wed, 26 Aug 2026 01:25:07 +0000
Received: from common.ash.relay.mailchannels.net ([23.83.222.38])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2O1-00000001kke-0nSE
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 01:25:06 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id CF1D84E1377;
	Wed, 26 Aug 2026 01:25:03 +0000 (UTC)
Received: from pdx1-sub0-mail-a204.dreamhost.com (trex-green-7.trex.outbound.svc.cluster.local [100.96.17.28])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2F6304E1551;
	Wed, 26 Aug 2026 01:25:03 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Shoe-Trade: 329137dc4d059e0c_1787707503612_153827419
X-MC-Loop-Signature: 1787707503612:1092170596
X-MC-Ingress-Time: 1787707503612
Received: from pdx1-sub0-mail-a204.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.17.28 (trex/8.0.2);
	Wed, 26 Aug 2026 01:25:03 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a204.dreamhost.com (Postfix) with ESMTPSA id 4hV6QN4m4Qz1V;
	Tue, 25 Aug 2026 18:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1787707503;
	bh=8mvVAM5/C4VKX+uyn+Ue+KiWk4xHiIhC8s/6hAlyMMs=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=j6is/86GlPmrZ409Z13BQVNYvcmsOqVE5NPB3rajquDkLuKgFEq0vQWaBy2ze21v2
	 guCgQsPzj672ix7aiK7PSuDhiCMVjcjSMi5txQiqHwQLAfOf8Q+hShk7ufHCvwCnu6
	 /OOITLkG4BMZPC1jlQGIAZRiaTZPHCF39n3GLKv+l55qryyNpe2zkTeOVzWiW9IfKV
	 U4T5po5xCW5Xej0JU0qJ7HjxmAtVCs9RuJ5fB+qIkZXb2R7sB5qT4/LKDKeIHj1LOQ
	 jU8YPXWFwRY8qmN6V26lMSe1iKhNLDNkTu+x6NyKkDURg3qwofhyDd7XtCE6LBvdVX
	 DHlAkm+mFg8/w==
Date: Tue, 25 Aug 2026 18:24:57 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, dennis@kernel.org, tj@kernel.org, cl@gentwo.org,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org,
	thuth@redhat.com, ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk, rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com, zong.li@sifive.com,
	conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com,
	seanwascoding@gmail.com, andybnac@gmail.com,
	menglong8.dong@gmail.com, cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn, atishp@rivosinc.com,
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	bpf@vger.kernel.org, arnd@arndb.de, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v8 3/3] riscv: store percpu offset into thread_info
Message-ID: <20260826012457.ig3rfmji7vywf6kc@offworld>
References: <20260703122832.15984-1-cuiyunhui@bytedance.com>
 <20260703122832.15984-4-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703122832.15984-4-cuiyunhui@bytedance.com>
User-Agent: NeoMutt/20220429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_182505_429325_9CD3FE69 
X-CRM114-Status: UNSURE (   4.10  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 03 Jul 2026, Yunhui Cui wrote:

>RISC-V percpu addressing currently derives the base offset from the CPU
>number and __per_cpu_offset[]. Cache the current CPU percpu offset in
>thread_info so percpu accesses can load it directly.

fyi on a sifive p550 I am seeing this_cpu_inc() cost dropping by ~15-20%
an adhoc microbench measuring/grouping various calls.

Thanks,
Davidlohr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
