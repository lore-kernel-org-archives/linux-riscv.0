Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FF4C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:45:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6446C20675
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:45:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t4EB36UZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6446C20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I8V1A4LLGVomvlKP8FQGYQO6VyA3zjSunZU1v86apOk=; b=t4EB36UZpt8Os7SylW/C7ep28
	MB3F8ZmxL1NQVwFZhRSNksjyEebsI9n3fQJICHWongbfTCciJxh8atjVWCrETq3+p6ok8HFyKGvQ9
	WmZ6i6jOCKzcmRY6jk8LaVGDIfn8ZsuNhszySU44gXyHGOn631yQr7yZssOtlpthU1J55Y4eLvczm
	mHwE3roYEjcVDNCDQnSNdfkIGcgeOhmnigPPHvq8qybrPdh2NMwyaahxm/M66RHIhjLO3TrNFNqyV
	rxc+BGvpDdclqrnFUIhwuMUlFFymtRd1aKO27oLAkF9XNbeG/62sdN/wZRZfvfz0sWTRtJe+gLvm/
	CY6mGb5aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqGZk-0000JB-Q7; Tue, 30 Jun 2020 13:45:28 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqGZi-0000IY-R1
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 13:45:27 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EBCFFB5F6;
 Tue, 30 Jun 2020 13:45:25 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: syzkaller on risc-v
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmtuysn227.fsf@suse.de>
 <CACT4Y+Y8=0m+Xku_+kQYuiiABgFUDzHBEqUK_FNGs8=f9NGZng@mail.gmail.com>
 <mvm4kqsn0e7.fsf@suse.de>
 <CACT4Y+askdjyUjw=D6yqnOHy8n7N3h7QFs8KjvkU5DOHGY66Zg@mail.gmail.com>
X-Yow: Feel th' WHIRLING BUFFERS buffing away all that stress...
 Years of ROAD TAR gently washing away...
Date: Tue, 30 Jun 2020 15:45:25 +0200
In-Reply-To: <CACT4Y+askdjyUjw=D6yqnOHy8n7N3h7QFs8KjvkU5DOHGY66Zg@mail.gmail.com>
 (Dmitry Vyukov's message of "Tue, 30 Jun 2020 15:40:18 +0200")
Message-ID: <mvmv9j8llai.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gSnVuIDMwIDIwMjAsIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cgo+IE9uIFR1ZSwgSnVuIDMwLCAy
MDIwIGF0IDM6MzMgUE0gQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBzdXNlLmRlPiB3cm90ZToKPj4K
Pj4gT24gSnVuIDMwIDIwMjAsIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cj4+Cj4+ID4gT24gVHVlLCBK
dW4gMzAsIDIwMjAgYXQgMzoxNCBQTSBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQHN1c2UuZGU+IHdy
b3RlOgo+PiA+Pgo+PiA+PiBPbiBKdW4gMzAgMjAyMCwgRG1pdHJ5IFZ5dWtvdiB3cm90ZToKPj4g
Pj4KPj4gPj4gPiBLQVNBTiB3b3VsZCBiZSBhIHByZXJlcXVpc2l0ZSBmb3IgdGVzdGluZyByaXNj
LXYgb24gc3l6Ym90Lgo+PiA+Pgo+PiA+PiBZb3UgbmVlZCB0byBpbXBsZW1lbnQgdGhlIEdDQyBz
dXBwb3J0IGZpcnN0Lgo+PiA+Cj4+ID4gSW50ZXJlc3RpbmcuIEJqw7ZybiBjbGFpbWVkIEtBU0FO
IHdvcmtzIGFscmVhZHkuICBBbmQgdGhlcmUgaXM6Cj4+ID4KPj4gPiBjb21taXQgOGFkOGI3Mjcy
MWQwZjA3ZmEwMmRiZTcxZjkwMTc0M2Y5YzcxYzhlNgo+PiA+IEF1dGhvcjogTmljayBIdQo+PiA+
IERhdGU6ICAgTW9uIEphbiA2IDEwOjM4OjMyIDIwMjAgLTA4MDAKPj4gPiAgICAgcmlzY3Y6IEFk
ZCBLQVNBTiBzdXBwb3J0Cj4+ID4KPj4gPiBJcyB0aGVyZSBhbnkga25vd24gaXNzdWUgd2l0aCBn
Y2M/Cj4+Cj4+IGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTkx
NDQxCj4+Cj4+ICQgZ2NjIC1mc2FuaXRpemU9a2VybmVsLWFkZHJlc3MgLXhjIC0gPC9kZXYvbnVs
bAo+PiBjYzE6IHdhcm5pbmc6IOKAmC1mc2FuaXRpemU9YWRkcmVzc+KAmSBhbmQg4oCYLWZzYW5p
dGl6ZT1rZXJuZWwtYWRkcmVzc+KAmSBhcmUgbm90IHN1cHBvcnRlZCBmb3IgdGhpcyB0YXJnZXQK
Pgo+IGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTkxNDQxI2Mz
Cj4gRml4ZWQgOykKClllcy4gIFdoYXQncyB5b3VyIHBvaW50PwoKQW5kcmVhcy4KCi0tIApBbmRy
ZWFzIFNjaHdhYiwgU1VTRSBMYWJzLCBzY2h3YWJAc3VzZS5kZQpHUEcgS2V5IGZpbmdlcnByaW50
ID0gMDE5NiBCQUQ4IDFDRTkgMTk3MCBGNEJFICAxNzQ4IEU0RDQgODhFMyAwRUVBIEI5RDcKIkFu
ZCBub3cgZm9yIHNvbWV0aGluZyBjb21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
