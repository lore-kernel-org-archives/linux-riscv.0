Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A40CD4846
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 03:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqj0LVmfvXK1TEHNeurT1DAWqZZSKzwPYph61JeD7eI=; b=qFFFhpqd41Skxw
	aHyUsJD4BBNQWRv78QCX5BQSbn1mXdk2Ds92VJH4hodokyICxk4hLxR/NWYOAu4de1Q7vAlR/vea3
	i/ASf9piKYzp64AJuTnz5ByIV+B2IrSWs9wUT4fyT/q3PBWb/Ah1PHvp6UPuDatMZMU+ZLnSKVWOT
	6rPnbkFpA+n1nCmHKAFfYF4TwSWxrgca4Z0BK0UJC/13BoQus5XK7vjGf7CEagOiZxUlrx6uzZx1y
	V215f5VPlrBiZySo1536lKQGtIFcuA0SrixJaKDUsEf6BZm+i7sKbe3hq7CCfRCIipPEXdJGcP0QL
	gvlPrJvMKuCzvWf81pEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMes-00000004RZp-3itr;
	Thu, 14 May 2026 03:22:46 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMep-00000004RZ6-3e9U
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 03:22:45 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso13388227a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 20:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778728961; cv=none;
        d=google.com; s=arc-20240605;
        b=eo2n0mffJpAjvt53ilY/qgS18nJTef9+QxMiHEvKjqY9/8F0lhkwXfu8MMY2/uP7TV
         ILuMWr0NpbZ11x0gStw/XU2ZhI+fQvHFAQt6oSGpYCIh7N5E5BD29t8pjm+y1O2PtgoM
         0av64GVBSkVxEf95XhiMEvjPGztYjwvDWHYk+zBgnnKVNaSwucnzaKexzLDu4XmXnUl3
         TeyH5PhEvS3hlHOkOJt5cJDBSD2bPAJbeIcJTGpFZxr1j32S97EpyYWVSWSusBMfB1zE
         I9AEzmjliydA9IUoUqlY3+SwaYmq+KSkAo4kauI0Q0f40AkKfzVOdOpbGsawQO8YXE39
         fj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QMUaP53BYWNOMhNcxcCEaWDUhQniApnLAb7EGU9O1eE=;
        fh=OIBcw/R8wr/93N8resJdt9aqJUr/31xy7s1/ctx9bds=;
        b=QbLh8Jvyp9D5nqHh2WSD5W9pNrsTUnPZ0L1/yUAUPq2droE7p7d7z5VwYYBR4AHi1a
         eBn578IjqAKVojMUJaz0Pk/3yJbR8QGjrUIt4XMSwyvy/iQiz3TyREWl0c8eEVHnJ2fV
         JLSetPgGrCsAA0rlBnIhRDu1S/kwNa66jQgZUc63yjChQwd76hcQ2y/okheDKRkrboDD
         K/8/SYupI0diX/JSoHvYi0CVpRsIxvc3XsJE4M7Goip/yH0mgL9xzAkKQt/cwiGh2elk
         qi9owXZFQPoP6a0s9aeacXvkArw6Buwv0CaQZGyRj2oscB4htmUgNVPnPBntVaUJBufl
         ZcFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778728961; x=1779333761; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMUaP53BYWNOMhNcxcCEaWDUhQniApnLAb7EGU9O1eE=;
        b=G4iz5wHz1jIqd0ehYkH2K+disCafmv+pR2QgVe68mZMhMw3PNA+VYSue4IfTNWFnsy
         FnQWQeKxp4lZOH9QZHje4OYpzIc6tw96TS4Bi/BFY44Pc8Y3F1YaIA8hjjHfOLgVPlcx
         DgYbv3PBMqEf1D4hbd9tOf/TaSAxuXG6+VQayVYbhO1N76+Sv+yYAAgm6j+8Dax9/Rjd
         avRpnQ1UwGwy/laTlsiNc4qoQICgkSoKCld2I/g8qPu/p9gwW6LCvcg/KxXNfxE753/Z
         TDCxQp0+P/kEOZKGb45rT63sWsbElZmMb1R0fXVpWCTx/rl5j+I0OD53fauuSJp/8eNp
         7caQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778728961; x=1779333761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QMUaP53BYWNOMhNcxcCEaWDUhQniApnLAb7EGU9O1eE=;
        b=RCnrnHEqbhU6ZB31BeOOgLTkpkNVcJAZIlzxvAx1qrSB3gkLzJJoN9Jc6+N1or4xan
         iB7m0BmcK8XLdztNE7IdMaLmzxeHvgve3+DkQhPibsqw6fyFVHepcNeSyFY8kCJEKmYj
         8fhW+oCUM+yR12TJeqOMextmRDFhM9XoUs19ZjAUTazP/eq/Dtq0RY5uPdQgF2okfMTY
         FZV0ltvFuGY6V+KeqWaptRVlYeADCLSdCmAc6NYRZDPr25hzHF3X7ZYOoodSpqhN4dVF
         jnZdA9638/wYrhsq3PoltzpAq9+hXLv8CFntTVxXz7WxVZxIr2a7aL+nkgxWj80KLhtg
         f/QA==
X-Forwarded-Encrypted: i=1; AFNElJ8J68fiuWqXm6gvR/fbXdtCDkY/ZvSI4zkPaoC5hc7q+jvaj6G8qxKTBSsqrxQ/m42a2q2U7Om9NC/JBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqJEk1KuwlsvCilYNwr9SnFu6GknxV7rM7T06usuZ9bEjwPbzL
	9p3JMi3M4/T3TOwTt/L93nrn0BJ87X7ejjk7PQLo0qQre3mGSX6ESWLh8lJkr0VxcuOVp9DMjpP
	2Ltmur8FliVmeKj2SQ4FLYqpSKfNo4knXswuviVNubg==
X-Gm-Gg: Acq92OHT3fFBebMvxOsidzln/PFuCdu8JmbU4Yi/9GJRIOy0ai1nR3dkR7IY5qWKwKw
	d4g3WZcHv2eJJ0ga6+76+EUIG9Tki228+ABY3l251V8d0HkIdIXqgls7Xd9m1Wx1Bb+S9mJS9nR
	giwNhlxArr6Spy9NwZBR0QRg7lYop4L3GeSbGdQoXkvP11DGK3KuMAwpudCYilovh+gmZH/44uL
	ftEzrE7V57q4J5o0KT9pLIlcg61ZAQK6XZVa87+QNj83n5yCe5DqNi/xZy8At+9Y4n+pgtiCoQK
	M9qxFW8sqNtJafsrv9VR
X-Received: by 2002:a17:907:7213:b0:bc5:114c:956 with SMTP id
 a640c23a62f3a-bd4f3302de3mr114397366b.1.1778728961283; Wed, 13 May 2026
 20:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260428024105.645162-1-zong.li@sifive.com> <a5073e94-d360-e8d5-2b49-5167ab4f542d@kernel.org>
In-Reply-To: <a5073e94-d360-e8d5-2b49-5167ab4f542d@kernel.org>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 14 May 2026 11:22:31 +0800
X-Gm-Features: AVHnY4IBCT-jMsZILENBleEeOzgptRDgw6-aOeZZ6jv_niaQClr_jnbC60bO-Gg
Message-ID: <CANXhq0pFhmHHnnp3z6dk9sZRckyEkSBVsxBu-EhaGD=S6WYkJA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: cif: reduce shadow stack size limit from 4GB to 2GB
To: Paul Walmsley <pjw@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	debug@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_202243_941677_D08613CF 
X-CRM114-Status: GOOD (  12.89  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgOToyMOKAr0FNIFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gTW9uLCAyNyBBcHIgMjAyNiwgWm9uZyBMaSB3
cm90ZToKPgo+ID4gRm9sbG93IHRoZSBBUk02NCBHQ1MgKEd1YXJkZWQgQ29udHJvbCBTdGFjaykg
aW1wbGVtZW50YXRpb24gYXBwcm9hY2gKPiA+IGJ5IHJlZHVjaW5nIHRoZSBzaGFkb3cgc3RhY2sg
c2l6ZSBhbGxvY2F0aW9uIGZyb20gbWluKFJMSU1JVF9TVEFDSywgNEdCKQo+ID4gdG8gbWluKFJM
SU1JVF9TVEFDSy8yLCAyR0IpLiBzZWUgY29tbWl0ICc1MDY0OTZiY2JiNDIgImFybTY0L2djczog
RW5zdXJlCj4gPiB0aGF0IG5ldyB0aHJlYWRzIGhhdmUgYSBHQ1MiKScKPgo+IFNhc2hpa28gY2F1
Z2h0IHRoYXQgdGhpcyBwYXRjaCBkb2Vzbid0IGV4YWN0bHkgZm9sbG93IHRoZSBBUk0KPiBpbXBs
ZW1lbnRhdGlvbiwgaW4gdGhhdCBpdCBkb2Vzbid0IGluY2x1ZGUgdGhlIG1heChQQUdFX1NJWkUs
IHNpemUpCj4gY29uc3RyYWludCwgd2hpY2ggY292ZXJzIHRoZSBjYXNlIHdoZXJlIHNvbWVvbmUg
c2V0cyBSTElNSVRfU1RBQ0sgdG8KPiBzb21ldGhpbmcgYWJzdXJkbHkgc21hbGwgKCA8IFBBR0Vf
U0laRSApLiAgQ2FyZSB0byBmaXggdGhhdCBhbmQgcG9zdCBhIG5ldwo+IHZlcnNpb24/Cj4KCk9r
LiBJIHdpbGwgc2VuZCB0aGUgbmV4dCB2ZXJzaW9uIHRvIGluY2x1ZGUgdGhhdC4gVGhhbmtzIGZv
ciBwb2ludGluZyBpdCBvdXQuCgo+Cj4gdGhhbmtzCj4KPiAtIFBhdWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
