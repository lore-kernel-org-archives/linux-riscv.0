Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C3DCA9EC5
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 07:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgrfoLLzvWfFv/0fj+FbJHwu7pGiZ53o1UgOw6Nqrug=; b=z71BKmfC5a0++2
	GhkwiHPnjZ9WutNCGvmZfQdR+zMau7ozEngAh+i8YQQ3RlrIomNfIv/voA5AcLqK3iOLi1qm9nHW/
	IzY3DlfoKk/kA0Bq8NFwI0Wg6muGIucpTgluQmcP4PfTe5TyRk+w1Du7MbsumfcmXo5V+nHrydAPB
	LEIOONYUnGAamX+lnt7WUpwuHAiY9AxQhVO7ryrqp/4uGnFriHJRGUtfw66Un8mxXh+xlBTkYB4l0
	DZjGMaB5Rx+/y3asAc6kHV3GnmjyqC2vkb4AZlugTIRNMPYDS9Q5IXg406YIexjUy95IbR/Af3DnX
	ic6ZlRnxMkzXnAIdF0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGABI-00000009ol7-1sl5;
	Mon, 12 Oct 2026 07:10:45 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGABF-00000009okD-20Vj
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 07:10:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso921896a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 00:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791789036; cv=none;
        d=google.com; s=arc-20260327;
        b=DQ1y7fvaxNBOSbVKY4ldaR7XRp7ZG+HWgOlJb035iNTvHtEjsIRZCb2VEOUiaeMdaa
         riaLGm74oV1HBv6fsWeTdZjLizQ2qZp0q7XWC5YsBfb5PhYZ1st0vKPftcaTjnjy4VcE
         FjtBmHfP9VCaPUM4zdwL47RhuS/2dNGWMzMuTXLEefhSkfW+WeSDmp4Z2cCvaV66xAH4
         LNP64wIMeAxVrDF9RO0/OSQlJgZZqpyBJQ+1PwvQP4j1he00Rel2AcpwFB/iBJPRY4H5
         Exqtu924XmTZbywRNLWSaPVmWl9zc0r+tUOEyFfL6fTTFpga7M+pFwBXMqe2TA502MeY
         CO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+MI6t2j6qZeTChwfhPv5U4MZ4K52nVTt+o6Akds2ZxA=;
        fh=ksoXHzJh0+Yj6PRxnLdYGanvpkopXcPUSIKIHJDF9xI=;
        b=f92yK0KgpR/I/53Tp2QU+4Kbh3+C83qWPRHiL0iGtntzApibCGZbON8CH3z993UfGQ
         FuSRzmN7lN20hfsmrTcEvWJwLf10PsGxgOh5vavj9IgL6Kb4O6q38Q5pWkhFMmoM+/qG
         gffwceeMKuOUXX++Q+p7cNDw7ba7l4mjpg4FXskbU4cW1Nkj7iwQOjsHhpcvIV618VrS
         clIDatTM9LeNw6z1sNXuP++uWpPS1NIsozMI80P80deFhsBzG6YtfbiuLX7UXF+vx+Bs
         pcLPau4PyP8xpXlUI67QZcUazsv3g1K6FDByjh+8bRfozUiFa6LWK/k4rNVhaXtw1gJK
         +AUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791789036; x=1792393836; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+MI6t2j6qZeTChwfhPv5U4MZ4K52nVTt+o6Akds2ZxA=;
        b=Jo/4sZMLfN34/lZ7Km/dPSwz8FbINgEgMoelUrUxBI47m7xAz+uwGIILXeakapImHB
         0BEe1RJHsIU53i1Exv+c7MVJgVArlYxkMEjoGqwjzYpw+nuvsStQ4i2zo00npl84Fk9e
         FlujwnP3kUuXwFMooAIJNjluoWgNCWPA/dVdoV7FqFb0/IS6X1oC6a0U2IZaszyxPxQV
         xrnDGZVRhc5+67z1VU6mk9QfXP6o52iFO24Auxj2tr+aN86esfbSTDfaTTJik6LCa6eg
         bF7cm9S5eoQAlftNOkKaO2ay5k3lUj/UQvATyfhev189j2z1Pykn996IsQX1KL27iKLf
         342A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789036; x=1792393836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MI6t2j6qZeTChwfhPv5U4MZ4K52nVTt+o6Akds2ZxA=;
        b=dsvxqFA7HWSOrB/923MdEkvNv7tvRaHHbXtM5kS+5snltGuWkqNBkIHPkEApROos+Q
         8JjODHouPCP73mKO/fAy9KPIT7j2fGlgh7nqNhWe5IBAlTVsiNZ03+dlCeAYr60ypw3J
         gGd9z2WMW8tpiBUsMs4bI8MztMWuxurVDDHqMP26mkdontn/IGWQEE7fOy4i8q8Tgql5
         eZzE18Ct7oI6cK+c5WVH3coxVFlXyTpgfIiKTaSBHp+UbHYwWWONtmhZvLQC+kDtQ5aC
         xjky8ji/Vt1eMFxWy27/vsapUXjq/Jcec1FEtmT6wx4KrEWKlnojRQexFKRBHcnSe++m
         Pe1g==
X-Forwarded-Encrypted: i=1; AKwUvBwXoRzrRwl8N9MMZMB8fJPY4qfVxKmGZ+xDh6D25ZKh62A0rUjgCPBriE63Zn4r6i9m0ruPDT1pwZXMTA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKrrmUM/KSL8cybGIpPHTw/gLth13KxaTMadYAbsT3IqwgnXuRn
	2SUgX2ev+JoNR5mNgUyjQDTpWZUEDNpsq8BcGwIRhcssarpGE8+fjfDSlyRHg46ATaez4cQO49L
	6Hih6svvezBffldt1p11mfdgEK5bsvzsu+//W+xoKkA==
X-Gm-Gg: AYBFou1IfgtvMUOnNjIr3jo7wzVdtQJiKxmcJZEcuiyuTv1EkzPeZNHx4BZ2gXPba6d
	ESaE1q90iYMjjq3KJxduDIchZalM5EU/QR5CJ1SISzVjRvnUIF3Q97ZHOZR7JFcueT2a54+ZPEs
	/zmVEOVNtwXwCzRzGEjRNPmf+eTWbSylT91sOO5qkeFq+2Ultguk9mPIRo5SzlA3+2C49OYj1ik
	DQfv4t1oRu0pfVmy+u5YNORSBGb5deE9x+rclGKU+ZbiI2OGidn1xtB3TdX1nTAOmlJ9KN98W63
	MxH7r3D8HuK9LJpN6KKpvzQSVLopBpVNbmbW304dALW8c/KD+aMKM50cwa/tOA==
X-Received: by 2002:a05:6402:4028:b0:6b1:c2ff:89f5 with SMTP id
 4fb4d7f45d1cf-6b1c2ffc1aemr1559796a12.42.1791789036585; Mon, 12 Oct 2026
 00:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260915083305.81913-1-yang.yicong@picoheart.com> <96d80aaf-5cf3-424e-848b-a98f97e94f92@picoheart.com>
In-Reply-To: <96d80aaf-5cf3-424e-848b-a98f97e94f92@picoheart.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 12 Oct 2026 15:10:19 +0800
X-Gm-Features: AclHuK-wZppNaA1h4a_QofQhcoWfKIAdusUFwnqCGk4531OG1GJvl2hTxSZ9l3U
Message-ID: <CAEEQ3wmDTJfbgScq=XC2GO+Coz=bpzXu9TUO1Hf87sE279g6+w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 0/5] Add workarounds for Picoheart erratas
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, conor@kernel.org, wangruikang@iscas.ac.cn, 
	ganboing@gmail.com, alex@ghiti.fr, andrew.jones@oss.qualcomm.com, 
	cleger@meta.com, geshijian@picoheart.com, niehaitao@picoheart.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_001041_548267_5498A499 
X-CRM114-Status: GOOD (  19.39  )
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

SGkgWWljb25nLAoKT24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMjo0MuKAr1BNIFlpY29uZyBZYW5n
IDx5YW5nLnlpY29uZ0BwaWNvaGVhcnQuY29tPiB3cm90ZToKPgo+IGEgZ2VudGxlIHBpbmcgZm9y
IHRoaXMgcGF0Y2hzZXQuLi4KPgo+IHRoYW5rcy4KCiAgVGhhbmtzIGZvciB0aGUgc2VyaWVzLiBU
d28gaXNzdWVzIGZvdW5kIGluIHY0OgoKICAxLiBUaGUgQ0JPIGVycmF0dW0gdXNlcyBNTVUtb25s
eSB1YWNjZXNzIGhlbHBlcnMsIHNvIHRoZSBOT01NVSBidWlsZAogICAgIGN1cnJlbnRseSBmYWls
cy4gQ291bGQgRVJSQVRBX1BJQ09IRUFSVF9DQk9fQ0xFQU4gZGVwZW5kIG9uIE1NVT8KICAgICBV
c2luZyB1bnNpZ25lZCBsb25nIGZvciBhZGRyIHdvdWxkIGFsc28gYXZvaWQgdGhlIFJWMzIgd2Fy
bmluZy4KCiAgMi4gU1JfTVhSIHJlbWFpbnMgZW5hYmxlZCBhY3Jvc3MgZ2V0X3VzZXIoKSwgd2hv
c2UgbWlnaHRfZmF1bHQoKSBtYXkKICAgICBzY2hlZHVsZS4gV291bGQgaXQgYmUgc2FmZXIgdG8g
cHJlcGFyZSBmb3IgdGhlIGZhdWx0IGZpcnN0LCB0aGVuIHVzZQogICAgIF9fZ2V0X3VzZXIoKSB3
aXRoIE1YUiBlbmFibGVkIGFuZCByZXN0b3JlIHRoZSBvcmlnaW5hbCBNWFIgc3RhdGU/CgogIFRo
YW5rcywKICBZdW5odWkKCj4KPiBPbiA5LzE1LzI2IDQ6MzMgUE0sIFlpY29uZyBZYW5nIHdyb3Rl
Ogo+ID4gVGhpcyBzZXJpZXMgYWRkIGJhc2ljIGVycmF0YSBmcmFtZXdvcmsgZm9yIFBpY29oZWFy
dCBTb0NzIGZvciBoYW5kbGluZwo+ID4gdXBjb21pbmcgUGljb2hlYXJ0IGVycmF0YXMuIEFuZCBh
ZGQgd29ya2Fyb3VuZHMgZm9yIHRoZSBmaXJzdCB0d28KPiA+IGVycmF0YXMgb24gb3VyIGhhcmR3
YXJlLiBBbHNvIGRvIHNvbWUgZml4dXBzIGFuZCByZWZhY3RvciBpbiBzdXBwb3J0Cj4gPiBvZiB0
aGUgZXJyYXRhcy4KPiA+Cj4gPiBDaGFuZ2Ugc2luY2UgdjM6Cj4gPiAtIHdvcmthcm91bmQgQ0FT
USBieSBwYXRjaGluZyB0aGUgc3lzdGVtX3N1cHBvcnRfY21weGhnMTI4KCkKPiA+IExpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYwOTA3MDcyMTQ5LjcyMDMxLTEt
eWFuZy55aWNvbmdAcGljb2hlYXJ0LmNvbS8KPiA+Cj4gPiBDaGFuZ2Ugc2luY2UgdjI6Cj4gPiAt
IHJlYmFzZSBvbiA3LjMtcmMyCj4gPiAtIG1lcmdlIHRoZSBNWFIgZml4IGFuZCBnZXRfaW5zbiBl
eHRyYWN0aW9uIGludG8gb25lIHBhdGNoCj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi8yMDI2MDcyODA5NDYyNy45NDk3NS0xLXlhbmcueWljb25nQHBpY29oZWFy
dC5jb20vCj4gPgo+ID4gQ2hhbmdlIHNpbmNlIHYxOgo+ID4gLSBmYWN0b3Igb3V0IGEgY29tbW9u
IGdldF9pbnNuIGZvciByZWFkaW5nIHVzZXJzcGFjZSBpbnN0cnVjdGlvbnMKPiA+IC0gZml4IHRo
ZSBpc3N1ZSBmcm9tIHJlYWRpbmcgaW5zdHJ1Y3Rpb25zIG9mIGEgZXhlYy1vbmx5IG1hcHBpbmcK
PiA+IC0gY2xlYW51cHMgYW5kIGNvZGUgc3R5bGUgcmVmaW5lbWVudHMgcGVyIGNvbW1lbnRzCj4g
PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDcxNTA4NDcy
NC4yNjU3OC0xLXlhbmcueWljb25nQHBpY29oZWFydC5jb20vCj4gPgo+ID4gWWljb25nIFlhbmcg
KDUpOgo+ID4gICByaXNjdjogTWFrZSBnZXRfaW5zbiBwdWJsaWMgZm9yIGluc3RydWN0aW9uIGZh
dWx0IGhhbmRsaW5nCj4gPiAgIHJpc2N2OiBpbnNuOiBTdXBwb3J0IGRlY29kaW5nIG9mIENCTyBp
bnN0cnVjdGlvbnMKPiA+ICAgcmlzY3Y6IGVycmF0YTogQWRkIGluaXQgZnJhbWV3b3JrIGZvciBw
aWNvaGVhcnQgZXJyYXRhCj4gPiAgIHJpc2N2OiBlcnJhdGE6IHBpY29oZWFydDogQWRkIHdvcmth
cm91bmQgZm9yIGNiby5jbGVhbiBlcnJhdGEKPiA+ICAgcmlzY3Y6IGVycmF0YTogcGljb2hlYXJ0
OiBBZGQgd29ya2Fyb3VuZCBmb3IgQU1PQ0FTUSBlcnJhdGEKPiA+Cj4gPiAgYXJjaC9yaXNjdi9L
Y29uZmlnLmVycmF0YSAgICAgICAgICAgICAgICAgICAgfCAgMzQgKysrCj4gPiAgYXJjaC9yaXNj
di9lcnJhdGEvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gIGFyY2gvcmlz
Y3YvZXJyYXRhL3BpY29oZWFydC9NYWtlZmlsZSAgICAgICAgIHwgICA1ICsKPiA+ICBhcmNoL3Jp
c2N2L2VycmF0YS9waWNvaGVhcnQvZXJyYXRhLmMgICAgICAgICB8IDI0MiArKysrKysrKysrKysr
KysrKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hbHRlcm5hdGl2ZS5oICAgICAgICAg
fCAgIDMgKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oICAgICAgICAgICAg
IHwgIDIxICstCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAgICAgICAgICAgICAg
ICAgfCAgIDEgKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaCAgICAg
ICAgIHwgIDI1ICstCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdF92ZW5k
b3JzLmggfCAgIDUgKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oICAgICAgICAg
ICAgICAgIHwgIDYzICsrKystCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aCAgICAgICAgICAgfCAgIDIgKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlbmRvcmlk
X2xpc3QuaCAgICAgICB8ICAgMSArCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvYWx0ZXJuYXRpdmUu
YyAgICAgICAgICAgICAgfCAgIDUgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRz
LmMgICAgICAgICAgICAgIHwgICA2ICstCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jICAgICAgICAgICAgICAgfCAgIDMgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMg
ICAgICAgICAgICAgICAgICAgIHwgIDE0ICstCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
YyAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYyAgICAgICAgIHwgIDUyIC0tLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC92
ZWN0b3IuYyAgICAgICAgICAgICAgICAgICB8ICAgNiArLQo+ID4gIDE5IGZpbGVzIGNoYW5nZWQs
IDQyMyBpbnNlcnRpb25zKCspLCA3MCBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9yaXNjdi9lcnJhdGEvcGljb2hlYXJ0L01ha2VmaWxlCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvcmlzY3YvZXJyYXRhL3BpY29oZWFydC9lcnJhdGEuYwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
