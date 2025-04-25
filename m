Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD4EC369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qHu0Qu3GqYaqGfy7KX9OmknasjvMlgrHBlpM6T9Pc0=; b=g9GWcacd+9R6hd
	tUGD2xjW6S8PihxoqCBFvcGwGt5iY6OrY57VlC+vs6lw4bepgvdxDutiQi1iBZcdhMHx4LzEENkHl
	6Ul+eRzuXOAbQIm2WHyl6hVnfgHWeiumgCibIBa2GJ6WH4gtcbw5IzpTQK52C3qh3L+ZfZFtpEhLD
	LFnNySGIWZcD3VBA/3Obt+oPODIbFN+WyuDNcVo4ArVbMxLoFIJSbSumwq5VJRUPjeq05ve7QegOH
	rnSqyWkPZB/Pg1aAAFY6YkMy9kJKxWP43YRRPOsw7Q8+5LYhPvdTEpziJZiCQUovw52fbx9c3oXGh
	xCs7+5v4NKu3cFTrPhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ih5-0000000HD6M-1mdh;
	Fri, 25 Apr 2025 13:02:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HHm-0000000GyZg-3jMJ
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 11:32:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cee550af2so1353955e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 04:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745580721; x=1746185521; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDHnSfsfm8Pky45upkoSAPit3VP8lTu/pCNcAlnlmqU=;
        b=Ql3OtS7nMIaT+cTW4AIE65DrXp2sDgrugEpGio9KmhkUaNrnGG0JRMrHJbVImPsw2I
         bw94KdlIXTVwqCzPdB3ZT++6VAOsOqTMCxrwsN339agbmEB+wBAJk/MlK95ggxuwCs+g
         UKpBVHX26s56amxpiUOIg334AWTyVmPRRLRvSb/J4NV9EJAYfaAww/GKZ0IlXBc2ndDo
         aUDXV09PF3J9B7Z1/Y/5z89Fi1TPX09VnGv/3QtFaMyfZDFbSd57FkfG4Hm4qK2DAYOO
         AKtHI0/zpfNBbat4c2prezecgdpclTP2e6JquT7e1gSRTeVDW0rF8wKPB38+kkdPBWLD
         z9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745580721; x=1746185521;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDHnSfsfm8Pky45upkoSAPit3VP8lTu/pCNcAlnlmqU=;
        b=ss8Xh71hUR5R03E3gUrE155oS1lFFFzVVbhJpyMlEW5lJnYh46AJljQJnZSjLeLnJy
         y0mKJKoxLXYHQei3OYQEMXvvGXMy9U0iUMLNxTz/T7Yf3PDuQv14myYSXrE47i0n71Ml
         qWp8+6i5NvMbAS0c1ymH71CREFzTHKZcdwwMIIRDu4ICPj7SbK6e4toDslYYzLECl2SU
         YPC1ymF/L49AW25FPJyO2nTcQUaXpnE4j/rz8FOlLuYOO7x7mnF+bz+TKbmGpf+gEKV9
         ytolc2YVvbIEsQEmrU/TsWCZmsbr7BHa7A5nQ57ph7dA3eZK/9+l1JVMjOoH93cnXvxE
         2AuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCU2ua6afu94Hp6A9C7y3pMnLzFElWCcUdLkGqJ0ublNupdGsZPF4N5yfBwfDfTasaaX75J6M4k1HHwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfg/7LAy2uY8NYc+1SFXbysXDTQcgNfOaff2dXxzx4j8ZRq7SP
	FHRkqCKWASny0yO1D2V/fPgoqJaT+7Jm8DUE+4819/0z9nA8CnRAwPCT2Em9Boo=
X-Gm-Gg: ASbGnctNeVW/tVsde/e7hgoKSh9GbyoBs4S9mMzROXXRXx43klFmt6MzwYWrJw+DF6U
	8UHVBti5tiLmbY8y3PaHt3N3RYV98LDHt4d5GT4Ylnu8BzsI2dI9A9t9+fYctDUC0gMWO2G6eNL
	thd/1l/JExMdv3Ff4TRzrGoAm41LTDRqn9mlUAx61gqzcTthgJcDvidUJq0BogM9mXJjfGa0knA
	u3AS/3QkBfsLCCJhTQpkwNuAUDVAiTQSGGBM1OIzQGIpNNCydOlYN3t9xv+JrKylJ5oDVmt+LCq
	a3wYIQuEofaAJWsbEfTppXqiGCHirAEm88cI8RNJP+3mHtHG
X-Google-Smtp-Source: AGHT+IHRqf93ViQDABDgGhAB9vrTQizaMXk/z0DioGF+r4Jf0pl8X7PBzUSEYnMZMSBPSRe+pddQCw==
X-Received: by 2002:a05:6000:420a:b0:3a0:6bd0:a4b0 with SMTP id ffacd0b85a97d-3a074e0e122mr528393f8f.2.1745580720995;
        Fri, 25 Apr 2025 04:32:00 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:84a3:2b0a:bdb8:ce08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5d479sm2137879f8f.92.2025.04.25.04.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:32:00 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 25 Apr 2025 13:32:00 +0200
Message-Id: <D9FOQ0C9HMIR.17FERF6F7C8LR@ventanamicro.com>
Subject: Re: [PATCH v12 05/28] riscv: usercfi state for task and
 save/restore of CSR_SSP on trap entry/exit
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Conor Dooley" <conor@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Eric Biederman" <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann
 Horn" <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "Zong Li"
 <zong.li@sifive.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-5-e51202b53138@rivosinc.com>
 <D92WQWAUQYY4.2ED8JAFBDHGRN@ventanamicro.com>
 <aAmEnK0vSgZZOORL@debug.ba.rivosinc.com>
 <D9EV1K8ZQQJR.20CRTYLQBN9UE@ventanamicro.com>
 <aAp9D7txw8y9WL5m@debug.ba.rivosinc.com>
In-Reply-To: <aAp9D7txw8y9WL5m@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_043202_933136_D53EC67A 
X-CRM114-Status: GOOD (  16.79  )
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

MjAyNS0wNC0yNFQxMTowMzo1OS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFRodSwgQXByIDI0LCAyMDI1IGF0IDAyOjE2OjMyUE0gKzAyMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPj4yMDI1LTA0LTIzVDE3OjIzOjU2LTA3OjAwLCBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+PiBPbiBUaHUsIEFwciAxMCwgMjAyNSBhdCAwMTowNDoz
OVBNICswMjAwLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+Pj4yMDI1LTAzLTE0VDE0OjM5OjI0
LTA3OjAwLCBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+Pj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnku
Uwo+Pj4+PiBAQCAtMTQ3LDYgKzE0NywyMCBAQCBTWU1fQ09ERV9TVEFSVChoYW5kbGVfZXhjZXB0
aW9uKQo+Pj4+Pgo+Pj4+PiAgCVJFR19MIHMwLCBUQVNLX1RJX1VTRVJfU1AodHApCj4+Pj4+ICAJ
Y3NycmMgczEsIENTUl9TVEFUVVMsIHQwCj4+Pj4+ICsJLyoKPj4+Pj4gKwkgKiBJZiBwcmV2aW91
cyBtb2RlIHdhcyBVLCBjYXB0dXJlIHNoYWRvdyBzdGFjayBwb2ludGVyIGFuZCBzYXZlIGl0IGF3
YXkKPj4+Pj4gKwkgKiBaZXJvIENTUl9TU1AgYXQgdGhlIHNhbWUgdGltZSBmb3Igc2FuaXRpemF0
aW9uLgo+Pj4+PiArCSAqLwo+Pj4+PiArCUFMVEVSTkFUSVZFKCJub3A7IG5vcDsgbm9wOyBub3Ai
LAo+Pj4+PiArCQkJCV9fc3RyaW5naWZ5KAkJCVwKPj4+Pj4gKwkJCQlhbmRpIHMyLCBzMSwgU1Jf
U1BQOwlcCj4+Pj4+ICsJCQkJYm5leiBzMiwgc2tpcF9zc3Bfc2F2ZTsJXAo+Pj4+PiArCQkJCWNz
cnJ3IHMyLCBDU1JfU1NQLCB4MDsJXAo+Pj4+PiArCQkJCVJFR19TIHMyLCBUQVNLX1RJX1VTRVJf
U1NQKHRwKTsgXAo+Pj4+PiArCQkJCXNraXBfc3NwX3NhdmU6KSwKPj4+Pj4gKwkJCQkwLAo+Pj4+
PiArCQkJCVJJU0NWX0lTQV9FWFRfWklDRklTUywKPj4+Pj4gKwkJCQlDT05GSUdfUklTQ1ZfVVNF
Ul9DRkkpCj4+Pj4KPj4+PihJJ2QgcHJlZmVyIHRoaXMgY2xvc2VyIHRvIHRoZSB1c2VyX3NwIGFu
ZCBrZXJuZWxfc3Agc3dhcCwgaXQncyBicmVha2luZwo+Pj4+IHRoZSBmbG93IGhlcmUuICBXZSBh
bHNvIGFscmVhZHkga25vdyBpZiB3ZSd2ZSByZXR1cm5lZCBmcm9tIHVzZXJzcGFjZQo+Pj4+IG9y
IG5vdCBldmVuIHdpdGhvdXQgU1JfU1BQLCBidXQgcmV1c2luZyB0aGUgaW5mb3JtYXRpb24gbWln
aHQgdGFuZ2xlCj4+Pj4gdGhlIGxvZ2ljLikKPj4+Cj4+PiBJZiBDU1JfU0NSQVRDSCB3YXMgMCwg
dGhlbiB3ZSB3b3VsZCBiZSBjb21pbmcgZnJvbSBrZXJuZWwgZWxzZSBmbG93IGdvZXMKPj4+IHRv
IGAuTHNhdmVfY29udGV4dGAuIElmIHdlIHdlcmUgY29taW5nIGZyb20ga2VybmVsIG1vZGUsIHRo
ZW4gZXZlbnR1YWxseQo+Pj4gZmxvdyBtZXJnZXMgdG8gYC5Mc2F2ZV9jb250ZXh0YC4KPj4+Cj4+
PiBTbyB3ZSB3aWxsIGJlIHNhdmluZyBDU1JfU1NQIG9uIGFsbCBrZXJuZWwgLS0gPiBrZXJuZWwg
dHJhcCBoYW5kbGluZy4gVGhhdAo+Pj4gd291bGQgYmUgdW5uZWNlc3NhcnkuIElJUkMsIHRoaXMg
d2FzIG9uZSBvZiB0aGUgZmlyc3QgcmV2aWV3IGNvbW1lbnRzIGluCj4+PiBlYXJseSBSRkMgc2Vy
aWVzIG9mIHRoZXNlIHBhdGNoIHNlcmllcyAodG8gbm90IHRvdWNoIENTUl9TU1AgdW4tbmVjZXNz
YXJpbHkpCj4+Pgo+Pj4gV2UgY2FuIGF2b2lkIHRoYXQgYnkgZW5zdXJpbmcgd2hlbiB3ZSBicmFu
Y2ggYnkgZGV0ZXJtaW5pbmcgaWYgd2UgYXJlIGNvbWluZwo+Pj4gZnJvbSB1c2VyIHRvIHNvbWV0
aGluZyBsaWtlIGAuTHNhdmVfc3NwYCB3aGljaCBldmVudHVhbGx5IG1lcmdlcyBpbnRvCj4+PiAi
LkxzYXZlX2NvbnRleHQiLiBBbmQgaWYgd2Ugd2VyZSBjb21pbmcgZnJvbSBrZXJuZWwgdGhlbiB3
ZSB3b3VsZCBicmFuY2ggdG8KPj4+IGAuTHNhdmVfY29udGV4dGAgYW5kIHRodXMgc2tpcHBpbmcg
c3NwIHNhdmUgbG9naWMuIEJ1dCAjIG9mIGJyYW5jaGVzIGl0Cj4+PiBpbnRyb2R1Y2VzIGluIGVh
cmx5IGV4Y2VwdGlvbiBoYW5kbGluZyBpcyBlcXVpdmFsZW50IHRvIHdoYXQgY3VycmVudCBwYXRj
aGVzCj4+PiBkby4gU28gSSBkb24ndCBzZWUgYW55IHZhbHVlIGluIGRvaW5nIHRoYXQuCj4+Pgo+
Pj4gTGV0IG1lIGtub3cgaWYgSSBhbSBtaXNzaW5nIHNvbWV0aGluZy4KPj4KPj5SaWdodCwgaXQn
cyBoYXJkIHRvIGF2b2lkIHRoZSBleHRyYSBicmFuY2hlcy4KPj4KPj5JIHRoaW5rIHdlIGNvdWxk
IG1vZGlmeSB0aGUgZW50cnkgcG9pbnQgKFNUVkVDKSwgc28gd2Ugc3RhcnQgYXQKPj5kaWZmZXJl
bnQgcGF0aHMgYmFzZWQgb24ga2VybmVsL3VzZXJzcGFjZSB0cmFwIGFuZCBvbmx5IGp1bXAgb25j
ZSB0byB0aGUKPj5jb21tb24gY29kZSwgbGlrZToKPj4KPj4gIFNZTV9DT0RFX1NUQVJUKGhhbmRs
ZV9leGNlcHRpb25fa2VybmVsKQo+PiAgICAvKiBrZXJuZWwgc2V0dXAgbWFnaWMgKi8KPj4gICAg
aiBoYW5kbGVfZXhjZXB0aW9uX2NvbW1vbgo+PiAgU1lNX0NPREVfU1RBUlQoaGFuZGxlX2V4Y2Vw
dGlvbl91c2VyKQo+PiAgICAvKiB1c2Vyc3BhY2Ugc2V0dXAgbWFnaWMgKi8KPj4gIGhhbmRsZV9l
eGNlcHRpb25fY29tbW9uOgo+Cj4gSG1tLi4uIFRoaXMgY2FuIGJlIGRvbmUuIEJ1dCB0aGVuIGl0
IHdvdWxkIHJlcXVpcmUgdG8gY29uc3RhbnRseSBtb2RpZnkgYHN0dmVjYAo+IFdoZW4geW91J3Jl
IGdvaW5nIGJhY2sgdG8gdXNlciBtb2RlLCB5b3Ugd291bGQgaGF2ZSB0byB3cml0ZSBgc3R2ZWNg
IHdpdGggYWRkcgo+IG9mIGBoYW5kbGVfZXhjZXB0aW9uX3VzZXJgLgoKV2UnZCBqdXN0IGJlIHdy
aXRpbmcgU1RWRUMgaW5zdGVhZCBvZiBTU0NSQVRDSCwgcHJvYmFibHkgYXQgdGhlIHZlcnkKc2Ft
ZSBwbGFjZXMuCkl0J3MgcG9zc2libGUgdGhhdCBzb21lIG1pY3JvLWFyY2hpdGVjdHVyZXMgd2ls
bCBiZSBkaXN0dXJiZWQgbW9yZSBieQp3cml0aW5nIFNUVkVDIHRoYW4gU1NDUkFUQ0gsIHRob3Vn
aCwgc28gaXQncyBub3QgYW4gZWFzeSBjaGFuZ2UgdG8gbWFrZS4KCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEJ1dCB0aGVuIHlvdSBjYW4gZWFzaWx5IGdldCBhIE5NSS4gSXQgY2FuIGJl
Y29tZQo+IHVnbHkuIE5lZWRzIG11Y2ggbW9yZSB0aG91Z2h0IGFuZCBvbiBmaXJzdCBnbGFuY2Ug
ZmVlbHMgZXJyb3IgcHJvbmUuCgpZZWFoLCB0aGUgTS1tb2RlIExpbnV4IGFkZHMgYSBsb3Qgb2Yg
ZnVuLiAgSSBkb24ndCBzZWUgc3VwcG9ydCBmb3IgdGhlClNtcm5taSBleHRlbnNpb24sIHNvIHVu
bHVja3kgTk1JcyBzaG91bGQgYmUgZmF0YWwgZXZlbiBub3cuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
