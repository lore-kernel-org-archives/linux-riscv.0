Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96671CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tUCEekCOEOggBxrNFOsfIwcvOjumK4n+fpkyk0ntQwY=; b=GWQMiuT1x0G6kJFiW5j11Kpdwd
	eGA+ghblt/2OqSFXCqaOHqZXJJdvu/4fqC+goeUVpRwrzUseXxTTOHnNhuEzVrei8sx1VSKU78cD7
	bP62fOVeDtavxmvin5D6I/7cFIoextY/txWkVNdzjyaa3ES4afj4YXJN8kcosk6Qi/Fqj86rBRaCJ
	coTm0RQhD6/UB+xieyTyUmoeupOCWFi8CNZIUPZBjnjVPRn9XnOnx2vBErEAfkh8CA1ND2VG/HkPr
	Iq7AojNmEsFSytG8GeAcUbuOg+y5mzY2WI2glrnx8PKOdZ8U164dD02eKGBPW/SQDl9XGcj39I6jm
	yB9GleeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxo8-0000000347L-0DuV;
	Fri, 15 Aug 2025 17:01:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umw1l-00000002o50-19X0
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 15:07:34 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76e2eb6ce24so2103564b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270452; x=1755875252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHLPRMwsFUXklJ+HOrV/DsMAdiggx2WSG2UfKCJiulY=;
        b=kuUsGxz/9rMdj1ukrsG45ngj/qTldeLG4g+kLJOJTigUJjHzu8Ciasmjp7sduz+5MC
         FgQ6OvKEcbuZFTu7//2cleiWXIe0OHvagjo8EwcrV/D4OuAbuNA064aJJ5XU13Y1fglm
         N5Jn0ZTwm25S/B/VvR0xUv9SnQGRz2c+p0Pq99Kd13/XAPfNpqL6vbBzVVYNOMcQIwQj
         Tgdmi+VcHA0l6mXT2xGg0enXpZhO71Ht+Xo7u1hgRUamj3aoIYa3CYHZOdMN4v+7btQ7
         nBIESUUHx9oEhaQWI+NTfm+cWP+6toujh+k7d2VaT5u6RG+ekOc0ItdzARt7oWUQP86V
         NxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270452; x=1755875252;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHLPRMwsFUXklJ+HOrV/DsMAdiggx2WSG2UfKCJiulY=;
        b=NrvCMhpu2tdNOWB6xWOywSPv/S+N0uQD7cqhXNc5meZJM8i/k6xPuJ2dy80FAoplP5
         A55GN4S/PXzlZbm8CXOPPwMteZBwyssSwFcKhJqjg042vLiCuZoZu/7ZQ1Y79eA0c1NU
         u/YYhJJLdEvsGifohkypHLpeFdLeQNNLUiZOUeVziOKZvZ7/V7nCMio7BSmQRCcAj8PF
         8twk6rb1TZqOl2jEdB5X31HwTolJZo6r4404p5REKvSEIoIN6Ch3WMxSAqFLGbbp9Phn
         nGbb/wgQeoF+6LyoOvXftmyrtaHFTSQOqmLx9QNWh9NbzLHbQNwsy9G4nNyyRRGLOtz1
         6Y0w==
X-Forwarded-Encrypted: i=1; AJvYcCXV4Y1zL9jWKPGxLAApT3YPMPQEvDSR5zbqIRs3ODXmuAgUIptdVmtiBKuDZD/HttJyRxiDNAvPySkuwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPnrqXfR6NjlHfKkhoB2a+1pQsop6T0VuaLm8XGgwp8C7d5IBy
	/yaFGZ44oQhF7ZiAdCfdH/f9iVvCgsheDPrzGA4I1pZbyifq3Mre14kI2vSGRzrXmQA=
X-Gm-Gg: ASbGnctts8FAKY88Bq95XsY35gi8+9dog4ry4BtkNkh+KvpLQ8nrZQyXG01PET3VpqB
	Dp/6hg3kNf39Z9XLvpVnOZ8/mQdKAS+YtWmymL/Lrmj/2x2TUvMJVX92I2WaJE3wWMZQDaTwD0i
	UFPWe+sAEzj9ImM3+LtnTKAeoey0BbMJiervEqKapQydAxW9Dv3yRGstDSlcDjZae4T++QY5Uf7
	RnjvzFtJc7w5E7lXsFzLAibwyf3uXRxcoyDg4h4htHTWJAGvdezRW5kHn+tPuXmUuJAi1G1CSGa
	67bukHlX+82V67sgw2/eegAcqGhxnhz2xIgNeyn7r0A+eCGLokWbbhioXgyK3IYy4/jBSuaSPqw
	6sKU4GcjlyoSWJA+7rOO0gTYCSOGJuwV3bfw=
X-Google-Smtp-Source: AGHT+IHmxnV+YR9cR/LeaPBJErhvHjNkppxMDemXEcOX3MCe4Sp9OWex1hLOxvkMk2wkz7dST8S4eg==
X-Received: by 2002:a05:6a00:4f96:b0:769:a6a2:fe1e with SMTP id d2e1a72fcca58-76e447e3389mr3104455b3a.11.1755270452302;
        Fri, 15 Aug 2025 08:07:32 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76e4558bf19sm1309791b3a.99.2025.08.15.08.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:07:31 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:07:31 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:06:56 PDT (-0700)
Subject: Re: [PATCH v4 17/24] riscv: vdso: Deduplicate CFLAGS_REMOVE_* variables
In-Reply-To: <20250812-vdso-absolute-reloc-v4-17-61a8b615e5ec@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
  justinstitt@google.com, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
  kees@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
  hpa@zytor.com, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
  linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  chenhuacai@kernel.org, kernel@xen0n.name, hca@linux.ibm.com, gor@linux.ibm.com,
  agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tsbogend@alpha.franken.de,
  ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
  bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
  tmgross@umich.edu, dakr@kernel.org, nicolas.schier@linux.dev, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
  linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
  linux-kbuild@vger.kernel.org, jstancek@redhat.com, acme@redhat.com, alexghiti@rivosinc.com,
  thomas.weissschuh@linutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: thomas.weissschuh@linutronix.de
Message-ID: <mhng-540E0EE0-A9CF-4EE3-9E71-969B40D29C50@Palmers-Mini.rwc.dabbelt.com>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_080733_311364_EB58F079 
X-CRM114-Status: GOOD (  15.65  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxMSBBdWcgMjAyNSAyMjo0NDozMCBQRFQgKC0wNzAwKSwgdGhvbWFzLndlaXNzc2No
dWhAbGludXRyb25peC5kZSB3cm90ZToKPiBBbGwgdkRTTyBvYmplY3RzIG5lZWQgdGhlIHNhbWUg
dHJlYXRtZW50Lgo+IFRvIG1ha2UgY2hhbmdlcyB0byBib3RoIHRoZSBsaXN0IG9mIG9iamVjdHMg
YW5kIHRoZSBsaXN0IG9mIHJlbW92ZWQgZmxhZ3MKPiBlYXNpZXIsIGludHJvZHVjZSBhIGhlbHBl
ciB2YXJpYWJsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMu
d2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgo+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkg
PGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IE5hdGhhbiBDaGFuY2VsbG9y
IDxuYXRoYW5Aa2VybmVsLm9yZz4KPiBUZXN0ZWQtYnk6IEphbiBTdGFuY2VrIDxqc3RhbmNla0By
ZWRoYXQuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgNyAr
KysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSBiL2FyY2gv
cmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKPiBpbmRleCA5ZWJiNWU1OTBmOTNhMzIyOGM0NTFk
Y2E1OGU2ZDVjZmJiYzAzZmY3Li5jMTljM2M3NmY3YzlmNmIyZjc1MjNhNTkyNjlkZTNiNjgzNjU2
MzIzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKPiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCj4gQEAgLTQ5LDkgKzQ5LDEwIEBAIENQ
UEZMQUdTX3Zkc28ubGRzICs9IC1ESEFTX1ZHRVRUSU1FT0ZEQVkKPiAgZW5kaWYKPgo+ICAjIERp
c2FibGUgLXBnIHRvIHByZXZlbnQgaW5zZXJ0IGNhbGwgc2l0ZQo+IC1DRkxBR1NfUkVNT1ZFX3Zn
ZXR0aW1lb2ZkYXkubyA9ICQoQ0NfRkxBR1NfRlRSQUNFKSAkKENDX0ZMQUdTX1NDUykKPiAtQ0ZM
QUdTX1JFTU9WRV9nZXRyYW5kb20ubyA9ICQoQ0NfRkxBR1NfRlRSQUNFKSAkKENDX0ZMQUdTX1ND
UykKPiAtQ0ZMQUdTX1JFTU9WRV9od3Byb2JlLm8gPSAkKENDX0ZMQUdTX0ZUUkFDRSkgJChDQ19G
TEFHU19TQ1MpCj4gK0NGTEFHU19SRU1PVkVfVkRTTyA9ICQoQ0NfRkxBR1NfRlRSQUNFKSAkKEND
X0ZMQUdTX1NDUykKPiArQ0ZMQUdTX1JFTU9WRV92Z2V0dGltZW9mZGF5Lm8gPSAkKENGTEFHU19S
RU1PVkVfVkRTTykKPiArQ0ZMQUdTX1JFTU9WRV9nZXRyYW5kb20ubyA9ICQoQ0ZMQUdTX1JFTU9W
RV9WRFNPKQo+ICtDRkxBR1NfUkVNT1ZFX2h3cHJvYmUubyA9ICQoQ0ZMQUdTX1JFTU9WRV9WRFNP
KQo+Cj4gICMgRm9yY2UgZGVwZW5kZW5jeQo+ICAkKG9iaikvdmRzby5vOiAkKG9iaikvdmRzby5z
bwoKUmV2aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+CkFja2Vk
LWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgoKQWxzbyBhc3N1bWluZyB5
b3Ugd2FudCB0byB0YWtlIHRoaXMgd2l0aCB0aGUgb3RoZXJzLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
