Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB3EC54EE9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mPIVPkZVqPk0NQMqYdz+LafAQhTQLHgSr1PuaFmEdI0=; b=ZAbMTfONRcbUofrTSCl8ip6fu5
	DHuSh+WdBG7DIPIY/JEm+8S2o3Ziwk0Xd5dhgO/623mo+05jx2OmUihbKxbUunMPQ2MwM9oHhx4aR
	JJer4e2KtlPcM6Q8Br3Vu0ht4nBr5T5sUFINwIGGGi+SljfsuxS/kdZDxuQxLGKU42i1RjMYdXR4+
	ZxkfHdsAlA+gaOPBcldu0Kj30bhsroyF7kGtPnRdM4j498tZBKri3agnU4K+fAn7I1KfwyoP5+4F5
	aQg+Gp9gz0U5UmEx9a+7tfEAHUsgADnzBfgefB6ejVip7SMcQCkVGGtaRasRK+gXRRQtfLSZKbjoO
	l4qL8UOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obOHT-00GUT0-2c; Thu, 22 Sep 2022 15:38:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obOHO-00GUOs-Ji
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 15:38:24 +0000
Received: by mail-pf1-x436.google.com with SMTP id l65so9674381pfl.8
        for <linux-riscv@lists.infradead.org>; Thu, 22 Sep 2022 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=bpjfOYoSv5A6ltTE7bNci0zPUSIImgNT09jU6d0SQCY=;
        b=5XEfETonWRqUU8glWzlRm/sbdymypgb4T4/KABba0eLUH9DgFQhH0tR6oq/aop6KXF
         iKe2rycdbJ8E8cXfnWA+HzXCdrsYTW5B8+RstwYrSDvTVk2/o9bPqdM0a45NDztTP4Sy
         lO00h9DzgGjpWHk5e3CyQZJwMRECMGHNL+Cx3FdJYZdCLMNNIg2IABrGGUwBfQThjqmO
         cokoE1cpLsdWIEa+ucazfPOBhtVNy79aH/xlAGEyYGqTZ8EV/yNxsEQI2q20xXusmkyN
         gjNy0NeuhJCVxwn5y4xacrDeGDS9+1IKYAeCoIxcaC0LN2jD/KU8/kplV1WnERMU5QOM
         eqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=bpjfOYoSv5A6ltTE7bNci0zPUSIImgNT09jU6d0SQCY=;
        b=dUNnyXI1tKxec3pk2gGCjdEBThcLnmfQ1+3qPX2DgW1N1znI3xS22IyZBf4d+RPOjG
         ZeHlXEtTTn5jU1CxHzAg57ciwkgF8zpEtb7VyDB3FVyZVzur/gVhHlfDpctluhXapjKe
         yB1TGoe2C5W3vkqAsy0Qgo5vjwFjphaiFp8KqTx2OLFEo4kffemGTzTNNReuMNe83FUm
         YM/KmxsYhWO81oAW+GQN7HxAc6rvsM2+JIgKt0nXC4WYAsYubbTGn2pOOEqU6VkFfzB0
         5WS3T6bgOQ3s6o2t5qwHaVlVBrQ1MNfcNyWwDn1A2llGNYdMAvVEf4kSs/zGdtoCETmX
         FAlA==
X-Gm-Message-State: ACrzQf1eDvEl1Ye45CNO9ppFRBISQG2S7I55F8heSVMJXWRUy75AszBl
	qQlnGjwClBGxUscRfb/cSONZ5w==
X-Google-Smtp-Source: AMsMyM7Zk2CJzOZjp+VesXJCUeo2jTgARi52Kcn17gjYRAXAH55ccF2lqk1CRi69bs6e1WgPAXrEhw==
X-Received: by 2002:a63:ff50:0:b0:439:ae51:503c with SMTP id s16-20020a63ff50000000b00439ae51503cmr3630015pgk.158.1663861095015;
        Thu, 22 Sep 2022 08:38:15 -0700 (PDT)
Received: from localhost (pop.92-184-98-183.mobile.abo.orange.fr. [92.184.98.183])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902ced200b001783f964fe3sm4273668plg.113.2022.09.22.08.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 08:38:14 -0700 (PDT)
Date: Thu, 22 Sep 2022 08:38:14 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Sep 2022 08:31:47 PDT (-0700)
Subject: Re: [PATCH -next] scv:=20errata:=20fix=20=E2=80=98riscv?= Fcbom=5Fblock=5Fsize=E2=80=99=20variable=20undeclared?=
In-Reply-To: <20220919094426.860040-1-zengheng4@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Stephen Rothwell <sfr@canb.auug.org.au>, linux-riscv@lists.infradead.org, liwei391@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zengheng4@huawei.com
Message-ID: <mhng-10f7d57a-1cbb-4dce-bf43-513ff8814639@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_083822_874287_C220C78D 
X-CRM114-Status: GOOD (  18.39  )
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

T24gTW9uLCAxOSBTZXAgMjAyMiAwMjo0NDoyNSBQRFQgKC0wNzAwKSwgemVuZ2hlbmc0QGh1YXdl
aS5jb20gd3JvdGU6Cj4gYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmM6IEluIGZ1bmN0
aW9uIOKAmGVycmF0YV9wcm9iZV9jbW/igJk6Cj4gYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJy
YXRhLmM6NDA6MjogZXJyb3I6IOKAmHJpc2N2X2Nib21fYmxvY2tfc2l6ZeKAmSB1bmRlY2xhcmVk
IChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhyaXNjdl9pbml0
X2Nib21fYmxvY2tzaXpl4oCZPwo+ICAgIDQwIHwgIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSA9IEwx
X0NBQ0hFX0JZVEVTOwo+ICAgICAgIHwgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgICAgIHwg
IHJpc2N2X2luaXRfY2JvbV9ibG9ja3NpemUKPgo+ICdyaXNjdl9jYm9tX2Jsb2NrX3NpemUnIHZh
cmlhYmxlIHNob3VsZCBiZSBkZWNsYXJlZAo+IHdpdGhvdXQgdGhlIGxpbWl0YXRpb24gd2hldGhl
ciBDT05GSUdfUklTQ1ZfSVNBX1pJQ0JPTQo+IGlzIGVuYWJsZWQgb3Igbm90LgoKVGhhbmtzLCBi
dXQgYW5vdGhlciB2ZXJzaW9uIG9mIHRoaXMgaXMgYWxyZWFkeSBvbiBmaXhlcy4KCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBaZW5nIEhlbmcgPHplbmdoZW5nNEBodWF3ZWkuY29tPgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hl
Zmx1c2guaAo+IGluZGV4IGE4OWMwMDViNGJiZi4uN2VjNjAwYTcxNjM0IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPiBAQCAtNDIsOCArNDIsOCBAQCB2b2lkIGZsdXNoX2lj
YWNoZV9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgYm9vbCBsb2NhbCk7Cj4KPiAgI2VuZGlmIC8q
IENPTkZJR19TTVAgKi8KPgo+IC0jaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9aSUNCT00KPiAgZXh0
ZXJuIHVuc2lnbmVkIGludCByaXNjdl9jYm9tX2Jsb2NrX3NpemU7Cj4gKyNpZmRlZiBDT05GSUdf
UklTQ1ZfSVNBX1pJQ0JPTQo+ICB2b2lkIHJpc2N2X2luaXRfY2JvbV9ibG9ja3NpemUodm9pZCk7
Cj4gICNlbHNlCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl9pbml0X2Nib21fYmxvY2tzaXpl
KHZvaWQpIHsgfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
