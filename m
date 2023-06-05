Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4FCC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mreCR9iQEWAYSn+ZvG08zPe19wGuSgXvp7jT7Ue2DP4=; b=hBrNnG/fWCg106
	ctmUJm2i5yFigLhyHh+Ku6cEmYNtk2DeyiPMj45er6q1Ldjd0lCtoWzmC+nVli7Nta0HX289EYrJT
	mjxHFdwZXIUGsE4+HZMwxArAtnAHxiBoCmbLMJ2bKZ3Dch1zYxHp9V6b3h7K9yZAhx8NB4Zc8xmD5
	CA0qcywFEPRKmViwk9BiF0Zi9gkk9qYPWWASSTSqcE3fhmIIaLOBg+SYRX7/ub/TeHAnTvQD8ArdV
	RuqpMyD5lWWlFgxkZTx2n6Ou2gAxYMccyqu7Qdp5hZPM/MFDYpuPmMHJuL7q2AoAgJO2PpY9eTQxt
	XY2c9TFfBomyFTOvZNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q66KI-00Eof3-0G;
	Mon, 05 Jun 2023 09:16:34 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q66KE-00Eode-21
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 09:16:32 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-75ebccc2c9bso28096285a.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685956589; x=1688548589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WHls5vQFZx80W/l+gbncXvHnqH5QXt3iJI8lxFm3PY=;
        b=RvdmEXVrXmbQI2SNhDHXQn58R9uc/X1bJV3eGNsZOms4wgvJjzHPAwHnCifgJk/xoM
         LxccJgt+FkYAnCYsOBD4ElnbsfKlVBLcOqM3T9f1xNJ0DuENh2wU6itfZd119Abb3CpB
         Ap95gJxWDBNNgCS6lauQkBG1eCBMUlS6LfD1wUYnzP3/YqKhJc0vo3iaXPmVhtTsWQW6
         4fMjFcnvT1Lx/CJMaztpeFfta4GYC1ThHuDr8ks+tRSJsezRFeGb/w2DChVFkIev976Q
         5imGwEfqpQBCv6Ws0dTkAlL2z46acaBHCM8pc+8oZHq6/iqaRcrs2ds7yT2rUANVJAnG
         5NvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685956589; x=1688548589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WHls5vQFZx80W/l+gbncXvHnqH5QXt3iJI8lxFm3PY=;
        b=SnSOYdu7vrg/C/kRGqH7K3v4R1LqDpgp+0JHycXMx4IwTxoXsyd69JfPEEo3aFHmsi
         KDKcFgZdE6SKXslG/94nMGWkObEdCUh8pAYPWmwcbeSQeSc0JpN/eHHvs7vVROdsM3XB
         4Dh/lcaXsP5i/+tELBLYFF5mS9V1fgbe6JFQ0LrM8hVg8xamnFSb1HmDNCXlRTfvRwKN
         9xUzWcPZ5ywew71J8kZZu1+zvvKzlGN8cdNTX2FRSQRiKZilL1NYUeCzIZ6FyEN8MkiI
         faZdoDsGUHF8xnpM6rWrfYSbrYEb0FQGmtHOiV4B4WIUVUufA7R0jg0lneioQMkTjbGL
         onAA==
X-Gm-Message-State: AC+VfDw9pjeYzhomlUxUlJXDNaV6LkyxfmAJcV5hfom4wE1BYyXxX41L
	X7saMnl2BVqAoIOoCPUSkqqyy/8Rm7nm/ujuMqKZd/tA6iU=
X-Google-Smtp-Source: ACHHUZ5kXZxKvvxXL3/TR98yQ+T0PWRC6NTnlWLGlp/Hz0N7wSOgU/8gUGP9yTCgRo1kncIYrxzV9T5ydQn55sjCmKs=
X-Received: by 2002:a05:620a:2702:b0:75e:c23f:82ee with SMTP id
 b2-20020a05620a270200b0075ec23f82eemr452792qkp.64.1685956589268; Mon, 05 Jun
 2023 02:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230605014850.9591-1-jiasheng@iscas.ac.cn> <CAHp75VdZct58EiLDL0ebCvcQBVMzuZxJZ8z=bs8D2UDaCsuo9A@mail.gmail.com>
In-Reply-To: <CAHp75VdZct58EiLDL0ebCvcQBVMzuZxJZ8z=bs8D2UDaCsuo9A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Jun 2023 12:15:53 +0300
Message-ID: <CAHp75VcO2LRFyZV0nsmMsPRHByStyQ5AzeWSM9S99Qh60=UHvQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sifive: Add missing check for platform_get_irq
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, brgl@bgdev.pl, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_021630_661861_DF490F83 
X-CRM114-Status: GOOD (  12.96  )
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

T24gTW9uLCBKdW4gNSwgMjAyMyBhdCAxMjoxM+KAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5keS5z
aGV2Y2hlbmtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biA1LCAyMDIzIGF0IDQ6
NDnigK9BTSBKaWFzaGVuZyBKaWFuZyA8amlhc2hlbmdAaXNjYXMuYWMuY24+IHdyb3RlOgo+ID4K
PiA+IEFkZCB0aGUgbWlzc2luZyBjaGVjayBmb3IgcGxhdGZvcm1fZ2V0X2lycSgpIGFuZCByZXR1
cm4gZXJyb3IgY29kZQo+ID4gaWYgaXQgZmFpbHMuCj4KPiBSZXZpZXdlZC1ieTogQW5keSBTaGV2
Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgoKQWN0dWFsbHksIHRoZSBjaGFuZ2Ug
aXMgZnVuY3Rpb25hbCBhbmQgbm93IHRoZSB3cm9uZyBJUlEgbnVtYmVyaW5nIGluCnRoZSBEVCB3
aWxsIGZhaWwgdGhlIC0+cHJvYmUoKS4gVGhpcyBuZWVkcyBhbiBhZGRpdGlvbmFsIGV4cGxhbmF0
aW9uCmluIHRoZSBjb21taXQgbWVzc2FnZSB3aHkgaXQncyBub3QgYSBwcm9ibGVtLgoKPiA+IC0g
ICAgICAgZm9yIChpID0gMDsgaSA8IG5ncGlvOyBpKyspCj4gPiAtICAgICAgICAgICAgICAgY2hp
cC0+aXJxX251bWJlcltpXSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgaSk7Cj4gPiArICAgICAg
IGZvciAoaSA9IDA7IGkgPCBuZ3BpbzsgaSsrKSB7Cj4gPiArICAgICAgICAgICAgICAgcmV0ID0g
cGxhdGZvcm1fZ2V0X2lycShwZGV2LCBpKTsKPiA+ICsgICAgICAgICAgICAgICBpZiAocmV0IDwg
MCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArICAgICAgICAg
ICAgICAgY2hpcC0+aXJxX251bWJlcltpXSA9IHJldDsKPiA+ICsgICAgICAgfQoKLS0gCldpdGgg
QmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
