Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA09D2ECEB
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 20:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rv6/TptKCWsyro2xLpC2QMMvDmSr8FlnBqXo8WhARRk=; b=sB1Q8ozmkwEZhw
	KgyKH0lOH2N1Wi35iHAqpCIVm5Rkx/g6BqjZqcwSLnTF3ZswDmmLBp/I07GcaPc3LTYDqvpRoHiPp
	ERDf+SP7erMPTXsA6fRnODZRw58hRjnprXrqxjD9Nb+swXebDIIa3sCccyAeM49+Jf9u9wJz03gyU
	Y3HwPNtap/O5D71J+hp34mhOaNMssclkFQL6LDdZG0kf4VhWXeigb5q/dWra3cofzXW1WYxuxSGM5
	pcPojGWBAIAq3AqSDkWQ4HG7Q8IruEXvzcaEVJlnhCwVckAGzrlgbtMnK9fQpdR4+pVJ/TTNioBXc
	plHT2u17KW24haH3YiHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwAo-00000002qem-0uEN;
	Mon, 19 Jan 2026 20:48:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwAl-00000002qeR-3Pcj
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 20:48:29 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso38972825e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 12:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768855705; x=1769460505; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9zOo8J2/R5/ZECF8jXBFWc70aqTEGil4wxpiWbgmSlI=;
        b=AUvwR/G9/gF3HhpFc6/v4u9e2BMiQERpRFFxnzoSbDXTynM5qOPqbPWF40eGtuxlGy
         zkgDDX+eoKZqDYqOeMLD7bMuLMmv8JkB3tniLHGtyk8qkmAsLYzd7KGomTtf2AGsnBQY
         7LBYW7uiP1bBIdbF7/UJW0+Wnq8gzT7XcaHUk8d1bzpa2PgvzoTI5w791IBahbBXxV31
         +doRRj/dmTe2gOscJsgat0kC/e0BrvzYQUM9liYCdv6VKckNBkBliSgR0gec/5KplcLB
         EWQMPIpzvZuL6V7DvdZV9yeUtlu+66geyabQ7gQ4sLK4n1lXdk9aW66ZggmNHnGcEg24
         T1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768855705; x=1769460505;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9zOo8J2/R5/ZECF8jXBFWc70aqTEGil4wxpiWbgmSlI=;
        b=iYzwpHgUevXg8NlwFy8+L9pBs2DRoYzNB4a3NSUw+g5Z4IBWE80dSpk5WHboNyTm7u
         uKTJBsGbJjanMzpLN7dIYc0jkMIib1H9bHqJcm62f5FeG5zRnmc3f2skh5QCaF8Q24G/
         +kClEbvu13aBNVn+xpZYqS2j24SkJgYH/9Gn/32RAhM6ge2hRlT3okqjI0qrr/FtuaQE
         fqRaYs6lGre5h0lkJy4OP2kCwltTX96mbPNfWzmBakFFxg7mfNnLq4MBApaj7jdNWAZX
         gpUBofH5nDMkUeEsH8V7DUJkVvrOEdvIRWZifjCQiWMz80KrT21vmf4lHn22zrP0CMby
         CHiA==
X-Gm-Message-State: AOJu0Yw6OdwxVxrei+1p+V+14dDGv9jthHW5hucY3q97n8VTeW6VWA4v
	WShaW3kKtWfMthDYS623tSh/al5wzsJE+jEON+0jW0dkrSRaj+NakQzz
X-Gm-Gg: AY/fxX5Djd/j+37RS8Vvp/7RPH/6VgR8YA2GbRIOaGnejyup5gn9xRNaK61vQQjtGz6
	LitGSjIazrVb1UaJqTzfnJrSXkp72qOrNjiRsYrKh2t5zd0ULnydLxLhQoaJv7TGU01E+ur3xZW
	E9TJhU9EU31aBULc0oo94U2CQqAEixo3LYRKx8kLDht8rBljdeXVq5o/5HhTd19budmGcD6uyhD
	/Knm0/RlHJ/WXXVlbLy8UxRJ3anSZz3/7iJfz/Y42+534FlT3gIv4XeE1JKx1/IHcalZIHXgDqq
	ZgjHgNXfGo24ezlGx7UpFSZWqrQborqzoiJkEiju5K+rsE3wJ2mZvP5xujZ5czawmQ5CP0/7bHn
	kTVQeS2Tu92bcDZgbLwWYF3OzyuhyIM7nVwIGn6KmUpsiZUwsMAwrTfkKQi7YdRRv7X+O5bL84v
	zogab5
X-Received: by 2002:a05:600c:4e93:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-4801e30b737mr159086915e9.12.1768855705113;
        Mon, 19 Jan 2026 12:48:25 -0800 (PST)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe3b01csm92808125e9.5.2026.01.19.12.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 12:48:24 -0800 (PST)
Date: Mon, 19 Jan 2026 23:48:21 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Andy Chiu <andybnac@gmail.com>, Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Joel Granados <joel.granados@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v5 2/9] riscv: vector: init vector context with proper
 vlenb
Message-ID: <aW6YlXEbusvDiDWw@curiosity>
References: <20251214163537.1054292-1-geomatsi@gmail.com>
 <20251214163537.1054292-3-geomatsi@gmail.com>
 <CAFTtA3MdoL5XjcjTrNhZ27UXZe4Mxot-rttc8cQ-K=E-Mh164A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFTtA3MdoL5XjcjTrNhZ27UXZe4Mxot-rttc8cQ-K=E-Mh164A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_124828_000764_B7723327 
X-CRM114-Status: GOOD (  16.69  )
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

SGksCgpPbiBXZWQsIEphbiAwNywgMjAyNiBhdCAxMjo0OTozMUFNIC0wNjAwLCBBbmR5IENoaXUg
d3JvdGU6Cj4gT24gU3VuLCBEZWMgMTQsIDIwMjUgYXQgMTA6MzXigK9BTSBTZXJnZXkgTWF0eXVr
ZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhlIHZzdGF0ZSBpbiB0
aHJlYWRfc3RydWN0IGlzIHplcm9lZCB3aGVuIHRoZSB2ZWN0b3IgY29udGV4dCBpcwo+ID4gaW5p
dGlhbGl6ZWQuIFRoYXQgaW5jbHVkZXMgcmVhZC1vbmx5IHJlZ2lzdGVyIHZsZW5iLCB3aGljaCBo
b2xkcwo+ID4gdGhlIHZlY3RvciByZWdpc3RlciBsZW5ndGggaW4gYnl0ZXMuIFplcm9lZCBzdGF0
ZSBwZXJzaXN0cyB1bnRpbAo+ID4gbXN0YXR1cy5WUyBiZWNvbWVzICdkaXJ0eScgYW5kIGEgY29u
dGV4dCBzd2l0Y2ggc2F2ZXMgdGhlIGFjdHVhbAo+ID4gaGFyZHdhcmUgdmFsdWVzLgo+ID4KPiA+
IFRoaXMgY2FuIGV4cG9zZSB0aGUgemVybyB2bGVuYiB2YWx1ZSB0byB0aGUgdXNlci1zcGFjZSBp
biBlYXJseQo+ID4gZGVidWcgc2NlbmFyaW9zLCBlLmcuIHdoZW4gcHRyYWNlIGF0dGFjaGVzIHRv
IGEgdHJhY2VkIHByb2Nlc3MKPiA+IGVhcmx5LCBiZWZvcmUgYW55IHZlY3RvciBpbnN0cnVjdGlv
biBleGNlcHQgdGhlIGZpcnN0IG9uZSB3YXMKPiA+IGV4ZWN1dGVkLgo+ID4KPiA+IEZpeCB0aGlz
IGJ5IHNwZWNpZnlpbmcgcHJvcGVyIHZsZW5iIG9uIHZlY3RvciBjb250ZXh0IGluaXQuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9tYXRzaUBnbWFpbC5jb20+
Cj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8YW5keWJuYWNAZ21haWwuY29tPgo+IAoKVGhh
bmtzIGZvciByZXZpZXdzICEKCldoYXQgd291bGQgYmUgdGhlIHJlY29tbWVuZGVkIHdheSB0byBw
cm9jZWVkIHdpdGggdGhlc2UgcGF0Y2hlcyA/CkkgaGF2ZSByZXZpZXdzIGZyb20gQW5keSBmb3Ig
dGhlIHBhdGNoZXMgMSwyIGFuZCA1IChzZWxmdGVzdCBmb3IgMikuClRoZXkgY2FuIGJlIHVzZWQg
aW5kZXBlbmRlbnRseSBvZiB0aGUgcmVtYWluaWcgcHRyYWNlIHYtc3RhdGUKdmFsaWRhdGlvbiBj
aGFuZ2VzIGFuZCB0aGVpciB0ZXN0cy4KCldvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gc3BsaXQgdGhl
IHNlcmllcyBpbnRvIHR3byBwYXJ0cywgc28gdGhhdAp0aGUgdi1zdGF0ZSB2YWxpZGF0aW9uIGNh
biBjb250aW51ZSBldm9sdmUgaW5kZXBlbmRlbnRseSA/CgpSZWdhcmRzLApTZXJnZXkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
