Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BD9C79F99
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CmZdgf0+5iAuIQbxtCvBNWesUWCdUOdGpIXKpnW3s8=; b=sCo+kblg4Z9Qo+
	0RulAWht9oW0pNK+lXcSdQ1E82pjI5AI/G4BWySDyNOHC0U1xkc1xbhh0mtjW7BthMiwi3NJlbG02
	DinfWmuZTG6Pr+3fWNj8BV3a6BwU9FN7hRbBTBqQxI+N5p65VuQBAW9GCGv0BA75dF4esjhkh+tQg
	rwJscJIvaIuf/Mfc3op6P1POgNk7TLLnjg+WMgz+/qbsL21MdF8l8bv2muNkG3k7lqtxNEmIUVpql
	biH2klGsfWiIcWsG6ZQfJ96OQb6Dj1aqQsVuD41TnY21v6b03djzJzRa9GDmF9R2qxTm8/cHeO7VB
	HsuNGAi4ugxsC9nTuWaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x399A-00000004s3f-2rch;
	Sun, 06 Sep 2026 09:26:44 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3997-00000004s3K-2CIY
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 09:26:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2691496f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 06 Sep 2026 02:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788686799; cv=none;
        d=google.com; s=arc-20260327;
        b=HRyQ8mPMBIO8my09IEcO3CqE1UrNQchXk+6hYA/wwWUZDNEz+Hr0wnvqB0kVTNYX/X
         G+fC/lJtCu7KGIIZgZZeFZQHsT0Ucswfm4iqnqetWC8WuNcchJSgZICO5Jd+W1eiUIkj
         Oq0pRakGqWaAYewWV9EaJlXzu3L9AswNKqFHdK3yfZJYCmdHt/b+hdxoIgxCUUkXwE6T
         AgJFJWzHRBYqh7IDMZMlPkevoovqHyYr5MbQaxHdNEcPnwz8PdXKjchqh5Qm0+pDv+wa
         VccDRDWgoRwb8Yts3LuTvW0ewr9YbCG5P3lrfGKFdSejzvJZ1tWYfS2oAcEPMixuPMz+
         yKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3Z9m61R0Xcvfx1fOOb/3EA5UUxAFfOaOY/w1CnIwco=;
        fh=n9Vh/K0zo2RCNDQ7YwoTj28RJHy2Mk/jD3z8Z5MobT8=;
        b=KwZW6SA6dJ4sNqSX9q0yFiO/o5Hk9ArYID6Uhq+8gBz5+GqfeVJqZO7Obo84nw3QCO
         PB2714HJF2K2NakKdZ7yLF4CtHYHFGJ9+E/I6sNdc4lGC5kX3BvnX37Lo3SKxsm/GM3K
         u9X27+PE+6Xg423SV3yKOUYcKIVjtZxK+EoEvkR05jamBrYllA28rFRrIAnJTyV2CTib
         rWr7OikffhG1iGhqNO7aNv6LclCZccn2bFMgC0mX99iSVxkK8Rr2V9lwrlo9FG0tKS7k
         vsXMynM5qMjkC+Z36oGgvgXtN0tq2qPJIfOth9YnTRx5zejA4NHwsGtadcsVfWfECrTb
         Bsrg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788686799; x=1789291599; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3Z9m61R0Xcvfx1fOOb/3EA5UUxAFfOaOY/w1CnIwco=;
        b=MmF/IiKyJhdwFyCpT3SafploRllTnmxAY/haSQU7pVrvPj86O7gXCfPdRdvoT69tbY
         eFpQwekczlI4GwUniOU0bOINrdOQl2TnRkJG/sfNgpaKbiu8Foq2pvlJOMaYq9u5QUiR
         FC8ycOmgxqM9VidD4sbU8L5BXF4lvxb3JJ9D6jq3nTnfXNtxavwq9KOcjyZcQjzMvOIB
         rDN7nkzTqMaWgLriXzyj7TC/n5CtPFM6mRQIX10L/ZMG25T7qBRDnzgyvA0+fTXYUEBz
         i+3BJbtAiZRe4EPmNO8RqddW+frZiNO/LpZRQWToBdFTRwifMxsIeJyKWzxABn54d9Za
         mJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788686799; x=1789291599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3Z9m61R0Xcvfx1fOOb/3EA5UUxAFfOaOY/w1CnIwco=;
        b=R6u9BOCqKN5Pql7l3nlMJ57iztGY71ztYIIM6ROe6Iz5Xmgrur1Grk5znoj27zcMBi
         bgCjPI0+LKJscsfNeb4AmpVaS1phGmdNnZ/uRJZUX8gcqrV0w6txHGIbsoK2Z5RX9/qn
         fxtcLBEjQgT+/QvzjJywx8yKijKlkyiHC0qUX4Vxc8HM8j/TkFPTK87c2IcXBTetw8DA
         NEEVwggEiRWB42NfFbV0bnuu3GjgjPkwde/dI00e+qiTDO1cWa3iVfhkaf0UlWEWCtJR
         1yR4ve4sjln/PlU34DgJN6T4OlCLmEq5TvJNVjlFC51w8Km31ANSLzdR4V+BkoGrDHlL
         GY8w==
X-Forwarded-Encrypted: i=1; AKwUvByjNhAZ7yBsqtikRbKu5zdyBZ9aRGh3m9OBN/G5jFU5/0NiXopYjOdmT6p9uoes7V+vz8LaoXKgTTKELQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lgbg6QnnteNQ46J5DIvK6bv9eGoytTsmauZe64DcBdES+o7PMy
	bU2xcNPf0aGiOfyHAi+alMJlgMo4TJBcaok/TMO/KbZnzm/vzYljrUrlYkm/dTrziZ0OUsTQos/
	TKRjSXFXs1DpociYF/pxtRlkgrXLtCjxLkE0Non+Q8A==
X-Gm-Gg: AYBFou2RNLOA7ms6nO1OY2orgTjyf1HLtawzOT2Hu8gn3MQ+eez6gtBgy7hZ04KmB1w
	AkSwT92+ZFNW5+S6okdyB3bdnngf3zComULuLQ8UCPCVT8wSVmGcSc7mHUdY4sKCw+w4ss9svpM
	3LibofNglDlHDova+/QmQ9EpRjYn7LYFxxzwC2LiaZTatXhcCxzrthE+TzipOlko8+AzU2Da7Dq
	bartNEvuVrJ1ricHBrl1B5XiGdZvRdW/7B6vT1zuonNLfTSjy4lrA2cJoLCG8TZmpt6JORvck1e
	pVOAmOuY8UuADpuYbDJvZjt7ofTh0o5MjGdZq0r8bP+TnsbKv2nGxZbsVFJKiqoitR1WS9GwC0O
	YXKVLjntPBWbbwTO1WIw2htSJdF3uy3Extvg8zoFt6+96LYyzbCNqDntUo29Rp10=
X-Received: by 2002:a05:600c:3f19:b0:49c:fc6c:be13 with SMTP id
 5b1f17b1804b1-49cfc6cc0f4mr134459275e9.25.1788686798530; Sun, 06 Sep 2026
 02:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <caplitmus-rv.4f722288a2f1483090d75bcd991d5b90.imsic-cover@163.com>
 <caplitmus-rv.4882de641c0d41f9bef843fe41b3084f.imsic-zero@163.com>
In-Reply-To: <caplitmus-rv.4882de641c0d41f9bef843fe41b3084f.imsic-zero@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 6 Sep 2026 14:56:26 +0530
X-Gm-Features: AcwNN1XPksXVzh3FfoA4HfbE_7dEgAQHtrNhUuQ_Fviya_2o7CNRojIaWVMEZmI
Message-ID: <CAAhSdy1LPUy51RCc52kRv62Jdgi-DL=64J-p7RXd1Y11dvXXbA@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/riscv-imsic: Ignore unused group index shifts
To: Pengpeng Hou <hppiscas@163.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Bjorn Topel <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_022641_609813_42675CE1 
X-CRM114-Status: GOOD (  20.34  )
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

T24gU3VuLCBTZXAgNiwgMjAyNiBhdCAxOjM44oCvUE0gUGVuZ3BlbmcgSG91IDxocHBpc2Nhc0Ax
NjMuY29tPiB3cm90ZToKPgo+IFRoZSBJTVNJQyBwYXJzZXIgdmFsaWRhdGVzIGFuZCB1c2VzIGdy
b3VwX2luZGV4X3NoaWZ0IGV2ZW4gd2hlbiB0aGUKPiBncm91cCBpbmRleCBoYXMgemVybyB3aWR0
aC4gVGhlIGJpbmRpbmcgcGVybWl0cyBhIHplcm8td2lkdGggZ3JvdXAgd2l0aAo+IHNoaWZ0IHpl
cm8sIGJ1dCBiaXRzICsgc2hpZnQgLSAxIHVuZGVyZmxvd3MgYW5kIHJlamVjdHMgdGhhdCBsYXlv
dXQuCj4gQVBMSUMgTVNJIHNldHVwIGFsc28gdmFsaWRhdGVzIEhIWFMgYWx0aG91Z2ggSEhYVyBp
cyB6ZXJvLgo+Cj4gT25seSB2YWxpZGF0ZSBhbmQgY2xlYXIgZ3JvdXAtYWRkcmVzcyBiaXRzIHdo
ZW4gdGhlIGdyb3VwIHdpZHRoIGlzCj4gbm9uemVyby4gVXNlIHplcm8gZm9yIEFQTElDIEhIWFMg
d2hlbiB0aGVyZSBpcyBubyBncm91cCBmaWVsZC4gVGhpcyBhbHNvCj4gYXZvaWRzIHNoaWZ0aW5n
IGFuIGVtcHR5IG1hc2sgYnkgYW4gb3RoZXJ3aXNlIHVudXNlZCBzaGlmdCB2YWx1ZS4KPgo+IFRo
ZSBpc3N1ZSB3YXMgZm91bmQgYnkgb3VyIHN0YXRpYy1hbmFseXNpcyB0b29sIGFuZCBtYW51YWxs
eSByZXZpZXdlZC4KPgo+IEZpeGVzOiAyMWE4ZjhhMGViMzUgKCJpcnFjaGlwOiBBZGQgUklTQy1W
IGluY29taW5nIE1TSSBjb250cm9sbGVyIGVhcmx5IGRyaXZlciIpCj4gQXNzaXN0ZWQtYnk6IEdQ
VC01Cj4gU2lnbmVkLW9mZi1ieTogUGVuZ3BlbmcgSG91IDxocHBpc2Nhc0AxNjMuY29tPgo+IC0t
LQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbXNpLmMg
Yi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1zaS5jCj4gaW5kZXggZmI4ZDE4Mzgu
LjU2OWIzZmY0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMt
bXNpLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1zaS5jCj4gQEAg
LTIyMywxNyArMjIzLDIxIEBAIGludCBhcGxpY19tc2lfc2V0dXAoc3RydWN0IGRldmljZSAqZGV2
LCB2b2lkIF9faW9tZW0gKnJlZ3MpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ICAgICAgICAgfQo+Cj4gLSAgICAgICAvKiBGaW5kIGZpcnN0IGJpdCBwb3NpdGlvbiBvZiBncm91
cCBpbmRleCAoSEhYUykgKi8KPiAtICAgICAgIG1jLT5oaHhzID0gaW1zaWNfZ2xvYmFsLT5ncm91
cF9pbmRleF9zaGlmdDsKPiAtICAgICAgIGlmIChtYy0+aGh4cyA8ICgyICogQVBMSUNfeE1TSUNG
R0FERFJfUFBOX1NISUZUKSkgewo+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIklNU0lD
IGdyb3VwIGluZGV4IHNoaWZ0IHNob3VsZCBiZSA+PSAlZFxuIiwKPiAtICAgICAgICAgICAgICAg
ICAgICAgICAoMiAqIEFQTElDX3hNU0lDRkdBRERSX1BQTl9TSElGVCkpOwo+IC0gICAgICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKPiAtICAgICAgIH0KPiAtICAgICAgIG1jLT5oaHhzIC09ICgy
ICogQVBMSUNfeE1TSUNGR0FERFJfUFBOX1NISUZUKTsKPiAtICAgICAgIGlmIChBUExJQ194TVNJ
Q0ZHQUREUkhfSEhYU19NQVNLIDwgbWMtPmhoeHMpIHsKPiAtICAgICAgICAgICAgICAgZGV2X2Vy
cihkZXYsICJJTVNJQyBncm91cCBpbmRleCBzaGlmdCBiaWcgZm9yIEFQTElDIEhIWFNcbiIpOwo+
IC0gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgIGlmIChtYy0+aGh4dykg
ewo+ICsgICAgICAgICAgICAgICAvKiBGaW5kIGZpcnN0IGJpdCBwb3NpdGlvbiBvZiBncm91cCBp
bmRleCAoSEhYUykgKi8KPiArICAgICAgICAgICAgICAgbWMtPmhoeHMgPSBpbXNpY19nbG9iYWwt
Pmdyb3VwX2luZGV4X3NoaWZ0Owo+ICsgICAgICAgICAgICAgICBpZiAobWMtPmhoeHMgPCAoMiAq
IEFQTElDX3hNU0lDRkdBRERSX1BQTl9TSElGVCkpIHsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBkZXZfZXJyKGRldiwgIklNU0lDIGdyb3VwIGluZGV4IHNoaWZ0IHNob3VsZCBiZSA+PSAlZFxu
IiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgyICogQVBMSUNfeE1TSUNGR0FE
RFJfUFBOX1NISUZUKSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgICAgICAgICAgbWMtPmhoeHMgLT0gKDIgKiBB
UExJQ194TVNJQ0ZHQUREUl9QUE5fU0hJRlQpOwo+ICsgICAgICAgICAgICAgICBpZiAoQVBMSUNf
eE1TSUNGR0FERFJIX0hIWFNfTUFTSyA8IG1jLT5oaHhzKSB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZGV2X2VycihkZXYsICJJTVNJQyBncm91cCBpbmRleCBzaGlmdCBiaWcgZm9yIEFQTElD
IEhIWFNcbiIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsg
ICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICBtYy0+
aGh4cyA9IDA7CgpUaGUgSU1TSUMgZHJpdmVyIGFscmVhZHkgZW5zdXJlcyB0aGF0IGdyb3VwX2lu
ZGV4X3NoaWZ0IGlzIGF0bGVhc3QgMjQKaXJyZXNwZWN0aXZlIHRvIHRoZSB2YWx1ZSBvZiBncm91
cF9pbmRleF9iaXRzIHNvIHRoaXMgY2hhbmdlIGlzIG5vdCBuZWVkZWQKYmVjYXVzZSBpbiB0aGUg
ImJpdHMgKyBzaGlmdCAtIDEiIHRoZSBzaGlmdCBpcyBhbHdheXMgPj0gMjQuCgo+ICAgICAgICAg
fQo+Cj4gICAgICAgICAvKiBDb21wdXRlIFBQTiBiYXNlICovCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtaW1zaWMtc3RhdGUuYwo+IGluZGV4IDk1MDVkZGJkLi40NGI5YzM0YyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiArKysgYi9kcml2
ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiBAQCAtNzQxLDEwICs3NDEsMTIg
QEAgc3RhdGljIGludCBfX2luaXQgaW1zaWNfcGFyc2VfZndub2RlKHN0cnVjdCBmd25vZGVfaGFu
ZGxlICpmd25vZGUsCj4gICAgICAgICB9Cj4KPiAgICAgICAgIC8qIFNhbml0eSBjaGVjayBncm91
cCBpbmRleCBzaGlmdCAqLwo+IC0gICAgICAgaSA9IGdsb2JhbC0+Z3JvdXBfaW5kZXhfYml0cyAr
IGdsb2JhbC0+Z3JvdXBfaW5kZXhfc2hpZnQgLSAxOwo+IC0gICAgICAgaWYgKGkgPj0gQklUU19Q
RVJfTE9ORykgewo+IC0gICAgICAgICAgICAgICBwcl9lcnIoIiVwZndQOiBncm91cCBpbmRleCBz
aGlmdCB0b28gYmlnXG4iLCBmd25vZGUpOwo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiArICAgICAgIGlmIChnbG9iYWwtPmdyb3VwX2luZGV4X2JpdHMpIHsKPiArICAgICAgICAg
ICAgICAgaSA9IGdsb2JhbC0+Z3JvdXBfaW5kZXhfYml0cyArIGdsb2JhbC0+Z3JvdXBfaW5kZXhf
c2hpZnQgLSAxOwo+ICsgICAgICAgICAgICAgICBpZiAoaSA+PSBCSVRTX1BFUl9MT05HKSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCIlcGZ3UDogZ3JvdXAgaW5kZXggc2hpZnQg
dG9vIGJpZ1xuIiwgZndub2RlKTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiArICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+Cj4gICAgICAgICAvKiBTYW5p
dHkgY2hlY2sgbnVtYmVyIG9mIGludGVycnVwdCBpZGVudGl0aWVzICovCj4gQEAgLTc3Myw4ICs3
NzUsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBpbXNpY19wYXJzZV9md25vZGUoc3RydWN0IGZ3bm9k
ZV9oYW5kbGUgKmZ3bm9kZSwKPiAgICAgICAgIGdsb2JhbC0+YmFzZV9hZGRyICY9IH5HRU5NQVNL
KGdsb2JhbC0+Z3Vlc3RfaW5kZXhfYml0cyArCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZ2xvYmFsLT5oYXJ0X2luZGV4X2JpdHMgKwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIElNU0lDX01NSU9fUEFHRV9TSElGVCAtIDEsIDApOwo+IC0g
ICAgICAgZ2xvYmFsLT5iYXNlX2FkZHIgJj0gfigoQklUKGdsb2JhbC0+Z3JvdXBfaW5kZXhfYml0
cykgLSAxKSA8PAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnbG9iYWwtPmdyb3Vw
X2luZGV4X3NoaWZ0KTsKPiArICAgICAgIGlmIChnbG9iYWwtPmdyb3VwX2luZGV4X2JpdHMpCj4g
KyAgICAgICAgICAgICAgIGdsb2JhbC0+YmFzZV9hZGRyICY9IH4oKEJJVChnbG9iYWwtPmdyb3Vw
X2luZGV4X2JpdHMpIC0gMSkgPDwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBnbG9iYWwtPmdyb3VwX2luZGV4X3NoaWZ0KTsKClRoZXJlIGlzIG5vdGhpbmcgdG8gYmUg
Zml4ZWQgaGVyZS4KCkZvciBncm91cF9pbmRleF9iaXRzID09IDAsIEJJVChncm91cF9pbmRleF9i
aXRzKSAtIDEgd2lsbCBiZSB6ZXJvCmFuZCAwIDw8IGFueV9zaGlmdF92YWx1ZSB3aWxsIGJlIDAu
IEluIG90aGVyIHdvcmRzLCBnbG9iYWwtPmJhc2VfYWRkcgp3b24ndCBjaGFuZ2Ugd2hlbiBncm91
cF9pbmRleF9iaXRzID09IDAuCgo+Cj4gICAgICAgICAvKiBGaW5kIG51bWJlciBvZiBNTUlPIHJl
Z2lzdGVyIHNldHMgKi8KPiAgICAgICAgIHdoaWxlICghaW1zaWNfZ2V0X21taW9fcmVzb3VyY2Uo
Zndub2RlLCAqbnJfbW1pb3MsICZyZXMpKQo+IEBAIC04NTQsOCArODU3LDkgQEAgaW50IF9faW5p
dCBpbXNpY19zZXR1cF9zdGF0ZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLCB2b2lkICpv
cGFxdWUpCj4gICAgICAgICAgICAgICAgIGJhc2VfYWRkciAmPSB+R0VOTUFTSyhnbG9iYWwtPmd1
ZXN0X2luZGV4X2JpdHMgKwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z2xvYmFsLT5oYXJ0X2luZGV4X2JpdHMgKwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgSU1TSUNfTU1JT19QQUdFX1NISUZUIC0gMSwgMCk7Cj4gLSAgICAgICAgICAgICAg
IGJhc2VfYWRkciAmPSB+KChCSVQoZ2xvYmFsLT5ncm91cF9pbmRleF9iaXRzKSAtIDEpIDw8Cj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdsb2JhbC0+Z3JvdXBfaW5kZXhfc2hpZnQp
Owo+ICsgICAgICAgICAgICAgICBpZiAoZ2xvYmFsLT5ncm91cF9pbmRleF9iaXRzKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGJhc2VfYWRkciAmPSB+KChCSVQoZ2xvYmFsLT5ncm91cF9pbmRl
eF9iaXRzKSAtIDEpIDw8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z2xvYmFsLT5ncm91cF9pbmRleF9zaGlmdCk7CgpTYW1lIGNvbW1lbnQgYXMgYWJvdmUuCgo+ICAg
ICAgICAgICAgICAgICBpZiAoYmFzZV9hZGRyICE9IGdsb2JhbC0+YmFzZV9hZGRyKSB7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHByX2VycigiJXBmd1A6IGFkZHJlc3MgbWlzbWF0Y2ggZm9yIHJlZ3NldCAlZFxuIiwgZndu
b2RlLCBpKTsKPgo+IGJhc2UtY29tbWl0OiAxM2NhMWMwYjdkOGEzYWIxZTU5Y2IzZTc4MGMxZGQ3
NDQxZTIyNTE1Cj4KCk92ZXJhbGwsIHRoaXMgcGF0Y2ggZml4ZXMgbm90aGluZy4KClJlZ2FyZHMs
CkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
