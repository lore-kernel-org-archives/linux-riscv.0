Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61D2D6C299
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 20:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5l8TQZ9sAHoJe8bSFKlg2dk4rU1wE+sQDSFcr86X1jM=; b=qYCV7FRy6ATjPU
	jVm1apqNIhzd6zsUsHtKem/hV4vhFFFPgQ8usp0YA92wypVNKSd+thuzPqNx2LjExggNEy2/vnomX
	jyXpk8Vwo2H9QKcbP3+U3acYSWT9xmaDzej2uk/jo1jnkvMyAkXmyxAo/A/GBX9LECsTsljcC5HXK
	ZWmiELilmCFhxoEZLEg6MZXs8Xu1Gg71+yEO/IWNXGry9GwGyRs07on4lZ4t+ChS9mvwp6j3XeWx9
	1btWV1z/H/pvx1CDcx43X5ZiNlw87TUg43optFtx0DboZ8HVBqwOx7/ScutInybjbFuqUqStG0oYa
	WEagl9hX0TQd36yFAw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDV0Z-0000000DjlZ-2ZRM;
	Tue, 19 Nov 2024 20:39:35 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUts-0000000Dhl8-162x
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 20:32:41 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53a097aa3daso3432379e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Nov 2024 12:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1732048358; x=1732653158; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWYEkOWioHzgVeGfpq57ujDZosgAfTiRf1WJliLcrIk=;
        b=mIjbvnCzzrGZKMCLXy5/6gXwG/7ZA0TLbXwC8XXsbQKx8YCVIYqBghK/k7q/AvrX+h
         SPJf0tWp68vVuRd6huRD/h46lueS0M3tPDvSBy5da943zx67Xj+CdSeiFV5Om2BLiLiN
         zdnVE4VC7WrO6q3WxE5h3p4/AHjL3MzRfeXSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048358; x=1732653158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWYEkOWioHzgVeGfpq57ujDZosgAfTiRf1WJliLcrIk=;
        b=XwxlBVC2KuZSJK5Hmwg4zf6RSfMRwe6W8EkOfJS9rhWmgAG4RkIsc/UnM/600uZbTk
         EaFKAL+mFQLHQfJQScFQrlQVes76Kl9QbUF2mGGe+F9WxOIHYffDwDzg9jp177i9W6hp
         g9SKnEURAUpl24V5tJDWyE10Mu9okn5iCKw7X0pXOsqzV3nVID5WCTb+QHpxiubXOTfx
         SHgPKCicIjuZWY4Z7hSgnKYHLdTO2saLETam180LZacK+65sSAdWS7tRAM7HzkUVnFQ2
         loXoL38jsCQrTIjg48sxDmouI+cw4oeLWmgjX4n624Wtzmtcxu93ggyE1NlNyZweyEOe
         BvWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBBaish3O8GJBLFukUCsqL9kLfQuZ3WPVgB4yhOVvsr8HFemisVNhebfMaYbxl9V6dKlpbv0Oo6DgKhg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw40zFlacEszpTMveng3FoajhRA5M37gBaxdaLmjfDo9/04Di3B
	QFrpznj+8hv6q+RA4yAWs7fYF2C5EHPsyx0ZBj5hYtQ7XzrUtoINAXLoLm7wDWa01uprClLVlH2
	NeEttEL1PYoWaghDBV5+cw4rEyPfItaHAUN9z
X-Google-Smtp-Source: AGHT+IHehrUYEzEiAX5rp04UBz9YHJyIrQz3EVW0EutgehQKYe+7DHzI9LMwa0xr58vt5qaV/wiuwXsHZJodWJ94xHY=
X-Received: by 2002:a05:6512:2347:b0:52e:98f6:c21f with SMTP id
 2adb3069b0e04-53dc13338a9mr32181e87.16.1732048357488; Tue, 19 Nov 2024
 12:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20241105183513.1358736-1-valentina.fernandezalanis@microchip.com>
 <20241105183513.1358736-3-valentina.fernandezalanis@microchip.com> <20241111215220.GA1993016-robh@kernel.org>
In-Reply-To: <20241111215220.GA1993016-robh@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 19 Nov 2024 12:32:26 -0800
Message-ID: <CAOnJCU+ac07aT9jLf5zqB+HnzHyqLMZE-Mz+cJDTdMAkS6LRTg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] riscv: export __cpuid_to_hartid_map
To: Rob Herring <robh@kernel.org>
Cc: Valentina Fernandez <valentina.fernandezalanis@microchip.com>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, ycliang@andestech.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, peterlin@andestech.com, 
	samuel.holland@sifive.com, conor.dooley@microchip.com, alexghiti@rivosinc.com, 
	ruanjinjie@huawei.com, takakura@valinux.co.jp, conor+dt@kernel.org, 
	jassisinghbrar@gmail.com, krzk+dt@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_123240_400305_76101DCB 
X-CRM114-Status: GOOD (  16.31  )
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

T24gTW9uLCBOb3YgMTEsIDIwMjQgYXQgMTo1MuKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBOb3YgMDUsIDIwMjQgYXQgMDY6MzU6MTFQTSArMDAw
MCwgVmFsZW50aW5hIEZlcm5hbmRleiB3cm90ZToKPiA+IEVYUE9SVF9TWU1CT0xfR1BMKCkgaXMg
bWlzc2luZyBmb3IgX19jcHVpZF90b19oYXJ0aWRfbWFwIGFycmF5Lgo+ID4gRXhwb3J0IHRoaXMg
c3ltYm9sIHRvIGFsbG93IGRyaXZlcnMgY29tcGlsZWQgYXMgbW9kdWxlcyB0byB1c2UKPiA+IGNw
dWlkX3RvX2hhcnRpZF9tYXAoKS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBWYWxlbnRpbmEgRmVy
bmFuZGV6IDx2YWxlbnRpbmEuZmVybmFuZGV6YWxhbmlzQG1pY3JvY2hpcC5jb20+Cj4gPiAtLS0K
PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcC5jCj4gPiBpbmRleCBjMTgwYTY0N2EzMGUuLmQ1OGI1
ZTc1MTI4NiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcC5jCj4gPiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYwo+ID4gQEAgLTQzLDYgKzQzLDcgQEAgZW51bSBpcGlf
bWVzc2FnZV90eXBlIHsKPiA+ICB1bnNpZ25lZCBsb25nIF9fY3B1aWRfdG9faGFydGlkX21hcFtO
Ul9DUFVTXSBfX3JvX2FmdGVyX2luaXQgPSB7Cj4gPiAgICAgICBbMCAuLi4gTlJfQ1BVUy0xXSA9
IElOVkFMSURfSEFSVElECj4gPiAgfTsKPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChfX2NwdWlkX3Rv
X2hhcnRpZF9tYXApOwo+Cj4gV2h5IGNhbid0IHJpc2N2IGltcGxlbWVudCBjcHVfbG9naWNhbF9t
YXAoKSBsaWtlIG90aGVyIGFyY2hlcz8KPgoKV2UgY2FuIGFuZCB3ZSBzaG91bGQgOikKCj4gV2Ug
cmVhbGx5IHNob3VsZCBoYXZlIGEgY29tbW9uIGltcGxlbWVudGF0aW9uIHRvbywgYnV0IHRoYXQn
cyBwcm9iYWJseQo+IHRvbyBtdWNoIHRvIGFzayBJIGd1ZXNzLgo+Cj4gUm9iCj4KPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgoKLS0gClJl
Z2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
