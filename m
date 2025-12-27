Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2D8E92704
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PY4oi13IkkP8oGQgaMA4dy1O2EJCKaOERL2DAz/EBmM=; b=EUlGemQYpNv905
	M8kbB0Eg2PDeTYgwwRgZH7SroyNLPQzz9vT6kDfjcFE5fmqOCGsFE8lxLdHIHZbdParKqWwXc7lNJ
	u8QfZj6o+M6no+850E6IblPhT7V3p3YxG3c5JbgYUbYWUVfeNS+0dQqaeiCbQutl5AdLSG0YeNlWn
	ZdID90yVZIclGWQsjFWY7yqVYJAVnwuRrwb26x3OFr7YncZOxbstevcVuioBQw2h/RpvblNlVK3+0
	d8k7X5rw0xG9TSluo2V8iI9Y7uhAyAya/lBVUZD7z6dDesCi13EScxyzOd25T6ApdEDG0IQXHNYfh
	PJuSAYKwepL571s90Gxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTdO-00000001yr0-2JH5;
	Sat, 27 Dec 2025 12:43:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTdN-00000001yqr-0Ay8
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 12:43:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B6436000A;
	Sat, 27 Dec 2025 12:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB05C4CEF1;
	Sat, 27 Dec 2025 12:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766839379;
	bh=evZsjUyJHrxkPefhOiZUy0dqWLUa+4V2/GdjlFkFNnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLWk2arydbLSzy/AnZ2BZ6imA8M4zOPW9cm9RSS0dwJnJK4ULnLL/1TPCAPkz3ylQ
	 NYdeQeLd2rn6Ml1t+VkRE6fJ+vD32YTbNo1rEI6jETciiq65AMpCiIqI23MRgMUrJ9
	 pg2AeobEuaaT1wKWM99ISpLpG7nwiQDrg1ZF7y61h5fRSkzB8vXDN/MjeQBfbFYtRv
	 QUnOA1btcsORE9l0zGDnBQNmnaXnOKQc3E5ZogduThQlf6MwYrdjKfoBL/g6K8LEUT
	 D6p28pqUbT7T4zz2MAFErlYavypbulKlZDNoS7LQSFMJE+RUDomQhVM86g0GpYa9ns
	 wyI1hA+OPxoAA==
Date: Sat, 27 Dec 2025 13:42:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: soc: mobileye: Add EyeQ7H OLB
Message-ID: <20251227-bipedal-wombat-of-correction-d71fd8@quoll>
References: <20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com>
 <20251224-clk-eyeq7-v2-1-81744d1025d9@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251224-clk-eyeq7-v2-1-81744d1025d9@bootlin.com>
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

T24gV2VkLCBEZWMgMjQsIDIwMjUgYXQgMTE6MDc6MTRBTSArMDEwMCwgQmVub8OudCBNb25pbiB3
cm90ZToKPiArICAnI3Jlc2V0LWNlbGxzJzoKPiArICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICBG
aXJzdCBjZWxsIGlzIGRvbWFpbiBhbmQgb3B0aW9uYWwgaWYgY29tcGF0aWJsZSBoYXMgYSBzaW5n
bGUgcmVzZXQgZG9tYWluLgo+ICsgICAgICBTZWNvbmQgY2VsbCBpcyByZXNldCBpbmRleCBpbnNp
ZGUgdGhhdCBkb21haW4uCj4gKyAgICBlbnVtOiBbIDEsIDIgXQo+ICsKPiArICAnI2Nsb2NrLWNl
bGxzJzoKPiArICAgIGNvbnN0OiAxCj4gKwo+ICsgIGNsb2NrczoKPiArICAgIG1pbkl0ZW1zOiAx
Cj4gKyAgICBtYXhJdGVtczogMgo+ICsKPiArICBjbG9jay1uYW1lczoKPiArICAgIG1pbkl0ZW1z
OiAxCj4gKyAgICBtYXhJdGVtczogMgo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRpYmxl
Cj4gKyAgLSByZWcKPiArICAtICcjY2xvY2stY2VsbHMnCj4gKyAgLSBjbG9ja3MKPiArICAtIGNs
b2NrLW5hbWVzCj4gKwo+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKClRoaXMgZ29lcyBi
ZWZvcmUgZXhhbXBsZXMgc2VjdGlvbi4KCj4gKwo+ICthbGxPZjoKPiArICAtIGlmOgo+ICsgICAg
ICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4gKyAgICAgICAgICBjb250YWlu
czoKPiArICAgICAgICAgICAgZW51bToKPiArICAgICAgICAgICAgICAtIG1vYmlsZXllLGV5ZXE3
aC1kZHIwLW9sYgo+ICsgICAgICAgICAgICAgIC0gbW9iaWxleWUsZXllcTdoLWRkcjEtb2xiCj4g
KyAgICAgICAgICAgICAgLSBtb2JpbGV5ZSxleWVxN2gtbWlwczAtb2xiCj4gKyAgICAgICAgICAg
ICAgLSBtb2JpbGV5ZSxleWVxN2gtbWlwczEtb2xiCj4gKyAgICAgICAgICAgICAgLSBtb2JpbGV5
ZSxleWVxN2gtbWlwczItb2xiCj4gKyAgICAgICAgICAgICAgLSBtb2JpbGV5ZSxleWVxN2gtcGVy
aXBoLWVhc3Qtb2xiCj4gKyAgICAgICAgICAgICAgLSBtb2JpbGV5ZSxleWVxN2gtc291dGgtb2xi
Cj4gKyAgICB0aGVuOgo+ICsgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIGNsb2NrczoKPiAr
ICAgICAgICAgIG1heEl0ZW1zOiAxCj4gKyAgICAgICAgICBkZXNjcmlwdGlvbjoKPiArICAgICAg
ICAgICAgUmVmZXJlbmNlIGlucHV0IGNsb2NrLgoKSnVzdCB1c2UgaXRlbXMgd2l0aCBkZXNjcmlw
dGlvbiBzeW50YXgsIGxpa2UgZXZlcnl3aGVyZSBlbHNlLgoKV2l0aCB0aGVzZSBmaXhlZDoKClJl
dmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5x
dWFsY29tbS5jb20+CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
