Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49945C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 08:23:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1791A214C6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 08:23:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iPZrtV77";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="lajsVGxx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1791A214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Id5tUTLfEQcgKxMImPOQ+Ig2PZUA6ouSCLHuODDZboA=; b=iPZrtV77Y+/sgD
	WP/eTiE5hQ+e3iNOMxvOSTw/ZP5mFNhdnwLYGxvibT0ufZ/fsnZ7hTk5uztBze/O11ECJvgfmKa0f
	8NNo9G/TysNM0960/G4FizyXnjWFZ+c0Hgbkt7L3P/zugyRXnTLJOioF+RuUGB+5c593r25GJokQt
	Uhbp88kzwDKr3qL0neDWHbqnDN5bvgxrTabFKw3nNExaubKerc2ZiFDShE/ye8hcnzXCprkZRisX+
	mBxbKhjlVI5edyyhN4FrSHpvwBnKQIx+0C4l5rWIHy62ht240sRrkyULnmWHF33TK96E5BKIY6/X4
	ENpDrT6uC9QiQXnNmoEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZAfP-0000kQ-Rc; Tue, 18 Dec 2018 08:23:51 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZAfL-0000Vz-6X
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 08:23:49 +0000
Received: by mail-wr1-x444.google.com with SMTP id t6so14726786wrr.12
 for <linux-riscv@lists.infradead.org>; Tue, 18 Dec 2018 00:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=juX3lDoH7A5it30MWKVRBo5WuBz2pCJl9gskcMHPCiM=;
 b=lajsVGxxldceawDDkpcCgG3vh5Kpr8QYrp1CSkqFZQcpoHILBy+P1RhIDX6CcUjQsV
 p1aixERN75JLkdnkCkAA3nfc6sDu6Ex8+cYaDZyQaOf4EZv6mG2ZbjVtoZ8LA9VTkPDu
 5qfUttVFtPRmsBVGMtEDn5c2OWWHACy1dOYCAjz5lMUVKHt9qlHzeSbaHTjx+qbBo7bo
 4HaR+hMJiiaJ6IS/qj8lzRTdtL4RupZphkP8EageH84Bwdey2/xXAdVOL4guo5EvqPoW
 mEI92DpcEEzx2QilSd9kPgv+PP41KkgTdzjnCnffHpMyXBJ3UOQ9DMN0JqVexiDxtl/0
 tmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=juX3lDoH7A5it30MWKVRBo5WuBz2pCJl9gskcMHPCiM=;
 b=Vc0e7h+bsWIH2MycztawxBqEF5eAvzXl7/t1GEnXeo1fN5mDpPnrkO12rVgQoP6r/L
 ShDqFu0QhT735vBqXKkEUeW9hlIWkiBBWfmWZJSFkp/ZotaHHv8m1gVkNfz2/Ztvim8U
 v6iQxNuR3a1CSZWdpd4dfGaSm6c5TOG9i1J+nKWel9R+FTh8efFufTbQzccHvYlzIcsN
 l3iemhNwI7DShQnCQegGcNNINYdRVbfhYjoZOXn8NUqOEHzfb/jcz6PUAoN05IWNGUZv
 xO8jVvIUNne4219JFe/Qdv3AMZ0FuG7Lor8lhvzwdM3ZZ5K+DxQuDXjJAlIqbImh0YQh
 sXQQ==
X-Gm-Message-State: AA+aEWZKfUkgcYd0zn12Pywx//1W07S6US02ZOL+GV14XQxQABX/vU05
 UxmVed5e4oc3vjqhLQ0jfs+sKqA96mNBgMDs9AUH4w==
X-Google-Smtp-Source: AFSGD/VcLx0IctzwMG9izBUpbpgTd2+B4CtHMLVUf4ijkorEm0UGeQcLEyuVZ4XHzQ76K//umv4cbCQKTZgAgwmXxck=
X-Received: by 2002:adf:ee07:: with SMTP id y7mr14178135wrn.187.1545121415078; 
 Tue, 18 Dec 2018 00:23:35 -0800 (PST)
MIME-Version: 1.0
References: <20181126060802.19314-1-anup@brainfault.org>
 <CAAhSdy1danjgviJ2WGGEANQXFkzZzXUdCj+04dZ4eLjcVOt14A@mail.gmail.com>
 <587bbe80f25203e6122dfcc0eadba50b@mailhost.ics.forth.gr>
In-Reply-To: <587bbe80f25203e6122dfcc0eadba50b@mailhost.ics.forth.gr>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Dec 2018 13:53:23 +0530
Message-ID: <CAAhSdy2bxrP0VQui5AzEL5sueDACU9DkCN4h0--aC=8OpYKt8w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Make BSS section as the last section in
 vmlinux.lds.S
To: Nick Kossifidis <mick@ics.forth.gr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_002347_733566_F852A16A 
X-CRM114-Status: GOOD (  18.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBEZWMgMTcsIDIwMTggYXQgNjoyOSBQTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNz
LmZvcnRoLmdyPiB3cm90ZToKPgo+IM6jz4TOuc+CIDIwMTgtMTItMTcgMTE6MzYsIEFudXAgUGF0
ZWwgzq3Os8+BzrHPiM61Ogo+ID4gT24gTW9uLCBOb3YgMjYsIDIwMTggYXQgMTE6NDIgQU0gQW51
cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiA+IHdyb3RlOgo+ID4+Cj4gPj4gVGhlIG9i
amNvcHkgb25seSBlbWl0cyBsb2FkYWJsZSBzZWN0aW9ucyB3aGVuIGNyZWF0aW5nIGZsYXQga2Vy
bmVsCj4gPj4gSW1hZ2UuIFRvIGhhdmUgbWluaW1hbCBwb3NzaWJsZSBzaXplIG9mIGZsYXQga2Vy
bmVsIEltYWdlLCB3ZSBzaG91bGQKPiA+PiBoYXZlIGFsbCBub24tbG9hZGFibGUgc2VjdGlvbnMg
YWZ0ZXIgbG9hZGFibGUgc2VjdGlvbnMuCj4gPj4KPiA+PiBDdXJyZW50bHksIGV4ZWNwdGlvbiB0
YWJsZSBzZWN0aW9uIChsb2FkYWJsZSBzZWN0aW9uKSBpcyBhZnRlciBCU1MKPiA+PiBzZWN0aW9u
IChub24tbG9hZGFibGUgc2VjdGlvbikgaW4gdGhlIFJJU0MtViB2bWxpbnV4Lmxkcy5TLiBUaGlz
Cj4gPj4gaXMgbm90IG9wdGltYWwgZm9yIGhhdmluZyBtaW5pbWFsIGZsYXQga2VybmVsIEltYWdl
IHNpemUgaGVuY2UgdGhpcwo+ID4+IHBhdGNoIG1ha2VzIEJTUyBzZWN0aW9uIGFzIHRoZSBsYXN0
IHNlY3Rpb24gaW4gUklTQy1WIHZtbGludXgubGRzLlMuCj4gPj4KPiA+PiBJbiBhZGRpdGlvbiwg
d2UgbWFrZSBCU1Mgc2VjdGlvbiBhbGlnbmVkIHRvIDE2Ynl0ZSBpbnN0ZWFkIG9mIFBBR0UKPiA+
PiBhbGlnbmVkIHdoaWNoIGZ1cnRoZXIgcmVkdWNlcyBmbGF0IGtlcm5lbCBJbWFnZSBzaXplIGJ5
IGZldyBLQnMuCj4gPj4KPiA+PiBUaGUgZmxhdCBrZXJuZWwgSW1hZ2Ugc2l6ZSBvZiBMaW51eC00
LjIwLXJjNCB1c2luZyBHQ0MgOC4yLjAgaXMKPiA+PiA4ODE5OTgwIGJ5dGVzIHdpdGggY3VycmVu
dCBSSVNDLVYgdm1saW51eC5sZHMuUyBhbmQgaXQgcmVkdWNlcyB0bwo+ID4+IDc5OTE3NDAgYnl0
ZXMgd2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQgdXNpbmcgR0NDIDguMi4wLiBJbiBzdW1tYXJ5LAo+
ID4+IHRoaXMgcGF0Y2ggcmVkdWNlcyBMaW51eC00LjIwLXJjNCBmbGF0IGtlcm5lbCBJbWFnZSBz
aXplIGJ5IDgwOSBLQi4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+Cj4gPj4gLS0tCj4gPj4gIGFyY2gvcmlzY3Yva2VybmVsL3ZtbGludXgu
bGRzLlMgfCA0ICsrLS0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92bWxp
bnV4Lmxkcy5TCj4gPj4gYi9hcmNoL3Jpc2N2L2tlcm5lbC92bWxpbnV4Lmxkcy5TCj4gPj4gaW5k
ZXggNjVkZjFkZmRjMzAzLi5jYzk5ZWVkNDQ5MzEgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvdm1saW51eC5sZHMuUwo+ID4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZtbGlu
dXgubGRzLlMKPiA+PiBAQCAtNzQsOCArNzQsNiBAQCBTRUNUSU9OUwo+ID4+ICAgICAgICAgICAg
ICAgICAqKC5zYnNzKikKPiA+PiAgICAgICAgIH0KPiA+Pgo+ID4+IC0gICAgICAgQlNTX1NFQ1RJ
T04oUEFHRV9TSVpFLCBQQUdFX1NJWkUsIDApCj4gPj4gLQo+ID4+ICAgICAgICAgRVhDRVBUSU9O
X1RBQkxFKDB4MTApCj4gPj4gICAgICAgICBOT1RFUwo+ID4+Cj4gPj4gQEAgLTgzLDYgKzgxLDgg
QEAgU0VDVElPTlMKPiA+PiAgICAgICAgICAgICAgICAgKigucmVsLmR5biopCj4gPj4gICAgICAg
ICB9Cj4gPj4KPiA+PiArICAgICAgIEJTU19TRUNUSU9OKDB4MTAsIDB4MTAsIDB4MTApCj4gPj4g
Kwo+ID4+ICAgICAgICAgX2VuZCA9IC47Cj4gPj4KPiA+PiAgICAgICAgIFNUQUJTX0RFQlVHCj4g
Pj4gLS0KPiA+PiAyLjE3LjEKPiA+Pgo+ID4KPiA+IEhpIEFsbCwKPiA+Cj4gPiBBbnkgY29tbWVu
dCBvbiB0aGlzIHBhdGNoPwo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBBbnVwCj4gPgo+Cj4gSnVzdCBh
IG5vdGUgb24gY29kaW5nIHN0eWxlLCB5b3Ugc2hvdWxkIGJlIHVzaW5nIGEgbWFjcm8gaW5zdGVh
ZCBvZiAweDEwCj4gc28gdGhhdCB0aG9zZSB3aG8gcmVhZCB0aGUgY29kZSBjYW4gdW5kZXJzdGFu
ZCB3aGF0IGl0IGlzIGFuZCBhbHNvIGEgZmV3Cj4gY29tbWVudHMgc2luY2Ugc2VhcmNoaW5nIHRo
cm91Z2ggdGhlIGNvbW1pdCBsb2dzIHRvIHVuZGVyc3RhbmQgd2h5IHlvdQo+IHVzZWQgaXQgaXNu
J3Qgb3B0aW1hbC4KClJJU0MtViBjYW4gc3VwcG9ydCAzMmJpdCwgNjRiaXQgYW5kIDEyOGJpdCBt
YWNoaW5lLXdvcmQgc2l6ZXMuCgpUaGUgMHgxMCBudW1iZXIgaXMgdGhlIG1hY2hpbmUtd29yZCBz
aXplIGluIGJ5dGVzIGZvciAxMjhiaXQKUklTQy1WIENQVSAoaS5lLiBtYXhpbXVtIG1hY2hpbmUt
d29yZCBzaXplKS4KCkkgd2lsbCBhZGQgYSBtYWNybyBNQVhfQllURVNfUEVSX0xPTkcgaW4gdm1s
aW51eC5sZHMuUyBhbmQKdXNlIGl0IGluLXBsYWNlIG9mIDB4MTAKClJlZ2FyZHMsCkFudXAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
