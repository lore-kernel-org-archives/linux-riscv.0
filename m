Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435EECA5504
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1RahYHW5CUSUJWkAVp5H1sOC/67Vdh73A5GMMTrTrc=; b=4bfSo3MvUYnzQW
	MW/YQr4PPQzqo2AOfd+Y2YeoFwk1YiEYMUJtyxUQ1bc8pui7kiHDrU6/5toDUTi/wIMNZhQ4M7RW3
	sgnnF8Df458P4O6krgghdCW+nQyEjc0eBxPqdWwoTHPriQeZivzY8UCYqZVMly1i2MsumFLkESn26
	H7wNT7jbp61pvWoKunxFWddBfXwAHIB7UD09IVAe3wCIIWIf7i2GI2RLi4HOR5yBlhch4/Nu64iVL
	L19BwDmjXBlw04P1mmPx7LK3ZCB8ZvQXsdCKaLwgv/+dM8ddZG1kFnmH+7CzqP8V2SCv4MoJF7WYW
	o0PEiuRn4tReL5jiBpaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKre-0051dY-0r;
	Wed, 13 Sep 2023 08:04:46 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKrb-0051bB-0H
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 08:04:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-401da71b85eso70736035e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 01:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694592278; x=1695197078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPWN3g7ekkDjnkl2bbqC6JeTQY1RKOcv/b55LHoasX4=;
        b=H0icY6o/z63728DN2FfKkPjwlmHMAeZm/v29Mx7O7kP20ZbhLoA68+VleFxkHVYh8Y
         MbRCyxVVnTatZsP0FwJslE7PaMPTNQHYmBbE5nGC5VcdKdXGo93QdiqGD6K2PfDYt5EI
         wpVdEcyTV/+qAxNxsncqBNk9cgVw2hT6RoP7E9cf67W/AptBluMyxVtOcrx+E6Jd0P7E
         ZDHSN3B+jgtmUtI85iiwxhhnQ3GzN4tM0bpelfREk4GX252A7rUn6EzhyGKgMFRp28kd
         /1Xs8gPrLLSqncQOK/QynYl0YsptQt+mVgR6gnguiFHppvxUDUCy2VbbrE/uGWe4e1U3
         y+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694592278; x=1695197078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPWN3g7ekkDjnkl2bbqC6JeTQY1RKOcv/b55LHoasX4=;
        b=NR4QhiWU45YB0OerFEqZ0JJ4qnSbf4qTVkqtt9dG8ddsuFHmhXB0O31PCpwLZtwf5C
         pXufcKgpSDQ/9zw7y9gGhoSJYXXnpSjtU+P5m4hGKIlQp23/LmS1gZIuxFaMnjxdwyxf
         kzDbAY3kZR0jf6DhWhRScXJmdm1XPGN/OkbYUUvMRr51HUA1oBTKDrt+aVkXgnpPAL52
         3IJNKLa6bt1Gj++2UKukXCSkhv9QSFiPfABYz1LIc5UnTV9LREIUbNy+zFER9hPuAbKC
         TbCY4s6MSRNm09F3b7tZr7VeHGinvWqZRlkdsOXlBC3BIQyDEjcpJSwC4HG1agNZaLkV
         BT5w==
X-Gm-Message-State: AOJu0Yx3rERas16WDn+uu/5KQUOpL6d0MDjcrsh5PMp69cJlXXf0k3Tr
	FDsFY83Ojcv4WZ2Ff3FxAVogltOlvsvyzZJgGIM2FQ==
X-Google-Smtp-Source: AGHT+IFHcnsSPP5H7mpSp2WLQ1AsmP2vnqPuf5kEEIlg3PcRjIDekEMoUd66v/YNaqjRaATFe+JBJQROFg/wYya6n0c=
X-Received: by 2002:a7b:cbc8:0:b0:3fe:111a:d1d9 with SMTP id
 n8-20020a7bcbc8000000b003fe111ad1d9mr1465328wmi.25.1694592278218; Wed, 13 Sep
 2023 01:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230911131224.61924-1-alexghiti@rivosinc.com> <20230911131224.61924-5-alexghiti@rivosinc.com>
In-Reply-To: <20230911131224.61924-5-alexghiti@rivosinc.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 13 Sep 2023 10:04:27 +0200
Message-ID: <CAHVXubiVH=q9pnTLQyjS3X3W-hvuA=ZMM2D2xYPFkGjFnAgbWg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] riscv: Improve flush_tlb_kernel_range()
To: Will Deacon <will@kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>, 
	Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_010443_126505_D91765FA 
X-CRM114-Status: GOOD (  27.36  )
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

QExhZCwgUHJhYmhha2FyIEFueSBjaGFuY2UgeW91IGdpdmUgYSB0cnkgdG8gdGhpcyBuZXcgcGF0
Y2hzZXQ/IFNvCnRoYXQgd2UgbWFrZSBzdXJlIFNhbXVlbCBmb3VuZCB5b3VyIGlzc3VlIDopCgpP
biBNb24sIFNlcCAxMSwgMjAyMyBhdCAzOjE24oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoaXMgZnVuY3Rpb24gdXNlZCB0byBzaW1wbHkg
Zmx1c2ggdGhlIHdob2xlIHRsYiBvZiBhbGwgaGFydHMsIGJlIG1vcmUKPiBzdWJ0aWxlIGFuZCB0
cnkgdG8gb25seSBmbHVzaCB0aGUgcmFuZ2UuCj4KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHdlIGNh
biBvbmx5IHVzZSBQQUdFX1NJWkUgYXMgc3RyaWRlIHNpbmNlIHdlIGRvbid0IGtub3cKPiB0aGUg
c2l6ZSBvZiB0aGUgdW5kZXJseWluZyBtYXBwaW5nIGFuZCB0aGVuIHRoaXMgZnVuY3Rpb24gd2ls
bCBiZSBpbXByb3ZlZAo+IG9ubHkgaWYgdGhlIHNpemUgb2YgdGhlIHJlZ2lvbiB0byBmbHVzaCBp
cyA8IHRocmVzaG9sZCAqIFBBR0VfU0laRS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBH
aGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVz
IDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS90bGJmbHVzaC5oIHwgMTEgKysrKysrLS0tLS0KPiAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5j
ICAgICAgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdGxiZmx1c2guaAo+IGluZGV4IDE3MGE0OWM1MzFjNi4uOGYzNDE4YzVmMTcyIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+IEBAIC00MCw2ICs0MCw3IEBAIHZvaWQgZmx1
c2hfdGxiX21tX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHN0YXJ0
LAo+ICB2b2lkIGZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNp
Z25lZCBsb25nIGFkZHIpOwo+ICB2b2lkIGZsdXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPiAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIGVuZCk7Cj4gK3ZvaWQgZmx1c2hfdGxiX2tlcm5lbF9yYW5nZSh1bnNpZ25l
ZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCk7Cj4gICNpZmRlZiBDT05GSUdfVFJBTlNQ
QVJFTlRfSFVHRVBBR0UKPiAgI2RlZmluZSBfX0hBVkVfQVJDSF9GTFVTSF9QTURfVExCX1JBTkdF
Cj4gIHZvaWQgZmx1c2hfcG1kX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwg
dW5zaWduZWQgbG9uZyBzdGFydCwKPiBAQCAtNTYsMTUgKzU3LDE1IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBmbHVzaF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gICAgICAg
ICBsb2NhbF9mbHVzaF90bGJfYWxsKCk7Cj4gIH0KPgo+IC0jZGVmaW5lIGZsdXNoX3RsYl9tbSht
bSkgZmx1c2hfdGxiX2FsbCgpCj4gLSNkZWZpbmUgZmx1c2hfdGxiX21tX3JhbmdlKG1tLCBzdGFy
dCwgZW5kLCBwYWdlX3NpemUpIGZsdXNoX3RsYl9hbGwoKQo+IC0jZW5kaWYgLyogIUNPTkZJR19T
TVAgfHwgIUNPTkZJR19NTVUgKi8KPiAtCj4gIC8qIEZsdXNoIGEgcmFuZ2Ugb2Yga2VybmVsIHBh
Z2VzICovCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2ln
bmVkIGxvbmcgc3RhcnQsCj4gICAgICAgICB1bnNpZ25lZCBsb25nIGVuZCkKPiAgewo+IC0gICAg
ICAgZmx1c2hfdGxiX2FsbCgpOwo+ICsgICAgICAgbG9jYWxfZmx1c2hfdGxiX2FsbCgpOwo+ICB9
Cj4KPiArI2RlZmluZSBmbHVzaF90bGJfbW0obW0pIGZsdXNoX3RsYl9hbGwoKQo+ICsjZGVmaW5l
IGZsdXNoX3RsYl9tbV9yYW5nZShtbSwgc3RhcnQsIGVuZCwgcGFnZV9zaXplKSBmbHVzaF90bGJf
YWxsKCkKPiArI2VuZGlmIC8qICFDT05GSUdfU01QIHx8ICFDT05GSUdfTU1VICovCj4gKwo+ICAj
ZW5kaWYgLyogX0FTTV9SSVNDVl9UTEJGTFVTSF9IICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvbW0vdGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+IGluZGV4IDJjMTEz
NmQ3MzQxMS4uMjhjZDg1MzliNTc1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1
c2guYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+IEBAIC05NywxOSArOTcsMjcg
QEAgc3RhdGljIHZvaWQgX19mbHVzaF90bGJfcmFuZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVu
c2lnbmVkIGxvbmcgc3RhcnQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBzaXplLCB1bnNpZ25lZCBsb25nIHN0cmlkZSkKPiAgewo+ICAgICAgICAgc3RydWN0
IGZsdXNoX3RsYl9yYW5nZV9kYXRhIGZ0ZDsKPiAtICAgICAgIHN0cnVjdCBjcHVtYXNrICpjbWFz
ayA9IG1tX2NwdW1hc2sobW0pOwo+ICsgICAgICAgc3RydWN0IGNwdW1hc2sgKmNtYXNrLCBmdWxs
X2NtYXNrOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBhc2lkID0gRkxVU0hfVExCX05PX0FTSUQ7
Cj4gLSAgICAgICB1bnNpZ25lZCBpbnQgY3B1aWQ7Cj4gICAgICAgICBib29sIGJyb2FkY2FzdDsK
Pgo+IC0gICAgICAgaWYgKGNwdW1hc2tfZW1wdHkoY21hc2spKQo+IC0gICAgICAgICAgICAgICBy
ZXR1cm47Cj4gKyAgICAgICBpZiAobW0pIHsKPiArICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IGNwdWlkOwo+ICsKPiArICAgICAgICAgICAgICAgY21hc2sgPSBtbV9jcHVtYXNrKG1tKTsKPiAr
ICAgICAgICAgICAgICAgaWYgKGNwdW1hc2tfZW1wdHkoY21hc2spKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybjsKPgo+IC0gICAgICAgY3B1aWQgPSBnZXRfY3B1KCk7Cj4gLSAgICAg
ICAvKiBjaGVjayBpZiB0aGUgdGxiZmx1c2ggbmVlZHMgdG8gYmUgc2VudCB0byBvdGhlciBDUFVz
ICovCj4gLSAgICAgICBicm9hZGNhc3QgPSBjcHVtYXNrX2FueV9idXQoY21hc2ssIGNwdWlkKSA8
IG5yX2NwdV9pZHM7Cj4gKyAgICAgICAgICAgICAgIGNwdWlkID0gZ2V0X2NwdSgpOwo+ICsgICAg
ICAgICAgICAgICAvKiBjaGVjayBpZiB0aGUgdGxiZmx1c2ggbmVlZHMgdG8gYmUgc2VudCB0byBv
dGhlciBDUFVzICovCj4gKyAgICAgICAgICAgICAgIGJyb2FkY2FzdCA9IGNwdW1hc2tfYW55X2J1
dChjbWFzaywgY3B1aWQpIDwgbnJfY3B1X2lkczsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAg
ICAgICAgICAgIGNwdW1hc2tfc2V0YWxsKCZmdWxsX2NtYXNrKTsKPiArICAgICAgICAgICAgICAg
Y21hc2sgPSAmZnVsbF9jbWFzazsKPiArICAgICAgICAgICAgICAgYnJvYWRjYXN0ID0gdHJ1ZTsK
PiArICAgICAgIH0KPgo+IC0gICAgICAgaWYgKHN0YXRpY19icmFuY2hfdW5saWtlbHkoJnVzZV9h
c2lkX2FsbG9jYXRvcikpCj4gKyAgICAgICBpZiAoc3RhdGljX2JyYW5jaF91bmxpa2VseSgmdXNl
X2FzaWRfYWxsb2NhdG9yKSAmJiBtbSkKPiAgICAgICAgICAgICAgICAgYXNpZCA9IGF0b21pY19s
b25nX3JlYWQoJm1tLT5jb250ZXh0LmlkKSAmIGFzaWRfbWFzazsKPgo+ICAgICAgICAgaWYgKGJy
b2FkY2FzdCkgewo+IEBAIC0xMjgsNyArMTM2LDggQEAgc3RhdGljIHZvaWQgX19mbHVzaF90bGJf
cmFuZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gICAgICAg
ICAgICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9yYW5nZV9hc2lkKHN0YXJ0LCBzaXplLCBzdHJpZGUs
IGFzaWQpOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBwdXRfY3B1KCk7Cj4gKyAgICAgICBpZiAo
bW0pCj4gKyAgICAgICAgICAgICAgIHB1dF9jcHUoKTsKPiAgfQo+Cj4gIHZvaWQgZmx1c2hfdGxi
X21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+IEBAIC0xODksNiArMTk4LDEyIEBAIHZvaWQgZmx1
c2hfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIHN0
YXJ0LAo+Cj4gICAgICAgICBfX2ZsdXNoX3RsYl9yYW5nZSh2bWEtPnZtX21tLCBzdGFydCwgZW5k
IC0gc3RhcnQsIHN0cmlkZV9zaXplKTsKPiAgfQo+ICsKPiArdm9pZCBmbHVzaF90bGJfa2VybmVs
X3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQo+ICt7Cj4gKyAg
ICAgICBfX2ZsdXNoX3RsYl9yYW5nZShOVUxMLCBzdGFydCwgZW5kIC0gc3RhcnQsIFBBR0VfU0la
RSk7Cj4gK30KPiArCj4gICNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKPiAgdm9p
ZCBmbHVzaF9wbWRfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25l
ZCBsb25nIHN0YXJ0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5k
KQo+IC0tCj4gMi4zOS4yCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
