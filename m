Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF7FD6406B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 17:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGcRlAbmmh7ht1r6wdb12OMOyuidnyze7Wvuk290Y9o=; b=XGl4fX7IHLqFFU
	Lvp7ubK+qkg3ELbMZhBWEvT1as2fCIbekT8X3IUf0lk0n/dp6KZBcHdpkDXsmSF22XYFz4JOGvuwI
	DtMU8epoQm1tLPHDArfpKD/cTCCBx18XlBnm+IjjwkJtA7ENmOL3RrGzEpaW2vJpai0ZQd6CoKw6W
	v7Q/U37LXmfrX6XkZ8cRsok2P1w3z5vCxOwGiVgxi7OgGfMkI0j3SQrcdhKtFND4Mnv/3ZRD7sgqy
	zhM8DoqE/d4K/irnQPbCjFBq+D3/rk5J7orzvNCKLnHx0d0uK1LrgUY+YWL9ifDfP6jj7qOSDJtgR
	Rc1ktcpotbTBG9cJLwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Sbe-0000000BMfq-099Q;
	Fri, 08 Nov 2024 17:17:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SZx-0000000BMYS-3iHo
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 17:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731086123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vCUjb2WEZwOmRQQdW6wTHl2QoTT0U5MTAqvrkfkoI7w=;
	b=MZ5oj7P8MMtB7T9K+LDlwn7B6ykZk22K3jbAa/B/vP63KlUEkjGLti4kiOwpk185SHIBSX
	0G1uOFpEsYRnzgCcpHlaUqkWsWt9cMRDoj2dQn2p9DwexpmhN8ltNw/gO9XnsTujGf7AZt
	vfWxLrzf4BJd3Uyq5scXPggR5hFFma0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-2VwhWqc4NC-6q1GOl4N_Zw-1; Fri, 08 Nov 2024 12:15:22 -0500
X-MC-Unique: 2VwhWqc4NC-6q1GOl4N_Zw-1
X-Mimecast-MFC-AGG-ID: 2VwhWqc4NC-6q1GOl4N_Zw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4316ac69e6dso16664045e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 09:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731086121; x=1731690921;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCUjb2WEZwOmRQQdW6wTHl2QoTT0U5MTAqvrkfkoI7w=;
        b=i7YnO1blkNe0IMhPLdNEeRTVj4m2VXEJrhFS0/BQ0rOP3pGS5bbfAEHNQtYSDc6jyP
         6XI/ZVB2Pf9eEbPp5N8iaeExINFTHqlWiThc/g61tlEKniZRUYZQo9K2CznrkYX85f1t
         l6dUBQrDzNdjycU3ykeY39bs4Xq+sAslxqHTHUrQx//VNf60ufj6usEW0Cdy1gPvjvIV
         +w62z12it3+UDtV07inhj67LMOJS2B8Cbi8DgeVra3UasqyBGF/dFuHD0GiYTo0t6kvA
         1cn1QYg5WlH4GmHG8z9sMCuYXkZKjX4eU5zl9Wb9oFlWYMluaW+mgcNauhJTAzC8RrDL
         CPaA==
X-Forwarded-Encrypted: i=1; AJvYcCWF2HLlLoqwG5a29SUmLcKRyfjdramFWIbVNLciYvuMvAiuzcRmRXrvEOWeoENusRgqYZQY61zi4XqVww==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPMcl+/sdoMXKMIdo3IrW28FO6i2Wzoe9UqWk9mtLVv6BCCb58
	IX+VW0d/A2xdoSXtrFwgtfEkDjXaQXdBpFNkUzcV3ZjU4kdTuz56ZME/RR9m76bOL6smEyR26op
	O6lZeiBGeDkigE0yQcv92z5lxD2N5/RqU87t92qZhT/+Nswm1IgEhDkYAlHIfDnm3lw==
X-Received: by 2002:a05:600c:3b10:b0:430:5356:ac92 with SMTP id 5b1f17b1804b1-432b74fa9demr31004675e9.7.1731086121571;
        Fri, 08 Nov 2024 09:15:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCnrTYX2K2byT1T8BSP08QpvzCFgiW0vGHGjPTgymUI5Q/EeukAs/msDasqguquyNvm3rY0w==
X-Received: by 2002:a05:600c:3b10:b0:430:5356:ac92 with SMTP id 5b1f17b1804b1-432b74fa9demr31004265e9.7.1731086121172;
        Fri, 08 Nov 2024 09:15:21 -0800 (PST)
Received: from [192.168.10.47] ([151.49.84.243])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed9ea653sm5426530f8f.65.2024.11.08.09.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 09:15:20 -0800 (PST)
Message-ID: <626d3780-73bd-496b-9503-e09bfb293bb0@redhat.com>
Date: Fri, 8 Nov 2024 18:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] KVM/riscv changes for 6.13
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy1iTNc5QG34ceebMzA137-pNGzTva33VQ83j-yMoaw8Fg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <CAAhSdy1iTNc5QG34ceebMzA137-pNGzTva33VQ83j-yMoaw8Fg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fesY7fFFE1LcR1BXWSiOlUWZnbHOW-A3E_SLuHimC-M_1731086122
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_091526_023590_418A12F9 
X-CRM114-Status: GOOD (  16.03  )
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

T24gMTEvOC8yNCAxMjozNywgQW51cCBQYXRlbCB3cm90ZToKPiBIaSBQYW9sbywKPiAKPiBXZSBo
YXZlIHRoZSBmb2xsb3dpbmcgS1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2LjEzOgo+IDEpIEFjY2Vs
ZXJhdGUgS1ZNIFJJU0MtViB3aGVuIHJ1bm5pbmcgYXMgYSBndWVzdAo+IDIpIFBlcmYgc3VwcG9y
dCB0byBjb2xsZWN0IEtWTSBndWVzdCBzdGF0aXN0aWNzIGZyb20gaG9zdCBzaWRlCj4gCj4gSW4g
YWRkaXRpb24sIHRoZSBwb2ludGVyIG1hc2tpbmcgc3VwcG9ydCAoU3NucG0gYW5kCj4gU21ucG0p
IGZvciBLVk0gZ3Vlc3QgaXMgZ29pbmcgdGhyb3VnaCB0aGUgUklTQy1WIHRyZWUuCj4gCj4gSSBh
bHNvIGhhdmUgU3ZhZGUgYW5kIFN2YWR1IHN1cHBvcnQgZm9yIGhvc3QgYW5kIGd1ZXN0Cj4gaW4g
bXkgcXVldWUgd2hpY2ggSSB3aWxsIHNlbmQgaW4gdGhlIHNlY29uZCB3ZWVrIG9mIHRoZQo+IG1l
cmdlIHdpbmRvdyB0byBhdm9pZCBjb25mbGljdCB3aXRoIHRoZSBSSVNDLVYgdHJlZS4KPiAKPiBQ
bGVhc2UgcHVsbC4KClB1bGxlZCwgdGhhbmtzLgoKUGFvbG8KCj4gUmVnYXJkcywKPiBBbnVwCj4g
Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4MTk4Mzc1ODQzMDk1N2Q5YTVj
YjMzMzNmZTMyNGZkNzBjZjYzZTdlOgo+IAo+ICAgIExpbnV4IDYuMTItcmM1ICgyMDI0LTEwLTI3
IDEyOjUyOjAyIC0xMDAwKQo+IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5
IGF0Ogo+IAo+ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9rdm0tcmlzY3YvbGludXguZ2l0IHRhZ3Mv
a3ZtLXJpc2N2LTYuMTMtMQo+IAo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAzMzJm
YTRhODAyYjE2Y2NiNzI3MTk5ZGE2ODUyOTRmODVmOTg4MGNiOgo+IAo+ICAgIHJpc2N2OiBrdm06
IEZpeCBvdXQtb2YtYm91bmRzIGFycmF5IGFjY2VzcyAoMjAyNC0xMS0wNSAxMzoyNzozMiArMDUz
MCkKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gS1ZNL3Jpc2N2IGNoYW5nZXMgZm9yIDYuMTMKPiAKPiAtIEFjY2Vs
ZXJhdGUgS1ZNIFJJU0MtViB3aGVuIHJ1bm5pbmcgYXMgYSBndWVzdAo+IC0gUGVyZiBzdXBwb3J0
IHRvIGNvbGxlY3QgS1ZNIGd1ZXN0IHN0YXRpc3RpY3MgZnJvbSBob3N0IHNpZGUKPiAKPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gQW51cCBQYXRlbCAoMTMpOgo+ICAgICAgICBSSVNDLVY6IEtWTTogT3JkZXIgdGhlIG9i
amVjdCBmaWxlcyBhbHBoYWJldGljYWxseQo+ICAgICAgICBSSVNDLVY6IEtWTTogU2F2ZS9yZXN0
b3JlIEhTVEFUVVMgaW4gQyBzb3VyY2UKPiAgICAgICAgUklTQy1WOiBLVk06IFNhdmUvcmVzdG9y
ZSBTQ09VTlRFUkVOIGluIEMgc291cmNlCj4gICAgICAgIFJJU0MtVjogS1ZNOiBCcmVhayBkb3du
IHRoZSBfX2t2bV9yaXNjdl9zd2l0Y2hfdG8oKSBpbnRvIG1hY3Jvcwo+ICAgICAgICBSSVNDLVY6
IEtWTTogUmVwbGFjZSBhaWFfc2V0X2h2aWN0bCgpIHdpdGggYWlhX2h2aWN0bF92YWx1ZSgpCj4g
ICAgICAgIFJJU0MtVjogS1ZNOiBEb24ndCBzZXR1cCBTR0VJIGZvciB6ZXJvIGd1ZXN0IGV4dGVy
bmFsIGludGVycnVwdHMKPiAgICAgICAgUklTQy1WOiBBZGQgZGVmaW5lcyBmb3IgdGhlIFNCSSBu
ZXN0ZWQgYWNjZWxlcmF0aW9uIGV4dGVuc2lvbgo+ICAgICAgICBSSVNDLVY6IEtWTTogQWRkIGNv
bW1vbiBuZXN0ZWQgYWNjZWxlcmF0aW9uIHN1cHBvcnQKPiAgICAgICAgUklTQy1WOiBLVk06IFVz
ZSBuYWNsX2Nzcl94eXooKSBmb3IgYWNjZXNzaW5nIEgtZXh0ZW5zaW9uIENTUnMKPiAgICAgICAg
UklTQy1WOiBLVk06IFVzZSBuYWNsX2Nzcl94eXooKSBmb3IgYWNjZXNzaW5nIEFJQSBDU1JzCj4g
ICAgICAgIFJJU0MtVjogS1ZNOiBVc2UgU0JJIHN5bmMgU1JFVCBjYWxsIHdoZW4gYXZhaWxhYmxl
Cj4gICAgICAgIFJJU0MtVjogS1ZNOiBTYXZlIHRyYXAgQ1NScyBpbiBrdm1fcmlzY3ZfdmNwdV9l
bnRlcl9leGl0KCkKPiAgICAgICAgUklTQy1WOiBLVk06IFVzZSBOQUNMIEhGRU5DRXMgZm9yIEtW
TSByZXF1ZXN0IGJhc2VkIEhGRU5DRXMKPiAKPiBCasO2cm4gVMO2cGVsICgxKToKPiAgICAgICAg
cmlzY3Y6IGt2bTogRml4IG91dC1vZi1ib3VuZHMgYXJyYXkgYWNjZXNzCj4gCj4gUXVhbiBaaG91
ICgyKToKPiAgICAgICAgcmlzY3Y6IHBlcmY6IGFkZCBndWVzdCB2cyBob3N0IGRpc3RpbmN0aW9u
Cj4gICAgICAgIHJpc2N2OiBLVk06IGFkZCBiYXNpYyBzdXBwb3J0IGZvciBob3N0IHZzIGd1ZXN0
IHByb2ZpbGluZwo+IAo+IFlvbmctWHVhbiBXYW5nICgxKToKPiAgICAgICAgUklTQy1WOiBLVk06
IEZpeCBBUExJQyBpbl9jbHJpcCBhbmQgY2xyaXBudW0gd3JpdGUgZW11bGF0aW9uCj4gCj4gICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggICB8ICAxMCArKwo+ICAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fbmFjbC5oICAgfCAyNDUgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BlcmZfZXZlbnQuaCB8ICAg
NiArCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oICAgICAgICB8IDEyMCArKysrKysr
KysrKysrKysrKysKPiAgIGFyY2gvcmlzY3Yva2VybmVsL3BlcmZfY2FsbGNoYWluLmMgIHwgIDM4
ICsrKysrKwo+ICAgYXJjaC9yaXNjdi9rdm0vS2NvbmZpZyAgICAgICAgICAgICAgfCAgIDEgKwo+
ICAgYXJjaC9yaXNjdi9rdm0vTWFrZWZpbGUgICAgICAgICAgICAgfCAgMjcgKystLQo+ICAgYXJj
aC9yaXNjdi9rdm0vYWlhLmMgICAgICAgICAgICAgICAgfCAxMTQgKysrKysrKysrKystLS0tLS0K
PiAgIGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jICAgICAgICAgIHwgICAzICstCj4gICBhcmNo
L3Jpc2N2L2t2bS9tYWluLmMgICAgICAgICAgICAgICB8ICA2MyArKysrKysrKystCj4gICBhcmNo
L3Jpc2N2L2t2bS9tbXUuYyAgICAgICAgICAgICAgICB8ICAgNCArLQo+ICAgYXJjaC9yaXNjdi9r
dm0vbmFjbC5jICAgICAgICAgICAgICAgfCAxNTIgKysrKysrKysrKysrKysrKysrKysrKwo+ICAg
YXJjaC9yaXNjdi9rdm0vdGxiLmMgICAgICAgICAgICAgICAgfCAgNTcgKysrKysrLS0tCj4gICBh
cmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgICB8IDE5MSArKysrKysrKysrKysrKysr
KysrKystLS0tLS0tCj4gICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICB8ICAx
MSArLQo+ICAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUyAgICAgICAgfCAxMzcgKysrKysr
KysrKysrLS0tLS0tLS0KPiAgIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYyAgICAgICAgIHwg
IDI4ICsrLS0tCj4gICAxNyBmaWxlcyBjaGFuZ2VkLCAxMDIyIGluc2VydGlvbnMoKyksIDE4NSBk
ZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV9uYWNsLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2t2bS9uYWNsLmMK
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
