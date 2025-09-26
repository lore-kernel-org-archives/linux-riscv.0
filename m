Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD89CAC5BB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 20:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJZzg51GIxHXMvP5c73Wlz0esKBL4BNWOQJbZzvRyws=; b=N+SOEQf8Gu3qcd
	SLa/FwXOXdGPb55259zVzbdb9Pa82yU+/aV4OyCQlc5/Iw49CiCNQ+36sudSfhYjK1VAR4HyGoPa8
	/J3ZrCRJmIwPAUTuLMLbeA81QloWbFLAUng+yc4iB315ekZNjsKX2Sc6cEnAE/j8A4jQrGnUS6M40
	3EUU9W1w/9Hp3I2c8ygs9XuW6Ztj1XewR/qR7/Gjre1B8+ICnoHIEuCd5JWAAn5MXZNvf3ebsclB4
	oAWxXnp4RPQ9LBmANhNLBeAa3VvdzsZcJTvy/PoH2c7hPkmij5gIm/H34VdaifZsX79dC3M8jqCQy
	le5Q24/nZ4euMhVaRXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2F47-00000004Ije-2XiK;
	Fri, 26 Sep 2025 20:29:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2F45-00000004Iiy-3Nwt
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 20:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758918552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQdtd6aty7MhbXUeyU1S7f0YHdth4v9lOBvY3WPAYoQ=;
	b=UAqwO0/haYgLqv70vKhvH2fGzZ34TFf2QqN46SRJGuCv/J1zcL//8dA9cVCFCnCjnyYo0+
	mxYS9yUmVdFv9St0DXheRk+7KO8e+fXIVOb0d15DPbVDwZsJRHwCFYmSqQd4dk0VqzSCYl
	xKNztcBBPLXUrQN+M+gk1VdxVTHNAnY=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-h9LZtcY_MF-pkXB8YjFZLA-1; Fri, 26 Sep 2025 16:29:11 -0400
X-MC-Unique: h9LZtcY_MF-pkXB8YjFZLA-1
X-Mimecast-MFC-AGG-ID: h9LZtcY_MF-pkXB8YjFZLA_1758918550
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-54aa46b501dso1531059e0c.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Sep 2025 13:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758918550; x=1759523350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQdtd6aty7MhbXUeyU1S7f0YHdth4v9lOBvY3WPAYoQ=;
        b=qQYFevPtlHh15XmFEKwOndMrlQgDWIpBClM3HotJGUnAvE2ksaML09B/wvI0dSvQlL
         I41D8fv7vA+29TlTc0eFCoRb2xtwoHXXEtVfkYGHcD3aB8cVIrrAyLjsrty1280uKIuo
         pK18PRjEIAyPFSmRpfuW8T3sKJIstsEJV+AryomVokbg1UsrMSOrqB1b2Q1qgJEAp5ya
         m8wPKgs9N+6wHSvLcQsL4S6TAc/HTdnN2lfzUCyiZj2CVx177TXE44EtOVBIAVGPaIpQ
         B6pf07SAES9a/kqe+LmTicLZmcOCXhctjV+SsmrIlqqraApT0Qld4AEj/23JZTMgWSxx
         EnZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn5TLyID04etE4cL8TKTVU5+ABCWKnhLwXmEYyGLTqslfgMOKW2BGh5S24yU6o3Nw6+dXhbPg0SOqaGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUH7ezA+IswAElkUAs5RLMWLdwFSSlN7C/0lyk5n9ZEoNx/BP5
	BOY9HztBz2W13cUhQLOvjuV9wIcwMr1u5Xk1uS5dVz5qzOLtKLblBjp5XiY1MwVygxKtkGgL41O
	8YihUAjEiMB5WXSF47ddhmYbzu2AQ8y8TqNsz8/CU0X6uM+HlkBpXDgLTmF5gRYJm4oexKXDpAr
	GcMAZDcSgRqUAlbt99IwaEhFJFI8Od6GV/Z/JuH/nAblIh
X-Gm-Gg: ASbGncvZUGlXybE/G+YOiF3x/T1pQgdc7aqis/LqFqFKFZ+gBuMf63U2G7veXEWgAEw
	1MkK8Ol/hn7HD82iYLadw+SHWwIYcopix7+EX8AFUNpbSonEQIRsTa6rUom0mQkT/17kQkNdnUr
	Y89m8+KwmXKx3WvWVYVu5LmZW7kDKn8g==
X-Received: by 2002:a05:6122:7cf:b0:54a:a1f1:ef42 with SMTP id 71dfb90a1353d-54bea1c094amr3516311e0c.5.1758918550435;
        Fri, 26 Sep 2025 13:29:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7vlUmlGwUwL1AFRKnR2zoH9F3EoJncOgSNp7RigeP+sdlLnxuFXDBvEmapswDg4BXwIBnMV2DKbzUxG+jaYQ=
X-Received: by 2002:a05:6122:7cf:b0:54a:a1f1:ef42 with SMTP id
 71dfb90a1353d-54bea1c094amr3516251e0c.5.1758918549953; Fri, 26 Sep 2025
 13:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
 <20250926192919.349578-1-cmirabil@redhat.com> <aNbwNN_st4bxwdwx@debug.ba.rivosinc.com>
In-Reply-To: <aNbwNN_st4bxwdwx@debug.ba.rivosinc.com>
From: Charles Mirabile <cmirabil@redhat.com>
Date: Fri, 26 Sep 2025 16:28:58 -0400
X-Gm-Features: AS18NWAFmNYbXfsrHSUccPVQ7i16EPHPLja0OCz6y6mucuuIuUMLPbxAtsOG_bI
Message-ID: <CABe3_aE4+06Um2x3e1D=M6Z1uX4wX8OjdcT48FueXRp+=KD=-w@mail.gmail.com>
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
To: Deepak Gupta <debug@rivosinc.com>
Cc: pjw@kernel.org, Liam.Howlett@oracle.com, a.hindborg@kernel.org, 
	akpm@linux-foundation.org, alex.gaynor@gmail.com, alexghiti@rivosinc.com, 
	aliceryhl@google.com, alistair.francis@wdc.com, andybnac@gmail.com, 
	aou@eecs.berkeley.edu, arnd@arndb.de, atishp@rivosinc.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, bp@alien8.de, 
	brauner@kernel.org, broonie@kernel.org, charlie@rivosinc.com, 
	cleger@rivosinc.com, conor+dt@kernel.org, conor@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@redhat.com, devicetree@vger.kernel.org, 
	ebiederm@xmission.com, evan@rivosinc.com, gary@garyguo.net, hpa@zytor.com, 
	jannh@google.com, jim.shu@sifive.com, kees@kernel.org, kito.cheng@sifive.com, 
	krzk+dt@kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com, 
	lossin@kernel.org, mingo@redhat.com, ojeda@kernel.org, oleg@redhat.com, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, peterz@infradead.org, 
	richard.henderson@linaro.org, rick.p.edgecombe@intel.com, robh@kernel.org, 
	rust-for-linux@vger.kernel.org, samitolvanen@google.com, shuah@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu, vbabka@suse.cz, x86@kernel.org, 
	zong.li@sifive.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A0M5st_fW9G9WBOVMBe7ts_TAlXITLlpPKpzUjJxawc_1758918550
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_132913_921305_2CB1D300 
X-CRM114-Status: GOOD (  48.89  )
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

SGkgRGVlcGFrIC0KCk9uIEZyaSwgU2VwIDI2LCAyMDI1IGF0IDM6NTfigK9QTSBEZWVwYWsgR3Vw
dGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBIaSBDaGFybGVzLAo+Cj4gVGhhbmtz
IGZvciByZXNwb25zZS4gUmVzdCBpbmxpbmUKPgo+IE9uIEZyaSwgU2VwIDI2LCAyMDI1IGF0IDAz
OjI5OjE5UE0gLTA0MDAsIENoYXJsZXMgTWlyYWJpbGUgd3JvdGU6Cj4gPkhpIC0KPiA+Cj4gPkhv
cGluZyB0aGF0IEkgZ290IGV2ZXJ5dGhpbmcgcmlnaHQgd2l0aCBnaXQtc2VuZC1lbWFpbCBzbyB0
aGF0IHRoaXMgaXMKPiA+ZGVsaXZlcmVkIGFscmlnaHQuLi4KPiA+Cj4gPldhbnRlZCB0byBqdW1w
IGluIHRvIGhlYWQgb2ZmIGEgcG90ZW50aWFsIHRhbGtpbmcgcGFzdCBvbmUgYW5vdGhlciAvCj4g
Pm1pc2NvbW11bmljYXRpb24gc2l0dWF0aW9uIEkgc2VlIGhlcmUuCj4gPgo+ID5PbiBXZWQsIFNl
cCAyNCwgMjAyNSBhdCAwODozNjoxMUFNIC0wNjAwLCBQYXVsIFdhbG1zbGV5IHdyb3RlOgo+ID4+
IEhpLAo+ID4+Cj4gPj4gT24gVGh1LCAzMSBKdWwgMjAyNSwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+
ID4+Cj4gPj4gWyAuLi4gXQo+ID4+Cj4gPj4gPiB2RFNPIHJlbGF0ZWQgT3BlbnMgKGluIHRoZSBm
bHV4KQo+ID4+ID4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPj4gPgo+ID4+
ID4gSSBhbSBsaXN0aW5nIHRoZXNlIG9wZW5zIGZvciBsYXlpbmcgb3V0IHBsYW4gYW5kIHdoYXQg
dG8gZXhwZWN0IGluIGZ1dHVyZQo+ID4+ID4gcGF0Y2ggc2V0cy4gQW5kIG9mIGNvdXJzZSBmb3Ig
dGhlIHNha2Ugb2YgZGlzY3Vzc2lvbi4KPiA+PiA+Cj4gPj4KPiA+PiBbIC4uLiBdCj4gPj4KPiA+
PiA+IEhvdyBtYW55IHZEU09zCj4gPj4gPiAtLS0tLS0tLS0tLS0tLS0KPiA+PiA+IFNoYWRvdyBz
dGFjayBpbnN0cnVjdGlvbnMgYXJlIGNhcnZlZCBvdXQgb2Ygemltb3AgKG1heSBiZSBvcGVyYXRp
b25zKSBhbmQgaWYgQ1BVCj4gPj4gPiBkb2Vzbid0IGltcGxlbWVudCB6aW1vcCwgdGhleSdyZSBp
bGxlZ2FsIGluc3RydWN0aW9ucy4gS2VybmVsIGNvdWxkIGJlIHJ1bm5pbmcgb24KPiA+PiA+IGEg
Q1BVIHdoaWNoIG1heSBvciBtYXkgbm90IGltcGxlbWVudCB6aW1vcC4gQW5kIHRodXMga2VybmVs
IHdpbGwgaGF2ZSB0byBjYXJyeSAyCj4gPj4gPiBkaWZmZXJlbnQgdkRTT3MgYW5kIGV4cG9zZSB0
aGUgYXBwcm9wcmlhdGUgb25lIGRlcGVuZGluZyBvbiB3aGV0aGVyIENQVSBpbXBsZW1lbnRzCj4g
Pj4gPiB6aW1vcCBvciBub3QuCj4gPj4KPiA+PiBJZiB3ZSBtZXJnZSB0aGlzIHNlcmllcyB3aXRo
b3V0IHRoaXMsIHRoZW4gd2hlbiBDRkkgaXMgZW5hYmxlZCBpbiB0aGUKPiA+PiBLY29uZmlnLCB3
ZSdsbCB3aW5kIHVwIHdpdGggYSBub24tcG9ydGFibGUga2VybmVsIHRoYXQgd29uJ3QgcnVuIG9u
IG9sZGVyCj4gPj4gaGFyZHdhcmUuICBXZSBnbyB0byBncmVhdCBsZW5ndGhzIHRvIGVuYWJsZSBr
ZXJuZWwgYmluYXJ5IHBvcnRhYmlsaXR5Cj4gPj4gYWNyb3NzIHRoZSBwcmVzZW5jZSBvciBhYnNl
bmNlIG9mIG90aGVyIFJJU0MtViBleHRlbnNpb25zLCBhbmQgSSB0aGluawo+ID4+IHRoZXNlIENG
SSBleHRlbnNpb25zIHNob3VsZCBiZSBubyBkaWZmZXJlbnQuCj4gPgo+ID5UaGF0IGlzIG5vdCB0
cnVlLCB0aGlzIHNlcmllcyBkb2VzIG5vdCBjb250YWluIHRoZSBWRFNPIGNoYW5nZXMgc28gaXQg
Y2FuCj4gPmJlIG1lcmdlZCBhcyBpcy4KPgo+IExvb2sgYXQgcGF0Y2ggMjMvMjcuIEl0IGRvZXMg
aGF2ZSB2RFNPIGNoYW5nZS4gQWx0aG91Z2ggc2hhZG93IHN0YWNrCj4gaW5zdHJ1Y3Rpb24gYXJl
IGluc2VydGVkIGFzIGNvbXBpbGVkIGZsYWcgZm9yIHZEU08gb25seSB3aGVuIGNmaSBjb25maWcg
aXMKPiBzZWxlY3RlZCBieSB1c2VyLiBSaWdodCBub3cgZGVmYXVsdCBpcyAiTm8iLiBTbyBpdCB3
b24ndCBpbXBhY3QgYW55b25lIHVubGVzCj4gdXNlciBleHBsaWNpdGx5IHNheXMgIlllcyIuCgpZ
ZXMgc29ycnkgSSBjYXVnaHQgdGhhdCBhZnRlciBoaXR0aW5nIHNlbmQgYW5kIHJlcGxpZWQgdG8g
bXkgb3duIGVtYWlsCihidXQgdGhlbiBJIHNhaWQgMTkvMjcgaW5zdGVhZCBvZiAyMy8yNyAqZmFj
ZXBhbG0qKQoKPgo+ID4KPiA+Pgo+ID4+IFNvIGJlZm9yZSBjb25zaWRlcmluZyB0aGlzIGZvciBt
ZXJnaW5nLCBJJ2QgbGlrZSB0byBzZWUgYXQgbGVhc3QgYW4KPiA+PiBhdHRlbXB0IHRvIGltcGxl
bWVudCB0aGUgZHVhbC12RFNPIGFwcHJvYWNoIChvciBzb21ldGhpbmcgZXF1aXZhbGVudCkKPiA+
PiB3aGVyZSB0aGUgc2FtZSBrZXJuZWwgYmluYXJ5IHdpdGggQ0ZJIGVuYWJsZWQgY2FuIHJ1biBv
biBib3RoIHByZS1aaW1vcAo+ID4+IGFuZCBwb3N0LVppbW9wIGhhcmR3YXJlLCB3aXRoIHRoZSBl
eGlzdGluZyB1c2Vyc3BhY2VzIHRoYXQgYXJlIGNvbW1vbgo+ID4+IHRvZGF5Lgo+ID4KPiA+SSBh
Z3JlZSB0aGF0IHdoZW4gdGhlIFZEU08gcGF0Y2hlcyBhcmUgc3VibWl0dGVkIGZvciBpbmNsdXNp
b24gdGhleSBzaG91bGQKPiA+YmUgd3JpdHRlbiBpbiBhIHdheSB0aGF0IGF2b2lkcyBsaW1pdGlu
ZyB0aGUgZW50aXJlIGtlcm5lbCB0byBlaXRoZXIKPiA+cHJlLVppbW9wIG9yIHBvc3QtWmltb3Ag
aGFyZHdhcmUgYmFzZWQgb24gdGhlIGNvbmZpZywgYnV0IEkgdGhpbmsgaXQKPiA+c2hvdWxkIGJl
IHF1aXRlIHBvc3NpYmxlIHRvIHBlcmZvcm0gZS5nLiBydW50aW1lIHBhdGNoaW5nIG9mIHRoZSBW
RFNPCj4gPnRvIHJlcGxhY2UgdGhlIFppbW9wIGluc3RydWN0aW9ucyB3aXRoIG5vcHMgaWYgdGhl
IGNvbmZpZyBpcyBlbmFibGVkIGJ1dAo+ID50aGUgaGFyZHdhcmUgZG9lcyBub3Qgc3VwcG9ydCBa
aW1vcC4KPgo+IFdoeSBrZXJuZWwgbmVlZCB0byBkbyB0aGlzIGV4dHJhIHdvcmsgb2YgY2Fycnkg
dHdvIGJpbmFyaWVzIGFuZCBwYXRjaGluZyBpdAo+IHJ1bnRpbWU/Cj4KPiBJZiBmb3IgaW5zdGFu
Y2Ugd2UgZG8gdGhpcywgYW5kIHRoZW4gdGhpcyBhbGxvdyB0aGlzIGtlcm5lbCB0byBiZSB0YWtl
biB0bwo+IHByZS1aaW1vcCBoYXJkd2FyZSwgaXQgaXMgYXNzdW1lZCB0aGF0IGVudGlyZSB1c2Vy
c3BhY2UgZm9yIHN1Y2ggaGFyZHdhcmUKPiB3YXMgY29tcGlsZWQgd2l0aG91dCBzaGFkb3cgc3Rh
Y2sgKHRodXMgbm8gemltb3ApLiBJbiB0aGF0IGNhc2UsIGtlcm5lbAo+IHNob3VsZCBoYXZlIGJl
ZW4gY29tcGlsZWQgd2l0aG91dCBDRkkgb3B0aW9uLgoKWW91IHJhaXNlIGEgZ29vZCBwb2ludCwg
aXQganVzdCBicmVha3MgdGhlIHRyYWRpdGlvbiBvZiBydW50aW1lCmRldGVjdGlvbiBhbmQgYmFj
a3dhcmRzIGNvbXBhdCB0aGF0IGhhcyBiZWVuIHRoZSBzdGFuZGFyZCBmb3IgcmlzY3YKZXh0ZW5z
aW9ucyBpbiB0aGUga2VybmVsIHNvIGZhci4KCkl0IHdvdWxkIGJlIG5pY2UgaWYgYSBrZXJuZWwg
Y291bGQgYmUgYnVpbHQgdGhhdCB3b3VsZCBydW4gb24gYm90aApwcmUtWmltb3AgYW5kIHBvc3Qt
Wmltb3AgaGFyZHdhcmUgYW5kIGJlIGFibGUgdG8gb2ZmZXIgQ0ZJIHRvCnVzZXJzcGFjZSB3aGVu
IHJ1bm5pbmcgb24gaGFyZHdhcmUgd2l0aCBaaW1vcCAoYW5kIFppY2Zpc3MgLyBaaWNmaWxwKQpi
dXQgYWdyZWUgdGhhdCBpdCBpcyBhIGJ1cmRlbi4KCj4KPiBKdXN0IGZvciBzYWtlIG9mIHRob3Vn
aHQgZXhlcmNpc2UsIGxldCdzIHNheSBGZWRvcmEgNDMgaXMgZmlyc3QgcmVsZWFzZSB3aXRoCj4g
UlZBMjMgY29tcGF0aWJsaXR5ICh6aW1vcCBhbmQgc2hhZG93IHN0YWNrKSwgdGhlcmUgaXMgbm8g
d2F5IHRoaXMgYW5kIGZ1dHVyZQo+IHJlbGVhc2Ugd2lsbCBiZSBhYmxlIHRvIHJ1biBvbiBwcmUt
emltb3AgaGFyZHdhcmUuIFVubGVzcyByZWRoYXQgaXMgZ29pbmcgdG8KPiBzdGFydCB0d28gZGlm
ZmVyZW50IGJpbmFyeSBkaXN0cmlidXRpb24uIE9uZSBmb3IgcHJlLXppbW9wIGFuZCBvbmUgZm9y
Cj4gcG9zdC16aW1vcC4gSWYgdGhhdCB3b3VsZCBiZSB0aGUgY2FzZSwgdGhlbiBjb21waWxpbmcg
dHdvIGRpZmZlcmVudCBrZXJuZWwgZm9yCj4gc3VjaCB0d28gZGlmZmVyZW50IGhhcmR3YXJlIHdv
dWxkIGJlIGxlYXN0IG9mIHRoZSB3b3JyeS4KCkl0IHdvdWxkIGJlIG9uZSB0aGluZyBpZiB0aGVy
ZSB3ZXJlIGhhcmR3YXJlIHN1cHBvcnRpbmcKWmltb3AvWmljZmlzcy9aaWNmaWxwIHJlYWRpbHkg
YXZhaWxhYmxlLCBidXQgSSBhbSBub3QgYXdhcmUgb2YgYW55CnBsYXRmb3JtIG90aGVyIHRoYW4g
cWVtdSB0byB0ZXN0IHRoaXMgY29kZS4gU2luY2UgaXQgYnJlYWtzCmNvbXBhdGliaWxpdHkgd2l0
aCBoYXJkd2FyZSBJIGFtIG5vdCBzdXJlIGFueW9uZSB3aWxsIGJlIGFibGUgdG8gZG8KYW55dGhp
bmcgd2l0aCB0aGlzIGNvbmZpZyBvcHRpb24gYW5kIGl0IG1vdmVzIHRoZSBidXJkZW4gb24gdG8g
ZWFjaApkaXN0cm8gdG8gZ28gaW4gYW5kIHNwZWNpZmljYWxseSBlbmFibGluZyBpdCB2cyBqdXN0
IG1ha2luZyB0aGluZ3MKd29yayB0byBnZXQgaW1wb3J0YW50IHNlY3VyaXR5IGltcHJvdmVtZW50
cyBpZiB0aGUgaGFyZHdhcmUgaGFzCnN1cHBvcnQgYW5kIG5vdCBpZiBpdCBkb2Vzbid0IGluIGEg
YmFja3dhcmRzIGNvbXBhdGlibGUgd2F5LgoKPgo+IE9ubHkgb3RoZXIgdXNlY2FzZSBpcyBvZiBh
IHNlYXNvbmVkIGtlcm5lbCBkZXZlbG9wZXIgb3IgYnVpbGQgeW91ciBvd24gc3R1ZmYKPiBpbiBl
bWJlZGRlZCBlbnZpcm9ubWVudCwgdGhvc2UgdXNlcnMgY2FuIGFueXdheXMgYXJlIGFkdmFuY2Vk
IHVzZXJzLiBCdXQgaXQKPiBmb3JjZXMgY29tcGxleGl0eSBvbiByZXN0IG9mIGtlcm5lbC4gVGhl
cmUgd2lsbCBiZSBtb3JlIGV4dGVuc2lvbnMgdGFraW5nIHppbW9wCj4gZW5jb2RpbmdzIGluIGZ1
dHVyZSwgd2Ugd2lsbCBlbmQgdXAgcGF0Y2hpbmcgdkRTTyBhbmQga2VlcCB0aGlzIGNvbXBsZXhp
dHkKPiB3aGlsZSByZXN0IG9mIHRoZSB1c2Vyc3BhY2Ugd2lsbCBub3QgYmUgcGF0Y2hlZCBhbmQg
d2lsbCBiZSBzZXBhcmF0ZSBiaW5hcnkKPiBkaXN0cmlidXRpb24gKGlmIE9TIGRpc3Ryb3MgZW5k
dXAgZGlzdHJpYnV0aW5nIG11bHRpcGxlIGJpbmFyaWVzIHBlciByZWxlYXNlKQo+Cj4gPgo+ID5I
b3dldmVyLCB0aGF0IGNvbmNlcm4gc2hvdWxkIG5vdCBob2xkIHVwIHRoaXMgcGF0Y2ggc2VyaWVz
LiBSYWlzZSBpdCBhZ2Fpbgo+ID53aGVuIHRoZSBWRFNPIHBhdGNoZXMgYXJlIHBvc3RlZC4KPgo+
IEFzIEkgc2FpZCBlYXJsaWVyLCB0aGVzZSBjaGFuZ2VzIGRlZmF1bHQgY2ZpIGNvbmZpZyB0byBO
by4gU28gd2hlbmV2ZXIgdGhpcwo+IGlzIHNlbGVjdGVkICJZZXMiIGJ5IGEgZGlzdHJvLCB0aGV5
IGNhbiBkcml2ZSBzdWNoIHBhdGNoZXMgKGlmIHRoZXJlIGlzIGEgcmVhbAo+IG5lZWQpCgpJZiB3
ZSBkaWQgdGhlIHBhdGNoaW5nIHdlIGNvdWxkIG1ha2UgdGhpcyBjb25maWcgZGVmYXVsdCB0byB5
ZXMgdG8KdGhhdCB5b3UgYXJlIGJ1aWxkaW5nIGEga2VybmVsIHRoYXQgaXMgc2V0IHVwIHRvIGJl
IGFibGUgdG8gb2ZmZXIgQ0ZJCndoZW4gcnVubmluZyBvbiBoYXJkd2FyZSB3aGljaCBzdXBwb3J0
cyBpdCBhcyBsb25nIGFzIHlvdSBoYXZlIGEKdG9vbGNoYWluIHRoYXQgcmVjb2duaXplcyB0aGUg
ZXh0ZW5zaW9ucyB3aGljaCBJIHRoaW5rIHdvdWxkIGJlIGdvb2QKZm9yIG1vdmluZyB0aGlzIGlt
cG9ydGFudCBzZWN1cml0eSBmZWF0dXJlIGZvcndhcmQuCgo+Cj4gPgo+ID4+Cj4gPj4gdGhhbmtz
IERlZXBhaywKPiA+Pgo+ID4+IC0gUGF1bAo+ID4KPiA+QmVzdCAtIENoYXJsaWUKPiA+Cj4KClNv
cnJ5IGZvciBzdGlycmluZyB0aGUgcG90IG9uIHRoaXMuIEkgcmVhbGx5IGFwcHJlY2lhdGUgeW91
ciB3b3JrIG9uCnRoaXMgcGF0Y2ggc2VyaWVzLgoKSSBhZ3JlZSB0aGF0IHRoaXMgaXMgYSBkaWZm
aWN1bHQgY2FsbCwgYW5kIEkgY291bGQgc2VlIGl0IGdvaW5nIGVpdGhlcgp3YXkgYnV0IEkgbGVh
biB0b3dhcmRzIHRyeWluZyB0byBtYWludGFpbiB0aGUgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkK
YmVjYXVzZSB0aGUgaGFyZHdhcmUgZG9lc24ndCBleGlzdCB5ZXQuCgpCZXN0IC0gQ2hhcmxpZQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
