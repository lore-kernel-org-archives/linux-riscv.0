Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDABFC982C3
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Ju5mV/NhhK4CCUs52rOEbydwUTyXigVcX9MtuBWmak=; b=lV4ZeHJxqtLFpi
	HB4BItkFb/x9I7AGCR0HMZ7CPrBJ69Xi8fDJuuyvLOCxK+HHJwejxaUENSTeF0zm9G8trHlBjZ92i
	Q4rNIPvqXkYzcQEHH1YfiUxpxheFL529BvjrH8Ro0fgXEcVIZdqUreA1UJBizr6mZe0W4oDfsTPHF
	4GGt7DM/Wid0EyqpWCipHAXB85cLwzCGyDvMY5WcEkCTKX9TvR22J/FLZ8m3yhrQLgAf8BSKt11gu
	hLHcJfbRY+87X5Nk9aOLJJVDbP1ujcP13fVKcsXM8ZghjsErUXW0u/uayPjEnrH9quGxCTVruPpIU
	MxLpOorsT7F6PiNRFgyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6quW-00000009Svs-2kXl;
	Wed, 16 Sep 2026 14:46:57 +0000
Received: from mail-pj2-x17.google.com ([2607:f8b0:4864:39::17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6quT-00000009SvI-1RWp
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 14:46:54 +0000
Received: by mail-pj2-x17.google.com with SMTP id d9443c01a7336-2db18fe433fso8544215ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 07:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570012; x=1790174812; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Leygo7+6aTim/GwiqbwE1kTpWGv4lEshT5ezDgEePDE=;
        b=jG/0A04AD0/WrCbUzCjoZ8ZfjBVN9H/ttcLG1b3M04CXlYg3Wpv/21eS3oaZ0P62KR
         8agmoUgq4F6rs9laVEGg4QoTKD03cJYOOKvORhQm0b3dWyZy3Gfi0+QmMNK/05/3yreX
         MHX62iOxbJfanyPLhyaZEWt7HsGYEJSTbO9uJX9sC/Ct5930aMuAeSMLm63RBOot3KTo
         rQWl9Exp9uJxDle2CZgY+ldXSEU7+n7sAGjFmYgUqusWEkLRDmhkWkOpwQQyBYaFKk3j
         yIkZ88kmQ5hNzhN03lfFxz8b4mN0CzuvI5P6LDA8Ule3QLM4MA+pziefzCzI6v8YePqP
         5mfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570012; x=1790174812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Leygo7+6aTim/GwiqbwE1kTpWGv4lEshT5ezDgEePDE=;
        b=oWP8l3B46OJ59GR5DRhLNxKa35pkF0NW03ceLHdFWYNWAUu4vVBlTe44on+ufXz9dR
         XcdTiG/VhGoFWZoYcBIUK1PQ5gyGbjgyOZpYRUkYR+Yfa1LkOQSUwdP5CW2T4wDgrHn1
         xqGKCvTxc0VHIA7KIYMd29jt1QohqesuECJc4W1jFQDX68kGv1m8/3xce7aPhO47d7Rw
         Q7Szxi671no1xVpPSvZAw8ioOd1g8VpKe0CrVZuoJ2DM4TSx1iMG0LydRYopuEc6Je3u
         KA1uEHbggWoALSTVYifxrs2cidVBQunXRSlzCyDYCuHCWl7oOPao9s0hMZIjOgWG+1ni
         BJdw==
X-Forwarded-Encrypted: i=1; AKwUvBwRVsb6r2GZ5TdB/NiixR/7Jn3NwYbkx8AVY4Ujy5cSTdb9H2qm9xM4a1/TLeIc39HcmJFOu24lVdJP2w==@lists.infradead.org
X-Gm-Message-State: AFuF++k4JX6qPtKvdBlwPxcFdE1BB0DGSJ4Az1iTXwB9xvqPXo4Db7Sd
	DMrk0OvU71EfnqJZShtedo8wy5Fty+uMq4J31wbAv9A/DEUfZEyCeNv7
X-Gm-Gg: AYBFou3QURbE+fOEkP3gMzGsWKH0Ez6/25FB9g2HGejHlbD3JP7VKidHfPqt0HtpAuv
	NCNP+9faM8pnnzqSwv/a3umRylKpzbOjCWBtlf4p0fEjIEsIygXfo9GmUTFiP2vTDQ8rkPtdAI1
	zmDqeIRkP4nu6N/bGshghZoONVagq0bk2IzjvcLr5jBrmCW5wTRkXpzIrc4r5QA6hdlCWnq4gif
	KULFPCuz8n4for/oA3hPXPR8QY/JnN5xuIE2RPQ4LY9v5da8irkEujl0umkOI3TFNCWZkBVf9Ge
	IwjqsMasnizqPzp84I/Z4wB3uhYawzN2Q/67rzZrR3YQrQUw3pPPY+SLcnGtSIZSLZiUjzcpWu2
	TAI9+3Va0KahA7VMaZQuvCpjazay6iQGDC8r2zKet3XYcP805MPVciAG8bevGxt0pJlgQobojZt
	2g6p65dNhtRRJMsIIOnOBhWvN+7v8qfVyFOs/OBttsZrhtx2hd5WTPxxanR28oWvfR2IRIsBzol
	Y0OcO0SLlY1gzgMdEpE+AeCKsNvn8cTFb+iNYktvlD1kA==
X-Received: by 2002:a17:903:2f10:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2dd8e7aa5afmr63174535ad.20.1789570012227;
        Wed, 16 Sep 2026 07:46:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fe00sm13298065ad.12.2026.09.16.07.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:46:51 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:16:39 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: David Gow <david@davidgow.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, ynorov@nvidia.com, joelagnelf@nvidia.com, 
	fujita.tomonori@gmail.com, linkmauve@linkmauve.fr, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH V5 2/2] rust: kernel: Add KUnit tests for powerpc
 ARCH_WARN_ASM bug table emission
Message-ID: <aqqqKyquDoisxvZL@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260915090453.1227034-1-mkchauras@gmail.com>
 <20260915090453.1227034-3-mkchauras@gmail.com>
 <236f1c15-9532-405a-818d-9bf52349f25a@davidgow.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <236f1c15-9532-405a-818d-9bf52349f25a@davidgow.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_074653_445880_E5203FDF 
X-CRM114-Status: GOOD (  32.20  )
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

Wy4uLl0KPiBUaGlzIHdvcmtzIGZvciBtZSB1bmRlciBRRU1VLCBidXQgSSBoYXZlIGEgY291cGxl
IG9mIHNtYWxsIHN1Z2dlc3Rpb25zLgo+IAo+IDEuIFlvdSBzaG91bGQgdXNlIHRoZSBrZXJuZWwg
Q1N0ciBhbmQga2VybmVsOjpmZmk6OmNfKiB0eXBlcywgbm90IHRoZSBvbmVzCj4gZnJvbSBjb3Jl
LiBUaGlzIHByb3Blcmx5IG1hdGNoZXMgdGhlIHdheSB0aGUga2VybmVsIHVzZXMgLWZ1bnNpZ25l
ZC1jaGFyLgo+IEZvciBhbnkgYXJjaGl0ZWN0dXJlcyB3aGVyZSBjaGFyIGlzIG5vcm1hbGx5IHNp
Z25lZCwgdGhpcyB3b3VsZCBmYWlsIHRvCj4gYnVpbGQuIFdoaWNoIGJyaW5ncyBtZSB0b+KApgo+
IApUaGFua3MgZm9yIHBvaW50aW5nIGl0IG91dCwgaSBtaXNzZWQgdGhpcy4KPiAyLiBXaHkgaXMg
dGhpcyBzcGVjaWZpYyB0byBwb3dlcnBjPyBTaG91bGRuJ3QgaXQgYmUgcG9zc2libGUgdG8gZG8g
dGhpcyBpbiBhCj4gd2F5IHRoYXQgd29ya3MgYWNyb3NzIG1vcmUgYXJjaGl0ZWN0dXJlcz8gKElu
ZGVlZCwgdGhlIGN1cnJlbnQKPiBpbXBsZW1lbnRhdGlvbiBoYXBwZW5zIHRvIHBhc3Mgb24geDg2
XzY0IHdpdGggdGhlIGFib3ZlIGZpeCwgdGhvdWdoIG1vcmUKPiB3b3VsZCBiZSBuZWVkZWQgZm9y
IG90aGVyIGFyY2hpdGVjdHVyZXMsIGFuZCB0aGVyZSdzIHByb2JhYmx5IGEgYmV0dGVyCj4gc29s
dXRpb24gb3ZlcmFsbCB3aGljaCBkb2Vzbid0IGhhcmRjb2RlIGEgc3BlY2lhbCBidWcgYWRkcmVz
cy4pCj4gCj4gU28gdGhpcyBzdGlsbCBzZWVtcyBsaWtlIGl0J3Mgc29tZXRoaW5nIHdvcnRoIGhh
dmluZywgYnV0IEknZCBtdWNoIHByZWZlciBpdAo+IHRvIG5vdCBiZSBhcmNoaXRlY3R1cmUtc3Bl
Y2lmaWMgaWYgd2UgY2FuIGF2b2lkIGl0Lgo+IAo+IENoZWVycywKPiAtLSBEYXZpZAo+IApUaGUg
ZGVwZW5kZW5jeSB0byBzdXBwb3J0IHRoZXNlIG9uIGFsbCBhcmNocyBhcyBpdCBpcyB3b3VsZCBi
ZSB0byBwcm9iZQp0aGUgaW1wbGVtZW50YXRpb24gYW5kIGZpZ3VyZSBvdXQgd2hpY2ggd2lsbCBh
Z2FpbiBjYXVzZSBpdCB0byBoYXZlIHNvbWUKYXJjaCBzcGVjaWZpYyBzdHVmZi4gSSBjb3VsZG4n
dCBmaW5kIGEgY2xlYW4gd2F5IG9mIGhhdmluZyBhbGwgdGhhdCBhdAp0aGUgc2FtZSBwbGFjZSB3
aXRob3V0IGEgbG90IG9mICNjZmcncyBzbyBpIGp1c3QgbWFkZSBpdCBwb3dlcnBjCnNwZWNpZmlj
LgoKVG9tb25vcmkgc2VudCBvdXQgYSBwYXRjaCB3aXRoIGEgc2luZ2xlIHRlc3QgdGhhdCdzIGFy
Y2ggYWdub3N0aWMsIGJ1dApmb3IgcHBjIEkgd291bGQgc3RpbGwgbGlrZSB0byBrZWVwIHRoZXNl
IGlmIHRoZSBtYWludGFpbmVyIGFncmVlcy4KClsuLi5dCj4gCj4gSXQnZCBiZSByZWFsbHkgbmlj
ZSB0byB1c2UgdGhlIHdhcm5fZmxhZ3MhKCkgbWFjcm8gaGVyZSAob3IgZXZlbiBhbGwgb2YKPiB3
YXJuX29uISgpIGluc3RlYWQgb2YgaGFyZGNvZGluZyBhIHNlcGFyYXRlIGltcGxlbWVudGF0aW9u
IGhlcmUuIEJ1dCBldmVuIGlmCj4gd2UgY2FuJ3QgKGR1ZSwgZS5nLiwgdG8gdGhlIG5lZWQgZm9y
IGdsb2JhbF9hc20hIHZzIGFzbSEpLCBpdCdkIGJlIG5pY2UgaWYKPiB0aGlzIHdlcmUgbW9yZSBz
aW1pbGFyIHRvIHRoZSB3YXJuX2ZsYWdzISgpIGltcGxlbWVudGF0aW9uLiBOb3Qgb25seSB3b3Vs
ZAo+IHRoYXQgcmVkdWNlIHRoZSBsaWtlbGlob29kIG9mIHRoZXNlIGRldmlhdGluZyBuZWVkbGVz
c2x5LCBidXQgaXQnZCBiZXR0ZXIKPiBzdXBwb3J0IG1vcmUgYXJjaGl0ZWN0dXJlcywgdG9vLgo+
IAo+IEZvciBleGFtcGxlLCB0aGUgY29tbWVudGVkICJ7c2l6ZX0iIHdvdWxkIGhlbHAgb24gYXJj
aGl0ZWN0dXJlcyB3aGVyZSBzaXplCj4gaXNuJ3QgbmVlZGVkLgo+IApMZXQgbWUgdHJ5IHRoaXMu
ClsuLi5dCj4gPiArICAgIC8vLyBXaXRoIGBDT05GSUdfREVCVUdfQlVHVkVSQk9TRWAgdGhlIGVu
dHJ5IG11c3QgcmVjb3JkIGEgbm9uLW51bGwgZmlsZQo+ID4gKyAgICAvLy8gcG9pbnRlciBwb2lu
dGluZyBiYWNrIGludG8gdGhpcyBzb3VyY2UgZmlsZS4KPiA+ICsgICAgI1t0ZXN0XQo+ID4gKyAg
ICAjW2NmZyhDT05GSUdfREVCVUdfQlVHVkVSQk9TRSldCj4gPiArICAgIGZuIGJ1Z19lbnRyeV9m
aWxlKCkgewo+ID4gKyAgICAgICAgdXNlIGNvcmU6OmZmaTo6Q1N0cjsKPiAKPiBQbGVhc2UgZG9u
J3QgdXNlIGNvcmU6OmZmaTo6KiBpbiB0aGUga2VybmVsLiBUaGUga2VybmVsIHByb3ZpZGVzIGl0
cyBvd24KPiBDU3RyIGFuZCBjX2NoYXIgaW1wbGVtZW50YXRpb25zLiBPdGhlcndpc2UsIHRoaXMg
Y2FuIGxlYWQgdG8gaXNzdWVzIGFzIHRoZQo+IGtlcm5lbCBidWlsZHMgd2l0aCAtZnVuc2lnbmVk
LWNoYXIsIGJ1dCBjb3JlOjpmZmkgd2lsbCB1c2UgdGhlIGFyY2hpdGVjdHVyZQo+IGRlZmF1bHQu
Cj4gClN1cmUuCgo+ID4gKwo+ID4gKyAgICAgICAgYXNzZXJ0ISh0cmFwX2FkZHIoKSAhPSAwKTsK
PiA+ICsgICAgICAgIGxldCBlbnRyeSA9IHVuc2FmZSB7IGJpbmRpbmdzOjpmaW5kX2J1Zyh0cmFw
X2FkZHIoKSkgfTsKPiA+ICsgICAgICAgIGFzc2VydCEoIWVudHJ5LmlzX251bGwoKSk7Cj4gPiAr
Cj4gPiArICAgICAgICBsZXQgbXV0IGZpbGVfcHRyOiAqY29uc3QgY29yZTo6ZmZpOjpjX2NoYXIg
PSBjb3JlOjpwdHI6Om51bGwoKTsKPiAKPiBBZ2FpbiwgY29yZTo6ZmZpOjpjX2NoYXIgc2hvdWxk
IGJlIGF2b2lkZWQgaW4ga2VybmVsIGNvZGUuIFVzZQo+IFtrZXJuZWw6Ol1mZmk6Y19jaGFyCj4g
ClN1cmUuClsuLi5dCj4gPiArICAgIC8vLyBXaXRoIGBDT05GSUdfREVCVUdfQlVHVkVSQk9TRWAg
dGhlIHJlY29yZGVkIGxpbmUgbnVtYmVyIG11c3QgYmUKPiA+ICsgICAgLy8vIG5vbi16ZXJvIChh
IHplcm8gbGluZSB3b3VsZCBtZWFuIHRoZSBhc20gb3BlcmFuZCB3YXMgbm90IHN1YnN0aXR1dGVk
KS4KPiA+ICsgICAgI1t0ZXN0XQo+ID4gKyAgICAjW2NmZyhDT05GSUdfREVCVUdfQlVHVkVSQk9T
RSldCj4gPiArICAgIGZuIGJ1Z19lbnRyeV9saW5lKCkgewo+ID4gKyAgICAgICAgYXNzZXJ0ISh0
cmFwX2FkZHIoKSAhPSAwKTsKPiA+ICsgICAgICAgIGxldCBlbnRyeSA9IHVuc2FmZSB7IGJpbmRp
bmdzOjpmaW5kX2J1Zyh0cmFwX2FkZHIoKSkgfTsKPiA+ICsgICAgICAgIGFzc2VydCEoIWVudHJ5
LmlzX251bGwoKSk7Cj4gPiArCj4gPiArICAgICAgICBsZXQgbXV0IGZpbGVfcHRyOiAqY29uc3Qg
Y29yZTo6ZmZpOjpjX2NoYXIgPSBjb3JlOjpwdHI6Om51bGwoKTsKPiAKPiBBbmQgYWdhaW4uCj4g
ClN1cmUgCgpSZWdhcmRzLApNdWtlc2gKWy4uLl0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
