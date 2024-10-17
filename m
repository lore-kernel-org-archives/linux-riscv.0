Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DC2D2F7E1
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 02:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rc98Ne4wqOhPYG/kq+JG/cq2tTYdRBP7njiu/6opjuI=; b=pDCOOpzFapFnmx
	KEjb+gG3+wSK6MCmQr1FUx5XvvYpfuMtgghC4Dd6cfb4ESryRN6aJBZUDV3Hm4a+Q8v1QGm3+aKEM
	DdCaI+xQ2duAl284oJWUoKeExmVNEy2hevhZso2W5/wuriQcnJXci4puuV64415cWAFlKWkOOc0KY
	Z3youl1SboH/DDiyC39iDe9s2X513hgPtCKktaBSpyIBDxP9Qf92jb7Vkk3dtWp8+kvHTkZZeAPqN
	IHl2EcBfShPNprBaRoqArtwCxe5dmxz8zTCGcQmaeIQtW13RPJauvRKu7Z5oYFNwguKwtcbYrSalZ
	gWoZA4G77bolz+Dx9s/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1GhU-0000000DbRE-1XDE;
	Thu, 17 Oct 2024 02:57:20 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Gel-0000000Db7C-1sFN
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 02:54:33 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso822735a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 19:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729133669; x=1729738469; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLxmOw/KJpTCPuMZfngsa+JDKUmVUuEwD65qtQ7UoWU=;
        b=NoockulwxEspQAMDw2t+rvaBVElbmuCJkXVxzcy5qAffsaKqebU/5xEnTS4H/HxVRC
         oAldx/atWQhHmGyeUx32sPZcHUW6zGJgPmk/m3F/gm561L+0xgveoizmlkbVASsjXmgd
         loTFJyeAcCdh6qi7lL8S8vBtWYb8O6/FZzphXKNOSB2OD4NM+qJFwDmfWwmCaMH7mQZC
         eftruXiJwu1jIvu7jt/w9LDyp7lmE0P2ZQFVY9VA4CwmBZiVn6cg4887FeOlaWNbLQTB
         aK6QQrbFKu/qWm2UpUzDUdmyDZVkZWSb2/D+5VO4EYsGaKe/VI8Uqt05twIngChtqQu1
         wOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729133669; x=1729738469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLxmOw/KJpTCPuMZfngsa+JDKUmVUuEwD65qtQ7UoWU=;
        b=CbekavYHR4mk2R+kd8xC/yGt5OLaXseJuXJ+bhXIp3QlDjfjHDTmPEfSyhNCXKFpId
         lFg3Zrdnyfo5l5cJXPKwvbfP/XbI+VFYApO5TBc2AW09iMhlWus0ARKrfQE44eKpMpAt
         NZue0LQWZFA5IVs3bV7GFEQ0VUCM6Oar6vbgCblFby9ATRLW3iyRG4cPGxoBFyTKXfsi
         OBOC7aTQGasRkMZHfbA6J8a03BRhf+I15C5xHWpwThnK+vyAwSIU0nG2OzdqNUw6M5w6
         hUILM+HEnPtvNwGL45ELDlpeG1I7/+cAxg8w3hUEebAohU7xFGJh44/uI8KeMjM0eCKK
         hIEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7VqozWHnnz4zw98P5LV9pRLJVz9vtGPAgzYWYubUX0bwAKIfsNxh+XLI15clUiNB6BovSHkcwJc4ilg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzriqwIsslFm/rA0zWILDAeh4oss0xW5XKJrGmg1mBSoFVbisCw
	qsag8OQZcc8I4JCpIzN2xFf+wE3ewYZXLvTzlc25sqbg/PyF1EL+FZklbr9p5DN5hZ63jGMS0Ui
	7DMgDdHoGeTIRl7fzoZZLnny8KHa1ng4S7SGDXg==
X-Google-Smtp-Source: AGHT+IHJr0xtyYJ73R4TB29Xaxtuba8FwbpRz+j+A4yiemcdfoXx5LoOn1+I+zgJ2gBD6GfkFXcv7FUmqsgjZ2m9e3Q=
X-Received: by 2002:a05:6402:1e8a:b0:5c8:957a:b1e2 with SMTP id
 4fb4d7f45d1cf-5c948adff84mr13751317a12.0.1729133669244; Wed, 16 Oct 2024
 19:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241016134223.4079-1-everestkc@everestkc.com.np> <2f82fbcb-4a3c-4dfe-8852-7fc0b27c38e4@linuxfoundation.org>
In-Reply-To: <2f82fbcb-4a3c-4dfe-8852-7fc0b27c38e4@linuxfoundation.org>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 16 Oct 2024 20:54:17 -0600
Message-ID: <CAEO-vhFkT6RwR6h7KRD0YyQphhuqm0d53xj7xp7r3gco+DxwHg@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: th1520: Dereference pointer only after
 NULL check
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, 
	linus.walleij@linaro.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_195431_535061_88150C7B 
X-CRM114-Status: GOOD (  20.77  )
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

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMzowMOKAr1BNIFNodWFoIEtoYW4gPHNraGFuQGxpbnV4
Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gMTAvMTYvMjQgMDc6NDIsIEV2ZXJlc3QgSy5D
LiB3cm90ZToKPiA+IFRoZSBwb2ludGVyIGBmdW5jYCBpcyBkZXJlZmVyZW5jZWQgYmVmb3JlIE5V
TEwgY2hlY2suCj4gPiBNb3ZlIHRoZSBkZXJlZmVyZW5jZSBhZnRlciB0aGUgTlVMTCBjaGVjay4K
Pgo+IENoYW5nZSBsb2cgbG9va3MgZmluZS4KPgo+IFNob3J0IGxvZyB0aGF0IGNsZWFybHkgc2F5
cyBpdCBpcyBhIGZpeCB3b3VsZCBiZSBiZXR0ZXI6Cj4KPiBGaXggcG90ZW50aWFsIG51bGwgcG9p
bnRlciBkZWZlcmVmZXJlbmNlCj4KPiA+Cj4gPiBUaGlzIGlzc3VlIHdhcyByZXBvcnRlZCBieSBD
b3Zlcml0eSBTY2FuLgo+ID4gUmVwb3J0Ogo+ID4gQ0lEIDE2MDA4MDI6ICgjMSBvZiAxKTogRGVy
ZWZlcmVuY2UgYmVmb3JlIG51bGwgY2hlY2sKPiA+IChSRVZFUlNFX0lOVUxMKQo+ID4gY2hlY2tf
YWZ0ZXJfZGVyZWY6IE51bGwtY2hlY2tpbmcgZnVuYyBzdWdnZXN0cyB0aGF0IGl0Cj4gPiBtYXkg
YmUgbnVsbCwgYnV0IGl0IGhhcyBhbHJlYWR5IGJlZW4gZGVyZWZlcmVuY2VkIG9uIGFsbAo+ID4g
cGF0aHMgbGVhZGluZyB0byB0aGUgY2hlY2suCj4gPgo+ID4gRml4ZXM6IDFmYzMwY2Q5Mjc3MCAo
InBpbmN0cmw6IHRoMTUyMDogRmFjdG9yIG91dCBjYXN0cyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBF
dmVyZXN0IEsuQy4gPGV2ZXJlc3RrY0BldmVyZXN0a2MuY29tLm5wPgo+ID4gLS0tCj4gPiAgIGRy
aXZlcnMvcGluY3RybC9waW5jdHJsLXRoMTUyMC5jIHwgNCArKystCj4gPiAgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtdGgxNTIwLmMgYi9kcml2ZXJzL3BpbmN0cmwvcGluY3Ry
bC10aDE1MjAuYwo+ID4gaW5kZXggNzQ3NGQ4ZGEzMmY5Li4wN2Y4YjUxZmIyOTQgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC10aDE1MjAuYwo+ID4gKysrIGIvZHJpdmVy
cy9waW5jdHJsL3BpbmN0cmwtdGgxNTIwLmMKPiA+IEBAIC04MDMsMTEgKzgwMywxMyBAQCBzdGF0
aWMgaW50IHRoMTUyMF9waW5tdXhfc2V0X211eChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYs
Cj4gPiAgIHsKPiA+ICAgICAgIHN0cnVjdCB0aDE1MjBfcGluY3RybCAqdGhwID0gcGluY3RybF9k
ZXZfZ2V0X2RydmRhdGEocGN0bGRldik7Cj4gPiAgICAgICBjb25zdCBzdHJ1Y3QgZnVuY3Rpb25f
ZGVzYyAqZnVuYyA9IHBpbm11eF9nZW5lcmljX2dldF9mdW5jdGlvbihwY3RsZGV2LCBmc2VsKTsK
PiA+IC0gICAgIGVudW0gdGgxNTIwX211eHR5cGUgbXV4dHlwZSA9ICh1aW50cHRyX3QpZnVuYy0+
ZGF0YTsKPiA+ICsgICAgIGVudW0gdGgxNTIwX211eHR5cGUgbXV4dHlwZTsKPiA+Cj4gPiAgICAg
ICBpZiAoIWZ1bmMpCj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4KPiA+ICsg
ICAgIG11eHR5cGUgPSAodWludHB0cl90KWZ1bmMtPmRhdGE7Cj4gPiArCj4gPiAgICAgICByZXR1
cm4gdGgxNTIwX3Bpbm11eF9zZXQodGhwLCB0aHAtPmRlc2MucGluc1tnc2VsXS5udW1iZXIsCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGgxNTIwX3BhZF9tdXhkYXRhKHRocC0+
ZGVzYy5waW5zW2dzZWxdLmRydl9kYXRhKSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtdXh0eXBlKTsKPgo+IE90aGVyd2lzZSBsb29rcyBnb29kIHRvIG1lLiBXaXRoIHRoZSBj
aGFuZ2UgdG8gc2hvcnQgbG9nOgo+Cj4gUmV2aWV3ZWQtYnk6IFNodWFoIEtoYW4gPHNraGFuQGxp
bnV4Zm91bmRhdGlvbi5vcmc+ClRoZSBwYXRjaCBzZW50IGJ5IGFub3RoZXIgcGF0Y2ggc3VibWl0
dGVyIGhhcyBhbHJlYWR5IGJlZW4KYXBwbGllZCBmb3IgdGhpcyBpc3N1ZS4KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjQxMDE2MTU1NjU1LjMzNDUxOC0xLWNvbGluLmkua2luZ0BnbWFp
bC5jb20vCj4gdGhhbmtzLAo+IC0tIFNodWFoCj4KVGhhbmtzLApFdmVyZXN0IEsuQy4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
