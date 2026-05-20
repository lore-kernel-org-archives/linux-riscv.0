Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711D0CD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 16:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Psse5XrWYt7Q1crHtc7Ajo6W/eyTKdp1RlV18YRfBg=; b=w87qbXGeN3X9wB
	K+oo1obdHW2/kleFk0vqFyW8cuf5eu7PW3TFsgfVx2b0tAHVAL5fmxhn74Y9eAAH8DSiax2QiBPpB
	98l5jj5BdT8pLAMsnCVcz3dUR4vygKp7TzytLNdUMdu+WkeJ1ZhUKJLs0uipqttt/jPk5ResGsCIE
	x9ukRrFQgHJOummMEExPkKSjQt9xAAPSYvFj3GEQcdXebl6gW1niRho8ONgJ5vYauX/zs17Rctw98
	P/Zskf31dAFe6E0IJZMckprRhPcq7jKDw4OP280TWRXTqCjdPi61qSoaA8M76ntghFw+it9zYzDUC
	UxgowrY2wtEtkVSnXDFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjp6-00000005BJo-2bUR;
	Wed, 20 May 2026 16:31:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjp4-00000005BJY-2Rv5
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 16:31:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE2FB60132;
	Wed, 20 May 2026 16:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32901F00893;
	Wed, 20 May 2026 16:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779294665;
	bh=HImxTGXfOlPJ5yiYjEIBIuu3kZ/Pwu0vhqM2t+VyCbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oBM2Otyk38GG3acwx9YL4+hht3BlC2RO6DLXEPjVV1Vsh7ZLEi643kWif4zwoyVDG
	 mdCkNcmWBt3Tkz1FZcfFDRCWBtYrxtTJbGZbG+7K0NueUIvxSPogddtwaQ/5trZez7
	 YZm5M3cbhYFw56xh6pmsMF6LLaVaIyqRk3FHyILZ3k0dEzBcQlP8tqVv+w5arx0teY
	 7arBcOQRGYCsG8r49dV+eF45qjVFqXi6oRxeU0aEzhS4YqPELRT5vwVMDjDX1aVKn2
	 j7IJvJkoGX2HrVbGGjXMLsZ9lsTa/mAKWxwHat519DSuHBOui2+sWI3AQ1hHk1ViJN
	 ODnH+uokvYKtw==
Date: Wed, 20 May 2026 13:31:02 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Chen Pei <cp0613@linux.alibaba.com>, peterz@infradead.org,
	mingo@redhat.com, namhyung@kernel.org, dapeng1.mi@linux.intel.com,
	pjw@kernel.org, alex@ghiti.fr, guoren@kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] perf riscv: Add SDT argument parsing for RISC-V
Message-ID: <ag3hxuypbx5swL2Z@x1>
References: <20260520134004.30573-1-cp0613@linux.alibaba.com>
 <CAP-5=fWApAYb33pSnfW+gRmY7TsPUcfAP1UnBCJW5UpFudpr5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fWApAYb33pSnfW+gRmY7TsPUcfAP1UnBCJW5UpFudpr5A@mail.gmail.com>
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

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMDg6MjU6NTBBTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBXZWQsIE1heSAyMCwgMjAyNiBhdCA2OjQw4oCvQU0gQ2hlbiBQZWkgPGNwMDYxM0Bs
aW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gPiAgLSBBZGQgdHdvIFJldmlld2VkLWJ5IHRhZ3Mu
Cj4gPiAgLSBObyBhY3R1YWwgdXBkYXRlLCBqdXN0IHRvIHJlLXRyaWdnZXIgc2FzaGlrbydzIHJl
dmlldy4KIAo+IFRoZSBTYXNoaWtvIHJldmlldyBpcyBncmVlbiwgSSB0aGluayB0aGlzIGNhbiBi
ZSBtZXJnZWQuCj4gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTIwMTM0MDA0
LjMwNTczLTEtY3AwNjEzJTQwbGludXguYWxpYmFiYS5jb20KClRoYW5rcywgYXBwbGllZCB0byBw
ZXJmLXRvb2xzLW5leHQsIGZvciB2Ny4yLgoKLSBBcm5hbGRvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
