Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3448CCD1A5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 07:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gy0YToULZeKH2XqUsAJeHz2R59zaGA7GLbumHNzZRa8=; b=YdbEjxXczcqB6Y
	aRsDaS5zW4TxG5XvdW5o8A1Py+4GjBU7+oAf/+zxsWKyONAjNnQxwVDStZZtmMyYSb549Oy4jG1Ed
	gHxGO0O388Mg3We8K7LhQt2Jxe41a1JTo4fRXs7bDOyL9rajHo7h6ONCivJImEH/lSOBzj7B7P2fp
	wZQ3AF7dL5Hxj/7qJPGfT41jbbMNk3bqh6EgaH98adTvGPOzu4XAoiuXZskjFAhihoNiylWIKACCb
	vRa3gxIC6rAhESloPPekEc3hLo2O6NOYFF24E7u4siFfkm6Jddj8ZpLiUME6oUpNKjB+nz95c7PEa
	cDLZIvPYg4D+fOQA6XMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCFT-00000008V0X-1yBu;
	Fri, 24 Oct 2025 07:30:07 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCFQ-00000008UzN-40Pj
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 07:30:06 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-940d327df21so84275539f.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 00:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761291003; x=1761895803; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeECwYvKn3QP1ga5HQAMgeWC7ylNejyM0v5Sr0Cm2EQ=;
        b=0LIuW3HhuyNcgbsNKbLrmNdA/Ttw00HEcvCI8IC8UM06pcl3kYnFgHuWamaqBkZgB9
         Oef4LfW6uSsLJSy/3NlJ3F0SgDgm+ekv1Mzc6jQoBhxQ1veMMbwNc3XPX2bNdIUWUo/h
         m8sQ8RpCv0qbOc3flz+2qvNNK5KEPdaBO71qtb1fhdy8IS/BFKQXcaSo1NOpPW4BA1/3
         hK8d/H4oeo98LbZIsJef06Bvg4jdHy+J88dVW18BJM8pQAfaZdlaIuWe8Z6SlxV0JD3N
         GjgJxDwi8/ICYaGJ9G2XnkG3GWdnKdOPyhOm9cA7yzd8qbKv6HLja4r67A/6sQ805mrE
         j3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761291003; x=1761895803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeECwYvKn3QP1ga5HQAMgeWC7ylNejyM0v5Sr0Cm2EQ=;
        b=tj2Nkym5jXrAOJLutGQ5N5AaLCVHLPZ3EMsg2TWyLJKtjeWWsKGnL7P+n6T4IkpB3n
         rtE3JOpNQ0p9+j9bFrTdVuIJOqw8jOGN8CddECQM9EsUxAa0/jbLK7FSz96sD98ynVmu
         r4J+YtZV5a6CMyfvD79srFs+doB1l+uMBuM050eV7wY2nqDxOTvw5RQvvUIehS1kAPfg
         AborpLEl40ZD9ORPu839KzauZPWkGV+r+avKQfuX5KIPRnEIT2s+j7NdZQAYFEI7ZbLw
         YMBDQ2Eitx6Nuz2k1hUYSW/mfrZwpD4I0HsUkQtHWuaYy9ZTuatYkJD0Es0kt+V41e/I
         7eEg==
X-Forwarded-Encrypted: i=1; AJvYcCVmKEJSdJ92twK0j3ikYKjY0ZydTAGwgr5+xy31s0iTXgV0PfAgQyIq04k1ulLEqaFkOr/IVjAdZIS58Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzigY8BqmPyEeOeQ49WQ9r0zjonTDCNhgehtZUL1SaF6ucM3TNa
	JUaFAUi5YK6vFifYwBTijyUFH+/3dyJ9EhIkTIZsAFaBC/w/5khK0RMMr4ohGR3r3IuSYBrW7zS
	H8SEW0HsgDWsfwPHfAZm5wzdq7lHRRzsiyNlTm+x/KQ==
X-Gm-Gg: ASbGncun84d7yyGEMsTuSu7AXkLfD/dkggANkvZJQe88atB+nKvYtylGSOxGLZ7AyhL
	6TYlF1wd5gnUhCHH4zlnlX70VNSFZjgq8jKd5UheTKm2u8JvFTgQR1nCvsr7A3Zs3I/SYQj2iMU
	fA4gSfO+aQtIcRcqm9i7letNFhEy+C7D6sKfBDayvXXecB12eFIUgzeUYnkJVpiD5fb7IjpniEI
	GbbTLgmEo1vPaG0IPoo1/A2IM7O3t0RP0zRtlvWDrC9vCk4y11p+J8lVyQq90Fpua/9VnxSnOq2
	7j1P6ClGl39DRe5KZQ==
X-Google-Smtp-Source: AGHT+IGIrifKfiiRQa/2XZA9cCQCxDOOhKMJD+Ko/sNM4+GGNt9y1f4J0I/KaEUwS5Wnzok7qVC/rqsQNjRaChFrIM0=
X-Received: by 2002:a05:6e02:1947:b0:42d:8bc6:d163 with SMTP id
 e9e14a558f8ab-430c522f3a6mr361200565ab.9.1761291003374; Fri, 24 Oct 2025
 00:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Oct 2025 12:59:51 +0530
X-Gm-Features: AWmQ_blnTdA3IFCP2Lj2bbMBWo7LdsRpDZqjAY90yJsReH08LO8cALRDcjSPJO0
Message-ID: <CAAhSdy1fCCdciZLqmoeWDG_QoOHDi9j0_ZZKYkpGJmWrf14Q-g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
To: fangyu.yu@linux.alibaba.com
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, 
	jiangyifei@huawei.com, guoren@kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_003005_064370_B7BB15C3 
X-CRM114-Status: GOOD (  15.38  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgNjozOOKAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBBcyBvZiBjb21taXQgYWFjNmRiNzVhOWZjICgidmZpby9wY2k6IFVzZSB1bm1h
cF9tYXBwaW5nX3JhbmdlKCkiKSwKPiB2bV9wZ29mZiBtYXkgbm8gbG9uZ2VyIGd1YXJhbnRlZWQg
dG8gaG9sZCB0aGUgUEZOIGZvciBWTV9QRk5NQVAKPiByZWdpb25zLiBVc2luZyB2bWEtPnZtX3Bn
b2ZmIHRvIGRlcml2ZSB0aGUgSFBBIGhlcmUgbWF5IHRoZXJlZm9yZQo+IHByb2R1Y2UgaW5jb3Jy
ZWN0IG1hcHBpbmdzLgo+Cj4gSW5zdGVhZCwgSS9PIG1hcHBpbmdzIGZvciBzdWNoIHJlZ2lvbnMg
Y2FuIGJlIGVzdGFibGlzaGVkIG9uLWRlbWFuZAo+IGR1cmluZyBnLXN0YWdlIHBhZ2UgZmF1bHRz
LCBtYWtpbmcgdGhlIHVwZnJvbnQgaW9yZW1hcCBpbiB0aGlzIHBhdGgKPiBpcyB1bm5lY2Vzc2Fy
eS4KPgo+IEZpeGVzOiA5ZDA1YzFmZWU4MzcgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IHN0YWdl
MiBwYWdlIHRhYmxlIHByb2dyYW1taW5nIikKPiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZh
bmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KCkxHVE0uCgpRdWV1ZWQgaXQgYXMgZml4IGZvciBM
aW51eC02LjE4CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
ClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgfCAyMCArLS0tLS0t
LS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE5IGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jIGIvYXJjaC9yaXNj
di9rdm0vbW11LmMKPiBpbmRleCA1MjVmYjVhMzMwYzAuLjg0YzA0YzhmMDg5MiAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4g
QEAgLTE5Nyw4ICsxOTcsNyBAQCBpbnQga3ZtX2FyY2hfcHJlcGFyZV9tZW1vcnlfcmVnaW9uKHN0
cnVjdCBrdm0gKmt2bSwKPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIEEgbWVtb3J5IHJlZ2lv
biBjb3VsZCBwb3RlbnRpYWxseSBjb3ZlciBtdWx0aXBsZSBWTUFzLCBhbmQKPiAtICAgICAgICAq
IGFueSBob2xlcyBiZXR3ZWVuIHRoZW0sIHNvIGl0ZXJhdGUgb3ZlciBhbGwgb2YgdGhlbSB0byBm
aW5kCj4gLSAgICAgICAgKiBvdXQgaWYgd2UgY2FuIG1hcCBhbnkgb2YgdGhlbSByaWdodCBub3cu
Cj4gKyAgICAgICAgKiBhbnkgaG9sZXMgYmV0d2VlbiB0aGVtLCBzbyBpdGVyYXRlIG92ZXIgYWxs
IG9mIHRoZW0uCj4gICAgICAgICAgKgo+ICAgICAgICAgICogICAgICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsKPiAgICAgICAgICAqICstLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tLS0tLSsgICArLS0tLS0tLS0tLS0tLS0tLSsKPiBAQCAtMjI5LDMyICsy
MjgsMTUgQEAgaW50IGt2bV9hcmNoX3ByZXBhcmVfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICpr
dm0sCj4gICAgICAgICAgICAgICAgIHZtX2VuZCA9IG1pbihyZWdfZW5kLCB2bWEtPnZtX2VuZCk7
Cj4KPiAgICAgICAgICAgICAgICAgaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9QRk5NQVApIHsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBncGFfdCBncGEgPSBiYXNlX2dwYSArICh2bV9zdGFydCAt
IGh2YSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcGh5c19hZGRyX3QgcGE7Cj4gLQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIHBhID0gKHBoeXNfYWRkcl90KXZtYS0+dm1fcGdvZmYgPDwg
UEFHRV9TSElGVDsKPiAtICAgICAgICAgICAgICAgICAgICAgICBwYSArPSB2bV9zdGFydCAtIHZt
YS0+dm1fc3RhcnQ7Cj4gLQo+ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIElPIHJlZ2lvbiBk
aXJ0eSBwYWdlIGxvZ2dpbmcgbm90IGFsbG93ZWQgKi8KPiAgICAgICAgICAgICAgICAgICAgICAg
ICBpZiAobmV3LT5mbGFncyAmIEtWTV9NRU1fTE9HX0RJUlRZX1BBR0VTKSB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+IC0K
PiAtICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBrdm1fcmlzY3ZfbW11X2lvcmVtYXAoa3Zt
LCBncGEsIHBhLCB2bV9lbmQgLSB2bV9zdGFydCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgd3JpdGFibGUsIGZhbHNlKTsKPiAtICAgICAgICAg
ICAgICAgICAgICAgICBpZiAocmV0KQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgaHZhID0gdm1fZW5k
Owo+ICAgICAgICAgfSB3aGlsZSAoaHZhIDwgcmVnX2VuZCk7Cj4KPiAtICAgICAgIGlmIChjaGFu
Z2UgPT0gS1ZNX01SX0ZMQUdTX09OTFkpCj4gLSAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+IC0K
PiAtICAgICAgIGlmIChyZXQpCj4gLSAgICAgICAgICAgICAgIGt2bV9yaXNjdl9tbXVfaW91bm1h
cChrdm0sIGJhc2VfZ3BhLCBzaXplKTsKPiAtCj4gIG91dDoKPiAgICAgICAgIG1tYXBfcmVhZF91
bmxvY2soY3VycmVudC0+bW0pOwo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAtLQo+IDIuNTAuMQo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
