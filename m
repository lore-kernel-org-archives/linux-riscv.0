Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79ABC433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 10:22:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42AF461165
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 10:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42AF461165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ya89I1sd9ipmwbq2PTFYqsQbHC+Gk1+slS2h4uD0+ks=; b=WIljIR36xQoCEFSBJRc8liGS/
	SZSRBPAF/rZcDYHB6vFw2NNzRN1TPytHtdrQ37X3ZPJuKfRqaU95Rq7zTv41tSXYuA/z41Zap/+pM
	wwbQwbzPLQzPKBeXB90wP05QJQNCUw9ZOMwjkld56Cp77spboUprkxeIPKNIaRnhlYls4GLCfwQbD
	gmYd8ljeDbPcSLZiYLT2THfZAkqOJCaR5bMwkw5zny/DSVUEKmTzK/adkY/HeO3E90t3jBxSu8Jso
	gUwDbxVwXgeIXDBG/cZzKQL6V3BDufcShguXJqxjfzVgxEkh3DTr4+wuSZFEtCFQSvVyo3aegJSYr
	9XwaW1Bvw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUoH2-000OdL-Nv; Fri, 09 Apr 2021 10:22:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUoH0-000Od1-54
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 10:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=in6ruL9Los1PrXo6aoxBeJjw7JZfgWDoMXHQ+KzqvQU=; b=WIz2TCQynJBO47fh203b6L+Ml8
 6L+ff5SHs1rGwaXpcjlBBSW599JMizLWlfty5UDoAp5QCeXqG/tRqm1avujjao/Od99smS/1L7WlM
 7fVZtmSE7RbDFiYNyzJOlasZApIpHIWglsvWYBfsE5C9EzrPmrvvdt5vNQfCSC0eBhQp/yXHfiMEr
 wu1gjVM/NKFi/wep6EEO0/7IMEvlgfaQyzD7+qg8qkZ4kuDxBqb/jFnVtdbaZIMEW1MJRNInKe9cB
 NQf96qbrkZz4iaMpbFfukvFwxmE+2PrYaMGYntJsNQeF4ycv9EHFgZeLmXvrgDHmoUau2Bxn/+H9b
 ZYL99/6g==;
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUoGx-004FcX-DO
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 10:21:56 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 139ALrZT022220
 for <linux-riscv@lists.infradead.org>; Fri, 9 Apr 2021 13:21:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1617963708; x=1620555708;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4xoOfBoikcbpylZq0tpqCq2qp9BayyeejBfojMmM0AM=;
 b=XHpblb8NBLx3Snnj94rHJuQRPTYlgy+C6ombwMSnvOU/RhG+jqx+u2ywrcgk2tws
 GF5EbNR3JtS+E5774E2w4R+rI3t/mmM6xprc+Pgsve6A2eBuiuRVmzymrdt0zPq0
 66kdHGXqJb0i+WbAxAAcD1aI/rqcZ8+6eooHsm+ecKx8axo7O6sf7aHInMHzPs9b
 bk0QBgNX2GKJQBk+x72xC3rRd5klkPy1HpzANPggJGiOzmQdZDYvwIPsUkauPGa1
 3SEVblt4M4sWNuoqiETiLv8HuOjaG119S1CakU859lfU9b0gz+Rbxs6zyNVlxHHr
 UeVYhVE96m3j5ZYiXRQ4dA==;
X-AuditID: 8b5b014d-a70347000000209f-e5-60702abc8505
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 4F.20.08351.CBA20706; Fri,  9 Apr 2021 13:21:48 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 09 Apr 2021 13:21:48 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Alex Ghiti <alex@ghiti.fr>
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] RISC-V: Add kdump support
Organization: FORTH
In-Reply-To: <1385f2a4-53a9-535b-851a-3c470f1f3bc1@ghiti.fr>
References: <20210405085712.1953848-1-mick@ics.forth.gr>
 <20210405085712.1953848-5-mick@ics.forth.gr>
 <1385f2a4-53a9-535b-851a-3c470f1f3bc1@ghiti.fr>
Message-ID: <75abd98990bfaae51262b72cf7d59831@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsXSHT1dWXePVkGCwf2/GhbP7nxltbi8aw6b
 xbbPLWwWze/OsVu8vNzDbNE2i9+BzePNy5csHvdOTGP1eLjpEpPH5iX1Hpear7N7fN4kF8AW
 xWWTkpqTWZZapG+XwJWxrHMaa8FGtoppR06xNjA+Yeli5OSQEDCR2NV0mbmLkYtDSOAoo8Si
 jc/YIBKmErP3djKC2LwCghInZ0I0MAtYSEy9sp8RwpaXaN46mxnEZhFQlfj86DuYzSagKTH/
 0kGwehEBOYm27iOMIAuYBZYxSmw8vgKsSBhoQcOhqWA2v4CwxKe7F1lBbE4BG4k/3c/BmoUE
 ZjJKfOp172LkADrCRWLXKXeI21QkPvx+wA4SFgWyN89VmsAoOAvJpbOQXDoLyaULGJlXMQok
 lhnrZSYX66XlF5Vk6KUXbWIEBzuj7w7G25vf6h1iZOJgPMQowcGsJMLb3JyfIMSbklhZlVqU
 H19UmpNafIhRmoNFSZyXV29CvJBAemJJanZqakFqEUyWiYNTqoHJvmiDxhZngex50z9nTu+Q
 XRYS/HKv7HNpR6vlR0VONO1lCLmk6Kfe9C384h0Oy5slB9rfCyz++unlr9vf0ox01xT4Z2d8
 3pO0qfN61UHvnK8TZ1a1n73DYrJJlU9tkV78ht7zbWHPOU0NdHdFLnxy4dGLbBOxCfYtcQuF
 GFoOLVZ/bSvqt6bqakVm1q6rl3P272+YlH/txaMFPzmEhHYXK55TCBGt2B0Rer4xTlTk5IYm
 4a3sBc/FJ317+1pnM7fR0W0lGg9sXAvqhax2WzifP16z89sMZsdKRWsrQ2UJ31fW3rkz7zw4
 aXd4i9+GVeoW20PS21JPZ9+TP773ZMMcwQk882dfXDTvr2nc7d6dSizFGYmGWsxFxYkAnH5t
 XOUCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_032155_841627_655FE86B 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

zqPPhM65z4IgMjAyMS0wNC0wNiAyMTozNiwgQWxleCBHaGl0aSDOrc6zz4HOsc+IzrU6Cj4gCj4+
ICsJLyogU3dpdGNoIHRvIHBoeXNpY2FsIGFkZHJlc3NpbmcgKi8KPj4gKwlsYQlzNCwgMWYKPj4g
KwlzdWIJczQsIHM0LCBzMwo+PiArCWNzcncJc3R2ZWMsIHM0Cj4+ICsJY3NydwlzcHRiciwgemVy
bwo+IAo+IHNhdHAgaXMgdXNlZCBldmVyeXdoZXJlIGluc3RlYWQgb2Ygc3B0YnIuIEFuZCBtYXli
ZSB5b3UgY291bGQgQ1NSXyoqKioKPiBuYW1pbmcsIGxpa2UgeW91IGRpZCBpbiByaXNjdl9jcmFz
aF9zYXZlX3JlZ3MgYW5kIGxpa2UgaXQncyBkb25lIGluCj4gaGVhZC5TIHRvby4KPiAKCkFDSwoK
Pj4gKwkJY3Jhc2hfYmFzZSA9IG1lbWJsb2NrX2ZpbmRfaW5fcmFuZ2Uoc2VhcmNoX3N0YXJ0LCBz
ZWFyY2hfZW5kLAo+PiArI2lmZGVmIENPTkZJR182NEJJVAo+PiArCQkJCQkJICAgIGNyYXNoX3Np
emUsIFNaXzJNKTsKPj4gKyNlbHNlCj4+ICsJCQkJCQkgICAgY3Jhc2hfc2l6ZSwgU1pfNE0pOwo+
PiArI2VuZGlmCj4gCj4gWW91IGNhbiB1c2UgUE1EX1NJWkUgaGVyZSBhbmQgZ2V0IHJpZCBvZiAj
aWZkZWYuCj4gCj4+ICsKPj4gKyNpZmRlZiBDT05GSUdfNjRCSVQKPj4gKwkJaWYgKCFJU19BTElH
TkVEKGNyYXNoX2Jhc2UsIFNaXzJNKSkgewo+PiArI2Vsc2UKPj4gKwkJaWYgKCFJU19BTElHTkVE
KGNyYXNoX2Jhc2UsIFNaXzRNKSkgewo+PiArI2VuZGlmCj4gCj4gRGl0dG8gaGVyZS4KPiAKCldp
bGwgZG8uCgpUaGFua3MgYSBsb3QgZm9yIHlvdXIgcmV2aWV3ICEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
