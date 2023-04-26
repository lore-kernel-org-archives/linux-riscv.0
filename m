Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A34C77B78
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 14:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=voWAyxgNl5hF5ucK1ZkvKwbd5sEf9epVNJJwf2Ybou4=; b=3vhgtBU9Wwe2KoK0vmdP46C46S
	QwjO9Z2wb7YdHi85ZstyH57OA/1kjsqQMymEGK843VwYPwZyE1UM1Ojz05uA/Rj0sRt7RtME0ZgXS
	2Sxphx1gtHKnxusPYzPRYQIfdMMOK5QXLryCuDJbvlfFjkdS8vjo421iCUZBd1efvaFsXfWLk+cuz
	TQDKU34t1l9nl0q464JLGX6MmLjJMYjalCoE0WA0ZOPOR5CHjWwq+ZMe/KTbixA9N4Pv79nYrFU6N
	F1KI/7JHYW7bx0gN6OSFLkKiFjJX13YjZRY97PMwmwC+dvOY75i/46pz+KOhe8WmGd86534DwrEoy
	Hbi93TWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prg7h-004CZF-1x;
	Wed, 26 Apr 2023 14:27:57 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prg7d-004CXg-1O
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 14:27:55 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b7588005fso6005342b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 07:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682519271; x=1685111271;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NnfrgNZHQvPmGsQGCQ2h4V9BhDAlSy+A6A7k8SbgA24=;
        b=eOpmq+GDGamx4114B5EpekL4Oyi6BpGcYrLG1ZLSFRd4iz8TxkNUVd5310VpiQN8so
         n2FRk0eoE22cOOzY42nRIC0Ls2ePljs55GZZX6ZpVEFGXiU6aLZbWi08I2s/h+3sxJbu
         zU1S20zF71gDp+Vl44usUB7GoiVTUOXjRsRkbbTxz8EEpUBJHT3csZJMD6sUxPYrvrpN
         tPh10UXow658hfYWRzpaBI7LZW+ANBIOhmPR5ItdcdeeqtH6d9bc1j5X+aCxGzr3WYBQ
         8HsiUQw9f8lAHIIq/a7Q5+DaYHiuDYnWgcQ4mCoXBFWei2RhShL9Do8AK88Mvz/rBW4V
         1gCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682519271; x=1685111271;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnfrgNZHQvPmGsQGCQ2h4V9BhDAlSy+A6A7k8SbgA24=;
        b=NLl5nSEvE2vtrHnTgfUitxZJARjosqrdtfbTL2ihKvI3zCNzkv+e6OdkQdoa2FINR2
         ID/LZE+TYvfCJdV/tfxxJqEqu3qNfxixVP6LswyIvBBELSBS1lM2l1eh54ZdxNNBY5rh
         F0KdT4JbH5lzGguBFF0RINKCOeQ60uCAK4LVZo8m3NVdJc/gaWaJYkPSfPlXjqXQ4ubR
         cNdBAOLDbR4AFULtBXNXxn0V6B5H0V4+1JqYuzq2Bcu896k07H3mW1upeWKhbymmU0az
         wwWx9RCBV+HqlmNV/y9stZ9l0g3+CTEBK0/t1jp7avJbE6dn2qeqFSFR23cI9CFXc1Jk
         5OXA==
X-Gm-Message-State: AAQBX9deacpfk7sSEwpyMBBth5XuEuQs/nixk3VyERA7d2Nyvrujf4Qe
	XKUEMVbxxbQ97JcpLk837WIg1w==
X-Google-Smtp-Source: AKy350ZzkeDiV+RuULlH10ymkq/hl2JydbrghBEvMXstloracVB3tARE2D82tPElpB2dnMeA0GpyZw==
X-Received: by 2002:a05:6a00:1a86:b0:63b:62d1:d868 with SMTP id e6-20020a056a001a8600b0063b62d1d868mr27658451pfv.8.1682519270628;
        Wed, 26 Apr 2023 07:27:50 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id k16-20020aa788d0000000b00625616f59a1sm10964994pff.73.2023.04.26.07.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:27:50 -0700 (PDT)
Date: Wed, 26 Apr 2023 07:27:50 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Apr 2023 07:27:45 PDT (-0700)
Subject: Re: [PATCH -next v18 00/20] riscv: Add vector ISA support
In-Reply-To: <CABgGipWbSFnAK=DwT9X2esPBVTi0p+Oft1NyWbZ60LOwHj4dgA@mail.gmail.com>
CC: bjorn@kernel.org, linux-riscv@lists.infradead.org, anup@brainfault.org,
  atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
  Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com,
  trix@redhat.com, Richard Henderson <richard.henderson@linaro.org>, libc-alpha@sourceware.org,
  Andrew Waterman <andrew@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-47aa965a-2b25-4ac0-984a-c2e6f3a051ee@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_072753_647497_C25055F4 
X-CRM114-Status: GOOD (  37.31  )
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

T24gVGh1LCAyMCBBcHIgMjAyMyAwOTozNjo0OCBQRFQgKC0wNzAwKSwgYW5keS5jaGl1QHNpZml2
ZS5jb20gd3JvdGU6Cj4gT24gV2VkLCBBcHIgMTksIDIwMjMgYXQgMTE6MTjigK9QTSBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPj4KPj4gT24gV2VkLCAxOSBBcHIg
MjAyMyAwNzo1NDoyMyBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9yZyB3cm90ZToKPj4gPiBC
asO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4+ID4KPj4gPj4gQW5keSBD
aGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgo+PiA+Pgo+PiA+Pj4gVGhpcyBwYXRj
aHNldCBpcyBpbXBsZW1lbnRlZCBiYXNlZCBvbiB2ZWN0b3IgMS4wIHNwZWMgdG8gYWRkIHZlY3Rv
ciBzdXBwb3J0Cj4+ID4+PiBpbiByaXNjdiBMaW51eCBrZXJuZWwuIFRoZXJlIGFyZSBzb21lIGFz
c3VtcHRpb25zIGZvciB0aGlzIGltcGxlbWVudGF0aW9ucy4KPj4gPj4+Cj4+ID4+PiAxLiBXZSBh
c3N1bWUgYWxsIGhhcnRzIGhhcyB0aGUgc2FtZSBJU0EgaW4gdGhlIHN5c3RlbS4KPj4gPj4+IDIu
IFdlIGRpc2FibGUgdmVjdG9yIGluIGJvdGgga2VybmVsIGFuZCB1c2VyIHNwYWNlIFsxXSBieSBk
ZWZhdWx0LiBPbmx5Cj4+ID4+PiAgICBlbmFibGUgYW4gdXNlcidzIHZlY3RvciBhZnRlciBhbiBp
bGxlZ2FsIGluc3RydWN0aW9uIHRyYXAgd2hlcmUgaXQKPj4gPj4+ICAgIGFjdHVhbGx5IHN0YXJ0
cyBleGVjdXRpbmcgdmVjdG9yICh0aGUgZmlyc3QtdXNlIHRyYXAgWzJdKS4KPj4gPj4+IDMuIFdl
IGRldGVjdCAicmlzY3YsaXNhIiB0byBkZXRlcm1pbmUgd2hldGhlciB2ZWN0b3IgaXMgc3VwcG9y
dCBvciBub3QuCj4+ID4+Pgo+PiA+Pj4gV2UgZGVmaW5lZCBhIG5ldyBzdHJ1Y3R1cmUgX19yaXNj
dl92X2V4dF9zdGF0ZSBpbiBzdHJ1Y3QgdGhyZWFkX3N0cnVjdCB0bwo+PiA+Pj4gc2F2ZS9yZXN0
b3JlIHRoZSB2ZWN0b3IgcmVsYXRlZCByZWdpc3RlcnMuIEl0IGlzIHVzZWQgZm9yIGJvdGgga2Vy
bmVsIHNwYWNlCj4+ID4+PiBhbmQgdXNlciBzcGFjZS4KPj4gPj4+ICAtIEluIGtlcm5lbCBzcGFj
ZSwgdGhlIGRhdGFwIHBvaW50ZXIgaW4gX19yaXNjdl92X2V4dF9zdGF0ZSB3aWxsIGJlCj4+ID4+
PiAgICBhbGxvY2F0ZWQgdG8gc2F2ZSB2ZWN0b3IgcmVnaXN0ZXJzLgo+PiA+Pj4gIC0gSW4gdXNl
ciBzcGFjZSwKPj4gPj4+ICAgICAtIEluIHNpZ25hbCBoYW5kbGVyIG9mIHVzZXIgc3BhY2UsIHRo
ZSBzdHJ1Y3R1cmUgaXMgcGxhY2VkCj4+ID4+PiAgICAgICByaWdodCBhZnRlciBfX3Jpc2N2X2N0
eF9oZHIsIHdoaWNoIGlzIGVtYmVkZGVkIGluIGZwIHJlc2VydmVkCj4+ID4+PiAgICAgICBhZXJh
LiBUaGlzIGlzIHJlcXVpcmVkIHRvIGF2b2lkIEFCSSBicmVhayBbMl0uIEFuZCBkYXRhcCBwb2lu
dHMKPj4gPj4+ICAgICAgIHRvIHRoZSBlbmQgb2YgX19yaXNjdl92X2V4dF9zdGF0ZS4KPj4gPj4+
ICAgICAtIEluIHB0cmFjZSwgdGhlIGRhdGEgd2lsbCBiZSBwdXQgaW4gdWJ1ZiBpbiB3aGljaCB3
ZSB1c2UKPj4gPj4+ICAgICAgIHJpc2N2X3ZyX2dldCgpL3Jpc2N2X3ZyX3NldCgpIHRvIGdldCBv
ciBzZXQgdGhlCj4+ID4+PiAgICAgICBfX3Jpc2N2X3ZfZXh0X3N0YXRlIGRhdGEgc3RydWN0dXJl
IGZyb20vdG8gaXQsIGRhdGFwIHBvaW50ZXIKPj4gPj4+ICAgICAgIHdvdWxkIGJlIHplcm9lZCBh
bmQgdmVjdG9yIHJlZ2lzdGVycyB3aWxsIGJlIGNvcGllZCB0byB0aGUKPj4gPj4+ICAgICAgIGFk
ZHJlc3MgcmlnaHQgYWZ0ZXIgdGhlIF9fcmlzY3Zfdl9leHRfc3RhdGUgc3RydWN0dXJlIGluIHVi
dWYuCj4+ID4+Pgo+PiA+Pj4gVGhpcyBwYXRjaHNldCBpcyByZWJhc2VkIHRvIHY2LjMtcmMxIGFu
ZCBpdCBpcyB0ZXN0ZWQgYnkgcnVubmluZyBzZXZlcmFsCj4+ID4+PiB2ZWN0b3IgcHJvZ3JhbXMg
c2ltdWx0YW5lb3VzbHkuIEl0IGRlbGl2ZXJzIHNpZ25hbHMgY29ycmVjdGx5IGluIGEgdGVzdAo+
PiA+Pj4gd2hlcmUgd2UgY2FuIHNlZSBhIHZhbGlkIHVjb250ZXh0X3QgaW4gYSBzaWduYWwgaGFu
ZGxlciwgYW5kIGEgY29ycmVjdCBWCj4+ID4+PiBjb250ZXh0IHJldHVyaW5nIGJhY2sgZnJvbSBp
dC4gQW5kIHRoZSBwdHJhY2UgaW50ZXJmYWNlIGlzIHRlc3RlZCBieQo+PiA+Pj4gUFRSQUNFX3tH
RVQsU0VUfVJFR1NFVC4gTGFzdGx5LCBLVk0gaXMgdGVzdGVkIGJ5IHJ1bm5pbmcgYWJvdmUgdGVz
dHMgaW4KPj4gPj4+IGEgZ3Vlc3QgdXNpbmcgdGhlIHNhbWUga2VybmVsIGltYWdlLiBBbGwgdGVz
dHMgYXJlIGRvbmUgb24gYW4gcnY2NGdjdgo+PiA+Pj4gdmlydCBRRU1VLgo+PiA+Pj4KPj4gPj4+
IE5vdGU6IHBsZWFzZSBhcHBseSB0aGUgcGF0Y2ggYXQgWzRdIGR1ZSB0byBhIHJlZ3Jlc3Npb24g
aW50cm9kdWNlZCBieQo+PiA+Pj4gY29tbWl0IDU5NmZmNGEwOWI4OSAoImNwdW1hc2s6IHJlLWlu
dHJvZHVjZSBjb25zdGFudC1zaXplZCBjcHVtYXNrCj4+ID4+PiBvcHRpbWl6YXRpb25zIikgYmVm
b3JlIHRlc3RpbmcgdGhlIHNlcmllcy4KPj4gPj4+Cj4+ID4+PiBTb3VyY2UgdHJlZToKPj4gPj4+
IGh0dHBzOi8vZ2l0aHViLmNvbS9zaWZpdmUvcmlzY3YtbGludXgvdHJlZS9yaXNjdi9mb3ItbmV4
dC92ZWN0b3ItdjE4Cj4+ID4+Cj4+ID4+IEFmdGVyIHNvbWUgb2ZmbGlzdCBkaXNjdXNzaW9ucywg
d2UgbWlnaHQgaGF2ZSBhIGlkZW50aWZpZWQgYQo+PiA+PiBwb3RlbnRpYWwgbGliYy0+YXBwbGlj
YXRpb24gQUJJIGJyZWFrLgo+PiA+Pgo+PiA+PiBHaXZlbiBhbiBhcHBsaWNhdGlvbiB0aGF0IGRv
ZXMgY3VzdG9tIHRhc2sgc2NoZWR1bGluZyB2aWEgYSBzaWduYWwKPj4gPj4gaGFuZGxlci4gVGhl
IGFwcGxpY2F0aW9uIGJpbmFyeSBpcyBub3QgdmVjdG9yIGF3YXJlLCBidXQgbGliYyBpcy4gTGli
Ywo+PiA+PiBpcyB1c2luZyB2ZWN0b3IgcmVnaXN0ZXJzIGZvciBtZW1jcHkuIEl0J3MgYW4gIm9s
ZCBhcHBsaWNhdGlvbiwgbmV3Cj4+ID4+IGxpYnJhcnksIG5ldyBrZXJuZWwiLXNjZW5hcmlvLgo+
PiA+Pgo+PiA+PiAgfCAuLi4KPj4gPj4gIHwgc3RydWN0IGNvbnRleHQgKnAxX2N0eDsKPj4gPj4g
IHwgc3RydWN0IGNvbnRleHQgKnAyX2N0eDsKPj4gPj4gIHwKPj4gPj4gIHwgdm9pZCBzaWdoYW5k
bGVyKGludCBzaWcsIHNpZ2luZm9fdCAqaW5mbywgdm9pZCAqdWNvbnRleHQpCj4+ID4+ICB8IHsK
Pj4gPj4gIHwgICBpZiAocDFfcnVubmluZykKPj4gPj4gIHwgICAgIHN3aXRjaF90byhwMV9jdHgs
IHAyX2N0eCk7Cj4+ID4+ICB8ICAgaWYgKHAyX3J1bm5pbmcpCj4+ID4+ICB8ICAgICBzd2l0Y2hf
dG8ocDJfY3R4LCBwMV9jdHgpOwo+PiA+PiAgfCB9Cj4+ID4+ICB8Cj4+ID4+ICB8IHZvaWQgcDEo
dm9pZCkKPj4gPj4gIHwgewo+PiA+PiAgfCAgIG1lbWNweShmb28sIGJhciwgMTcpOwo+PiA+PiAg
fCB9Cj4+ID4+ICB8Cj4+ID4+ICB8IHZvaWQgcDIodm9pZCkKPj4gPj4gIHwgewo+PiA+PiAgfCAg
IC4uLgo+PiA+PiAgfCB9Cj4+ID4+ICB8IC4uLgo+PiA+Pgo+PiA+PiBUaGUgc3dpdGNoX3RvKCkg
ZnVuY3Rpb24gc2NoZWR1bGVzIHAxKCkgYW5kIHAyKCkuIEUuZy4sIHRoZQo+PiA+PiBhcHBsaWNh
dGlvbiAoYXNzdW1lcyB0aGF0IGl0KSBzYXZlcyB0aGUgY29tcGxldGUgdGFzayBzdGF0ZSBmcm9t
Cj4+ID4+IHNpZ2NvbnRleHQgKHVjb250ZXh0KSB0byBwMV9jdHgsIGFuZCByZXN0b3JlcyBzaWdj
b250ZXh0IHRvIHAyX2N0eCwgc28KPj4gPj4gd2hlbiBzaWdyZXR1cm4gaXMgY2FsbGVkLCBwMigp
IGlzIHJ1bm5pbmcsIGFuZCBwMSgpIGhhcyBiZWVuCj4+ID4+IGludGVycnVwdGVkLgo+PiA+Pgo+
PiA+PiBUaGUgIm9sZCBhcHBsaWNhdGlvbiIgd2hpY2ggaXMgbm90IGF3YXJlIG9mIHZlY3Rvciwg
aXMgbm93IHJ1biBvbiBhCj4+ID4+IHZlY3RvciBlbmFibGVkIGtlcm5lbC9nbGliYy4KPj4gPj4K
Pj4gPj4gQXNzdW1lIHRoYXQgdGhlIHNpZ2hhbmRsZXIgaXMgaGl0LCBhbmQgcDEoKSBpcyBpbiB0
aGUgbWlkZGxlIG9mIHRoZQo+PiA+PiB2ZWN0b3IgbWVtY3B5LiBUaGUgc3dpdGNoX3RvKCkgZnVu
Y3Rpb24gd2lsbCBub3Qgc2F2ZSB0aGUgdmVjdG9yCj4+ID4+IHN0YXRlLCBhbmQgbmV4dCB0aW1l
IHAyKCkgaXMgc2NoZWR1bGVkIHRvIHJ1biBpdCB3aWxsIGhhdmUgaW5jb3JyZWN0Cj4+ID4+IG1h
Y2hpbmUgc3RhdGUuCj4+Cj4+IFRoYW5rcyBmb3Igd3JpdGluZyB0aGlzIHVwLCBhbmQgc29ycnkg
SSd2ZSBkcm9wcGVkIHRoZSBiYWxsIGEgZmV3IHRpbWVzIG9uCj4+IGRlc2NyaWJpbmcgaXQuCj4+
Cj4+ID4+IE5vdzoKPj4gPj4KPj4gPj4gSXMgdGhpcyBhbiBhY3R1YWwgb3IgdGhlb3JldGljYWwg
cHJvYmxlbSAoaS5lLiBhcmUgdGhlcmUgYW55Cj4+ID4+IGFwcGxpY2F0aW9ucyBpbiB0aGUgd2ls
ZCk/IEknZCBiZSBzdXJwcmlzZWQgaWYgaXQgd291bGQgbm90IGJlIHRoZQo+PiA+PiBsYXR0ZXIu
Li4KPj4KPj4gSSBhbHNvIGhhdmUgbm8gaWRlYS4gIEl0J3Mga2luZCBvZiBvZGQgdG8gc2F5ICJu
b2JvZHkgY2FyZXMgYWJvdXQgdGhlCj4+IEFCSSBicmVhayIgd2hlbiB3ZSBjYW4gbWFuaWZlc3Qg
aXQgd2l0aCBzb21lIGZhaXJseSBzaW1wbGUgZXhhbXBsZSwgYnV0Cj4+IEknZCBiZXQgdGhhdCBu
b2JvZHkgY2FyZXMuCj4+Cj4+ID4+IFJlZ2FyZGxlc3MsIGEga2VybmVsIGtub2IgZm9yIGRpc2Fi
bGluZyB2ZWN0b3IgKHN5c2N0bC9wcmN0bCkgdG8gYXZvaWQKPj4gPj4gdGhlc2Uga2luZCBvZiBi
cmVha3MgaXMgbmVlZGVkIChyaWdodD8pLiBDb3VsZCB0aGlzIGtub2IgYmUgYQo+PiA+PiBmb2xs
b3ctdXAgcGF0Y2ggdG8gdGhlIGV4aXN0aW5nIHYxOCBzZXJpZXM/Cj4+ID4+Cj4+ID4+IE5vdGUg
dGhhdCBhcm02NCBkb2VzIG5vdCBzdWZmZXIgZnJvbSB0aGlzIHdpdGggU1ZFLCBiZWNhdXNlIHRo
ZSBkZWZhdWx0Cj4+ID4+IHZlY3RvciBsZW5ndGggKHZsPT0wLzEyOGIqMzIpIGZpdHMgaW4gdGhl
ICJsZWdhY3kiIHNpZ2NvbnRleHQuCj4+ID4KPj4gPiBBbmR5LCB0byBjbGFyaWZ5IGZyb20gdGhl
IHBhdGNod29yayBjYWxsOyBJbgo+PiA+IERvY3VtZW50YXRpb24vYXJtNjQvc3ZlLnJzdDoKPj4g
Pgo+PiA+IFRoZXJlJ3MgYSBwZXItcHJvY2VzcyBwcmN0bCAoc2VjdGlvbiA2KSwgYW5kIGEgc3lz
dGVtIHJ1bnRpbWUgY29uZgo+PiA+IChzZWN0aW9uIDkpLgo+Cj4gVGhhbmtzIGZvciBwb2ludGlu
ZyBtZSBvdXQhCj4KPj4KPj4gSSB0aGluayBpZiB3ZSB3YW50IHRvIHBsYXkgaXQgc2FmZSBXUlQg
dGhlIEFCSSBicmVhaywgdGhlbiB3ZSBjYW4KPj4gZXNzZW50aWFsbHkganVzdCBkbyB0aGUgc2Ft
ZSB0aGluZy4gIEl0J2xsIGJlIGEgbXVjaCBiaWdnZXIgY2xpZmYgZm9yIHVzCj4+IGJlY2F1c2Ug
d2UgaGF2ZSBubyBzcGFjZSBmb3IgdGhlIFYgZXh0ZW5zaW9uLCBidXQgdGhhdCB3YXMganVzdCBh
Cj4+IG1pc3Rha2UgYW5kIHRoZXJlJ3Mgbm90aGluZyB3ZSBjYW4gZG8gYWJvdXQgaXQuCj4KPiBJ
IHVuZGVyc3RhbmQgdGhlIGNvbmNlcm4uIEl0IGlzIGdvb2QgdG8gcHJvdmlkZSBhIHdheSB0byBo
YXZlIGV4cGxpY2l0Cj4gY29udHJvbHMgb2YgVmVjdG9yIHJhdGhlciB0aGFuIGRvIG5vdGhpbmcg
aWYgc3VjaCBBQkkgYnJlYWsgaGFwcGVucy4KPiBBcyBmb3IgaW1wbGVtZW50YXRpb24gZGV0YWls
cywgZG8geW91IHRoaW5rIGEgc3lzdGVtLXdpZGUgIHN5c2N0bAo+IGFsb25lIGlzIGVub3VnaD8g
T3IsIGRvIHdlIGFsc28gbmVlZCBhIHByY3RsIGZvciBwZXItcHJvY2VzcyBjb250cm9sPwoKQSBm
ZXcgb2YgdXMgd2VyZSB0YWxraW5nIGluIHRoZSBwYXRjaHdvcmsgbWVldGluZy4gIEl0J3Mga2lu
ZCBvZiBhIGdyZXkgCmFyZWEgaGVyZSwgYnV0IHdlJ3JlIGp1c3QgZ29pbmcgdG8gcGxheSBpdCBz
YWZlIGFuZCB3YWl0IGZvciB0aGUgCnByY3RsIGFuZCBzeXMgaW50ZXJmYWNlcyB0byBzaG93IHVw
IGJlZm9yZSBtZXJnaW5nIHRoaXMuCgpJIGtub3cgaXQncyBhIHBhaW4gdG8gaGF2ZSB0byB3YWl0
IGFub3RoZXIgcmVsZWFzZSwgYnV0IHRoZXJlJ3Mgc3RpbGwgbm8gCnB1YmxpY2x5IGF2YWlsaWFi
bGUgViBoYXJkd2FyZSB5ZXQgc28gd2FpdGluZyBpc24ndCBjb25jcmV0ZWx5IGltcGFjdGluZyAK
dXNlcnMgcmlnaHQgbm93LiAgSWYgd2UgZmxpcCBvbiBWIG5vdyB3ZSBwcm9iYWJseSB3b24ndCBn
ZXQgYSB0b24gb2YgCnRlc3RpbmcsIHNvIHdlIHJpc2sgdGhlIEFCSSBicmVhayBzdGlja2luZyBh
cm91bmQgZm9yIGEgZmV3IHJlbGVhc2UgCndoaWNoIHdvdWxkIGJlIGEgaHVnZSBoZWFkYWNoZS4K
CkFuZHkgc2FpZCBoZSdkIGJlIGFibGUgdG8gZG8gdGhlIHBydGNsIGFuZCBzeXMgaW50ZXJmYWNl
cyBwcmV0dHkgCnF1aWNrbHksIHNvIGhvcGZ1bGx5IGV2ZXJ5dGhpbmcncyBsaW5lZCB1cCBmb3Ig
dGhlIG5leHQgcmVsZWFzZS4KCj4+ID4gQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
