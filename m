Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D28EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 08:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1k2sPcqOVErqXIBjzF/1O29g+ouWQpfX9FloSYfeOlY=; b=EC4WXFhT5DVP/n
	iBvA4pv8Mt26TxugsSGT86mPhIFEXgljNHVn/qBlrNAVKX1+YEDBTX5daViuR13bNQhc9M+MqZ3O6
	Mihp+on5iP3LG+F10U5HigOdcbqYgjX69/Mw5Gw3MASKcH5vIuvkSbDI3a6Pap7J2cXESU5goTsCO
	9C/K4hKAEzABsVl7kTXudZhUMzGYpr043bhsZtlISjz+M20//QMqxIZwI4aEYMBa30NKOSovcBGBw
	3AFQcu6IKe7f6uJ26whAHzWo2mjtfpwV2EdyCDwvxpAhrdBAiNBT2vJVeRj2XFDAFnNVPyWIa8Ru0
	BGnEyllLPUdKx/Ck5v4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCcAF-002vMo-1t;
	Fri, 23 Jun 2023 08:29:07 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCcAC-002vLe-2r
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 08:29:06 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b47a15ca10so6384181fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 01:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687508942; x=1690100942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2qUpj8yKbysFhO4bnXlgIHrtaxdQPNhbEyv05xDcP4=;
        b=cfvo9uHn77Ekx/CS61uXo0whMu3wP1K2SIlBfy8FYGr6t7g7NZX8HtGkK9TVxvRxNx
         T0jDJxHDpSUaBa+JGqOmb7Htfs6i/330ZKZ4H1eq0ya5BSkd5BYTMexkPewGjhjeq3Jr
         TxiUX5AEMqVNInCE4FdX2T8PI1czEvhFf+DLRHbH1e+5MGrSErc2xgn92tR/6umcpvvv
         3k03oQ7qBVwTd8B/6G7rqMTX/bhAUySOQCgKVAOj4fHa7XLUDqL96Te6+jO3awqvPCgU
         uJak6Q5KUclI7DcPaebbC44BdwbEMP941BbRyPN2oU5qrybEVF6gmjxVIEAfrHxDCy8o
         Aqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687508942; x=1690100942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2qUpj8yKbysFhO4bnXlgIHrtaxdQPNhbEyv05xDcP4=;
        b=eg+tRq0AWB2p2le1CSivnnexVlXu2PETpa4cETkFGW2BojLcbKtv/nfQY3RwR5qWhY
         zaR+n1meliLduUNIMBZgaWBSB9HxiTvSGlpiFHDbpFR1eEYtUMuRZs/+0nxSYKcvDHR+
         KUhkKv2tUmu9B56PtMxh9eVA3oZQFauSmIz1+2mHqxXaLOBd0tS4CxoCibwAaIRB4Fie
         V5N70GvmPvokI8AEm3D/qUq0eRB/TceIq0oErdst/BnSdYwIlwKTLOaCg17/ZJq/Wcls
         V7Gfm5C8Lz2tLF/q1r+jXdZ/YGSCkk01TX7D8Y6PuFs54loANxPzK84RuZ6KfJDXZDZS
         9AMQ==
X-Gm-Message-State: AC+VfDznTFNTeEGeAC9SkKgmXGicvklPxaiTvNcZzKgvA1gcNEXiUlf3
	qJQ9er1A6NXwaHlxCpnnfN2ck4kCyHDLCciH/9YvWw==
X-Google-Smtp-Source: ACHHUZ4BUf6QLe/480ZnADtDZ3BsgW3Dx80XUi22/n3hNVBpPJNAvvf6XSo9CghqQ6ErRL1v+G5cvDWrcfa4/KbxM2E=
X-Received: by 2002:a2e:2e0a:0:b0:2b4:5978:c13 with SMTP id
 u10-20020a2e2e0a000000b002b459780c13mr14878649lju.21.1687508942384; Fri, 23
 Jun 2023 01:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230616063210.19063-1-eric.lin@sifive.com> <20230616063210.19063-2-eric.lin@sifive.com>
 <28f511f2-ffbb-2ef7-c47c-caf9f5164512@wanadoo.fr>
In-Reply-To: <28f511f2-ffbb-2ef7-c47c-caf9f5164512@wanadoo.fr>
From: Eric Lin <eric.lin@sifive.com>
Date: Fri, 23 Jun 2023 16:28:50 +0800
Message-ID: <CAPqJEFqV6O4he14R1=_appLnFVPWKG1k3bdKDuPKhX0EjxwBtQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: sifive: Add SiFive private L2 cache support
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	maz@kernel.org, chenhuacai@kernel.org, baolu.lu@linux.intel.com, 
	will@kernel.org, kan.liang@linux.intel.com, nnac123@linux.ibm.com, 
	pierre.gondois@arm.com, huangguangbin2@huawei.com, jgross@suse.com, 
	chao.gao@intel.com, maobibo@loongson.cn, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dslin1010@gmail.com, 
	Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_012904_926914_23ED1984 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCk9uIFNhdCwgSnVuIDE3LCAyMDIzIGF0IDM6MDLigK9BTSBDaHJpc3Rv
cGhlIEpBSUxMRVQKPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPiB3cm90ZToKPgo+IExl
IDE2LzA2LzIwMjMgw6AgMDg6MzIsIEVyaWMgTGluIGEgw6ljcml0IDoKPiA+IFRoaXMgYWRkcyBT
aUZpdmUgcHJpdmF0ZSBMMiBjYWNoZSBkcml2ZXIgd2hpY2ggd2lsbCBzaG93Cj4gPiBjYWNoZSBj
b25maWcgaW5mb3JtYXRpb24gd2hlbiBib290aW5nIGFuZCBhZGQgY3B1IGhvdHBsdWcKPiA+IGNh
bGxiYWNrIGZ1bmN0aW9ucy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFcmljIExpbiA8ZXJpYy5s
aW4tU3BNREhQWVB5UGJRVDBkWlIrQWxmQUBwdWJsaWMuZ21hbmUub3JnPgo+ID4gU2lnbmVkLW9m
Zi1ieTogTmljayBIdSA8bmljay5odS1TcE1ESFBZUHlQYlFUMGRaUitBbGZBQHB1YmxpYy5nbWFu
ZS5vcmc+Cj4gPiBSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saS1TcE1ESFBZUHlQYlFUMGRa
UitBbGZBQHB1YmxpYy5nbWFuZS5vcmc+Cj4KPiBbLi4uXQo+Cj4gPiArc3RhdGljIGludCBfX2lu
aXQgc2lmaXZlX3BsMl9jYWNoZV9pbml0KHZvaWQpCj4gPiArewo+ID4gKyAgICAgaW50IHJldDsK
PiA+ICsKPiA+ICsgICAgIHJldCA9IGNwdWhwX3NldHVwX3N0YXRlKENQVUhQX0FQX1JJU0NWX1NJ
RklWRV9QTDJfT05MSU5FLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInNvYy9z
aWZpdmUvcGwyOm9ubGluZSIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzaWZpdmVfcGwyX29ubGluZV9jcHUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzaWZpdmVfcGwyX29mZmxpbmVfY3B1KTsKPiA+ICsgICAgIGlmIChyZXQgPCAwKSB7
Cj4gPiArICAgICAgICAgICAgIHByX2VycigiRmFpbGVkIHRvIHJlZ2lzdGVyIENQVSBob3RwbHVn
IG5vdGlmaWVyICVkXG4iLCByZXQpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4g
KyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0ID0gcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZz
aWZpdmVfcGwyX2NhY2hlX2RyaXZlcik7Cj4gPiArICAgICBpZiAocmV0KSB7Cj4gPiArICAgICAg
ICAgICAgIHByX2VycigiRmFpbGVkIHRvIHJlZ2lzdGVyIHNpZml2ZV9wbDJfY2FjaGVfZHJpdmVy
OiAlZFxuIiwgcmV0KTsKPgo+IEJsaW5kIGd1ZXNzOiBkb2VzIGNwdWhwX3JlbW92ZV9zdGF0ZSgp
IG5lZWRzIHRvIGJlIGNhbGxlZD8KPgoKWWVzLCBJJ2xsIGZpeCB0aGlzIGluIHYyLiBUaGFua3Mu
Cgo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAg
ICAgc2lmaXZlX3BsMl9wbV9pbml0KCk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gcmV0Owo+Cj4g
SWYgeW91IHNlbmQgYSB2MiwgcmV0dXJuIDA7IHdvdWxkIGJlIHNsaWdobHkgbmljZXIgaGVyZS4K
PgoKT0ssIEknbGwgZml4IGl0IGluIHYyLgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpCZXN0IHJl
Z2FyZHMsCkVyaWMgTGluCgo+IENKCj4KPiA+ICt9Cj4KPiBbLi4uXQo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
