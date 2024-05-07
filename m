Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4259C25B4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoCMiVn0xDsn4hKRjDHy66rBdrT4KEcdBEa+S2oiLmc=; b=UM/G8EGt0wY0wJ
	v0Fy5yKoWFpAuGkeDJJdx8MhKHtYbc3+rwrQrHd7Fear/dilKdEal+DRiHOjmOQaLB2qf1oHyXP0P
	EMlTq3vTgjj5eu/uRamgd5yEwJfW2pbGvT3WsxyzLIgSP8Jai6wVXOT6lSY6AnSJD2QQdCs0RQrsI
	Juv8l889IL5btzNmO4H01BsrBdSD3SAIR0FcMAGu3AU1yqHG5adQAOVHleFVVV5UyBkky7lXv6/tS
	nRN8bplFpxOLrqKSYIF4bg1gr+HJ5dztXmbD1WF2MaF6iLpH5ey5wkk2z8OV/wN6A5A9WxafqcOpD
	/u/YvgV3dqGKUYKudmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4O2u-0000000C5XU-2uBf;
	Tue, 07 May 2024 16:52:04 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4O2q-0000000C5VA-1zWM
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 16:52:02 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6a071595d22so17809276d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 09:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1715100717; x=1715705517; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KuJq+qc0A6IDkIfE8aXHp0ryQZcN+HRrcr1ZP0IxgmQ=;
        b=ojiAZ9C+92+uakIVf9jGZXKmfmIt875Nu68dnjISDxoRoPoElU4MndQ5PYzGAxx0M/
         vblY8JY8ovtSw9mRe+0+4OXJAyHR7psbKS4MWJq9gpccMvD8cpIpqB5PY6AcvJtf6dmf
         xrxq9w8Cgq9IZ3qOoDX0gvJg6UkzxDM3t3cBm2FC/XNb1TFvpRgOCVb7sa3jku0EZc4a
         N9ewQwMSiys4tqhxp4fOcEDVrsQ+H5ZXuomjXut8YOZh2jLYKCOzbQF2nKiSWwoZY05Q
         t38+Qvy7EnPs7Yj4NjCznKfGhjBglf5fPJhTYhmZvlBs1xvbTe/R/zrT7MwUCMpWqRU/
         AIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715100717; x=1715705517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KuJq+qc0A6IDkIfE8aXHp0ryQZcN+HRrcr1ZP0IxgmQ=;
        b=DeaBGZro6SZp4wQBRDzGMW7MDuw5LFxv/sg3zG6G9fucVca+005xLZoHdgjcRLlU/F
         W10G5CYBBww6/sGMoELu/GDWG+AYTvbGhJ4Aol/+Ijbovb7xp1mujfx0qJeLJkxKurhg
         gSTgNR6q+e0dCU70jUjMKhTWPzYtVnw3bP9JiweikC0ooEBqbO+Y8JeprnAtzjTpVoh1
         1JsoM4utaYvuxwtUtHGX/qo+QHUzuBoE0JKPQmRiLzPiDAiRmlI84twjC3KFt4N9yvCK
         IBY1p31Y3ZQrC7QHFDO0vrAb6Pjku2A2AbvYLabGrDPTk1mHEXyRaUXxQZFBKOYT5YlN
         7IRg==
X-Forwarded-Encrypted: i=1; AJvYcCVMCNOMpb40AoJVvNyJpxLQYhCilLH0pdryPDNz0qSKhnvO4yXQFuox2lKxHlkigGK28wnY/rxYXbEiy6KYy4+744dinpsU3pkVm1/efJcu
X-Gm-Message-State: AOJu0YxisHT4/5QfMOzz8heJSa5xsKuoOz4Wk3wQm+e0W+oqDwO69/XE
	cX4LvxdKa7SaGT06RYQX5pNgVU16pAL4CVCLPCM3gRBXURq7LhJdrvTbUZZcVwc=
X-Google-Smtp-Source: AGHT+IGUuxPPlPoMaw4Pvcfo1NJlzi2vAu/Z8gBAiaUWl2Sa7wmWBFq2vG5CHblSQfs5BDPYoxJvxw==
X-Received: by 2002:ad4:5fcf:0:b0:6a0:cd1b:9f9f with SMTP id 6a1803df08f44-6a15147db7amr4218536d6.38.1715100717431;
        Tue, 07 May 2024 09:51:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id cx8-20020a056214188800b006a0fb776a77sm4824798qvb.137.2024.05.07.09.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:51:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s4O2m-0001cp-EM;
	Tue, 07 May 2024 13:51:56 -0300
Date: Tue, 7 May 2024 13:51:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v3 7/7] iommu/riscv: Paging domain support
Message-ID: <20240507165156.GH4718@ziepe.ca>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <b83f81c04d1f3885d860b1eec03761fe63a33183.1714494653.git.tjeznach@rivosinc.com>
 <20240501145621.GD1723318@ziepe.ca>
 <CAH2o1u63GjMnYrfa8W-c1hdp+TAA0R-FyxXM4dEiFF+KEGWwbA@mail.gmail.com>
 <20240503181059.GC901876@ziepe.ca>
 <CAH2o1u7av8zMucB2sKxBOZtd1eqEC4Qmgin=8VQ03pWbQdZUUg@mail.gmail.com>
 <20240505154639.GD901876@ziepe.ca>
 <CAH2o1u6g87nt=S7id-O43PubR=GaOLj-vmk7+OdTiY=Kw1BU5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2o1u6g87nt=S7id-O43PubR=GaOLj-vmk7+OdTiY=Kw1BU5A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_095200_547629_6B51DC3E 
X-CRM114-Status: GOOD (  43.01  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXkgMDYsIDIwMjQgYXQgMDc6MjI6MDdQTSAtMDcwMCwgVG9tYXN6IEplem5hY2gg
d3JvdGU6Cj4gT24gU3VuLCBNYXkgNSwgMjAyNCBhdCA4OjQ24oCvQU0gSmFzb24gR3VudGhvcnBl
IDxqZ2dAemllcGUuY2E+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgTWF5IDAzLCAyMDI0IGF0IDEy
OjQ0OjA5UE0gLTA3MDAsIFRvbWFzeiBKZXpuYWNoIHdyb3RlOgo+ID4gPiA+IEZvciBkZXRhY2gg
SSB0aGluayB5ZXM6Cj4gPiA+ID4KPiA+ID4gPiAgICBJbnYgQ1BVICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBEZXRhY2ggQ1BVCj4gPiA+ID4KPiA+ID4gPiAgIHdyaXRlIGlvX3B0
ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBVcGRhdGUgZGV2aWNlIGRlc2NyaXB0b3IK
PiA+ID4gPiAgIHJjdV9yZWFkX2xvY2sKPiA+ID4gPiAgICAgbGlzdF9mb3JfZWFjaAo+ID4gPiA+
ICAgICAgIDxtYWtlIGludmFsaWRhdGlvbiBjb21tYW5kPiAgICAgICAgICAgIDxtYWtlIGRlc2Ny
aXB0aW9uIGludiBjbWQ+Cj4gPiA+ID4gICAgICAgZG1hX3dtYigpICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZG1hX3dtYigpCj4gPiA+ID4gICAgICAgPGRvb3JiZWxsPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPGNtZCBkb29yYmVsbD4KPiA+ID4gPiAgIHJjdV9yZWFkX3VubG9j
awo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxp
c3RfZGVsX3JjdSgpCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPHdpcGUgQVNJRD4KPiA+ID4gPgo+ID4gPiA+IEluIHRoaXMgY2FzZSBJIHRoaW5r
IHdlIG5ldmVyIG1pc3MgYW4gaW52YWxpZGF0aW9uLCB0aGUgbGlzdF9kZWwgaXMKPiA+ID4gPiBh
bHdheXMgYWZ0ZXIgdGhlIEhXIGhhcyBiZWVuIGZ1bGx5IGZlbmNlZCwgc28gSSBkb24ndCB0aGlu
ayB3ZSBjYW4KPiA+ID4gPiBoYXZlIGFueSBpc3N1ZS4gTWF5YmUgYSBzdXByaW91cyBpbnZhbGlk
YXRpb24gaWYgdGhlIEFTSUQgZ2V0cwo+ID4gPiA+IHJlLXVzZWQsIGJ1dCB3aG8gY2FyZXMuCj4g
PiA+ID4KPiA+ID4gPiBBdHRhY2ggaXMgZGlmZmVyZW50Li4KPiA+ID4gPgo+ID4gPiA+ICAgIElu
diBDUFUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEF0dGFjaCBDUFUKPiA+ID4g
Pgo+ID4gPiA+ICAgd3JpdGUgaW9fcHRlCj4gPiA+ID4gICByY3VfcmVhZF9sb2NrCj4gPiA+ID4g
ICAgIGxpc3RfZm9yX2VhY2ggLy8gZW1wdHkKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsaXN0X2FkZF9yY3UoKQo+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFVwZGF0ZSBkZXZpY2UgZGVzY3JpcHRv
cgo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxt
YWtlIGRlc2NyaXB0aW9uIGludiBjbWQ+Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZG1hX3dtYigpCj4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPGNtZCBkb29yYmVsbD4KPiA+ID4gPiAgIHJjdV9y
ZWFkX3VubG9jawo+ID4gPiA+Cj4gPiA+ID4gQXMgYWJvdmUgc2hvd3Mgd2UgY2FuICJtaXNzIiBh
biBpbnZhbGlkYXRpb24uIFRoZSBpc3N1ZSBpcyBuYXJyb3csIHRoZQo+ID4gPiA+IGlvX3B0ZSBj
b3VsZCBzdGlsbCBiZSBzaXR0aW5nIGluIHdyaXRlIGJ1ZmZlcnMgaW4gIkludiBDUFUiIGFuZCBu
b3QKPiA+ID4gPiB5ZXQgZ2xvYmFsbHkgdmlzaWFibGUuICJBdHRhY2ggQ1BVIiBjb3VsZCBnZXQg
dGhlIGRldmljZSBkZXNjcmlwdG9yCj4gPiA+ID4gaW5zdGFsbGVkIGluIHRoZSBJT01NVSBhbmQg
dGhlIElPTU1VIGNvdWxkIHdhbGsgYW4gaW9fcHRlIHRoYXQgaXMgaW4KPiA+ID4gPiB0aGUgb2xk
IHN0YXRlLiBFZmZlY3RpdmVseSB0aGlzIGlzIGJlY2F1c2UgdGhlcmUgaXMgbm8gcmVsZWFzZS9h
Y3F1aXJlCj4gPiA+ID4gYmFycmllciBwYXNzaW5nIHRoZSBpb19wdGUgc3RvcmUgZnJvbSB0aGUg
SW52IENQVSB0byB0aGUgQXR0YWNoIENQVSB0byB0aGUKPiA+ID4gPiBJT01NVS4KPiA+ID4gPgo+
ID4gPiA+IEl0IHNlZW1zIGxpa2UgaXQgc2hvdWxkIGJlIHNvbHZhYmxlIHNvbWVob3c6Cj4gPiA+
ID4gIDEpIEludiBDUFUgcmVsZWFzZXMgYWxsIHRoZSBpbyBwdGVzCj4gPiA+ID4gIDIpIEF0dGFj
aCBDUFUgYWNxdWlyZXMgdGhlIGlvIHB0ZXMgYmVmb3JlIHVwZGF0aW5nIHRoZSBERFQKPiA+ID4g
PiAgMykgSW52IENQVSBhY3F1aXJlcyB0aGUgUkNVIGxpc3QgaW4gc3VjaCBhIHdheSB0aGF0IGVp
dGhlciBhdHRhY2gKPiA+ID4gPiAgICAgQ1BVIHdpbGwgYWNxdWlyZSB0aGUgaW9fcHRlIG9yIGlu
diBDUFUgd2lsbCBhY3F1aXJlIHRoZSBSQ1UgbGlzdC4KPiA+ID4gPiAgNCkgRWl0aGVyIGludmFs
aWRhdGlvbiB3b3JrcyBvciB3ZSByZWxlYXNlIHRoZSBuZXcgaW9wdGUgdG8gdGhlIFNNTVUKPiA+
ID4gPiAgICAgYW5kIGRvbid0IG5lZWQgaXQuCj4gPiA+ID4KPiA+ID4gPiBCdXQgIzMgaXMgYSBy
ZWFsbHkgd2VpcmQgc3RhdGVtZW50LiBzbWJfbWIoKSBvbiBib3RoIHNpZGVzIG1heSBkbyB0aGUK
PiA+ID4gPiBqb2I/Pwo+ID4gPiA+Cj4gPiA+Cj4gPiA+IEFjdHVhbCBhdHRhY2ggc2VxdWVuY2Ug
aXMgc2xpZ2h0bHkgZGlmZmVyZW50Lgo+ID4gPgo+ID4gPiAgSW52IENQVSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBBdHRhY2ggQ1BVCj4gPiA+Cj4gPiA+ICB3cml0ZSBpb19wdGUKPiA+ID4g
ICByY3VfcmVhZF9sb2NrCj4gPiA+ICAgICBsaXN0X2Zvcl9lYWNoIC8vIGVtcHR5Cj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpc3RfYWRkX3JjdSgpCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPVExCLklOVkFMKFBTQ0lEKQo+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bWFrZSBkZXNjcmlwdGlvbiBp
bnYgY21kPgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkbWFfd21i
KCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGNtZCBkb29yYmVs
bD4KPiA+ID4gIHJjdV9yZWFkX3VubG9jawo+ID4gPgo+ID4gPiBJJ3ZlIHRyaWVkIHRvIGNvdmVy
IHRoaXMgY2FzZSB3aXRoIHJpc2N2X2lvbW11X2lvdGxiX2ludmFsKCkgY2FsbGVkCj4gPiA+IGJl
Zm9yZSB0aGUgYXR0YWNoZWQgZG9tYWluIGlzIHZpc2libGUgdG8gdGhlIGRldmljZS4KPiA+Cj4g
PiBUaGF0IGludmFsaWRhdGlvbiBzaG91bGRuJ3QgZG8gYW55dGhpbmcuIElmIHRoaXMgaXMgdGhl
IGZpcnN0IGF0dGFjaAo+ID4gb2YgYSBQU0NJRCB0aGVuIHRoZSBQU0NJRCBoYWQgYmV0dGVyIGFs
cmVhZHkgYmUgZW1wdHksIGl0IHdvbid0IGJlY29tZQo+ID4gbm9uLWVtcHR5IHVudGlsIHRoZSBE
RFQgZW50cnkgaXMgaW5zdGFsbGVkLgo+ID4KPiA+IEFuZCBpZiBpdCBpcyB0aGUgc2Vjb25kIGF0
dGFjaCB0aGVuIHRoZSBJbnYgQ1BVIGlzIGFscmVhZHkgdGFraW5nIGNhcmUKPiA+IG9mIHRoaW5n
cywgbm8gbmVlZCB0byBpbnZhbGlkYXRlIGF0IGFsbC4KPiA+Cj4gPiBSZWdhcmRsZXNzLCB0aGVy
ZSBpcyBzdGlsbCBhIHRoZW9ydGljYWwgcmFjZSB0aGF0IHRoZSBJT1BURXMgaGF2ZW4ndAo+ID4g
YmVlbiBtYWRlIHZpc2libGUgeWV0IGJlY2F1c2UgdGhlcmUgaXMgc3RpbGwgbm8gc3luY2hyb25p
emF0aW9uIHdpdGgKPiA+IHRoZSBDUFUgd3JpdGluZyB0aGVtLgo+ID4KPiA+IFNvLCBJIGRvbid0
IHRoaW5rIHRoaXMgc29sdmVzIGFueSBwcm9ibGVtLiBJIGJlbGl2ZSB5b3UgbmVlZCB0aGUKPiA+
IGFwcHJvcHJpYXRlIGtpbmQgb2YgQ1BVIGJhcnJpZXIgaGVyZSBpbnN0ZWFkIG9mIGFuIGludmFs
aWRhdGlvbi4KPiA+Cj4gCj4gWWVzLiBUaGVyZSB3YXMgYSBzbWFsbCwgYnV0IHN0aWxsIHBsYXVz
aWJsZSByYWNlIHcvIElPUFRFcyB2aXNpYmlsaXR5Cj4gdG8gdGhlIElPTU1VLgo+IEZvciB2NSBJ
J20gYWRkaW5nIHR3byBiYXJyaWVycyB0byB0aGUgaW52YWwvZGV0YWNoIGZsb3csIEkgYmVsaWV2
ZQo+IHNob3VsZCBjb3ZlciBpdC4KPiAKPiAxKSBJbiByaXNjdl9pb21tdV9pb3RsYl9pbnZhbCgp
IHVuY29uZGl0aW9uYWwgZG1hX3dtYigpIHRvIG1ha2UgYW55Cj4gcGVuZGluZyB3cml0ZXMgdG8g
UFRFcyB2aXNpYmxlIHRvIHRoZSBJT01NVSBkZXZpY2UuIFRoaXMgc2hvdWxkIGNvdmVyCj4gdGhl
IGNhc2Ugd2hlbiBsaXN0X2FkZF9yY3UoKSB1cGRhdGUgaXMgbm90IHlldCB2aXNpYmxlIGluIHRo
ZQo+IF9pb3RsYl9pbnZhbCgpIHNlcXVlbmNlLCBmb3IgdGhlIGZpcnN0IHRpbWUgdGhlIGRvbWFp
biBpcyBhdHRhY2hlZCB0bwo+IHRoZSBJT01NVS4KPiAKPiAgIEludiBDUFUgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBBdHRhY2ggQ1BVCj4gICB3cml0ZSBpb19wdGUKPiAgIGRt
YV93bWIgKDEpCj4gICByY3VfcmVhZF9sb2NrCj4gICAgIGxpc3RfZm9yX2VhY2ggLy8gZW1wdHkg
ICAgICAgICAgICAgICAgICAgbGlzdF9hZGRfcmN1KCkKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzbXBfd21iICgyKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFVwZGF0ZSBkZXZpY2UgZGVzY3JpcHRvcgo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxtYWtlIGRlc2NyaXB0aW9u
IGludiBjbWQ+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ly8gUFRFcyBhcmUgdmlzaWJsZSB0byB0aGUgSFcgKCoxKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGRtYV93bWIoKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDxjbWQgZG9vcmJlbGw+Cj4gICByY3VfcmVhZF91bmxv
Y2sKPiAKPiAyKSBJbiByaXNjdl9pb21tdV9ib25kX2xpbmsoKSB3cml0ZSBtZW1vcnkgYmFycmll
ciB0byBlbnN1cmUgbGlzdAo+IHVwZGF0ZSBpcyB2aXNpYmxlIGJlZm9yZSBJT01NVSBkZXNjcmlw
dG9yIHVwZGF0ZS4gSWYgc3RhbGUgZGF0YSBoYXMKPiBiZWVuIGZldGNoZWQgYnkgdGhlIEhXLCBp
bnZhbCBDUFUgd2lsbCBydW4gaW90bGItaW52YWxpZGF0aW9uCj4gc2VxdWVuY2UuIFRoZXJlIGlz
IGEgcG9zc2liaWxpdHkgdGhhdCBJT01NVSB3aWxsIGZldGNoIGNvcnJlY3QgUFRFcwo+IGFuZCB3
aWxsIHJlY2VpdmUgdW5uZWNlc3NhcnkgSU9UTEIgaW52YWwsIGJ1dCBJIGRvbid0IHRoaW5rIGFu
eW9uZQo+IHdvdWxkIGNhcmUuCj4gCj4gICBJbnYgQ1BVICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQXR0YWNoIENQVQo+ICAgd3JpdGUgaW9fcHRlICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxpc3RfYWRkX3JjdSgpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc21wX3dtYiAoMikKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBVcGRhdGUgZGV2aWNlIGRlc2NyaXB0b3IKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bWFrZSBkZXNjcmlwdGlvbiBpbnYg
Y21kPgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIEhX
IG1pZ2h0IGZldGNoIHN0YWxlIFBURXMKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBkbWFfd21iKCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8Y21kIGRvb3JiZWxsPgo+ICAgZG1hX3dtYiAoMSkKPiAgIHJjdV9yZWFk
X2xvY2sKPiAgICAgbGlzdF9mb3JfZWFjaCAvLyBub24tZW1wdHkgKCoyKQo+ICAgICAgIDxtYWtl
IGlvdGxiIGludmFsIGNtZD4KPiAgICAgICBkbWFfd21iKCkKPiAgICAgICA8Y21kIGRvb3JiZWxs
Pgo+ICAgcmN1X3JlYWRfdW5sb2NrCj4gCj4gMykgSSd2ZSBhbHNvIHVwZGF0ZWQgcmlzY3ZfaW9t
bXVfYm9uZF91bmxpbmsoKSB0byB3aXBlIHRoZSBQU0NJRCBjYWNoZQo+IG9uIHRoZSBsYXN0IGRv
bWFpbiB1bmxpbmsgZnJvbSB0aGUgSU9NTVUuCj4gCj4gVGhhbmsgeW91IGZvciBwb2ludGluZyB0
aGlzIG91dC4gTGV0IG1lIGtub3cgaWYgdGhhdCBtYWtlcyBzZW5zZS4KCkknbSBub3QgYW4gZXhw
ZXJ0IGluIGJhcnJpZXJzLCBidXQgSSB0aGluayB5b3UgbmVlZCB0aGUgbW9yZSBleHBlbnNpdmUK
Im1iIiBpbiBib3RoIGNhc2VzLgoKVGhlIGludiBzaWRlIGlzIGJvdGggcmVsZWFzaW5nIHRoZSB3
cml0ZSBhbmQgYWNxdWlyaW5nIHRoZSBsaXN0CnJlYWQuIElJUkMgUkVBRF9PTkNFIGlzIG5vdCBh
IGZ1bGwgYWNxdWlyZT8KClRoZSBBdHRhY2ggc2lkZSBpcyBib3RoIHJlbGVhc2luZyB0aGUgbGlz
dF9hZGRfcmN1KCkgYW5kIGFjcXVpcmluZyB0aGUKaW9wdGUuCgpyY3UgaXMgc3RpbGwgYSBiZW5l
Zml0LCB0aGVyZSBpcyBubyBjYWNoZSBsaW5lIHNoYXJpbmcgYW5kIHRoZXJlIGlzCm9ubHkgb25l
IGZ1bGwgYmFycmllciwgbm90IHR3bywgbGlrZSBhIHNwaW5sb2NrLgoKQW5kIGEgYmlnIGZhdCBj
b21tZW50IGluIGJvdGggc2lkZXMgZXhwbGFpbmluZyB0aGlzIDopCgpKYXNvbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
