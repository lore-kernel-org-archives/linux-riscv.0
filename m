Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6468CC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:47:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1061864FEE
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1061864FEE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Az6h1IzMc35r5Hpp83smE9Y3W9PbPUDJHuyNw579UvE=; b=NxQYIDd7e5Zu5cliXGDrSJeTr
	XVww7nRqz10xproOY1T4f/oPaYsuEH4q1OXYfWuNNNgldznJ8JvPer0pQvonFZedCVhwFCIBV1Lop
	y2MP7JC07/Vt3Tu0LbMmXW1gNQOvK2w4WpyuUYiRjUXLG018cHkr6QAC1E40kTJ7+fK47o0Vpbmcp
	5eBI+4WKu7Op/1KL2znPY7AnNgdREyqXZ+V53dGhDu2oSRH/PGGvrpwQXpiQ+w6wYoazMUPbWABpG
	3UVPO2FjlOx84cojyZf+oO3+Q8/fryOOTHmeq1A97BxTl312jRcx4LNdKwRPS8rt7ISWyYL5mxOaQ
	Ks6mA71pw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJql1-0061Lb-6i; Wed, 10 Mar 2021 04:47:39 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJqku-0061KZ-TG
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 04:47:36 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so6530699pjq.5
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 20:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=V8CovqO2r2c3lZFxI+Vlz80bG5YIFGmxCrj/XPBe6Sw=;
 b=tcRWTtQJwyQCDK5Db+d9WbORhnitIMEgAhGeA8awjiVyQlNhU2iFat9SLNzn0ZYU22
 7TN2//+Jr0Q8dWOHFEzlaxej5pcUQoIG+gqUMTjsW6U8eK+2ZBhShZkJZ0wNSNzgQImZ
 rUBsoqUSJxXKHyURNg054vZ5S4aQizqtRcAf0gL8NoC8DCckCFNM4h/aYJg6CacmumZu
 Ou5efOjgv5CIfdYvJoC/+joeN4r0ICEt90ROswhSwPnrGULUgXUeJFU5yx0no05QmGd0
 IvTZ9vYuJlM9lDiCWyLWUtH9dfBdJIwK47bHFyPzn83ouXlUreBso3eA9HZf3IpSf5Z0
 GqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=V8CovqO2r2c3lZFxI+Vlz80bG5YIFGmxCrj/XPBe6Sw=;
 b=AMqZQQvCT+NG/D+oqd719TRvnWtEbNeKNlWn0Ba2r6BWSXTNTCTV2YTHFg1xnPQJOB
 E3YqkuoSP+xUwHjjuxiqdWJrXMNtWgwB8H251jKUKLiqvgpy7CqI9+14DT0iuIiBPHNj
 3R0zYFzFNS73OIT8JCnBkNavQH0753Ab5KBPrH/GTSgC/NJAGSlI40q5nyDc8lyAthyQ
 45OecqeOFykjcXU5sbkpmE8ZBnum7S0PlLtWlofPR/dBQsPBV8fVSarboJs1nAG03sJy
 GhohdYp7EbnzqRobFv9OYbadBl+Gkkl/2BWSrCLKUHGH0LllV2Ms9YSZtkexS6seSuUy
 X6Kw==
X-Gm-Message-State: AOAM5336hQTU5JrFaJ5J768qrckBmqaniH1aJZfqzj4SIZWZUGUFD43b
 3PwV5PrI0JwO9euZx9/Yq+ZCuw==
X-Google-Smtp-Source: ABdhPJzpFUiJudJafEmd5UfrnkjeEeW49aL4mN5nGImsEab1r6oCo1IahjaNCjeP0HQ9zUe/rrs5LA==
X-Received: by 2002:a17:90a:990a:: with SMTP id
 b10mr1583598pjp.178.1615351651352; 
 Tue, 09 Mar 2021 20:47:31 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 3sm4428818pjk.26.2021.03.09.20.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 20:47:30 -0800 (PST)
Date: Tue, 09 Mar 2021 20:47:30 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 20:46:23 PST (-0800)
Subject: Re: [PATCH 1/9] riscv: traps: Fix no prototype warnings
In-Reply-To: <20210305113332.428048-2-sunnanyong@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, 
 wangkefeng.wang@huawei.com, sunnanyong@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunnanyong@huawei.com
Message-ID: <mhng-31d44427-3d4a-4e15-aeae-5bbb8b271349@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_044734_908723_A7359D5A 
X-CRM114-Status: GOOD (  14.93  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAwNSBNYXIgMjAyMSAwMzozMzoyNCBQU1QgKC0wODAwKSwgc3VubmFueW9uZ0BodWF3
ZWkuY29tIHdyb3RlOgo+IEZpeCBhbGwgVz0xIGNvbXBpbGF0aW9uIHdhcm5pbmdzOidubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yJyBpbiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jOgo+IGFyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmM6OTY6MTU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlw
ZSBmb3Ig4oCYZG9fdHJhcF91bmtub3du4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgICA5
NiB8IERPX0VSUk9SX0lORk8oZG9fdHJhcF91bmtub3duLAo+ICAgICAgIHwgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fn4KPiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jOjkxOjI3OiBub3Rl
OiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmERPX0VSUk9SX0lORk/igJkKPiAgICA5MSB8IGFz
bWxpbmthZ2UgX192aXNpYmxlIHZvaWQgbmFtZShzdHJ1Y3QgcHRfcmVncyAqcmVncykgICBcCj4g
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn4KPiBhcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jOjk4OjE1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRv
X3RyYXBfaW5zbl9taXNhbGlnbmVk4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgICA5OCB8
IERPX0VSUk9SX0lORk8oZG9fdHJhcF9pbnNuX21pc2FsaWduZWQsCj4gICAgICAgfCAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
Yzo5MToyNzogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhET19FUlJPUl9JTkZP4oCZ
Cj4gICAgOTEgfCBhc21saW5rYWdlIF9fdmlzaWJsZSB2b2lkIG5hbWUoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpICAgXAo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+Cj4gYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHMuYzoxMDA6MTU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3Rv
dHlwZSBmb3Ig4oCYZG9fdHJhcF9pbnNuX2ZhdWx04oCZIFstV21pc3NpbmctcHJvdG90eXBlc10K
PiAuLi4KPgo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBOYW55b25nIFN1biA8c3VubmFueW9uZ0BodWF3ZWkuY29tPgo+IC0tLQo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmggfCAxNiArKysrKysrKysr
KysrKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICAgICAgICAgICB8ICAxICsK
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9hc20tcHJvdG90eXBlcy5oCj4gaW5kZXggMjdlMDA1ZmNhNTg0Li42ZDgxYWJmNWQ5Zjgg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oCj4g
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oCj4gQEAgLTksNCAr
OSwyMCBAQCBsb25nIGxvbmcgX19sc2hydGkzKGxvbmcgbG9uZyBhLCBpbnQgYik7Cj4gIGxvbmcg
bG9uZyBfX2FzaHJ0aTMobG9uZyBsb25nIGEsIGludCBiKTsKPiAgbG9uZyBsb25nIF9fYXNobHRp
Myhsb25nIGxvbmcgYSwgaW50IGIpOwo+Cj4gKwo+ICsjZGVmaW5lIERFQ0xBUkVfRE9fRVJST1Jf
SU5GTyhuYW1lKQlhc21saW5rYWdlIHZvaWQgbmFtZShzdHJ1Y3QgcHRfcmVncyAqcmVncyk7CgpU
aGlzIHRyaWdnZXJzIGNoZWNrcGF0Y2guCgo+ICsKPiArREVDTEFSRV9ET19FUlJPUl9JTkZPKGRv
X3RyYXBfdW5rbm93bikKPiArREVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfaW5zbl9taXNh
bGlnbmVkKQo+ICtERUNMQVJFX0RPX0VSUk9SX0lORk8oZG9fdHJhcF9pbnNuX2ZhdWx0KQo+ICtE
RUNMQVJFX0RPX0VSUk9SX0lORk8oZG9fdHJhcF9pbnNuX2lsbGVnYWwpCj4gK0RFQ0xBUkVfRE9f
RVJST1JfSU5GTyhkb190cmFwX2xvYWRfZmF1bHQpCj4gK0RFQ0xBUkVfRE9fRVJST1JfSU5GTyhk
b190cmFwX2xvYWRfbWlzYWxpZ25lZCkKPiArREVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBf
c3RvcmVfbWlzYWxpZ25lZCkKPiArREVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfc3RvcmVf
ZmF1bHQpCj4gK0RFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2VjYWxsX3UpCj4gK0RFQ0xB
UkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2VjYWxsX3MpCj4gK0RFQ0xBUkVfRE9fRVJST1JfSU5G
Tyhkb190cmFwX2VjYWxsX20pCj4gK0RFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2JyZWFr
KQo+ICsKPiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfUFJPVE9UWVBFU19IICovCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5j
Cj4gaW5kZXggM2VkMmMyMzYwMWEwLi4wODc5YjVkZjExYjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBA
QCAtMTcsNiArMTcsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9pcnEuaD4KPgo+ICsjaW5jbHVkZSA8YXNtL2FzbS1wcm90b3R5cGVzLmg+Cj4gICNp
bmNsdWRlIDxhc20vYnVnLmg+Cj4gICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+Cj4gICNpbmNs
dWRlIDxhc20vcHRyYWNlLmg+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
