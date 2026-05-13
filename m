Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5BACD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 17:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7nAf4DMcCZmN7cdHb4tP7+KAscyyFWs8mJelI2R/Fo=; b=If/Nwhwce5O7GVWsm3hrakPENN
	2mBRUSonqK5M9n/Kiqk2wfAjqa6TQm1i6bzzn06vgd2goOc/JSeIwWEhTRukQDUIGMHWy/8jj3M4J
	tOon8pFJeMC40Vn5pNNudRXzsBubTTOp8nkfu3yvDokGQzCw05vyGjszcPWxokmma5U0fDKI6Kn/P
	Tf7eGgjuArHN6Bs/bcVrmINNUU4gVdUcDWiz5Uv8WxljjVYdG4kC8wN+aQD3N2aLt3ZojjMbWVrHG
	W455wz0A9n0CkEKW7SHKfiloW5qT5KMMbrlFhu5RQ3NQZV2WSRMBbV+h3wjsdOxOME6pu1+aEq4au
	/H2ApNmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDXb-00000003NFx-3955;
	Wed, 13 May 2026 17:38:39 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDXX-00000003NDT-3KSs
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 17:38:38 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gG1046Zhpz1r5sY;
	Wed, 13 May 2026 19:38:28 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=tUk3k7hjI1RoyKUta+l8P/czWtAWXdNols6WRikw6cU=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1778693908; v=1;
        b=zzlnATFrZ9vVWJ9awcoJi90Xg8hBbuNrcGiTYUumK4TFWYx0jSZclK2VpbEoEoDU
         F1M4nEsRhFJmSJhXbIPhrMWGBmih0WjjBs8ossq7/A/YF7/yWu0zRRo1ixMNGyx9
         Pg7hM5sbhoMO4xA+FHP2+kHvqC6unOwF3bJxx4Ywt+lmelscD3qW8R30igW0U/OJ
         DwYp7Ikdalkd+6jyMhL9+R5wugWYABIZoAQhj5VzUuDcz3d4CbJ++kZzfP9igsXs
         TZ4jv5OniuSDLh8sUCoaDkBAVRDgBDLKeZj2mR+JMJChSL7Qco2oht4N3wBu6cQV
         JEJakjHbvmu157fqJemgoQ==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gG1026Q0Cz1r5rg;
	Wed, 13 May 2026 19:38:26 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gG1024v1jz1qqlR;
	Wed, 13 May 2026 19:38:26 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id UOmRSNYn8eMF; Wed, 13 May 2026 19:38:25 +0200 (CEST)
X-Auth-Info: HJUNFNFShal6AM1JBGx5cCnjbFHoJRxaSbObzFSNNYB/FIx6axKkLvyZzTrsy9gX
Received: from wiesel.intern (aftr-62-216-206-65.dynamic.mnet-online.de [62.216.206.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 13 May 2026 19:38:25 +0200 (CEST)
Received: from [IPV6:fdea:9b79:8984:1:b1b7:2c53:ea47:8e7a] (unknown [IPv6:fdea:9b79:8984:1:b1b7:2c53:ea47:8e7a])
	by wiesel.intern (Postfix) with ESMTP id 387D479A1C1D;
	Wed, 13 May 2026 19:38:25 +0200 (CEST)
Message-ID: <86f7cb4e-9511-47a2-a2cb-4fedf3ae1ab8@muenchen-mail.de>
Date: Wed, 13 May 2026 19:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Enable wifi on the BeagleV-Ahead
To: Shengyu Qu <wiagn233@outlook.com>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511141119.155369-1-thomas.gerner@muenchen-mail.de>
 <20260512173440.163179-1-thomas.gerner@muenchen-mail.de>
 <TY4PR01MB14432F2BBDFF6E2C4AC79DD1E98392@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Content-Language: de-DE
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
In-Reply-To: <TY4PR01MB14432F2BBDFF6E2C4AC79DD1E98392@TY4PR01MB14432.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_103837_011692_34219B16 
X-CRM114-Status: GOOD (  11.94  )
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

CkFtIDEyLjA1LjI2IHVtIDIwOjM5IHNjaHJpZWIgU2hlbmd5dSBRdToKPj4gKwo+PiArwqDCoMKg
IGJyY21mX3B3cnNlcTogYnJjbWYtcHdyc2VxIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGli
bGUgPSAibW1jLXB3cnNlcS1zaW1wbGUiOwo+PiArwqDCoMKgwqDCoMKgwqAgcmVzZXQtZ3Bpb3Mg
PSA8JmdwaW8yIDMxIEdQSU9fQUNUSVZFX0xPVz47IC8qIFdMLVJFRy1PTiAqLwo+PiArwqDCoMKg
IH07Cj4+IMKgIH07Cj4KPiBJIHRoaW5rIHN1Y2ggcHdyc2VxIHdvbid0IHdvcms/IE5lZWQgdG8g
c2V0IHRpbWluZyBwYXJhbWV0ZXIsIGZvciAKPiBleGFtcGxlOgo+IGh0dHBzOi8vZ2l0aHViLmNv
bS90b3J2YWxkcy9saW51eC9ibG9iLzFkNWRjYWEzYmQ2NWYyZThjOWJhYTE0YTM5M2QzYTJkYzVk
Yjc1MjQvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1Njgtcm9jay0zYS5kdHMjTDcx
IAo+CgpJIHRoaW5rIHRoaXMgaXMgbm90IG5lY2Vzc2FyeS4gVGhlIFdpRmkgY2hpcCBnZXRzIHBv
d2VyZCB1cCB3aXRoIHRoZSAKYm9hcmQgcG93ZXIgYW5kIHRoZSBwb3dlciBjYW5ub3QgYmUgZGlz
YWJsZWQuIFRoZSBvbmx5IGpvYiBmb3IgdGhpcyAKcHdyc2VxIGlzIHRvIHJlbGVhc2UgZ3BpbzIg
cGluIDMxIHdoZW4gdGhlIGtlcm5lbCBpbml0aWFsaXplIHRoZSBjaGlwLiAKQWNjb3JkaW5nIHRv
IHRoZSBkYXRhIHNoZWV0IHRoZSByZWxlYXNlIG9mIHRoZSBwaW4gc2hvdWxkIGhhcHBlbiBub3Qg
CmVhcmxpZXIgdGhhbiAyIGN5Y2xlcyBvZiB0aGUgMzIuNzY4a0h6IGNsb2NrIGFmdGVyIHBvd2Vy
ZWQgdXAuIEFzIHRoZSAKa2VybmVsIHN0YXJ0IHRha2VzIG11Y2ggbG9uZ2VyIHRoYW4gdGhpcyAy
IGN5Y2xlcyBhbmQgSSB0aGluayB0aGVyZSBpcyAKbm8gZXh0cmEgdGltaW5nIG5lY2Vzc2FyeS4K
ClRoZSBicm9hZGNvbSBkcml2ZXIgaGFzIGEgYWxzbyBhIHByb3BlcnR5ICJyZXNldC1ncGlvcyIs
IGJ1dCB0aGlzIGRvZXMgCm5vdCB3b3JrLiBJdCBkb2VzIG5vdCBjb25maWd1cmUgdGhlIHBpbiBh
cyBvdXRwdXQsIGl0IGNvbmZpZ3VyZSBpdCBhcyAKaW5wdXQuIFRoZW4gdGhlIGRyaXZlciBkb2Vz
IG5vdCBpbml0aWFsaXplIHRoZSBjaGlwLiBNYXkgYmUgdGhpcyBpcyBhIApidWcgaW4gdGhlIGJy
b2FkY29tIGRyaXZlciwgZG9uJ3Qga25vdy4KCkJlc3QgcmVnYXJkcwpUaG9tYXMKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
