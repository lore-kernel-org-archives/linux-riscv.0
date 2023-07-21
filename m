Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C43EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 16:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DaGBGahWHQWsRnYIubOfMIv6leUa77BStQL7t4CWY4c=; b=2pI+dhwsfkk/bD
	XuUsXO+yoPeEQKkWBIB4G7C2DHqHrNcaCjoBN6ECchrLpdHIrSPzDGetO++8I5Su9g/0+P/G3GUZD
	EOyw1u8w0xPFz9fYKbFsmFbSh8I+IT7bcWCrRDDPUWIKOwr5B9bWoj4+k72EP2eXOfecQWbnbGHkW
	eqnzGarD4wBWAPK3RzZqy2YMPzd5sO34zmNd2gVznm5WWVQsHBYlPs0C1eovTD9pGPZU0j6+xppnS
	nvI63hdnAY7c12DKWQfoQ4EmDiZZ6QJMJYX0cnhjGFkfpW51Z0PW48LDPqXcBeFlDw6oIqIhDrx0L
	JbStgVIxcN0aiylRmygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMspN-00EYqa-2o;
	Fri, 21 Jul 2023 16:18:01 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMspK-00EYol-1r
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 16:18:00 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 81F463F230
	for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 16:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689956269;
	bh=wgUHzoDXTjjtOlC3+rEyxVrID6ad/R99TbcI30d00dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=qvFNlSZYSvdlUkaxrsTfwhKVonIBiYwevNXe5Ot4PyMHCoMDZBGH3fywIfYKxs8rQ
	 HE8iJqCec5Be8+55z2HpqUR4vPfIRr5NsNecre9Z1SKAWgrJ6C0AS1kuOkmRmlvXPQ
	 q33THNuX/x+WlNxXgdc2hWPcL/4g/hqu3dQj0TmYK3r8YXVeSsvU42iuAGhWoIGKI5
	 0s69fnOHjGYgOTp5JNvHB2iQHOY2NmmzMCND++LVqgi1HIehI68Vn9b9ufIZQfE7g7
	 VhYqYoAPdtZo0ocLK47bOa/MQEfW95WJOtu8ki/uyt+kL0N3w+nPCVzL47bbih7CAH
	 ++AYJUw6oHO/g==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-403b3f31382so24837231cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 09:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689956267; x=1690561067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgUHzoDXTjjtOlC3+rEyxVrID6ad/R99TbcI30d00dI=;
        b=FFKfi4NPIrtHkvmTBbSIz4+nohxQieapZVlozHYhrHn2VyiyyrHo7IgQtZGi9CYAFw
         95MN3rkviV4QhxvUASAIHghDYiXlO0FM+Ss1CnE/LJhsc2ozagZSvWt66O1ubrWCBRgt
         4Ip+eHLpHFsCflAL4UbnmE4BJboS4c9bCy1Zd1DsE8sHl5tVUOhU1xs0zkfdGwOdOek2
         l9J5JNDTHFG9+PT7ywvoESDExkPE+zAch5PABY+DUrxbpZ46Bf8ulRHYJkOja5Z6rR+A
         cnhoXKwkvZ0P6r8DfElYT2wNgIjuYAYYfSoEKRk2e/8BuGhbcgYudyjru/LmRnTHwUsw
         F4wg==
X-Gm-Message-State: ABy/qLaVV2ptmJ+eNJzFNKCoZqYHhapM/Fat9DghRZsNCWT6U+BFE0SS
	i7l5gPlkD/eHVJS0qZtPR9+7g4Kh+TPzwAiI01kaLyu1Z4zK5HMb6kNFAHSO6E12/Ta1Pbtynls
	QJVE0ekajcgTR83Wo2q6t54Hpb3Zb7Nfr429PQbAwUxogxYr954Rtf3dbuJ7V2w==
X-Received: by 2002:a05:622a:1a10:b0:405:464d:5bb0 with SMTP id f16-20020a05622a1a1000b00405464d5bb0mr632050qtb.32.1689956267743;
        Fri, 21 Jul 2023 09:17:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFsCtZK/fs1CfxrSe/Xx436U1H1O2FZ1chxm9c/Euubsm64CDfYfu3uIBllDzWDiITFbRjGF/uMcbffo5sTip0=
X-Received: by 2002:a05:622a:1a10:b0:405:464d:5bb0 with SMTP id
 f16-20020a05622a1a1000b00405464d5bb0mr631956qtb.32.1689956266458; Fri, 21 Jul
 2023 09:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230720140348.4716-1-CoelacanthusHex@gmail.com>
In-Reply-To: <20230720140348.4716-1-CoelacanthusHex@gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 21 Jul 2023 18:17:30 +0200
Message-ID: <CAJM55Z83u+aEVYAA0+9PEXK6hbre2=FS_=SDdxQ1uQN7L2PjkA@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: entry: set a0 = -ENOSYS only when syscall != -1
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andreas Schwab <schwab@suse.de>, 
	David Laight <David.Laight@aculab.com>, Felix Yan <felixonmars@archlinux.org>, 
	Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_091758_968514_B128571E 
X-CRM114-Status: GOOD (  22.77  )
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

T24gVGh1LCAyMCBKdWwgMjAyMyBhdCAxNjowNSwgQ2VsZXN0ZSBMaXUgPGNvZWxhY2FudGh1c2hl
eEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2hlbiB3ZSB0ZXN0IHNlY2NvbXAgd2l0aCA2LjQga2Vy
bmVsLCB3ZSBmb3VuZCBlcnJubyBoYXMgd3JvbmcgdmFsdWUuCj4gSWYgd2UgZGVueSBORVRMSU5L
X0FVRElUIHdpdGggRUFGTk9TVVBQT1JULCBhZnRlciBmMGJkZGY1MDU4NmQsIHdlIHdpbGwKPiBn
ZXQgRU5PU1lTIGluc3RlYWQuIFdlIGdvdCBzYW1lIHJlc3VsdCB3aXRoIGNvbW1pdCA5YzI1OThk
NDM1MTAgKCJyaXNjdjogZW50cnk6Cj4gU2F2ZSBhMCBwcmlvciBzeXNjYWxsX2VudGVyX2Zyb21f
dXNlcl9tb2RlKCkiKS4KPgo+IEFmdGVyIGFuYWx5c2luZyBjb2RlLCB3ZSB0aGluayB0aGF0IHJl
Z3MtPmEwID0gLUVOT1NZUyBzaG91bGQgb25seSBiZSBleGVjdXRlZAo+IHdoZW4gc3lzY2FsbCAh
PSAtMSBJbiBfX3NlY2NvbXBfZmlsdGVyLCB3aGVuIHNlY2NvbXAgcmVqZWN0ZWQgdGhpcyBzeXNj
YWxsIHdpdGgKPiBzcGVjaWZpZWQgZXJybm8sIHRoZXkgd2lsbCBzZXQgYTAgdG8gcmV0dXJuIG51
bWJlciBhcyBzeXNjYWxsIEFCSSwgYW5kIHRoZW4KPiByZXR1cm4gLTEuIFRoaXMgcmV0dXJuIG51
bWJlciBpcyBmaW5hbGx5IHBhc3MgYXMgcmV0dXJuIG51bWJlciBvZgo+IHN5c2NhbGxfZW50ZXJf
ZnJvbV91c2VyX21vZGUsIGFuZCB0aGVuIGlzIGNvbXBhcmVkIHdpdGggTlJfc3lzY2FsbHMgYWZ0
ZXIKPiBjb252ZXJ0ZWQgdG8gdWxvbmcgKHNvIGl0IHdpbGwgYmUgVUxPTkdfTUFYKS4gVGhlIGNv
bmRpdGlvbgo+IHN5c2NhbGwgPCBOUl9zeXNjYWxscyB3aWxsIGFsd2F5cyBiZSBmYWxzZSwgc28g
cmVncy0+YTAgPSAtRU5PU1lTIGlzIGFsd2F5cwo+IGV4ZWN1dGVkLiBJdCBjb3ZlcmVkIGEwIHNl
dCBieSBzZWNjb21wLCBzbyB3ZSBhbHdheXMgZ2V0IEVOT1NZUyB3aGVuIG1hdGNoCj4gc2VjY29t
cCBSRVRfRVJSTk8gcnVsZS4KPgo+IEZpeGVzOiBmMGJkZGY1MDU4NmQgKCJyaXNjdjogZW50cnk6
IENvbnZlcnQgdG8gZ2VuZXJpYyBlbnRyeSIpCj4gUmVwb3J0ZWQtYnk6IEZlbGl4IFlhbiA8ZmVs
aXhvbm1hcnNAYXJjaGxpbnV4Lm9yZz4KPiBDby1kZXZlbG9wZWQtYnk6IFJ1aXpoZSBQYW4gPGMx
NDEwMjhAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJ1aXpoZSBQYW4gPGMxNDEwMjhAZ21h
aWwuY29tPgo+IENvLWRldmVsb3BlZC1ieTogU2hpcWkgWmhhbmcgPHNoaXFpQGlzcmMuaXNjYXMu
YWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogU2hpcWkgWmhhbmcgPHNoaXFpQGlzcmMuaXNjYXMuYWMu
Y24+Cj4gU2lnbmVkLW9mZi1ieTogQ2VsZXN0ZSBMaXUgPENvZWxhY2FudGh1c0hleEBnbWFpbC5j
b20+Cj4gVGVzdGVkLWJ5OiBGZWxpeCBZYW4gPGZlbGl4b25tYXJzQGFyY2hsaW51eC5vcmc+CgpX
aXRoIHRoaXMgcGF0Y2ggSSBjYW4gdXNlIGdyb3VwbW9kLCBncm91cGFkZCwgdXNlcm1vZCwgdXNl
cmFkZCBldGMuCmluc2lkZSBzeXN0ZW1kLW5zcGF3biBhZ2Fpbi4gVGhhbmtzIQpUZXN0ZWQtYnk6
IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29t
PgoKPiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IFJl
dmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiAtLS0KPgo+IHYzIC0+IHY0
OiB1c2UgbG9uZyBpbnN0ZWFkIG9mIHVsb25nIHRvIHJlZHVjZSB0eXBlIGNhc3QgYW5kIGF2b2lk
Cj4gICAgICAgICAgIGltcGxlbWVudGF0aW9uLWRlZmluZWQgYmVoYXZpb3IsIGFuZCBtYWtlIHRo
ZSBqdWRnbWVudCBvZiBzeXNjYWxsCj4gICAgICAgICAgIGludmFsaWQgbW9yZSBleHBsaWNpdAo+
IHYyIC0+IHYzOiB1c2UgaWYtc3RhdGVtZW50IGluc3RlYWQgb2Ygc2V0IGRlZmF1bHQgdmFsdWUs
Cj4gICAgICAgICAgIGNsYXJpZnkgdGhlIHR5cGUgb2Ygc3lzY2FsbAo+IHYxIC0+IHYyOiBhZGRl
ZCBleHBsYW5hdGlvbiBvbiB3aHkgYWx3YXlzIGdvdCBFTk9TWVMKPgo+ICBhcmNoL3Jpc2N2L2tl
cm5lbC90cmFwcy5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
cy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IGluZGV4IGY5MTBkZmNjYmY1ZDIuLjcy
OWY3OWM5N2UyYmYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBAQCAtMjk3LDcgKzI5Nyw3IEBAIGFzbWxp
bmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9icmVhayhzdHJ1Y3Qg
cHRfcmVncyAqcmVncykKPiAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9p
ZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIHsKPiAgICAgICAgIGlm
ICh1c2VyX21vZGUocmVncykpIHsKPiAtICAgICAgICAgICAgICAgdWxvbmcgc3lzY2FsbCA9IHJl
Z3MtPmE3Owo+ICsgICAgICAgICAgICAgICBsb25nIHN5c2NhbGwgPSByZWdzLT5hNzsKPgo+ICAg
ICAgICAgICAgICAgICByZWdzLT5lcGMgKz0gNDsKPiAgICAgICAgICAgICAgICAgcmVncy0+b3Jp
Z19hMCA9IHJlZ3MtPmEwOwo+IEBAIC0zMDYsOSArMzA2LDkgQEAgYXNtbGlua2FnZSBfX3Zpc2li
bGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCj4KPiAgICAgICAgICAgICAgICAgc3lzY2FsbCA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2Vy
X21vZGUocmVncywgc3lzY2FsbCk7Cj4KPiAtICAgICAgICAgICAgICAgaWYgKHN5c2NhbGwgPCBO
Ul9zeXNjYWxscykKPiArICAgICAgICAgICAgICAgaWYgKHN5c2NhbGwgPj0gMCAmJiBzeXNjYWxs
IDwgTlJfc3lzY2FsbHMpCj4gICAgICAgICAgICAgICAgICAgICAgICAgc3lzY2FsbF9oYW5kbGVy
KHJlZ3MsIHN5c2NhbGwpOwo+IC0gICAgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAg
IGVsc2UgaWYgKHN5c2NhbGwgIT0gLTEpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVncy0+
YTAgPSAtRU5PU1lTOwo+Cj4gICAgICAgICAgICAgICAgIHN5c2NhbGxfZXhpdF90b191c2VyX21v
ZGUocmVncyk7Cj4gLS0KPiAyLjQxLjAKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
