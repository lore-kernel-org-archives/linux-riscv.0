Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255CEEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 11:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOskKoy8x+PA33Gg7dBKiG7c3ezxDAf3LfYwXbNDFB0=; b=xoOWmQgGLaOm6I
	M25ifaFqkpvHlRbvb7pDzCX3dGUxthFwnEBlQ1mI2jP0LKBXs+96XRcrFZbY64H5nsmWViK+vbb7u
	AGdzuTvOoDN/PxDshlzjzFX/yQK2i3svlXR2s1Qmd524Wcrl9DR8EdWtx1FjJ8SH9h7ifyLJlngjU
	TeecrLnbgDMIBT31Q8BwZWitftllfFc0RuLQrvZYFGvmqtlj3Dx/3e2R0xY94RAckRF4emruCGvwu
	OHG3QMZAIRnvqlN5z8RvOMSv6xGEYQYDGPP6RZYDOtAbANRD/uXA0U5lm1+pkqXoiTnL2tULt/n8L
	7vEapKdxiuCSGEiN6Z5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWbFL-006HEw-2j;
	Thu, 17 Aug 2023 11:32:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWbFJ-006HE4-0o
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 11:32:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fea0640d88so34769155e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 04:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1692271974; x=1692876774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYLXpwq257lrYbI91toUQ4vtNgExpmLr9ktHCtyK+GU=;
        b=jI7P6md7O7FML3MGqt6QFi4l0uTXqWZBIKY+7AMxNOptubpL3F/YB2vS+/4lvmDGOC
         OIHXW/y6ESveVa3WiatlEs5ZqkLUflezKILPf+Dn219ZGX8oX2QNXKWwYisQSaqOPqtm
         L6UYU5fgRd1tLNxNFHKTqd9hohaNyddxjdAqabxeHTbKpzWl0OpVTRiCx5DBRi9dFcu3
         rWrxsgX/fSFoQ9eWsI8XQ4YhSlVR/qsF1K+czzVUX5yZ6d74gnOIEX8yuqLZ4PsxwdLA
         lyHtFZ/2lWnqo/Yy4qU5jANACFViwPPcw7zEuDYtd9+flVi/AWg2Wu+InolzQ84bOobD
         lrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692271974; x=1692876774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYLXpwq257lrYbI91toUQ4vtNgExpmLr9ktHCtyK+GU=;
        b=gb6HQIv9GU+v4Nd++2Z4WnTMqseNJP8Cp7FoigmOgbHgm0A48MRBGgNoNOL8QSX5fw
         RfOQv5Ypf8J8NzojrII3BsAKWLMSZkZWudesFnAw2CQskmVX2iNVjxtdpNgaMfWR2q9E
         6R8Ky3FlT38q80CPaMe/UB9TsxU51jcgXJ3e+UzSZw5K9ULDypNXRLrgGV79is8aCEWx
         Uo7m0SUp6pqoyPRsVPa/7SeMl1ZkwZtZVZfgrk8+Rc7QLivemseGxMV8ffp/vL0CJwlk
         ipn0zCKnbo9kRkeX2XTwivqeY060b3+WbbVzRhXZxjlbejDAq2i2CD4gbd6l4eV7DzJ8
         4ruQ==
X-Gm-Message-State: AOJu0YwldKGVNaxzYrvJ3C/FiWusRWaHbFieyyLv6sWiShnDhTbX3x6y
	VamGDDp55g+HcxB+QH3ZAXQn6tDrMCdNK2NSxno5Qw==
X-Google-Smtp-Source: AGHT+IEOWnr9SA+8/lkq2R7JqjbgRQH4UYzwLe/l5hsMEDbp+WMIeOFonJ8veCcUqpKl9ZnjadsSGhE63MnHB5/S6EY=
X-Received: by 2002:a05:600c:2308:b0:3fb:e356:b60d with SMTP id
 8-20020a05600c230800b003fbe356b60dmr3394929wmo.38.1692271974048; Thu, 17 Aug
 2023 04:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230329082950.726-1-cuiyunhui@bytedance.com> <87v8dfqays.fsf@all.your.base.are.belong.to.us>
 <CAEEQ3w=MgH82+BMpwmUHnUevMJsJUqgeBRWSZnU_iizMLK37UQ@mail.gmail.com> <871qg29eb7.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <871qg29eb7.fsf@all.your.base.are.belong.to.us>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 17 Aug 2023 19:32:43 +0800
Message-ID: <CAEEQ3wme6nXoyK+_kFjrM6hV7EDfiPXM83dibfTS_XxPdbfpLQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] riscv: Dump user opcode bytes on fatal faults
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: conor.dooley@microchip.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, peterz@infradead.org, mpe@ellerman.id.au, 
	jpoimboe@kernel.org, mark.rutland@arm.com, svens@linux.ibm.com, 
	guoren@kernel.org, jszhang@kernel.org, ebiederm@xmission.com, 
	bjorn@rivosinc.com, heiko@sntech.de, xianting.tian@linux.alibaba.com, 
	mnissler@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_043257_289275_DED62C41 
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

SGkgIEJqw7ZybiwKCk9uIFRodSwgQXVnIDE3LCAyMDIzIGF0IDY6MDPigK9QTSBCasO2cm4gVMO2
cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBi
eXRlZGFuY2UuY29tPiB3cml0ZXM6Cj4KPiA+IEhpIEJqw7ZybiwKPiA+Cj4gPiBPbiBXZWQsIEF1
ZyAxNiwgMjAyMyBhdCAxMToxMeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
IHdyb3RlOgo+ID4+Cj4gPj4gSGkgWXVuaHVpLAo+ID4+Cj4gPj4gV2FraW5nIHVwIHRoZSBkZWFk
ISA7LSkKPiA+Pgo+ID4KPiA+Pgo+ID4+IFg4NidzIHNob3dfb3Bjb2RlcygpIGlzIHVzZWQgYm90
aCBmb3Iga2VybmVsIG9vcHM6ZXMsIGFuZCB1c2VybGFuZAo+ID4+IHVuaGFuZGxlZCBzaWduYWxz
LiBPbiBSSVNDLVYgdGhlcmUncyBkdW1wX2tlcm5lbF9pbnN0cigpIGFkZGVkIGluIGNvbW1pdAo+
ID4+IGViMTY1YmZhOGVhZiAoInJpc2N2OiBBZGQgaW5zdHJ1Y3Rpb24gZHVtcCB0byBSSVNDLVYg
c3BsYXRzIikuCj4gPj4KPiA+PiBXZHl0IGFib3V0IHJld29ya2luZyB0aGF0IGZ1bmN0aW9uLCBz
byB0aGF0IGl0IHdvcmtzIGZvciB1c2VybGFuZCBlcGMgYXMKPiA+PiB3ZWxsPyBJIHRoaW5rIGl0
J3MgdXNlZnVsIHRvIGhhdmUgdGhlIHN1cnJvdW5kaW5nIGluc3RydWN0aW9uIGNvbnRleHQsCj4g
Pj4gYW5kIG5vdCBqdXN0IG9uIGluc3RydWN0aW9uLgo+ID4KPiA+IE9rYXksICBCYXNlZCBvbiB5
b3VyIHN1Z2dlc3Rpb24sIEknbSBnb2luZyB0byByZW5hbWUgZHVtcF9rZXJuZWxfaW5zdHIKPiA+
IHRvIGR1bXBfaW5zdHIuIExpa2U6Cj4gPiBzdGF0aWMgdm9pZCBkdW1wX2luc3RyKGNvbnN0IGNo
YXIgKmxvZ2x2bCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiB7Cj4gPiAuLi4KPiA+ICAgICAg
ICAgICAgICAgICBpZiAodXNlcl9tb2RlKHJlZ3MpKQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgYmFkID0gZ2V0X3VzZXJfbm9mYXVsdCh2YWwsICZpbnNuc1tpXSk7Cj4gPiAgICAgICAgICAg
ICAgICAgZWxzZQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgYmFkID0gZ2V0X2tlcm5lbF9u
b2ZhdWx0KHZhbCwgJmluc25zW2ldKTsKPiA+IC4uLgo+ID4gfQo+ID4KPiA+IFdoYXQgZG8geW91
IHRoaW5rPwo+Cj4gWWVhaCwgbG9va3MgZ29vZCEgRG9lcyB0aGF0IHdvcmsgZm9yIHlvdT8KWWVh
aCwgSXQgd29ya3MgZm9yIG1lLCBJJ2xsIHVwZGF0ZSB0aGUgcGF0Y2ggdG8gdjMgYW5kIHNlbmQg
aXQuCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
