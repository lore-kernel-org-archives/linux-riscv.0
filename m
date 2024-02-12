Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB8CC4829A
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 02:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMiKfsTv+gYTcs2XHpZ23afKcvvGMcYBvwRapNVZf5o=; b=PwIzn0jdxPGv2P
	QlSa0JwDlOpoMsc8HrxLggPh+pNXpyfe1Wpeth2xuiqznBa0hZ9+NJs/U/8R5PYuBI5/rUMCYJb+6
	jcMClG+dtCHcfeafLLqoL/VksiUtb4E+Io9CnXJ/TUzisuixmUy9ipE4i6y24JUdEcNf+8BWgq8bi
	ZYh1CXf8ELsPJrajhIK01IMsqGr9muxrTbr+v7VuWMeH7HnFNvMeF2iGdQnSOY1dkewofMZlEYpRK
	9Fvq+GeU86tNCGHCyANAhq3zD48Ctxd2Awo3Pj96Z14NZ4jpKy8J+FTlqSslG+Xm3tM5Ua2bJCA1Q
	N+g67RS3Q5m/XTuNSVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZLp8-000000045eC-3V79;
	Mon, 12 Feb 2024 02:13:34 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZLp6-000000045dD-3FHR
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 02:13:34 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2d0d7985dfdso38482771fa.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 Feb 2024 18:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707704010; x=1708308810; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOVyEZPYJia2NiveSW6uDVnlUi32Gk4cYfRx/yFL4Wo=;
        b=h7V/9MD04tjxXfmm7agRVJYsRdXk+QkrB/dQp35VzllmTDLQHteI8aPbow7htRLoUb
         fjVx3eiqQBgVyL+hE+XY1PxzPgjRSPu8dAcsGrXzyi2FkIoTgmKkqVpaCJ40t+XyGd1T
         jJPx1Qy7K/tKHdqFWSHigLqoWhvA0QUxI4uNo5ITiAUx8xYxLUn4t1lS/Ogj6l0uRCQp
         kfaZnyhSeFCsmBNcBhxzTbmXYiVbEMrkvVLAWsxJZ7SuCL9+EDAbfYTIzn7eB2umfvg2
         VjKnp5hUa/fy2IdHFFvarYlOviTF6LxnC99i1lORWmpsmNNpNl+62cuZgpKOHWiYLimE
         iZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707704010; x=1708308810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOVyEZPYJia2NiveSW6uDVnlUi32Gk4cYfRx/yFL4Wo=;
        b=TZoVw7gA7JRvu+uo8dkfuYhGeFALwQIxe1HAbDcygt2iCl0Mz2Tj0K8/gn256gu4u3
         wNaCE1Qb1YfNquRYAg74N7Kb10S+Ix1AOvKkgw7Z8jDoyLZlVjQipVz8ApPU2DpK20iY
         u/Cep0cFItqsIjaqwTh6e9D7dUfQF/spFYp3sZ8YJmOLHhv9FA1+Gt/9REXY7OBlP66X
         R+vbtjWJM4tpDTpjydDLF7rznfDFRQF0aBx8n83Dusk1TJJuv59PiLY18KmZpd4UTNQJ
         E6XC5srMYX7m3y9MPA7q/bhVzjxPZjiA1UjtR1vl60tlMcNjJCkYkjK6TAZm5d4u/H04
         nmHA==
X-Gm-Message-State: AOJu0YxQ7ETyJZcmZO7SUZZ8huhgZSkElgB27hSiID3lGaEG+z8+CEvS
	qPJ4sOH9rGCnsJ7nPIgBjLaDMsDUEDeTqnX4BTazxQfeUGXuzLWT8+DpC/EKGxU0frYZFKEVTKL
	EGRfj4eOpylXNlC/kAPpAzKyWmFoI7WyQ8IRDRQ==
X-Google-Smtp-Source: AGHT+IEugA1vD35qiCK4jNXGBT4+P05yEXhAxZECPsbtGhBs1otlRtvU4Dl9G8T1OtYKKKdADoNvpKzEJlOLCg+aoBI=
X-Received: by 2002:a05:6512:ea8:b0:511:8b33:6c73 with SMTP id
 bi40-20020a0565120ea800b005118b336c73mr1957166lfb.52.1707704009637; Sun, 11
 Feb 2024 18:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20240206044217.1283849-1-songshuaishuai@tinylab.org>
In-Reply-To: <20240206044217.1283849-1-songshuaishuai@tinylab.org>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 12 Feb 2024 10:13:18 +0800
Message-ID: <CABgGipW_U2tx4FKeZ+SuS=oKas13KEoJH1-TQUNF22B2p0tGuQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: Fix a typo of preempt_v
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	ebiggers@google.com, vincent.chen@sifive.com, greentime.hu@sifive.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_181332_853881_9D916280 
X-CRM114-Status: GOOD (  17.17  )
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

T24gVHVlLCBGZWIgNiwgMjAyNCBhdCAxMjo0MuKAr1BNIFNvbmcgU2h1YWkgPHNvbmdzaHVhaXNo
dWFpQHRpbnlsYWIub3JnPiB3cm90ZToKPgo+IFRoZSB0ZXJtICJwcmVlbXB0X3YiIHJlcHJlc2Vu
dHMgdGhlIFJJU0NWX1BSRUVNUFRfViBmaWVsZCBvZiByaXNjdl92X2ZsYWdzCj4gYW5kIGlzIHVz
ZWQgaW4gbG90cyBvZiBjb21tZW50cy4KPgo+IEhlcmUgY29ycmVjdHMgdGhlIG1pc3Mtc3BlbGxp
bmcgInByZW1wdF92Ii4KPgo+IFNpZ25lZC1vZmYtYnk6IFNvbmcgU2h1YWkgPHNvbmdzaHVhaXNo
dWFpQHRpbnlsYWIub3JnPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NpbWQuaCB8
IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zaW1kLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NpbWQuaAo+IGluZGV4IDU0ZWZiZjUyM2Q0OS4uMDRiYWVlNzEzZWZmIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2ltZC5oCj4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zaW1kLmgKPiBAQCAtMzYsNyArMzYsNyBAQCBzdGF0aWMgX19tdXN0
X2NoZWNrIGlubGluZSBib29sIG1heV91c2Vfc2ltZCh2b2lkKQo+ICAgICAgICAgLyoKPiAgICAg
ICAgICAqIE5lc3RpbmcgaXMgYWNoZWl2ZWQgaW4gcHJlZW1wdF92IGJ5IHNwcmVhZGluZyB0aGUg
Y29udHJvbCBmb3IKPiAgICAgICAgICAqIHByZWVtcHRpYmxlIGFuZCBub24tcHJlZW1wdGlibGUg
a2VybmVsLW1vZGUgVmVjdG9yIGludG8gdHdvIGZpZWxkcy4KPiAtICAgICAgICAqIEFsd2F5cyB0
cnkgdG8gbWF0Y2ggd2l0aCBwcmVtcHRfdiBpZiBrZXJuZWwgVi1jb250ZXh0IGV4aXN0cy4gVGhl
biwKPiArICAgICAgICAqIEFsd2F5cyB0cnkgdG8gbWF0Y2ggd2l0aCBwcmVlbXB0X3YgaWYga2Vy
bmVsIFYtY29udGV4dCBleGlzdHMuIFRoZW4sCj4gICAgICAgICAgKiBmYWxsYmFjayB0byBjaGVj
ayBub24gcHJlZW1wdF92IGlmIG5lc3RpbmcgaGFwcGVucywgb3IgaWYgdGhlIGNvbmZpZwo+ICAg
ICAgICAgICogaXMgbm90IHNldC4KPiAgICAgICAgICAqLwo+IC0tCj4gMi4zOS4yCj4KClBsZWFz
ZSBhbHNvIGRvIHRoaXM6CgpzL2FjaGVpdmVkL2FjaGlldmVkCgpXaXRoIHRoYXQsCgpSZXZpZXdl
ZC1ieTogQW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFpbC5jb20+CgpUaGFua3MhCkFuZHkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
