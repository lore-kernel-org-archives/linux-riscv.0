Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63414C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 19:01:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7B3422203
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 19:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7B3422203
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YaPNudFVFH/7CROg1PG0okredP1Cj92OabwIJRkb/TY=; b=qho8d2CsGqm4DXvZaljnakWRF
	OLxZfNR7SOyt4CLkho5kq4oTS3NfcPATXSVX3v4i4PJ9gTBKHhtzUNDN0usCXwsbvlXCOTteIQRoF
	jEcnSfnUS4FoSEgd9ZgjrtnB0BoU2vz+/2YbDdEub2GHIpDO35Qf/MxT/rkxDepnPJO4+/uM13EG0
	Kr7h6j4av4bBC4A3J1NzqQ5ew5QPhdcGEP119Wc/Y3LNaIrNQ8YrgRxZkvddcwVj3n6waXtY1cIAK
	NvXcboEzgv+oIHDEKOXEUmhuKtojUm19ArnUgYUf/hr93kz4UKVSlSD9IRKiympnTolUC0LyvWqFi
	i0CN3cJUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kktqz-000611-4d; Thu, 03 Dec 2020 19:01:21 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kktqv-00060X-SH
 for linux-riscv@lists.infradead.org; Thu, 03 Dec 2020 19:01:18 +0000
Received: from [192.168.1.155] ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MrhHm-1kQ59R2orc-00nlJT; Thu, 03 Dec 2020 20:01:13 +0100
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To: Randy Dunlap <rdunlap@infradead.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <20201127183003.2849-1-info@metux.net>
 <ba756539-2435-3587-3aeb-31e7ce95aad7@infradead.org>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <7aa911af-ea41-d496-cce8-54c7ae671076@metux.net>
Date: Thu, 3 Dec 2020 20:01:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ba756539-2435-3587-3aeb-31e7ce95aad7@infradead.org>
Content-Language: tl
X-Provags-ID: V03:K1:ss5/B/vJ/twWN/pOXDCDEl0QrmSL4O1RoPAdX1RwHOs6rEAO0W+
 RepNDCaUv1d1gAbZ5WV1FIfHJROxwr73HClcCPGmzk0+HYap4AMJyBhT6OQI7mhAwftTtI8
 pNb5EhfWxRttNPn8oPBdg9eQG9sZoCCmJGyc56I2xA3lVtIOVpgziCFnDpd+q5GEAOu6rEF
 SMyTC26gFmRbrFklsuQ2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MUwloyMoVlE=:xGbnPFFtYuJqN1gKfsdHJI
 2olyfpX41JPC6+KWNGgDc+gKpqThJCWLJwWp6hjqJJCWQTdoswqlUPZDDhqoa483E0/yCZpOG
 iCl4qcW2FdKbej/YNrddOuT8PmjQYD3qWuLPojfXXnLzsmcc7yaw0kGdwUHAzXTvkyCPEUYNO
 MulSgEdHe1hhd3x4OQWHyKRUrgjyG1/2h3bVEKGBnK/TWzvba/5BeYusex34LjerUtaVPiEc9
 YYoMVsf3wQ85Lz36lnHK8/TZ4rOQphMFwek+KsWTmZ4FQgNJwQF43hkaHdS0Ai/ix/dZAy1Bd
 uZSLj6emDBtfjILOWld9QbKbifVN3YdqFnfvwfIsRDYvn0WioF9WnaieVpoYNN8KK/N9/Fe3j
 w8s5cNdg5fZc7HDj/8GvxSEfLZ+1uAZjTAM2lg4ROBwLMVI1hE/jpL6ptpS7V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_140118_139531_59336E43 
X-CRM114-Status: GOOD (  12.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, bgolaszewski@baylibre.com,
 linux-riscv@lists.infradead.org, jasowang@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjcuMTEuMjAgMTk6NDUsIFJhbmR5IER1bmxhcCB3cm90ZToKPiBPbiAxMS8yNy8yMCAxMDoz
MCBBTSwgRW5yaWNvIFdlaWdlbHQsIG1ldHV4IElUIGNvbnN1bHQgd3JvdGU6Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwaW8vS2NvbmZpZyBiL2RyaXZlcnMvZ3Bpby9LY29uZmlnCj4+IGluZGV4
IDVkNGRlNWNkNjc1OS4uZTg0MTRkODJjZjc1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwaW8v
S2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL2dwaW8vS2NvbmZpZwo+PiBAQCAtMTYxMyw0ICsxNjEz
LDEzIEBAIGNvbmZpZyBHUElPX01PQ0tVUAo+PiAgCSAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
Z3Bpby9ncGlvLW1vY2t1cC5zaC4gUmVmZXJlbmNlIHRoZSB1c2FnZSBpbgo+PiAgCSAgaXQuCj4+
ICAKPj4gK2NvbmZpZyBHUElPX1ZJUlRJTwo+PiArCXRyaXN0YXRlICJWaXJ0SU8gR1BJTyBzdXBw
b3J0Igo+PiArCWRlcGVuZHMgb24gVklSVElPCj4+ICsJaGVscAo+PiArCSAgU2F5IFkgaGVyZSB0
byBlbmFibGUgZ3Vlc3Qgc3VwcG9ydCBmb3IgdmlydGlvIGJhc2VkIEdQSU9zLgo+IAo+IAkgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZpcnRpby1iYXNlZAo+IAo+PiAr
Cj4+ICsJICBUaGVzZSB2aXJ0dWFsIGdwaW9zIGNhbiBiZSByb3V0ZWQgdG8gcmVhbCBHUElPcyBv
ciBhdHRhY2hlZCB0bwo+IAo+IAkgICAgICAgICAgICAgICAgR1BJT3MKCnRoeC4gZml4ZWQgaW4g
djIuCgoKPiAKPj4gKwkgIHNpbXVsYXRvcnMgb24gdGhlIGhvc3QgKHFlbXUpLgo+PiArCj4+ICBl
bmRpZgo+IAo+IAoKLS0gCi0tLQpIaW53ZWlzOiB1bnZlcnNjaGzDvHNzZWx0ZSBFLU1haWxzIGvD
tm5uZW4gbGVpY2h0IGFiZ2Vow7ZydCB1bmQgbWFuaXB1bGllcnQKd2VyZGVuICEgRsO8ciBlaW5l
IHZlcnRyYXVsaWNoZSBLb21tdW5pa2F0aW9uIHNlbmRlbiBTaWUgYml0dGUgaWhyZW4KR1BHL1BH
UC1TY2hsw7xzc2VsIHp1LgotLS0KRW5yaWNvIFdlaWdlbHQsIG1ldHV4IElUIGNvbnN1bHQKRnJl
ZSBzb2Z0d2FyZSBhbmQgTGludXggZW1iZWRkZWQgZW5naW5lZXJpbmcKaW5mb0BtZXR1eC5uZXQg
LS0gKzQ5LTE1MS0yNzU2NTI4NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
