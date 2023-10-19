Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB735CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 08:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmQSmXu3tBGKCF73QaRPuDs2nv5aU9Tdi1teWSoyZVk=; b=tJLrClEHc5BSgH
	2TlWRggWDwPbbWATHI9spWs7lPtD1bhCKr/tFkOCA23wtAXy1OROcevGUXnsc4Xxpm5zdojo/+Z3M
	wlS3fcf2Z6ATO2DCNND/RYditAqXgSRRMY8SkRxroi72W3e6sMGE+GJx/rtqS+qb7H+wTHKWvw7m4
	GkTLsPZhsNAHKV6ifHW+YJ88MYmAwYmNWW2k2XjPrHPcrYT7LBEz+7KJwlDAKa3g130bHq1TAAqbl
	ZYEdKXGG0aqwL5UnG+wbvHLZU6x0BQT67tu6DPO/ymWv4dPrjfcp6Bod6D11OTHS7q7m0NwKSuEnI
	bwiIpwtlzBq54LOz+Nog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOU7-00Gj9n-2h;
	Thu, 19 Oct 2023 08:34:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOU5-00Gj8A-1m
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 08:34:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7D685B826C9
	for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 08:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C44C433AB
	for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 08:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697704462;
	bh=NhE5UIsqUJ4efk9oQr6qapwxmbKSoNoKRWUzC+fdU/U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mfOJFjvNTwSFckxY8HVYKBdkuAvKK2M1sGBFjPYxaefFJOs25rTAhU+Rz/XkzUDsP
	 7ZG6NVlLtrmyh2UnWdcTTvKnv0Ri9cTPDKnnP8QKgoDoQte2xDFxuqHh+2CFJni6OH
	 UnpSCujhj0HqMbcfS4yyAemzQCrEcGslxDqcd+joFCb/HlB9dYh+6QLIzjscIvWMCB
	 h0p3a4ysggwrxmCyWDOHqdti1U9h9XmWwvUKhrItqUaZSFYQRW3xh6eG5Uyags4OOl
	 kIpJPJHJDIEKQp20gjbHYBc0ytizLGA52FaVFGs5LAn97piCYpUebHipa9tJal98Oi
	 rmq6AhSP9zb8w==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-53db3811d8fso1141286a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 01:34:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YyDaWXJfNzJyVNTEhRjuiyYWNoI/+8wTARfQe5KfMfT3d3H0fIg
	POv+TXOunW7K3eyv4BagOsGtkIWUgXO53QOXMbc=
X-Google-Smtp-Source: AGHT+IG1scZ789rr7dQG139RsrK3rRMsLv+J/dEBVZhjOtJ1+/tUHJQBuLx63Z1s4dB1EVoakod2MaMhPSLUphq3mAo=
X-Received: by 2002:a50:9353:0:b0:53d:a18d:73b4 with SMTP id
 n19-20020a509353000000b0053da18d73b4mr998683eda.12.1697704460540; Thu, 19 Oct
 2023 01:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com> <20231017-th1520-mmc-v2-1-4678c8cc4048@baylibre.com>
In-Reply-To: <20231017-th1520-mmc-v2-1-4678c8cc4048@baylibre.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 19 Oct 2023 16:34:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSZPR1Gxj8sCB6Q7KiJiYot60qryEzt8GFwtwMubFBWsQ@mail.gmail.com>
Message-ID: <CAJF2gTSZPR1Gxj8sCB6Q7KiJiYot60qryEzt8GFwtwMubFBWsQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 support
To: Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_013425_759061_19C6358F 
X-CRM114-Status: GOOD (  13.71  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xi Ruoyao <xry111@xry111.site>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Robert Nelson <robertcnelson@beagleboard.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgMTgsIDIwMjMgYXQgNDo0NeKAr0FNIERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IEFkZCBjb21wYXRpYmxlIHZhbHVlIGZvciB0aGUgVC1I
ZWFkIFRIMTUyMCBkd2Ntc2hjIGNvbnRyb2xsZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1
c3RpbmkgPGRmdXN0aW5pQGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21tYy9zbnBzLGR3Y21zaGMtc2RoY2kueWFtbCB8IDEgKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3NucHMsZHdjbXNoYy1zZGhjaS55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9zbnBzLGR3Y21zaGMtc2RoY2kueWFtbAo+
IGluZGV4IGE0M2ViODM3ZjhkYS4uNDI4MDRkOTU1MjkzIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvc25wcyxkd2Ntc2hjLXNkaGNpLnlhbWwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3NucHMsZHdjbXNoYy1z
ZGhjaS55YW1sCj4gQEAgLTE5LDYgKzE5LDcgQEAgcHJvcGVydGllczoKPiAgICAgICAgLSByb2Nr
Y2hpcCxyazM1NjgtZHdjbXNoYwo+ICAgICAgICAtIHJvY2tjaGlwLHJrMzU4OC1kd2Ntc2hjCj4g
ICAgICAgIC0gc25wcyxkd2Ntc2hjLXNkaGNpCj4gKyAgICAgIC0gdGhlYWQsdGgxNTIwLWR3Y21z
aGMKQWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKPgo+ICAgIHJlZzoKPiAg
ICAgIG1heEl0ZW1zOiAxCj4KPiAtLQo+IDIuMzQuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3Vv
IFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
