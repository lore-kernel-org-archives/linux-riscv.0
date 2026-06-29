Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AF8C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 01:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjtMzPTY7SE86NkpsxCri6ZzLsn1KA7G0Jmk69ICTJw=; b=kOBEnyj9aSD/77
	oqGbLDxRZHE6o7GEoY2ie/3ga5qc80okndaalLvuGhD23+n6S2865rF/wAkIfzOA3x6pgnsh4ugdT
	o531S+DrPwsdv8ku0lA6Coo+JRi7V4m7EXz3y/JlYzcVgvaBQLOraDg7mGfCcEGRBcav/utbXeXMN
	NMa3dPahQTVtfleQlqkAo8qqXqUPnbajMD08s1aevuqM+eRXy6fc+Mgm/8v1Y2UcpB2+v/agF2SSt
	fIOaiC2Y01/XrjbB1nW+DNxUp5U/60HJGVh2Xf3p7GNUEMYXRv8FIqrEdARHjA/T/MaDi0sKtNQP5
	88A+vn489wSuq0lZhTsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we0bT-0000000DXEQ-2jqK;
	Mon, 29 Jun 2026 01:16:03 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we0bQ-0000000DXDg-1J5q
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 01:16:01 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso919101a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2026 18:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782695757; cv=none;
        d=google.com; s=arc-20260327;
        b=fs3I4O22QxKf1sB9+KJQLsSXbCr6uC+VhWlkZA0q22q2DnRLwouEbSuELtTxamWMPH
         VIQ1ehB4yQBcWo48ljE0gSupsU/9p84kq9BCTr5edqPCE3/rtCDtB9NJVDgpaD9Tms5x
         l82tCDOYXyKZRtg5HrXGp4FC44iFJQ4VYZsi66Duxtfmw33VbbEpBhU1L8GOrJnDS3wz
         tuhXrhhROXge5ZmPM4hExmyu5LpmEC2SX4/JvSls5Bk0fyq/ul8qlxiB3rvfpQek6KSa
         svw7fzjuFWWTBgDZiFf7vj6b7xYbYNvF3NaThpgbjqI0NTOMy5+fwBST9tdty63fN5zS
         8n8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mkIGoNj9/WZkckvb1+KhYqNwSHBnTTepRZw4NPJEdhA=;
        fh=K2K7cn18wSG+sMPtOayuh6+vJKQFpyqXvJ/4YjmXfWE=;
        b=a4H3srNM19F2JlPfcgYqkBJd9hIVfvjXl+Xn6LzUln3u9rQtFq/yvHEaVVNHqvSo4y
         ptYOgRBGANzu+pNj5klyYM6/qNjQR5mQeoHzVCdwZAdVHLzAQun+/ySX0a9OaHJCXWOT
         xK/2cQ8m4/s/5XjQ65M6OKaHAcxk6sbqoS4QAbWBEA8Nv1Iarv8i6O41CmM4/UThvLcA
         CB582Mfy4kWLICZttQtpA6KpV4pnlcW9+qoNTKYaHYGG2t51H2Y0CAQLiBpS12PVepYm
         QSmau1JZ3PEMKWgMukukKwzQKldMUZ5KsuZewar2GRck7U++YuNtc1D+icFQV55X662S
         evdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782695757; x=1783300557; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkIGoNj9/WZkckvb1+KhYqNwSHBnTTepRZw4NPJEdhA=;
        b=Fp6LeLGgGXSGVlvrLy6Jl7ucUPLkrNDrVrq2uai7mHOKiS4Ym12QGx3qK1xmv+1mcf
         A6rH5Dn/euvhH4cjG7tL/qklbY16r6UeHSdA7Y1oiybMq3nHefj5ZBaUg5oHsDVr0KLy
         upjGXpK5ApvTYgKRKGOATEdJas1BbQBkPzCF7exqCN0jOBnPXAD6pQWWJpGUSJgHu9K1
         n9BRlByGJqWLKc8mZaWuHuRVL2/hpmcSfe6jRIz2mvP2yYPlluSsxn9UTMwy860j+hZU
         lRh3jnJrqOEgTyGMfOqEoRMvRKFpXw5M7uoy9AiF+tdSGbnv0OL2CwZq7Ij8tRg3iN1t
         tqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782695757; x=1783300557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mkIGoNj9/WZkckvb1+KhYqNwSHBnTTepRZw4NPJEdhA=;
        b=cpJKClkCy8/ti19RLFme++ZcEFo4lQmJJAEXeN33MSevLTKBy2qNkXi2EZZgkB1m/v
         sBkCZ8cbcDHzKrDljeNNkyfSMMRVMfO5b557lkRdEXxmX/8AGLFUcHyeFyXAibnekjvI
         WTY/uC4WGBUviXt/wVUmXjZ8Qv91+FdrZ43Vj1m7myk9vVP4jrhqDrkQ+IX6RuIGv+Uk
         Mh29itBa+rVQGkWgCh3ZCUmreCWDmc0vzEJz+5NAGclLSpTlNu0Lwn2Uz98RXyducay/
         A2iC93uhAtcusNBXWPb9e4gMUpibxXvUBW6gB5WY/wnPiqY6PAlMtkQ9MLqV9uKIc0g8
         3kXA==
X-Forwarded-Encrypted: i=1; AHgh+RokdfWeZN6mFzztNnBUYUzqg0D3afrw5SVbq/nGIOyykadMHlPcOG1/fHDpIAlQGgxKbanYu/JR0S1q4g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3c9HFLKRbfE9wrMXOEul8RBJrchwH1YC/2uEku1WHN1qy7jrA
	UxcGPP27HfPwA893dI+/bLHh9kEii3/Vbm+qM8QzCWqXl1EMRWmjzsNSPGYPPuEX1fPOETa8/Yo
	ve6a/aucrFtB4tgjasimo4/dX2S6WUKmfJKqICiuLdw==
X-Gm-Gg: AfdE7cn8q2vg0dxwat2WLYfoiFjWq9iw3uVOntzjzDWL4sF/brmQJFpgI9cezXmlTix
	LDR1egDCuOLuZBerqZAslgMl73PP88Av3T1EIbXycvg/fV2AgUBcTO9gf2oP3guecTs1Mp2kgG9
	00GgGj3LbH8Y7Umbex0U9CTK9IiLZ0cp0gVcecScwWB8o2oeAx7Iw59SefU8FKrksA8bdVh4ZEg
	MvdG7kPM/mPdaqqtG4TZYLfYw0KTt5pvahg29iENOf6FnqhYBP6rFeFaBgzMopSno+VSwnHQNM=
X-Received: by 2002:a05:6402:50c7:b0:698:56e7:8eb3 with SMTP id
 4fb4d7f45d1cf-69856e7906cmr1618583a12.14.1782695757511; Sun, 28 Jun 2026
 18:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260615123821.373248-1-guoren@kernel.org> <7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
 <CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
 <e051d822-d0be-4a88-ba86-ec9b5905fd1e@iscas.ac.cn> <CAJF2gTRH6x78A3J5HJ5kUM47aDv8R0yFr8LRP+7jiLX4GL3ssg@mail.gmail.com>
 <20260618143634.7f3dd6c5@pumpkin> <CAJF2gTQqnpHPrE-df_kDZ-Y9g7sSfTQco3jKKnDzkuJfOEKmxQ@mail.gmail.com>
 <CANXhq0r=hNEF9jVM39fYC-bk7S4bNpWt9H4M3Qh3zo+d3UNRpA@mail.gmail.com> <CAJF2gTQD+PZj1pLpVT0u+q9CAwFMQubF6d3CYS=GDR0-b_fykQ@mail.gmail.com>
In-Reply-To: <CAJF2gTQD+PZj1pLpVT0u+q9CAwFMQubF6d3CYS=GDR0-b_fykQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 29 Jun 2026 09:15:46 +0800
X-Gm-Features: AVVi8Cds7GpMAvxKFJN7_-MdJZZ2NSSYN4ijpQeh5aUC9mstNP0YCeor9he6LBA
Message-ID: <CANXhq0o5z7+mxTptca32Ywr9UY5jrpA89f7fS81A9fG0JS25xw@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: Guo Ren <guoren@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	cuiyunhui@bytedance.com, iommu@lists.linux.dev, joro@8bytes.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	luxu.kernel@bytedance.com, palmer@dabbelt.com, pjw@kernel.org, 
	robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org, 
	yuanzhu@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_181600_414864_7034FEA8 
X-CRM114-Status: GOOD (  46.09  )
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

T24gU3VuLCBKdW4gMjgsIDIwMjYgYXQgNDoyMOKAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IEhpIFpvbmcgTGksCj4KPiBPbiBUdWUsIEp1biAyMywgMjAyNiBhdCA1
OjIx4oCvUE0gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBG
cmksIEp1biAxOSwgMjAyNiBhdCAxOjE04oCvQU0gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+
IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUsIEp1biAxOCwgMjAyNiBhdCA5OjM24oCvUE0gRGF2
aWQgTGFpZ2h0Cj4gPiA+IDxkYXZpZC5sYWlnaHQubGludXhAZ21haWwuY29tPiB3cm90ZToKPiA+
ID4gPgo+ID4gPiA+IE9uIFRodSwgMTggSnVuIDIwMjYgMTc6NTE6MzQgKzA4MDAKPiA+ID4gPiBH
dW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+IEhpIFZp
dmlhbiwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBBcyBub3RlZCBpbiB0aGUgUklTQy1WIElPTU1VIFNw
ZWNpZmljYXRpb24sIENoYXB0ZXIgNjoKPiA+ID4gPiA+ID4gV2hldGhlciBhbiA4LWJ5dGUgYWNj
ZXNzIHRvIGFuIElPTU1VIHJlZ2lzdGVyIGlzIHNpbmdsZS1jb3B5IGF0b21pYyBpcyBVTlNQRUNJ
RklFRCwgYW5kIHN1Y2ggYW4gYWNjZXNzIG1heSBhcHBlYXIsIGludGVybmFsbHkgdG8gdGhlIElP
TU1VLCBhcyBpZiB0d28gc2VwYXJhdGUgNC1ieXRlIGFjY2Vzc2VzIOKAlCBmaXJzdCB0byB0aGUg
aGlnaCBoYWxmIGFuZCBzZWNvbmQgdG8gdGhlIGxvdyBoYWxmIOKAlCB3ZXJlIHBlcmZvcm1lZC4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGVyZWZvcmUsIHRoZSBhdG9taWNpdHkgb2YgNjQtYml0IE1N
SU8gYWNjZXNzZXMgaXMgVU5TUEVDSUZJRUQgYW5kCj4gPiA+ID4gPiBub3QgY2xlYXJseSBkZWZp
bmVkIGluIHRoZSBjdXJyZW50IHJhdGlmaWVkIFJJU0MtViBJT01NVQo+ID4gPiA+ID4gc3BlY2lm
aWNhdGlvbi4gVG8gaGFuZGxlIHRoaXMgY29ycmVjdGx5LCB0aGUgTGludXggUklTQy1WIElPTU1V
IGRyaXZlcgo+ID4gPiA+ID4gc2hvdWxkIGZhbGwgYmFjayB0byAzMi1iaXQgTU1JTyBhY2Nlc3Nl
cyB3aGVuIHJlYWRpbmcgNjQtYml0IHJlZ2lzdGVycwo+ID4gPiA+ID4gKGUuZy4sIHBlcmZvcm1h
bmNlIGNvdW50ZXJzKS4gVGhlIGJlaGF2aW9yIG9mIDMyLWJpdCBNTUlPIGFjY2Vzc2VzIGlzCj4g
PiA+ID4gPiBtb3JlIHByZWNpc2VseSBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSU9NTVUgc3BlY2lm
aWNhdGlvbi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaHVzLCBtYW55IGhhcmR3YXJlIHZlbmRvcnMg
aW1wbGVtZW50IDMyLWJpdCBNTUlPIChyYXRoZXIgdGhhbiA2NC1iaXQKPiA+ID4gPiA+IE1NSU8p
IGJhc2VkIG9uIHRoZSBjdXJyZW50IHJhdGlmaWVkIFJJU0MtViBJT01NVSBzcGVjaWZpY2F0aW9u
LCBhbmQKPiA+ID4gPiA+IHRoaXMgZHJpdmVyIGRvZXMgbm90IGFwcGVhciB0byBiZW5lZml0IGZy
b20gNjQtYml0IE1NSU8gYWNjZXNzIGVpdGhlci4KPiA+ID4gPiA+IFBlcmZvcm1hbmNlIGlzIGZ1
bmRhbWVudGFsbHkgY29uc3RyYWluZWQgYnkgYnVzIGxhdGVuY3k7IGFzc3VtaW5nIHRoYXQKPiA+
ID4gPiA+IHNpbXBseSByZWR1Y2luZyB0aGUgbnVtYmVyIG9mIGFjY2Vzc2VzIHdpbGwgaW1wcm92
ZSBwZXJmb3JtYW5jZSBpcyBhbgo+ID4gPiA+ID4gb3ZlcnNpbXBsaWZpY2F0aW9uIHRoYXQgaWdu
b3JlcyB0aGUgdW5kZXJseWluZyBoYXJkd2FyZQo+ID4gPiA+ID4gY2hhcmFjdGVyaXN0aWNzLgo+
ID4gPiA+Cj4gPiA+ID4gSWYgdGhlIGJ1cyBsYXRlbmN5IGlzIHNpZ25pZmljYW50IGl0IGlzIGFs
bW9zdCBjZXJ0YWlubHkgd29ydGggdXNpbmcKPiA+ID4gPiBtZW1vcnkgYWNjZXNzZXMgdG8gYXZv
aWQgcmUtcmVhZGluZyB0aGUgaGkgcmVnaXN0ZXIuCj4gPiA+ID4KPiA+ID4gPiBTb21ldGhpbmcg
bGlrZSB0aGlzIG1pZ2h0IHdvcms6Cj4gPiA+ID4KPiA+ID4gPiBzdGF0aWMgdm9sYXRpbGUgdTMy
IGhpX3ByZXYsIGxvX3ByZXY7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIHUzMiBoaSA9IHJlYWRf
cmVnX2hpKCk7Cj4gPiA+ID4gICAgICAgICB1MzIgbG8gPSByZWFkX3JlZ19sbygpOwo+ID4gPiA+
Cj4gPiA+ID4gICAgICAgICBpZiAobG8gPD0gbG9fcHJldiB8fCBoaSAhPSBoaV9wcmV2KSB7Cj4g
PiA+ID4gICAgICAgICAgICAgICAgIHUzMiBoaV90bXAgPSByZWFkX3JlZ19oaTsKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgaWYgKGhpX3RtcCAhPSBoaSkgewo+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGhpID0gaGlfdG1wOwo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGxv
ID0gMDsKPiA+ID4gPiAgICAgICAgICAgICAgICAgfQo+ID4gPiA+ICAgICAgICAgICAgICAgICBs
b19wcmV2ID0gfjB1Owo+ID4gPiA+ICAgICAgICAgICAgICAgICBoaV9wcmV2ID0gaGk7Cj4gPiA+
ID4gICAgICAgICB9Cj4gPiA+ID4gICAgICAgICBsb19wcmV2ID0gbG87Cj4gPiA+ID4gICAgICAg
ICByZXR1cm4gKHU2NCloaSA8PCAzMiB8IGxvOwo+ID4gPiA+Cj4gPiA+ID4gSXQgc2hvdWxkbid0
IG5lZWQgYW55IGxvY2tpbmcgYnV0IHRoZSBhY2Nlc3NlcyBkbyBuZWVkIHRvIGJlIG9yZGVyZWQu
Cj4gPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb24uIEhvd2V2ZXIsIEkgYmVsaWV2ZSB0
aGlzIGZlZWRiYWNrIGlzIG1vcmUKPiA+ID4gcmVsZXZhbnQgdG8gdGhlIFJJU0MtViBJT01NVSBI
UE0gcGF0Y2hzZXQgWzFdLCBhcyBubyBjb3VudGVyIHJlZ2lzdGVycwo+ID4gPiBhcmUgaW52b2x2
ZWQgaW4gdGhlIGN1cnJlbnQgcGF0Y2hzZXQuIFRoYXQgc2FpZCwgdGhlIGlkZWEgb2YgaW1wcm92
aW5nCj4gPiA+IHRoZSBoaS1sby1oaSBzbG93LXBhdGggbWVjaGFuaXNtIHRvIGJldHRlciBoYW5k
bGUgaGlnaC1sYXRlbmN5Cj4gPiA+IGhhcmR3YXJlIHNjZW5hcmlvcyBpcyB3ZWxsIHRha2VuIGFu
ZCB3b3J0aCBkaXNjdXNzaW5nIGluIHRoZQo+ID4gPiBhcHByb3ByaWF0ZSB0aHJlYWQuCj4gPiA+
IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNjAyMDgwNjM4NDgu
MzU0NzgxNy0yLXpvbmcubGlAc2lmaXZlLmNvbS8KPiA+ID4KPiA+ID4gUC5TLiBUaGUgaGFyZHdh
cmUgSSBoYXZlIGF0IGhhbmQgZXhoaWJpdHMgdmVyeSBsb3cgaW50ZXJjb25uZWN0Cj4gPiA+IGxh
dGVuY3kuIEFuZCBJIGhhdmUgbmV2ZXIgb2JzZXJ2ZWQgdGhlIHNsb3cgcGF0aCB3aGVyZSBoaV90
bXAgIT0gaGkKPiA+ID4gYmVpbmcgdHJpZ2dlcmVkIOKAlCBteSBhcHByb2FjaCB3YXMgdG8gcmVt
b3ZlIHRoZSByZXRyeSBtZWNoYW5pc20KPiA+ID4gZGlyZWN0bHkgaW4gMzItYml0IG1taW8gbW9k
ZSBhbmQgcnVuIHN0cmVzcyB0ZXN0cyB0byBjaGVjayB3aGV0aGVyCj4gPiA+IHBlcmYgc3RhdCBw
cm9kdWNlZCBpbmNvcnJlY3QgcmVzdWx0cy4gVGhhdCBzYWlkLCBJIG1heSBoYXZlIHNpbXBseQo+
ID4gPiBiZWVuIGx1Y2t5IGluc3RlYWQgb2YgaHcgZ3VhcmFudGVlLgo+ID4gPgo+ID4KPiA+Cj4g
PiBIaSBldmVyeW9uZSwKPiA+Cj4gPiBUaGFuayB5b3UgZm9yIGFkZGluZyBtZSB0byB0aGlzIGRp
c2N1c3Npb24uIEkgdG9vayBzb21lIHRpbWUgdG8gcmVhZAo+ID4gdGhlIHByZXZpb3VzIG1lc3Nh
Z2VzLgo+ID4gUmVnYXJkaW5nIHRoZSBHaXRIdWIgaXNzdWUgbWVudGlvbmVkIGJ5IFZpdmlhbiwg
SSBub3RpY2VkIHNvbWVvbmUKPiA+IHBvaW50ZWQgb3V0IHRoYXQgdGhlIGhhcmR3YXJlIG11c3Qg
c3VwcG9ydCA2NC1iaXQgYWNjZXNzLgo+ID4KPiA+ICAgICBodHRwczovL2dpdGh1Yi5jb20vcmlz
Y3Ytbm9uLWlzYS9yaXNjdi1pb21tdS9pc3N1ZXMvNzY1I2lzc3VlY29tbWVudC00NzQyOTQxODk0
Cj4gPgo+ID4gSSB3b3VsZCBsaWtlIHRvIGNvbmZpcm0gaWYgdGhhdCBpcyBjb3JyZWN0LiBJZiBz
bywgc2hvdWxkIHdlIHVwZGF0ZQo+ID4gdGhlIHNwZWM/IEFuZCBkb2VzIHRoaXMgbWVhbiB3ZSBk
byBub3QgbmVlZCB0byBtb2RpZnkgdGhlIGRyaXZlcj8KPgo+IEN1cnJlbnRseSwgbm8gb25lIGhh
cyBwcm9wb3NlZCB1cGRhdGluZyB0aGUgU1BFQy4gRGlzY3Vzc2lvbnMgYXJlCj4gc3RpbGwgZm9j
dXNlZCBvbiBjbGFyaWZ5aW5nIHRoZSBtZWFuaW5nIG9mIHRoZSBleGlzdGluZyBzcGVjaWZpY2F0
aW9uLgo+IFRoZXJlIGFyZSB0d28gbWFpbiBwb2ludHMgdW5kZXIgZGlzY3Vzc2lvbjogdGhlIGZp
cnN0IGhhcyBiZWVuCj4gY2xhcmlmaWVkLCB3aGlsZSB0aGUgc2Vjb25kIHJlbWFpbnMgY29udHJv
dmVyc2lhbC4KPgo+IFRoZSBmaXJzdCBwb2ludCDigJQgIldoZXRoZXIgYW4gOC1ieXRlIGFjY2Vz
cyB0byBhbiBJT01NVSByZWdpc3RlciBpcwo+IHNpbmdsZS1jb3B5IGF0b21pYyBpcyBVTlNQRUNJ
RklFRCIg4oCUIGlzIHVuY29udHJvdmVyc2lhbC4gVmVkIGZ1cnRoZXIKPiBleHBsYWluZWQgdGhh
dCBzdWNoIGFuIGFjY2VzcyBtYXkgYXBwZWFyIGludGVybmFsbHkgdG8gdGhlIElPTU1VIGFzCj4g
dHdvIHNlcGFyYXRlIDQtYnl0ZSBhY2Nlc3Nlcy4gVGhlcmVmb3JlLCBmb3IgaHBtIENPVU5URVIg
Y291bnRlcnMsCj4gMzItYml0IE1NSU8gYWNjZXNzIG11c3QgYmUgdXNlZCB0byBndWFyYW50ZWUg
dGhlIGNvcnJlY3QgaGktbG8taGkKPiBvcmRlcmluZy4gVXNpbmcgNjQtYml0IE1NSU8gYWNjZXNz
IGNhbiByZXN1bHQgaW4gYSBsby1oaS1oaS1sbwo+IHNlcXVlbmNlLCBiZWNhdXNlIHRoZSBzcGVj
aWZpY2F0aW9uIGRvZXMgbm90IGRlZmluZSB0aGUgb3JkZXIgaW4gd2hpY2gKPiB0aGUgYWNjZXNz
IG1heSBiZSBzcGxpdCBhbmQgZXhwbGljaXRseSBtYXJrcyB0aGlzIGJlaGF2aW9yIGFzCj4gVU5T
UEVDSUZJRUQuIEF0IHByZXNlbnQsIHRoZXJlIGlzIHVuYW5pbW91cyBhZ3JlZW1lbnQgb24gdGhp
cyBwb2ludCwKPiB0aGF0IGlzLCAiV2hldGhlciBhbiA4LWJ5dGUgYWNjZXNzIHRvIGFuIElPTU1V
IHJlZ2lzdGVyIGlzIHNpbmdsZS1jb3B5Cj4gYXRvbWljIGlzIFVOU1BFQ0lGSUVEIi4KPgo+IFRo
ZSBzZWNvbmQgcG9pbnQg4oCUICJSZWdpc3RlcnMgdGhhdCBhcmUgNjQtYml0IHdpZGUgbWF5IGJl
IGFjY2Vzc2VkCj4gdXNpbmcgZWl0aGVyIGEgMzItYml0IG9yIGEgNjQtYml0IGFjY2Vzcy4iIOKA
lCBpcyBjb250cm92ZXJzaWFsLgo+IEFjY29yZGluZyB0byB0aGUgY2xlYXIgZGVmaW5pdGlvbiBp
biBSRkMgMjExOTogTUFZIFRoaXMgd29yZCwgb3IgdGhlCj4gYWRqZWN0aXZlICJPUFRJT05BTCIs
IG1lYW4gdGhhdCBhbiBpdGVtIGlzIHRydWx5IG9wdGlvbmFsLiBPbmUgdmVuZG9yCj4gbWF5IGNo
b29zZSB0byBpbmNsdWRlIHRoZSBpdGVtIGJlY2F1c2UgYSBwYXJ0aWN1bGFyIG1hcmtldHBsYWNl
Cj4gcmVxdWlyZXMgaXQgb3IgYmVjYXVzZSB0aGUgdmVuZG9yIGZlZWxzIHRoYXQgaXQgZW5oYW5j
ZXMgdGhlIHByb2R1Y3QKPiB3aGlsZSBhbm90aGVyIHZlbmRvciBtYXkgb21pdCB0aGUgc2FtZSBp
dGVtLiBBbiBpbXBsZW1lbnRhdGlvbiB3aGljaAo+IGRvZXMgbm90IGluY2x1ZGUgYSBwYXJ0aWN1
bGFyIG9wdGlvbiBNVVNUIGJlIHByZXBhcmVkIHRvIGludGVyb3BlcmF0ZQo+IHdpdGggYW5vdGhl
ciBpbXBsZW1lbnRhdGlvbiB3aGljaCBkb2VzIGluY2x1ZGUgdGhlIG9wdGlvbiwgdGhvdWdoCj4g
cGVyaGFwcyB3aXRoIHJlZHVjZWQgZnVuY3Rpb25hbGl0eS4gSW4gdGhlIHNhbWUgdmVpbiBhbiBp
bXBsZW1lbnRhdGlvbgo+IHdoaWNoIGRvZXMgaW5jbHVkZSBhIHBhcnRpY3VsYXIgb3B0aW9uIE1V
U1QgYmUgcHJlcGFyZWQgdG8KPiBpbnRlcm9wZXJhdGUgd2l0aCBhbm90aGVyIGltcGxlbWVudGF0
aW9uIHdoaWNoIGRvZXMgbm90IGluY2x1ZGUgdGhlCj4gb3B0aW9uIChleGNlcHQsIG9mIGNvdXJz
ZSwgZm9yIHRoZSBmZWF0dXJlIHRoZSBvcHRpb24gcHJvdmlkZXMpLgo+IENvbnNlcXVlbnRseSwg
YW55IGNsYWltIHRoYXQgdGhpcyB3b3JkaW5nIGltcG9zZXMgYSByZXF1aXJlbWVudCBmb3IKPiBo
YXJkd2FyZSB0byBzdXBwb3J0IDY0LWJpdCBNTUlPIGFjY2VzcyBoYXMgZ2VuZXJhdGVkIHNpZ25p
ZmljYW50Cj4gY29udHJvdmVyc3kuCj4KPiBUaGUgY3VycmVudCBleHBsaWNpdCBjb25zZW5zdXMg
b24gdGhlIHNwZWNpZmljYXRpb24gaXMgdGhlcmVmb3JlIGFzIGZvbGxvd3M6Cj4gMS4gQWxsIGhh
cmR3YXJlIG11c3Qgc3VwcG9ydCBhY2Nlc3MgdG8gNjQtYml0IHJlZ2lzdGVycyB1c2luZyAzMi1i
aXQKPiBNTUlPIGFjY2Vzc2VzLgo+IDIuIE9ubHkgMzItYml0IE1NSU8gYWNjZXNzZXMgYXJlIGd1
YXJhbnRlZWQgdG8gYmUgc2luZ2xlLWNvcHkgYXRvbWljLgo+Cj4gRnJvbSBib3RoIGEgc2luZ2xl
LWNvcHkgYXRvbWljaXR5IHBlcnNwZWN0aXZlIGFuZCBhIGhhcmR3YXJlCj4gcmVxdWlyZW1lbnRz
IHN0YW5kcG9pbnQsIExpbnV4IGtlcm5lbCBkcml2ZXJzIHNob3VsZCBjdXJyZW50bHkgZm9sbG93
Cj4gdGhlIGNvbnNlbnN1cyBkZXNjcmliZWQgYWJvdmUgYW5kIGF2b2lkIHRoZSBjb250cm92ZXJz
aWFsIDY0LWJpdCBNTUlPCj4gYWNjZXNzLiBGdXJ0aGVybW9yZSwgSSBzZWUgbm8gcGVyZm9ybWFu
Y2UgYmVuZWZpdCB0byB1c2luZyA2NC1iaXQgTU1JTwo+IGFjY2Vzc2VzIGluIHRoaXMgZHJpdmVy
LCBhcyB0aGUgb25seSA2NC1iaXQgcmVnaXN0ZXJzIGludm9sdmVkIOKAlCBzdWNoCj4gYXMgUklT
Q1ZfSU9NTVVfUkVHX0REVFAsIFJJU0NWX0lPTU1VX1JFR19JQ1ZFQywgYW5kIHF1ZXVlLT5xYnIg
4oCUIGFyZQo+IG5vdCBmcmVxdWVudGx5IGFjY2Vzc2VkLgo+CgpUaGFua3MgZm9yIHlvdXIgY2xh
cmlmaWNhdGlvbiwgSSB3aWxsIGFkZHJlc3MgdGhpcyB0b3BpYyBpbiBQTVUgZHJpdmVyCmluIHRo
ZSBuZXh0IHZlcnNpb24uCgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
