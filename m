Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DC5CD37BE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 20:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJQ4Rwa1iO1erasGYPlHbqK+eXtQkOUNvrWC2lDgE0k=; b=CE3xbcPTEsVU5+
	9wCJE/zk9mWm3Lf/VhDQqMJERFPnoewtPwbUKc02ScuSoGg45RwgTeA3i2Tm8LB+J+lQr4pjnXHsV
	Q8gNSWkbBMdBpnUUsc3AyrFQTavZ/mj0xq8/r+KU1CfZ/N2blx9gpcXNkHyefthqrpMQHeVjz2vc1
	ytTdxW0c1rXq0WiXrWc1ViUPvulj6p4Eg9CR20vtGLi9Na9U+20SI6mSiZkPU6VpKMGhU8/RRCLII
	Yl0UmSC3z029uvCWBb8h/J6iRrEItCu1tNVU0as1+S051Jbq1nozTq2liw+RomY102bYHonGL59Sk
	x46v03FdLWP1sNXo7cPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXA3-0000000EhNi-2Dwh;
	Mon, 11 May 2026 20:23:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXA2-0000000EhNS-1jLV
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 20:23:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 840106001A
	for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 20:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A985C4AF0B
	for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 20:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778531009;
	bh=Mw4otLNufcyiPgx5PCsJEXIfpLTfBs5wWkfpUHwyxKU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RpB8bRJBrzCFTAcznf4QzQZ6HV51QKaF/wUVny/T7vSt4QbDQhfgY8yHCbhfo8who
	 wSkiD4jLIU28+QrFV5AQ/6jJKTLxWPnSzIinbDpZlydktxvHP85UrE+iAzdtBrcIOz
	 YPIfsralVeWzkm3yMuJGxQ91txZOG2Z4d2B4p2X/R5wsSzwWHIgTQqNOZa5yHXdHxC
	 0lHUVEdGcUgG0qlJYi8OmEi5e1UzZ5toWZj7/VQiL1nNqmZWSigpBSvBxQcu8mQzRC
	 PDzVNShCCiQhBPyG4xT+bvICDwXfi//ciGSpP2H6mzXEao7JyJJE5uyhX6fp1AclQ7
	 8P4R055DdnIIQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a877510541so4995249e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 13:23:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9XILedB5f94/45Ng7MLMQI68ZBlyqLFs42n6eEMJF5szSFx8owOj66R1UYi8ma96t12eoiLlKv8t2Org==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPvfLaCsO1SAULIuVOi5+eVIS9WO6CoyW2Fct4dYPni7r489nN
	4+E94y4uUqIQxL7XIBn0zZ1lYwseAcxXvZDHr7b28iJPI26USPPDkRCOhFsYVpzJgoHUDrJ9py/
	qGuLeMaMRMDcsY5gNZHghAwVTFxEKzuE=
X-Received: by 2002:a05:6512:114b:b0:5a8:6c7b:f9d7 with SMTP id
 2adb3069b0e04-5a8e31f5ff3mr23278e87.41.1778531007946; Mon, 11 May 2026
 13:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-energize-dramatize-051909e54256@spud>
In-Reply-To: <20260506-energize-dramatize-051909e54256@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:23:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLkEfqDrqaxTjxf4AwHPcdCppPfO5F7H5YnR2gebzhZFig@mail.gmail.com>
X-Gm-Features: AVHnY4IP4KN4sVQQCZ4yBVMA5cS0ZkPLASNGKB7mSTEskh3Q63aPn5iBQgOAutg
Message-ID: <CAD++jLkEfqDrqaxTjxf4AwHPcdCppPfO5F7H5YnR2gebzhZFig@mail.gmail.com>
Subject: Re: [RFC v1 0/4] generic pinmux dt_node_to_map implementation
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
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

T24gV2VkLCBNYXkgNiwgMjAyNiBhdCAxMTo1OOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+IFdoaXBwZWQgdGhpcyB1cCBsYXN0IHdlZWssIGF0IHRvIGEgZmly
c3QgZ2xhbmNlIGl0IGFwcGVhcnMgdG8gd29yaywKPiBhbHRob3VnaCB0aGUgc3BhY2VtaXQgcGxh
dGZvcm0gSSd2ZSB1c2VkIHRvIGltcGxlbWVudCB0aGlzIGhhcyB2ZXJ5Cj4gbGltaXRlZCBpbi10
cmVlIHVzZSBvZiBwaW5jdHJsIHNvIGl0IGlzIGhhcmQgdG8gYmUgc3VyZS4KCkkgbGlrZSBpdCwg
aWYgaXQgd2Fzbid0IFJGQyBJIHdvdWxkIG1lcmdlIGl0LgoKPiBXaGF0IEkgZG9uJ3QgbG92ZSB0
aG91Z2ggaXMgaG93IHNpbWlsYXIgdGhlIGZ1bmN0aW9ucwo+IHBpbmN0cmxfZ2VuZXJpY19waW5z
X2Z1bmN0aW9uX2R0X25vZGVfdG9fbWFwKCkgYW5kCj4gcGluY3RybF9nZW5lcmljX3Bpbm11eF9k
dF9ub2RlX3RvX21hcCgpIGFyZSAtIGVzc2VudGlhbGx5IGlkZW50aWNhbAo+IG90aGVyIHRoYW4g
d2hpY2ggZnVuY3Rpb24gdGhleSBpbiB0dXJuIGNhbGwuCgpIbSB3ZSBjYW4gbWF5YmUgdGhpbmsg
b2Ygc29tZXRoaW5nIG1vcmUgZGVzY3JpcHRpdmUKdG8gdGhlIGZpcnN0IG9uZT8KCkkgdGhpbmsg
dGhlIG5ldyBmdW5jdGlvbiBpcyB2ZXJ5IG11Y2ggdG8gdGhlIHBvaW50LiBUaGF0J3Mgd2hhdApp
dCBkb2VzLiBwaW5jdHJsX2dlbmVyaWNfcGluc19mdW5jdGlvbl9kdF9ub2RlX3RvX21hcCgpIGNv
dWxkCnBlcmhhcHMgYmUgbmFtZXMgc29tZXRoaW5nIHRoYXQgbWFrZSBpdCBldmlkZW50IHdoYXQg
aXMKc3BlY2lhbCBhYm91dCBpdC4gTm90IHRoYXQgSSBoYXZlIGEgZ29vZCBpZGVhLgoKPiBCYXNp
Y2FsbHksIEkgd2FubmEga25vdyBpZiB5b3UgdGhpbmsgdGhhdCB0aGF0IGlzIGFjY2VwdGFibGUs
CgpMb29rcyBHb29kIFRvIE1lIChUTSkgbm8tb25lIGVsc2UgaXMgaGVscGluZyBvdXQgd2l0aCBw
aW4KY29udHJvbCBjb3JlIHdvcmsgc28gSSdtIGhhcHB5IGZvciBldmVyeXRoaW5nIEkgZ2V0LgoK
WW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
