Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22D4E7716B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 03:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uy9O5Pm0ovcphR48ko/60nSCNLTqywxR5r9zTu6GFPM=; b=F1KsqHis9JtyTO
	xhm0Cns0cOzEHsmAZzCEhiETfRPUsOQ16kN8Nw2oAR5Aca/7clswDOsmjP9cHJ3ueDr4dZ2AvoAlj
	mOxxpJ7aqnGc6lWlutTN6Y38OXcra5ZgrcczQy9adDJpGBbsVHslPWiMAps5mrmR9Om3/lh7l594H
	sLxWp2Skt9zJrZ8NcVzFbDQod5d81lAWmDBS+XKkeAnOZBUDDRxSdeaZq8NPs/SlodX2642j804fO
	KVN2F9kq4Cur8IbreypsgfRmglnFioo7JVDIiKMsPyvpIkiSmVXZA3z96QYL0Osm167V9CAFvRnwd
	HNvt3WG+qUMrQTa38ULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIgIf-0000000BP7x-2sgQ;
	Wed, 04 Dec 2024 03:43:41 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIgIc-0000000BP6q-1vyC
	for linux-riscv@lists.infradead.org;
	Wed, 04 Dec 2024 03:43:40 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-841a9366b08so205489439f.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Dec 2024 19:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1733283817; x=1733888617; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGkT/pl1gB1Evs4ReRwjiJx5mPh/IBj5HFwD48IlujU=;
        b=a4NgtdO/gk7Ss134NcYDNBST/22Uw/8adMipPRMKhw+YfdMFTedxt2VgH4yn4LM4LR
         4EvCWwSCjKvK2QA3Y5g239mYkEZlSLQEnZElwNx+s6e0H4wVdCG1JlWDiKdwMYdXOT//
         Ox2IBx54GuT1flc0YGgAESqLPczm+qoK/CXr/Nz9GUzyUUg36F24GFJjRRC0gnZcq73H
         CNG58+8TygYmj8OoKitVvMK35VXkJeltKcx7f4M0xaa7YOWC8lNaSS6jPfeaUci8fD6V
         nDsEc0NDckdIVMEDl3ylylQ5764w73RiTY/D7ic+JtjS9Ow7tEEhIxVvRFRYrTpwxais
         Le3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733283817; x=1733888617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGkT/pl1gB1Evs4ReRwjiJx5mPh/IBj5HFwD48IlujU=;
        b=ETDbShOJec0or7je/kunYo5UrLP1QePkHwFx09uCb2ZhZhB/6lpdprElsdCbcqZLRV
         iP9mhyxFIEUznVHb8bNd3GDgGAaPSuHpVkOqE+OIELoV2FiYNZkKWW+BRCMx5NujubVv
         AWyqrSjmQxVY6Wizk6bqf7ZPEhZsJ/AiR3fyKwvEw63OxeV9l1zNz2dwUU3lGNXUPY7Z
         MdfIvTod1+1VmEQ2i98v0VmhEikiS1R5qYxC1NuF6MwOgufk5XzY8BaGgyL6hdfp2xHu
         9vJSxcsRTLyqHEyItt+Cs0J6oY8UtlyReYm+L1PJT1LbBkP/8tTClZrLUtTSur/YCFcZ
         IGEA==
X-Forwarded-Encrypted: i=1; AJvYcCWDo7kcRY7H3iaQ7lgP35ZbxfyFcxBZU3M010oy+I+7dsi1rTjaYRO4ydI3nzGad/sCsnlmXPeXJcX/Xw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz2I65N16F9A9jQz31AKWY9V9pnhbeaJTQFucBjR8dGP4r+Uvp
	2rpckKZw2cKUwUJ7v7qYKUIquQR0k4eGpu6rk0D3RR4uXqq8oC79H79CXdFUnHCcxQ44Z4hqQoQ
	wCyRGZIONmKYXT/Qxn9tUyITIk2L/M3neveK6BA==
X-Gm-Gg: ASbGncsJk3XjRBuz/0XSP85HNQth4ef+DiwuxIoOS6dzKbG+8BiSsIyg6NLK03LfdcC
	cr4rTqa+VUjo9dHjtSyuGuTbe8Evom6SJ/A==
X-Google-Smtp-Source: AGHT+IGWdFp8FF+1NtOQA0riwNaVCNa+lNq7c5BS40O1U8dW0QvsTp35bk3sIYPxMlaLCPGVX4HHb6tLAmO9iVR0CsU=
X-Received: by 2002:a05:6602:29c8:b0:807:f0fb:1192 with SMTP id
 ca18e2360f4ac-8445b5477f8mr665966539f.1.1733283817005; Tue, 03 Dec 2024
 19:43:37 -0800 (PST)
MIME-Version: 1.0
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-18-ajones@ventanamicro.com> <87mshcub2u.ffs@tglx>
 <CAAhSdy08gi998HsTkGpaV+bTWczVSL6D8c7EmuTQqovo63oXDw@mail.gmail.com>
 <874j3ktrjv.ffs@tglx> <87ser4s796.ffs@tglx>
In-Reply-To: <87ser4s796.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Dec 2024 09:13:24 +0530
Message-ID: <CAAhSdy27gaVJaXBrx8GB+Xr4ZTvp8hd0Jg8JokzehgC-=5pOmA@mail.gmail.com>
Subject: Re: [RFC PATCH 01/15] irqchip/riscv-imsic: Use hierarchy to reach irq_set_affinity
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>, iommu@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tjeznach@rivosinc.com, zong.li@sifive.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, atishp@atishpatra.org, alex.williamson@redhat.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_194338_762534_6B8B48C2 
X-CRM114-Status: GOOD (  35.78  )
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

T24gV2VkLCBEZWMgNCwgMjAyNCBhdCA0OjI54oCvQU0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gVHVlLCBEZWMgMDMgMjAyNCBhdCAyMTo1NSwgVGhv
bWFzIEdsZWl4bmVyIHdyb3RlOgo+ID4gT24gVHVlLCBEZWMgMDMgMjAyNCBhdCAyMjowNywgQW51
cCBQYXRlbCB3cm90ZToKPiA+PiBPbiBUdWUsIERlYyAzLCAyMDI0IGF0IDc6MjPigK9QTSBUaG9t
YXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4gd3JvdGU6Cj4gPj4+IFNvcnJ5LCBJIG1p
c3NlZCB0aGF0IHdoZW4gcmV2aWV3aW5nIHRoZSBvcmlnaW5hbCBJTVNJQyBNU0kgc3VwcG9ydC4K
PiA+Pj4KPiA+Pj4gVGhlIHdob2xlIElNU0lDIE1TSSBzdXBwb3J0IGNhbiBiZSBtb3ZlZCBvdmVy
IHRvIE1TSSBMSUIgd2hpY2ggbWFrZXMgYWxsCj4gPj4+IG9mIHRoaXMgaW5kaXJlY3Rpb24gZ28g
YXdheSBhbmQgeW91ciBpbnRlcm1lZGlhdGUgZG9tYWluIHdpbGwganVzdCBmaXQKPiA+Pj4gaW4u
Cj4gPj4+Cj4gPj4+IFVuY29tcGlsZWQgcGF0Y2ggYmVsb3cuIElmIHRoYXQgd29ya3MsIGl0IG5l
ZWRzIHRvIGJlIHNwbGl0IHVwIHByb3Blcmx5Lgo+ID4+Pgo+ID4+PiBOb3RlLCB0aGlzIHJlbW92
ZXMgdGhlIHNldHVwIG9mIHRoZSBpcnFfcmV0cmlnZ2VyIGNhbGxiYWNrLCBidXQgdGhhdCdzCj4g
Pj4+IGZpbmUgYmVjYXVzZSBvbiBoaWVyYXJjaGljYWwgZG9tYWlucyBpcnFfY2hpcF9yZXRyaWdn
ZXJfaGllcmFyY2h5KCkgaXMKPiA+Pj4gaW52b2tlZCBhbnl3YXkuIFNlZSB0cnlfcmV0cmlnZ2Vy
KCkuCj4gPj4KPiA+PiBUaGUgSU1TSUMgZHJpdmVyIHdhcyBtZXJnZWQgb25lIGtlcm5lbCByZWxl
YXNlIGJlZm9yZSBjb21tb24KPiA+PiBNU0kgTElCIHdhcyBtZXJnZWQuCj4gPgo+ID4gQWggaW5k
ZWVkLgo+ID4KPiA+PiBXZSBzaG91bGQgZGVmaW5pdGVseSB1cGRhdGUgdGhlIElNU0lDIGRyaXZl
ciB0byB1c2UgTVNJIExJQiwgSSB3aWxsCj4gPj4gdHJ5IHlvdXIgc3VnZ2VzdGVkIGNoYW5nZXMg
KGJlbG93KSBhbmQgcG9zdCBhIHNlcGFyYXRlIHNlcmllcy4KPiA+Cj4gPiBQaWNrIHVwIHRoZSBk
ZWx0YSBwYXRjaCBJIGdhdmUgQW5kcmV3Li4uCj4KPiBBcyBJIHdhcyBsb29raW5nIGF0IHNvbWV0
aGluZyBlbHNlIE1TSSByZWxhdGVkIEkgaGFkIGEgbG9vayBhdAo+IGltc2ljX2lycV9zZXRfYWZm
aW5pdHkoKSBhZ2Fpbi4KPgo+IEl0J3MgYWN0dWFsbHkgcmVxdWlyZWQgdG8gaGF2ZSB0aGUgbWVz
c2FnZSB3cml0ZSBpbiB0aGF0IGZ1bmN0aW9uIGFuZAo+IG5vdCBhZnRlcndhcmRzIGFzIHlvdSBp
bnZva2UgaW1zaWNfdmVjdG9yX21vdmUoKSBmcm9tIHRoYXQgZnVuY3Rpb24uCj4KPiBUaGF0J3Mg
b2J2aW91c2x5IG5vdCB0cnVlIGZvciB0aGUgcmVtYXAgY2FzZSBhcyB0aGF0IHdpbGwgbm90IGNo
YW5nZSB0aGUKPiBtZXNzYWdlIGFkZHJlc3MvZGF0YSBwYWlyIGJlY2F1c2UgdGhlIHJlbWFwIHRh
YmxlIGVudHJ5IGlzIGltbXV0YWJsZSAtCj4gYXQgbGVhc3QgSSBhc3N1bWUgc28gZm9yIG15IG1l
bnRhbCBzYW5pdHkgc2FrZSA6KQo+Cj4gQnV0IHRoYXQgYnJpbmdzIG1lIHRvIGEgcmVsYXRlZCBx
dWVzdGlvbi4gSG93IGlzIHRoaXMgc3VwcG9zZWQgdG8gd29yawo+IHdpdGggbm9uLWF0b21pYyBt
ZXNzYWdlIHVwZGF0ZXM/IFBDSS9NU0kgZG9lcyBub3QgbmVjZXNzYXJpbHkgcHJvdmlkZQo+IG1h
c2tpbmcsIGFuZCB0aGUgd3JpdGUgb2YgdGhlIGFkZHJlc3MvZGF0YSBwYWlyIGlzIGRvbmUgaW4g
Yml0cyBhbmQKPiBwaWVjZXMuIFNvIHlvdSBjYW4gZW5kIHVwIHdpdGggYW4gaW50ZXJtZWRpYXRl
IHN0YXRlIHNlZW4gYnkgdGhlIGRldmljZQo+IHdoaWNoIGVuZHMgdXAgc29tZXdoZXJlIGluIGlu
dGVycnVwdCBuaXJ2YW5hIHNwYWNlLgo+Cj4gU2VlIHRoZSBkYW5jZSBpbiBtc2lfc2V0X2FmZmlu
aXR5KCkgYW5kIGNvbW1pdCA2ZjFhNDg5MWE1OTIKPiAoIng4Ni9hcGljL21zaTogUGx1ZyBub24t
bWFza2FibGUgTVNJIGFmZmluaXR5IHJhY2UiKSBmb3IgZnVydGhlcgo+IGV4cGxhbmF0aW9uLgo+
Cj4gVGhlIHdheSBob3cgdGhlIElNU0lDIGRyaXZlciB3b3JrcyBzZWVtcyB0byBiZSBwcmV0dHkg
bXVjaCB0aGUgc2FtZSBhcwo+IHRoZSB4ODYgQVBJQyBtZXNzOgo+Cj4gICAgICAgICBAYWRkcmVz
cyBpcyB0aGUgcGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUgcGVyIENQVSBNU0kgdGFyZ2V0Cj4gICAg
ICAgICBhZGRyZXNzIGFuZCBAZGF0YSBpcyB0aGUgdmVjdG9yIElEIG9uIHRoYXQgQ1BVLgo+Cj4g
U28gdGhlIG5vbi1hdG9taWMgdXBkYXRlIGluIGNhc2Ugb2Ygbm9uLW1hc2thYmxlIE1TSSBzdWZm
ZXJzIGZyb20gdGhlCj4gc2FtZSBwcm9ibGVtLiBJdCB3b3JrcyBtb3N0IG9mIHRoZSB0aW1lLCBi
dXQgaWYgaXQgZG9lc24ndCB5b3UgbWlnaHQKPiBzdGFyZSBhdCB0aGUgb2NjYXNpb25hbGx5IGxv
c3QgaW50ZXJydXB0IGFuZCB0aGUgc3RhbGUgZGV2aWNlIGluCj4gZGlzYmVsaWVmIGZvciBxdWl0
ZSBhIHdoaWxlIDopCgpZZXMsIHdlIGhhdmUgdGhlIHNhbWUgY2hhbGxlbmdlcyBhcyB4ODYgQVBJ
QyB3aGVuIGNoYW5naW5nCk1TSSBhZmZpbml0eS4KCj4KPiBJIG1pZ2h0IGJlIG1pc3Npbmcgc29t
ZXRoaW5nIHdoaWNoIG1hZ2ljYWxseSBwcmV2ZW50IHRoYXQgdGhvdWdoIDopCj4KCllvdXIgdW5k
ZXJzdGFuZGluZyBpcyBjb3JyZWN0LiBJbiBmYWN0LCB0aGUgSU1TSUMgbXNpX3NldF9hZmZpbml0
eSgpCmhhbmRsaW5nIGlzIGluc3BpcmVkIGZyb20geDg2IEFQSUMgYXBwcm9hY2ggZHVlIHRvIHNp
bWlsYXJpdHkgaW4KdGhlIG92ZXJhbGwgTVNJIGNvbnRyb2xsZXIuCgpUaGUgaGlnaC1sZXZlbCBp
ZGVhIG9mIGltc2ljX2lycV9zZXRfYWZmaW5pdHkoKSBpcyBhcyBmb2xsb3dzOgoKMSkgQWxsb2Nh
dGUgbmV3X3ZlY3RvciAobmV3IENQVSBJTVNJQyBhZGRyZXNzICsgbmV3IElEIG9uIHRoYXQgQ1BV
KQoKMikgVXBkYXRlIHRoZSBNU0kgYWRkcmVzcyBhbmQgZGF0YSBwcm9ncmFtbWVkIGluIHRoZSBk
ZXZpY2UKYmFzZWQgb24gbmV3X3ZlY3RvciAoc2VlIGltc2ljX21zaV91cGRhdGVfbXNnKCkpCgoz
KSBBdCB0aGlzIHBvaW50IHRoZSBkZXZpY2UgcG9pbnRzIHRvIHRoZSBuZXdfdmVjdG9yIGJ1dCBv
bGRfdmVjdG9yCihvbGQgQ1BVIElNU0lDIGFkZHJlc3MgKyBvbGQgSUQgb24gdGhhdCBDUFUpIGlz
IHN0aWxsIGVuYWJsZWQgYW5kCndlIG1pZ2h0IGhhdmUgcmVjZWl2ZWQgTVNJIG9uIG9sZF92ZWN0
b3Igd2hpbGUgd2Ugd2VyZSBidXN5CnNldHRpbmcgdXAgYSBuZXdfdmVjdG9yIGZvciB0aGUgZGV2
aWNlLiBUbyBhZGRyZXNzIHRoaXMsIHdlIGNhbGwKaW1zaWNfdmVjdG9yX21vdmUoKS4KCjQpIFRo
ZSBpbXNpY192ZWN0b3JfbW92ZSgpIG1hcmtzIHRoZSBvbGRfdmVjdG9yIGFzIGJlaW5nCm1vdmVk
IGFuZCBzY2hlZHVsZXMgYSBsYXp5IHRpbWVyIG9uIHRoZSBvbGQgQ1BVLgoKNSkgVGhlIGxhenkg
dGltZXIgZXhwaXJlcyBvbiB0aGUgb2xkIENQVSBhbmQgcmVzdWx0cyBpbgpfX2ltc2ljX2xvY2Fs
X3N5bmMoKSBiZWluZyBjYWxsZWQgb24gdGhlIG9sZCBDUFUuCgo2KSBJZiB0aGVyZSB3YXMgYSBw
ZW5kaW5nIE1TSSBvbiB0aGUgb2xkIHZlY3RvciB0aGVuIHRoZQpfX2ltc2ljX2xvY2FsX3N5bmMo
KSBmdW5jdGlvbiBpbmplY3RzIGFuIE1TSSB0byB0aGUKbmV3X3ZlY3RvciB1c2luZyBhbiBNTUlP
IHdyaXRlLgoKSXQgaXMgdmVyeSB1bmxpa2VseSB0aGF0IGFuIE1TSSBmcm9tIGRldmljZSB3aWxs
IGJlIGRyb3BwZWQKKHVubGVzcyBJIGFtIG1pc3Npbmcgc29tZXRoaW5nKSBidXQgdGhlIHVuc29s
dmVkIGlzc3VlCmlzIHRoYXQgaGFuZGxpbmcgb2YgaW4tZmxpZ2h0IE1TSSByZWNlaXZlZCBvbiB0
aGUgb2xkX3ZlY3RvcgpkdXJpbmcgdGhlIE1TSSByZS1wcm9ncmFtbWluZyBpcyBkZWxheWVkIHdo
aWNoIG1heSBoYXZlCnNpZGUgZWZmZWN0cyBvbiB0aGUgZGV2aWNlIGRyaXZlciBzaWRlLgoKSSBi
ZWxpZXZlIGluIHRoZSBmdXR1cmUgUklTQy1WIEFJQSB2Mi4wICh3aGVuZXZlciB0aGF0CmhhcHBl
bnMpIHdpbGwgYWRkcmVzcyB0aGUgZ2FwcyBpbiBBSUEgdjEuMCAobGlrZSB0aGlzIG9uZSkuCgpS
ZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
