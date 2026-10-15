Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3696CC6B39
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 16:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+1iI3czEy25Z3rdMo6pXMvtKf6Ep3iMA2ieckQrvfE=; b=HidYiMdjzFqkjz
	kr8bB+Po4/ojIgZOqpfg8AWrTsSdbigxasQMbmUJrLbt6Sxt45y9r1pS1aZyo+6SUOB8QIUMvNK/r
	Ur3x9rQ2cGGDwibxZoNsnMIZYXe/eyFpF5a+iZ8GvH2xq0T+tPqtEK2w+6tFSHtf+uSvi9QWkRmAa
	4hcuzkI2qnYNozFaQ+C3Uh633sqwLpd8N2P4rIzRs40XV3y134gu2ac46RuOqXS8nVJ4BGFy5jM93
	nlqgOgy7FggI4J6p7PfeeY1PLnhWldxNgq50d6VK2m8KiVIaTqGZTaVPbeZQVgGaZMrIeLnwyukgF
	HrHYqL4ih05qHX2cKCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOmx-00000000vBI-1Zs3;
	Thu, 15 Oct 2026 16:58:44 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOmv-00000000vAN-0FIO
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 16:58:42 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8ad98c3fb15so46399657b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 09:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792083520; cv=none;
        d=google.com; s=arc-20260327;
        b=Hr4Evryq1ez88M0+LmCVc8RytnsmOjUx44ws/8enkLF3fUDGggAIfKFXDZTclGcZai
         FKQWhUx/T6jMnp+IiidBhTVgYfP6rkHEM0LYVbaOvEaMjOfdxj9fd8r/XBGzTjyfcD5r
         SxgC2aOcwHB2pr5e93NbQ6gkXhUca8xMCCxhuwsFzx93kqjT61f34FSjoFEnsGrNsU9k
         FMPGNJyixPy2flBCN9PWOIUhXTwwiE18Qmmvf41g2sVXJM5JcIkXf6xGeaGZo9RPjbCQ
         viaqWaPhXA7RVLgvNSJ5bOC5qqXeb7MHdaSWg6ouduPpfq3bkXHvmzQciXqAeEyYRz33
         ofsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NcCmfl6RTkm2LzfDS0fLA+Gp1Mg192MPyS3Ly+HKDr4=;
        fh=8giVz39X+wwUBXZjBgkA8IioM4oJRGnexwBCnswOSro=;
        b=L9Do/8wD9XefwAnNnffjWRfXqnIFJVpDKpnmdNUyZEoB8GQClgFfVdA0t3n0YlOwUW
         mzL5PGIXVBS1qfazZm51U+Auvc40/6+kgBWl24YkpnN56Z1S/bG1/zawtQiYwVzMiDAm
         o/aMIIGhJQ9yI2Ywxqx8Has7j7DYvK2gpExpqGanz3c5EVyDda3D4UtCRsXhZcWVbNqr
         3w0tYsRO9ODeXCxCTnxoYI5yKMMOVOdqRra1pIpRaQrc22wBBHkYFVsj0W6PYseYlSK5
         axL5EuOoZb0CnOtK540UyoFWDG24PjbnQG8PiJ+W9UJzYkywCHLx2snGjrnMrG9jK5HK
         UGrw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792083520; x=1792688320; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcCmfl6RTkm2LzfDS0fLA+Gp1Mg192MPyS3Ly+HKDr4=;
        b=Su9vYgq6ONRJBcwIlBXEufZ8iJ4vei/Wyy2h+ow9/uige0VvjtplwNn4NRe9XKIO7l
         RcMtXJGBRxdvHET/ar74LjSfZidHY8S+/ldFeBzW/PoblVmJ51FGjdQnE4Lb5MsgCRNA
         xbmi0n0vRuSpFK7DjuhOpO3aE9AYNRDL/kqOcjLROj76eqz97q+EHBCwgHhk//SJhnRr
         aDs3xCxam4NknJ+RqaFtQ4pBt7P0cSUpk12ancLiRmo5qkZ02u584Sc6IqHmkLywYUMz
         KqSgBqGhW/iudwcIbSGF6/xvcuklcFmR60hM16hZObCAI3xqFnu2VAkYayZz6wZSVw02
         jB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083520; x=1792688320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcCmfl6RTkm2LzfDS0fLA+Gp1Mg192MPyS3Ly+HKDr4=;
        b=y6nHBIjuUr5M0UCcbgISK7Evh0tJ8fgi+xS/oTtk8QSY9clQI2NWKS6fUYn8+Z4yOu
         NmoidWaFGgtR5ezeU8NDF2rjfMdaadiNr9AHSvVMvk6EEDsKuDEq02Snt3tLsVgY2CLc
         rJ/C/HLcnxRfC1yOFzB6Yc/2mdXhw7Q1/y6Aabh228tGgAvELEW8AgNJY4XRX+2CErYi
         I/cwiFAuVCtuBCXT1fssdJ5AXhjPzKmqh3aAiRCa3jKqS9Eu8Opuv4A9BC/4LgD/H5pm
         ByB72hgm7Azum2UwEYTOgJ0Ux0Iqcfdpz4ay2DNH2Cy41QufsVQr8YxPACJ51BUMavyW
         yevA==
X-Forwarded-Encrypted: i=1; AKwUvBxKyCyc53FgL/qP1hmS6Hrl8Ca4ScIn8/XKfrmjwR1w++nSvSqUZCpanRbOCTTWcLeii5ZykBPdSmucDg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJYCY1ayVMsDOlNJjqnoNf6uRwzE7q35QM4f3ygMHGN62UdzfWy
	swx6ZcXSB0tTJXhSQdci6FgnG5bUSQCOvcQbQtChBC8l10hEBkbMa4chOz7TP5oqk3pm/RPRJd2
	3Rf7zEvhzMI2IHdlalDvNw/2Dczjt7Fw=
X-Gm-Gg: AYBFou0lPosnUeY+ucg1AoWw3dy5/avbv8FHmQeHasHqmvSgX89Vt70YvbFajBtku4g
	EOtD/dMrm7WdasiJEc43Fo3EvWFwinmezy1CyybZ/citt1u7Yc6Jv4jgd/MuYpB9Sef5CmqjoS8
	McntHbeDnR6n+Y078IVAPL/FdfjpU4wyHBPueY6/iyI97OIoYX4HRM7bufY6MYup8vrla/WPk1I
	wALlRV7A7YEFF2uOcZw3rb9FonYwBafTlTRmYmrTatY4X/VzEnITlFPrGo9DqzVALAxn7nSu6ye
	EeJ6bTGHC2vWhQ+9ZTiPQ/76CSCNgBllfC/RJvxAfUJn/1n6BUPwL9sN
X-Received: by 2002:a05:690c:4006:b0:8a9:9f40:24e0 with SMTP id
 00721157ae682-8b07edc853bmr64426667b3.14.1792083519586; Thu, 15 Oct 2026
 09:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org> <20261008-04-k3-clk-pm-aux-v1-2-8372d7307694@kernel.org>
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-2-8372d7307694@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 18:58:00 +0200
X-Gm-Features: AclHuK9x9oH7LPEYYVfq-eVNh1cOyJug_mdtxh9957qtgQ6Mf8exPEfJOQrJddw
Message-ID: <CABdCQ=OFZw+DnejaF4DothYGX=u=pTEgc3Gru09En7ApWHpCLA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: spacemit: register pm domain auxiliary driver
To: Yixun Lan <dlan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_095841_132719_A4CF6779 
X-CRM114-Status: GOOD (  16.20  )
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
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>, Alex Elder <elder@riscstar.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Brian Masney <bmasney+clk@redhat.com>, spacemit@lists.linux.dev, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGVzdGVkIG9uIE9yYW5nZVBpIFJWMi4KClRlc3RlZC1ieTogSWtlciBQZWRyb3NhIDxpa2VycGVk
cm9zYW1AZ21haWwuY29tPgpSZXZpZXdlZC1ieTogSWtlciBQZWRyb3NhIDxpa2VycGVkcm9zYW1A
Z21haWwuY29tPgoKRWwganVlLCA4IG9jdCAyMDI2IGEgbGFzIDQ6NTgsIFlpeHVuIExhbiAoPGRs
YW5Aa2VybmVsLm9yZz4pIGVzY3JpYmnDszoKPgo+IFRoZSBBUE1VIChBcHBsaWNhdGlvbiBTdWJz
eXN0ZW0gUG93ZXIgTWFuYWdlbWVudCBVbml0KSByZWdpc3RlciByZWdpb24KPiBibG9jayBjb250
YWlucyB0aGUgcG0gZG9tYWluIG1hbmFnZW1lbnQgY2FwYWJpbGl0aWVzLCBpbnRyb2R1Y2UgYSBw
bV9uYW1lCj4gbWVtYmVyIGluc2lkZSBDQ1UgZGF0YSB0byByZWdpc3RlciBhIHBtIGRvbWFpbiBk
ZXZpY2UgdmlhIHRoZSBhdXhpbGlhcnkKPiBidXMgaWYgdGhhdCBpcyBuZWVkZWQgLSBpZiBwbV9u
YW1lIGlzIG51bGwsIG5vIGRldmljZSBpcyByZWdpc3RlcmVkLgo+Cj4gU2lnbmVkLW9mZi1ieTog
WWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvY2xrL3NwYWNlbWl0
L2NjdS1rMS5jICAgICB8IDEgKwo+ICBkcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3UtazMuYyAgICAg
fCAxICsKPiAgZHJpdmVycy9jbGsvc3BhY2VtaXQvY2N1X2NvbW1vbi5jIHwgNCArKysrCj4gIGRy
aXZlcnMvY2xrL3NwYWNlbWl0L2NjdV9jb21tb24uaCB8IDEgKwo+ICA0IGZpbGVzIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3NwYWNlbWl0L2Nj
dS1rMS5jIGIvZHJpdmVycy9jbGsvc3BhY2VtaXQvY2N1LWsxLmMKPiBpbmRleCBkZWUxNGQyNWY3
NWQuLjllMjcyNzUyMTkxNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3Ut
azEuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL3NwYWNlbWl0L2NjdS1rMS5jCj4gQEAgLTk3Miw2ICs5
NzIsNyBAQCBzdGF0aWMgc3RydWN0IGNsa19odyAqazFfY2N1X2FwbXVfaHdzW10gPSB7Cj4KPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBzcGFjZW1pdF9jY3VfZGF0YSBrMV9jY3VfYXBtdV9kYXRhID0g
ewo+ICAgICAgICAgLnJlc2V0X25hbWUgICAgID0gImsxLWFwbXUtcmVzZXQiLAo+ICsgICAgICAg
LnBtX25hbWUgICAgICAgID0gImsxLWFwbXUtcG1kb21haW4iLAo+ICAgICAgICAgLmh3cyAgICAg
ICAgICAgID0gazFfY2N1X2FwbXVfaHdzLAo+ICAgICAgICAgLm51bSAgICAgICAgICAgID0gQVJS
QVlfU0laRShrMV9jY3VfYXBtdV9od3MpLAo+ICB9Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9zcGFjZW1pdC9jY3UtazMuYyBiL2RyaXZlcnMvY2xrL3NwYWNlbWl0L2NjdS1rMy5jCj4gaW5k
ZXggOTJiOTMwZDVmZjMwLi5lODk1ZDNlZTZhMjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsv
c3BhY2VtaXQvY2N1LWszLmMKPiArKysgYi9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3UtazMuYwo+
IEBAIC0xNDQ5LDYgKzE0NDksNyBAQCBzdGF0aWMgc3RydWN0IGNsa19odyAqazNfY2N1X2FwbXVf
aHdzW10gPSB7Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGFjZW1pdF9jY3VfZGF0YSBrM19j
Y3VfYXBtdV9kYXRhID0gewo+ICAgICAgICAgLnJlc2V0X25hbWUgICAgID0gImszLWFwbXUtcmVz
ZXQiLAo+ICsgICAgICAgLnBtX25hbWUgICAgICAgID0gImszLWFwbXUtcG1kb21haW4iLAo+ICAg
ICAgICAgLmh3cyAgICAgICAgICAgID0gazNfY2N1X2FwbXVfaHdzLAo+ICAgICAgICAgLm51bSAg
ICAgICAgICAgID0gQVJSQVlfU0laRShrM19jY3VfYXBtdV9od3MpLAo+ICB9Owo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3VfY29tbW9uLmMgYi9kcml2ZXJzL2Nsay9zcGFj
ZW1pdC9jY3VfY29tbW9uLmMKPiBpbmRleCA1NmYzZDA4MTg1N2UuLjM4NTc3ZmI3Nzc2YSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3VfY29tbW9uLmMKPiArKysgYi9kcml2
ZXJzL2Nsay9zcGFjZW1pdC9jY3VfY29tbW9uLmMKPiBAQCAtMTY5LDYgKzE2OSwxMCBAQCBpbnQg
c3BhY2VtaXRfY2N1X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsIGNvbnN0IGNo
YXIgKmNvbXBhdCkKPiAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgIHJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIHJlc2V0c1xuIik7Cj4K
PiArICAgICAgIHJldCA9IHNwYWNlbWl0X2NjdV9hdXhfcmVnaXN0ZXIoZGV2LCBiYXNlX3JlZ21h
cCwgZGF0YS0+cG1fbmFtZSk7Cj4gKyAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0byByZWdpc3RlciBwbSBkb21h
aW5cbiIpOwo+ICsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfTlNf
R1BMKHNwYWNlbWl0X2NjdV9wcm9iZSwgIkNMS19TUEFDRU1JVCIpOwo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2Nsay9zcGFjZW1pdC9jY3VfY29tbW9uLmggYi9kcml2ZXJzL2Nsay9zcGFjZW1pdC9j
Y3VfY29tbW9uLmgKPiBpbmRleCA4NjkxNjk4ZTAwN2QuLjIyMWE5MjExN2I5NCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3VfY29tbW9uLmgKPiArKysgYi9kcml2ZXJzL2Ns
ay9zcGFjZW1pdC9jY3VfY29tbW9uLmgKPiBAQCAtNDEsNiArNDEsNyBAQCBzdGF0aWMgaW5saW5l
IHN0cnVjdCBjY3VfY29tbW9uICpod190b19jY3VfY29tbW9uKHN0cnVjdCBjbGtfaHcgKmh3KQo+
Cj4gIHN0cnVjdCBzcGFjZW1pdF9jY3VfZGF0YSB7Cj4gICAgICAgICBjb25zdCBjaGFyICpyZXNl
dF9uYW1lOwo+ICsgICAgICAgY29uc3QgY2hhciAqcG1fbmFtZTsKPiAgICAgICAgIHN0cnVjdCBj
bGtfaHcgKipod3M7Cj4gICAgICAgICBzaXplX3QgbnVtOwo+ICB9Owo+Cj4gLS0KPiAyLjU2LjAK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
