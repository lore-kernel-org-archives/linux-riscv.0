Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9D5C5AD49
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 17:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6M2XCdzz3dSpUXp83sVuOlVpIa0hcnFUFYKe0bqKYHg=; b=1h1XFXxClu7gBYAz5+qrgUC+Rs
	nl5CUPbFnjkc2Ae8bAHYdDXi/XYIqFGA4+CL/e83ONOOjvd/V1Ooj6fsu7DNx2/Zo0Ygd9/2eOuhZ
	BfmdT4YMt+D/pQkhS0FJzWxLjZ00Gstiq4aYNWd87FUGVqohFlNnkfjnvwllIZHx9Pd4ttKKQAikN
	KtegHIyB+n9WThvosk9W3AfjlG/2cJUabgmL5Yj30hblkGNs4aYvVH+tVU6vCJojBD/xBsMHJ4UrF
	o8u5AcSbjoesA+Cpu6b7oG+Bsf7NMHnzay2X2pgli3s0IHYsuD4FxZ/MyouL/Yt6CWhP7hQsuHqYF
	o/zFthtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKhTS-0000000GK9O-0FIp;
	Thu, 29 May 2025 17:55:26 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKhTP-0000000GK8x-3eqo
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 17:55:25 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-312116d75a6so1055972a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 10:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748541322; x=1749146122; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4+SQRm6s+Iu+nsET3yyVUZurdygfX7CiRJxiNOW/rk4=;
        b=V0SwfKmpbQvWveAKWlQ5Wfl61wfqsaNu47ZG4KhuWMli89BJHcBeV6rMu70vWkSbLt
         +P44xiZENCaHSzWhXRUGdI9nDNAeCaSfVx4uziRVXPNX/wZxlvmYpZeLFXYdSf8PqS/O
         QhkyCpW35a/fwK1WLjs9xGc9S82noophiDmfF8XcRrTT5du/6uuu90Y0QPi4cerBNCGB
         NQEXkdaUpmsI6lZOuwjGJZt3snNzaFefmEd+Zzk1xXJfTT8P3ksMAgL0iGWvI89qib2Y
         Sl3bAt4F4to/VHjx2qxn9MlU2u3LOX/0Ccwj9c+HZQ+5+VCHPGmB4I6iTa+N4dRCCSMZ
         93bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748541322; x=1749146122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+SQRm6s+Iu+nsET3yyVUZurdygfX7CiRJxiNOW/rk4=;
        b=Gjr73GfG8C2VWOcJA6lZ9WGVmgtTPaI76TVmbgtvjViSlYAQBM0LQVaw4FzmFguEuv
         SuSsLhQmL7h2aFgnNyJT0eizX05jXzNi/iHtuF0lu6i8S7Hd4rQUoR460XcjgoeAFiqt
         Q/YKUsLNwOaQh/f0Wnq5HgJxVfWS/UppxylWw0m/N73oCp9rDvhDMu+SYfXZQobgnqJy
         GNSmNZEtKk6SsbEPyM3v92bHdEChwc1ImFFiOUfee3HG+/662q/3N6EVAVqM5W6Qy6q1
         PvBHpy2sFnvxyX8E6WA8kJubkewQPOlLavPCPHqcJYtU92Ir1u7cqNf5NxW7Ozxg+4YB
         5xtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0dLJFdKxayJ8MNOrImhLx/NANWsEl0cGTSl+dBFXOgbRxlkWNcCD33ncpVpbSnYXr4wW5Xjyr2Xb4ww==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK+5uAkeQ0PHvcTqhyJ65OC03kSu0uXV938mdWiDr3piHcZ/vH
	pCvBZ5osAQ09zCuPE1+t96ycKma2H7Y0C8qnE14Kgye2lI5gz29UW06ywbMrHLzP6/g=
X-Gm-Gg: ASbGncv9Nz21ib2OIg/BDrmsODz7DAuGeTwuvEO3xcOQyq8t4cP6UKC0/k+FelkkR+E
	9W3sVC9fQ6R7s+aaRFEfj0ap0dJFU+07bnTVcSEAFGsVUVyxkCbwlKwjLcFGYe7SMhkYjzm2rFX
	Kn0yqSdf2p/5lDrTASmCY0UIZ7i0dD3baYHs6028cLwOmbERxDRErHTK1920ZQPpu3MXsRori5j
	MujqvSFK0O4J4ZVqfglaPnFO2hd9GXIX01g0a4Ih/A1PaGrAUYxZrPQYCsgSNzYJpFLm0vHdknJ
	XwbvEw6mAYuTN7Pzr/zq/EB0ehuaf9gVIGjMaI8CIuZzgTsZcVE0OZeOZiT5Lg==
X-Google-Smtp-Source: AGHT+IHaGU6VaoGRPbS69xPUEIisUrjE8e2rebwY7/MdzFUPdPZSwjK8HTRRYYazeTXqgdlwgTI3ug==
X-Received: by 2002:a17:90b:3dce:b0:311:baa0:89ca with SMTP id 98e67ed59e1d1-31241e98d1bmr560226a91.34.1748541322634;
        Thu, 29 May 2025 10:55:22 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3123b3ad196sm299788a91.15.2025.05.29.10.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:55:22 -0700 (PDT)
Date: Thu, 29 May 2025 10:55:20 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Cyril Bur <cyrilbur@tenstorrent.com>,
	samuel.holland@sifive.com, ben.dooks@codethink.co.uk,
	palmer@dabbelt.com, linux-kernel@vger.kernel.org,
	jszhang@kernel.org, paul.walmsley@sifive.com, charlie@rivosinc.com,
	jrtc27@jrtc27.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: uaccess: Only restore the CSR_STATUS SUM bit
Message-ID: <aDifiKsdE-29w7-N@debug.ba.rivosinc.com>
References: <20250522160954.429333-1-cyrilbur@tenstorrent.com>
 <2c07d65e-0641-42a0-9eb4-9e42d9325ff2@ghiti.fr>
 <CAFTtA3PATS2CT-jax7eTNS=ZqU55CwGr=TeGiNX16ztfp5v9_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFTtA3PATS2CT-jax7eTNS=ZqU55CwGr=TeGiNX16ztfp5v9_w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_105524_074252_3D60BA04 
X-CRM114-Status: GOOD (  22.38  )
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

T24gVGh1LCBNYXkgMjksIDIwMjUgYXQgMTI6MTc6MjRBTSArMDgwMCwgQW5keSBDaGl1IHdyb3Rl
Ogo+T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgNDozOeKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxl
eEBnaGl0aS5mcj4gd3JvdGU6Cj4+Cj4+ICtjYyBsaW51eC1yaXNjdiwgQW5keSwgRGVlcGFrCj4+
Cj4+IE9uIDUvMjIvMjUgMTg6MDksIEN5cmlsIEJ1ciB3cm90ZToKPj4gPiBEdXJpbmcgc3dpdGNo
IHRvIGNzcnMgd2lsbCBPUiB0aGUgdmFsdWUgb2YgdGhlIHJlZ2lzdGVyIGludG8gdGhlCj4+ID4g
Y29ycmVzcG9uZGluZyBjc3IuIEluIHRoaXMgY2FzZSB3ZSdyZSBvbmx5IGludGVyZXN0ZWQgaW4g
cmVzdG9yaW5nIHRoZQo+PiA+IFNVTSBiaXQgbm90IHRoZSBlbnRpcmUgcmVnaXN0ZXIuCj4+ID4K
Pj4gPiBGaXhlczogNzg4YWE2NGMwICgicmlzY3Y6IHNhdmUgdGhlIFNSX1NVTSBzdGF0dXMgb3Zl
ciBzd2l0Y2hlcyIpCj4+ID4gU2lnbmVkLW9mZi1ieTogQ3lyaWwgQnVyIDxjeXJpbGJ1ckB0ZW5z
dG9ycmVudC5jb20+Cj4+ID4gLS0tCj4+ID4gSSd2ZSBwdXQgdGhlIEZpeGVzIHRhZyBpbiBidXQg
SSBhc3N1bWUgdGhpcyB3aWxsIGdldCBzcXVhc2hlZCBpbnRvIHRoZQo+PiA+IHBhdGNoLiBFaXRo
ZXIgd2F5IEkgaG9wZSB0aGlzIHdvcmtzIHRvIGZpeCB0aGUgaW1tZWRpYXRlIGlzc3VlLgo+PiA+
Cj4+ID4gICBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIHwgMTIgKysrKysrKystLS0tCj4+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+PiA+Cj4+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9lbnRyeS5TCj4+ID4gaW5kZXggMDBiZDBkZTlmYWEyLi42ZWQzYmQ4MDkwM2QgMTAwNjQ0
Cj4+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+PiA+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2VudHJ5LlMKPj4gPiBAQCAtMzk5LDE0ICszOTksMTggQEAgU1lNX0ZVTkNfU1RB
UlQoX19zd2l0Y2hfdG8pCj4+ID4gICAgICAgUkVHX1MgczExLCBUQVNLX1RIUkVBRF9TMTFfUkEo
YTMpCj4+ID4KPj4gPiAgICAgICAvKiBzYXZlIHRoZSB1c2VyIHNwYWNlIGFjY2VzcyBmbGFnICov
Cj4+ID4gLSAgICAgbGkgICAgczAsIFNSX1NVTQo+PiA+IC0gICAgIGNzcnIgIHMxLCBDU1JfU1RB
VFVTCj4+ID4gLSAgICAgUkVHX1MgczEsIFRBU0tfVEhSRUFEX1NUQVRVU19SQShhMykKPj4gPiAr
ICAgICBjc3JyICBzMCwgQ1NSX1NUQVRVUwo+PiA+ICsgICAgIFJFR19TIHMwLCBUQVNLX1RIUkVB
RF9TVEFUVVNfUkEoYTMpCj4+ID4KPj4gPiAgICAgICAvKiBTYXZlIHRoZSBrZXJuZWwgc2hhZG93
IGNhbGwgc3RhY2sgcG9pbnRlciAqLwo+PiA+ICAgICAgIHNjc19zYXZlX2N1cnJlbnQKPj4gPiAt
ICAgICAvKiBSZXN0b3JlIGNvbnRleHQgZnJvbSBuZXh0LT50aHJlYWQgKi8KPj4gPiArICAgICAv
Kgo+PiA+ICsgICAgICAqIFJlc3RvcmUgY29udGV4dCBmcm9tIG5leHQtPnRocmVhZC4gY3NycyB3
aWxsIE9SIHRoZSBiaXRzIGZyb20gczAgYW5kCj4+ID4gKyAgICAgICogb25seSB3YW50IHRvIHJl
c3RvcmUgdGhlIFNSX1NVTSBiaXQKPj4gPiArICAgICAgKi8KPj4gPiAgICAgICBSRUdfTCBzMCwg
IFRBU0tfVEhSRUFEX1NUQVRVU19SQShhNCkKPj4gPiArICAgICBsaSAgICBzMSwgIFNSX1NVTQo+
PiA+ICsgICAgIGFuZCAgIHMwLCAgczAsIHMxCj4+ID4gICAgICAgY3NycyAgQ1NSX1NUQVRVUywg
czAKPj4gPiAgICAgICBSRUdfTCByYSwgIFRBU0tfVEhSRUFEX1JBX1JBKGE0KQo+PiA+ICAgICAg
IFJFR19MIHNwLCAgVEFTS19USFJFQURfU1BfUkEoYTQpCj4+Cj4+IFRvIGNvbmNsdWRlIHRoZSBk
aXNjdXNzaW9uIHdlIGhhZCBoZXJlCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2L2FEQ3RBVGwyTjIxZkJzeVRAZGVidWcuYmEucml2b3NpbmMuY29tLyN0LAo+PiBpbiBhZGRp
dGlvbiB0byBDeXJpbCdzIHBhdGNoIGFib3ZlLCB0byBtZSB3ZSBvbmx5IGhhdmUgdG8gcmVuYW1l
IHRoZQo+PiBzdGF0dXMgZmllbGQgaW50byBzdW0gYW5kIHdlJ3JlIGdvb2QgdG8gZ28uIEBBbmR5
LCBARGVlcGFrIEBTYW11ZWwgRG8KPj4geW91IGFncmVlPwo+Cj5MR1RNLCB0aGFua3MhCj4KPkFu
ZHkKClNvdW5kcyBnb29kIHRvIG1lLgoKPgo+Pgo+PiBBcyB0aGlzIGlzIGFuIGltcG9ydGFudCBm
aXggKGFsb25nIHdpdGggMiBvdGhlciBmaXhlcywgb25lIGZvciB0aGVhZAo+PiB2ZWN0b3IgYW5k
IHZkc28gc3RhdGljIHZhbHVlcyksIEknZCBsaWtlIHRvIHNlbmQgYW5vdGhlciBQUiBzb29uIGZv
cgo+PiBpbmNsdXNpb24gaW4gNi4xNi1yYzEsIEkgZGlkIG5vdCB3YW50IHRvIGRlbGF5IHRoZSBz
ZWNvbmQgUFIgYW55IGxvbmdlci4KPj4KPj4gVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrcywKPj4K
Pj4gQWxleAo+Pgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
