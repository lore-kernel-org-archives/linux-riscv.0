Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3029CDB47F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 07:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FcVbUtK1/8lLxACBGrHMmOLTPYvkoeAXVd9s48bhYME=; b=y5FxpOsel1fXYo
	cBTkt+iL/b3vPXtaJ4otk302rMCF4bl7V4FwhArXDCLIbK/ztNZAVnd4wtZHcAIhIBykevotLHIKQ
	WOp7M4402Jm/uABB1eXOeGfd1D90snGJdXxqO+cAxNHjJWHQLVkBOWg/ADhxJObhvIEpNLyQobTXr
	mZKsWYAczkYPjBYHQGK1hUTbjTjiXzHnTZCvshlbuy/nnetEnOajFTCtP4pcU5PHkyPZxlcYLiRIN
	zZ7QRxbLaKFmE2CHsC8uGTFEwMDYSscaJ087pgQVqpt6PNA999uMa6Zd0If/EEOpdsZS5r8YVgZKE
	tU9f4M6eHrZC7C0vs+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceGp-00000008kOb-17JD;
	Thu, 25 Jun 2026 07:13:07 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceGn-00000008kOF-25T9
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 07:13:06 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-bebb72b845aso412283066b.3
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jun 2026 00:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782371583; cv=none;
        d=google.com; s=arc-20260327;
        b=ktH/P2ZYBwiArR4cqNOndC6h+wSbiH1JKESTAcop1NP9SkQpnXcTCJwWgPd0F2KSHH
         Yj7hIgYihvr/juv1AQRGwR6gFf1XYJ2LgvAtfG4Mwhq0KN8LJbfhwWOuX5QVKXniy3fF
         dAJNIuZtSI+gK8MtuIH6BvG+OoKJO4Buc1ytloEZuzLbYg0DAb9/Rcek1ga+Yyl2urjS
         PWDBtnWKi453XzIzVMPukfF9JPnPokhVRAlSo3jlYAmd75SYycX0vYg+6t2n6U+8Dpfg
         DGZbyE9PXfqSZPOgIcjikpIo9Nab3njpsHVKxEKmQ5d52l1Is8IwEB+zyrJKvYi9GHHF
         40lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lD+bsFDN/w3G1ptzVJtRCyjro+q4S2V6FARevsGcXdc=;
        fh=RQyASGEp2xd5IyjGdocg7QOOhIjSk20+RDCHzEtfsqc=;
        b=L3+zgW112Tt7QFItP2o4MR841sDqhrbcVy8auGLh+924vc0Cp0BxpAuxatFsUjuBhJ
         jp6N1WmuhXf5YEW3zQtfOws4jFbWwBu0Z/BzJINqiF6l2s4jxCV1XDxyEYtrCq5kI4rM
         V82fsdUG9XCZzcS+KMSazCZRvHvOf1Ia7n2MPPwLZm4+rXqtcgMgPknIstn9Ut9n7jE+
         IVD/wqsp2OL3STqgXA20DAVTRxs8V/t/InsdoiiJHL3oUnyaEVaYTR2nLPYb21RLpLWG
         0l1mrdhyLhpzUVp3w7ZGHIbPAfCBKIHNWGHR+Lz/McrlhRcZeDByMovmy/B19NxNYyQX
         Rg1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782371583; x=1782976383; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lD+bsFDN/w3G1ptzVJtRCyjro+q4S2V6FARevsGcXdc=;
        b=aulPZD3CFTdd2bSWTKqNsg5P+SM5l6itZSL6HABoyBF/RHxXYbVaamC6IiBEZbp2v8
         TdI2qs+iojkMZ7uI0s8y4ZN9f+vwxA8rsv4ireAxe7DpF4j1JUszoBt74/FkRzfvPv0C
         w8KTjAzfnDnBkwEjExYf4CpUfcsfoXTvJQjo8/x47VgJGf9gBfpjU+lN7g/nfVqfCwSF
         FmUcguwPg6OIZpAJBu5iah0caigp6RzBjxtd4cXWf7xS6DWuLwvvcoBHxTFSwgQ+y1cr
         Oh14ecQGl7Bzt2LEAinKEsXEqJjwAX/ORjUfbELfCM/UiazBI+GPoyz6v4uzpVxJ5NZb
         VbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371583; x=1782976383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lD+bsFDN/w3G1ptzVJtRCyjro+q4S2V6FARevsGcXdc=;
        b=SN9z+wP/Lh/2r6/KzQXnNgTyugU8zolf1ndMuB3creKqpeFi86lLkvUwVb2fPPgcyj
         BlJc0iPDlXAgtxnWsmmrAFHQBF31vva+XNC69RpzNc4shqsd5Qa0h4UGM3VGzynbaTvB
         ow55+8r97OeGBIBunKyWSlSzQOw/xG5M+nYn6Q0SkZ7ng0rladumTFQNnKl2yWcOM/zT
         Ex/ra+/5yfhXph+qdXOffm2lrBT9MxzcTBCFsSUov4cyUZQ76zA4MR2JLGwgdHubV/tw
         enzJjsg2Dko3YdeWwmlS3w7SJvAm9UB+EZ07cXgSp0da5U8O83mwglG3xauxxJK73lXB
         mbbA==
X-Forwarded-Encrypted: i=1; AHgh+RqDQvNKOL/pJOrg2wn85XAu5xoCGRoBCneMWMxegjOvXcLQft8uvHy7w03NkqR2v3YrZr/BwybY1eTwbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YweRqKZBL71XuLWjQoBO+/b97lJN66qeoIeZNQ4U5jWJDI/wSGp
	ebUoR+zwBJSKWfBfGm7FYz1slxi4UAecRgaUV18ql3ZyLpNs/sx9GI8aCG0XPDF+O7CqcAVNWhz
	L6VW11Os8y4EBSp63sGHPZltXCTqgEHOsZxUgC0f/gA==
X-Gm-Gg: AfdE7cnfjYCpUpA3cTSwp0VuBm1DKIbzUvTjWyn0vYS1HmDcgXIOo7j8ivAjdJU7UOM
	H/bd8nh2vn+u13D8W1c3jqhkrNpmS816I6ag00We11xb76qbzZaDY9hfRvgWpvt/YN600KhHj8R
	ZRZRrVyRx42df4IAqFQtJMoZRplfRmSrskskM6lcP+TwR6Ma04gQjJz3xyP+LIXWbhsnMICj0/x
	/ifz+olDWhEcdTsaqA4NEEkmBhzX+2uVJAiwKMrob9UwjfATilrK8k4JKPaZpONQM2g9oKBy6Sm
	nBOChScj0A==
X-Received: by 2002:a17:906:eec1:b0:c0d:43b2:e8e7 with SMTP id
 a640c23a62f3a-c1205ee0e4bmr67586366b.35.1782371582786; Thu, 25 Jun 2026
 00:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260623081902.589810-1-zong.li@sifive.com> <20260624140752.31155-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260624140752.31155-1-fangyu.yu@linux.alibaba.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 25 Jun 2026 15:12:50 +0800
X-Gm-Features: AVVi8CczPZyncIuLXLfmlO7dY8kTC6oJKg1-nkVpDJdk7V-MF_vWEokLL9oEOro
Message-ID: <CANXhq0pw5TPSD+p3YnTyEHQTSB-3jmAp3bzRSXvHdVjvevfL7w@mail.gmail.com>
Subject: Re: [PATCH] iommu/riscv: Replace illegal command with dummy IOFENCE
 to prevent hardware lockup
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, iommu@lists.linux.dev, 
	joro@8bytes.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
	robin.murphy@arm.com, tomasz.jeznach@linux.dev, will@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_001305_612729_C8A6E601 
X-CRM114-Status: GOOD (  37.38  )
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

T24gV2VkLCBKdW4gMjQsIDIwMjYgYXQgMTA6MDjigK9QTSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJh
YmEuY29tPiB3cm90ZToKPgo+ID5XaGVuIHRoZSBSSVNDLVYgSU9NTVUgZW5jb3VudGVycyBhbiBp
bGxlZ2FsIGNvbW1hbmQsIHRoZSBoYXJkd2FyZQo+ID5zdG9wcyBwcm9jZXNzaW5nIGFuZCB0aGUg
SEVBRCByZWdpc3RlciByZW1haW5zIHBvaW50aW5nIGF0IHRoZQo+ID5pbGxlZ2FsIGNvbW1hbmQu
IElmIHNvZnR3YXJlIGRvZXMgbm90IGhhbmRsZSB0aGlzIHByb3Blcmx5LCB0aGUKPiA+aGFyZHdh
cmUgd2lsbCBiZSBzdHVjayBhdCB0aGlzIGluZGV4IGluZGVmaW5pdGVseSwgcHJldmVudGluZyBh
bnkKPiA+ZnVydGhlciBjb21tYW5kIHF1ZXVlIG9wZXJhdGlvbnMuCj4gPgo+ID5UaGlzIHBhdGNo
IGltcGxlbWVudHMgYSByZWNvdmVyeSBtZWNoYW5pc20gYnkgcmVwbGFjaW5nIHRoZSBpbGxlZ2Fs
Cj4gPmNvbW1hbmQgd2l0aCBhIGR1bW15IElPRkVOQ0UgaW5zdHJ1Y3Rpb24gKGFsbCBvcGVyYW5k
cyBhcmUgemVybyk6Cj4gPgo+ID4xLiBQcmV2ZW50cyBoYXJkd2FyZSBsb2NrdXA6IEJ5IG92ZXJ3
cml0aW5nIHRoZSBpbGxlZ2FsIGNvbW1hbmQgd2l0aAo+ID4gICBhIHZhbGlkIGluc3RydWN0aW9u
LCB0aGUgaGFyZHdhcmUgY2FuIGNvbnRpbnVlIHByb2Nlc3NpbmcgZnJvbSB0aGUKPiA+ICAgY3Vy
cmVudCBwb3NpdGlvbiBpbnN0ZWFkIG9mIGJlaW5nIHN0dWNrLgo+ID4KPiA+Mi4gRW5hYmxlcyB1
c2VyIHJlY292ZXJ5OiBBZnRlciByZXBsYWNpbmcgdGhlIGlsbGVnYWwgY29tbWFuZCwgdGhlCj4g
PiAgIHVzZXIvZHJpdmVyIGhhcyBhbiBvcHBvcnR1bml0eSB0byByZXRyeSB0aGUgb3JpZ2luYWwg
ZmFpbGVkCj4gPiAgIG9wZXJhdGlvbiByYXRoZXIgdGhhbiBsb3NpbmcgYWxsIHF1ZXVlZCB3b3Jr
Lgo+ID4KPiA+My4gTWluaW1hbCBoYXJkd2FyZSBpbXBhY3Q6IEEgZHVtbXkgSU9GRU5DRSBiZWhh
dmVzIGFzIGEgTk9QLCBpdAo+ID4gICBpdCBwZXJmb3JtcyBubyBjYWNoZSBpbnZhbGlkYXRpb24g
b3BlcmF0aW9ucyBhbmQgaGFzIG5vIHNpZGUKPiA+ICAgZWZmZWN0cyBvbiB0aGUgc3lzdGVtIHN0
YXRlLiBUaGlzIGlzIHRoZSBzYWZlc3QgcmVwbGFjZW1lbnQKPiA+ICAgaW5zdHJ1Y3Rpb24uCj4g
Pgo+ID5TaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPi0tLQo+
ID4gZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysr
KystCj4gPiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ID4KPiA+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyBiL2RyaXZlcnMv
aW9tbXUvcmlzY3YvaW9tbXUuYwo+ID5pbmRleCBjZWMzZGRkN2FiMTAuLjYzMDVlYzVmNDY3YiAx
MDA2NDQKPiA+LS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4gPisrKyBiL2RyaXZl
cnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+ID5AQCAtNDY0LDEzICs0NjQsMzUgQEAgc3RhdGljIHVu
c2lnbmVkIGludCByaXNjdl9pb21tdV9xdWV1ZV9zZW5kKHN0cnVjdCByaXNjdl9pb21tdV9xdWV1
ZSAqcXVldWUsCj4gPiBzdGF0aWMgaXJxcmV0dXJuX3QgcmlzY3ZfaW9tbXVfY21kcV9wcm9jZXNz
KGludCBpcnEsIHZvaWQgKmRhdGEpCj4gPiB7Cj4gPiAgICAgICBjb25zdCBzdHJ1Y3QgcmlzY3Zf
aW9tbXVfcXVldWUgKnF1ZXVlID0gKHN0cnVjdCByaXNjdl9pb21tdV9xdWV1ZSAqKWRhdGE7Cj4g
Pi0gICAgICB1bnNpZ25lZCBpbnQgY3RybDsKPiA+KyAgICAgIHN0cnVjdCByaXNjdl9pb21tdV9j
b21tYW5kIGNtZDsKPiA+KyAgICAgIHVuc2lnbmVkIGludCBjdHJsLCBoZWFkOwo+ID4KPiA+ICAg
ICAgIC8qIENsZWFyIE1GL0NRIGVycm9ycywgY29tcGxldGUgZXJyb3IgcmVjb3ZlcnkgdG8gYmUg
aW1wbGVtZW50ZWQuICovCj4gPiAgICAgICBjdHJsID0gcmlzY3ZfaW9tbXVfcmVhZGwocXVldWUt
PmlvbW11LCBxdWV1ZS0+cWNyKTsKPiA+ICAgICAgIGlmIChjdHJsICYgKFJJU0NWX0lPTU1VX0NR
Q1NSX0NRTUYgfCBSSVNDVl9JT01NVV9DUUNTUl9DTURfVE8gfAo+ID4gICAgICAgICAgICAgICAg
ICAgUklTQ1ZfSU9NTVVfQ1FDU1JfQ01EX0lMTCB8IFJJU0NWX0lPTU1VX0NRQ1NSX0ZFTkNFX1df
SVApKSB7Cj4gPisgICAgICAgICAgICAgIC8qCj4gPisgICAgICAgICAgICAgICAqIFRoZSBoZWFk
IHBvaW50ZXIgaXMgbm90IHVwZGF0ZWQgYnkgdGhlIGhhcmR3YXJlLCBpdAo+ID4rICAgICAgICAg
ICAgICAgKiBzdGlsbCBwb2ludHMgdG8gdGhlIGluZGV4IG9mIGlsbGVnYWwgY29tbWFuZAo+ID4r
ICAgICAgICAgICAgICAgKi8KPiA+KyAgICAgICAgICAgICAgcmlzY3ZfaW9tbXVfcmVhZGxfdGlt
ZW91dChxdWV1ZS0+aW9tbXUsIFFfSEVBRChxdWV1ZSksIGhlYWQsCj4gPisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIShoZWFkICYgfnF1ZXVlLT5tYXNrKSwgMCwKPiA+
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSSVNDVl9JT01NVV9RVUVV
RV9USU1FT1VUKTsKPiA+Kwo+ID4rICAgICAgICAgICAgICBpZiAoY3RybCAmIFJJU0NWX0lPTU1V
X0NRQ1NSX0NNRF9JTEwpIHsKPiA+KyAgICAgICAgICAgICAgICAgICAgICAvKgo+ID4rICAgICAg
ICAgICAgICAgICAgICAgICAqIFVzZSBhIGR1bW15IElPRkVOQ0UgaW5zdGVhZCBvZiB0aGUgaWxs
ZWdhbCBjb21tYW5kCj4gPisgICAgICAgICAgICAgICAgICAgICAgICogdG8gcHJldmVudCBoYXJk
d2FyZSBsb2NrdXAKPiA+KyAgICAgICAgICAgICAgICAgICAgICAgKi8KPgo+IFRoZSBSSVNDLVYg
SU9NTVUgc3BlYyAxLjAgKFNlY3Rpb24gNS4xNSwgY3Fjc3IpIHN0YXRlczoKPgo+ICAgIklmIHNv
ZnR3YXJlIG1ha2VzIHRoZSBDUSBvcGVyYXRpb25hbCBhZ2FpbiBhZnRlciBhIGNtZF9pbGwgb3IK
PiAgICBjcW1mIGVycm9yLCB0aGVuIHNvZnR3YXJlIHNob3VsZCByZXN1Ym1pdCB0aGUgY29tbWFu
ZHMgc3VibWl0dGVkCj4gICAgc2luY2UgdGhlIGxhc3QgSU9GRU5DRS5DIHRoYXQgc3VjY2Vzc2Z1
bGx5IGNvbXBsZXRlZC4iCj4KPiBTbyBpdCBzZWVtcyB0aGF0IHNpbXBseSByZXBsYWNpbmcgdGhl
IGlsbGVnYWwgY29tbWFuZCBhbmQgbGV0dGluZyB0aGUKPiBxdWV1ZSBjb250aW51ZSBpcyBub3Qg
c3VmZmljaWVudC4KPgoKWWVzLCB0aGlzIHBhdGNoIGRvZXNuJ3QgY29tcGxldGx5IGZvbGxvdyB3
aGF0IHRoZSBzcGVjIG1lbnRpb25lZC4KSW5pdGlhbGx5LCBJIHdhbnRlZCB0byBpbXBsZW1lbnQg
dGhlIG1ldGhvZCBzdWdnZXN0ZWQgYnkgdGhlIHNwZWMuCkhvd2V2ZXIsIHRoZXJlIGFyZSBzb21l
IHN5bmNocm9uaXphdGlvbiBjaGFsbGVuZ2VzIGJhc2VkIG9uIGN1cnJlbnQKZHJpdmVyIGltcGxl
bWVudGF0aW9uLiBUaGVyZWZvcmUsIEkgY2hvc2UgYW4gYXBwcm9hY2ggc2ltaWxhciB0byBvdGhl
cgpJT01NVSBkcml2ZXJzIChsaWtlIFNNTVUgYW5kIEludGVsIFZULWQpLiBUaGUgbWFpbiBnb2Fs
IGlzIHRvIGF0IGxlYXN0CnByZXZlbnQgdGhlIGhhcmR3YXJlIGZyb20gZ2V0dGluZyBzdHVjayBh
bmQgY3Jhc2hpbmcgdGhlIGVudGlyZQpzeXN0ZW0uCgpIZXJlIGFyZSB0aGUgbWFpbiBpc3N1ZXMg
d2Ugd291bGQgbmVlZCB0byBzb2x2ZSBpZiB3ZSBmdWxseSBmb2xsb3cgdGhlIHNwZWM6CgoxLiBJ
T0ZFTkNFIGluZGV4IHNoaWZ0OiBBZnRlciBhbiBpbGxlZ2FsIGNvbW1hbmQsIGlmIGFub3RoZXIg
dGhyZWFkIGlzCndhaXRpbmcgZm9yIHN1YnNlcXVlbnQgSU9GRU5DRSB0byBmaW5pc2gsIHJlLXN1
Ym1pdHRpbmcgY29tbWFuZHMgd2lsbApjaGFuZ2UgdGhhdCBJT0ZFTkNFJ3MgaW5kZXggaW4gdGhl
IHF1ZXVlLiBUaGlzIG1lYW5zIHRoZSB3YWl0aW5nCnRocmVhZCBpbiAncmlzY3ZfaW9tbXVfY21k
X3N5bmMnIG1pZ2h0IGZpbmlzaCB0b28gZWFybHkgYmVjYXVzZSB0aGUKJ3Byb2QnIHZhbHVlIHNo
b3VsZCBiZSBjaGFuZ2VkIGFzIHdlbGwuIFdlIGNvdWxkIGZpeCB0aGlzIGJ5IG1ha2luZwpJT0ZF
TkNFIHdyaXRlIGEgc2VxdWVuY2UgbnVtYmVyIHRvIGEgc3BlY2lmaWMgYWRkcmVzcywgYW5kIGhh
dmluZyB0aGUKdGhyZWFkIHdhaXQgZm9yIHRoYXQgZGF0YSBpbnN0ZWFkLgoKMi4gVGltZW91dCBl
cnJvcnM6IElmIGFuIGlsbGVnYWwgY29tbWFuZCBoYXBwZW5zIHdoaWxlIGFub3RoZXIgdGhyZWFk
CmlzIHRyeWluZyB0byB3cml0ZSBhIGNvbW1hbmQsIHRoYXQgdGhyZWFkIG1pZ2h0IGJlIHdhaXRp
bmcgZm9yIHRoZQp0YWlsIHRvIG1vdmUgKGluICdyaXNjdl9pb21tdV9xdWV1ZV9zZW5kJyksIGFu
ZCBleGl0IHRoZSB3YWl0IGR1ZSB0byBhCnRpbWVvdXQuIFRoaXMgbGVhZHMgdG8gZXJyb3JzIGlu
IHRoZSBjYWxsZXIgc3Vic3lzdGVtIChsaWtlIERNQSkuIFNvCml0IHNlZW1zIGV2ZW4gaWYgdGhl
IHJlc3VibWl0IGZpbmlzaGVzIGxhdGVyLCBpdCBtaWdodCBub3QgaGVscCBtdWNoLgoKMy4gUXVl
dWUgdGFpbCBtaXNtYXRjaDogU2ltaWxhciB0byBwb2ludCAyIHNpdHVhdGlvbiwgYSB0aHJlYWQg
d2FpdGluZwppbiAncmlzY3ZfaW9tbXVfcXVldWVfc2VuZCcgZXhwZWN0cyBwcm9kID09IHF1ZXVl
LT50YWlsLiBJZiB3ZQpyZS1zdWJtaXQgY29tbWFuZHMgcXVpY2tseSwgcXVldWUtPnRhaWwgaXMg
dXBkYXRlZCBhc3luY2hyb25vdXNseSB0byBhCmZhcnRoZXIgdmFsdWUuIFRoZSB3YWl0aW5nIHRo
cmVhZCBtaWdodCBuZXZlciBzZWUgdGhlIGNvbmRpdGlvbiBtZXQKYW5kIHRpbWUgb3V0LgoKNC4g
U2hhZG93IHF1ZXVlIG92ZXJoZWFkOiBJbnNpZGUgdGhlIHRocmVhZGluZyBJUlEgaGFuZGxlciwg
d2UgY2Fubm90CmVhc2lseSBrbm93IHdoYXQgdGhlIGlsbGVnYWwgY29tbWFuZCB3YXMganVzdCBi
eSBjaGVja2luZyB0aGUgY3VycmVudApjb21tYW5kIHF1ZXVlLiBXZSB3b3VsZCBuZWVkIHRvIGNy
ZWF0ZSBhICJzaGFkb3cgY29tbWFuZCBxdWV1ZSIgdG8Ka2VlcCBhIGhpc3RvcnkuIFRoaXMgd291
bGQgYnJlYWsgdGhlIGN1cnJlbnQgZHJpdmVyIGRlc2lnbi4gV2Ugd291bGQKYWxzbyBuZWVkIHRv
IGFkZCBsb2NrcyB0byBwcmV2ZW50IHJhY2UgY29uZGl0aW9ucyBvbiBzaGFkb3cgY29tbWFuZApx
dWV1ZSwgd2hpY2ggd291bGQgcmVkdWNlIHRoZSBkcml2ZXIncyBwZXJmb3JtYW5jZS4KCkNvbnNp
ZGVyaW5nIHRoZXNlIHRyYWRlLW9mZnMsIEkgcHJlZmVyIG5vdCB0byBtYWtlIHRoZSBkcml2ZXIg
bXVjaAptb3JlIGNvbXBsZXggYW5kIHNsb3dlciBqdXN0IHRvIGhhbmRsZSByYXJlIGhhcmR3YXJl
IGVycm9ycy4KUGVyc29uYWxseSwgSSBsZWFuIHRvd2FyZHMgdHJlYXRpbmcgdGhpcyBoYXJkd2Fy
ZSBmYXVsdCBhcyBhIGZhdGFsCmVycm9yIHdpdGhvdXQgdHJ5aW5nIHRvIHJlY292ZXIgaXQgaW4g
c29mdHdhcmUuIEhvd2V2ZXIsIEkgdW5kZXJzdGFuZAp0aGlzIG1pZ2h0IGJlIHRvbyBleHRyZW1l
IGFuZCB3b3VsZCByZXF1aXJlIGEgaGFyZHdhcmUgcmVzZXQuClRoZXJlZm9yZSwgdGhpcyBwYXRj
aCBtaWdodCBiZSBhIGdvb2QgbWlkZGxlIGdyb3VuZC4gSXQgcHJldmVudHMgdGhlCmhhcmR3YXJl
IGxvY2t1cC4gRXZlbiB0aG91Z2ggd2UgbWlnaHQgbG9zZSBzb21lIGNvbW1hbmRzIGFuZCBjYXVz
ZQppbmNvcnJlY3QgcmVzdWx0cyBmb3IgdGhlIHVzZXIsIGl0IGF0IGxlYXN0IGtlZXBzIHRoZSBz
eXN0ZW0gYWxpdmUgYW5kCmdpdmVzIHRoZSB1c2VyIGEgY2hhbmNlIHRvIHJldHJ5IHRoZWlyIG9w
ZXJhdGlvbiBhZ2Fpbi4KCgo+IFRoYW5rcywKPiBGYW5neXUKPgo+ID4rICAgICAgICAgICAgICAg
ICAgICAgIG1lbXNldCgmY21kLCAwLCBzaXplb2YoY21kKSk7Cj4gPisgICAgICAgICAgICAgICAg
ICAgICAgY21kLmR3b3JkMCA9IEZJRUxEX1BSRVAoUklTQ1ZfSU9NTVVfQ01EMF9PUENPREUsCj4g
PisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUklTQ1ZfSU9N
TVVfQ01EX0lPRkVOQ0VfT1BDT0RFKTsKPiA+KyAgICAgICAgICAgICAgICAgICAgICBtZW1jcHko
cXVldWUtPmJhc2UgKyBoZWFkICogc2l6ZW9mKGNtZCksICZjbWQsIHNpemVvZihjbWQpKTsKPiA+
KyAgICAgICAgICAgICAgICAgICAgICBkbWFfd21iKCk7Cj4gPisgICAgICAgICAgICAgIH0KPiA+
Kwo+ID4gICAgICAgICAgICAgICByaXNjdl9pb21tdV93cml0ZWwocXVldWUtPmlvbW11LCBxdWV1
ZS0+cWNyLCBjdHJsKTsKPiA+Kwo+ID4gICAgICAgICAgICAgICBkZXZfd2FybihxdWV1ZS0+aW9t
bXUtPmRldiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIlF1ZXVlICMldSBlcnJvcjsgZmF1
bHQ6JWQgdGltZW91dDolZCBpbGxlZ2FsOiVkIGZlbmNlX3dfaXA6JWRcbiIsCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgIHF1ZXVlLT5xaWQsCj4gPi0tCj4gPjIuNDMuNwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
