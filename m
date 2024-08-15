Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5476C531DE
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 19:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QcjWIQ3GkawAC0YZKjAqOnYGq5N9OKX3da5YfFYi9J0=; b=YXfUaVT5VWaLKYsQTYy0vwkon2
	QFc2KFJXCfxlb8vRXJnpJT06nBWhqKqtl6zuz8zxmWKuntmkI/Yaz+cPJi//sv9abpW7Mrknhziy7
	TR2GPpyKI5qBY4ATZMbq3zQodaEwjOu3g9qLehU5i5JcgjOpKof+g+9vsj6UKzUgOVAzWSQ0MKm5F
	55kV580gDiMBO3StreX7I92+OcJE16+f4fDCpCoFnk5/C7mi1HVZdc4T9ATC+UcwYwgFegQk+BJhS
	O4VzL/wafRrqGM/5vt9f5ZGzMZj/yR2FCymDcm4JutTEHb8/Nw8/EGyoMpeTWG8k/SxFrzsmXJpbI
	JPkfEprA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sefif-0000000ApyP-42Mt;
	Thu, 15 Aug 2024 19:01:09 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seedg-0000000AhaT-081P
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 17:51:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-201f44ad998so4736855ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 10:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1723744314; x=1724349114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRJah67TbxjThycfUyfvCHfdY4HH94LjxhqJhibVK8U=;
        b=HDJyFxSMqUeOzzcxNtLfXHsQoUaL8l4rGjsxClSzX8nuVvbTUsThBYb+74Tjkygq9H
         pGZqSKW2w9Uuf1Gsp83N1k6ijWCbzudef/ONx/a9YOBeQMxv4l1Yt7tvCt5Mwn0olvNk
         YEN0/UBEVaCQZ3mYIgIx0sFZW0SmnftZ4VLIKuRWqPuqyau2OUZFBuxRX4mKd98uYvly
         3ozv5OpM0LypWBVw02rVUn0nfBy/mEOFgK83gaYeIR20AIBREKMZTNpSVq4lkvq6TkjR
         ZL+cC0XpxBTk2KlswgevRkFDb2eYSY+gJ//qeLxTYR4ABE770EGH1QdHJl84cYQLAykV
         LxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723744314; x=1724349114;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRJah67TbxjThycfUyfvCHfdY4HH94LjxhqJhibVK8U=;
        b=Rdzf6oWVTQKCaoF6P+QHiO8qDac5B8+e9WMyG59V9Iv3ushMPMeYJEDE1TeviypiTo
         esS2qz2dnzteYebVlT2PzoCzPTKvjURzJzkqIaWSIoblBTQ3dBW/fLPGH60GdDC/jC6/
         M4nXoP9tPbKS2MaLxf2xSRnVmkt5VwOd5m75wj24e6ZcjtoZ5taTuNriZomvVtnxJeD3
         uWdm6uhRpwdsWU5b2Mpl9om9r6+Po6j7ZnJaFlEvKQw46twXQHvJbS0IWRMxRD494esz
         ugoWgnpMZAHNvwld/DnAPsnFHIdGVLQphh4+8/UF0N+6F068ZPaB/kQb/GvFLkxaYywP
         LDvg==
X-Forwarded-Encrypted: i=1; AJvYcCX3lmrXKOI7F01mLGSbE9THReXtQsMhWeu0k9Jgrw/oZ7qYcV63npBZh+twsxopu6O5iUVVkepZuwuAejTyo6zYGnA7E5pVT2HhTlsH16AX
X-Gm-Message-State: AOJu0YzaBWZxiplLhknLdkLTTNVwyrv13OBT1+VSVAFjsrF+ve1TwMCo
	h6cCO+juiRLyOyc44+ruz33FQzV4gh6dHnGDE0Hz/asRa9zQomJi6/W88SpH0kM=
X-Google-Smtp-Source: AGHT+IEsMGhrczyluFT0sZ5+rH/TAc2rZWVoaPptj0S3ZaI57W71deYHr3CXbzQHzJZZ4EI0XV1yEg==
X-Received: by 2002:a17:902:e807:b0:1f9:e2c0:d962 with SMTP id d9443c01a7336-201ee519f73mr48179245ad.31.1723744314111;
        Thu, 15 Aug 2024 10:51:54 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0302e65sm12779255ad.60.2024.08.15.10.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 10:51:53 -0700 (PDT)
Date: Thu, 15 Aug 2024 10:51:53 -0700 (PDT)
X-Google-Original-Date: Thu, 15 Aug 2024 10:51:47 PDT (-0700)
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
In-Reply-To: <085c8332-d7f1-41df-8854-bee06291ba83@sifive.com>
CC: Renner Berthing <emil.renner.berthing@canonical.com>, apatel@ventanamicro.com,
  tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, daniel.lezcano@linaro.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel.holland@sifive.com
Message-ID: <mhng-91e79885-7652-42a4-aad0-f4713e7ac70d@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_105156_292351_BF9C889C 
X-CRM114-Status: GOOD (  31.17  )
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

T24gVGh1LCAxNSBBdWcgMjAyNCAwODo1OTozNyBQRFQgKC0wNzAwKSwgc2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbSB3cm90ZToKPiBIaSBFbWlsLAo+Cj4gT24gMjAyNC0wOC0xNSAxMDowNyBBTSwg
RW1pbCBSZW5uZXIgQmVydGhpbmcgd3JvdGU6Cj4+IFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+Pj4g
T24gMjAyNC0wOC0xNSA5OjE2IEFNLCBBbnVwIFBhdGVsIHdyb3RlOgo+Pj4+IE9uIFRodSwgQXVn
IDE1LCAyMDI0IGF0IDc6NDHigK9QTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5k
ZT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+IE9uIFRodSwgQXVnIDE1IDIwMjQgYXQgMDg6MzIsIFNhbXVl
bCBIb2xsYW5kIHdyb3RlOgo+Pj4+Pj4gT24gMjAyNC0wOC0xNSA4OjE2IEFNLCBUaG9tYXMgR2xl
aXhuZXIgd3JvdGU6Cj4+Pj4+Pj4gWWVzLiBTbyB0aGUgcmlzY3YgdGltZXIgaXMgbm90IHdvcmtp
bmcgb24gdGhpcyB0aGluZyBvciBpdCBzdG9wcwo+Pj4+Pj4+IHNvbWVob3cuCj4+Pj4+Pgo+Pj4+
Pj4gVGhhdCdzIGNvcnJlY3QuIFdpdGggdGhlIChmaXJtd2FyZSkgZGV2aWNldHJlZSB0aGF0IEVt
aWwgaXMgdXNpbmcsIHRoZSBPcGVuU0JJCj4+Pj4+PiBmaXJtd2FyZSBkb2VzIG5vdCBoYXZlIGEg
dGltZXIgZGV2aWNlLCBzbyBpdCBkb2VzIG5vdCBleHBvc2UgdGhlIChvcHRpb25hbFsxXSkKPj4+
Pj4+IFNCSSB0aW1lIGV4dGVuc2lvbiwgYW5kIHNiaV9zZXRfdGltZXIoKSBkb2VzIG5vdGhpbmcu
Cj4+Pj4+Cj4+Pj4+IFNpZ2guIERvZXMgUklTQ1YgcmVhbGx5IGhhdmUgdG8gcmVwZWF0IGFsbCBt
aXN0YWtlcyB3aGljaCBoYXZlIGJlZW4gbWFkZQo+Pj4+PiBieSB4ODYsIEFSTSBhbmQgb3RoZXJz
IGJlZm9yZT8gSXQncyBrbm93biBmb3IgZGVjYWRlcyB0aGF0IHRoZSBrZXJuZWwKPj4+Pj4gcmVs
aWVzIG9uIGEgd29ya2luZyB0aW1lci4uLgoKSXQncyBldmVuIHdvcnNlIHRoYW4gdGhhdDogUklT
Qy1WIGRvZXNuJ3QgZXZlbiBtYW5kYXRlIGFueSB3b3JraW5nIApfaW5zdHJ1Y3Rpb25zXywgbXVj
aCBsZXNzIGFueXRoaW5nIGluIHRoZSBwbGF0Zm9ybS9maXJtd2FyZS4KCj4+Pj4gTXkgYXBvbG9n
aWVzIGZvciB0aGUgZGVsYXkgaW4gZmluZGluZyBhIGZpeCBmb3IgdGhpcyBpc3N1ZS4KPj4+Pgo+
Pj4+IEFsbW9zdCBhbGwgUklTQy1WIHBsYXRmb3JtcyAoZXhjZXB0IHRoaXMgb25lKSBoYXZlIFNC
SSBUaW1lciBhbHdheXMKPj4+PiBhdmFpbGFibGUgYW5kIExpbnV4IHVzZXMgYSBiZXR0ZXIgdGlt
ZXIgb3IgU3N0YyBleHRlbnNpb24gd2hlbmV2ZXIKPj4+PiBpdCBpcyBhdmFpbGFibGUuCj4+Pgo+
Pj4gU28gdGhpcyBpcyB0aGUgaW1tZWRpYXRlIHNvbHV0aW9uOiBhZGQgdGhlIENMSU5UIHRvIHRo
ZSBmaXJtd2FyZSBkZXZpY2V0cmVlIHNvCj4+PiB0aGF0IHRoZSBTQkkgdGltZSBleHRlbnNpb24g
d29ya3MsIGFuZCBMaW51eCB3aWxsIGJvb3Qgd2l0aG91dCBhbnkgY29kZSBjaGFuZ2VzLAo+Pj4g
YWxiZWl0IHdpdGggYSBoaWdoZXItb3ZlcmhlYWQgY2xvY2tldmVudCBkZXZpY2UuCj4+Cj4+IEJ1
dCB0aGlzIHdpbGwgbWVhbiB0aGF0IHlvdSBjYW4ndCB1cGRhdGUgeW91ciBrZXJuZWwgdG8gdjYu
OSBvciBuZXdlciB3aXRob3V0Cj4+IHJlZmxhc2hpbmcgT3BlblNCSSBhbmQgdS1ib290LiBUaGF0
J3Mgc3RpbGwgYSByZWdyZXNzaW9uIHJpZ2h0PwoKWWEsIEknZCBjYWxsIHRoYXQgYSByZWdyZXNz
aW9uLiAgVXBkYXRpbmcgdGhlIGZpcm13YXJlIG9uIHRoZXNlIHRoaW5ncyAKaXNuJ3QgZ2VuZXJh
bGx5IHNvbWV0aGluZyB3ZSBjYW4gcmVseSBvbiB1c2VycyB0byBkbywgd2UndmUgd29ya2VkIAph
cm91bmQgb3RoZXIgZmlybXdhcmUgYnVncyB3aGVyZSB3ZSBjYW4gdG8gYXZvaWQgZm9yY2VkIHVw
ZGF0ZXMuCgo+IEkgc3VwcG9zZSB0aGF0IGRlcGVuZHMgb24gaWYgeW91IHRoaW5rIHRoZSBTQkkg
dGltZSBleHRlbnNpb24gaXMgKG9yIHNob3VsZCBoYXZlCj4gYmVlbikgbWFuZGF0b3J5IGZvciBw
bGF0Zm9ybXMgd2l0aG91dCBTc3RjLiBJZiB0aGUgU0JJIHRpbWUgZXh0ZW5zaW9uIGlzCj4gbWFu
ZGF0b3J5LCB0aGVuIHRoaXMgaXMgYSBmaXJtd2FyZSBidWcsIGFuZCBub3QgcmVhbGx5IExpbnV4
J3MgcmVzcG9uc2liaWxpdHkgdG8KPiB3b3JrIGFyb3VuZC4KPgo+IElmIHRoZSBTQkkgdGltZSBl
eHRlbnNpb24gaXMgbm90IG1hbmRhdG9yeSwgdGhlbiBMaW51eCBuZWVkcyB0byBiZSBhYmxlIHRv
Cj4gaGFuZGxlIHBsYXRmb3JtcyB3aGVyZSB0aGUgUy1tb2RlIHZpc2libGUgdGltZXIgaXMgYXR0
YWNoZWQgdG8gYW4gZXh0ZXJuYWwKPiBpbnRlcnJ1cHQgY29udHJvbGxlciAoUExJQyBvciBBUExJ
QyksIHNvIHRoZSBpcnFjaGlwIGRyaXZlciBuZWVkcyB0byBiZSBsb2FkZWQKPiBiZWZvcmUgdGlt
ZV9pbml0KCkgKHRpbWVyX3Byb2JlKCkpLiBTbyBpbiB0aGF0IGNhc2UsIHRoZSBidWcgaXMgYSBM
aW51eAo+IHJlZ3Jlc3Npb24sIGFuZCB3ZSB3b3VsZCBuZWVkIHRvIHJldmVydCB0aGUgcGxhdGZv
cm0gZHJpdmVyIGNvbnZlcnNpb24uCgpJdCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgd2hhdCB0aGUg
c3BlY3Mgc2F5IChha2EgaW50ZW5kZWQgdG8gc2F5IGluIApSSVNDLVYgbGFuZCk6IGlmIHRoZXJl
J3MgYSByZWdyZXNzaW9uIHRoZW4gd2UgaGF2ZSB0byBkZWFsIHdpdGggaXQuICAKSXQncyBub3Qg
bGlrZSB3aGF0ZXZlcidzIHdyaXR0ZW4gaW4gdGhlIHNwZWNzIGFjdHVhbGx5IG1hdHRlcnMsIHZl
bmRvcnMgCmNhbiBqdXN0IGRvIHdoYXRldmVyIHRoZXkgd2FudCwgc28gd2VyJ2UganVzdCBzdHVj
ayBtYWtpbmcgdGhlIGtub3duIAppbXBsZW1lbnRhdGlvbnMgd29yay4KClNvIEkgdGhpbmsgaWYg
dGhlIHJldmVydCBpcyB0aGUgYmVzdCBmaXggdGhlbiB3ZSBzaG91bGQgcmV2ZXJ0IGl0LgoKVGhh
dCBzYWlkOiBJZiB0aGUgQ0xJTlQgd29ya3MsIGNvdWxkIHdlIGp1c3QgYWRkIGEgcHJvYmluZyBx
dWlyayB0byBtYWtlIAppdCBhcHBlYXIgb24gdGhlc2Ugc3lzdGVtcyBldmVuIHdoZW4gaXQncyBu
b3QgaW4gdGhlIERUPyAgSSdtIHRoaW5raW5nIApzb21ldGhpbmcgbGlrZSBhZGRpbmcgYSBjb21w
YXRpYmx5IHN0cmluZyB0byB0aGUgQ0xJTlQgZHJpdmVyIGZvciB0aGUgClNPQyAob3IgY29yZSBv
ciB3aGF0ZXZlciwganVzdCBzb21ldGhpbmcgdGhhdCdzIGFscmVhZHkgdGhlcmUpLiAgV2UnZCAK
cHJvYmFibHkgbmVlZCBhIGJpdCBvZiBzcGVjaWFsLWNhc2UgcHJvYmluZyBjb2RlLCBidXQgc2hv
dWxkbid0IGJlIHNvIApiYWQuICBXZSd2ZSBnb3Qgc29tZSBvdGhlciBjb21wYXRpYmlsaXR5LW9y
aWVudGVkIERUIHF1aXJrcyBmbG9hdGluZyAKYXJvdW5kLgoKPiBSZWdhcmRzLAo+IFNhbXVlbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
