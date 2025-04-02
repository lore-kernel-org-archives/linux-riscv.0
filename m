Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16C5C28B20
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 12:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaNIBdagxYdmRNPHDACQmfSs0jZos/8MS+tA+kds0vQ=; b=D+KkGs9DBclM37
	OtCTJWfHSYPzCgZjXZvDMGoZ5B2PdTOoozI59o0DpPZX1F4mMqyjQB6J2uZkvR6k84pWLgd+nVMrJ
	/yi7UtE++ebVfmoF6xEzlc4cJ3zk19E0g9vllDZXadFfiybO1TG5mpLcWzJzWcSegK2O5gNk9PJYA
	MOmnCFZfMW2BtnUTBvHllaSKwxdIlXZm62b2UKoQLSBKKtVMDv9UAdhLbyPD+k/kfLneR4GlQL+WS
	letzbAkBk8osVuOuUXv43lL0oYRRGitKJ0Lt/NHFFlsUfEbvhcBpnUc415c9XKmRg7+MZ+6i/ysik
	aPbVYyU7sv60iX+VSMrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx6A-000000063bl-3QhB;
	Wed, 02 Apr 2025 12:21:38 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx4r-000000063M3-2Dai
	for linux-riscv@lists.infradead.org;
	Wed, 02 Apr 2025 12:20:20 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-af50f56b862so45555a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Apr 2025 05:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743596416; x=1744201216; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWJxBNwkAmqL2G8fzcWM9thfWI+FACEvfsrq+gEk/S0=;
        b=G+L2j3zKaGCg/zILfp33OQtk4yaayYJPn9fwnJOFUkTT2mqdj67ERcK9p7pAEdeFAx
         cxIuUtDqz3GjeKa3iMbMHAXEGLDX8kFZ+DUNx7ipZake0UtxIEyfdZ+GWzh3bEeo6Sn6
         nILaK22ywM47466umEmQpScyJqus9OISM715px5Jn8ONa8a2my3p1ELlTiSmIH129sT8
         4uQ4AFxEbvVcCaeuJjpALYU25rt5S8TlYVWYPGFHN9trxgL1tJbDbf0Z30YMJ0DylJXT
         aXUMxu+9MWHUK1X7T5GRGWqMdZjyxEM6BJIjAg6NEZV5x5/Fh2hwbFUO9ecj01p2lVBN
         0bFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596416; x=1744201216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWJxBNwkAmqL2G8fzcWM9thfWI+FACEvfsrq+gEk/S0=;
        b=kAjOrnEwnOm9wHoTR9scMJr8aq8j38OThXs70RyAGjrQ+ohzNycKTadzxQNxVtwmuJ
         /rka/Fzvbf+vZerVkdrzjdaw0wRXGIfPy9dei/t8gs9qMbvq34AgYeCEiyj8S3LBeRh/
         SAv6cxdPIzrTqF/uFRV9gx9dGgT0QHYnMjBFhlRZJ4YPwh9A5Vjx6h3ZVWpZjDsvZWrx
         9eodHRcPdGnxzt3v39leYgfPP3YaYddbCS7IykR0L1Ylw03IZc80O5kf4/yGeXh78tS/
         8++m2mseLtw525i8lL7hoXsYSJyPiclLAA1ZuQo5ilgI1AMtNiuzPdOR5Fq6Qxfolv/e
         +nig==
X-Forwarded-Encrypted: i=1; AJvYcCUlB0G+Ey1x+tw2NYWzYjayvZlW99jqa6TYdLQ2tnsebls5fvVppao0GecAhk8oWpgGTR2/1ZExWeTqlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG16Dlc9Sqj271CDfSoUMXPAxducGPw5ydyo52XqG0dsxxfKMK
	0HUFm4xXedu30yBfAFfso7sOi6hBCUoc60UfHVjr3Skd1erUePoQaPdmV5H9hKa8Zk2ORcVLaKq
	T3sOWG7WS0ATA0lXVEvfaJV16ULT8GtJ675CbLA==
X-Gm-Gg: ASbGnctu/Ol5QYHxMNtE4pz7VheWDN8uykBa5VGItRIwMPIXgpTOvp7c26QOyEBfHW2
	ibM5NYsPcy+hgpw52m9JJa/Kwk8kARWuEb3tOZlzXxbMryFu2RisZ2qf2SMRgjpio5D5e9eKT4Q
	0ubyDS2Mg4dB0coZLEqZQ0wh3Yx6k/G/P5OuEqSnoIQ6SueYPU1g==
X-Google-Smtp-Source: AGHT+IG9C4OmAcA1BcvJZJK8vgSK/DWCvtCqpq1tzxaqNCtVF3YEFGKjwNPiS170vkEx7SYXHsTEXZvGHRmNASAO4vI=
X-Received: by 2002:a17:90b:28c4:b0:2ff:58a4:9db3 with SMTP id
 98e67ed59e1d1-3053215d8aemr22113172a91.35.1743596415763; Wed, 02 Apr 2025
 05:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250325144252.27403-1-luxu.kernel@bytedance.com>
 <9F043708-3BB6-46CF-BEC3-2636E9A388B7@jrtc27.com> <CAPYmKFtAWNz7nCDDD7rjGeV2fRBgy5Kt6KR60pEyXAM=bb7r4g@mail.gmail.com>
 <20250401154412.GI186258@ziepe.ca> <20250401220201.1fa3ec76@pumpkin>
In-Reply-To: <20250401220201.1fa3ec76@pumpkin>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Wed, 2 Apr 2025 20:20:04 +0800
X-Gm-Features: AQ5f1JoCpzXNEfUDVMpNcZU9VBfEeMyRz89Td3As3soGZh_OUSrxjWt-F5xQW4s
Message-ID: <CAPYmKFtOV6JfAudcw4gfWpgQv8k3Q6dNrTynqYo2tSdZEAwKHA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] iommu: riscv: Split 8-byte accesses on 32
 bit I/O bus platform
To: David Laight <david.laight.linux@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Jessica Clarke <jrtc27@jrtc27.com>, tjeznach@rivosinc.com, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, alex@ghiti.fr, 
	lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_052018_127701_19261BAE 
X-CRM114-Status: GOOD (  23.58  )
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

SGkgRGF2aWQsCgpBbGwgdGhlc2UgNjQgYml0IHJlZ2lzdGVycyBhcmUgdXBkYXRlZCBkdXJpbmcg
aW5pdGlhbGl6YXRpb24gKHdoZW4KYWxsb2NhdGluZyBwYWdlIHRhYmxlIGFuZCBpb21tdSBxdWV1
ZXMpIGFuZCBkZXN0cnVjdGlvbiAod2hlbgpkaXNhYmxpbmcgaW50ZXJydXB0cyBhbmQgaW9tbXUg
cXVldWVzKSBpbiB0aGUgZXhpc3RpbmcgaW9tbXUgZHJpdmVyLgpUaGVyZSB3b24ndCBiZSBtdWx0
aXBsZSBjcHUgb3BlcmF0aW5nIHNpbXVsdGFuZW91c2x5LgoKU29tZSA2NCBiaXQgcG11IHJlZ2lz
dGVycyBhcmUgYWxzbyB1cGRhdGVkIGR1cmluZyBwbXUgZXZlbnQKaW5pdGlhbGl6YXRpb24gYW5k
IG92ZXJmbG93IGhhbmRsaW5nIGluIHRoZSBvbmNvbWluZyBpb21tdSBwbXUKZHJpdmVyWzFdLiBU
aGVyZSB3aWxsIGFsc28gYmUgbm8gY29uY3VycmVuY3kgaXNzdWVzIGR1ZSB0byB0aGUgcG11CmZy
YW1ld29yayB1bmxlc3MgdGhlIEFDUEkvRFRTIGlzIG1pc2NvbmZpZ3VyZWQgYW5kIHR3byBpb21t
dXMgZ2V0IHRoZQpzYW1lIHJlZ2lzdGVyIHJlc291cmNlcy4KClNvIG1heWJlIGEgbG9jayBpcyBu
b3QgbmVjZXNzYXJ5LiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJIG1pc3NlZCBhbnl0aGluZy4KClsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAxMTUwMzAzMDYuMjk3MzUtMS16b25n
LmxpQHNpZml2ZS5jb20vCgpCZXN0IHJlZ2FyZHMsClh1IEx1CgpPbiBXZWQsIEFwciAyLCAyMDI1
IGF0IDU6MDLigK9BTSBEYXZpZCBMYWlnaHQKPGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+
IHdyb3RlOgo+Cj4gT24gVHVlLCAxIEFwciAyMDI1IDEyOjQ0OjEyIC0wMzAwCj4gSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAemllcGUuY2E+IHdyb3RlOgo+Cj4gPiBPbiBXZWQsIE1hciAyNiwgMjAyNSBh
dCAxMToyNjowN0FNICswODAwLCBYdSBMdSB3cm90ZToKPiA+ID4gSGkgSmVzc2ljYSwKPiA+ID4K
PiA+ID4gPiBJcyBzdWNoIGEgcGxhdGZvcm0gY29uZm9ybWFudCB0byB0aGUgc3BlY2lmaWNhdGlv
bj8KPiA+ID4KPiA+ID4gV2UgaGF2ZSB0YWxrZWQgYWJvdXQgdGhpcyBiZWZvcmUgWzFdLiBJIHRo
aW5rIHRoZSBJT01NVSBzcGVjIGRvZXMgbm90Cj4gPiA+IG1hbmRhdGUgdGhlIGltcGxlbWVudGF0
aW9uIG9mIDgtYnl0ZSBhY2Nlc3MgZnVuY3Rpb25hbGl0eS4gVGhlIHJlbGF0ZWQKPiA+ID4gc2Vu
dGVuY2VzIGFyZSBsaXN0ZWQgYmVsb3c6Cj4gPiA+Cj4gPiA+ICJUaGUgOC1ieXRlIElPTU1VIHJl
Z2lzdGVycyBhcmUgZGVmaW5lZCBpbiBzdWNoIGEgd2F5IHRoYXQgc29mdHdhcmUKPiA+ID4gY2Fu
IHBlcmZvcm0gdHdvIGluZGl2aWR1YWwgNC1ieXRlIGFjY2Vzc2VzLCBvciBoYXJkd2FyZSBjYW4g
cGVyZm9ybQo+ID4gPiB0d28gaW5kZXBlbmRlbnQgNC1ieXRlIHRyYW5zYWN0aW9ucyByZXN1bHRp
bmcgZnJvbSBhbiA4LWJ5dGUgYWNjZXNzLAo+ID4gPiB0byB0aGUgaGlnaCBhbmQgbG93IGhhbHZl
cyBvZiB0aGUgcmVnaXN0ZXIsIGluIHRoYXQgb3JkZXIsIGFzIGxvbmcgYXMKPiA+ID4gdGhlIHJl
Z2lzdGVyIHNlbWFudGljcywgd2l0aCByZWdhcmQgdG8gc2lkZS1lZmZlY3RzLCBhcmUgcmVzcGVj
dGVkCj4gPiA+IGJldHdlZW4gdGhlIHR3byBzb2Z0d2FyZSBhY2Nlc3Nlcywgb3IgdHdvIGhhcmR3
YXJlIHRyYW5zYWN0aW9ucywKPiA+ID4gcmVzcGVjdGl2ZWx5LiIKPiA+Cj4gPiBJIHRoaW5rIHRo
ZSBjb21taXQgbWVzc2FnZSBzaG91bGQgZXhwbGFpbiBhbiBhbnlhbHNpcyB0aGF0IHRoZSBjb2Rl
IGlzCj4gPiBzYWZlIGFnYWluc3QgdGhlIG1lbnRpb25lZCBzaWRlIGVmZmVjdHMgZHVlIHRvIG9y
ZGVyaW5nLgo+ID4KPiA+IEFuZCBhIGNvbW1lbnQgc2hvdWxkIGV4cGxhaW4gdGhpczoKPiA+Cj4g
PiArI2RlZmluZSByaXNjdl9pb21tdV93cml0ZXEoaW9tbXUsIGFkZHIsIHZhbCkgXAo+ID4gKyAg
ICAgICAoKGFkZHIgPT0gUklTQ1ZfSU9NTVVfUkVHX0lPSFBNQ1lDTEVTKSA/IFwKPiA+ICsgICAg
ICAgIGxvX2hpX3dyaXRlcV9yZWxheGVkKCh2YWwpLCAoaW9tbXUpLT5yZWcgKyAoYWRkcikpIDog
XAo+ID4gKyAgICAgICAgaGlfbG9fd3JpdGVxX3JlbGF4ZWQoKHZhbCksIChpb21tdSktPnJlZyAr
IChhZGRyKSkpCj4gPgo+ID4gQXMgdGhlIG5haXZlIHJlYWRpbmcgb2YgdGhlIGFib3ZlIHNwZWMg
cGFyYWdyYXBoIGRvZXNuJ3Qgc2VlbSBsaWtlCj4gPiB0aGVyZSBhcmUgZXhjZXB0aW9ucyBvciB3
aHkgb25lIHJlZ2lzdGVyIGhhcyB0byBiZSB0aGUgb3Bwb3NpdGUgb3JkZXIuCj4gPgo+ID4gQWxz
byBtaXNzaW5nICgpIGFyb3VuZCBhZGRyCj4KPiBJdCBpcyBhbHNvIGRvdWJsZS1ldmFsdWF0aW5n
IChhZGRyKS4KPgo+IEkgaG9wZSB0aGVyZSBpcyBhIGxvY2ssIGludGVybGVhdmVkIGFjY2Vzc2Vz
IGZyb20gbXVsdGlwbGUgY3B1Cj4gbWF5IG5vdCB3b3JrLgoKCgo+Cj4gICAgICAgICBEYXZpZAo+
Cj4gPgo+ID4gSmFzb24KPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
