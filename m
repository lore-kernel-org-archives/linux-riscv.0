Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F3DC25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 16:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKSVXFEkEHMNZcXO2tAhs2stQFmFHJ+ZXHmWC6neL1Q=; b=vmXXvypv4zpAOF
	IEVOSZVlRyZUEjoMVN2sIo+TgKWwaLv55KmyUK0/kB9Y1UurHhjjxe9II1EP6qXE42COG5QhkenSn
	f47GAH8sSImAzuLRyQOp5O2FnMrXFBnAFDAX/Z23Rr9QPCRUiAizpelDoEx5sqIbEgGNJZdsy+yeZ
	YTSc83Gme0ayBPtee8tla2py+EuIYpRkEiPN256zv5P9PmRx0r+37HJx81oIgWZw3Y/O8Z7uqsnJl
	AUmjJwLeGjsDtshbAmCSOkhzpLYJe8TkpBM/+0BECdQYke/9xLmvFxoLe2BWSIBxvuQkZbeqdXro+
	lWg5N1R2BFVsT0T2hEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9SX0-00000000Xes-2ynE;
	Tue, 21 May 2024 16:40:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9SWv-00000000Xe0-16rY
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 16:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6444D621BD;
	Tue, 21 May 2024 16:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C43C2BD11;
	Tue, 21 May 2024 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716309600;
	bh=DVQA79nAV89v/vOYQVh9+5YPKXdr+s2r4gOfo9ZPLpc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KWzoU0PZy2xmR2e8CBeSJLQmhF/d1L+1C+0YQj2XyBqFYvJ17jZL7lrKjrI9qkYBw
	 ttqikMltUBSFM+kdw5gTV/KOn63eq776q6j6RWaFnN//Dq4IFCe/8tBkcQ0mR5CCLx
	 A+mqNZtxTpDzEmVPzAApsWjLg1BgnIYxMY69WH2FdHWMG4gKwQ7m+fiQ8RCpLhirCc
	 7P8b9jj1WXz5hc+Earjs/zDbIjIDkCVo+rEqZOD2qM8Q7MN0BRkigcJtCsK9midVFx
	 kb+hQD5d1jPgzJcYqqpE3xSlbptbR+XxiWpwKL3RF7DZo1/EVnSIcL5zEvV/BnQe4O
	 3mGSkZw6dxQWQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Xiao Wang <xiao.w.wang@intel.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, luke.r.nels@gmail.com,
 xi.wang@gmail.com
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, pulehui@huawei.com, haicheng.li@intel.com, Xiao Wang
 <xiao.w.wang@intel.com>
Subject: Re: [PATCH] riscv, bpf: Introduce shift add helper with Zba
 optimization
In-Reply-To: <20240520071631.2980798-1-xiao.w.wang@intel.com>
References: <20240520071631.2980798-1-xiao.w.wang@intel.com>
Date: Tue, 21 May 2024 18:39:56 +0200
Message-ID: <874jardspv.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_094001_383695_73A34820 
X-CRM114-Status: UNSURE (   4.56  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

WGlhbyBXYW5nIDx4aWFvLncud2FuZ0BpbnRlbC5jb20+IHdyaXRlczoKCj4gWmJhIGV4dGVuc2lv
biBpcyB2ZXJ5IHVzZWZ1bCBmb3IgZ2VuZXJhdGluZyBhZGRyZXNzZXMgdGhhdCBpbmRleCBpbnRv
IGFycmF5Cj4gb2YgYmFzaWMgZGF0YSB0eXBlcy4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIHNoMmFk
ZCBhbmQgc2gzYWRkIGhlbHBlcnMgZm9yCj4gUlYzMiBhbmQgUlY2NCByZXNwZWN0aXZlbHksIHRv
IGFjY2VsZXJhdGUgcG9pbnRlciBhcnJheSBhZGRyZXNzaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTog
WGlhbyBXYW5nIDx4aWFvLncud2FuZ0BpbnRlbC5jb20+CgpUaGlzIGlzIGRlcGVuZGVudCBvbiBb
MV0sIGFuZCBnaXZlbiBpdCBoYXNuJ3QgYmVlbiBhY2NlcHRlZCB5ZXQsIEknZAptYWtlIHRoaXMg
cGF0Y2ggcGFydCBvZiB0aGF0IHNlcmllcy4KCgpCasO2cm4KClsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDUxNjA5MDQzMC40OTMxMjItMS14aWFvLncud2FuZ0Bp
bnRlbC5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
