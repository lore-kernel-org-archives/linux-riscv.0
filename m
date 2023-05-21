Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E079EC77B7C
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 09:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VrvTq37TtN5w3w9ngDKjn+kdBNK/IGrpoiD87DUWUsc=; b=aEtz9/es4gE6uV
	yWxwaVNhfgTaZ3n6q9NBY/MthJiMmLBmHdI2IiUGG8/cyVIgzTS/3l3paKD3MBFK2sqilHgL6KSVH
	NUdf9waQXY4Ti2RKrWAJ4Jnv7bq0x92B+75/EeLezXikl9k11jW12axuyx5ZbxxrCBTW6Cmhx113j
	y1rv5py+gVcQAz784h+P+cWqjq5Ph+Q6votOnKzsBcPoBRXQc1bQM9xDIBv9ktHY5gg/nttJK5Oyc
	p8r9AKqNbKU0OiPLK3GyqYgzafQ2ERVVpDYk3ol4g+qORECTu9/VlZlTADTFPJbAWUGpmW8+PhuHa
	pBpSMYQPdKwNoj0zgqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fAB-003U42-2i;
	Sun, 21 May 2023 09:15:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fA8-003U2P-1Q
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 09:15:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ED86960C8C;
	Sun, 21 May 2023 09:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED62C433EF;
	Sun, 21 May 2023 09:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684660532;
	bh=J6QGR+R9nb0MwoXrY/wVlgZDi2AoSc1og9Jf61EJyDc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YVPYT6UHU0h3BbC7xXT3xJzABOj9G5nhlyVQ96KFJ6bCDcF+a0srZJb7Egs0sxAQf
	 o9IrjNXTV6kNdB9CcZddF4aNPVGZP3gkBSs1zmS1yWBVzDCqAnv2Y+1KlGn0R+Ps88
	 RorQaM2o2TMrWa93tO3Ahwoh7ol3IvMAW1taijxPc2tps0W0Eyz8m/xWiqe4MsY2uC
	 jN7aQSIRMz1ENygz/CLpJzSK9llKsaiLK48NAwY7v9fmhTpl+BELcfYKD6U+EFgIGx
	 ogJgLpod1Mhgb8GxEEYcM0D7M0yLakjf5TDyzfuk2Hd7GUo+Xt472eQLaLeCPNvvjb
	 /7AkIvUWlWlQA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: David Hildenbrand <david@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Anshuman
 Khandual <anshuman.khandual@arm.com>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Oscar Salvador <osalvador@suse.de>,
 virtualization@lists.linux-foundation.org, linux@rivosinc.com, Alexandre
 Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH 0/7] riscv: Memory Hot(Un)Plug support
In-Reply-To: <87zg62eqm4.fsf@all.your.base.are.belong.to.us>
References: <20230512145737.985671-1-bjorn@kernel.org>
 <9aa7d030-19b5-01df-70c0-86d8d6ab86a6@redhat.com>
 <87zg62eqm4.fsf@all.your.base.are.belong.to.us>
Date: Sun, 21 May 2023 11:15:29 +0200
Message-ID: <87lehikpu6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_021536_519181_242AE59F 
X-CRM114-Status: GOOD (  11.75  )
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

SGkgRGF2aWQgYW5kIEFuc2h1bWFuIQoKQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4g
d3JpdGVzOgoKPiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JpdGVzOgo+
Cj4+IE9uIDEyLjA1LjIzIDE2OjU3LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+Pj4gRnJvbTogQmrD
tnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+Pj4gCj4+PiBNZW1vcnkgSG90KFVuKVBs
dWcgc3VwcG9ydCBmb3IgdGhlIFJJU0MtViBwb3J0Cj4+PiA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09Cj4KPiBbLi4uXQo+Cj4+Cj4+IENvb2wgc3R1ZmYhIEkn
bSBmYWlybHkgYnVzeSByaWdodCBub3csIHNvIHNvbWUgaGlnaC1sZXZlbCBxdWVzdGlvbnMgdXBm
cm9udDoKPgo+IE5vIHdvcnJpZXMsIGFuZCBubyBydXNoISBJJ2Qgc2F5IHRoZSB2MSBzZXJpZXMg
d2FzIG1haW5seSBmb3IgdGhlIFJJU0MtVgo+IGZvbGtzLCBhbmQgSSd2ZSBnb3QgdG9ucyBvZiAo
b2ZmbGluZSkgY29tbWVudHMgZnJvbSBBbGV4IC0tIGFuZCB3aXRoCj4geW91ciBjb21tZW50cyBi
ZWxvdyBzb21lIG1vcmUgZGV0YWlscyB0byBmaWd1cmUgb3V0LgoKT25lIG9mIHRoZSBtYWpvciBp
c3N1ZXMgd2l0aCBteSB2MSBwYXRjaCBpcyBhcm91bmQgaW5pdF9tbSBwYWdlIHRhYmxlCnN5bmNo
cm9uaXphdGlvbiwgYW5kIHRoYXQnbGwgYmUgcGFydCBvZiB0aGUgdjIuCgpJJ3ZlIG5vdGljZWQg
dGhlcmUncyBhIHF1aXRlIGEgZGlmZmVyZW5jZSBiZXR3ZWVuIHg4Ni02NCBhbmQgYXJtNjQgaW4K
dGVybXMgb2YgbG9ja2luZywgd2hlbiB1cGRhdGluZyAoYWRkL3JlbW92ZSkgdGhlIGluaXRfbW0g
dGFibGUuIHg4Ni02NAp1c2VzIHRoZSB1c3VhbCBwYWdlIHRhYmxlIGxvY2tpbmcgbWVjaGFuaXNt
cyAodXNlZCBieSB0aGUgZ2VuZXJpYwprZXJuZWwgZnVuY3Rpb25zKSwgd2hlcmVhcyBhcm02NCBk
b2VzIG5vdC4KCkhvdyBkb2VzIGFybTY0IG1hbmFnZSB0byBtaXggdGhlICJsb2NrLWxlc3MiIHVw
ZGF0ZXMgKFJFQUQvV1JJVEVfT05DRSwKYW5kIGZlbmNlcyBpbiBzZXRfcD9kK2ZyaWVuZHMpLCB3
aXRoIHRoZSBnZW5lcmljIGtlcm5lbCBvbmVzIHRoYXQgdXNlcwp0aGUgcmVndWxhciBwYWdlIGxv
Y2tpbmcgbWVjaGFuaXNtPwoKSSdtIG9idmlvdXNseSBtaXNzaW5nIHNvbWV0aGluZyBhYm91dCB0
aGUgbG9ja2luZyBydWxlcyBmb3IgbWVtb3J5IGhvdAphZGQvcmVtb3ZlLi4uIEkndmUgYmVlbiBy
ZWFkaW5nIHRoZSBhcm02NCBtZW1vcnkgaG90IGFkZC9yZW1vdmUKc2VyaWVzLCBidXQgbm9uZSB0
aGUgd2lzZXIhIDstKQoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
