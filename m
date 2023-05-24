Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C72C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 14:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1MYo5ElzZut2O7HfmYqqF4/YqmgNLb+Go++wiwUHWU=; b=UytN35StLuaIZi
	GINAhU8fgLkuCP+gULhyjHaQSU3dhiTj0Rp5bEfMP6aR3Zp2aYuAEfr+YO/C7geXWc5i/bWFQQEB8
	iVZtNTVrStob7il5vGUvepO5/keWKx1H9itJ9XWa+ZLiQQO1vhLm+q5CiUQVNY1w9qeKY/XpX322m
	k00QZYUUCOKtYQ+xkCkIc2tRQsi0y+OZQc2lSvwm/wi/NvX2k6wBq443MSigzvDclSpCDWQfk1aqV
	Otvb58yqXIPj0DFOyVQCq21g3APC7DXaZtC0SP6gpX7EpK9WTvI/JnPsrHAJ5WjXhqe+q9DubZBOx
	ZOmcbodDbe6NRPbkJYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1p3v-00Ddbk-0E;
	Wed, 24 May 2023 14:01:59 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1p3r-00DdaY-2I
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 14:01:57 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-96f9cfa7eddso177703166b.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 May 2023 07:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684936911; x=1687528911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GcnYDNNJKRDTvBz4U4x4piA3wZfgWR11rBlHqZISUZw=;
        b=cBRG8OIciHgkJG5NeGpDKgXBLwB/ZRieicor/6NiIG3NMQ1B/bIFDyoHjCsFWSj6Dh
         NYPSkHxVPzMFS6zrRvk8Vu4wSKDXgHIdsXNG7HnJKoV5jngMjC6m4+4Ejb8cwJUNzh+K
         h0sFoTKIuc9638A6aDq/12b39F8dap8vN6cb6grcVRU2GiUnjeB0guaTZmwOq50n7yOh
         J0q9yFNPRJi9f0Wa6yREWvws/Fx+13BXqhhFWliMovEX8xKUGyVmNEXP1E2hfNKuamPq
         7gEAJqSSubtg7vrG8Pbj6UFiCAAl6bxS9menFiATiRgE+bcmLH7U+40V3RlZcSfKzzU7
         QJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684936911; x=1687528911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GcnYDNNJKRDTvBz4U4x4piA3wZfgWR11rBlHqZISUZw=;
        b=ct70vBwuMjxHRbiZk93K+StJ/AeHtCfDn68T1s9dAd342TQ1ulbDDT1InmhsSz2Bus
         4ShPhiOeRW0KmbMElaZAdnbp7Ptr2sL+nL7SHKuW78P06aCvFV9tpaAzDjHdldCc0X3T
         LnXa3Bx+tGpVZppITfjQq+ytUDOmf40MeTx7BXbewczm0amqwEaVte3/XaJFMvcJ6ciI
         R8fjlhqpRIm0Ht6ZAq5/pz3RmCv0QN2jSvetmAPNQqIMH1oPROt5kq81Y2NiIBDbHOHF
         rnWF9UHAQpR7naLMrij4ggA5dBddOG1MRnPo6OjtKZUFEgbdtK9lF0kMAmlCQ/wstDkz
         PeMg==
X-Gm-Message-State: AC+VfDxZFyJl+CY6vIbV8esvtp4Z+5qbPEX5sYRHgGEj/gxWQHV+EVhm
	jkUBFkq/m8Gf5xYLjegY+uB25w==
X-Google-Smtp-Source: ACHHUZ5LJ1RLFW3yyptH2uNq3JrXu9MBzFBIvQQGDf110Gc3zDntoLPKWCyt9dTiL0jQ3+akZGR55w==
X-Received: by 2002:a17:907:1686:b0:973:91a5:bfdf with SMTP id hc6-20020a170907168600b0097391a5bfdfmr1347603ejc.4.1684936911458;
        Wed, 24 May 2023 07:01:51 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p25-20020a1709060dd900b0096f67b55b0csm5860748eji.115.2023.05.24.07.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 07:01:51 -0700 (PDT)
Date: Wed, 24 May 2023 16:01:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, christoph.muellner@vrull.eu, 
	David.Laight@aculab.com, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v3 1/2] riscv: don't include kernel.h into alternative.h
Message-ID: <20230524-1ae0ba16b93b71a150320a6d@orel>
References: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
 <20230521114715.955823-2-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230521114715.955823-2-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_070155_757988_D93293E2 
X-CRM114-Status: GOOD (  18.72  )
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

T24gU3VuLCBNYXkgMjEsIDIwMjMgYXQgMDE6NDc6MTRQTSArMDIwMCwgSGVpa28gU3R1ZWJuZXIg
d3JvdGU6Cj4gRnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZydWxsLmV1Pgo+
IAo+IFRoaXMgaW5jbHVkZSBpcyBub3QgY3VycmVudGx5IG5lZWRlZCBmb3IgYWx0ZXJuYXRpdmVz
IGFuZCBjcmVhdGVzCj4gcG9zc2libGUgaXNzdWVzIHdoZW4gd2Ugd2FudCB0byBhZGQgYWx0ZXJu
YXRpdmVzIHRvIGRlZXBlciBrZXJuZWwKPiBpbmZyYXN0cnVjdHVyZS4KPiAKPiBUaGUgaXNzdWUg
aW4gcXVlc3Rpb24gY2FtZSBmcm9tIHRyeWluZyB0byBpbnRyb2R1Y2UgWmF3cnMgYWx0ZXJuYXRp
dmVzLAo+IHdoaWNoIHJlc3VsdGVkIGluIGEgc29tZXdoYXQgY2lyY3VsYXIgZGVwZW5kZW5jeSBs
aWtlOgo+IAo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L2JpdG9wcy5o
OjM0LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjIy
LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuLi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVy
bmF0aXZlLmg6MTYsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4uL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZXJyYXRhX2xpc3QuaDo4LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuLi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2JhcnJpZXIuaDoxNSwKPiAgICAgICAgICAgICAgICAgIGZyb20gLi4v
aW5jbHVkZS9saW51eC9saXN0Lmg6MTEsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4uL2luY2x1
ZGUvbGludXgvcHJlZW1wdC5oOjExLAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuLi9pbmNsdWRl
L2xpbnV4L3NwaW5sb2NrLmg6NTYsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4uL2luY2x1ZGUv
bGludXgvbW16b25lLmg6OCwKPiAgICAgICAgICAgICAgICAgIGZyb20gLi4vaW5jbHVkZS9saW51
eC9nZnAuaDo3LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L21tLmg6
NywKPiAgICAgICAgICAgICAgICAgIGZyb20gLi4vYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNl
dHMuYzoxMDoKPiAuLi9pbmNsdWRlL2FzbS1nZW5lcmljL2JpdG9wcy9nZW5lcmljLW5vbi1hdG9t
aWMuaDogSW4gZnVuY3Rpb24g4oCYZ2VuZXJpY190ZXN0X2JpdF9hY3F1aXJl4oCZOgo+IC4uL2lu
Y2x1ZGUvYXNtLWdlbmVyaWMvYml0b3BzL2dlbmVyaWMtbm9uLWF0b21pYy5oOjE0MDoyMzogZXJy
b3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHNtcF9sb2FkX2FjcXVpcmXi
gJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICAxNDAgfCAgICAg
ICAgIHJldHVybiAxVUwgJiAoc21wX2xvYWRfYWNxdWlyZShwKSA+PiAobnIgJiAoQklUU19QRVJf
TE9ORy0xKSkpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdnJ1
bGwuZXU+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWx0ZXJuYXRpdmUuaCB8IDEg
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2FsdGVybmF0aXZlLmgKPiBpbmRleCA2YTQxNTM3ODI2YTcuLjA1ODg1ZGU2MDQ4YyAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLmgKPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLmgKPiBAQCAtMTMsNyArMTMsNiBAQAo+ICAj
aWZkZWYgQ09ORklHX1JJU0NWX0FMVEVSTkFUSVZFCj4gIAo+ICAjaW5jbHVkZSA8bGludXgvaW5p
dC5oPgo+IC0jaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC90eXBl
cy5oPgo+ICAjaW5jbHVkZSA8bGludXgvc3RkZGVmLmg+Cj4gICNpbmNsdWRlIDxhc20vaHdjYXAu
aD4KPiAtLSAKPiAyLjM5LjAKPgoKUmVtb3ZpbmcgdGhpcyBpbmNsdWRlIGRvZXNuJ3QgYnJlYWsg
Y29tcGlsYXRpb24gYmVjYXVzZSB0aGUgb25seSBjYWxsZXJzCm9mIFBBVENIX0lEX0NQVUZFQVRV
UkVfSUQoKSBhbmQgUEFUQ0hfSURfQ1BVRkVBVFVSRV9WQUxVRSgpLCB3aGljaCBhcmUKZGVmaW5l
ZCB3aXRoIGxvd2VyL3VwcGVyXzE2X2JpdHMoKSwgYXJlIGluIGFyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYywKd2hpY2ggaW5jbHVkZXMgYXQgbGVhc3Qgb25lIHRoaW5nIHdoaWNoIGV2ZW50
dWFsbHkgaW5jbHVkZXMgbGludXgva2VybmVsLmgKKHRoZSBmaXJzdCBwYXRoIEkgZm91bmQgd2Fz
IGxpbnV4L21vZHVsZS5oIC0+IGxpbnV4L21vZHVsZXBhcmFtLmggLT4KbGludXgva2VybmVsLmgp
LiBJZGVhbGx5IHdlIHdvdWxkbid0IHJlbHkgb24gdGhhdCBsdWNrLiBXZSBjYW4gb3Blbgpjb2Rl
IHRoZSBQQVRDSF9JRF8qIG1hY3JvcyB0byBkcm9wIHRoZSBsb3dlci91cHBlcl8xNl9iaXRzKCkg
ZGVwZW5kZW5jaWVzCm9yIG1vdmUgdGhlIG1hY3JvcyBlbHNld2hlcmUsIG1heWJlLCBmb3Igbm93
LCBqdXN0IHRvCmFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwoKVGhhbmtzLApkcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
