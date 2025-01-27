Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8152C02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 14:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PqQvqcHIITVo9r99NSvusq09BWzYDR/xwuuZ2cSmTc=; b=nVnOnvGnE52MIZ
	wfxLoOfox/Isn7TLZA5MH6j70JYKBqYluN6PGd1u8NCfi7f+g9rHzWktKEqDQ+Lfw4BkcRw/JcW5l
	n2W2IjoHknvl+BJFieGBRW27Y3oEMDaiiFbj7wFGd4Jg4zNcLb7Bxyk4+4F+KR5HnOvsdYG6v11Qk
	vRUmvLdXX/KtceJaioGaQAgjSz5PRaSI7dTbnBRYFFkVsUCmZEMPkdYya+Qumo41Oou2s+AoAIo6O
	HmxnL9++7AJiWiRN2FBByG4K0UyEB8nWTTEeG8wiEoZMHEB6e8MYkfyW25io+dian5/RCyGcXrZln
	0Cq2/LZbRm/dbzKlqaFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcQ4w-00000002V2Z-2L5T;
	Mon, 27 Jan 2025 14:27:06 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcQ4t-00000002V29-1en2
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 14:27:05 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2f44353649aso5917140a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 06:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737988022; x=1738592822; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr1gvl4+jgxR1YjwWGEoCmbPtqlGFCxFzwSUBwlTg5g=;
        b=NRf+B85sFkm3d7WucKU/2F/zjSml8gaGiQs+k251RgliYUwgT1UPjZnWN/dtnX/bih
         knPZOwme83zkJTVsjsuVcSXsCBbmU/Og/m0AY8kyFpUs47CNfiEYg+iShZKtDznQG9/r
         Y2Ps6bpHGYY7lZRdAL/mieXl+JqKTldw6n4CV7g135ih29gRUjhSVTauLvOb/GbNUcNA
         O63/1J2ARfYu6BDFokHdAH8goRXln9LRyZ3MqgSJq+ujHH+E5NHOGBNnUt6JKexmg9mE
         DZJ74C3a/ivnvyhpwWUC1ezLx2pLgT9izWYPrSGEEMk+BYIIG/rKqha6KBGn5mcio2ca
         IgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737988022; x=1738592822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr1gvl4+jgxR1YjwWGEoCmbPtqlGFCxFzwSUBwlTg5g=;
        b=jYk+gbCDB9loFxFm9VpZ4uTLrxH/hiaO1PCjjS55xNNsynHtu6hHRTibpYoCHACGgO
         oismyHthuUE0W/mCwSRllxoKDAiim9vdMc8ak9jTk/DLTEP8JhwAzUTCtLhusEreRFPh
         ppR51DeUX2gL/4oEwtGivhrpxyxzmkHBn0xzf+tJBwXAkMFdrBm03XIa4B8lAG1xNfS1
         Ta+M7k/8swftGE4e9oy0aGkm9LNrUQw836tERxb5tk8LsJ7DDxV6WHudxg5YUtizJn87
         cgGP5cXFzMvyuoWfPNPcdMZwbYmit1XibhETPNLGS0oxXK+EgfFu1Jmul5zXEcCVba2Q
         /KTw==
X-Forwarded-Encrypted: i=1; AJvYcCW7zaa+Xql+AO3co6tRs19QU37zdVl3VVz9XLelo6S0OtLL5X8n+ljfcJv6VhdbmomKUapnIRHkAIB1+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxA/+h1H7MlHYl59qhsOIm15FaDapUHlAffvWuDAu/wb/8paC+u
	gkjlSPB0wRhZEiqPTWqcyN/FHAqtJ0vrBFdwGpcBW6N74s05xteGg2JpLmWXzXRYgGWKftoSv5F
	N9tNTQC/o2boo1QDLqeKFagSQluc2fE//M7XtQYtnLFi9kyCeEE8=
X-Gm-Gg: ASbGncuPyGj2KDy40YH0N6zs4a5WdsHnvHVqKsA7R7CtDqD1AuEa/o7s++WtD6CGgUf
	gd1YJjy/pl4EiIcPJVZzMXCyBsl7zUC8Si7+ViE9UIkpGtzrcprAFf/bqxNn/h2PU
X-Google-Smtp-Source: AGHT+IEVT0BIKKgxee0mdgJApLGVy0fsY5iRywAW8z25QrF3HHNozL4WdtwXksPd22QrFAK/Cz23CbfrF0hfm5bi1Kk=
X-Received: by 2002:a17:90b:3a46:b0:2ee:7538:be70 with SMTP id
 98e67ed59e1d1-2f782c513f7mr53150139a91.5.1737988021818; Mon, 27 Jan 2025
 06:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20250127093846.98625-1-luxu.kernel@bytedance.com> <87plk88s1o.ffs@tglx>
In-Reply-To: <87plk88s1o.ffs@tglx>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 27 Jan 2025 22:26:50 +0800
X-Gm-Features: AWEUYZlOyZPfHFjwvGv-vahEw3f4yC-hPNfW_f4vT6Lzsxqh2fJa3d0evyu_0gQ
Message-ID: <CAPYmKFtQVxYTurHox+ykLPL7MqsMyx8MFZabN1y5eO_EJzU02Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RESEND] irqchip: riscv: Order normal writes
 and IPI writes
To: Thomas Gleixner <tglx@linutronix.de>
Cc: anup@brainfault.org, charlie@rivosinc.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_062703_684921_207D4980 
X-CRM114-Status: GOOD (  22.19  )
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

T24gTW9uLCBKYW4gMjcsIDIwMjUgYXQgNjozM+KAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDI3IDIwMjUgYXQgMTc6MzgsIFh1
IEx1IHdyb3RlOgo+Cj4gVGhpcyBpcyBub3QgYSBSRVNFTkQuIFRoZSBjaGFuZ2UgbG9nIGhhcyBi
ZWVuIG1vZGlmaWVkLCBubz8KClN1cmUsIHRoZSBjaGFuZ2UgbG9nIGhhcyBiZWVuIG1vZGlmaWVk
LiBJIHdpbGwgcGF5IGF0dGVudGlvbiBuZXh0IHRpbWUuCgo+Cj4gVGhlIHByZWZpeCBpcyBpbmNv
cnJlY3QuIFNlZQo+Cj4gICBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9w
cm9jZXNzL21haW50YWluZXItdGlwLmh0bWwKPgo+ID4gUklTQy1WIGRpc3Rpbmd1aXNoZXMgYmV0
d2VlbiBub3JtYWwgbWVtb3J5IGFjY2Vzc2VzIGFuZCBkZXZpY2UgSS9PIGFuZAo+Cj4gV2hhdCBp
cyBhIG5vcm1hbCBtZW1vcnkgd3JpdGU/IEFyZSB0aGVyZSBhYm5vcm1hbCBtZW1vcnkgd3JpdGVz
IHRvbz8KClNvcnJ5IGZvciB0aGUgbWlzbGVhZGluZy4gQnkgbm9ybWFsIG1lbW9yeSB3cml0ZSwg
SSBtZWFuIG1lbW9yeSB3cml0ZXMKYW5kIHdhbnQgdG8gZGlzdGluZ3Vpc2ggaXQgZnJvbSBNTUlP
IHdyaXRlcy4KCj4KPiA+IHVzZXMgRkVOQ0UgaW5zdHJ1Y3Rpb24gdG8gb3JkZXIgdGhlbSBhcyB2
aWV3ZWQgYnkgb3RoZSBSSVNDLVYgaGFydHMgYW5kCj4gPiBleHRlcm5hbCBkZXZpY2VzIG9yIGNv
cHJvY2Vzc29ycy4gVGhlIEZFTkNFIGluc3RydWN0aW9uIGNhbiBvcmRlciBhbnkKPiA+IGNvbWJp
bmF0aW9uIG9mIGRldmljZSBpbnB1dChJKSwgZGV2aWNlIG91dHB1dChPKSwgbWVtb3J5IHJlYWRz
KFIpIGFuZAo+ID4gbWVtb3J5IHdyaXRlcyhXKS4gRm9yIGV4YW1wbGUsICdmZW5jZSB3LCBvJyBj
YW4gYmUgdXNlZCB0byBlbnN1cmUgYWxsCj4KPiBDYW4gYmU/IEl0IF9pc18gdXNlZCwgbm8/CgpZ
ZXMsIGl0IF9pc18gdXNlZC4gJ0NhbiBiZScgaXMgbm90IGFjY3VyYXRlLgoKPgo+ID4gbWVtb3J5
IHdyaXRlcyBmcm9tIGluc3RydWN0aW9ucyBwcmVjZWRpbmcgdGhlIEZFTkNFIGluc3RydWN0aW9u
IGFwcGVhcgo+ID4gZWFybGllciBpbiB0aGUgZ2xvYmFsIG1lbW9yeSBvcmRlciB0aGFuIGRldmlj
ZSBvdXRwdXQgd3JpdGVzIGZyb20KPiA+IGluc3RydWN0aW9ucyBhZnRlciB0aGUgRkVOQ0UgaW5z
dHJ1Y3Rpb24uCj4gPgo+ID4gUklTQy1WIGlzc3VlcyBJUEkgYnkgd3JpdGluZyBjZXJ0YWluIHZh
bHVlIHRvIElNU0lDL0FDTElOVCBNTUlPCj4gPiByZWdpc3RlcnMsIHdoaWNoIGlzIHJlZ2FyZGVk
IGFzIGRldmljZSBvdXRwdXQgb3BlcmF0aW9uLiBIb3dldmVyLCB0aGUKPiA+IGV4aXN0aW5nIGlt
cGxlbWVudGF0aW9uIG9mIElNU0lDL0FDTElOVCBkcml2ZXIgaXNzdWVzIElQSSB2aWEKPiA+IHdy
aXRlbF9yZWxheGVkKCksIHdoaWNoIGRvZXMgbm90IGd1YXJhbnRlZSB0aGUgb3JkZXIgb2YgZGV2
aWNlIG91dHB1dAo+ID4gb3BlcmF0aW9uIGFuZCBwcmVjZWRpbmcgbWVtb3J5IHdyaXRlcy4gVGhl
biB0aGUgaGFydCByZWNlaXZpbmcgSVBJIG1heQo+ID4gbm90IGhhdmUgc2VlbiB0aGUgbGF0ZXN0
IGRhdGEgeWV0Lgo+ID4KPiA+IFRoaXMgY29tbWl0IGZpeGVzIHRoaXMgYnkgcmVwbGFjaW5nIHdy
aXRlbF9yZWxheGVkKCkgd2l0aCB3cml0ZWwoKQo+ID4gd2hlbgo+Cj4gJ1RoaXMgY29tbWl0JyBp
cyBlcXVhbGx5IHdyb25nIGFzICdUaGlzIHBhdGNoJy4gU2VlIERvY3VtZW50YXRpb24vcHJvY2Vz
cy8KClRoYW5rcyB2ZXJ5IG11Y2guIEkgd2lsbCBjaGVjayB0aGUgZG9jdW1lbnRzLgoKQmVzdCBS
ZWdhcmRzLAoKWHUgTHUKCj4KPiA+IGlzc3VpbmcgSVBJLCB3aGljaCB3aWxsIHVzZSAnZmVuY2Ug
dywgbycgdG8gZW5zdXJlIGFsbCBwcmV2aW91cyB3cml0ZXMKPiA+IG1hZGUgYnkgY3VycmVudCBo
YXJ0IGFyZSB2aXNpYmxlIHRvIG90aGVyIGhhcnRzIGJlZm9yZSB0aGV5IHJlY2VpdmUKPiA+IHRo
ZSBJUEkuCj4KPiBJJ3ZlIGZpeGVkIGl0IHVwIGZvciB5b3UuCj4KPiBUaGFua3MsCj4KPiAgICAg
ICAgIHRnbHgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
