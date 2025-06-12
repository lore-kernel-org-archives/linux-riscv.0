Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E4DC71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 20:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=uL8zs1Vz+dXaqDG7mxK0zEOYelyolvFD3aUwOFyCcjE=; b=IKgjUim+pkCgXLk3B0yZayYJTt
	QffxCZOPV8gjWPVor/c5YWt6KvjLK4PwpOHaeeRMd+Dj9lkdqWUN9Z2TH5uVa/5kbUq19D1FmSKHJ
	1r0csxf82xvwmhqdrJ7lUFIB3sJUoaaPWUPuboiyYj+1J4E8rOSkaEv/KlJFlRnS99pk/7J7bpRBf
	+nxtMmiy32nNXD86of7aDr7wWWcv8LENT3dA7k/glQHzqRDXaLl1zJL2bGTg4f4kQx/GtlZExqxFJ
	0+0pSkwbL7aNGBSyLnNl11BVj0cGHxvDBHZ1HZyk741SaleDpMQUjsikjDLkSnYTY6QZrS1NyldEO
	d0mSDKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoBZ-0000000ERrz-3xB3;
	Thu, 12 Jun 2025 20:06:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoBX-0000000ERrN-3Yji
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Jun 2025 20:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
	Content-ID:Content-Description:References;
	bh=af51BBEYY6aGbebFxLHnn8CgVDycQQJsTeT80Jnf6RE=; b=Bt+rg39oOOifNoIL/wlQstieca
	H8qdPIMFldgXfwM42+U+odS0r5GtHQC/CZdxN2ySumg/ZCrkM512OKi1+i+BMQoW1GbSrAuPCJ4mL
	sbc4O3GsVAzDm7rYk59JaMw4T+owghBsCs023YdWZJikZxROe/p1JA2H9CMbaVpELfTeXYey8EV8k
	wtVHrKSCq3a6qyaBbPJKIbVd/85Z2urhTUshmxfX1BoM5NjoUimvPxg0/FUoM9VgvrhvZX2izmOQM
	rt+AT2y6IVFC96i80DMAtd2ks6Erlo4be6mfJck73mJ7oZ2K/21GzHSV4V4vKFiKtROZt3O1rvxKr
	1ZzXQBKg==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoBT-00000002f8p-1nY1
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 20:06:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso1188448b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749758756; x=1750363556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=af51BBEYY6aGbebFxLHnn8CgVDycQQJsTeT80Jnf6RE=;
        b=WLHjRlTp4g6PaM68qZZekMoST8GlET/AaHcefIELrwsY0vykqBY2nOBZ++u2abKHw9
         nedwf1OjltwPhoDWw3OptZTXont1YebjgCLneRgHSg06ZGbP6Y4WIl/c8Z/eIS0WkEPo
         +qDnXKF0OV1kQ2VX7N0+P1bytHnJ1esBNnBucs/NTjst4M+JzMHokOMSKB1xDRo34BiO
         h6LDuZO2BMQls4UL88uhAyTBs67NuW9Ox7vgvwANZUvFRWdgcHUAsdD7woFMOPiIcsXi
         GBZQJYaisEfC0huApQRAEJh2AgS9KDPaa1uyZWr18eXBQ6winUcxcLZQF19JYBomD3TR
         ofaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749758756; x=1750363556;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af51BBEYY6aGbebFxLHnn8CgVDycQQJsTeT80Jnf6RE=;
        b=GY3gXmnvXtnhLaT2gt66eS7kOcb7wtNusWQGaoV3XgOdpbWnHOfg0njxMtQS0e4Ut9
         ZVX+UY017KhlaZ2G+krYLb4HwfKZq671EczFOwDyLX9PNxspRJXDGcJpYOG2bD9Tnfe2
         GKr0y1PBST63I9ZH/Qsq2dBSemt/FkrQH1kVNj0s6mgKcOWoJYUsP9f6nnEtrgWnRizT
         IvlQABU/YmZzwG2WVkCUGRUUa4Kh2fgY0MAy+X1DPj8wLXOxu8TE/vxj5wni+wYyeGho
         RtM3wQZPu6l7WZQN9zM8hWndrbqDya3nCD+b2gGcqQpAOx7AnLqeanxNBk4PSvRZgTlv
         9kUw==
X-Forwarded-Encrypted: i=1; AJvYcCWDom+z46Wkn3yruyRB+AUCRa7BDbhtyO7sEM4ilW8okPG3kJwiz3rKhUV9K7IHS48Jq2/U6QhfbE2g1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVwcE+wBD3CCcaW8Y+pvvXlG+FZe2Gk/po6VuxYYE3Onn+ZJer
	Uem7BGmh13SPetz58G4bhJQ7UIobCzL8anR2ShytiASH3+X37/0Uxmp2c1ds+Z5BK2w=
X-Gm-Gg: ASbGnctT9ci2I0ZK2fjeqTarp1lTLrToyZiSjd2zFYKkhGPgr/wF2LyKoNjTpwPniCZ
	rlgYFT1DcA5lrYIOqVF46qxlAkInR2A6oimXCyGNSSzPe3xa6snZxiQ5BYanxaGEyQan3N7g2Fg
	xZh4czFcA76wgTwrBiUFz4Tmdwyf1fT+rlY7ZuHXFMIafvVI6GxzQIGyJf2SVpU/8e1Tnuevuq4
	BcZsUZ9+Yjn5B0cDFQR3Sz3y1PwY+IcG+gxCU95y0gcRtNrbh31IddIAWSoXPSgfvnZ2tqAbhAy
	GJKPXmFkaqWofqv+usCqVWHQTYXMUb0vPhqz8c9IynNAEYHhrf5Z+1IuClRbpZWr+uz/w1s=
X-Google-Smtp-Source: AGHT+IH2RoHWF8PmxJBIXY2wg5rdTqPBQh+vVExjeVE43egm/MogvtvtIhJaxeSLVjk+Z689LqbYIQ==
X-Received: by 2002:a05:6300:8a05:b0:21f:5adb:52c4 with SMTP id adf61e73a8af0-21fad02d0c2mr253713637.30.1749758755672;
        Thu, 12 Jun 2025 13:05:55 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748900063f6sm140856b3a.64.2025.06.12.13.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:05:55 -0700 (PDT)
Date: Thu, 12 Jun 2025 13:05:55 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Jun 2025 13:05:52 PDT (-0700)
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
In-Reply-To: <7ddda233-99f7-468b-842d-8469f0a86e77@ghiti.fr>
CC: thomas.weissschuh@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
  justinstitt@google.com, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-4BA05CCD-6D5A-4067-B88A-DEBD4FCDED77@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_210600_222708_9163BC02 
X-CRM114-Status: GOOD (  21.80  )
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

T24gVGh1LCAxMiBKdW4gMjAyNSAwMTozMToyMCBQRFQgKC0wNzAwKSwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IEhpIFRob21hcywKPgo+IE9uIDYvMTEvMjUgMTE6MjIsIFRob21hcyBXZWnDn3Nj
aHVoIHdyb3RlOgo+PiBBbGwgdkRTTyBjb2RlIG5lZWRzIHRvIGJlIGNvbXBsZXRlbHkgcG9zaXRp
b24gaW5kZXBlbmRlbnQuCj4+IFN5bWJvbCByZWZlcmVuY2VzIGFyZSBtYXJrZWQgYXMgaGlkZGVu
IHNvIHRoZSBjb21waWxlciBlbWl0cwo+PiBQQy1yZWxhdGl2ZSByZWxvY2F0aW9ucy4gSG93ZXZl
ciB0aGVyZSBhcmUgY2FzZXMgd2hlcmUgdGhlIGNvbXBpbGVyIG1heQo+PiBzdGlsbCBlbWl0IGFi
c29sdXRlIHJlbG9jYXRpb25zLCBhcyB0aGV5IGFyZSB2YWxpZCBpbiByZWd1bGFyIFBJQyBEU08g
Y29kZS4KPj4gVGhlc2Ugd291bGQgYmUgcmVzb2x2ZWQgYnkgdGhlIGxpbmtlciBhbmQgd2lsbCBi
cmVhayBhdCBydW50aW1lLgo+PiBUaGlzIGhhcyBiZWVuIG9ic2VydmVkIG9uIGFybTY0IHVuZGVy
IHNvbWUgY2lyY3Vtc3RhbmNlcywgc2VlCj4+IGNvbW1pdCAwYzMxNGNkYTkzMjUgKCJhcm02NDog
dmRzbzogV29yayBhcm91bmQgaW52YWxpZCBhYnNvbHV0ZSByZWxvY2F0aW9ucyBmcm9tIEdDQyIp
Cj4+Cj4+IEludHJvZHVjZSBhIGJ1aWxkLXRpbWUgY2hlY2sgZm9yIGFic29sdXRlIHJlbG9jYXRp
b25zLgo+PiBUaGUgY2hlY2sgaXMgZG9uZSBvbiB0aGUgb2JqZWN0IGZpbGVzIGFzIHRoZSByZWxv
Y2F0aW9ucyB3aWxsIG5vdCBleGlzdAo+PiBhbnltb3JlIGluIHRoZSBmaW5hbCBEU08uIEFzIHRo
ZXJlIGlzIG5vIGV4dGVuc2lvbiBwb2ludCBmb3IgdGhlCj4+IGNvbXBpbGF0aW9uIG9mIGVhY2gg
b2JqZWN0IGZpbGUsIHBlcmZvcm0gdGhlIHZhbGlkYXRpb24gaW4gdmRzb19jaGVjay4KPj4KPj4g
RGVidWcgaW5mb3JtYXRpb24gY2FuIGNvbnRhaW4gbGVnYWwgYWJzb2x1dGUgcmVsb2NhdGlvbnMg
YW5kIHJlYWRlbGYgY2FuCj4+IG5vdCBwcmludCByZWxvY2F0aW9ucyBmcm9tIHRoZSAudGV4dCBz
ZWN0aW9uIG9ubHkuIE1ha2UgdXNlIG9mIHRoZSBmYWN0Cj4+IHRoYXQgYWxsIGdsb2JhbCB2RFNP
IHN5bWJvbHMgZm9sbG93IHRoZSBuYW1pbmcgcGF0dGVybiAidmRzb191XyIuCj4+Cj4+IExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvYUFwR1BBb2N0cV9lb0UyZ0B0MTR1bHRyYS8K
Pj4gTGluazogaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTIw
MDAyCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1
aEBsaW51dHJvbml4LmRlPgo+PiAtLS0KPj4gICBsaWIvdmRzby9NYWtlZmlsZS5pbmNsdWRlIHwg
NiArKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYg
LS1naXQgYS9saWIvdmRzby9NYWtlZmlsZS5pbmNsdWRlIGIvbGliL3Zkc28vTWFrZWZpbGUuaW5j
bHVkZQo+PiBpbmRleCBjZWRiZjE1ZjgwODc0ZDRiYjI3YzA5NzI0NGJjNWIxMTI3MmYyNjFjLi4w
NDI1N2QwZjI4YzBlZDMyNGUzMWFkYmI2ODQ5NzE4MTA4NTc1MmY4IDEwMDY0NAo+PiAtLS0gYS9s
aWIvdmRzby9NYWtlZmlsZS5pbmNsdWRlCj4+ICsrKyBiL2xpYi92ZHNvL01ha2VmaWxlLmluY2x1
ZGUKPj4gQEAgLTEyLDcgKzEyLDEzIEBAIGMtZ2V0cmFuZG9tLSQoQ09ORklHX1ZEU09fR0VUUkFO
RE9NKSA6PSAkKGFkZHByZWZpeCAkKEdFTkVSSUNfVkRTT19ESVIpLCBnZXRyYW5kCj4+ICAgIwo+
PiAgICMgQXMgYSB3b3JrYXJvdW5kIGZvciBzb21lIEdOVSBsZCBwb3J0cyB3aGljaCBwcm9kdWNl
IHVubmVlZGVkIFJfKl9OT05FCj4+ICAgIyBkeW5hbWljIHJlbG9jYXRpb25zLCBpZ25vcmUgUl8q
X05PTkUuCj4+ICsjCj4+ICsjIEFsc28gdmFsaWRhdGUgdGhhdCBubyBhYnNvbHV0ZSByZWxvY2F0
aW9ucyBhZ2FpbnN0IGdsb2JhbCBzeW1ib2xzIGFyZSBwcmVzZW50Cj4+ICsjIGluIHRoZSBvYmpl
Y3QgZmlsZXMuCj4+ICAgcXVpZXRfY21kX3Zkc29fY2hlY2sgPSBWRFNPQ0hLICRACj4+ICAgICAg
ICAgY21kX3Zkc29fY2hlY2sgPSBpZiAkKFJFQURFTEYpIC1yVyAkQCB8IGdyZXAgLXYgX05PTkUg
fCBncmVwIC1xICIgUl9cdypfIjsgXAo+PiAgIAkJICAgICAgIHRoZW4gKGVjaG8gPiYyICIkQDog
ZHluYW1pYyByZWxvY2F0aW9ucyBhcmUgbm90IHN1cHBvcnRlZCI7IFwKPj4gKwkJCSAgICAgcm0g
LWYgJEA7IC9iaW4vZmFsc2UpOyBmaSAmJiBcCj4+ICsJCSAgICAgICBpZiAkKFJFQURFTEYpIC1y
VyAkKGZpbHRlciAlLm8sICQocmVhbC1wcmVyZXFzKSkgfCBncmVwIC1xICIgUl9cdypfQUJTLip2
ZHNvX3VfIjsgXAo+Cj4KPiBUaGlzIG9ubHkgd29ya3MgZm9yIGFybTY0IHJlbG9jYXRpb25zIHJp
Z2h0PyBJIGNhbid0IGZpbmQgYW55ICpBQlMqCj4gcmVsb2NhdGlvbnMgaW4gcmlzY3YgZWxmIGFi
aQo+IChodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1lbGYtcHNhYmktZG9j
L3JlbGVhc2VzL3RhZy92MS4wKS4KClRoYXQncyBiZWNhdXNlIHRoZSBwc0FCSSBwZW9wbGUgZG8g
bm90IGJlbGlldmUgaW4gYWJzb2x1dGUgc3ltYm9scy4gIApUaGV5IGV4aXN0IGluIHRoZSBhY3R1
YWwgdG9vbGNoYWlucywgdGhvdWdoLCBhcyB0aGV5IGFyZSBwYXJ0IG9mIHRoZSAKZ2VuZXJpYyBF
TEYgQUJJLiAgSW4gdGhlb3J5IHRoZXknZCB3b3JrIGZpbmUgaW4gdGhlIFZEU08gYXMgbG9uZyBh
cyAKd2UncmUgdXNpbmcgYWJzb2x1dGUgYWRkcmVzc2luZyBpbnN0cnVjdGlvbnMgZm9yIHRoZW0s
IHdoaWNoIGlzIApwb3NzaWJsZSB0byBkbyAoYW5kIEkgdGhpbmsgc2hvdWxkIGhhcHBlbiBmb3Ig
c29tZSBnbG9iYWwgc3ltYm9scykuCgpUaGF0IHNhaWQsIGl0IGRvZXNuJ3QgcmVhbGx5IHNlZW0g
d29ydGggdGhlIGVmZm9ydCB0byBnZXQgdGhlIGNoZWNraW5nIAptb3JlIGZpbmUtZ3JhaW5lZCBo
ZXJlLiAgSSBkb24ndCBzZWUgYW55IHJlYXNvbiB3ZSdkIG5lZWQgYW4gYWJzb2x1dGUgCnN5bWJv
bCBpbiB0aGUgVkRTTywgc28gdW5pbCBzb21lb25lIGhhcyBvbmUgd2UgbWlnaHQgYXMgd2VsbCBq
dXN0IGZvcmJpZCAKdGhlbSBlbnRpcmVseS4KClNvbWUgb2xkIHRvb2xjaGFpbnMgaGFkIGFuIGFi
c29sdXRlICJfX2dsb2FibF9wb2ludGVyJCIgZmxvYXRpbmcgYXJvdW5kIApzb21lIG9mIHRoZSBD
UlQgZmlsZXMsIHNvIHdlIG1pZ2h0IHRyaXAgb3ZlciBidWdzIGhlcmUuICBJIHRoaW5rIHdlJ3Jl
IApzYWZlIGFzIHRob3NlIHNob3VsZG4ndCBzaG93IHVwIGluIHRoZSBWRFNPLCBidXQgbm90IDEw
MCUgc3VyZS4gIApQcm9iYWJseSBiZXN0IHRvIGdldCB0aGlzIG9uIG5leHQgdG8gYmFrZSBmb3Ig
YSBiaXQsIGp1c3QgdG8gbWFrZSBzdXJlIAp3ZSdyZSBub3QgdHJpcHBpZyBhbnlvbmUgdXAuCgo+
IFRoYW5rcywKPgo+IEFsZXgKPgo+Cj4+ICsJCSAgICAgICB0aGVuIChlY2hvID4mMiAiJEA6IGFi
c29sdXRlIHJlbG9jYXRpb25zIGFyZSBub3Qgc3VwcG9ydGVkIjsgXAo+PiAgIAkJCSAgICAgcm0g
LWYgJEA7IC9iaW4vZmFsc2UpOyBmaQo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
