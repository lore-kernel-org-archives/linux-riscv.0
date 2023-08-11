Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EDFC001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 11:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jp/HB7PKzPa9KDAQyH2ZSSULNqCcIp2/6tTgahY8yPQ=; b=odb3nlUvJo8zfv
	FL8lA4Ju7uDxdvnR7tRyMpabGxhhdTxjE4oGUt03E+wVuwXyossARZlksOv+dsU2CUknOY3J31Dy2
	i9s2xKB10XlALZnQf1GJcBuioGfQWSwXC8bp8HwbTdk20bMMkKwNOI+KAIqlmEtCnm1Mb28x9stFu
	6AVqeUqmI5ckX9xqraJqurq69OiCAv+7IuUzxNqAq/93WvfWKxFz/6Umr30j/o3XLAZRhJJt+wn3a
	P+BGWcj+u2EnbAAfGw2q89kgVsMDoQRGn+kxnZjscA3pTexKXmC/fKBYe/b9aYEo/29qAy099ui6I
	ZQOBG2yXeaZLltLZDF7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQK3-00ASGH-1C;
	Fri, 11 Aug 2023 11:28:51 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQK0-00ASF1-1o
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 11:28:50 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe44955decso2183331e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691753322; x=1692358122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yjUhmd36Rsf2srBU/TiioBiCFM53JBI1jUHGB1t5n0=;
        b=Ags1tvporP0kJQzrFLZikT9mijblxfWeIaeYI6qOMsZODGrfLuGiUCipZtW1LUJnZJ
         HHYWsoUz0mI8qGC+mzO6wHGe5wUstLg0l/PCryAs6CX93JLmWIKuScbvtABVmuN9mgEX
         rAU+zTZLN3EKaFiUSCG+zABvWwGuTbE5178BoHvLVFDDGsOF6Jvb3cjdM8hV/Amnmq+O
         t8nAI1oRkZArCU6Ir3Qon9c8vsJXGwvbuI0vwNbCHwT+1eMUPBhPF0cGq9w2lbCmqtRX
         zV/W1ujpsOtskDk/yadwIsOLQVHry7mzmpjehN+GUi7qAEdyNPL1fUUOHPWX4N0lFY/1
         YEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691753322; x=1692358122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yjUhmd36Rsf2srBU/TiioBiCFM53JBI1jUHGB1t5n0=;
        b=hRJnn8BZU9CyPZth2XUIGC6SPeVOtPSLFS3A6+W7R3QEZLcpQ0diCF+fymo2J6FKO0
         tq5qZQddAklHeshMT3Hfh+yfQ6jVWwOIFKnimBPdC0OKmUPeYOYiBhtmZFyO5RBpRq7p
         GDLO90UunO0tOxrXme26w5UP9J8M4O9tvBXZuJvh1dgaQx8ZPE4IaYUgi9AX2yvYofTC
         DxXLy+pNJEvcswGJGO5J3RnqHwyi7dPf9wAybYCD36eqhFSspQE4Ei8EBr2PgDxuBD6l
         DZ7PrsFsLlZhTm8axg2+7HC51IZIR1bo/+vRIsdLk0oAQLyRCCn4KVvEEfmbskDMdE8l
         MhJA==
X-Gm-Message-State: AOJu0YyziTyjLk8Uswy+M22CIjK5a4YZrP+utj4KcMdcF8mv1hCIzJQ6
	eQGHyRFgpEu+wrL8tw5PVKb8V5ca7+yNGgRtz3Owmg==
X-Google-Smtp-Source: AGHT+IEe6Il5VXbASq3yZu/bwh9LqpoMnvX6UcmmuFUBpdpMAxqo3brZn83Dgz+BFL9OJw0SW8tFRg2db9PY90LzFuk=
X-Received: by 2002:a05:6512:3d9e:b0:4f9:dac6:2f3d with SMTP id
 k30-20020a0565123d9e00b004f9dac62f3dmr723221lfv.13.1691753322061; Fri, 11 Aug
 2023 04:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230803230110.904724-1-greg.savin@sifive.com>
 <alpine.DEB.2.21.2308091008500.25915@angie.orcam.me.uk> <CADdv1FqjLPZ-eWOKPv0uZxF-u-SYjn0WJGr3KWW9H06-O0L35w@mail.gmail.com>
 <alpine.DEB.2.21.2308092247280.25915@angie.orcam.me.uk> <20230810103510.GA2509@hsinchu26>
 <alpine.DEB.2.21.2308101231560.25915@angie.orcam.me.uk> <alpine.DEB.2.21.2308101436450.8596@angie.orcam.me.uk>
 <CABgGipUXWK3XSQNnY66z1EaOeLDrqJnW0bSCmSCv11xMiVppAg@mail.gmail.com> <alpine.DEB.2.21.2308102151450.8596@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2308102151450.8596@angie.orcam.me.uk>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 11 Aug 2023 19:28:30 +0800
Message-ID: <CABgGipVELGquM=bQhDYQj-z9tN3s1jS_fygfZGriodEmOGP+iA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: support for vector register accesses via ptrace()
 in RISC-V Linux native
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Savin <greg.savin@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Oleg Nesterov <oleg@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, gdb-patches@sourceware.org, 
	Andrew Burgess <andrew.burgess@embecosm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_042848_660542_98315815 
X-CRM114-Status: GOOD (  26.36  )
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

T24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgNToyMeKAr0FNIE1hY2llaiBXLiBSb3p5Y2tpIDxtYWNy
b0BvcmNhbS5tZS51az4gd3JvdGU6Cj4KPiBPbiBGcmksIDExIEF1ZyAyMDIzLCBBbmR5IENoaXUg
d3JvdGU6Cj4KPiA+ID4gPiAgTm8sIGhvdyBkbyB5b3UgZXhwZWN0IGl0IHRvIHdvcmsgd2l0aCBh
IGNvcmUgZHVtcCAodGhhdCBjYW4gYmUgZXhhbWluZWQKPiA+ID4gPiBvbiBhIGRpZmZlcmVudCBz
eXN0ZW0sIG9yIHdpdGggYSBjcm9zcy1kZWJ1Z2dlcik/ICBZb3UgbmVlZCB0byBjaGFuZ2UgdGhl
Cj4gPiA+ID4gQVBJIEknbSBhZnJhaWQ7IGl0J3MgdW51c2FibGUgYW55d2F5LiAgSXQncyBhIHBp
dHkgdGhlIHRvb2xjaGFpbiBjb21tdW5pdHkKPiA+ID4gPiB3YXNuJ3QgY29uc3VsdGVkIGlmIHlv
dSB3ZXJlbid0IHN1cmUgaG93IHRvIGRlc2lnbiB0aGUgaW50ZXJmYWNlLiAgQmV0dGVyCj4gPiA+
ID4geWV0IGl0IHdvdWxkIGhhdmUgYmVlbiB0byBpbXBsZW1lbnQgdGhlIEdEQiBzaWRlIGJlZm9y
ZSB0aGUga2VybmVsIHBhcnQKPiA+ID4gPiBoYXMgYmVlbiBjb21taXR0ZWQuCj4gPgo+ID4gSSBq
dXN0IHRvb2sgc29tZSBsb29rIGludG8gdGhlIGNvZGUgYW5kIGhlcmUgaXMgd2hhdCBJIGNhbWUg
dXAgd2l0aC4KPiA+IEFjdHVhbGx5LCB5b3Uga25vdyBWTEVOQiBpbiBhIGNvcmUgZHVtcCBmaWxl
LiBUaGUgc2l6ZSBvZgo+ID4gTlRfUklTQ1ZfVkVDVE9SIGluIGEgY29yZSBkdW1wIGZpbGUganVz
dCBlcXVhbHMgc2l6ZW9mKHN0cnVjdAo+ID4gX19yaXNjdl92X2V4dF9zdGF0ZSksIHdoaWNoIGlz
IDQwQiwgcGx1cyBWTEVOQiAqIDMyLiBTbywgdGhlIGRlYnVnZ2VyCj4gPiBjYW4gYWN0dWFsbHkg
Y2FsY3VsYXRlIFZMRU5CIGFuZCByZXNvbHZlIHBsYWNlbWVudCBvZiBWIHJlZ2lzdGVycyBieQo+
ID4gc3VidHJhY3RpbmcgNDAgZnJvbSB0aGUgc2l6ZSBvZiBOVF9SSVNDVl9WRUNUT1IgaW4gYSBj
b3JlIGR1bXAgZmlsZS4KPgo+ICBGYWlyIGVub3VnaCwgSSBkaWRuJ3QgZGl2ZSBpbnRvIExpbnV4
IGNvZGUgZGVlcGx5IGVub3VnaCB0byBmaWd1cmUgb3V0Cj4gdGhhdCB0aGUgc2l6ZSBvZiBhbiBO
VF9SSVNDVl9WRUNUT1IgY29yZSBmaWxlIG5vdGUgaXMgaW5kZWVkIGR5bmFtaWNhbGx5Cj4gY2Fs
Y3VsYXRlZC4gIE1vc3Qgbm90ZXMgYXJlIG9mIGEgZml4ZWQgc2l6ZSwgYnV0IHdlIGFsc28gaGF2
ZSBnZW5lcmljCj4gc3VwcG9ydCBmb3IgdmFyaWFibGUtc2l6ZSBvbmVzIGluIEdEQiwgc28gaGFu
ZGxpbmcgdGhpcyBjYXNlIHNob3VsZCBiZQo+IHJlYXNvbmFibHkgc3RyYWlnaHRmb3J3YXJkLgo+
Cj4gIE9UT0ggVkxFTkIgaXMgYSBwcm9ncmFtLXZpc2libGUgcmVnaXN0ZXIsIHNvIEkgdGhpbmsg
aXQgd2lsbCBiZXN0IGJlCj4gcHJvdmlkZWQgZXhwbGljaXRseSByZWdhcmRsZXNzIHJhdGhlciB0
aGFuIGhhdmluZyB0byBiZSByZWNvbnN0cnVjdGVkIGZyb20KPiB0aGUgc2l6ZSBvZiB0aGUgbm90
ZTsgSSB3b3VsZCBmaW5kIHRoYXQgYXdrd2FyZC4KCkFncmVlZC4KCj4KPiAgTkIgSSBoYXZlIGJl
ZW4gYSBiaXQgY29uY2VybmVkIGFib3V0IHRoZSB1bnVzdWFsbHkgaHVnZSBhbGxvY2F0aW9uIHNp
emUKPiBvZiAyNTZLaUIrIGZvciB0aGUgcmVnaXN0ZXIgYnVmZmVyIHJlcXVpcmVkIGZvciBwdHJh
Y2UoMiksIGJ1dCBJIGd1ZXNzCj4gd2UnbGwgaGF2ZSB0byBsaXZlIHdpdGggaXQsIGJlY2F1c2Ug
YW55IHNvbHV0aW9uIHRoYXQgbWFrZXMgaXQgZHluYW1pYwo+IHdvdWxkIGFsc28gY29tcGxpY2F0
ZSB0aGUgaW50ZXJmYWNlLiAgQXQgbGVhc3Qgd2Ugd29uJ3Qgd2FzdGUgZmlsZXN5c3RlbQo+IHNw
YWNlIGZvciBhbnkgZXh0cmFuZW91cyBhbGxvY2F0aW9uIGluIGNvcmUgZHVtcHMuCgpJdCBpcyBw
b3NzaWJsZSB0byBtaXRpZ2F0ZSB0aGlzIGNvbnNpZGVyYXRpb24gd2l0aCB0aGUgcHJvcG9zZWQK
c29sdXRpb25bMV0sIGJ5IGNhbGxpbmcgdGhlIHB0cmFjZSB0d2ljZS4gRmlyc3Qgd2UgbWFrZSBh
IHB0cmFjZSBjYWxsCnRvIG9idGFpbiBWTEVOQiBpbiBzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0
ZSBieSBzZXR0aW5nIHRoZSBhcmd1bWVudAppb3YubGVuID0gc2l6ZW9mKHN0cnVjdCBfX3Jpc2N2
X3ZfZXh0X3N0YXRlKS4gVGhlbiwgd2UgY2FuIGFsbG9jYXRlIGEKYnVmZmVyIGJhc2VkIG9uIHRo
ZSByZXN1bHQgb2YgdGhlIHByZXZpb3VzIHB0cmFjZSB0byBnZXQgdGhlIGZ1bGwKVmVjdG9yIHJl
Z2lzdGVycyBkdW1wLgoKPgo+ICAgTWFjaWVqCgpbMV06IGh0dHBzOi8vc291cmNld2FyZS5vcmcv
cGlwZXJtYWlsL2dkYi1wYXRjaGVzLzIwMjMtQXVndXN0LzIwMTUwNy5odG1sCgpBbmR5CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
