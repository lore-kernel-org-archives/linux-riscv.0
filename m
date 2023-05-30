Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E705C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v38XSOPmUXyfQweqjhyAHAggiVfRlFlappM0s8GTVuU=; b=SbGBweuHH1zKNl
	3TJSs36UHfmBGQ8DRg+LZxKaJuqZ0YcxgtGZI8HcgprjzV9xFoFeULuQE8UYo8e2OpjFnwrycwq0q
	sIWIcNJZdMoMgMRYweJ+R//6IDedmGU2Ijtyas91NIVWBTxJaiKbMfmPRX0HBAlCJIYHk76Z7roJw
	feLReYzBXgiXiP26bbDYq/eU0HxCQTyI75kpsJDBXv5poYv6vtRBHe5jrlw1Fc5iIykTBiuHxxAtS
	FhhnZDUmKQwBzw9DxNphx7/tfsV4xB/AZAYwTvNCQeA+Q1toNjrXOe7ufK3XFGviBgbbdqJf1oeFO
	lSRRH25aIK29R+IXRPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q42mj-00EhKi-0x;
	Tue, 30 May 2023 17:05:25 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q42mh-00EhJe-04
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 17:05:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso8460354a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 10:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1685466320; x=1688058320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4yoAeDPKr1g1u6Wglprj4Q/uxIUSCB415g8T99FP/Y=;
        b=PH5NWKsDAIaBQqpO6urTHwGpsDeOLFnFPtt6pZ5numUHHuXh43ZuTEi0yBG17iPUzd
         37y2p7jVqAFUJESe9cyEbB48Xn+wrhh/QM7iFb0lKGJxoVy7fH+ZtR1sRw/IqqqFtgwJ
         SzCa0g1+wR9j+8futxF/ZVaF/ew3REQDi1YsIuVa6nPa70zF3SlgDOBsVWXX2arCYh5P
         sEcAb22jaetgQYjvvtZDrSZVTakhMRF6Ky5/cBzuaDOu1Q751iySONDIg8raVaBh/QHd
         4DEBiT29KH22qBO6xQ8b1ZOtwoDc6ZYBDAl/pFn2PYXQn/jGG4GYaj1HSIY2c6utZq//
         MlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685466320; x=1688058320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4yoAeDPKr1g1u6Wglprj4Q/uxIUSCB415g8T99FP/Y=;
        b=XslTinBdkGPrRbQX7z/i117tEeP5+UzgVRXfCXFhSYvhYRVCTVHeQ1y0S3zJRG4gUw
         SaN9XmAFEELF/3LKEtkXVz7GIaKNMs+U33xHQPXBIfcull5iNXz5mJitpJMs6mYB2NqD
         i4Ssq3V3/kL3+iQoP4pfbJgXngsiZIj+2/WRjH1GKYYEFJILg4sd/reF51Jn+2x8Xdhi
         ldljxCtCNDWjSPqqXPIgvsqltsyJ7DBc/8von3Op64+SZedjp1+mldSPQF+WyxrjKVLG
         TvqQLegGoe/vyVtG8iv/QYXkVzWaHZRNhNWDyYYvFbF1Leb7Zy217R4wn0fL/pV3l3Mi
         TF0w==
X-Gm-Message-State: AC+VfDx6PQM0UAPf0e7tf9ZG6QP9YKU0JPdeDoGOT7Uonr9s/funhBmX
	YbOR6VCRIrbUlX2PuWuNWj+5wH4JqVqoe9fQp2P4jg==
X-Google-Smtp-Source: ACHHUZ7V/ZAzr/6u+SazheqDeu6JqyyBIAdqOTkyMBRYL8e+Evq+6eboWTOgrYfSsdWOlIQX+Euuol1Nay1DLRKyL+o=
X-Received: by 2002:a17:907:961b:b0:973:9c54:5723 with SMTP id
 gb27-20020a170907961b00b009739c545723mr2903586ejc.2.1685466319764; Tue, 30
 May 2023 10:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230526102540.105013-1-ajones@ventanamicro.com> <20230526102540.105013-4-ajones@ventanamicro.com>
In-Reply-To: <20230526102540.105013-4-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 May 2023 22:35:08 +0530
Message-ID: <CAAhSdy2yYvA4TfeRV0HV2psABxYPdb320qoMgP6RsL6Jra6k1w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] RISC-V: KVM: Probe for SBI extension status
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_100523_064575_BFE3388E 
X-CRM114-Status: GOOD (  30.73  )
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

T24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMzo1NeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gUmF0aGVyIHRoYW4gZGVmYXVsdGluZyB0aGUgc3Rh
dHVzIHRvIGF2YWlsYWJsZSBhbmQgYWxsb3dpbmcgdGhlIHVzZXIKPiB0byBzZXQgYXZhaWxhYmls
aXR5LCBkZWZhdWx0IHRvIHVuaW5pdGlhbGl6ZWQgYW5kIG9ubHkgYWxsb3cgdGhlIHVzZXIKPiB0
byBzZXQgdGhlIHN0YXR1cyB0byB1bmF2YWlsYWJsZS4gVGhlbiwgd2hlbiBhbiBleHRlbnNpb24g
aXMgZmlyc3QKPiB1c2VkLCBlbnN1cmUgaXQgaXMgYXZhaWxhYmxlIGJ5IGludm9raW5nIGl0cyBw
cm9iZSBmdW5jdGlvbiwgaWYgaXQKPiBoYXMgb25lIChhbiBleHRlbnNpb24gaXMgYXNzdW1lZCBh
dmFpbGFibGUgaWYgaXQgZG9lc24ndCBoYXZlIGEgcHJvYmUKPiBmdW5jdGlvbikuIENoZWNraW5n
IHRoZSBzdGF0dXMgaW4ga3ZtX3ZjcHVfc2JpX2ZpbmRfZXh0KCkgZW5zdXJlcwo+IGV4dGVuc2lv
biBmdW5jdGlvbnMgY2Fubm90IGJlIGludm9rZWQgd2hlbiB0aGV5J3JlIHVuYXZhaWxhYmxlLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4K
Ckxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX3ZjcHVfc2JpLmggfCAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAg
ICAgICAgfCA1MSArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA0MCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1fdmNwdV9zYmkuaAo+IGluZGV4IGNkYTk5ZmMzZDg5Ny4uYTU1YjYyMjVhYTU1IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gQEAgLTE1LDYgKzE1LDcgQEAK
PiAgI2RlZmluZSBLVk1fU0JJX1ZFUlNJT05fTUlOT1IgMAo+Cj4gIGVudW0gS1ZNX1JJU0NWX1NC
SV9FWFRfU1RBVFVTIHsKPiArICAgICAgIEtWTV9SSVNDVl9TQklfRVhUX1VOSU5JVElBTElaRUQs
Cj4gICAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9BVkFJTEFCTEUsCj4gICAgICAgICBLVk1fUklT
Q1ZfU0JJX0VYVF9VTkFWQUlMQUJMRSwKPiAgfTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vdmNwdV9zYmkuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBpbmRleCAyOGU1NWJh
MDIzZGMuLmIzZTkyYzExZTU0ZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+IEBAIC0xNTUsOCArMTU1LDE1
IEBAIHN0YXRpYyBpbnQgcmlzY3ZfdmNwdV9zZXRfc2JpX2V4dF9zaW5nbGUoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LAo+ICAgICAgICAgaWYgKCFzZXh0KQo+ICAgICAgICAgICAgICAgICByZXR1cm4g
LUVOT0VOVDsKPgo+IC0gICAgICAgc2NvbnRleHQtPmV4dF9zdGF0dXNbc2V4dC0+ZXh0X2lkeF0g
PSByZWdfdmFsID8KPiAtICAgICAgICAgICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRfQVZBSUxBQkxF
IDogS1ZNX1JJU0NWX1NCSV9FWFRfVU5BVkFJTEFCTEU7Cj4gKyAgICAgICAvKgo+ICsgICAgICAg
ICogV2UgY2FuJ3Qgc2V0IHRoZSBleHRlbnNpb24gc3RhdHVzIHRvIGF2YWlsYWJsZSBoZXJlLCBz
aW5jZSBpdCBtYXkKPiArICAgICAgICAqIGhhdmUgYSBwcm9iZSgpIGZ1bmN0aW9uIHdoaWNoIG5l
ZWRzIHRvIGNvbmZpcm0gYXZhaWxhYmlsaXR5IGZpcnN0LAo+ICsgICAgICAgICogYnV0IGl0IG1h
eSBiZSB0b28gZWFybHkgdG8gY2FsbCB0aGF0IGhlcmUuIFdlIGNhbiBzZXQgdGhlIHN0YXR1cyB0
bwo+ICsgICAgICAgICogdW5hdmFpbGFibGUsIHRob3VnaC4KPiArICAgICAgICAqLwo+ICsgICAg
ICAgaWYgKCFyZWdfdmFsKQo+ICsgICAgICAgICAgICAgICBzY29udGV4dC0+ZXh0X3N0YXR1c1tz
ZXh0LT5leHRfaWR4XSA9Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgS1ZNX1JJU0NWX1NCSV9F
WFRfVU5BVkFJTEFCTEU7Cj4KPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gQEAgLTE4MSw4ICsx
ODgsMTUgQEAgc3RhdGljIGludCByaXNjdl92Y3B1X2dldF9zYmlfZXh0X3NpbmdsZShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsCj4gICAgICAgICBpZiAoIXNleHQpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PRU5UOwo+Cj4gLSAgICAgICAqcmVnX3ZhbCA9IHNjb250ZXh0LT5leHRfc3RhdHVz
W3NleHQtPmV4dF9pZHhdID09Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBLVk1f
UklTQ1ZfU0JJX0VYVF9BVkFJTEFCTEU7Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogSWYgdGhl
IGV4dGVuc2lvbiBzdGF0dXMgaXMgc3RpbGwgdW5pbml0aWFsaXplZCwgdGhlbiB3ZSBzaG91bGQg
cHJvYmUKPiArICAgICAgICAqIHRvIGRldGVybWluZSBpZiBpdCdzIGF2YWlsYWJsZSwgYnV0IGl0
IG1heSBiZSB0b28gZWFybHkgdG8gZG8gdGhhdAo+ICsgICAgICAgICogaGVyZS4gVGhlIGJlc3Qg
d2UgY2FuIGRvIGlzIHJlcG9ydCB0aGF0IHRoZSBleHRlbnNpb24gaGFzIG5vdCBiZWVuCj4gKyAg
ICAgICAgKiBkaXNhYmxlZCwgaS5lLiB3ZSByZXR1cm4gMSB3aGVuIHRoZSBleHRlbnNpb24gaXMg
YXZhaWxhYmxlIGFuZCBhbHNvCj4gKyAgICAgICAgKiB3aGVuIGl0IG9ubHkgbWF5IGJlIGF2YWls
YWJsZS4KPiArICAgICAgICAqLwo+ICsgICAgICAgKnJlZ192YWwgPSBzY29udGV4dC0+ZXh0X3N0
YXR1c1tzZXh0LT5leHRfaWR4XSAhPQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
S1ZNX1JJU0NWX1NCSV9FWFRfVU5BVkFJTEFCTEU7Cj4KPiAgICAgICAgIHJldHVybiAwOwo+ICB9
Cj4gQEAgLTMwOSwxOSArMzIzLDMyIEBAIGludCBrdm1fcmlzY3ZfdmNwdV9nZXRfcmVnX3NiaV9l
eHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4
dGVuc2lvbiAqa3ZtX3ZjcHVfc2JpX2ZpbmRfZXh0KAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGV4dGlkKQo+ICB7
Cj4gLSAgICAgICBpbnQgaTsKPiAtICAgICAgIGNvbnN0IHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2V4
dGVuc2lvbl9lbnRyeSAqc2V4dDsKPiAgICAgICAgIHN0cnVjdCBrdm1fdmNwdV9zYmlfY29udGV4
dCAqc2NvbnRleHQgPSAmdmNwdS0+YXJjaC5zYmlfY29udGV4dDsKPiArICAgICAgIGNvbnN0IHN0
cnVjdCBrdm1fcmlzY3Zfc2JpX2V4dGVuc2lvbl9lbnRyeSAqZW50cnk7Cj4gKyAgICAgICBjb25z
dCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqZXh0Owo+ICsgICAgICAgaW50IGk7Cj4K
PiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHNiaV9leHQpOyBpKyspIHsKPiAt
ICAgICAgICAgICAgICAgc2V4dCA9ICZzYmlfZXh0W2ldOwo+IC0gICAgICAgICAgICAgICBpZiAo
c2V4dC0+ZXh0X3B0ci0+ZXh0aWRfc3RhcnQgPD0gZXh0aWQgJiYKPiAtICAgICAgICAgICAgICAg
ICAgIHNleHQtPmV4dF9wdHItPmV4dGlkX2VuZCA+PSBleHRpZCkgewo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGlmIChzZXh0LT5leHRfaWR4IDwgS1ZNX1JJU0NWX1NCSV9FWFRfTUFYICYmCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgIHNjb250ZXh0LT5leHRfc3RhdHVzW3NleHQtPmV4
dF9pZHhdID09Cj4gKyAgICAgICAgICAgICAgIGVudHJ5ID0gJnNiaV9leHRbaV07Cj4gKyAgICAg
ICAgICAgICAgIGV4dCA9IGVudHJ5LT5leHRfcHRyOwo+ICsKPiArICAgICAgICAgICAgICAgaWYg
KGV4dC0+ZXh0aWRfc3RhcnQgPD0gZXh0aWQgJiYgZXh0LT5leHRpZF9lbmQgPj0gZXh0aWQpIHsK
PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoZW50cnktPmV4dF9pZHggPj0gS1ZNX1JJU0NW
X1NCSV9FWFRfTUFYIHx8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHNjb250ZXh0LT5l
eHRfc3RhdHVzW2VudHJ5LT5leHRfaWR4XSA9PQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEtWTV9SSVNDVl9TQklfRVhUX0FWQUlMQUJMRSkKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBleHQ7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKHNjb250ZXh0LT5leHRfc3RhdHVzW2VudHJ5LT5leHRfaWR4XSA9PQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEtWTV9SSVNDVl9T
QklfRVhUX1VOQVZBSUxBQkxFKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIE5VTEw7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHNiaV9leHRbaV0uZXh0
X3B0cjsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoZXh0LT5wcm9iZSAmJiAhZXh0LT5w
cm9iZSh2Y3B1KSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2NvbnRleHQt
PmV4dF9zdGF0dXNbZW50cnktPmV4dF9pZHhdID0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRfVU5BVkFJTEFCTEU7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiArICAgICAgICAgICAgICAgICAg
ICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNjb250ZXh0LT5leHRfc3RhdHVz
W2VudHJ5LT5leHRfaWR4XSA9Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBLVk1f
UklTQ1ZfU0JJX0VYVF9BVkFJTEFCTEU7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IGV4dDsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+Cj4gLS0KPiAyLjQwLjEKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
