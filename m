Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4ABC6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAlCOBp5AG0S0FO+QM0I/vKPMACpbMBVJJwwsFp6cDY=; b=RVmuos876G+CtY
	qUXIlqcBkEy7KVQoG6btWIaB6+dKPQOBwXCwp+3gIvlV0gBaq589X5qPGnWN/5QGUkDFEp7fpN0i5
	y0CEkeI37QTm+2UyaGjO0ytldDdG3LMi0UYrfqIoI8bHSP4qvSt7hEDqD8RR1KNfrBmNWc77Vdsbt
	lCTUCFvroLpurjm1I1Wy1NFZKVX2x9R+UFG6VzwrzC/FFlJ4nKWyYwqnraiNKYRgFgpix8lIt6x3k
	dMpm4z8fgvwQ+FWsGeC5focewau0QqIHkJnAVfwhBeCm74Ysvw/uYNAanzTjwhaKROlQK6nlDZ0Au
	fml3542ezSdNmRqjBUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMLz-002Fp5-1H;
	Thu, 23 Mar 2023 14:55:47 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMLv-002FnR-36
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 14:55:45 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id c1so16400584vsk.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 07:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679583342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+oTlLkGu4XBg7D9GQLxh6VnC+XUJIJTBF8fUhsoTP8=;
        b=LTBfqwlf/M9rJPjcbZEXH/wbqe1ZOqjIzjST3UXornybx+R7J7pGQpUrAHtHTzDGvu
         cL7EpEXBe23GlAZa7FOxq38BNNXRVgmUXNdIQBCuStekUCBhCTybk3WfGhWfZTKSChWD
         JnbCIa60L1xcSOqFe1o8B9d3fnK5bQT7zYWnp6T2+O+g66fM53F/t0PL2q+FzqlKML8O
         fTgKD2u4V0j+0KxM4ylNAg8sWdHs65ZORGm4UfB01kqzI9HXoSclY2mcKnpT1xLnQFlM
         nXCDrYU7AiJ4IL73YeAi0M4yLsQmhK2hvdB662T2PEHkxhthJAZ+8H9Iy13bi3HAzPEL
         IAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+oTlLkGu4XBg7D9GQLxh6VnC+XUJIJTBF8fUhsoTP8=;
        b=YmIKFdpRBhz06EhBiN4PBB+Og4WBDfEvXmxPxgxYtX9IZfrUZbCs5h2KvKmIIMxscX
         xJH9+IsDPr9NwXDRQXxXKsP41O5IO6Jh7/3iPqsaqBoQarTVtLx+tTTQD/JDZ+xS/oQL
         9rIuv1wni2W1IAaaxwGIQbyp6T4j+36WtoyGnFLF6+TDOBEk9SLlMi0d/Uv2U94grkam
         Pf1KBIbMTOl1dV5VmsEN7+HwY4QfoWLt51Hq1uewlFDkF96gi+O1M2+z5Q4XICxhEuaD
         fj9GM+nWXs6Y4s1RzdPWBOOT5vXYff1W2GiccH007erN5hi4NGRfKmHI/xqNCMHiWhUs
         KzXw==
X-Gm-Message-State: AO0yUKUn5lc0IncL1np9+jcE6Y9xR1yrgI9Gn7RdRYBMNzkulJXZMzPQ
	WL6hj0ZG1zihrEOXkQL75B9yr7ImiOUBbbXrlZyz+Q==
X-Google-Smtp-Source: AK7set9i+OocmGY8L3enlKAK0g0CHDPShP25dec9yB6zEMC739pzT/6c96zssGZJJoRlEi9hIXGwiBLNEQySgGEkvRo=
X-Received: by 2002:a67:d71d:0:b0:425:dd21:acc8 with SMTP id
 p29-20020a67d71d000000b00425dd21acc8mr2013668vsj.7.1679583341611; Thu, 23 Mar
 2023 07:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230316131711.1284451-1-alexghiti@rivosinc.com>
 <CAK9=C2XJtSG2d_nsyDv7kU1v7Jj0chdevqrMc0MpJswukcEABA@mail.gmail.com> <CAHVXubhhxpzHDM-n91V_rceY5t_VqLvrwZj3RP_tNL2=F9mqjQ@mail.gmail.com>
In-Reply-To: <CAHVXubhhxpzHDM-n91V_rceY5t_VqLvrwZj3RP_tNL2=F9mqjQ@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 Mar 2023 20:25:29 +0530
Message-ID: <CAK9=C2WVOpSqtt8r1U4hnzSZ=cc1PocpukgQjNyahP2XuPhozw@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup@brainfault.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_075544_000909_3C7A716E 
X-CRM114-Status: GOOD (  36.15  )
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

T24gVGh1LCBNYXIgMjMsIDIwMjMgYXQgNjoyNOKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gT24gVGh1LCBNYXIgMjMs
IDIwMjMgYXQgMToxOOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3
cm90ZToKPiA+Cj4gPiBIaSBBbGV4LAo+ID4KPiA+IE9uIFRodSwgTWFyIDE2LCAyMDIzIGF0IDY6
NDjigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+
ID4gPgo+ID4gPiBUaGlzIHBhdGNoc2V0IGludGVuZHMgdG8gaW1wcm92ZSB0bGIgdXRpbGl6YXRp
b24gYnkgdXNpbmcgaHVnZXBhZ2VzIGZvcgo+ID4gPiB0aGUgbGluZWFyIG1hcHBpbmcuCj4gPiA+
Cj4gPiA+IEFzIHJlcG9ydGVkIGJ5IEFudXAgaW4gdjYsIHdoZW4gU1RSSUNUX0tFUk5FTF9SV1gg
aXMgZW5hYmxlZCwgd2UgbXVzdAo+ID4gPiB0YWtlIGNhcmUgb2YgaXNvbGF0aW5nIHRoZSBrZXJu
ZWwgdGV4dCBhbmQgcm9kYXRhIHNvIHRoYXQgdGhleSBhcmUgbm90Cj4gPiA+IG1hcHBlZCB3aXRo
IGEgUFVEIG1hcHBpbmcgd2hpY2ggd291bGQgdGhlbiBhc3NpZ24gd3JvbmcgcGVybWlzc2lvbnMg
dG8KPiA+ID4gdGhlIHdob2xlIHJlZ2lvbjogaXQgaXMgYWNoaWV2ZWQgYnkgaW50cm9kdWNpbmcg
YSBuZXcgbWVtYmxvY2sgQVBJLgo+ID4gPgo+ID4gPiBBbm90aGVyIHBhdGNoIG1ha2VzIHVzZSBv
ZiB0aGlzIG5ldyBBUEkgaW4gYXJtNjQgd2hpY2ggdXNlZCBzb21lIHNvcnQgb2YKPiA+ID4gaGFj
ayB0byBzb2x2ZSB0aGlzIGlzc3VlOiBpdCB3YXMgYnVpbHQvYm9vdCB0ZXN0ZWQgc3VjY2Vzc2Z1
bGx5Lgo+ID4gPgo+ID4gPiBiYXNlLWNvbW1pdC10YWc6IHY2LjMtcmMxCj4gPiA+Cj4gPiA+IHY4
Ogo+ID4gPiAtIEZpeCBydjMyLCBhcyByZXBvcnRlZCBieSBBbnVwCj4gPiA+IC0gRG8gbm90IG1v
ZGlmeSBtZW1ibG9ja19pc29sYXRlX3JhbmdlIGFuZCBmaXhlcyBjb21tZW50LCBhcyBzdWdnZXN0
ZWQgYnkgTWlrZQo+ID4gPiAtIFVzZSB0aGUgbmV3IG1lbWJsb2NrIEFQSSBmb3IgY3Jhc2gga2Vy
bmVsIHRvbyBpbiBhcm02NCwgYXMgc3VnZ2VzdGVkIGJ5IEFuZHJldwo+ID4gPiAtIEZpeCBhcm02
NCBkb3VibGUgbWFwcGluZyAod2hpY2ggdG8gbWUgZGlkIG5vdCB3b3JrIGluIHY3KSwgYnV0IGVu
ZHMgdXAgbm90Cj4gPiA+ICAgYmVpbmcgcHJldHR5IGF0IGFsbCwgd2lsbCB3YWl0IGZvciBjb21t
ZW50cyBmcm9tIGFybTY0IHJldmlld2VycywgYnV0Cj4gPiA+ICAgdGhpcyBwYXRjaCBjYW4gZWFz
aWx5IGJlIGRyb3BwZWQgaWYgdGhleSBkbyBub3Qgd2FudCBpdC4KPiA+ID4KPiA+ID4gdjc6Cj4g
PiA+IC0gRml4IEFudXAgYnVnIHJlcG9ydCBieSBpbnRyb2R1Y2luZyBtZW1ibG9ja19pc29sYXRl
X21lbW9yeSB3aGljaAo+ID4gPiAgIGFsbG93cyB1cyB0byBzcGxpdCB0aGUgbWVtYmxvY2sgbWFw
cGluZ3MgYW5kIHRoZW4gYXZvaWQgdG8gbWFwIHRoZQo+ID4gPiAgIHRoZSBQVUQgd2hpY2ggY29u
dGFpbnMgdGhlIGtlcm5lbCBhcyByZWFkIG9ubHkKPiA+ID4gLSBBZGQgYSBwYXRjaCB0byBhcm02
NCB0byB1c2UgdGhpcyBuZXdseSBpbnRyb2R1Y2VkIEFQSQo+ID4gPgo+ID4gPiB2NjoKPiA+ID4g
LSBxdWlldCBMTFZNIHdhcm5pbmcgYnkgY2FzdGluZyBwaHlzX3JhbV9iYXNlIGludG8gYW4gdW5z
aWduZWQgbG9uZwo+ID4gPgo+ID4gPiB2NToKPiA+ID4gLSBGaXggbm9tbXUgYnVpbGRzIGJ5IGdl
dHRpbmcgcmlkIG9mIHJpc2N2X3Bmbl9iYXNlIGluIHBhdGNoIDEsIHRoYW5rcwo+ID4gPiAgIENv
bm9yCj4gPiA+IC0gQWRkIFJCIGZyb20gQW5kcmV3Cj4gPiA+Cj4gPiA+IHY0Ogo+ID4gPiAtIFJl
YmFzZSBvbiB0b3Agb2YgdjYuMi1yYzMsIGFzIG5vdGVkIGJ5IENvbm9yCj4gPiA+IC0gQWRkIEFj
a2VkLWJ5IFJvYgo+ID4gPgo+ID4gPiB2MzoKPiA+ID4gLSBDaGFuZ2UgdGhlIGNvbW1lbnQgYWJv
dXQgaW5pdHJkX3N0YXJ0IFZBIGNvbnZlcnNpb24gc28gdGhhdCBpdCBmaXRzCj4gPiA+ICAgQVJN
NjQgYW5kIFJJU0NWNjQgKGFuZCBvdGhlcnMgaW4gdGhlIGZ1dHVyZSBpZiBuZWVkZWQpLCBhcyBz
dWdnZXN0ZWQKPiA+ID4gICBieSBSb2IKPiA+ID4KPiA+ID4gdjI6Cj4gPiA+IC0gQWRkIGEgY29t
bWVudCBvbiB3aHkgUklTQ1Y2NCBkb2VzIG5vdCBuZWVkIHRvIHNldCBpbml0cmRfc3RhcnQvZW5k
IHRoYXQKPiA+ID4gICBlYXJseSBpbiB0aGUgYm9vdCBwcm9jZXNzLCBhcyBhc2tlZCBieSBSb2IK
PiA+ID4KPiA+ID4gQWxleGFuZHJlIEdoaXRpICg0KToKPiA+ID4gICByaXNjdjogR2V0IHJpZCBv
ZiByaXNjdl9wZm5fYmFzZSB2YXJpYWJsZQo+ID4gPiAgIG1tOiBJbnRyb2R1Y2UgbWVtYmxvY2tf
aXNvbGF0ZV9tZW1vcnkKPiA+ID4gICBhcm02NDogTWFrZSB1c2Ugb2YgbWVtYmxvY2tfaXNvbGF0
ZV9tZW1vcnkgZm9yIHRoZSBsaW5lYXIgbWFwcGluZwo+ID4gPiAgIHJpc2N2OiBVc2UgUFVEL1A0
RC9QR0QgcGFnZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZwo+ID4KPiA+IEtlcm5lbCBib290IGZp
bmUgb24gUlY2NCBidXQgdGhlcmUgaXMgYSBmYWlsdXJlIHdoaWNoIGlzIHN0aWxsIG5vdAo+ID4g
YWRkcmVzc2VkLiBZb3UgY2FuIHNlZSB0aGlzIGZhaWx1cmUgYXMgZm9sbG93aW5nIG1lc3NhZ2Ug
aW4KPiA+IGtlcm5lbCBib290IGxvZzoKPiA+ICAgICAwLjAwMDAwMF0gRmFpbGVkIHRvIGFkZCBh
IFN5c3RlbSBSQU0gcmVzb3VyY2UgYXQgODAyMDAwMDAKPgo+IEhtbW0gSSBkb24ndCBnZXQgdGhh
dCBpbiBhbnkgb2YgbXkgdGVzdCBjb25maWdzLCB3b3VsZCB5b3UgbWluZAo+IHNoYXJpbmcgeW91
cnMgYW5kIHlvdXIgcWVtdSBjb21tYW5kIGxpbmU/CgpUcnkgYWxleGdoaXRpX3Rlc3QgYnJhbmNo
IGF0Cmh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL2xpbnV4LmdpdAoKSSBhbSBidWlsZGluZyB0
aGUga2VybmVsIHVzaW5nIGRlZmNvbmZpZyBhbmQgbXkgcm9vdGZzIGlzCmJhc2VkIG9uIGJ1c3li
b3guCgpNeSBRRU1VIGNvbW1hbmQgaXM6CnFlbXUtc3lzdGVtLXJpc2N2NjQgLU0gdmlydCAtbSA1
MTJNIC1ub2dyYXBoaWMgLWJpb3MKb3BlbnNiaS9idWlsZC9wbGF0Zm9ybS9nZW5lcmljL2Zpcm13
YXJlL2Z3X2R5bmFtaWMuYmluIC1rZXJuZWwKLi9idWlsZC1yaXNjdjY0L2FyY2gvcmlzY3YvYm9v
dC9JbWFnZSAtYXBwZW5kICJyb290PS9kZXYvcmFtIHJ3CmNvbnNvbGU9dHR5UzAgZWFybHljb24i
IC1pbml0cmQgLi9yb290ZnNfcmlzY3Y2NC5pbWcgLXNtcCA0CgpSZWdhcmRzLApBbnVwCgo+Cj4g
VGhhbmtzCj4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gQW51cAo+ID4KPiA+ID4KPiA+ID4gIGFyY2gv
YXJtNjQvbW0vbW11LmMgICAgICAgICAgIHwgMjUgKysrKysrKysrKystLS0tLS0KPiA+ID4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oIHwgMTkgKysrKysrKysrKystLQo+ID4gPiAgYXJj
aC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgfCA1MyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLQo+ID4gPiAgYXJjaC9yaXNjdi9tbS9waHlzYWRkci5jICAgICAgfCAxNiArKysr
KysrKysrKwo+ID4gPiAgZHJpdmVycy9vZi9mZHQuYyAgICAgICAgICAgICAgfCAxMSArKysrLS0t
LQo+ID4gPiAgaW5jbHVkZS9saW51eC9tZW1ibG9jay5oICAgICAgfCAgMSArCj4gPiA+ICBtbS9t
ZW1ibG9jay5jICAgICAgICAgICAgICAgICB8IDIwICsrKysrKysrKysrKysKPiA+ID4gIDcgZmls
ZXMgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4g
PiAtLQo+ID4gPiAyLjM3LjIKPiA+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
