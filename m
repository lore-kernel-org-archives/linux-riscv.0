Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3191DC61DE5
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Feb 2026 10:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YAdcZG3UH4VKEU7pldi69SbmEy4TXJ/wbxgdb8jvOmQ=; b=DoyNnd2Bmjzgr/
	3wjdIP8Sl32PyoXtzIk5Ijw6tx8xyf1MA30qu0e4CTqIF6qL+IwB6g1EIt9SyqdXiXREb0IDuWqdJ
	9r695ALaRza1F6BWjGU91tTyXKKrUPgiBcmnt9ehYlNHmwto9XGeVJ0bBOWmrdJs7jg1F8UQ1A/jk
	s3ehKIQvd0GHewics3JUnGePgqb8SZuyX1dbWumHG+SgzwmUOGGPb2laKiSu+rvhMcbJkWfH67gjC
	zcyJO4mTlLw1TuE3RY1as8voXPTds3khm6mrT3u4Oype+exikhVRRCZImiZ2ctvdFOTSTLnEdTepc
	LuUXoyv3eA2qGX+tqNlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtkZe-0000000FzUg-099m;
	Sat, 21 Feb 2026 10:50:58 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtkZb-0000000FzTc-1CSj
	for linux-riscv@lists.infradead.org;
	Sat, 21 Feb 2026 10:50:56 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-64937edbc9eso2792655d50.2
        for <linux-riscv@lists.infradead.org>; Sat, 21 Feb 2026 02:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771671054; cv=none;
        d=google.com; s=arc-20240605;
        b=eIdbbWV3HC38/AYEjtzBI6IjEf00ZSOLbz5rI4whRJZfGtNh7FxkYELy4renkbGVnp
         DEE9eUiESK+k4s+a++pMqPw2S43nDhdN9k/Q51wD3ZZlXyivQmNwjMVf+I3YK54kzZG5
         GRSbTFA1lJim522TgrRjEtkfttHonQPl6JfJOzLplKNk4tbgYedMSCQblXmdDARGzvxl
         QoOlGMG/8lrAjhw1mgtg+Sy0PxPXcQYENJW+tB8bL2sAPWgiQnQbRmVF8+6PzLuAySxA
         aTY/o8BQI7UbsZty9T0r6kmFRHBk3+77qxNFtnizC563UcGZvjr/21ZaI7q40AILGSki
         1kKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iX49jux/4IXgi5L4udtJMMhfexmcVR566shHk1rThtE=;
        fh=BN7iGJ0eDYlYN+fm9hHJ0ABTBZ/8twE7YzIYOtr5V34=;
        b=Pqqv6L/HGvwQFAwgkDJvsCXbczMob5LlBXU2krIQnAzCYa/4Lav2fl96VXfmidmawl
         OGsYNF9ztngnbZ5xnqNEQHBzodFwmV9NrM/bviqB+YNcQw+DJMqNmATF7f0Q9FLKtRyh
         tZL/g00NNLq6RjMoETecnPdz+H94ce0GolevQzCEhWMEvzZczEGuH/GKYtyk7pohtMTA
         5b6cG2FmvCgtcg+Yi8hiw0OhJnmmpmIMRa+Nkv0r55ioLrQ2lccS/EClwMTjo0Wuxxd3
         fQ+Y+POl2KtT3jPEsDQPUg4pD/hV2v1qHPk6xn5D3nchBz68txoag+uATa82XGMWadeN
         YHvg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1771671054; x=1772275854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iX49jux/4IXgi5L4udtJMMhfexmcVR566shHk1rThtE=;
        b=VZYb5HBBNIcabalfBHsZ030laTL/DLX2ejS7tEjIHnbYGHlwbeTkwhpctYlHL8HGpr
         wpaOLtitC/iMEVqUFZN2CUO4QSGpjSEiDoOnp1UnTy4YfRXuNMSUkhKbchDQJxB9Lyy0
         7McM5OUtykI7kQ9VJo+UHAF0pgHxIsm7q2kFX9AMlA08afNq9LsyRvcV4cf0KK0HnGgn
         Gx3eGblaTsmlq15RipTr/XFAAYKCY/99EzZ11t3x+Ww0xqYgonucpGXkMnezOn4btCFP
         DYLqxGeoXDSxonpq8pqJaFE1OA1EoBb8qpnmw8n6QfbHxyCEEoePHAfmW/diH83shERn
         FZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771671054; x=1772275854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iX49jux/4IXgi5L4udtJMMhfexmcVR566shHk1rThtE=;
        b=d2/sm5nHWyGDdJCEdB9qTk6l4SvKtQP3tguWHFyulab0tTJupVzdpLhIFa19amYvQW
         yKRbJdLs/oKly0qO0h+hMCk2J38CMmeYLSlOmpJbvKLtml+j4hXvfd/VhJQT7K2QvZmD
         Hby+p+R3/u+xOHnmnm4Usghm71NT89BtTR+5W2vsb8DFJbg3FZbbeRp1J/Ib06ldgRut
         SahO6R8zVNK8YdqgIz6ffTgX3O5Ua3RX8zTYgQ0YMHSUgoMzB2SCLt4IPmJb8IK4MvNL
         i4X6Wrq49LDsDpfTZ+O44IYmsC2o6RxkBTGA7c99iCJac1sReITNFkJgZ1dEK5PjI3aB
         E7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKLHAVag17zMDTMj6q83KAFru1ZhbuQe000N82azb77wZYd3+zIX9I3KxU9b4TtO+Ol22gRs/R30ru1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpUEbK0CrHdmwyF1kOXF7J5aasHi34rUE6ZnJk/FeaMHc30fV5
	TZ99VpPNffPtXTCy3ydranK6DNGtHf+lkxNOYX/bbIZdZx52ZishW8iDLP2MgbPBOuN8W4L5Kyu
	oCiH1NilSlN3Q8DCxOE4DXouJB3NSGd4iv/d/+ezZvw==
X-Gm-Gg: AZuq6aIu7UqIJP8gQmpKEy7iJWZLxXYoxEaLWGRwdIQZvqkoEA6ewRFnkjrX+tTdbTa
	qJM3/dY6R+EZp3co9GcKxz1d6168e2gPB2D5lKenQH0U4x9ad433BmcqEU3ztVrFQmFeSVk0PRr
	wIr0YIF0xVpnrGnqb/23CXH5yngFX0gwpQIDode2KpUZv91nigJDx1sYUCLLF/EOnzbejhymVI0
	58uBDQjd/gSHCu+X0WBF6e/6V2AVRt0bR8JvLo7THVgsMOyVbmNBKvY3MQE9Z1oRRT4/Agc0cMh
	OVskq/XX6AUnixsO0/icFZSPac9BibHAsOUD6+OFF1oAVhCFU3c=
X-Received: by 2002:a05:690e:d4f:b0:649:b943:2cc6 with SMTP id
 956f58d0204a3-64c78d2540fmr2087778d50.52.1771671054439; Sat, 21 Feb 2026
 02:50:54 -0800 (PST)
MIME-Version: 1.0
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com> <20260206002349.96740-8-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260206002349.96740-8-andrew.jones@oss.qualcomm.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 21 Feb 2026 18:50:43 +0800
X-Gm-Features: AaiRm53RGq4SjluQ7rY8hknIj4t9V-QSTFAH2aru43ccuu0WX9kk8F8JI5HKec8
Message-ID: <CAH1PCMa96hdU+aZ6W48GQDj=FEoO=4P3VOZrUNi-g6WYaopKUg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 07/11] riscv: Export have_user_pmlen* booleans
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Charlie Jenkins <thecharlesjenkins@gmail.com>, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_025055_334951_9C332AED 
X-CRM114-Status: GOOD (  18.60  )
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

T24gRnJpLCBGZWIgNiwgMjAyNiBhdCA4OjI04oCvQU0gQW5kcmV3IEpvbmVzCjxhbmRyZXcuam9u
ZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBBIGZvbGxvd2luZyBwYXRjaCB3aWxsIG5l
ZWQgdG8gYWNjZXNzIGhhdmVfdXNlcl9wbWxlbl83IGZyb20KPiBhbm90aGVyIGZpbGUuCgpUaGUg
dmFyaWFibGVzIGFyZSBtYWRlIG5vbi1zdGF0aWMgaGVyZSBidXQgd2l0aG91dCBhbiBleHRlcm4K
ZGVjbGFyYXRpb24gaW4gYSBoZWFkZXIuCgpIb3cgYWJvdXQgYWRkaW5nIHRoZSBkZWNsYXJhdGlv
bnMgdG8gYXNtL3Byb2Nlc3Nvci5oLCBpbnNpZGUgdGhlCnByb3RlY3Rpb24gb2YgdGhlIENPTkZJ
R19SSVNDVl9JU0FfU1VQTSBibG9jaz8KCnN5c19od3Byb2JlLmMgYWxyZWFkeSBpbmNsdWRlcyBh
c20vcHJvY2Vzc29yLmgsIHNvIG5vIG5ldyBpbmNsdWRlcwp3b3VsZCBiZSBuZWVkZWQuCgpQUzog
SSBzcG90dGVkIG9uZSBtb3JlIG9mIHlvdXIgcGF0Y2ggWzEwLzExXSByZWZlcnMgdG8gaXQsIHdo
aWNoIGFkZHMKYW5vdGhlciBiYXJlIGV4dGVybiBpbiBjcHVmZWF0dXJlLmMuCgpCUiwKR3VvZG9u
ZwoKCgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAb3NzLnF1
YWxjb21tLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIHwgMTIgKysr
KysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gaW5kZXggMzFhMzkyOTkzY2I0Li40ZmExNGFmZjdmOGQg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gQEAgLTI3NCw4ICsyNzQsOCBAQCBlbnVtIHsKPiAgICAg
ICAgIFBNTEVOXzE2ID0gMTYsCj4gIH07Cj4KPiAtc3RhdGljIGJvb2wgaGF2ZV91c2VyX3BtbGVu
Xzc7Cj4gLXN0YXRpYyBib29sIGhhdmVfdXNlcl9wbWxlbl8xNjsKPiArYm9vbCByaXNjdl9oYXZl
X3VzZXJfcG1sZW5fNzsKPiArYm9vbCByaXNjdl9oYXZlX3VzZXJfcG1sZW5fMTY7Cj4KPiAgLyoK
PiAgICogQ29udHJvbCB0aGUgcmVsYXhlZCBBQkkgYWxsb3dpbmcgdGFnZ2VkIHVzZXIgYWRkcmVz
c2VzIGludG8gdGhlIGtlcm5lbC4KPiBAQCAtMzA2LDEwICszMDYsMTAgQEAgbG9uZyBzZXRfdGFn
Z2VkX2FkZHJfY3RybChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHVuc2lnbmVkIGxvbmcgYXJn
KQo+ICAgICAgICAgcG1sZW4gPSBGSUVMRF9HRVQoUFJfUE1MRU5fTUFTSywgYXJnKTsKPiAgICAg
ICAgIGlmIChwbWxlbiA9PSBQTUxFTl8wKSB7Cj4gICAgICAgICAgICAgICAgIHBtbSA9IEVOVkNG
R19QTU1fUE1MRU5fMDsKPiAtICAgICAgIH0gZWxzZSBpZiAocG1sZW4gPD0gUE1MRU5fNyAmJiBo
YXZlX3VzZXJfcG1sZW5fNykgewo+ICsgICAgICAgfSBlbHNlIGlmIChwbWxlbiA8PSBQTUxFTl83
ICYmIHJpc2N2X2hhdmVfdXNlcl9wbWxlbl83KSB7Cj4gICAgICAgICAgICAgICAgIHBtbGVuID0g
UE1MRU5fNzsKPiAgICAgICAgICAgICAgICAgcG1tID0gRU5WQ0ZHX1BNTV9QTUxFTl83Owo+IC0g
ICAgICAgfSBlbHNlIGlmIChwbWxlbiA8PSBQTUxFTl8xNiAmJiBoYXZlX3VzZXJfcG1sZW5fMTYp
IHsKPiArICAgICAgIH0gZWxzZSBpZiAocG1sZW4gPD0gUE1MRU5fMTYgJiYgcmlzY3ZfaGF2ZV91
c2VyX3BtbGVuXzE2KSB7Cj4gICAgICAgICAgICAgICAgIHBtbGVuID0gUE1MRU5fMTY7Cj4gICAg
ICAgICAgICAgICAgIHBtbSA9IEVOVkNGR19QTU1fUE1MRU5fMTY7Cj4gICAgICAgICB9IGVsc2Ug
ewo+IEBAIC00MDcsOCArNDA3LDggQEAgc3RhdGljIGludCBfX2luaXQgdGFnZ2VkX2FkZHJfaW5p
dCh2b2lkKQo+ICAgICAgICAgICogQXNzdW1lIHRoZSBzdXBwb3J0ZWQgUE1MRU4gdmFsdWVzIGFy
ZSB0aGUgc2FtZSBvbiBhbGwgaGFydHMuCj4gICAgICAgICAgKi8KPiAgICAgICAgIGNzcl9jbGVh
cihDU1JfRU5WQ0ZHLCBFTlZDRkdfUE1NKTsKPiAtICAgICAgIGhhdmVfdXNlcl9wbWxlbl83ID0g
dHJ5X3RvX3NldF9wbW0oRU5WQ0ZHX1BNTV9QTUxFTl83KTsKPiAtICAgICAgIGhhdmVfdXNlcl9w
bWxlbl8xNiA9IHRyeV90b19zZXRfcG1tKEVOVkNGR19QTU1fUE1MRU5fMTYpOwo+ICsgICAgICAg
cmlzY3ZfaGF2ZV91c2VyX3BtbGVuXzcgPSB0cnlfdG9fc2V0X3BtbShFTlZDRkdfUE1NX1BNTEVO
XzcpOwo+ICsgICAgICAgcmlzY3ZfaGF2ZV91c2VyX3BtbGVuXzE2ID0gdHJ5X3RvX3NldF9wbW0o
RU5WQ0ZHX1BNTV9QTUxFTl8xNik7Cj4KPiAgICAgICAgIGlmICghcmVnaXN0ZXJfc3lzY3RsKCJh
YmkiLCB0YWdnZWRfYWRkcl9zeXNjdGxfdGFibGUpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
