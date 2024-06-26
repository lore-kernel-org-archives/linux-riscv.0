Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D607CC3064D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YlK8bXnROob6e/m8AfPktl2Sw2VnJ5LanYA7AowYB6Y=; b=vPVAL6FfPOcw1v
	GLnNnA7S1DvntTXk5dmZBrBw1gIHadcIBWYL3wVeSNvYz2B7Mq497zrebpTkY0R6aFww5oUIkdUaq
	PeNLyt6JoLQNBkhQYUa6a4/XBe+BP7pXu3mbjOmQ5D7ye4RbTr0/30DSxHZZBSNqXeVTrrAGXRTit
	VIBNFv7Yv/qLJpv8vibW4jpty39WzFPY7oIY0CIWuuUqfPD7deI8ilQcOqooQ5K1iLSgRV7/JqtPb
	pPdUCe+IPnPxwj6e0Plbv6thspIiMmPb/T57bR8HXrx+x9v1fd3+e0rNoCAJAmktvQIqn7Ryu0InB
	8b7AEp0TOPo6Pb5bjnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUiD-00000007QU6-2y2d;
	Wed, 26 Jun 2024 15:37:33 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUi9-00000007QSS-3Gfm
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 15:37:31 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3738690172eso28926405ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1719416249; x=1720021049; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djm95X6p6IaeLZbZdbaqKrtkESz+vZAuebRV5jg6gDs=;
        b=SO3sevV/GysjDRMiRvb5wfSHQceG6DZ0loexKTCDHLfNpN5eKLf0Z/OPCVl3hYfnB4
         /hAem9pqJhAbDLBq9FsNRq75al3JEKpG4t8vvcp2CTTFAxCnjHYlckVeU09aEH3XWn7X
         ErkpzOMP7DMC1zcPmHlJK7+f2tyMdIYybN/55kf7EAsx968jOoJRFjJ72ryS0+/305Nw
         QvGD8ovFBLTcraqe24XoySItwsJIscnd3Ac9LLB5s54vrhJ9PzDPFlgFmZ7J5Mzc9ykN
         UDAykFDyG0AHw3/mzui9pJbo9PfOZQPPbTRLFqbPpJN86anK8JGBQo1LZBxf8/67YyRO
         a1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719416249; x=1720021049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djm95X6p6IaeLZbZdbaqKrtkESz+vZAuebRV5jg6gDs=;
        b=E4rIfWVrUGSo5KCCv1g4l5oiSEuL44aIVNBTXQymmnkY9EKy1T2GJjNi6ml4FMHt4Y
         5DacEC8NavcQ8vPVwuRevwFGC6UcScsAQUCto8gC9E1K9kHo+obiKG4TZVPyjZLJXwPV
         32OLYwNo9FVlwTzYflCNNKef5ba4pY2tI/JqWCzK93rNYMR2xijGAn6IYPrB/8RGUtym
         C3ObVlo3oZ6msDW2WsR1EZ6+RAM0SKpKwgCNU8nCezirBOWGc7RcSmYe42OnJrtDcYFw
         pmkBoIQpyWfVbAFKlhlHqF0oe0xY1r6UingUMU5LGjVLbRXasm4b51c+mpN0ZNvnavit
         jkKw==
X-Gm-Message-State: AOJu0YwvLH6AMMwlb0DE2PtxSLQp05K8sNztCGc95SjtgmK3m04NGRSf
	AxopOy4df4EzPWydmDGDDQQrYye2ETQDMMG1s+LGX5sCzm//J58q7miy8ddboyU/9G4calIemWJ
	Pr9idwR+Cb8I/T0SnZPZp6BBQB/pHepoPf33iTw==
X-Google-Smtp-Source: AGHT+IH9f7DLHpuBXv6da3ik1Qp7+5du5cYs0yCkTQ5Su4zhY985HtIYAAUVHSrFL6mOhsBR6Cp0oRRk8/QK4xGfB7w=
X-Received: by 2002:a05:6e02:1d90:b0:376:178f:edc5 with SMTP id
 e9e14a558f8ab-3763e0613c9mr136393415ab.29.1719416248959; Wed, 26 Jun 2024
 08:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240426100820.14762-8-ajones@ventanamicro.com> <20240426100820.14762-14-ajones@ventanamicro.com>
In-Reply-To: <20240426100820.14762-14-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 26 Jun 2024 21:07:16 +0530
Message-ID: <CAAhSdy3QrYv1dWkhWfQk0z5BXWrksxXofu4iobBcVk1SSqeScQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] KVM: riscv: selftests: Add Zawrs extension to
 get-reg-list test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, conor.dooley@microchip.com, atishp@atishpatra.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com, 
	David.Laight@aculab.com, parri.andrea@gmail.com, luxu.kernel@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_083729_901322_2FEA3775 
X-CRM114-Status: GOOD (  13.10  )
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

T24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgMzozOOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gS1ZNIFJJU0MtViBhbGxvd3MgdGhlIFphd3JzIGV4
dGVuc2lvbiBmb3IgdGhlIEd1ZXN0L1ZNLCBzbyBhZGQgaXQKPiB0byB0aGUgZ2V0LXJlZy1saXN0
IHRlc3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWlj
cm8uY29tPgoKTEdUTS4KCkFja2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlz
Y3YvZ2V0LXJlZy1saXN0LmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9n
ZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVn
LWxpc3QuYwo+IGluZGV4IGI4ODJiN2I5Yjc4NS4uOGM0YzI3YmQ0Yjg4IDEwMDY0NAo+IC0tLSBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+ICsrKyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+IEBAIC00
OCw2ICs0OCw3IEBAIGJvb2wgZmlsdGVyX3JlZyhfX3U2NCByZWcpCj4gICAgICAgICBjYXNlIEtW
TV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVND
Vl9JU0FfRVhUX1NWTkFQT1Q6Cj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8
IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1NWUEJNVDoKPiAg
ICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lO
R0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkFDQVM6Cj4gKyAgICAgICBjYXNlIEtWTV9SRUdfUklT
Q1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhU
X1pBV1JTOgo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQkE6Cj4gICAgICAgICBjYXNlIEtW
TV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVND
Vl9JU0FfRVhUX1pCQjoKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZN
X1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkJDOgo+IEBAIC00MTMs
NiArNDE0LDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmlzYV9leHRfc2luZ2xlX2lkX3RvX3N0cihf
X3U2NCByZWdfb2ZmKQo+ICAgICAgICAgICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZOQVBPVCks
Cj4gICAgICAgICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVlBCTVQpLAo+ICAgICAgICAgICAg
ICAgICBLVk1fSVNBX0VYVF9BUlIoWkFDQVMpLAo+ICsgICAgICAgICAgICAgICBLVk1fSVNBX0VY
VF9BUlIoWkFXUlMpLAo+ICAgICAgICAgICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkJBKSwKPiAg
ICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpCQiksCj4gICAgICAgICAgICAgICAgIEtW
TV9JU0FfRVhUX0FSUihaQkMpLAo+IEBAIC05MzYsNiArOTM4LDcgQEAgS1ZNX0lTQV9FWFRfU0lN
UExFX0NPTkZJRyhzdmludmFsLCBTVklOVkFMKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJ
Ryhzdm5hcG90LCBTVk5BUE9UKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyhzdnBibXQs
IFNWUEJNVCk7Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemFjYXMsIFpBQ0FTKTsKPiAr
S1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YXdycywgWkFXUlMpOwo+ICBLVk1fSVNBX0VYVF9T
SU1QTEVfQ09ORklHKHpiYSwgWkJBKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YmIs
IFpCQik7Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemJjLCBaQkMpOwo+IEBAIC05OTEs
NiArOTk0LDcgQEAgc3RydWN0IHZjcHVfcmVnX2xpc3QgKnZjcHVfY29uZmlnc1tdID0gewo+ICAg
ICAgICAgJmNvbmZpZ19zdm5hcG90LAo+ICAgICAgICAgJmNvbmZpZ19zdnBibXQsCj4gICAgICAg
ICAmY29uZmlnX3phY2FzLAo+ICsgICAgICAgJmNvbmZpZ196YXdycywKPiAgICAgICAgICZjb25m
aWdfemJhLAo+ICAgICAgICAgJmNvbmZpZ196YmIsCj4gICAgICAgICAmY29uZmlnX3piYywKPiAt
LQo+IDIuNDQuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
