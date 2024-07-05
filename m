Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A448C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C43Gly2ixE8x3AReBaS0XmDszQilkd4vO/SInjjcKj4=; b=NlkwMVLT2S3DH1
	nAF6/a4S5HQfi2wkHRMSnWfjV59RaIdArTPbEFwZTCW76X7dEfv4b8vzsfZ5TV7aGkoKH96tIskIu
	gZCQ+IuSi1VJ83k+KCnWY13HRR74LZ4rCmJNpiA/mIRjdXJ1HM6s3JbRRwyHlLkD8bbJOpCA+l2nK
	iAnBKMYuB9fI5iRcBOP0WS3sRM7n0sadWHP4B4dQ/L2YSd8o34Nx7MfY8iFZ6Nk7h02uXHFCzD586
	g4Jm4ALRqSCl02RkNqMUBuf+8aZv519jdqBvubmYY2BWO4E1KF7ULe/fkTcFOE3DMkBpvkiZAcIQh
	xUYIlx6YiknhJrG9gmIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfaF-0000000FVhu-3wEi;
	Fri, 05 Jul 2024 09:50:27 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfaC-0000000FVhG-1own
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 09:50:25 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52e9a550e9fso2258695e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jul 2024 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173022; x=1720777822; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HMrCTqfqHM+5huN0YwcHxZmMO2Nm0CrRXiR6wyo0nI=;
        b=UetfgSq9CguqG2JJxwBH20Guto9zslVjVngAjFnhOhizg9xsNaTkSdK0EfisRh48nS
         GXpp50yRaV1eD1/CJ5QasBKMMsOphN/t/vVWtf/eppnOqIOWtvIBmmGZ6w8ofqNZfM7Q
         hGtkj4lrK6G956URjdjaZIUO2p+nXI5QTbYrD4jRSgSaK8VtUevtDdSr8yF0jM7esLIB
         0b9vNvx8d9fJyKpDMqvVYbfAIH4451GTR21imlCrrL9Qtcqx9MUsgFGFjHzoELfjp8LT
         7DJi7ihXdgWQHUziuV/qI9mQ7ZwLJYUDq2K0qCzgI9us/l5TmNDvsj7A4GvmZ9ocG5Z4
         kLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173022; x=1720777822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HMrCTqfqHM+5huN0YwcHxZmMO2Nm0CrRXiR6wyo0nI=;
        b=v4Ww4BtJ547d24M+gKxDIoK1yU8CP2WgVIO1KTyTKMit4UQtYiN3dXTpGSlP/a+ogy
         QPzAdPTdcIBAvdNerFUVFPzPlpc518TmjZ7MPi00ny3ShWuQoJSvLXeeLuuwvmiy1ipC
         r1YrAXMJ3UnIWZmijKnkeCSRxNs6JyUBW2IyHSd+GFhUJTq0yBp0Tb+gUngSWxnysYnS
         hFM0ooCsqgXmdlRsdaBLZpiXhYMDR5jgVLzECWRFmCxIDIOJ7iZqVUfiDZNm85KaE4UY
         iXdPPmCj7WudKgjmEIS/LUWbMo8BdxdXh4M/D/+rnz/U58h7x1gNg4pH1j7tjocb+PjB
         UYxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7hB6V/5W3iyxlnMEiGgG1zOyn7G/xWAvO9QIdwAJVInCXVdojZYAVsb3piFX+rzQ/JkM/1ph+Gw9+Ehj1DrlOM0eKa6sJD+egZdt2XCAy
X-Gm-Message-State: AOJu0YxkXD+zVbJ6gVfK+/9Pf9oipIvqitWSXxKgGfYe8jwW7DvQn3CZ
	vQthW9HLLsON9G9l68aQV7mRSO8KE5Df4HtI3erG9+pF7bkMhADB04/WjI3USj13iVxjaPInL7e
	7PCMgNJMv+kGpGxYOb8BnkmglZSmvsppqqNjZYQ==
X-Google-Smtp-Source: AGHT+IFGdMv9mOZcwNG0nGSSpL7siCh/sfgLJr6Xwf7iux7ef6YcjMqCZdysGSFZxujFPIToDjIeInlz7nhm/TgKK3s=
X-Received: by 2002:a05:6512:3a8c:b0:52b:c1cf:cecb with SMTP id
 2adb3069b0e04-52ea0e3a688mr1564316e87.24.1720173021517; Fri, 05 Jul 2024
 02:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49530D9BC6C8011B730433C2BBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB49530D9BC6C8011B730433C2BBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Jul 2024 11:50:09 +0200
Message-ID: <CACRpkdajN7RjE5LOdv_SP6rR8U-vwXHXn=kZZo7thodeMem72Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800
 series SoC.
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Drew Fustini <dfustini@baylibre.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_025024_513625_0855B807 
X-CRM114-Status: GOOD (  13.13  )
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

SGkgSW5vY2hpLAoKdGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKU29tZSBjb21tZW50cyBiZWxvdzoK
Ck9uIFRodSwgSnVsIDQsIDIwMjQgYXQgNzo0N+KAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBvdXRsb29rLmNvbT4gd3JvdGU6Cgo+IEFkZCBwaW5jdHJsIHN1cHBvcnQgZm9yIFNvcGhnbyBD
VjE4MDAgc2VyaWVzIFNvQy4KPgo+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2No
aWFtYUBvdXRsb29rLmNvbT4KKC4uLikKPiArICAgICAgICAgIGJpYXMtcHVsbC11cDoKPiArICAg
ICAgICAgICAgdHlwZTogYm9vbGVhbgoKZGVzY3JpcHRpb246IFNldHRpbmcgdGhpcyB0cnVlIHdp
bGwgcmVzdWx0IGluIGhvdyBtYW55IE9obXMgb2YgcHVsbCB1cAphbmQgdG8gd2hhdCB2b2x0YWdl
PwoKPiArICAgICAgICAgIGJpYXMtcHVsbC1kb3duOgo+ICsgICAgICAgICAgICB0eXBlOiBib29s
ZWFuCgpIb3cgbWFueSBPaG1zIGJ5IGRlZmF1bHQ/IEl0J3MgdmVyeSBoZWxwZnVsIGZvciBkZXNp
Z25lcnMgd3JpdGluZyB0aGUKZGV2aWNlIHRyZWUgdG8ga25vdyB0aGlzLgoKPiArICAgICAgICAg
IGRyaXZlLXN0cmVuZ3RoOgo+ICsgICAgICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy91aW50MzIKPiArICAgICAgICAgICAgbWluaW11bTogMAo+ICsgICAgICAg
ICAgICBtYXhpbXVtOiA3CgowLDEsICAuLi4gNyAuLi4gdW5pdHMgb2Ygd2hhdD8gV2hhdCBkb2Vz
IHRoZSB2YWx1ZXMgcmVwcmVzZW50Pwo3IG1BPyBJIHRoaW5rIG5vdC4gVGhpcyBzaG91bGQgYmUg
aW4gbUEgYW5kIHBhcnNlZCB0byBhbnkgY3VzdG9tCnZhbHVlcy4KCklmIHlvdSBuZWVkIG1vcmUg
cmVzb2x1dGlvbiwgY29uc2lkZXIgdXNpbmcgZHJpdmVyLXN0cmVuZ3RoLW1pY3JvYW1wIGFuZApw
YXJzZSB0aGF0IHZhbHVlIGluc3RlYWQuCgo+ICsgICAgICAgICAgaW5wdXQtc2NobWl0dDoKPiAr
ICAgICAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMy
Cj4gKyAgICAgICAgICAgIG1pbmltdW06IDAKPiArICAgICAgICAgICAgbWF4aW11bTogNwoKV2hh
dCBpcyB0aGlzIGN1c3RvbSBwcm9wZXJ0eT8gV2Ugc3VwcG9ydCBpbnB1dC1zY2htaXR0LWVuYWJs
ZQphbmQgaW5wdXQtc2NobWl0dC1kaXNhYmxlLCBpZiB5b3Ugd2FudCB0byBhZGQgYSBuZXcgc3Rh
bmRhcmQgcHJvcGVydHkKaW5wdXQtc2NobWl0dCwgdGhlbiBzZW5kIGEgc2VwYXJhdGUgcGF0Y2gg
dG8KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY2ZnLW5vZGUu
eWFtbAphbmQgZXhwbGFpbiB3aGF0IHRoZSBhcmd1bWVudCBtZWFucywgaXQgc2hvdWxkIGJlIGlu
IFNJIHVuaXRzLgoKRm9yIGEgZnVsbCBjdXN0b20gcHJvcGVydHksIHVzZSBzb3BoZ28sIHByZWZp
eGVzLgoKPiArICAgICAgICAgIHNsZXctcmF0ZToKPiArICAgICAgICAgICAgZW51bTogWyAwLCAx
IF0KCldoYXQgaXMgc2xldyByYXRlIDAgYW5kIDE/IFdoYXQgZG9lcyBpdCByZXByZXNlbnQ/Cgpt
aWNyb3ZvbHRzIHBlciBzZWNvbmQgaG93IG11Y2ggKEkgZG9uJ3Qga25vdywganVzdCBndWVzc2lu
ZykKCj4gKyAgICAgICAgICBzb3BoZ28sYnVzLWhvbGRlcjoKPiArICAgICAgICAgICAgZGVzY3Jp
cHRpb246IGVuYWJsZSBidXMgaG9sZGVyCgpUaGlzIGRlc2NyaXB0aW9uIGlzIGEgYml0IHRvbyBs
aXR0bGUsIHdlIG5lZWQgdG8ga25vdyB3aGF0IHRoaXMgdGhpbmcKaXMgYW5kIHdoYXQgaXQgaXMK
dXNlZCBmb3IuIElmIGl0IGlzIGRlZmluaWVkIGluIHNvbWUgb3RoZXIgRFQgYmluZGluZyB0aGVu
IHJlZmVyZW5jZSB0aGF0IGZpbGUuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
