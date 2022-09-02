Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00E7C54EE9
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 08:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQeD43TsmaUvmOO/T/jI8CVOPvGjmPL0EOS1qF5f6MU=; b=xV6nU13tvrtdda
	WEKgjgji87TTzj5/ULgq59o+kOXLcc+etqLfHHmTswC724gwcOOU/XUZfXqthjAcgP9AlD61yKgkx
	ImrhZqoPsACVuxkHZRiHxJDgtZ4lT33D+BqJMgSmFc/w38k+EipZl1B/iOxuiz9JnLIeiLY5KUf+p
	RlISYffs3o93t1JjR99OxA2fPXSNKBlKKBU6df5c7dm87zW8y/Y8B1uJnelqOZz8qFBAlGgg7kd2D
	eEXXZxkO5qDwKVVALdvNGSYrqBT+6iXb7xiHrHjwsuzUJO5C/uctLCLM90SVaqhhinvXqAgRNOsV8
	yfYNDpoP+ejsfkGPxqzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1uB-001ldF-AH; Fri, 02 Sep 2022 08:19:59 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1u5-001lWy-4H
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 08:19:55 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 21so2111459ybl.6
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 01:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=KvkNvvX9SicRhmlMlGf1gfVlv7kcqSy6PdjiBm12QIQ=;
        b=Ew4wEkGyZs4fnKT4OviWtr40QLbHkR2xOt/Jd5p3DGOyE4y2Y2fQ/mwPVPRGGcBtix
         S93iVp2pkXXdBqkTRqZSdNFkijzLF8+LAVwDiC/ggSw53EHsuChTWe5ae5ePt4w/lpyN
         mdZgfGV+rKt50To5eVEiPU/08P+NMjAqjg6S+en+xKNSwZ3MOGv6fl0lxO5PFdKciGwx
         3g2LRAQkYxClKO1BxJd0fDKV1v2sVK0aPTxk+VHeru0Enm32e5J+iKyqMhfnCCYS1h69
         vJEUmCI+HalK0Icq+ROVUIUZIgcKSc74KEOfEZj7my+mf9h53xTEGiv7qmv/tdKkvqtE
         37jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KvkNvvX9SicRhmlMlGf1gfVlv7kcqSy6PdjiBm12QIQ=;
        b=Lb0/HJH+s+kWU3C4AobdnKnF3Ap8VyngRCByqPLS5AanD5UXQMyA4yoVK5Y+Vxhfb0
         IgTVAWjK6B4xE5vCdcgFCEvcn2HbqXtYUjU9oYixkWBfj0LLQfBQ64StkkQQUemp3DAN
         d+YNlp1sIczz/QpMT6AhF3GklzieU6XWIIpPDu7nNFmuUpztyc10qXDpW8wEsqy1XmtB
         a69pCD+dCeD5eodSa+bSix/e3f2IDrBgasOrJYf+4/nsRvmsRpgziqRLbDaA6aZ3BLal
         F6SlMyfv/p+ceeSS2lurpptve0Xjyq8K98lDtzoJ6NLPIy889dGQZ7AnA7TIEfBTU+hk
         xzzQ==
X-Gm-Message-State: ACgBeo32hU17isX2iWr/uultCxShOLR2+sQfW6J9HnrFlH3l+RaNL1ew
	DX6nVsf21kZ+0no0FUNXG3rgE2py06KOgUZvh0VAuA==
X-Google-Smtp-Source: AA6agR7hTYXVYH603HZ94lT7DySevcOa5w7SADiV0yNDxOoJ4UnZBqZ3DZp201iQFPhzFPhVxqe0A3evsv9g2h594W4=
X-Received: by 2002:a25:234a:0:b0:696:435f:df06 with SMTP id
 j71-20020a25234a000000b00696435fdf06mr21812539ybj.180.1662106789959; Fri, 02
 Sep 2022 01:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <YxEhC/mDW1lFt36J@aurel32.net> <CAOnJCUJ-E-VyQOyh+psbJP4mDO9F+ShvnxDYjoCUUkH4rddJtw@mail.gmail.com>
 <CAOnJCUKDQfCD7mh-RWrq0E8a3Fmp4Xz348THrS+SmJ71GX8=PA@mail.gmail.com> <CA+7wUsww-CGmyNOHJw2bVfcDamq3_XD8mVDJ6pfk0UsxreEjOw@mail.gmail.com>
In-Reply-To: <CA+7wUsww-CGmyNOHJw2bVfcDamq3_XD8mVDJ6pfk0UsxreEjOw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Sep 2022 13:49:37 +0530
Message-ID: <CAAhSdy2RGu9NHg0rOfiGxZYsvvcvtOr-jGWdLVt+iUkpZKgN=w@mail.gmail.com>
Subject: Re: rdcycle from userland with RISCV_PMU_SBI=y
To: Mathieu Malaterre <malat@debian.org>
Cc: Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	Aurelien Jarno <aurelien@aurel32.net>, Anup Patel <apatel@ventanamicro.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Jan Wassenberg <janwas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_011953_479307_E7F34C13 
X-CRM114-Status: GOOD (  39.98  )
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

T24gRnJpLCBTZXAgMiwgMjAyMiBhdCAxOjIzIFBNIE1hdGhpZXUgTWFsYXRlcnJlIDxtYWxhdEBk
ZWJpYW4ub3JnPiB3cm90ZToKPgo+IEF0aXNoLAo+Cj4gT24gRnJpLCBTZXAgMiwgMjAyMiBhdCA5
OjEyIEFNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+IHdyb3RlOgo+ID4KPiA+
Cj4gPgo+ID4gT24gVGh1LCBTZXAgMSwgMjAyMiBhdCAzOjM0IFBNIEF0aXNoIFBhdHJhIDxhdGlz
aHBAYXRpc2hwYXRyYS5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4KPiA+Pgo+ID4+IE9uIFRodSwgU2Vw
IDEsIDIwMjIgYXQgMjoxNSBQTSBBdXJlbGllbiBKYXJubyA8YXVyZWxpZW5AYXVyZWwzMi5uZXQ+
IHdyb3RlOgo+ID4+Pgo+ID4+PiBIaSBhbGwsCj4gPj4+Cj4gPj4+IE1hdGhpZXUgTWFsYXRlcnJl
IHJlcG9ydGVkIGFuIGlzc3VlIGluIERlYmlhbiB3aXRoIHRoZSBoaWdod2F5IHBhY2thZ2UsCj4g
Pj4+IHdoaWNoIHVzZXMgdGhlIHJkY3ljbGUgcHNldWRvIGluc3RydWN0aW9uLCBhbmQgc3RhcnRl
ZCB0byBmYWlsIHJlY2VudGx5Lgo+ID4+Pgo+ID4+PiBXZSB0cmFja2VkIGRvd24gYW4gaXNzdWUg
dG8gdGhlICJwZXJmIHBsYXRmb3JtIGRyaXZlciBiYXNlZCBvbiBTQkkgUE1VCj4gPj4+IGV4dGVu
c2lvbiIgcmVjZW50bHkgYWRkZWQgaW4gTGludXggNS4xOCBbMV0uIE9uIGEgYm9hcmQgd2hpY2gg
cnVucyBhbgo+ID4+PiBTQkkgd2l0aCB0aGUgUE1VIGV4dGVuc2lvbiwgdGhpcyBjYXVzZXMgdGhl
IHJkY3ljbGUgcHNldWRvIGluc3RydWN0aW9uCj4gPj4+IHRvIGdlbmVyYXRlIGEgU0lHSUxMLiBU
aGlzIGlzIGJlY2F1c2UgdGhlIGRyaXZlciBleHBsaWNpdGx5IHNldAo+ID4+PiBDU1JfU0NPVU5U
RVJFTiB0byAweDAyLCBnaXZpbmcgYWNjZXNzIGZyb20gdXNlcmxhbmQgdG8gcmR0aW1lIGJ1dCBu
b3QKPiA+Pj4gcmRjeWNsZS4KPiA+Pj4KPiA+Pj4gSSB3b25kZXIgaWYgdGhpcyBjaGFuZ2UgaXMg
aW50ZW50aW9uYWwsIGFuZCBpZiB0aGVyZSBpcyBhIHJlYXNvbiB0bwo+ID4+PiBmb3JiaWQgdXNp
bmcgdGhlIHJkY3ljbGUgcHNldWRvIGluc3RydWN0aW9uIGZyb20gdXNlcmxhbmQuIElmIGl0IGlz
IHRoZQo+ID4+PiBjYXNlLCB0aGlzIHNob3VsZCBwcm9iYWJseSBiZSBjaGFuZ2VkIHNvIHRoYXQg
dGhlIGJlaGF2aW91ciBkb2VzIG5vdAo+ID4+PiBkaWZmZXIgZnJvbSBib2FyZCB0byBib2FyZCBk
ZXBlbmRpbmcgb24gdGhlIGF2YWlsYWJsZSBQTVUgZXh0ZW5zaW9uLgo+ID4+Pgo+ID4+Cj4gPj4g
WWVzLiBUaGUgY2hhbmdlIHdhcyBpbnRlbnRpb25hbCBkdWUgdG8gc2VjdXJpdHkgcmVhc29ucy4g
T25lIHJvZ3VlIHByb2Nlc3MgY2FuIGhhdmUgYWNjZXNzIHRvIGN5Y2xlICYKPiA+PiBpbnN0cnVj
dGlvbnMgb2YgdGhlIGVudGlyZSBrZXJuZWwgYWx3YXlzIHdoaWNoIGNhbiBsZWFkIHRvIHNvbWUg
c29ydCBvZiBzaWRlIGNoYW5uZWwgYXR0YWNrcy4KPiA+Pgo+ID4+IEhvd2V2ZXIsIEkgYWdyZWUg
dGhhdCB3ZSBjYW4ndCBicmVhayB1c2Vyc3BhY2UuIEkgd2FzIG5vdCBhd2FyZSBvZiB0aGUgZmFj
dCB0aGF0IHRoZXJlIGFyZSBhbHJlYWR5IHVzZXJzIG9mIHJkY3ljbGUKPiA+PiBpbiB0aGUgdXNl
cnNwYWNlLiBJIHdpbGwgc2VuZCBhIHBhdGNoIHRvIHJlc3RvcmUgdGhlIG9yaWdpbmFsIGJlaGF2
aW9yIGJ5IGVuYWJsaW5nIENZLCBJUiBiaXRzIGluIHNjb3VudGVyZW4uCj4gPj4KPiA+Cj4gPiBN
ZXJnaW5nIHRoZSB0aHJlYWQgZnJvbSBzdy1kZXY6Cj4gPgo+ID4gIgo+ID4gPiA+IE9uIFRodSwg
U2VwIDEsIDIwMjIgYXQgNzozNiBQTSBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2
ZS5jb20+IHdyb3RlOgo+ID4gPiA+Pgo+ID4gPiA+PiBJZiBJIHJlY2FsbCBjb3JyZWN0bHksICBv
dGhlciBhcmNoaXRlY3R1cmVzIGRvbid0IGFsbG93IGRpcmVjdCBhY2Nlc3MgdG8gdGhlaXIgY3lj
bGUgY291bnRlcnMgZnJvbSB1c2Vyc3BhY2UgZm9yIHNlY3VyaXR5IHJlYXNvbnMuICAgQW55IHJl
YXNvbiB3aHkgUklTQy1WIHNob3VsZG4ndCBmb2xsb3cgdGhlIHNhbWUgYXBwcm9hY2g/Cj4gPiA+
ID4KPiA+ID4gPgo+ID4gPiA+IFRoYXQgd2FzIHRoZSBpbnRlbnRpb24gYmVoaW5kIGRpc2FibGlu
ZyB0aGUgYWNjZXNzIGluIHRoZSBQTVUgZHJpdmVyLiBBdCB0aGF0IHRpbWUsIEkgZGlkbuKAmXQg
ZmluZCBhbnkgdXNlcnMuIE9idmlvdXNseSBJIHdhcyB3cm9uZyDwn5iCLiBCdXQgaXMgdGhhdCBh
IHN1ZmZpY2llbnQgcmVhc29uIHRvIGV4aXN0aW5nIGJyZWFrIHVzZXIgc3BhY2UgPwo+ID4gPgo+
ID4gPiBBcyBhbHJlYWR5IHBvaW50ZWQgb3V0LCB3ZSBjYW4ndCBjb21wcm9taXNlIHNlY3VyaXR5
IGJ5IGhhdmluZyBhbGwKPiA+ID4gYXBwcyB1bnJlc3RyaWN0ZWQgYWNjZXNzIHRvIHRoZSBjeWNs
ZSBjb3VudGVyLiBXZSBhbHJlYWR5IGhhdmUgdGhlCj4gPiA+IExpbnV4IHBlcmYgc3Vic3lzdGVt
IGZvciBtYW5hZ2luZyBjb3VudGVycyBzbyBhcHBzIHNob3VsZCBhbHdheXMgdXNlCj4gPiA+IExp
bnV4IHBlcmYgc3lzY2FsbHMuCj4gPiA+Cj4gPiA+IElNTywgdGhlIHBhY2thZ2UgImhpZ2h3YXki
IGRpcmVjdGx5IGFjY2Vzc2luZyB0aGUgY3ljbGUgY291bnRlciBzaG91bGQKPiA+ID4gYmUgZml4
ZWQgaW5zdGVhZCBvZiBmaXhpbmcgdGhlIExpbnV4IFNCSSBQTVUgZHJpdmVyLgo+ID4gPgo+ID4g
PiBGdXJ0aGVyIGludmVzdGlnYXRpbmcgdGhlIGhpZ2h3YXkgcHJvamVjdAo+ID4gPiAoaHR0cHM6
Ly9naXRodWIuY29tL2dvb2dsZS9oaWdod2F5KSwgaXQgc2VlbXMgdGhpcyBwcm9qZWN0IGlzIHVz
aW5nCj4gPiA+ICJyZGN5Y2xlIiB0byB0cmFjayB0aW1lciB0aWNrcyB3aGljaCBpcyB0b3RhbGx5
IHdyb25nLiBJbnN0ZWFkIHRoZSB1c2UKPiA+ID4gb2YgInJkY3ljbGUiIHNob3VsZCBiZSByZXBs
YWNlZCB3aXRoICJyZHRpbWUiIGluIHRoaXMgcHJvamVjdC4KPiA+ID4gKFJlZmVyLCBsaW5lIDE1
NiBvZgo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xlL2hpZ2h3YXkvYmxvYi9tYXN0ZXIv
aHd5L25hbm9iZW5jaG1hcmsuY2MpCj4gPgo+ID4gUGF5IGF0dGVudGlvbiB0aGF0IHF1aXRlIGEg
ZmV3IHByb2plY3RzIGFyZSB1c2luZyByZGN5Y2xlIGluIHVzZXItc3BhY2UgYWxyZWFkeToKPiA+
Cj4gPiAqIGh0dHBzOi8vY29kZXNlYXJjaC5kZWJpYW4ubmV0L3NlYXJjaD9xPSUyMnJkY3ljbGUr
JTI1MCUyMgo+ID4KPiA+IEFueXdheSBpZiB5b3UgYmVsaWV2ZSByZHRpbWUgaXMgdGhlIHJpZ2h0
IGZpeCwgd2UgY2FuIGZpeCBvbmUgcHJvamVjdAo+ID4gYXQgYSB0aW1lLi4uIgo+ID4KPiA+IFRo
YW5rcyBmb3Igc2hhcmluZyB0aGUgbGlzdC4gSSB0b29rIGEgcXVpY2sgbG9vay4gVGhlIGZpcnN0
IGZldyBvbmVzIGF0IGxlYXN0ICAoZmlyZWZveCwgbGx2bSwgY2hyb21lKQo+ID4gc2VlbXMgdG8g
dXNlIHJkY3ljbGUgZm9yIHRpbWVzdGFtcC4gQWxsIG9mIHRoZSBwYWNrYWdlcyB1c2UgInJkdHNj
IiBmb3IgeDg2Lgo+ID4gVGhlIGVxdWl2YWxlbnQgaW5zdHJ1Y3Rpb24gaW4gUklTQy1WIHNob3Vs
ZCBiZSByZHRpbWUgbm90IHJkY3ljbGUuCj4KPiBbQ0MtaW5nIGhpZ2h3YXkgbWFpbiBkZXZdCj4K
PiBIZXJlIGlzIGhpcyBjb21tZW50IG9uIHRoZSByZHRpbWUgcGF0Y2ggcHJvcG9zYWw6Cj4KPiA+
IEZvciBiZW5jaG1hcmtpbmcgd2UgcmVhbGx5IHdvdWxkIHByZWZlciBhIGN5Y2xlIGNvdW50LCBy
YXRoZXIgdGhhbiAicmVhbCB0aW1lIGNsb2NrIHRpY2tzIiwgZm9yIHdoaWNoIHRoZSBzcGVjIG1h
a2VzIG5vIGd1YXJhbnRlZXMuIElmL3doZW4gdGhvc2UgdHVybiBvdXQgdG8gYmUgbWlsbGlzZWNv
bmQtcmVzb2x1dGlvbiwgdGhleSBhcmUgbm90IHZlcnkgdXNlZnVsLgoKVGhlIFJJU0MtViBzcGVj
IGRvZXMgbm90IG1ha2UgYW55IGd1YXJhbnRlZSBhYm91dCBncmFudWxhcml0eSBvZiB0aGUKY3lj
bGUgY291bnRlciBhcyB3ZWxsLiBJbiBmYWN0LCBvbiBzeXN0ZW1zIHdpdGggY3B1ZnJlcSBlbmFi
bGVkIHRoZQpyYXRlIG9mIGN5Y2xlIGNvdW50ZXIgaW5jcmVtZW50IHdpbGwgdmFyeSBhdCBydW50
aW1lLgoKT24gb3RoZXIgaGFuZCwgdGhlIHRpbWUgQ1NSIChpLmUuIHJkdGltZSkgd2lsbCBhbHdh
eXMgaW5jcmVtZW50IGF0IGEKZml4ZWQgcGxhdGZvcm0gc3BlY2lmaWMgcmF0ZSB3aGljaCBjYW4g
YmUgcmVhZCBmcm9tCiIvcHJvYy9kZXZpY2UtdHJlZS9jcHVzL3RpbWViYXNlLWZyZXF1ZW5jeSIu
CgpSZWdhcmRzLApBbnVwCgoKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
