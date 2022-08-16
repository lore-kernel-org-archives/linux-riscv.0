Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C775FC32772
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n7OIlMsd5SzJwRdGvegFIRuKDFK7ExZaUeOltWtjMG4=; b=cN3BqwMIHSAxDw
	yXZiXql31QCb78MvXhvV2R18PzhA+NT1Pxg8M0axwKGEw7TjoKkuB9UNsBmgItAFbHlgYst3UoCV5
	R0xqgPUYTdM1vN38Z5j1Omj+OAiBaK5iPnG68KKVZl7U+WGiDTN41fpRsJ1tRVJk44X//j5G6lIqq
	ZsHr/ZmtipzpfzT9HAvygnW65JyS9hAkQaDCGSVChQzDOdJLFgFKh9ght9QpUtMquY+UkfypvXZNl
	sDYVhTQe8B8tZJ+Gkv9DC1rvSdPFawR74ALoL9aDuvGv+jUMU88bcNv+3FOGlEl+DO/GNOrlmfZoQ
	AK/5TBKl786GPxHqLAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNt62-000RIX-LA; Tue, 16 Aug 2022 09:42:50 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNt5v-000RDt-LT
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 09:42:45 +0000
Received: by mail-lf1-x129.google.com with SMTP id w5so14172717lfq.5
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Y58LopX3Xau62EqFhAJuU29XSrAjPOJKcpX9ia/1x/U=;
        b=vtoZdSOhjarg/GSUa+9qG6BMrKkJOe83PvRmhRhyuCerPbGiIrm8pgH0PekReyxXJ6
         br5da1shUHmmP98ueTSt3G69sK9FhXyVW3WshnsnkN5Zd9pD4/lLqoMERKRF+w7swXkM
         AeIbHzMZsV28B9ebYLbsaCZ0jduwrq/sNPO2NVsFmvFtUPUZJWcrl8zjdGivtVPbCski
         3t3C/SRG3X5doYfn+nTF8cJUl3g/YvK7CVLwOZJws/ZpTvhaiUyGafpkHX0KACEFk68A
         QHr4Aga2v7Ah2M9FdDI0/vgxJtgzrZnGZ7q/NfLu5futbWVzkQ+nzoQuKEwZv1YoRTFV
         zsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Y58LopX3Xau62EqFhAJuU29XSrAjPOJKcpX9ia/1x/U=;
        b=bgwrrqIMRkXs8ecTptaY7KuVY1e2GUhpaJj7sZTmCsqw4lE+LrYPu7ewGFljPzmQSt
         UVXMcNiASIAmhC5Twlj0vctBWqnJKmayB2r/NyBjOWnDoWnZRKw49MuJEsXCrB4BHBiP
         q/PE7jPVlt4RumvqV87aCVniGwzFvXksQnce9W3/lasPz1zJVFm0ShHOj8rEk7Ge03ML
         NaANpOzy6IK5qWPKm/rM0YlOYsh3pb1u2U9WA4MAcHpZhw4NMFx+6U/ya7FWxBaFvtfq
         Lm3GBsJBJ7U1n5MbML4Ju2Havj46j+aoXpm9ZxOKjKOs5bvDCfG1tFA986IGpaqAe7Dl
         5frg==
X-Gm-Message-State: ACgBeo1JAAao85TDel19B3aAdZvHC7/kERedFqlTayyCjTDPaSyUvwkS
	c6uOVpCm/CXREjxBIZHgHC/QYQ==
X-Google-Smtp-Source: AA6agR5AgFW8i1G8KDg24W4ut+/FzCr3UMJzFdeE8sWqRtObktk+u4BKs7+LO+EgAtH4db4A3D91Jg==
X-Received: by 2002:a05:6512:1052:b0:491:f371:ad44 with SMTP id c18-20020a056512105200b00491f371ad44mr4099234lfb.416.1660642961195;
        Tue, 16 Aug 2022 02:42:41 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id k12-20020ac24f0c000000b0048b03b4b018sm1325108lfr.283.2022.08.16.02.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 02:42:40 -0700 (PDT)
Message-ID: <b5401052-e803-9788-64d6-82b2737533ce@linaro.org>
Date: Tue, 16 Aug 2022 12:42:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Content-Language: en-US
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <5593349.DvuYhMxLoT@jernej-laptop> <3881930.ZaRXLXkqSa@diego>
 <2249129.ElGaqSPkdT@jernej-laptop>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2249129.ElGaqSPkdT@jernej-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_024243_757072_F4AF0E3D 
X-CRM114-Status: GOOD (  16.10  )
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

T24gMTYvMDgvMjAyMiAxMjoyNSwgSmVybmVqIMWga3JhYmVjIHdyb3RlOgo+IERuZSB0b3Jlaywg
MTYuIGF2Z3VzdCAyMDIyIG9iIDExOjEyOjA1IENFU1QgamUgSGVpa28gU3TDvGJuZXIgbmFwaXNh
bChhKToKPj4gQW0gRGllbnN0YWcsIDE2LiBBdWd1c3QgMjAyMiwgMDk6NDk6NTggQ0VTVCBzY2hy
aWViIEplcm5laiDFoGtyYWJlYzoKPj4+IERuZSB0b3JlaywgMTYuIGF2Z3VzdCAyMDIyIG9iIDA5
OjQxOjQ1IENFU1QgamUgS3J6eXN6dG9mIEtvemxvd3NraSAKPiBuYXBpc2FsKGEpOgo+Pj4+IE9u
IDE1LzA4LzIwMjIgMDg6MDgsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+Pj4+PiArCj4+Pj4+ICsJ
ZGU6IGRpc3BsYXktZW5naW5lIHsKPj4+Pj4gKwkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3Vu
MjBpLWQxLWRpc3BsYXktZW5naW5lIjsKPj4+Pj4gKwkJYWxsd2lubmVyLHBpcGVsaW5lcyA9IDwm
bWl4ZXIwPiwgPCZtaXhlcjE+Owo+Pj4+PiArCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+Pj4+PiAr
CX07Cj4+Pj4+ICsKPj4+Pj4gKwlvc2MyNE06IG9zYzI0TS1jbGsgewo+Pj4+Cj4+Pj4gbG93ZXJj
YXNlCj4+Pj4KPj4+Pj4gKwkJY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4+Pj4+ICsJCWNs
b2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47Cj4+Pj4KPj4+PiBUaGlzIGlzIGEgcHJvcGVydHkg
b2YgdGhlIGJvYXJkLCBub3QgU29DLgo+Pj4KPj4+IFNvQyBuZWVkcyAyNCBNSHogb3NjaWxsYXRv
ciBmb3IgY29ycmVjdCBvcGVyYXRpb24sIHNvIGVhY2ggYW5kIGV2ZXJ5IGJvYXJkCj4+PiBoYXMg
aXQuIEhhdmluZyBpdCBoZXJlIHNpbXBsaWZpZXMgYm9hcmQgRFQgZmlsZXMuCj4+Cj4+IEkgZ3Vl
c3MgdGhlIG9zY2lsbGF0b3IgaXMgYSBzZXBhcmF0ZSBjb21wb25lbnQgb24gZWFjaCBib2FyZCwg
cmlnaHQ/Cj4gCj4gQ29ycmVjdC4KPiAKPj4gQW5kIERUIG9idmlvdXMgaXMgbWVhbnQgdG8gZGVz
Y3JpYmUgdGhlIGhhcmR3YXJlIC0gaW5kZXBlbmRlbnRseSBmcm9tCj4+IGltcGxlbWVudGF0aW9u
LXNwZWNpZmljIGNob2ljZXMuCj4gCj4gVGhlcmUgaXMgbm8gY2hvaWNlIGluIHRoaXMgY2FzZS4g
MjQgTUh6IGNyeXN0YWwgaGFzIHRvIGJlIHByZXNlbnQuCj4gCj4gRldJVywgaW5jbHVkaW5nIGNy
eXN0YWwgbm9kZSBpbiBTb0Mgc3BlY2lmaWMgRFRTSSBpcyBhbHJlYWR5IGNvbW1vbiBwYXR0ZXJu
IGluIAo+IEFsbHdpbm5lciBBUk0gU29DIERUU0kgZmlsZXMuCj4gCj4+Cj4+IFN0YXJ0aW5nIHRv
IGRpc2N1c3Mgd2hpY2ggZXhjZXB0aW9ucyB0byBhbGxvdyB0aGVuIG1pZ2h0IGxlYWQgdG8gZXZl
biBtb3JlCj4+IGV4Y2VwdGlvbnMuCj4+Cj4+IEFsc28gaGF2aW5nIHRvIGxvb2sgZm9yIGEgYm9h
cmQtY29tcG9uZW50IGluIHRoZSBzb2MgZHRzaSBhbHNvIGlzIHN1cnByaXNpbmcKPj4gaWYgb25l
IGdldHMgdG8gdGhlIHBhcnR5IGxhdGVyIG9uIDotKSAuCj4gCj4gQXMgSSBzYWlkLCBpZiBvbmUg
aXMgYWNjdXN0b21lZCB0byBBbGx3aW5uZXIgQVJNIERUIGRldmVsb3BtZW50LCBpdCB3b3VsZCBi
ZSAKPiBtb3JlIHN1cnByaXNpbmcgdG8gaW5jbHVkZSAyNCBNSHogY3J5c3RhbCBub2RlIGluIGVh
Y2ggYW5kIGV2ZXJ5IGJvYXJkIERULgoKSXQncyBzYW1lIGV2ZXJ5d2hlcmUuIEFsbHdpbm5lciwg
RXh5bm9zLCBpTVgsIFF1YWxjb21tLiBFdmVyeXdoZXJlIHRoaXMKaXMgYSBwYXJ0IG9mIHRoZSBi
b2FyZCwgc28gZXZlbiBpZiBvc2NpbGxhdG9yIGZyZXF1ZW5jeSBpcyBmaXhlZCAoYXMgaW4KOTkl
IG9mIGNhc2VzIGFsdGhvdWdoIHNvbWUgU29DcyBJIHRoaW5rIG1pZ2h0IGp1c3QgYWxsb3cgdG8g
aW1wbGVtZW50Cm9uZSBvZiBmZXcpLCBzdGlsbCB0aGlzIGlzIGEgcHJvcGVydHkgb2YgdGhlIGJv
YXJkLiBCZWNhdXNlOgoxLiBEVFNJIGRlc2NyaWJlcyB0aGUgU29DIHBhcnQsIG5vdCBib2FyZC4K
Mi4gU28gdGhlIERUUyBkZXZlbG9wZXIgaXMgYSBiaXQgbW9yZSBjb25zY2lvdXMgYWJvdXQgaGlz
IGRlc2lnbi4KCktlZXBpbmcgdGhpbmdzIGluIFNvQyBEVFNJIGp1c3QgYmVjYXVzZSBpdCBzaW1w
bGlmaWVzIERUUyBpcyBub3QgY29ycmVjdApJTUhPLiBTbyBhZ2FpbiAtIGxpa2UgaW4gc2V2ZXJh
bCBvdGhlciBjYXNlcyAtIG1pbmltdW0gdGhlIGZyZXF1ZW5jeSBpcwpwcm9wZXJ0eSBvZiB0aGUg
Ym9hcmQsIG5vdCB0aGUgU29DIERUU0kuCgpFdmVyeXdoZXJlLiBBbGx3aW5uZXIgaXMgbm90IHNw
ZWNpYWwgdG8gcmVjZWl2ZSBleGNlcHRpb25zLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
