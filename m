Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1492ACA0EEF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crxJ4doC5Gh8kqlGSjyajVPUH0Jhslqj177ffOVinGQ=; b=zJZU5OldYpqz3+
	YzRoCkN6H6uGn6pHVOTClIKkoMkVH/mHKQPh8Q7JqvDDkgoNSpMHjLCdR6oVxn2XzbgH6wQ+F9ZtV
	zEj8IZRrczZus8zlwvj9ZaX8eXqK4xmGlKMIHouL881Bq3ENWo948bYx3rwkJALOk3+TdBklSVla4
	lzxU7fbfOlOLEf5vuDsbCntGa62C5P3aCWVAuWjF2HM7mJdUxK6/XisX9r9kw9C6jg1Jf9RdUpalk
	GJTWkkKxJBWadFjTxxWDNmPbr4StOqQZNbnuKxAvczdQokdxHJpmNpOmSGhmSiut0DEAwNXWRffYb
	RHveUoC4QDHXflvLiLrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4h7-003exO-04;
	Tue, 12 Sep 2023 14:48:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4h4-003ew7-2K
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 14:48:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A5C5ECE1D41
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 14:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57523C433CC
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694530122;
	bh=cmSPSl39QvQWa9g5ChH12ssAtfBX5/uCF9PBN3Ez2xQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BnT6P8bqM5sL2QvwI+sVkJr7+ekVJ4PXmyVU1PffoAkwPm+tYCH40tWcw7Bzux13x
	 6Cd3lBCVzIkfXm9cJz9GsXTIIA6GN7GHlykWQnWhXHPA24PKstr/Q3tWnbi5zbTzpD
	 5cFJUNy6AGtRXZO4gLxHEE2JMTejmzgRVahYWoopckgqA0He8ihkoMoiNt7r75SoaS
	 kqsUbiJnuzBSkjhXfPVzr+KNGzDgQ5Qs7eYBu24hEm0afOjJSrSlih5N6iQOpr09G8
	 CycpQGOv0OF+ed1ptB8IfErA5e+WFWYAK+kPPQiFGNc4QdLuAb5mMOWlafz9eAey1d
	 zxqB6kd25mpsA==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-52e297c7c39so7223438a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 07:48:42 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx9AAVigATq/Wnmy9RI9EptR3FnzK/aV/6aB643pUawoi/c/jiP
	0/CQmJtyo+qQWslo3LXg60GL7ek5DJbqys8rMiE=
X-Google-Smtp-Source: AGHT+IG5b9zswugD4X5oIlujI6tqxSFWVLDmzPCygGnoR2Bhh7duf8BjBTB7sDtNDcWWXUa0Jy3dQCQyrCCHqkXwCL4=
X-Received: by 2002:a05:6402:795:b0:52a:1d9c:83f2 with SMTP id
 d21-20020a056402079500b0052a1d9c83f2mr11415348edy.23.1694530120667; Tue, 12
 Sep 2023 07:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230912072232.2455-1-jszhang@kernel.org>
In-Reply-To: <20230912072232.2455-1-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 12 Sep 2023 22:48:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTSLabt4WFgkDoHWpTuv=KTcQTK7gfNVhS-d7yHOe2fRw@mail.gmail.com>
Message-ID: <CAJF2gTTSLabt4WFgkDoHWpTuv=KTcQTK7gfNVhS-d7yHOe2fRw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_074846_932686_0111AAEF 
X-CRM114-Status: GOOD (  15.20  )
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

T24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgMzozNOKAr1BNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiByaXNjdiBzZWxlY3QgQVJDSF9ETUFfREVGQVVMVF9DT0hF
UkVOVCBieSBkZWZhdWx0LCBhbmQgdGgxNTIwIGlzbid0Cj4gZG1hIGNvaGVyZW50LCBzbyBzZXQg
ZG1hLW5vbmNvaGVyZW50IHRvIHJlZmxlY3QgdGhpcyBmYWN0Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IFRlc3RlZC1ieTogRHJldyBGdXN0
aW5pIDxkZnVzdGluaUBiYXlsaWJyZS5jb20+Cj4gLS0tCj4KPiBTaW5jZSB2MToKPiAgLSByZWJh
c2Ugb24gdjYuNi1yYzEKPiAgLSBjb2xsZWN0IFRlc3RlZC1ieSB0YWcKPgo+ICBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgx
NTIwLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gaW5kZXgg
Y2U3MDgxODNiNmY2Li5mZjM2NDcwOWE2ZGYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290
L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQv
dGgxNTIwLmR0c2kKPiBAQCAtMTM5LDYgKzEzOSw3IEBAIHNvYyB7Cj4gICAgICAgICAgICAgICAg
IGludGVycnVwdC1wYXJlbnQgPSA8JnBsaWM+Owo+ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwyPjsKPiAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47Cj4gKyAgICAg
ICAgICAgICAgIGRtYS1ub25jb2hlcmVudDsKUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBr
ZXJuZWwub3JnPgoKPiAgICAgICAgICAgICAgICAgcmFuZ2VzOwo+Cj4gICAgICAgICAgICAgICAg
IHBsaWM6IGludGVycnVwdC1jb250cm9sbGVyQGZmZDgwMDAwMDAgewo+IC0tCj4gMi40MC4xCj4K
CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
