Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E1DC83F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 07:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/VdS0LbdZFqbsnfbN+dA8KEE+U4IupGZnxnZVSIEYo=; b=2puCbLJ/vqkHbv
	ren/oSoiNzsuoesyNDd5xLtdd4P0wQTWkqVXV5YqseGOn309XbsXSttxUXrcZYkB1fXiX5+exUA2R
	+nDmGy64fAEZZhBXFC5AAh7IABfHptMPbjF89GPklLevDpmENvgPk9WlSdSh1TAyEUWjgc4fysKsa
	VtUIwjSoZ45BBT7WQRIlKG8/nfW0+Tq1+aZO7aSPum2oQyf5m9nt4AAnfda2UQa3bKY6VeFo2Zd0g
	ULcrN9QnTAG77BbPUdGRm6Es8OYzBViKEIxe8weSQ/lu5fTxIxBg4m0JPA+JKR4tgONTI9I5r0g2g
	Q9fQJJDmH9kkLdPfHGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwgz-000000071qO-18Yd;
	Wed, 16 Jul 2025 07:36:41 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwe8-000000071GJ-4AUe
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 07:33:46 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e740a09eae0so6326676276.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 00:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752651224; x=1753256024; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PW8oj8yyNVG5XPISXOtfA3n2P3zOnfj4By+Eha4u0hU=;
        b=QZa8i/EToQn7sq5bQSZKismwxMUxaOdWK0qFZck7ABySffF44vmzg19CSY5+giOXG6
         +wKqq0xZLSKZU4XJ/biLZvAecG92lZCl8bB9Ztg28wagArtBCEURLHZQuWWW4ZGPEu0n
         IW0ON9jag73sGJLdlgm4VS8VE3Zm6b8CEn8eVbaFW7t92i8FidDpZWtnofL5AZ/XQzfC
         7M3Cndb5mbfYtALFrlWOQrZrVgnlygMcYgt8sOaUoE3O8VjkQKPeY09RW4/7XaSN8YwL
         nei8bu8RlRTpzu9jh1/zK+kMUEHWt8optFdFQfTo+AorfY8afagKrEz0LJg6j3WdonJy
         VnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752651224; x=1753256024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PW8oj8yyNVG5XPISXOtfA3n2P3zOnfj4By+Eha4u0hU=;
        b=FDUBo0qdyiEoajttIjshfysCBuoEAjpJ+70pBFxx7mQ4pzMfid9z7Wb8VcnJ0ryK2C
         NQ5uyCt8louu2+PbrKHt/GgtfRHu9cj3SvPGoIKd/vZmqtmKt5yXHYp9Ui4AUfUc0Iia
         q7AczYVS9Wujs0wgsIp0ajgqeOa0VxpcX/n08/rrNL0umxwssNZibYyVamjB4U8lJu/D
         4cc8pEmwWGlkm85Of7VmyGjSEwdbRbBMHFIEh0QGPTJ8Am1If5iOF+qAXDvXV/CeoozY
         bSyG08dJ5LJ1bkjxLvjNk5sR5V7+3sY3V3yocLZSwMEturta1RbcYH8x6oQ8U4nLKr6R
         YEUg==
X-Forwarded-Encrypted: i=1; AJvYcCWFK5zCzjCSU8F6d4wpxFm2NYN4v3UjRgerrfGpOIXhcSZ5DmbgKL4EsZcVVc93dAmfrDybEPuiCMWnZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw64nSd7jBofWMttEgjm8TI05wH2SFazOKVEkyLLJnXEU3K9pf0
	rJOxJOL7+FgN6TUCsSBYGSrG8Bei/S31boaawyJfsBwX6Yi994l1U8YpyPJimyV/L9EJL+60k0e
	jWI6M2qsATxLLF0mfcEdGqtSqly5u7yie6zxaQOgTnA==
X-Gm-Gg: ASbGncv8amIFu3L77C8eJKr782XeCQreqaOhVe2bx73CD8EA0ny9T7eBNVQB1u4gAsR
	8nt9TaC3kKEY6iqsf8AnDCjYI0DhKj4I5q1wkSaR9FD5WoXtr62o8Jn5BRJVoZZopkwG+Ld23r1
	YyI9hFuO7AWxdULPgEvYwm4sPH7UIvKE0HfjjGCyEuLLAaTbSLytGzlP4zlFU6IKg6TWQa/d69W
	Lt4Pgrm
X-Google-Smtp-Source: AGHT+IEBFim0sebTg/GJVvyxJNrliMi5B8Z1CirXQugUtw/MAG7MtHjoXp3XBPYhkfJvHfUUj+zVmynVQDiKVlguiXc=
X-Received: by 2002:a05:690c:6d0b:b0:6fb:b1dd:a00d with SMTP id
 00721157ae682-7183516330bmr29836477b3.30.1752651223909; Wed, 16 Jul 2025
 00:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
 <20250604-v5_user_cfi_series-v17-15-4565c2cf869f@rivosinc.com>
 <CANXhq0pRXX_OMW2g2ui-k7Z_ZT+5a8Sra8oE28nBh5B9K2L5bQ@mail.gmail.com>
 <CANXhq0p3MVLMsr_r0RWMti476pT0EMx61PQArjo2fUauTdpXaQ@mail.gmail.com>
 <CAKC1njRNkSfb_0pUQoH0RwJQhWTsz9sdg_3o08w-NuSO5WypcA@mail.gmail.com> <CANXhq0oZz=TTT=py=1BO3OZf45Wg=-bFyNpn+JRLNufHceLjcQ@mail.gmail.com>
In-Reply-To: <CANXhq0oZz=TTT=py=1BO3OZf45Wg=-bFyNpn+JRLNufHceLjcQ@mail.gmail.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 16 Jul 2025 00:33:29 -0700
X-Gm-Features: Ac12FXyXP37ODEjfHSjK8_gGHbTe6nbCLu3r93joGlrq46qsQaqRghNBDnEKWgk
Message-ID: <CAKC1njRqox8_YNEhQJT8NRMjGuqpDt55ck6QVV2aNPLwTsaj5w@mail.gmail.com>
Subject: Re: [PATCH v17 15/27] riscv/traps: Introduce software check exception
 and uprobe handling
To: Zong Li <zong.li@sifive.com>
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
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_003345_152086_4120B3EE 
X-CRM114-Status: GOOD (  34.14  )
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

T24gVHVlLCBKdWwgMTUsIDIwMjUgYXQgNzowNuKAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAxNiwgMjAyNSBhdCA1OjM04oCvQU0gRGVlcGFr
IEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIFpvbmcsCj4gPgo+
ID4KPiA+IE9uIFRodSwgSnVuIDE5LCAyMDI1IGF0IDc6MTbigK9QTSBab25nIExpIDx6b25nLmxp
QHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBNb24sIEp1biAxNiwgMjAyNSBhdCAz
OjMx4oCvUE0gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4g
PiA+IE9uIFRodSwgSnVuIDUsIDIwMjUgYXQgMToxN+KAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdA
cml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiB6aWNmaXNzIC8gemljZmls
cCBpbnRyb2R1Y2VzIGEgbmV3IGV4Y2VwdGlvbiB0byBwcml2IGlzYSBgc29mdHdhcmUgY2hlY2sK
PiA+ID4gPiA+IGV4Y2VwdGlvbmAgd2l0aCBjYXVzZSBjb2RlID0gMTguIFRoaXMgcGF0Y2ggaW1w
bGVtZW50cyBzb2Z0d2FyZSBjaGVjawo+ID4gPiA+ID4gZXhjZXB0aW9uLgo+ID4gPiA+ID4KPiA+
IC4uLi4uCj4gPgo+ID4gPiA+IFdoZW4gYSB1c2VyIG1vZGUgQ0ZJIHZpb2xhdGlvbiBvY2N1cnMs
IHRoZSBFTFAgc3RhdGUgc2hvdWxkIGJlIDEsIGFuZAo+ID4gPiA+IHRoZSBzeXN0ZW0gdHJhcHMg
aW50byBzdXBlcnZpc29yIG1vZGUuIER1cmluZyB0aGlzIHRyYXAsIHNzdGF0dXMuU1BFTFAKPiA+
ID4gPiBpcyBzZXQgdG8gMSwgYW5kIHRoZSBFTFAgc3RhdGUgaXMgcmVzZXQgdG8gMC4gSWYgd2Ug
ZG9u4oCZdCBjbGVhcgo+ID4gPiA+IHNzdGF0dXMuU1BFTFAsIHRoZSBFTFAgc3RhdGUgd2lsbCBi
ZWNvbWUgMSBhZ2FpbiBhZnRlciBleGVjdXRpbmcgdGhlCj4gPiA+ID4gc3JldCBpbnN0cnVjdGlv
bi4gQXMgYSByZXN1bHQsIHRoZSBzeXN0ZW0gbWlnaHQgdHJpZ2dlciBhbm90aGVyCj4gPiA+ID4g
Zm9yd2FyZCBDRkkgdmlvbGF0aW9uIHVwb24gZXhlY3V0aW5nIHRoZSBuZXh0IGluc3RydWN0aW9u
IGluIHRoZSB1c2VyCj4gPiA+ID4gcHJvZ3JhbSwgdW5sZXNzIGl0IGhhcHBlbnMgdG8gYmUgYSBs
cGFkIGluc3RydWN0aW9uLgo+ID4gPiA+Cj4gPiA+ID4gVGhlIHByZXZpb3VzIHBhdGNoIHdhcyB0
ZXN0ZWQgb24gUUVNVSwgYnV0IFFFTVUgZG9lcyBub3Qgc2V0IHRoZQo+ID4gPiA+IHNzdGF0dXMu
U1BFTFAgYml0IHRvIDEgd2hlbiBhIGZvcndhcmQgQ0ZJIHZpb2xhdGlvbiBvY2N1cnMuIFRoZXJl
Zm9yZSwKPiA+ID4gPiBJIHN1c3BlY3QgdGhhdCBRRU1VIG1pZ2h0IGFsc28gcmVxdWlyZSBzb21l
IGZpeGVzLgo+ID4gPgo+ID4gPiBIaSBEZWVwYWssCj4gPiA+IFRoZSBpc3N1ZSB3aXRoIFFFTVUg
d2FzIHRoYXQgdGhlIHN3LWNoZWNrIGV4Y2VwdGlvbiBiaXQgaW4gbWVkZWxlZwo+ID4gPiBjb3Vs
ZG4ndCBiZSBzZXQuIFRoaXMgaGFzIGJlZW4gZml4ZWQgaW4gdGhlIGxhdGVzdCBRRU1VIG1haW5s
aW5lLiBJCj4gPiA+IGhhdmUgcmUtdGVzdGVkIHRoZSBsYXRlc3QgUUVNVSB2ZXJzaW9uLCBhbmQg
aXQgd29ya3MuCj4gPgo+ID4gV2hhdCB3YXMgdGhpcyBpc3N1ZSwgY2FuIHlvdSBwb2ludCBtZSB0
byB0aGUgcGF0Y2ggaW4gbWFpbmxpbmU/Cj4KPiBIaSBEZWVwYWsKPiBUaGUgaXNzdWUgd2FzIHRo
YXQgbXkgUUVNVSBzZXR1cCBzb21laG93IG1pc3NlZCB0aGUgY2hhbmdlIG9mCj4gYHRhcmdldC9y
aXNjdi9jc3IuY2AgaW4geW91ciBmb2xsb3dpbmcgcGF0Y2g6Cj4gaHR0cHM6Ly9naXRodWIuY29t
L3FlbXUvcWVtdS9jb21taXQvNjAzMTEwMjQwMWFlOGE2OWE4N2IyMGZiZWMyYWFlNjY2NjI1ZDk2
YQo+IEFmdGVyIEkgdXBncmFkZWQgdG8gdGhlIGxhdGVzdCBRRU1VIHNvdXJjZSwgSSBmb3VuZCB0
aGUga2VybmVsIGlzc3VlCj4gaWYgd2UgZGlkbid0IGNsZWFyIHNzdGF0dXMuU1BFTFAgaW4gdGhl
IGhhbmRsZXIKPiBUaGFua3MKCkFhaCBvaywgZ290IGl0LgoKPgo+ID4KPiA+ID4KPiA+ID4gPgo+
ID4gPiA+IFRoYW5rcwo+ID4gPiA+Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIGlmIChp
c19mY2ZpIHx8IGlzX2JjZmkpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBkb190cmFwX2Vy
cm9yKHJlZ3MsIFNJR1NFR1YsIFNFR1ZfQ1BFUlIsIHJlZ3MtPmVwYywKPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJPb3BzIC0gY29udHJvbCBmbG93IHZpb2xhdGlvbiIp
Owo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gPiA+ID4gKyAgICAg
ICB9Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gPiA+
ICt9Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArLyoKPiA+ID4gPiA+ICsgKiBzb2Z0d2FyZSBjaGVj
ayBleGNlcHRpb24gaXMgZGVmaW5lZCB3aXRoIHJpc2MtdiBjZmkgc3BlYy4gU29mdHdhcmUgY2hl
Y2sKPiA+ID4gPiA+ICsgKiBleGNlcHRpb24gaXMgcmFpc2VkIHdoZW46LQo+ID4gPiA+ID4gKyAq
IGEpIEFuIGluZGlyZWN0IGJyYW5jaCBkb2Vzbid0IGxhbmQgb24gNCBieXRlIGFsaWduZWQgUEMg
b3IgYGxwYWRgCj4gPiA+ID4gPiArICogICAgaW5zdHJ1Y3Rpb24gb3IgYGxhYmVsYCB2YWx1ZSBw
cm9ncmFtbWVkIGluIGBscGFkYCBpbnN0ciBkb2Vzbid0Cj4gPiA+ID4gPiArICogICAgbWF0Y2gg
d2l0aCB2YWx1ZSBzZXR1cCBpbiBgeDdgLiByZXBvcnRlZCBjb2RlIGluIGB4dHZhbGAgaXMgMi4K
PiA+ID4gPiA+ICsgKiBiKSBgc3Nwb3BjaGtgIGluc3RydWN0aW9uIGZpbmRzIGEgbWlzbWF0Y2gg
YmV0d2VlbiB0b3Agb2Ygc2hhZG93IHN0YWNrIChzc3ApCj4gPiA+ID4gPiArICogICAgYW5kIHgx
L3g1LiByZXBvcnRlZCBjb2RlIGluIGB4dHZhbGAgaXMgMy4KPiA+ID4gPiA+ICsgKi8KPiA+ID4g
PiA+ICthc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfc29m
dHdhcmVfY2hlY2soc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+ID4gPiArewo+ID4gPiA+ID4g
KyAgICAgICBpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAg
aXJxZW50cnlfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncyk7Cj4gPiA+ID4gPiArCj4gPiA+ID4g
PiArICAgICAgICAgICAgICAgLyogbm90IGEgY2ZpIHZpb2xhdGlvbiwgdGhlbiBtZXJnZSBpbnRv
IGZsb3cgb2YgdW5rbm93biB0cmFwIGhhbmRsZXIgKi8KPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICBpZiAoIWhhbmRsZV91c2VyX2NmaV92aW9sYXRpb24ocmVncykpCj4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBkb190cmFwX3Vua25vd24ocmVncyk7Cj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArICAgICAgICAgICAgICAgaXJxZW50cnlfZXhpdF90b191c2VyX21vZGUocmVncyk7Cj4g
PiA+ID4gPiArICAgICAgIH0gZWxzZSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgLyogc3cg
Y2hlY2sgZXhjZXB0aW9uIGNvbWluZyBmcm9tIGtlcm5lbCBpcyBhIGJ1ZyBpbiBrZXJuZWwgKi8K
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICBkaWUocmVncywgIktlcm5lbCBCVUciKTsKPiA+ID4g
PiA+ICsgICAgICAgfQo+ID4gPiA+ID4gK30KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICAjaWZkZWYg
Q09ORklHX01NVQo+ID4gPiA+ID4gIGFzbWxpbmthZ2UgX192aXNpYmxlIG5vaW5zdHIgdm9pZCBk
b19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gPiA+ID4gIHsKPiA+ID4gPiA+
Cj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gMi40My4wCj4gPiA+ID4gPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
