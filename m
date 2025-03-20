Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11368C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 23:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4HAjpfsVC/ZGdKrq6Jj6Oy1jS28eBj8rNLr1qPV3do=; b=gf/HdSRIRBgygn
	peE7fJWcYV4y0DEj0rRjfDMRVVh6Rc/Mn367omky2teejnt/IGVEvrzE6fBWSibfnx2PH8Pg6b4jQ
	tPNu/MOyTVR02HXBPjZNPB7zOcWWFt+OdV4ZM/5I8hz2SCUiK0CJBi24Z7NXdi7DDiand3nbC73rL
	afamLNR7nMp8B8X436o3IyUaKGHZpB6TdjDICTQtsVVt4N/EAy68zz+lKLLkVfkiIvZq7fyGwPfwi
	2eUwZUPbh7negCqYsm/27HmJfeq/9NWOleO8oIzhgH3o1usIPj27tYbeTBAShi1ekpRX11l6M/ywE
	+1RWwCjRQulLdRa/5Pnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvP0z-0000000DR5e-2sDv;
	Thu, 20 Mar 2025 23:09:29 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvP0x-0000000DR4c-0HvR
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 23:09:28 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6f74b78df93so15824797b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 16:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742512166; x=1743116966; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsQLaUzZKjouDcBV/YPUh/MkwoWlaLe69i4Or3Hkjms=;
        b=UB7DCryAglETyrO49B6hLBB06w+/4reCTDRdV/U0Vqykq5pO2HIu2RXi6CgQGUNp2W
         MMCUgPWQwAaGu7YnORgO+ahwBr7oBtNdSeHMasbF2gGrSd/b3x32slAbLWLGSVNB6A98
         sWpSPQTRKCCaTsbjRPV7OZrifc56exKiOGhWcNfh3gJfPeDPZ7WCsnOpVE8HlVHKa683
         tTfLLOhwcgG03OB9/i5VN98TlIEeqJmX+z/Hg8CmN4BWWN4lWVohPrykfFnKAVd7bOsZ
         dR66ak4wA8tywFg9R0DjXIRmGCmstoznNRzivI3MuyY95mR7q/XMf3RG/aSFP2NqNitA
         /21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742512166; x=1743116966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsQLaUzZKjouDcBV/YPUh/MkwoWlaLe69i4Or3Hkjms=;
        b=FmxlNQSsTJJZR5iiVbNmBeGhBzaFdJlHjwYjn80sLA84j1uf6DJ8HVm+mDwYcBbp5J
         Jf5CRwB110viOQ3BG++oRn7JG3SZPF+UYrTf/Px2AWlecT3DxHI9Ka9lybJEgelIIcZM
         JgIwcGmNw887MdzFZ/PllGTEK09KWDgoUnJS6U6KMdTxzWVWtHosnuRil/A+Q+nJ7Skt
         hax8a5XkoJnCBzVKHerteAMM/4Bykx8TXup9PvQN6sj4HuA2z/m3JDOb7Q2Snsm/rF0x
         l2OOlp42Gz8H6JGtRqkTekBn8E/EIYM4P6o4PC1NaiY+p1C5XSQ0bS6NJTwDyl1pfePt
         lkFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBVRXM0qYmy1dyg+q0WpfLL9NC4etXlv1poAGMb/e+x8bziepA7LepQ58ZEXF2phkdMvUIMsJjZFZh2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcFupJRNWVuJllOl4v6JvGqDPQnizAAf5qo+Iq4rJl0rQ2yXdQ
	4wvsCsTKNTw1GK981dtfSpVGGrw3yUrmtVLEc8/lWAaouDQqn6TbtGzgPhKJfS/81TZx2MnEBTZ
	LuLx8UnpqMLq6iTEV8R7FA/OS2WeXgtMeUa5lfA==
X-Gm-Gg: ASbGncu0EGANYZ/epI1SHZUNAtA4FLVinyvakGREULxXgxJq3xGqEoT1k7hu9D2ko96
	7dvnCve/hV3l98EeeSSoo4BSiVNzkFI95gz/Q+Fh8hCa3vxG1TldUmzt307UB5bBK1vNsbNvcgp
	4nzyoOXUwaC8JbYweMvgR95NoRbdR744IkjY2fTw==
X-Google-Smtp-Source: AGHT+IFDRrLxIAnQM1sktWzlO7b7dXnBgFLapHyMV4vMjPpWfJaidUEdMv15+RgA77Z60kHjKJe06Yio1uLKOlCq2sA=
X-Received: by 2002:a05:690c:9a05:b0:6fb:277f:f022 with SMTP id
 00721157ae682-700bac63638mr18849517b3.15.1742512166144; Thu, 20 Mar 2025
 16:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-19-e51202b53138@rivosinc.com> <D8LG1TTBMPWX.3MKAEM8X1WYAX@ventanamicro.com>
In-Reply-To: <D8LG1TTBMPWX.3MKAEM8X1WYAX@ventanamicro.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 20 Mar 2025 16:09:12 -0700
X-Gm-Features: AQ5f1JreP6HXwpJ5ynf6jYICgHmcVMtUgEM9ETC-KUSuZNcuhzZ0eOngfgfDvqY
Message-ID: <CAKC1njQ8P2mNiiev-NDyTJPjJ6AAVqrtHMcwt_sc5A7Z+3-Jrg@mail.gmail.com>
Subject: Re: [PATCH v12 19/28] riscv/ptrace: riscv cfi status and state via
 ptrace and in core files
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_160927_108595_5D9EB981 
X-CRM114-Status: GOOD (  24.02  )
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

T24gVGh1LCBNYXIgMjAsIDIwMjUgYXQgMzoyNOKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDMtMTRUMTQ6Mzk6MzgtMDc6MDAs
IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPiA+IEV4cG9zZSBhIG5ldyByZWdp
c3RlciB0eXBlIE5UX1JJU0NWX1VTRVJfQ0ZJIGZvciByaXNjLXYgY2ZpIHN0YXR1cyBhbmQKPiA+
IHN0YXRlLiBJbnRlbnRpb25hbGx5IGJvdGggbGFuZGluZyBwYWQgYW5kIHNoYWRvdyBzdGFjayBz
dGF0dXMgYW5kIHN0YXRlCj4gPiBhcmUgcm9sbGVkIGludG8gY2ZpIHN0YXRlLiBDcmVhdGluZyB0
d28gZGlmZmVyZW50IE5UX1JJU0NWX1VTRVJfWFhYIHdvdWxkCj4gPiBub3QgYmUgdXNlZnVsIGFu
ZCB3YXN0YWdlIG9mIGEgbm90ZSB0eXBlLiBFbmFibGluZyBvciBkaXNhYmxpbmcgb2YgZmVhdHVy
ZQo+ID4gaXMgbm90IGFsbG93ZWQgdmlhIHB0cmFjZSBzZXQgaW50ZXJmYWNlLiBIb3dldmVyIHNl
dHRpbmcgYGVscGAgc3RhdGUgb3IKPiA+IHNldHRpbmcgc2hhZG93IHN0YWNrIHBvaW50ZXIgYXJl
IGFsbG93ZWQgdmlhIHB0cmFjZSBzZXQgaW50ZXJmYWNlLiBJdCBpcwo+ID4gZXhwZWN0ZWQgYGdk
YmAgbWlnaHQgaGF2ZSB1c2UgdG8gZml4dXAgYGVscGAgc3RhdGUgb3IgYHNoYWRvdyBzdGFja2AK
PiA+IHBvaW50ZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0By
aXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRy
YWNlLmggfCAxOCArKysrKysrKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jICAgICAg
ICAgICB8IDgzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGluY2x1
ZGUvdWFwaS9saW51eC9lbGYuaCAgICAgICAgICAgICB8ICAxICsKPiA+ICAzIGZpbGVzIGNoYW5n
ZWQsIDEwMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9wdHJhY2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJh
Y2UuaAo+ID4gaW5kZXggNjU5ZWEzYWY1NjgwLi5lNjU3MWZiYThhOGEgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmgKPiA+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2UuaAo+ID4gQEAgLTEzMSw2ICsxMzEsMjQgQEAgc3Ry
dWN0IF9fc2NfcmlzY3ZfY2ZpX3N0YXRlIHsKPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgc3NfcHRy
OyAgIC8qIHNoYWRvdyBzdGFjayBwb2ludGVyICovCj4gPiAgfTsKPiA+Cj4gPiArc3RydWN0IF9f
Y2ZpX3N0YXR1cyB7Cj4gPiArICAgICAvKiBpbmRpcmVjdCBicmFuY2ggdHJhY2tpbmcgc3RhdGUg
Ki8KPiA+ICsgICAgIF9fdTY0IGxwX2VuIDogMTsKPiA+ICsgICAgIF9fdTY0IGxwX2xvY2sgOiAx
Owo+ID4gKyAgICAgX191NjQgZWxwX3N0YXRlIDogMTsKPiA+ICsKPiA+ICsgICAgIC8qIHNoYWRv
dyBzdGFjayBzdGF0dXMgKi8KPiA+ICsgICAgIF9fdTY0IHNoc3RrX2VuIDogMTsKPiA+ICsgICAg
IF9fdTY0IHNoc3RrX2xvY2sgOiAxOwo+Cj4gSSByZW1lbWJlciB0aGVyZSB3YXMgZGVlcCBoYXRy
ZWQgdG93YXJkcyBiaXRmaWVsZHMgaW4gdGhlIExpbnV4Cj4gY29tbXVuaXR5LCBoYXZlIHRoaW5n
cyBjaGFuZ2VzPwoKaG1tLiBJIGRpZG4ndCBrbm93IGFib3V0IHRoZSBzdHJvbmcgaGF0cmVkLgpB
bHRob3VnaCBJIGNhbiBzZWUgbG90cyBvZiBleGFtcGxlcyBvZiB0aGlzIHBhdHRlcm4gaW4gZXhp
c3Rpbmcga2VybmVsIGNvZGUuCk5vIHN0cm9uZyBmZWVsaW5ncyBvbiBteSBzaWRlLCBJIGNhbiBj
aGFuZ2UgdGhpcyBhbmQgaGF2ZSBpdCBzaW5nbGUgNjRiaXQgZmllbGQKYW5kIGFjY2Vzc2VkIHZp
YSBiaXRtYXNrcy4KCj4KPiA+ICsgICAgIF9fdTY0IHJzdmQgOiBzaXplb2YoX191NjQpIC0gNTsK
Pgo+IEkgdGhpbmsgeW91IG1lYW50ICI2NCAtIDUiLgoKZWVoLiBiYWQgYnVnLiB0aGFua3MuCgo+
Cj4gPiArfTsKPiA+ICsKPiA+ICtzdHJ1Y3QgdXNlcl9jZmlfc3RhdGUgewo+ID4gKyAgICAgc3Ry
dWN0IF9fY2ZpX3N0YXR1cyAgICAgY2ZpX3N0YXR1czsKPiA+ICsgICAgIF9fdTY0IHNoc3RrX3B0
cjsKPiA+ICt9Owo+ID4gKwo+ID4gICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KPiA+Cj4gPiAg
I2VuZGlmIC8qIF9VQVBJX0FTTV9SSVNDVl9QVFJBQ0VfSCAqLwo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMKPiA+
IEBAIC0yMjQsNiArMjk3LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNlcl9yZWdzZXQgcmlz
Y3ZfdXNlcl9yZWdzZXRbXSA9IHsKPiA+ICAgICAgICAgICAgICAgLnNldCA9IHRhZ2dlZF9hZGRy
X2N0cmxfc2V0LAo+ID4gICAgICAgfSwKPiA+ICAjZW5kaWYKPiA+ICsjaWZkZWYgQ09ORklHX1JJ
U0NWX1VTRVJfQ0ZJCj4gPiArICAgICBbUkVHU0VUX0NGSV0gPSB7Cj4gPiArICAgICAgICAgICAg
IC5jb3JlX25vdGVfdHlwZSA9IE5UX1JJU0NWX1VTRVJfQ0ZJLAo+ID4gKyAgICAgICAgICAgICAu
YWxpZ24gPSBzaXplb2YoX191NjQpLAo+ID4gKyAgICAgICAgICAgICAubiA9IHNpemVvZihzdHJ1
Y3QgdXNlcl9jZmlfc3RhdGUpIC8gc2l6ZW9mKF9fdTY0KSwKPiA+ICsgICAgICAgICAgICAgLnNp
emUgPSBzaXplb2YoX191NjQpLAo+Cj4gV2h5IG5vdCBgc2l6ZSA9IHNpemVvZihzdHJ1Y3QgdXNl
cl9jZmlfc3RhdGUpYCBhbmQgYG4gPSAxYD8KCnllYWggYW5vdGhlciBnb29kIGNhdGNoLgpTaG91
bGQgd3JpdGUgYSBrc2VsZnRlc3QgYWdhaW5zdCBpdCwgc28gdGhhdCBpdCBjYW4gYmUgY2F1Z2h0
LgoKPgo+ID4gKyAgICAgICAgICAgICAucmVnc2V0X2dldCA9IHJpc2N2X2NmaV9nZXQsCj4gPiAr
ICAgICAgICAgICAgIC5zZXQgPSByaXNjdl9jZmlfc2V0LAo+ID4gKyAgICAgfSwKPiA+ICsjZW5k
aWYKPgo+IFtJIGhhdmVuJ3QgeWV0IHJldmlld2VkIGlmIGEgbmV3IHJlZ2lzdGVyIGlzIHRoZSBy
aWdodCB0aGluZyB0byBkbyBub3IKPiAgbG9va2VkIGF0IHRoZSByZXN0IG9mIHRoZSBwYXRjaC5d
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
