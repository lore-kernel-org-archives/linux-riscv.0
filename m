Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C7CC5AD57
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 18:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/LeQgbbH02sA/5un7Zg+bUAzF6NuFJzqB1m+2VPrFs=; b=SuKv1TBlEaU93O
	exCn7NmyqoNS73wEKEneezwXMp7JtteimQk1KsI4w8hGQDRkc8z8ykXmNZC76fD3WcLbDGjcEJ5pW
	7TNfodjNSjRrYDl+tdXsZS9S1sveD2Xk79tSpnWxW94ewyUe0zgK2FM65N4gEGYdsU47j2BOZHCZZ
	ipoHLRyPsEihMZ8MCse7qqv9VdFp+CEddHTBhEg5ZRroz2a45vF5jRhoGGVNaEM8TsTAnAZdifOy5
	pbec65EYnJIod1JFE6W/5vCQ8B5o8eMDuf8S2rTycElcO9yAH32GVel0pA0ZHJ3Xl3CCXfpnEepOh
	nfcqpIUYaApkDMHRA5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVSD-0000000FSng-2o9X;
	Fri, 20 Feb 2026 18:42:17 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVSA-0000000FSnK-3TRT
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 18:42:16 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6581234d208so4182456a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 10:42:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771612933; cv=none;
        d=google.com; s=arc-20240605;
        b=b/UEbgE6YWuHY2Z8dqZzxlz9bpcsvB8FHxvmUjlHzqrecYZHjOozI1sZXXs0cOL+RW
         NwO7S4x5cUo1B05dq0KteaD/UcxtYQhruj9Mp8UkvBGC4GY5g1er1EU7WHwr5mLE+dcL
         ZFnXf2Waf1zUGA9waWSU+MdSnLvBVabRQADYzrX51+3A5j1E1VjddFkhxne7ihe3GXbY
         h3cCFrtsXy5UQ5V8PzZ4aMPcBHvhIsdVoEas4MB4dX3Ub7hcdsLNGnne/HWPKwILL3lB
         FUWAmF2qPjbjWAvj//9YMdEDzYWw8hzLS76Egq4OP+Rsk22++NKBj7TWoBsaE3Pjh8J4
         kEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p11SnN2G51FYoourvAP9oOti3rvVoOX0gxT1KHWDCOM=;
        fh=ZUlptHf4hpstuu8zmXrnHvZ6R7yGn7SUVNkmwHpk+cs=;
        b=U+NLtegbNR9rmMgOS8jkYbfcPrOgiUjovxLpgdRg9NMTvOpoXTH6JAkKq7CTPAg/Dk
         jL4BDZyddFp388Zb8KHY+H92sSXmI3ubCHIfd0XclPva2Qed3Mxji4mD8hQg0eVi44UR
         SeIbmxvwx6phAeUJYwdlDWdzHeu9AOwBpI0p8Qdh1TEtPuTLKxLvluwFI5DZiM6HhWpF
         dT8CsKcG+JNicMyAMF0PDzJFQuuiBIAas2gcUikcss2OsoR5kU4H7HkUzoJ5/aQgT/G3
         zeqMNUekZI9mc95gDaGbXgbnBYal5ON46Uyf8KFtqi78fanWK2bOMUGsGjFg51lQyJZu
         QhxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771612933; x=1772217733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p11SnN2G51FYoourvAP9oOti3rvVoOX0gxT1KHWDCOM=;
        b=PBdjW4pyYimkOPkefhWGkJHefk7W+c5rTFfn+7civ+7MsN3dNGQPE4ExXAhWNxn8p+
         xf+wBI3rzixODShxPkMTbS2b3uLEr8ZC38BYH5fUZ/T1NKiML1qobbHw4RKXpxZfWsW6
         0r/6ndnrXcwKo4UbXRi5i8p/QRHAn5lZdxo5urUVl6T/wZg8wddVWIFvFXU9Hm25VJdZ
         x+Yu8p8I+Uf+qd70EoG4RJ+xRejVVgArx88K+VH8NUnzKVdY/KdaEaKHttlv6hHtPCgk
         CUl5yIRGTVFXpLDeqUUeJK3j7MhHLeWAq5I7uo+gFDSUXeBYuKutY4bT3l2tkyOGVL6g
         +zPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771612933; x=1772217733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p11SnN2G51FYoourvAP9oOti3rvVoOX0gxT1KHWDCOM=;
        b=PvWze8T1NBPeLDllpmYlmWvi+sLj9BavOfGF4N9h4PKvVMFNSJjI8g002XNbmogIUw
         vPsSrcaTG1sKe8S2Z+z2RX3K/nD75sK5LN+oLyUtLW+0tr/ru0MSCcCsphn6xJw8Xjgk
         P2rVxc4XrwUZdIqUzwGQqgRqletTjQMN5O9C0q0eFSGqlQLBFGWnIwMVXeocFgC7u5cw
         WiAnI6ueYX5hyhHKMgsOCAL3M7qMir4m2zv+Ab860V6hg85bP4J+DWDejL02OHFLoxbA
         OEBbRVwIg7T4hAvjvjsf2LB+3/wPTI75H5hxz3+YEx//rHfEJncX+he7oO26krWWh5wp
         5+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWSmuItgPgdEevx8kbepVeORD2g2txtzLdkQgWi+0U/v5xo0i+R5Vpgj2oyM2vYuMnyDYACQ7Wl/2wmaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8hYYbTPgKeqNXk2qETm6CenId1uIUC8KNO5bSalNm/yZGoVdW
	I6bgNKeRPRRZmGtUcfev+YIfGg+DAqHiLeJ7ZeNfaGB9OVd0P5Rjwt9nDO0NR4QyfkCfPKGmc/F
	Gk7Q8Wz2n+nZCw6GNptp3kFfWif3pxxRoLh5EOk4mWw==
X-Gm-Gg: AZuq6aI+BkKXCyWscyEQKWy0OHYL0Ye3Bt4GJXyDi28aik5faK7hFFsikelaYSHKO8y
	m2hO7CHgGkQCGx7VOqqNBF/xfRQ096AtR1AUgyG7pcl6L+ZTIS+L/2bc/AyWhB9DSiIufM/ijRm
	C+7Y6GyOgQtdseJ0xCw2WNatgG7QUMnKWgwmtIdKmrYrHgGxGBv0qsWFTd3sDElZ6rJtZeqvdup
	cGqqP7lNEAAMB7J+Zwa70FwbqP3Bw/u6+6EKqYH4UCVVud2SqRZ03bHtbUXlqpijLKTMCZgh4Sr
	PQ175y6gWw==
X-Received: by 2002:a17:906:f590:b0:b8f:c4be:f1f3 with SMTP id
 a640c23a62f3a-b9081c1021amr28639066b.59.1771612932640; Fri, 20 Feb 2026
 10:42:12 -0800 (PST)
MIME-Version: 1.0
References: <20260220-fu740-v1-0-c8af54130c58@sifive.com> <20260220-fu740-v1-1-c8af54130c58@sifive.com>
 <20260220-repeal-glitter-acb73cc75564@spud>
In-Reply-To: <20260220-repeal-glitter-acb73cc75564@spud>
From: Max Hsu <max.hsu@sifive.com>
Date: Sat, 21 Feb 2026 02:42:01 +0800
X-Gm-Features: AaiRm53jWwDc1WCYeQ_HcYo-kwfyEnIvzDX6KWSIO2LiUkTSOMUZyC3C08_aX24
Message-ID: <CAHibDyyV4Ss_2HCqWxHo4hcW4x2_VJGnFsP02gkWVyjo=XNf=A@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: net: macb: Add SiFive FU740-C000 support
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_104214_915491_FEA3ADB9 
X-CRM114-Status: GOOD (  25.89  )
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgYXQgMDk6Mjk6MjggKzAwMDAsIENvbm9yIERvb2xleSB3cm90
ZToKPiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgcmlnaHQsIHNpbmNlIGl0IGlzIGlkZW50aWNhbCB0
byB0aGUgb25lIG9uIHRoZQo+IGZ1NTQwIChhcyBldmlkZW5jZWQgYnkgaG93IGl0IGhhcyB3b3Jr
ZWQgdW50aWwgbm93IGFuZCB0aGUgY29udGVudHMgb2YKPiB5b3VyIGRyaXZlciBjaGFuZ2UpLiBJ
IHRoaW5rIHlvdSBzaG91bGQgYWRkIHRoZSBmdTc0MCB3aXRoIGEgZmFsbGJhY2sgdG8KPiB0aGUg
ZnU1NDAsIGxpa2UgdGhlIGRldmljZXMgZnJvbSBNaWNyb2NoaXAgdGhhdCBmYWxsIGJhY2sgdG8g
dGhlCj4gbWljcm9jaGlwLHNhbWE3ZzUtZ2VtLiBUaGUgcmVzdCBvZiB0aGUgY2hhbmdlcyB0byB0
aGUgZHJpdmVyIGFuZCBiaW5kaW5nCj4gY2FuIHRoZW4gYmUgZHJvcHBlZCBhcyB0aGV5J2xsIGJl
IHJlZHVuZGFudC4KClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLCBDb25vciEKSSdtIHRha2luZyB5
b3VyIHN1Z2dlc3Rpb25zLiBhbmQgd2lsbCBwcmVwYXJlIHYyLgoKVGhhbmtzLApNYXgKCk9uIEZy
aSwgRmViIDIwLCAyMDI2IGF0IDU6MjnigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBGZWIgMjAsIDIwMjYgYXQgMDQ6Mjc6MDVQTSArMDgwMCwg
TWF4IEhzdSB3cm90ZToKPiA+IEFkZCB0aGUgU2lGaXZlIEZVNzQwLUMwMDAgZXRoZXJuZXQgY29u
dHJvbGxlciBjb21wYXRpYmxlIHN0cmluZyB0byB0aGUKPiA+IENhZGVuY2UgTUFDQiBiaW5kaW5n
IGRvY3VtZW50YXRpb24uCj4gPgo+ID4gVGhlIEZVNzQwIGV0aGVybmV0IGNvbnRyb2xsZXIgdXNl
cyB0aGUgc2FtZSBHRU1HWEwgbWFuYWdlbWVudCBibG9jayBhcwo+ID4gdGhlIEZVNTQwLCB3aGlj
aCBpcyB0aWdodGx5IGNvdXBsZWQgd2l0aCB0aGUgQ2FkZW5jZSBNQUNCIElQLiBUaGlzCj4gPiBm
b2xsb3dzIHRoZSBTaUZpdmUgSVAgdmVyc2lvbmluZyBzY2hlbWUgd2hpY2ggcmVxdWlyZXMgU29D
LXNwZWNpZmljCj4gPiBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIHByb3BlciBoYXJkd2FyZSBpZGVu
dGlmaWNhdGlvbi4KPgo+IFlvdXIgcmF0aW9uYWxlIGZvciB0aGlzIGNoYW5nZSBpcyBtaXNndWlk
ZWQsIGFzIHRoaXMgaXMgbm90IGEgU2lGaXZlIElQLAo+IHNvIHRoYXQgZG9jdW1lbnQgZG9lcyBu
b3QgYXBwbHkuIE9uIHRoZSBvdGhlciBoYW5kLCB0aGUgZ2VuZXJhbCBydWxlcwo+IGZvciBkZXZp
Y2V0cmVlcyByZXF1aXJlIHRoaXMgc28gdGhpcyBqdXN0IG1lYW5zIGEgY2hhbmdlIGluIHRoZQo+
IHJhdGlvbmFsZSBwcm92aWRlZC4KPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1heCBIc3UgPG1h
eC5oc3VAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9uZXQvY2RucyxtYWNiLnlhbWwgfCA3ICsrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2NkbnMsbWFjYi55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9jZG5zLG1hY2IueWFtbAo+ID4gaW5k
ZXggY2IxNGMzNWJhOTk2Li5iNDZkZGUxZGExNzAgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2NkbnMsbWFjYi55YW1sCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2NkbnMsbWFjYi55YW1sCj4gPiBAQCAt
NjMsNiArNjMsNyBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAtIG1vYmlsZXllLGV5ZXE1
LWdlbSAgICAgICAgIyBNb2JpbGV5ZSBFeWVRNSBTb0NzCj4gPiAgICAgICAgICAgIC0gcmFzcGJl
cnJ5cGkscnAxLWdlbSAgICAgICAjIFJhc3BiZXJyeSBQaSBSUDEgZ2lnYWJpdCBldGhlcm5ldCBp
bnRlcmZhY2UKPiA+ICAgICAgICAgICAgLSBzaWZpdmUsZnU1NDAtYzAwMC1nZW0gICAgICMgU2lG
aXZlIEZVNTQwLUMwMDAgU29DCj4gPiArICAgICAgICAgIC0gc2lmaXZlLGZ1NzQwLWMwMDAtZ2Vt
ICAgICAjIFNpRml2ZSBGVTc0MC1DMDAwIFNvQwo+Cj4gSSBkb24ndCB0aGluayB0aGlzIGlzIHJp
Z2h0LCBzaW5jZSBpdCBpcyBpZGVudGljYWwgdG8gdGhlIG9uZSBvbiB0aGUKPiBmdTU0MCAoYXMg
ZXZpZGVuY2VkIGJ5IGhvdyBpdCBoYXMgd29ya2VkIHVudGlsIG5vdyBhbmQgdGhlIGNvbnRlbnRz
IG9mCj4geW91ciBkcml2ZXIgY2hhbmdlKS4gSSB0aGluayB5b3Ugc2hvdWxkIGFkZCB0aGUgZnU3
NDAgd2l0aCBhIGZhbGxiYWNrIHRvCj4gdGhlIGZ1NTQwLCBsaWtlIHRoZSBkZXZpY2VzIGZyb20g
TWljcm9jaGlwIHRoYXQgZmFsbCBiYWNrIHRvIHRoZQo+IG1pY3JvY2hpcCxzYW1hN2c1LWdlbS4g
VGhlIHJlc3Qgb2YgdGhlIGNoYW5nZXMgdG8gdGhlIGRyaXZlciBhbmQgYmluZGluZwo+IGNhbiB0
aGVuIGJlIGRyb3BwZWQgYXMgdGhleSdsbCBiZSByZWR1bmRhbnQuCj4KPiBUaGFua3MsCj4gQ29u
b3IuCj4KPiBwdy1ib3Q6IGNoYW5nZXMtcmVxdWVzdGVkCj4KPiA+Cj4gPiAgICAgICAgLSBpdGVt
czoKPiA+ICAgICAgICAgICAgLSBlbnVtOgo+ID4gQEAgLTc0LDcgKzc1LDcgQEAgcHJvcGVydGll
czoKPiA+ICAgICAgbWluSXRlbXM6IDEKPiA+ICAgICAgaXRlbXM6Cj4gPiAgICAgICAgLSBkZXNj
cmlwdGlvbjogQmFzaWMgcmVnaXN0ZXIgc2V0Cj4gPiAtICAgICAgLSBkZXNjcmlwdGlvbjogR0VN
R1hMIE1hbmFnZW1lbnQgYmxvY2sgcmVnaXN0ZXJzIG9uIFNpRml2ZSBGVTU0MC1DMDAwIFNvQwo+
ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdFTUdYTCBNYW5hZ2VtZW50IGJsb2NrIHJlZ2lzdGVy
cyBvbiBTaUZpdmUgRlU1NDAvRlU3NDAgU29Dcwo+ID4KPiA+ICAgIGludGVycnVwdHM6Cj4gPiAg
ICAgIG1pbkl0ZW1zOiAxCj4gPiBAQCAtMTgxLDcgKzE4Miw5IEBAIGFsbE9mOgo+ID4gICAgICAg
ICAgcHJvcGVydGllczoKPiA+ICAgICAgICAgICAgY29tcGF0aWJsZToKPiA+ICAgICAgICAgICAg
ICBjb250YWluczoKPiA+IC0gICAgICAgICAgICAgIGNvbnN0OiBzaWZpdmUsZnU1NDAtYzAwMC1n
ZW0KPiA+ICsgICAgICAgICAgICAgIGVudW06Cj4gPiArICAgICAgICAgICAgICAgIC0gc2lmaXZl
LGZ1NTQwLWMwMDAtZ2VtCj4gPiArICAgICAgICAgICAgICAgIC0gc2lmaXZlLGZ1NzQwLWMwMDAt
Z2VtCj4gPiAgICAgIHRoZW46Cj4gPiAgICAgICAgcHJvcGVydGllczoKPiA+ICAgICAgICAgIHJl
ZzoKPiA+Cj4gPiAtLQo+ID4gMi40My4wCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
