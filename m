Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA84C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 23:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GjwtCZb9DHwFH93p/AfbHMFBxvfAkP8X3BTWWgQKHgA=; b=XlA/J6yGoY36af
	z4kBDGSmO1Yun3IvJm8TS5/6F0H8wOmoM9lbUqdexmaFak5gHw3+axyXPpywflsj5GSs2iS+HpW6u
	T+HSFpmMv3yyMA+AlNI/KnI/se96Y/57d5AGLXTQz6SPRvbTQm+vw5IeJC2sSdQOD+R+2TQf5gENn
	JUsCyDCbTgxYuR6jwlFZiiwf57gUu2TYMZtvMgwL9Ik+XaEbLxejfeMyaHMyQcPIzjFrghTCVdCTT
	I7Ydwt4aUZWMzwAGaXwQvGZdFPvePwbwIQpGaKoOKBYsrI3xyfjDDbjrtYfKPCLkAU9tHB4poHQpd
	y5vH/bL+hYZrnE1W3U3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvPYk-0000000DTtL-0RPS;
	Thu, 20 Mar 2025 23:44:22 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvPYg-0000000DTra-13hN
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 23:44:20 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3018c9c6b5fso2060043a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 16:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742514257; x=1743119057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sx9RFbFhV18UVxcJVn2E8kE6xVU3d+kjpx4dubf4KQY=;
        b=pXSGCIi0N8IjhsZq/Kxyl8gTtNXhuu3E7KTz7+/fF8MQItKcXjSO6cFEJwAuwwxxy7
         Cozf/Va+jJ8HXjIEn9aixYI3FynDyuHUa9ktYN6T88yAc1qWvPCtCvZcqdgTD/R5LGo3
         +kNX3pHA4oN+nNQHV27C1hgLdbO/+7BPssz9z8LwjdZpDwbRtsJkd7RUj6TpCURF9klQ
         xDSY9QsmAN7uGhoPA+MT/pmlNgwH66zN2RqGURN57K2Bl6rkDonaV/wkWcFeFbMW20qQ
         onCUnHVcxh1xGI8v0DGrpZ32OgbouIiXtp1u3m1qRnBuiD4c4IXNDoaDpoCxpBBH6CjC
         ZMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742514257; x=1743119057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sx9RFbFhV18UVxcJVn2E8kE6xVU3d+kjpx4dubf4KQY=;
        b=Fgb+Ib4N/nve6k3wqruI6357ohT43GQa/PS//OyMOj8uFM9Q03NTR97ZfWgu85k1K+
         AqaDKuxts0JdmDKEXl3fz6AGQ+3T9TZR5QnQNRuwwn35fMmlrkXU7GEKVl3OHnN6gTuS
         CJeFNaiqj2fPcjNaTaJmb6+jFax3EfkqViutUXQ2/QvTlH1BVQwc2HbBy2Y0lwnCu9hB
         O0vUvEqjocHpFWO5zcoeHYnQPXJn86TKsauArNAq8tOliwbd81Ew9wAwHEUzwVQxBO/P
         0UiDfMHIDhZ1zv165pkgq2UBTxcoJOrZ5/HRtNrCVFpMekeRtYnnyCQmSREm6yOI0S95
         I3Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVl3SsYJEGrN5uBRxp9imD7SK3eG/ejt8ucHSLuR92qnJ/7VyWAV/KniEvR9Tt7IywWp4NMrZfg+hFbiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLYUAIbQwbEGzNzbuHz+CHWacHwgGMJw4x74650/Bw1TZdSYTw
	WaUzgoeIvtudQT2o5N5e2d7uNS6Tkqc+n9rweqYcL2/crn9olTc0+u0qZdLLrzEBx2g/hvF7Ua0
	UJhDWhCIoh3kQiWHPMTXAQPgsjIDAD5MiEzF/KeFvZSzoUIdZolQ=
X-Gm-Gg: ASbGncuw954VmpWEKCJUclQTC5mQah1huj+0cB2Envwsk3n7h+zgOzwcYwHE+08Kas2
	rivcpxFxB2cVh1LH8aebnqFDfPoSR4HQpJbTSTs6cKTy2ODytv0nCPwgctaCAD+as0hycuVdFV8
	/zv0IYWLxcioQ7DrppcdE2LVzw
X-Google-Smtp-Source: AGHT+IHZLYL66qJW18COX6JZ7o2M448VXcpFC9tv/3ygvfrm/plvo7x5Xd4P6IHJW/2EPCNgKPKtCGWglcvBlvp8pYg=
X-Received: by 2002:a17:90b:28c4:b0:2fe:a742:51b0 with SMTP id
 98e67ed59e1d1-3031002af0fmr1663139a91.31.1742514256837; Thu, 20 Mar 2025
 16:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250317-kvm_exit_fix-v1-1-aa5240c5dbd2@rivosinc.com> <Z9hI5vEHngcKvvRa@google.com>
In-Reply-To: <Z9hI5vEHngcKvvRa@google.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 20 Mar 2025 16:44:05 -0700
X-Gm-Features: AQ5f1JqRewenHnUHTLoLyUK3jy666k2pQWgIEFEkTaIpT0EXNn1CrZi3jTO1WxM
Message-ID: <CAHBxVyFLeZFwEnJYa-oUbAKVimdVsr=Ct76Jf=TyWeoAkHe8yQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Teardown riscv specific bits after kvm_exit
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <apatel@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_164418_570364_CE0D9094 
X-CRM114-Status: GOOD (  23.85  )
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

T24gTW9uLCBNYXIgMTcsIDIwMjUgYXQgOTowOOKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgTWFyIDE3LCAyMDI1LCBBdGlzaCBQ
YXRyYSB3cm90ZToKPiA+IER1cmluZyBhIG1vZHVsZSByZW1vdmFsLCBrdm1fZXhpdCBpbnZva2Vz
IGFyY2ggc3BlY2lmaWMgZGlzYWJsZQo+ID4gY2FsbCB3aGljaCBkaXNhYmxlcyBBSUEuIEhvd2V2
ZXIsIHdlIGludm9rZSBhaWFfZXhpdCBiZWZvcmUga3ZtX2V4aXQKPiA+IHJlc3VsdGluZyBpbiB0
aGUgZm9sbG93aW5nIHdhcm5pbmcuIEtWTSBrZXJuZWwgbW9kdWxlIGNhbid0IGJlIGluc2VydGVk
Cj4gPiBhZnRlcndhcmRzIGR1ZSB0byBpbmNvbnNpc3RlbnQgc3RhdGUgb2YgSVJRLgo+ID4KPiA+
IFsyNTQ2OS4wMzEzODldIHBlcmNwdSBJUlEgMzEgc3RpbGwgZW5hYmxlZCBvbiBDUFUwIQo+ID4g
WzI1NDY5LjAzMTczMl0gV0FSTklORzogQ1BVOiAzIFBJRDogOTQzIGF0IGtlcm5lbC9pcnEvbWFu
YWdlLmM6MjQ3NiBfX2ZyZWVfcGVyY3B1X2lycSsweGEyLzB4MTUwCj4gPiBbMjU0NjkuMDMxODA0
XSBNb2R1bGVzIGxpbmtlZCBpbjoga3ZtKC0pCj4gPiBbMjU0NjkuMDMxODQ4XSBDUFU6IDMgVUlE
OiAwIFBJRDogOTQzIENvbW06IHJtbW9kIE5vdCB0YWludGVkIDYuMTQuMC1yYzUtMDY5NDctZzkx
Yzc2MzExOGY0Ny1kaXJ0eSAjMgo+ID4gWzI1NDY5LjAzMTkwNV0gSGFyZHdhcmUgbmFtZTogcmlz
Y3YtdmlydGlvLHFlbXUgKERUKQo+ID4gWzI1NDY5LjAzMTkyOF0gZXBjIDogX19mcmVlX3BlcmNw
dV9pcnErMHhhMi8weDE1MAo+ID4gWzI1NDY5LjAzMTk3Nl0gIHJhIDogX19mcmVlX3BlcmNwdV9p
cnErMHhhMi8weDE1MAo+ID4gWzI1NDY5LjAzMjE5N10gZXBjIDogZmZmZmZmZmY4MDA3ZGIxZSBy
YSA6IGZmZmZmZmZmODAwN2RiMWUgc3AgOiBmZjIwMDAwMDAwODhiZDUwCj4gPiBbMjU0NjkuMDMy
MjQxXSAgZ3AgOiBmZmZmZmZmZjgxMzFjZWY4IHRwIDogZmY2MDAwMDA4MGI5NjQwMCB0MCA6IGZm
MjAwMDAwMDA4OGJhZjgKPiA+IFsyNTQ2OS4wMzIyODVdICB0MSA6IGZmZmZmZmZmZmZmZmZmZmMg
dDIgOiA1MjQ5MjA3NTcwNjM3MjY1IHMwIDogZmYyMDAwMDAwMDg4YmQ5MAo+ID4gWzI1NDY5LjAz
MjMyOV0gIHMxIDogZmY2MDAwMDA5OGIyMTA4MCBhMCA6IDAzN2Q1MjdhMTVlYjRmMDAgYTEgOiAw
MzdkNTI3YTE1ZWI0ZjAwCj4gPiBbMjU0NjkuMDMyMzcyXSAgYTIgOiAwMDAwMDAwMDAwMDAwMDIz
IGEzIDogMDAwMDAwMDAwMDAwMDAwMSBhNCA6IGZmZmZmZmZmODEyMmRiZjgKPiA+IFsyNTQ2OS4w
MzI0MTBdICBhNSA6IDAwMDAwMDAwMDAwMDBmZmYgYTYgOiAwMDAwMDAwMDAwMDAwMDAwIGE3IDog
ZmZmZmZmZmY4MTIyZGMxMAo+ID4gWzI1NDY5LjAzMjQ0OF0gIHMyIDogZmY2MDAwMDA4MGMyMmVi
MCBzMyA6IDAwMDAwMDAyMDAwMDAwMjIgczQgOiAwMDAwMDAwMDAwMDAwMDFmCj4gPiBbMjU0Njku
MDMyNDg4XSAgczUgOiBmZjYwMDAwMDgwYzIyZTAwIHM2IDogZmZmZmZmZmY4MGMzNTFjMCBzNyA6
IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsyNTQ2OS4wMzI1ODJdICBzOCA6IDAwMDAwMDAwMDAwMDAw
MDMgczkgOiAwMDAwNTU1NTZiN2ZiNDkwIHMxMDogMDAwMDdmZmZmMGUxMmZhMAo+ID4gWzI1NDY5
LjAzMjYyMV0gIHMxMTogMDAwMDdmZmZmMGUxM2U5YSB0MyA6IGZmZmZmZmZmODEzNTRhYzcgdDQg
OiBmZmZmZmZmZjgxMzU0YWM3Cj4gPiBbMjU0NjkuMDMyNjY0XSAgdDUgOiBmZmZmZmZmZjgxMzU0
YWM4IHQ2IDogZmZmZmZmZmY4MTM1NGFjNwo+ID4gWzI1NDY5LjAzMjY5OF0gc3RhdHVzOiAwMDAw
MDAwMjAwMDAwMTAwIGJhZGFkZHI6IGZmZmZmZmZmODAwN2RiMWUgY2F1c2U6IDAwMDAwMDAwMDAw
MDAwMDMKPiA+IFsyNTQ2OS4wMzI3MzhdIFs8ZmZmZmZmZmY4MDA3ZGIxZT5dIF9fZnJlZV9wZXJj
cHVfaXJxKzB4YTIvMHgxNTAKPiA+IFsyNTQ2OS4wMzI3OTddIFs8ZmZmZmZmZmY4MDA3ZGJmYz5d
IGZyZWVfcGVyY3B1X2lycSsweDMwLzB4NWUKPiA+IFsyNTQ2OS4wMzI4NTZdIFs8ZmZmZmZmZmYw
MTNhNTdkYz5dIGt2bV9yaXNjdl9haWFfZXhpdCsweDQwLzB4NDIgW2t2bV0KPiA+IFsyNTQ2OS4w
MzM5NDddIFs8ZmZmZmZmZmYwMTNiNGU4Mj5dIGNsZWFudXBfbW9kdWxlKzB4MTAvMHgzMiBba3Zt
XQo+ID4gWzI1NDY5LjAzNTMwMF0gWzxmZmZmZmZmZjgwMDliMTUwPl0gX19yaXNjdl9zeXNfZGVs
ZXRlX21vZHVsZSsweDE4ZS8weDFmYwo+ID4gWzI1NDY5LjAzNTM3NF0gWzxmZmZmZmZmZjgwMDBj
MWNhPl0gc3lzY2FsbF9oYW5kbGVyKzB4M2EvMHg0Ngo+ID4gWzI1NDY5LjAzNTQ1Nl0gWzxmZmZm
ZmZmZjgwOWVjOWE0Pl0gZG9fdHJhcF9lY2FsbF91KzB4NzIvMHgxMzQKPiA+IFsyNTQ2OS4wMzU1
MzZdIFs8ZmZmZmZmZmY4MDlmNWUxOD5dIGhhbmRsZV9leGNlcHRpb24rMHgxNDgvMHgxNTYKPiA+
Cj4gPiBJbnZva2UgYWlhX2V4aXQgYW5kIG90aGVyIGFyY2ggc3BlY2lmaWMgY2xlYW51cCBmdW5j
dGlvbnMgYWZ0ZXIga3ZtX2V4aXQKPiA+IHNvIHRoYXQgZGlzYWJsZSBnZXRzIGEgY2hhbmNlIHRv
IGJlIGNhbGxlZCBmaXJzdCBiZWZvcmUgZXhpdC4KPiA+Cj4gPiBGaXhlczogNTRlNDMzMjBjMmJh
ICgiUklTQy1WOiBLVk06IEluaXRpYWwgc2tlbGV0YWwgc3VwcG9ydCBmb3IgQUlBIikKPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+IC0t
LQo+Cj4gRldJVywKPgo+IFJldmlld2VkLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KPgo+ID4gIGFyY2gvcmlzY3Yva3ZtL21haW4uYyB8IDQgKystLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21haW4uYyBiL2FyY2gvcmlzY3Yva3ZtL21haW4uYwo+
ID4gaW5kZXggMWZhOGJlNWVlNTA5Li40YjI0NzA1ZGM2M2EgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2t2bS9tYWluLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL21haW4uYwo+ID4gQEAg
LTE3Miw4ICsxNzIsOCBAQCBtb2R1bGVfaW5pdChyaXNjdl9rdm1faW5pdCk7Cj4gPgo+ID4gIHN0
YXRpYyB2b2lkIF9fZXhpdCByaXNjdl9rdm1fZXhpdCh2b2lkKQo+ID4gIHsKPiA+IC0gICAgIGt2
bV9yaXNjdl90ZWFyZG93bigpOwo+ID4gLQo+ID4gICAgICAga3ZtX2V4aXQoKTsKPiA+ICsKPiA+
ICsgICAgIGt2bV9yaXNjdl90ZWFyZG93bigpOwo+Cj4gSSB3b25kZXIgaWYgdGhlcmUncyBhIHdh
eSB3ZSBjYW4gZ3VhcmQgYWdhaW5zdCBrdm1faW5pdCgpL2t2bV9leGl0KCkgYmVpbmcgY2FsbGVk
Cj4gdG9vIGVhcmx5L2xhdGUuICB4ODYgaGFkIHNpbWlsYXIgYnVncyBmb3IgYSB2ZXJ5IGxvbmcg
dGltZSwgZS5nLiBzZWUgY29tbWl0Cj4gZTMyYjEyMDA3MWVhICgiS1ZNOiBWTVg6IERvIF9hbGxf
IGluaXRpYWxpemF0aW9uIGJlZm9yZSBleHBvc2luZyAvZGV2L2t2bSB0byB1c2Vyc3BhY2UiKS4K
Pgo+IEUuZy4gbWF5YmUgd2UgZG8gc29tZXRoaW5nIGxpa2UgY3JlYXRlK2Rlc3Ryb3kgYSBWTSBh
dCB0aGUgZW5kIG9mIGt2bV9pbml0KCkgYW5kCj4gdGhlIGJlZ2lubmluZyBvZiBrdm1fZXhpdCgp
PyAgTm90IHN1cmUgaWYgdGhhdCB3b3VsZCB3b3JrIGZvciBrdm1fZXhpdCgpLCBidXQgaXQKPiBz
aG91bGQgZGVmaW5pdGVseSBiZSBmaW5lIGZvciBrdm1faW5pdCgpLgo+Clllcy4gVGhhdCB3b3Vs
ZCBiZSBzdXBlciB1c2VmdWwuIEkgYW0gbm90IHN1cmUgYWJvdXQgdGhlIGV4YWN0Cm1lY2hhbmlz
bSB0byBhY2hpZXZlIHRoYXQgdGhvdWdoLgpEbyB5b3UganVzdCB0ZXN0IGNvZGUgZ3VhcmRlZCB3
aXRoaW4gYSBuZXcgY29uZmlnIHRoYXQganVzdApjcmVhdGVzL2Rlc3Ryb3lzIGEgZHVtbXkgVk0g
PwoKTWF5IGJlIGt1bml0IHRlc3QgZm9yIEtWTSBmaXRzIGhlcmUgaW4gc29tZSB3YXkgPwoKPiBJ
dCB3b3VsZG4ndCBwcmV2ZW50IGJ1Z3MsIGJ1dCBtYXliZSBpdCB3b3VsZCBoZWxwIGRldGVjdCB0
aGVtIGR1cmluZyBkZXZlbG9wbWVudD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
