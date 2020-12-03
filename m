Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9A2C43211
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 14:45:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FAF022CB8
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 14:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FAF022CB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZXLij2nHURdxfRPnot0Fd74tpxdbGrppQy4IdarlWZg=; b=UM2I7PsS2Sqr1w3VvHxDvDGWf
	xVe741Ch1sEXiEN6e4qbmVZvRWAMouqyOFK/SXHgh3Gsx2/oGzCoTg22m3gdG2wGuZ7FowvIzfk07
	vOusTWctapceVkFYJjwG0x3ufEeW7MLEAyE+rYDk5y+jc9DzngbYj/EC5r43ka5dwM0jDSnuxxf6i
	YqSDgw+pQv+9vMS1lUEok7F6Dz6Y08qYtH2omDwJZhiVfQr8K5fbQk7uGOMVEZu+uV9WIl4eKfR+i
	jeWKn6fQ0E0zy9FplMC5+dlV4jGGUY17EnaksWtqpGToGtGjRGEsHYKyX8qmjS/44XWXZFBEpf9p1
	c33uTCd1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkpqj-0002kS-4s; Thu, 03 Dec 2020 14:44:49 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkpqh-0002jG-3a
 for linux-riscv@lists.infradead.org; Thu, 03 Dec 2020 14:44:48 +0000
Received: from [192.168.1.155] ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N1Ofr-1k1DLm2wnr-012nGT; Thu, 03 Dec 2020 15:44:41 +0100
Subject: Re: [PATCH] (v2) drivers: clk: make gpio-gated clock support optional
To: Stephen Boyd <sboyd@kernel.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <20201117160306.21760-1-info@metux.net>
 <160566373556.60232.14730664139007414312@swboyd.mtv.corp.google.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <13a5d811-8ebb-9ac8-ac2a-04110f71ea16@metux.net>
Date: Thu, 3 Dec 2020 15:44:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <160566373556.60232.14730664139007414312@swboyd.mtv.corp.google.com>
Content-Language: tl
X-Provags-ID: V03:K1:QSQB3khoAeQ91gi0PGE7IbDjLwBPDKiHqj1H43XTH8ofEMvrxQf
 feIo4eaNA7AC9f7QisxQlAqwm2p00voMbHur1aqXDevsFWo14yoFI/0NshawteQbFlD6QJl
 ktle5vxvh1u+RVqfgeioAyvSYMA9DAUu5LjsRUwCAGCGSgE8lBZ7YQP0Ni+h7S1YY5Uubux
 mlEJfO/QLmNF3PINEnDPQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9aOkMfjlCxI=:DXpPiaQDqGnYs6Y2IG7XND
 nDasW+/vV2u0t2FexpuOG/QICh3PmOoHQ6eiSo6uqxgXj3jEFJXv9ZpB5+9rrfi6Z+AhEyt4G
 ZttHG7CeDXXzCaYQoomPYXz73aFWW9Y2X4tSYmNwDV05vu43eU0w7FpXEYzPfO8EpGz7aOB1u
 lX4utFMYfjPkny/1pgXxLFOprYNM89Gz8zoyHKUkF01RPyq5QtoRzFHEWqh/TKY8ZT/0HKRp7
 2zQcj9M13M4E8NibrsvG+f55NFBBBMH7dHfIikHzBg5PQ1dtlAHNJq8pN1JnmTBOrjkP4vRb4
 7U+XujxRkyxQIeNNUpAJiv3kMCXxSH73qbN3VRAnNdJ4Y4yCH/LH3NLK1SKcFwD5vj9VVizZc
 1A7uDbiE/VJOMNgrVso3NSWOeqFzv4JgEoTnyt7b1unWDnnKCNQd9IdaHIA78
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_094447_363145_915AEDCB 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: matthias.bgg@gmail.com, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTguMTEuMjAgMDI6NDIsIFN0ZXBoZW4gQm95ZCB3cm90ZToKPiBRdW90aW5nIEVucmljbyBX
ZWlnZWx0LCBtZXR1eCBJVCBjb25zdWx0ICgyMDIwLTExLTE3IDA4OjAzOjA2KQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvS2NvbmZpZyBiL2RyaXZlcnMvY2xrL0tjb25maWcKPj4gaW5kZXgg
YzcxNWQ0NjgxYTBiLi45OWUwMTg4YTE1YmUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvY2xrL0tj
b25maWcKPj4gKysrIGIvZHJpdmVycy9jbGsvS2NvbmZpZwo+PiBAQCAtMzgsNiArMzgsMTQgQEAg
bWVudWNvbmZpZyBDT01NT05fQ0xLCj4+ICAKPj4gIGlmIENPTU1PTl9DTEsKPj4gIAo+PiArY29u
ZmlnIENPTU1PTl9DTEtfR1BJTwo+PiArICAgICAgIHRyaXN0YXRlICJHUElPIGdhdGVkIGNsb2Nr
IHN1cHBvcnQiCj4+ICsgICAgICAgZGVmYXVsdCB5Cj4gCj4gTWF5YmUgJ2RlZmF1bHQgR1BJT0xJ
Qic/Cj4gCj4+ICsgICAgICAgc2VsZWN0IGdwaW9saWIKPiAKPiBEb2VzIGxvd2VyY2FzZSB3b3Jr
IGhlcmU/Cj4gCj4+ICsgICAgICAgaGVscAo+PiArICAgICAgICAgU3VwcG9ydHMgZ3BpbyBnYXRl
ZCBjbG9ja3MsIHdoaWNoIGNhbiBiZSBlbmFibGVkL2Rpc2FibGVkIHZpYQo+PiArICAgICAgICAg
Z3BpbyBvdXRwdXQuCj4+ICsKPj4gIGNvbmZpZyBDT01NT05fQ0xLX1dNODMxWAo+PiAgICAgICAg
IHRyaXN0YXRlICJDbG9jayBkcml2ZXIgZm9yIFdNODMxeC8yeCBQTUlDcyIKPj4gICAgICAgICBk
ZXBlbmRzIG9uIE1GRF9XTTgzMVgKCgp0aGFua3MsIGZpeGVkIGl0IGluIHYzLgoKCkJUVzoganVz
dCBhY2NpZGVudGlhbGx5IHBvc3RlZCBhbiBvdXRkYXRlZCBhbmQgYnJva2VuIHZlcnNpb24gYWdh
aW4KKHNvbWUgc3VibWl0IGhlbHBlciBzY3JpcHQgd2FzIHJ1bm5pbmcgd2lsZCA6KCkgLSBwbGVh
c2UgaWdub3JlIHRoYXQuCnRoZSB2YWxpZCBvbmUgaXMgdjMgZnJvbSB5ZXN0ZXJkYXkuIHNvcnJ5
IGZvciB0aGUgbm9pc2UuCgoKLS1tdHgKCi0tIAotLS0KSGlud2VpczogdW52ZXJzY2hsw7xzc2Vs
dGUgRS1NYWlscyBrw7ZubmVuIGxlaWNodCBhYmdlaMO2cnQgdW5kIG1hbmlwdWxpZXJ0CndlcmRl
biAhIEbDvHIgZWluZSB2ZXJ0cmF1bGljaGUgS29tbXVuaWthdGlvbiBzZW5kZW4gU2llIGJpdHRl
IGlocmVuCkdQRy9QR1AtU2NobMO8c3NlbCB6dS4KLS0tCkVucmljbyBXZWlnZWx0LCBtZXR1eCBJ
VCBjb25zdWx0CkZyZWUgc29mdHdhcmUgYW5kIExpbnV4IGVtYmVkZGVkIGVuZ2luZWVyaW5nCmlu
Zm9AbWV0dXgubmV0IC0tICs0OS0xNTEtMjc1NjUyODcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
