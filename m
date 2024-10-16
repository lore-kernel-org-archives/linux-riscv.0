Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76113D1AD55
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCCyfiqMMWLixGHAOIAznRfnjSi9dmYvtWEWugelHaU=; b=iIMxS2HyGPzVDc
	F7KqYu3yWGpEzXYhgs1lzDjMvubUgHrfgUmoCJN6u9zt1oL3m4dWoD2okPOJa9s8aDW+70vWhdLm0
	+EOMxBEfCNjyhVHy2dVJ40Pj9xeCdDayHzzY+52NwP7/sC0J8WfdYyWZ616WHEQND79fk2c7bmDOG
	0NpV0eZEZke8m4IWxuoM5Ol5568f4SRyqldpKLBFe24RFO0wGv80KwNClwYd0j6TEmOhuI4MtghLu
	L4iP0U9NT+cK7oJGoFfBzo1nVcQDkkuqCsD5Izkmy/18x7HKDWtpKHDFSrFJC46cX6GxzGCZqmqdo
	e328wMFDxPh4bfJJoMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t13kQ-0000000Bs6M-1yA7;
	Wed, 16 Oct 2024 13:07:30 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t13kN-0000000Bs5D-0ewG
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 13:07:28 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-2e2ad9825a7so4509575a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 06:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729084046; x=1729688846; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cFk1lUCHytr2MFg4RaLCLc+fDoPzOPhkEAx4vVa1V8U=;
        b=X1vP732MBYdMiHwUowAxJO4RlVrcQ+kspnRHAaD/CCYR53BgyovrOiK1veZqmxMKlt
         Tpdarnq9PecaNkSlQm7X/0LtSI24du6P5iKoSV9e7KonFZ/MjSFOG76yX8/ySXIs5dKu
         pR1X+uC0KMHpeW+pPY8CPNF9jtfst7lncKqacIXlAnwQPzvA5LcGzH61jMsPrxEReelU
         3eTNP+rRkVjPxwLLMEpcgvkHbOhX7+rQhAeC9Xjt1z17U9ZtSwwbyZ9azO+3O7ABpkRX
         I/2FeU6sGGLjITRUiyVQPZO2lxwdwPiuDYg6J8cS0co7bAyk23Q6mSVyx9l3r6/Kc+gX
         W6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729084046; x=1729688846;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFk1lUCHytr2MFg4RaLCLc+fDoPzOPhkEAx4vVa1V8U=;
        b=ARV/cIFXERxpIWKwjKwy7ZTBNcRpa39uz0UAkKSLphXdOnYJ5RRCeMT5H1+LoUGlGI
         5wfqQJaBZS2H3TiU5DwTPHcNQZh59+U8KB0+HflR0Z8pRm9EDlZOupQ9UTkAfMR6B0zV
         jVSL8eqYEQOuOwpKbxpVa7k9DN/vHPq/ReIfCeC1WbLkLz6/eG1yIny26u0vPLyD0jje
         VPFdo5IB4TudgqQBo4LwCniuyiZUDnH8WOC+FsPqk5t0lhYH6ESxMj8assRd4ZB3Ytd2
         FbN2JoDoPOCRZbNYxyxo/g6EkuJG/p9WhNF8MgOxsNUynB/iBD3QaRX3pawX5T1lLU2M
         veTw==
X-Forwarded-Encrypted: i=1; AJvYcCURF2uOR7lgaG5bIADLV20WMXmXYC2JmoVILn4XY0cxZ/hsiI/SvtVHUdsNsj2dAs6LvsPji9o7GRxAAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwppF4/IqOT5piwrE5m1uPy9c+XRkDLdmzpkDXKZ92RoAwX0/Ln
	llbg9MEN9k9VNTcA30r0rVk1z+DU2pgifaJsqD8lJymG8+qaWMLZF8NMk8JcXUE=
X-Google-Smtp-Source: AGHT+IH6DsqAV/G6JOd7t25bsHF4r0vsplz+CSOJmcBB4kbw4clSXC01918WRw/8rMJzyrnikGyRcw==
X-Received: by 2002:a17:90a:ad81:b0:2e2:d61d:60e6 with SMTP id 98e67ed59e1d1-2e3ab8245e9mr4283458a91.17.1729084045986;
        Wed, 16 Oct 2024 06:07:25 -0700 (PDT)
Received: from [127.0.0.1] ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e392f753b4sm4059650a91.49.2024.10.16.06.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 06:07:25 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <707db338-4429-49a6-bcab-39ab44c4f770@gmail.com>
Date: Wed, 16 Oct 2024 21:07:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] riscv/entry: issue about a0/orig_a0 register and ENOSYS
To: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Oleg Nesterov <oleg@redhat.com>, "Dmitry V. Levin" <ldv@strace.io>
Cc: Andrea Bolognani <abologna@redhat.com>, WANG Xuerui <git@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
 Yao Zi <ziyao@disroot.org>, Yangyu Chen <cyy@cyyself.name>,
 Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 rsworktech@outlook.com
References: <59505464-c84a-403d-972f-d4b2055eeaac@gmail.com>
 <6b2ff48a-ab43-4866-af5a-b8b7d3c23582@ghiti.fr>
 <6b744fa3-5c1d-460d-bb09-5bc48379d598@gmail.com>
 <7375212b-2e40-4f39-a1ca-291c0975b529@ghiti.fr>
Content-Language: en-GB-large
In-Reply-To: <7375212b-2e40-4f39-a1ca-291c0975b529@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_060727_225428_892B3DEA 
X-CRM114-Status: GOOD (  35.69  )
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

Ck9uIDIwMjQtMTAtMTYgMjA6NTYsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiBPbiAxNi8xMC8y
MDI0IDE0OjIzLCBDZWxlc3RlIExpdSB3cm90ZToKPj4gT24gMjAyNC0xMC0xNiAyMDowMCwgQWxl
eGFuZHJlIEdoaXRpIHdyb3RlOgo+Pj4gSGkgQ2VsZXN0ZSwKPj4+Cj4+PiBUaGFuayB5b3UgZm9y
IGxvb2tpbmcgaW50byB0aGlzIGFuZCByZWFsbHkgc29ycnkgYWJvdXQgdGhlIGxhdGUgcmVzcG9u
c2UuCj4+Pgo+Pj4gT24gMTcvMDkvMjAyNCAwNjowOSwgQ2VsZXN0ZSBMaXUgd3JvdGU6Cj4+Pj4g
QmVmb3JlIFBUUkFDRV9HRVRfU1lTQ0FMTF9JTkZPIHdhcyBpbXBsZW1lbnRlZCBpbiB2NS4zLCB0
aGUgb25seSB3YXkgdG8KPj4+PiBnZXQgc3lzY2FsbCBhcmd1bWVudHMgd2FzIHRvIGdldCB1c2Vy
X3JlZ3Nfc3RydWN0IHZpYSBQVFJBQ0VfR0VUUkVHU0VULgo+Pj4+IE9uIHNvbWUgYXJjaGl0ZWN0
dXJlcyB3aGVyZSBhIHJlZ2lzdGVyIGlzIHVzZWQgYXMgYm90aCB0aGUgZmlyc3QKPj4+PiBhcmd1
bWVudCBhbmQgdGhlIHJldHVybiB2YWx1ZSBhbmQgdGh1cyB3aWxsIGJlIGNoYW5nZWQgYXQgc29t
ZSBzdGFnZSBvZgo+Pj4+IHRoZSBzeXNjYWxsIHByb2Nlc3MsIHNvbWV0aGluZyBsaWtlIG9yaWdf
YTAgaXMgcHJvdmlkZWQgdG8gc2F2ZSB0aGUKPj4+PiBvcmlnaW5hbCBhcmd1bWVudCByZWdpc3Rl
ciB2YWx1ZS4gQnV0IFJJU0MtViBkb2Vzbid0IGV4cG9ydCBvcmlnX2EwIGluCj4+Pj4gdXNlcl9y
ZWdzX3N0cnVjdCAoVGhpcyBBQkkgd2FzIGRlc2lnbmVkIGF0IGUyYzBjZGZiYTdmNiAoIlJJU0Mt
VjoKPj4+PiBVc2VyLWZhY2luZyBBUEkiKS4pIHNvIHVzZXJzcGFjZSBhcHBsaWNhdGlvbiBsaWtl
IHN0cmFjZSB3aWxsIGdldCB0aGUKPj4+PiByaWdodCBvciB3cm9uZyByZXN1bHQgZGVwZW5kcyBv
biB0aGUgb3BlcmF0aW9uIG9yZGVyIGluIGRvX3RyYXBfZWNhbGxfdSgpCj4+Pj4gZnVuY3Rpb24u
Cj4+Pj4KPj4+PiBUaGlzIHJlcXVpcmVzIHdlIHB1dCB0aGUgRU5PU1lTIHByb2Nlc3MgYWZ0ZXIg
c3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpCj4+Pj4gb3Igc3lzY2FsbF9oYW5kbGVyKClb
MV0uIFVuZm9ydHVuYXRlbHksIHRoZSBnZW5lcmljIGVudHJ5IEFQSQo+Pj4+IHN5c2NhbGxfZW50
ZXJfZnJvbV91c2VyX21vZGUoKSByZXF1aXJlcyB3ZQo+Pj4+Cj4+Pj4gKsKgIHByb2Nlc3MgRU5P
U1lTIGJlZm9yZSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkKPj4+Cj4+PiBXaGVyZSBk
b2VzIHRoaXMgcmVxdWlyZW1lbnQgY29tZSBmcm9tPwo+Pj4KPj4+Cj4+Pj4gKsKgIG9yIG9ubHkg
c2V0IGEwIHRvIEVOT1NZUyB3aGVuIHRoZSByZXR1cm4gdmFsdWUgb2YKPj4+PiDCoMKgwqDCoCBz
eXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgIT0gLTEKPj4+Pgo+Pj4+IEFnYWluLCBpZiB3
ZSBjaG9vc2UgdGhlIGxhdHRlciB3YXkgdG8gYXZvaWQgY29uZmxpY3Qgd2l0aCB0aGUgZmlyc3QK
Pj4+PiBpc3N1ZSwgd2Ugd2lsbCBtZWV0IHRoZSB0aGlyZCBwcm9ibGVtOiBzdHJhY2UgZGVwZW5k
cyBvbiB0aGF0IGtlcm5lbAo+Pj4+IHdpbGwgcmV0dXJuIEVOT1NZUyB3aGVuIHN5c2NhbGwgbnIg
aXMgLTEgdG8gaW1wbGVtZW50IHRoZWlyIHN5c2NhbGwKPj4+PiB0YW1wZXJpbmcgZmVhdHVyZVsy
XS4KPj4+Cj4+PiBJSVVDLCBzZWNjb21wIGFuZCBvdGhlcnMgaW4gc3lzY2FsbF9lbnRlcl9mcm9t
X3VzZXJfbW9kZSgpIGNvdWxkIHJldHVybiAtMSBhbmQgdGhlbiB3ZSBjb3VsZCBub3QgZGlmZmVy
ZW50aWF0ZSB3aXRoIHRoZSBzeXNjYWxsIG51bWJlciBiZWluZyAtMS4KPj4+Cj4+PiBCdXQgY291
bGQgd2UgaW1hZ2luZSwgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiBhbiBlcnJvciBhbmQgdGhlIHN5
c2NhbGwgbnVtYmVyIGJlaW5nIC0xLCBjaGVja2luZyBhZ2FpbiB0aGUgc3lzY2FsbCBudW1iZXIg
YWZ0ZXIgd2UgY2FsbCBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCk/IElmIHRoZSBzeXNj
YWxsIG51bWJlciBpcyAtMSwgdGhlbiB3ZSBzZXQgRU5PU1lTIG90aGVyd2lzZSB3ZSBkb24ndCBk
byBhbnl0aGluZyAoYSBiaXQgbGlrZSB3aGF0IHlvdSBkaWQgaW4gNTI0NDljMTdiZGQxICgicmlz
Y3Y6IGVudHJ5OiBzZXQgYTAgPSAtRU5PU1lTIG9ubHkgd2hlbiBzeXNjYWxsICE9IC0xIikpLgo+
Pj4KPj4+IExldCBtZSBrbm93IGlmIEkgY29tcGxldGVseSBtaXN1bmRlcnN0b29kIGhlcmUhCj4+
IFllYWguIEkgZm91bmQgdGhpcyBhIGJpdCBsYXRlciBhZnRlciBJIHBvc3QgdGhpcyBSRkMuIEkg
aW5jbHVkZSBpdCBpbiBhIHVwZGF0ZSByZXBseSwKPj4gY29weSBoZXJlIGFzIHdlbGw6Cj4+Cj4+
PiBCdXQgZnJvbSBhbm90aGVyIGFuZ2xlLCBzeXNjYWxsIG51bWJlciBpcyBpbiBhNyByZWdpc3Rl
ciwgc28gd2UgY2FuIGNhbGwgdGhlCj4+PiBnZXRfc3lzY2FsbF9ucigpIGFmdGVyIGNhbGxpbmcg
dGhlIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSB0byBieXBhc3MgdGhlCj4+PiBpbmZv
cm1hdGlvbiBsb3N0IG9mIHRoZSByZXR1cm4gdmFsdWUgb2YgdGhlIHN5c2NhbGxfZW50ZXJfZnJv
bV91c2VyX21vZGUoKS4gQnV0Cj4+PiBpbiB0aGlzIHdheSwgdGhlIHN5c2NhbGwgbnVtYmVyIGlu
IHRoZSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgcmV0dXJuCj4+PiB2YWx1ZSBpcyB1
c2VsZXNzLCBhbmQgd2UgY2FuIHJlbW92ZSBpdCBkaXJlY3RseS4KPj4gU28gaWYgd2UgZ2V0IHN5
c2NhbGwgbnVtYmVyIGZyb20gYTcgcmVnaXN0ZXIgYWdhaW4sIHRoZSBzeXNjYWxsIG51bWJlciBw
YXJ0IG9mCj4+IHRoZSByZXR1cm4gdmFsdWUgb2Ygc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9k
ZSgpIGlzIHVzZWxlc3MgY29tcGxldGVseS4KPj4gSSB0aGluayBpdCdzIGJldHRlciB0byBkcm9w
IGl0IHNvIHRoZSBsYXRlciBuZXcgYXJjaGl0ZWN0dXJlIGRldmVsb3BlciB3aWxsIG5vdAo+PiBy
dW4gaW50byB0aGUgc2FtZSBpc3N1ZS4gKEFjdHVhbGx5LCB0aGUgc3lzY2FsbCBudW1iZXIgcmV0
dXJuZWQgYnkKPj4gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpIGlzIGFsc28gdGhlIHJl
c3VsdCBvZiBnZXRfc3lzY2FsbF9ucigpIGF0IHRoZSBlbmQKPj4gb2YgaXQuKSBCdXQgaXQgd2ls
bCBhZmZlY3Qgb3RoZXIgYXJjaGl0ZWN0dXJlJ3MgY29kZSBzbyBJIHRoaW5rIHRoZXJlIHN0aWxs
IG5lZWQKPj4gc29tZSBkaXNjdXNzaW9ucy4KPj4KPj4gT3IgaWYgeW91IHRoaW5rIGl0J3MgYmV0
dGVyIHRvIHBvc3QgYSBwYXRjaCBhbmQgdGhlbiBkaXNjdXNzIGluIHBhdGNoIHRocmVhZAo+PiBk
aXJlY3RseSwgSSdtIGdsYWQgdG8gZG8gdGhpcy4KPiAKPiAKPiBHcmVhdCB0aGF0IHdlIGhhdmUg
YSBzb2x1dGlvbiB0aGF0IGRvZXMgbm90IG5lZWQgdG8gY2hhbmdlIHRoZSBBQkkgOikKPiAKPiBJ
IHRoaW5rIHdlIHNob3VsZCBzdGFydCBieSBpbXBsZW1lbnRpbmcgYSBmaXggZm9yIHJpc2N2IG9u
bHkgdGhhdCBpbXBsZW1lbnRzIHRoZSBnZXRfc3lzY2FsbF9ucigpIGFmdGVyIHN5c2NhbGxfZW50
ZXJfZnJvbV91c2VyX21vZGUoKSBzbyB0aGF0IHdlIGNhbiBtZXJnZSB0aGF0IGluIDYuMTItcmNY
Lgo+IAo+IEFuZCBhZnRlciB0aGF0LCB5b3UgY291bGQgY29tZSB3aXRoIHRoZSBuaWNlciBzb2x1
dGlvbiB5b3UgcHJvcG9zZS4KPiAKPiBEbyB5b3UgdGhpbmsgeW91IGNhbiBzZW5kIGEgcGF0Y2gg
Zm9yIHRoZSBxdWljayBmaXggc29vbj8gSW4gdGhlIG1lYW50aW1lLCBJJ20gYWRkaW5nIHRoZSBz
dHJhY2UgdGVzdHN1aXRlIHRvIG15IENJIHRvIG1ha2Ugc3VyZSBpdCB3b3JrcyBhbmQgd2UgZG9u
J3QgYnJlYWsgaXQgYWdhaW4gOikKCk9rLiBJIHdpbGwgc2VuZCBwYXRjaCBzb29uLgoKPiAKPiBU
aGFua3MhCj4gCj4gQWxleAo+IAo+IAo+Pgo+Pj4gVGhhbmtzIGFnYWluIGZvciB0aGUgdGhvcm91
Z2ggZXhwbGFuYXRpb24sCj4+Pgo+Pj4gQWxleAo+Pj4KPj4+Cj4+Pj4gQWN0dWFsbHksIHdlIHRy
aWVkIHRoZSBib3RoIHdheXMgaW4gNTI0NDljMTdiZGQxICgicmlzY3Y6IGVudHJ5OiBzZXQKPj4+
PiBhMCA9IC1FTk9TWVMgb25seSB3aGVuIHN5c2NhbGwgIT0gLTEiKSBhbmQgNjExMTkzOTQ2MzFm
ICgicmlzY3Y6IGVudHJ5Ogo+Pj4+IGFsd2F5cyBpbml0aWFsaXplIHJlZ3MtPmEwIHRvIC1FTk9T
WVMiKSBiZWZvcmUuCj4+Pj4KPj4+PiBOYXR1cmFsbHksIHRoZXJlIGlzIGEgc29sdXRpb246Cj4+
Pj4KPj4+PiAxLiBKdXN0IGFkZCBvcmlnX2EwIGluIHVzZXJfcmVnc19zdHJ1Y3QgYW5kIGxldCBz
dHJhY2UgdXNlIGl0IGFzCj4+Pj4gwqDCoMKgwqAgbG9vbmdhcmNoIGRvZXMuIFNvIG9ubHkgdHdv
IHByb2JsZW1zLCB3aGljaCBjYW4gYmUgcmVzb2x2ZWQgd2l0aG91dAo+Pj4+IMKgwqDCoMKgIGNv
bmZsaWN0LCBhcmUgbGVmdCBoZXJlLgo+Pj4+Cj4+Pj4gVGhlIGNvbmZsaWN0cyBhcmUgdGhlIGRp
cmVjdCByZXN1bHQgb2YgdGhlIGxpbWl0YXRpb24gb2YgZ2VuZXJpYyBlbnRyeQo+Pj4+IEFQSSwg
c28gd2UgaGF2ZSBhbm90aGVyIHR3byBzb2x1dGlvbnM6Cj4+Pj4KPj4+PiAyLiBHaXZlIHVwIHRo
ZSBnZW5lcmljIGVudHJ5IEFQSSwgYW5kIHN3aXRjaCBiYWNrIHRvIHRoZQo+Pj4+IMKgwqDCoMKg
IGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBzdGFuZGFyZGFsb25lIGltcGxlbWVudGF0aW9uLgo+Pj4+
IDMuIFJlZGVzaWduIHRoZSBnZW5lcmljIGVudHJ5IEFQSTogdGhlIHByb2JsZW0gd2FzIGNhdXNl
ZCBieQo+Pj4+IMKgwqDCoMKgIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSB1c2luZyB0
aGUgdmFsdWUgLTEgKHdoaWNoIGlzIHVudXNlZAo+Pj4+IMKgwqDCoMKgIG5vcm1hbGx5KSBvZiBz
eXNjYWxsIG5yIHRvIGluZm9ybSBzeXNjYWxsIHdhcyByZWplY3QgYnkgc2VjY29tcC9icGYuCj4+
Pj4KPj4+PiBJbiB0aGVvcnksIHRoZSBTb2x1dGlvbiAxIGlzIGJlc3Q6Cj4+Pj4KPj4+PiAqwqAg
YTAgd2FzIHVzZWQgZm9yIHR3byBwdXJwb3NlcyBpbiBBQkksIHNvIHVzaW5nIHR3byB2YXJpYWJs
ZXMgdG8gc3RvcmUKPj4+PiDCoMKgwqDCoCBpdCBpcyBuYXR1cmFsLgo+Pj4+ICrCoCBVc2Vyc3Bh
Y2UgY2FuIGltcGxlbWVudCBmZWF0dXJlcyB3aXRob3V0IGRlcGVuZGluZyBvbiB0aGUgaW50ZXJu
YWwKPj4+PiDCoMKgwqDCoCBiZWhhdmlvciBvZiB0aGUga2VybmVsLgo+Pj4+Cj4+Pj4gVW5mb3J0
dW5hdGVseSwgaXQncyBkaWZmaWN1bHQgdG8gaW1wbGVtZW50IGJhc2VkIG9uIHRoZSBjdXJyZW50
IGNvZGUuCj4+Pj4gVGhlIFJJU0MtViBkZWZpbmVkIHN0cnVjdCBwdF9yZWdzIGFzIGJlbG93Ogo+
Pj4+Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBwdF9yZWdzIHsKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZXBjOwo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCAuLi4KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHVuc2lnbmVkIGxvbmcgdDY7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAvKiBTdXBlcnZpc29yL01hY2hpbmUgQ1NScyAqLwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBzdGF0dXM7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGJhZGFkZHI7Cj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGNhdXNlOwo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogYTAgdmFsdWUgYmVmb3JlIHRoZSBzeXNj
YWxsICovCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBs
b25nIG9yaWdfYTA7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+Pj4KPj4+PiBBbmQgdXNl
cl9yZWdzX3N0cnVjdCBuZWVkcyB0byBiZSBhIHByZWZpeCBvZiBzdHJ1Y3QgcHRfcmVncywgc28g
aWYgd2UKPj4+PiB3YW50IHRvIGluY2x1ZGUgb3JpZ19hMCBpbiB1c2VyX3JlZ3Nfc3RydWN0LCB3
ZSB3aWxsIG5lZWQgdG8gaW5jbHVkZQo+Pj4+IFN1cGVydmlzb3IvTWFjaGluZSBDU1JzIGFzIHdl
bGwuIEl0J3Mgbm90IGEgYmlnIHByb2JsZW0uIFNpbmNlCj4+Pj4gc3RydWN0IHB0X3JlZ3MgaXMg
dGhlIGludGVybmFsIEFCSSBvZiB0aGUga2VybmVsLCB3ZSBjYW4gcmVvcmRlciBpdC4KPj4+PiBV
bmZvcnR1bmF0ZWx5LCBzdHJ1Y3QgdXNlcl9yZWdzX3N0cnVjdCBpcyBkZWZpbmVkIGFzIGJlbG93
Ogo+Pj4+Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB1c2VyX3JlZ3Nfc3RydWN0IHsK
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgcGM7
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC4uLgo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyB0NjsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsK
Pj4+Pgo+Pj4+IEl0IGRvZXNuJ3QgY29udGFpbiBzb21ldGhpbmcgbGlrZSByZXNlcnZlZFtdIGFz
IHBhZGRpbmcgdG8gbGVhdmUgdGhlCj4+Pj4gc3BhY2UgdG8gYWRkIG1vcmUgcmVnaXN0ZXJzIGZy
b20gc3RydWN0IHB0X3JlZ3MhCj4+Pj4gVGhlIGxvb25nYXJjaCBkbyB0aGUgcmlnaHQgdGhpbmcg
YXMgYmVsb3c6Cj4+Pj4KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHVzZXJfcHRfcmVn
cyB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBNYWluIHByb2Nl
c3NvciByZWdpc3RlcnMuICovCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1bnNpZ25lZCBsb25nIHJlZ3NbMzJdOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4KPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgcmVzZXJ2
ZWRbMTBdOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9IF9fYXR0cmlidXRlX18oKGFsaWduZWQo
OCkpKTsKPj4+Pgo+Pj4+IFJJU0MtViBjYW4ndCBpbmNsdWRlIG9yaWdfYTAgaW4gdXNlcl9yZWdz
X3N0cnVjdCB3aXRob3V0IGJyZWFraW5nIFVBQkkuCj4+Pj4KPj4+PiBOZWVkIGEgZGlzY3Vzc2lv
biB0byBkZWNpZGUgdG8gdXNlIHdoaWNoIHNvbHV0aW9uLCBvciBpcyB0aGVyZSBhbnkKPj4+PiBv
dGhlciBiZXR0ZXIgc29sdXRpb24/Cj4+Pj4KPj4+PiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9z
dHJhY2Uvc3RyYWNlL2lzc3Vlcy8zMTUKPj4+PiBbMl06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2LzIwMjQwNjI3MDcxNDIyLkdBMjYyNkBhbHRsaW51eC5vcmcvCj4+Pj4KPj4+
Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+
Pj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+Pj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
