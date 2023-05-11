Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21971C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 22:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMkyGifiFBXpMHxt6CtNvFRDDeKPuiJzTDkggGAugTk=; b=PKyrRQ88R+mnh1
	iYi0XPxtL05VZGM6SzzxN0bhWoynoSS/lqtilSObFmvZENcVRGpbu4lU4VbbkJPrWmJrqorgzk7PQ
	A3WNArBBW0oUIIcaimcKzrFwu1XEA1tdBslREH+5QFheH57itLhmYwbQ3D5bG99Rghb0drz5BTyl6
	YmraUFJ6i33Drc1s3HvNty+r7IU883zvYFTYhoTNVz+rfIBv48VG0foWGlVJXxnrdX3GOov3+/kH3
	9OzzYZcilZiu2Yl44lfjGVjdazp/EtH2lzzGpumCtd16aL/Qyt4yZl5lbPJXv61tXY6kHhhLVcn3O
	rLgR2OevBUBadfc+/+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEzA-00AEFW-02;
	Thu, 11 May 2023 22:42:08 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEz7-00AEDY-26
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 22:42:06 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1aae90f5ebcso421445ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 15:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683844921; x=1686436921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRrgqpOwIlQoRPTZLdmgpQ64qveaxTRuu89B7YxAGY0=;
        b=DHYnwtIOsObzm5cm/h2VvG5bwx3m3YhRXesCgIFneCf491ex5QqsJ4W2eMPAG8wzPv
         ak43yqflicbl/KI+dHgg0aGr4U9LEv4vTdpS1nRO1m89WRv9F2QXhHAj279D0YbP8OGo
         /cyMA8aMw9Z6Tva/A1MLuvGQvfqUdzY8GU7YecKug/+t6eSsc3AZAhQ7xXimDg4rC0sL
         CxH1EzZINasfsoSEA+p/mbivb9mnEB3a1mZGHsXfpvJrJYt5/q/HUb5eK1S+GTjGH31j
         zbFYZ54F5mjQGo0a/hng8ANmX7lTUoW7eW3zvW1M67q98oa3S92SRxJXlhKpXI0sSTZq
         B5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683844921; x=1686436921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRrgqpOwIlQoRPTZLdmgpQ64qveaxTRuu89B7YxAGY0=;
        b=MZEJspXZSWbUBYGS1QAuKQfOesL5J1T6XALsfsdFnCKmI/3Hd1MuAbtLnggqJBgE6k
         D26vqKpqsEkBahiHTmsWRNaDAOka2JklcPnOZs2WSS1IAGjVkIqjcUP4lW9l6jmG0KVw
         vEuw49Eu7/Fur7ribJ/Z7O+pyotDmEYoETHs5VYIp5REDlR+I+FcjVgqZsRfOVucz2pL
         cA5FLu8Nna4d82PO5YWwfextJfwHfg9haBmIaO1Ajy+wpMKuvAr+co7PE3eOQG1rOAde
         NsGN9efQeHxqtAgIvxRDxYidclMSjdS2IhKLtIGoMMwNv63PHog+FPqxdqRKg6f7aqlO
         ZEqw==
X-Gm-Message-State: AC+VfDzzXLORgspKM7pDGMsZvtFDVPERsJHaohcyIzYL+d/nu/OoamhY
	MLDO7GveVhz+AhnloscDrqmFsUSGHiySGYVPIi44MA==
X-Google-Smtp-Source: ACHHUZ6tbw+SRPvBBpQQ26e6/t6mz3DeQYeLX5dQ+govmHEl95m+b9MeoOnyRnt4VK/SdOF4osHF69PHIs5+g1jIR+0=
X-Received: by 2002:a17:902:c410:b0:1aa:ea22:8043 with SMTP id
 k16-20020a170902c41000b001aaea228043mr14610plk.7.1683844920748; Thu, 11 May
 2023 15:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230423223210.126948-1-maskray@google.com>
In-Reply-To: <20230423223210.126948-1-maskray@google.com>
From: Fangrui Song <maskray@google.com>
Date: Thu, 11 May 2023 15:41:48 -0700
Message-ID: <CAFP8O3LksO-4JAoRnx9ND0E9rRyqb6xsUsGtBVQXOsaYxLmhBQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: replace deprecated scall with ecall
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_154205_728105_39C1D691 
X-CRM114-Status: GOOD (  14.59  )
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

T24gU3VuLCBBcHIgMjMsIDIwMjMgYXQgMzozMuKAr1BNIEZhbmdydWkgU29uZyA8bWFza3JheUBn
b29nbGUuY29tPiB3cm90ZToKPgo+IHNjYWxsIGlzIGEgZGVwcmVjYXRlZCBhbGlhcyBmb3IgZWNh
bGwuIGVjYWxsIGlzIHVzZWQgaW4gc2V2ZXJhbCBwbGFjZXMsCj4gc28gdGhlcmUgaXMgbm8gYXNz
ZW1ibGVyIGNvbXBhdGliaWxpdHkgY29uY2Vybi4KPgo+IFNpZ25lZC1vZmYtYnk6IEZhbmdydWkg
U29uZyA8bWFza3JheUBnb29nbGUuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRy
eS5TICAgICAgICAgICAgIHwgNCArKy0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vcnRfc2ln
cmV0dXJuLlMgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gaW5kZXggOTlkMzhmZGY4YjE4Li4yZjUxOTM1NjEy
ZDEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL2VudHJ5LlMKPiBAQCAtMTkxLDcgKzE5MSw3IEBAIGhhbmRsZV9zeXNjYWxs
Ogo+ICAgICAgICAgUkVHX1MgYTAsIFBUX09SSUdfQTAoc3ApCj4gICAgICAgICAvKgo+ICAgICAg
ICAgICogQWR2YW5jZSBTRVBDIHRvIGF2b2lkIGV4ZWN1dGluZyB0aGUgb3JpZ2luYWwKPiAtICAg
ICAgICAqIHNjYWxsIGluc3RydWN0aW9uIG9uIHNyZXQKPiArICAgICAgICAqIGVjYWxsIGluc3Ry
dWN0aW9uIG9uIHNyZXQKPiAgICAgICAgICAqLwo+ICAgICAgICAgYWRkaSBzMiwgczIsIDB4NAo+
ICAgICAgICAgUkVHX1MgczIsIFBUX0VQQyhzcCkKPiBAQCAtNjAzLDYgKzYwMyw2IEBAIEVORChl
eGNwX3ZlY3RfdGFibGUpCj4gICNpZm5kZWYgQ09ORklHX01NVQo+ICBFTlRSWShfX3VzZXJfcnRf
c2lncmV0dXJuKQo+ICAgICAgICAgbGkgYTcsIF9fTlJfcnRfc2lncmV0dXJuCj4gLSAgICAgICBz
Y2FsbAo+ICsgICAgICAgZWNhbGwKPiAgRU5EKF9fdXNlcl9ydF9zaWdyZXR1cm4pCj4gICNlbmRp
Zgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3J0X3NpZ3JldHVybi5TIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdmRzby9ydF9zaWdyZXR1cm4uUwo+IGluZGV4IDA1NzM3MDVlYWM3
Ni4uMTA0MzhjN2M2MjZhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vcnRf
c2lncmV0dXJuLlMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3J0X3NpZ3JldHVybi5T
Cj4gQEAgLTExLDYgKzExLDYgQEAgRU5UUlkoX192ZHNvX3J0X3NpZ3JldHVybikKPiAgICAgICAg
IC5jZmlfc3RhcnRwcm9jCj4gICAgICAgICAuY2ZpX3NpZ25hbF9mcmFtZQo+ICAgICAgICAgbGkg
YTcsIF9fTlJfcnRfc2lncmV0dXJuCj4gLSAgICAgICBzY2FsbAo+ICsgICAgICAgZWNhbGwKPiAg
ICAgICAgIC5jZmlfZW5kcHJvYwo+ICBFTkRQUk9DKF9fdmRzb19ydF9zaWdyZXR1cm4pCj4gLS0K
PiAyLjQwLjAuNjM0Lmc0Y2EzZWYzMjExLWdvb2cKPgoKUGluZzopCgoKLS0gCuWui+aWueedvwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
