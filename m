Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC604C46CD2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 05:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJFsIFkOG8lSmRrgWaklMAKkFjhwYWIlbDqoJfItxLM=; b=XSDzFzuKOLvLS/
	HnmWcHKr8xLP+zlDez4942NTI68GoXXgezGnI9GQ330cIIYccOxzHDVaqJCZJ7XuZ4HEj6fxgc2Jf
	bqrQmaB3+MTnAClgvAOGC9jRHwHndo4hWu8bCaT86kIAozYWTgfUd9iQY6zJhcksFtplKiJPzUKZi
	Q+FvpKpeNgPYqlXgW+LjL5vJRK8Ym12LWFiazZPo6BYkdSFWt4pf28UJ0CEQTCx2S1KMsCbYt6G3A
	10BrqCQh6LlDqoPasPleKW5WBc/6Ldm+PMltWC1rZNIIZiCUrIZN//6ZDBOI57fQWKjFuDMly2I5a
	uKsQnS4S8EO+P+RhoT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGY53-004yRx-01;
	Fri, 22 Dec 2023 05:28:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGY4z-004yRO-0r
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 05:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703222892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=plbNf5A3ZlhXI2Ez9cBVzJuxB5rEcG2G+xtFHu5+tss=;
	b=eFyFz11Wxm6j84xvk/0PCfneaXfV/MMnw8UF7s8urLhwG8IwqjXzfCnhYZFyXRWIo9L/HD
	CskKEQKbdu8Jc4ahjV5tJsiLkYvmFvXyNxstjIIT6Lz7OEOZFtJu2vF9MdMhmzUJ9dqzSU
	edOh5XcGaegZhjlXXD0iQQwNjLDIrB8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-6kWgiNGsNauf90EzEg71Ug-1; Fri, 22 Dec 2023 00:28:09 -0500
X-MC-Unique: 6kWgiNGsNauf90EzEg71Ug-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6d699ce2b40so1167918b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 21:28:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703222888; x=1703827688;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plbNf5A3ZlhXI2Ez9cBVzJuxB5rEcG2G+xtFHu5+tss=;
        b=Pfc25NO8qXZw4JeeJAXnKG+G/mz0i3LGksiMDxbSF3bbuCJLgMRwlqm7WmZVUX3jMs
         R0eWcFZ2CDtxmbbUFT16IpQLgBalsZVmxAWTUkxn0NOLUrO+HT4JqeJKAH6XZyUP3xUE
         s6sriICp0Pl7z9kIosH6HN4gp3gHSbE+PkEaDVgzLgU/1jA+ZCcHuRii8P2MGm/6K3c8
         eH25uPG2I0I8h1btk1Z7x6JqmL1HRfTCMrTISmGGmtbF88hl7dFVVyRSoMhzONgqRR21
         i9UMEYyfWt0CZ8AxEVmkuJLVAdMrxFjSo2kDtwGyEnAqDW1rYLNVss/HDVHuK/VUbpmK
         x6Bg==
X-Gm-Message-State: AOJu0YyJcFP9zjeC9oItcfoHDy/DHKas0IwtYBPXvrBNmjuq3itTLVVR
	SpJMqVZkMi1bRgU+V07PYLpcGOuobIRZ1EMz+JO/x7U5MwP9GsP4lWGxxmpwHwpUfYSMdE7Kwb/
	P8R+p20bz1rBV/dDg1OPU+iRTqZ0ZC9FVXZ2f
X-Received: by 2002:a05:6a20:978c:b0:195:1e04:11dc with SMTP id hx12-20020a056a20978c00b001951e0411dcmr547865pzc.46.1703222887954;
        Thu, 21 Dec 2023 21:28:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0cwpsBTtkI4cK5DOCiGcyzFp7iDmxf1j7x1Nho4sQzNtuZJWgQbbH2SgdZd8zDpJwHBxAIQ==
X-Received: by 2002:a05:6a20:978c:b0:195:1e04:11dc with SMTP id hx12-20020a056a20978c00b001951e0411dcmr547858pzc.46.1703222887605;
        Thu, 21 Dec 2023 21:28:07 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id bb5-20020a17090b008500b0028b0424a4bcsm129567pjb.54.2023.12.21.21.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 21:28:07 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH V2 2/4] riscv: mm: Fixup compat arch_get_mmap_end
Date: Fri, 22 Dec 2023 02:27:47 -0300
Message-ID: <ZYUeU0URQvgw42jt@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJF2gTRptBZyYbnY-mjn-AuQwVnekQtGY8nAOV7KVWLCY1WBcw@mail.gmail.com>
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-3-guoren@kernel.org> <ZYUD4C1aXWt2oFJo@LeoBras> <CAJF2gTSiaNWkXS6rc+3OSZfnFqG2d7btzjrd-L1mBgAVu3ym3A@mail.gmail.com> <ZYUT22KmGJ1tJSWx@LeoBras> <CAJF2gTRptBZyYbnY-mjn-AuQwVnekQtGY8nAOV7KVWLCY1WBcw@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_212813_371338_C1B81BD3 
X-CRM114-Status: GOOD (  37.36  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTI6NTA6NDRQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCAxMjo0M+KAr1BNIExlb25hcmRvIEJyYXMgPGxlb2Jy
YXNAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTI6
MjY6MTlQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+ID4gT24gRnJpLCBEZWMgMjIsIDIwMjMg
YXQgMTE6MzXigK9BTSBMZW9uYXJkbyBCcmFzIDxsZW9icmFzQHJlZGhhdC5jb20+IHdyb3RlOgo+
ID4gPiA+Cj4gPiA+ID4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6NDY6NTlBTSAtMDUwMCwg
Z3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiA+ID4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5A
bGludXguYWxpYmFiYS5jb20+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gV2hlbiB0aGUgdGFzayBpcyBp
biBDT01QQVQgbW9kZSwgdGhlIGFyY2hfZ2V0X21tYXBfZW5kIHNob3VsZCBiZSAyR0IsCj4gPiA+
ID4gPiBub3QgVEFTS19TSVpFXzY0LiBUaGUgVEFTS19TSVpFIGhhcyBjb250YWluZWQgaXNfY29t
cGF0X21vZGUoKQo+ID4gPiA+ID4gZGV0ZWN0aW9uLCBzbyBjaGFuZ2UgdGhlIGRlZmluaXRpb24g
b2YgU1RBQ0tfVE9QX01BWCB0byBUQVNLX1NJWkUKPiA+ID4gPiA+IGRpcmVjdGx5Lgo+ID4gPiA+
Cj4gPiA+ID4gb2sKPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gPiA+ID4gPiBGaXhlczogYWRkMmNjNmI2NTE1ICgiUklTQy1WOiBtbTogUmVz
dHJpY3QgYWRkcmVzcyBzcGFjZSBmb3Igc3YzOSxzdjQ4LHN2NTciKQo+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+ID4gPiAtLS0KPiA+
ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIHwgNiArKy0tLS0KPiA+
ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3By
b2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+ID4gPiA+ID4g
aW5kZXggZjE5Zjg2MWNkYTU0Li4xZjUzOGZjNDQ0OGQgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gPiA+ID4gPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gPiA+ID4gPiBAQCAtMTYsMTUgKzE2LDEzIEBA
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICNpZmRlZiBDT05GSUdfNjRCSVQKPiA+ID4gPiA+ICAjZGVm
aW5lIERFRkFVTFRfTUFQX1dJTkRPVyAgIChVTCgxKSA8PCAoTU1BUF9WQV9CSVRTIC0gMSkpCj4g
PiA+ID4gPiAtI2RlZmluZSBTVEFDS19UT1BfTUFYICAgICAgICAgICAgICAgIFRBU0tfU0laRV82
NAo+ID4gPiA+ID4gKyNkZWZpbmUgU1RBQ0tfVE9QX01BWCAgICAgICAgICAgICAgICBUQVNLX1NJ
WkUKPiA+ID4gPgo+ID4gPiA+IEl0IG1lYW5zIFNUQUNLX1RPUF9NQVggd2lsbCBiZSBpbiA2NEJJ
VDoKPiA+ID4gPiAtIFRBU0tfU0laRV8zMiBpZiBjb21wYXRfbW9kZT15Cj4gPiA+ID4gLSBUQVNL
X1NJWkVfNjQgaWYgY29tcGF0X21vZGU9bgo+ID4gPiA+Cj4gPiA+ID4gTWFrZXMgc2Vuc2UgZm9y
IG1lLgo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICNkZWZpbmUgYXJjaF9nZXRfbW1hcF9l
bmQoYWRkciwgbGVuLCBmbGFncykgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiAgKHsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiA+ID4gPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgbW1hcF9lbmQ7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gICAgICAgdHlwZW9mKGFkZHIpIF9hZGRyID0gKGFk
ZHIpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiAtICAgICBpZiAoKF9h
ZGRyKSA9PSAwIHx8IChJU19FTkFCTEVEKENPTkZJR19DT01QQVQpICYmIGlzX2NvbXBhdF90YXNr
KCkpKSBcCj4gPiA+ID4gPiAtICAgICAgICAgICAgIG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWDsg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+IC0gICAgIGVsc2UgaWYgKChfYWRkcikg
Pj0gVkFfVVNFUl9TVjU3KSAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gKyAgICAg
aWYgKChfYWRkcikgPT0gMCB8fCAoX2FkZHIpID49IFZBX1VTRVJfU1Y1NykgICAgICAgICAgICBc
Cj4gPiA+ID4gPiAgICAgICAgICAgICAgIG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWDsgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ICAgICAgIGVsc2UgaWYgKCgoKF9hZGRyKSA+PSBW
QV9VU0VSX1NWNDgpKSAmJiAoVkFfQklUUyA+PSBWQV9CSVRTX1NWNDgpKSBcCj4gPiA+ID4gPiAg
ICAgICAgICAgICAgIG1tYXBfZW5kID0gVkFfVVNFUl9TVjQ4OyAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gSSBkb24ndCB0aGluayBJIGdvdCB0aGlzIGNo
YW5nZSwgb3IgaG93IGl0J3MgY29ubmVjdGVkIHRvIHRoZSBjb21taXQgbXNnLgo+ID4gPiBUaGUg
YWJvdmUgaXMganVzdCBjb2RlIHNpbXBsaWZpY2F0aW9uOyBpZiBTVEFDS19UT1BfTUFYIGlzIFRB
U0tfU0laRSwgdGhlbgo+ID4gPgo+ID4gPiAgICAgIGlmICgoX2FkZHIpID09IDAgfHwgKElTX0VO
QUJMRUQoQ09ORklHX0NPTVBBVCkgJiYgaXNfY29tcGF0X3Rhc2soKSkpIFwKPiA+ID4gICAgICAg
ICAgICAgIG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWDsgICAgICAgICAgICAgICAgICAgICAgIFwK
PiA+ID4gICAgIGVsc2UgaWYgKChfYWRkcikgPj0gVkFfVVNFUl9TVjU3KSAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ID4gPgo+ID4gPiBpcyBlcXVhbCB0bzoKPiA+ID4KPiA+ID4gICAgICBpZiAo
KF9hZGRyKSA9PSAwIHx8IChfYWRkcikgPj0gVkFfVVNFUl9TVjU3KSAgICAgICAgICAgIFwKPiA+
Cj4gPiBJIGFtIGZhaWxpbmcgdG8gdW5kZXJzdGFuZCBleGFjdGx5IGhvdyBhcmUgdGhleSBlcXVh
bC4KPiA+IEkgbWVhbiwgd2hhdCBpbiB5b3VyIFNUQUNLX1RPUF9NQVggY2hhbmdlIG1hZGUgdGhl
bSBlcXVhbD8KPiAjZGVmaW5lIFNUQUNLX1RPUF9NQVggVEFTS19TSVpFCj4gI2RlZmluZSBUQVNL
X1NJWkUgICAgICAgKGlzX2NvbXBhdF90YXNrKCkgPyBUQVNLX1NJWkVfMzIgOiBUQVNLX1NJWkVf
NjQpCj4gCgp5ZXMsIEkgYW0gYXdhcmUuIExldCdzIGRvIGEgc2ltcGxlIHRlc3Qgd2l0aCB0aGUg
bmV3IGNvZGUgYW5kCmFkZHIgPSAyXjI3IChyYW5kb20gMzItYml0IGFkZHIpIGFuZCBjb21wYXQg
bW9kZS4KCmlmICgoX2FkZHIpID09IDAgfHwgKF9hZGRyKSA+PSBWQV9VU0VSX1NWNTcpCgkvLyBF
dmFsdWF0ZXMgdG8gZmFsc2U6IDJeMjcgIT0gMCwgYW5kIGlzIDwgMl41NwplbHNlIGlmICgoKChf
YWRkcikgPj0gVkFfVVNFUl9TVjQ4KSkgJiYgKFZBX0JJVFMgPj0gVkFfQklUU19TVjQ4KSkgCgkv
LyBFdmFsdWF0ZXMgdG8gZmFsc2U6IDJeMjcgPCAyXjQ4CmVsc2UJCQkJCgltbWFwX2VuZCA9IFZB
X1VTRVJfU1YzOTsJCgptbWFwX2VuZCA9IFZBX1VTRVJfU1YzOSwgZXZlbiBpbiBjb21wYXRfbW9k
ZS4KCldlIG5lZWQgdGhlIGV4dHJhIGlzX2NvbXBhdF90YXNrKCkgaWYgd2Ugd2FudCB0byByZXR1
cm4gMl4zMi4KClRoYW5rcyEKTGVvCgoKPiA+Cj4gPiBTZWUgYmVsb3csIHRoZSBiZWhhdmlvciBj
aGFuZ2VkOgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gQmVmb3JlOgo+ID4gPiA+IC0gYWRkciA9PSAw
LCBvciBhZGRyID4gMl41Nywgb3IgY29tcGF0OiBtbWFwX2VuZCA9IFNUQUNLX1RPUF9NQVgKPiA+
ID4gPiAtIDJeNDggPCBhZGRyIDwgMl41NzogbW1hcF9lbmQgPSAyXjQ4Cj4gPiA+ID4gLSAwIDwg
YWRkciA8IDJeNDggOiBtbWFwX2VuZCA9IDJeMzkKPiA+ID4gPgo+ID4gPiA+IE5vdzoKPiA+ID4g
PiAtIGFkZHIgPT0gMCwgb3IgYWRkciA+IDJeNTc6IG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWAo+
ID4gPiA+IC0gMl40OCA8IGFkZHIgPCAyXjU3OiBtbWFwX2VuZCA9IDJeNDgKPiA+ID4gPiAtIDAg
PCBhZGRyIDwgMl40OCA6IG1tYXBfZW5kID0gMl4zOQo+ID4gPiA+Cj4gPiA+ID4gSUlVQyBjb21w
YXQgbW9kZSBhZGRyIHdpbGwgYmUgPCAyXjMyLCBzbyB3aWxsIGFsd2F5cyBoYXZlIG1tYXBfZW5k
ID0gMl4zOQo+ID4gPiA+IGlmIGFkZHIgIT0gMC4gSXMgdGhhdCBkZXNpcmVhYmxlPwo+ID4gPiA+
IChpZiBub3QsIGFib3ZlIGNoYW5nZSBpcyB1bm5lZWRlZCkKPiA+ID4gPgo+ID4KPiA+IF4KPiA+
Cj4gPiBXaXRoIHlvdXIgY2hhbmdlIG9uIFNUQUNLX1RPUF9NQVggb25seSAobm90IGNoYW5naW5n
IGFyY2hfZ2V0X21tYXBfZW5kKSwKPiA+IHlvdSB3b3VsZCBoYXZlOgo+ID4KPiA+IC0gY29tcGF0
X21vZGUgJiAoMCA8IGFkZHIgPCAyXjMyKSAgICAgICAtPiBtbWFwX2VuZCA9IDJeMzIKPiBjb21w
YXRfbW9kZSAgICAgIC0+IG1tYXBfZW5kID0gMl4zMgo+IAoKVGhpcyBpcyBjb3JyZWN0ISAKWWVh
aCwgc2luY2UgeW91IGNoYW5nZWQgU1RBQ0tfVE9QX01BWCB0byBiZSAyXjMyIGluIGNvbXBhdCBt
b2RlLAphbnkgYWRkciB2YWx1ZSA8IDJeMzIgd2l0aCBjb21wYXQgdmFsdWUgd2lsbCByZXR1cm4g
Ml4zMi4KKHdpdGhvdXQgdGhlIGNoYW5nZSBpbiBhcmNoX2dldF9tbWFwX2VuZCgpLCB0aGF0IGlz
LikgCgo+ID4gLSBub24tY29tcGF0LCBhZGRyID09IDAsIG9yIGFkZHIgPiAyXjU3IC0+IG1tYXBf
ZW5kID0gVEFTS19TSVpFXzY0Cj4gPiAtIG5vbi1jb21wYXQsICgyXjQ4IDwgYWRkciA8IDJeNTcp
ICAgICAgLT4gbW1hcF9lbmQgPSAyXjQ4Cj4gPiAtIG5vbi1jb21wYXQsICgwIDwgYWRkciA8IDJe
NDgpICAgICAgICAgLT4gbW1hcF9lbmQgPSAyXjM5Cj4gPgo+ID4gV2hpY2ggc2VlbXMgbW9yZSBs
aWtlbHksIGJhc2VkIG9uIENoYXJsaWUgY29tbWVudHMuCj4gPgo+ID4gVGhhbmtzLAo+ID4gTGVv
Cj4gPgo+ID4gPiA+IEFsc28sIHVucmVsYXRlZCB0byB0aGUgY2hhbmdlOgo+ID4gPiA+IC0gMl40
OCA8IGFkZHIgPCAyXjU3OiBtbWFwX2VuZCA9IDJeNDgKPiA+ID4gPiBJcyB0aGUgYWJvdmUgY29y
cmVjdD8KPiA+ID4gPiBJdCBsb29rcyBsaWtlIGl0IHNob3VsZCBiZSAyXjU3IGluc3RlYWQsIGFu
ZCBhIG5ldyBpZiBjbGF1c2UgZm9yCj4gPiA+ID4gMl4zMiA8IGFkZHIgPCAyXjQ4IHNob3VsZCBo
YXZlIG1tYXBfZW5kID0gMl40OC4KPiA+ID4gPgo+ID4gPiA+IERvIEkgZ2V0IGl0IHdyb25nPwo+
ID4gPiBNYXliZSBJIHNob3VsZCBtb3ZlIHRoaXMgaW50byB0aGUgb3B0aW1pemF0aW9uIHBhcnQu
Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiAoSSB3aWxsIHNlbmQgYW4gUkZDICdmaXhpbmcnIHRoZSBj
b2RlIHRoZSB3YXkgSSBhbSB3aGlua2luZyBpdCBzaG91bGQgbG9vawo+ID4gPiA+IGxpa2UpCj4g
PiA+ID4KPiA+ID4gPiBUaGFua3MsCj4gPiA+ID4gTGVvCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+
Cj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDIuNDAuMQo+ID4gPiA+ID4K
PiA+ID4gPgo+ID4gPgo+ID4gPgo+ID4gPiAtLQo+ID4gPiBCZXN0IFJlZ2FyZHMKPiA+ID4gIEd1
byBSZW4KPiA+ID4KPiA+Cj4gCj4gCj4gLS0gCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
