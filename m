Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD5DC27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 02:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SOL8rcLJ4V95oL4dsAFExemxF6aGzHR1evUTtg37keQ=; b=SPIs7EfH3n+Li/
	aqbIozija/hjZkq9Do9zAsaEUBtwABWSKzAQWpA/KqujWfaS5aqBt19J0Jov7nsAlKrQEYSZlhxXu
	kUek8zhOC2kpdRWN1CuMweEQ94SSS4ArPP2gI2ftUCkg1cX6b6tfBBkdcqFs3PZu/3Ze2qIj3h6x/
	CeOFl7FmFr9Kw/rE7svHkynRJqxfERAOvAmkDKMlbMmZm1FxNKbdPH9+U+1Jh1WTHg+Pk+nJMs2xu
	MZO06hhY4k+SJo9hJqLyWD8mDY+sB4U2uh6S0z2pIVJ/mE01tZKMpPXLTDP0UhnXF3flw7Es8XfJ3
	iOephzWmCbj2O3px4LRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGqoc-000000076oI-2wAm;
	Tue, 11 Jun 2024 02:00:50 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGqoY-000000076nT-1Wo1
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 02:00:48 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2c2c9199568so2806924a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 19:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718071245; x=1718676045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DSf+TQt/ykv0XritXEDrZm1XQB4nWMsT88cdtUciK4=;
        b=huksX2+AmzZn4spC+0Dkxdj3L3mM664Lr4SuO2p17JbfEEyWFZVIM/N8BIAluqNfz/
         ul03x25O5TZcc1cYWzBAKw44lds2k0+YQjYGh5yB9iz3goklDyTDbP3VZrVHaVqvc3WG
         WxBVetItRllWDLotmIwgUQRRvLOBsk9cPsNAYcAnUtIRBSUe1mAY17D3pEK3yZNYTVmD
         iSiTzV1W604YgQm1qJTzTcMHi3ZATgG7ZmT0N9kXVCzENPm0N6BhjJUVY/F6PPhP5Bhb
         ej/5KXk/Wf/nsbg2ezlRR0458a6LSmt4AVSkchxOcAXx/evRIvsYftMqUdoIMSRt0oao
         4R9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718071245; x=1718676045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DSf+TQt/ykv0XritXEDrZm1XQB4nWMsT88cdtUciK4=;
        b=YTWvQrZffAnIfO6IsAbyG27mcjtQ16QXeVh0XH84I+x7EUwelkdJ7vfVoMgBSEPe86
         sHET6B4cci18EBs+qi7eQY41/90UIYrcyzje1Uz9gIQaErP8uWvxWrd6laRuMZbJjO8z
         9pNyaNmYrI0NKcrjJIrtrcSrQIPc0eTwvt9MB+/mvnRJqRPyh/gHyANl5pWzU2Jplkzi
         nmKtAHEl7LvbeMWRawp/Tzr2CSPDh0+Rjs5kqh+bT8QSY07d9e7sDyVs+4RJJ3fBzF6C
         f5nz9jOk82tSQ4rCu6pXfj774BAxXb6oN6RLzdPwnoLooVyb7BGjPMQjBK/iRDm1333x
         vSsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMm8gtsTlCnzM+ccX6bAsim1XWezXDGnBkh82r8StkqftISRgbqZju7hnFPviFMLy6nQsLCknXInxa8CC1WmmUaiZMIyfWX3VumfM22t/S
X-Gm-Message-State: AOJu0Yz4Yukr/35ixIOI1ThlIBKnRRXFZ7ThQmnqByg41ziR2+RF1fhv
	Abhw4b2LF+wBb/Itj6EsfyKUMjYhSHTQGbK2+WA+7CGmsw7b/hHadSjXJsVRZ504gth4tCxQQge
	O34MIwrsT100Fyj0wAjRL+oaECMBiiJCRWzvFdQ==
X-Google-Smtp-Source: AGHT+IFaEf66/Vg3vZYbnuRls+xXc/YHx5d34274xkIrynnlPOHBe1Yws9C0iL9BtwTmDzbsneqNZTkOP1VlcYJjqz4=
X-Received: by 2002:a17:90a:12c2:b0:2c2:5341:7ed6 with SMTP id
 98e67ed59e1d1-2c2bcc5a26emr10217116a91.38.1718071245048; Mon, 10 Jun 2024
 19:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1716578450.git.tjeznach@rivosinc.com> <e18ec8ac169ae7f76e9044c26d0768e6469bad19.1716578450.git.tjeznach@rivosinc.com>
 <CANXhq0p4gERQeROSCSKqxnRZq9-fGfmROGV8JZyqFaenNpnsLA@mail.gmail.com>
 <20240610174934.GM791043@ziepe.ca> <CAH2o1u4c6ttUWTb1zrc8DScDMuDJJYR-tTHCPYW_3FV4uuQDtA@mail.gmail.com>
 <20240610222051.GO791043@ziepe.ca>
In-Reply-To: <20240610222051.GO791043@ziepe.ca>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Mon, 10 Jun 2024 19:00:34 -0700
Message-ID: <CAH2o1u7X2zu42ZYA9wBe4bmCXN9v+d6j9vo5DMifJA3BUew91w@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] iommu/riscv: Device directory management.
To: Jason Gunthorpe <jgg@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_190046_533495_E6348F19 
X-CRM114-Status: GOOD (  35.95  )
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
Cc: Zong Li <zong.li@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Jim Shu <jim.shu@sifive.com>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Vincent Chen <vincent.chen@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMTAsIDIwMjQgYXQgMzoyMOKAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDEwLCAyMDI0IGF0IDExOjQ4OjIzQU0gLTA3
MDAsIFRvbWFzeiBKZXpuYWNoIHdyb3RlOgo+ID4gPiBSaWdodCwgdGhpcyBpcyB3aHkgSSBhc2tl
ZCBhYm91dCBuZWdhdGl2ZSBjYWNoaW5nLgo+ID4gPgo+ID4gPiBUaGUgVk1NcyBhcmUgYSBwcmlt
ZSBleGFtcGxlIG9mIG5lZ2F0aXZlIGNhY2hpbmcsIGluIHNvbWV0aGluZyBsaWtlCj4gPiA+IHRo
ZSBTTU1VIGltcGxlbWVudGF0aW9uIHRoZSBWTU0gd2lsbCBjYWNoZSB0aGUgVj0wIFNURSB1bnRp
bCB0aGV5IHNlZQo+ID4gPiBhbiBpbnZhbGlkYXRpb24uCj4gPiA+Cj4gPiA+IERyaXZpbmcgdGhl
IFZNTSBzaGFkb3dpbmcvY2FjaGluZyBlbnRpcmVseSBvZmYgb2YgdGhlIHN0YW5kYXJkCj4gPiA+
IGludmFsaWRhdGlvbiBtZWNoYW5pc20gaXMgc28gbXVjaCBiZXR0ZXIgdGhhbiBhbnkgb3RoZXIg
b3B0aW9uLgo+ID4gPgo+ID4gPiBJTUhPIHlvdSBzaG91bGQgaGF2ZSB0aGUgUklTQ1Ygc3BlYyBy
ZXZpc2VkIHRvIGFsbG93IG5lZ2F0aXZlIGNhY2hpbmcKPiA+ID4gaW4gYW55IGludmFsaWRhdGVk
IGRhdGEgc3RydWN0dXJlIHRvIHBlcm1pdCB0aGUgdHlwaWNhbCBWTU0gZGVzaWduCj4gPiA+IGRy
aXZlbiBvZmYgb2Ygc2hhZG93aW5nIHRyaWdnZXJlZCBieSBpbnZhbGlkYXRpb24gY29tbWFuZHMu
Cj4gPiA+Cj4gPiA+IE9uY2UgdGhlIHNwZWMgcGVybWl0cyBuZWdhdGl2ZSBjYWNoaW5nIHRoZW4g
dGhlIHNvZnR3YXJlIHdvdWxkIGhhdmUgdG8KPiA+ID4gaW52YWxpZGF0ZSBhZnRlciBnb2luZyBW
PTAgLT4gVj0xLgo+ID4gPgo+ID4gPiBKYXNvbgo+ID4KPiA+IEFsbG93aW5nIG5lZ2F0aXZlIGNh
Y2hlaW5nIGJ5IHRoZSBzcGVjIChlLmcuIGZvciBWTU0gdXNlIGNhc2VzKSBhbmQKPiA+IGRvY3Vt
ZW50aW5nIHJlcXVpcmVkIGludmFsaWRhdGlvbiBzZXF1ZW5jZXMgd291bGQgZGVmaW5pdGVseSBo
ZWxwCj4gPiBoZXJlLgo+Cj4gWWVzLCB5b3UgcHJvYmFibHkgc2hvdWxkIHJlYWxseSBkbyB0aGF0
Lgo+Cj4gPiBJJ20gaGVzaXRhdGluZyBhZGRpbmcgSU9ESVIuSU5WQUwgdGhhdCBpcyBub3QgcmVx
dWlyZWQgYnkgdGhlCj4gPiBzcGVjIFsxXSwKPgo+IElmIHlvdSBleHBlY3QgdG8gcmFwaWRseSBy
ZXZpc2UgdGhlIHNwZWMgdGhlbiB5b3Ugc2hvdWxkIGFkZCBpdCByaWdodAo+IG5vdyBzbyB0aGF0
IGFsbCBTVyBpbXBsZW1lbnRhdGlvbnMgdGhhdCBleGlzdCBhcmUKPiBjb25mb3JtaW5nLiBPdGhl
cndpc2UgeW91J2xsIGhhdmUgY29tcGF0YWJpbGl0eSBwcm9ibGVtcyB3aGVuIHlvdSBjb21lCj4g
dG8gaW1wbGVtZW50IG5lc3RpbmcuCj4KPiBPYnZpb3VzbHkgdGhlIFZNTSBjYW4ndCByZWx5IG9u
IGEgbmVnYXRpdmUgY2FjaGluZyB0ZWNobmlxdWUgdW5sZXNzCj4gdGhlIHNwZWMgc2F5cyBpdCBj
YW4uCj4KPiA+IGJ1dCB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IGNhbiBiZSBjb250cm9sbGVkIGJ5
IGEKPiA+IGNhcGFiaWxpdGllcy9mZWF0dXJlIGJpdCBvbmNlIGFkZGVkIHRvIHRoZSBzcGVjaWZp
Y2F0aW9uIG9yIGJhc2VkIG9uCj4gPiBWSUQ6RElEIG9mIHRoZSBlbXVsYXRlZCBSaXNjLVYgSU9N
TVUuCj4KPiBJJ20gbm90IHN1cmUgaXQgcmVhbGx5IGNhbi4gT25jZSB5b3Ugc3RhcnQgc2hpcHBp
bmcgU1cgcGVvcGxlIHdpbGwgcnVuCj4gaXQgaW4gYSBWTSBhbmQgdGhlIFZNTSB3aWxsIGhhdmUg
dG8gZm9yZXZlciB3b3JrIHdpdGhvdXQgbmVnYXRpdmUKPiBjYWNoaW5nLgo+Cj4gTXkgc3Ryb25n
IGFkdmljZSBpcyB0byBub3QgZXhwZWN0IHRoZSBWTU0gdHJhcCByYW5kb20gcGFnZXMgaW4gZ3Vl
c3QKPiBtZW1vcnksIHRoYXQgaXMgYSBodWdlIG1lc3MgdG8gaW1wbGVtZW50IGFuZCB3aWxsIGRl
bGF5IHlvdXIgVk1NIHNpZGUuCj4KPiA+IEFub3RoZXIgb3B0aW9uIHRvIGNvbnNpZGVyIGZvciBW
TU0gaXMgdG8gdXRpbGl6ZSB0aGUgV0FSTCBwcm9wZXJ0eSBvZgo+ID4gRERUUCwgYW5kIHByb3Zp
ZGUgZml4ZWQgbG9jYXRpb24gb2YgdGhlIHNpbmdsZSBsZXZlbCBERFRQLCBwb2ludGluZyB0bwo+
ID4gTU1JTyByZWdpb24sIHdoZXJlIEREVEUgdXBkYXRlcyB3aWxsIHJlc3VsdCBpbiB2bW0gZXhp
dCAvIGZhdWx0Cj4gPiBoYW5kbGVyLiBUaGlzIHdpbGwgbGlrZWx5IG5vdCBiZSBhcyBlZmZpY2ll
bnQgYXMgSU9ESVIuSU5WQUwgaXNzdWVkCj4gPiBmb3IgYW55IEREVEUgdXBkYXRlcy4KPgo+IEkg
ZG9uJ3Qga25vdyB3aGF0IGFsbCB0aG9zZSB0aGluZ3MgbWVhbiwgYnV0IGlmIHlvdSBtZWFuIHRv
IGhhdmUgdGhlCj4gVk1NIHN1cHBseSBmYXVsdGluZyBNTUlPIHNwYWNlIHRoYXQgdGhlIFZNIGlz
IGZvcmNlZCB0byBwdXQgdGhlIEREVEUKPiB0YWJsZSBpbnRvLCB0aGVuIHRoYXQgd291bGQgYmUg
YmV0dGVyLiBJdCBpcyBzdGlsbCBxdWl0ZSBhYm5vcm1hbCBmcm9tCj4gdGhlIFZNTSBzaWRlLi4K
Pgo+IE15IHN0cm9uZyBhZHZpY2UgaXMgdG8gZml4IHRoaXMuIEl0IGlzIHRyaXZpYWwgdG8gYWRk
IHRoZSBuZWdhdGl2ZQo+IGNhY2hpbmcgbGFuZ3VhZ2UgdG8gdGhlIHNwZWMgYW5kIHdpbGwgY2F1
c2UgaW5zaWduaWZpY2FudCBleHRyYSB3b3JrCj4gaW4gdGhpcyBkcml2ZXIuCj4KPiBUaGUgZ2Fp
bnMgb24gYXQgbGVhc3QgdGhlIGVhc2Ugb2YgVk1NIGltcGxlbWVudGF0aW9uIGFuZCBhcmNoaXRl
Y3R1cmFsCj4gc2ltaWxhcml0eSB0byBvdGhlciBhcmNoZXMgYXJlIHdlbGwgd29ydGggdGhlIGVm
Zm9ydC4gT3RoZXJ3aXNlIEkgZmVhcgo+IGl0IHdpbGwgYmUgYSBzdHJ1Z2dsZSB0byBnZXQgbmVz
dGluZyBzdXBwb3J0IGNvbXBsZXRlZCA6KAo+Cj4gSmFzb24KPgoKVGhhbmtzIGZvciB0aGUgY29t
bWVudHMsIGl0IGRlZmluaXRlbHkgbWFrZXMgc2Vuc2UuCgpXZSB3aWxsIHJldmlzZSB0aGUgd29y
ZGluZyBpbiB0aGUgUklTQy1WIElPTU1VIHNwZWMgdG8gbm90ZSB0aGF0CmNlcnRhaW4gaW1wbGVt
ZW50YXRpb25zIG1heSByZXF1aXJlIGludmFsaWRhdGluZyBjb21tYW5kcyB0byBiZSBpc3N1ZWQK
d2hlbiBtYWtpbmcgRERUIGVudHJpZXMgdmFsaWQsIGFuZCBkZXZpY2UgdHJlZSAvIEFDUEkgbWF5
IGJlIHVzZWQgdG8KcmVwb3J0IHN1Y2ggcmVxdWlyZW1lbnQuCgpGb3Igbm93LCBJJ2xsIGNoYW5n
ZSB0aGUgaW1wbGVtZW50YXRpb24gdG8gYXNzdW1lIG5lZ2F0aXZlIGNhY2hpbmcgZm9yCkREVEUg
YW5kIHdpbGwgZm9sbG93IHVwIHdpdGggZGV2aWNlIHRyZWUgLyBkcml2ZXIgdXBkYXRlcyB0byBt
YWtlIHRoZQppbnZhbGlkYXRpb24gb3B0aW9uYWwgd2hlbiByZXZpc2VkIHNwZWNpZmljYXRpb25z
IHdpbGwgYmUgYXZhaWxhYmxlLgoKQmVzdCwKLSBUb21hc3oKCj4gLS0KPiBZb3UgcmVjZWl2ZWQg
dGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRoZSBHb29nbGUgR3Jv
dXBzICJsaW51eCIgZ3JvdXAuCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBz
dG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byBsaW51eCt1bnN1
YnNjcmliZUByaXZvc2luYy5jb20uCj4gVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24gdGhlIHdl
YiB2aXNpdCBodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2Evcml2b3NpbmMuY29tL2QvbXNnaWQv
bGludXgvMjAyNDA2MTAyMjIwNTEuR083OTEwNDMlNDB6aWVwZS5jYS4KPiBGb3IgbW9yZSBvcHRp
b25zLCB2aXNpdCBodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2Evcml2b3NpbmMuY29tL2Qvb3B0
b3V0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
