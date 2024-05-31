Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE511C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 21:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hl4VNgNPR+i/+gLlaEuw/Zl3wzm+QpGjf/r2f5glshE=; b=PehfidU//F15NS
	JRK+sZvrWmJv6Bkzp3kun9ImOUcNDEwfoNyOFyb233bHsZcNYUKzS9smMuVtxnuM9ROkUzTYQDPHn
	y8XiKFi1b5BNgnnzdfkq3VIZR4ebM0yBGFgvzzKoMVrkOW6ZElIO6dihaCLEzBuiwPZIoSMb9ZXHa
	l6HFaJVdrMprdys9zOczz0ZsiNHDRNqyppiwj02WG3TTt8ivDHFy00G0QeFwhNmUlrnU9oJoWxWdt
	bnqH6Ay5v4O1eaNSk1OxITVHTVlM5i7HLzZleJ9ZH88HXemJpFrQ7EAsL6BoeyhsqQdQrI3XSdILn
	SWKV5yC3g2GosnYc1dbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD9W7-0000000BSO4-01rB;
	Fri, 31 May 2024 21:10:27 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD9Vx-0000000BSLh-1DY3
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 21:10:25 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-35dbfe31905so2602559f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 14:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717189816; x=1717794616; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2tq10nFX29kQGqNAS352osxyUaVdPznDkZxoHpHfa8=;
        b=OChxT8OcKJg53zSmMd35j6cWeHSlGGmUYNc5o+zChCtQxS7te7cJWpyMWdpckDqTmv
         nFf402s9xVeurhwTcWqPZn/1CqyVE+r1W7exTnh2SIgqWphjFjJJAZ91Wsh1bBZLK8jj
         CT5R3AsfE5DizOXzxMvtAjN4ZkCkBpT7bUj07XI0LPgRgLrTBK0096VdNimdkdpAe5uK
         fNWofFIdMTgVzLREGB10ZlPPk9HPhvEVMLxu2dqo1sImiNEAVJx7q4h88EQhNaW8SnFN
         xzRVR+QgSkmwkYMr/jmq7ov8gwYD0UZdgeqYOmDhGdL2LmuC3wATKtwxmKa1jZNpwgFh
         HsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717189816; x=1717794616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2tq10nFX29kQGqNAS352osxyUaVdPznDkZxoHpHfa8=;
        b=T4UpQwRgRWxv3i9hrKO+atn4AvlaGDzYhuOswbHt50GqgwpDOUUUtf53PYQsVpptLn
         /Av4TjZQ19sZPWMaaZLV9DBqVaelMQRr98+hza9vvfPtII9kJahJWnHbzKWDLDQw2Njp
         pT8nRTGI0vgNEHUdGqnLRuyU5/sKyMb7+VBdIEHzJ3RFdxlrrPPHvN33fAWyfg0scX0N
         ugEwE1+QtInJQwM/p/fbY1zPrFaiczsF2S7RMDKGTw+ux5mNalWCDYHJN1N+nXU3/DjY
         D3mACw4+c7yZVhvSq4HeZWBIE6Jv6PZ5VC8sYfJtjLER7jf15QaY4rkHR451vb8n5MlU
         Fo1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/TNiXf/DEauwUjxJi2iZDuosuGLObvTN3SMQxuIafKaTP8vbQHB9y9dsRUq6kz/23v+LCTMj4Zu9t5Or9zzLKoWC/2v2s19iFVbFGL6rs
X-Gm-Message-State: AOJu0YzwSouOFS0S0zKIWBK4bcFG/VJdraD1hHtXQBTDs478rbSEFwOZ
	OzA8BIsR9bysD8Fd/74RwaJHWtIPsaCtUGpUufqCCsxzecI0cWnJtwu+ErA/nevublr3YK47aQ4
	tMFadRawpQxKGB8iragm0ERdv0fxzEtskRdNx
X-Google-Smtp-Source: AGHT+IGBXgQKGvGpLJLkAZRNkN3pvPdaYlgrwH8luU8wCcE+kb/FtudP+b0UHW6VTmsTqjv8AVqi9KSPou5NOiUNmXY=
X-Received: by 2002:a05:6000:1b09:b0:357:ca29:f1ca with SMTP id
 ffacd0b85a97d-35e0f2869c8mr2259497f8f.32.1717189815401; Fri, 31 May 2024
 14:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <Zll7IuGYGG5uI20W@linux.dev> <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
 <CALzav=e4PmGV6ayuMCwbKWq8EnOomYKBj-0Lj+gV-kPO=h156A@mail.gmail.com>
In-Reply-To: <CALzav=e4PmGV6ayuMCwbKWq8EnOomYKBj-0Lj+gV-kPO=h156A@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 31 May 2024 14:09:49 -0700
Message-ID: <CALzav=dgV55gwhUdXh9T5k29JrcheAgJooHFodvf=u3YuookHg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Yu Zhao <yuzhao@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, James Houghton <jthoughton@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Rientjes <rientjes@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Sean Christopherson <seanjc@google.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_141021_499903_B5A0D96C 
X-CRM114-Status: GOOD (  43.03  )
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

T24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMjowNuKAr1BNIERhdmlkIE1hdGxhY2sgPGRtYXRsYWNr
QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMTozMeKAr1BN
IFl1IFpoYW8gPHl1emhhb0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIE1heSAz
MSwgMjAyNCBhdCAxOjI04oCvQU0gT2xpdmVyIFVwdG9uIDxvbGl2ZXIudXB0b25AbGludXguZGV2
PiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMDM6MDM6MjFQTSAt
MDYwMCwgWXUgWmhhbyB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIE1heSAyOSwgMjAyNCBhdCAxMjow
NeKAr1BNIEphbWVzIEhvdWdodG9uIDxqdGhvdWdodG9uQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4g
PiA+ID4KPiA+ID4gPiA+IFNlY29uZGFyeSBNTVVzIGFyZSBjdXJyZW50bHkgY29uc3VsdGVkIGZv
ciBhY2Nlc3MvYWdlIGluZm9ybWF0aW9uIGF0Cj4gPiA+ID4gPiBldmljdGlvbiB0aW1lLCBidXQg
YmVmb3JlIHRoZW4sIHdlIGRvbid0IGdldCBhY2N1cmF0ZSBhZ2UgaW5mb3JtYXRpb24uCj4gPiA+
ID4gPiBUaGF0IGlzLCBwYWdlcyB0aGF0IGFyZSBtb3N0bHkgYWNjZXNzZWQgdGhyb3VnaCBhIHNl
Y29uZGFyeSBNTVUgKGxpa2UKPiA+ID4gPiA+IGd1ZXN0IG1lbW9yeSwgdXNlZCBieSBLVk0pIHdp
bGwgYWx3YXlzIGp1c3QgcHJvY2VlZCBkb3duIHRvIHRoZSBvbGRlc3QKPiA+ID4gPiA+IGdlbmVy
YXRpb24sIGFuZCB0aGVuIGF0IGV2aWN0aW9uIHRpbWUsIGlmIEtWTSByZXBvcnRzIHRoZSBwYWdl
IHRvIGJlCj4gPiA+ID4gPiB5b3VuZywgdGhlIHBhZ2Ugd2lsbCBiZSBhY3RpdmF0ZWQvcHJvbW90
ZWQgYmFjayB0byB0aGUgeW91bmdlc3QKPiA+ID4gPiA+IGdlbmVyYXRpb24uCj4gPiA+ID4KPiA+
ID4gPiBDb3JyZWN0LCBhbmQgYXMgSSBleHBsYWluZWQgb2ZmbGluZSwgdGhpcyBpcyB0aGUgb25s
eSByZWFzb25hYmxlCj4gPiA+ID4gYmVoYXZpb3IgaWYgd2UgY2FuJ3QgbG9ja2xlc3NseSB3YWxr
IHNlY29uZGFyeSBNTVVzLgo+ID4gPiA+Cj4gPiA+ID4gSnVzdCBmb3IgdGhlIHJlY29yZCwgdGhl
IChjcnVkZSkgYW5hbG9neSBJIHVzZWQgd2FzOgo+ID4gPiA+IEltYWdpbmUgYSBsYXJnZSByb29t
IHdpdGggbWFueSBiaWxscyAoJDEsICQ1LCAkMTAsIC4uLikgb24gdGhlIGZsb29yLAo+ID4gPiA+
IGJ1dCB5b3UgYXJlIG9ubHkgYWxsb3dlZCB0byBwaWNrIHVwIDEwIG9mIHRoZW0gKGFuZCBwdXQg
dGhlbSBpbiB5b3VyCj4gPiA+ID4gcG9ja2V0KS4gQSBzbWFydCBtb3ZlIHdvdWxkIGJlIHRvIHN1
cnZleSB0aGUgcm9vbSAqZmlyc3QgYW5kIHRoZW4qCj4gPiA+ID4gcGljayB1cCB0aGUgbGFyZ2Vz
dCBvbmVzLiBCdXQgaWYgeW91IGFyZSBjYXJyeWluZyBhIDUwMCBsYnMgYmFja3BhY2ssCj4gPiA+
ID4geW91IHdvdWxkIGp1c3Qgd2FudCB0byBwaWNrIHVwIHdoaWNoZXZlciB0aGF0J3MgaW4gZnJv
bnQgb2YgeW91IHJhdGhlcgo+ID4gPiA+IHRoYW4gd2FsayB0aGUgZW50aXJlIHJvb20uCj4gPiA+
ID4KPiA+ID4gPiBNR0xSVSBzaG91bGQgb25seSBzY2FuIChvciBsb29rYXJvdW5kKSBzZWNvbmRh
cnkgTU1VcyBpZiBpdCBjYW4gYmUKPiA+ID4gPiBkb25lIGxvY2tsZXNzLiBPdGhlcndpc2UsIGl0
IHNob3VsZCBqdXN0IGZhbGwgYmFjayB0byB0aGUgZXhpc3RpbmcKPiA+ID4gPiBhcHByb2FjaCwg
d2hpY2ggZXhpc3RlZCBpbiBwcmV2aW91cyB2ZXJzaW9ucyBidXQgaXMgcmVtb3ZlZCBpbiB0aGlz
Cj4gPiA+ID4gdmVyc2lvbi4KPiA+ID4KPiA+ID4gR3JhYmJpbmcgdGhlIE1NVSBsb2NrIGZvciB3
cml0ZSB0byBzY2FuIHN1Y2tzLCBubyBhcmd1bWVudCB0aGVyZS4gQnV0Cj4gPiA+IGNhbiB5b3Ug
cGxlYXNlIGJlIHNwZWNpZmljIGFib3V0IHRoZSBpbXBhY3Qgb2YgcmVhZCBsb2NrIHYuIFJDVSBp
biB0aGUKPiA+ID4gY2FzZSBvZiBhcm02ND8gSSBoYWQgYXNrZWQgYWJvdXQgdGhpcyBiZWZvcmUg
YW5kIHlvdSBuZXZlciByZXBsaWVkLgo+ID4gPgo+ID4gPiBNeSBjb25jZXJuIHJlbWFpbnMgdGhh
dCBhZGRpbmcgc3VwcG9ydCBmb3Igc29mdHdhcmUgdGFibGUgd2Fsa2Vycwo+ID4gPiBvdXRzaWRl
IG9mIHRoZSBNTVUgbG9jayBlbnRpcmVseSByZXF1aXJlcyBtb3JlIHdvcmsgdGhhbiBqdXN0IGRl
ZmVycmluZwo+ID4gPiB0aGUgZGVhbGxvY2F0aW9uIHRvIGFuIFJDVSBjYWxsYmFjay4gV2Fsa2Vy
cyB0aGF0IHByZXZpb3VzbHkgYXNzdW1lZAo+ID4gPiAnZXhjbHVzaXZlJyBhY2Nlc3Mgd2hpbGUg
aG9sZGluZyB0aGUgTU1VIGxvY2sgZm9yIHdyaXRlIG11c3Qgbm93IGNvcGUKPiA+ID4gd2l0aCB2
b2xhdGlsZSBQVEVzLgo+ID4gPgo+ID4gPiBZZXMsIHRoaXMgcHJvYmxlbSBhbHJlYWR5IGV4aXN0
cyB3aGVuIGhhcmR3YXJlIHNldHMgdGhlIEFGLCBidXQgdGhlCj4gPiA+IGxvY2stZnJlZSB3YWxr
ZXIgaW1wbGVtZW50YXRpb24gbmVlZHMgdG8gYmUgZ2VuZXJpYyBzbyBpdCBjYW4gYmUgYXBwbGll
ZAo+ID4gPiBmb3Igb3RoZXIgUFRFIGJpdHMuCj4gPgo+ID4gRGlyZWN0IHJlY2xhaW0gaXMgbXVs
dGktdGhyZWFkZWQgYW5kIGVhY2ggcmVjbGFpbWVyIGNhbiB0YWtlIHRoZSBtbXUKPiA+IGxvY2sg
Zm9yIHJlYWQgKHRlc3RpbmcgdGhlIEEtYml0KSBvciB3cml0ZSAodW5tYXBwaW5nIGJlZm9yZSBw
YWdpbmcKPiA+IG91dCkgb24gYXJtNjQuIFRoZSBmdW5kYW1lbnRhbCBwcm9ibGVtIG9mIHVzaW5n
IHRoZSByZWFkZXJzLXdyaXRlcgo+ID4gbG9jayBpbiB0aGlzIGNhc2UgaXMgcHJpb3JpdHkgaW52
ZXJzaW9uOiB0aGUgcmVhZGVycyBoYXZlIGxvd2VyCj4gPiBwcmlvcml0eSB0aGFuIHRoZSB3cml0
ZXJzLCBzbyBpZGVhbGx5LCB3ZSBkb24ndCB3YW50IHRoZSByZWFkZXJzIHRvCj4gPiBibG9jayB0
aGUgd3JpdGVycyBhdCBhbGwuCj4gPgo+ID4gVXNpbmcgbXkgcHJldmlvdXMgKGNydWRlKSBhbmFs
b2d5OiBwdXRpbmcgdGhlIGJpbGwgcmlnaHQgaW4gZnJvbnQgb2YKPiA+IHlvdSAodGhlIHdyaXRl
cnMpIHByb2ZpdHMgaW1tZWRpYXRlbHkgd2hlcmVhcyBzZWFyY2hpbmcgZm9yIHRoZQo+ID4gbGFy
Z2VzdCBiaWxsICh0aGUgcmVhZGVycykgY2FuIGJlIGZ1dGlsZS4KPiA+Cj4gPiBBcyBJIHNhaWQg
ZWFybGllciwgSSBwcmVmZXIgd2UgZHJvcCB0aGUgYXJtNjQgc3VwcG9ydCBmb3Igbm93LCBidXQg
SQo+ID4gd2lsbCBub3Qgb2JqZWN0IHRvIHRha2luZyB0aGUgbW11IGxvY2sgZm9yIHJlYWQgd2hl
biBjbGVhcmluZyB0aGUKPiA+IEEtYml0LCBhcyBsb25nIGFzIHdlIGZ1bGx5IHVuZGVyc3RhbmQg
dGhlIHByb2JsZW0gaGVyZSBhbmQgZG9jdW1lbnQgaXQKPiA+IGNsZWFybHkuCj4KPiBGV0lXLCBH
b29nbGUgQ2xvdWQgaGFzIGJlZW4gZG9pbmcgcHJvYWN0aXZlIHJlY2xhaW0gYW5kIGtzdGFsZWQt
YmFzZWQKPiBhZ2luZyAoYSBHb29nbGUtaW50ZXJuYWwgcGFnZSBhZ2luZyBkYWVtb24sIGZvciB0
aG9zZSBvdXRzaWRlIG9mCj4gR29vZ2xlKSBmb3IgbWFueSB5ZWFycyBvbiB4ODYgVk1zIHdpdGgg
dGhlIEEtYml0IGhhcnZlc3RpbmcKPiB1bmRlciB0aGUgd3JpdGUtbG9jay4gU28gSSdtIHNrZXB0
aWNhbCB0aGF0IG1ha2luZyBBUk02NCBsb2NrbGVzcyBpcwo+IG5lY2Vzc2FyeSB0byBhbGxvdyBT
ZWNvbmRhcnkgTU1VcyB0byBwYXJ0aWNpcGF0ZSBpbiBNR0xSVSBhZ2luZyB3aXRoCj4gYWNjZXB0
YWJsZSBwZXJmb3JtYW5jZSBmb3IgQ2xvdWQgdXNlY2FzZXMuIEkgZG9uJ3QgZXZlbiB0aGluayBp
dCdzCj4gbmVjZXNzYXJ5IG9uIHg4NiBidXQgaXQncyBhIHNpbXBsZSBlbm91Z2ggY2hhbmdlIHRo
YXQgd2UgbWlnaHQgYXMgd2VsbAo+IGp1c3QgZG8gaXQuCgpUaGUgb2J2aW91cyBjYXZlYXQgaGVy
ZTogSWYgTUdMUlUgYWdpbmcgYW5kIGtzdGFsZWQgYWdpbmcgYXJlCnN1YnN0YW50aWFsbHkgZGlm
ZmVyZW50IGluIGhvdyBmcmVxdWVudGx5IHRoZXkgdHJpZ2dlciBtbXVfbm90aWZpZXJzLAp0aGVu
IG15IGFuYWx5c2lzIG1heSBub3QgYmUgY29ycmVjdC4gSSdtIGhvcGluZyBZdSB5b3UgY2FuIHNo
ZWQgc29tZQpsaWdodCBvbiB0aGF0LiBJJ20gYWxzbyBvcGVyYXRpbmcgdW5kZXIgdGhlIGFzc3Vt
cHRpb24gdGhhdCBTZWNvbmRhcnkKTU1VcyBhcmUgb25seSBwYXJ0aWNpcGF0aW5nIGluIGFnaW5n
LCBhbmQgbm90IGxvb2stYXJvdW5kIChpLmUuIHdoYXQKaXMgaW1wbGVtZW50ZWQgaW4gdjQpLgoK
Pgo+IEkgc3VzcGVjdCB1bmRlciBwYXRob2xvZ2ljYWwgY29uZGl0aW9ucyAoaG9zdCB1bmRlciBp
bnRlbnNlIG1lbW9yeQo+IHByZXNzdXJlIGFuZCBoaWdoIHJhdGUgb2YgcmVjbGFpbSBvY2N1cnJp
bmcpIG1ha2luZyBBLWJpdCBoYXJ2ZXN0aW5nCj4gbG9ja2xlc3Mgd2lsbCBwZXJmb3JtIGJldHRl
ci4gQnV0IHVuZGVyIHN1Y2ggY29uZGl0aW9ucyBWTSBwZXJmb3JtYW5jZQo+IGlzIGxpa2VseSBn
b2luZyB0byBzdWZmZXIgcmVnYXJkbGVzcy4gSW4gYSBDbG91ZCBlbnZpcm9ubWVudCB3ZSBkZWFs
Cj4gd2l0aCB0aGF0IHRocm91Z2ggb3RoZXIgbWVjaGFuaXNtcyB0byByZWR1Y2UgdGhlIHJhdGUg
b2YgcmVjbGFpbSBhbmQKPiBtYWtlIHRoZSBob3N0IGhlYWx0aHkuCj4KPiBGb3IgdGhlc2UgcmVh
c29ucywgSSB0aGluayB0aGVyZSdzIHZhbHVlIGluIGdpdmluZyB1c2VycyB0aGUgb3B0aW9uIHRv
Cj4gZW5hYmxlIFNlY29uZGFyeSBNTVVzIHBhcnRpY2lwYXRpb24gTUdMUlUgYWdpbmcgZXZlbiB3
aGVuIEEtYml0Cj4gdGVzdC9jbGVhcmluZyBpcyBub3QgZG9uZSBsb2NrbGVzc2x5LiBJIGJlbGll
dmUgdGhpcyB3YXMgSmFtZXMnIGludGVudAo+IHdpdGggdGhlIEtjb25maWcuIFBlcmhhcHMgYSBk
ZWZhdWx0LW9mZiB3cml0YWJsZSBtb2R1bGUgcGFyYW1ldGVyCj4gd291bGQgYmUgYmV0dGVyIHRv
IGF2b2lkIGRpc3Ryb3MgYWNjaWRlbnRhbGx5IHR1cm5pbmcgaXQgb24/Cj4KPiBJZiBhbmQgd2hl
biB0aGVyZSBpcyBhIHVzZWNhc2UgZm9yIG9wdGltaXppbmcgVk0gcGVyZm9ybWFuY2UgdW5kZXIK
PiBwYXRob2xvZ2ljYWwgcmVjbGFpbSBjb25kaXRpb25zIG9uIEFSTSwgd2UgY2FuIG1ha2UgaXQg
bG9ja2xlc3MgdGhlbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
