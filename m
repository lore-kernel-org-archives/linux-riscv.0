Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED77C02193
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 19:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=at859VtjwkVNMMEvYoj7npAX8Sj+eoHLtT1rts9rqOs=; b=HGQtSSEp47EMio
	516xI95nuVgbyXre/jhXfZna4dqJat0MMiHVA4F/vUiwliCpxAxathmrCk7nC2O8c2RZN7bBlfTSC
	8kYQ8TnysubazXI8BonO2YKY3U8cYGRwtZ0JIDN+t6yKZMST58LnXJNh2yu4FdlFS442IH3yc0Ybw
	OVdAu10h0onDlpliXFN1XhPfMqZK/tjaZ2t3e6ZbEtzGSSaC1xrOEerwT0vHRP0HoT1xMNelXX2Dl
	ZX6ZjrwfKB1tlxVSaJaEVFMcy+uX8SlSAbvOuEzjxGXDWbh8KLLEBXaOdg3edThTY2MP5aBV4XdXH
	2yplvevWcBNDgBjkouFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfObz-00000001MUV-0OhA;
	Tue, 04 Feb 2025 19:29:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOQo-00000001L7Y-2098
	for linux-riscv@bombadil.infradead.org;
	Tue, 04 Feb 2025 19:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=i18llDbp3q6y0/w+gTxZyxhvyOXPpj+iA3QfM/7JUT4=; b=KkMhiD7/oza0Wswv96xDuFHkza
	miIiz6ToAnR73BKKxtOMldTCAKqMMSXQYbFe27onfM6JpjWyCHk4/Gw7aHrM749TNBox1NuVEeY3R
	ISuVLdr6BpmiOrj27MOV1waVSysPQs4m0Y3gEQA6IEtJMe8QKnfbwET/jJ7TbMY3b5mOkN9xyITN/
	AylICFhkt9f7HLT8vQquE7+V6Fz7KredYsYuZFzxGsquMweBtodxExoeMbRHGxPLV/4eIYEXSGBQb
	j2C+SmS7wMI4BrASrpHiHXjIuRtsFthJ96PbeI8kkN1kOSrFOoLneRPapxugwh8UQQNrpsHjH442B
	kZg1+z1Q==;
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOQj-0000000GOfn-2Z9C
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 19:17:57 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d04e5bd797so25775ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 11:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738696671; x=1739301471; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i18llDbp3q6y0/w+gTxZyxhvyOXPpj+iA3QfM/7JUT4=;
        b=opWnN/UgcN0w+TAp8t2oAG+Why2HRqGDv2dKmzKWqHNo8hzmD87+heu09r/0k4A8Bm
         EPAoi+Mmu/IP72fiU9XrMAl9R/1EwvkbZ785U/mGuJs3I62hpeU9M+iiz5eYme9cycU6
         tLeMEs65d9Wa4iESDiPpY9WJto5/S5saZKQVYNJRMPA4WLQY8/B/axNiivzydNwicMwG
         4sJH1Fk1ALFmX53lqw149Wt7Y4wvsyQWtk2Tkfq0zHRm9xd7G6DPjBfpbIVUjGIlRVe+
         Qs4JBeErxf4NZsMx5/IXKbVgOsLHLvcNp5moIO4e+qNozfQ5Tr7WYvi1ThLH9OXwCP79
         ahHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738696671; x=1739301471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i18llDbp3q6y0/w+gTxZyxhvyOXPpj+iA3QfM/7JUT4=;
        b=N/INTeIRlUXEdSsCvthHLorKlmq0GG+wGrff58ViI+gH+Fb/r1CD65bVala7nasgPm
         Atp5KYgsyYVX8WGGU90aafLw7cv+HR2ldxAULyqlKKbZWM/ZsvSszQsxm2VWV++h0VEN
         YOMqklxSrN+yivNXJjUAS0KtYE134A0Sq8Ktd3mu7LFpM73320h/htxF0rGqujZw5cw9
         p7xg2Mo24La5pv2+h+LzFIuLH94jXwZGKwh5Lu2uOBywywjGBaDjqsD9bo0EHjQBvX43
         O4uJ1T3U56+R4jRymnshH3QMH703I/FplXk3gF9YkfWM5uSIiOePYj/Z2kHI7tPGFBY/
         RW0g==
X-Forwarded-Encrypted: i=1; AJvYcCVyVqgw8LuHuO+8kPNL1flHFlvQNY8l3/9X8WRVLZVsstTDm09Sbo/ae3QQ5hoehCiyIDRD09YxFGLVBg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yws+PabCVRfsZqghMCp+Eh+LZa3X0qnUwtYQDrCU08iAEH9dmq1
	VKHH25GghDTS9ioGhJlVHIiI2xksqwQcSDYxLfO1gxVQsdgHTdlASIyQtt5h0vSohPXAZemec0s
	cyLuIV84UPzc6/MQWSmyGGkeU/6qsSW7Bf2gd
X-Gm-Gg: ASbGncuJ5zu/DlmRoCSXHliwJeJaN3/46yKRHjPKjcsKCatFhB+hVacAk3lCXVFMTF4
	9In05Dk9eVR98Ua817jJesanNqnP88een78VuFNXk4vNn5kEJ7uZmqIB6AS0CPAbMFslRaIcd4n
	EWH+ot9V7TYTeL+sVY6YxVVoQ=
X-Google-Smtp-Source: AGHT+IFolYWpFTnQsRdsrwOlOifUaBgvwudGG5wYq6BOxOFUog2J180QiONTDBpKLqE0BXd+LTekoBGthx3cwhLK2l0=
X-Received: by 2002:a05:6e02:1b03:b0:3d0:a9b:bf4b with SMTP id
 e9e14a558f8ab-3d03fbc124emr4771915ab.12.1738696671064; Tue, 04 Feb 2025
 11:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com> <Z6EStkn-YZ8zaO7u@ghost>
 <CAP-5=fXRz_8CKNz4Fr-=0yhKbf_QE2ND+PPykSAO5p8wcUz7xA@mail.gmail.com>
 <Z6EVwaOVYaKtaK1j@ghost> <CAP-5=fX1hCNWWmGJPKYxj93S=zM1-eRucqzb4WW5fB_sZBCRLg@mail.gmail.com>
 <Z6Eh1QLuqTbUKLCc@ghost> <CAP-5=fXZr8L4Z=Lb28QDZF8cbv2eJJEHSb0H9zcqSOB9cn5-9g@mail.gmail.com>
 <Z6FLDHz6V5L-HGR7@ghost> <CAP-5=fVk6N=FVXsJ9xRJZhYSh2sbmUkEPr5HqRd-pR7mbGts+w@mail.gmail.com>
 <Z6Jk_UN9i69QGqUj@ghost>
In-Reply-To: <Z6Jk_UN9i69QGqUj@ghost>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Feb 2025 11:17:39 -0800
X-Gm-Features: AWEUYZlVFnxotEtPCBotMGFHsGHFGTZrWjMIjpLeZvUSs1sflhNc56tRZVilEN8
Message-ID: <CAP-5=fVXAt3jbiTTBNwNVqWMmAc=9U_XatgC_o854kyUGjkg0Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] perf: Support multiple system call tables in the build
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_191753_810216_81CCF0A9 
X-CRM114-Status: GOOD (  64.53  )
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

T24gVHVlLCBGZWIgNCwgMjAyNSBhdCAxMTowNeKAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBGZWIgMDMsIDIwMjUgYXQgMDU6NTg6
MjlQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90ZToKPiA+IE9uIE1vbiwgRmViIDMsIDIwMjUgYXQg
MzowMuKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+
ID4gPiBPbiBNb24sIEZlYiAwMywgMjAyNSBhdCAxMjo1NDo1OVBNIC0wODAwLCBJYW4gUm9nZXJz
IHdyb3RlOgo+ID4gW3NuaXBdCj4gPiA+ID4gSSB0aGluayBpdCBtYWtlcyBzZW5zZSBpbiB0aGUg
a2VybmVsLCBhcyB0aGUgYnVpbHQgYmluYXJ5IGRvZXNuJ3QgaGF2ZQo+ID4gPiA+IGNyb3NzLXBs
YXRmb3JtIGNvbmNlcm5zLiBUaGlzIGlzIHByb2JhYmx5IGFsc28gdGhlIHJlYXNvbiB3aHkgdGhl
IHBlcmYKPiA+ID4gPiB0b29sIGhhcyBhbiBhcmNoIGRpcmVjdG9yeS4gTGV0IG1lIGtub3cgd2hh
dCB5b3UgdGhpbmsgaXMgdGhlIHJpZ2h0Cj4gPiA+ID4gZGlyZWN0aW9uIGZvciB0aGUgcGVyZiB0
b29sIHN5c2NhbGwgdGFibGUgY29kZS4KPiA+ID4KPiA+ID4gSSBhbSBoZXNpdGFudCBhYm91dCBt
b3ZpbmcgYWxsIG9mIHRoZSBhcmNoLXNwZWNpZmljIHN5c2NhbGwgZ2VuZXJhdGlvbgo+ID4gPiBm
bGFncyBpbnRvIGEgc2luZ2xlIGZpbGUuCj4gPgo+ID4gSW4gdGhlc2UgY2hhbmdlcyBJIGhhZCBh
IHNpbmdsZSBmaWxlIHRvIGJ1aWxkIHVwIGEgbWFwcGluZyBmcm9tIEVMRgo+ID4gbWFjaGluZSB0
byBzeXNjYWxsIHRhYmxlIGluIGFuIGFycmF5IGFuZCBJIHdhbnRlZCB0byBrZWVwIHRoZSBsb2dp
YyB0bwo+ID4gYnVpbGQgdGhlIGFycmF5IGFsb25nc2lkZSB0aGUgbG9naWMgdG8gYnVpbGQgdXAg
dGhlIGNvbXBvbmVudHMgb2YgdGhlCj4gPiBhcnJheSAtIHNvIHRoZSBpZmRlZnMgd2VyZSB2aXN1
YWxseSB0aGUgc2FtZS4gQXMgdGhlIHNjb3BlIGlzIGEgc2luZ2xlCj4gPiBmaWxlIGFuZCB0aGUg
dmFyaWFibGVzIGFyZSBzdGF0aWMsIHRoaXMgY2FuIGdpdmUgdXNlZnVsIEMgY29tcGlsZXIKPiA+
ICJ1bnVzZWQgZGVmaW5pdGlvbiIgd2FybmluZ3MuIFlvdSBjYW4gdHJpY2sgdGhlIGxpbmtlciB0
byBnaXZlIHNpbWlsYXIKPiA+IHdhcm5pbmdzIGF0IHRoZSBzY29wZSBvZiBhIGZpbGUsIHNvIHRo
aXMgaXNuJ3QgYSBkZWFsIGJyZWFrZXIuCj4gPgo+ID4gPiBUaGVyZSBpcyBjdXJyZW50bHkgYSBy
ZWFsbHkgY2xlYW4gc2VwYXJhdGlvbgo+ID4gPiBiZXR3ZWVuIHRoZSBhcmNoaXRlY3R1cmVzIGFu
ZCBpdCdzIHBvc3NpYmxlIHRvIGdlbmVyYXRlIGFsbCBvZiB0aGUKPiA+ID4gc3lzY2FsbCB0YWJs
ZXMgZm9yIGFsbCBvZiB0aGUgYXJjaGl0ZWN1dHVyZXMgYmFzZWQgb24gdGhlIHBhdGhzIHRvIHRo
ZQo+ID4gPiBzeXNjYWxsIHRhYmxlLgo+ID4KPiA+IFRoaXMgZG9lc24ndCBoYXBwZW4gY3VycmVu
dGx5IGFzIHRoZSBidWlsZCBvZiB0aGUgYXJjaCBkaXJlY3RvcnkgaXMgdG8KPiA+IGFkZCBpbiAk
KFNSQ0FSQ0gpIG9ubHkuIFNvCj4gPiB0b29scy9wZXJmL2FyY2gvYXJtNjQvZW50cnkvc3lzY2Fs
bHMvTWFrZWZpbGUuc3lzY2FsbHMgd2lsbCBvbmx5IGJlCj4gPiBpbmNsdWRlZCBpbnRvIHRoZSBi
dWlsZCBpZiBTUkNBUkNIPT1hcm02NC4gQXMgSSd2ZSBzYWlkIEknbSBhZ2FpbnN0Cj4gPiB0aGUg
aWRlYSBvZiB0aGUgYXJjaCBkaXJlY3RvcnkgYXMgaXQgbmVhcmx5IGFsd2F5cyBjYXVzZXMgY3Jv
c3MKPiA+IHBsYXRmb3JtIHByb2JsZW1zIC0gbm90IGFuIGlzc3VlIGluIGEgTGludXgga2VybmVs
IGJ1aWxkLiBXZSByZWNlbnRseQo+ID4gZWxpbWluYXRlZCBkd2FyZi1yZWdzIGZvciB0aGlzIHJl
YXNvbiAoYW5kIGhvcGVmdWxseSBmaXhpbmcgdXAgY3Jvc3MKPiA+IHBsYXRmb3JtIGRpc2Fzc2Vt
Ymx5IGlzc3VlcyBhcyBhIGNvbnNlcXVlbmNlKToKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI0MTEwODIzNDYwNi40Mjk0NTktMS1pcm9nZXJzQGdvb2dsZS5jb20vCj4gPiBXZSBj
b3VsZCBoYXZlIHRoZSBzeXNjYWxsIHRhYmxlIGxvZ2ljIG5vdCB1bmRlciBhcmNoIGFuZCBnZW5l
cmF0ZQo+ID4gbXVsdGlwbGUgZmlsZXMsIGJ1dCB3ZSdkIGJlIGFkZGluZyBleHRyYSBsb2dpYyB0
byBwdWxsIHRoaW5ncyBhcGFydCB0bwo+ID4gdGhlbiBwdWxsIHRoaW5ncyBiYWNrIHRvZ2V0aGVy
IGFnYWluLCB3aGljaCBmZWVscyBsaWtlIHVubmVjZXNzYXJ5Cj4gPiBjb21wbGV4aXR5Lgo+ID4K
PiA+IEl0IHNlZW1zIGluIHlvdXIgY2hhbmdlcyB0aGUgS2J1aWxkIGFuZCBNYWtlZmlsZS5zeXNj
YWxscyBhcmUgcnVubmluZwo+ID4gaW4gdGhlIGFyY2ggZGlyZWN0b3J5IC0gdGhpcyBmZWVscyBs
aWtlIGEgbG90IG9mIHBlY3VsaWFyIGFuZAo+ID4gc2VwYXJhdGVkIGJ1aWxkIGxvZ2ljIGZvciBq
dXN0IGl0ZXJhdGluZyBvdmVyIGEgYnVuY2ggb2YgYXJjaAo+ID4gZGlyZWN0b3J5IG5hbWVzIGFu
ZCBjYWxsaW5nIGEgc2hlbGwgZnVuY3Rpb24gb24gdGhlbSAtIGFsYmVpdCB3aXRoCj4gPiBzb21l
IGFyY2ggc3BlY2lmaWMgcGFyYW1ldGVycy4gVGhlcmUncyBhbHNvIGFuIGV4dHJhIEMgaGVscGVy
Cj4gPiBleGVjdXRhYmxlIGluIHlvdXIgY29kZS4KPgo+IFllcywgSSBjYW4gdW5kZXJzdGFuZCB3
aHkgeW91IGJlIG9wcG9zZWQgdG8gdGhhdCBhbmQgSSBkb24ndCBoYXZlIGEgZ29vZAo+IGNvdW50
ZXJhcmd1bWVudC4KPgo+ID4gSSBraW5kIG9mIGxpa2UgdGhhdCBJIGdldCBhIHNpbmdsZSBoZWFk
ZXIKPiA+IHRoYXQgaXMgdGhlIHNhbWUgYWNyb3NzIGFsbCBhcmNoaXRlY3R1cmVzIGFuZCB3aXRo
IG5vIG1vcmUgYnVpbGQKPiA+IHN5c3RlbSByZXF1aXJlbWVudHMgdGhhbiB0byBzdXBwb3J0IGlm
ZGVmcyAtIGluIGZhY3QgdGhlIGlmZGVmcyBhcmUKPiA+IGp1c3QgdGhlcmUgdG8ga2VlcCB0aGUg
Y29kZSBzaXplIGRvd24gdGhlcmUgaXMgYSAjZGVmaW5lIHRvIG1ha2UgdGhlbQo+ID4gYWxsIGhh
dmUgbm8gZWZmZWN0LiBJIGhlYXIgeW91ciAiY2xlYW4gc2VwYXJhdGlvbiIgYnV0IEkgYWxzbyB0
aGluawo+ID4gc2VwYXJhdGlvbiBhY3Jvc3MgZmlsZXMgY2FuIG1ha2UgdGhpbmdzIGhhcmRlciB0
byByZWFkLCBzdGF0ZSBpcyBpbiA+MQo+ID4gcGxhY2UuIEkndmUgdHJpZWQgdG8gY2xlYW5seSBz
ZXBhcmF0ZSB3aXRoaW4gdGhlIHNjcmlwdC4KPiA+Cj4gPiBJIGRvIHRoaW5rIHRoZXJlIGlzIHNv
bWUgdGVjaCBkZWJ0IGluIGJvdGggY2hhbmdlcy4gTXk6Cj4gPiBgYGAKPiA+ICNpZiBkZWZpbmVk
KEFMTF9TWVNDQUxMVEJMKSB8fCBkZWZpbmVkKF9fcmlzY3YpCj4gPiAjaWYgX19CSVRTX1BFUl9M
T05HICE9IDY0Cj4gPiBFT0YKPiA+IGJ1aWxkX3RhYmxlcyAiJHRvb2xzX2Rpci9zY3JpcHRzL3N5
c2NhbGwudGJsIiAiJG91dGZpbGUiCj4gPiBjb21tb24sMzIscmlzY3YsbWVtZmRfc2VjcmV0IEVN
X1JJU0NWCj4gPiBlY2hvICIjZWxzZSIgPj4gIiRvdXRmaWxlIgo+ID4gYnVpbGRfdGFibGVzICIk
dG9vbHNfZGlyL3NjcmlwdHMvc3lzY2FsbC50YmwiICIkb3V0ZmlsZSIKPiA+IGNvbW1vbiw2NCxy
aXNjdixybGltaXQsbWVtZmRfc2VjcmV0IEVNX1JJU0MKPiA+IFYKPiA+IGNhdCA+PiAiJG91dGZp
bGUiIDw8RU9GCj4gPiAjZW5kaWYgLy9fX0JJVFNfUEVSX0xPTkcgIT0gNjQKPiA+IGBgYAo+ID4g
bWVhbnMgdGhlIHBlcmYgYmluYXJ5IHdvcmQgc2l6ZSBkZXRlcm1pbmVzIHRoZSBzeXNjYWxsIHRh
YmxlIHN1cHBvcnQuCj4gPiBUaGlzIGlzIGJlY2F1c2UgdGhlIGVfbWFjaGluZSBpbiB0aGUgRUxG
IGhlYWRlciBpc24ndCB1bmlxdWUgaW4gdGhlc2UKPiA+IHR3byBjYXNlcyBhbmQgaGF2aW5nIGJv
dGggdGFibGVzIHdvdWxkIGhhdmUgbm8gZWZmZWN0LiBZb3UndmUgbW92ZWQKPiA+IHRoaXMgaW50
byB0aGUgZW52IGFyY2ggbmFtZSBoYW5kbGluZywgYnV0IEkgdGhpbmsgaGF2aW5nID4xIHdheSB0
bwo+ID4gZW5jb2RlIGEgYmluYXJ5IHR5cGUgaXMgc3Vib3B0aW1hbC4gVGhlcmUgYXJlIHNvbWUg
RUxGIGZsYWcgQUJJIGJpdHMKPiA+IHRoYXQgcmVzb2x2ZSBkaXNhc3NlbWJsZXIgdGhpbmdzIG9u
IGNza3ksIHNvIHBlcmhhcHMgYSByZXNvbHV0aW9uIGlzCj4gPiB0byBwYXNzIEVMRiBmbGFncyBh
bG9uZyB3aXRoIHRoZSBtYWNoaW5lIHR5cGUuIEknbSBub3QgY2xlYXIgaW4geW91cgo+ID4gY2hh
bmdlIGhvdyAiMzJfcmlzY3YiIGlzIGdlbmVyYXRlZCB0byBzb2x2ZSB0aGUgc2FtZSBwcm9ibGVt
LiBJbW8sCj4gPiBpdCdkIGtpbmQgb2YgYmUgbmljZSBub3QgdG8gaW50cm9kdWNlIG5vdGlvbnMg
bGlrZSAiNjRfYXJtNjQiIGFzIHdlCj4gPiBzZWVtIHRvIGJlIGFsd2F5cyBtYXBwaW5nL25vcm1h
bGl6aW5nLy4uLiB0aGVzZSBkaWZmZXJlbnQgbm90aW9ucyBhbmQKPiA+IHRoZXkgZmVlbCBpbmhl
cmVudGx5IGJyaXR0bGUuCj4KPiBNYXliZSBpdCBpcyBicml0dGxlPyBJdCBjb3VsZCBiZSBtYXBw
ZWQgdG8gZV9tYWNoaW5lLCBidXQgdGhhdCBqdXN0Cj4gbWlnaHQgbm90IGJlIHJlYXNvbmFibGUg
dG8gd29yayBpbnRvIHRoZSBtZXRob2QgZnJvbSBteSBwYXRjaC4KPgo+ID4KPiA+ID4gV2hhdCBj
YXVzZXMgdGhlIGFyY2ggZGlyZWN0b3J5IHRvIGJlIGEgcGFpbiBmb3IgQmF6ZWw/IEkKPiA+ID4g
Z3Vlc3MgSSBhbSBtb3N0bHkgY29uZnVzZWQgd2h5IGl0IG1ha2VzIHNlbnNlIHRvIGNoYW5nZSB0
aGUga2VybmVsCj4gPiA+IE1ha2VmaWxlcyBpbiBvcmRlciB0byBhY2NvbWlkYXRlIGEgcmV3cml0
ZSBvZiB0aGUgYnVpbGQgc3lzdGVtIGluIEJhemVsCj4gPiA+IHRoYXQgaXNuJ3QgcGxhbm5lZCB0
byBiZSB1c2VkIHVwc3RyZWFtLgo+ID4KPiA+IEl0J3MganVzdCBzb2Z0d2FyZSBhbmQgc28gdGhl
IGlzc3VlcyBhcmUgcmVzb2x2YWJsZSwgaWUgSSBkb24ndCB0aGluawo+ID4gYmF6ZWwgc2hvdWxk
IGJlIGRldGVybWluaW5nIHdoYXQgaGFwcGVucyB1cHN0cmVhbSAtIGl0IG1vdGl2YXRlcyBtZSB0
bwo+ID4gc29tZSBleHRlbnQuIEZvciB0aGUgYmF6ZWwgYnVpbGQgSSBuZWVkIHRvIG1hdGNoIHRo
ZSBNYWtlZmlsZSBiZWhhdmlvcgo+ID4gd2l0aCBiaXRzIG9mIHNjcmlwdCBjYWxsZWQgZ2VucnVs
ZSwgdGhlIHNjb3BlIGFuZCBxdWFudGl0eSBvZiB0aGVzZQo+ID4gaW5jcmVhc2Ugd2l0aCB0aGUg
YXJjaCBkaXJlY3RvcnkgbW9kZWwsIGV4dHJhIGV4ZWN1dGFibGVzIHRvIGhhdmUgaW4KPiA+IHRo
ZSBidWlsZCBldGMuIEkgYWxzbyBpbWFnaW5lIGNyb3NzIHBsYXRmb3JtIHN0dWZmIHdpbGwgYWRk
Cj4gPiBjb21wbGV4aXR5LCBsaWtlIG1hcHBpbmcgYmxhemUncyBub3Rpb25zIG9mIG1hY2hpbmUg
dHlwZSB0byB0aG9zZQo+ID4gaW50cm9kdWNlZCBpbiB5b3VyIGNoYW5nZS4gSXQgaXMgYWxsIGEg
bG90IG9mIHN0dWZmIGFuZCBJIHRoaW5rIHdoYXQncwo+ID4gaW4gdGhlc2UgY2hhbmdlcyBrZWVw
cyB0aGluZ3MgYWJvdXQgYXMgc2ltcGxlIGFzIHRoZXkgY2FuIGJlLiBJdCdkIGJlCj4gPiBuaWNl
IHRvIGludGVncmF0ZSB0aGUgYmVzdCBmZWF0dXJlcyBvZiBib3RoIGNoYW5nZXMgYW5kIEkgdGhp
bmsgc29tZQo+ID4gb2YgdGhlIGVfbWFjaGluZSBzdHVmZiBoZXJlIGNhbiBiZSBhZGRlZCBvbnRv
IHlvdXIgY2hhbmdlIHRvIGdldCB0aGUKPiA+IGkzODYveDg2LTY0IGNhc2UgdG8gd29yay4gSSdt
IG5vdCBzb2xkIG9uIHRoZSBjb21wbGV4aXR5IG9mIHRoZSBidWlsZAo+ID4gaW4geW91ciBjaGFu
Z2VzIHRob3VnaCwgbXVsdGlwbGUgZmlsZXMsIEtidWlsZCBhbmQgTWFrZWZpbGUuc3lzY2FsbHMs
Cj4gPiB0aGUgYXJjaCBkaXJlY3Rvcnkgbm90IG9wdGlvbmFsbHkgYmVpbmcgYnVpbHQsIGhlbHBl
ciBleGVjdXRhYmxlcy4KPiA+IFVsdGltYXRlbHkgaXQgaXMgdGhlIHNhbWUgc2hlbGwgbG9naWMg
aW4gYm90aCBjaGFuZ2VzLCBhbmQgeW91cgo+ID4gcHJldmlvdXMgd29yayBsYWlkIG91dCBhbGwg
dGhlIGdyb3VuZCB3b3JrIGZvciB0aGlzIChJJ20gdmVyeSBncmF0ZWZ1bAo+ID4gZm9yIGl0IDot
KSApLgo+Cj4gVGhhbmtzIGZvciBlbGFib3JhdGluZyBvbiB0aGlzISBJIGRvIHdpc2ggd2UgaGFk
IG1vcmUgb2YgdGhpcwo+IGNvbnZlcnNhdGlvbiBvbiB0aGUgb3JpZ2luYWwgcGF0Y2ggc28gd2Ug
Y291bGQgaGF2ZSBtb2xkZWQgdGhlIG9yaWdpbmFsCj4gcGF0Y2ggY2xvc2VyIHRvIHdoYXQgdGhp
cyBvbmUgaXMgZG9pbmcuIEkga25vdyB5b3UgZGlkIG1lbnRpb24geW91IHdvdWxkCj4gbGlrZSB0
byBnZXQgcmlkIG9mIHRoZSBhcmNoIGRpcmVjdG9yeSBhcyBmZWVkYmFjayBvbiB0aGF0IHBhdGNo
IGJ1dCBJCj4gaGFkbid0IHJlYWxpemVkIHRoYXQgdGhpcyB3YXMgdGhlIGRpcmVjdGlvbiB5b3Ug
d2VyZSBob3BpbmcgdG8gdGFrZQo+IHRoaXMuIEl0IGRvZXMgc2VlbSBsaWtlIHRoZSBjaGFuZ2Vz
IHlvdSBoYXZlIG1hZGUgaW4gdGhpcyBwYXRjaCB3aWxsCj4gbGVhZCB0byBhIHNvbWV0aGluZyB0
aGF0IGlzIG1vcmUgcm9idXN0IGFuZCBzaW1wbGVyIHRvIG1haW50YWluLCBzbyB3ZQo+IGNhbiBt
b3ZlIGZvcndhcmQgd2l0aCByZXZpZXdpbmcgdGhpcyBwYXRjaCBhbmQgc3RvcCByZXZpZXdpbmcg
dGhlIG9uZSBJCj4gd3JvdGUuCgpUaGFua3MgYW5kIHNvcnJ5IGZvciB3b3JrIGRvbmUgdGhhdCBt
YXkgbm90IGxhbmQgLSB0aGUgbWFpbnRhaW5lcnMgbWF5CnByZWZlciB0aGUgYXBwcm9hY2ggaW4g
eW91ciBwYXRjaCBhbmQgbXkgb3BpbmlvbnMgbWF0dGVyIGxpdHRsZSB0bwp0aGVtLiBJZiBpdCBp
cyBhbnkgY29uc29sYXRpb24gSSB3cm90ZSBhbiBlbnRpcmUgUnVzdCBzeW1ib2wgZGVtYW5nbGVy
ClsxXSB0aGF0IEkgZG9uJ3QgZXhwZWN0IHRvIGxhbmQgOi0pIEkgYWxzbyBhcHByZWNpYXRlIHRo
YXQgeW91J3ZlIGJlZW4KY2xlYW5pbmcgdXAgdGhlIHRvb2xzIGJ1aWxkIGluZnJhc3RydWN0dXJl
IGFsb25nIHdpdGggeW91ciBjaGFuZ2VzLApzb21ldGhpbmcgdGhlcmUgaXNuJ3QgZW5vdWdoIG9m
LgoKVGhhbmtzLApJYW4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwMTI5
MTkzMDM3LjU3MzQzMS0xLWlyb2dlcnNAZ29vZ2xlLmNvbS8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
