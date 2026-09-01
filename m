Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6895C61DD3
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGomcCqcFnk2H/bIyTxStxsdcRFaLhhPIlnxXj74zn0=; b=Zd1szv9XmH2PgGWZQYF/Am23z2
	t+z5nZkyg+IS52m00RTaIv1QIJ//JYGuwG21U4l2S4s1ojPvAN7OJyt0sXzViYb4iUM8zt+20tSWb
	K/egyUqVJK7vH+S2ZAbq6p1x79LoKcjsaZBkFizb1ERtpFGYb+sF98l+wpYs4GCZF/I+1kAaKLd89
	3NvH2AvsJGitwjkD8OWkwbN7TnmPbGp0siXu2qdI4lG/RtcJVjs3speoRW/ZBOA4xc9hYDIILSmFx
	Fo3iSRDDPSrfbq1V/YPmPVkbZrhGHDKdz9XYWyLN9PQfvzAn7UatsU70vHSL8whlHL8dUoaQJ6h0G
	6yt9+ihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Oah-0000000CDsV-2tCn;
	Tue, 01 Sep 2026 13:31:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Oag-0000000CDsN-24PI
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 13:31:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA2D86020C;
	Tue,  1 Sep 2026 13:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4786B1F000E9;
	Tue,  1 Sep 2026 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788269513;
	bh=9G3JvIjUOuywtO0FoKWwJSNlg8jMIMjHfgK7s4gduAQ=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=locj2gEdIeJlVn8Cf5Ksncp1iv4q6IbuGIaLHEKXHRYE/RuLK2HsJ1vd0Dj4m5SZ9
	 qG3teN4/n5BYnGkugnLX5N558umJMX+GNoGZWhXAAVgo4PTiSZxJnlBG91EIrw6jMj
	 bb247KfWNPPuw6Z7qDOgGHuzUTzQgIhxlWHT0e3Qa/NbZC+pS+RAQtHS8cX1VhSHRo
	 RGJ4/BF870L4uwyRmpcIC85J1fUzaBmZjHnwkJkg6K44llz9nwvnbAYAip8YvoIQC8
	 AD+KNdomhMwlCIwdC2/AqjMejMPA5gxOdUp7LTIb7V4IH9X/cRfBX1uI8IgvHjMx4k
	 SkL8as1956xXQ==
Content-Type: multipart/mixed; boundary="===============5494999732548298953=="
MIME-Version: 1.0
Message-Id: <46b7038550e5d5ed680c36ee4e9bd96429b9bd85b600c257a254fe73b17d6e19@mail.kernel.org>
In-Reply-To: <20260901120013.16104-1-cp0613@linux.alibaba.com>
References: <20260901120013.16104-1-cp0613@linux.alibaba.com>
Subject: Re: [PATCH bpf-next] bpf, riscv: Register extable entries at probe insn call sites
From: bot+bpf-ci@kernel.org
To: cp0613@linux.alibaba.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,memxor@gmail.com,bjorn@kernel.org,puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,eddyz87@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,pulehui@huawei.com,pjw@kernel.org,palmer@dabbelt.com,shuah@kernel.org,guoren@kernel.org,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Tue,  1 Sep 2026 13:31:52 +0000 (UTC)
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

--===============5494999732548298953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> bpf, riscv: Register extable entries at probe insn call sites
>
> add_exception_handler() filters insns by matching BPF_MODE() against
> the probe mode values. These values occupy unused opcode slots and
> collide with legitimate encodings: BPF_PROBE_MEM32SX (0xc0) shares
> its mode value with BPF_ATOMIC. Relying on the mode alone therefore
> risks registering exception table entries for the wrong instructions,
> as would happen for plain atomics without the LDX class check.
>
> Make the decision explicit at the call sites instead: register an
> entry only when emitting a probe load, a PROBE_MEM32 store, or a
> PROBE_ATOMIC atomic, and drop the fragile mode gate from
> add_exception_handler() along with the now unused insn argument. No
> functional change intended.
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

This looks like a bug fix for the fragile mode-based filtering in
add_exception_handler(). Should this include:

  Fixes: b4757714cc63 ("bpf, riscv: Add support for signed arena loads")


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33510775602
--===============5494999732548298953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5494999732548298953==--

