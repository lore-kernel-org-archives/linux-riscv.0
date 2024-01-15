Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66553C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 07:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvWvEcTomLxJ39+MS1zSoxR90eqea5HUmRbmIFYeK0A=; b=3TNkyzLLXeBBYv
	GTcnk6ZZuPF6PkVi/hRmrHrLsb0PnKwo6Yw1kqZ8T2OnXR0bsqVX1USb8Kpl/LcQDH7CQxfHGu0/c
	AJ8B3opqGnw10wQxCjc9lCujQ3gokHFSFr7kMMZmPkZhw6nu5iEVM2qQn09AHB1wCmN5JGeULULAY
	Imv1Dr+POA1SYBrlfsZTnbbMKcHwPAXs1KxP0QXNOTe9r9emMUOWMoQzcI9IaCO7TH4rwK5ae9tVY
	y+eGsUAvfsyegOoz/JgxMixq5fY0mWtYMVlLqcT1xbQ9rGtUijvrGbqFNALsr5IYNdtvHnvr6ta3o
	voZ65PxotdXavvIJZ3lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPHCq-0083cz-14;
	Mon, 15 Jan 2024 07:16:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPHCo-0083bz-0U
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 07:16:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7BF41B8093B
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3B9C43399
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705302979;
	bh=hBHpm3zc/SKaJAL5805575flAm2tnAGeJNa0dnDR+o8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=opgkSyyOmqGDwXU59OPCF96bkicXjc3gbdkjN6tt8DiWOrxYCYr3F8LiO1oxvAKHI
	 HuItTkrjhajRuPG/wMhNX2O3Q/tZeCQ41ONtgsFbvTPUoc08ZDQGga8ZIcj1rh94H+
	 OwBdG4Qc1//Pnl3ATdxtbjvGoXAT+rKzYr1fU1PKWpLVfZT+/aHVVO228IBum37cYC
	 NT1hZMypthf0yY8OM5w6OL/nkU5KRriEmO7KPkpHMOH9oRchFY6UApXd1JzfPxGLwG
	 ghqm1rf970VCFhrI9ZN4F1XQRMuN+YiXb9Fri/To8QHYINXAPC3fOetONgoSifxOSn
	 UOANufgQhAhsA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so992343266b.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jan 2024 23:16:19 -0800 (PST)
X-Gm-Message-State: AOJu0YyKF1oZcZm68RoSIP7yIjoF54dg30os6CX5GyZDZhJ/Apo6HCic
	brCHwqRSKfl2BOkm+FgdhJCBIKDmZzdHn0r21xA=
X-Google-Smtp-Source: AGHT+IEKnTsvHq2jHCnUj3piJN+8o9vzs76xLREUGgP/slosJUNH/MIGSV5msrYZT8I4hpfKVoQuNL3wxeNxWuUrPNA=
X-Received: by 2002:a17:907:7da7:b0:a2c:4c47:319 with SMTP id
 oz39-20020a1709077da700b00a2c4c470319mr1978331ejc.89.1705302978250; Sun, 14
 Jan 2024 23:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20240115055929.4736-1-andy.chiu@sifive.com>
In-Reply-To: <20240115055929.4736-1-andy.chiu@sifive.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Mon, 15 Jan 2024 08:16:06 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNgh1eOH4yVH2RZUnzJ-0bN-XrocCr9yBT2_qOV7nk9Q5g@mail.gmail.com>
Message-ID: <CAJ+HfNgh1eOH4yVH2RZUnzJ-0bN-XrocCr9yBT2_qOV7nk9Q5g@mail.gmail.com>
Subject: Re: [v11, 00/10] riscv: support kernel-mode Vector
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	charlie@rivosinc.com, ardb@kernel.org, arnd@arndb.de, peterz@infradead.org, 
	tglx@linutronix.de, ebiggers@kernel.org, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_231622_515850_DD81CE2E 
X-CRM114-Status: GOOD (  16.82  )
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

SGkgQW5keSwKCk9uIE1vbiwgMTUgSmFuIDIwMjQgYXQgMDY6NTksIEFuZHkgQ2hpdSA8YW5keS5j
aGl1QHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgcHJvdmlkZXMgc3VwcG9ydCBy
dW5uaW5nIFZlY3RvciBpbiBrZXJuZWwgbW9kZS4KPiBBZGRpdGlvbmFsbHksIGtlcm5lbC1tb2Rl
IFZlY3RvciBjYW4gYmUgY29uZmlndXJlZCB0byBydW4gd2l0aG91dAo+IHR1cm5uaW5nIG9mZiBw
cmVlbXB0aW9uIG9uIGEgQ09ORklHX1BSRUVNUFQga2VybmVsLiBBbG9uZyB3aXRoIHRoZQo+IHN1
cG9ydCwgd2UgYWRkIFZlY3RvciBvcHRpbWl6ZWQgY29weV97dG8sZnJvbX1fdXNlci4gQW5kIHBy
b3ZpZGUgYQo+IHNpbXBsZSB0aHJlc2hvbGQgdG8gZGVjaWRlIHdoZW4gdG8gcnVuIHRoZSB2ZWN0
b3JpemVkIGZ1bmN0aW9ucy4KClsuLi5dCgo+IENoYW5nZWxvZyB2MTE6Cj4gIC0gVGhpcyBpcyBh
IHF1aWNrIHJlc3BpbiB0byBhZGRyZXNzIGJvb3QgZmFpbGluZyBvbiB1YnVudHUgYW5kIGFscGlu
ZS4KPiAgLSBQYXNzIHRoZSB1cGRhdGVkIGNvcHkgc2l6ZSB3aGVuIGNhbGxpbmcgc2NhbGFyIGZh
bGxiYWNrLgo+ICAtIFNraXAgc29tZSBieXRlcyBmb3Igc2NhbGFyIGZhbGxiYWNrIHdoZW4gZmF1
dGluZyBhdCB2c2U4LnYgd2l0aCBhCj4gICAgbm9uLXplcm8gJHZzdGFydC4gKEd1bykKPiAgLSBH
dWFyZCByaXNjdl92X3NldHVwX2N0eF9jYWNoZSgpIHdpdGggIGhhc192ZWN0b3IoKSBjaGVjay4K
CkZvciBjb252ZW5pZW5jZSwgaGVyZSdzIHRoZSBjb21wbGV0ZSBkaWZmIGZyb20gdjEwOgoKLS04
PC0tCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3ZlY3Rvci5jCmluZGV4IGY5NzY5NzAzZmQzOS4uNjcyN2QxZDNiOGYyIDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92
ZWN0b3IuYwpAQCAtNTMsNiArNTMsOSBAQCBpbnQgcmlzY3Zfdl9zZXR1cF92c2l6ZSh2b2lkKQoK
IHZvaWQgX19pbml0IHJpc2N2X3Zfc2V0dXBfY3R4X2NhY2hlKHZvaWQpCiB7CisgICAgaWYgKCFo
YXNfdmVjdG9yKCkpCisgICAgICAgIHJldHVybjsKKwogICAgIHJpc2N2X3ZfdXNlcl9jYWNoZXAg
PSBrbWVtX2NhY2hlX2NyZWF0ZV91c2VyY29weSgicmlzY3ZfdmVjdG9yX2N0eCIsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJpc2N2X3ZfdnNpemUsIDE2LCBTTEFCX1BBTklDLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAwLCByaXNjdl92X3ZzaXplLCBOVUxMKTsKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvbGliL3Jpc2N2X3ZfaGVscGVycy5jIGIvYXJjaC9yaXNjdi9saWIv
cmlzY3Zfdl9oZWxwZXJzLmMKaW5kZXggNmNhYzhmNGU2OWU5Li5iZTM4YTkzY2VkYWUgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvbGliL3Jpc2N2X3ZfaGVscGVycy5jCisrKyBiL2FyY2gvcmlzY3Yv
bGliL3Jpc2N2X3ZfaGVscGVycy5jCkBAIC0zMyw2ICszMyw3IEBAIGFzbWxpbmthZ2UgaW50IGVu
dGVyX3ZlY3Rvcl91c2VyY29weSh2b2lkICpkc3QsIHZvaWQKKnNyYywgc2l6ZV90IG4pCiAgICAg
ICAgIGNvcGllZCA9IG4gLSByZW1haW47CiAgICAgICAgIGRzdCArPSBjb3BpZWQ7CiAgICAgICAg
IHNyYyArPSBjb3BpZWQ7CisgICAgICAgIG4gPSByZW1haW47CiAgICAgICAgIGdvdG8gZmFsbGJh
Y2s7CiAgICAgfQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbGliL3VhY2Nlc3NfdmVjdG9yLlMg
Yi9hcmNoL3Jpc2N2L2xpYi91YWNjZXNzX3ZlY3Rvci5TCmluZGV4IDU2NjczOWY2MzMxYS4uNTFh
YjU1ODhlOWZmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2xpYi91YWNjZXNzX3ZlY3Rvci5TCisr
KyBiL2FyY2gvcmlzY3YvbGliL3VhY2Nlc3NfdmVjdG9yLlMKQEAgLTIzLDIyICsyMywzMSBAQAoK
IFNZTV9GVU5DX1NUQVJUKF9fYXNtX3ZlY3Rvcl91c2VyY29weSkKICAgICAvKiBFbmFibGUgYWNj
ZXNzIHRvIHVzZXIgbWVtb3J5ICovCi0gICAgbGkgdDYsIFNSX1NVTQotICAgIGNzcnMgQ1NSX1NU
QVRVUywgdDYKKyAgICBsaSAgICB0NiwgU1JfU1VNCisgICAgY3NycyAgICBDU1JfU1RBVFVTLCB0
NgoKIGxvb3A6CiAgICAgdnNldHZsaSBpVkwsIGlOdW0sIGU4LCBFTEVNX0xNVUxfU0VUVElORywg
dGEsIG1hCiAgICAgZml4dXAgdmxlOC52IHZEYXRhLCAocFNyYyksIDEwZgotICAgIGZpeHVwIHZz
ZTgudiB2RGF0YSwgKHBEc3QpLCAxMGYKICAgICBzdWIgaU51bSwgaU51bSwgaVZMCiAgICAgYWRk
IHBTcmMsIHBTcmMsIGlWTAorICAgIGZpeHVwIHZzZTgudiB2RGF0YSwgKHBEc3QpLCAxMWYKICAg
ICBhZGQgcERzdCwgcERzdCwgaVZMCiAgICAgYm5leiBpTnVtLCBsb29wCgotICAgIC8qIEV4Y2Vw
dGlvbiBmaXh1cCBjb2RlLiBJdCdzIHRoZSBzYW1lIGFzIG5vcm1hbCBleGl0ICovCisgICAgLyog
RXhjZXB0aW9uIGZpeHVwIGZvciB2ZWN0b3IgbG9hZCBpcyBzaGFyZWQgd2l0aCBub3JtYWwgZXhp
dCAqLwogMTA6CiAgICAgLyogRGlzYWJsZSBhY2Nlc3MgdG8gdXNlciBtZW1vcnkgKi8KICAgICBj
c3JjICAgIENTUl9TVEFUVVMsIHQ2CiAgICAgbXYgICAgYTAsIGlOdW0KICAgICByZXQKKworICAg
IC8qIEV4Y2VwdGlvbiBmaXh1cCBjb2RlIGZvciB2ZWN0b3Igc3RvcmUuICovCisxMToKKyAgICAv
KiBVbmRvIHRoZSBzdWJ0cmFjdGlvbiBhZnRlciB2bGU4LnYgKi8KKyAgICBhZGQgICAgaU51bSwg
aU51bSwgaVZMCisgICAgLyogTWFrZSBzdXJlIHRoZSBzY2FsYXIgZmFsbGJhY2sgc2tpcCBhbHJl
YWR5IHByb2Nlc3NlZCBieXRlcyAqLworICAgIGNzcnIgICAgdDIsIENTUl9WU1RBUlQKKyAgICBz
dWIgICAgaU51bSwgaU51bSwgdDIKKyAgICBqICAgIDEwYgogU1lNX0ZVTkNfRU5EKF9fYXNtX3Zl
Y3Rvcl91c2VyY29weSkKLS04PC0tCgpPbmUgbml0IHRoYXQgc3RpY2tzIG91dCBpcyB0aGUgYXNz
ZW1ibHkgYWxpZ25tZW50IGZvcgpfX2FzbV92ZWN0b3JfdXNlcmNvcHksIHdoZXJlIHRhYi9ub3Rh
YiBsYXlvdXRzIGFyZSBtaXhlZC4KCkknbGwga2ljayBvZmYgYSBmdWxsIGJ1aWxkL2Jvb3Qgd2l0
aCB0aGUgdjExIQoKCkNoZWVycywKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
