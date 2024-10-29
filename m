Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1C5D5B164
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 08:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bd0ErSFvztahY5yyl+PAsEJ0ZJRWaHcNLd+njlgYeus=; b=JRdiO+lY4q9bSc
	BIQ/rGeL0ICAwoIpqjkJopuPEL7gD9cSPaW3siVmPuBrsr+kmDUjkh9BqMbQDb0AlKB+bOtsVE194
	fch8j3fDi7qthZhsmdp36lI1Bmfaj8dQfcg5cJdRZbsQtXY81p/mynFEhMc+Z0ZtMBB8EWpEAc5PU
	4Qbr4BXH1sf5DugRGEpgFEqWubIH3uWezRFDrWYNyuDXx84GcU2bauV+eRGVHnH3Ibz3RD4plUi1D
	zVQnUmQsiXUOHugLozgwlEc3yTERTWnzswAv7OCGzL4SRuxaa8gQODuElhVSBkUZaFu2PBfPahvfE
	DLpoiRq23HGxg8mPsUmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hFu-0000000Dcdw-2mpd;
	Tue, 29 Oct 2024 08:07:10 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hFK-0000000DcYW-3cSv
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 08:06:36 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7180bd5b79dso2023666a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 01:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730189193; x=1730793993; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erYrvbuM+zOt800Pswb5/FeIgISJC9qqJWCYratTQZU=;
        b=R6w8ZsMdS9mWyOBVfsxB7TQNH5M1fXeoGtPQXRAA+4382OSQoc6imhWQ2fPzV3HhRf
         nYFRz0pirgLwtfGH6A5dE7mtEcJuVI6zp96BL2A6tVyBcbQoFonqhAUuA+gn7mMbPYxh
         slt+pl6AF7gunbEcMvopo7EQnwVUq1UynljqS5l5cOmv8c4sEWGNCE0OqqvZc9WS173z
         VXxVOYnqQiVgFRra2e78lo6y74EFqMmRV0DSZK+PwpGEGuBTzqHL0q6/xTODe4uU0WzN
         6xvRmrUxucDn+ARGuSc/uIvAseZES3I2oIc+fChoe6U1yXf0jTW84F5C4KzedrwgvQEQ
         bn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189193; x=1730793993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erYrvbuM+zOt800Pswb5/FeIgISJC9qqJWCYratTQZU=;
        b=QezcaIAuUCw74qSbJQN1AZGW7VBvzExsyl+w+ItZ9duDg2Em/kfSuCDbnl9vtLrK17
         NTgJLkdYReqvJSeS3oO/0UArAOBiUG2AUoqFuCuO1qwBER05/lvjEz9B8RJRr7Sdfth/
         wmQLk/raBByarnxC1akaFBorjM84m3YcX4fo8VmmRCTiDj+dugOXjti2MDYYOnRGd8VI
         b4BZBK1CzLvv0ZvZVazQ3cSMihHEpNWFMD1v4cmxgahuap6lA1/mgT5tzD015laUoEFn
         rs/DknLXYhFfWRxGD3/YsYhyP8viBTMsjeLBRiG6i12+a6p43oC3v7hjC5/0peEHFA1h
         MQCA==
X-Forwarded-Encrypted: i=1; AJvYcCVQk26+Rggq4LiYPhxPWc2oF+jIjVI02mjgwvnzzAuXNbSbF6gaJw9+9buMmbEOyymy5Fwt2Pg2nJAZ8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyfe3rtekVK0ofqW6IlNQ0w4gji1zNHiAxLYxnJFWTbLlxv2Ob
	V95GnyyE13nARx6MEEp7o6XqkHt49rwAKi5TZ/SH/NvouWQG3H65I/AAUNPF12ZecZyF06QsQFx
	01wwww5T8l0TFVQIqgswlxzCuttY=
X-Google-Smtp-Source: AGHT+IFDFWL4mUjTprma/osZp1KJIoCHwGw0y8thgiAfWKZzlyBnrv8BrxgAMiSJRJIJRIEpMo2FiY9XYcdbCsPmb4I=
X-Received: by 2002:a05:6830:4189:b0:718:678:56e3 with SMTP id
 46e09a7af769-71867f1012cmr11989419a34.5.1730189192952; Tue, 29 Oct 2024
 01:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20241008094141.549248-5-zhangchunyan@iscas.ac.cn> <mhng-d7045132-a4e1-409a-9646-d8ecd3d6a48f@palmer-ri-x1c9a>
In-Reply-To: <mhng-d7045132-a4e1-409a-9646-d8ecd3d6a48f@palmer-ri-x1c9a>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 29 Oct 2024 16:05:56 +0800
Message-ID: <CAAfSe-t7iAomibbCJQJv6d6cig8eESgHCfWCuZkRUr9Jz+aY5Q@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] selftests/mm: skip virtual_address_range tests on riscv
To: Andrew Morton <akpm@linux-foundation.org>
Cc: zhangchunyan@iscas.ac.cn, shuah@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, alex@ghiti.fr, 
	Charlie Jenkins <charlie@rivosinc.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_010634_984903_D560913A 
X-CRM114-Status: GOOD (  18.41  )
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

SGkgQW5kcmV377yMCgpPbiBGcmksIDI1IE9jdCAyMDI0IGF0IDAyOjAwLCBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMDggT2N0IDIwMjQgMDI6
NDE6NDEgUERUICgtMDcwMCksIHpoYW5nY2h1bnlhbkBpc2Nhcy5hYy5jbiB3cm90ZToKPiA+IFJJ
U0MtViBkb2Vzbid0IGN1cnJlbnRseSBoYXZlIHRoZSBiZWhhdmlvciBvZiByZXN0cmljdGluZyB0
aGUgdmlydHVhbAo+ID4gYWRkcmVzcyBzcGFjZSB3aGljaCB2aXJ0dWFsX2FkZHJlc3NfcmFuZ2Ug
dGVzdHMgY2hlY2ssIHRoaXMgd2lsbAo+ID4gY2F1c2UgdGhlIHRlc3RzIGZhaWwuIFNvIGxldHMg
ZGlzYWJsZSB0aGUgd2hvbGUgdGVzdCBzdWl0ZSBmb3IgcmlzY3Y2NAo+ID4gZm9yIG5vdywgbm90
IGJ1aWxkIGl0IGFuZCBydW5fdm10ZXN0cy5zaCB3aWxsIHNraXAgaXQgaWYgaXQgaXMgbm90IHBy
ZXNlbnQuCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZv
c2luYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVueWFuIFpoYW5nIDx6aGFuZ2NodW55YW5A
aXNjYXMuYWMuY24+Cj4gPiAtLS0KPiA+IFYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1tbS9adU91ZWRCcFM3aTNUJTJGbzBAZ2hvc3QvVC8KPiA+IC0tLQo+ID4gIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL21tL01ha2VmaWxlICAgICAgIHwgIDIgKysKPiA+ICB0b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9tbS9ydW5fdm10ZXN0cy5zaCB8IDEwICsrKysrKy0tLS0KPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbW0vTWFrZWZpbGUgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9tbS9NYWtlZmlsZQo+ID4gaW5kZXggMDJlMTIwNDk3MWIwLi43NmEzNzhjNWMx
NDEgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tbS9NYWtlZmlsZQo+
ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbW0vTWFrZWZpbGUKPiA+IEBAIC0xMTUs
NyArMTE1LDkgQEAgZW5kaWYKPiA+Cj4gPiAgaWZuZXEgKCwkKGZpbHRlciAkKEFSQ0gpLGFybTY0
IG1pcHM2NCBwYXJpc2M2NCBwb3dlcnBjIHJpc2N2NjQgczM5MHggc3BhcmM2NCB4ODZfNjQgczM5
MCkpCj4gPiAgVEVTVF9HRU5fRklMRVMgKz0gdmFfaGlnaF9hZGRyX3N3aXRjaAo+ID4gK2lmbmVx
ICgkKEFSQ0gpLHJpc2N2NjQpCj4gPiAgVEVTVF9HRU5fRklMRVMgKz0gdmlydHVhbF9hZGRyZXNz
X3JhbmdlCj4gPiArZW5kaWYKPiA+ICBURVNUX0dFTl9GSUxFUyArPSB3cml0ZV90b19odWdldGxi
ZnMKPiA+ICBlbmRpZgo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9tbS9ydW5fdm10ZXN0cy5zaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21tL3J1bl92bXRl
c3RzLnNoCj4gPiBpbmRleCBjNTc5N2FkMWQzN2IuLjQ0OTNiZmQxOTExYyAxMDA3NTUKPiA+IC0t
LSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21tL3J1bl92bXRlc3RzLnNoCj4gPiArKysgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tbS9ydW5fdm10ZXN0cy5zaAo+ID4gQEAgLTM0NywxMCAr
MzQ3LDEyIEBAIGlmIFsgJFZBRERSNjQgLW5lIDAgXTsgdGhlbgo+ID4gICAgICAgIyBhbGxvd3Mg
aGlnaCB2aXJ0dWFsIGFkZHJlc3MgYWxsb2NhdGlvbiByZXF1ZXN0cyBpbmRlcGVuZGVudAo+ID4g
ICAgICAgIyBvZiBwbGF0Zm9ybSdzIHBoeXNpY2FsIG1lbW9yeS4KPiA+Cj4gPiAtICAgICBwcmV2
X3BvbGljeT0kKGNhdCAvcHJvYy9zeXMvdm0vb3ZlcmNvbW1pdF9tZW1vcnkpCj4gPiAtICAgICBl
Y2hvIDEgPiAvcHJvYy9zeXMvdm0vb3ZlcmNvbW1pdF9tZW1vcnkKPiA+IC0gICAgIENBVEVHT1JZ
PSJodWdldm0iIHJ1bl90ZXN0IC4vdmlydHVhbF9hZGRyZXNzX3JhbmdlCj4gPiAtICAgICBlY2hv
ICRwcmV2X3BvbGljeSA+IC9wcm9jL3N5cy92bS9vdmVyY29tbWl0X21lbW9yeQo+ID4gKyAgICAg
aWYgWyAteCAuL3ZpcnR1YWxfYWRkcmVzc19yYW5nZSBdOyB0aGVuCj4gPiArICAgICAgICAgICAg
IHByZXZfcG9saWN5PSQoY2F0IC9wcm9jL3N5cy92bS9vdmVyY29tbWl0X21lbW9yeSkKPiA+ICsg
ICAgICAgICAgICAgZWNobyAxID4gL3Byb2Mvc3lzL3ZtL292ZXJjb21taXRfbWVtb3J5Cj4gPiAr
ICAgICAgICAgICAgIENBVEVHT1JZPSJodWdldm0iIHJ1bl90ZXN0IC4vdmlydHVhbF9hZGRyZXNz
X3JhbmdlCj4gPiArICAgICAgICAgICAgIGVjaG8gJHByZXZfcG9saWN5ID4gL3Byb2Mvc3lzL3Zt
L292ZXJjb21taXRfbWVtb3J5Cj4gPiArICAgICBmaQo+ID4KPiA+ICAgICAgICMgdmEgaGlnaCBh
ZGRyZXNzIGJvdW5kYXJ5IHN3aXRjaCB0ZXN0Cj4gPiAgICAgICBBUkNIX0FSTTY0PSJhcm02NCIK
Pgo+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPgo+IChJ
J20gdGFraW5nIHRoZSBmaXJzdCB0d28gYXMgdGhleSdyZSBSSVNDLVYgYml0cykKCkNvdWxkIHlv
dSBwbGVhc2UgcGljayB1cCB0aGUgbGFzdCB0d28gdGhyb3VnaCB5b3VyIHRyZWU/CgpUaGFua3Ms
CkNodW55YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
