Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CB7C021A4
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 19:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZkhpW/yJNyEHtg/Hn+gMVc9U4sNrwKmEslndqErOhk=; b=43/dX6gAdO2EgA
	dcAO8e7bsoRJje6m/D+lCefQC7tz2OXW9/Gx//wBOkqLpntiXEVx6jCP7s6PzcSz1Jt5A2LsypBFT
	8j2XI2+/5MUNHndNtMkJHzTUyzajs4HXRXK/dAr06LuXfCz5PbwCxCtM88dqX8KG1Vq3OLKU3+orx
	6jM6+aUtXwbX/CP4luTKv1EOIJklGRGl4nA3TQMP0uh5Yb9KIgU1BgQZvJD3Mb3zz+yHanyHzEjMC
	eJHQSaZ2f6TVrLoTYfKM8mxUOau2IqAYqWT530gQQD+hvcqJvABR9ANE6bM65zn9UAmYHAFcZ4VTU
	QEdr9C8Vbj0UvkGiLuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiezv-0000000CQ8q-3pJD;
	Thu, 13 Feb 2025 19:35:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidyS-0000000CFE0-1aZ5
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 18:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4F3E4A42894;
	Thu, 13 Feb 2025 18:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415BEC4CED1;
	Thu, 13 Feb 2025 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739471407;
	bh=Dc2ONtrEad7VUfPnbx8Z1lbE94xlzKmO3OKnmanOGUc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=t/9jAXLyFju5/kd+yyT6UK3Gntxc+xl5wCzAhIIG1mNUWx/bw0wa9kAFk5VBvN9JH
	 MDniw5yXH2LqItHhyPJUiB2mN+HM2GG1jOjDZjJJSgywX5mehQ5/Dqy1w36agKVFxA
	 AzjL3KApDmcag1P+SV7nFDICwrnU0trGvfjJ1FliRXnTrLH2zSi6MSVpAEiPa5QJxZ
	 WyPy01SbZrkO397hZVZsh6I6Ol0ljH7/M07z+cFjdJeNmO/pwf76LoGFep5eHfh52T
	 rG7DSgo5TmPEGipx2uPykkJSdUrArdS1dwoReVgl2sCd7fNP0NqjBU1JrLVxUGXvIH
	 7kiKQtGu3FxZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE666380CEEF;
	Thu, 13 Feb 2025 18:30:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: cpufeature: use bitmap_equal() instead of memcmp()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173947143640.1330575.1576531241025844653.git-patchwork-notify@kernel.org>
Date: Thu, 13 Feb 2025 18:30:36 +0000
References: <20250210155615.1545738-1-cleger@rivosinc.com>
In-Reply-To: <20250210155615.1545738-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org, conor@kernel.org,
 alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_103008_482336_F08BADF5 
X-CRM114-Status: UNSURE (   8.76  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIE1vbiwgMTAgRmVi
IDIwMjUgMTY6NTY6MTQgKzAxMDAgeW91IHdyb3RlOgo+IENvbXBhcmlzb24gb2YgYml0bWFwcyBz
aG91bGQgYmUgZG9uZSB1c2luZyBiaXRtYXBfZXF1YWwoKSwgbm90IG1lbWNtcCgpLAo+IHVzZSB0
aGUgZm9ybWVyIG9uZSB0byBjb21wYXJlIGlzYSBiaXRtYXBzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAt
IHJpc2N2OiBjcHVmZWF0dXJlOiB1c2UgYml0bWFwX2VxdWFsKCkgaW5zdGVhZCBvZiBtZW1jbXAo
KQogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzE1MDhlYWQzZDIyOQoKWW91IGFy
ZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRw
czovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
