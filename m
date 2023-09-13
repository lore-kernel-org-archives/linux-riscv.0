Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81633CA5505
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 08:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQj11ehgMM1rdybbtyU2qGH+QE6TCAN1pw27JxWAy/k=; b=4PigleQQdY7WYQ
	/1yE6QITqLb3NFpdN/4grxzLo6TUl4YHfNKJhKzsTHcNB3kWjOox24MlbYvpRbfBQgmh2BGntaZbH
	ESbZqE6fO3nNvfJ+FUgSqXu/Zz/oB2qrxOpEFWo2iEmJdBneNtxflQOksrbtTBO6TbRvLqlqfVrxH
	/mE7C0VsENdQlplG++twYeCpo4J/tuGFOisS5rRCNsQKbu7OJTKZgg5W21pwETZ4iqui87iLovj+7
	GPiTFnS8cLDld8drMGU2KvnmfnkpzN40N09QvxjjN1CuNaJOewpDEgmrB9ESsREX528xlXQAJyXrk
	n9gJLVP9gz4DT547CANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLAf-0055No-1c;
	Wed, 13 Sep 2023 08:24:25 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLAc-0055LT-0S
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 08:24:23 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-7a803afa8c5so1276743241.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 01:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694593459; x=1695198259; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvSkwLLGuwL6+FzTiaUPYz7u0MiA133oxHxQzz8keyY=;
        b=HcYZuc374scdmFIqnA/3olBnryXlqkGfgC7+ikaqk0PUDF4FOsGFM2zQfs1ng7fbxb
         sryuplILyyCGvLw0Dxiv5VHfTZPtdxPU/otzLds4cLWKCVMMt2gp5F5joo4G5HhnHv0D
         VjxWvLcQmdlxupqN4mSKqcP6B+AdXHSB4exaFIlaL4vEYLicBQ0NSviWzQsseds2Mf14
         M2tq1x88PdOPKxGE7tqnFGYPWaMITsK97HS7guAEKVaC0ac6uzlNie9boxoHB9Muep0+
         Hdb/FsN8HCRVKRSd5JYAqlBot5UEENSMKUjF4dO24QrfJJWDEgPwF2EYklMd5+/v+s+y
         Uvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593459; x=1695198259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvSkwLLGuwL6+FzTiaUPYz7u0MiA133oxHxQzz8keyY=;
        b=cO/sANXNhnzPW05gJ3fN30109PBJyAeyLH7t+2rrbXU5eRLuNCQtCJelG7+sY9+kj5
         S4q8tVrM8iOyfaHKr0AULJ039tvL7waVuOwdGjTjk/UYIfOyTnpwpqI+BVEVclRc8L/c
         nIDTOd8wYGIGr1lGEqOxbdyuPCbxadEs3fTw7CoSlt82iGfS7oJZPlVpv2zBMfELG/EP
         zXta9f4s4/5Z2lTh8BUdabyYHSIXLdwuRLXn5xA18tFaibAUEg2+uHgldYBnl0OJhukq
         19ZtS+gokrsea11yei2u3Sk3wrRswZR9137FQ7EXwT+x8l6W1CDQSdImMDrdsi6+8+L6
         rLIA==
X-Gm-Message-State: AOJu0Yw96/6zJtiTBk/eL+MEd+fmqcc4OsqS7mIscIoS5AYp2J3kjUnd
	i28aYYaiRbmly9AZShHtnOd/MQdNw3k2yCTyjjU=
X-Google-Smtp-Source: AGHT+IFO0NSs41b73GFK5JRqE11oXhcmyBkl1ReBcxdhr7hcXRn9Fd+MyqqH9Ssyk1jO/UvqE7kpKxzJ24mPzPRKrQc=
X-Received: by 2002:a1f:6d03:0:b0:48d:2a1:5d26 with SMTP id
 i3-20020a1f6d03000000b0048d02a15d26mr2126287vkc.4.1694593459187; Wed, 13 Sep
 2023 01:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230911131224.61924-1-alexghiti@rivosinc.com>
 <20230911131224.61924-5-alexghiti@rivosinc.com> <CAHVXubiVH=q9pnTLQyjS3X3W-hvuA=ZMM2D2xYPFkGjFnAgbWg@mail.gmail.com>
In-Reply-To: <CAHVXubiVH=q9pnTLQyjS3X3W-hvuA=ZMM2D2xYPFkGjFnAgbWg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 13 Sep 2023 09:23:08 +0100
Message-ID: <CA+V-a8tYzee-cX8rMiQ66ENWb+rLLFHmkOdovft0L-8ASQ3eog@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] riscv: Improve flush_tlb_kernel_range()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_012422_179575_627E32BE 
X-CRM114-Status: GOOD (  31.71  )
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

SGkgQWxleGFuZHJlLAoKT24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgOTowNOKAr0FNIEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBATGFkLCBQcmFiaGFr
YXIgQW55IGNoYW5jZSB5b3UgZ2l2ZSBhIHRyeSB0byB0aGlzIG5ldyBwYXRjaHNldD8gU28KPiB0
aGF0IHdlIG1ha2Ugc3VyZSBTYW11ZWwgZm91bmQgeW91ciBpc3N1ZSA6KQo+CkkgaGF2ZSBnaXZl
biB0aGUgcGF0Y2hlcyBhIHRyeSBhbmQgbm90IHNlZW4gdGhlIG1vZHVsZSBsb2FkIGZhaWx1cmVz
CmFzIHNlZW4gcHJldmlvdXNseS4gSSBoYXZlIHNvbWUgcmlnb3JvdXMgdGVzdHMgd2hpY2ggdGVz
dCB0aGUgY29tcGxldGUKcGxhdGZvcm0uIEknbSBqdXN0IHdhaXRpbmcgZm9yIGl0IHRvIGNvbXBs
ZXRlIGJlZm9yZSBJIGdpdmUgVGVzdGVkIGJ5LgoKQ2hlZXJzLApQcmFiaGFrYXIKCj4gT24gTW9u
LCBTZXAgMTEsIDIwMjMgYXQgMzoxNuKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBmdW5jdGlvbiB1c2VkIHRvIHNpbXBseSBm
bHVzaCB0aGUgd2hvbGUgdGxiIG9mIGFsbCBoYXJ0cywgYmUgbW9yZQo+ID4gc3VidGlsZSBhbmQg
dHJ5IHRvIG9ubHkgZmx1c2ggdGhlIHJhbmdlLgo+ID4KPiA+IFRoZSBwcm9ibGVtIGlzIHRoYXQg
d2UgY2FuIG9ubHkgdXNlIFBBR0VfU0laRSBhcyBzdHJpZGUgc2luY2Ugd2UgZG9uJ3Qga25vdwo+
ID4gdGhlIHNpemUgb2YgdGhlIHVuZGVybHlpbmcgbWFwcGluZyBhbmQgdGhlbiB0aGlzIGZ1bmN0
aW9uIHdpbGwgYmUgaW1wcm92ZWQKPiA+IG9ubHkgaWYgdGhlIHNpemUgb2YgdGhlIHJlZ2lvbiB0
byBmbHVzaCBpcyA8IHRocmVzaG9sZCAqIFBBR0VfU0laRS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiBSZXZpZXdlZC1i
eTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDExICsrKysrKy0tLS0tCj4gPiAgYXJj
aC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMTQgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxi
Zmx1c2guaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+ID4gaW5kZXggMTcw
YTQ5YzUzMWM2Li44ZjM0MThjNWYxNzIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3RsYmZsdXNoLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1
c2guaAo+ID4gQEAgLTQwLDYgKzQwLDcgQEAgdm9pZCBmbHVzaF90bGJfbW1fcmFuZ2Uoc3RydWN0
IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiAgdm9pZCBmbHVzaF90bGJf
cGFnZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyKTsKPiA+
ICB2b2lkIGZsdXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWdu
ZWQgbG9uZyBzdGFydCwKPiA+ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5k
KTsKPiA+ICt2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwg
dW5zaWduZWQgbG9uZyBlbmQpOwo+ID4gICNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBB
R0UKPiA+ICAjZGVmaW5lIF9fSEFWRV9BUkNIX0ZMVVNIX1BNRF9UTEJfUkFOR0UKPiA+ICB2b2lk
IGZsdXNoX3BtZF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVk
IGxvbmcgc3RhcnQsCj4gPiBAQCAtNTYsMTUgKzU3LDE1IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBm
bHVzaF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gPiAgICAgICAgIGxv
Y2FsX2ZsdXNoX3RsYl9hbGwoKTsKPiA+ICB9Cj4gPgo+ID4gLSNkZWZpbmUgZmx1c2hfdGxiX21t
KG1tKSBmbHVzaF90bGJfYWxsKCkKPiA+IC0jZGVmaW5lIGZsdXNoX3RsYl9tbV9yYW5nZShtbSwg
c3RhcnQsIGVuZCwgcGFnZV9zaXplKSBmbHVzaF90bGJfYWxsKCkKPiA+IC0jZW5kaWYgLyogIUNP
TkZJR19TTVAgfHwgIUNPTkZJR19NTVUgKi8KPiA+IC0KPiA+ICAvKiBGbHVzaCBhIHJhbmdlIG9m
IGtlcm5lbCBwYWdlcyAqLwo+ID4gIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF90bGJfa2VybmVs
X3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5k
KQo+ID4gIHsKPiA+IC0gICAgICAgZmx1c2hfdGxiX2FsbCgpOwo+ID4gKyAgICAgICBsb2NhbF9m
bHVzaF90bGJfYWxsKCk7Cj4gPiAgfQo+ID4KPiA+ICsjZGVmaW5lIGZsdXNoX3RsYl9tbShtbSkg
Zmx1c2hfdGxiX2FsbCgpCj4gPiArI2RlZmluZSBmbHVzaF90bGJfbW1fcmFuZ2UobW0sIHN0YXJ0
LCBlbmQsIHBhZ2Vfc2l6ZSkgZmx1c2hfdGxiX2FsbCgpCj4gPiArI2VuZGlmIC8qICFDT05GSUdf
U01QIHx8ICFDT05GSUdfTU1VICovCj4gPiArCj4gPiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfVExC
RkxVU0hfSCAqLwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2Fy
Y2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4gaW5kZXggMmMxMTM2ZDczNDExLi4yOGNkODUzOWI1
NzUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiA+ICsrKyBiL2Fy
Y2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4gQEAgLTk3LDE5ICs5NywyNyBAQCBzdGF0aWMgdm9p
ZCBfX2ZsdXNoX3RsYl9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBz
dGFydCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2l6
ZSwgdW5zaWduZWQgbG9uZyBzdHJpZGUpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3QgZmx1c2hf
dGxiX3JhbmdlX2RhdGEgZnRkOwo+ID4gLSAgICAgICBzdHJ1Y3QgY3B1bWFzayAqY21hc2sgPSBt
bV9jcHVtYXNrKG1tKTsKPiA+ICsgICAgICAgc3RydWN0IGNwdW1hc2sgKmNtYXNrLCBmdWxsX2Nt
YXNrOwo+ID4gICAgICAgICB1bnNpZ25lZCBsb25nIGFzaWQgPSBGTFVTSF9UTEJfTk9fQVNJRDsK
PiA+IC0gICAgICAgdW5zaWduZWQgaW50IGNwdWlkOwo+ID4gICAgICAgICBib29sIGJyb2FkY2Fz
dDsKPiA+Cj4gPiAtICAgICAgIGlmIChjcHVtYXNrX2VtcHR5KGNtYXNrKSkKPiA+IC0gICAgICAg
ICAgICAgICByZXR1cm47Cj4gPiArICAgICAgIGlmIChtbSkgewo+ID4gKyAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBjcHVpZDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICBjbWFzayA9IG1t
X2NwdW1hc2sobW0pOwo+ID4gKyAgICAgICAgICAgICAgIGlmIChjcHVtYXNrX2VtcHR5KGNtYXNr
KSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiA+Cj4gPiAtICAgICAgIGNw
dWlkID0gZ2V0X2NwdSgpOwo+ID4gLSAgICAgICAvKiBjaGVjayBpZiB0aGUgdGxiZmx1c2ggbmVl
ZHMgdG8gYmUgc2VudCB0byBvdGhlciBDUFVzICovCj4gPiAtICAgICAgIGJyb2FkY2FzdCA9IGNw
dW1hc2tfYW55X2J1dChjbWFzaywgY3B1aWQpIDwgbnJfY3B1X2lkczsKPiA+ICsgICAgICAgICAg
ICAgICBjcHVpZCA9IGdldF9jcHUoKTsKPiA+ICsgICAgICAgICAgICAgICAvKiBjaGVjayBpZiB0
aGUgdGxiZmx1c2ggbmVlZHMgdG8gYmUgc2VudCB0byBvdGhlciBDUFVzICovCj4gPiArICAgICAg
ICAgICAgICAgYnJvYWRjYXN0ID0gY3B1bWFza19hbnlfYnV0KGNtYXNrLCBjcHVpZCkgPCBucl9j
cHVfaWRzOwo+ID4gKyAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICAgIGNwdW1hc2tf
c2V0YWxsKCZmdWxsX2NtYXNrKTsKPiA+ICsgICAgICAgICAgICAgICBjbWFzayA9ICZmdWxsX2Nt
YXNrOwo+ID4gKyAgICAgICAgICAgICAgIGJyb2FkY2FzdCA9IHRydWU7Cj4gPiArICAgICAgIH0K
PiA+Cj4gPiAtICAgICAgIGlmIChzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZ1c2VfYXNpZF9hbGxv
Y2F0b3IpKQo+ID4gKyAgICAgICBpZiAoc3RhdGljX2JyYW5jaF91bmxpa2VseSgmdXNlX2FzaWRf
YWxsb2NhdG9yKSAmJiBtbSkKPiA+ICAgICAgICAgICAgICAgICBhc2lkID0gYXRvbWljX2xvbmdf
cmVhZCgmbW0tPmNvbnRleHQuaWQpICYgYXNpZF9tYXNrOwo+ID4KPiA+ICAgICAgICAgaWYgKGJy
b2FkY2FzdCkgewo+ID4gQEAgLTEyOCw3ICsxMzYsOCBAQCBzdGF0aWMgdm9pZCBfX2ZsdXNoX3Rs
Yl9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPiA+ICAg
ICAgICAgICAgICAgICBsb2NhbF9mbHVzaF90bGJfcmFuZ2VfYXNpZChzdGFydCwgc2l6ZSwgc3Ry
aWRlLCBhc2lkKTsKPiA+ICAgICAgICAgfQo+ID4KPiA+IC0gICAgICAgcHV0X2NwdSgpOwo+ID4g
KyAgICAgICBpZiAobW0pCj4gPiArICAgICAgICAgICAgICAgcHV0X2NwdSgpOwo+ID4gIH0KPiA+
Cj4gPiAgdm9pZCBmbHVzaF90bGJfbW0oc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gPiBAQCAtMTg5
LDYgKzE5OCwxMiBAQCB2b2lkIGZsdXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPiA+Cj4gPiAgICAgICAgIF9fZmx1c2hfdGxiX3Jh
bmdlKHZtYS0+dm1fbW0sIHN0YXJ0LCBlbmQgLSBzdGFydCwgc3RyaWRlX3NpemUpOwo+ID4gIH0K
PiA+ICsKPiA+ICt2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFy
dCwgdW5zaWduZWQgbG9uZyBlbmQpCj4gPiArewo+ID4gKyAgICAgICBfX2ZsdXNoX3RsYl9yYW5n
ZShOVUxMLCBzdGFydCwgZW5kIC0gc3RhcnQsIFBBR0VfU0laRSk7Cj4gPiArfQo+ID4gKwo+ID4g
ICNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKPiA+ICB2b2lkIGZsdXNoX3BtZF90
bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgc3RhcnQs
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGVuZCkKPiA+IC0tCj4g
PiAyLjM5LjIKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
