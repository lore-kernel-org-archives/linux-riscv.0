Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B086CC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 10:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JaE29hKdCkX1kOHwZOUBDXmKwSNU/8irafroj+qcDZg=; b=HiWxTPfTeHU3yU
	KIWUoEOcWrpSrJknD1By+NEBamlaHEl+ojZb+QqcuvRYYIu1gjreqy3TPn7DTzonBH55w+qxtVY+d
	AxWamVcDWbERvpeMAAlsj2wv/fHouLbjBD68HGNTu+tDRJWrW3tOG7rtIp/BzaGgp2u7iA9iQ2PLg
	3pGz0Wwg0rhQAsqjHml7lyQipqX1SCCfI9ULthcki3R3q8PbW4gDljtBWchi6f8YZZdBXAL6W9kfT
	KjXDxfxQl9uRMhxpoHU8iddgDMEgmi7r69JEdZ682o6K28wyoKghX/7uU/26FDiDQVjl9ao4ES2yE
	TdmmgEhjExndV2d3iSBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfI4N-001Yk6-0U;
	Thu, 23 Mar 2023 10:21:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfI4J-001YjU-1x;
	Thu, 23 Mar 2023 10:21:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E5AB625A9;
	Thu, 23 Mar 2023 10:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25354C433EF;
	Thu, 23 Mar 2023 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679566874;
	bh=Y3UnjiHBiXxJhNV4x+zaUKIGWmEzu1W0E7t5IwjZLcw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Kg7fmjHTnzaiG4FFLThcGszSjwBn/yL+h6xQh6D4WivUS/EneZ2S5RikPQo8LufuK
	 vRfSU2YPLijtps8/tA2owcnp5VM3g66SWL1tD+olt3NSwSHjtP+fUEA3A5gEmEY/sC
	 Sp3NG5bMaSC6ZYH5dpRzBLZ+hKpZrQ5sFqCpcoLKDcql0Xxjpi8Cl9fbAPj5j3PTRG
	 L2XQwugE81+iPiao9yw1iojapY4n49CPzbGZpVe8LGa2tWAVkci655AbCygN1WGxln
	 A8mXloS3DrwCavHJ0KsqLrTr8stoweSaNyQU1uZN/4kjY11zHGoQPTWrvldOwrHsnK
	 N7olz6+GoqDYA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH -next v15 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
In-Reply-To: <20230317113538.10878-9-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-9-andy.chiu@sifive.com>
Date: Thu, 23 Mar 2023 11:21:11 +0100
Message-ID: <877cv7wyy0.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_032115_682963_61D2AB0A 
X-CRM114-Status: UNSURE (   9.08  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBGcm9tOiBHcmVlbnRp
bWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+Cj4gQWRkIHZlY3RvciBzdGF0ZSBjb250
ZXh0IHN0cnVjdCB0byBiZSBhZGRlZCBsYXRlciBpbiB0aHJlYWRfc3RydWN0LiBBbmQKPiBwcmVw
YXJlIGxvdy1sZXZlbCBoZWxwZXIgZnVuY3Rpb25zIHRvIHNhdmUvcmVzdG9yZSB2ZWN0b3IgY29u
dGV4dHMuCj4KPiBUaGlzIGluY2x1ZGUgVmVjdG9yIFJlZ2ZpbGUgYW5kIENTUnMgaG9sZGluZyBk
eW5hbWljIGNvbmZpZ3VyYXRpb24gc3RhdGUKPiAodnN0YXJ0LCB2bCwgdnR5cGUsIHZjc3IpLiBU
aGUgVmVjIFJlZ2lzdGVyIHdpZHRoIGNvdWxkIGJlIGltcGxlbWVudGF0aW9uCj4gZGVmaW5lZCwg
YnV0IHNhbWUgZm9yIGFsbCBwcm9jZXNzZXMsIHNvIHRoYXQgaXMgc2F2ZWQgc2VwYXJhdGVseS4K
Pgo+IFRoaXMgaXMgbm90IHlldCB3aXJlZCBpbnRvIGZpbmFsIHRocmVhZF9zdHJ1Y3QgLSB3aWxs
IGJlIGRvbmUgd2hlbgo+IF9fc3dpdGNoX3RvIGFjdHVhbGx5IHN0YXJ0cyBkb2luZyB0aGlzIGlu
IGxhdGVyIHBhdGNoZXMuCj4KPiBHaXZlbiB0aGUgdmFyaWFibGUgKGFuZCBwb3RlbnRpYWxseSBs
YXJnZSkgc2l6ZSBvZiByZWdmaWxlLCB0aGV5IGFyZQo+IHNhdmVkIGluIGR5bmFtaWNhbGx5IGFs
bG9jYXRlZCBtZW1vcnksIHBvaW50ZWQgdG8gYnkgZGF0YXAgcG9pbnRlciBpbgo+IF9fcmlzY3Zf
dl9leHRfc3RhdGUuCj4KPiBDby1kZXZlbG9wZWQtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5j
aGVuQHNpZml2ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNo
ZW5Ac2lmaXZlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5o
dUBzaWZpdmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFZpbmVldCBHdXB0YSA8dmluZWV0Z0ByaXZv
c2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNv
bT4KClRoYW5rIHlvdSBmb3IgZG9pbmcgdGhlIHNjcmF0Y2ggcmVnIGNoYW5nZSEKClJldmlld2Vk
LWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
