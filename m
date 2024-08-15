Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D02C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 13:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8dsLisvOp9oCtPYKnkJHQvhcxd3yHT2ceuAibe9iak=; b=KfdJSzy6euHoIB
	K31HL7pMdJZkSkb/TJPfORUKMV0aerVjB8N+8pl7tb96S5EC9waT9HzQu4TOYTl3BABBgu1vpsQBE
	iqF9EMkpB2H3uZcv0WJ0yFxBpFBgPl9rOndyylxZ5vI92eAy0S3gaZutCWLx9Rcy06mMVLrYfKkKL
	P/wgKLRoqWMGv+EAtrxoI6c6Bvg3QyUI8P5JarNtGmpwuCsIGUiGYTpOR4y7ux/LcgHrw5DE2tQKL
	/doQpTtSWP4eK5rtDqhJ0MySwGDi9+JZdqqlUUWbqGfrtWqxfc4eWJZmb/Dy29DPdpdYHpuGiw+rG
	5nBUNnUL3NR9J8EEtyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seacQ-0000000A3Ye-3apH;
	Thu, 15 Aug 2024 13:34:22 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seacO-0000000A3We-1NDy
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 13:34:22 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5a15692b6f6so1273608a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723728858; x=1724333658; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uf+s/T5xCp+3fTbJjT+zyzmVlfgDLq1GD3LsWtGwKVU=;
        b=QOYIFTkAVUc2ar/u+1GfSFHmDWMPK5cyQpzsS5Mk7nkAfqNOjkFLQsLOIbi4s0d3oM
         /Plc8ShKmtu3xUvrKduGP8krN3MMhPQcy5dEwIvj1fE/CQeieDaCcVuaqf8zG8YzXio+
         f1eA4wZ1oqn6jSBNpiZeVJ/r5ZcPqx/qJYa3vA54EbesFdRsL5qLZ0V69u0c3TZCXJR4
         SZoyUG6yoZXdAiA1CuVX/0RX3dZ7/H5/0I0HkEForggMfl3vfsXFp7WxR/mzbNnuBRnD
         gk5jc+exB5xt9KVGwdMg3LFx3FellXkouM/wVkP1kYgi4IfJeSFDbV4Ln8yNkQN3kV4N
         Jq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723728858; x=1724333658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uf+s/T5xCp+3fTbJjT+zyzmVlfgDLq1GD3LsWtGwKVU=;
        b=pH6Yxag8q9d2R9fiAiXyR1rwXj+RGhnV+2ZU4c2J6txftECzd29vbDCs3AJQJ6YLak
         j2zgO3ggutos7gZE4SL8u3jhEZRmW5qZmuRcfkw3+jPin3AiEt4DHv4bFuBXyS/67d81
         dj+6hJJMrqJru+nagOvlpxRILKqAZ9pxV18K3svrheo+CRWSjbafb8Fnm4EQA5okPvDe
         WGSLo/AiNFsCovfcarc0w9SqTYU/pSs8enXEs/wnlGG3k7rI4UvfRyVWIBqsb5kFJORL
         6H+5zENE8tMAzrGDo1q+j3nkMG+iJEZftTi1vff+UNZW8g/vekfOHSC5wGPUprrB5dig
         yEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCULvfxJD1GH9QiLaA3xbK8W8CZCgE/LrvECU7gmMPVVjhvhVB+ghTOmWPFsuRO8ZbLQQpjCNV2EdDEdTP3GVCs/b1rFMYfP0u1dxHARhh4d
X-Gm-Message-State: AOJu0Yxczi7GbgH9M0UfrI7jasAlTpmAuVPjL6y1I6x4xuSvqa8u4f/7
	jn3woRiPoZnNG3llOa1FBfl8+zus5WM38E7dc5RN2CYosJJ8c97XNHc9dolAe9s=
X-Google-Smtp-Source: AGHT+IGJZeX9x/BRQJo3d2wjrrZWdO+Zhhlxj0cF6zy/2fP9OXjfT0TWw6RvV17Cu+G0YZEVeHbTUw==
X-Received: by 2002:a05:6402:50cf:b0:5be:a05a:2e38 with SMTP id 4fb4d7f45d1cf-5bea1cad0a2mr4777968a12.27.1723728857600;
        Thu, 15 Aug 2024 06:34:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbbe2707sm910747a12.7.2024.08.15.06.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 06:34:16 -0700 (PDT)
Date: Thu, 15 Aug 2024 15:34:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 13/13] riscv: Add qspinlock support
Message-ID: <20240815-17cff9794dd6fb3440478622@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-14-alexghiti@rivosinc.com>
 <20240731-ce25dcdc5ce9ccc6c82912c0@orel>
 <CAHVXubgtD_nDBL2H-MYb9V+3jLBoszz8HAZ2NTTsiS2wR6aPDQ@mail.gmail.com>
 <6f1bcc9b-1812-4e8c-9050-a750bfadd008@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f1bcc9b-1812-4e8c-9050-a750bfadd008@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_063420_428595_5836F19E 
X-CRM114-Status: GOOD (  47.41  )
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

T24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgMDM6Mjc6MzFQTSBHTVQsIEFsZXhhbmRyZSBHaGl0aSB3
cm90ZToKPiBIaSBBbmRyZXcsCj4gCj4gT24gMDEvMDgvMjAyNCAwODo1MywgQWxleGFuZHJlIEdo
aXRpIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgNToyOeKAr1BNIEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1bCAz
MSwgMjAyNCBhdCAwOToyNDowNUFNIEdNVCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gPiA+
IEluIG9yZGVyIHRvIHByb2R1Y2UgYSBnZW5lcmljIGtlcm5lbCwgYSB1c2VyIGNhbiBzZWxlY3QK
PiA+ID4gPiBDT05GSUdfQ09NQk9fU1BJTkxPQ0tTIHdoaWNoIHdpbGwgZmFsbGJhY2sgYXQgcnVu
dGltZSB0byB0aGUgdGlja2V0Cj4gPiA+ID4gc3BpbmxvY2sgaW1wbGVtZW50YXRpb24gaWYgWmFi
aGEgb3IgWmljY3JzZSBhcmUgbm90IHByZXNlbnQuCj4gPiA+ID4gCj4gPiA+ID4gTm90ZSB0aGF0
IHdlIGNhbid0IHVzZSBhbHRlcm5hdGl2ZXMgaGVyZSBiZWNhdXNlIHRoZSBkaXNjb3Zlcnkgb2YK
PiA+ID4gPiBleHRlbnNpb25zIGlzIGRvbmUgdG9vIGxhdGUgYW5kIHdlIG5lZWQgdG8gc3RhcnQg
d2l0aCB0aGUgcXNwaW5sb2NrCj4gPiA+ID4gaW1wbGVtZW50YXRpb24gYmVjYXVzZSB0aGUgdGlj
a2V0IHNwaW5sb2NrIGltcGxlbWVudGF0aW9uIHdvdWxkIHBvbGx1dGUKPiA+ID4gPiB0aGUgc3Bp
bmxvY2sgdmFsdWUsIHNvIGxldCdzIHVzZSBzdGF0aWMga2V5cy4KPiA+ID4gPiAKPiA+ID4gPiBU
aGlzIGlzIGxhcmdlbHkgYmFzZWQgb24gR3VvJ3Mgd29yayBhbmQgTGVvbmFyZG8gcmV2aWV3cyBh
dCBbMV0uCj4gPiA+ID4gCj4gPiA+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvMjAyMzEyMjUxMjU4NDcuMjc3ODYzOC0xLWd1b3JlbkBrZXJuZWwub3JnLyBbMV0K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+
Cj4gPiA+ID4gLS0tCj4gPiA+ID4gICAuLi4vbG9ja2luZy9xdWV1ZWQtc3BpbmxvY2tzL2FyY2gt
c3VwcG9ydC50eHQgfCAgMiArLQo+ID4gPiA+ICAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMjkgKysrKysrKysrKysrKwo+ID4gPiA+ICAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9LYnVpbGQgICAgICAgICAgICAgICAgIHwgIDQgKy0KPiA+ID4gPiAgIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc3BpbmxvY2suaCAgICAgICAgICAgICB8IDQzICsrKysrKysr
KysrKysrKysrKysKPiA+ID4gPiAgIGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgICAgICAgICAg
ICAgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysKPiA+ID4gPiAgIGluY2x1ZGUvYXNtLWdl
bmVyaWMvcXNwaW5sb2NrLmggICAgICAgICAgICAgICB8ICAyICsKPiA+ID4gPiAgIGluY2x1ZGUv
YXNtLWdlbmVyaWMvdGlja2V0X3NwaW5sb2NrLmggICAgICAgICB8ICAyICsKPiA+ID4gPiAgIDcg
ZmlsZXMgY2hhbmdlZCwgMTE4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+ID4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zcGlubG9jay5oCj4g
PiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZmVhdHVyZXMvbG9ja2lu
Zy9xdWV1ZWQtc3BpbmxvY2tzL2FyY2gtc3VwcG9ydC50eHQgYi9Eb2N1bWVudGF0aW9uL2ZlYXR1
cmVzL2xvY2tpbmcvcXVldWVkLXNwaW5sb2Nrcy9hcmNoLXN1cHBvcnQudHh0Cj4gPiA+ID4gaW5k
ZXggMjJmMjk5MDM5MmZmLi5jZjI2MDQyNDgwZTIgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9mZWF0dXJlcy9sb2NraW5nL3F1ZXVlZC1zcGlubG9ja3MvYXJjaC1zdXBwb3J0LnR4
dAo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZmVhdHVyZXMvbG9ja2luZy9xdWV1ZWQtc3Bp
bmxvY2tzL2FyY2gtc3VwcG9ydC50eHQKPiA+ID4gPiBAQCAtMjAsNyArMjAsNyBAQAo+ID4gPiA+
ICAgICAgIHwgICAgb3BlbnJpc2M6IHwgIG9rICB8Cj4gPiA+ID4gICAgICAgfCAgICAgIHBhcmlz
YzogfCBUT0RPIHwKPiA+ID4gPiAgICAgICB8ICAgICBwb3dlcnBjOiB8ICBvayAgfAo+ID4gPiA+
IC0gICAgfCAgICAgICByaXNjdjogfCBUT0RPIHwKPiA+ID4gPiArICAgIHwgICAgICAgcmlzY3Y6
IHwgIG9rICB8Cj4gPiA+ID4gICAgICAgfCAgICAgICAgczM5MDogfCBUT0RPIHwKPiA+ID4gPiAg
ICAgICB8ICAgICAgICAgIHNoOiB8IFRPRE8gfAo+ID4gPiA+ICAgICAgIHwgICAgICAgc3BhcmM6
IHwgIG9rICB8Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gv
cmlzY3YvS2NvbmZpZwo+ID4gPiA+IGluZGV4IGVmNTVhYjk0MDI3ZS4uYzlmZjgwODFlZmMxIDEw
MDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiA+ICsrKyBiL2FyY2gv
cmlzY3YvS2NvbmZpZwo+ID4gPiA+IEBAIC03OSw2ICs3OSw3IEBAIGNvbmZpZyBSSVNDVgo+ID4g
PiA+ICAgICAgICBzZWxlY3QgQVJDSF9XQU5UX09QVElNSVpFX0hVR0VUTEJfVk1FTU1BUAo+ID4g
PiA+ICAgICAgICBzZWxlY3QgQVJDSF9XQU5UU19OT19JTlNUUgo+ID4gPiA+ICAgICAgICBzZWxl
Y3QgQVJDSF9XQU5UU19USFBfU1dBUCBpZiBIQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0UK
PiA+ID4gPiArICAgICBzZWxlY3QgQVJDSF9XRUFLX1JFTEVBU0VfQUNRVUlSRSBpZiBBUkNIX1VT
RV9RVUVVRURfU1BJTkxPQ0tTCj4gPiA+IFdoeSBkbyB3ZSBuZWVkIHRoaXM/IEFsc28sIHdlIHBy
ZXN1bWFibHkgd291bGQgcHJlZmVyIG5vdCB0byBoYXZlIGl0Cj4gPiA+IHdoZW4gd2UgZW5kIHVw
IHVzaW5nIHRpY2tldCBzcGlubG9ja3Mgd2hlbiBjb21ibyBzcGlubG9ja3MgaXMgc2VsZWN0ZWQu
Cj4gPiA+IElzIHRoZXJlIG5vIHdheSB0byBhdm9pZCBpdD8KPiA+IEknbGwgbGV0IEFuZHJlYSBh
bnN3ZXIgdGhpcyBhcyBoZSBhc2tlZCBmb3IgaXQuCj4gPiAKPiA+ID4gPiAgICAgICAgc2VsZWN0
IEJJTkZNVF9GTEFUX05PX0RBVEFfU1RBUlRfT0ZGU0VUIGlmICFNTVUKPiA+ID4gPiAgICAgICAg
c2VsZWN0IEJVSUxEVElNRV9UQUJMRV9TT1JUIGlmIE1NVQo+ID4gPiA+ICAgICAgICBzZWxlY3Qg
Q0xJTlRfVElNRVIgaWYgUklTQ1ZfTV9NT0RFCj4gPiA+ID4gQEAgLTQ4OCw2ICs0ODksMzQgQEAg
Y29uZmlnIE5PREVTX1NISUZUCj4gPiA+ID4gICAgICAgICAgU3BlY2lmeSB0aGUgbWF4aW11bSBu
dW1iZXIgb2YgTlVNQSBOb2RlcyBhdmFpbGFibGUgb24gdGhlIHRhcmdldAo+ID4gPiA+ICAgICAg
ICAgIHN5c3RlbS4gIEluY3JlYXNlcyBtZW1vcnkgcmVzZXJ2ZWQgdG8gYWNjb21tb2RhdGUgdmFy
aW91cyB0YWJsZXMuCj4gPiA+ID4gCj4gPiA+ID4gK2Nob2ljZQo+ID4gPiA+ICsgICAgIHByb21w
dCAiUklTQy1WIHNwaW5sb2NrIHR5cGUiCj4gPiA+ID4gKyAgICAgZGVmYXVsdCBSSVNDVl9DT01C
T19TUElOTE9DS1MKPiA+ID4gPiArCj4gPiA+ID4gK2NvbmZpZyBSSVNDVl9USUNLRVRfU1BJTkxP
Q0tTCj4gPiA+ID4gKyAgICAgYm9vbCAiVXNpbmcgdGlja2V0IHNwaW5sb2NrIgo+ID4gPiA+ICsK
PiA+ID4gPiArY29uZmlnIFJJU0NWX1FVRVVFRF9TUElOTE9DS1MKPiA+ID4gPiArICAgICBib29s
ICJVc2luZyBxdWV1ZWQgc3BpbmxvY2siCj4gPiA+ID4gKyAgICAgZGVwZW5kcyBvbiBTTVAgJiYg
TU1VICYmIE5PTlBPUlRBQkxFCj4gPiA+ID4gKyAgICAgc2VsZWN0IEFSQ0hfVVNFX1FVRVVFRF9T
UElOTE9DS1MKPiA+ID4gPiArICAgICBoZWxwCj4gPiA+ID4gKyAgICAgICBUaGUgcXVldWVkIHNw
aW5sb2NrIGltcGxlbWVudGF0aW9uIHJlcXVpcmVzIHRoZSBmb3J3YXJkIHByb2dyZXNzCj4gPiA+
ID4gKyAgICAgICBndWFyYW50ZWUgb2YgY21weGNoZygpL3hjaGcoKSBhdG9taWMgb3BlcmF0aW9u
czogQ0FTIHdpdGggWmFiaGEgb3IKPiA+ID4gPiArICAgICAgIExSL1NDIHdpdGggWmljY3JzZSBw
cm92aWRlIHN1Y2ggZ3VhcmFudGVlLgo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgIFNlbGVjdCB0
aGlzIGlmIGFuZCBvbmx5IGlmIFphYmhhIG9yIFppY2Nyc2UgaXMgYXZhaWxhYmxlIG9uIHlvdXIK
PiA+ID4gPiArICAgICAgIHBsYXRmb3JtLgo+ID4gPiBNYXliZSBzb21lIHRleHQgcmVjb21tZW5k
aW5nIGNvbWJvIHNwaW5sb2NrcyBoZXJlPyBBcyBpdCBzdGFuZHMgaXQgc291bmRzCj4gPiA+IGxp
a2UgZW5hYmxpbmcgcXVldWVkIHNwaW5sb2NrcyBpcyBhIGJhZCBpZGVhIGZvciBhbnlib2R5IHRo
YXQgZG9lc24ndCBrbm93Cj4gPiA+IHdoYXQgcGxhdGZvcm1zIHdpbGwgcnVuIHRoZSBrZXJuZWwg
dGhleSdyZSBidWlsZGluZywgd2hpY2ggaXMgYWxsIGRpc3Ryb3MuCj4gPiBUaGF0J3MgTk9OUE9S
VEFCTEUsIHNvIHBlb3BsZSBlbmFibGluZyB0aGlzIGNvbmZpZyBhcmUgc3VwcG9zZWQgdG8KPiA+
IGtub3cgdGhhdCByaWdodD8KPiA+IAo+ID4gPiA+ICsKPiA+ID4gPiArY29uZmlnIFJJU0NWX0NP
TUJPX1NQSU5MT0NLUwo+ID4gPiA+ICsgICAgIGJvb2wgIlVzaW5nIGNvbWJvIHNwaW5sb2NrIgo+
ID4gPiA+ICsgICAgIGRlcGVuZHMgb24gU01QICYmIE1NVQo+ID4gPiA+ICsgICAgIHNlbGVjdCBB
UkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTCj4gPiA+ID4gKyAgICAgaGVscAo+ID4gPiA+ICsgICAg
ICAgRW1iZWQgYm90aCBxdWV1ZWQgc3BpbmxvY2sgYW5kIHRpY2tldCBsb2NrIHNvIHRoYXQgdGhl
IHNwaW5sb2NrCj4gPiA+ID4gKyAgICAgICBpbXBsZW1lbnRhdGlvbiBjYW4gYmUgY2hvc2VuIGF0
IHJ1bnRpbWUuCj4gPiA+IG5pdDogQWRkIGEgYmxhbmsgbGluZSBoZXJlCj4gPiBEb25lCj4gPiAK
PiA+ID4gPiArZW5kY2hvaWNlCj4gPiA+ID4gKwo+ID4gPiA+ICAgY29uZmlnIFJJU0NWX0FMVEVS
TkFUSVZFCj4gPiA+ID4gICAgICAgIGJvb2wKPiA+ID4gPiAgICAgICAgZGVwZW5kcyBvbiAhWElQ
X0tFUk5FTAo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL0tidWls
ZCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vS2J1aWxkCj4gPiA+ID4gaW5kZXggNWM1ODk3NzBm
MmE4Li4xYzI2MThjOTY0ZjAgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9LYnVpbGQKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL0tidWlsZAo+
ID4gPiA+IEBAIC01LDEwICs1LDEyIEBAIHN5c2NhbGwteSArPSBzeXNjYWxsX3RhYmxlXzY0LmgK
PiA+ID4gPiAgIGdlbmVyaWMteSArPSBlYXJseV9pb3JlbWFwLmgKPiA+ID4gPiAgIGdlbmVyaWMt
eSArPSBmbGF0LmgKPiA+ID4gPiAgIGdlbmVyaWMteSArPSBrdm1fcGFyYS5oCj4gPiA+ID4gK2dl
bmVyaWMteSArPSBtY3Nfc3BpbmxvY2suaAo+ID4gPiA+ICAgZ2VuZXJpYy15ICs9IHBhcnBvcnQu
aAo+ID4gPiA+IC1nZW5lcmljLXkgKz0gc3BpbmxvY2suaAo+ID4gPiA+ICAgZ2VuZXJpYy15ICs9
IHNwaW5sb2NrX3R5cGVzLmgKPiA+ID4gPiArZ2VuZXJpYy15ICs9IHRpY2tldF9zcGlubG9jay5o
Cj4gPiA+ID4gICBnZW5lcmljLXkgKz0gcXJ3bG9jay5oCj4gPiA+ID4gICBnZW5lcmljLXkgKz0g
cXJ3bG9ja190eXBlcy5oCj4gPiA+ID4gK2dlbmVyaWMteSArPSBxc3BpbmxvY2suaAo+ID4gPiA+
ICAgZ2VuZXJpYy15ICs9IHVzZXIuaAo+ID4gPiA+ICAgZ2VuZXJpYy15ICs9IHZtbGludXgubGRz
LmgKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zcGlubG9jay5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zcGlubG9jay5oCj4gPiA+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjUwM2FlZjMxZGI4Mwo+ID4gPiA+
IC0tLSAvZGV2L251bGwKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NwaW5s
b2NrLmgKPiA+ID4gPiBAQCAtMCwwICsxLDQzIEBACj4gPiA+ID4gKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wICovCj4gPiA+ID4gKwo+ID4gPiA+ICsjaWZuZGVmIF9fQVNNX1JJ
U0NWX1NQSU5MT0NLX0gKPiA+ID4gPiArI2RlZmluZSBfX0FTTV9SSVNDVl9TUElOTE9DS19ICj4g
PiA+ID4gKwo+ID4gPiA+ICsjaWZkZWYgQ09ORklHX1JJU0NWX0NPTUJPX1NQSU5MT0NLUwo+ID4g
PiA+ICsjZGVmaW5lIF9RX1BFTkRJTkdfTE9PUFMgICAgICgxIDw8IDkpCj4gPiA+ID4gKwo+ID4g
PiA+ICsjZGVmaW5lIF9fbm9fYXJjaF9zcGlubG9ja19yZWRlZmluZQo+ID4gPiA+ICsjaW5jbHVk
ZSA8YXNtL3RpY2tldF9zcGlubG9jay5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8YXNtL3FzcGlubG9j
ay5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+Cj4gPiA+IFdlIG5lZWQg
YXNtL2p1bXBfbGFiZWwuaCBpbnN0ZWFkIG9mIGFzbS9hbHRlcm5hdGl2ZS5oLCBidXQuLi4KPiA+
ID4gCj4gPiA+ID4gKwo+ID4gPiA+ICtERUNMQVJFX1NUQVRJQ19LRVlfVFJVRShxc3BpbmxvY2tf
a2V5KTsKPiA+ID4gPiArCj4gPiA+ID4gKyNkZWZpbmUgU1BJTkxPQ0tfQkFTRV9ERUNMQVJFKG9w
LCB0eXBlLCB0eXBlX2xvY2spICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiArc3RhdGljIF9f
YWx3YXlzX2lubGluZSB0eXBlIGFyY2hfc3Bpbl8jI29wKHR5cGVfbG9jayBsb2NrKSAgICAgICAg
ICAgXAo+ID4gPiA+ICt7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gKyAgICAgaWYgKHN0YXRpY19icmFu
Y2hfdW5saWtlbHkoJnFzcGlubG9ja19rZXkpKSAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4g
PiArICAgICAgICAgICAgIHJldHVybiBxdWV1ZWRfc3Bpbl8jI29wKGxvY2spOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ID4gPiA+ICsgICAgIHJldHVybiB0aWNrZXRfc3Bpbl8jI29wKGxv
Y2spOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gK30KPiA+ID4g
Li4uZG8geW91IGtub3cgd2hhdCBpbXBhY3QgdGhpcyBpbmxpbmVkIHN0YXRpYyBrZXkgY2hlY2sg
aGFzIG9uIHRoZQo+ID4gPiBrZXJuZWwgc2l6ZT8KPiA+IE5vLCBJJ2xsIGNoZWNrLCB0aGFua3Mu
Cj4gCj4gCj4gU28gSSBoYXZlIGp1c3QgY2hlY2tlZCB0aGUgc2l6ZSBvZiB0aGUganVtcCB0YWJs
ZSBzZWN0aW9uOgo+IAo+ICogZGVmY29uZmlnOgo+IAo+IC0gdGlja2V0OiAyNjkyOCBieXRlcwo+
IC0gY29tYm86IDI4MzIwIGJ5dGVzCj4gCj4gU28gdGhhdCdzIGEgfjUlIGluY3JlYXNlLgo+IAo+
ICogdWJ1bnR1IGNvbmZpZwo+IAo+IC0gdGlja2V0OiAxMDc4NDAgYnl0ZXMKPiAtIGNvbWJvOiAx
NzQ3NTIgYnl0ZXMKPiAKPiBBbmQgdGhhdCdzIGEgfjYyJSBpbmNyZWFzZS4KPiAKPiBUaGlzIGlz
IHRoZSBFTEYgc2l6ZSBkaWZmZXJlbmNlIGJldHdlZW4gdGlja2V0IGFuZCBjb21ibyBzcGlubG9j
a3M6Cj4gCj4gKiB0aWNrZXQ6IDc3NjkxNTU5MiBieXRlcwo+ICogY29tYm86IDc4Njk1ODk2OCBi
eXRlcwo+IAo+IFNvIHRoYXQncyBhbiBpbmNyZWFzZSBvZiB+MS4zJSBvbiB0aGUgRUxGLgo+IAo+
IEFuZCB0aGUgLnRleHQgc2VjdGlvbiBzaXplOgo+IAo+ICogdGlja2V0OiAxMjI5MDk2MCBieXRl
cwo+ICogY29tYm86IDEyMzY2NjQ0IGJ5dGVzCj4gCj4gQW5kIHRoYXQncyBhIH4wLjYlIGluY3Jl
YXNlIQo+IAo+IEZpbmFsbHksIEknZCBzYXkgdGhlIGltcGFjdCBpcyB2ZXJ5IGxpbWl0ZWQgOikK
ClRoYW5rcyBmb3IgY2hlY2tpbmchCgpkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
