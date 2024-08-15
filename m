Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753EAC52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vsy/7+JvOW//OTuRar9YD5GXfDs4Og8V2LsZYN2Sdnw=; b=p+n4fHK9o//cKO
	uUcYbJYw7+b3WOpzzMfYiXpNeOp6sV6hkffUcK3mJKalHNpGOzXfJk3OOTWT4bA15J6TtejGU3crj
	4MROZ6orWY2HHhQNjXa00lKNhuxQz8MUYrhFDxdaLANYhTQkfnXlqUFWisZtDwBw6UvoFKJKXZqeC
	0PczDWpen/cRHlSj0xzuGi6it1DwGVxFhkX6H5TFMcrINIRWGxwhHcH/N0ShQic0L4ZoIujTi0yCf
	bI5DC8lQ41gJKJAyeOiSPc7ETn8tlKrST4PDQmK6cww2qNrMbSuNeXJG5XMnLSTufviS+a381VPlN
	cFh6sxwslXctD8vj7EPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sebhX-0000000AFmG-05po;
	Thu, 15 Aug 2024 14:43:43 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sebfq-0000000AFJV-11qV
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 14:42:06 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-81f94ce22f2so43594539f.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 07:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723732916; x=1724337716; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++BmiiXwQt/QcOt/zK+OovAUukWbAy9mATU+M+pnlPs=;
        b=X09Tk1DRndTm1Rf0b0xjYdRL9UTMmOfLPSswt5Je9pKJWpCyWQPkL2kDnvZqpYtg1O
         04+8IZRoDukKOlVGBmQqIslPupgoy98g3MrzKiONI6B0n9WR3XPb4DYR6Yh8ek5uRLei
         OrKWJ+Mp+QbgzWYtyUfrpSIXPwo8LxTGq/a+QeoFxrqzuNshjeNdHAhfWw54YVOnAt9K
         UCfJOEby3YTY2viSizGE4q915dWuHFdVmRwjqC7u+1Huw9xdNJjzPizNpg2GhOZLQTIR
         /fXX40YHMlahu2W8RG7fjifL8jmS03cq7vY3qkwJqAnOQPHTbm9DILrNPGiKP5t6sQ7e
         02Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723732916; x=1724337716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++BmiiXwQt/QcOt/zK+OovAUukWbAy9mATU+M+pnlPs=;
        b=oIkdC5i5l4QeN9cu8Q2aIIvplQsZZsSpI+NTTTPhEX54Vc2Q6iu8zuA8L0XxxNiQ/A
         4sw3wjxIczNAi3yDk11gskRXTNy01w5FpvRL4vAunTiLpvs0XkohHH5UetJgN2qgZd/t
         qwMMO1Z/4FoF77yRHee1/uGBkNobHnEd3YK3G9jnaNcLx7ekKpYZHXdqHZPO+PKY+jpn
         eUQoF/f8J3nzs8htbMCJKWDXubV9ZmlWuPGsYffZ2vbqbfVYIbG3aAyiTthaa6pcP8l9
         qMothLPVM0SjmU6JBwyc/A0+i9zfmw+UZ7SIJ/ByH3sTNLjfATDktOf6eOKycasqF3Zh
         kBTA==
X-Forwarded-Encrypted: i=1; AJvYcCXNKJ3XTFNme3ti22snXjwMccfc5VI5B3kqeXa6u+KuGpJ2h+02Jbrwkxyxt9BM1ibCBLA7JwBbSoatJI/Q6kVyQ6cU5iowkune+n5SsBuj
X-Gm-Message-State: AOJu0YwFxE2Kp4OWlMloR389HHHVlZyNiwTNc1Fj1adt8r40QNNdtm0V
	8pVGJV+A/80dS5NZeOsJijl58AQGRYfOIicxaaKFVtgD+eRNQtkNOksL3+K3Rvs=
X-Google-Smtp-Source: AGHT+IFCvvrFd5l9ENiraMAdbfas6RG05Z/jvtVxTncOjYZjJetsW4L7fIkPh9zI4/+Aa1OKJOROLw==
X-Received: by 2002:a05:6e02:1d8e:b0:39a:e984:1caa with SMTP id e9e14a558f8ab-39d26d4f540mr178135ab.21.1723732916543;
        Thu, 15 Aug 2024 07:41:56 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ccd6f3db32sm525449173.116.2024.08.15.07.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 07:41:56 -0700 (PDT)
Message-ID: <be1db8f5-af55-48a4-be7a-5e8a1a5e25c4@sifive.com>
Date: Thu, 15 Aug 2024 09:41:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
To: Anup Patel <apatel@ventanamicro.com>, Thomas Gleixner
 <tglx@linutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx>
 <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx>
 <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
 <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
 <87plqalyd4.ffs@tglx> <686d61c4-e7ac-4dca-a7fd-decdd72e84d9@sifive.com>
 <87h6blnaf1.ffs@tglx>
 <CAK9=C2V7oL023=u6nodJs76k_0yHZ8PTJs=n1QFqDWCcCnG9kw@mail.gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAK9=C2V7oL023=u6nodJs76k_0yHZ8PTJs=n1QFqDWCcCnG9kw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_074200_883152_DCCF9E17 
X-CRM114-Status: GOOD (  27.89  )
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

T24gMjAyNC0wOC0xNSA5OjE2IEFNLCBBbnVwIFBhdGVsIHdyb3RlOgo+IE9uIFRodSwgQXVnIDE1
LCAyMDI0IGF0IDc6NDHigK9QTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4g
d3JvdGU6Cj4+Cj4+IE9uIFRodSwgQXVnIDE1IDIwMjQgYXQgMDg6MzIsIFNhbXVlbCBIb2xsYW5k
IHdyb3RlOgo+Pj4gT24gMjAyNC0wOC0xNSA4OjE2IEFNLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6
Cj4+Pj4gWWVzLiBTbyB0aGUgcmlzY3YgdGltZXIgaXMgbm90IHdvcmtpbmcgb24gdGhpcyB0aGlu
ZyBvciBpdCBzdG9wcwo+Pj4+IHNvbWVob3cuCj4+Pgo+Pj4gVGhhdCdzIGNvcnJlY3QuIFdpdGgg
dGhlIChmaXJtd2FyZSkgZGV2aWNldHJlZSB0aGF0IEVtaWwgaXMgdXNpbmcsIHRoZSBPcGVuU0JJ
Cj4+PiBmaXJtd2FyZSBkb2VzIG5vdCBoYXZlIGEgdGltZXIgZGV2aWNlLCBzbyBpdCBkb2VzIG5v
dCBleHBvc2UgdGhlIChvcHRpb25hbFsxXSkKPj4+IFNCSSB0aW1lIGV4dGVuc2lvbiwgYW5kIHNi
aV9zZXRfdGltZXIoKSBkb2VzIG5vdGhpbmcuCj4+Cj4+IFNpZ2guIERvZXMgUklTQ1YgcmVhbGx5
IGhhdmUgdG8gcmVwZWF0IGFsbCBtaXN0YWtlcyB3aGljaCBoYXZlIGJlZW4gbWFkZQo+PiBieSB4
ODYsIEFSTSBhbmQgb3RoZXJzIGJlZm9yZT8gSXQncyBrbm93biBmb3IgZGVjYWRlcyB0aGF0IHRo
ZSBrZXJuZWwKPj4gcmVsaWVzIG9uIGEgd29ya2luZyB0aW1lci4uLgo+IAo+IE15IGFwb2xvZ2ll
cyBmb3IgdGhlIGRlbGF5IGluIGZpbmRpbmcgYSBmaXggZm9yIHRoaXMgaXNzdWUuCj4gCj4gQWxt
b3N0IGFsbCBSSVNDLVYgcGxhdGZvcm1zIChleGNlcHQgdGhpcyBvbmUpIGhhdmUgU0JJIFRpbWVy
IGFsd2F5cwo+IGF2YWlsYWJsZSBhbmQgTGludXggdXNlcyBhIGJldHRlciB0aW1lciBvciBTc3Rj
IGV4dGVuc2lvbiB3aGVuZXZlcgo+IGl0IGlzIGF2YWlsYWJsZS4KClNvIHRoaXMgaXMgdGhlIGlt
bWVkaWF0ZSBzb2x1dGlvbjogYWRkIHRoZSBDTElOVCB0byB0aGUgZmlybXdhcmUgZGV2aWNldHJl
ZSBzbwp0aGF0IHRoZSBTQkkgdGltZSBleHRlbnNpb24gd29ya3MsIGFuZCBMaW51eCB3aWxsIGJv
b3Qgd2l0aG91dCBhbnkgY29kZSBjaGFuZ2VzLAphbGJlaXQgd2l0aCBhIGhpZ2hlci1vdmVyaGVh
ZCBjbG9ja2V2ZW50IGRldmljZS4KCkFkZGl0aW9uYWxseSBtZXJnaW5nIHRoZSBzdW40aSB0aW1l
ciBwYXRjaFsxXSB3aWxsIGFsbG93IHRoZSBzeXN0ZW0gdG8gc3dpdGNoIHRvCnRoZSBiZXR0ZXIg
TU1JTyBjbG9ja3NvdXJjZSBsYXRlciBpbiB0aGUgYm9vdCBwcm9jZXNzLgoKVGhlIHJlYXNvbiB0
aGUgQ0xJTlQgd2FzIG5vdCBhZGRlZCB0byB0aGUgZGV2aWNldHJlZSBhbHJlYWR5IGlzIHRoYXQg
dGhlIFQtSEVBRAp2ZXJzaW9uIG9mIHRoZSBDTElOVCBpbmNsdWRlcyBhbiBleHRlbnNpb24gdG8g
ZHJpdmUgU1NJUC9TVElQIGZyb20gYSBzZWNvbmQKUy1tb2RlIHZpc2libGUgc2V0IG9mIHJlZ2lz
dGVycy4gU28gaXQgc2hvdWxkIHJlYWxseSBoYXZlIHR3aWNlIGFzIG1hbnkgZW50cmllcwppbiBp
dHMgaW50ZXJydXB0cy1leHRlbmRlZCBwcm9wZXJ0eSBhcyB0aGUgZXhpc3RpbmcgQ0xJTlQsIGFu
ZCBJIG5ldmVyIGdvdAphcm91bmQgdG8gdmFsaWRhdGluZyB0aGF0IHRoaXMgd291bGQgd29yay4K
ClRoZSBsb25nLXRlcm0gc29sdXRpb24gd291bGQgYmUgYWRkaW5nIGRyaXZlciBzdXBwb3J0IGZv
ciB0aGUgVC1IRUFEIENMSU5UCmV4dGVuc2lvbnMsIHdoaWNoIHByb3ZpZGUgYW4gZXZlbiBiZXR0
ZXIgY2xvY2tldmVudCB0aGFuIHRoZSBzdW40aSB0aW1lci4KClsxXTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjQwMzEyMTkyNTE5LjE2MDI0OTMtMS1zYW11ZWwuaG9sbGFuZEBzaWZp
dmUuY29tLwoKPiBXaGVuIEVtaWwgZmlyc3QgcmVwb3J0ZWQgdGhpcyBpc3N1ZSwgSSBkaWQgdHJ5
IHRvIGhlbHAgaGltIHJvb3QgY2F1c2UKPiB0aGUgaXNzdWUgYnV0IHVuZm9ydHVuYXRlbHkgSSBk
b24ndCBoYXZlIHRoaXMgcGFydGljdWxhciBwbGF0Zm9ybSBhbmQKPiBQTElDIG9uIGFsbCBvdGhl
ciBSSVNDLVYgcGxhdGZvcm1zIHdvcmtzIGZpbmUuCj4gCj4gSSBhbSBhbHNvIHN1cnByaXNlZCB0
aGF0IG5vbmUgb2YgdGhlIEFsbHdpbm5lciBmb2xrcyB0cmllZCBoZWxwaW5nLgoKQWxsd2lubmVy
IEQxIHN1cHBvcnQgd2FzIHVwc3RyZWFtZWQgYnkgdW5wYWlkIGhvYmJ5aXN0cyB3aXRoIHZlcnkg
bGl0dGxlCmZpcnN0LXBhcnR5IGFzc2lzdGFuY2UuCgo+Pj4gSSB3cm90ZSBhIHBhdGNoIChub3Qg
c3VibWl0dGVkKSB0byBza2lwIHJlZ2lzdGVyaW5nIHJpc2N2X2Nsb2NrX2V2ZW50IHdoZW4gdGhl
Cj4+PiBTQkkgdGltZSBleHRlbnNpb24gaXMgdW5hdmFpbGFibGUsIGJ1dCB0aGlzIGRvZXNuJ3Qg
ZnVsbHkgc29sdmUgdGhlIGlzc3VlCj4+PiBlaXRoZXIsIGJlY2F1c2UgdGhlbiB3ZSBoYXZlIG5v
IGNsb2NrZXZlbnQgYXQgYWxsIHdoZW4KPj4+IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2Nw
dXMoKSBpcyBjYWxsZWQuCj4+Cj4+IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXMoKSBp
cyBpcnJlbGV2YW50Lgo+Pgo+Pj4gSG93IGVhcmx5IGluIHRoZSBib290IHByb2Nlc3MgYXJlIHdl
ICJyZXF1aXJlZCIgdG8gaGF2ZSBhIGZ1bmN0aW9uYWwgY2xvY2tldmVudD8KPj4+IERvIHdlIG5l
ZWQgdG8gcmVmYWN0b3IgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cygpIHNvIGl0IHdv
cmtzIG9uIHN5c3RlbXMKPj4+IHdoZXJlIHRoZSBvbmx5IGNsb2NrZXZlbnQgaXMgcHJvdmlkZWQg
YnkgYSBwbGF0Zm9ybSBkZXZpY2U/Cj4+Cj4+IFJpZ2h0IGFmdGVyIGluaXQvbWFpbjo6bGF0ZV90
aW1lX2luaXQoKSBldmVyeXRoaW5nIGNhbiBkZXBlbmQgb24gYQo+PiB3b3JraW5nIHRpbWVyIGFu
ZCBvbiBqaWZmaWVzIGluY3JlYXNpbmcuCj4+Cj4+IEknbSBhY3R1YWxseSBzdXJwcmlzZWQgdGhh
dCB0aGUgYm9vdCBwcm9jZXNzIGdldHMgdGhhdCBmYXIuIFRoYXQncyBqdXN0Cj4+IGJ5IHB1cmUg
bHVjaywgcmVhbGx5LgoKVGhhbmtzIGZvciBjbGVhcmluZyB0aGlzIHVwIQoKUmVnYXJkcywKU2Ft
dWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
