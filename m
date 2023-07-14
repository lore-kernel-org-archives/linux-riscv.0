Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C975EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 06:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rojmTRAAPjrAo08T4pHd6sX+qYwA21aPsoXRgK6sbHc=; b=OhPt0I9hN4rfWw
	JBXvno8WBvDplR5Ke1ZrZsYGJsXBHC+HOFjSN8faiTN/qXFVNQIHlropPmkJ1pF4I7GYLIsbXlT6E
	4+PyHpJrndoTmCqc0R4+rUIkC3gs1KlaEQZdzxtp5s+s63cKwSJIi5Hf4VcYcnqgr/QcugNhteBpw
	qQEGFQHEbMd5szWPxXeNYmmL2BFiMO6qQRxECvcsJX2G0tcuDjOgRjOTs97bSgc+sAfzeuPArnUt6
	4gtqlDr18kohM34enE/Szxon1nkyRt3hO67gZxDcsQ0E7y/vhXHK8v6yyH3KnXw0dMmFyAEJYIBuR
	unl4RdS4wqCFyTesKGhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKC52-0059NP-1G;
	Fri, 14 Jul 2023 06:15:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKC4z-0059Mf-1F
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 06:15:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1607561C31
	for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 06:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A23FC433CC
	for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 06:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689315299;
	bh=6tZnlZgvm3FdWVb5umb818S5r6DOyHbccUd4b/r0kvs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O/nKp8N5La+CRvMJaWanNZDmGX9LWzhS1/ZFiZiwZCEBOBmjHZ4Y5+hl8c3kS4jmK
	 k3TH/uV6OQUjtnicqz9Ioev47+HW4ovxdc7WePBPNYtzK0R6eOhj0Nu8PcQaoDAN7w
	 dLYkyyfna/vL9lc9Jq3x6SobKTmDo3cy1QgbNtEuJ2nVXbnaKs93hLX9BzMZz6TBrW
	 pfZwmw6NaUdOQqoeGvns2yP2P++KSE4A6H2mH3de3zsDMsT0h8PsddVXJ/mCh0Pz2G
	 vyW42qgRHda4xz6tALlD0gzAdNIuphmu0lDSQnWnj+4wzX9Iax+Z03gIynulEE6vW+
	 TY8e6W43j03FA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so2591065e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 23:14:59 -0700 (PDT)
X-Gm-Message-State: ABy/qLZ6uYxUaDmTLD5w3DkszLejuJ6LHWsySOS5oRY36gc279yyijh2
	8EiTyTzTR9MGXPUNufVzBlOjqPBPE5WF/xJcxqo=
X-Google-Smtp-Source: APBJJlFj+zn3CIovnPzLqttiyEDmnQRur9KzP0OkrvMztQrc9HmlcrhpSQs8klVw5QmX8+8Jb31XBHlGnPCuujD7kzw=
X-Received: by 2002:a05:6512:3c90:b0:4f1:3d7d:409e with SMTP id
 h16-20020a0565123c9000b004f13d7d409emr3568194lfv.0.1689315297458; Thu, 13 Jul
 2023 23:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230712-postal-affiliate-0d61a209897f@spud> <ZLAoIWX+qqWvucWz@xhacker>
 <CAJF2gTQ-RotMeRGCSh6P7uQvZDbfWdZZHtTdeZqCAHWK4DzmMQ@mail.gmail.com> <20230713-statutory-balance-f2c9e862f2e3@spud>
In-Reply-To: <20230713-statutory-balance-f2c9e862f2e3@spud>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 14 Jul 2023 14:14:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRy5eK73=d6s7CVy9m9pB8p4rAoMHM3cZFwzg=AuF7TDA@mail.gmail.com>
Message-ID: <CAJF2gTRy5eK73=d6s7CVy9m9pB8p4rAoMHM3cZFwzg=AuF7TDA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, palmer@dabbelt.com, heiko@sntech.de, 
	charlie@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_231501_505101_FFF86EFE 
X-CRM114-Status: GOOD (  25.46  )
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTo0NeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAxMywgMjAyMyBhdCAwMTozMzo1NlBNIC0w
NDAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgMTI6NDjigK9Q
TSBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBPbiBXZWQs
IEp1bCAxMiwgMjAyMyBhdCAwNjo0ODowMlBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4K
PiA+ID4gPiArICAgICAgICAgICAgIC8qCj4gPiA+ID4gKyAgICAgICAgICAgICAgKiAiViIgaW4g
SVNBIHN0cmluZ3MgaXMgYW1iaWd1b3VzIGluIHByYWN0aWNlOiBpdCBzaG91bGQgbWVhbgo+ID4g
PiA+ICsgICAgICAgICAgICAgICoganVzdCB0aGUgc3RhbmRhcmQgVi0xLjAgYnV0IHZlbmRvcnMg
YXJlbid0IHdlbGwgYmVoYXZlZC4KPiA+ID4gPiArICAgICAgICAgICAgICAqIE1hbnkgdmVuZG9y
cyB3aXRoIFQtSGVhZCBDUFUgY29yZXMgd2hpY2ggaW1wbGVtZW50IHRoZSAwLjcuMQo+ID4gPiA+
ICsgICAgICAgICAgICAgICogdmVyc2lvbiBvZiB0aGUgdmVjdG9yIHNwZWNpZmljYXRpb24gcHV0
ICJ2IiBpbnRvIHRoZWlyIERUcwo+ID4gPiA+ICsgICAgICAgICAgICAgICogYW5kIG5vIFQtSGVh
ZCBDUFUgY29yZXMgd2l0aCB0aGUgc3RhbmRhcmQgdmVyc2lvbiBvZiB2ZWN0b3IKPiA+ID4gPiAr
ICAgICAgICAgICAgICAqIGFyZSBpbiBjaXJjdWxhdGlvbiB5ZXQuCj4KPiA+IFQtSEVBRCdzIHZl
Y3RvciAxLjAgU29DcyBpcyBpbiBjaXJjdWxhdGlvbi4gS2VuZHJ5dGUgSzIzMCBpcyB0aGUKPiA+
IHNoaXBwZWQgU29DIGNoaXAsIHdoaWNoIHZlbmRvciBpZCA9IFRIRUFEX1ZFTkRPUl9JRCBhbmQg
d2l0aCB2ZWN0b3IKPiA+IDEuMC4KPgo+IFdoZXJlIGNhbiBJIGJ1eSBvbmUsIGlmIGl0IGlzIGlu
IGNpcmN1bGF0aW9uPwo+IEdvb2dsaW5nIGluIEVuZ2xpc2ggbWlnaHQgbm90IGJlIHRoZSBiZXN0
IHRoaW5nIHRvIGRvLCBidXQgZG9pbmcgc28gSQo+IGNvdWxkIGZpbmQgYmFzaWNhbGx5IG5vIGlu
Zm9ybWF0aW9uIG9uIHRoZSBrMjMwIC0gSSBkaWQga25vdyBpdCBleGlzdGVkCj4gYW5kIHRyaWVk
IHRvIGZpbmQgc29tZSBpbmZvIG9uIGl0IGJlZm9yZSBzZW5kaW5nIHRoZSBwYXRjaC4KPiBJZiBp
dCBpcyBub3QgaW4gY2lyY3VsYXRpb24sIHRoZW4gdGhlIGNvbW1lbnQgaXMgbm90IGluYWNjdXJh
dGUgJiB3aGVuCj4gdGhleSBkbyBhcnJpdmUgdGhleSBjYW4gdXNlIHRoZSBuZXcgZGVkaWNhdGVk
IHByb3BlcnR5IHRvIGNvbnZleSBzdXBwb3J0Cj4gZm9yIHZlY3Rvci4KPgo+ID4gPiA+ICsgICAg
ICAgICAgICAgICogUGxhdGZvcm1zIHdpdGggVC1IZWFkIENQVSBjb3JlcyB0aGF0IHN1cHBvcnQg
dGhlIHN0YW5kYXJkCj4gPiA+ID4gKyAgICAgICAgICAgICAgKiB2ZXJzaW9uIG9mIHZlY3RvciBt
dXN0IHByb3ZpZGUgdGhlIGV4cGxpY2l0IFYgcHJvcGVydHksCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgKiB3aGljaCBpcyB3ZWxsIGRlZmluZWQuCj4gPiA+ID4gKyAgICAgICAgICAgICAgKi8KPiA+
ID4gPiArICAgICAgICAgICAgIGlmIChhY3BpX2Rpc2FibGVkICYmIHJpc2N2X2NhY2hlZF9tdmVu
ZG9yaWQoY3B1KSA9PSBUSEVBRF9WRU5ET1JfSUQpIHsKPiA+IElmIHlvdSBpbnNpc3Qgb24gZG9p
bmcgdGhpcywgcGxlYXNlOgo+ID4KPiA+IGlmIChhY3BpX2Rpc2FibGVkICYmIHJpc2N2X2NhY2hl
ZF9tdmVuZG9yaWQoY3B1KSA9PSBUSEVBRF9WRU5ET1JfSUQgJiYKPiA+IHJpc2N2X2NhY2hlZF9t
YXJjaGlkKGNwdSkgPT0gMCAmJiByaXNjdl9jYWNoZWRfbWltcGlkKGNwdSkgPT0gMCkgewo+Cj4g
V2h5PyBEb2VzIHRoZSBjOTA4IHJlcG9ydCBub24temVybyBtaW1waWQvbWFyY2hpZD8KWWVzCgo+
IElmIHllcywgZG9lcyBpdCBuZWVkIGVpdGhlciB0aGUgZXJyYXRhIGZvciBDTU9zIG9yIHRoZSBw
YWdlIHRhYmxlcz8KQzkwOCBpcyBjb21wYXRpYmxlIHRvIFJWQTIyIFByb2ZpbGUsIGhlcmUgaXMg
dGhlIGRldGFpbCBsaW5rOgpodHRwczovL3hydm0uY29tL2NwdS1kZXRhaWxzP2lkPTQxMDc5MDQ0
NjY3ODk5Mjg5NjAKCj4KPiBUaGFua3MsCj4gQ29ub3IuCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1
byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
