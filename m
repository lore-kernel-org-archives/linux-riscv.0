Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F5EC6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 04:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WB76WleXgDzSw4ZDNdfjs+ntbusWt8SOidActJIg9eg=; b=ERR84OYGp8cVDT
	QPYQShR4ePo4gzaNnSSvtAf8kcJWOldRDJrSaq3x/9c0aOcJhrEj1+8W4wLRPkbcjoe1x2OQrgNC2
	HCcyXi6BnVtevZ6JTvdWbc3+SikF/UXt73tXZGuK/91yNzbTLOQf4nmk99+UxSuTUOh9MDIntYdlJ
	W94smR4LBZqA9HbjGaLl7WLvpAzVeBJO84ZHli2jkMphkIObUJ+A3o06CCqdtFyzhuOXJq+CyCqRh
	TbuJLcU94mwKl8m8idqEnNpOwZdaUY3Xk6H5YUrh9Wk51COFMs4qYZE6jrEos00HgHl1mUTRAhUOq
	6s/LRod0RO1UXF2waAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJ9u-00CJrm-3B;
	Wed, 15 Mar 2023 04:54:42 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJ9s-00CJp1-0R
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 04:54:41 +0000
Received: by mail-ed1-x532.google.com with SMTP id cy23so70611817edb.12
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 21:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1678856070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok1v60C5hPiwt9Qd3eQGKQsz4sLfFgPUGqenltTPq64=;
        b=kSGujrpCi7S9oQQcF+KXLiXF2AFyWye+S4QzPP8Efci6YdYY31CKrqR6+MAqfh8PD8
         k/mA0O5wQOviXpwVIGZPBJKSxCVdonLlRAMh0Y0Pr0lCcU63qrKu38cwOny1VOsQkSiY
         Bx00WTN+Q0Y7gdHO6ooWtTUWqMBug6rtCiLJ95XQ3NGUkA/oq0VLVG5Af12ALFMwc5N+
         +zvCEKO7e4qEVcnoRzyUqS1BVnT6XhYtoyC7oJa3b/YocKVq+Jf7vrqvJVS4PxBWpVXW
         1DcoiQr3tq20itKfd9/RdTtGAPL6wf0EMqHaca0Ey6cX4Lvmgbsoo+NnsjR4KQQbXsvE
         zgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678856070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ok1v60C5hPiwt9Qd3eQGKQsz4sLfFgPUGqenltTPq64=;
        b=8B39X54vXJNYwIraHhGt7NBmx1Vv9UI8pczsNn4DALWTED72r/c6EUu3uLWxth7ttP
         LPJtginyBBUaLyWAh7X33k1QG+rSAeeVpcX9Q0LZ/odF78FNCSTRR6ZVXC8m5zxzqnM/
         QSi3hkiIekpoDtOhr/97q1lRmhLHZHEzZlhew89Q0QVp8Yg4ujEDD0s5JDiRg8VtYgFi
         +D0+Vw8hwLLHrtN4/wgxjwe1uVrRXgd0bLrkvROAkLgEnNesIN4563g3Mo+15lmEuIaA
         U7t6/VHuQd0IjE9dblkBWUfwgHe+i9COC3gqs9V/3cf3kvMJowBnex6NQuRu0rOp1sns
         guNw==
X-Gm-Message-State: AO0yUKVzYZ68MaIh9WYtY+FuEEoOJbTkaywZgoIUaDofPZcxmD4+r1n4
	/VdEarH3d6tYJgDfs5mVrYmGrraUdB4p8fHXrvSCOA==
X-Google-Smtp-Source: AK7set/1nnqVtUQCG1aacxcLFFzizJxqkOES2bKXzjpRS7IsRswJfaU17038Z0AGjDb5rVIlx+1ThTGZ/2P7CxosKTo=
X-Received: by 2002:a17:907:7ba6:b0:92b:f0f9:427a with SMTP id
 ne38-20020a1709077ba600b0092bf0f9427amr2706405ejc.13.1678856070062; Tue, 14
 Mar 2023 21:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230224162631.405473-9-ajones@ventanamicro.com> <mhng-f27eaa3e-34e3-4843-abdb-4b17cbe24ddb@palmer-ri-x1c9a>
In-Reply-To: <mhng-f27eaa3e-34e3-4843-abdb-4b17cbe24ddb@palmer-ri-x1c9a>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 Mar 2023 10:24:19 +0530
Message-ID: <CAAhSdy1qOH25QdwkikwGU9xnhz_+UUGqAcXqU2Hd2d7RoaP9Vg@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] RISC-V: KVM: Expose Zicboz to the guest
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ajones@ventanamicro.com, apatel@ventanamicro.com, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, sudip.mukherjee@codethink.co.uk, 
	ben.dooks@codethink.co.uk, Atish Patra <atishp@rivosinc.com>, aou@eecs.berkeley.edu, 
	krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, jszhang@kernel.org, 
	heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_215440_176729_03366E34 
X-CRM114-Status: GOOD (  19.87  )
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

T24gV2VkLCBNYXIgMTUsIDIwMjMgYXQgMTA6MDjigK9BTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgMjQgRmViIDIwMjMgMDg6MjY6MzEgUFNU
ICgtMDgwMCksIGFqb25lc0B2ZW50YW5hbWljcm8uY29tIHdyb3RlOgo+ID4gR3Vlc3RzIG1heSB1
c2UgdGhlIGNiby56ZXJvIGluc3RydWN0aW9uIHdoZW4gdGhlIENQVSBoYXMgdGhlIFppY2Jvego+
ID4gZXh0ZW5zaW9uIGFuZCB0aGUgaHlwZXJ2aXNvciBzZXRzIGhlbnZjZmcuQ0JaRS4KPiA+Cj4g
PiBBZGQgWmljYm96IHN1cHBvcnQgZm9yIEtWTSBndWVzdHMgd2hpY2ggbWF5IGJlIGVuYWJsZWQg
YW5kCj4gPiBkaXNhYmxlZCBmcm9tIEtWTSB1c2Vyc3BhY2UgdXNpbmcgdGhlIElTQSBleHRlbnNp
b24gT05FX1JFRyBBUEkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9y
LmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+Cj4KPiBTb3JyeSwgSSBndWVzcyBJIHdhc24ndCBsb29raW5nIGNsb3Nl
bHkgZW5vdWdoLiAgSXQncyBqdXN0IGEgcmV2aWV3LCBub3QKPiBhbiBhY2suCj4KPiBBbnVwOiBp
cyBpdCBPSyBpZiB0aGlzIGdvZXMgYWxvbmcgd2l0aCB0aGUgb3RoZXJzPwoKWWVzLCBubyBwcm9i
bGVtLgoKQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRz
LApBbnVwCgo+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgg
fCAxICsKPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgfCA0ICsrKysKPiA+
ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20va3ZtLmgKPiA+IGluZGV4IGMxYTFiYjBmYTkxYy4uZTQ0YzFlOTBlYWE3IDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+IEBAIC0xMDYsNiArMTA2LDcgQEAgZW51
bSBLVk1fUklTQ1ZfSVNBX0VYVF9JRCB7Cj4gPiAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9TVklO
VkFMLAo+ID4gICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UsCj4gPiAgICAgICBL
Vk1fUklTQ1ZfSVNBX0VYVF9aSUNCT00sCj4gPiArICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aSUNC
T1osCj4gPiAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9NQVgsCj4gPiAgfTsKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4g
PiBpbmRleCBlNTEyNmNlZmJjODcuLjE5OGVlODZjYWQzOCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gPiBAQCAt
NjMsNiArNjMsNyBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgbG9uZyBrdm1faXNhX2V4dF9hcnJb
XSA9IHsKPiA+ICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVlBCTVQpLAo+ID4gICAgICAgS1ZNX0lT
QV9FWFRfQVJSKFpJSElOVFBBVVNFKSwKPiA+ICAgICAgIEtWTV9JU0FfRVhUX0FSUihaSUNCT00p
LAo+ID4gKyAgICAgS1ZNX0lTQV9FWFRfQVJSKFpJQ0JPWiksCj4gPiAgfTsKPiA+Cj4gPiAgc3Rh
dGljIHVuc2lnbmVkIGxvbmcga3ZtX3Jpc2N2X3ZjcHVfYmFzZTJpc2FfZXh0KHVuc2lnbmVkIGxv
bmcgYmFzZV9leHQpCj4gPiBAQCAtODY1LDYgKzg2Niw5IEBAIHN0YXRpYyB2b2lkIGt2bV9yaXNj
dl92Y3B1X3VwZGF0ZV9jb25maWcoY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhKQo+ID4gICAgICAg
aWYgKHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYSwgWklDQk9NKSkKPiA+ICAgICAg
ICAgICAgICAgaGVudmNmZyB8PSAoRU5WQ0ZHX0NCSUUgfCBFTlZDRkdfQ0JDRkUpOwo+ID4KPiA+
ICsgICAgIGlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2EsIFpJQ0JPWikpCj4g
PiArICAgICAgICAgICAgIGhlbnZjZmcgfD0gRU5WQ0ZHX0NCWkU7Cj4gPiArCj4gPiAgICAgICBj
c3Jfd3JpdGUoQ1NSX0hFTlZDRkcsIGhlbnZjZmcpOwo+ID4gICNpZmRlZiBDT05GSUdfMzJCSVQK
PiA+ICAgICAgIGNzcl93cml0ZShDU1JfSEVOVkNGR0gsIGhlbnZjZmcgPj4gMzIpOwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
