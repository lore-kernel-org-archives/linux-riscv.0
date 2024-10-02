Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C711CF318F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 03:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Wi2YbYUQSZ2gGRih1WCTIhXIcZgHomjadC8HTx0Fls=; b=bzNKmxOkBbQMGf
	KCiljHbiyllBg85eclN23GmeJfllmDhw9Z/3A1n+izdMEzs+wt18+ohTMSJ3DFZvm9TMhSDnk4MBm
	VH6ZMCguxXg1ubhhOvI370OgI74jgD0czvRv6yYhsX879TE0a34l9TM9+a9EQpbqJQLjoMZ77BvM6
	u5rjK3KVdN/eAVMdZcc8FpNgBF4O7cLSsA87cwpITT/oT9Drqd/w19x+KGB5mGnULQNHvh7nSefbq
	TDF6tpTjq9ZAtPdaesX7Q6BHyfw2/CEsGaWt9d/D9NHqCXPhixYNSvlwd3EPvhmcyNVAiydgPGOOE
	gqqHjJspSOZb9gSBoaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svpcT-00000004eiM-2Ykw;
	Wed, 02 Oct 2024 03:01:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svocq-00000004aS9-3AlZ
	for linux-riscv@bombadil.infradead.org;
	Wed, 02 Oct 2024 01:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KdJOFRftMX7616HFUeMGMx6C5isLo6aifjc5ABN1D+Y=; b=kiBQjruRsYi1r06NxPkNxiwzY1
	dct3TmCgePA5TTTmgkpfqEf0ST14kxwmpOm+VUCqLkkWDU2y9coKccAzv7hfzlqXc7uaz2H4ZXMCP
	Geif6sdyul3TPyf6IuVnw/lf+AxRq94+3m67N2B3iZRVuA7M9U8+ZMgCApLHMoYA1nKvHYanL9Z62
	SuLXepxqOMriFAImN3sWKlPsHt4gE8nXdu7RogsoKFEklkpl51vzmaP/kuZqOP91FW9FZK83H+Tdx
	J7rxOhqvOhRSZPRZc7ofW6YZR6IUAaJkiPw5hPBsyePCvUGiOcOeK7WE18dBumOEZlHCA1rH8AIWt
	dzPHha6g==;
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svocm-00000003P4j-1LjG
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 01:57:59 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3e03e9d1f8dso3754217b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 18:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1727834270; x=1728439070; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdJOFRftMX7616HFUeMGMx6C5isLo6aifjc5ABN1D+Y=;
        b=keYI8z78jRGB7utYPqrWjQwT31K/WpfTkGZ8nw9qPAZpCCJhqKCd8Ae9K6gc4VklE2
         mpyyl4C0yj0ifMjuBI5pRf+9YLkkWG10WeB2glOS2ZHRUDDjZIB0EOdOLpH0xktN7sCw
         3mpUd8X+GL1csSINOX0I3ADYSFg5YIW4OuPObzrRZBt7vRzbtniTwDT2OwXmSEjKnEIq
         RrufjH1H2kx+SR7n03lOnNEKukQijzfieT2o9r8i75iDNQQp5bxpqr7BsCp47XjjQwIj
         qrYMdnzldFEI/2JXS35vEQxLmwB8u2B/d+EkjCSykuphBYyGqnlmo/fF++7Cp8Ji31/Z
         toyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727834270; x=1728439070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdJOFRftMX7616HFUeMGMx6C5isLo6aifjc5ABN1D+Y=;
        b=F3S6dWe0QPzZji/zS+nX7mMng6UnLE5rGv8TbdvXoVNIDclVyvNdIsPYkMmVp4/2hf
         o/OfVuvKzEde7mbD7zEICKmK91N/gR9bqBIbUXAbg3xWkYSl068NFkpBnd3NJWXQap0H
         hroHLAOItlQXN3DWN3aMfPycdioJgY/R8kNRXtmX8Aoh+5KAEAYuhEvGkkn6ZuCv1eA8
         Lz9BpGpXn0ufJjgBDXInPqpOE81gkX3th6H0R90mq8bYZaHE1Q2vfs6zF0M8xOOgUIcP
         pVG2PZ3R3/1bEwA8NRFxn6g7bK510NKiu6AuNJwi6VM/IWQpQC91IPVyTA+7ffoiZ+rF
         +gTw==
X-Forwarded-Encrypted: i=1; AJvYcCV1cv4n4YzJzXMyPWMqYF+4nW1nA6RxdoDGDktnAm7ziADViXnOkWT5+6Ag2eaCzlwNAaLmxCusgbunpw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz49ttl/W+olGO8FAvzLJ0gIHri8vwDxFSNoPchR87Rtx6g8lh8
	nR0NVW4H4f+HKBvOBYKf4yQ/pLYKfGYXZCzF1TwRtn20D/ZhyOskW7UG2o7fKjEpJ8G65YtBycz
	sPf5nFfqWOfzj27aPHvHRiXBbmDbEIdTfttinRw==
X-Google-Smtp-Source: AGHT+IHQGLzYJ6BtLhCBkZjzGUX5xoLdK554JSlc8yaQgfMSODKE8d1tGFCYqKy/4Ph0iKu71Skz8tmC30X4F+/DkYc=
X-Received: by 2002:a05:6808:15a1:b0:3e3:9e3f:d0f9 with SMTP id
 5614622812f47-3e3b40fb92fmr1625297b6e.11.1727834270326; Tue, 01 Oct 2024
 18:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240926065422.226518-1-nick.hu@sifive.com> <20240926065422.226518-2-nick.hu@sifive.com>
 <20240926-b96b7164b51b0be0c732235b@orel> <CAKddAkCJt5t_WyMuwSMb8qE4LHWy8GZ4QWZy6ViJvx-p5YBfuQ@mail.gmail.com>
In-Reply-To: <CAKddAkCJt5t_WyMuwSMb8qE4LHWy8GZ4QWZy6ViJvx-p5YBfuQ@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 2 Oct 2024 09:57:39 +0800
Message-ID: <CAKddAkBupSkxWF2hmTDZOvD+-cXeQK8NrUFAz6t3_tXaZZ=fZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] riscv: Add csr_read/write_hi_lo support
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_025756_598693_F0CC7797 
X-CRM114-Status: GOOD (  23.41  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz <sameo@rivosinc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SXQgc2VlbXMgbGlrZSBteSBsYXN0IG1haWwgZGlkbid0IHNlbmQgb3V0IHN1Y2Nlc3NmdWxseS4K
Ck9uIFdlZCwgT2N0IDIsIDIwMjQgYXQgOTo1MuKAr0FNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBIaSBBbmRyZXcKPgo+IE9uIFRodSwgU2VwIDI2LCAyMDI0IGF0IDM6
NTnigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4K
Pj4gT24gVGh1LCBTZXAgMjYsIDIwMjQgYXQgMDI6NTQ6MTZQTSBHTVQsIE5pY2sgSHUgd3JvdGU6
Cj4+ID4gSW4gUlYzMiwgd2UgbWF5IGhhdmUgdGhlIG5lZWQgdG8gcmVhZCBib3RoIGxvdyAzMiBi
aXQgYW5kIGhpZ2ggMzIgYml0IG9mCj4+ID4gdGhlIENTUi4gVGhlcmVmb3JlIGFkZGluZyB0aGUg
Y3NyX3JlYWRfaGlfbG8oKSBhbmQgY3NyX3dyaXRlX2hpX2xvKCkgdG8KPj4gPiBzdXBwb3J0IHN1
Y2ggY2FzZS4KPj4gPgo+PiA+IFN1Z2dlc3RlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KPj4gPiBTdWdnZXN0ZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4+
ID4gLS0tCj4+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggfCAyMiArKysrKysrKysr
KysrKysrKysrKysrCj4+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4+ID4K
Pj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3NyLmgKPj4gPiBpbmRleCAyNTk2Njk5NWRhMDQuLjU0MTk4Mjg0ZWIy
MiAxMDA2NDQKPj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4+ID4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+PiA+IEBAIC01MDEsNiArNTAxLDE3IEBA
Cj4+ID4gICAgICAgX192OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4+ID4gIH0pCj4+ID4KPj4gPiArI2lmIF9fcmlzY3ZfeGxlbiA8IDY0Cj4+
ID4gKyNkZWZpbmUgY3NyX3JlYWRfaGlfbG8oY3NyKSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4+ID4gKyh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4+ID4gKyAgICAgdTMyIGhpID0gY3NyX3JlYWQoY3NyIyNI
KTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ID4gKyAgICAgdTMyIGxvID0gY3Ny
X3JlYWQoY3NyKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ID4gKyAgICAg
bG8gfCAoKHU2NCloaSA8PCAzMik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4+ID4gK30pCj4+ID4gKyNlbHNlCj4+ID4gKyNkZWZpbmUgY3NyX3JlYWRfaGlfbG8gICAgICAg
Y3NyX3JlYWQKPj4gPiArI2VuZGlmCj4+ID4gKwo+PiA+ICAjZGVmaW5lIGNzcl93cml0ZShjc3Is
IHZhbCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiA+ICAoeyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiA+
ICAgICAgIHVuc2lnbmVkIGxvbmcgX192ID0gKHVuc2lnbmVkIGxvbmcpKHZhbCk7ICAgICAgICAg
ICAgICAgXAo+PiA+IEBAIC01MDksNiArNTIwLDE3IEBACj4+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDogIm1lbW9yeSIpOyAgICAgICAgICAgICAgICAgICAgICBcCj4+ID4gIH0pCj4+
ID4KPj4gPiArI2lmIF9fcmlzY3ZfeGxlbiA8IDY0Cj4+ID4gKyNkZWZpbmUgY3NyX3dyaXRlX2hp
X2xvKGNzciwgdmFsKSAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ID4gKyh7ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+
ID4gKyAgICAgdTY0IF92ID0gKHU2NCkodmFsKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4+ID4gKyAgICAgY3NyX3dyaXRlKGNzciMjSCwgKF92KSA+PiAzMik7ICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4+ID4gKyAgICAgY3NyX3dyaXRlKGNzciwgKF92KSk7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ID4gK30pCj4+ID4gKyNlbHNlCj4+
ID4gKyNkZWZpbmUgY3NyX3dyaXRlX2hpX2xvICAgICAgY3NyX3dyaXRlCj4+ID4gKyNlbmRpZgo+
PiA+ICsKPj4gPiAgI2RlZmluZSBjc3JfcmVhZF9zZXQoY3NyLCB2YWwpICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiA+ICAoeyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiA+ICAgICAgIHVuc2lnbmVk
IGxvbmcgX192ID0gKHVuc2lnbmVkIGxvbmcpKHZhbCk7ICAgICAgICAgICAgICAgXAo+PiA+IC0t
Cj4+ID4gMi4zNC4xCj4+ID4KPj4KPj4gSSBrbm93IEkgc3VnZ2VzdGVkIHRoaXMsIGJ1dCBJJ20g
aGF2aW5nIHNlY29uZCB0aG91Z2h0cy4gVGhlIG5pY2UgdGhpbmcKPj4gYWJvdXQgdGhlCj4+Cj4+
ICBjc3Jfd3JpdGUoQ1NSLCAuLi4pOwo+PiAgaWYgKF9fcmlzY3ZfeGxlbiA8IDY0KQo+PiAgICAg
Y3NyX3dyaXRlKENTUkgsIC4uLik7Cj4+Cj4+IHBhdHRlcm4gaXMgdGhhdCBpdCBtYXRjaGVzIHRo
ZSBzcGVjLiBXaXRoIHRoaXMgaGVscGVyIHdlJ2xsIGhhdmUKPj4KPj4gIGNzcl93cml0ZV9oaV9s
byhDU1IsIC4uLik7Cj4+Cj4+IGZvciBib3RoIHJ2MzIgYW5kIHJ2NjQuIFRoYXQgbG9va3Mgb2Rk
IGZvciBydjY0IGFuZCBoaWRlcyB0aGUgaGkgcmVnaXN0ZXIKPj4gYWNjZXNzIGZvciBydjMyLgo+
Pgo+PiBXZSBjb3VsZCBhdm9pZCB0aGUgb2RkbmVzcyBvZiB0aGUgaGVscGVyJ3MgbmFtZSBmb3Ig
cnY2NCBpZiB3ZSBpbnN0ZWFkCj4+IGFkZGVkIGNzcl93cml0ZTMyIGFuZCBjc3Jfd3JpdGU2NCB3
aGljaCBkbyB0aGUgcmlnaHQgdGhpbmdzLCBidXQgdGhhdAo+PiBzdGlsbCBoaWRlcyB0aGUgaGkg
cmVnaXN0ZXIgYWNjZXNzIGZvciBydjMyLiBIaWRpbmcgdGhlIGhpIHJlZ2lzdGVyCj4+IGFjY2Vz
cyBpcyBwcm9iYWJseSBmaW5lLCB0aG91Z2gsIHNpbmNlIHdlIGNhbiBiZSBwcmV0dHkgY2VydGFp
biB0aGF0Cj4+IHRoZSBzcGVjIHdpbGwgcmFyZWx5LCBpZiBldmVyLCBkZXZpYXRlIGZyb20gbmFt
aW5nIGhpZ2ggcmVnaXN0ZXJzIHdpdGgKPj4gdGhlIEggc3VmZml4IGFuZC9vciBub3Qga2VlcCB0
aGUgdXBwZXIgYml0cyBjb21wYXRpYmxlLgo+Pgo+PiBJbiBzdW1tYXJ5LCBJIHRoaW5rIEknbSBp
biBmYXZvciBvZiBqdXN0IGRyb3BwaW5nIHRoaXMgcGF0Y2gsIGtlZXBpbmcKPj4gdGhlIG5vaXN5
LCBidXQgZXhwbGljaXQsIHBhdHRlcm4uIE9yLCBpZiB0aGUgY29uc2Vuc3VzIGlzIHRvIGFkZAo+
PiBoZWxwZXJzLCB0aGVuIEknZCByYXRoZXIgaGF2ZSBhbGwgY3NyXzxvcD4zMi82NCBoZWxwZXJz
LiBUaGVuLCBjb2RlCj4+IHdvdWxkIG1hdGNoIHRoZSBzcGVjIGJ5IGNob29zaW5nIHRoZSByaWdo
dCBoZWxwZXIgYmFzZWQgb24gdGhlIHdpZHRoCj4+IG9mIHRoZSBDU1IgYmVpbmcgYWNjZXNzZWQs
IHdoZW4gdGhlIENTUiBoYXMgYW4gZXhwbGljaXQgd2lkdGgsIG9yIHN0aWxsCj4+IHVzZSB0aGUg
Y3VycmVudCBoZWxwZXJzIGZvciB4bGVuLXdpZGUgQ1NScy4KPj4KPj4gVGhhbmtzLAo+PiBkcmV3
Cj4KU3VyZSBJJ2xsIGRyb3AgdGhlIHBhdGNoIGluIHRoZSBuZXh0IHZlcnNpb24KCgpSZWdhcmRz
LApOaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
