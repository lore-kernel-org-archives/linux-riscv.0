Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD91CD3C913
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 14:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QYT8Tq44j0qVTrpHZV5dP+M3kE94X06UYO2RUIWBLtI=; b=rLfiIjfROUGmUk
	Rzxkq5FTwfWntNLHGGu48Sc3htcSKVNbtlV97uVcXtOKSyvrkQ58MEXN5aGxxZ46KCL3nUy63a8a8
	2nDbHX/M5lfisgf34f4VKUZm5qH9t6/Cj3oRbSP3+mA9c7RNNPouq6hrN/E8xDlb8Fq8LjWtn4YC/
	SWXnEd3GDlxpzP8Pjf/GIiAiMhByJYQ7+kr11i8U7ickFuFWMQpxLAEeiRfSorSqIw1VblmREInqD
	n7NZE4SroMnQn6stkFlc2ef5JxeLIy8A7JJOKQzbI6wVFm99oQCwn3En2M+VQjbZ9FqHzIgW6FGI6
	pgSB2OpzZzND3qBdaHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTL5V-0000000FW4u-0ArN;
	Wed, 10 Dec 2025 14:22:41 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTL5O-0000000FW2Q-1P2v
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 14:22:38 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-349e7fe50c3so337614a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 06:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1765376553; x=1765981353; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCXWI9NMLIGKdShYILtPTYF4vSjxO5JfoEVGJGIlybo=;
        b=SD5ZkwEiteTpqzhrgMadE/8LW/0yV40ONUvx9hMjXOQR9WzQURAqXedjWVsOKOB2Sb
         wDzeO444t+hPN/3jiLjhZXPKoC8JdwPGbd/EL+TZRDE+kEYdT/6ShEx5Sokrk18gC+DP
         bZrMSsFD+VXsgO4kahi/k5FqTTJgTzsYNdVFNtmJ3v0uBKHT1LQQccB4qmieVwGh2IcD
         RnlUGC+V7hwtbUxiBgMeXYpS+koJtAOHK40gjKsGmLBy6RxnaSO0QlWwE01iG4RYX8Rg
         4i4ibLVrppBPbUuJxfH5Fd9m40TLBKuVPjK7/QNKltPeNQo4sybm9Z5OdSo8lBQoLYhf
         57hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765376553; x=1765981353;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CCXWI9NMLIGKdShYILtPTYF4vSjxO5JfoEVGJGIlybo=;
        b=v8TSt0l+l24YBSFEu4ipDNFEUoNbkDhyg5z6SZo92slvUfAgWumiSMBrk76+WLYKlR
         hT/VmT+sYvySeh5VzeBzlJjDQ+HjRvCGrEScs7s45PpQwNW6Y9amJDgXNuinKeqWsyJY
         73i7AJDdp6ehPerKidXYLD6c3m8aeIX16Br6NbC3twNRvCyyWFijyoqOriNEgBGcPRQL
         0u1hDURVWHbsjhOo1L1pa0gWBiycAa7LcT2BGS+iaqE7ZraPcvQq1E2PjR+0iyW7MC+a
         wQ62mdcE6lol0YnDONUrKgAT8N2zbzuXGO3s10S5Gljn03EHyZJ78Mh67nasx+jrqukD
         o9fw==
X-Forwarded-Encrypted: i=1; AJvYcCUyg2uL5NdcFty6Np1zWC3+2NtZCZryikxKbfJ90Me1lNQ547GsBfRzimZhQce+2JhmdFoG5BiK57IeHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUTI24ZmZExw/QscJ69Otgnaph5Gwtza1rjuQXNJIXlB5+br4x
	d1GvkvvGy1vGTREqTv4gXsrqH/sjHbCUFlpoIBo26aY2TYkB+CzZl3rSXgmWjpDSQ40=
X-Gm-Gg: AY/fxX7JJuOTcd0BEe4TVVPt/YPgRMB8msAuZ4G2Fez8Q1KylerpslD6C7TMFrH8VLJ
	Ep7jrwnewNQtfgyhgEXUZ2FiEnRa/7Q4JE9YXxT0mW8PkdsGNfqvsdmUIlo4T1Pf7Hp7/ycY7RB
	oau4NJ3p7eFlvOmKNqu//aaHBAo7s/q8KXlIhVL8phzh5oSohhRhgRD2eV3X48ALYwfhWPgKJAU
	OFa6ejBi5S6qoZFI7TggphzrL2vyufIvRJYktp/45JENWMxLeymYTajIKJM2EeW6TpfUPVtV4q1
	7UjTR0v+YxitT9SpSTnf8xH0HkUyWCSQkdXxxmIst4k8CV13BTHrhTZLFKcanG4SehelNKzZSmy
	gRATFOqmFXwLxWAgobbLQaCOHkFXHOl96OxgZ+LV8WxOQxnyZKfK8syfWwnd06HcYFVgR0d7mdv
	JiFDG8O9MvZ1TXlOI=
X-Google-Smtp-Source: AGHT+IH+3VoOPNGdth2Gvi9WRF0RQbU1oEXZJauN9cdeoWV6+Oc4w9B7Ps/1EmONqCkTRg9MS367vA==
X-Received: by 2002:a17:90b:1643:b0:343:6a63:85d1 with SMTP id 98e67ed59e1d1-34a728c81damr1938262a91.6.1765376552581;
        Wed, 10 Dec 2025 06:22:32 -0800 (PST)
Received: from localhost ([2400:4050:300:5200:def6:5e63:b5ff:c77])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-34a6ff012f1sm2743460a91.4.2025.12.10.06.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 06:22:31 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 10 Dec 2025 23:22:29 +0900
Message-Id: <DEULRAM55E2G.1464D4JSWL3SZ@ventanamicro.com>
Subject: Re: [External] Re: [PATCH v3 5/8] riscv: smp: use NMI for CPU stop
Cc: <conor@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <luxu.kernel@bytedance.com>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <jassisinghbrar@gmail.com>, <conor.dooley@microchip.com>,
 <valentina.fernandezalanis@microchip.com>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
 <lpieralisi@kernel.org>, <arnd@arndb.de>, <kees@kernel.org>,
 <tglx@linutronix.de>, <viresh.kumar@linaro.org>, <boqun.feng@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <cleger@rivosinc.com>,
 <atishp@rivosinc.com>, <ajones@ventanamicro.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "yunhui cui" <cuiyunhui@bytedance.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-6-cuiyunhui@bytedance.com>
 <DEP4X1DAIOU5.2WLIV4BMWLMRR@ventanamicro.com>
 <CAEEQ3wmAn=9w=fR=OMTMF17_tAcEnsdJWL_w8fw-3wA-Bfi6xw@mail.gmail.com>
 <DEPGLFUVHA0O.XSZVD2T1ENLD@ventanamicro.com>
 <CAEEQ3wngwxjiytt7g6XY0bC1PL4A1NEmirML7FiqXMA4_K0irw@mail.gmail.com>
In-Reply-To: <CAEEQ3wngwxjiytt7g6XY0bC1PL4A1NEmirML7FiqXMA4_K0irw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_062234_756098_39E2ECEB 
X-CRM114-Status: GOOD (  21.70  )
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

MjAyNS0xMi0wOFQxOTo0MDozOSswODowMCwgeXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+Ogo+IEhpIFJhZGltLAo+Cj4gT24gVGh1LCBEZWMgNCwgMjAyNSBhdCA5OjE24oCvUE0g
UmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Pgo+PiAy
MDI1LTEyLTA0VDEzOjI4OjQ1KzA4OjAwLCB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNl
LmNvbT46Cj4+ID4gSGkgUmFkaW0sCj4+ID4KPj4gPiBPbiBUaHUsIERlYyA0LCAyMDI1IGF0IDEy
OjA34oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3Rl
Ogo+PiA+Pgo+PiA+PiAyMDI1LTExLTI3VDIwOjUzOjAyKzA4OjAwLCBZdW5odWkgQ3VpIDxjdWl5
dW5odWlAYnl0ZWRhbmNlLmNvbT46Cj4+ID4+ID4gVXNlIE5NSSBpbnN0ZWFkIG9mIElQSSBmb3Ig
Q1BVIHN0b3AgaWYgUklTQy1WIFNTRSBOTUkgaXMgc3VwcG9ydGVkLgo+PiA+PiA+Cj4+ID4+ID4g
U2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4+ID4+
ID4gLS0tCj4+ID4+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvcmlzY3Zf
c3NlX25taS5jIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9yaXNjdl9zc2Vfbm1pLmMKPj4gPj4g
PiBAQCAtNTgsNiArNTgsNyBAQCBzdGF0aWMgaW50IGxvY2FsX25taV9oYW5kbGVyKHUzMiBldnQs
IHZvaWQgKmFyZywgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ID4+ID4gICAgICAgdHlwZSA9IGF0
b21pY19yZWFkKHRoaXNfY3B1X3B0cigmbG9jYWxfbm1pKSk7Cj4+ID4+ID4KPj4gPj4gPiAgICAg
ICBOTUlfSEFORExFKExPQ0FMX05NSV9DUkFTSCwgY3B1X2NyYXNoX3N0b3AsIGNwdSwgcmVncyk7
Cj4+ID4+ID4gKyAgICAgTk1JX0hBTkRMRShMT0NBTF9OTUlfU1RPUCwgY3B1X3N0b3ApOwo+PiA+
Pgo+PiA+PiBQbGVhc2UgZG9jdW1lbnQgdGhlIGludGVuZGVkIHByZWVtcHRpb24gZGVzaWduIGZv
ciBhbGwgU1NFIGV2ZW50cywKPj4gPj4gYmVjYXVzZSBpdCB3aWxsIGJlIGEgbmlnaHRtYXJlIGlm
IHdlIGZvcmdldCBzb21lIGFzc3VtcHRpb25zIGluIHRoZQo+PiA+PiBjb21pbmcgeWVhcnMuICAo
VGhhdCBpbmNsdWRlcyB0aGUgcmVsYXRpdmUgcHJpb3JpdGllcyBvZiBSQVMvUE1VLy4uLikKPj4g
Pgo+PiA+IEFjdHVhbGx5LCBMT0NBTF9OTUlfQ1JBU0gsIExPQ0FMX05NSV9TVE9QLCBMT0NBTF9O
TUlfQkFDS1RSQUNFLAo+PiA+IExPQ0FMX05NSV9LR0RCLCAuLi4gYXJlIGFsbCBpbXBsZW1lbnRl
ZCB2aWEgdGhlIHNpbmdsZSBTU0UgZXZlbnQKPj4gPiBTQklfU1NFX0VWRU5UX0xPQ0FMX1NPRlRX
QVJFX0lOSkVDVEVELiBQZXIgdGhlIFNTRSBkZXNpZ24sIG5vCj4+ID4gcHJlZW1wdGlvbiB3aWxs
IG9jY3VyIGFtb25nIENSQVNILCBTVE9QLCBCQUNLVFJBQ0UsIGFuZCBLR0RCIGV2ZW50cy4KPj4K
Pj4gVGhhdCBpcyBob3cgaXQgaXMuICBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IGl0IG11c3QgYmUg
bGlrZSB0aGF0Lgo+Pgo+PiBGb3IgZXhhbXBsZTogUE1VX09WRVJGTE9XIGhhcyBsb3dlciBldmVu
dF9pZCB0aGFuIFNPRlRXQVJFX0lOSkVDVEVELCBzbwo+PiBpdCB3aWxsIGN1cnJlbnRseSBpbnRl
cnJ1cHQgTk1JX0NSQVNIIGFzIHRoZXkgYm90aCBoYXZlIHByaW9yaXR5IDAsCj4+IGFsdGhvdWdo
IE5NSV9DUkFTSCBwcm9iYWJseSBzaG91bGRuJ3QgYmUgbWFza2VkIGJ5IGFueXRoaW5nLCBhbmQg
c2hvdWxkCj4+IHByZWVtcHQgZXZlcnl0aGluZy4KPj4gTk1JX0JBQ0tUUkFDRSwgb24gdGhlIG90
aGVyIGhhbmQsIHByb2JhYmx5IHNob3VsZG4ndCBoYXZlIHRoYXQgaGlnaAo+PiBwcmlvcml0eSBh
cyB0aGVyZSBzZWVtIG1vcmUgaW1wb3J0YW50IGV2ZW50cyAoZS5nLiBSQVMgYW5kIE5NSV9DUkFT
SCkuCj4+Cj4+IFRoZSBpc3N1ZXMgY2FuIGJlIGF2b2lkZWQgYnkgZXZlbnQgcHJpb3JpdGllcywg
bWFza2luZywgb3IgZGVlbWVkIGFzCj4+IG5vbi1pc3N1ZSwgYnV0IEkgdGhpbmsgaXQgd291bGQg
YmUgYmVuZWZpY2lhbCB0byBwcm92aWRlIHNvbWUgcmVhc29uaW5nCj4+IGJlaGluZCB0aGUgZGVz
aWduLCBhcyB0aGUgY2hvaWNlcyBkb24ndCBzZWVtIG9idmlvdXMgdG8gbWUuCj4KPiBJbmRlZWQs
IGl0IGlzIG5lY2Vzc2FyeSB0byBjb25zaWRlciB0aGUgcHJpb3JpdHkgYW1vbmcgZGlmZmVyZW50
Cj4gZXZlbnRzLiBTaG91bGQgZGlmZmVyZW50IHByaW9yaXRpZXMgYWxzbyBiZSBhc3NpZ25lZCB0
byBOTUlfQ1JBU0gsCj4gTk1JX0JBQ0tUUkFDRSwgTk1JX1NUT1AsIGFuZCBOTUlfS0dEQj8KCkkg
dGhpbmsgaXQgd291bGQgYmUgYmVuZWZpY2lhbCB0byBkb2N1bWVudCB0aGUgZGVzaXJlZCBiZWhh
dmlvciBldmVuIGlmCndlIGNhbid0IChjdXJyZW50bHk/KSBpbXBsZW1lbnQgaXQsIGJlY2F1c2Ug
bGlrZSB5b3Ugc2FpZCwgU1NFIGNhbid0CmRpcmVjdGx5IGV4cHJlc3MgdGhlIHByaW9yaXR5IHdo
ZW4gbXVsdGlwbGV4aW5nIFNPRlRXQVJFX0lOSkVDVEVELgoKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBEbyB0aGVzZSBvcGVyYXRpb25zIG5lZWQgdG8gYmUKPiB2aXNp
YmxlIHRvIHRoZSBCSU9TPwoKQklPUyBzaG91bGRuJ3QgY2FyZSB3aGF0IGxvd2VyIHByaXZpbGVn
ZSB3YW50cyB0byBkby4KU0JJIGNvdWxkIGRlZmluZSBtb3JlIGV2ZW50cyBmb3Igc29mdHdhcmUg
dXNlLCB0aG91Z2guCgo+ICAgICAgICAgICAgICAgICAgICAgIENvdWxkIHlvdSBraW5kbHkgcHJv
dmlkZSBzb21lIGdvb2Qgc3VnZ2VzdGlvbnM/CgpJIHRoaW5rIGl0IHdvdWxkIGJlIGdvb2QgcHJh
Y3RpY2UgdG8gZXhwbGljaXRseSBzZXQgYSB1bmlxdWUgcHJpb3JpdHkKd2hlbiByZWdpc3Rlcmlu
ZyBTU0UgZXZlbnRzLiAgTWF5YmUgdGhyb3VnaCBhIGdsb2JhbCBwcmlvcml0eSBlbnVtLCBhbmQK
bWFrZSBzdXJlIHRoYXQgYWxsIGV2ZW50IHJlZ2lzdHJhdGlvbnMgYXJlIHBhc3NpbmcgYSB2YWx1
ZSBmcm9tIHRoYXQKZW51bS4KClRoYXQgd291bGQgbWFrZSBzdXJlIHRoYXQgZGlmZmVyZW50IGV2
ZW50cyBpbnRlcmFjdCBsaWtlIHdlIGV4cGVjdCB0aGVtCnRvLCBidXQgaXQgZG9lc24ndCBzb2x2
ZSB0aGUgbXVsdGlwbGV4aW5nIGlzc3VlIG9mIFNPRlRXQVJFX0lOSkVDVEVELgoKSWYgd2UncmUg
ZmluZSB3aXRoIGFsbCBTT0ZUV0FSRV9JTkpFQ1RFRCBzdWItaGFuZGxlcnMgaGF2aW5nIHRoZSBt
YXhpbWFsCnByaW9yaXR5IChoaWdoZXIgdGhhbiBSQVMvUE1VL1VOS05PV05fTk1JLy4uLiksIHRo
ZW4gd2UgY291bGQgaG9wZSB0aGF0Cmxvd2VyIGltcG9yYW5jZSBoYW5kbGVycyAoZS5nLiBCQUNL
VFJBQ0UpIHdvbid0IGhhbmcsIHNvIHRoZSBoaWdoZXIKaW1wb3J0YW5jZSBoYW5kbGVycyAoZS5n
LiBDUkFTSCkgd291bGQgZXZlbnR1YWxseSBydW4uCldlJ3JlIGRlYWxpbmcgd2l0aCBsb3ctb2Nj
dXJyZW5jZSBzY2VuYXJpb3MsIHNvIHRoaXMgbWlnaHQgYmUgImdvb2QKZW5vdWdoIGZvciBub3ci
Li4uCgpTaXR1YXRpb24gd291bGQgZ2V0IHNpbXBsZXIgaWYgd2UgY291bGQgYXZvaWQgc29tZSBz
dWItaGFuZGxlcnM7CmFsdGVybmF0aXZlbHksIGl0IHdvdWxkIGdldCBtb3JlIGNvbXBsaWNhdGVk
IGlmIFNPRlRXQVJFX0lOSkVDVEVEIGhhZApsb3dlciBwcmlvcml0eSB0aGFuIHNvbWUgb3RoZXIg
ZXZlbnQgLS0gd2UnZCBtYWtlIENSQVNIIHBhcnRpYWxseQpyZWNvdmVyIGl0cyBoaWdoIHByaW9y
aXR5IGltYWdlIGJ5IG1hc2tpbmcgb3RoZXIgU1NFIGV2ZW50cyBkdXJpbmcgaXRzCmV4ZWN1dGlv
biAoYW5kIHdlJ2QgbmVlZCB3YXJkaW5nIGFtdWxldHMgYWdhaW5zdCBoYW5ncyBhbmQgc3RhcnZh
dGlvbikuCgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
