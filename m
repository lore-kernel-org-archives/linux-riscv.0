Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9F9C83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 21:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qAGGaQGfl4K86z9EiZjjg6ychE6iVEgHgph2hPiEw6M=; b=GZ1k5icB+NzIyD
	sF2Zp6xEgqJb02zwiXRz7M2m4B1BCBrQMFxUSlsdpiBZaHCwMDPpYA/LVKhAB+NMseUCxqMT2gxWG
	/aSxa2TxfEzvacvu+AXmI0gtR/ZiU1BJXinORVinQBgVbbYhD5t3hKUuoMOBL0QbmnhC1o6dsq842
	AubM3dNWzvD3eqWZd5jMJBM7xsY/GNxYM5Auz28nUNSHnlewcAwcldxiJo6aH4yA4zkWnUvcipCi1
	Xcgn7RyaecIUqY+TLOWuvdIID4JRRoYRSa5LBimufWP0I+Dx3Ky7gywso2Kr4sn1qb59ehLPmjfOq
	St3xxMhO4IxoFJa3M81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxve-00000000iYV-3Ajv;
	Mon, 21 Jul 2025 21:20:10 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxvb-00000000iY3-3Lft;
	Mon, 21 Jul 2025 21:20:09 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-23f8d27eeeaso39875ad.2;
        Mon, 21 Jul 2025 14:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753132807; x=1753737607; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NsMO+b+iZrAnk8twiiMQUvHd9IjE0h3cm/6jfh9vqZ4=;
        b=TObz/V86KCuU0zqQbfMmwWBOj4jGTckQKogvZMG5Sm8kanoNb9FRD51c+Jlcoibq2H
         KJrTZCmL+HcIi/WyFHH/hYadJC1eQr48WPZZCoxfWB9Pd1IwxZyt1+QYoGleeyAcweTp
         1nXOcmacCnnJLXQsr3/t+T6WqZ38CRyLpJO0Sekk8jSI/1bNu8/PVUFANA4zkHX8L47H
         dGwl6/qSmh+2bSXql9DycottOZxH8ckE54uR2fwsMI8VA0G5baSG/bclcu/KWkof70+d
         7PXz55YK1pt1oBiAvqMR7V3h7JOEIzQz0cM3etHTRr69SErBoqyfryxn1v1pGacXaCy4
         KnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753132807; x=1753737607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsMO+b+iZrAnk8twiiMQUvHd9IjE0h3cm/6jfh9vqZ4=;
        b=ipqeR6jvY2hdjeMSwvK+r+L7I/SRJrE1eWBJ0NfjCV7TSkhqel+LdOi1WupXCHNWQc
         +pkqSg8NKVSBDBpo3oZmed+MrZLeELzaOyu5Lsn+wlGs4ZYSSmukAOhGEisgkPiwWKfd
         9pk3CN07Wjeopp4bWx8zPgV0q6vn+WlIIBz7l2IDfTyiv6FsNhugkluyj8B77jQ5DKJG
         9/jLKG0aDlZlt4cFwWeJ4qrIIm4q/+LnRKPyUMK7WNI2WKglHwAQO5VbUkQbTwMMlP83
         ypY32BPqsZU9+UQ4uHaGnZ4naqLFLI5qomausUP6GQ9XGwx7xpmL4rUfMQi7y4S9aymY
         j+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8YzkdpyigwTnjLLZ9XdNjk3gmEdQRTqc+VbOeylK1a8TKXKj48kdJOe32R9bTMk9bQC5RXhd/UiUCZyw=@lists.infradead.org, AJvYcCVGvoxYOrRFKbTX+8SNePXy97VDAVyyzhSAyVGqGfswhA9FgYiRi7/UOtxTDvCGKlJi8rPMH2tVTrWjJnOntCnoAlHK@lists.infradead.org
X-Gm-Message-State: AOJu0YxlSYEobQCmNmE1CP3AY9e9GgJtY7YlI8IZ+ISV3uvFiXgRsYli
	jWAZtp8XmpsoywQ4BKS5l32M0NpwaHWkSJwr70pytEjNAA5/WrmeEdfZ
X-Gm-Gg: ASbGncuYGmJm8Putlusa61tWQ8Q3/2uuRLB6KTdiB17eRO0qTj8rYAJn7Dfx1BGbgmV
	fVuqH3G1kXsixDTffxxZy1SwalOHUQwUyfcjc8AUkxZJwlWFuRQlHq0eos0YtkONb4lw7riXXg0
	K1s77mRDK1y5lj7jnl6IsQJk5T/rrXWHTc4Fx+6d/3GL/GhFXU2v2MfSolFip827zIVIAY2AmpC
	C7lOSvECg2FxuvLxi2sAzh27TIoFK6ar3ExUi5DTKOVB7BgoIv8eUGPOKYlZo7BCt11KALGe91J
	lU3Qms3E//eqegZPvjgbWYBQV8BjHVgkLeHggOAJcaYq4EjbP3ngG1uiMOtde9HDTi4tG17X98V
	OntUB2s2unvInxeLpn03E6f7uQ58lPCTN6jsGlVUn
X-Google-Smtp-Source: AGHT+IEkrqK81MGGJPFPsHSJxmlWubLxrncXIrtyZWouT8x8xtt/3iePZr5qCtjEQXIhNUovnxMIdw==
X-Received: by 2002:a17:902:c40a:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23e25693727mr292205455ad.4.1753132806605;
        Mon, 21 Jul 2025 14:20:06 -0700 (PDT)
Received: from x1 (97-120-254-139.ptld.qwest.net. [97.120.254.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3d5asm62662505ad.15.2025.07.21.14.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 14:20:05 -0700 (PDT)
Date: Mon, 21 Jul 2025 14:20:03 -0700
From: Drew Fustini <pdp7pdp7@gmail.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Drew Fustini <fustini@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] riscv: Add sysctl to control discard of vstate during
 syscall
Message-ID: <aH6vA+e5v7NMMGnc@x1>
References: <20250719033912.1313955-1-fustini@kernel.org>
 <DBHQK4W9CL9F.1WM8JFVDQZ44F@ventanamicro.com>
 <DBHTIDY0HRM0.2B8L1WG7IBCXM@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DBHTIDY0HRM0.2B8L1WG7IBCXM@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_142007_840896_58A9ADDE 
X-CRM114-Status: GOOD (  20.19  )
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

T24gTW9uLCBKdWwgMjEsIDIwMjUgYXQgMDQ6NTQ6MjVQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjUtMDctMjFUMTQ6MzU6MzgrMDI6MDAsIFJhZGltIEtyxI1tw6HFmSA8cmty
Y21hckB2ZW50YW5hbWljcm8uY29tPjoKPiA+IFNob3VsZG4ndCB0aGUgUklTQy1WIExpbnV4IHN5
c2NhbGwgQUJJIGJlIGRlZmluZWQgc29tZXdoZXJlPwo+IAo+IFRvIGNsYXJpZnkgdGhpcyBwb2lu
dC4gIE15IGlzc3VlIGlzIHdpdGggdGhlIGZvbGxvd2luZyBwYXJ0IGluCj4gRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L3ZlY3Rvci5yc3Q6Cj4gCj4gPj4gIEFzIGluZGljYXRlZCBieSB2ZXJzaW9u
IDEuMCBvZiB0aGUgViBleHRlbnNpb24gWzFdLCB2ZWN0b3IgcmVnaXN0ZXJzIGFyZQo+ID4+ICBj
bG9iYmVyZWQgYnkgc3lzdGVtIGNhbGxzLgo+ID4+ICBbLi4uXQo+ID4+ICAxOiBodHRwczovL2dp
dGh1Yi5jb20vcmlzY3YvcmlzY3Ytdi1zcGVjL2Jsb2IvbWFzdGVyL2NhbGxpbmctY29udmVudGlv
bi5hZG9jCj4gCj4gVGhlIElTQSBkb2VzIG5vdCBzYXkgdGhhdCB2ZWN0b3IgcmVnaXN0ZXJzIGFy
ZSBjbG9iYmVyZWQgYnkgc3lzdGVtCj4gY2FsbHMuICBBbGwgdGhlIElTQSBzYXlzIGlzOgo+IAo+
ICAgIlRoaXMgQXBwZW5kaXggaXMgb25seSBhIHBsYWNlaG9sZGVyIHRvIGhlbHAgZXhwbGFpbiB0
aGUgY29udmVudGlvbnMKPiAgICB1c2VkIGluIHRoZSBjb2RlIGV4YW1wbGVzLCBhbmQgaXMgbm90
IGNvbnNpZGVyZWQgZnJvemVuIG9yCj4gICAgcGFydCBvZiB0aGUgcmF0aWZpY2F0aW9uIHByb2Nl
c3MuICBUaGUgb2ZmaWNpYWwgUklTQy1WIHBzQUJJIGRvY3VtZW50Cj4gICAgaXMgYmVpbmcgZXhw
YW5kZWQgdG8gc3BlY2lmeSB0aGUgdmVjdG9yIGNhbGxpbmcgY29udmVudGlvbnMuIgo+IAo+IHdo
aWxlIHRoZSBSSVNDLVYgcHNBQkkgc2F5czoKPiAKPiAgICJUaGUgY2FsbGluZyBjb252ZW50aW9u
IGZvciBzeXN0ZW0gY2FsbHMgZG9lcyBub3QgZmFsbCB3aXRoaW4gdGhlCj4gICAgc2NvcGUgb2Yg
dGhpcyBkb2N1bWVudC4gUGxlYXNlIHJlZmVyIHRvIHRoZSBkb2N1bWVudGF0aW9uIG9mIHRoZQo+
ICAgIFJJU0MtViBleGVjdXRpb24gZW52aXJvbm1lbnQgaW50ZXJmYWNlIChlLmcgT1Mga2VybmVs
IEFCSSwgU0JJKS4iCj4gCj4gV2UgbWFkZSBhIGNpcmN1bGFyIGRlcGVuZGVuY3ksIG1pc2ludGVy
cHJldGVkIHRoZSBJU0EsIGFuZCBwcm9iYWJseQo+IGltcGxlbWVudGVkIGEgc3Vib3B0aW1hbCBz
eXNjYWxsIEFCSSAtLSBwcmVzZXJ2aW5nIHZlY3RvciByZWdpc3RlcnMKPiBzZWVtcyBzdHJpY3Rs
eSBiZXR0ZXIuCgpUaGFua3MgZm9yIHByb3ZpZGluZyB0aGVzZSByZWZlcmVuY2VzLiBJdCBkb2Vz
IHNlZW0gbGlrZSB0aGlzIGlzCnNvbWV0aGluZyB0aGF0IGFuIE9TIGNhbiBkZWNpZGUgYW5kIGlz
IG5vdCBtYW5kYXRlZCBieSB0aGUgSVNBIG9yIHBzQUJJLgoKPiA+IEhvdyBjb21lIHdlIGNvdWxk
IGhhdmUgYnJva2VuIGl0IHdpdGggOTY1N2U5YjdkMjUzPwo+IAo+IFdlIGNoYW5nZWQgdGhlIEFC
SSBvbmNlLCBzbyBtYXliZSB3ZSBjYW4gY2hhbmdlIGl0IGJhY2s/CgpSZXZlcnRpbmcgOTY1N2U5
YjdkMjUzIHdvdWxkIHNvbHZlIHRoZSBwZXJmb3JtYW5jZSBpc3N1ZSBmb3Igc29tZQppbXBsZW1l
bnRhdGlvbnMgdGhhdCBJJ3ZlIGhpZ2hsaWdodGVkIGluIHRoaXMgcGF0Y2guIEhvd2V2ZXIsIEkg
YW0KaW50ZXJlc3RlZCB0byBoZWFyIGZyb20gb3RoZXJzIHRoYXQgZmVlbCB0aGUgY3VycmVudCBt
YW5kYXRvcnkKY2xvYmJlcmluZyBiZWhhdmlvciBpcyBpZGVhbCBmb3IgdGVzdGluZyAoYW5kIG1h
eWJlIHNlY3VyaXR5PykuCgpUaGFua3MsCkRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
