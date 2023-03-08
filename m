Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA9FC64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 03:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8Kl4zlXNUAozSVjeCRVSfYFvsVxWn2Ak2TmGqivCIo=; b=ARqlTldxbbMHPr
	N+iWYgkp8P5X2tBrYnQpHDur67ZOELm42+XhJdP9O7S4bsWD4XBxIOPIkbRgntmJ+8uSngMx8nSoj
	0PV7z3/3RiMQOMHI+6uLYQDIaqrHQkARUCCwWPqfMTUnjqhLl38jWPjj3S+mZ5nUMZTAxH2vz0Hsd
	PYhswkMW/LSh6u6iN4uhzXUCHfGBQoMtkO4pGYkGKFCIhUTKFO/wFVk2zR6NdsfI2yIyzyl10DWOr
	FHuVre62h2QWhIZBSagLR7590LeB7tG+obZrZkBrtBA2QUgP/Yi41dbYJkKQKBj+DPCjBUN+pSgPM
	DhA0pLGk7sTHgiByeo8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZklM-003MyZ-DG; Wed, 08 Mar 2023 03:46:48 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZklJ-003Mwd-OK
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 03:46:47 +0000
Received: by mail-qt1-x834.google.com with SMTP id h19so16929590qtk.7
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 19:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678247204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdrBc7q0BBfVTxoZqm8OhZOgpSNqHyPneh+aFDixsSE=;
        b=dI9BlD03sT71teNdjiUUPqpbib3NOwpxEtklXv3sZMUMJlcWLZ7qam1rxP75zHZJ2G
         itbv6Mxlud4XAHvG4KLJ4dkw9tbP22IRlw65krNI32mWq3jlmQ7HAp//DK7TCC4M8REg
         YEN/UBWnxAJu7aXuGia/Ka99p+quTizb5oOwIrm0TLz9mopfv3ytmVUgGiStZhOc44Wg
         4ySxiQwlgQvthlbrQjMlVzStMFP4VEQSiB2ioGBDH3qrVrWLZwjRET7QVw6vHDb3+hVM
         z5Oy6KAIH4AV5IGYNbQUQvCKa7muG6j3jGzELZKsX50OkQUPHWU92oZhPJrrt/LJlNH+
         Oq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678247204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdrBc7q0BBfVTxoZqm8OhZOgpSNqHyPneh+aFDixsSE=;
        b=C2VvpbjyVdYg1QX90+xKEk+2CSY2AO33HoDwMfh9uVUrkXALeu+aSH2RlqHMiuycW6
         +M8HYsCT+CHSdUNYZe6XqESokzxZdnqvGTBkqCtidzWVCmPXwZu6eYLknGr+azo+zCMu
         vqFYycW44QdaJCsqQEGQD1Y19StPFl6ORIGnY+tJrA6dpU//XBvt/71bxea4GDxIGkAS
         D3Tm71J2p0Z5SoCLHhNrVk9xiDuDHyH9lUoIx7ec6QP4I2mov9hzm5PiLzyc+3n6rtJw
         ysHyEewpKNPa22RKzJEN0Z7niL3KJH5DEpnE4bjVrhH04TAGBCTA3b56QiYwPqZSKvMG
         w2iQ==
X-Gm-Message-State: AO0yUKWP/kw6rAR/eFs6yuVWrnBO545svglQyy6FDc9V+6Q0zfNWCnLf
	gdc2AN/vnbU/mRjafxS8IbE=
X-Google-Smtp-Source: AK7set/3yLyTf0njU1qukUMOneYpRDNwsD+VfUmK62hIzAvf0Z+tipB5Cf8zcBdRKreEuSvjLNaARw==
X-Received: by 2002:ac8:5bc9:0:b0:3bf:cd81:3a31 with SMTP id b9-20020ac85bc9000000b003bfcd813a31mr30189786qtb.65.1678247204238;
        Tue, 07 Mar 2023 19:46:44 -0800 (PST)
Received: from [10.4.10.38] (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id g186-20020a37b6c3000000b007430494ab92sm10613604qkf.67.2023.03.07.19.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 19:46:43 -0800 (PST)
Message-ID: <416e27cd-0826-9bfa-8ee8-cf70dfb503c1@gmail.com>
Date: Tue, 7 Mar 2023 22:46:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Content-Language: en-US
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
 <556ce787-80eb-dc48-f8d6-83e415538e36@opensource.wdc.com>
 <f8f291d9-2723-4ab8-3020-49018757d470@gmail.com>
 <62852ee1-3763-3323-c3a8-f1e84f70204a@infradead.org>
 <c7941231-8ebd-dea5-81f8-3180cfc3f286@gmail.com>
 <1d858dbb-ae85-95a0-3e46-b67017733c04@infradead.org>
 <db3b3412-9616-d13c-3374-48647325e057@infradead.org>
 <7280914e-59e3-ba6d-4324-a29c1c0b4ce8@gmail.com>
 <2ebe4bc5-c11c-89b1-2644-358dc12bdfa5@infradead.org>
 <d3fb242e-646e-50b5-7dba-17b228bb32aa@opensource.wdc.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <d3fb242e-646e-50b5-7dba-17b228bb32aa@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_194645_833886_88E84E02 
X-CRM114-Status: GOOD (  22.98  )
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

CgpPbiAzLzcvMjMgMjI6NDIsIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IE9uIDMvOC8yMyAxMjoy
MywgUmFuZHkgRHVubGFwIHdyb3RlOgo+Pj4+IE9LLCBJIGRvbid0IGtub3cgaG93IGl0IGhhcHBl
bmVkLiBJIGNhbm5vdCByZXByb2R1Y2UgaXQgbm93Lgo+Pj4+IFRoZSBmYWlsaW5nIC5jb25maWcg
ZmlsZXMgaGFzIENPTkZJR19NTVUgaXMgbm90IHNldCAoZm9yIFJWMzJJKSwgd2hpY2gKPj4+PiBh
cHBlYXJzIHRvIGJlIGltcG9zc2libGUuCj4+PiBUaGVzZSBwYXRjaGVzIGFkZCBgQ09ORklHX01N
VSBpcyBub3Qgc2V0YCAoZm9yIFJWMzJJKS4KPj4+IEJ1dCBubyB3b3JyaWVzIGl0IHNlZW1zIHRv
IGJlIGEgbm9uIGlzc3VlwqAgbm93Lgo+Pj4KPj4+IFlvdXIgdGhvdWdodHMgRGFtaWVuPwo+Pj4K
Pj4KPj4gVGhhbmtzIGZvciByZW1pbmRpbmcgbWUuCj4+Cj4+IFdpdGggdGhlc2UgMyBwYXRjaGVz
IGFwcGxpZWQgdG8gbGludXgtbmV4dC0yMDIzMDMwNywKPj4gSSBzdGlsbCBnZXQgdGhpcyBidWls
ZCBlcnJvci4KPiAKPiBEb2VzIHRoaXMgaGVscCA/Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c29jL2NhbmFhbi9LY29uZmlnIGIvZHJpdmVycy9zb2MvY2FuYWFuL0tjb25maWcKPiBpbmRleCAy
NTI3Y2Y1NzU3ZWMuLjc3OTZjNWYxZDEwOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9jYW5h
YW4vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvc29jL2NhbmFhbi9LY29uZmlnCj4gQEAgLTQsNyAr
NCw4IEBAIGNvbmZpZyBTT0NfSzIxMF9TWVNDVEwKPiAgICAgICAgICBib29sICJDYW5hYW4gS2Vu
ZHJ5dGUgSzIxMCBTb0Mgc3lzdGVtIGNvbnRyb2xsZXIiCj4gICAgICAgICAgZGVwZW5kcyBvbiBS
SVNDViAmJiBTT0NfQ0FOQUFOICYmIE9GCj4gICAgICAgICAgZGVmYXVsdCBTT0NfQ0FOQUFOCj4g
LSAgICAgICAgc2VsZWN0IFBNCj4gLSAgICAgICAgc2VsZWN0IE1GRF9TWVNDT04KPiArICAgICAg
IHNlbGVjdCBDT01NT05fQ0xLX0syMTAKPiArICAgICAgIHNlbGVjdCBQTQo+ICsgICAgICAgc2Vs
ZWN0IE1GRF9TWVNDT04KPiAgICAgICAgICBoZWxwCj4gICAgICAgICAgICBDYW5hYW4gS2VuZHJ5
dGUgSzIxMCBTb0Mgc3lzdGVtIGNvbnRyb2xsZXIgZHJpdmVyLgo+IAo+IChqdXN0IG5vdGljZWQg
dGhhdCB0aGVyZSBhcmUgd2hpdGVzcGFjZSBlcnJvcnMgaGVyZS4uLikKPiAKPiBOb3RlIHRoYXQg
Ym90aCB0aGUgc3lzY3RsIGFuZCBjbGsgZHJpdmVyIGRlcGVuZCBvbiBSSVNDVi4gSSB0aGluayB0
aGVzZSBzaG91bGQKPiBwcm9iYWJseSBhbHNvIGRlcGVuZCBvbiA2NEJJVCwgYW5kIGV2ZW50dWFs
bHkgYWRkIGEgInx8IENPTVBJTEVfVEVTVCIgYXMgd2VsbC4KPiBTbyBzb21ldGhpbmcgbGlrZSB0
aGlzOgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9LY29uZmlnIGIvZHJpdmVycy9jbGsv
S2NvbmZpZwo+IGluZGV4IGI2YzViZjY5YTJiMi4uNjU3YTM2ZDI2NDBkIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvY2xrL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2Nsay9LY29uZmlnCj4gQEAgLTQz
MSw3ICs0MzEsNyBAQCBjb25maWcgQ09NTU9OX0NMS19GSVhFRF9NTUlPCj4gCj4gICBjb25maWcg
Q09NTU9OX0NMS19LMjEwCj4gICAgICAgICAgYm9vbCAiQ2xvY2sgZHJpdmVyIGZvciB0aGUgQ2Fu
YWFuIEtlbmRyeXRlIEsyMTAgU29DIgo+IC0gICAgICAgZGVwZW5kcyBvbiBPRiAmJiBSSVNDViAm
JiBTT0NfQ0FOQUFOCj4gKyAgICAgICBkZXBlbmRzIG9uIE9GICYmIFJJU0NWICYmIFNPQ19DQU5B
QU4gJiYgKDY0QklUIHx8IENPTVBJTEVfVEVTVCkKPiAgICAgICAgICBkZWZhdWx0IFNPQ19DQU5B
QU4KPiAgICAgICAgICBoZWxwCj4gICAgICAgICAgICBTdXBwb3J0IGZvciB0aGUgQ2FuYWFuIEtl
bmRyeXRlIEsyMTAgUklTQy1WIFNvQyBjbG9ja3MuCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29j
L2NhbmFhbi9LY29uZmlnIGIvZHJpdmVycy9zb2MvY2FuYWFuL0tjb25maWcKPiBpbmRleCAyNTI3
Y2Y1NzU3ZWMuLjE3NDVhNjE0ZDJhNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9jYW5hYW4v
S2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvc29jL2NhbmFhbi9LY29uZmlnCj4gQEAgLTIsOSArMiwx
MCBAQAo+IAo+ICAgY29uZmlnIFNPQ19LMjEwX1NZU0NUTAo+ICAgICAgICAgIGJvb2wgIkNhbmFh
biBLZW5kcnl0ZSBLMjEwIFNvQyBzeXN0ZW0gY29udHJvbGxlciIKPiAtICAgICAgIGRlcGVuZHMg
b24gUklTQ1YgJiYgU09DX0NBTkFBTiAmJiBPRgo+ICsgICAgICAgZGVwZW5kcyBvbiBSSVNDViAm
JiBTT0NfQ0FOQUFOICYmIE9GICYmICg2NEJJVCB8fCBDT01QSUxFX1RFU1QpCj4gICAgICAgICAg
ZGVmYXVsdCBTT0NfQ0FOQUFOCj4gLSAgICAgICAgc2VsZWN0IFBNCj4gLSAgICAgICAgc2VsZWN0
IE1GRF9TWVNDT04KPiArICAgICAgIHNlbGVjdCBDT01NT05fQ0xLX0syMTAKPiArICAgICAgIHNl
bGVjdCBQTQo+ICsgICAgICAgc2VsZWN0IE1GRF9TWVNDT04KPiAgICAgICAgICBoZWxwCj4gICAg
ICAgICAgICBDYW5hYW4gS2VuZHJ5dGUgSzIxMCBTb0Mgc3lzdGVtIGNvbnRyb2xsZXIgZHJpdmVy
Lgo+IAo+IENPTVBJTEVfVEVTVCBpcyBvcHRpb25hbCB0aG91Z2gsIGJ1dCBJIGRvIG5vdCBzZWUg
YW55IHJlYXNvbiB3aHkgbm90IGV2ZW50aG91Z2gKPiBpbiBwcmFjdGljZSB0aGVzZSBkcml2ZXJz
IHdpbGwgbGlrZWx5IG5ldmVyIGVuZCB1cCBpbiAzMi1iaXRzIFNvQy4KPiAKPiAKCk9oIHRoYW5r
cyBJIHdhcyBpbiB0aGUgaW4gdGhlIG1pZHN0IG9mIG1ha2luZyBhIHNpbWlsYXIgcGF0Y2guCkRv
IHlvdSB3YW50IHRvIHN1Ym1pdCBpdCBvciBzaGFsbCBJLiBBbHNvIHRoYW5rcyBmb3IgdGhlIGhl
bHAgd2l0aCB0aGlzLCAKd2FzIHVzaW5nIHRhZyA2LjIuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
