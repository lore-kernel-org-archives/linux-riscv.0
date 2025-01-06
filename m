Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F51E77198
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 15:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CojaoKJsIzWQ01P5Swpnzxs0QJf2REGOAtdAUXKdKZs=; b=U31DpU9lzChNk4
	2NTHUqembL1zVMusuFToSiSCfCH5QZqWuhDajNiNsru0n8R3ApH2ca91Obchuy3Q74PRpZr8YMdUR
	j+BiYvSBArfJGAEhES9nBLWjBvA6etuHpYu5batbs4Wv2RGkopOZ2C73TIy7pgT61rqEvXRvBYrCi
	TCau3EoKMCfh6ClawkRuOfYVuuMEG6MXjJgaWZT8r9Lovl1xuxxnaaj6eC6HwN/NTESl0c2G7+TM4
	mv/Jx10g3l3TsU3C3uMho8ZdjQiinH2I77vU5j9ZLgBE3ht7cvFdNIT7tFyCQgiQfKWHl4253vE2V
	yxSZQwRsG5V7aGpuerVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpGN-00000001pCs-31sl;
	Mon, 06 Jan 2025 15:43:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpGL-00000001pCC-3Y0d
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 15:43:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CDAA9A418CD;
	Mon,  6 Jan 2025 15:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75F6C4CEDF;
	Mon,  6 Jan 2025 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736178208;
	bh=ssWmrKg7U81ziEXjNyLEoomZAtl0l1yLKPpNvRiBfoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e+RxhfXT3UwlMOvSCoqyAEmP9ykd3zmatgNn3g260TsYKHY3ehsj9Jv9yNWQIK69t
	 gvDUmiI9ca7hv6TB5aRkkMl7/uFE7W/D7P7GkLc2/tAf8UGa+80x2V0+0T/t39i4OH
	 16q5YDO4sO8nPJSskmKq9tCV8E9nzpfHoUH98NE4vrhZwj+yxtCdi2u3wiS9G+kUvX
	 zorEhgl/+fUWNFypZhk5MiefCXVQnTpvvuMYy5CebmhI+ypVkAMDkJjORTVSR2edom
	 OW0ThwtW/Q5ueNR6Zc4cvPeoQeVBBSHNM5eqSv2S+f0bcIHTtk6eXQ/XjhcSIJdtUt
	 oOVCfGDldFptw==
Date: Mon, 6 Jan 2025 15:43:23 +0000
From: Lee Jones <lee@kernel.org>
To: Jure Repinc <jlp@holodeck1.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: add new driver for P1 PMIC from SpacemiT
Message-ID: <20250106154323.GA6763@google.com>
References: <20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com>
 <20241230-k1-p1-v1-2-aa4e02b9f993@gmail.com>
 <3082943.DJkKcVGEfx@excalibur>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3082943.DJkKcVGEfx@excalibur>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_074329_944337_3A4C2534 
X-CRM114-Status: UNSURE (   4.89  )
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

RGVsZXRlZCBwb2ludGxlc3Mgc2lnbmVkIG1haWwgd2l0aG91dCBsb29raW5nIGF0IGl0LCBzaW5j
ZSBpdCBzbG93cyBkb3duCm1haWwgdHJhdmVyc2FsIHRvbyBtdWNoLgoKLS0gCkxlZSBKb25lcyBb
5p2O55C85pavXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
