Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E01C25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYR/j7+wbSZkboXQedOIfealgcNaMT7H5dPwRGf9yMU=; b=oxnWaJy3a739ci
	Xgp/b7ChPTKp3TDm9bg7z2YuQ8qrTytu+nVtH3LSLV8WgRDa1NFTAqkKjGFelDtnAoYG6yxOSDXCS
	HofDrNL/RE/h18cXHfTXgtWg8LFJnF82jmaoJ4oI2KgWkL3f1v24EY9OQfHNixSqoY+OsPZCAqhgG
	STft17LW4qnaTw5bHZpK/KHk67ndiIgo+Eq7IRnoGnTNwyNy0shT80tTUROcrsIVFwobJq9gwjogN
	/HmU/kRgZziSKFwdEEoX7MaWjrQ6AkB+KaNucjpdaTrV94O9p2aj7ywcbK2jbQM76ZIXNL5wqR1k1
	hingb/iY+FcqAm0suG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4xhu-00000000cqI-3xxw;
	Thu, 09 May 2024 06:56:47 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4xhs-00000000cpT-0DMv
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 06:56:45 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-620314aa1d7so5676227b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 23:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715237802; x=1715842602; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaF65Mth8rDaiy1Bx7eDA2aD8YWaoQ7AgHRL/QGNHIg=;
        b=NFF3n4jP9FBDQQfwG7Sa5UNTfJlKcsuwaT1fcl2/A+gBdQnePgLUnb77SE+NyM7mrh
         Jv5A+QvkLEEZrD+cQ+dM9++vZU9y0owfDhfuYIaYx7/m3Avj0sv472ScbjiQCbkHXgqp
         NX2HoZgpOWuqpNAkvDYNHFlaDThVdApsZ7ksSZDRDYL6ESR7njLwWqHYBd1ZjAFA9h1X
         STkzfI8gmcbVCJ4viY90OQ1S7TZ8hDTJME3C/HnS23ZZCJuvCwf4B1IdI+8+KqT40m83
         gKhmMcVJJVTxUdGD4/JIWpBpOO1sDIKec4sXmSXYtCB7yfhabbCPT1LmJNz8KjJuM+DY
         q17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715237802; x=1715842602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaF65Mth8rDaiy1Bx7eDA2aD8YWaoQ7AgHRL/QGNHIg=;
        b=oPlIAwRkAM6Li5JjCOjUvXcvPbK3YSvOjR/YGrZVYZkyfxrQG/dD+v/i8mIHkMur+6
         xizeXBJ+qM6jL0gU8Re4pMHpRLa+MsN+f9nKGLbixotB6CGu6oInp2ua3WzdUHnK428n
         U/a78JTA55xfJ8EcZpDAkhPybzh3Yx/zfulWjELfl0guZEIN/IjTfcdUI4CodQSFyw1S
         lpmMCnSkVvXGMC+TqNfbX7wk+s03nFY8OycSj69CktisqEF22YcqdjeqUF+CzSAfue8c
         1HMKLc6Ppbrnk0lLEpUR6atYnx/p2DdFnLGehbqZZIqvJ4p3XO/rt3MJiWLbomDSa6oL
         IAGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0onHnNogUdRyQEF9s9wXIulem2af1rWD7oJrJiUP7ahozlWX+fBHrwfe67KJsQnWfT8tlGJEnhsg+nE9CHNXgRplHMFAuUbBJF73AEPcL
X-Gm-Message-State: AOJu0Yx6F9LUmTZD5XAvDi8Fj5mPMOCG2eibSz3d3ZAWtqG0Z+I8BcsX
	ZttNSZiOzE8dPpIuj5psDjFou/5OLINVY52HMh3HXTDN+vkDe+FfB++64IOaJZZcwwaMw1EfmeY
	qAQ0Ch4v9qdgFRs1WGMAFLxsNqJcm/T7AGdhMtg==
X-Google-Smtp-Source: AGHT+IFcRu416dvzSI2zoj2G7WcOFjTosCWbtC1c8KEzGSwEnHegTPHoEH/G3MULJAHlFRyEU5wzPOnrCvubOCTr4OM=
X-Received: by 2002:a81:928c:0:b0:61b:3304:cdc7 with SMTP id
 00721157ae682-62085a747b9mr50296887b3.29.1715237801602; Wed, 08 May 2024
 23:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-7-e0c45bb6b253@sifive.com> <20240418-brook-chili-4d3e61d1a55c@wendy>
 <20240418155256.GA2410@sol.localdomain> <20240418-ultimatum-yam-11de4b063b83@spud>
 <20240418173203.GA1081@sol.localdomain> <20240418173946.GB1081@sol.localdomain>
 <20240418-sterling-sanding-d59c3b0a2aaa@spud>
In-Reply-To: <20240418-sterling-sanding-d59c3b0a2aaa@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 9 May 2024 14:56:30 +0800
Message-ID: <CABgGipU74TA3KgCH4pPuRefbnYt3q6RKcQwfyspenisEtY6eqw@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] riscv: vector: adjust minimum Vector requirement
 to ZVE32X
To: Conor Dooley <conor@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Joel Granados <j.granados@samsung.com>, 
	Jerry Shih <jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_235644_148840_9280B9A6 
X-CRM114-Status: GOOD (  56.73  )
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

SGkgQ29ub3IsCgpPbiBGcmksIEFwciAxOSwgMjAyNCBhdCAyOjI24oCvQU0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgQXByIDE4LCAyMDI0IGF0IDEw
OjM5OjQ2QU0gLTA3MDAsIEVyaWMgQmlnZ2VycyB3cm90ZToKPiA+IE9uIFRodSwgQXByIDE4LCAy
MDI0IGF0IDEwOjMyOjAzQU0gLTA3MDAsIEVyaWMgQmlnZ2VycyB3cm90ZToKPiA+ID4gT24gVGh1
LCBBcHIgMTgsIDIwMjQgYXQgMDU6NTM6NTVQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+
ID4gPiA+ID4gSWYgaXQgd291bGQgYmUgdXNlZnVsIHRvIGRvIHNvLCB3ZSBzaG91bGQgYmUgYWJs
ZSB0byBlbmFibGUgc29tZSBvZiB0aGUgY29kZQo+ID4gPiA+ID4gd2l0aCBhIHNtYWxsZXIgVkxF
TiBhbmQvb3IgRUVXIG9uY2UgaXQgaGFzIGJlZW4gdGVzdGVkIGluIHRob3NlIGNvbmZpZ3VyYXRp
b25zLgo+ID4gPiA+ID4gU29tZSBvZiBpdCBzaG91bGQgd29yaywgYnV0IHNvbWUgb2YgaXQgd29u
J3QgYmUgYWJsZSB0byB3b3JrLiAgKEZvciBleGFtcGxlLCB0aGUKPiA+ID4gPiA+IFNIQTUxMiBp
bnN0cnVjdGlvbnMgcmVxdWlyZSBFRVc9PTY0LikKPiA+ID4gPiA+Cj4gPiA+ID4gPiBBbHNvIG5v
dGUgdGhhdCBjdXJyZW50bHkgYWxsIHRoZSBSSVNDLVYgdmVjdG9yIGNyeXB0byBjb2RlIG9ubHkg
c3VwcG9ydHMgcmlzY3Y2NAo+ID4gPiA+ID4gKFhMRU49NjQpLiAgU2ltaWxhcmx5LCB0aGF0IGNv
dWxkIGJlIHJlbGF4ZWQgaW4gdGhlIGZ1dHVyZSBpZiBwZW9wbGUgcmVhbGx5IG5lZWQKPiA+ID4g
PiA+IHRoZSB2ZWN0b3IgY3J5cHRvIGFjY2VsZXJhdGlvbiBvbiAzMi1iaXQgQ1BVcy4uLiAgQnV0
IHNpbWlsYXJseSwgdGhlIGNvZGUgd291bGQKPiA+ID4gPiA+IG5lZWQgdG8gYmUgcmV2aXNlZCBh
bmQgdGVzdGVkIGluIHRoYXQgY29uZmlndXJhdGlvbi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEVy
aWMvSmVycnkgKGFsdGhvdWdoIHJlYWQgdGhlIHByZXZpb3VzIHBhcmFncmFwaCB0b28pOgo+ID4g
PiA+ID4gPiBJIG5vdGljZWQgdGhhdCB0aGUgc2hhMjU2IGdsdWUgY29kZSBjYWxscyBjcnlwdG9f
c2ltZF91c2FibGUoKSwgYW5kIGluCj4gPiA+ID4gPiA+IHR1cm4gbWF5X3VzZV9zaW1kKCkgYmVm
b3JlIGtlcm5lbF92ZWN0b3JfYmVnaW4oKS4gVGhlIGNoYWNoYTIwIGdsdWUgY29kZQo+ID4gPiA+
ID4gPiBkb2VzIG5vdCBjYWxsIGVpdGhlciwgd2hpY2ggc2VlbXMgdG8gdmlvbGF0ZSB0aGUgZWRp
Y3QgaW4KPiA+ID4gPiA+ID4ga2VybmVsX3ZlY3Rvcl9iZWdpbigpJ3Mga2VybmVsZG9jOgo+ID4g
PiA+ID4gPiAiTXVzdCBub3QgYmUgY2FsbGVkIHVubGVzcyBtYXlfdXNlX3NpbWQoKSByZXR1cm5z
IHRydWUuIgo+ID4gPiA+ID4KPiA+ID4gPiA+IHNrY2lwaGVyIGFsZ29yaXRobXMgY2FuIG9ubHkg
YmUgaW52b2tlZCBpbiBwcm9jZXNzIGFuZCBzb2Z0aXJxIGNvbnRleHQuICBUaGlzCj4gPiA+ID4g
PiBkaWZmZXJzIGZyb20gc2hhc2ggYWxnb3JpdGhtcyB3aGljaCBjYW4gYmUgaW52b2tlZCBpbiBh
bnkgY29udGV4dC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQs
IGxpa2UgYXJtNjQsIFJJU0MtViBhbHdheXMgYWxsb3dzIG5vbi1uZXN0ZWQKPiA+ID4gPiA+IGtl
cm5lbC1tb2RlIHZlY3RvciB0byBiZSB1c2VkIGluIHByb2Nlc3MgYW5kIHNvZnRpcnEgY29udGV4
dCAtLSBhbmQgaW4gZmFjdCwKPiA+ID4gPiA+IHRoaXMgd2FzIGludGVudGlvbmFsbHkgZG9uZSBp
biBvcmRlciB0byBzdXBwb3J0IHVzZSBjYXNlcyBsaWtlIHRoaXMuICBTbyB0aGF0J3MKPiA+ID4g
PiA+IHdoeSB0aGUgUklTQy1WIHNrY2lwaGVyIGFsZ29yaXRobXMgZG9uJ3QgY2hlY2sgZm9yIG1h
eV91c2Vfc2ltZCgpIGJlZm9yZSBjYWxsaW5nCj4gPiA+ID4gPiBrZXJuZWxfdmVjdG9yX2JlZ2lu
KCkuCj4gPiA+ID4KPiA+ID4gPiBJIHNlZSwgdGhhbmtzIGZvciBleHBsYWluaW5nIHRoYXQuIEkg
dGhpbmsgeW91IHNob3VsZCBwcm9iYWJseSBjaGVjawo+ID4gPiA+IHNvbWV3aGVyZSBpZiBoYXNf
dmVjdG9yKCkgcmV0dXJucyB0cnVlIGluIHRoYXQgZHJpdmVyIHRob3VnaCBiZWZvcmUKPiA+ID4g
PiB1c2luZyB2ZWN0b3IgaW5zdHJ1Y3Rpb25zLiBPbmx5IGNoZWNraW5nIHZsZW4gc2VlbXMgdG8g
bWUgbGlrZSByZWx5aW5nIG9uCj4gPiA+ID4gYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsIGFuZCBp
ZiB3ZSBzZXQgdmxlbiBmb3IgdGhlIFQtSGVhZC8wLjcuMSB2ZWN0b3IKPiA+ID4gPiBpdCdkIGJl
IGZvb2xlZC4gVGhhdCBzYWlkLCBJIGRvbid0IHRoaW5rIHRoYXQgYW55IG9mIHRoZSAwLjcuMSB2
ZWN0b3IKPiA+ID4gPiBzeXN0ZW1zIGFjdHVhbGx5IHN1cHBvcnQgWnZrYiwgYnV0IEkgaG9wZSB5
b3UgZ2V0IG15IGRyaWZ0Lgo+ID4gPgo+ID4gPiBBbGwgdGhlIGFsZ29yaXRobXMgY2hlY2sgZm9y
IGF0IGxlYXN0IG9uZSBvZiB0aGUgdmVjdG9yIGNyeXB0byBleHRlbnNpb25zIGJlaW5nCj4gPiA+
IHN1cHBvcnRlZCwgZm9yIGV4YW1wbGUgWnZrYi4gICdpZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9h
dmFpbGFibGUoTlVMTCwgWlZLQikpJwo+ID4gPiBzaG91bGQgcmV0dXJuIHdoZXRoZXIgdGhlIHJh
dGlmaWVkIHZlcnNpb24gb2YgWnZrYiBpcyBzdXBwb3J0ZWQsIGFuZCBsaWtld2lzZQo+ID4gPiBm
b3IgdGhlIG90aGVyIHZlY3RvciBjcnlwdG8gZXh0ZW5zaW9ucy4gIFRoZSByYXRpZmllZCB2ZXJz
aW9uIG9mIHRoZSB2ZWN0b3IKPiA+ID4gY3J5cHRvIGV4dGVuc2lvbnMgZGVwZW5kcyBvbiB0aGUg
cmF0aWZpZWQgdmVyc2lvbiBvZiB0aGUgdmVjdG9yIGV4dGVuc2lvbi4KPgo+IFRoYXQncyBncmVh
dCBpZiBpdCBkb2VzIHJlcXVpcmUgdGhhdCB0aGUgdmVyc2lvbiBvZiB0aGUgdmVjdG9yIGV4dGVu
c2lvbgo+IG11c3QgYmUgc3RhbmRhcmQuIEhpZ2hlciBxdWFsaXR5IHNwZWMgdGhhbiBtb3N0IGlm
IGl0IGRvZXMuIEJ1dAo+ICJzdXBwb3J0ZWQiIGluIHRoZSBjb250ZXh0IG9mIHJpc2N2X2lzYV9l
eHRlbnNpb25fYXZhaWxhYmxlKCkgbWVhbnMgdGhhdAo+IHRoZSBoYXJkd2FyZSBzdXBwb3J0cyBp
dCAob3Igc2V0IG9mIGhhcnRzKSwgbm90IHRoYXQgdGhlIGN1cnJlbnRseQo+IHJ1bm5pbmcga2Vy
bmVsIGRvZXMuIFRoZSBLY29uZmlnIGRlcHMgdGhhdCBtdXN0IGJlIG1ldCBmb3IgdGhlIGNvZGUg
dG8gYmUKPiBidWlsdCBhdCBsZWFzdCBtZWFuIHRoZSBrZXJuZWwgaXMgYnVpbHQgd2l0aCB2ZWN0
b3Igc3VwcG9ydCwgbGVhdmluZyBvbmx5Cj4gInRoZSBrZXJuZWwgd2FzIGJ1aWx0IHdpdGggdmVj
dG9yIHN1cHBvcnQgYW5kIHRoZSBoYXJkd2FyZSBzdXBwb3J0cyB2ZWN0b3IKPiBidXQgZm9yICRy
ZWFzb24gdGhlIGtlcm5lbCByZWZ1c2VkIHRvIGVuYWJsZSBpdCIuCj4KPiBJJ20gbm90IHN1cmUg
aWYgdGhhdCBmaW5hbCBjb25kaXRpb24gaXMgYWN0dWFsbHkgcG9zc2libGUgd2l0aCB0aGUgc3lz
dGVtCj4gZW5kaW5nIHVwIGluIGEgYnJva2VuIHN0YXRlLCBob3dldmVyIC0gSSdtIG5vdCBzdXJl
IHRoYXQgd2UgZXZlciBkbyB0dXJuCj4gb2ZmIGFjY2VzcyB0byB0aGUgVlBVIGF0IHByZXNlbnQg
KGFmdGVyIHdlIG1hcmsgaXQgdXNhYmxlKSwgYW5kIGlmIHdlIGRvCj4gaXQgZG9lc24ndCBnZXQg
cmVmbGVjdGVkIGluIGhhc192ZWN0b3IoKSBzbyB0aGUga2VybmVsIGFuZCB1c2Vyc3BhY2Ugd291
bGQKPiBib3RoIGJyZWFrLCB3aXRoIHdoYXQgYSBjcnlwdG8gZHJpdmVyIGRvZXMgcHJvYmFibHkg
YmVpbmcgdGhlIGxlYXN0IG9mCj4geW91ciB3b3JyaWVzLgo+Cj4gPiA+IFNvCj4gPiA+IHRoZXJl
IHNob3VsZCBiZSBubyBpc3N1ZS4gIElmIHRoZXJlIGlzLCB0aGUgUklTQy1WIGNvcmUgYXJjaGl0
ZWN0dXJlIGNvZGUgbmVlZHMKPiA+ID4gdG8gYmUgZml4ZWQgdG8gbm90IGRlY2xhcmUgdGhhdCBl
eHRlbnNpb25zIGFyZSBzdXBwb3J0ZWQgd2hlbiB0aGV5IGFyZSBhY3R1YWxseQo+ID4gPiBpbmNv
bXBhdGlibGUgbm9uLXN0YW5kYXJkIHZlcnNpb25zIG9mIHRob3NlIGV4dGVuc2lvbnMuICBJbmNv
bXBhdGlibGUKPiA+ID4gbm9uLXN0YW5kYXJkIGV4dGVuc2lvbnMgc2hvdWxkIGJlIHJlcHJlc2Vu
dGVkIGFzIHNlcGFyYXRlIGV4dGVuc2lvbnMuCj4gPiA+Cj4gPgo+ID4gSXQgcHJvYmFibHkgbWFr
ZXMgc2Vuc2UgdG8gY2hlY2sgaGFzX3ZlY3RvcigpIHRvIGV4Y2x1ZGUgWnZlKiBmb3Igbm93LCB0
aG91Z2guCj4KPiBJIHRoaW5rIHlvdSBtaWdodCBhY3R1YWxseSBiZSBiZXR0ZXIgc2VydmVkIGF0
IHByZXNlbnQsIGdpdmVuIHRoZSBjb2RlIGNhbgo+IG9ubHkgYmUgYnVpbHQgaWYgdGhlIGNvcmUg
dmVjdG9yIGNvZGUgaXMsIGJ5IHVzaW5nCj4gcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUo
TlVMTCwgdikuIFRoYXQgd2F5IHlvdSBrbm93IGZvciBzdXJlIHRoYXQKPiB5b3UncmUgZ2V0dGlu
ZyB0aGUgcmF0aWZpZWQgZXh0ZW5zaW9uIGFuZCBub3RoaW5nIGVsc2UuCj4KPiBQcmlvciB0byB0
aGlzIGNvbnZlcnNhdGlvbiBJIHRob3VnaHQgdGhhdCBoYXNfdmVjdG9yKCkgc2hvdWxkIHJldHVy
biB0cnVlCj4gaWYgdGhlcmUncyBhIHN0YW5kYXJkIGNvbXBsaWFudCB2ZWN0b3IgdW5pdCBhdmFp
bGFibGUgLSBnaXZlbiBhbGwgdXNlcnMKPiBBbmR5IGFkZGVkIG9ubHkgbmVlZCBadmUzMnguCj4K
PiA+IEkgYW0ganVzdCBjb25jZXJuZWQgYWJvdXQgaG93IHlvdSdyZSBzdWdnZXN0aW5nIHRoYXQg
bm9uLXN0YW5kYXJkIGV4dGVuc2lvbnMKPiA+IG1pZ2h0IGJlIHByZXRlbmRpbmcgdG8gYmUgc3Rh
bmRhcmQgb25lcyBhbmQgaW5kaXZpZHVhbCB1c2VycyBvZiBrZXJuZWwtbW9kZQo+ID4gdmVjdG9y
IHdvdWxkIG5lZWQgdG8gd29yayBhcm91bmQgdGhhdC4KPgo+IEkgYW0gYWJzb2x1dGVseSBub3Qg
c3VnZ2VzdGluZyB0aGF0IG5vbi1zdGFuZGFyZCBleHRlbnNpb25zIHNob3VsZAo+IG1hc3F1ZXJh
ZGUgYXMgc3RhbmRhcmQgb25lcywgSSBkb24ndCBrbm93IHdoZXJlIHlvdSBnb3QgdGhhdCBmcm9t
LiBXaGF0Cj4gSSBzYWlkIHdhcyB0aGF0IGEgbm9uLXN0YW5kYXJkIHZlY3RvciBleHRlbnNpb24g
Y291bGQgcmV1c2UgcmlzY3Zfdl92bGVuCj4gKGFuZCBzaG91bGQgSU1PIGZvciBzaW1wbGljaXR5
IHJlYXNvbnMpLCBub3QgdGhhdCBhbnkgb2YgdGhlIEFQSXMgd2UgaGF2ZQo+IGZvciBjaGVja2lu
ZyBleHRlbnNpb24gYXZhaWxhYmlsaXR5IHdvdWxkIGxpZSBhbmQgc2F5IGl0IHdhcyBzdGFuZGFy
ZC4KPiByaXNjdl92X3ZsZW4gaGF2aW5nIGEgdmFsdWUgZ3JlYXRlciB0aGFuIDEyOCBpcyBub3Qg
b25lIG9mIHRob3NlIEFQSXMgOykKPgo+ID4gSSB0aGluayB0aGF0IG5laXRoZXIgaGFzX3ZlY3Rv
cigpIG5vcgo+ID4gJ2lmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBaVktC
KSknIHNob3VsZCByZXR1cm4gdHJ1ZSBpZiB0aGUgQ1BVJ3MKPiA+IHZlY3RvciBleHRlbnNpb24g
aXMgbm9uLXN0YW5kYXJkLgo+Cj4gcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwg
WlZLQikgb25seSBjaGVja3Mgd2hldGhlciB0aGUgZXh0ZW5zaW9uCj4gd2FzIHByZXNlbnQgaW4g
RFQgb3IgQUNQSSBmb3IgYWxsIGhhcnRzLiBJdCBkb2Vzbid0IGNoZWNrIHdoZXRoZXIgb3Igbm90
Cj4gdGhlIHJlcXVpcmVkIGNvbmZpZyBvcHRpb24gZm9yIHZlY3RvciBoYXMgYmVlbiBzZXQgb3Ig
YW55dGhpbmcgcmVsYXRlZAo+IHRvIGRlcGVuZGVuY2llcy4gaGFzX3ZlY3RvcigpIGF0IGxlYXN0
IGNoZWNrcyB0aGF0IHRoZSB2ZWN0b3IgY29yZSBoYXMKPiBiZWVuIGVuYWJsZWQgKGFuZCB1c2Vz
IHRoZSBhbHRlcm5hdGl2ZS1wYXRjaGVkIHZlcnNpb24gb2YgdGhlIGNoZWNrCj4gZ2l2ZW4gaXQg
aXMgdXNlZCBpbiBzb21lIGhvdHRlciBwYXRocykuIFRoYXQncyBraW5kYSBtb290IGZvciBjb2Rl
Cj4gdGhhdCdzIG9ubHkgYnVpbHQgaWYgdGhlIHZlY3RvciBjb3JlIHN0dWZmIGlzIGVuYWJsZWQg
YXMgSSBzYWlkIGFib3ZlCj4gdGhvdWdoLgo+Cj4gV2UgY291bGQgb2YgY291cnNlIG1ha2Ugcmlz
Y3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoKSBjaGVjawo+IGV4dGVuc2lvbiBkZXBlbmRlbmNp
ZXMsIGJ1dCBJJ2QgcmF0aGVyIGxlYXZlIGR0IHZhbGlkYXRpb24gdG8gdGhlIGR0Cj4gdG9vbGlu
ZyAoYXBwYXJlbnRseSBBQ1BJIHRhYmxlcyBhcmUgbmV2ZXIgd3JvbmcuLi4pLiBFaXRoZXIgd291
bGQgYWxsb3cKPiB5b3UgdG8gcmVseSBvbiB0aGUgY3J5cHRvIGV4dGVuc2lvbnMgcHJlc2VudCBv
bmx5IHdoZW4gdGhlIHN0YW5kYXJkIHZlY3Rvcgo+IGV4dGVuc2lvbnMgdW5sZXNzIHNvbWVvbmUn
cyBEVC9BQ1BJIHN0dWZmIGlzIHNoaXRlLCBidXQgdGhlbiB0aGV5IGtlZXAgdGhlCj4gcGllY2Vz
IElNTyA6KQoKU2hvdWxkIHdlIGNoZWNrIGlmICJ2IiBwcmVzZW50cyBmb3IgdmVjdG9yIGNyeXB0
byBleHRlbnNpb25zIGluCnJpc2N2X2lzYV9leHRlbnNpb25fY2hlY2soKT8gV2UgYXJlIG5vdCBj
aGVja2luZyB0aGlzIGZvciBub3cuIFNvIGEKa2VybmVsIGNvbXBpbGVkIHdpdGggUklTQ1ZfSVNB
X1Ygc3RpbGwgaGFzIGEgcHJvYmxlbSBpZiBpdHMgaXNhLXN0cmluZwppbmNsdWRlcyBhbnkgb2Yg
dmVjdG9yIGNyeXB0byAoInp2YmIsIHp2a2csIGV0YyIpIGJ1dCBub3QgInYiLgoKPgo+IEhvcGUg
dGhhdCBtYWtlcyBzZW5zZT8KPiBDb25vci4KCkNoZWVycywKQW5keQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
