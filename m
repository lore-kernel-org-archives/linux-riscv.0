Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7676C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 06:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oStgnr3+sfH+1qy+3keXIv5ZGbkJo2fy3F0vGCpmexc=; b=dvQINF3HvkeJ6w
	ALXi8bCzCdUcIna6snMVeOWFgN3ZtavglWKBwvL3FVf02DO0sDGCgOmbIW9SuH8h/k7hg1991NrhG
	q3UE5Q7v8pKR9hvbjfrndkakJYNTsPRch3aEBLbZDbu7TnZyCaDcB7hB1lrcDQ3VdYg2GdHCw/SbJ
	mWSynGlnF2yYGnXZwZY5dBnO7Li98WtZVWgZz85PBDvjQwKkOABRlhau1DCkn4ISfPxRpf61y4vUx
	e/Jvp+Iw3tKwrXbOyfxV+j2dDQb5LQjaMpmax5O9KuJ2Gxi6jj/y/IKdQ/pYdR1H5EE8WgvpQx/ao
	RQ+99Ng7v7hy9sTyMeLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB7Xt-00Bx57-0j;
	Thu, 07 Dec 2023 06:07:37 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB7Xo-00Bx4j-3B
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 06:07:34 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ce9e897aeaso267576b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 22:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1701929247; x=1702534047; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CntnxtK8Lx+9VhkTFQ4ebm7POn5Zxrcf29EHIgvNJN0=;
        b=dMjPN+XfazSXN3n4NSKNe1MJj4FZwrvqP0ebOJitr4Szid3cwyWtX3KKSh2vaRd4v6
         ORUZzCfrmwkJXdT9NzH9ejRzPZIRgBnzUTpqWEUzpKHDRJvP0+EIITKqnnBHliwELYjn
         x4roR5WL/gW5/uOQS+iRW6qphk2LJ69jrRqCz+y7Oohv/34kUMH3xZJXetEtRHLFGcE/
         S7uoMC/YIzmL4cdSe65HXinSvJp7V/OOR0iUJKVgzZL2nwV9TwkXjxZfSb8DiPzRHTwj
         f66AFYQurvCuvUwNkEJKRkFbfDqBrbNysu9ETQCzRd7zC5rYfI+gDFYRx4whJv5vLEKz
         MW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701929247; x=1702534047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CntnxtK8Lx+9VhkTFQ4ebm7POn5Zxrcf29EHIgvNJN0=;
        b=uk+4nAa6/Ahg6IZ70Hh/TEshTOfssg86LfpR8YpJIhqTv+yd6YSa73qPTH/kEcW3ZS
         JXlbSnd6bbA3MttVNbou+Ys/0mA5TT8Rs/EnPVjdIekxbyLQ4oM3ecHlMKfx8hfZgG5O
         TreCJtuJGR2gmhCUrUtcFQi5FwIOaB0d8LrdaKhoxH3N1AQeqUwi+JESLVp8sLikYD0i
         cDdkC6asTgxVvz9vLEI/mPQPXaAWEDraKYE7mxFiStvYEvoFHNNKoc8xAx/jd1tOu6BR
         ms23DU2mOZEyq1bVekh4HokaFe28DwLYUI0Z7aFpGqnbhn4mEi1jc9Xka9fRbc9cXN4Z
         PFTg==
X-Gm-Message-State: AOJu0Yx6xJT5Tvs9Iivt1P3q02vC6S06558tUMvcTh4ZJxwwqwOB6G+J
	5I4o52ewEEBboa1EoJdSAZLo9lH0FvOor5kfE2I48g==
X-Google-Smtp-Source: AGHT+IHJu91Tjssa9ODu4I/8j76aunhpadRAahrgX9O537p/MfigaphqCAFaLUl6bs7BN+tpMxad9Bl3Ss9NAq9LwGM=
X-Received: by 2002:a05:6a20:a196:b0:18f:97c:8a40 with SMTP id
 r22-20020a056a20a19600b0018f097c8a40mr1783720pzk.107.1701929247028; Wed, 06
 Dec 2023 22:07:27 -0800 (PST)
MIME-Version: 1.0
References: <20231123065708.91345-1-luxu.kernel@bytedance.com>
In-Reply-To: <20231123065708.91345-1-luxu.kernel@bytedance.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Thu, 7 Dec 2023 14:07:15 +0800
Message-ID: <CAPYmKFvSXRo5d3T3OwJ6tZEer-8o=G3uUVrd7mXOFjGsfVPy3w@mail.gmail.com>
Subject: Re: [RFC PATCH V1 00/11] riscv: Introduce 64K base page
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	ardb@kernel.org, anup@brainfault.org, atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com, xieyongji@bytedance.com, 
	lihangjing@bytedance.com, songmuchun@bytedance.com, 
	punit.agrawal@bytedance.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_220733_352069_D8BB9880 
X-CRM114-Status: GOOD (  28.10  )
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

QSBnZW50bGUgcGluZy4KCk9uIFRodSwgTm92IDIzLCAyMDIzIGF0IDI6NTfigK9QTSBYdSBMdSA8
bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBTb21lIGV4aXN0aW5nIGFyY2hp
dGVjdHVyZXMgbGlrZSBBUk0gc3VwcG9ydHMgYmFzZSBwYWdlIGxhcmdlciB0aGFuIDRLCj4gYXMg
dGhlaXIgTU1VIHN1cHBvcnRzIG1vcmUgcGFnZSBzaXplcy4gVGh1cywgYmVzaWRlcyBodWdldGxi
IHBhZ2UgYW5kCj4gdHJhbnNwYXJlbnQgaHVnZSBwYWdlLCB0aGVyZSBpcyBhbm90aGVyIHdheSBm
b3IgdGhlc2UgYXJjaGl0ZWN0dXJlcyB0bwo+IGVuam95IHRoZSBiZW5lZml0cyBvZiBmZXdlciBU
TEIgbWlzc2VzIHdpdGhvdXQgd29ycnlpbmcgYWJvdXQgY29zdCBvZgo+IHNwbGl0dGluZyBhbmQg
bWVyZ2luZyBodWdlIHBhZ2VzLiBIb3dldmVyLCBvbiBhcmNoaXRlY3R1cmVzIHdpdGggb25seQo+
IDRLIE1NVSwgbGFyZ2VyIGJhc2UgcGFnZSBpcyB1bmF2YWlsYWJsZSBub3cuCj4KPiBUaGlzIHBh
dGNoIHNlcmllcyBhdHRlbXB0cyB0byBicmVhayB0aHJvdWdoIHRoZSBsaW1pdGF0aW9uIG9mIE1N
VSBhbmQKPiBzdXBwb3J0cyBsYXJnZXIgYmFzZSBwYWdlIG9uIFJJU0MtViwgd2hpY2ggb25seSBz
dXBwb3J0cyA0SyBwYWdlIHNpemUKPiBub3cuCj4KPiBUaGUga2V5IGlkZWEgdG8gaW1wbGVtZW50
IGxhcmdlciBiYXNlIHBhZ2UgYmFzZWQgb24gNEsgTU1VIGlzIHRvCj4gZGVjb3VwbGUgdGhlIE1N
VSBwYWdlIGZyb20gdGhlIGJhc2UgcGFnZSBpbiB2aWV3IG9mIGtlcm5lbCBtbSwgd2hpY2ggd2UK
PiBkZW5vdGUgYXMgc29mdHdhcmUgcGFnZS4gSW4gY29udHJhcnkgdG8gc29mdHdhcmUgcGFnZSwg
d2UgZGVub3RlIHRoZSBNTVUKPiBwYWdlIGFzIGhhcmR3YXJlIHBhZ2UuIEJlbG93IGlzIHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlc2UgdHdvIGtpbmRzCj4gb2YgcGFnZXMuCj4KPiAxLiBLZXJu
ZWwgbWVtb3J5IG1hbmFnZW1lbnQgbW9kdWxlIG1hbmFnZXMsIGFsbG9jYXRlcyBhbmQgbWFwcyBt
ZW1vcnkgYXQKPiBhIGdyYW51bGFyaXR5IG9mIHNvZnR3YXJlIHBhZ2UsIHdoaWNoIHNob3VsZCBu
b3QgYmUgcmVzdHJpY3RlZCBieQo+IE1NVSBhbmQgY2FuIGJlIGxhcmdlciB0aGFuIGhhcmR3YXJl
IHBhZ2UuCj4KPiAyLiBBcmNoaXRlY3R1cmUgcGFnZSB0YWJsZSBvcGVyYXRpb25zIHNob3VsZCBi
ZSBjYXJyaWVkIG91dCBmcm9tIE1NVSdzCj4gcGVyc3BlY3RpdmUgYW5kIHBhZ2UgdGFibGUgZW50
cmllcyBhcmUgZW5jb2RlZCBhdCBhIGdyYW51bGFyaXR5IG9mCj4gaGFyZHdhcmUgcGFnZSwgd2hp
Y2ggaXMgNEsgb24gUklTQy1WIE1NVSBub3cuCj4KPiBUaGUgbWFpbiB3b3JrIHRvIGRlY291cGxl
IHRoZXNlIHR3byBraW5kcyBvZiBwYWdlcyBsaWVzIGluIGFyY2hpdGVjdHVyZQo+IGNvZGUuIEZv
ciBleGFtcGxlLCB3ZSB0dXJuIHRoZSBwdGVfdCBzdHJ1Y3QgdG8gYW4gYXJyYXkgb2YgcGFnZSB0
YWJsZQo+IGVudHJpZXMgdG8gbWF0Y2ggaXQgd2l0aCBzb2Z0d2FyZSBwYWdlIHdoaWNoIGNhbiBi
ZSBsYXJnZXIgdGhhbiBoYXJkd2FyZQo+IHBhZ2UsIGFuZCBhZGFwdCB0aGUgcGFnZSB0YWJsZSBv
cGVyYXRpb25zIGFjY29yZGluZ2x5LiBGb3IgNjRLIHNvZnR3YXJlCj4gYmFzZSBwYWdlLCB0aGUg
cHRlX3Qgc3RydWN0IG5vdyBjb250YWlucyAxNiBjb250aWd1b3VzIHBhZ2UgdGFibGUKPiBlbnRy
aWVzIHdoaWNoIHBvaW50IHRvIDE2IGNvbnRpZ3VvdXMgNEsgaGFyZHdhcmUgcGFnZXMuCj4KPiBU
byBhY2hpZXZlIHRoZSBiZW5lZml0cyBvZiBsYXJnZSBiYXNlIHBhZ2UsIHdlIGFwcGxpZXMgU3Zu
YXBvdCBmb3IgZWFjaAo+IGJhc2UgcGFnZSdzIG1hcHBpbmcuIFRoZSBTdm5hcG90IGV4dGVuc2lv
biBvbiBSSVNDLVYgaXMgbGlrZSBjb250aWd1b3VzCj4gUFRFIG9uIEFSTTY0LiBJdCBhbGxvd3Mg
cHRlcyBvZiBhIG5hdHVyYWxseSBhbGlnbmVkIHBvd2VyLW9mIDIgc2l6ZQo+IG1lbW9yeSByYW5n
ZSBiZSBlbmNvZGVkIGluIHRoZSBzYW1lIGZvcm1hdCB0byBzYXZlIHRoZSBUTEIgc3BhY2UuCj4K
PiBUaGlzIHBhdGNoIHNlcmllcyBpcyB0aGUgZmlyc3QgdmVyc2lvbiBhbmQgaXMgYmFzZWQgb24g
djYuNy1yYzEuIFRoaXMKPiB2ZXJzaW9uIHN1cHBvcnRzIGJvdGggYmFyZSBtZXRhbCBhbmQgdmly
dHVhbGl6YXRpb24gc2NlbmFyaW9zLgo+Cj4gSW4gdGhlIG5leHQgdmVyc2lvbnMsIHdlIHdpbGwg
Y29udGludWUgb24gdGhlIGZvbGxvd2luZyB3b3JrczoKPgo+IDEuIFJlZHVjZSB0aGUgbWVtb3J5
IHVzYWdlIG9mIHBhZ2UgdGFibGUgcGFnZSBhcyBpdCBvbmx5IHVzZXMgNEsgc3BhY2UKPiB3aGls
ZSBjb3N0cyBhIHdob2xlIGJhc2UgcGFnZS4KPgo+IDIuIFdoZW4gSU1TSUMgaW50ZXJydXB0IGZp
bGUgaXMgc21hbGxlciB0aGFuIDY0SywgZXh0cmEgaXNvbGF0aW9uCj4gbWVhc3VyZXMgZm9yIHRo
ZSBpbnRlcnJ1cHQgZmlsZSBhcmUgbmVlZGVkLiAoUylQTVAgYW5kIElPUE1QIG1heSBiZSBnb29k
Cj4gY2hvaWNlcy4KPgo+IDMuIE1vcmUgY29uc2lkZXJhdGlvbiBpcyBuZWVkZWQgdG8gbWFrZSB0
aGlzIHBhdGNoIHNlcmllcyBjb2xsYWJvcmF0ZQo+IHdpdGggZm9saW9zIGJldHRlci4KPgo+IDQu
IFN1cHBvcnQgNjRLIGJhc2UgcGFnZSBvbiBJT01NVS4KPgo+IDUuIFRoZSBwZXJmb3JtYW5jZSB0
ZXN0IGlzIG9uIHNjaGVkdWxlIHRvIHZlcmlmeSB0aGUgYWN0dWFsIHBlcmZvcm1hbmNlCj4gaW1w
cm92ZW1lbnQgYW5kIHRoZSBkZWNyZWFzZSBpbiBUTEIgbWlzcyByYXRlLgo+Cj4gVGhhbmtzIGlu
IGFkdmFuY2UgZm9yIGNvbW1lbnRzLgo+Cj4gWHUgTHUgKDExKToKPiAgIG1tOiBGaXggbWlzdXNl
ZCBBUElzIG9uIGh1Z2UgcHRlCj4gICByaXNjdjogSW50cm9kdWNlIGNvbmNlcHQgb2YgaGFyZHdh
cmUgYmFzZSBwYWdlCj4gICByaXNjdjogQWRhcHQgcHRlIHN0cnVjdCB0byBnYXAgYmV0d2VlbiBo
dyBwYWdlIGFuZCBzdyBwYWdlCj4gICByaXNjdjogQWRhcHQgcHRlIG9wZXJhdGlvbnMgdG8gZ2Fw
IGJldHdlZW4gaHcgcGFnZSBhbmQgc3cgcGFnZQo+ICAgcmlzY3Y6IERlY291cGxlIHBtZCBvcGVy
YXRpb25zIGFuZCBwdGUgb3BlcmF0aW9ucwo+ICAgcmlzY3Y6IERpc3Rpbmd1aXNoIHBtZCBodWdl
IHB0ZSBhbmQgbmFwb3QgaHVnZSBwdGUKPiAgIHJpc2N2OiBBZGFwdCBzYXRwIG9wZXJhdGlvbnMg
dG8gZ2FwIGJldHdlZW4gaHcgcGFnZSBhbmQgc3cgcGFnZQo+ICAgcmlzY3Y6IEFwcGx5IFN2bmFw
b3QgZm9yIGJhc2UgcGFnZSBtYXBwaW5nCj4gICByaXNjdjogQWRqdXN0IGZpeF9idG1hcCBzbG90
cyBudW1iZXIgdG8gbWF0Y2ggdmFyaWFibGUgcGFnZSBzaXplCj4gICByaXNjdjoga3ZtOiBBZGFw
dCBrdm0gdG8gZ2FwIGJldHdlZW4gaHcgcGFnZSBhbmQgc3cgcGFnZQo+ICAgcmlzY3Y6IEludHJv
ZHVjZSA2NEsgcGFnZSBzaXplCj4KPiAgYXJjaC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAyOCAr
KysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9maXhtYXAuaCAgICAgfCAgIDMgKy0KPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9odWdldGxiLmggICAgfCAgNzEgKysrKysrLQo+ICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BhZ2UuaCAgICAgICB8ICAxNiArLQo+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BnYWxsb2MuaCAgICB8ICAyMSArKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
Z3RhYmxlLTMyLmggfCAgIDIgKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0
LmggfCAgNDUgKysrLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgfCAy
ODIgKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9lZmku
YyAgICAgICAgICAgICB8ICAgMiArLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgICAgICAg
ICAgICB8ICAgNCArLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9oaWJlcm5hdGUuYyAgICAgICB8ICAg
MyArLQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyAgICAgICAgICAgICAgICB8IDE5OCArKysrKysr
KysrKysrLS0tLS0tCj4gIGFyY2gvcmlzY3YvbW0vY29udGV4dC5jICAgICAgICAgICAgIHwgICA3
ICstCj4gIGFyY2gvcmlzY3YvbW0vZmF1bHQuYyAgICAgICAgICAgICAgIHwgICAxICsKPiAgYXJj
aC9yaXNjdi9tbS9odWdldGxicGFnZS5jICAgICAgICAgfCAgNDIgKysrLS0KPiAgYXJjaC9yaXNj
di9tbS9pbml0LmMgICAgICAgICAgICAgICAgfCAgMjUgKy0tCj4gIGFyY2gvcmlzY3YvbW0va2Fz
YW5faW5pdC5jICAgICAgICAgIHwgICA3ICstCj4gIGFyY2gvcmlzY3YvbW0vcGFnZWF0dHIuYyAg
ICAgICAgICAgIHwgICAyICstCj4gIGZzL3Byb2MvdGFza19tbXUuYyAgICAgICAgICAgICAgICAg
IHwgICAyICstCj4gIGluY2x1ZGUvYXNtLWdlbmVyaWMvaHVnZXRsYi5oICAgICAgIHwgICA3ICsK
PiAgaW5jbHVkZS9hc20tZ2VuZXJpYy9wZ3RhYmxlLW5vcG1kLmggfCAgIDEgKwo+ICBpbmNsdWRl
L2xpbnV4L3BndGFibGUuaCAgICAgICAgICAgICB8ICAgNiArCj4gIG1tL2h1Z2V0bGIuYyAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIG1tL21pZ3JhdGUuYyAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA1ICstCj4gIG1tL21wcm90ZWN0LmMgICAgICAgICAgICAgICAgICAgICAg
IHwgICAyICstCj4gIG1tL3JtYXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEwICst
Cj4gIG1tL3ZtYWxsb2MuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICstCj4gIDI4IGZp
bGVzIGNoYW5nZWQsIDYxNiBpbnNlcnRpb25zKCspLCAxODIgZGVsZXRpb25zKC0pCj4KPiAtLQo+
IDIuMjAuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
