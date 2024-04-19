Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20D1C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 06:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXoYqJSVKKvqydJb2Lp8XE/eGiqSF5iW7N9b1oWtXbU=; b=vNIGfrijDF5ejA
	fp2q8tRLenPUTDoo1Hq7vuX9DsOwjCQXN984M9pAFwEkSVulAXoStiYaTWtCQy7KYixfXbSocvJ73
	yUYv85TvvP9ei3JtOGKqx8bMP5oanKgcY7kEbsbmnEdumT/wg7V6Z1fItEbQ7nXw6+ewNUn4xQhum
	3gcQrjG6GraenefYjo9kdRJxS4J9MZrO7dx0OfE1IGqzzfZHletYNSC2P9TZO6GiHqkm0WgNidggK
	4twIw9N8+rZycVjwuwzaUcKfBjiXbTgxB4DjmWe0tiInQsUrpeidAzxWCRQcv3fj6H9I4O29gITi1
	VVg2dK2iQMfnTKsek5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxhRH-00000004Y3v-2UbP;
	Fri, 19 Apr 2024 06:09:35 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxhRA-00000004Xzg-2NXj
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 06:09:34 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2352cc0b076so990652fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 23:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713506962; x=1714111762; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kErwDd2As93lkNVtXxpSNeg6N1vaOM5yfF2rI/SIas=;
        b=RBufCJMVOkivKNCNrdLZEP5o138GtnrJ25NPxi1nmUrykbiCe+lTWvbf5chj8w3jUz
         SroOVQIrxCyAdKd7dU5z6KbjSSAVdfemiOwxEEzkJkc9J/R5xwGsvLTfwZqIonezH5JF
         59aJkkC+bGz+BNUxW0o80/8GduufPlRVYJZ2nhfryepObi8N46sg8poDAX4VT5hMv6Iq
         JKHe5nGQbt6hUhMPGNAsVpDM4FA7BndAwo9MDZNFUpnbY9WHjX7LzwayKyVSpZEOyFLU
         1PucJ03NB3tVc54wx255yNRsIFN26T7THBiwytNJljNeuw0olJfquoTwhjTodZeoyqQa
         IYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713506962; x=1714111762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kErwDd2As93lkNVtXxpSNeg6N1vaOM5yfF2rI/SIas=;
        b=W8F/+NgmIaa08S/4mWOGsUjklEnD1luxbRTQRvBGAmuHCcra1zP8c1U0kEoIi7axbo
         uVP6x2qLxWAlMjiTiCJzLsnIZ/1jN+uu3RzB/UXun+sECs1MT50UZJzq+SwOzCCJA2JP
         tXSXETeTKmR6dGkluhImDA1VPOR2ImXycCkyGtauDp7nAYCSAgvhhv6rvVHbkgluW6RY
         4SGww2qrd04RVS1I5aJxbd9h443kRXOjWyV6V4QeYQaSnlcR8hyE07SGa/xlCIdqa/un
         nBrWb9n+xriT/1F6uEMU2aXBQ9ddfNRTWuSF9cGCLq9rDkvcMtHjCsjQyxt6krGrUzMs
         Vn6w==
X-Forwarded-Encrypted: i=1; AJvYcCXB3mvX9Wzv+Ga/mdtof3Ing5LeVJn3leON5vH2J6VANiDZT0bl6H4t+lj+qMn1bfWMbDeM0ZddllJ0N4PapUPlsH6GHTEtLwgOt/2BGX+5
X-Gm-Message-State: AOJu0YyhT4A01nYoaosJL2GBNnIlXj5lD+eMCBJ2gYAsICRBGNXbnpVc
	bTjM0zB41g23aDMaLIU814crF/bmApyAAl83Gm73MKxDoiJA6ofRk9YYgCJ1Jc2xBXzo28Qik9D
	+Jsjq3O1uRr9yBg34bazZqEy4QQjR+fVIxP8kng==
X-Google-Smtp-Source: AGHT+IFiJTLnnWExlyf1jzE8UHpYFqX2X9xmHGVJevF5AC5Z2o5R2kV7+PY0ghjCFO++qBKYcDqZsz70DYQOwrd6nAc=
X-Received: by 2002:a05:6870:968e:b0:22e:7d06:d489 with SMTP id
 o14-20020a056870968e00b0022e7d06d489mr1319197oaq.19.1713506961126; Thu, 18
 Apr 2024 23:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com> <20240412-zve-detection-v4-2-e0c45bb6b253@sifive.com>
In-Reply-To: <20240412-zve-detection-v4-2-e0c45bb6b253@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 19 Apr 2024 14:09:10 +0800
Message-ID: <CAEEQ3wn97huwhpvTJH7kD2R=xagNRWd=YcoYwGOU17BRYNopgw@mail.gmail.com>
Subject: Re: [External] [PATCH v4 2/9] riscv: smp: fail booting up smp if
 inconsistent vlen is detected
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_230928_691383_DB30A662 
X-CRM114-Status: GOOD (  23.54  )
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

SGkgQW5keSwKCk9uIEZyaSwgQXByIDEyLCAyMDI0IGF0IDI6NTDigK9QTSBBbmR5IENoaXUgPGFu
ZHkuY2hpdUBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSB3ZSBvbmx5IHN1cHBvcnQg
VmVjdG9yIGZvciBTTVAgcGxhdGZvcm1zLCB0aGF0IGlzLCBhbGwgU01QCj4gY29yZXMgaGF2ZSB0
aGUgc2FtZSB2bGVuYi4gSWYgd2UgaGFwcGVuIHRvIGRldGVjdCBhIG1pc21hdGNoaW5nIHZsZW4s
IGl0Cj4gaXMgYmV0dGVyIHRvIGp1c3QgZmFpbCBib290dGluZyBpdCB1cCB0byBwcmV2ZW50IGZ1
cnRoZXIgcmFjZS9zY2hlZHVsaW5nCj4gaXNzdWVzLgo+Cj4gQWxzbywgbW92ZSAuTHNlY29uZGFy
eV9wYXJrIGZvcndhcmQgYW5kIGNoYWdlIGB0YWlsIHNtcF9jYWxsaW5gIGludG8gYQo+IHJlZ3Vs
YXIgY2FsbCBpbiB0aGUgZWFybHkgYXNzZW1ibHkuIFNvIGEgY29yZSB3b3VsZCBiZSBwYXJrZWQg
cmlnaHQKPiBhZnRlciBhIHJldHVybiBmcm9tIHNtcF9jYWxsaW4uIE5vdGUgdGhhdCBhIHN1Y2Nl
c3NmdWwgc21wX2NhbGxpbgo+IGRvZXMgbm90IHJldHVybi4KPgo+IEZpeGVzOiA3MDE3ODU4ZWIy
ZDcgKCJyaXNjdjogSW50cm9kdWNlIHJpc2N2X3ZfdnNpemUgdG8gcmVjb3JkIHNpemUgb2YgVmVj
dG9yIGNvbnRleHQiKQo+IFJlcG9ydGVkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlz
Y3YvMjAyNDAyMjgtdmljaW5pdHktY29ybnN0YWxrLTRiOGViNWZlNTczMEBzcHVkLwo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4gLS0tCj4gQ2hhbmdl
bG9nIHY0Ogo+ICAtIHVwZGF0ZSBjb21tZW50IGFsc28gaW4gdGhlIGFzc2VtYmx5IGNvZGUgKFl1
bmh1aSkKPiBDaGFuZ2Vsb2cgdjI6Cj4gIC0gdXBkYXRlIGNvbW1pdCBtZXNzYWdlIHRvIGV4cGxh
aW4gYXNtIGNvZGUgY2hhbmdlIChDb25vcikKPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvaGVh
ZC5TICAgIHwgMTkgKysrKysrKysrKysrLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBi
b290LmMgfCAxNCArKysrKysrKystLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlv
bnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L2hlYWQuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+IGluZGV4IDQyMzZhNjljMzVjYi4u
YTAwZjc1MjNjYjkxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+IEBAIC0xNjUsOSArMTY1LDIwIEBAIHNlY29u
ZGFyeV9zdGFydF9zYmk6Cj4gICNlbmRpZgo+ICAgICAgICAgY2FsbCAuTHNldHVwX3RyYXBfdmVj
dG9yCj4gICAgICAgICBzY3NfbG9hZF9jdXJyZW50Cj4gLSAgICAgICB0YWlsIHNtcF9jYWxsaW4K
PiArICAgICAgIGNhbGwgc21wX2NhbGxpbgo+ICAjZW5kaWYgLyogQ09ORklHX1NNUCAqLwo+Cj4g
Ky5hbGlnbiAyCj4gKy5Mc2Vjb25kYXJ5X3Bhcms6Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICog
UGFyayB0aGlzIGhhcnQgaWYgd2U6Cj4gKyAgICAgICAgKiAgLSBoYXZlIHRvbyBtYW55IGhhcnRz
IG9uIENPTkZJR19SSVNDVl9CT09UX1NQSU5XQUlUCj4gKyAgICAgICAgKiAgLSByZWNlaXZlIGFu
IGVhcmx5IHRyYXAsIGJlZm9yZSBzZXR1cF90cmFwX3ZlY3RvciBmaW5pc2hlZAo+ICsgICAgICAg
ICogIC0gZmFpbCBpbiBzbXBfY2FsbGluKCksIGFzIGEgc3VjY2Vzc2Z1bCBvbmUgd291bGRuJ3Qg
cmV0dXJuCj4gKyAgICAgICAgKi8KPiArICAgICAgIHdmaQo+ICsgICAgICAgaiAuTHNlY29uZGFy
eV9wYXJrCj4gKwo+ICAuYWxpZ24gMgo+ICAuTHNldHVwX3RyYXBfdmVjdG9yOgo+ICAgICAgICAg
LyogU2V0IHRyYXAgdmVjdG9yIHRvIGV4Y2VwdGlvbiBoYW5kbGVyICovCj4gQEAgLTE4MSwxMiAr
MTkyLDYgQEAgc2Vjb25kYXJ5X3N0YXJ0X3NiaToKPiAgICAgICAgIGNzcncgQ1NSX1NDUkFUQ0gs
IHplcm8KPiAgICAgICAgIHJldAo+Cj4gLS5hbGlnbiAyCj4gLS5Mc2Vjb25kYXJ5X3Bhcms6Cj4g
LSAgICAgICAvKiBXZSBsYWNrIFNNUCBzdXBwb3J0IG9yIGhhdmUgdG9vIG1hbnkgaGFydHMsIHNv
IHBhcmsgdGhpcyBoYXJ0ICovCj4gLSAgICAgICB3ZmkKPiAtICAgICAgIGogLkxzZWNvbmRhcnlf
cGFyawo+IC0KPiAgU1lNX0NPREVfRU5EKF9zdGFydCkKPgo+ICBTWU1fQ09ERV9TVEFSVChfc3Rh
cnRfa2VybmVsKQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiBpbmRleCBkNDEwOTBmYzMyMDMuLjY3MzQzN2Nj
YzEzZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiBAQCAtMjE0LDYgKzIxNCwxNSBAQCBhc21saW5r
YWdlIF9fdmlzaWJsZSB2b2lkIHNtcF9jYWxsaW4odm9pZCkKPiAgICAgICAgIHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tID0gJmluaXRfbW07Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgY3Vycl9jcHVpZCA9
IHNtcF9wcm9jZXNzb3JfaWQoKTsKPgo+ICsgICAgICAgaWYgKGhhc192ZWN0b3IoKSkgewo+ICsg
ICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBSZXR1cm4gYXMgZWFybHkgYXMg
cG9zc2libGUgc28gdGhlIGhhcnQgd2l0aCBhIG1pc21hdGNoaW5nCj4gKyAgICAgICAgICAgICAg
ICAqIHZsZW4gd29uJ3QgYm9vdC4KPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAg
ICAgIGlmIChyaXNjdl92X3NldHVwX3ZzaXplKCkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIC8qIEFsbCBrZXJuZWwgdGhyZWFkcyBz
aGFyZSB0aGUgc2FtZSBtbSBjb250ZXh0LiAgKi8KPiAgICAgICAgIG1tZ3JhYihtbSk7Cj4gICAg
ICAgICBjdXJyZW50LT5hY3RpdmVfbW0gPSBtbTsKPiBAQCAtMjI2LDExICsyMzUsNiBAQCBhc21s
aW5rYWdlIF9fdmlzaWJsZSB2b2lkIHNtcF9jYWxsaW4odm9pZCkKPiAgICAgICAgIG51bWFfYWRk
X2NwdShjdXJyX2NwdWlkKTsKPiAgICAgICAgIHNldF9jcHVfb25saW5lKGN1cnJfY3B1aWQsIDEp
Owo+Cj4gLSAgICAgICBpZiAoaGFzX3ZlY3RvcigpKSB7Cj4gLSAgICAgICAgICAgICAgIGlmIChy
aXNjdl92X3NldHVwX3ZzaXplKCkpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgZWxmX2h3Y2Fw
ICY9IH5DT01QQVRfSFdDQVBfSVNBX1Y7Cj4gLSAgICAgICB9Cj4gLQo+ICAgICAgICAgcmlzY3Zf
dXNlcl9pc2FfZW5hYmxlKCk7Cj4KPiAgICAgICAgIC8qCj4KPiAtLQo+IDIuNDQuMC5yYzIKPgo+
CgpSZXZpZXdlZC1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+CgoKVGhh
bmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
