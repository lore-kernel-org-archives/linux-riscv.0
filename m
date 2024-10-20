Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A58AD3C92A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AbhQwS1O3HP5rmjSbvsw2o0/5y80SNhcwCK/bYrzZqM=; b=iEGofi7V5SE3iD
	YActHu+8n788TXNXTMrP5KPLTR2f37SOsbi9D8oX6kfe0ENa2HZYU0lsruLKLAxn6a78M16yL98+H
	tv50bmKrB4c9iI7zFnC6k2jg2kga73tpDyRUFg+yshUjum4gDq6vwGEgV+o6/0vBRYagfntdoUNZk
	A8tt+TkdneS1NGPEPzggRRgvwEUJPgHNjlVMB95/uBpmY9+vyIXzaYd8k0DnrVVn9xYLpQZhMTldW
	mY3rnpWz7YMTkmcj8MFO/W/dad3HUDbml14m0Ws1ObsWQz0cfRUuyttWgtp7iR5Tl6t51fGjO6Z3H
	9RrTAzMjTYM75Q5gbs7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Vxj-00000004vOA-12xI;
	Sun, 20 Oct 2024 13:27:15 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Vxf-00000004vNn-2zm3
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 13:27:13 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4608e389407so43503841cf.2
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1729430830; x=1730035630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBJzOYlqjsdcPdk0yMInJK2l8n0pk3Q6fRoZHJOBNDg=;
        b=rGNzmzSJjw2ThXqopYa38kbsEdpuzqfAATKkLtaDBm+OJKJGJaEinoe3x1e/T1Z7kA
         fMY6PNZCV9lB64V/kKgvuOW7t/DCApkOdJJTjSMEoBTpp2Tmluywqe6uNYC2gcCVB8vH
         azVi8XSbHcUGIjg/Zn36k7yEoMdH37G9R3IGy1eO3VhIfWXHjwzspUbj/eC0IqMTdkQF
         xpYvxVUK4GOe+6kJqflY9b3W/8uhc9rzmy2iizEMY/KJUk1i1TwFKNt44BUxFuqGsi6R
         AdpbUeWHLXR5kCelEPw/c51ZHbmIolErqYJbYuls3u8eUTYhcLuy4fv2ikdThJu4fZZX
         JSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729430830; x=1730035630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBJzOYlqjsdcPdk0yMInJK2l8n0pk3Q6fRoZHJOBNDg=;
        b=NQciuN8GVj6ctSc2Yyk3YEcrka8DM0suCnQ/UzLNXKrqP2G/UdaM1FjOOfd91PIsD4
         RFAREM2arojmmL1gNQdbsiRh2Bz9W5bdjJX13gYCgaXVNn76JPFRtTUT+APlb3XvApD/
         3idjaDQq1yDSzyXkUXKC4LS/KldREt1N6/bMAEbqeRxr3W3xsTt1I6pgKO/E9fTukzE5
         VhmZdHKAdIJkjY8h/+pbOCQrFnXo4jyQ7IDA182vLjUamdDU5ce9GTn8EcUhwTVpx0BH
         mp2BZiCXBUe1IJyFpfSMu+N0HItAzXPYGvu3VUMPpzLvzj3P/y93POj/JIFmkb+Op9f3
         lMJw==
X-Forwarded-Encrypted: i=1; AJvYcCVwzAV1ql7RvNS+OwCqVtfrlw0uxsjJZ+eXBC9YlLpckVIHAG7WkAW/5VdQPh1f6jGhLH9hEQGeBSaM5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3WY2RRizAMl8PK8jSd8wfkH3lvf5Vk0MsmCz0tYRUV1WtZ9IS
	vWhAT1xoeWx3uTCQCWJzjoVCxZWxSFqePN4MpgBY6h5BSEmH507IECAumC5R4hHH4aUGdkseODt
	R8JKF8HVivap34KOJUllJra6cm/P1N8qAulz7lA==
X-Google-Smtp-Source: AGHT+IGnWYenAH+ICS/UFFfkdYgfxAxxgdD8o/QX9kkC8wcWWq8eVoZ/61fjMkC/c+9rFwRbkiM8CbwF/i+45YR+acg=
X-Received: by 2002:a05:622a:4d2:b0:460:92fa:f72e with SMTP id
 d75a77b69052e-460aed75b47mr141603281cf.33.1729430830268; Sun, 20 Oct 2024
 06:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241019162605.308475-1-guodong@riscstar.com> <20241019162605.308475-2-guodong@riscstar.com>
 <2024102029-populate-footage-755a@gregkh>
In-Reply-To: <2024102029-populate-footage-755a@gregkh>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 20 Oct 2024 21:26:57 +0800
Message-ID: <CAH1PCMa4BK2eaVYSmckSDtGr6uhMEF12jHzHwqz-hnKFbQrFRw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor: add deepcomputing
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, rafal@milecki.pl, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko.stuebner@cherry.de>, Michael Zhu <michael.zhu@starfivetech.com>, 
	Drew Fustini <drew@beagleboard.org>, Alexandru Stan <ams@frame.work>, Daniel Schaefer <dhs@frame.work>, 
	Sandie Cao <sandie.cao@deepcomputing.io>, Yuning Liang <yuning.liang@deepcomputing.io>, 
	Huiming Qiu <huiming.qiu@deepcomputing.io>, Alex Elder <elder@riscstar.com>, linux@frame.work, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_062712_038317_CBF066A9 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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

T24gU3VuLCBPY3QgMjAsIDIwMjQgYXQgMjoyMeKAr1BNIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90
ZToKPgo+IE9uIFN1biwgT2N0IDIwLCAyMDI0IGF0IDEyOjI2OjAzQU0gKzA4MDAsIEd1b2Rvbmcg
WHUgd3JvdGU6Cj4gPiBGcm9tOiBTYW5kaWUgQ2FvIDxzYW5kaWUuY2FvQGRlZXBjb21wdXRpbmcu
aW8+Cj4gPgo+ID4gRnJvbTogU2FuZGllIENhbyA8c2FuZGllLmNhb0BkZWVwY29tcHV0aW5nLmlv
Pgo+Cj4gTml0LCBmb3Igc29tZSByZWFzb24gdGhpcyBzaG93cyB1cCB0d2ljZSwgc2FtZSBmb3Ig
cGF0Y2ggMi8zIDooCj4KClRoYW5rcyBHcmVnLgpJIHdpbGwgZml4IHRoYXQuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
