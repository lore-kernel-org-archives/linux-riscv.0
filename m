Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C79EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 04:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgpq/KpOmBOnJN9BVT8vUw9TpN2PVtJs5nOxUIzyeA0=; b=HGsC8VWDnq77ql
	G2ro9+G4XKf+yeG4iQBt608eHq4H8cVs5IjfgsWGb1VK9pJy2AkzPHpBhE5geeaMD519yny7U1D3v
	wS/ekE+W+rM4lNv+m9Sv3CDEpr1vZlwDQgI4NzoRoRAEVgIJ1rV0gNd/NqN5bOlKteYgByccwGLxy
	doMRxRdU+VHcIqUH2HuXOGP5maeTvQC2oQvYq6X0hZAiavTqL5kN6HLxiLbMfIfkU+V0QmEiRtDfk
	3HkMhHQOTaOeJ2b4e/wbjVCURMHCzDEYOtyh+RnliVbWjOEyPcUcWSYN1zaGqOJcWzR9nuegRMZj7
	K9wwCOarzzxvK4ylWnfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCuzX-005ETi-0A;
	Sat, 24 Jun 2023 04:35:19 +0000
Received: from mail-yb1-f176.google.com ([209.85.219.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCuzT-005ET4-39
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 04:35:17 +0000
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-bff89873d34so1030686276.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 21:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687581314; x=1690173314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWcltbx43ICJ2omQWXgRLpaOtwzfz2d8GhcvQRYoRw4=;
        b=d/W4OTQ385tNyTFj1O8pW1z04w/18VWC/lQ9VVgAkLguebHXu+ggdg0cYTsCZpomnZ
         fvRWBCL9LceiVoGQxlxGD4aWd0Xy2pKYHYWRq8HYEev0BtAyQY8MXtHO5cq65WXrgYZO
         3LLsfLBU7i/BZUhNjvnKwUlK3tQONKeDlnjgnxEO5deWU8/v1aITdpHW0jZAbtX2bD1K
         o5rSSU1DR2aRL0BdWCiPsIze4TgelBOoIWOdQqc8EYmFYoxu61FFRqT8RTxmKavZPZBM
         LnmJiPxHP7735dkJv9OYIEv0R41auI0MLeSe0gL+0PAXtfmtD1hE6xRpBDa/9clD6AgJ
         JRBQ==
X-Gm-Message-State: AC+VfDziScLqpi53dcCafuG2vpvaQTKaOCN3G9Di7aXV6lrMXsoe+efy
	BH5DuwIGCavun9D9gW30jeSNiz6nitaXcURAAGQ=
X-Google-Smtp-Source: ACHHUZ6aH2HiFvjmsQFESquZw2UsfjeA55T4h3ZnLxQNGGjoqwnVBOQjqtjxRLsSzXFiYBwkvd4755iGIU0zeNYEbvk=
X-Received: by 2002:a25:e70b:0:b0:bc7:f963:eb48 with SMTP id
 e11-20020a25e70b000000b00bc7f963eb48mr17036891ybh.32.1687581314012; Fri, 23
 Jun 2023 21:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAM9d7cjtisDVPijfU=iEGxc0YF=RnAt+r18Jg+8Av-+RAO=jeg@mail.gmail.com>
 <IA1PR20MB49536C0DA47122E9E3CB7CBBBB20A@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB49536C0DA47122E9E3CB7CBBBB20A@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 23 Jun 2023 21:35:01 -0700
Message-ID: <CAM9d7cis-rb0fozK+T6R8MCEcT0ZF=RRNpv1qAWsLkMfsG6KxA@mail.gmail.com>
Subject: Re: [PATCH V3] perf vendor events riscv: add T-HEAD C9xx JSON file
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nikita Shubin <n.shubin@yadro.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_213516_036874_E1AE1D8A 
X-CRM114-Status: GOOD (  28.79  )
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

SGVsbG8sCgpPbiBGcmksIEp1biAyMywgMjAyMyBhdCA2OjMz4oCvUE0gSW5vY2hpIEFtYW90byA8
aW5vY2hpYW1hQG91dGxvb2suY29tPiB3cm90ZToKPgo+IEhpLCBOYW1oeXVuZwo+Cj4gU2luY2Ug
dGhlcmUgaXMgYSBmYXVsdCBpbiBULUhFQUQgZG9jdW1lbnRhdGlvbiwgSSBhbSBub3Qgc3VyZSB3
aGV0aGVyCj4gdGhlIHBlcmYgZXZlbnRzIGFyZSBjb3JyZWN0LiBBcyBhIHJlc3VsdCwgSSBzdWdn
ZXN0IHRlbXBvcmFyaWx5IHN1cHByZXNzaW5nCj4gdGhpcyBwYXRjaCB1bnRpbCBJIGV4dHJhY3Qg
dGhlIGNvcnJlY3QgZXZlbnRzIGZyb20gaXRzIHZlbmRvciBwZXJmIGRyaXZlci4KPiBJIHdpbGwg
cHJlcGFyZSBhIG5ldyBWNCBwYXRjaCBvbmNlIGl0IGlzIGZpbmlzaGVkLgoKU3VyZSwgdGhhbmtz
IGZvciBsZXR0aW5nIG1lIGtub3cuCgo+Cj4gQXMgZm9yIGM5eHggd2lsZGNhcmQsIHRoZSBULUhF
QUQgcHJvdmlkZXMgYSBgTUNQVUlEYCB2ZW5kb3IgQ1NSIHRvIGFsbG93Cj4gaXRzIENLTElOSyB0
byBnZXQgdGhlIGRldGFpbCBDUFUgaW5mby4gVGhlIGZvcm1hdCBvZiB0aGlzIENTUiBhcmU6Cj4K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiB8MzEg
ICAyOHwyNyAgMjZ8MjUgICAgMjJ8MjEgICAxOHwxNyAgICA4fDcgICAgMHwKPiB8IGluZGV4IHwg
V0xSTCB8IGZhbWlseSB8IGNsYXNzIHwgbW9kZWwgfCBXTFJMIHwKPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPgo+IEFuZCBmb3IgQzl4eCBzZXJpZXMg
KG9ubHkgaW5kZXggMDAwMCBpcyB2YWlsZCBmb3IgdXMsIGFzIGBNQ1BVSURgIGFsc28KPiBwcm92
aWRlcyBvdGhlciBpbmRleCkuCj4KPiB8IDAwMDAgfCB4eCB8IDAxMDAgfCBjbGFzcyB8IHh4eHh4
eHh4eHggfCB4eHh4eHh4eCB8Cj4KPiBUaGUgY2xhc3MgY29kZXMgYXJlOgo+Cj4gQzkxMDogMDAx
MQo+IGM5MDY6IDAxMDAKPgo+IFRoZSBDU1IgaXMgYSBNLW1vZGUgb25seSBDU1IsIHNvIG5vdyBJ
J20gZXhwbG9yaW5nIGEgY2xlYW4gd2F5IHRvCj4gaW50ZWdyYXRlIHRoaXMgQ1NSIGludG8gdGhl
IGtlcm5lbC4gQW55IGFkdmljZT8KCkkgZG9uJ3Qga25vdyBhYm91dCB0aGUgZGV0YWlscy4gIElz
IHRoaXMgQ1NSIGF2YWlsYWJsZSBmcm9tIHVzZXIgc3BhY2U/CklmIG5vdCwgeW91IGNvdWxkIGFk
ZCBpdCBzb21ld2hlcmUgaW4gdGhlIHN5c2ZzLgoKVGhhbmtzLApOYW1oeXVuZwoKCj4gPiBIZWxs
bywKPiA+Cj4gPiBPbiBUaHUsIE1heSAxOCwgMjAyMyBhdCAyOjUw4oCvQU0gSW5vY2hpIEFtYW90
byA8aW5vY2hpYW1hQG91dGxvb2suY29tPiB3cm90ZToKPiA+ID4KPiA+ID4+IGxpY2hlZXJ2ICMg
cGVyZiByZWNvcmQKPiA+ID4+IFsgIDQzMi4wMTU2MThdIHdhdGNoZG9nOiBCVUc6IHNvZnQgbG9j
a3VwIC0gQ1BVIzAgc3R1Y2sgZm9yIDI2cyEKPiA+ID4+IFtwZXJmOjExN10KPiA+ID4+IFsgIDQ2
MC4wMTU2MTddIHdhdGNoZG9nOiBCVUc6IHNvZnQgbG9ja3VwIC0gQ1BVIzAgc3R1Y2sgZm9yIDUy
cyEKPiA+ID4+IFtwZXJmOjExN10KPiA+ID4+IFsgIDQ4OC4wMTU2MTZdIHdhdGNoZG9nOiBCVUc6
IHNvZnQgbG9ja3VwIC0gQ1BVIzAgc3R1Y2sgZm9yIDc4cyEKPiA+ID4+IFtwZXJmOjExN10KPiA+
ID4+IFsgIDUxNi4wMTU2MTddIHdhdGNoZG9nOiBCVUc6IHNvZnQgbG9ja3VwIC0gQ1BVIzAgc3R1
Y2sgZm9yIDEwNHMhCj4gPiA+PiBbcGVyZjoxMTddCj4gPiA+Pgo+ID4gPj4gQnV0IHRoYXQncyBu
b3QgcmVsYXRlZCB0byB5b3VyIHBhdGNoIGFueXdheS4KPiA+ID4KPiA+ID4gU2FtZSBpc3N1ZSBv
biBjOTIwLCBidXQgaXQgZGlkIG5vdCBhbHdheXMgb2NjdXIuCj4gPiA+IExpa2UgYSBzYmkgaXNz
dWUgZm9yIFQtSEVBRCBjcHVzLgo+ID4gPgo+ID4gPj4gSSBhbSBzdHJvbmdseSBhZ2FpbnN0IHVz
aW5nICJjOXh4IiB3aWxkY2FyZCwgaSB3b3VsZCBwcmVmZXIgZGVjbGFyaW5nCj4gPiA+PiB0aGVt
IHNlcGFyYXRlIChlc3BlY2lhbGx5IHRha2luZyBpbiBtaW5kIHRoYXQgYzkyMCBpcyBjOTEwIHdp
dGggdmVjdG9yCj4gPiA+PiAtIEFGQUlLKSwgYnV0IHRoYXQncyB1cCB0byBBcm5hbGRvIHRvIGRl
Y2lkZS4KPiA+ID4KPiA+ID4gQUZBSUssIHRoZXJlIGlzIG5vIHJlbGlhYmxlIHdheSB0byBkaXN0
aW5ndWlzaCBjOTA2IGFuZCBjOTEwIGNvcmVzLiBBbmQKPiA+ID4gdGhlIGV2ZW50cyBvZiBjOTEw
IGFuZCBjOTIwIGFyZSB0aGUgc2FtZSAoYWNjb3JkaW5nIHRvIHRoZSBkcmFmdCBkb2N1bWVudAo+
ID4gPiBvZiB0aGUgYzkyMCkuCj4gPiA+Cj4gPiA+IEFueXdheSwgSSBhZ3JlZSB0byBsZXQgQXJu
YWxkbyBkZWNpZGUuCj4gPiA+Cj4gPiA+PiBUZXN0ZWQtYnk6IE5pa2l0YSBTaHViaW4gPG4uc2h1
YmluQHlhZHJvLmNvbT4KPiA+Cj4gPiBJJ20gY29sbGVjdGluZyBwYXRjaGVzIG9uIGJlaGFsZiBv
ZiBBcm5hbGRvIHRoaXMgdGltZS4KPiA+IEl0IHNlZW1zIHRoaXMgcGF0Y2ggd2FzIG5vdCBwaWNr
ZWQgdXAgZm9yIGEgbG9uZyB0aW1lLgo+ID4KPiA+IEkgdGhpbmsgd2UgY2FuIG1ha2UgY2hhbmdl
cyBmb3IgdGhlIGM5eHggd2lsZGNhcmQgbGF0ZXIKPiA+IGlmIG5lZWRlZC4gIEknbGwgcHJvY2Vz
cyBpdCBpbiB0aGUgY3VycmVudCBmb3JtLgo+ID4KPiA+IFRoYW5rcywKPiA+IE5hbWh5dW5nCj4g
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
