Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D635EC77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 14:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIk18M4Fto0ZIyqChNNmCfy92tY8zNJUIIWgOhV1tiQ=; b=EsIfuxCbc2gWZ4
	k8OwTQ1RxFBRh1ynq6ji9QqBNp2iNuOpNQoxS5fYqkmCXLkWDOhiZP1i378MdfUputzVTiGlaqgTD
	GWTzweK2ljWaQBpgrByOKBqB+aiqkt3GSIlIu7PFhtnqliKoCTAPNiLlEOZtVaQlbo8pwsfUBuo9f
	WOnn5i+ImfKwMYhXp00pYBBhu/Xl7FSeyOU2FDYJPx5lroQc+z9HI3/xbvmH+3O2aFaMvpj6Memp8
	cM0SS2Y8VaHyKyGwrOBNKoLN16vYDxWco1ODGv1Z0pNh7ghJlJ33Pk3LXpSeaaDfkD3ZOnNrfMxgY
	Y0JxGO9R7nz9wtVIEl5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyvfG-0065U1-1h;
	Tue, 16 May 2023 14:28:34 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyvfE-0065T3-0E
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 14:28:33 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f00d41df22so4768015e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 07:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684247309; x=1686839309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOOZCXXP4LpksxHkg4nvdaIq0tmnRiTZx/elW7W7niI=;
        b=arVBo25pNBMxfPhoKYvltlB2Uawur/F4MwIhKfOR0W/WANPEJ4fkT9fZ9/Z+67DvC4
         PYkZ5qy1YsWJ2cSP3jNStIcHxio06VMqYxMIt9Bm7J6eRNLlkKTJ+ZQF3SZI5VsbCQd3
         rqAETBqGvxX4bPwjK+3MGw9NTSsRra04LPUHsz8jciXU0YhQ0HB2OvRipVMi7ek1okZk
         RAsQxXpyYyiPbFwi19FE0r55eKYoalQ0p9nbdnhjFMsctO4owxzAEyKYPAnPs83Rv/Ar
         SdYtn0w0UqI1dYILJ+yIfP8lZPB9XYe4HuDndSPPOw2dpNi0RZkKl3oRuIuF6XYpPhQS
         LCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684247309; x=1686839309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOOZCXXP4LpksxHkg4nvdaIq0tmnRiTZx/elW7W7niI=;
        b=RisjLgdHwWjxDlSvNFXbnG9cHAfKhljc6Zy2fP639RT1rTvg1Pqv8qjr9SG9nieUov
         XBAzhqibys6e6GbrMrQbRRQaoTv0hbJQX0DwykZZ393rRwE/pFN3wM7WU65fPUsWtTw9
         oF9SshXVehPpGWz9/8OdYyzkucOgp8lPlr2413e/gBTh5nHSq9E1v6OUMzITwId5AioS
         7U7GqhsJ9mv2y7MqjPbM+P2whVFrbFQFUg99c/JUU6d6t+S2oRbm1a9O7RZAxLQpOlHw
         koPjGwkGXOpqV6t2yiAGUTPNRG7aYUNsTQTXJ/Wxw7wLxFEk9YQnwI+Awe3P6Zcnc/11
         e9vg==
X-Gm-Message-State: AC+VfDytItixLUisOmJqoRX7Nu+ENMlvUQcS6BweJYyJSk8N5ZgMIrLT
	Xlts3JUbRS1JyuSzzldCIe6Q3+JawFxhZWM17Oqnpg==
X-Google-Smtp-Source: ACHHUZ7c3hpAgVDEakFIgQTQp0miw0Pxe4R/I3dNmfZOb4bLnc8dYAsrTxAxvOzRqzhyH7uBZf87J9mRIW+Ood4BRJY=
X-Received: by 2002:a05:6512:90d:b0:4eb:e8e:4139 with SMTP id
 e13-20020a056512090d00b004eb0e8e4139mr6452092lft.2.1684247309388; Tue, 16 May
 2023 07:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230514090432.78217-1-bagasdotme@gmail.com> <20230514090432.78217-4-bagasdotme@gmail.com>
 <20230514-proposal-resort-3ce1beeaa089@spud>
In-Reply-To: <20230514-proposal-resort-3ce1beeaa089@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 16 May 2023 22:28:18 +0800
Message-ID: <CABgGipWt+ux3CJwotoG588MBqO1EeSV2E4mw8Kvm+d01WTPPzQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] Documentation: riscv: vector: Use bullet lists for
 prctl list
To: Conor Dooley <conor@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Documentation <linux-doc@vger.kernel.org>, 
	Linux RISC-V <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Vincent Chen <vincent.chen@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_072832_237682_66433B23 
X-CRM114-Status: GOOD (  25.01  )
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

SGkgQmFnYXMsCgpPbiBTdW4sIE1heSAxNCwgMjAyMyBhdCA1OjQ54oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhleSBCYWdhcywKPgo+IE9uIFN1biwgTWF5
IDE0LCAyMDIzIGF0IDA0OjA0OjMwUE0gKzA3MDAsIEJhZ2FzIFNhbmpheWEgd3JvdGU6Cj4gPiBU
aGUgZG9jdW1lbnRhdGlvbiBsaXN0cyB0d28gdXNlcnNwYWNlIHByY3RsKCkgY2FsbHMuIFVzZSBi
dWxsZXQKPiA+IGxpc3RzIGZvciB0aGUgbGlzdGluZy4KPiA+Cj4gPiBGaXhlczogNDEyYzY4Y2Zl
ZWIxNzggKCJyaXNjdjogQWRkIGRvY3VtZW50YXRpb24gZm9yIFZlY3RvciIpCj4KPiBGaXJzdGx5
LCB0aGVzZSBmaXhlcyBjb21taXQgaGFzaGVzIHdvdWxkIG5vdCBiZSBzdGFibGUgYXMgdGhpcyBz
ZXJpZXMKPiBoYXMgYmVlbiBhcHBsaWVkIHRvIHJpc2N2L2Zvci1uZXh0IFsxXS4gQnV0IGFsc28s
IGZyb20gdGhpcyBjb21taXQKPiBvbndhcmRzLCB0aGluZ3Mgc2VlbSBsaWtlIHN0eWxpc3RpYyBj
b21tZW50cyB0aGF0IHdvdWxkIGJlIHVuZGVzZXJ2aW5nCj4gb2YgYSBGaXhlczogdGFnIHRvIGJl
Z2luIHdpdGguCj4gUGVyaGFwcyB5b3UnZCBiZSBiZXR0ZXIgb2ZmIHN1Z2dlc3RpbmcgdGhlc2Ug
Y2hhbmdlcyBpbiByZXNwb25zZSB0byB0aGUKPiBvcmlnaW5hbCB0aHJlYWQgWzJdLCBzbyB0aGF0
IGl0IGdvZXMgaW4gImNvcnJlY3RseSIgaW4gdGhlIGZpcnN0IHBsYWNlPwo+IEFuZHkgaGFzIHRv
IHJlLXN1Ym1pdCBhbnl3YXkgYXMgdGhlcmUgYXJlIGEgZmV3IGJ1Z3MgdGhhdCBjcmVwdCBpbiBp
bgo+IHRoZSBtb3N0IHJlY2VudCByZXZpc2lvbiBvZiBoaXMgc2VyaWVzLgo+Cj4gVGhhbmtzLAo+
IENvbm9yLgo+Cj4gMSAtIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3Jpc2N2L2xpbnV4LmdpdC9sb2cvP2g9Zm9yLW5leHQKPiAyIC0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA1MDkxMDMwMzMuMTEyODUtMjUtYW5keS5jaGl1
QHNpZml2ZS5jb20vCj4KPiA+IFNpZ25lZC1vZmYtYnk6IEJhZ2FzIFNhbmpheWEgPGJhZ2FzZG90
bWVAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9yaXNjdi92ZWN0b3IucnN0
IHwgNCArKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9yaXNjdi92ZWN0b3IucnN0
IGIvRG9jdW1lbnRhdGlvbi9yaXNjdi92ZWN0b3IucnN0Cj4gPiBpbmRleCAxNzhiM2YzZjQ1MjQ2
Mi4uYzdiZDcwMWM3OTYzYjYgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L3Zl
Y3Rvci5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vcmlzY3YvdmVjdG9yLnJzdAo+ID4gQEAg
LTEzLDcgKzEzLDcgQEAgb3JkZXIgdG8gc3VwcG9ydCB0aGUgdXNlIG9mIHRoZSBSSVNDLVYgVmVj
dG9yIEV4dGVuc2lvbi4KPiA+ICBUd28gbmV3IHByY3RsKCkgY2FsbHMgYXJlIGFkZGVkIHRvIGFs
bG93IHByb2dyYW1zIHRvIG1hbmFnZSB0aGUgZW5hYmxlbWVudAo+ID4gIHN0YXR1cyBmb3IgdGhl
IHVzZSBvZiBWZWN0b3IgaW4gdXNlcnNwYWNlOgo+ID4KPiA+IC1wcmN0bChQUl9SSVNDVl9WX1NF
VF9DT05UUk9MLCB1bnNpZ25lZCBsb25nIGFyZykKPiA+ICsqIHByY3RsKFBSX1JJU0NWX1ZfU0VU
X0NPTlRST0wsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4KPiA+ICAgICAgU2V0cyB0aGUgVmVjdG9y
IGVuYWJsZW1lbnQgc3RhdHVzIG9mIHRoZSBjYWxsaW5nIHRocmVhZCwgd2hlcmUgdGhlIGNvbnRy
b2wKPiA+ICAgICAgYXJndW1lbnQgY29uc2lzdHMgb2YgdHdvIDItYml0IGVuYWJsZW1lbnQgc3Rh
dHVzZXMgYW5kIGEgYml0IGZvciBpbmhlcml0YW5jZQo+ID4gQEAgLTg5LDcgKzg5LDcgQEAgcHJj
dGwoUFJfUklTQ1ZfVl9TRVRfQ09OVFJPTCwgdW5zaWduZWQgbG9uZyBhcmcpCj4gPiAgICAgICAg
ICAqIEV2ZXJ5IHN1Y2Nlc3NmdWwgY2FsbCBvdmVyd3JpdGVzIGEgcHJldmlvdXMgc2V0dGluZyBm
b3IgdGhlIGNhbGxpbmcKPiA+ICAgICAgICAgICAgdGhyZWFkLgo+ID4KPiA+IC1wcmN0bChQUl9S
SVNDVl9WX1NFVF9DT05UUk9MKQo+ID4gKyogcHJjdGwoUFJfUklTQ1ZfVl9TRVRfQ09OVFJPTCkK
PiA+Cj4gPiAgICAgIEdldHMgdGhlIHNhbWUgVmVjdG9yIGVuYWJsZW1lbnQgc3RhdHVzIGZvciB0
aGUgY2FsbGluZyB0aHJlYWQuIFNldHRpbmcgZm9yCj4gPiAgICAgIG5leHQgZXhlY3ZlKCkgY2Fs
bCBhbmQgdGhlIGluaGVyaXRhbmNlIGJpdCBhcmUgYWxsIE9SLWVkIHRvZ2V0aGVyLgo+ID4gLS0K
PiA+IEFuIG9sZCBtYW4gZG9sbC4uLiBqdXN0IHdoYXQgSSBhbHdheXMgd2FudGVkISAtIENsYXJh
Cj4gPgoKVGhhbmtzIGZvciBmaXhpbmcgdGhlIGRvY3VtZW50LiBEbyB5b3UgbWluZCBpZiBJIG1l
cmdlIHRoZW0gaW50byBteQpwYXRjaCBhbmQgYWRkIHlvdSBhcyBhIGNvLWRldmVsb3Blcj8gSSB0
aGluayBtZXJnaW5nIHRob3NlIGZpeGVzIGludG8KdGhlIG9uZSBvcmlnaW5hbCBwYXRjaCB3b3Vs
ZCBiZSBtdWNoIGNsZWFuZXIgdGhhbiBwcm92aWRpbmcgZml4CnBhdGNoZXMgYWZ0ZXJ3YXJkLgoK
VGhhbmtzLApBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
