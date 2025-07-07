Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBFCC83F15
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQi2yXEBhqXMgmVlhtHDwf1Wty1WFraJZSJ0/3X4nBs=; b=xD0PDH8FyXDF+R
	Y9AqnWEHbJ8vDFRyQX3PE8uYB3wBMJZHZUCxZUITcC+eE7b/sxjzSInUbt/fyAGZ9xc0SQJtwPUHZ
	w9ROeEonuuc2XlDtEyEPIA4ZIwoce0NRtGz99KC1/GrnQxwEW6u3+aKqfEBqn9+ppkfCh+5FM1zNu
	YcQcNYSIOw/izk9iSlBFFp4TnAoRDo5NInBBhPz3Q7SfPYu8qT0hRkmWi0p1HxaLCZM5zLcf4oyAM
	HK/Rjs7mE525RQfsOpaHZcFuQnX3+u0Mcehw+uewhK//cZIiCb1PB/DnfSTXY7qdwxt1Xf6il0VTI
	H383TIPdAjYtopZTMptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYj3z-000000029Ed-1lnN;
	Mon, 07 Jul 2025 10:27:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiWM-000000023Ig-1zbu
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 09:52:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1707459f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Jul 2025 02:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751881941; x=1752486741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXqFqGPfF+AW+wteaTEiwFi6gfdID37R12FXEDON8Cg=;
        b=EADKwARxgyE7lHKi3lTtP//jeafSOAFsM2FZgFLJSj+IGOr+7a4WrOjg+LRs+dexqn
         wdmWkKUSuX26BDE+r8fPxKOiJxy2ajf23R/O7C7qPIVEr9HtAIXLHdQd6phYl9H/DUHY
         yH5ICNceWPKJZ+Yqw4rCM/xtz4mOUNvdU+9dNWcG/tQzdah6ZHqlmFYgxxqRxuxc6rXq
         Iocb51+nk+tleYrM+Ufkp/pAbLf5IEkHpu8HO9YO2rBjJM6qHL1D0pICn9bMB1YMNpSv
         yVf75Wj8GiJR52ZbILRrufBa/ioz7Pd4vzIqUHJbFtyBNhVvVDW4RHBG9lFbGOvSzT1p
         VM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881941; x=1752486741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXqFqGPfF+AW+wteaTEiwFi6gfdID37R12FXEDON8Cg=;
        b=DDQEDixU/nqe5uBRq2WPqNxPO6JYi4fravIxyVxN34VMFcTtfy4rYSDtCrD9yq15PS
         pyZwezFGDc7/w+BoiL2twudtPG8DTMHW5fGzuHGR5JVudXxDk9KdEyAVvjdOf538Rng8
         IaAruJho2CMtzwbzvYlJPjAhajLMmjUUxSqlgkJk7VOd+dfOf1bln7kATKQQ/5PEGbF3
         nhoZSijssrYtxTzyxOuOMZWCyk0ZSeFVf+aKj2uCW0cwtt9AdH0MLS1Q3C0AOoF4FgYb
         NtTSMZgo9XamIV+m6NJdXFsaqNOhKiFyDKBOEovVFrTKfYJUWiIQuvIlRJILvI2h0Fiu
         mEEA==
X-Forwarded-Encrypted: i=1; AJvYcCXeRaY3mYyIwmAWvTbLsekORZ87vlfQHZFhctNW7OAIp/uJ4AaKbpdE5Pfl3JgoDtgtfcdg05cuyitPJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcfxZSyxJ91Pj8Z3pDGZ1qzaOJvalTH622+4FszjFbrYkTTTrE
	bGNNU42PYpXdgAJiSqvEaTuslrlHmiv7izRUfRAOxnqOJ8ZWIrKK1uCqHWwPN9eUa7Vpf8nUrsi
	0XhV+zupzAlc1zTcIQqXm62GjXLg+DwE=
X-Gm-Gg: ASbGncsq9fDfMSSG/e7+vWtsYn8RdikQJyeDTwJ4ex8uf+3TdklWhWmfrS8GU9hd2iw
	rvjy2Q44qu0gZjc2Xc0DAtWKR0ueupX48Ci2JxviUTjPZc+7Beb7PnHaZiVrXBpofx/jaAUFKLz
	4wpNQLfXYCJK3f32tDsmMLdhP10fL4RoE0GZPdH+fUkDTjeA==
X-Google-Smtp-Source: AGHT+IGCWmZhb0r9sYITwhkx4phvDYGw0yLaPOftSXO4F/VMYxZRVNmoGGfSVxUPKVSCtCXeM9hZJCmRyjyHgQZxDpM=
X-Received: by 2002:a05:6000:208a:b0:3a5:2698:f65d with SMTP id
 ffacd0b85a97d-3b4964dedf7mr8113866f8f.27.1751881940919; Mon, 07 Jul 2025
 02:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250704081451.2011407-1-ben717@andestech.com> <20250704081451.2011407-4-ben717@andestech.com>
In-Reply-To: <20250704081451.2011407-4-ben717@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Jul 2025 10:51:53 +0100
X-Gm-Features: Ac12FXzomKy393V9aXimk4vifIzB-hw8ENrGJMrYh6XFujGnzhanbBX2A8ZFbvk
Message-ID: <CA+V-a8tdtRNh6WMV7RUyr4h99o3OqOU1HnajU0t4i7GHFKykTA@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: interrupt-controller: add Andes QiLai PLIC
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: arnd@arndb.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	soc@lists.linux.dev, tim609@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_025222_532356_DBAA38C7 
X-CRM114-Status: GOOD (  12.27  )
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

T24gRnJpLCBKdWwgNCwgMjAyNSBhdCAxMDowMuKAr0FNIEJlbiBab25nLVlvdSBYaWUgPGJlbjcx
N0BhbmRlc3RlY2guY29tPiB3cm90ZToKPgo+IEFkZCBhIG5ldyBjb21wYXRpYmxlIHN0cmluZyBm
b3IgQW5kZXMgUWlMYWkgUExJQy4KPgo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9i
aEBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEJlbiBab25nLVlvdSBYaWUgPGJlbjcxN0Bh
bmRlc3RlY2guY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIv
c2lmaXZlLHBsaWMtMS4wLjAueWFtbCAgICAgICAgIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+ClJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+CgpDaGVlcnMsClByYWJoYWthcgoKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9s
bGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+IGluZGV4
IGZmYzQ3NjhiYWQwNi4uNWI4MjdiYzI0MzAxIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAu
MC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKPiBAQCAtNTMsNiArNTMsNyBAQCBw
cm9wZXJ0aWVzOgo+ICAgICAgb25lT2Y6Cj4gICAgICAgIC0gaXRlbXM6Cj4gICAgICAgICAgICAt
IGVudW06Cj4gKyAgICAgICAgICAgICAgLSBhbmRlc3RlY2gscWlsYWktcGxpYwo+ICAgICAgICAg
ICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDMtcGxpYwo+ICAgICAgICAgICAgLSBjb25zdDogYW5k
ZXN0ZWNoLG5jZXBsaWMxMDAKPiAgICAgICAgLSBpdGVtczoKPiAtLQo+IDIuMzQuMQo+Cj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
