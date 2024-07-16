Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1066C3DA59
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 06:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZwMSHzKXto1LOMQAlpxZXgxWeyeZvpHLcnZsrikOP4=; b=wYw8H9H+2TRH5G
	25zzmVcnpxiWPLv9rLclo0vlE6eOtHLplI+CtuLr4EM+qHuceUjdvYAsHpUISRKWj8fEiUXIHBT+2
	QJIH3efWbp1ZHUnlJStSKv38eWiT2aH2p5rsG2VRpU7x6TZiEGo4Bm5tQkjhrdgwdeEyX+t82pmXc
	olLcr5s8mGYEhuLLm693JN/DnaI9VEAVsOqMilyTTDLyg/HfNsAAZABhMRm0iieHixs/2ml5JDv9R
	boky43mhXeXUDGvLMbzPJ+x+ggdB4W8oZrgRUpWfEuH42YBztPxydXG7bj+MGhOiZA60NGa/4oGix
	LUx18Py54naEFysqrLFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTbuB-00000009Ua8-31cI;
	Tue, 16 Jul 2024 06:43:19 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTbu8-00000009UZD-00C4
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 06:43:17 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-59f7fc89201so5032a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jul 2024 23:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721112194; x=1721716994; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCRSoAuECKcouO/voz6zEzYgSUjC3FMdxbyfDTdU7og=;
        b=JrdN0w69aM8gPJxa3tUEEbObw8VLC7s7N/ZC1oyAsFixXPAzWwsl9ig2A/VdXnF+A2
         YXILjJBaueBmglnQiQZnwXhYQMXz1dHgAus6bGGgkARIrcswC+JrmZkBbVPZG4LZQ4WI
         NoX8JvqfqDoeNnZ5lyP7CmFwOKw6RMyC9rDfcPPJ98M7HiN2GV5QnCpnNkQqqisCVvVa
         6DujR7isT4AqGHukwl9wMkNU3iqUclGmB/KH4EcXa3KtVCGfFerXPcpq534hCcP+Bi88
         Z7Fl+g5snoKHp3ODZUSNb5TTGHyGI6astHfVXike8Rv9sJADovzGekmrnvnj0+iV+XM+
         3haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721112194; x=1721716994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCRSoAuECKcouO/voz6zEzYgSUjC3FMdxbyfDTdU7og=;
        b=jYSFlde3JPjUNUhh2YAhyfIsKBIAx7uuWGJavCCtVS9kQM3FUyMX5lbLhzIbEaDJMh
         2OA40/Srcen8UpC2Igl2eBzcOWory3w4tKLV3lubNnIt9p40OEk0lVjFHkdvBMzQyR1c
         E6JC5AjGebdHYEfz/mpVlcyyME6jJbxcKgYtnGBrTI2ootp9049bdDJnRNYbam5vDkzC
         NFrhj9QZ848N4OGMiKNsqXajoudHds1pYTIZiIPxIPSyf+28gXzWH1NAVPhtOVb6togd
         CEtx47ComkDPweudTMkkD4uYTnaqfaV+UUlAsyQIVlqNXa9liEY8+7wu1gxqc3enB/9o
         LLuA==
X-Forwarded-Encrypted: i=1; AJvYcCVhvqSF4/zaw1M5kfMctcCz/YRTr7fjHfUW8PSmWqm0cX3QRSJMuCrZjfzshWfSYskuvkSdvOIZ6ojDZcP52ZON2xNct14rfoThzcJ0CnwS
X-Gm-Message-State: AOJu0Yz9c2NzOwCp9zUu4EzQAxrMBvL34TngZBI5FWda9sULv+mNiII6
	hLDeKaMR4jwyUf1FpBTXLzewVF5bGDd6nmyLAsY1UP19fIVQ35Bcbv113KqNUnUPEWpI62CyiPT
	KgEotz2XmSD/JJWERROag4xvqPQf2CY+y8F7xm2WLoNOPnah4nQc=
X-Google-Smtp-Source: AGHT+IGqVByFr0luOwoskb/AgZKNB8jHzqqvJMaLn4zx34p82HWK9+YsdjHaH5Pd8zOz5r4AWhXGqXuvh7iA0eU4fIA=
X-Received: by 2002:a17:906:c784:b0:a72:676a:7d7b with SMTP id
 a640c23a62f3a-a79ea3da90fmr69418966b.9.1721112194052; Mon, 15 Jul 2024
 23:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-11-alexghiti@rivosinc.com> <CAJF2gTSG7HzV7mgZpkWLbSBNn2dRv_NaSmCimd+kRdU=EZrmmg@mail.gmail.com>
 <CAHVXubizLq=qZgVQ2vBFe5zVuLRP0DGw=UN4U_Wkx2P2xsP3Mw@mail.gmail.com>
 <a096151c-c349-455f-8939-3b739d73f016@redhat.com> <CAJF2gTRrZwVk2xyhF_PsJGKCfkvun-rifG8MjDBcGDt3YBuhPg@mail.gmail.com>
In-Reply-To: <CAJF2gTRrZwVk2xyhF_PsJGKCfkvun-rifG8MjDBcGDt3YBuhPg@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 16 Jul 2024 08:43:02 +0200
Message-ID: <CAHVXubh00OyazGP2C6sg0N2=kWqV-HXpzEiZCDdex8hcmLEM2g@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] riscv: Add qspinlock support based on Zabha extension
To: Guo Ren <guoren@kernel.org>
Cc: Waiman Long <longman@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_234316_337085_8647642A 
X-CRM114-Status: GOOD (  32.70  )
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

SGkgR3VvLCBXYWltYW4sCgpPbiBUdWUsIEp1bCAxNiwgMjAyNCBhdCAzOjA14oCvQU0gR3VvIFJl
biA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgMTYsIDIwMjQgYXQg
MzozMOKAr0FNIFdhaW1hbiBMb25nIDxsb25nbWFuQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+
IE9uIDcvMTUvMjQgMDM6MjcsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+ID4gSGkgR3VvLAo+
ID4gPgo+ID4gPiBPbiBTdW4sIEp1bCA3LCAyMDI0IGF0IDQ6MjDigK9BTSBHdW8gUmVuIDxndW9y
ZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+PiBPbiBXZWQsIEp1biAyNiwgMjAyNCBhdCA5OjE0
4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+
ID4+PiBJbiBvcmRlciB0byBwcm9kdWNlIGEgZ2VuZXJpYyBrZXJuZWwsIGEgdXNlciBjYW4gc2Vs
ZWN0Cj4gPiA+Pj4gQ09ORklHX0NPTUJPX1NQSU5MT0NLUyB3aGljaCB3aWxsIGZhbGxiYWNrIGF0
IHJ1bnRpbWUgdG8gdGhlIHRpY2tldAo+ID4gPj4+IHNwaW5sb2NrIGltcGxlbWVudGF0aW9uIGlm
IFphYmhhIGlzIG5vdCBwcmVzZW50Lgo+ID4gPj4+Cj4gPiA+Pj4gTm90ZSB0aGF0IHdlIGNhbid0
IHVzZSBhbHRlcm5hdGl2ZXMgaGVyZSBiZWNhdXNlIHRoZSBkaXNjb3Zlcnkgb2YKPiA+ID4+PiBl
eHRlbnNpb25zIGlzIGRvbmUgdG9vIGxhdGUgYW5kIHdlIG5lZWQgdG8gc3RhcnQgd2l0aCB0aGUg
cXNwaW5sb2NrCj4gPiA+PiBUaGF0J3Mgbm90IHRydWU7IHdlIHRyZWF0IHNwaW5sb2NrIGFzIHFz
cGlubG9jayBhdCBmaXJzdC4KPiA+ID4gVGhhdCdzIHdoYXQgSSBzYWlkOiB3ZSBoYXZlIHRvIHVz
ZSB0aGUgcXNwaW5sb2NrIGltcGxlbWVudGF0aW9uIGF0Cj4gPiA+IGZpcnN0ICpiZWNhdXNlKiB3
ZSBjYW4ndCBkaXNjb3ZlciB0aGUgZXh0ZW5zaW9ucyBzb29uIGVub3VnaCB0byB1c2UKPiA+ID4g
dGhlIHJpZ2h0IHNwaW5sb2NrIGltcGxlbWVudGF0aW9uIGJlZm9yZSB0aGUga2VybmVsIHVzZXMg
YSBzcGlubG9jay4KPiA+ID4gQW5kIHNpbmNlIHRoZSBzcGlubG9ja3MgYXJlIHVzZWQgKmJlZm9y
ZSogdGhlIGRpc2NvdmVyeSBvZiB0aGUKPiA+ID4gZXh0ZW5zaW9ucywgd2UgY2Fubm90IHVzZSB0
aGUgY3VycmVudCBhbHRlcm5hdGl2ZSBtZWNoYW5pc20gb3Igd2UnZAo+ID4gPiBuZWVkIHRvIGV4
dGVuZCBpdCB0byBhZGQgYW4gImluaXRpYWwiIHZhbHVlIHdoaWNoIGRvZXMgbm90IGRlcGVuZCBv
bgo+ID4gPiB0aGUgYXZhaWxhYmxlIGV4dGVuc2lvbnMuCj4gPgo+ID4gV2l0aCBxc3BpbmxvY2ss
IHRoZSBsb2NrIHJlbWFpbnMgemVybyBhZnRlciBhIGxvY2svdW5sb2NrIHNlcXVlbmNlLiBUaGF0
Cj4gPiBpcyBub3QgdGhlIGNhc2Ugd2l0aCB0aWNrZXQgbG9jay4gQXNzdW1pbmcgdGhhdCBhbGwg
dGhlIGRpc2NvdmVyeSB3aWxsCj4gPiBiZSBkb25lIGJlZm9yZSBTTVAgYm9vdCwgdGhlIHFzcGlu
bG9jayBzbG93cGF0aCB3b24ndCBiZSBhY3RpdmF0ZWQgYW5kCj4gPiBzbyB3ZSBkb24ndCBuZWVk
IHRoZSBwcmVzZW5jZSBvZiBhbnkgZXh0ZW5zaW9uLiBJIGJlbGlldmUgdGhhdCBpcyB0aGUKPiA+
IG1haW4gcmVhc29uIHdoeSBxc3BpbmxvY2sgaXMgdXNlZCBhcyB0aGUgaW5pdGlhbCBkZWZhdWx0
IGFuZCBub3QgdGlja2V0Cj4gPiBsb2NrLgo+IFRoeCBXYWltYW4sCj4gWWVzLCBxc3BpbmxvY2sg
aXMgYSBjbGVhbiBndXksIGJ1dCB0aWNrZXQgbG9jayBpcyBhIGRpcnR5IG9uZS4KCkd1eXMsIHdl
IGFsbCBhZ3JlZSBvbiB0aGF0LCB0aGF0J3Mgd2h5IEkga2VwdCB0aGlzIGJlaGF2aW91ciBpbiB0
aGlzIHBhdGNoc2V0LgoKPgo+IEhpIEFsZXhhbmRyZSwKPiBUaGVyZWZvcmUsIHRoZSBzd2l0Y2gg
cG9pbnQoYmVmb3JlIHJlc2V0X2luaXQoKSkgaXMgbGF0ZSBlbm91Z2ggdG8KPiBjaGFuZ2UgdGhl
IGxvY2sgbWVjaGFuaXNtLCBhbmQgdGhpcyBzYXRpc2ZpZXMgdGhlIHJlcXVpcmVtZW50cyBvZgo+
IGFwcGx5X2Jvb3RfYWx0ZXJuYXRpdmVzKCksIGFwcGx5X2Vhcmx5X2Jvb3RfYWx0ZXJuYXRpdmVz
KCksIGFuZAo+IGFwcGx5X21vZHVsZV9hbHRlcm5hdGl2ZXMoKS4KCkkgY2FuJ3QgZmluZCByZXNl
dF9pbml0KCkuCgpUaGUgZGlzY292ZXJ5IG9mIHRoZSBleHRlbnNpb25zIGlzIGRvbmUgaW4gcmlz
Y3ZfZmlsbF9od2NhcCgpIGNhbGxlZApmcm9tIHNldHVwX2FyY2goKQpodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMj
TDI4OC4KU28gKmJlZm9yZSogdGhpcyBwb2ludCwgd2UgaGF2ZSBubyBrbm93bGVkZ2Ugb2YgdGhl
IGF2YWlsYWJsZQpleHRlbnNpb25zIG9uIHRoZSBwbGF0Zm9ybS4gIExldCdzIGltYWdpbmUgbm93
IHRoYXQgd2UgdXNlIGFuCmFsdGVybmF0aXZlIGZvciB0aGUgcXNwaW5sb2NrIGltcGxlbWVudGF0
aW9uLCBpdCB3aWxsIGxvb2sgbGlrZSB0aGlzCihJIHVzZSBvbmx5IHphYmhhIGhlcmUsIHRoYXQn
cyBhbiBleGFtcGxlKToKCi0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3BpbmxvY2suaAor
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NwaW5sb2NrLmgKQEAgLTE2LDggKzE2LDEyIEBA
IERFQ0xBUkVfU1RBVElDX0tFWV9UUlVFKHFzcGlubG9ja19rZXkpOwogI2RlZmluZSBTUElOTE9D
S19CQVNFX0RFQ0xBUkUob3AsIHR5cGUsIHR5cGVfbG9jaykgICAgICAgICAgICAgICAgICAgICBc
CiBzdGF0aWMgX19hbHdheXNfaW5saW5lIHR5cGUgYXJjaF9zcGluXyMjb3AodHlwZV9sb2NrIGxv
Y2spICAgICAgICAgICAgIFwKIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICAgIGlmIChzdGF0aWNfYnJh
bmNoX3VubGlrZWx5KCZxc3BpbmxvY2tfa2V5KSkgICAgICAgICAgICAgICAgICAgICBcCi0gICAg
ICAgICAgICAgICByZXR1cm4gcXVldWVkX3NwaW5fIyNvcChsb2NrKTsgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKKyAgICAgICBhc20gZ290byhBTFRFUk5BVElWRSgiaiAlW25vX3phYmhhXSIs
ICJub3AiLCAwLCAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFJJU0NWX0lTQV9FWFRfWkFCSEEsIDEpICAgICAgICAgICAgXAorICAgICAgICAg
ICAgICAgICAgICAgICAgIDogOiA6IDogbm9femFiaGEpOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICByZXR1cm4gcXVldWVkX3NwaW5fIyNvcChs
b2NrKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorbm9femFiaGE6ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
CiAgICAgICAgcmV0dXJuIHRpY2tldF9zcGluXyMjb3AobG9jayk7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKIH0KCmFwcGx5X2Vhcmx5X2Jvb3RfYWx0ZXJuYXRpdmVzKCkgY2Fu
J3QgYmUgdXNlZCB0byBwYXRjaCB0aGUgYWJvdmUKYWx0ZXJuYXRpdmUgc2luY2UgaXQgaXMgY2Fs
bGVkIGZyb20gc2V0dXBfdm0oKSwgd2F5IGJlZm9yZSB3ZSBrbm93IHRoZQphdmFpbGFibGUgZXh0
ZW5zaW9ucy4KYXBwbHlfYm9vdF9hbHRlcm5hdGl2ZXMoKSwgaW5zdGVhZCwgaXMgY2FsbGVkIGFm
dGVyIHJpc2N2X2ZpbGxfaHdjYXAoKQphbmQgdGhlbiB3aWxsIGJlIGFibGUgdG8gcGF0Y2ggdGhl
IGFsdGVybmF0aXZlcyBjb3JyZWN0bHkKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
bGF0ZXN0L3NvdXJjZS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jI0wyOTAuCgpCdXQgdGhlbiwg
YmVmb3JlIGFwcGx5X2Jvb3RfYWx0ZXJuYXRpdmVzKCksIGFueSB1c2Ugb2YgYSBzcGlubG9jawoo
cHJpbnRrIGRvZXMgc28pIHdpbGwgdXNlIGEgdGlja2V0IHNwaW5sb2NrIGltcGxlbWVudGF0aW9u
LCBhbmQgbm90CnRoZSBxc3BpbmxvY2sgaW1wbGVtZW50YXRpb24uIEhvdyBkbyB5b3UgZml4IHRo
YXQ/Cgo+Cj4gPgo+ID4gQ2hlZXJzLAo+ID4gTG9uZ21hbgo+ID4KPgo+Cj4gLS0KPiBCZXN0IFJl
Z2FyZHMKPiAgR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
