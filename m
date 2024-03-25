Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE1CC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3VbF7S/DVc9Q14+RKTxKArwhtVo0o1AqxnJtp+jtQZg=; b=Btrf/2R9roL+T3
	O4raIV36i2LMpk0M6x/UuSb9cgGPQ3t+UCWj/LE4TWb1kh+wVaVHPujOTY4K+Iug6KCffhO7Fs82g
	SNsATUAxQCLMDMYFOLLz3f6Jxpm3cbq6aQVttKTxEcko2c0UN3mmTUzVT5gXJ1AsWx5y0iW9yBP/Y
	vLCizMMXSf+lgS91lE+pAVGde0ID44XMBdl9nlY5D3foX391cSUW5+w3UuJDETy9FhGHrii6LlFPl
	Uzw12JfrZ5Q5EUecC78Etp85D00NeHK0+JSgEwTz1De09VTwNtBIwZZloPvKQsdU5elNlGUfRvJFt
	+k6pV5OVHLH5zZaruvKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rogwi-0000000GXqJ-0EpB;
	Mon, 25 Mar 2024 09:48:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rogwd-0000000GXnj-0DGY
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 09:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711360121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BzvHsR0swPhNezye8rUpRIe+AmkradciiszFVdBH2qI=;
	b=d5QAGzkcFVgfNPW1CO0oLPlhmxGApS7hScJ1cLqq6shPh9CB1aGymZAPlr5DzlZwPD5+xp
	Gq5w9Iph9qjmesRKdP5Xe57/g8T80D7rcjalpl3kRP7o2ljlY/77P9AcXHokfr03tzhcfG
	PdcgfvMh0EcJg3d8jU5382ubAFA9ES8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-81-sGBrjBOZPjWGzkRUL_JyGQ-1; Mon,
 25 Mar 2024 05:48:36 -0400
X-MC-Unique: sGBrjBOZPjWGzkRUL_JyGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B0273C0BE29;
	Mon, 25 Mar 2024 09:48:35 +0000 (UTC)
Received: from localhost (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4782E112131D;
	Mon, 25 Mar 2024 09:48:25 +0000 (UTC)
Date: Mon, 25 Mar 2024 17:48:18 +0800
From: Baoquan He <bhe@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev, akpm@linux-foundation.org,
	ebiederm@xmission.com, hbathini@linux.ibm.com, piliu@redhat.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH linux-next v3 02/14] crash: split vmcoreinfo exporting
 code out from crash_core.c
Message-ID: <ZgFIYuYULrgF1tFG@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-3-bhe@redhat.com>
 <CAMuHMdVxKEGYj9C1=P-493vcrN_HmLNx8gS6i1nheXO9gH46oA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVxKEGYj9C1=P-493vcrN_HmLNx8gS6i1nheXO9gH46oA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_024843_232322_963D2F8B 
X-CRM114-Status: GOOD (  19.38  )
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

T24gMDMvMjUvMjQgYXQgMDk6MjRhbSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIEJh
b3F1YW4sCj4gCj4gT24gV2VkLCBKYW4gMjQsIDIwMjQgYXQgNjoxM+KAr0FNIEJhb3F1YW4gSGUg
PGJoZUByZWRoYXQuY29tPiB3cm90ZToKPiA+IE5vdyBtb3ZlIHRoZSByZWxldmFudCBjb2RlcyBp
bnRvIHNlcGFyYXRlIGZpbGVzOgo+ID4ga2VybmVsL2NyYXNoX3Jlc2VydmUuYywgaW5jbHVkZS9s
aW51eC9jcmFzaF9yZXNlcnZlLmguCj4gPgo+ID4gQW5kIGFkZCBjb25maWcgaXRlbSBDUkFTSF9S
RVNFUlZFIHRvIGNvbnRyb2wgaXRzIGVuYWJsaW5nLgo+ID4KPiA+IEFuZCBhbHNvIHVwZGF0ZSB0
aGUgb2xkIGlmZGVmZmVyeSBvZiBDT05GSUdfQ1JBU0hfQ09SRSwgaW5jbHVkaW5nIG9mCj4gPiA8
bGludXgvY3Jhc2hfY29yZS5oPiBhbmQgY29uZmlnIGl0ZW0gZGVwZW5kZW5jeSBvbiBDUkFTSF9D
T1JFCj4gPiBhY2NvcmRpbmdseS4KPiA+Cj4gPiBBbmQgYWxzbyBkbyByZW5hbWluZyBhcyBmb2xs
b3dzOgo+ID4gIC0gYXJjaC94eHgva2VybmVsL3tjcmFzaF9jb3JlLmMgPT4gdm1jb3JlX2luZm8u
Y30KPiA+IGJlY2F1c2UgdGhleSBhcmUgb25seSByZWxhdGVkIHRvIHZtY29yZWluZm8gZXhwb3J0
aW5nIG9uIHg4NiwgYXJtNjQsCj4gPiByaXNjdi4KPiA+Cj4gPiBBbmQgYWxzbyBSZW1vdmUgY29u
ZmlnIGl0ZW0gQ1JBU0hfQ09SRSwgYW5kIHJlbHkgb24gQ09ORklHX0tFWEVDX0NPUkUgdG8KPiA+
IGRlY2lkZSBpZiBidWlsZCBpbiBjcmFzaF9jb3JlLmMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
QmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+IHYyLT52MzoKPiA+IC0gVGhl
cmUncyBjb25mbGljdCB3aGVuIHJlYmFzaW5nIHRvIGxpbnV4LW5leHQgaW4ga2VybmVsL2NyYXNo
X2NvcmUuYwo+ID4gICBiZWNhdXNlIG9mIGJlbG93IGNvbW1pdHMgZnJvbSBVbGFkemlzbGF1Ogo+
ID4gICBjb21taXQgNjk5ZDkzNTE4MjJlICgibW06IHZtYWxsb2M6IEZpeCBhIHdhcm5pbmcgaW4g
dGhlIGNyYXNoX3NhdmVfdm1jb3JlaW5mb19pbml0KCkiKQo+ID4gICBjb21taXQgNWY0YzBjMWUy
YTUxICg6bW0vdm1hbGxvYzogcmVtb3ZlIHZtYXBfYXJlYV9saXN0IikKPiAKPiBUaGFua3MgZm9y
IHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQgNDQzY2JhZjllMmZkYmVmNwo+ICgiY3Jh
c2g6IHNwbGl0IHZtY29yZWluZm8gZXhwb3J0aW5nIGNvZGUgb3V0IGZyb20KPiBjcmFzaF9jb3Jl
LmMiKSBpbiB2Ni45LXJjMS4KPiAKPiBBZnRlciB0aGlzLCB0aGVyZSBhcmUgc3RpbGwgdHdvIHJl
ZmVyZW5jZXMgbGVmdCB0byBDUkFTSF9DT1JFOgo+IAo+ICAgMS4gRG9jdW1lbnRhdGlvbi9hZG1p
bi1ndWlkZS9rZHVtcC9rZHVtcC5yc3Q6Cj4gCj4gICAgICAgICAgU3Vic2VxdWVudGx5LCBDUkFT
SF9DT1JFIGlzIHNlbGVjdGVkIGJ5IEtFWEVDX0NPUkU6Ogo+IAo+ICAgMi4gYXJjaC9sb29uZ2Fy
Y2gvS2NvbmZpZwo+IAo+ICAgICAgICAgIGNvbmZpZyBBUkNIX0hBU19HRU5FUklDX0NSQVNIS0VS
TkVMX1JFU0VSVkFUSU9OCj4gICAgICAgICAgICAgIGRlZl9ib29sIENSQVNIX0NPUkUKClN1cmUs
IHdpbGwgcG9zdCBwYXRjaCB0byBjbGVhbiB0aGVtIHVwLiBUaGFua3MgYSBsb3QuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
