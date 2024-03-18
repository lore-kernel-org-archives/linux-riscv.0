Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF81BC54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 03:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klx9h3O9koDEx/v3zJJY/B2vjs/HWRJhvBVl205MzCI=; b=vKSD3BcOuAz4hq
	i4zzNTATPPGSgk+ZoWZ8YsxmOQI2LF8ZlyPyVAaDGADBALWLeWbsRvZBlGjtaaAHaDabFAf2R80gB
	AJ4nqVdL1jBQAVDJWRtqkd1WpFOlqE3riWgqvcOoy4GHhBQkPrZpvLWGw9Q78S5OY+C3iGKB+o2el
	Z6xPyKDAyYXE7HvnBHV1f1I1biyqdF2OJU7Bw3Q4wnd4gbMTBDO/mxgWxfvRD56NU5PSfMK5gLGCs
	ZP0PZ+fECjFWZQjxyDXhVvk2b+DJ8xgUKvd69c7k+GsAV19PyDku5dzqW7kvQX4iZxTdLQGg4iB8I
	A4v7TuLaES0fGyu5/83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm3cm-000000078ww-37RU;
	Mon, 18 Mar 2024 03:25:20 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm3cg-000000078t9-11Kg;
	Mon, 18 Mar 2024 03:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1710732306;
	bh=NV+IEiKEp7lCdjzjbneFkp6G29/AFeVDyz/GqmHX3m4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aZwR6Ce11vNXim4mOCh1eXkx7K65RfM+cau+BhgB9SdLqlZPW+NSBiMfH6HvhOd0A
	 Cxq4iA45zUMfJd0t0fiCZUW9oT7MdElC1lAHDwjgYhkFVet+3SexBY3VTuWZ+t2GS/
	 R6YtLN+mqg6XUSgVsgcCPTEOKRlHDfSmPt/ef1FfXW6waLfQPAdiG7JMm/zsq5BT3k
	 vdQUUXBAz8sJiI6L7YfwQCfB8GuYQWxC3Reysu8xNTnmju7VZ+DNwIB5BF60uJsyDk
	 OdmHw4LQNlhzuekWxZGLa0lNLJlIa+tl6Z4Z3Fg6YFxfGk0yqItTN1sXJzV54NgtGp
	 w8QwwUGGGIyQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TygG42yLDz4wc1;
	Mon, 18 Mar 2024 14:25:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Dan Carpenter
 <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, Daniel Diaz
 <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, Arthur Grillo
 <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, netdev@lists.linux.dev
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
In-Reply-To: <04f34097-7788-490d-a9c2-82b44bf6af44@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <CAMuHMdUkvagJVEfnhq=Nx2jnmdS0Ax+zy1CvyN0k7k1EwUpu+g@mail.gmail.com>
 <6d9269c0-bd38-4965-a454-4358e0a182e3@roeck-us.net>
 <04f34097-7788-490d-a9c2-82b44bf6af44@roeck-us.net>
Date: Mon, 18 Mar 2024 14:24:59 +1100
Message-ID: <87ttl4z0fo.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_202514_594342_74AD3D91 
X-CRM114-Status: GOOD (  25.13  )
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

R3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3cml0ZXM6Cj4gT24gMy8xNC8yNCAw
NzozNywgR3VlbnRlciBSb2VjayB3cm90ZToKPj4gT24gMy8xNC8yNCAwNjozNiwgR2VlcnQgVXl0
dGVyaG9ldmVuIHdyb3RlOgo+Pj4gSGkgR8O8bnRlciwKPj4+Cj4+PiBPbiBUdWUsIE1hciAxMiwg
MjAyNCBhdCA2OjAz4oCvUE0gR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3cm90
ZToKPj4+PiBTb21lIHVuaXQgdGVzdHMgaW50ZW50aW9uYWxseSB0cmlnZ2VyIHdhcm5pbmcgYmFj
a3RyYWNlcyBieSBwYXNzaW5nIGJhZAo+Pj4+IHBhcmFtZXRlcnMgdG8ga2VybmVsIEFQSSBmdW5j
dGlvbnMuIFN1Y2ggdW5pdCB0ZXN0cyB0eXBpY2FsbHkgY2hlY2sgdGhlCj4+Pj4gcmV0dXJuIHZh
bHVlIGZyb20gc3VjaCBjYWxscywgbm90IHRoZSBleGlzdGVuY2Ugb2YgdGhlIHdhcm5pbmcgYmFj
a3RyYWNlLgo+Pj4+Cj4+Pj4gU3VjaCBpbnRlbnRpb25hbGx5IGdlbmVyYXRlZCB3YXJuaW5nIGJh
Y2t0cmFjZXMgYXJlIG5laXRoZXIgZGVzaXJhYmxlCj4+Pj4gbm9yIHVzZWZ1bCBmb3IgYSBudW1i
ZXIgb2YgcmVhc29ucy4KPj4+PiAtIFRoZXkgY2FuIHJlc3VsdCBpbiBvdmVybG9va2VkIHJlYWwg
cHJvYmxlbXMuCj4+Pj4gLSBBIHdhcm5pbmcgdGhhdCBzdWRkZW5seSBzdGFydHMgdG8gc2hvdyB1
cCBpbiB1bml0IHRlc3RzIG5lZWRzIHRvIGJlCj4+Pj4gwqDCoCBpbnZlc3RpZ2F0ZWQgYW5kIGhh
cyB0byBiZSBtYXJrZWQgdG8gYmUgaWdub3JlZCwgZm9yIGV4YW1wbGUgYnkKPj4+PiDCoMKgIGFk
anVzdGluZyBmaWx0ZXIgc2NyaXB0cy4gU3VjaCBmaWx0ZXJzIGFyZSBhZC1ob2MgYmVjYXVzZSB0
aGVyZSBpcwo+Pj4+IMKgwqAgbm8gcmVhbCBzdGFuZGFyZCBmb3JtYXQgZm9yIHdhcm5pbmdzLiBP
biB0b3Agb2YgdGhhdCwgc3VjaCBmaWx0ZXIKPj4+PiDCoMKgIHNjcmlwdHMgd291bGQgcmVxdWly
ZSBjb25zdGFudCBtYWludGVuYW5jZS4KPj4+Pgo+Pj4+IE9uZSBvcHRpb24gdG8gYWRkcmVzcyBw
cm9ibGVtIHdvdWxkIGJlIHRvIGFkZCBtZXNzYWdlcyBzdWNoIGFzICJleHBlY3RlZAo+Pj4+IHdh
cm5pbmcgYmFja3RyYWNlcyBzdGFydCAvIGVuZCBoZXJlIiB0byB0aGUga2VybmVsIGxvZy7CoCBI
b3dldmVyLCB0aGF0Cj4+Pj4gd291bGQgYWdhaW4gcmVxdWlyZSBmaWx0ZXIgc2NyaXB0cywgaXQg
bWlnaHQgcmVzdWx0IGluIG1pc3NpbmcgcmVhbAo+Pj4+IHByb2JsZW1hdGljIHdhcm5pbmcgYmFj
a3RyYWNlcyB0cmlnZ2VyZWQgd2hpbGUgdGhlIHRlc3QgaXMgcnVubmluZywgYW5kCj4+Pj4gdGhl
IGlycmVsZXZhbnQgYmFja3RyYWNlKHMpIHdvdWxkIHN0aWxsIGNsb2cgdGhlIGtlcm5lbCBsb2cu
Cj4+Pj4KPj4+PiBTb2x2ZSB0aGUgcHJvYmxlbSBieSBwcm92aWRpbmcgYSBtZWFucyB0byBpZGVu
dGlmeSBhbmQgc3VwcHJlc3Mgc3BlY2lmaWMKPj4+PiB3YXJuaW5nIGJhY2t0cmFjZXMgd2hpbGUg
ZXhlY3V0aW5nIHRlc3QgY29kZS4gU3VwcG9ydCBzdXBwcmVzc2luZyBtdWx0aXBsZQo+Pj4+IGJh
Y2t0cmFjZXMgd2hpbGUgYXQgdGhlIHNhbWUgdGltZSBsaW1pdGluZyBjaGFuZ2VzIHRvIGdlbmVy
aWMgY29kZSB0byB0aGUKPj4+PiBhYnNvbHV0ZSBtaW5pbXVtLiBBcmNoaXRlY3R1cmUgc3BlY2lm
aWMgY2hhbmdlcyBhcmUga2VwdCBhdCBtaW5pbXVtIGJ5Cj4+Pj4gcmV0YWluaW5nIGZ1bmN0aW9u
IG5hbWVzIG9ubHkgaWYgYm90aCBDT05GSUdfREVCVUdfQlVHVkVSQk9TRSBhbmQKPj4+PiBDT05G
SUdfS1VOSVQgYXJlIGVuYWJsZWQuCj4+Pj4KPj4+PiBUaGUgZmlyc3QgcGF0Y2ggb2YgdGhlIHNl
cmllcyBpbnRyb2R1Y2VzIHRoZSBuZWNlc3NhcnkgaW5mcmFzdHJ1Y3R1cmUuCj4+Pj4gVGhlIHNl
Y29uZCBwYXRjaCBpbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIGNvdW50aW5nIHN1cHByZXNzZWQgYmFj
a3RyYWNlcy4KPj4+PiBUaGlzIGNhcGFiaWxpdHkgaXMgdXNlZCBpbiBwYXRjaCB0aHJlZSB0byBp
bXBsZW1lbnQgdW5pdCB0ZXN0cy4KPj4+PiBQYXRjaCBmb3VyIGRvY3VtZW50cyB0aGUgbmV3IEFQ
SS4KPj4+PiBUaGUgbmV4dCB0d28gcGF0Y2hlcyBhZGQgc3VwcG9ydCBmb3Igc3VwcHJlc3Npbmcg
YmFja3RyYWNlcyBpbiBkcm1fcmVjdAo+Pj4+IGFuZCBkZXZfYWRkcl9saXN0cyB1bml0IHRlc3Rz
LiBUaGVzZSBwYXRjaGVzIGFyZSBpbnRlbmRlZCB0byBzZXJ2ZSBhcwo+Pj4+IGV4YW1wbGVzIGZv
ciB0aGUgdXNlIG9mIHRoZSBmdW5jdGlvbmFsaXR5IGludHJvZHVjZWQgd2l0aCB0aGlzIHNlcmll
cy4KPj4+PiBUaGUgcmVtYWluaW5nIHBhdGNoZXMgaW1wbGVtZW50IHRoZSBuZWNlc3NhcnkgY2hh
bmdlcyBmb3IgYWxsCj4+Pj4gYXJjaGl0ZWN0dXJlcyB3aXRoIEdFTkVSSUNfQlVHIHN1cHBvcnQu
Cj4+Pgo+Pj4gVGhhbmtzIGZvciB5b3VyIHNlcmllcyEKPj4+Cj4+PiBJIGdhdmUgaXQgYSB0cnkg
b24gbTY4aywganVzdCBydW5uaW5nIGJhY2t0cmFjZS1zdXBwcmVzc2lvbi10ZXN0LAo+Pj4gYW5k
IHRoYXQgc2VlbXMgdG8gd29yayBmaW5lLgo+Pj4KPj4+PiBEZXNpZ24gbm90ZToKPj4+PiDCoMKg
IEZ1bmN0aW9uIHBvaW50ZXJzIGFyZSBvbmx5IGFkZGVkIHRvIHRoZSBfX2J1Z190YWJsZSBzZWN0
aW9uIGlmIGJvdGgKPj4+PiDCoMKgIENPTkZJR19LVU5JVCBhbmQgQ09ORklHX0RFQlVHX0JVR1ZF
UkJPU0UgYXJlIGVuYWJsZWQgdG8gYXZvaWQgaW1hZ2UKPj4+PiDCoMKgIHNpemUgaW5jcmVhc2Vz
IGlmIENPTkZJR19LVU5JVD1uLiBUaGVyZSB3b3VsZCBiZSBzb21lIGJlbmVmaXRzIHRvCj4+Pj4g
wqDCoCBhZGRpbmcgdGhvc2UgcG9pbnRlcnMgYWxsIHRoZSB0aW1lIChyZWR1Y2VkIGNvbXBsZXhp
dHksIGFiaWxpdHkgdG8KPj4+PiDCoMKgIGRpc3BsYXkgZnVuY3Rpb24gbmFtZXMgaW4gQlVHL1dB
Uk5JTkcgbWVzc2FnZXMpLiBUaGF0IGNoYW5nZSwgaWYKPj4+PiDCoMKgIGRlc2lyZWQsIGNhbiBi
ZSBtYWRlIGxhdGVyLgo+Pj4KPj4+IFVuZm9ydHVuYXRlbHkgdGhpcyBhbHNvIGluY3JlYXNlcyBr
ZXJuZWwgc2l6ZSBpbiB0aGUgQ09ORklHX0tVTklUPW0KPj4+IGNhc2UgKGNhLiA4MCBLaUIgZm9y
IGF0YXJpX2RlZmNvbmZpZyksIG1ha2luZyBpdCBsZXNzIGF0dHJhY3RpdmUgdG8gaGF2ZQo+Pj4g
a3VuaXQgYW5kIGFsbCB0ZXN0cyBlbmFibGVkIGFzIG1vZHVsZXMgaW4gbXkgc3RhbmRhcmQga2Vy
bmVsLgo+Pj4KPj4gCj4+IEdvb2QgcG9pbnQuIEluZGVlZCwgaXQgZG9lcy4gSSB3YW50ZWQgdG8g
YXZvaWQgYWRkaW5nIGEgY29uZmlndXJhdGlvbiBvcHRpb24sCj4+IGJ1dCBtYXliZSBJIHNob3Vs
ZCBhZGQgaXQgYWZ0ZXIgYWxsLiBIb3cgYWJvdXQgc29tZXRoaW5nIGxpa2UgdGhpcyA/Cj4+IAo+
PiArY29uZmlnIEtVTklUX1NVUFBSRVNTX0JBQ0tUUkFDRQo+PiArwqDCoMKgwqDCoMKgIGJvb2wg
IktVbml0IC0gRW5hYmxlIGJhY2t0cmFjZSBzdXBwcmVzc2lvbiIKPj4gK8KgwqDCoMKgwqDCoCBk
ZWZhdWx0IHkKPj4gK8KgwqDCoMKgwqDCoCBoZWxwCj4+ICvCoMKgwqDCoMKgwqDCoMKgIEVuYWJs
ZSBiYWNrdHJhY2Ugc3VwcHJlc3Npb24gZm9yIEtVbml0LiBJZiBlbmFibGVkLCBiYWNrdHJhY2Vz
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgIGdlbmVyYXRlZCBpbnRlbnRpb25hbGx5IGJ5IEtVbml0IHRl
c3RzIGNhbiBiZSBzdXBwcmVzc2VkLiBEaXNhYmxlCj4+ICvCoMKgwqDCoMKgwqDCoMKgIHRvIHJl
ZHVjZSBrZXJuZWwgaW1hZ2Ugc2l6ZSBpZiBpbWFnZSBzaXplIGlzIG1vcmUgaW1wb3J0YW50IHRo
YW4KPj4gK8KgwqDCoMKgwqDCoMKgwqAgc3VwcHJlc3Npb24gb2YgYmFja3RyYWNlcyBnZW5lcmF0
ZWQgYnkgS1VuaXQgdGVzdHMuCj4KPiBBbnkgbW9yZSBjb21tZW50cyAvIGZlZWRiYWNrIG9uIHRo
aXMgPyBPdGhlcndpc2UgSSdsbCBpbnRyb2R1Y2UgdGhlCj4gYWJvdmUgY29uZmlndXJhdGlvbiBv
cHRpb24gaW4gdjIgb2YgdGhlIHNlcmllcy4KPgo+IEluIHRoaXMgY29udGV4dCwgYW55IHN1Z2dl
c3Rpb25zIGlmIGl0IHNob3VsZCBiZSBlbmFibGVkIG9yIGRpc2FibGVkIGJ5Cj4gZGVmYXVsdCA/
IEkgcGVyc29uYWxseSB0aGluayBpdCB3b3VsZCBiZSBtb3JlIGltcG9ydGFudCB0byBiZSBhYmxl
IHRvCj4gc3VwcHJlc3MgYmFja3RyYWNlcywgYnV0IEkgdW5kZXJzdGFuZCB0aGF0IG90aGVycyBt
YXkgbm90IGJlIHdpbGxpbmcgdG8KPiBhY2NlcHQgYSB+MSUgaW1hZ2Ugc2l6ZSBpbmNyZWFzZSB3
aXRoIENPTkZJR19LVU5JVD1tIHVubGVzcwo+IEtVTklUX1NVUFBSRVNTX0JBQ0tUUkFDRSBpcyBl
eHBsaWNpdGx5IGRpc2FibGVkLgoKUGxlYXNlIGVuYWJsZSBpdCBieSBkZWZhdWx0LgoKVGhlcmUg
YXJlIG11bHRpcGxlIENJIHN5c3RlbXMgdGhhdCB3aWxsIGJlbmVmaXQgZnJvbSBpdCwgd2hlcmVh
cyB0aGUKbnVtYmVyIG9mIHVzZXJzIGVuYWJsaW5nIEtVTklUIGluIHNldmVyZWx5IHNwYWNlZCBj
b25zdHJhaW50ZWQKZW52aXJvbm1lbnRzIGlzIHN1cmVseSBzbWFsbCAtIHBlcmhhcHMganVzdCBH
ZWVydCA7KS4KCmNoZWVycwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
