Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5307CD98DE
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 03:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRfM4JjWPPNKyBV6wglBtxy7ZLu6td6nOnuohEGL46I=; b=zLJELcUhvS2xwk
	EE5qr0KglOUM5mxjCqYgXqf3PzeMozEHthuzPX4OX5eGl15yT7PNT5itaimVMkNwMEi3z0uvr6Dsq
	KoZZnoedLCmIJ4nnRkM9UD0ttevKd0+gvq+WM/69tokBu673SUZSW2CaurCGnh8FRY6gwkY3Yizvl
	SHRHcZkpHMiQroNkhBnLtjWhs6VsowiOAHpJ3BGoJj/1W1W6KypLfHFvcLpS4ynJ8sU1GXXCU6k17
	40uSHAcIfFmjN6nq9UPe5vKd/lMxhVNm3vUwZv7ElYRZsXAzzz0CiqmpeFGD7xd6vHsSj6a1scWIc
	njBQE2JjmZ/Nfkuz9+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3h5-00000000ZuA-3kK3;
	Thu, 18 Jun 2026 03:45:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3h4-00000000Zu0-2RU2
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 03:45:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CD32360098
	for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2026 03:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802731F00ACF
	for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2026 03:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781754328;
	bh=8Op7rbc84uL2wnhSbqYQH6YdsUeXtPCC4NTBIAenp+Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BNNX+u4dhnDJLmn2Dw7VTze4GSltFarsAgRxyXy8r72uQCieWSdEtbTWaI2kzfyg4
	 ne7+u9n/u0IiLYDHreyunN0SlGvw2TK3DEBYVWs2He3Vm75vGUGPMob+4ouqGxLxRR
	 MNp3Ps3OPUTarZMoKc/miVE4ZohTIBLborea3VwmPCS+EY6lXJxpWCQ9B2/aUfI1HA
	 AlL/wSRIOUuYFr0BIj85yYH2P/APaTSJ9PBEDRohPuZxlxCu9+ELy890IVbAzaoB/e
	 aGQOdED4aWFtJXCo3PPXPGt1Xx9eE9kQHhMbsp391VqYkyy/RgYqY9+6IN+kjoFm7n
	 A54+yn7foOVxQ==
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490a76757e5so2018865e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 20:45:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8myK/3rfWb/GQYIC+ISBPAKfLQX0AHpB1mfqWyaUCFLJsa210PdQKK4cES9QmyUsYvS3ef9aEXsARqfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK2by6uk0T8vaxJ0EOwTUEtCmyYIFMJ7CmznNVPMJPfQQ6X1Uh
	GBUKbnTsQPkea4oVO3wxB0BMXiHLuolihaPSsSyVXFLWVvEIgJmgr+njCrdNqrZLZxqN82tPnHj
	PIA36OiYo7XlWd4tDceapTKFERJA/UR8=
X-Received: by 2002:a05:600c:548e:b0:490:e196:e8df with SMTP id
 5b1f17b1804b1-4923821becfmr29334925e9.23.1781754327175; Wed, 17 Jun 2026
 20:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260615123821.373248-1-guoren@kernel.org> <7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
In-Reply-To: <7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 18 Jun 2026 11:45:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
X-Gm-Features: AVVi8CfWRFYTKPYCg8iVarn6CtPCXnAOdCb6y_53sU4cq8ytAi5YOIPu4cUwK1k
Message-ID: <CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	cuiyunhui@bytedance.com, iommu@lists.linux.dev, joro@8bytes.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	luxu.kernel@bytedance.com, palmer@dabbelt.com, pjw@kernel.org, 
	robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org, 
	yuanzhu@bytedance.com
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

T24gVGh1LCBKdW4gMTgsIDIwMjYgYXQgMTE6MjDigK9BTSBWaXZpYW4gV2FuZyA8d2FuZ3J1aWth
bmdAaXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gT24gNi8xNS8yNiAyMDozOCwgR3VvIFJlbiB3cm90
ZToKPiA+IEhpIFpoYW5wZW5nIFpoYW5nLAo+ID4KPiA+IEkgbm90aWNlZCB5b3UgcG9zdGVkIGEg
c2ltaWxhciBmaXggcmVjZW50bHkuIEhvd2V2ZXIsIEkgaGFkIGFscmVhZHkKPiA+IHN1Ym1pdHRl
ZCBhIHNpbWlsYXIgc29sdXRpb24gYmFjayBpbiBTZXB0ZW1iZXIgMjAyNSBbMV0uIEl0IHdvdWxk
IGJlCj4gPiBncmVhdCBpZiB5b3UgY291bGQgcmV2aWV3IGl0LiBBIGZldyBjb25jZXJucyB3aXRo
IHRoZSBjdXJyZW50IHBhdGNoOgo+ID4KPiA+IDEuIFVzaW5nIHNwaW5fbG9ja19pcnFzYXZlIGlu
IHN1Y2ggYSBzbWFsbCBzZW1hbnRpYyBzdHJ1Y3R1cmUgaXMKPiA+IHVubmVjZXNzYXJ5LiBJUlEg
cHJvdGVjdGlvbiBzaG91bGQgYmUgcHJvdmlkZWQgYnkgdGhlIGhpZ2hlci1sZXZlbAo+ID4gSU9N
TVUgZHJpdmVyIGludGVyZmFjZXMuIE1hbnkgZXhpc3RpbmcgY2FsbCBzaXRlcyBhbHJlYWR5IGhh
bmRsZSBJUlEKPiA+IGRpc2FibGluZywgc28gYWRkaW5nIGl0IGhlcmUgZmVlbHMgcmVkdW5kYW50
IGFuZCBhZGRzIGF2b2lkYWJsZQo+ID4gb3ZlcmhlYWQuCj4gPgo+ID4gMi4gTW9yZSBjcml0aWNh
bGx5LCB0aGUgUklTQ1ZfSU9NTVVfMzJCSVRfQUNDRVNTIEtjb25maWcgb3B0aW9uIGlzCj4gPiBw
cm9ibGVtYXRpYy4gQWNjb3JkaW5nIHRvIHRoZSBSSVNDLVYgSU9NTVUgc3BlY2lmaWNhdGlvbiAo
U29mdHdhcmUKPiA+IEd1aWRlbGluZXMsIOKAnFJlYWRpbmcgYW5kIHdyaXRpbmcgSU9NTVUgcmVn
aXN0ZXJz4oCdKToKPiA+Cj4gPj4gUmVnaXN0ZXJzIHRoYXQgYXJlIDY0LWJpdCB3aWRlIG1heSBi
ZSBhY2Nlc3NlZCB1c2luZyBlaXRoZXIgYSAzMi1iaXQKPiA+PiBvciBhIDY0LWJpdCBhY2Nlc3Mu
Cj4gPiBUaGlzIGNsZWFybHkgcmVxdWlyZXMgdGhhdCBhbnkgaGFyZHdhcmUgc3VwcG9ydGluZyA2
NC1iaXQgTU1JTyBhY2Nlc3MKPiA+IG11c3QgYWxzbyBzdXBwb3J0IDMyLWJpdCBNTUlPIGFjY2Vz
cy4gVGhlcmVmb3JlLCB0aGUgSU9NTVUgZHJpdmVyIHNob3VsZAo+ID4gYmUgYnVpbHQgb24gYSAz
Mi1iaXQgYWNjZXNzIGJhc2UgZm9yIG1heGltdW0gaGFyZHdhcmUgY29tcGF0aWJpbGl0eS4KPgo+
IEkgYWdyZWUgdGhhdCB0aGUgZHJpdmVyIHNob3VsZCBiZSBidWlsZCB3aXRoIDMyLWJpdCBhY2Nl
c3NlcyB0byBzdXBwb3J0Cj4gdGhlc2UgaGFyZHdhcmUuIEhvd2V2ZXIgdGhlcmUncyBvbmUgbWlu
b3IgdGhpbmcgdGhhdCBJIHdhbnQgdG8gcHJvcG9zZQo+IHJlZ2FyZGluZyB0aGlzLCBmb3IgdGhl
IHNha2Ugb2YgY2xhcml0eToKPgo+IFJJU0MtViBJT01NVSBpbXBsZW1lbnRhdGlvbnMgdGhhdCBk
byBub3Qgc3VwcG9ydCA2NC1iaXQgYWNjZXNzZXMgYXJlIG5vdAo+IGZ1bGx5IGNvbXBsaWFudCB3
aXRoIHRoZSBSSVNDLVYgSU9NTVUgc3BlY2lmaWNhdGlvbiBhbmQgc2hvdWxkIG5vdCB1c2UKPiB0
aGUgc3RhbmRhcmQgUklTQy1WIGlkZW50aWZpZXJzLCBuYW1lbHk6Cj4KPiAtIERldmljZXRyZWUg
Y29tcGF0aWJsZSByaXNjdixpb21tdQo+IC0gQUNQSSBISUQgUlNDVjAwMDQKPgo+IFRoaXMsIGlu
IG15IG9waW5pb24sIGlzIG5vdCBvbmx5IHRoZSByaWdodCB0aGluZyB0byBkbyAobm90IGNsYWlt
aW5nIHRvCj4gYmUgc3RhbmRhcmQgaGFyZHdhcmUgd2l0aG91dCBhY3R1YWxseSBiZWluZyBzdGFu
ZGFyZCBoYXJkd2FyZSksIGJ1dCBhbHNvCj4gc2F2ZXMgYSBsb3Qgb2YgdHJvdWJsZSBmb3Igb3Bl
cmF0aW5nIHN5c3RlbSBkZXZlbG9wZXJzICh5ZXMsIHRoZXJlIGFyZQo+IFJJU0MtViBvcGVyYXRp
bmcgc3lzdGVtcyBvdGhlciB0aGFuIExpbnV4IG91dCB0aGVyZSksIHNpbmNlIGludmFsaWQgSU8K
PiBhY2Nlc3NlcyB1c3VhbGx5IG1hbmlmZXN0IGFzIG15c3RlcmlvdXMgYWNjZXNzIGZhdWx0cyAo
dGhhdCB3b3VsZAo+IHVzdWFsbHkgc3VnZ2VzdCBhbiBpbmNvcnJlY3QgSU9NTVUgYWRkcmVzcyks
IG9yIHdvcnNlLCBzeXN0ZW0gaGFuZ3MuCj4KPiBJIHdvdWxkIGFwcHJlY2lhdGUgaWYgdGhlIGhh
cmR3YXJlIHZlbmRvcnMgc2hpcHBpbmcgMzItYml0LWFjY2Vzcy1vbmx5Cj4gSU9NTVVzIHdvdWxk
IGNvbnNpZGVyIHRoaXMuCj4KPiBWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCj4KCjMyLWJpdCBN
TUlPIGFjY2VzcyBpcyBleHBsaWNpdGx5IHN1cHBvcnRlZCBieSB0aGUgUklTQy1WIElPTU1VCnNw
ZWNpZmljYXRpb24gYW5kIGlzIGEgdmFsaWQgY2hvaWNlICg2NC1iaXQgTU1JTyBhY2Nlc3MgaXMg
b3B0aW9uYWwpLgo2NC1iaXQgTU1JTyBhY2Nlc3MgaXMgbm90ICJmcmVlIiDigJQgaXQgY29uc3Vt
ZXMgYWRkaXRpb25hbCBpbnRlcmNvbm5lY3QKaGFyZHdhcmUgcmVzb3VyY2VzLgoKQ291bGQgeW91
IGVsYWJvcmF0ZSBvbiB0aGUgY29uY3JldGUgYmVuZWZpdCBvZiB1c2luZyA2NC1iaXQgTU1JTwph
Y2Nlc3MgaW4gdGhpcyBkcml2ZXIsIGZvciB0aGVzZSBub24tUE1VIHJlZ2lzdGVycz8gQSBjbGVh
cgpqdXN0aWZpY2F0aW9uIHdvdWxkIGhlbHAgZXZhbHVhdGUgd2hldGhlciB0aGUgdHJhZGUtb2Zm
IGlzIHdvcnRod2hpbGUuCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
