Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997BCD2ECF8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 00:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTRWdPByWip7ZdbslI4MdtDwSjCAn4JDqb0/eoCqlMQ=; b=ynOUDEjW1xPMhl
	wCZUMZ8qeKE5oesDXVaNr05UMRlvYumD3y9RYR4jhIIEMAQ672s0FbYt6djuIt1lePaONgoPE4hrF
	9+i4PAmkdDuwOSYOzzdYLOO8VHhRjzUgnEiaxnJSfJF95z99dDSPBHQzHq1Y5yk9Wqd+hYcrJUbBw
	nQG9h9FPC7KbR3/mbZmcF3sdQfDPgUZjQAzgZ9Ahs3XORJ4e03/Z9kyx4JfDu9tyD5JY+lOLgy558
	PDILeUtIrBW50METczXM8cYIAGFHVkxLn/yqAQ4XxgFVT7RY+Gm96NTmyf5BpjFq6o3SarkMgS44h
	qU1Cd1Cad8Af9z8xEsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhzf9-000000030EU-19jf;
	Tue, 20 Jan 2026 00:32:03 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhzf7-000000030E7-1OOM
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 00:32:02 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2CD9C340D4D;
	Tue, 20 Jan 2026 00:31:54 +0000 (UTC)
Date: Tue, 20 Jan 2026 08:31:50 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/3] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <20260120003150-GYA56672@gentoo.org>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
 <CAD++jLnM=1iyb0-=Jzqq+jPKtSvR+dbb1w8BNNcr+evdQFg4Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD++jLnM=1iyb0-=Jzqq+jPKtSvR+dbb1w8BNNcr+evdQFg4Eg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_163201_402415_80E48485 
X-CRM114-Status: GOOD (  16.63  )
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

SGkgTGludXMsCgpPbiAwMDo1MiBUdWUgMjAgSmFuICAgICAsIExpbnVzIFdhbGxlaWogd3JvdGU6
Cj4gT24gVGh1LCBKYW4gOCwgMjAyNiBhdCA3OjQz4oCvQU0gVHJveSBNaXRjaGVsbAo+IDx0cm95
Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4gCj4gPiBUaGlzIHNlcmllcyBh
ZGRzIHN1cHBvcnQgZm9yIGNvbmZpZ3VyaW5nIElPIHBvd2VyIGRvbWFpbiB2b2x0YWdlIGZvcgo+
ID4gZHVhbC12b2x0YWdlIEdQSU8gYmFua3Mgb24gdGhlIFNwYWNlbWl0IEsxIFNvQy4KPiA+Cj4g
PiBPbiBLMSwgSU8gZG9tYWluIHBvd2VyIGNvbnRyb2wgcmVnaXN0ZXJzIGRldGVybWluZSB3aGV0
aGVyIGEgR1BJTyBiYW5rCj4gPiBvcGVyYXRlcyBhdCAxLjhWIG9yIDMuM1YuIFRoZXNlIHJlZ2lz
dGVycyBkZWZhdWx0IHRvIDMuM1Ygb3BlcmF0aW9uLAo+ID4gd2hpY2ggbWF5IGxlYWQgdG8gZnVu
Y3Rpb25hbCBmYWlsdXJlcyB3aGVuIEdQSU8gYmFua3MgYXJlIGV4dGVybmFsbHkKPiA+IHN1cHBs
aWVkIHdpdGggMS44ViBidXQgaW50ZXJuYWxseSByZW1haW4gY29uZmlndXJlZCBmb3IgMy4zVi4K
PiA+Cj4gPiBUaGUgSU8gcG93ZXIgZG9tYWluIHJlZ2lzdGVycyBhcmUgaW1wbGVtZW50ZWQgYXMg
c2VjdXJlIHJlZ2lzdGVycyBhbmQKPiA+IHJlcXVpcmUgYW4gZXhwbGljaXQgdW5sb2NrIHNlcXVl
bmNlIHZpYSB0aGUgQUlCIFNlY3VyZSBBY2Nlc3MgUmVnaXN0ZXIKPiA+IChBU0FSKSwgbG9jYXRl
ZCBpbiB0aGUgQVBCQyByZWdpc3RlciBzcGFjZS4KPiA+Cj4gPiBUaGlzIHNlcmllcyBlbnN1cmVz
IHRoYXQgcGluIHZvbHRhZ2UgY29uZmlndXJhdGlvbiBjb3JyZWN0bHkgcmVmbGVjdHMKPiA+IGhh
cmR3YXJlIHJlcXVpcmVtZW50cy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxs
IDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KPiAKPiBFeGNlbGxlbnQgd29yayBp
biB0aGlzIHBhdGNoIHNlcmllcyBUcm95IQo+IAo+ID4gVHJveSBNaXRjaGVsbCAoMyk6Cj4gPiAg
ICAgICBkdC1iaW5kaW5nczogcGluY3RybDogc3BhY2VtaXQ6IGFkZCBzeXNjb24gcHJvcGVydHkK
PiA+ICAgICAgIHBpbmN0cmw6IHNwYWNlbWl0OiBzdXBwb3J0IEkvTyBwb3dlciBkb21haW4gY29u
ZmlndXJhdGlvbgo+IAo+IFRoZXNlIHR3byBwYXRjaGVzIGFwcGxpZWQgdG8gdGhlIHBpbiBjb250
cm9sIHRyZWUuCj4gCj4gPiAgICAgICByaXNjdjogZHRzOiBzcGFjZW1pdDogbW9kaWZ5IHBpbmN0
cmwgbm9kZSBpbiBkdHNpCj4gCj4gUGxlYXNlIGZ1bm5lbCB0aGlzIG9uZSB0aHJvdWdoIHRoZSBT
b0MgdHJlZS4KPiAKVGhhbmtzLCBJIHdpbGwgdGFrZSBjYXJlIG9mIHRoaXMKCj4gWW91cnMsCj4g
TGludXMgV2FsbGVpago+IAoKLS0gCllpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
