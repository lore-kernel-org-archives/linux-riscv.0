Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5721D1358B
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 22:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9gviDnB7Xit+8irZxMRqjM30xkvwrXrGUzJkqnJj3Q=; b=t8Ie3XMVYi1hz5
	YKs4vgKCGhF8KOfcWgrFTwpG8rtmvE5fQ4RnvHwnVE7xw5juIAXBdrLcRRTTsXEb3T+xarXTHEStk
	g7vlQrjATrzXF9caEoiNaHuGHGuNWpQouvh8Q+boNcagJPUPODkyjSLeYIbTlMHKEcL0ASrO001gY
	EHdcYQ7asahn4M/lQQ8Oe0HzEhWJUWih41iVok+yeldvBuISb9VII4+skKC/xc6HChsQhY8Bw91mY
	YINrw+ph2jGvtw6sMyFqOxiN2MCTikDymWruHEUzSbIHWT6QZiIIQu+Y7zSOcZUhq/U7sPw1TNvDV
	gW5aOcqEQgBpN+/bzvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5C7p-000000092PT-47iS;
	Sun, 27 Oct 2024 22:52:45 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5C7l-000000092P0-38zg
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 22:52:43 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-460ad0440ddso28518781cf.3
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 15:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1730069560; x=1730674360; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXquMMV+4Hpsc00nMdUdCqYLDn7vHEApN+hixggLnx4=;
        b=E7rYDQbX6pCCCFqoNs6Lq1eva4L735y3jdXBIksE9zAjLKJzRvAstDsCTINhKpXS/R
         tTmsnJlSOtcWdCffo+LuZk5b7VBfffnkA+R/BVsdelQXUWnYi+RcJ/y9vOLyH+2ytDqg
         0DFeAJ14JH8nZpLLPncorVeC+DAMs0JCImb8n1ieY/nJH8bhKRTq37tz4fKpDIf3pAS3
         VnDcti9heDPZKh0b/kn4tQdwDueXZLydUWIj+y5dxcnZZj0HYdkSiNqDpsyR5sV76zq/
         Dkks6AQmaKkYNAAQbdhxflzN2Tl7kSxNCezM/5RPrA0riZZWCqmtYEjFTXah+VUcWiox
         QKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730069560; x=1730674360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXquMMV+4Hpsc00nMdUdCqYLDn7vHEApN+hixggLnx4=;
        b=ntUO1lz+w736Kt98q1TVHRiCzw2MJyfQpYzE/KyawnDuWNgDQbYEVKme5YqW8MFV9s
         qUsFZ7Ec2erDdzs3mP6VwJOekZzvQaoFXcZLVXS+d2AYsIDBfA49GqMA2RBMFVKUz1fI
         MoX6gzGWGEB/u5ZRQyndnzt4I8ISfP9HtJh7XrbS7Er5CivoFDfk++TguUTuwQ4RHIIL
         +q+hitBRm1jHZ8vUX9isFvOCQhGtLHQkMRvbKig87xHBr8bh5fTE7Tm7RYNEmj9ju3sF
         N4ZsWq3Q7aQo8Rf/57HDp094LWZwKyHCKlcNvEU7QtMuckDm90iakGynFtUymN8W3umk
         fo1A==
X-Forwarded-Encrypted: i=1; AJvYcCXU+QV/TSvatUODBrC2lEvXaKsnNaufcbwFQNZwpYj+PITiNoeeajLUvp1xSnqx8ONbgqpb2rapv7rAiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS+8GIpc7o234Q7xaCoM8ut5mCItbKcol7tfbiV4H8s7DGyTwL
	0h4XmN6EXnI98kHSVt5BWKB9QNQOH2qdmHgHbQFleiJSissIjIBeTKrAdNPszj10OFZkcDdxh5N
	cHLPll6YogxM+p068U69SDUgGFkpUjsZAVb00ww==
X-Google-Smtp-Source: AGHT+IEKaxmHw7UX3zIJClnKQtV6bW7RDIrexBRLx49gNSuJcL5LQDsbbzftubUyIWpE0dNrhG1GQakOfRbUwWZLGj8=
X-Received: by 2002:ac8:429a:0:b0:461:48f9:438d with SMTP id
 d75a77b69052e-46148f947a9mr55266941cf.57.1730069560255; Sun, 27 Oct 2024
 15:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241027144448.1813611-1-guodong@riscstar.com>
 <20241027144448.1813611-2-guodong@riscstar.com> <CAJM55Z-xxbUY9nyjt8TsqzknY4NNUiqJEi1XeLK-ytFpjDVvOg@mail.gmail.com>
In-Reply-To: <CAJM55Z-xxbUY9nyjt8TsqzknY4NNUiqJEi1XeLK-ytFpjDVvOg@mail.gmail.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 28 Oct 2024 06:52:28 +0800
Message-ID: <CAH1PCMZYk_wGsvDHk+7pjUOskXx4JTsRHtC4vBQP07LT_Ovg4g@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] riscv: dts: starfive: jh7110-common: revised
 device node
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, rafal@milecki.pl, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko.stuebner@cherry.de>, 
	Michael Zhu <michael.zhu@starfivetech.com>, Drew Fustini <drew@beagleboard.org>, 
	Alexandru Stan <ams@frame.work>, Daniel Schaefer <dhs@frame.work>, 
	Sandie Cao <sandie.cao@deepcomputing.io>, Yuning Liang <yuning.liang@deepcomputing.io>, 
	Huiming Qiu <huiming.qiu@deepcomputing.io>, Alex Elder <elder@riscstar.com>, linux@frame.work, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_155242_025020_BC533BB0 
X-CRM114-Status: GOOD (  23.72  )
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

T24gTW9uLCBPY3QgMjgsIDIwMjQgYXQgMTI6MzXigK9BTSBFbWlsIFJlbm5lciBCZXJ0aGluZwo8
ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBHdW9kb25nIFh1
IHdyb3RlOgo+ID4gRWFybGllciB0aGlzIHllYXIgYSBuZXcgRFRTSSBmaWxlIHdhcyBjcmVhdGVk
IHRvIGRlZmluZSBjb21tb24KPiA+IHByb3BlcnRpZXMgZm9yIHRoZSBTdGFyRml2ZSBWaXNpb25G
aXZlIDIgYW5kIE1pbGstViBNYXJzIGJvYXJkcywKPiA+IGJvdGggb2Ygd2hpY2ggdXNlIHRoZSBT
dGFyRml2ZSBKSDcxMTAgU29DLiAgVGhlIFBpbmU2NCBTdGFyNjQKPiA+IGJvYXJkIGhhcyBhbHNv
IGJlZW4gYWRkZWQgc2luY2UgdGhhdCB0aW1lLgo+ID4KPiA+IFNvbWUgb2YgdGhlIG5vZGVzIGRl
ZmluZWQgaW4gImpoNzExMC1jb21tb24uZHRzaSIgYXJlIGVuYWJsZWQgaW4KPiA+IHRoYXQgZmls
ZSBiZWNhdXNlIGFsbCBvZiB0aGUgYm9hcmRzIGluY2x1ZGluZyBpdCAid2FudCIgdGhlbQo+ID4g
ZW5hYmxlZC4KPiA+Cj4gPiBBbiB1cGNvbWluZyBwYXRjaCBlbmFibGVzIGFub3RoZXIgSkg3MTEw
IGJvYXJkLCBidXQgZm9yIHRoYXQKPiA+IGJvYXJkIG5vdCBhbGwgb2YgdGhlc2UgY29tbW9uIG5v
ZGVzIHNob3VsZCBiZSBlbmFibGVkLiAgUHJlcGFyZQo+ID4gZm9yIHN1cHBvcnRpbmcgdGhlIG5l
dyBib2FyZCBieSBhdm9pZGluZyBlbmFibGluZyB0aGVzZSBub2RlcyBpbgo+ID4gImpoNzExLWNv
bW1vbi5kdHNpIiwgYW5kIGVuYWJsZSB0aGVtIGluc3RlYWQgaW4gdGhlc2UgZmlsZXM6Cj4KPiBq
aDcxMTAtY29tbW9uLmR0c2kKPgoKV2lsbCBmaXguCgo+ID4gICAgamg3MTEwLW1pbGt2LW1hcnMu
ZHRzCj4gPiAgICBqaDcxMTAtcGluZTY0LXN0YXI2NC5kdHMKPiA+ICAgIGpoNzExMC1zdGFyZml2
ZS12aXNpb25maXZlLTIuZHRzaQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXggRWxkZXIgPGVs
ZGVyQHJpc2NzdGFyLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgWHUgPGd1b2RvbmdA
cmlzY3N0YXIuY29tPgo+ID4gLS0tCj4gPiB2NjogTmV3IHBhdGNoCj4gPgo+ID4gIC4uLi9ib290
L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kgICAgICB8ICA1IC0tLS0tCj4gPiAgLi4u
L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1taWxrdi1tYXJzLmR0cyAgIHwgMTcgKysrKysrKysr
KysrKysrKwo+ID4gIC4uLi9kdHMvc3RhcmZpdmUvamg3MTEwLXBpbmU2NC1zdGFyNjQuZHRzICAg
ICB8IDE3ICsrKysrKysrKysrKysrKysKPiA+ICAuLi4vamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZp
dmUtMi5kdHNpICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrCj4gPiAgNCBmaWxlcyBj
aGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4KPgo+IEZyb20gaGVy
ZS4uCj4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEx
MC1jb21tb24uZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1v
bi5kdHNpCj4gPiBpbmRleCBjNzc3MWIzYjY0NzUuLjllNzdmNzllYzE2MiAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNpCj4gPiAr
KysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1jb21tb24uZHRzaQo+ID4g
IC4uLi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kgICAgICB8ICA1IC0tLS0t
Cj4gPiAgLi4uL2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1taWxrdi1tYXJzLmR0cyAgIHwgMTcg
KysrKysrKysrKysrKysrKwo+ID4gIC4uLi9kdHMvc3RhcmZpdmUvamg3MTEwLXBpbmU2NC1zdGFy
NjQuZHRzICAgICB8IDE3ICsrKysrKysrKysrKysrKysKPiA+ICAuLi4vamg3MTEwLXN0YXJmaXZl
LXZpc2lvbmZpdmUtMi5kdHNpICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrCj4gPiAg
NCBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gLi50
byBoZXJlIHNlZW1zIHRvIGJlIGFkZGVkIGJ5IG1pc3Rha2UuIEF0IGxlYXN0IG15ICJnaXQgYW0i
IHdvdWxkbid0IGFwcGx5IGl0Cj4gbGlrZSB0aGlzLgo+CgpNeSBlZGl0aW5nIG1pc3Rha2UuIEkg
d2lsbCBmaXggdGhhdC4KCj4gV2l0aCB0aGF0IGZpeGVkIHRoaXMgbG9va3MgZ29vZCB0byBtZSwg
dGhhbmtzLgo+Cj4gUmV2aWV3ZWQtYnk6IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5l
ci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPgo+CgpUaGFuayB5b3UsIEVtaWwuCgo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNpIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kKPiA+IGluZGV4
IGM3NzcxYjNiNjQ3NS4uOWU3N2Y3OWVjMTYyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9i
b290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNpCj4gPiBAQCAtMTc2LDcgKzE3Niw2
IEBAIGNzaTJyeF90b19jYW1zczogZW5kcG9pbnQgewo+ID4gICZnbWFjMCB7Cj4gPiAgICAgICBw
aHktaGFuZGxlID0gPCZwaHkwPjsKPiA+ICAgICAgIHBoeS1tb2RlID0gInJnbWlpLWlkIjsKPiA+
IC0gICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+Cj4gPiAgICAgICBtZGlvIHsKPiA+ICAgICAgICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiBAQCAtMTk2LDcgKzE5NSw2IEBAICZpMmMw
IHsKPiA+ICAgICAgIGkyYy1zY2wtZmFsbGluZy10aW1lLW5zID0gPDUxMD47Cj4gPiAgICAgICBw
aW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ID4gICAgICAgcGluY3RybC0wID0gPCZpMmMwX3Bp
bnM+Owo+ID4gLSAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gIH07Cj4gPgo+ID4gICZpMmMyIHsK
PiA+IEBAIC0zMTEsNyArMzA5LDYgQEAgJnBjaWUxIHsKPiA+ICAmcHdtZGFjIHsKPiA+ICAgICAg
IHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gPiAgICAgICBwaW5jdHJsLTAgPSA8JnB3bWRh
Y19waW5zPjsKPiA+IC0gICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICB9Owo+ID4KPiA+ICAmcXNw
aSB7Cj4gPiBAQCAtMzUwLDEzICszNDcsMTEgQEAgdWJvb3RAMTAwMDAwIHsKPiA+ICAmcHdtIHsK
PiA+ICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gPiAgICAgICBwaW5jdHJsLTAg
PSA8JnB3bV9waW5zPjsKPiA+IC0gICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICB9Owo+ID4KPiA+
ICAmc3BpMCB7Cj4gPiAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ID4gICAgICAg
cGluY3RybC0wID0gPCZzcGkwX3BpbnM+Owo+ID4gLSAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4K
PiA+ICAgICAgIHNwaV9kZXYwOiBzcGlAMCB7Cj4gPiAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAicm9obSxkaDIyMjhmdiI7Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9z
dGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJm
aXZlL2poNzExMC1taWxrdi1tYXJzLmR0cwo+ID4gaW5kZXggNWNiOWU5OWUxZGFjLi42NmFkM2Vi
MmZkNjYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEx
MC1taWxrdi1tYXJzLmR0cwo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9q
aDcxMTAtbWlsa3YtbWFycy5kdHMKPiA+IEBAIC0xNSw2ICsxNSwxMSBAQCAmZ21hYzAgewo+ID4g
ICAgICAgc3RhcmZpdmUsdHgtdXNlLXJnbWlpLWNsazsKPiA+ICAgICAgIGFzc2lnbmVkLWNsb2Nr
cyA9IDwmYW9uY3JnIEpINzExMF9BT05DTEtfR01BQzBfVFg+Owo+ID4gICAgICAgYXNzaWduZWQt
Y2xvY2stcGFyZW50cyA9IDwmYW9uY3JnIEpINzExMF9BT05DTEtfR01BQzBfUk1JSV9SVFg+Owo+
ID4gKyAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gK307Cj4gPiArCj4gPiArJmkyYzAgewo+ID4g
KyAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gIH07Cj4gPgo+ID4gICZwY2llMCB7Cj4gPiBAQCAt
MzUsMyArNDAsMTUgQEAgJnBoeTAgewo+ID4gICAgICAgcngtaW50ZXJuYWwtZGVsYXktcHMgPSA8
MTUwMD47Cj4gPiAgICAgICB0eC1pbnRlcm5hbC1kZWxheS1wcyA9IDwxNTAwPjsKPiA+ICB9Owo+
ID4gKwo+ID4gKyZwd20gewo+ID4gKyAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gK307Cj4gPiAr
Cj4gPiArJnB3bWRhYyB7Cj4gPiArICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiArfTsKPiA+ICsK
PiA+ICsmc3BpMCB7Cj4gPiArICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiArfTsKPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1waW5lNjQtc3RhcjY0
LmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXBpbmU2NC1zdGFyNjQu
ZHRzCj4gPiBpbmRleCBiNzIwY2RkMTVlZDYuLmRiYzg2MTJiODQ2NCAxMDA2NDQKPiA+IC0tLSBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXBpbmU2NC1zdGFyNjQuZHRzCj4g
PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1waW5lNjQtc3RhcjY0
LmR0cwo+ID4gQEAgLTE4LDYgKzE4LDcgQEAgJmdtYWMwIHsKPiA+ICAgICAgIHN0YXJmaXZlLHR4
LXVzZS1yZ21paS1jbGs7Cj4gPiAgICAgICBhc3NpZ25lZC1jbG9ja3MgPSA8JmFvbmNyZyBKSDcx
MTBfQU9OQ0xLX0dNQUMwX1RYPjsKPiA+ICAgICAgIGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8
JmFvbmNyZyBKSDcxMTBfQU9OQ0xLX0dNQUMwX1JNSUlfUlRYPjsKPiA+ICsgICAgIHN0YXR1cyA9
ICJva2F5IjsKPiA+ICB9Owo+ID4KPiA+ICAmZ21hYzEgewo+ID4gQEAgLTM5LDYgKzQwLDEwIEBA
IHBoeTE6IGV0aGVybmV0LXBoeUAxIHsKPiA+ICAgICAgIH07Cj4gPiAgfTsKPiA+Cj4gPiArJmky
YzAgewo+ID4gKyAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gK307Cj4gPiArCj4gPiAgJnBjaWUx
IHsKPiA+ICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICB9Owo+ID4gQEAgLTYzLDMgKzY4LDE1
IEBAICZwaHkxIHsKPiA+ICAgICAgIG1vdG9yY29tbSx0eC1jbGstMTAtaW52ZXJ0ZWQ7Cj4gPiAg
ICAgICBtb3RvcmNvbW0sdHgtY2xrLTEwMC1pbnZlcnRlZDsKPiA+ICB9Owo+ID4gKwo+ID4gKyZw
d20gewo+ID4gKyAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gK307Cj4gPiArCj4gPiArJnB3bWRh
YyB7Cj4gPiArICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiArfTsKPiA+ICsKPiA+ICsmc3BpMCB7
Cj4gPiArICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiArfTsKPiA+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRz
aSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZp
dmUtMi5kdHNpCj4gPiBpbmRleCAxOGYzOGZjNzkwYTQuLmVmOTNhMzk0YmIyZiAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lv
bmZpdmUtMi5kdHNpCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEx
MC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaQo+ID4gQEAgLTEzLDYgKzEzLDEwIEBAIGFsaWFz
ZXMgewo+ID4gICAgICAgfTsKPiA+ICB9Owo+ID4KPiA+ICsmZ21hYzAgewo+ID4gKyAgICAgc3Rh
dHVzID0gIm9rYXkiOwo+ID4gK307Cj4gPiArCj4gPiAgJmdtYWMxIHsKPiA+ICAgICAgIHBoeS1o
YW5kbGUgPSA8JnBoeTE+Owo+ID4gICAgICAgcGh5LW1vZGUgPSAicmdtaWktaWQiOwo+ID4gQEAg
LTI5LDYgKzMzLDEwIEBAIHBoeTE6IGV0aGVybmV0LXBoeUAxIHsKPiA+ICAgICAgIH07Cj4gPiAg
fTsKPiA+Cj4gPiArJmkyYzAgewo+ID4gKyAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gK307Cj4g
PiArCj4gPiAgJm1tYzAgewo+ID4gICAgICAgbm9uLXJlbW92YWJsZTsKPiA+ICB9Owo+ID4gQEAg
LTQwLDMgKzQ4LDE1IEBAICZwY2llMCB7Cj4gPiAgJnBjaWUxIHsKPiA+ICAgICAgIHN0YXR1cyA9
ICJva2F5IjsKPiA+ICB9Owo+ID4gKwo+ID4gKyZwd20gewo+ID4gKyAgICAgc3RhdHVzID0gIm9r
YXkiOwo+ID4gK307Cj4gPiArCj4gPiArJnB3bWRhYyB7Cj4gPiArICAgICBzdGF0dXMgPSAib2th
eSI7Cj4gPiArfTsKPiA+ICsKPiA+ICsmc3BpMCB7Cj4gPiArICAgICBzdGF0dXMgPSAib2theSI7
Cj4gPiArfTsKPiA+IC0tCj4gPiAyLjM0LjEKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
