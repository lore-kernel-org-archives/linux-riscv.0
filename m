Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1999FD116E2
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Nov 2025 00:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qn1ECrRZtMDzmSV76Lsk6VGXHS5Xk2qQVXoskiBytss=; b=chQvdm8SLyclQS
	GOkDAOBv0rVT5BKHVpNHylAm/ZPSgg/zvRRep9G2fgghotQGW0TkpsFfYpw8iMxvwaKIC2pM+cUgv
	hxLAEPl2okVssJ8J3wAFQvYoTbdqv+GBz82YBjkvvHCJHlDUVO704VTloxTggNeXMdLinZhus4apG
	dACHFrEbQaV0p11wflN+ircQvIyfBIhsYBFzZo8XrZeNd5iqZD7/DpGdH1dXHKx3an+/9DInzAyLl
	XoLR4TqUYQbLCmVXptsPBtt4OCwE1HNwbiaY8ZgPxBpFm0BhSQgWRZIJsP7+xqwEfIdZRKx4UXbDO
	PQnpULQI5gTMfG3kh0Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPVIa-00000001thq-3e7g;
	Sun, 30 Nov 2025 00:28:20 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPVIX-00000001tgz-3mpU
	for linux-riscv@lists.infradead.org;
	Sun, 30 Nov 2025 00:28:19 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4ee147baf7bso851911cf.1
        for <linux-riscv@lists.infradead.org>; Sat, 29 Nov 2025 16:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764462494; x=1765067294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdkwplQZXP7FjFnU+v366rZ413pi5bTQ7R9T4YIrwjA=;
        b=hVqr6tJZNcKCpPoSRkFx1N5VVBA9hkY4puhaai3xb6vhrdBW4cX2mS3mz5WQhJZVKb
         XnjuPJmiFceI9+c3UCkFH0JMfo6zA7PZhnBTH62epBYuz1+i96U8Grwz5O5pteGAdwuJ
         2YxLtWw4clEp8M5LXxc39U1ZR2rcN01Zv6eOTo/f4ZyxV0NJYggigguPo/oM3npt4BQD
         mHQ9M9vdFaQIBcc3FtBFhoQp1NgmFdd85mqYhv8NhvGYxBhllgWxTJXO2Gg+p4O9y2OH
         Y8O7UHq6expCiwuCTP2IGLMdXVWtVGu9BUjpFDfHEZggeDmQy3587g9v50IbNAlvcItk
         tlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764462494; x=1765067294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xdkwplQZXP7FjFnU+v366rZ413pi5bTQ7R9T4YIrwjA=;
        b=VxsPuYYO835Zsljq4kZj6BQrt03r9gIkeW8doGBDymVuyCKC129bBJ4L005DaT+mzL
         jXPicGGpIp3Ien3n4t/oWck4Jv36YsyXBjd6mnMwg+iKjpAxUjLq0q+ZEfCEnEpgAKz4
         DTdPsJlSE6ojypCY9AttsXUxC5kdDEkYkCn25aHtBjJYvMPRW5xI8SiuqmCECLA1TcO/
         4cs/8jwiQVTzD57djkw9czY8GoD8wWRxQUKrJTIpJVGur6RBrU/Cf4GbQ8HJbBWFHDfZ
         ESWLkJ0l3hOHpfJvAEsdc/Z1xvA9qiJamx8/mP0p3laNYfvK1xp9tEcNM2LXsSPtLTmj
         rKjA==
X-Forwarded-Encrypted: i=1; AJvYcCXbvUfSQSYnyF51DRc0077//rE119jnaHrf42M4ebdm8w/W1yH5ScY1JbtninF+DREn+hxs/jG++S/i6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHWHvUdFAq077xx7XZTbmYsW0ANYMXV362aQ4kGAIXlv0exlhD
	TjJRtZSQ5vlsLATyijDsMWFXjts+Ckgm74X0fimYwXiSoobGxq6og8L2YBmGDXACOLbjcWQWJQ4
	ydq44e+KLyZ08JZygSntVUuagGKkf9DPLAN4UZIBm
X-Gm-Gg: ASbGncuf4sLjMS7pxqIWl8d6oPNqirot2MbVDhuJgmSPSdIjz313C5wucoSDGAqRrom
	k6RZjEjagwf3UwpujaMIH4KKDCHpr8YfxAeZB+YniuNuv0243XkA8IQMv4QN1P8em31G7ouJfyY
	tM7OBIF+sOHi1Wi3Ss+odBf0d6DWeoGo0wMapPCz+fBRtJXcZcXNLbLcrCT+guO5CkpIvbUOZqK
	p8x6VrGrk8TlqOgFT47d+AlJ7PP/OIQJUFEm6Z0qRaO3+G6aqpCgj2ew3EJESWrTr5B9Dq9SC0z
	s1o=
X-Google-Smtp-Source: AGHT+IHVf3jUEElcRU5UiElII1poREaWD5vAdlvPdSkAXo0sG8wTVz/TvP7Aj2pleN+SVZmwr5KEBBbORX+cZ2IR4bw=
X-Received: by 2002:a05:622a:41:b0:4ed:7c45:9908 with SMTP id
 d75a77b69052e-4efd0ca4d05mr10929131cf.10.1764462494131; Sat, 29 Nov 2025
 16:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
 <aSip2mWX13sqPW_l@casper.infradead.org> <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 29 Nov 2025 18:28:01 -0600
X-Gm-Features: AWmQ_blhKzVTz_OrE9p2RQX3OU7BXlogLE0D_GARspeRWjGy1hzzkkEbN5F-bD8
Message-ID: <CAJuCfpFVQJtvbj5fV2fmm4APhNZDL1qPg-YExw7gO1pmngC3Rw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Barry Song <21cnbao@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_162817_984746_B7C790C2 
X-CRM114-Status: GOOD (  43.47  )
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

T24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgMjoyOeKAr1BNIEJhcnJ5IFNvbmcgPDIxY25iYW9AZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTm92IDI4LCAyMDI1IGF0IDM6NDPigK9BTSBNYXR0
aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gW2Ryb3BwaW5n
IGluZGl2aWR1YWxzLCBsZWF2aW5nIG9ubHkgbWFpbGluZyBsaXN0cy4gIHBsZWFzZSBkb24ndCBz
ZW5kCj4gPiB0aGlzIGtpbmQgb2YgdGhpbmcgdG8gc28gbWFueSBwZW9wbGUgaW4gZnV0dXJlXQo+
ID4KPiA+IE9uIFRodSwgTm92IDI3LCAyMDI1IGF0IDEyOjIyOjE2UE0gKzA4MDAsIEJhcnJ5IFNv
bmcgd3JvdGU6Cj4gPiA+IE9uIFRodSwgTm92IDI3LCAyMDI1IGF0IDEyOjA54oCvUE0gTWF0dGhl
dyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24g
VGh1LCBOb3YgMjcsIDIwMjUgYXQgMDk6MTQ6MzZBTSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToK
PiA+ID4gPiA+IFRoZXJlIGlzIG5vIG5lZWQgdG8gYWx3YXlzIGZhbGwgYmFjayB0byBtbWFwX2xv
Y2sgaWYgdGhlIHBlci1WTUEKPiA+ID4gPiA+IGxvY2sgd2FzIHJlbGVhc2VkIG9ubHkgdG8gd2Fp
dCBmb3IgcGFnZWNhY2hlIG9yIHN3YXBjYWNoZSB0bwo+ID4gPiA+ID4gYmVjb21lIHJlYWR5Lgo+
ID4gPiA+Cj4gPiA+ID4gU29tZXRoaW5nIEkndmUgYmVlbiB3b25kZXJpbmcgYWJvdXQgaXMgcmVt
b3ZpbmcgYWxsIHRoZSAiZHJvcCB0aGUgTU0KPiA+ID4gPiBsb2NrcyB3aGlsZSB3ZSB3YWl0IGZv
ciBJL08iIGd1bmsuICBJdCdzIGEgbmljZSBhbW91bnQgb2YgY29kZSByZW1vdmVkOgo+ID4gPgo+
ID4gPiBJIHRoaW5rIHRoZSBwb2ludCBpcyB0aGF0IHBhZ2UgZmF1bHQgaGFuZGxlcnMgc2hvdWxk
IGF2b2lkIGhvbGRpbmcgdGhlIFZNQQo+ID4gPiBsb2NrIG9yIG1tYXBfbG9jayBmb3IgdG9vIGxv
bmcgd2hpbGUgd2FpdGluZyBmb3IgSS9PLiBPdGhlcndpc2UsIHRob3NlCj4gPiA+IHdyaXRlcnMg
YW5kIHJlYWRlcnMgd2lsbCBiZSBzdHVjayBmb3IgYSB3aGlsZS4KPiA+Cj4gPiBUaGVyZSdzIGEg
dXNlY2FzZSBzb21lIG9mIHVzIGhhdmUgYmVlbiBkaXNjdXNzaW5nIG9mZi1saXN0IGZvciBhIGZl
dwo+ID4gd2Vla3MgdGhhdCBvdXIgY3VycmVudCBzdHJhdGVneSBwZXNzaW1pc2VzLiAgSXQncyBh
IHByb2Nlc3Mgd2l0aAo+ID4gdGhvdXNhbmRzIChtYXliZSB0ZW5zIG9mIHRob3VzYW5kcykgb2Yg
dGhyZWFkcy4gIEl0IGhhcyBtdWNoIG1vcmUgbWFwcGVkCj4gPiBmaWxlcyB0aGFuIGl0IGhhcyBt
ZW1vcnkgdGhhdCBjZ3JvdXBzIHdpbGwgYWxsb3cgaXQgdG8gdXNlLiAgU28gb24gYQo+ID4gcGFn
ZSBmYXVsdCwgd2UgZHJvcCB0aGUgdm1hIGxvY2ssIGFsbG9jYXRlIGEgcGFnZSBvZiByYW0sIGtp
Y2sgb2ZmIHRoZQo+ID4gcmVhZCwgc2xlZXAgd2FpdGluZyBmb3IgdGhlIGZvbGlvIHRvIGNvbWUg
dXB0b2RhdGUsIG9uY2UgaXQgaXMgcmV0dXJuLAo+ID4gZXhwZWN0aW5nIHRoZSBwYWdlIHRvIHN0
aWxsIGJlIHRoZXJlIHdoZW4gd2UgcmVlbnRlciBmaWxlbWFwX2ZhdWx0Lgo+ID4gQnV0IGl0J3Mg
dW5kZXIgc28gbXVjaCBtZW1vcnkgcHJlc3N1cmUgdGhhdCBpdCdzIGFscmVhZHkgYmVlbiByZWNs
YWltZWQKPiA+IGJ5IHRoZSB0aW1lIHdlIGdldCBiYWNrIHRvIGl0LiAgU28gYWxsIHRoZSB0aHJl
YWRzIGp1c3QgYmF0dGVyIHRoZQo+ID4gc3RvcmFnZSByZS1yZWFkaW5nIGRhdGEuCj4KPiBJcyB0
aGlzIGVudGlyZWx5IHRoZSBmYXVsdCBvZiByZS1lbnRlcmluZyB0aGUgcGFnZSBmYXVsdD8gVW5k
ZXIgZXh0cmVtZQo+IG1lbW9yeSBwcmVzc3VyZSwgZXZlbiBpZiB3ZSBtYXAgdGhlIHBhZ2VzLCB0
aGV5IGNhbiBzdGlsbCBiZSByZWNsYWltZWQKPiBxdWlja2x5Pwo+Cj4gPgo+ID4gSWYgd2UgZG9u
J3QgZHJvcCB0aGUgdm1hIGxvY2ssIHdlIGNhbiBpbnNlcnQgdGhlIHBhZ2VzIGluIHRoZSBwYWdl
IHRhYmxlCj4gPiBhbmQgcmV0dXJuLCBtYXliZSBnZXR0aW5nIHNvbWUgd29yayBkb25lIGJlZm9y
ZSB0aGlzIHRocmVhZCBpcwo+ID4gZGVzY2hlZHVsZWQuCj4KPiBJZiB3ZSBuZWVkIHRvIHByb3Rl
Y3QgdGhlIHBhZ2UgZnJvbSBiZWluZyByZWNsYWltZWQgdG9vIGVhcmx5LCB0aGUgZml4Cj4gc2hv
dWxkIHJlc2lkZSB3aXRoaW4gTFJVIG1hbmFnZW1lbnQsIG5vdCBpbiBwYWdlIGZhdWx0IGhhbmRs
aW5nLgo+Cj4gQWxzbywgSSBnYXZlIGFuIGV4YW1wbGUgd2hlcmUgd2UgbWF5IG5vdCBkcm9wIHRo
ZSBWTUEgbG9jayBpZiB0aGUgZm9saW8gaXMKPiBhbHJlYWR5IHVwIHRvIGRhdGUuIFRoYXQgbGlr
ZWx5IGNvcnJlc3BvbmRzIHRvIHdhaXRpbmcgZm9yIHRoZSBQVEUgbWFwcGluZyB0bwo+IGNvbXBs
ZXRlLgo+Cj4gPgo+ID4gVGhpcyB1c2UgY2FzZSBhbHNvIG1hbmFnZXMgdG8gZ2V0IHV0dGVybHkg
aHVuZy11cCB0cnlpbmcgdG8gZG8gcmVjbGFpbQo+ID4gdG9kYXkgd2l0aCB0aGUgbW1hcF9sb2Nr
IGhlbGQuICBTTyBpdCBtYW5pZmVzdHMgc29tZXdoYXQgc2ltaWxhcmx5IHRvCj4gPiB5b3VyIHBy
b2JsZW0gKGV2ZXJ5Ym9keSBlbmRzIHVwIGJsb2NrZWQgb24gbW1hcF9sb2NrKSBidXQgaXQgaGFz
IGEKPiA+IHJhdGhlciBkaWZmZXJlbnQgcm9vdCBjYXVzZS4KPiA+Cj4gPiA+IEkgYWdyZWUgdGhl
cmXigJlzIHJvb20gZm9yIGltcHJvdmVtZW50LCBidXQgbWVyZWx5IHJlbW92aW5nIHRoZSAiZHJv
cCB0aGUgTU0KPiA+ID4gbG9ja3Mgd2hpbGUgd2FpdGluZyBmb3IgSS9PIiBjb2RlIGlzIHVubGlr
ZWx5IHRvIGltcHJvdmUgcGVyZm9ybWFuY2UuCj4gPgo+ID4gSSdtIG5vdCBzdXJlIGl0J2QgaHVy
dCBwZXJmb3JtYW5jZS4gIFRoZSAiZHJvcCBtbWFwIGxvY2tzIGZvciBJL08iIGNvZGUKPiA+IHdh
cyB3cml0dGVuIGJlZm9yZSB0aGUgVk1BIGxvY2tpbmcgY29kZSB3YXMgd3JpdHRlbi4gIEkgZG9u
J3Qga25vdyB0aGF0Cj4gPiBpdCdzIGFjdHVhbGx5IGhlbHBpbmcgdGhlc2UgZGF5cy4KPgo+IEkg
YW0gY29uY2VybmVkIHRoYXQgb3RoZXIgd3JpdGUgcGF0aHMgbWF5IHN0aWxsIG5lZWQgdG8gbW9k
aWZ5IHRoZSBWTUEsIGZvcgo+IGV4YW1wbGUgZHVyaW5nIHNwbGl0dGluZy4gVGFpbCBsYXRlbmN5
IGhhcyBsb25nIGJlZW4gYSBzaWduaWZpY2FudCBpc3N1ZSBmb3IKPiBBbmRyb2lkIHVzZXJzLCBh
bmQgd2UgaGF2ZSBvYnNlcnZlZCBpdCBldmVuIHdpdGggZm9saW9fbG9jaywgd2hpY2ggaGFzIG11
Y2gKPiBmaW5lciBncmFudWxhcml0eSB0aGFuIHRoZSBWTUEgbG9jay4KCkFub3RoZXIgY29ybmVy
IGNhc2Ugd2UgbmVlZCB0byBjb25zaWRlciBpcyB3aGVuIHRoZXJlIGlzIGEgbGFyZ2UgVk1BCmNv
dmVyaW5nIG1vc3Qgb2YgdGhlIGFkZHJlc3Mgc3BhY2UsIHNvIGhvbGRpbmcgYSBWTUEgbG9jayBk
dXJpbmcgSU8Kd291bGQgcmVzZW1ibGUgaG9sZGluZyBhbiBtbWFwX2xvY2ssIGxlYWRpbmcgdG8g
dGhlIHNhbWUgaXNzdWUgdGhhdCB3ZQpmYWNlZCBiZWZvcmUgImRyb3AgbW1hcCBsb2NrcyBmb3Ig
SS9PIi4gV2UgZGlzY3Vzc2VkIHRoaXMgd2l0aCBNYXR0aGV3CmluIHRoZSBjb250ZXh0IG9mIHRo
ZSBwcm9ibGVtIGhlIG1lbnRpb25lZCAodGhlIHBhZ2UgaXMgcmVjbGFpbWVkCmJlZm9yZSBwYWdl
IGZhdWx0IHJldHJ5IGhhcHBlbnMpIHdpdGggbm8gY29uY2x1c2lvbiB5ZXQuCgo+Cj4gPgo+ID4g
PiBUaGUgY2hhbmdlIHdvdWxkIGJlIG11Y2ggbW9yZSBjb21wbGV4LCBzbyBJ4oCZZCBwcmVmZXIg
dG8gbGFuZCB0aGUgY3VycmVudAo+ID4gPiBwYXRjaHNldCBmaXJzdC4gQXQgbGVhc3QgdGhpcyB3
YXksIHdlIGF2b2lkIGZhbGxpbmcgYmFjayB0byBtbWFwX2xvY2sgYW5kCj4gPiA+IGNhdXNpbmcg
Y29udGVudGlvbiBvciBwcmlvcml0eSBpbnZlcnNpb24sIHdpdGggbWluaW1hbCBjaGFuZ2VzLgo+
ID4KPiA+IFVoLCB0aGlzIGlzIGFuIFJGQyBwYXRjaHNldC4gIEknbSBnaXZpbmcgeW91IG15IGNv
bW1lbnQsIHdoaWNoIGlzIHRoYXQgSQo+ID4gZG9uJ3QgdGhpbmsgdGhpcyBpcyB0aGUgcmlnaHQg
ZGlyZWN0aW9uIHRvIGdvIGluLiAgQW55IHRhbGsgb2YgImxhbmRpbmciCj4gPiB0aGVzZSBwYXRj
aGVzIGlzIGV4dHJlbWVseSBwcmVtYXR1cmUuCj4KPiBXaGlsZSBJIGFncmVlIHRoYXQgdGhlcmUg
YXJlIG90aGVyIGFwcHJvYWNoZXMgd29ydGggZXhwbG9yaW5nLCBJCj4gcmVtYWluIGVudGlyZWx5
IHVuY29udmluY2VkIHRoYXQgdGhpcyBwYXRjaHNldCBpcyB0aGUgd3JvbmcKPiBkaXJlY3Rpb24u
IFdpdGggdGhlIGN1cnJlbnQgcmV0cnkgbG9naWMsIGl0IHN1YnN0YW50aWFsbHkgcmVkdWNlcwo+
IG1tYXBfbG9jayBhY3F1aXNpdGlvbnMgYW5kIHJlcHJlc2VudHMgYSBjbGVhciBsb3ctaGFuZ2lu
ZyBmcnVpdC4KPgo+IEFsc28sIEkgYW0gbm90IHJlZmVycmluZyB0byBsYW5kaW5nIHRoZSBSRkMg
aXRzZWxmLCBidXQgdG8gYSBzdWJzZXF1ZW50IGZvcm1hbAo+IHBhdGNoc2V0IHRoYXQgcmV0cmll
cyB1c2luZyB0aGUgcGVyLVZNQSBsb2NrLgoKSSBkb24ndCBrbm93IGlmIHRoaXMgZGlyZWN0aW9u
IGlzIHRoZSByaWdodCBvbmUgYnV0IEkgYWdyZWUgd2l0aApNYXR0aGV3IHRoYXQgd2Ugc2hvdWxk
IGNvbnNpZGVyIGFsdGVybmF0aXZlcyBiZWZvcmUgYWRvcHRpbmcgYSBuZXcKZGlyZWN0aW9uLiBI
b3BlZnVsbHkgd2UgY2FuIGZpbmQgb25lIGZpeCBmb3IgYm90aCBwcm9ibGVtcyByYXRoZXIgdGhh
bgpmaXhpbmcgZWFjaCBvbmUgaW4gaXNvbGF0aW9uLgoKPgo+IFRoYW5rcwo+IEJhcnJ5Cj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
