Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E56CC02196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 22:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ehRKk2+72lYvn6CSQ3zo2AhiTrabGeKD4BN7h9Lfpzw=; b=KawCtYyUKdnAbx
	4fLkCnD9Ieqf1s1ZB4486YX5mMEmbMngRXJCw1MpObGwyha4NJPF/rFZ35txPNZZTZ3dzebcpYo2Q
	+3r9AowLJqpnxvs+5wyREf5JSAJf5pmIsR9lQh8B2JlMnWt5pk8yTbK2vxViMtxcT9YSFHLSXTNoW
	mBW4VC8MkANEy6GhNcdAvyKJ70OMNngH675Gxw6JJXKYyFmtWY60adkZkwKLN0HBMsihCPNCaax6i
	dbdI8S7QVn+7U9eQ5wT84h3+PDRIaMeXDZi4h4DItEVcUlZktKAPIEOqJPbM3+4U8jKPwIBfb2msC
	c+K60jtjE3ITUkWWwI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgAnf-00000007jyq-2PhX;
	Thu, 06 Feb 2025 22:56:47 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgAnc-00000007jxo-2tBQ;
	Thu, 06 Feb 2025 22:56:46 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so527578f8f.0;
        Thu, 06 Feb 2025 14:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738882603; x=1739487403; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPdz+11/bNSSDH103V+kKB8X98fGo5sDYDlVXDLnzsQ=;
        b=Dy5Kus7g1tGyqLfKS3Z8vAmNe6/kX0YzN1++/8nOcf2wKU9+BF4YMwWkdm7MKq/Lm2
         RRAGVjKFlw6panhkF+LRVhY/A54QwGWWqscnOGF9j9U6DWFMOtjtGqZqelaxqQZ7d2Uc
         Ii8A878AwI3djoH07S/2TkZ0CL6teZjrcnANIaLH00Vgpu69BSjt3di8pHyPTDJU40b/
         GtJvHEMHGTNvY0WkvmF+OdgORva+teZ2xLeVZf6HwOhAgKNnBwXM/r287vtzmQzjaQ7H
         w/wnM4zhRRCPaTqZ7CFIbFTLUtW3Vp7WckfrmJxD29af3AoFCnNVM6ICLHfEcie4uQN5
         HrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882603; x=1739487403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPdz+11/bNSSDH103V+kKB8X98fGo5sDYDlVXDLnzsQ=;
        b=XTcLEGiflJ721IlzuKYGITSNPfhvy/X89WTt+iBVDwKGfWL372cJMBXOW+c5E2WU5z
         ft4CI7OwleKMK9HB6j3LHIgsECHTBVY3SXrE2sFpxosWvIquBwyXraFzwVzXP9pAvAFV
         i4Dkugrd/SEUZpoAvjHNDpRbxyej/H4ezNhgtLPVbozvzThxCDRd6PMaPGehD1HctqSG
         4vEysUXm/DAUw/6wluAFBncDkeN/uxHh7FU3rdXDHgb+akWgPbcuOjbPP8VSVSAK2BQu
         P7/Z4T8nrIaHBcGd5tM8pbQYpzGkLZSXkcN+dASZGjZZn8dZvATT+suY8gvrj0gKE2Wb
         J4Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVYzoj4gLB86j5BrgG1L41eRI4B1DTLxpmEvS+IVAdlH64RJiP3R0tXyMM48Q+hPkFoXt5cnGf3wwfrx+A=@lists.infradead.org, AJvYcCW/TJJ6qVsmHli2wwluOl+PfVccAPy4ezEj31+wghVKH/Oos0Tc+td6SsZPZR1pzksxezre2/8P+i62bq1/0RbK@lists.infradead.org
X-Gm-Message-State: AOJu0YxiofDxKqdX4jaWR+oopoBV59KCN2SbVV1qnqw5TgATxRKxoWII
	1DIfw6JMZuA8+RZBXr4FG+y4QK2g8Vu4/RSH29qMVNwu8yCyFDrx0Z8VLvvqe1B1kbPdQJeiCO6
	WLLUpOQhZsgNyeoT1BVFzYWbZtXM=
X-Gm-Gg: ASbGnctAea0lYabmPK5HHEParmVfsAzo2aTxWx2KMzGZzB1lRu2G5LvQpGeOIHMF06B
	Y2XqMGHAbu3s7fe1DWCZVKlq7HHhhcO+j9n/VMRoRdE6T+LG37XZzX7kd2Z6gdZRwEyN0HmKxnx
	8=
X-Google-Smtp-Source: AGHT+IHgNzZylaM+zZeGmJCVW0wzeCzutFnm9tOjVqNinitAROSpEV6CxJxouNvJvwmUY/VWDRJbY8vF9dcNb2OIQgw=
X-Received: by 2002:a05:6000:154b:b0:38a:8ed1:c5c7 with SMTP id
 ffacd0b85a97d-38dc9491e7amr426795f8f.46.1738882602687; Thu, 06 Feb 2025
 14:56:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org> <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com>
 <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org> <29A74A26-E922-4A4F-9B4A-8DB0336B99DF@jrtc27.com>
 <94f81328-a135-b99b-7f73-43fb77bd7292@gentwo.org>
In-Reply-To: <94f81328-a135-b99b-7f73-43fb77bd7292@gentwo.org>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 23:56:31 +0100
X-Gm-Features: AWEUYZmoPWHhToAFkBuF21oc_INOOZFv4ej_J9A_VfxRgRnaQMcmFMInFI5cvqQ
Message-ID: <CA+fCnZfzPLiBcCLQTwkgBqP1D6Cw-gFrpKEpTHs5PYp07hYXug@mail.gmail.com>
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for x86
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, luto@kernel.org, xin@zytor.com, 
	kirill.shutemov@linux.intel.com, palmer@dabbelt.com, tj@kernel.org, 
	brgerst@gmail.com, ardb@kernel.org, dave.hansen@linux.intel.com, 
	jgross@suse.com, will@kernel.org, akpm@linux-foundation.org, arnd@arndb.de, 
	corbet@lwn.net, dvyukov@google.com, richard.weiyang@gmail.com, 
	ytcoode@gmail.com, tglx@linutronix.de, hpa@zytor.com, seanjc@google.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, justinstitt@google.com, 
	jason.andryuk@amd.com, glider@google.com, ubizjak@gmail.com, jannh@google.com, 
	bhe@redhat.com, vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, kees@kernel.org, kasan-dev@googlegroups.com, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_145644_725549_CA428A9D 
X-CRM114-Status: GOOD (  13.67  )
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

T24gVGh1LCBGZWIgNiwgMjAyNSBhdCA4OjIx4oCvUE0gJ0NocmlzdG9waCBMYW1ldGVyIChBbXBl
cmUpJyB2aWEKa2FzYW4tZGV2IDxrYXNhbi1kZXZAZ29vZ2xlZ3JvdXBzLmNvbT4gd3JvdGU6Cj4K
PiBJIGNhbm5vdCBzaGFyZSBkZXRhaWxzIHNpbmNlIHRoaXMgaW5mb3JtYXRpb24gaGFzIG5vdCBi
ZWVuIHJlbGVhc2VkIHRvIGJlCj4gcHVibGljIHlldC4gSSBoZWFyIHRoYXQgYSB3aGl0ZXBhcGVy
IHdpbGwgYmUgY29taW5nIHNvb24gdG8gZXhwbGFpbiB0aGlzCj4gZmVhdHVyZS4gVGhlIEFtcGVy
ZU9uZSBwcm9jZXNzb3JzIGhhdmUgYmVlbiByZWxlYXNlZCBhIGNvdXBsZSBvZiBtb250aHMKPiBh
Z28uCj4KPiBJIGFsc28gc2VlIHRoYXQgS0FTQU5fSFdfVEFHUyBleGlzdCBidXQgdGhpcyBtZWFu
cyB0aGF0IHRoZSB0YWdzIGNhbiBvbmx5Cj4gYmUgdXNlZCB3aXRoIENPTkZJR19LQVNBTiB3aGlj
aCBpcyBhIGtlcm5lbCBjb25maWd1cmF0aW9uIGZvciBkZWJ1Zwo+IHB1cnBvc2VzLgo+Cj4gV2hh
dCB3ZSBhcmUgaW50ZXJlc3RlZCBpbiBpcyBhICpwcm9kdWN0aW9uKiBpbXBsZW1lbnRhdGlvbiB3
aXRoIG1pbmltYWwKPiBzb2Z0d2FyZSBvdmVyaGVhZCB0aGF0IHdpbGwgYmUgdGhlIGRlZmF1bHQg
b24gQVJNNjQgaWYgdGhlIGFwcHJvcHJpYXRlCj4gaGFyZHdhcmUgaXMgZGV0ZWN0ZWQuIFRoYXQg
aW4gdHVybiB3aWxsIGhvcGVmdWxseSBhbGxvdyBvdGhlciBzb2Z0d2FyZQo+IGluc3RydW1lbnRh
dGlvbiB0aGF0IGlzIGN1cnJlbnRseSB1c2VkIHRvIGtlZXAgc21hbGwgb2JqZWN0cyBzZWN1cmUg
YW5kIGluCj4gdHVybiBjcmVhdGVzIG92ZXJoZWFkLgoKSXMgdGhlcmUgYW55dGhpbmcgc3BlY2lm
aWMgQ09ORklHX0tBU0FOICsgQ09ORklHX0tBU0FOX0hXX1RBR1MgZG8gdGhhdAppcyBub3QgZ29v
ZCBlbm91Z2ggZm9yIGEgcHJvZHVjdGlvbiBlbnZpcm9ubWVudD8KClRoZSBsYXN0IHRpbWUgSSBk
aWQgc29tZSBwZXJmIHRlc3RzIChhIHllYXIrIGFnbyBvbiBQaXhlbCA4LCBJCmJlbGlldmUpLCB0
aGUgdHdvIGV4cGVuc2l2ZSBwYXJ0cyBvZiBDT05GSUdfS0FTQU5fSFdfVEFHUyB3ZXJlOgoKMS4g
Q29sbGVjdGluZyBzdGFjayB0cmFjZXMuIFRodXMsIHRoaXMgY2FuIG5vdyBiZSBkaXNhYmxlZCB2
aWEKa2VybmVsLnN0YWNrdHJhY2U9b2ZmLiBBbmQgdGhlcmUncyBhIHRyYWNraW5nIGJ1ZyB0byBh
ZGQgYQpwcm9kdWN0aW9uLWdyYWRlIGltcGxlbWVudGF0aW9uIFsxXTsKCjIuIEFzc2lnbmluZyBt
ZW1vcnkgdGFncyB0byBsYXJnZSBhbGxvY2F0aW9ucywgc3BlY2lmaWNhbGx5IHBhZ2VfYWxsb2MK
YWxsb2NhdGlvbnMgd2l0aCBsYXJnZSBvcmRlcnMgIChBRkFJUiBpcyB3YXMgc3BlY2lmaWNhbGx5
IGFzc2lnbmluZwp0aGUgdGFncywgbm90IGNoZWNraW5nIHRoZW0pLiBUaHVzLCB0aGlzIGNhbiBu
b3cgYmUgY29udHJvbGxlZCB2aWEKa2FzYW4ucGFnZV9hbGxvYy5zYW1wbGUoLm9yZGVyKS4KClRo
ZXJlJ3MgZGVmaW5pdGVseSByb29tIGZvciBvcHRpbWl6YXRpb24gYW5kIGFkZGl0aW9uYWwgY29u
ZmlnIG9wdGlvbnMKdGhhdCBjdXQgZG93biBLQVNBTiBjaGVja3MgKGZvciBleGFtcGxlLCBkaXNh
YmxpbmcgdGFnIGNoZWNraW5nIG9mCm1lbXBvb2wgYWxsb2NhdGlvbnM7IGFsdGhvdWdoIGFyZ3Vh
Ymx5LCBwZW9wbGUgbWlnaHQgd2FudCB0byBoYXZlIHRoaXMKaW4gYSBwcm9kdWN0aW9uIGVudmly
b25tZW50LikKCk90aGVyd2lzZSwgaXQncyB1bmNsZWFyIHRvIG1lIHdoYXQgYSBuZXcgcHJvZHVj
dGlvbi1ncmFkZSBNVEUKaW1wbGVtZW50YXRpb24gd291bGQgZG8gZGlmZmVyZW50IGNvbXBhcmVk
IHRvIEtBU0FOX0hXX1RBR1MuIEJ1dCBpZgp0aGVyZSdzIHNvbWV0aGluZywgd2UgY2FuIGp1c3Qg
YWRqdXN0IEtBU0FOX0hXX1RBR1MgaW5zdGVhZC4KClsxXSBodHRwczovL2J1Z3ppbGxhLmtlcm5l
bC5vcmcvc2hvd19idWcuY2dpP2lkPTIxMTc4NQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
