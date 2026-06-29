Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9144C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ll67s58npRDGBdDWksnwxXGiHLafLM81HRzh1o3A130=; b=0pMD35m1BJkojR3Cs+v91w7esg
	wlXNzGbRrqiZSlrqmJ0NLh//D0ba9GglwAR+tMmGfKZU67N+TGJwg4wnGXnALGzYzQiuCfPkzXZxh
	KvhIRW7sP4dN4352qLx+ou/c8nhtznkF8dbRXmpMprXjXFBveZIvYggAa+GY1sa9CdT2vdil8S3wq
	yZ+2YMn1xkJP4njsDxP0VKJZ651hKyyMv3afTd5uPbQsdGp2tQiP1ThCGEhllFr3BC2phYRlgHd6/
	dYcSoAkEbLT83gtQ8+oXCFCNQo54jBvw2BNmhn+0JgSv3YkN0b1IgxkpDOcUx0ABhL9YABXFI+Hvi
	1JJG8aeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEhx-0000000FC11-2qfz;
	Mon, 29 Jun 2026 16:19:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEhw-0000000FC0V-0gNH
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 16:19:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3BB343D39;
	Mon, 29 Jun 2026 16:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD351F000E9;
	Mon, 29 Jun 2026 16:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782749979;
	bh=23SRZQSyzGaaP+jU739gtUdoPMTFI2PuisT9R6qCj9E=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=F8jy1lAfym3ef5KbIR9DNOcUPkf2MdXovDFPnL6a8oEZeOvaDUQZVVChSNceSAbF/
	 IcwuYoO58i6KH1ftoJbZ6x6seswykmKOQTke7t+4TsaQ5anLxmwZ/9Lu4wsNXRDtrb
	 CIU3KszsDgZjs98iLN1ErM2TpRqa6WpiNOD2CQK/2HXbmPYi/VQjZI0lFbeZ4p4XoW
	 qqVjFknufP/64Og5rSxfYVYWFotTL/vmjn0EYd3iv6poRQfMPZ//fBJ2kTq0JqPOUx
	 imzV9Z2zDAZKr5+uCZLlUws+gNLWfsuBnvWUNKQoAyFuXsLUDgEnFJ/AXjE0hLjy2q
	 GwxFuf0yW0sZQ==
Content-Type: multipart/mixed; boundary="===============8484001317295672631=="
MIME-Version: 1.0
Message-Id: <0c8408eb97828eb59c171d971793a92654f8018ada812d6ac1703330ec4059fb@mail.kernel.org>
In-Reply-To: <20260629140048.733346-7-pulehui@huaweicloud.com>
References: <20260629140048.733346-7-pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v4 6/6] selftests/bpf: Remove tailcalls tests from DENYLIST.riscv64
From: bot+bpf-ci@kernel.org
To: pulehui@huaweicloud.com,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org
Cc: bjorn@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,puranjay@kernel.org,pjw@kernel.org,palmer@dabbelt.com,alex@ghiti.fr,pulehui@huawei.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon, 29 Jun 2026 16:19:39 +0000 (UTC)
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

--===============8484001317295672631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> selftests/bpf: Remove tailcalls tests from DENYLIST.riscv64
>
> Remove tailcalls tests from DENYLIST.riscv64.
>
> Signed-off-by: Pu Lehui <pulehui@huawei.com>

This isn't a bug, but the changelog restates the subject and the diff
without saying why the entry can be dropped now.

The deny-list line being removed documented that the JIT could not mix
bpf2bpf and tailcalls, and the preceding commit "riscv, bpf: Mixing
bpf2bpf and tailcalls" adds that support.

Could the changelog note that the RV64 JIT now supports mixing bpf2bpf
and tailcalls, rather than restating the diff?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/28384109028
--===============8484001317295672631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8484001317295672631==--

