Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007B6C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jan 2022 14:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWdQndQC+RZyBAUsiDYGpwsvPcGNxN33kIdsbrEsfNI=; b=J0rJOAC/x8iskd
	+s6x6+GhldIFeL9qe3CW96/84+CtpoyLqrOdXW/aQDyNG0wVRhW/4K8H3Pn7wkQ6bMCmouL62BJ+S
	270KvINR9FKOkxpnH1srBngeqq1OJSPUyPdcVkkyX7hRFfwwsxGghpiFKijA/zToGCjuaQI10e/Ta
	C8dqJArS9Ly56OkAy3RbKfaMbfFvf637601cdwsNgKdAX/IMlwPHSSb4hKg7HwRT8j6nfnxbfVbFl
	3OwFhayqF/xW+0KeaMR4Uei4ftBG6heCw/BCKFoEzt/IUlDAC4+9jnki7Y9rFR15314nHpsDFgFIy
	DHlza9zSVIUjnLtV6qbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4kMJ-00Bdl8-Sb; Tue, 04 Jan 2022 14:00:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4kMG-00Bdit-QE
 for linux-riscv@lists.infradead.org; Tue, 04 Jan 2022 14:00:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so1500162wmb.0
 for <linux-riscv@lists.infradead.org>; Tue, 04 Jan 2022 06:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LAi/zMLDUkXA55ptMHaAtcTiIFXbdm+3dHnXo6tH6To=;
 b=mRc+fKjFCLxv1tB++H8YO7Ja92cyl7ysVXH0gvFwP8a/h7jN6F1I88slAfmXwpNrCE
 9iqa6hA9cBdP4GzTfatDmB8bQHgwlnNtLpwc4yj8KIHX2QYw1Afru8Yrg787Thq6LbKi
 X5Fm7mf2iN3ljpDxCg2+DAtmJ8gXl97NFnQBp5gUffZPu3zb2DgkLTqCeE8Jxgb8ciLM
 OpltDN5JU+/0hqCPRbNJGm6ChzqvelKZsBTQqov3FQJ04GzM13eZi0Fy2Lfmy6rnYdf/
 su5R5IuHUAsMfMaup67+GdOsH0/xMQPYn4ZMQ+mvu4l0ELyYmlV3Im5hs8fvsSJ5c2TF
 WIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LAi/zMLDUkXA55ptMHaAtcTiIFXbdm+3dHnXo6tH6To=;
 b=f78+DcskAmHzQPvNL468wuao6GnjALgYCdYthMngcgHY2246OCgy4zjnhJ5/+5QVSx
 cmzXK4fFdTpRnt4VEozmVpEuN1/VwQNLjpR4KnxPt9Bb9SF+yPc5xozRmul3/6benhqb
 wqkVsTdHTcxnEpI4F2uTC2RNPX2Ono6L/6SZmPcvOtty80S9Bh8EpG1eqfc6dK5zZygG
 ziWLMe+ToXEWPUroXXzsuQBXReq3xnaII4V3YPdcSeHoXPZLFrrE8bOcCC5K5osBYr5h
 amVaf9y7OPvPPTnuXzaPgaYvJ5l06JCqGAKafFE7rvkkPN60pCwYxN5NS50TpXgIla8D
 k6eg==
X-Gm-Message-State: AOAM532Tk3Tu9OG+wlKpW+iCCvlJXqal5o4ZSIkovAQ/SKLC9fQlBGC6
 rko6a1b6fMKnse5YLVVwTQlcmJ4ErJAQEofMGRWiTA==
X-Google-Smtp-Source: ABdhPJxshd4qMDQyCd0C74OyBKCvDdeUgBw0LwKdi1bze+9JK/GGFMAZ+nHe++OKjLTKJw7qt/730w8by/yH6EhdSsg=
X-Received: by 2002:a7b:c243:: with SMTP id b3mr42380051wmj.61.1641304810085; 
 Tue, 04 Jan 2022 06:00:10 -0800 (PST)
MIME-Version: 1.0
References: <20211118083912.981995-1-atishp@rivosinc.com>
 <20211118083912.981995-2-atishp@rivosinc.com>
 <6615284.qex3tTltCR@diego> <8323751.1mJVJdxAKN@diego>
In-Reply-To: <8323751.1mJVJdxAKN@diego>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Jan 2022 19:29:58 +0530
Message-ID: <CAAhSdy0J7WVJO5vbz1JeHChitbJpagyuE1nF8XHfY-K=DnySGg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] RISC-V: KVM: Mark the existing SBI implementation
 as v01
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>, kvm-riscv@lists.infradead.org, 
 KVM General <kvm@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_060012_953762_642BD377 
X-CRM114-Status: GOOD (  17.79  )
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

T24gVHVlLCBKYW4gNCwgMjAyMiBhdCA2OjU3IFBNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRl
Y2guZGU+IHdyb3RlOgo+Cj4gQW0gRGllbnN0YWcsIDQuIEphbnVhciAyMDIyLCAxNDoxOTo0MSBD
RVQgc2NocmllYiBIZWlrbyBTdMO8Ym5lcjoKPiA+IEhpIEF0aXNoLAo+ID4KPiA+IEFtIERvbm5l
cnN0YWcsIDE4LiBOb3ZlbWJlciAyMDIxLCAwOTozOTowOCBDRVQgc2NocmllYiBBdGlzaCBQYXRy
YToKPiA+ID4gRnJvbTogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+Cj4gPiA+Cj4g
PiA+IFRoZSBleGlzdGluZyBTQkkgc3BlY2lmaWNhdGlvbiBpbXBlbGVtZW50YXRpb24gZm9sbG93
cyB2MC4xCj4gPiA+IHNwZWNpZmljYXRpb24uIFRoZSBsYXRlc3Qgc3BlY2lmaWNhdGlvbiBhbGxv
d3MgbW9yZQo+ID4gPiBzY2FsYWJpbGl0eSBhbmQgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnRzLgo+
ID4gPgo+ID4gPiBSZW5hbWUgdGhlIGV4aXN0aW5nIGltcGxlbWVudGF0aW9uIGFzIHYwMSBhbmQg
cHJvdmlkZSBhIHdheSB0byBhbGxvdwo+ID4gPiBmdXR1cmUgZXh0ZW5zaW9ucy4KPiA+ID4KPiA+
ID4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAd2RjLmNvbT4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+ID4gPiAtLS0KPiA+
Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmkuYwo+ID4gPiBpbmRleCBlYjNjMDQ1ZWRmMTEuLjMyMzc2OTA2ZmYyMCAx
MDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+ID4gPiArKysgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gPiA+IEBAIC0xLDUgKzEsNSBAQAo+ID4gPiAgLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ID4gLS8qKgo+ID4gPiArLyoKPiA+
ID4gICAqIENvcHlyaWdodCAoYykgMjAxOSBXZXN0ZXJuIERpZ2l0YWwgQ29ycG9yYXRpb24gb3Ig
aXRzIGFmZmlsaWF0ZXMuCj4gPiA+ICAgKgo+ID4gPiAgICogQXV0aG9yczoKPiA+Cj4gPiBUaGlz
IGdvdCBhbHJlYWR5IGZpeGVkIGJ5IFswXQo+ID4gY29tbWl0IDBlMmU2NDE5MjEwMCAoInJpc2N2
OiBrdm06IGZpeCBub24ta2VybmVsLWRvYyBjb21tZW50IGJsb2NrIikKPiA+IHNvIHRoaXMgcGF0
Y2ggZG9lc24ndCBhcHBseSBjbGVhbmx5IGFueW1vcmUuCj4KPiBobW0sIGp1c3QgZm91bmQgQW51
cCdzICJJJ3ZlIHF1ZXVlZCB0aGlzLi4uIiBtZXNzYWdlIGFmdGVyCj4gd3JpdGluZyBteSByZXBs
eSwgc28gc2NyYXRjaCB0aGUgYWJvdmUgOy0pIC4KPgo+IEBBbnVwOiBJJ3ZlIGxvb2tlZCBhdCBn
aXQua2VybmVsLm9yZyBidXQgZGlkbid0IGZpbmQgYSB0cmVlCj4gdGhlcmUsIGNhbiB5b3UgdGVs
bCBtZSB3aGVyZSB0aGlzIGRpZCBnbyB0bz8KCkFsbCBxdWV1ZWQgcGF0Y2hlcyBhcmUgaW4gcmlz
Y3Zfa3ZtX3F1ZXVlIGJyYW5jaCBvZgp0aGUgS1ZNIFJJU0MtViB0cmVlIGF0IGh0dHBzOi8vZ2l0
aHViLmNvbS9rdm0tcmlzY3YvbGludXguZ2l0CgpSZWdhcmRzLApBbnVwCgo+Cj4gVGhhbmtzCj4g
SGVpa28KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
