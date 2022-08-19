Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5594C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 22:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XlU7xGuRSrS2snZ/hnfCpmgd8hsXNJ6igh5Yulh5w4w=; b=k6ZLop9QoXr/wl
	N8emSqI8ygQN70k1/RZ4faFy/9bI7Qtiv+2UiUtjDLvMGO0dGv9tSSQHfKGBc/Q8FgLY2U0N6fhfv
	aBUUYLBCOo/byKTH6i3+YAJ5lXN2zwFUY3yPgbAZOn8hHB77r6agTp8YigJ0zFnZbsfA1R//qTQ3i
	SfvmDiMZFUN8A792a9HlZhV3bLWCq8BlJKgpGyGFee9+AvxeHS9vdCJArecbl3nf8bg+P6WBMV++j
	RR8OUJHFFyhCIetp8f7Fw6ga29inxw5u6aRg5IVYQfBwkIPwkPGNm58iW73rQqSZ1xF2yq/9dVqoq
	82FSFx27Fbntgu3buopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPAF6-00Ck8e-IA; Fri, 19 Aug 2022 22:13:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPAF3-00Ck65-4i
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 22:13:26 +0000
Received: by mail-ej1-x629.google.com with SMTP id j21so5829396ejs.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 15:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=16fAIGzEbw49AZ48+GRIZV4iZqYCUe0NmdYkhGz6SEg=;
        b=eD7eDFBykw9Q5L2Rz1bnauG31uWhhvgzRSgKTzkdL/yvd7d+nYzjACqlpg8hTLOOOF
         LzwH0BhAHiKd8e2qickT3fWHfCNtK4lbIC0PoWTE/kIZgvVcA3W07jkroHUUPOajxr7e
         CbasemjSBSrWUyTs9YeCuPKk7+PSUWK5zPynTe5DpSYXWlUQFmoCnypBgzH80x8w5iW+
         diZE+YUjkqqxJXw4GCT/lAaKLL7MPB3xhG2HJUOSwaxCTtLXRJ7TnpYyfYI6bgz1vvYI
         5aLXQCaUXgxoXLpz2g3pzcXs9v0+Ml6t1tTwjwz6sjiU5Z/XmtpbKYSFQNDefhw2nXfU
         YdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=16fAIGzEbw49AZ48+GRIZV4iZqYCUe0NmdYkhGz6SEg=;
        b=6gVdMrrQ2dj27Ao49sX0QkxpfS8/iEzsEyvnHPf4z05BLbt0YNSqSEmUOYWsSo3LRr
         ye9AvOAZ+4cSzkUgVMIm+/GR479/8z+wowrAjH+RVVt70lsCbpz1V+0y6ymo8Ehb81hn
         rc2WlU7T6WSvJh+KoZKO2uW9wOjPOQG3wgolEQaQ9WIZzUgGy9c9iqUoSsC1HYOHEe0k
         DRPgQUDFLgzy4ds0Z8TmtwhzaA/Khiv99DrnRuJJqoBR7tAPtLoaplOIsKwSOfMuSpiX
         GWEnu+xeYBOcfS41njNLagFHyt+yEab1i+XJqc16JERtDO5thU5bAWcYqXz0jfv1d60K
         qghA==
X-Gm-Message-State: ACgBeo3BalWpZWXSpfFIRpNByaYO+b27pWgErKUH606hPc+oCnRf8IMm
	AX58pw+aX4tTt76cq6eu/9uZI7/XaEe7No9B5YYBjg==
X-Google-Smtp-Source: AA6agR6exRbXrSWA4PZkprt/ywDmZGOGor6d/7N9S7XW/yyVnnhi3RWm9fYmE4MuuVQubZLREAMzqWQ/74Obz8Kt5gk=
X-Received: by 2002:a17:906:5a71:b0:730:aaa1:a9ec with SMTP id
 my49-20020a1709065a7100b00730aaa1a9ecmr6143409ejc.440.1660947202148; Fri, 19
 Aug 2022 15:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220805134908.749935-1-conor.dooley@microchip.com>
In-Reply-To: <20220805134908.749935-1-conor.dooley@microchip.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 20 Aug 2022 00:13:11 +0200
Message-ID: <CACRpkdb1jnq2C+ke1i-tis-2jMLjxbb14YusMRp607Avm4k6ow@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add PolarFire SoC dt bindings
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_151325_222344_56DAEA80 
X-CRM114-Status: GOOD (  11.80  )
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

T24gRnJpLCBBdWcgNSwgMjAyMiBhdCAzOjQ5IFBNIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+IHdyb3RlOgoKPiBTbyBmYXIgd2hlbiBJIGFkZGVkIGJpbmRpbmdzIGZv
ciB0aGUgcGxhdGZvcm0gSSBuZXZlciBhZGRlZCB0aGVtIHRvCj4gb3VyIE1BSU5UQUlORVJTIGVu
dHJ5LiBObyB0aW1lIGxpa2UgdGhlIHByZXNlbnQgdG8gaW1wcm92ZSB0aGUgY292ZXJhZ2UuCj4K
PiBTdWdnZXN0ZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiBTaWduZWQt
b2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+
IEkgaGF2ZSBhbm90aGVyIG1haW50YWluZXJzIGNoYW5nZSBxdWV1ZWQsIEknbGwgc2VuZCB0aGlz
IHZpYSBzb2MgYWxvbmcKPiB3aXRoIGl0IHVubGVzcyB0aGVyZSBhcmUgYW55IG9iamVjdGlvbnMu
Cj4KPiBDQzogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgo+IENDOiBXb2xmcmFtIFNh
bmcgPHdzYUBrZXJuZWwub3JnPgo+IENDOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdA
Z21haWwuY29tPgo+IENDOiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1
dHJvbml4LmRlPgo+IENDOiBKYXNzaSBCcmFyIDxqYXNzaXNpbmdoYnJhckBnbWFpbC5jb20+Cj4g
Q0M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBDQzogQmFydG9z
eiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4KPiBDQzogV29sZmdhbmcgR3JhbmRlZ2dlciA8
d2dAZ3JhbmRlZ2dlci5jb20+Cj4gQ0M6IE1hcmMgS2xlaW5lLUJ1ZGRlIDxta2xAcGVuZ3V0cm9u
aXguZGU+Cj4gQ0M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+Cj4gQ0M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gQ0M6IE9sb2YgSm9oYW5z
c29uIDxvbG9mQGxpeG9tLm5ldD4KPiBDQzogTWljaGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVA
YmF5bGlicmUuY29tPgo+IENDOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+CgpUaGUg
U3ViamVjdCBvbiB0aGlzIHBhdGNoIGlzIHdyb25nPwoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
