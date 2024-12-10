Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EEEE7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NYs76qmBtuJa721O+UujO6r+Yc4AvUV5lm9nupAgEw=; b=RbeEvkv7TXNDbF
	1W8PvCy0b/wtmz7gWxpl1ssi9giwdDKZnwCxrqSH6vo6SWuCu+6IOE7uMXkfCjKhnHHmHD/XECZXp
	fqYP7lWD2TweuwBmyBxR+tRYiC9bN6Dz5W8wisQqIVAxAGNcQuqTCvFkTorVvxyhl/ucgNNhh6uZT
	PDHyI9E1phOlYSic8zmyiJ4TXjykC6tayszjFLUZxZGSbOoItwLJgQN0h2eoh03hQHWkpll/1H4SN
	4eaZ8OoaRfaz8ZMHqXzuW2HpHOHvk6MwG5rpGEJ/yQNQ4mYqvY3by94Ts1btsoaCdv/pJOazzc86V
	/sT+LPt67JMbByjwamZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKv5E-0000000Acao-1dV3;
	Tue, 10 Dec 2024 07:55:04 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKv5B-0000000AcZj-0dhv
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 07:55:02 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-29ff8053384so227782fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2024 23:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733817296; x=1734422096; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPQvSbygqgIrExnr2bcxHFawcj0mKCE45rlYtPqLVSE=;
        b=Gf0B5yCUSxb15xt2Mw3oa7onz9ZkdKgxmPpJ3XSRSweR2oBNsMLjorC0Ms/GqKHzow
         2bKNIVfajzOuP7iQ1XQ2P5fBFrJeuPBw7oNKA/7oqFwniU8Q3Ivc1+YKY06hsixjVxX7
         HGSwWwKrpA53S/Aytr4focuMrWFlm7HnWD8q+W6tG0/gTa0VtgCE12xbFRGe8xVjAiw2
         GO2o6ch4e9XZlDG36K3f8UUH9Ilv9DDcAL0mJBwfEuqqH5JBkq3qUtMoC2O+ol+MlVTH
         YbHyjCFAX35Wz61RhDfdzbeIKxKrQNfX0GEQ0GjEZyROwYsoj2toVBzdg/glUB1T1P9T
         PVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733817296; x=1734422096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPQvSbygqgIrExnr2bcxHFawcj0mKCE45rlYtPqLVSE=;
        b=KjbhC3qfWrY6MLwW76eWupqLh1ocGEZtOLomOjdj3vExZLgqxtDRGb71CJutvAKkUE
         Ys7fxOD5lDiW7/nRSTx/PBtS38luIRqpUP+216jrw8BuAeKOWESnKibLGj63WGTJqiZB
         sGIQfO1i1GvmUXNJUj7JxNZuAf0fOCslsBzGAfYGnp9PKB4anHaT7DvG5rmVXZ4dEnef
         lsLBwDJa09nLqgySWLkmImV5VF/rvEhNmSXtM+vujkz42F1wxuApY+RnmWvIGuOaeK5h
         fckbCqfSSEe70gCK/lRHK87f/24iFFwf2fSM4FmBzoF875RUpFfxHMBG9EShdJFMVoDS
         I/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWOiatJ6zyMNCZbIiE/kXlYyRvjsb0TDoao9Y4c+kZD33z0/hn+FAnCs+3gxsmpY5hveUxqquJDyKCpTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8jxSSpAf+ABldrS5uhgE/LJvyZgOrs0Q3v+A3RPQHLVDpk+X9
	nE9ktBkdczrhhwdy7n6T+qT6Prep9lJEk9zFnJQs0FYNQ31Wwk+r3lqZyaz4V02YtCFPntU+wax
	meAQGLLw5Pq3J260Hqc823cKg6tsS7N/78ZXfvgzYgHsY/iD0wqzIiw==
X-Gm-Gg: ASbGncv/MqQl4QHR2KPJJMO/5OzdCXs1+5DOx7UO7Vgm4gRcpV7PaHySgqhByTLEicp
	xTk/fGILSiGadOap9TSa7oPMW0MLmB4XV46/90Q==
X-Google-Smtp-Source: AGHT+IEtSPr48pGU/X+eSQ59PgbAI2DXvJGXJO+Mwo2oW/aawM83bRTg9TYcK3/pr5ZgifHEYZHiB2LUsmyVyglKvrY=
X-Received: by 2002:a05:6870:f78a:b0:296:e88f:8f56 with SMTP id
 586e51a60fabf-29f7389c4e1mr14517090fac.26.1733817296059; Mon, 09 Dec 2024
 23:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20240614142156.29420-1-zong.li@sifive.com> <20240614142156.29420-3-zong.li@sifive.com>
In-Reply-To: <20240614142156.29420-3-zong.li@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 10 Dec 2024 15:54:45 +0800
Message-ID: <CAEEQ3wmccVW0ApAxeGM97XS7BH3khuzRK=wAhg5En3BjEKNnvw@mail.gmail.com>
Subject: Re: [External] [RFC PATCH v2 02/10] iommu/riscv: support HPM and
 interrupt handling
To: Zong Li <zong.li@sifive.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgg@ziepe.ca, kevin.tian@intel.com, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, luxu.kernel@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_235501_197319_F93EE007 
X-CRM114-Status: GOOD (  21.67  )
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

QWRkIEx1eHUgaW4gdGhlIGxvb3AuCgpPbiBGcmksIEp1biAxNCwgMjAyNCBhdCAxMDoyMuKAr1BN
IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGluaXRp
YWxpemUgdGhlIHBtdSBzdHVmZiBhbmQgdW5pbml0aWFsaXplIGl0IHdoZW4gZHJpdmVyCj4gcmVt
b3ZpbmcuIFRoZSBpbnRlcnJ1cHQgaGFuZGxpbmcgaXMgYWxzbyBwcm92aWRlZCwgdGhpcyBoYW5k
bGVyIG5lZWQgdG8KPiBiZSBwcmltYXJ5IGhhbmRsZXIgaW5zdGVhZCBvZiB0aHJlYWQgZnVuY3Rp
b24sIGJlY2F1c2UgcHRfcmVncyBpcyBlbXB0eQo+IHdoZW4gdGhyZWFkaW5nIHRoZSBJUlEsIGJ1
dCBwdF9yZWdzIGlzIG5lY2Vzc2FyeSBieSBwZXJmX2V2ZW50X292ZXJmbG93Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lv
bW11L3Jpc2N2L2lvbW11LmMgfCA2NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jIGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5j
Cj4gaW5kZXggOGI2YTY0YzFhZDhkLi4xNzE2YjIyNTFmMzggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9pb21tdS9yaXNjdi9pb21tdS5jCj4gKysrIGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5j
Cj4gQEAgLTU0MCw2ICs1NDAsNjIgQEAgc3RhdGljIGlycXJldHVybl90IHJpc2N2X2lvbW11X2Zs
dHFfcHJvY2VzcyhpbnQgaXJxLCB2b2lkICpkYXRhKQo+ICAgICAgICAgcmV0dXJuIElSUV9IQU5E
TEVEOwo+ICB9Cj4KPiArLyoKPiArICogSU9NTVUgSGFyZHdhcmUgcGVyZm9ybWFuY2UgbW9uaXRv
cgo+ICsgKi8KPiArCj4gKy8qIEhQTSBpbnRlcnJ1cHQgcHJpbWFyeSBoYW5kbGVyICovCj4gK3N0
YXRpYyBpcnFyZXR1cm5fdCByaXNjdl9pb21tdV9ocG1faXJxX2hhbmRsZXIoaW50IGlycSwgdm9p
ZCAqZGV2X2lkKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21t
dSA9IChzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICopZGV2X2lkOwo+ICsKPiArICAgICAgIC8q
IFByb2Nlc3MgcG11IGlycSAqLwo+ICsgICAgICAgcmlzY3ZfaW9tbXVfcG11X2hhbmRsZV9pcnEo
JmlvbW11LT5wbXUpOwo+ICsKPiArICAgICAgIC8qIENsZWFyIHBlcmZvcm1hbmNlIG1vbml0b3Jp
bmcgaW50ZXJydXB0IHBlbmRpbmcgKi8KPiArICAgICAgIHJpc2N2X2lvbW11X3dyaXRlbChpb21t
dSwgUklTQ1ZfSU9NTVVfUkVHX0lQU1IsIFJJU0NWX0lPTU1VX0lQU1JfUE1JUCk7Cj4gKwo+ICsg
ICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOwo+ICt9Cj4gKwo+ICsvKiBIUE0gaW5pdGlhbGl6YXRp
b24gKi8KPiArc3RhdGljIGludCByaXNjdl9pb21tdV9ocG1fZW5hYmxlKHN0cnVjdCByaXNjdl9p
b21tdV9kZXZpY2UgKmlvbW11KQo+ICt7Cj4gKyAgICAgICBpbnQgcmM7Cj4gKwo+ICsgICAgICAg
aWYgKCEoaW9tbXUtPmNhcHMgJiBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfSFBNKSkKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIHB0X3Jl
Z3MgaXMgZW1wdHkgd2hlbiB0aHJlYWRpbmcgdGhlIElSUSwgYnV0IHB0X3JlZ3MgaXMgbmVjZXNz
YXJ5Cj4gKyAgICAgICAgKiBieSBwZXJmX2V2ZW50X292ZXJmbG93LiBVc2UgcHJpbWFyeSBoYW5k
bGVyIGluc3RlYWQgb2YgdGhyZWFkCj4gKyAgICAgICAgKiBmdW5jdGlvbiBmb3IgUE0gSVJRLgo+
ICsgICAgICAgICoKPiArICAgICAgICAqIFNldCB0aGUgSVJRRl9PTkVTSE9UIGZsYWcgYmVjYXVz
ZSB0aGlzIElSUSBtaWdodCBiZSBzaGFyZWQgd2l0aAo+ICsgICAgICAgICogb3RoZXIgdGhyZWFk
ZWQgSVJRcyBieSBvdGhlciBxdWV1ZXMuCj4gKyAgICAgICAgKi8KPiArICAgICAgIHJjID0gZGV2
bV9yZXF1ZXN0X2lycShpb21tdS0+ZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGlvbW11LT5pcnFzW3Jpc2N2X2lvbW11X3F1ZXVlX3ZlYyhpb21tdSwgUklTQ1ZfSU9NTVVfSVBT
Ul9QTUlQKV0sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmlzY3ZfaW9tbXVfaHBt
X2lycV9oYW5kbGVyLCBJUlFGX09ORVNIT1QgfCBJUlFGX1NIQVJFRCwgTlVMTCwgaW9tbXUpOwo+
ICsgICAgICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAg
ICAgcmV0dXJuIHJpc2N2X2lvbW11X3BtdV9pbml0KCZpb21tdS0+cG11LCBpb21tdS0+cmVnLCBk
ZXZfbmFtZShpb21tdS0+ZGV2KSk7Cj4gK30KPiArCj4gKy8qIEhQTSB1bmluaXRpYWxpemF0aW9u
ICovCj4gK3N0YXRpYyB2b2lkIHJpc2N2X2lvbW11X2hwbV9kaXNhYmxlKHN0cnVjdCByaXNjdl9p
b21tdV9kZXZpY2UgKmlvbW11KQo+ICt7Cj4gKyAgICAgICBpZiAoIShpb21tdS0+Y2FwcyAmIFJJ
U0NWX0lPTU1VX0NBUEFCSUxJVElFU19IUE0pKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4g
Kwo+ICsgICAgICAgZGV2bV9mcmVlX2lycShpb21tdS0+ZGV2LAo+ICsgICAgICAgICAgICAgICAg
ICAgICBpb21tdS0+aXJxc1tyaXNjdl9pb21tdV9xdWV1ZV92ZWMoaW9tbXUsIFJJU0NWX0lPTU1V
X0lQU1JfUE1JUCldLAo+ICsgICAgICAgICAgICAgICAgICAgICBpb21tdSk7Cj4gKwo+ICsgICAg
ICAgcmlzY3ZfaW9tbXVfcG11X3VuaW5pdCgmaW9tbXUtPnBtdSk7Cj4gK30KPiArCj4gIC8qIExv
b2t1cCBhbmQgaW5pdGlhbGl6ZSBkZXZpY2UgY29udGV4dCBpbmZvIHN0cnVjdHVyZS4gKi8KPiAg
c3RhdGljIHN0cnVjdCByaXNjdl9pb21tdV9kYyAqcmlzY3ZfaW9tbXVfZ2V0X2RjKHN0cnVjdCBy
aXNjdl9pb21tdV9kZXZpY2UgKmlvbW11LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZGV2aWQpCj4gQEAgLTE2MTIsNiArMTY2
OCw5IEBAIHZvaWQgcmlzY3ZfaW9tbXVfcmVtb3ZlKHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2Ug
KmlvbW11KQo+ICAgICAgICAgcmlzY3ZfaW9tbXVfaW9kaXJfc2V0X21vZGUoaW9tbXUsIFJJU0NW
X0lPTU1VX0REVFBfSU9NTVVfTU9ERV9PRkYpOwo+ICAgICAgICAgcmlzY3ZfaW9tbXVfcXVldWVf
ZGlzYWJsZSgmaW9tbXUtPmNtZHEpOwo+ICAgICAgICAgcmlzY3ZfaW9tbXVfcXVldWVfZGlzYWJs
ZSgmaW9tbXUtPmZsdHEpOwo+ICsKPiArICAgICAgIGlmIChpb21tdS0+Y2FwcyAmIFJJU0NWX0lP
TU1VX0NBUEFCSUxJVElFU19IUE0pCj4gKyAgICAgICAgICAgICAgIHJpc2N2X2lvbW11X3BtdV91
bmluaXQoJmlvbW11LT5wbXUpOwo+ICB9Cj4KPiAgaW50IHJpc2N2X2lvbW11X2luaXQoc3RydWN0
IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUpCj4gQEAgLTE2NTEsNiArMTcxMCwxMCBAQCBpbnQg
cmlzY3ZfaW9tbXVfaW5pdChzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSkKPiAgICAg
ICAgIGlmIChyYykKPiAgICAgICAgICAgICAgICAgZ290byBlcnJfcXVldWVfZGlzYWJsZTsKPgo+
ICsgICAgICAgcmMgPSByaXNjdl9pb21tdV9ocG1fZW5hYmxlKGlvbW11KTsKPiArICAgICAgIGlm
IChyYykKPiArICAgICAgICAgICAgICAgZ290byBlcnJfaHBtX2Rpc2FibGU7Cj4gKwo+ICAgICAg
ICAgcmMgPSBpb21tdV9kZXZpY2Vfc3lzZnNfYWRkKCZpb21tdS0+aW9tbXUsIE5VTEwsIE5VTEws
ICJyaXNjdi1pb21tdUAlcyIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZGV2X25hbWUoaW9tbXUtPmRldikpOwo+ICAgICAgICAgaWYgKHJjKSB7Cj4gQEAgLTE2NjksNiAr
MTczMiw4IEBAIGludCByaXNjdl9pb21tdV9pbml0KHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2Ug
KmlvbW11KQo+ICBlcnJfcmVtb3ZlX3N5c2ZzOgo+ICAgICAgICAgaW9tbXVfZGV2aWNlX3N5c2Zz
X3JlbW92ZSgmaW9tbXUtPmlvbW11KTsKPiAgZXJyX2lvZGlyX29mZjoKPiArICAgICAgIHJpc2N2
X2lvbW11X2hwbV9kaXNhYmxlKGlvbW11KTsKPiArZXJyX2hwbV9kaXNhYmxlOgo+ICAgICAgICAg
cmlzY3ZfaW9tbXVfaW9kaXJfc2V0X21vZGUoaW9tbXUsIFJJU0NWX0lPTU1VX0REVFBfSU9NTVVf
TU9ERV9PRkYpOwo+ICBlcnJfcXVldWVfZGlzYWJsZToKPiAgICAgICAgIHJpc2N2X2lvbW11X3F1
ZXVlX2Rpc2FibGUoJmlvbW11LT5mbHRxKTsKPiAtLQo+IDIuMTcuMQo+Cj4KClRoYW5rcywKWXVu
aHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
