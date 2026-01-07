Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88558CF6C0A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVIh8ArXq06g3u9for/FEQg1WlVGTn0EIEmtelt/dxc=; b=AWoySO5XUsfDIj
	Tavq8mPirS9ZyiDYooXpsBsJWJZi9wpgvMgudlHYOqRXauPWS39o+Ed1fUDjNEup0VD3Mnu6rmpLH
	pbyb2V5Q0XiPX6RCN2ybj9drSs/mRfPw6qyAPHfnJtzwjtvJLE+w3vYgQ8sttT63YPxO/vnuMkG/R
	V5PDw2RXdD6QBQHsyt0DBm3aP1lmyREFriNQzxDFV+sJwDUCePWzp2sCUbp/clrYcv3xi9qlbeWVI
	obJkAu+Y66DR2D54D3k2NhTcOwAiKnCP0J/cGUtBs89xn/VWNc6mByzPLrQyYUMMN7yUzV72z7wVe
	7e7uqFzAIg/0bW7Ul6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOsx-0000000EPEo-1xPb;
	Wed, 07 Jan 2026 08:27:19 +0000
Received: from mx-rz-3.rrze.uni-erlangen.de ([2001:638:a000:1025::16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOst-0000000EPDu-1hgw
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 08:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1767774421; bh=hBWHCIpkzChrATnFln/bxRB+e8DDJ5hzfUmuXh8ecCI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=mCNEnUzkeFL8UqBRb94lEX1fV6Db/78BEQCeNi5G4TLNVHcP6bWcS03fVJ4DIbR6/
	 nL3xoSzdHk5Mr0noHL5yXtVxm23RdjgUZ7siVO3nKgtCEyEyWVld4kXXIoWnNuFvyg
	 b8SVvAJoFDXDxc4SjZWqE6h0xTZmjXEJjjRzumTY9YDwgL69TsnYguRYVxIEyy0nXI
	 1OjjGuyeuxsFVYAmRcwjt899jgzgJ8qMBpHEp+8tbtJtFvEdXmyYzKlDA6cm17BY2S
	 gGfwD03OE9S3+HTk76WdRzvFnmXOm5JRdEk4W065gqOi8U2gFJeLOEFjPJpxalOdGe
	 r5xZdzUfoFUAw==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4dmLjx0GVpz1xxC;
	Wed,  7 Jan 2026 09:27:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at boeck5.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 10.188.34.184
Received: from localhost (i4laptop33.informatik.uni-erlangen.de [10.188.34.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX18+iE5pwJG0JL2v/qz8hzsiECbHr4AnlqI=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4dmLjt17ZYz1xv0;
	Wed,  7 Jan 2026 09:26:58 +0100 (CET)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Lukas Gerlach <lukas.gerlach@cispa.de>
Cc: <pjw@kernel.org>,  <ast@kernel.org>,  <bjorn@kernel.org>,
  <bpf@vger.kernel.org>,  <daniel.weber@cispa.de>,  <daniel@iogearbox.net>,
  <jo.vanbulck@kuleuven.be>,  <linux-riscv@lists.infradead.org>,
  <luke.r.nels@gmail.com>,  <marton.bognar@kuleuven.be>,
  <michael.schwarz@cispa.de>,  <palmer@dabbelt.com>,  <xi.wang@gmail.com>
Subject: Re: [PATCH] riscv, bpf: add a speculation barrier for BPF_NOSPEC
In-Reply-To: <20260106084410.94496-1-lukas.gerlach@cispa.de> (Lukas Gerlach's
	message of "Tue, 6 Jan 2026 09:44:10 +0100")
References: <83981ed7-9d36-a47a-cf73-9010fceba5f1@kernel.org>
	<20260106084410.94496-1-lukas.gerlach@cispa.de>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 07 Jan 2026 09:26:57 +0100
Message-ID: <87y0m996b2.fsf@fau.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_002715_887670_0DA7C2AF 
X-CRM114-Status: GOOD (  13.25  )
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

Lukas Gerlach <lukas.gerlach@cispa.de> writes:

> I have not benchmarked fence.i in the eBPF context specifically, but
> from my other work on Spectre mitigations on RISC-V I can confirm that
> fence.i flushes the instruction cache on all cores I have tested, both
> in-order and out-of-order, so there is a performance impact.
>
> I agree that making this conditional similar to ARM64's proton-pack.c
> is the right approach. Getting this infrastructure in place is a good
> idea regardless, as the RISC-V hardware landscape is very diverse, and
> we will likely need conditional mitigation support for other Spectre
> defenses as well.

Thanks for the patch, I believe this approach makes sense.

For eBPF, you can make them conditional by implementing
bpf_jit_bypass_spec_v1/v4() similarly to how powerpc does it [1]. They
default to false for archs that do not implement them. Setting them will
not only avoid the performance bumb, but also speed up verification and
improve expressiveness (i.e., fewer programs are rejected for some edge
cases).

I am not familiar with RISC-V, but could the be any problem from fence.i
being an extension [2]? Or do all RISC-V CPUs supported by the kernel
implement this?

[1] https://lwn.net/ml/all/20250603211318.337474-1-luis.gerhorst@fau.de/
[2] https://docs.riscv.org/reference/isa/unpriv/zifencei.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
