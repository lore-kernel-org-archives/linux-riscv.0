Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED4AC83F05
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 11:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGBuGv+//qhYqwF+Tp1QbtfpI+CxXxbzdTFBb8SVra8=; b=RNF8oAUsdOLj6a
	KU9GGaT1+S8Hrf1mL0RcoHxy+pqrBEwL4q0Tb11BAMyPA49S1j1UWX3GzSTuhWjpLd71GFn9HC04t
	6rmdgc6NAUT3zQjez1bEnL5Ir2c44ZDpv3zInbDWyDfa515Is3MZL8xUBLmlfJfSSYBqZPbpVtB6q
	CBL+PqUIgfJccQtwxu9bLpmLxsP6wXpCoXs1p07rTFp7pIXGwFiMrTDMUoIOHf9RSrDz1DmZJ89y0
	w0shXoDLjcOoTHty3UBxLIlmSaPODRCkZPGlkIBJC0HQ6N7RFmhMWI5F0CvoMnIhE+Tf+1M+0D2j9
	PnqGEV+TmtzFjSLxSC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeyD-0000000EHsJ-3N4l;
	Fri, 04 Jul 2025 11:52:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcWP-0000000Du3S-3FCd
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 09:15:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CDA146856;
	Fri,  4 Jul 2025 09:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCF3C4CEE3;
	Fri,  4 Jul 2025 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751620553;
	bh=3TB5brkS8M5VK1hs3MLjUrxhHeWeRrSyOSjTlAuIsP4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=da4KwEilqRuA8zEEqbfhh9NlVqd6BFWLIPOSZFo13+5Re4xrkdVw+rQsx0G2y0SZ9
	 i4ycYLIbTenpWb4boWdBTZTB7KOE8vhQ/LIUkIK6n+4oirsIwl/8F3jgYsND8ysEtc
	 XpbyOI9b3xueb6m/eGsAqb1uFXVMUqYmOCZ5tWAKXDMFL5XPnL3OdoviqByTITTd5G
	 NWGAYnqPdmgW3Zz6z9fbKItxJ0rSVEuT+peuWNOHX88Cyt7gses5uqji/f3GMbxIXa
	 xORkSnBI4eCbiAU6PXo2l7B0JptifLLQvqCNCiHHSa27OHJ/4faMuQu9twDvg3QgYi
	 ZZ4W6c2njZVlg==
Message-ID: <cb8891d4-de4e-493c-9914-0391b3baf212@kernel.org>
Date: Fri, 4 Jul 2025 11:15:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] add Voyager board support
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: arnd@arndb.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 soc@lists.linux.dev, tim609@andestech.com
References: <20250704081451.2011407-1-ben717@andestech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250704081451.2011407-1-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_021553_852052_ECCCBE5D 
X-CRM114-Status: GOOD (  10.93  )
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

T24gMDQvMDcvMjAyNSAxMDoxNCwgQmVuIFpvbmctWW91IFhpZSB3cm90ZToKPiBUaGUgVm95YWdl
ciBpcyBhIDkuNuKAnSB4IDkuNuKAnSBNaWNybyBBVFggZm9ybSBmYWN0b3IgZGV2ZWxvcG1lbnQg
Ym9hcmQKPiBpbmNsdWRpbmcgQW5kZXMgUWlMYWkgU29DLiBUaGlzIHBhdGNoIHNlcmllcyBhZGRz
IG1pbmltYWwgZGV2aWNlIHRyZWUKPiBmaWxlcyBmb3IgdGhlIFFpTGFpIFNvQyBhbmQgdGhlIFZv
eWFnZXIgYm9hcmQgWzFdLgo+IAo+IE5vdyBvbmx5IHN1cHBvcnQgYmFzaWMgdWFydCBkcml2ZXJz
IHRvIGJvb3QgdXAgaW50byBhIGJhc2ljIGNvbnNvbGUuIE90aGVyCj4gZmVhdHVyZXMgd2lsbCBi
ZSBhZGRlZCBsYXRlci4KPiAKPiBUaGUgb3JpZ2luYWwgcGF0Y2hzZXQgWzJdIGhhcyBiZWVuIHJl
dmlld2VkIHBvc2l0aXZlbHkgaW4gcmVsZXZhbnQgbWFpbGluZwo+IGxpc3RzLiBUaHVzLCBzZW5k
IGEgbmV3IHBhdGNoc2V0IHRvIHNvY0BsaXN0cy5saW51eC5kZXYgLgo+IAo+IEFsc28sIHRoZXJl
IGlzIGEgcGF0Y2ggZGVwZW5kZW5jeSBpbiB0aGlzIHBhdGNoc2V0Ogo+IFBhdGNoIDIgPC0gUGF0
Y2ggNCA8LSBQYXRjaCA1IDwtIFBhdGNoIDYKCkhvdz8gVGhlc2UgYXJlIGJpbmRpbmdzLiBIb3cg
RFRTIGNhbiBkZXBlbmQgb24gdGhlIGJpbmRpbmc/IERvIHlvdSBoYXZlCmFrY3MgZnJvbSB0aGVp
ciBzdWJzeXN0ZW0gbWFpbnRhaW5lcnMgdGhhdCB5b3UgYXJlIHNlbmRpbmcgaXQgaGVyZT8KClNv
cnJ5LCBidXQgbm8sIHRoaXMgc2hvdWxkIGdvIHZpYSB0aGVpciBtYWludGFpbmVycywgdW5sZXNz
IHRoZXkgZGlkIG5vdAp3YW50IHRvIHBpY2sgaXQgdXAuIElzIHRoaXMgdGhlIGNhc2UgaGVyZT8K
CkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
