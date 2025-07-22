Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5901C87FC5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 15:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ealrueiwrZx6TvMl03Z4beTELxLBbQnNrBagJUpg6fo=; b=zxTdPZXJGHwkGZ
	tHpTh3m1PBamUJVwryfsWETH9oaddp+G5V4ZoEKT5idJCLRuhRLikqydajf2ISBAra6nNiDrH0ZG2
	S+nRIckkl2ktT82fcdLpVQtP5sDyPCdz5xvQhkXesljQ3LcQttso165lw4IIIJIRq3aASMrvmJ5tl
	DpFldz+bHwC7O91UhdzCN7aBK++criJ55eguo6h/4QAcFrM8fnB59/EExrZH/aMClnQM1GrnR8OMz
	ZXi8EHfNLcwb6ouGSjbDAyQWeEqHZX5bhao+lTxjBLADy8BCrHHx22IrqWOSzlXUcMdZUOqOQOucy
	PmU3LCC/PZm+VdsW0RPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEyX-00000002shM-3ffr;
	Tue, 22 Jul 2025 15:32:17 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDo3-00000002fns-26FZ;
	Tue, 22 Jul 2025 14:17:24 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-32b5226e6beso54161441fa.2;
        Tue, 22 Jul 2025 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753193842; x=1753798642; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GboL0eWXtD3fDsEKzgJ1xepA1JQohVF9co6pstDgRM8=;
        b=PlCNMmEGafdS9aD70KNuYuzC0dmfOvDHNG4bm5ZnMqXMbGRYnnIEAlAeQxAAFu8G+T
         iUAz1kO7MWgrvPG2TsXJHXWugTS21IHLzaspBfsyIJ3q1XqYWpbNRDdpQFhHFlN3ZHib
         /9bt+uOuuNXy/LLkUFa7KwG5jpMkTcA6zKid/Yj0DHZo0AmMz4j823KTXenWuQxDIo+C
         p7aryu0mn/RnL6UIP3tihC7Qh5qyR3vQVbvzkRoOZFDrDacXOMe5b3pX+lPPyErWM1Sy
         HNMvtBO6aP6s5HymGjcIe3oQ4Dsvyw43QTpTT5O1QAcydh12uSDrODdGMM0LfUatMMIX
         909Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753193842; x=1753798642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GboL0eWXtD3fDsEKzgJ1xepA1JQohVF9co6pstDgRM8=;
        b=dUq87XjCH589lNINYHtuixVBW2dmo0dF8Ng7V2GWskOfSeduPKk3DhPoBjK6MMNChj
         x7gXaCoWvDoT7cw5E67kzC8JN5eK5g9+KF6zOLZCT5S+ajNML5WQYOYRrUhOtYw7kHvo
         fhrnKgdIdeZHFYe+wpJs1mYLF6rDMdv4Px9SmY7EMhYMFEg7GoP1OYfXAKuL1MTSKXFL
         TQfhVu7qVzlDuQ1lvBGBgxZTEPteOdKcE+etdpCaRyw2Kc8e3bDRftyfiSOfgfZUPdWz
         rpotgM+joZKZesuZBwq/JbbuuD/o73T5Nwpr0o9MozLcV/VgqId3ZBsape7TcruSMp47
         1wGg==
X-Forwarded-Encrypted: i=1; AJvYcCUfTbGiV6x7sdkaNHXVaDdKOusx98EDz02pLuCSDP6qyLoMz/tEGhg0M0gv7B6/EhE2UddiY+P/h+kxnw==@lists.infradead.org, AJvYcCV1lnTygRWVOTrJZCiNqOSmmcK6YWNEKlGSMRavg9OtpB9eWO7aQn53lu06BA7TzoY/5nz/IXfhaBk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yydp1OnLr6F0jMJE6jYEVlwaS+U45RSUaenLMDRSfW1aJcLtRkg
	tw1+tnEJyhqfagvgnXFJL+Q0kBw+dEJlzXLaG23iSQR/owOMfBtzxEPSbNKcl09UMh3GYHFITif
	A4ebm0KUH8GbhMvW12pxy9AuKPAGykBs=
X-Gm-Gg: ASbGncuiO2w9for5CUaormQpA4Kl1PRd4V+IWPomAJgLLjDLD0GoRMS52YBoIljAcQ5
	qQGWKlmByjfaGV5o99dO8NlzUS8KQBIOVaRKoCmQnC/RYRMgJ2mA0Qkv3PlUvyaXCtNTw9w9K+Z
	ACyHFXw+TXBHBR+ZnJKWEgQtE5AarBfUaiWsgYyQb/KtRu/0y4rjmtMWPKZeZnr1fzwtPiNL5al
	SCV8Og=
X-Google-Smtp-Source: AGHT+IHWyFSdlAJ08NCU6ABmF9BGYFP4zXRYUy0aJCm6G+P21nbWRd00HVhqfmwkvmBdoun3tyqTRuImHuMXXJuHVwM=
X-Received: by 2002:a05:651c:110d:b0:32b:75f0:cfa4 with SMTP id
 38308e7fff4ca-3308f5c95f9mr70998461fa.25.1753193841372; Tue, 22 Jul 2025
 07:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250717142732.292822-1-snovitoll@gmail.com> <20250717142732.292822-9-snovitoll@gmail.com>
 <85de2e1f-a787-4862-87e4-2681e749cef0@gmail.com>
In-Reply-To: <85de2e1f-a787-4862-87e4-2681e749cef0@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Tue, 22 Jul 2025 19:17:03 +0500
X-Gm-Features: Ac12FXzF_nEInn7KovIF1rCbPeOEkryRpoS2Hx7q1NkLYIXq7eXxsmx3CUCidIg
Message-ID: <CACzwLxiD98BLmEmPhkJQgv297bP_7qw+Vm_icFhTiDYN7WvLjw@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] kasan/um: select ARCH_DEFER_KASAN and call kasan_init_generic
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com, 
	agordeev@linux.ibm.com, akpm@linux-foundation.org, glider@google.com, 
	dvyukov@google.com, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_071723_541525_9991649A 
X-CRM114-Status: GOOD (  23.34  )
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

T24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgNDowMOKAr0FNIEFuZHJleSBSeWFiaW5pbiA8cnlhYmlu
aW4uYS5hQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gNy8xNy8yNSA0OjI3IFBNLCBTYWJ5
cnpoYW4gVGFzYm9sYXRvdiB3cm90ZToKPiA+IFVzZXJNb2RlIExpbnV4IG5lZWRzIGRlZmVycmVk
IEtBU0FOIGluaXRpYWxpemF0aW9uIGFzIGl0IGhhcyBhIGN1c3RvbQo+ID4ga2FzYW5fYXJjaF9p
c19yZWFkeSgpIGltcGxlbWVudGF0aW9uIHRoYXQgdHJhY2tzIHNoYWRvdyBtZW1vcnkgcmVhZGlu
ZXNzCj4gPiB2aWEgdGhlIGthc2FuX3VtX2lzX3JlYWR5IGZsYWcuCj4gPgo+ID4gU2VsZWN0IEFS
Q0hfREVGRVJfS0FTQU4gdG8gZW5hYmxlIHRoZSB1bmlmaWVkIHN0YXRpYyBrZXkgbWVjaGFuaXNt
Cj4gPiBmb3IgcnVudGltZSBLQVNBTiBjb250cm9sLiBDYWxsIGthc2FuX2luaXRfZ2VuZXJpYygp
IHdoaWNoIGhhbmRsZXMKPiA+IEdlbmVyaWMgS0FTQU4gaW5pdGlhbGl6YXRpb24gYW5kIGVuYWJs
ZXMgdGhlIHN0YXRpYyBrZXkuCj4gPgo+ID4gRGVsZXRlIHRoZSBrZXkga2FzYW5fdW1faXNfcmVh
ZHkgaW4gZmF2b3Igb2YgdGhlIHVuaWZpZWQga2FzYW5fZW5hYmxlZCgpCj4gPiBpbnRlcmZhY2Uu
Cj4gPgo+ID4gTm90ZSB0aGF0IGthc2FuX2luaXRfZ2VuZXJpYyBoYXMgX19pbml0IG1hY3JvLCB3
aGljaCBpcyBjYWxsZWQgYnkKPiA+IGthc2FuX2luaXQoKSB3aGljaCBpcyBub3QgbWFya2VkIHdp
dGggX19pbml0IGluIGFyY2gvdW0gY29kZS4KPiA+Cj4gPiBDbG9zZXM6IGh0dHBzOi8vYnVnemls
bGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE3MDQ5Cj4gPiBTaWduZWQtb2ZmLWJ5OiBT
YWJ5cnpoYW4gVGFzYm9sYXRvdiA8c25vdml0b2xsQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gQ2hh
bmdlcyBpbiB2MzoKPiA+IC0gQWRkZWQgQ09ORklHX0FSQ0hfREVGRVJfS0FTQU4gc2VsZWN0aW9u
IGZvciBwcm9wZXIgcnVudGltZSBjb250cm9sCj4gPiAtLS0KPiA+ICBhcmNoL3VtL0tjb25maWcg
ICAgICAgICAgICAgfCAxICsKPiA+ICBhcmNoL3VtL2luY2x1ZGUvYXNtL2thc2FuLmggfCA1IC0t
LS0tCj4gPiAgYXJjaC91bS9rZXJuZWwvbWVtLmMgICAgICAgIHwgNCArKy0tCj4gPiAgMyBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvdW0vS2NvbmZpZyBiL2FyY2gvdW0vS2NvbmZpZwo+ID4gaW5kZXggZjA4ZThh
N2ZhYzkuLmZkNmQ3OGJiYTUyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC91bS9LY29uZmlnCj4gPiAr
KysgYi9hcmNoL3VtL0tjb25maWcKPiA+IEBAIC04LDYgKzgsNyBAQCBjb25maWcgVU1MCj4gPiAg
ICAgICBzZWxlY3QgQVJDSF9XQU5UU19EWU5BTUlDX1RBU0tfU1RSVUNUCj4gPiAgICAgICBzZWxl
Y3QgQVJDSF9IQVNfQ1BVX0ZJTkFMSVpFX0lOSVQKPiA+ICAgICAgIHNlbGVjdCBBUkNIX0hBU19G
T1JUSUZZX1NPVVJDRQo+ID4gKyAgICAgc2VsZWN0IEFSQ0hfREVGRVJfS0FTQU4KPiA+ICAgICAg
IHNlbGVjdCBBUkNIX0hBU19HQ09WX1BST0ZJTEVfQUxMCj4gPiAgICAgICBzZWxlY3QgQVJDSF9I
QVNfS0NPVgo+ID4gICAgICAgc2VsZWN0IEFSQ0hfSEFTX1NUUk5DUFlfRlJPTV9VU0VSCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC91bS9pbmNsdWRlL2FzbS9rYXNhbi5oIGIvYXJjaC91bS9pbmNsdWRl
L2FzbS9rYXNhbi5oCj4gPiBpbmRleCBmOTdiYjFmN2I4NS4uODFiY2RjMGY5NjIgMTAwNjQ0Cj4g
PiAtLS0gYS9hcmNoL3VtL2luY2x1ZGUvYXNtL2thc2FuLmgKPiA+ICsrKyBiL2FyY2gvdW0vaW5j
bHVkZS9hc20va2FzYW4uaAo+ID4gQEAgLTI0LDExICsyNCw2IEBACj4gPgo+ID4gICNpZmRlZiBD
T05GSUdfS0FTQU4KPiA+ICB2b2lkIGthc2FuX2luaXQodm9pZCk7Cj4gPiAtZXh0ZXJuIGludCBr
YXNhbl91bV9pc19yZWFkeTsKPiA+IC0KPiA+IC0jaWZkZWYgQ09ORklHX1NUQVRJQ19MSU5LCj4g
PiAtI2RlZmluZSBrYXNhbl9hcmNoX2lzX3JlYWR5KCkgKGthc2FuX3VtX2lzX3JlYWR5KQo+ID4g
LSNlbmRpZgo+ID4gICNlbHNlCj4gPiAgc3RhdGljIGlubGluZSB2b2lkIGthc2FuX2luaXQodm9p
ZCkgeyB9Cj4gPiAgI2VuZGlmIC8qIENPTkZJR19LQVNBTiAqLwo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvdW0va2VybmVsL21lbS5jIGIvYXJjaC91bS9rZXJuZWwvbWVtLmMKPiA+IGluZGV4IDc2YmVj
N2RlODFiLi4wNThjYjcwZTMzMCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvdW0va2VybmVsL21lbS5j
Cj4gPiArKysgYi9hcmNoL3VtL2tlcm5lbC9tZW0uYwo+ID4gQEAgLTIxLDkgKzIxLDkgQEAKPiA+
ICAjaW5jbHVkZSA8b3MuaD4KPiA+ICAjaW5jbHVkZSA8dW1fbWFsbG9jLmg+Cj4gPiAgI2luY2x1
ZGUgPGxpbnV4L3NjaGVkL3Rhc2suaD4KPiA+ICsjaW5jbHVkZSA8bGludXgva2FzYW4uaD4KPiA+
Cj4gPiAgI2lmZGVmIENPTkZJR19LQVNBTgo+ID4gLWludCBrYXNhbl91bV9pc19yZWFkeTsKPiA+
ICB2b2lkIGthc2FuX2luaXQodm9pZCkKPiA+ICB7Cj4gPiAgICAgICAvKgo+ID4gQEAgLTMyLDcg
KzMyLDcgQEAgdm9pZCBrYXNhbl9pbml0KHZvaWQpCj4gPiAgICAgICAgKi8KPiA+ICAgICAgIGth
c2FuX21hcF9tZW1vcnkoKHZvaWQgKilLQVNBTl9TSEFET1dfU1RBUlQsIEtBU0FOX1NIQURPV19T
SVpFKTsKPiA+ICAgICAgIGluaXRfdGFzay5rYXNhbl9kZXB0aCA9IDA7Cj4gPiAtICAgICBrYXNh
bl91bV9pc19yZWFkeSA9IHRydWU7Cj4gPiArICAgICBrYXNhbl9pbml0X2dlbmVyaWMoKTsKPgo+
IEkgdGhpbmsgdGhpcyBydW5zIGJlZm9yZSBqdW1wX2xhYmVsX2luaXQoKSwgYW5kIHN0YXRpYyBr
ZXlzIHNob3VsZG4ndCBiZSBzd2l0Y2hlZCBiZWZvcmUgdGhhdC4+ICB9CgpJIGdvdCB0aGUgd2Fy
bmluZyBpbiBteSBsb2NhbCBjb21waWxhdGlvbiBhbmQgZnJvbSBrZXJuZWwgQ0kgWzFdLgoKYXJj
aC91bSBwbGFjZXMga2FzYW5faW5pdCgpIGluIG93biBgLmthc2FuX2luaXRgIHNlY3Rpb24sIHdo
aWxlCmthc2FuX2luaXRfZ2VuZXJpYygpIGlzIGNhbGxlZCBmcm9tIF9faW5pdC4KQ291bGQgeW91
IHN1Z2dlc3QgYSB3YXkgaG93IEkgY2FuIHZlcmlmeSB0aGUgZnVuY3Rpb25zIGNhbGwgb3JkZXI/
CgpJIG5lZWQgdG8gZmFtaWxpYXJpemUgbXlzZWxmIHdpdGggaG93IHRvIHJ1biBhcmNoL3VtIGxv
Y2FsbHkgYW5kIHRyeQp0byBmaXggdGhpcyB3YXJuaW5nLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC9DQUN6d0x4aWNta3k0Q1JkbUFCdE44bTJjcjJFcHVNeExQcWVGNUhrMzc1Y04y
S3Z1LVFAbWFpbC5nbWFpbC5jb20vCgo+ID4KPiA+ICBzdGF0aWMgdm9pZCAoKmthc2FuX2luaXRf
cHRyKSh2b2lkKQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
