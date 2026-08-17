Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96183C5DF7A
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 12:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evXdgnI9uX66FCmLTnI7vTVT/4YRwxZc7ddlEURaQSY=; b=I86Dvb+XSKQj0e
	nuVx2rRvr+vcCtAjndAOyOWI+wBLZZOF4qD8is3a87w4tjj5zPMGhKLv0Nm9+geeNr2QFdSWMhNMt
	3/rIpvFwfYFDkuxRpJWGXSHzqFxUr//+hVQA/CMrZIhGL6NgqfW1ddK9/1p4ORVMrwIiQvicyYkhJ
	niCzrgdLykR5iVZsR5fzK+XY+943ZnVRnxr+OPKeaUhDHr9FBTCXGz8fFDtraK+Dtc5gbutxgcizR
	MZ2D7xnJvbxavi3F2uiH6uUnVzjAZNl5SzpyKxzst+wo6BbMRv0nSx1RtkB0j38HDeBglvx28ISsc
	Pj45XNbRGGVqmDNxKvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwih-000000069HO-0NJj;
	Mon, 17 Aug 2026 12:45:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwif-000000069Gv-2Sho
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 12:45:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC5AA42DC4
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 12:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B391F00A3A
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 12:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786970736;
	bh=gRi3Hl6kL53OCVaT6AtkoZdIORGc+PqsHeHnyxChSbI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NX8pzzZ6WYCsuaSCNmOBg6Ii5Ep1KStDBG3auZPy1zuzzU9n3S7JQOi2NmQFANO8G
	 ksSZrVoKGpqvx6KsikmqziEmYfwhtGdJnfSAxqGpzOL+4Ynlq0oWJtcXH14mOKspZt
	 dODfQZ/X0JHRa6MlxvnxjciBO9CAzIC7lWsSNseKI6u6WKv7hy2wYEbg/e0HaXJ5ce
	 +fHiTRHfQDbZMvFpPBZJCmmUSuE9IvZSp0bsYHFCDBFy4gLmIcxJH5/tgxBHklaJa5
	 VzcZpMOykl7xoEM0RoZpTBa4cJl4NDJc6FnwtBj07/fUBxUl66EZRVV7WJUnNoSpxT
	 iLJSCURbo55zQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so2942261e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 05:45:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrGo8yow8nzD+fmPtriT55eqrIUZ+MAxCwdqHeXCMb9GmT+0ZjAOBSsGnNqkY+95e6Fb4Q/7ae+SjXWiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxRUa1yfe8GB5uZZ97nvfKrMK2zDz3F9iYhG0U3mAriC2byu/H
	L6XtLqYlTHAYbtkYHg/qo/dgIqVfM276V1WZLl4SBrC+eXyl1xuK2DwPY1YgFPMLWuf7VwR8rY9
	Ehqt6PitieEgRgNnEWZEYaOzpvCF2kNY=
X-Received: by 2002:a05:6512:3d9f:b0:5b2:e6a6:af72 with SMTP id
 2adb3069b0e04-5b47069f791mr41452e87.28.1786970735583; Mon, 17 Aug 2026
 05:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260810144012.GA1574021-robh@kernel.org> <ZQ4PR01MB12020D2031C400FF805791B7F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ZQ4PR01MB120275B9C0CF6BCE8C88261CF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260814-shapeless-onyx-pronghorn-d423a9@quoll> <ZQ4PR01MB12022F6D6F71542033CF857BF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQ4PR01MB12022F6D6F71542033CF857BF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 17 Aug 2026 14:45:22 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Q38HwraN1NEOxLf_hE+k=3Q6JP+DUgQsThfYve0t0RA@mail.gmail.com>
X-Gm-Features: AcwNN1V6zplB90pHlStjSOoEPiNttfHYnU2qXaCxmbT30t1V6M1l1ZLtNygTX0E
Message-ID: <CAD++jL=Q38HwraN1NEOxLf_hE+k=3Q6JP+DUgQsThfYve0t0RA@mail.gmail.com>
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Alexandre Ghiti <alex@ghiti.fr>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Bartosz Golaszewski <brgl@kernel.org>
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

T24gRnJpLCBBdWcgMTQsIDIwMjYgYXQgMToyMuKAr1BNIENoYW5naHVhbmcgTGlhbmcKPGNoYW5n
aHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cgo+ID4gWW91IHN0aWxsIGRpZCBu
b3QgZXhwbGFpbiB0aGUgY2VsbHMgLSBuZWl0aGVyIGluIHJlcGx5IG5vciBpbiBjb21taXQgLSB0
aHVzIHN0YXJ0Cj4gPiB3aXRoIHRoYXQuIFdoeSBkbyB5b3UgbmVlZCBpdD8gTXVsdGlwbGUgY29u
dHJvbGxlcnMgaGF2ZSBncm91cHBlZCBwaW5zIG9yCj4gPiBHUElPcyBpbiByZWdpc3RlcnMsIHNv
IGV4cGxhbmF0aW9uICJldmVyeSAzMiBHUElPcyBjb3JyZXNwb25kIHRvIG9uZSByZWdpc3RlciIK
PiA+IHRlbGxzIG1lIG5vdGhpbmcuIFdoeSB3b3VsZCB0aGF0IG1hdHRlciBob3cgbWFueSBHUElP
cyBpcyBpbiBvbmUgcmVnaXN0ZXI/Cj4KPiBTaW5jZSBldmVyeSAzMiBHUElPcyBjb3JyZXNwb25k
IHRvIG9uZSByZWdpc3RlciwgTGludXMgc3VnZ2VzdGVkIGF0IHRoZSB0aW1lIHRoYXQgSSBjb3Vs
ZCB0cnkgdXNpbmc6Cj4gZ3Bpb3MgPSA8JmdwaW8gW2luc3RhbmNlXSBvZmZzZXQgZmxhZ3M+Owo+
IGdwaW8tcmFuZ2VzID0gPCZwaW5jdHJsIFtncGlvX2luc3RhbmNlXSBncGlvX29mZnNldCBwaW5f
b2Zmc2V0IGNvdW50PjsKPgo+IFRoZSBhZHZhbnRhZ2Ugb2YgdXNpbmcgdGhpcyBpcyB0aGF0IGlu
IGEgR1BJTyBjb250cm9sbGVyIHdpdGggbW9yZSB0aGFuIDMyIEdQSU9zLCBldmVyeSAzMiBHUElP
cwo+IGNhbiBiZSB0cmVhdGVkIGFzIG9uZSBHUElPIGJhbmsuIFRoaXMgd2F5LCBpbiB0aGUgZHJp
dmVyLCBjb252ZXJ0aW5nIHBpbl9vZmZzZXQgdG8gZ3Bpb19vZmZzZXQgZG9lcwo+IG5vdCByZXF1
aXJlIGEgbGFyZ2UgbnVtYmVyIG9mIC8zMiBhbmQgJTMyIG9wZXJhdGlvbnMuCj4KPiB0aGUgZm9s
bG93aW5nIGlzIExpbnVzJ3Mgb3JpZ2luYWwgc3VnZ2VzdGlvbiBhdCB0aGUgdGltZQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUQrK2pMPXR2REJXSkhSR0dKdzRubm94X2tjSktuNWh3
dnd6OXp4YWRNUmVkeXZSaHdAbWFpbC5nbWFpbC5jb20vCgpKdXN0IGNvcHkgdGhpcyBleHBsYW5h
dGlvbiBpbnRvIHRoZSBjb21taXQgc28gaXQgaXMgY2xlYXIgd2h5IHlvdQpuZWVkIHRocmVlIGNl
bGxzIGZvciB0aGlzLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
