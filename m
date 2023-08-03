Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C45C04A6A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 13:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YkIPntMGqhAsGU4rRvWexzF6Ix7+49eR+GSe6zdI9w4=; b=gHNUXsN53OI+iZ
	jo6XlicjJFmOksvWx4N7K0/3yMNUiDvtPf+V2pzkXYlMBO+4TSgZKZJp8RVnoXE+E1LSephujqS4P
	AdLjnXjDucukiQUAw04T1oji2VMuMI4i1U/CfuCQha62H5on6YSXtfK/DkweKMeI1z8ez8xvsjf67
	zMB72gQWyxekIT7HLKez2F7Wpogscd0x7WCHHcb1Q2YXNRCwkVrn0VtkOpHiSCrPfhKL9QOwnB8j6
	hVDKF0pqeEfuW2KaTHamYNieU3vz5/Mq/fvUhpOzEOSRyNalzy31kXg7uaht7GazavQhd/GH57jOs
	VUkMWuaeOURPOodhCJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYgy-009ELS-1b;
	Thu, 03 Aug 2023 13:48:40 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYft-009DLh-1V
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 13:47:34 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4866270a5eeso1381241e0c.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 06:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691070449; x=1691675249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7qFNZbvxgKG/pfY+414xL5ZiFLKcO5iJ+7JnPY1dJ0=;
        b=46v6sODuFGuLTBNGZoqWdv3+za2sbTFewm9q1l0lTnB+g86wGO6TuGO/pfZ10C9AmB
         2NSMud/3VMy8xzPxUHBISukNd9qUR2N4PpuFPiBn95tXWOHq+ItOSaRr9P9IUdF3+KQ7
         ulnEuM21PA+PGOK6YXXTYeUi6SIkItkA7aw0cocwyNjfIqvFu7G0ZiU0xG5r261npbJP
         TIso/5HvzMUVOp4RtwS+i1PnN1SLSx3kqMu5nZS6kB8HwQ9osfiMTCwV+NvrR4BxbAx9
         dR5ygkvJPS84KhmyHUz3ud5WiIfeZlX769gy4JZLPHuYCmQXzh8fxjaV7EK4D3KKKQHz
         ncdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691070449; x=1691675249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7qFNZbvxgKG/pfY+414xL5ZiFLKcO5iJ+7JnPY1dJ0=;
        b=MT2b5pJoe1Uyn1kq6CMK0zur+AwRmCVez/b2/2bQPyrlfK3KDvRZrVWouyfgFYdSp+
         sSHE6g69WYs4lCIQMEcJOzegT31oNQpFDidysQdtfODOa2dIo4DIi6ILS/hgYLLqDVTc
         X+5eO6hHJzU9qON9cE/8nlEGwh4jg65D0sS2U8WA7XQBY1fktL8mnBcM4mN4hJ6mMizD
         NVcYcm5z2DPSOkWJyf87wCarWZRpik1KGVgreoK0C58bGcVVs5XRMZAwSKKo9e5ZBYTl
         NM4Lj0J8JnldPMdnQMsff+GCxgek+glf3ERgIA9g17zEz4y8TGij1tQG1VI9lCEw91Y8
         CVUw==
X-Gm-Message-State: ABy/qLbiQfiVL9Eu7+lhwv4WlN2ySs3s2eYt1+Jwsoyhu9+RGUHK0ye9
	s+BlzswnAGqaxBjYEp2UULrNV90w8CFvxMpCCwForQ==
X-Google-Smtp-Source: APBJJlEW7QgXMaP6hNgSxspZLwMEVYePiMLubm3nRuwMgxqw+0ATUbGqvX0TrxmWCcS92cLTjbfneZWZQ9RE8nP/49c=
X-Received: by 2002:a05:6102:508a:b0:439:3e26:990e with SMTP id
 bl10-20020a056102508a00b004393e26990emr4507298vsb.6.1691070449442; Thu, 03
 Aug 2023 06:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230801074430.5179-1-aboutphysycs@gmail.com>
In-Reply-To: <20230801074430.5179-1-aboutphysycs@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Aug 2023 15:47:17 +0200
Message-ID: <CAMRc=MdCmK4K-KNtnqzuSjgHu-Z1Aai2qAeXikp9mkdQJVuRFA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: remove unneeded call to platform_set_drvdata()
To: Andrei Coardos <aboutphysycs@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	andy@kernel.org, linus.walleij@linaro.org, 
	Alexandru Ardelean <alex@shruggie.ro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_064733_505312_43B23403 
X-CRM114-Status: GOOD (  18.92  )
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

T24gVHVlLCBBdWcgMSwgMjAyMyBhdCA5OjQ04oCvQU0gQW5kcmVpIENvYXJkb3MgPGFib3V0cGh5
c3ljc0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBmdW5jdGlvbiBjYWxsIHdhcyBmb3VuZCB0
byBiZSB1bm5lY2Vzc2FyeSBhcyB0aGVyZSBpcyBubyBlcXVpdmFsZW50Cj4gcGxhdGZvcm1fZ2V0
X2RydmRhdGEoKSBjYWxsIHRvIGFjY2VzcyB0aGUgcHJpdmF0ZSBkYXRhIG9mIHRoZSBkcml2ZXIu
IEFsc28sCj4gdGhlIHByaXZhdGUgZGF0YSBpcyBkZWZpbmVkIGluIHRoaXMgZHJpdmVyLCBzbyB0
aGVyZSBpcyBubyByaXNrIG9mIGl0IGJlaW5nCj4gYWNjZXNzZWQgb3V0c2lkZSBvZiB0aGlzIGRy
aXZlciBmaWxlLgo+Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWxleEBzaHJ1
Z2dpZS5ybz4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWkgQ29hcmRvcyA8YWJvdXRwaHlzeWNzQGdt
YWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncGlvL2dwaW8tc2lmaXZlLmMgfCAxIC0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8v
Z3Bpby1zaWZpdmUuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXNpZml2ZS5jCj4gaW5kZXggYzZhOGQy
Mzc0ZTMxLi4wMDEwZjYwN2E5ZWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tc2lm
aXZlLmMKPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1zaWZpdmUuYwo+IEBAIC0yNTksNyArMjU5
LDYgQEAgc3RhdGljIGludCBzaWZpdmVfZ3Bpb19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+ICAgICAgICAgZ2lycS0+Y2hpbGRfdG9fcGFyZW50X2h3aXJxID0gc2lmaXZlX2dw
aW9fY2hpbGRfdG9fcGFyZW50X2h3aXJxOwo+ICAgICAgICAgZ2lycS0+aGFuZGxlciA9IGhhbmRs
ZV9iYWRfaXJxOwo+ICAgICAgICAgZ2lycS0+ZGVmYXVsdF90eXBlID0gSVJRX1RZUEVfTk9ORTsK
PiAtICAgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHByaXYpOwo+Cj4gICAgICAgICBy
ZXR1cm4gZ3Bpb2NoaXBfYWRkX2RhdGEoJmNoaXAtPmdjLCBjaGlwKTsKPiAgfQo+IC0tCj4gMi4z
NC4xCj4KClRoaXMgcGF0Y2ggZG9lcyBub3QgY29ycmVzcG9uZCB3aXRoIHRoZSBjb2RlIHVwc3Ry
ZWFtLiBQbGVhc2UgdmVyaWZ5LgoKQmFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
