Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDEAEDA687
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 15:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOQkYZlwdZkyRXfJr4v2aXQtuGbhnE8ORB3m247n3xg=; b=2EezDT+DdOfZn/
	HxLBdR2Ph2jtyOpcnWOMSEVyEjt/7bm8+Bbq09swTYC067w/Pl9AJr5MTID0+5fSkjZQUrMrpz8rT
	Q+BvRz458/7lTSl72vujvxJoWXPBvy0PH5o5RQjsaaSGfXX4lEvcAz8csw9wcTZYBJJ+SfuiH9c82
	uHMrA6lLR5iIrcx0PK2PfrlUuoYNaBLrcRAuNH55Tri/IjbG2DGyb+1CINmqrBi/hlB/wlpycITA3
	mukwXhOp5Zb5lkha3hHcsZtXGqUueHw5X//IznAQcpOJbNaF1zIQdsXoChw+9YpTUX85sNOFoyKwB
	Y1hkRgVGbDV40rAVuDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRxv-0000000FSLc-0yvI;
	Tue, 03 Mar 2026 15:47:19 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRxr-0000000FSIw-2tAm
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 15:47:17 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-679f6ee3fb0so2618624eaf.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2026 07:47:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772552834; cv=none;
        d=google.com; s=arc-20240605;
        b=XLa+7aAQTi47Ybgjp9XbVuDiUKaI3zpFtsesz0EH0OluEx5++E05aMtqlekWbBEM45
         8ai4mr6y1YfPlOCS8XAA4xx36L/+5R/CozfG7wwJfH8WG0Sp5EKXTC/5BHFTsUkAJnpY
         R3VD8xTPYrYWPhdT9pFdGAoDm4j3p1PhxoA1LIL5+g7Ff1tnlRAM4Ob/PN71FFSpbp02
         3kuybxTEGTpbgoLGP273adgL+zl2lJDvqcK7K75BmwAyPL2Dj26+jVYr/gWKd/n3nGhJ
         c6855F7qRYX4qWQnF4kduXxsxPjZsRtxr4nsBeNVqbNkkodyZJ7v3WNv1pRp59WQskOs
         nvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rP5o/eMOPhz1A5eUQwkaAxR1nnewuBUqV7uC86UfM1k=;
        fh=DGnSMNKb35u4xgNuPklYG/x5DkTRr+DqnxETZj84p7Y=;
        b=LO0/qlGi+uJfL+HhVm3Ui3Z7e5dXtqhTFYtozO43+XvYZLpeeyt3ffaIIAk3+11G07
         o4UThSnAJNgq9a8oc093HvXNL9SIDJdM08oZimrD5kLFbqKeMV3Sh91vWgI9gilxeUbD
         IbBOUmvO07ZvIHmtBUYEQ/BD6gfwk72mQBpA2+RLkanX2k+g+Gh2DVMLgxTtvM6YrEvc
         o+IaItZavLEC3xSf/hgHCwpigYNmQBSICGVHQ8lod202Yon3S8xO+4iVEkC/hGcNDEc1
         PCNZ3Q9J2QB1OYk374LkquhTbO+XA2EuVC0lVurjtLWhAhpEq4mcdfmhua1zS5Mr3Jsf
         5c0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772552834; x=1773157634; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rP5o/eMOPhz1A5eUQwkaAxR1nnewuBUqV7uC86UfM1k=;
        b=0WiZmIhOoJkeqs3+jWsKwbK+lFPs/HiwgrPA1K4/f0z4QEw10zxdY33/p+EasVCwt0
         eEhmfcvugPPETWZmINj0rP8oh3U1a3NFBraohTByJV/98UTgA8nxPec5LUUfByGdYOvW
         zF77NW+/n2R92CDTZ8kyNP5hu7gZLyxuuXMbjFOi0DJZPD2sMJSSF0iub5Tm6f9fe3id
         9/gWpF6foSHzsUsIjEkt3krWDTuzjqmoButVCDcag+4QQfv1jWq45WPeWp8OZ19nZBi8
         61m4qMKr6t7idWSXZLtro3dpDDx3q+qrbMdu/794802AdSPsQj1KqKfMiqddhd+EcuQ2
         JxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772552834; x=1773157634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rP5o/eMOPhz1A5eUQwkaAxR1nnewuBUqV7uC86UfM1k=;
        b=bFd2eStH+cjHVKmfIGf52WKzFUaWTBHJAaKU/BpaUJCbf65ltGTm35cpj3HrKuCYea
         /WBiH3SXimRt4/vtlz91a7jLWDrpBSjZn8gyJldJeB0HkAvX1bMYjMWkx8XKVnnhnod3
         56QlhDqcgE3yei5jleasOqgNgFOzTQiukBpmxhgucGrw6mBXjMT+ZJTRfgQRMOpRnKwE
         XrDa2/Ml1wgXovx2OWA0/5T/8xEkx4TAzqNCVU+V++IqvlGlU2JfBYrzFYolYQXNhvBf
         Ob0YIYxA1e9P6Cu1y5BuyPiEG/6aSSFWEzkkWsFsQZw9STjKdZmKVklaq1r/ikFIbAcY
         n3bA==
X-Forwarded-Encrypted: i=1; AJvYcCXO7GMaDMZKC3emWvzbjjXgqHY4DLPCcUuhi+JPJpmkniLUErlLwEMDZp2/UV8tULlxonqU2ZlQu/loag==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfqJhs+umCCw6OLd0tZ7oaAij+sPJ88xN/UfOWAC2G4bWOTJsS
	QFPiFhBgae89nfwSeNV8aabKVKzO6BeISco8ATADAL2YwyanuObbgXsaTlGPRGQFWmpTo2AWRUk
	uFjVmY7babd3nXv4wjwj/XoKWxw3Y/N5GFPvMpFdZCQ==
X-Gm-Gg: ATEYQzx6mxi6g9KTn7SUeiMcToXdfgiK4cncF0TAxtvHcrMBT78g03GEgffZnvsmjV8
	T8Kq28Qn8OZqOUqTBoemC+0KsCEBNSijP6PwkHP5peM4h/y0cy4dlft2WpPJ1+PWQm/qbteBL1z
	8LIjwBNrRhDUh6LwsaFCohHSsFJTDdV9xZY1fcaT2M18Y5hL4PDqllMOdbcXWtKqyW601q1buYK
	pxLMuawZZKpBL4mI8MIntgLCp5+mC23AyB7i/fK/p7ZgDavtRHM+2+raIzTqhavHNpdsP2ZD/Nq
	v/5zyyZZoKK+/Z4Tn/D2mPbFJVxkShlYyLrbdFxpIUv3NAX3KG3b7uxeIg6ZOjXxgavIB0L5s8j
	MZ6Q30rvkKv+YWKh7+RvTf8R69w==
X-Received: by 2002:a05:6820:e03:b0:67a:2e3:2236 with SMTP id
 006d021491bc7-67a02e33328mr4850345eaf.23.1772552834606; Tue, 03 Mar 2026
 07:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20260226191231140_X1Juus7s2kgVlc0ZyW_K@zte.com.cn>
In-Reply-To: <20260226191231140_X1Juus7s2kgVlc0ZyW_K@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 3 Mar 2026 21:17:00 +0530
X-Gm-Features: AaiRm53Tv0HzLC60XnuOQhFibZnnDvaLlp6Dmpq9sGHC5_WRwzY-t4oW2N6N_TA
Message-ID: <CAAhSdy1Z_rWHW6ra3DTR1h2NeVJoM72SZ85ph-TKWRQqYzrEmA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Skip THP support check during dirty logging
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, liu.xuemei1@zte.com.cn, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_074715_985162_A1128719 
X-CRM114-Status: GOOD (  15.75  )
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

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgNDo0MuKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gV2hlbiBkaXJ0eSBsb2dnaW5nIGlzIGVuYWJsZWQsIGd1ZXN0IHN0YWdlIG1hcHBp
bmdzIGFyZSBmb3JjZWQgdG8KPiBQQUdFX1NJWkUgZ3JhbnVsYXJpdHkuIENoYW5naW5nIHRoZSBt
YXBwaW5nIHBhZ2Ugc2l6ZSBhdCB0aGlzIHBvaW50Cj4gaXMgaW5jb3JyZWN0Lgo+Cj4gRml4ZXM6
IGVkN2FlN2EzNGJlYSAoIlJJU0MtVjogS1ZNOiBUcmFuc3BhcmVudCBodWdlIHBhZ2Ugc3VwcG9y
dCIpCj4gU2lnbmVkLW9mZi1ieTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20u
Y24+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+
CgpRdWV1ZWQgdGhpcyBwYXRjaCBhcyBmaXggZm9yIExpbnV4LTcuMC1yY1gKClRoYW5rcywKQW51
cAoKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMGI3NWViMmExODIw
Li5jMzUzOWY2NjAxNDIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysg
Yi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IEBAIC01MzUsNyArNTM1LDcgQEAgaW50IGt2bV9yaXNj
dl9tbXVfbWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAq
bWVtc2xvdCwKPiAgICAgICAgICAgICAgICAgZ290byBvdXRfdW5sb2NrOwo+Cj4gICAgICAgICAv
KiBDaGVjayBpZiB3ZSBhcmUgYmFja2VkIGJ5IGEgVEhQIGFuZCB0aHVzIHVzZSBibG9jayBtYXBw
aW5nIGlmIHBvc3NpYmxlICovCj4gLSAgICAgICBpZiAodm1hX3BhZ2VzaXplID09IFBBR0VfU0la
RSkKPiArICAgICAgIGlmICghbG9nZ2luZyAmJiAodm1hX3BhZ2VzaXplID09IFBBR0VfU0laRSkp
Cj4gICAgICAgICAgICAgICAgIHZtYV9wYWdlc2l6ZSA9IHRyYW5zcGFyZW50X2h1Z2VwYWdlX2Fk
anVzdChrdm0sIG1lbXNsb3QsIGh2YSwgJmhmbiwgJmdwYSk7Cj4KPiAgICAgICAgIGlmICh3cml0
YWJsZSkgewo+IC0tCj4gMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
