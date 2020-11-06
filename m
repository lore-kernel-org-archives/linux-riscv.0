Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2400CC2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 11:00:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74A7721707
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 11:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aS35SZvs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="K3GEevu5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74A7721707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1z2aUgyoAC5cvG2rm5Y6Vs0FjADm/xSfjplXnVgj8gk=; b=aS35SZvsC4NYn2EDDx0/zQ26J
	1Rn39TVDerAMo4xOf8gib/bCl5uTDVqSSV7sZjO9//9LG5nimXg1hhTHo67aF5yqWzAXB+ncKTZtN
	hoX4d2ms/D930U/aTYO31N8T/ypJKe9gf7u7QJcdUmEK/GPypBc4fzXL1ACXK8k8oagvuOAp+SPLl
	+Jw4NIqSMvFE7SfO7T+aXiY/Br0hwE8f48NnYLZRNH+GZ7Q0pYeHdhqq7vLB6o2sz+qV3Tf1nepCW
	y8JXljuS5aDaenwau2VhBm2VMQZ/DG5rydFKYCaw+FXLjLBvCCEFBfujEX/Njub25WCgD2gUeiNpT
	67IG0Yi7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kazTc-0007XB-Ns; Fri, 06 Nov 2020 11:00:16 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kazTZ-0007WG-Te
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 11:00:15 +0000
Received: by mail-qk1-x743.google.com with SMTP id y197so643455qkb.7
 for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2020 03:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5scwP+FH/3TvdU9cRBPIGfL9OLQBWnAyRxebsQvYQJw=;
 b=K3GEevu5XTiJFobdS3WdtKWhU/wb279WC0tnyvUS0zrqS+1hRZU39kLzr6Rs2Rs4Ct
 RnA0QI/duInuNOTC8svzJEUEgB+Zy/BsCor7akvZoBtUE5sACyi9u5NFoHdi30UnIM7q
 zaZ0izVo/c09fKHF4D/7D6TWLdSZ3YT99RFC5TF0OVrbzY8mNmAYKhmnbDOc9Wm+JITd
 TKUC8zR9IakSoFyRx8uXTFhEOT4hyPv7p7IbpwDVvLZ0O31a4BDmyGxXLApCEI0fA4Tc
 cRkT8DhvvKS6XCVkl15e2vE37m6na9YhMXtGgvYchipGxSTryUijvuK32I7bIg1y26g5
 EUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5scwP+FH/3TvdU9cRBPIGfL9OLQBWnAyRxebsQvYQJw=;
 b=oWF/9cp9nwxZqJQdnwCO2itgroDbfycBHUZYhPJDQoXMn63kNaCjpMR/2tJRrBmBZA
 t7WDyaxkasuA2/woS/iBcJfiMZLHbRba/n7rCnj8lz0I5F30ySUQDxOG+ZUy7xsxxYUD
 4Qb4rwq04LWiXNwKJ3cRsZNgTtA1eJMURMS94GZ5R9eHOH0H9BRsHeEo2/J0J0igzdVp
 Y/MqpZgJnk8YqwTYdpLGqPFcxwjRsV+CylPz48tZsX2zX4d4yvsVg5Wf54GyZwv1ORNb
 hPIZaNAejt8+IvbCeQkAOnDi32vxHdEQDXnc0DvJKdKREcahSBcqe6dXH+ilLOvMqGZ4
 5X1g==
X-Gm-Message-State: AOAM532VDJQj91SIDdgV19Auec7vttvNTZPflmBr4yX2f6hFznztswRB
 IjjlreCJtedlWAERLxevEUIzJTQTt92rYQA4H4uY6g==
X-Google-Smtp-Source: ABdhPJxmBJPFRCR+nFRfwqYH/BeX2Cb8nVliVSyYYIlw2cTORTY+RQImlwv64qv/wrg8lt7wtPkrBioMM43NnhfAjSI=
X-Received: by 2002:a05:620a:697:: with SMTP id
 f23mr831545qkh.374.1604660411776; 
 Fri, 06 Nov 2020 03:00:11 -0800 (PST)
MIME-Version: 1.0
References: <802c8865b70c3bdf70e44d37f14e7767b6495e88.1604631371.git.greentime.hu@sifive.com>
 <CAHp75VdHuZc43Oe8vp-Xtb2+vsEoV2FY-W_dAifuh4Un0BveSA@mail.gmail.com>
In-Reply-To: <CAHp75VdHuZc43Oe8vp-Xtb2+vsEoV2FY-W_dAifuh4Un0BveSA@mail.gmail.com>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Fri, 6 Nov 2020 19:00:00 +0800
Message-ID: <CAHCEehKfnUtuzoHQ=XSAzm5n0JqUHmYmjMCyLo2uRvYXc=GwYA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] gpio: sifive: To get gpio irq offset from device
 tree data
To: Andy Shevchenko <andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_060014_274467_0D36BAA4 
X-CRM114-Status: GOOD (  16.62  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiDmlrwgMjAyMOW5tDEx
5pyINuaXpSDpgLHkupQg5LiL5Y2INToyNeWvq+mBk++8mgo+Cj4gT24gRnJpLCBOb3YgNiwgMjAy
MCBhdCA0OjU5IEFNIEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+IHdyb3Rl
Ogo+ID4KPiA+IFdlIGNhbiBnZXQgaHdpcnEgbnVtYmVyIG9mIHRoZSBncGlvIGJ5IGl0cyBpcnFf
ZGF0YS0+aHdpcnEgc28gdGhhdCB3ZSBkb24ndAo+ID4gbmVlZCB0byBhZGQgbW9yZSBtYWNyb3Mg
Zm9yIGRpZmZlcmVudCBwbGF0Zm9ybXMuIFRoaXMgcGF0Y2ggaXMgdGVzdGVkIGluCj4gPiBTaUZp
dmUgVW5sZWFzaGVkIGJvYXJkIGFuZCBTaUZpdmUgVW5tYXRjaGVkIGJvYXJkLgo+Cj4gLi4uCj4K
PiA+ICsgICAgICAgc3RydWN0IHNpZml2ZV9ncGlvICpjaGlwID0gZ3Bpb2NoaXBfZ2V0X2RhdGEo
Z2MpOwo+ID4gKyAgICAgICBzdHJ1Y3QgaXJxX2RhdGEgKmQgPSBpcnFfZ2V0X2lycV9kYXRhKGNo
aXAtPmlycV9udW1iZXJbY2hpbGRdKTsKPgo+ID4gKyAgICAgICAqcGFyZW50ID0gZC0+aHdpcnE7
Cj4KPiBUaGVyZSBpcyBhbiBBUEkgdG8gZ2V0IGh3aXJxLgo+Cj4gLi4uCj4KPiA+ICsgICAgICAg
Zm9yIChpID0gMDsgaSA8IG5ncGlvOyBpKyspCj4gPiArICAgICAgICAgICAgICAgY2hpcC0+aXJx
X251bWJlcltpXSA9IGlycV9vZl9wYXJzZV9hbmRfbWFwKG5vZGUsIGkpOwo+Cj4gQ2FuJ3QgeW91
IHVzZSBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCk/Cj4KClRoYW5rIHlvdSBmb3IgcmV2aWV3
aW5nLgpJIHdvdWxkIGNoYW5nZSBpdCBsaWtlIHRoaXMuCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cGlvL2dwaW8tc2lmaXZlLmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1zaWZpdmUuYwppbmRleCBlOGNk
ODc0MWRiYWUuLmJmYjkxNWJmNWQ3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tc2lm
aXZlLmMKKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tc2lmaXZlLmMKQEAgLTE0NSw3ICsxNDUsNyBA
QCBzdGF0aWMgaW50CnNpZml2ZV9ncGlvX2NoaWxkX3RvX3BhcmVudF9od2lycShzdHJ1Y3QgZ3Bp
b19jaGlwICpnYywKIHsKICAgICAgICBzdHJ1Y3Qgc2lmaXZlX2dwaW8gKmNoaXAgPSBncGlvY2hp
cF9nZXRfZGF0YShnYyk7CiAgICAgICAgc3RydWN0IGlycV9kYXRhICpkID0gaXJxX2dldF9pcnFf
ZGF0YShjaGlwLT5pcnFfbnVtYmVyW2NoaWxkXSk7Ci0gICAgICAgKnBhcmVudCA9IGQtPmh3aXJx
OworICAgICAgICpwYXJlbnQgPSBpcnFkX3RvX2h3aXJxKGQpOwogICAgICAgICpwYXJlbnRfdHlw
ZSA9IElSUV9UWVBFX05PTkU7CiAgICAgICAgcmV0dXJuIDA7CiB9CkBAIC0yMDIsNyArMjAyLDcg
QEAgc3RhdGljIGludCBzaWZpdmVfZ3Bpb19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogICAgICAgIH0KCiAgICAgICAgZm9yIChpID0gMDsgaSA8IG5ncGlvOyBpKyspCi0gICAg
ICAgICAgICAgICBjaGlwLT5pcnFfbnVtYmVyW2ldID0gaXJxX29mX3BhcnNlX2FuZF9tYXAobm9k
ZSwgaSk7CisgICAgICAgICAgICAgICBjaGlwLT5pcnFfbnVtYmVyW2ldID0gcGxhdGZvcm1fZ2V0
X2lycShwZGV2LCBpKTsKCiAgICAgICAgcmV0ID0gYmdwaW9faW5pdCgmY2hpcC0+Z2MsIGRldiwg
NCwKICAgICAgICAgICAgICAgICAgICAgICAgIGNoaXAtPmJhc2UgKyBTSUZJVkVfR1BJT19JTlBV
VF9WQUwsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
