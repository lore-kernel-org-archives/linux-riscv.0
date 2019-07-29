Return-Path: <SRS0=e5eF=V2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71A5C41514
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2019 14:40:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A6B20578
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2019 14:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ANUEmg08"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1A6B20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yfoy/KZPkKvlozXNrmyZpoHX8gFvnE+QiwMCgxKlNU=; b=ANUEmg08tomVS5
	ki4SqW1uMGDv8qBnTeqWy4sXiRd+xod6oO4gDOD5OYuGt//ayl+dlqVZ1ELuXzmECqxUldahweOsB
	+USNRHF+eKxUxAMskcSnQ0W895jsyG3DZlNSppCqVJDV31OY+CF8wCa97d7Xdqz5QieKHrEiTSqou
	qgLp5haFXYxPRGb9v2KwUNXatcRTvaK3CUr2ij4G76Szv1Fkh+/5WtytLri84kbulTo83AmQZMF+A
	9WY1FyzsFVyvoUukT3qDFiJaf4H2QwsadrrRKsTxlT/LtjyomWo9Rj7r5H9ZW0fVHU4qEAS4+O96r
	/T4f1pqk0aPoXHBE97NQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs6pb-0003Cb-L4; Mon, 29 Jul 2019 14:40:55 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs6pY-00033F-Ut
 for linux-riscv@lists.infradead.org; Mon, 29 Jul 2019 14:40:54 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5294BACA8;
 Mon, 29 Jul 2019 14:40:51 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [RFC PATCH 13/16] RISC-V: KVM: Add timer functionality
References: <20190729115544.17895-1-anup.patel@wdc.com>
 <20190729115544.17895-14-anup.patel@wdc.com>
X-Yow: HOORAY, Ronald!!  Now YOU can marry LINDA RONSTADT too!!
Date: Mon, 29 Jul 2019 16:40:50 +0200
In-Reply-To: <20190729115544.17895-14-anup.patel@wdc.com> (Anup Patel's
 message of "Mon, 29 Jul 2019 11:57:42 +0000")
Message-ID: <mvmpnlsc39p.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_074053_193342_3722459A 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Radim K <rkrcmar@redhat.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gSnVsIDI5IDIwMTksIEFudXAgUGF0ZWwgPEFudXAuUGF0ZWxAd2RjLmNvbT4gd3JvdGU6Cgo+
IEZyb206IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPgo+Cj4gVGhlIFJJU0MtViBo
eXBlcnZpc29yIHNwZWNpZmljYXRpb24gZG9lc24ndCBoYXZlIGFueSB2aXJ0dWFsIHRpbWVyCj4g
ZmVhdHVyZS4KPgo+IER1ZSB0byB0aGlzLCB0aGUgZ3Vlc3QgVkNQVSB0aW1lciB3aWxsIGJlIHBy
b2dyYW1tZWQgdmlhIFNCSSBjYWxscy4KPiBUaGUgaG9zdCB3aWxsIHVzZSBhIHNlcGFyYXRlIGhy
dGltZXIgZXZlbnQgZm9yIGVhY2ggZ3Vlc3QgVkNQVSB0bwo+IHByb3ZpZGUgdGltZXIgZnVuY3Rp
b25hbGl0eS4gV2UgaW5qZWN0IGEgdmlydHVhbCB0aW1lciBpbnRlcnJ1cHQgdG8KPiB0aGUgZ3Vl
c3QgVkNQVSB3aGVuZXZlciB0aGUgZ3Vlc3QgVkNQVSBocnRpbWVyIGV2ZW50IGV4cGlyZXMuCj4K
PiBUaGUgZm9sbG93aW5nIGZlYXR1cmVzIGFyZSBub3Qgc3VwcG9ydGVkIHlldCBhbmQgd2lsbCBi
ZSBhZGRlZCBpbgo+IGZ1dHVyZToKPiAxLiBBIHRpbWUgb2Zmc2V0IHRvIGFkanVzdCBndWVzdCB0
aW1lIGZyb20gaG9zdCB0aW1lCj4gMi4gQSBzYXZlZCBuZXh0IGV2ZW50IGluIGd1ZXN0IHZjcHUg
Zm9yIHZtIG1pZ3JhdGlvbgoKSSdtIGdldHRpbmcgdGhpcyBlcnJvcjoKCkluIGZpbGUgaW5jbHVk
ZWQgZnJvbSA8Y29tbWFuZC1saW5lPjoKLi9pbmNsdWRlL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2
Lmg6MTI6MzA6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJh1MzLigJkKICAgMTIgfCB2b2lk
IHJpc2N2X2NzX2dldF9tdWx0X3NoaWZ0KHUzMiAqbXVsdCwgdTMyICpzaGlmdCk7CiAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn4KLi9pbmNsdWRlL2Nsb2Nrc291cmNlL3Rp
bWVyLXJpc2N2Lmg6MTI6NDE6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJh1MzLigJkKICAg
MTIgfCB2b2lkIHJpc2N2X2NzX2dldF9tdWx0X3NoaWZ0KHUzMiAqbXVsdCwgdTMyICpzaGlmdCk7
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fgptYWtl
WzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MzAxOiBpbmNsdWRlL2Nsb2Nrc291cmNl
L3RpbWVyLXJpc2N2Lmguc10gRXJyb3IgMQoKQW5kcmVhcy4KCi0tIApBbmRyZWFzIFNjaHdhYiwg
U1VTRSBMYWJzLCBzY2h3YWJAc3VzZS5kZQpHUEcgS2V5IGZpbmdlcnByaW50ID0gMDE5NiBCQUQ4
IDFDRTkgMTk3MCBGNEJFICAxNzQ4IEU0RDQgODhFMyAwRUVBIEI5RDcKIkFuZCBub3cgZm9yIHNv
bWV0aGluZyBjb21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
