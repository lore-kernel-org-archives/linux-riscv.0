Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D23C5ACB3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 07:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZvdaa0X+xTY+EgNLLrYynEQuw9f/UCo4LihdJEi/CI=; b=TsQp3efd6Zssxo
	KP+D2oXgOVAUaZwmtAsAV8dJ1Uja775v5ANnvup5d4xLth6uVDa8CdBXWyY7m2endhqJQA45mRp/B
	NhFRQaUVfylL+logDelYj41L+iVJXWqlu8w5n554/uP6izqaBtbUqQ+hII7IiexwHpje22gkzEbRk
	gPeQA0ATzesqtzz7pjw4TEWaDxCjB3/oheIe/STP1AI+olY5BaiREBuo3rC6wNc++yZZrkrIF2X1+
	yJbVliHHTTyLVOCak9LAaxhm891rJzvLoAsJ/BWhsXfCd7f0Ox7yiMoGTt6ePrV4Qb/bQWfrZpPvI
	NbRnyOCCtssZPn/nM0wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LaN-00Fwk7-0I;
	Tue, 21 Nov 2023 07:54:19 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LaI-00FwgU-12
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 07:54:15 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-28397a2c402so2711620a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Nov 2023 23:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1700553239; x=1701158039; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n94+xDIkUOqQeszLqyF1GvL8Xx0iP7KzdJ36tDGQoLY=;
        b=WayWbY5NC0K29GDIGkecyEzwi7tyMMmyXJ9rVw3EcG6x7geH2HRGDuwMzGYcOILzok
         fHcalW9NACTExGZIMw2+3v4xEklbqFK5wCvBXMCehFC9ACBJOLM9VCKomOmvPEVmFJbr
         f26QdWzzibQkxoIFDCo09faehqSJu9wOxZzO5ysPAOmVlociawIdaYd/3dyL5HAP7K90
         hs3tr6RZCaTPxxZpr9cH/+Q+VFMme0N31YqvbA6+Rs/d5fA/w2xhs8k1cIvKzDgggx8l
         45re2u1MT3+CCDNl8X3C487MSsldsOPdcPHIpkwCr15yGvRLq9SajStT/JvYjWGqdaKW
         9now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700553239; x=1701158039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n94+xDIkUOqQeszLqyF1GvL8Xx0iP7KzdJ36tDGQoLY=;
        b=llB3qNx2UE8Hso0aH6CuvpvEeNDleSY9o4+S+AOLEoEJc3RpySb7b3SV7gZg0igHjM
         w5sCZcybivuFDDZlJLR8x8MQRd6MX0Rgkj33A9t5TYKvaxqUySaRPois7OnjixYmuz8x
         +EZpbcteiYlbxTobSF0Icwuxf0OfKYugdpAHLBEbL5X4JYTPtNX5AOUxSlJ9GWreOHR6
         u+umkhrpNqXf6VvFC5TIZjaKGvUgsELhYCeUGhqdzXp8XfvI2lgSK8sUf3u+pDN5kVVC
         aig6bzeg2MBZegZeMs1jOJ5mTCE7mMwX8UWEB2Ds+vFI0RdIe0y1T7JZ/Oc14B0Bma/P
         fR8g==
X-Gm-Message-State: AOJu0YzsFQgpljQdZ2MEPGabR9uLJpXIIRDSZmQs8xxY84YXno4JBywU
	ko7sLuBWMpnQX2XQVfPp86RC1XTXnnz0pg+Aw6Xwkw==
X-Google-Smtp-Source: AGHT+IFEH3g7IKb8uSXGkQLcfDFQGeKgdMM5+Twg24L86I2m/VOT+I8Lea+NYKy/4gFSwZ3WTdUJVHHh1PwvYjXVr94=
X-Received: by 2002:a17:90a:8b01:b0:280:f534:6b9c with SMTP id
 y1-20020a17090a8b0100b00280f5346b9cmr7974497pjn.21.1700553238477; Mon, 20 Nov
 2023 23:53:58 -0800 (PST)
MIME-Version: 1.0
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
 <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv>
In-Reply-To: <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 21 Nov 2023 07:53:47 +0000
Message-ID: <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
To: Baoquan He <bhe@redhat.com>, eric_devolder@yahoo.com
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	dave.hansen@linux.intel.com, x86@kernel.org, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, kernel@xen0n.name, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, hpa@zytor.com, keescook@chromium.org, paulmck@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, frederic@kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, samitolvanen@google.com, 
	juerg.haefliger@canonical.com, arnd@arndb.de, rmk+kernel@armlinux.org.uk, 
	linus.walleij@linaro.org, sebastian.reichel@collabora.com, rppt@kernel.org, 
	kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com, ziy@nvidia.com, 
	masahiroy@kernel.org, ndesaulniers@google.com, mhiramat@kernel.org, 
	ojeda@kernel.org, thunder.leizhen@huawei.com, xin3.li@intel.com, 
	tj@kernel.org, Greg KH <gregkh@linuxfoundation.org>, tsi@tuyoix.net, 
	hbathini@linux.ibm.com, sourabhjain@linux.ibm.com, boris.ostrovsky@oracle.com, 
	konrad.wilk@oracle.com, kernel-team <kernel-team@cloudflare.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_235414_356163_0055572F 
X-CRM114-Status: GOOD (  27.90  )
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

T24gVHVlLCBOb3YgMjEsIDIwMjMgYXQgMTo1MOKAr0FNIEJhb3F1YW4gSGUgPGJoZUByZWRoYXQu
Y29tPiB3cm90ZToKPgo+IEVyaWMgRGVWb2xkZXIncyBPcmFjbGUgbWFpbCBhZGRyZXNzIGlzIG5v
dCBhdmFpbGFibGUgYW55bW9yZSwgYWRkIGhpcwo+IGN1cnJlbnQgbWFpbCBhZGRyZXNzIGhlIHRv
bGQgbWUuCgpUaGFuayB5b3UhCgo+IE9uIDExLzIwLzIzIGF0IDEwOjUycG0sIElnbmF0IEtvcmNo
YWdpbiB3cm90ZToKPiA+IEdvb2QgZGF5IQo+ID4KPiA+IFdlIGhhdmUgcmVjZW50bHkgc3RhcnRl
ZCB0byBldmFsdWF0ZSBMaW51eCA2LjYgYW5kIG5vdGljZWQgdGhhdCB3ZQo+ID4gY2Fubm90IGRp
c2FibGUgQ09ORklHX0tFWEVDIGFueW1vcmUsIGJ1dCBrZWVwIENPTkZJR19DUkFTSF9EVU1QCj4g
PiBlbmFibGVkLiBJdCBzZWVtcyB0byBiZSByZWxhdGVkIHRvIGNvbW1pdCA4OWNkZTQ1NSAoImtl
eGVjOgo+ID4gY29uc29saWRhdGUga2V4ZWMgYW5kIGNyYXNoIG9wdGlvbnMgaW50byBrZXJuZWwv
S2NvbmZpZy5rZXhlYyIpLCB3aGVyZQo+ID4gYSBDT05GSUdfS0VYRUMgZGVwZW5kZW5jeSB3YXMg
YWRkZWQgdG8gQ09ORklHX0NSQVNIX0RVTVAuCj4gPgo+ID4gSW4gb3VyIGN1cnJlbnQga2VybmVs
IChMaW51eCA2LjEpIHdlIG9ubHkgZW5hYmxlIENPTkZJR19LRVhFQ19GSUxFCj4gPiB3aXRoIGVu
Zm9yY2VkIHNpZ25hdHVyZSBjaGVjayB0byBzdXBwb3J0IHRoZSBrZXJuZWwgY3Jhc2ggZHVtcGlu
Zwo+ID4gZnVuY3Rpb25hbGl0eSBhbmQgd291bGQgbGlrZSB0byBrZWVwIENPTkZJR19LRVhFQyBk
aXNhYmxlZCBmb3IKPiA+IHNlY3VyaXR5IHJlYXNvbnMgWzFdLgo+ID4KPiA+IEkgd2FzIHJlYWRp
bmcgdGhlIGxvbmcgY29tbWl0IG1lc3NhZ2UsIGJ1dCB0aGUgcmVhc29uIGZvciBhZGRpbmcKPiA+
IENPTkZJR19LRVhFQyBhcyBhIGRlcGVuZGVuY3kgZm9yIENPTkZJR19DUkFTSF9EVU1QIGV2YWRl
ZCBtZS4gQW5kIEkKPiA+IGJlbGlldmUgZnJvbSB0aGUgaW1wbGVtZW50YXRpb24gcGVyc3BlY3Rp
dmUgQ09ORklHX0tFWEVDX0ZJTEUgc2hvdWxkCj4gPiBzdWZmaWNlIGhlcmUgKGFzIHdlIHN1Y2Nl
c3NmdWxseSB1c2VkIGl0IGZvciBjcmFzaGR1bXBzIG9uIExpbnV4IDYuMSkuCj4gPgo+ID4gSXMg
dGhlcmUgYSByZWFzb24gZm9yIGFkZGluZyB0aGlzIGRlcGVuZGVuY3kgb3IgaXMgaXQganVzdCBh
bgo+ID4gb3ZlcnNpZ2h0PyBXb3VsZCBzb21lIHNvbHV0aW9uIG9mIHJlcXVpcmluZyBlaXRoZXIg
Q09ORklHX0tFWEVDIG9yCj4gPiBDT05GSUdfS0VYRUNfRklMRSB3b3JrIGhlcmU/Cj4KPiBJIHNl
YXJjaGVkIHRoZSBwYXRjaCBoaXN0b3J5LCBmb3VuZCBFcmljIGRpZG4ndCBhZGQgdGhlIGRlcGVu
ZGVuY3kgb24KPiBDT05GSUdfS0VYRUMgYXQgdGhlIGJlZ2lubmluZy4gTGF0ZXIgYSBsaW51eC1u
ZXh0IGJ1aWxkaW5nIGZhaWx1cmUgd2l0aAo+IHJhbmRjb25maWcgd2FzIHJlcG9ydGVkLCBpbiB0
aGVyZSBDT05GSUdfQ1JBU0hfRFVNUCBlbmFibGVkLCB3aGlsZQo+IENPTkZJR19LRVhFQyBpcyBk
aXNhYmxlZC4gRmluYWxseSBFcmljIGFkZGVkIHRoZSBLRVhFQyBkZXBlbmRlbmN5IGZvcgo+IENS
QVNIX0RVTVAuIFBsZWFzZSBzZWUgYmVsb3cgbGluayBmb3IgbW9yZSBkZXRhaWxzOgo+Cj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzNlOGVlY2QxLWEyNzctMmNmYi02OTBlLTVkZTJlYjdi
OTg4ZUBvcmFjbGUuY29tL1QvI3UKClRoYW5rIHlvdSBmb3IgZGlnZ2luZyB0aGlzIHVwLiBIb3dl
dmVyIEknbSBzdGlsbCBjb25mdXNlZCwgYmVjYXVzZQp0aGlzIGlzIGV4YWN0bHkgaG93IHdlIGNv
bmZpZ3VyZSBMaW51eCA2LjEgKGFsdGhvdWdoIHdlIGRvIGhhdmUKQ09ORklHX0tFWEVDX0ZJTEUg
ZW5hYmxlZCkgYW5kIHdlIGRvbid0IGhhdmUgYW55IHByb2JsZW1zLiBJIGJlbGlldmUKd2UgZGlk
IG5vdCBpbnZlc3RpZ2F0ZSB0aGlzIGlzc3VlIHByb3Blcmx5LgoKPiBBbmQgYmVzaWRlcywgdGhl
IG5ld2x5IGFkZGVkIENPTkZJR19DUkFTSF9IT1RQTFVHIGFsc28gbmVlZHMKPiBDT05GSUdfS0VY
RUMgaWYgdGhlIGVsZmNvcmVoZHIgaXMgYWxsb3dlZCB0byBiZSBtYW5pcHVsYXRlZCB3aGVuCj4g
Y3B1L21lbW9yeSBob3RwbHVnIGhhcGVuZWQuCgpUaGlzIHN0aWxsIGZlZWxzIGxpa2UgYSByZWdy
ZXNzaW9uIHRvIG1lOiBhbnkgY3Jhc2ggZHVtcCBzdXBwb3J0CnNob3VsZCBiZSBpbmRlcGVuZGVu
dCBvZiBLRVhFQyBzeXNjYWxscyBiZWluZyBwcmVzZW50LiBXaGlsZSBwcm9iYWJseQp0aGUgY29t
bW9uIGNhc2UgKGluY2x1ZGluZyB1cykgdGhhdCB0aGUgY3Jhc2hpbmcga2VybmVsIGFuZCByZWNv
dmVyeQprZXJuZWwgYXJlIHRoZSBzYW1lLCB0aGV5IGRvbid0IGhhdmUgdG8gYmUuIFdlIG5lZWQg
a2V4ZWMgc3lzY2FsbCBpbgp0aGUgY3Jhc2hpbmcga2VybmVsLCBidXQgY3Jhc2hkdW1wIHN1cHBv
cnQgaW4gdGhlIHJlY292ZXJ5IGtlcm5lbCAoYnV0CnRoZSByZWNvdmVyeSBrZXJuZWwgbm90IGhh
dmluZyB0aGUga2V4ZWMgc3lzY2FsbHMgc2hvdWxkIGJlIHRvdGFsbHkKZmluZSkuIElmIHdlIGRv
IHJlcXVpcmUgc29tZSBjb2RlIGRlZmluaXRpb25zIGZyb20ga2V4ZWMgLSBhdCBtb3N0IHdlCnNo
b3VsZCBwdXQgdGhlbSB1bmRlciBDT05GSUdfS0VYRUNfQ09SRS4KCj4gVGhhbmtzCj4gQmFvcXVh
bgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
