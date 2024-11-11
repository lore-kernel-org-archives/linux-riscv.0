Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B181D3ABD2
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=32FvILjUkH6qcIpLAgtvAkGaFSvCwPZ05mRlmZxn6x4=; b=t+NVYxU/ED/Iny
	G7845WgYKFzqtUWYG1uWxTf+kSnixs51nKyzG1BqeV6kUxA3QdnPYkMBxeDDutIYmC9g+W+B8Jr2T
	OB4lRGoMluIsv1oQMrVv7lFnCl/VEPQVkETLtX/ssPvDmA50O0UEerm060qUfYNpnJhhDJ73aEsJT
	QE9gBhq8oxY+o+wKjNZZ6Kt0X9l3oQOzIngCg5yMAxRiz+C0QoWYM/BGSMHZyAuCpCdycodPKjyfp
	xKC4gsze7W5uZKSxCMg2e4BTFweDPxiKAeD/hFtdzs00wwtxp/VUSl2JjPkiSdbJjwR/sFxzKOpqi
	ulSrrbeJe5heIHarm6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAY4k-00000000hTA-0QDN;
	Mon, 11 Nov 2024 17:19:42 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAY4h-00000000hSA-43Ma
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 17:19:41 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-460b295b9eeso387551cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 09:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731345578; x=1731950378; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMzqlhKEODr6U1uSie4LDo+kpQk5NIsCRHNo8Jc71/c=;
        b=ZerEGZGUhbPjK7FL0VoGpfmej5hdLCifUUkUzNfv5dLTmfSMKFiz4A9H3CaEK7zBu4
         fzhgwCXnScxI3jb+TFYJXjrmbO7vSNpm5fPTJNzjFLXbrK7Aa5lBN81dwwJqcI6h7/mS
         0awC2en79oFbV/OIF+wBG6PT426j0zIA3DHTcwMzLtJH97GET8e/fwd53CAv5DawnYAe
         Px00UpDlRWTqqUJGD4yBircedAdLA1i0FmNwtFhTv+o7i1z4f1SnkFdxL1P5UhOpavKM
         qyk0/dpD+mAUzgB2j/X5GFCf/LLY+eKZXVyH5edFvHC/4cQy47EUZ6c8nhXUkE3DE6ga
         dqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731345578; x=1731950378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMzqlhKEODr6U1uSie4LDo+kpQk5NIsCRHNo8Jc71/c=;
        b=p9x9vpSsQWx3edCp3s+yCzdKgBGJ9deUu4ZoDbTttyk/T/edq7Y/Ejk5AAerybvJBX
         cz0Xa1w4b4blesTwiQdN2AHfvxrsINNzazFeQBu2rLiSvriV65XKMQp7Pneq9STLcqk/
         256+Yst8mYl0Tck9n/2jcy4XXBvVuT4nAZClQztpDVKg//Cx91HIrDl2ByJI2YOpPKlL
         HjdUeMXOFVNnt/3p6NdFWeD7Si1+FGxa0Uw7mU+nR1ydLCJBAZlHa+IRC1UXIv6Bnyt2
         T3E+vlV4Z4CnPm8/HBmasZ3gODII/ZcC1Nj2TnEsrOxSAlyT3fhm4YfWRY+oNlZGMl76
         Yu+g==
X-Forwarded-Encrypted: i=1; AJvYcCV+rRnR2XVdZRlrzwVapPRmqkwx0wSIdrRJ0cZ6TufwvwbgjSHGgMtMBu/WBpcgz8abn10vOFI0uPBXPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOWtEVB2maD2U0NsC0KyUGm4qZkJj6n7CptS6iJJgRyizihZYc
	RZ+sWeVwF5mAd3ZSsdnedHa+0bOjM4GoMUZGtgrWqwrWvBC1Ck00N/cPpdxwMmKbjyGShtq0q2k
	1nNW53KjOHpjIGfQg0cUpbpaCbWj1jEv1Mgmo
X-Gm-Gg: ASbGnctFloNA8/ZWYNnpeT25QMscjW5JQPUUrgEKj5figOSqwQlFT1FHUVMkNYwwqxR
	s06yFDIj/9D2QTg3SKhyvdFpVOKpW6PAgZeqr/Fg0rBoyilD1Cx9iwM1PhYOQ7XY=
X-Google-Smtp-Source: AGHT+IFbKxYUeHJb8Wx9iqiLZDDt6pXqnwG/JbMcQ32dlJCIWMKZfzz8w6NjeMRTo+i0nq2LtGTTXLrW54me0Z7epbE=
X-Received: by 2002:a05:622a:3d1:b0:461:3e03:738b with SMTP id
 d75a77b69052e-46317e478a2mr4046511cf.19.1731345578094; Mon, 11 Nov 2024
 09:19:38 -0800 (PST)
MIME-Version: 1.0
References: <20241026121758.143259-1-irogers@google.com> <CAP-5=fXf9HtqKZyvfXNbKLTB-dL_Ax5Hd0_Gn1J-y0T1SE9wLQ@mail.gmail.com>
 <78eb729c-7594-460f-9d79-97fb683d8b5e@linaro.org> <CAHBxVyFXWpczMmWJbpWoLUjQ4nfNC2_h1yZqSd7kSr6N8Rvm5Q@mail.gmail.com>
 <d9bfd75a-003a-4f65-abba-b8bcaad13682@linaro.org>
In-Reply-To: <d9bfd75a-003a-4f65-abba-b8bcaad13682@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 11 Nov 2024 09:19:26 -0800
Message-ID: <CAP-5=fUHjxL5QbsyQQU-3EYiVhiO6wt=F5MfSfDcAffKP7WWAg@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Prefer sysfs/JSON events also when no PMU is provided
To: James Clark <james.clark@linaro.org>
Cc: Atish Kumar Patra <atishp@rivosinc.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ben Gainey <ben.gainey@arm.com>, 
	Junhao He <hejunhao3@huawei.com>, linux-riscv@lists.infradead.org, beeman@rivosinc.com, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Ze Gao <zegao2021@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Dominique Martinet <asmadeus@codewreck.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_091940_015974_C64306BA 
X-CRM114-Status: GOOD (  51.07  )
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

T24gTW9uLCBOb3YgMTEsIDIwMjQgYXQgMjo0NeKAr0FNIEphbWVzIENsYXJrIDxqYW1lcy5jbGFy
a0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+Cj4KPiBPbiAwOC8xMS8yMDI0IDY6MzcgcG0sIEF0aXNo
IEt1bWFyIFBhdHJhIHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgOCwgMjAyNCBhdCA0OjE24oCvQU0g
SmFtZXMgQ2xhcmsgPGphbWVzLmNsYXJrQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4KPiA+
Pgo+ID4+IE9uIDA3LzExLzIwMjQgMTg6NTEsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPj4+IE9uIFNh
dCwgT2N0IDI2LCAyMDI0IGF0IDU6MTjigK9BTSBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5j
b20+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IEF0IHRoZSBSSVNDLVYgc3VtbWl0IHRoZSB0b3BpYyBv
ZiBhdm9pZGluZyBldmVudCBkYXRhIGJlaW5nIGluIHRoZQo+ID4+Pj4gUklTQy1WIFBNVSBrZXJu
ZWwgZHJpdmVyIGNhbWUgdXAuIFRoZXJlIGlzIGEgcHJlZmVyZW5jZSBmb3Igc3lzZnMvSlNPTgo+
ID4+Pj4gZXZlbnRzIGJlaW5nIHRoZSBwcmlvcml0eSB3aGVuIG5vIFBNVSBpcyBwcm92aWRlZCBz
byB0aGF0IGxlZ2FjeQo+ID4+Pj4gZXZlbnRzIG1heWJlIHN1cHBvcnRlZCB2aWEganNvbi4gT3Jp
Z2luYWxseSBNYXJrIFJ1dGxhbmQgYWxzbwo+ID4+Pj4gZXhwcmVzc2VkIGF0IExQQyAyMDIzIHRo
YXQgZG9pbmcgdGhpcyB3b3VsZCByZXNvbHZlIGJ1Z3Mgb24gQVJNIEFwcGxlCj4gPj4+PiBNPyBw
cm9jZXNzb3JzLCBidXQgSmFtZXMgQ2xhcmsgbW9yZSByZWNlbnRseSB0ZXN0ZWQgdGhpcyBhbmQg
YmVsaWV2ZXMKPiA+Pj4+IHRoZSBkcml2ZXIgaXNzdWVzIHRoZXJlIG1heSBub3QgaGF2ZSBleGlz
dGVkIG9yIGhhdmUgYmVlbiByZXNvbHZlZC4gSW4KPiA+Pj4+IGFueSBjYXNlLCBpdCBpcyBpbmNv
bnNpc3RlbnQgdGhhdCB3aXRoIGEgUE1VIGV2ZW50IG5hbWVzIGF2b2lkIGxlZ2FjeQo+ID4+Pj4g
ZW5jb2RpbmdzLCBidXQgd2hlbiB3aWxkY2FyZGluZyBQTVVzIChpZSB3aXRob3V0IGEgUE1VIHdp
dGggdGhlIGV2ZW50Cj4gPj4+PiBuYW1lKSB0aGUgbGVnYWN5IGVuY29kaW5ncyBoYXZlIHByaW9y
aXR5Lgo+ID4+Pj4KPiA+Pj4+IFRoZSBwYXRjaCBkb2luZyB0aGlzIHdvcmsgd2FzIHJldmVydGVk
IGluIGEgdjYuMTAgcmVsZWFzZSBjYW5kaWRhdGUKPiA+Pj4+IGFzLCBldmVuIHRob3VnaCB0aGUg
cGF0Y2ggd2FzIHBvc3RlZCBmb3Igd2Vla3MgYW5kIGhhZCBiZWVuIG9uCj4gPj4+PiBsaW51eC1u
ZXh0IGZvciB3ZWVrcyB3aXRob3V0IGlzc3VlLCBMaW51cyB3YXMgaW4gdGhlIGhhYml0IG9mIHVz
aW5nCj4gPj4+PiBleHBsaWNpdCBsZWdhY3kgZXZlbnRzIHdpdGggdW5zdXBwb3J0ZWQgcHJlY2lz
aW9uIG9wdGlvbnMgb24gaGlzCj4gPj4+PiBOZW92ZXJzZS1OMS4gVGhpcyBtYWNoaW5lIGhhcyBT
TEMgUE1VIGV2ZW50cyBmb3IgYnVzIGFuZCBDUFUgY3ljbGVzCj4gPj4+PiB3aGVyZSBBUk0gZGVj
aWRlZCB0byBjYWxsIHRoZSBldmVudHMgYnVzX2N5Y2xlcyBhbmQgY3ljbGVzLCB0aGUgbGF0dGVy
Cj4gPj4+PiBiZWluZyBhbHNvIGEgbGVnYWN5IGV2ZW50IG5hbWUuIEFSTSBoYXZlbid0IHJlbmFt
ZWQgdGhlIGN5Y2xlcyBldmVudAo+ID4+Pj4gdG8gYSBtb3JlIGNvbnNpc3RlbnQgY3B1X2N5Y2xl
cyBhbmQgYXZvaWRlZCB0aGUgcHJvYmxlbS4gV2l0aCB0aGVzZQo+ID4+Pj4gY2hhbmdlcyB0aGUg
cHJvYmxlbWF0aWMgZXZlbnQgd2lsbCBub3cgYmUgc2tpcHBlZCwgYSBsYXJnZSB3YXJuaW5nCj4g
Pj4+PiBwcm9kdWNlZCwgYW5kIHBlcmYgcmVjb3JkIHdpbGwgY29udGludWUgZm9yIHRoZSBvdGhl
ciBQTVUgZXZlbnRzLiBUaGlzCj4gPj4+PiBzb2x1dGlvbiB3YXMgcHJvcG9zZWQgYnkgQXJuYWxk
by4KPiA+Pj4+Cj4gPj4+PiBUd28gbWlub3IgY2hhbmdlcyBoYXZlIGJlZW4gYWRkZWQgdG8gaGVs
cCB3aXRoIHRoZSBlcnJvciBtZXNzYWdlIGFuZAo+ID4+Pj4gdG8gd29yayBhcm91bmQgaXNzdWVz
IG9jY3VycmluZyB3aXRoICJwZXJmIHN0YXQgbWV0cmljcyAoc2hhZG93IHN0YXQpCj4gPj4+PiB0
ZXN0Ii4KPiA+Pj4+Cj4gPj4+PiBUaGUgcGF0Y2hlcyBoYXZlIG9ubHkgYmVlbiB0ZXN0ZWQgb24g
bXkgeDg2IG5vbi1oeWJyaWQgbGFwdG9wLgo+ID4+Pgo+ID4+PiBIaSBBdGlzaCBhbmQgSmFtZXMs
Cj4gPj4+Cj4gPj4+IENvdWxkIEkgZ2V0IHlvdXIgdGFncyBmb3IgdGhpcyBzZXJpZXM/Cj4gPj4+
Cj4gPgo+ID4gSGkgSWFuLAo+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoZXMuIEl0IGRlZmluaXRl
bHkgaGVscHMgdG8gaGF2ZSBhIGNsZWFuIHNsYXRlCj4gPiBpbXBsZW1lbnRhdGlvbgo+ID4gZm9y
IHRoZSBwZXJmIHRvb2wuIEhvd2V2ZXIsIEkgaGF2ZSBzb21lIG9wZW4gcXVlc3Rpb25zIGFib3V0
IG90aGVyIHVzZSBjYXNlcwo+ID4gdGhhdCB3ZSBkaXNjdXNzZWQgZHVyaW5nIHRoZSBSVkkgU3Vt
bWl0Lgo+ID4KPiA+Pj4gVGhlIHBhdGNoZXMgd2VyZSBvcmlnaW5hbGx5IG1vdGl2YXRlZCBieSB3
YW50aW5nIHRvIG1ha2UgdGhlIGJlaGF2aW9yCj4gPj4+IG9mIGV2ZW50cyBwYXJzZWQgbGlrZSAi
Y3ljbGVzIiBtYXRjaCB0aGF0IG9mICJjcHUvY3ljbGVzLyIsIHRoZSBQTVUgaXMKPiA+Pj4gd2ls
ZGNhcmRlZCB0byAiY3B1IiBpbiB0aGUgZmlyc3QgY2FzZS4gVGhpcyB3YXMgZGl2ZXJnZW50IGJl
Y2F1c2Ugb2YKPiA+Pj4gQVJNIHdlIHN3aXRjaGVkIGZyb20gcHJlZmVycmluZyBsZWdhY3kgKHR5
cGUgPSBQRVJGX1RZUEVfSEFSRFdBUkUsCj4gPj4+IGNvbmZpZyA9IFBFUkZfQ09VTlRfSFdfQ1BV
X0NZQ0xFUykgdG8gc3lzZnMvanNvbiAodHlwZT08Y29yZSBQTVUncwo+ID4+PiB0eXBlPiwgY29u
ZmlnPTxlbmNvZGluZyBmcm9tIGV2ZW50Pikgd2hlbiBhIFBNVSBuYW1lIHdhcyBnaXZlbi4gVGhp
cwo+ID4+PiBhbGlnbnMgd2l0aCBSSVNDLVYgd2FudGluZyB0byB1c2UganNvbiBlbmNvZGluZ3Mg
dG8gYXZvaWQgY29tcGxleGl0eQo+ID4+PiBpbiB0aGUgUE1VIGRyaXZlci4KPiA+Pj4KPiA+Pgo+
ID4+IEkgY291bGRuJ3QgZmluZCB0aGUgdGhyZWFkLCBidXQgSSByZW1lbWJlciBmYWlybHkgcmVj
ZW50bHkgaXQgd2FzCj4gPj4gbWVudGlvbmVkIHRoYXQgUklTQy1WIHdvdWxkIGJlIHN1cHBvcnRp
bmcgdGhlIGxlZ2FjeSBldmVudHMgYWZ0ZXIgYWxsLAo+ID4+IG1heWJlIGl0IHdhcyBhIGNvbW1l
bnQgZnJvbSBBdGlzaD8gSSdtIG5vdCBzdXJlIGlmIHRoYXQgY2hhbmdlcyB0aGUKPiA+PiByZXF1
aXJlbWVudHMgZm9yIHRoaXMgb3Igbm90Pwo+ID4+Cj4gPj4gSSBzdGlsbCBjYW4ndCByZWFsbHkg
aW1hZ2luZSBob3cgdG9vbGluZyB3b3VsZCB3b3JrIGlmIGV2ZXJ5IHRvb2wgaGFzIHRvCj4gPj4g
bWFpbnRhaW4gdGhlIG1hcHBpbmdzIG9mIGJhc2ljIGV2ZW50cyBsaWtlIGluc3RydWN0aW9ucyBh
bmQgYnJhbmNoZXMuCj4gPj4gRm9yIGV4YW1wbGUgYWxsIHRoZSBwZXJmX2V2ZW50X29wZW4gdGVz
dHMgaW4gbHRwIHVzZSB0aGUgbGVnYWN5IGV2ZW50cy4KPiA+Pgo+ID4KPiA+IE5vIGl0IGhhcyBu
b3QgY2hhbmdlZC4gV2hpbGUgdGhpcyBzZXJpZXMgaGVscHMgdG8gYXZvaWQgY2x1bmt5IHZlbmRv
cgo+ID4gc3BlY2lmaWMgZW5jb2RpbmdzCj4gPiBpbiB0aGUgZHJpdmVyIGZvciBwZXJmIHRvb2ws
IEkgYW0gc3RpbGwgdW5zdXJlIGhvdyB3ZSB3aWxsIG1hbmFnZQo+ID4gb3RoZXIgYXBwbGljYXRp
b25zCj4gPiAoZGlyZWN0bHkgcGFzc2luZyBsZWdhY3kgZXZlbnRzIHRocm91Z2ggcGVyZl9ldmVu
dF9vcGVuIG9yCj4gPiBwZXJmX2V2bGlzdF9fb3Blbikgd2lsbCB3b3JrLgo+ID4KPiA+IEkgaGF2
ZSBvbmx5IGFuZWNkb3RhbCBkYXRhIGFib3V0IGZvbGtzIHJlbHlpbmcgcGVyZiBsZWdhY3kgZXZl
bnRzCj4gPiBkaXJlY3RseSB0byBwcm9maWxlCj4gPiB0aGVpciBhcHBsaWNhdGlvbi4gQWxsIG9m
IHRoZW0gdXNlIG1vc3RseSBjeWNsZS9pbnN0cnVjdGlvbiBldmVudHMgdGhvdWdoLgo+ID4gQXJl
IHRoZXJlIGFueSB1c2VycyB3aG8gdXNlIG90aGVyIGxlZ2FjeSBldmVudHMgZGlyZWN0bHkgd2l0
aG91dCBwZXJmIHRvb2wgPwo+ID4KPiA+IElmIG5vdCwgd2UgbWF5IGhhdmUgb25seSBjeWNsZS9p
bnN0cnVjdGlvbiBtYXBwaW5nIGluIHRoZSBkcml2ZXIgYW5kCj4gPiByZWx5IG9uIGpzb24gZm9y
IGV2ZXJ5dGhpbmcgZWxzZS4KPiA+IFRoZSBvdGhlciB1c2UgY2FzZSBpcyB2aXJ0dWFsaXphdGlv
bi4gSSBoYXZlIGJlZW4gcGxheWluZyB3aXRoIHRoZXNlCj4gPiBwYXRjaGVzIHRvIGZpbmQgYSBj
bGVhbiBzb2x1dGlvbiB0bwo+ID4gZW5hYmxlIGFsbCB0aGUgdXNlIGNhc2VzLiBJZiB5b3UgaGF2
ZSBhbnkgb3RoZXIgaWRlYXMsIHBsZWFzZSBsZXQgbWUga25vdy4KPiA+Cj4KPiBZZWFoIEkgd291
bGQgZXhwZWN0IGl0J3MgbW9zdGx5IGN5Y2xlcyBhbmQgaW5zdHJ1Y3Rpb25zLiBJIHNlYXJjaGVk
IGEKPiBiaXQgZm9yIFBFUkZfQ09VTlRfSFdfQlJBTkNIX01JU1NFUyBhbmQgb25seSBmb3VuZCB0
b29sL2RldmVsb3BlciB0eXBlCj4gdXNhZ2VzLCB3aGljaCBJIHN1cHBvc2Ugd2UgY291bGQgZXhw
ZWN0IHRvIGhhdmUgdG8gaGFuZGxlIHRoZSBtYXBwaW5ncwo+IGxpa2UgcGVyZi4gQWx0aG91Z2gg
aXQncyBub3QgdGhlIGVhc2llc3QgdGhpbmcgdG8gc2VhcmNoIGZvciBhbmQKPiBvYnZpb3VzbHkg
dGhhdCBvbmx5IGluY2x1ZGVzIG9wZW4gc291cmNlLgo+Cj4gVXNhZ2VzIGRvIGV4aXN0IHRob3Vn
aCwgdGhlcmUgYXJlIHBlb3BsZSBwb3N0aW5nIG9uIHN0YWNrIG92ZXJmbG93IHVzaW5nCj4gaXQs
IGFuZCBvdGhlciB2YXJpb3VzIGJ1ZyB0cmFja2VyIGxpc3RpbmdzLiBTbyB5b3Ugd291bGQgZXhw
ZWN0IHRob3NlCj4gc2FtZSB1c2VycyB0byBoYXZlIHRvIHVzZSByYXcgZXZlbnQgY29kZXMgYW5k
IHNvbWUgc3dpdGNoIHN0YXRlbWVudCB0bwo+IHBpY2sgdGhlIHJpZ2h0IG9uZSBmb3IgdGhlaXIg
aGFyZHdhcmUsIG9yIHVzZSBQZXJmLgoKSSBkb24ndCBoYXZlIGFueSBtYWdpYyB0byBzb2x2ZSB0
aGlzLiBNeSB0aG91Z2h0czoKCjEpIEkgdGhvdWdodCBsZWdhY3kgZXZlbnRzIHdlcmUganVzdCBn
b2luZyB0byBoYW5nIGFyb3VuZCBmb3JldmVyLAphbHRob3VnaCB0aGUgbmFtZSBoaW50aW5nIHRo
ZXknZCBraW5kIG9mIGJlZW4gZGVwcmVjYXRlZC4gQXQgTFBDICcyMwpBdGlzaCBhbmQgTWFyayBS
dXRsYW5kIG9yaWdpbmFsbHkgYXNrZWQgZm9yIHRoZSBzeXNmcy9qc29uIHRvIGJlIHRoZQpwcmVm
ZXJlbmNlLiBJIHRob3VnaHQgS2FuIHdhcyBnb2luZyB0byBwdXNoIGJhY2sgZ2l2ZW4gdGhlIHVw
aGVhdmFsLAplc3BlY2lhbGx5IHVwZGF0aW5nIGV2ZXJ5IHRlc3QgZXhwZWN0YXRpb24uIEl0IHdl
bnQgdGhyb3VnaCBidXQgd2UncmUKaW4gdGhpcyB3ZWlyZCBzdGF0ZSB3aGVyZSB3aWxkY2FyZCBl
dmVudHMgYXJlIGVuY29kZWQgdXNpbmcgbGVnYWN5IGFuZApQTVUgc3BlY2lmeWluZyBldmVudHMg
YXJlbid0LiBXaGF0IHRoaXMgc2VyaWVzIGhvcGVzIHRvIHNvbHZlLgoKMikgSSB0aGluayBpdCBp
cyBpbXBvcnRhbnQgdGhhdCBwZXJmIHRvb2wgYmUgYSByZWZlcmVuY2UKaW1wbGVtZW50YXRpb24g
d2hlcmUgb3RoZXJzIGNhbiBsb29rIChzdHJhY2UsIGV0Yy4pIHRvIGJhc2UgdGhlaXIKaW1wbGVt
ZW50YXRpb24uIE1vdmluZyBwZXJmIHRvIHN5c2ZzL2pzb24gaXMgMSBzdGVwIGNsb3NlciB0byBs
ZWdhY3kKZXZlbnQgZGVwcmVjYXRpb24uIFBsZWFzZSB5ZWxsIGlmIGRlcHJlY2F0aW9uIGlzbid0
IHdoYXQgaXMgd2FudGVkIGFzCnBlcnNvbmFsbHkgb3RoZXIgdGhhbiBjbGVhbmxpbmVzcyBJIGRv
bid0IG1pbmQuIElmIHdlIGRvIGRlY2lkZSBub3QgdG8KaGF2ZSBzeXNmcy9qc29uIGJlIHRoZSBw
cmlvcml0eSB0aGVuIEkgdGhpbmsgaXQgc2Vuc2libGUgdG8gcmV2ZXJ0IHRoZQpjaGFuZ2VzIG1h
a2luZyBpdCB0aGUgcHJpb3JpdHkgZm9yIGV2ZW50cyB0aGF0IHNwZWNpZnkgYSBQTVUuIEknZCBs
aWtlCnNvbWUgbGV2ZWwgb2YgY29uc2lzdGVuY3kuCgozKSBJJ2QgbGlrZSBldmVudCBwYXJzaW5n
IHRvIGJlIGEgbGlicmFyeSB0aGF0IGlzIGFzIGVhc3kgdG8gbGluawphZ2FpbnN0IGFzIGxpYmJw
ZiAoaS5lLiBub3QgYSB2aXJhbCBsaWNlbnNlKS4gRXZlbnQgcGFyc2luZyBpcyByZWFsbHkKanVz
dCBtYXBwaW5nIGFuIGV2ZW50IG5hbWUgdG8gMSBvciBtb3JlIHBlcmZfZXZlbnRfYXR0ci4gVGhl
IFBNVQphYnN0cmFjdGlvbiBpcyB0aWVkIGludG8gdGhlIGV2ZW50IHBhcnNpbmcsIGJ1dCB0aGlz
IGhhcyBvbmx5IGJlZW4KbW9yZSB0cnVlIHJlY2VudGx5LiBUaGUgZXZzZWwvZXZsaXN0IGlzIHRp
ZWQgaW50byBldmVudCBwYXJzaW5nIGJ1dAp0aGF0IGZlZWxzIHNlcGFyYWJsZS4gQXMgbW9zdCBq
c29uIGlzbid0IGRpc3RyaWJ1dGVkIHVuZGVyIGEgdmlyYWwKbGljZW5zZSB0aGlzIGZlZWxzIGFj
aGlldmFibGUsIHRoZW4gSSBzdXNwZWN0IG1vc3QgdG9vbHMgY2FuIHVzZSB0aGlzCmxpYnJhcnkg
cmF0aGVyIHRoYW4gaGF2ZSB0byByZWludmVudCBhIHdoZWVsLgoKU3RpbGwgbG9va2luZyBmb3Ig
dGFncyA6LSkKClRoYW5rcywKSWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
