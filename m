Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B8DC44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 15:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUmi9mEu/BAxBwandMrogbfDD/70Z+DfImZlsDfj980=; b=47HXo7Ep6tlj1x
	a4c0XH66g0nTSDkNXoaCpJr4JB0oYDBI+WGnbd837TXh2PLkRNKvgPyq48DK2cZHbK9Jqk75YyFwj
	Ofe6iAVkaI91SnZuYMSQmZi1Oh66AyMqHlhpgrzpDCFEg7M1d3QDNpub5eh0TX3ajct9Yw46aj0oS
	sv1zjVM7mPTQ8eEZRiiIvjAboPGQOUusCuYZ1G+Ml3JWPNlkJttIRD3U5vUYVX0++/fmsEQDA6RQ0
	zlSKn7LGMz1qRSqlA9htUwpAj9kfoCBm/oRBhNc4ySAzynVTwBXXWCtJgnis1znavdrtVbYYc7g/T
	W5bZRD48hq5OLfqQCRPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjehs-0000000CSzB-3eb0;
	Tue, 14 Jul 2026 15:06:00 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjehq-0000000CSyJ-0qcD
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 15:05:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so9075995e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 08:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784041556; cv=none;
        d=google.com; s=arc-20260327;
        b=e/dUuaCH5xO2QrfDyEA7hY967H0uCKVYTNaVKNlUrulmDlyIlSIOl47pHnBegxmz77
         IDBOsoEXuOqSJ3ZM0neZ0pqJzzI1Nk5hMCVUj3SXMbgrNJoHfvzaKgxFH2ekluqKCFue
         5SPQ2FutPovrfpaXcLKBllxvyl6rLIFHgHvAE8rRGfUqESrOct+vTww8X5sS33489CpX
         wXnyLrI6SEUb0CL8RIz2nllrvE2ECjet4u1TskvEFxsjD5PBtROKKw5uj00oQIncjyGl
         WwJ0h8oelyymHSKccm/zGLQLWaAmukbCxhZL9fgNpogH/3z7jqpy+LvvaJJM1Upq4/OG
         brMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j7APONHOjADv6rTi04f72bBmvL9O31RYBPUSsMxH3qw=;
        fh=lCZU4Fg/iZBNwkahbLZJJ7iPscdK3DgoFoBfimeLO4U=;
        b=GThpvkZcOEo4JF+LlmsHgAhK83ZJWiB3YsQIyAIO9pNFr2lvp2lYpqkzRSng87l23P
         ezA1ypiZo2Z8MCmG3a9VhS0q0oS0gGUSqqnzq75Mcu6lB/bDTCL6MRzjeKom+JRALwF0
         h3ueMcKd5n9LCfSh5OKG6pcJA3Pzlre7xJE/YeI4YtDTO+eK2tF7rJuGnjSkvRAe2O8/
         v6o9n7VrfBhPhV9NGZKTkB5a8n03g9MtceF/bgBFPsg/HZPQ9ulub9hWcDqYdlE0gtJM
         PjhbTj+ORWCHjlkkBd6siuVqpAKr5kKDBDl0oauyT7ur+LWA78IilihBOJzHVsjquKVt
         hFMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784041556; x=1784646356; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j7APONHOjADv6rTi04f72bBmvL9O31RYBPUSsMxH3qw=;
        b=lFwTA6zclS79rpYBZlnSPBK0ikt4B3glsYPH2OIK1EcmiMD2kQNAw8f5kUJiJTjet6
         p8BuOodGRBPpGtKF7dhtnHo8yfGR5eFhcxjrREw0baXheSHVCiurzOWap5V0/2sRn0qG
         6LaUHZiID15hC6BnNjQm0XDleYV3447zg4j4wqpLzQOdGjvK6wJQTGNA7hJTgHDER7QJ
         qg40zc9NIvUABFGrLY22qA/LtaBOdi0Z1BtUbWvQaU/5/0FZ8XjN7JPiy1VJDZuxMntV
         r3A4GKkYbJPCKsHMMB6oRtU5+hgtn9Hp4cAGA/vwkBU+S9ccciigahgxBCzD1e0I6gwD
         5t5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784041556; x=1784646356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7APONHOjADv6rTi04f72bBmvL9O31RYBPUSsMxH3qw=;
        b=TnGrz4KJEKLk/NUQXj98kBhwXhdNuLGO7Vn/bP7ycaerVkz6+5Vsl+pt9d0zAjG5ZH
         d6PqsO67DfrCI7haW2rkAcrQFo7aAmEj83reDIlPWoXEK3sCer5d+VA0yIALkM9HtxH3
         2bzJ5sX9bBuic0AIKF9CI2rjkpTduKgX8j66TLl4G6emTyrRBlA3REkkTD7cRa8FYig3
         d4ioaAxnTtM+I3nflz9eURrBQNOHasOwQHbm4LCtbB0iBTf8xvnbuLxwHMe1/N9HyrLd
         feCAXzs2FTLjdCXUQgN9+Q/nRvMuj4vpTh5ukUuZLPjdHq+JoIzI1Qvr0v6q+1fYQ/AV
         07qw==
X-Forwarded-Encrypted: i=1; AHgh+RoliZCOVvdcCtgeMLj56CytS/IrnlhV7K3oSHVftu3/KAaYJHTqFkZgdlyxf0GWmXRgZQl+s0FKjIPIHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOQPOBPjGOD5STA//EJ6mc5LyDnZd5HM6aituKL3XICNNsR6dF
	S3HhllypnEwgH4IpaVQKdxrfN3iwunqOKkPO1ekPflc1hAIVerexOoMKXiWjGFzKurR1dLbjJo+
	7BlVMYYpZEMZj6S0oYqmgLuyljtFGzlg0b4n8UuWOCA==
X-Gm-Gg: AfdE7cke+7xGgtZ21CKDuewlNu8Mq5WN5zBhy9dHNEY7jnMMD7yrdrnawOvJs97Csym
	mpAA1cDr5Dw0e9n+mGFtU/5bA6aO15RM3WPlwecvDjZZ7fJkjEndGSlxmIW0Kcc9pvmYbaZnesx
	5npArkD1I6YwnHjYMKiQVq7c6MCFcxVKVYZ+jFxg0/AKne6znuWZ7uOLdGEB0F8SfydJvP6wwH6
	zWBgzq9zE6W4Sp9NRDEzqf1+8tUSFCWW7Whl11Pwrjv59aSspP186vasS8p3xAE1hCwttoHDMdc
	CpJjJmt0g9+FFpM+aZu4BsX3MbdaRxWe8pUYQysXvb6AWr0ZNAQoByu5w45stPZJbkZCTpvbTY6
	Qws+b5acPPjPmvA4o
X-Received: by 2002:a05:600c:6d8c:b0:493:d0f7:69c3 with SMTP id
 5b1f17b1804b1-493f882ec68mr96000145e9.33.1784041555997; Tue, 14 Jul 2026
 08:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn> <tencent_A781C26C35482A03F6BD42B277ED977B8F08@qq.com>
In-Reply-To: <tencent_A781C26C35482A03F6BD42B277ED977B8F08@qq.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Jul 2026 20:35:44 +0530
X-Gm-Features: AUfX_mxlP6tSjxy19PMiuJqWGtPD3LYgwdJ0Xtgeost5LcCwq9BXSVYeBIKJmfY
Message-ID: <CAAhSdy2zoTpaK5oCmbA93iAg8mejr-0=fjqXUACBxfqzKZ+U7A@mail.gmail.com>
Subject: Re: [PATCH 03/16] irqchip/sifive-plic: do not iounmap devm mappings
To: Haofeng Li <920484857@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_080558_364456_AF179C4C 
X-CRM114-Status: GOOD (  16.88  )
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
Cc: Samuel Holland <samuel.holland@sifive.com>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>, tglx@kernel.org, Paul Walmsley <pjw@kernel.org>, Haofeng Li <lihaofeng@kylinos.cn>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMTQsIDIwMjYgYXQgNjo1NuKAr1BNIEhhb2ZlbmcgTGkgPDkyMDQ4NDg1N0Bx
cS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogSGFvZmVuZyBMaSA8bGloYW9mZW5nQGt5bGlub3MuY24+
Cj4KPiBwbGljX3Byb2JlKCkgbWFwcyByZWdpc3RlcnMgd2l0aCBvZl9pb21hcCgpIG9uIHRoZSBP
RiBwYXRoLCBidXQgd2l0aAo+IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIG9uIHRo
ZSBBQ1BJL3BsYXRmb3JtIHBhdGguCj4gZmFpbF9mcmVlX3JlZ3MgYWx3YXlzIGNhbGxzIGlvdW5t
YXAocmVncyksIHdoaWNoIGRvdWJsZS11bm1hcHMgbWFuYWdlZAo+IG1hcHBpbmdzIG9uIHRoZSBu
b24tT0YgcGF0aC4KCmRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIGNhbid0IGJlIHVz
ZWQgZm9yIE9GIGJlY2F1c2UKd2UgaGF2ZSBvbmUgb3V0bGllciBwbGF0Zm9ybSAiYWxsd2lubmVy
LHN1bjIwaS1kMS1wbGljIiB3aGljaCBzdGlsbApyZWxpZXMgb24gZWFybHkgaXJxY2hpcCBwcm9i
ZSB1c2luZyBJUlFDSElQX0RFQ0xBUkUoKSBhbmQKdGhlIHBsYXRmb3JtIGRldmljZSBpcyBub3Qg
YXZhaWxhYmxlIGluIGVhcmx5IGlycWNoaXAgcHJvYmUuCgo+Cj4gT25seSBjYWxsIGlvdW5tYXAo
cmVncykgd2hlbiB0aGUgZndub2RlIGlzIGFuIE9GIG5vZGUuCj4KPiBGaXhlczogMjA2ZGQxM2Ex
MDExICgiaXJxY2hpcC9zaWZpdmUtcGxpYzogQWRkIEFDUEkgc3VwcG9ydCIpCj4gU2lnbmVkLW9m
Zi1ieTogSGFvZmVuZyBMaSA8bGloYW9mZW5nQGt5bGlub3MuY24+CgpMR1RNLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCgo+IC0t
Cj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYyB8IDQgKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1z
aWZpdmUtcGxpYy5jCj4gaW5kZXggNWIwZGFjMTA0ODE0Li4wYmRkYWQzODg3NDEgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gKysrIGIvZHJpdmVycy9p
cnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gQEAgLTgxOSw3ICs4MTksOSBAQCBzdGF0aWMgaW50
IHBsaWNfcHJvYmUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSkKPiAgZmFpbF9mcmVlX3By
aXY6Cj4gICAgICAgICBrZnJlZShwcml2KTsKPiAgZmFpbF9mcmVlX3JlZ3M6Cj4gLSAgICAgICBp
b3VubWFwKHJlZ3MpOwo+ICsgICAgICAgLyogT25seSBPRiBwYXRoIHVzZXMgb2ZfaW9tYXAoKTsg
QUNQSS9wbGF0Zm9ybSB1c2VzIGRldm0gbWFwcGluZy4gKi8KPiArICAgICAgIGlmIChpc19vZl9u
b2RlKGZ3bm9kZSkpCj4gKyAgICAgICAgICAgICAgIGlvdW5tYXAocmVncyk7Cj4gICAgICAgICBy
ZXR1cm4gZXJyb3I7Cj4gIH0KPgo+IC0tCj4gMi4yNS4xCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
