Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BBDC001DB
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 02:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ThkuP8iokPUG4J1Pz3OiuiCCinyHYIhVbSXyCyFfETo=; b=QUcwrSYEWmY2Rd
	ztU61/zOwJSSlM/Ccz1aud2rhTaRY7zhEVV6rlPwmmdKtsmb93D/JK3tODXa7l3H+J3qdpZSU+y4o
	kWyjKRQEetqKVJczg61jCtpVLbIMIaxlaKrowDPQdQYl3MhbWO//rLQQsLKXpPzuZw7IjDzw4VMSn
	OjRlkGVMFu034XiNpShDn1t/YlaKQQK2MAomverK5W7Guc4fzK72HZkAlK2yy1akvoIv9vuOHxmn7
	UjyW5Xp6qBARuPN44K1pM2Urk8joOy7DJ7bfvbvw+LwC6KcMBCatEBdRH0Px5Sy2LLlXRzHO0DYeB
	mcqGXQdHBXXeV5Gqc62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYeh-003s0p-0b;
	Wed, 09 Aug 2023 02:10:35 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYee-003rzy-1K
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 02:10:33 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-76d1c58ace6so22610085a.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 19:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691547030; x=1692151830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EilzzrhESGX6VzHKBYdGUjOlrbXMTnQwoUfi/ZyvcEM=;
        b=Yp2CYl8+W28LK+/PpQfZM1HdFk6CSkRhywi6HQO79D3WDRhoI6CMcBk3yQoXxseVt4
         DObH0Za4N0euVfh7OK+tgxzbLELNPsbKBUskqPge+fsCbSMAZesWUp7fFOlbHM2KhtNl
         La3Vh8+PdZDwvrV4b246txvap3fviXgCNZ5w6tAZKyaHPX4iynIZT6u9toGQdLeQkAK6
         AJFLXsTXX3eR+Ju5dsJzN/hPU+ZOGLTI76KOAbSJCD49qTh0B3a0CSSIEU/Jvauh9gIp
         33HWpglxuSxAM2PTZ9NirC9Dz3zzcKTzPhIh/JBALS8b+f5ESkp9ow2lxO9b0XIWgEzQ
         sriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691547030; x=1692151830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EilzzrhESGX6VzHKBYdGUjOlrbXMTnQwoUfi/ZyvcEM=;
        b=CQbjfxnIsOwXqFw4hFq71S4OEp4P+a9bbSFkPQbmwnIzPyCl5yAxDwRb7zhnkWF/Gl
         A1nNSsLrxfIBGUAmTItx5VzBsG1ZHyPV2ouJvNaA8ul5Gbg5BFOTUrQ4j2pp/bBuuWa/
         nwuvKNw1HtM8SEiA6FIMZgDT/V3gyUdoiAL9CSmiWidqSHEVy+gegjaS0HwLom0SyxKi
         cImgXNBCRm4ygvfw1biA8hZ2A6G0ho4nxTbBcnOwJV19tmrFX9gUqMpC2XdkshlmdFhm
         W6P9D2z0lBsQhyBPOzDtCG9WJUcItl152PYXGU7ppTXZ4PC7Gk7zPtJ+Lx6S3ATIdFsE
         fRdg==
X-Gm-Message-State: AOJu0Yx3DWY1MFBn69Z/uYxeL77vfzzCAnbEkCXORyHfYrR2UMf7V6dK
	6V2qoclvgybLeTCaFx8OeTf36fCuItpg9/iZ17wZaR9jIOvg4ItUeHArPQ==
X-Google-Smtp-Source: AGHT+IHL5MiHhnfOrGlXbnpKj4kVQi9XXq0Y0EGJ+FxK+XGOaRJbYzS4AhakRm3A1CM2YklVkOxLZS1M56pHfxoySxo=
X-Received: by 2002:a05:6214:f01:b0:63c:913f:2b18 with SMTP id
 gw1-20020a0562140f0100b0063c913f2b18mr16432596qvb.2.1691547030277; Tue, 08
 Aug 2023 19:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230808072625.2109564-1-nick.hu@sifive.com> <12c1e981-b664-b80c-d0df-7e7a098e32b1@codethink.co.uk>
In-Reply-To: <12c1e981-b664-b80c-d0df-7e7a098e32b1@codethink.co.uk>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 9 Aug 2023 10:10:19 +0800
Message-ID: <CAKddAkDBQSTf1Z9QDUghmV8GoyuuUYfz+T+rJPoMZ2qtd=TGfQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] serial: sifive: Add suspend and resume operations
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: zong.li@sifive.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_191032_485919_10CEA2B2 
X-CRM114-Status: GOOD (  26.37  )
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

SGkgQmVuCgoKCk9uIFR1ZSwgQXVnIDgsIDIwMjMgYXQgNDo0N+KAr1BNIEJlbiBEb29rcyA8YmVu
LmRvb2tzQGNvZGV0aGluay5jby51az4gd3JvdGU6Cj4KPiBPbiAwOC8wOC8yMDIzIDA4OjI2LCBO
aWNrIEh1IHdyb3RlOgo+ID4gSWYgdGhlIFNpZml2ZSBVYXJ0IGlzIG5vdCB1c2VkIGFzIHRoZSB3
YWtlIHVwIHNvdXJjZSwgc3VzcGVuZCB0aGUgdWFydAo+ID4gYmVmb3JlIHRoZSBzeXN0ZW0gZW50
ZXIgdGhlIHN1c3BlbmQgc3RhdGUgdG8gcHJldmVudCBpdCB3b2tlbiB1cCBieQo+ID4gdW5leHBl
Y3RlZCB1YXJ0IGludGVycnVwdC4gUmVzdW1lIHRoZSB1YXJ0IG9uY2UgdGhlIHN5c3RlbSB3b2tl
biB1cC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+
Cj4KPiBeIFRoaXMgc2hvdWxkIGJlIFJldmlld2VkLWJ5LCBhcyBJIGRpZCByZXZpZXcgb24gdGhp
cyBlYXJsaWVyLgo+CkknbGwgY29ycmVjdCBpdCBpbiBWMgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMv
dHR5L3NlcmlhbC9zaWZpdmUuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYwo+
ID4gaW5kZXggYTE5ZGI0OTMyN2UyLi44Nzk5NGNiNjkwMDcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL3R0eS9zZXJpYWwvc2lmaXZlLmMKPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaWZp
dmUuYwo+ID4gQEAgLTEwMjIsNiArMTAyMiwzMSBAQCBzdGF0aWMgaW50IHNpZml2ZV9zZXJpYWxf
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKPiA+ICAgICAgIHJldHVybiAwOwo+
ID4gICB9Cj4gPgo+ID4gK3N0YXRpYyBpbnQgc2lmaXZlX3NlcmlhbF9zdXNwZW5kKHN0cnVjdCBk
ZXZpY2UgKmRldikKPiA+ICt7Cj4gPiArICAgICBpbnQgcmV0ID0gMDsKPiA+ICsgICAgIHN0cnVj
dCBzaWZpdmVfc2VyaWFsX3BvcnQgKnNzcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+Cj4gTWlu
b3IgYW5ueW9uYW5jZSBpcyBvcmRlcmluZyBvZiBzc3AgYW5kIHJldCwgSSB0aGluayB0aGUgc2hv
d3J0ZXIgb25lCj4gbGFzdCBpcyB0aGUgbmljZXN0IGxvb2tpbmcuCj4KPiA+ICsgICAgIGlmIChz
c3AgJiYgc3NwLT5wb3J0LnR5cGUgIT0gUE9SVF9VTktOT1dOKQo+ID4gKyAgICAgICAgICAgICBy
ZXQgPSB1YXJ0X3N1c3BlbmRfcG9ydCgmc2lmaXZlX3NlcmlhbF91YXJ0X2RyaXZlciwgJnNzcC0+
cG9ydCk7Cj4KPiBEbyB3ZSByZWFsbHkgbmVlZCBhIHRlc3QgZm9yIHNzcCBiZWluZyB2YWxpZCBp
ZiB0aGUgZGV2aWNlIGlzIGJvdW5kLgo+IE5vdCBzdXJlIGlmIHRoZSBwb3J0LnR5cGUgaXMgYWxz
byB1c2VmdWw/Cj4KWW91IGFyZSByaWdodC4gVGhpcyBtaWdodCBiZSBhbiB1bm5lY2Vzc2FyeSBj
aGVjay4KVGhlIHNzcCBpcyBib3VuZCBpbiB0aGUgcHJvYmUgZnVuY3Rpb24gYW5kIHRoZSBQT1JU
X1VOS05PV04gb25seSBiZQpzZXQgd2hlbiB3ZSBkbyB0aGUgc2lmaXZlX3NlcmlhbF9yZW1vdmUo
KS4KQW5kIGZvciB0aGUgb3JkZXJpbmcgb2YgcmV0LCBXZSBkb24ndCBuZWVkIHRoZSByZXQgaWYg
d2UgbW92ZSB0aGUgY2hlY2suCldlIGNhbiBqdXN0IHJldHVybiB1YXJ0X3N1c3BlbmRfcG9ydCgm
c2lmaXZlX3NlcmlhbF91YXJ0X2RyaXZlciwgJnNzcC0+cG9ydCk7CgpXaWxsIGNvcnJlY3QgaXQg
aW4gVjIuCj4gPiArICAgICByZXR1cm4gcmV0Owo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50
IHNpZml2ZV9zZXJpYWxfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICt7Cj4gPiArICAg
ICBpbnQgcmV0ID0gMDsKPiA+ICsgICAgIHN0cnVjdCBzaWZpdmVfc2VyaWFsX3BvcnQgKnNzcCA9
IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4gKwo+ID4gKyAgICAgaWYgKHNzcCAmJiBzc3AtPnBv
cnQudHlwZSAhPSBQT1JUX1VOS05PV04pCj4gPiArICAgICAgICAgICAgIHJldCA9IHVhcnRfcmVz
dW1lX3BvcnQoJnNpZml2ZV9zZXJpYWxfdWFydF9kcml2ZXIsICZzc3AtPnBvcnQpOwo+ID4gKwo+
ID4gKyAgICAgcmV0dXJuIHJldDsKPiA+ICt9Cj4gPiArCj4gPiArREVGSU5FX1NJTVBMRV9ERVZf
UE1fT1BTKHNpZml2ZV91YXJ0X3BtX29wcywgc2lmaXZlX3NlcmlhbF9zdXNwZW5kLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICBzaWZpdmVfc2VyaWFsX3Jlc3VtZSk7Cj4gPiArCj4gPiAgIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHNpZml2ZV9zZXJpYWxfb2ZfbWF0Y2hbXSA9
IHsKPiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAic2lmaXZlLGZ1NTQwLWMwMDAtdWFydDAiIH0s
Cj4gPiAgICAgICB7IC5jb21wYXRpYmxlID0gInNpZml2ZSx1YXJ0MCIgfSwKPiA+IEBAIC0xMDM0
LDYgKzEwNTksNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzaWZpdmVfc2VyaWFs
X3BsYXRmb3JtX2RyaXZlciA9IHsKPiA+ICAgICAgIC5yZW1vdmUgICAgICAgICA9IHNpZml2ZV9z
ZXJpYWxfcmVtb3ZlLAo+ID4gICAgICAgLmRyaXZlciAgICAgICAgID0gewo+ID4gICAgICAgICAg
ICAgICAubmFtZSAgID0gU0lGSVZFX1NFUklBTF9OQU1FLAo+ID4gKyAgICAgICAgICAgICAucG0g
PSBwbV9zbGVlcF9wdHIoJnNpZml2ZV91YXJ0X3BtX29wcyksCj4gPiAgICAgICAgICAgICAgIC5v
Zl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihzaWZpdmVfc2VyaWFsX29mX21hdGNoKSwKPiA+
ICAgICAgIH0sCj4gPiAgIH07Cj4KPiAtLQo+IEJlbiBEb29rcyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBodHRwOi8vd3d3LmNvZGV0aGluay5jby51ay8KPiBTZW5pb3IgRW5naW5lZXIg
ICAgICAgICAgICAgICAgICAgICAgICAgQ29kZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwo+Cj4g
aHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbAo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
