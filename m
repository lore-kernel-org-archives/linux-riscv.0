Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55FFC54E5D
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Mar 2024 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkLMeqRQ0VUhMQLL1ezK3J50/OF3pNwxrky8boh7AIM=; b=MQle9MTSdVuX20
	tqxeC9xFrIJgxVzP/dEnqvgXNZJYoZSuUr94guT6jN82JQGwiXz53tKmNGbYcHLVIgv+rdXkxz96l
	qWiyrS/dDpUEaXJnjrSpvxEu2wGMAECWSitKrqRrMvKdnBbn6lHE0hUlQhzG/nADG5gCdkY2lMG/R
	aiyhXX2HKRq9gmf0UyOMBLB1cwEbpzlcMRHZT5DPALD/kBdfkM5CfFf5lnvaIpsBjhfE3WZSIn+yB
	bgUxLv+U2BGWOHG4keNeLU+ycfObDI3s0/x/e0go5okFNwZYkBy7yAPRSJVrTuFCApzT8RnCkqmo/
	R/P81dAC0NlbZN4RD0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlOgW-00000002dYZ-1PQt;
	Sat, 16 Mar 2024 07:42:28 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlOgS-00000002dXP-3te0
	for linux-riscv@lists.infradead.org;
	Sat, 16 Mar 2024 07:42:26 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6e6808c7bf5so278878a34.1
        for <linux-riscv@lists.infradead.org>; Sat, 16 Mar 2024 00:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710574941; x=1711179741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBPpCGPm72Cb2qGJkp1BJBbjbsRni3kHlr8127B2i6Q=;
        b=ZrhISaV83IFczYmy1tKFNr4Xm/6ar4avlDsIIa43HyWUYKYvE+0AmaazWRMjvNiq5K
         KNe2hZKzRiIsscbkd9mOw/+WAyMgUnnB+a5OyCU6mcHEttd8Ypmd+QnKen6oWSUDMoCh
         0NzHCrmFa4a4fcGzPfxTW/ZzpNRhlVwW1GQ6fzBM6Tn917j28sN7EtJG8MqGZh8askMD
         9L2npCUxxL6NCDoFE1hkIxKN77RKqgxgVQtt8t8TCPkqaygFB8rnLPESh8hswShVBNeZ
         vic/SQr+VY8w19NNCyUQhQyeprNy1K5PT4xBVTjfHM1ZwAjtGP78RGe2C5iQ2qxTfVxV
         v5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710574941; x=1711179741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBPpCGPm72Cb2qGJkp1BJBbjbsRni3kHlr8127B2i6Q=;
        b=bo/MAZd+TT05VvnRb1UKlmKS7639bxMF0FoUk/WSvc5DcUxb/VSxE3Zckm0E9fVyVC
         6fwIV2JkcWR/VkUT9NwzVkFiyVhelG0Rqy3Psv6Ul6+aXuXnJN+IyX/V4hi5KjCNMyk+
         Qxg6go376OHjhk4+0JzybHN+wAbOXweSbco8IzmUs/UbD7kO8LstPLiLFrf6nG5xESaK
         Vxwt9uiCyAsEpbKMI7hiuyt/cl4zBhT+6GQ8/KEp86FmatSlwhP7anKQcRN81Lj0RCUF
         2ujJ1emMv1Hdh+v9t024rGMj5eQcJ3N9U+HXv40TRdT/TmW3d920Jio9IVKv51H5xZbO
         syXw==
X-Forwarded-Encrypted: i=1; AJvYcCW0XVUNT9NrL/IIqdCp7C28JBagIU5df/YeZ6H4Fm2ogPRXWLtvpc87jD1aim0T/SKRAin01f9XJE9te3d5JsYWErxh+X8KS8f8I3K0pTrO
X-Gm-Message-State: AOJu0Yy77/q94HvbFN88ifKnzYBcxz50VZAjMCy2x5vD0spf51rX1LKQ
	vpY5u+nKUgUVO37Ntfrv57x+3+uWSSuCZokLT2zKgqy+nGZO++0a1B5zlGg5hwmDKXPEPvlrvYe
	jzQdX5HapanX0940m09wxSDpSUpk=
X-Google-Smtp-Source: AGHT+IHFNWlMLUEZGtMU5YFLrS1fjFOJ1VLXDJxxjl14Ouo+4V1Hu0pW2Hgiyq5Bpke3rnCc4Mt1Lm0rTUKZ3zYrE1c=
X-Received: by 2002:a05:6820:20f:b0:5a4:93b6:9a5 with SMTP id
 bw15-20020a056820020f00b005a493b609a5mr297421oob.4.1710574940386; Sat, 16 Mar
 2024 00:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240314100131.323540-1-qiujingbao.dlmu@gmail.com>
 <20240314100131.323540-3-qiujingbao.dlmu@gmail.com> <ZfT42gzJhVd1NQzd@xhacker>
 <jtqqbpr4qeo4m5oetmmusf2hy2wy6hnpstl344p2hu62vbbqrk@tefqeoqf37jh>
In-Reply-To: <jtqqbpr4qeo4m5oetmmusf2hy2wy6hnpstl344p2hu62vbbqrk@tefqeoqf37jh>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Sat, 16 Mar 2024 15:42:09 +0800
Message-ID: <CAJRtX8TV7AEC7_owA819X_NzTS9Y6WdbHED1NQZWWfTK_zYcww@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jisheng Zhang <jszhang@kernel.org>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_004225_190525_36ACC7AC 
X-CRM114-Status: GOOD (  11.25  )
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

T24gU2F0LCBNYXIgMTYsIDIwMjQgYXQgMzoyMuKAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBPbiBTYXQs
IE1hciAxNiwgMjAyNCBhdCAwOTo0MTo0NkFNICswODAwLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+
ID4gT24gVGh1LCBNYXIgMTQsIDIwMjQgYXQgMDY6MDE6MzFQTSArMDgwMCwgSmluZ2JhbyBRaXUg
d3JvdGU6Cj4gPiA+ICtzdGF0aWMgdm9pZCBjdjE4MDBfcHdtX3NldF9vZShzdHJ1Y3QgcHdtX2No
aXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgdTMyIG1vZGUpCj4gPgo+ID4gRGlkIHlvdSBnZXQgYW55IGluZm9ybWF0aW9uIGFi
b3V0IHRoZSBjYXB0dXJlIHN1cHBvcnQgcHdtIGNvbnRyb2xsZXI/Cj4KPiBJbnN0ZWFkIG9mIGFk
ZGluZyBjYXB0dXJlIHN1cHBvcnQgdG8gdGhpcyBwd20gZHJpdmVyLCBJJ2QgcmF0aGVyIHNlZQo+
IHN1cHBvcnQgYWRkZWQgdG8gdGhlIGNvdW50ZXIgc3Vic3lzdGVtLiBUaGF0J3MgbW9yZSB2ZXJz
YXRpbGUuCj4KPiBTZWUgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcHdtL1kzYXplM0I2
JTJGZTV1V1MlMkZIQGZlZG9yYSBmb3IKPiBzb21lIG1vcmUgY29udGV4dC4KPgoKVGhhbmsgeW91
IGZvciB5b3VyIHN1Z2dlc3Rpb24uIEkgd2lsbCBhZGQgc3VwcG9ydCBmb3IgdGhlIGNvdW50ZXIg
c3Vic3lzdGVtCmFmdGVyIGNvbW11bmljYXRpbmcgd2l0aCB0aGUgaGFyZHdhcmUgZGVzaWduZXIg
YWJvdXQgdGhlIGlucHV0IGZ1bmN0aW9uIG9mIFBXTS4KRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rp
b25zIGZvciB0aGlzIHBhdGNoPwoKQmVzdCByZWdhcmRzCkppbmdiYW8gUWl1CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
