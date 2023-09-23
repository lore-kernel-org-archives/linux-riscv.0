Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA29FCE7A88
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 00:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TO470Dx+J+yLwuYXasAjRv1W/mnxlTpQuHOw6tPmINo=; b=FAfxmWBklpeOeD
	YKwLlhpx/XFlZyIPcVCYd2s7bzZxtdnWd5R2+bsC/w7wLeZDhUVOw2qvMdBH03oTXIMPC1187/I9N
	N7BWDdPHVENy/Wx43dxTaY4dghoOnlnDzB89Pe5aix7PcujKqfFyI+G3NjFV+16kQ9N63CbFi51PD
	4mMpY6wZVUc8UoDlQ7CT+dJZyGIcx53Ifhc3xLGGkZuQV5OBwECaxrbcWxuqFcUMGZ6FOC0XbBYNm
	XUK54vxr9w8Ux7yp0IsUGZVI0EHntf5XZf50Mqkqeelnjb7tNwcFk/8Ig3ncQ9lw/9pGlydzcW0AD
	TBtiaywtzchapkKf45oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjqFS-00A1bh-2l;
	Sat, 23 Sep 2023 00:11:50 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjqFP-00A1aw-25
	for linux-riscv@lists.infradead.org;
	Sat, 23 Sep 2023 00:11:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1695427892; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UcdZxtPJfhkeou047fGiepo/2N0CjThLq8vDmbyuPWsdsE6kBjmTYYPJWun41xQvYQfHIZSc/1iuWiPJ13tbNUYM7o9caI17DQzpWMLP3B6/sUSw7wDHSSx2FqKkXaTarxIttxtbSxKmfDfRVLZXj5oXc3jlcRot4nzbqLOh9ok=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1695427892; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JdL16BofRxhbL+GeSwRejWgJZOcxAvs0UhcFJGqQXNo=; 
	b=hQYr8uDHxlbxpLSmrEsJDwJMsSh1iUeTewyeiVnNScddbeM0787Un2ODokq7vP7aOFyYHRRCKkpI8mToocxHOQ6SVLZ/EC7gzOQhbm8sa0ojcqwipp4gXFSpsVGBWz0O3U4xE2gx6TRGvDS+D0+dHdkmYoqGNicqiElZd6JGIvc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695427892;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=JdL16BofRxhbL+GeSwRejWgJZOcxAvs0UhcFJGqQXNo=;
	b=FESkBIPBxc8X3/wjHdWYuR24KYAsFJ4mTjp/A5A7PpLEu+otXE1AnILIa8Wcieow
	6iMnK1vknGuFZ1KHaE5yDsRcsPGTrt2EN33aoU3Zb6aUFcc0WtDWaG0Rutpb26zRN9+
	R3qErXlY/rngtf6Du0VhG+N22FYMMX4VFx1Id5tpAvcGbgP8m6TayTnjpDfIpBF61K0
	FhV4tkuTpMgUpbRQRcQcZJmp/D8x4utWaupc9U2/Rrvusr26xucOjMHIJNzKmbaLySH
	kbQkvU2K9AEognK9zjeWZZyKQ9IbsGwuzh1+n6wBtSvPOUPfmrFOFmtU5E8yHM1HHj8
	JwE0cUScNQ==
Received: from edelgard.fodlan.icenowy.me (120.85.96.110 [120.85.96.110]) by mx.zohomail.com
	with SMTPS id 1695427889763166.9901112942979; Fri, 22 Sep 2023 17:11:29 -0700 (PDT)
Message-ID: <cc167bc439910534a03f7a69615a1d5a054c294b.camel@icenowy.me>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
From: Icenowy Zheng <uwu@icenowy.me>
To: Xi Ruoyao <xry111@xry111.site>, Drew Fustini <dfustini@baylibre.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jisheng Zhang <jszhang@kernel.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor@kernel.org>
Cc: Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner
	 <jkridner@beagleboard.org>, Han Gao <gaohan@iscas.ac.cn>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Sat, 23 Sep 2023 08:11:22 +0800
In-Reply-To: <c1a4a7ab5c68c00dd8b3bb249c0371dbb8bcb929.camel@xry111.site>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
	 <c1a4a7ab5c68c00dd8b3bb249c0371dbb8bcb929.camel@xry111.site>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_171147_770009_D330999A 
X-CRM114-Status: GOOD (  24.28  )
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

5ZyoIDIwMjMtMDktMjLmmJ/mnJ/kupTnmoQgMTk6NDEgKzA4MDDvvIxYaSBSdW95YW/lhpnpgZPv
vJoKPiBPbiBUaHUsIDIwMjMtMDktMjEgYXQgMTg6NDkgLTA3MDAsIERyZXcgRnVzdGluaSB3cm90
ZToKPiA+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIGVNTUMgb24gdGhlIEJlYWds
ZVYgQWhlYWQgYW5kIHRoZQo+ID4gU2lwZWVkIExpY2hlZVBpIDRBLiBUaGlzIGFsbG93cyB0aGUg
a2VybmVsIHRvIGJvb3Qgd2l0aCB0aGUgcm9vdGZzCj4gPiBvbgo+ID4gZU1NQy4KPiA+IAo+ID4g
SSB0ZXN0ZWQgb24gdG9wIG9mIHY2LjYtcmMyIHdpdGggdGhpcyBjb25maWcgWzFdLiBJIHdhcyBh
YmxlIHRvCj4gPiBib290Cj4gPiBib3RoIHRoZSBBaGVhZCBbMl0gYW5kIExQaTRhIFszXSBmcm9t
IGVNTUMuIFRoZSBmb2xsb3dpbmcKPiA+IHByZXJlcXVpc2l0ZXMKPiA+IGFyZSByZXF1aXJlZDoK
PiA+IAo+ID4gwqAgW1BBVENIIHYyXSByaXNjdjogZHRzOiB0aGVhZDogc2V0IGRtYS1ub25jb2hl
cmVudCB0byBzb2MgYnVzIFs0XQo+ID4gCj4gPiBJIHB1c2hlZCBhIGJyYW5jaCBbNV0gd2l0aCB0
aGlzIHBhdGNoIHNlcmllcyBhbmQgdGhlIGFib3ZlIHBhdGNoCj4gPiBmb3IKPiA+IHRob3NlIHRo
YXQgZmluZCBhIGdpdCBicmFuY2ggZWFzaWVyIHRvIHRlc3QuCj4gPiAKPiA+IFBsZWFzZSBub3Rl
IHRoYXQgb25seSB0aGUgTU1DIGNvbnRyb2xsZXIgY29ubmVjdGVkIHRvIHRoZSBlTU1DCj4gPiBk
ZXZpY2UKPiA+IGlzIGVuYWJsZWQgaW4gdGhlIGRldmljZSB0cmVlcyBmb3IgdGhlc2UgdHdvIGJv
YXJkcy4gSSBkaWQgbm90IHlldAo+ID4gYXR0ZW1wdCB0byBjb25maWd1cmUgYW5kIHVzZSB0aGUg
bWljcm9TRCBjYXJkIHNsb3QuIE15IHByZWZlcmVuY2UKPiA+IGlzIHRvCj4gPiBhZGRyZXNzIHRo
YXQgaW4gYSBmdXR1cmUgcGF0Y2ggc2VyaWVzLgo+ID4gCj4gPiBSZWZlcmVuY2VzOgo+ID4gWzFd
IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3BkcDcvNWZiZGNmMmE2NWViMWFiZGQzYTI5ZDUxOWMx
OWNkZDIKPiA+IFsyXSBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9wZHA3LzkxYTgwMWE1ZjhkMTA3
MGM1MzUwOWVkYTk4MDBhZDc4Cj4gPiBbM10gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vcGRwNy8x
NDQ1YzNjOTkxZTg4ZmQ2OWM2MDE2NWNlZjY1NzI2YQo+ID4gWzRdCj4gPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDkxMjA3MjIzMi4yNDU1LTEtanN6aGFuZ0BrZXJu
ZWwub3JnLwo+ID4gWzVdIGh0dHBzOi8vZ2l0aHViLmNvbS9wZHA3L2xpbnV4L3RyZWUvYjQvdGgx
NTIwLW1tYwo+IAo+IEkndmUgdGVzdGVkIHRoaXMgYnJhbmNoIGFuZCBzdWNjZXNzZnVsbHkgYm9v
dGVkIGEgcm9vdGZzIG9uIExpY2hlZSBQaQo+IDRBCj4gZU1NQyB3aXRoIHJvb3RkZWxheT0xMC4K
PiAKPiBDdXJpb3VzbHkgaXMgdGhlcmUgc29tZSB3YXkgdG8gbWFrZSBpdCB3b3JrIHdpdGhvdXQg
cm9vdGRlbGF5PwoKVGhlIGFuc3dlciBpcyBuZWFybHkgbm8gKGFsdGhvdWdoIHVzaW5nIGFuIGlu
aXRyZCB3aWxsIG1pdGlnYXRlIHRoZQpuZWVkIG9mIHJvb3RkZWxheSkuCgpNTUMgZGV2aWNlcyBh
cmUga25vd24gdG8gYmUgc2xvdyB0byBwcm9iZSwgZXZlbiBvbiB4ODYgZGV2aWNlcy4KCj4gCj4g
Rm9yIGV2ZXJ5dGhpbmcgZXhjZXB0ICJFbmFibGUgQmVhZ2xlViBBaGVhZCBlTU1DIGNvbnRyb2xs
ZXIiOgo+IAo+IFRlc3RlZC1ieTogWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+Cj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
