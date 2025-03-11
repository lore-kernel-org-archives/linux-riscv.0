Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDE3C28B2F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/KYmp4rLL1bnCWEVdbu+cYEgHsc0i383STwkHYd7eE=; b=VMZrpgHUScIYKo
	YLMY1KDtV8tVZwpiBLZDsF8Pu0s6qc/64PkWKBCXpdMt6QpWqOphzs3XjezjaLRgR7tzPOBhI8JWk
	bDLgpxA0YBmodzsn3LRNMcKZ2UASxNeF7qYJJRGwxL2WCP8kYVkG0PIcfJdAE482xLRuFIG1ZaUMP
	/FNUTctYzYcQnDJ8H25FC1LEiXgUOs1daGhXELebNC+7naaivNWFP2+RinnDwXbT/sHMpcZW0ALOm
	1EzwyO9uH2SRglWjQf1u11oddqIt77PtVj39sTejsfFphfBfsEl4EAVNS54KuLl2fAwju3pheWddn
	+R0ARLeYwQAtlegqwB5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts16o-000000063mw-1dya;
	Tue, 11 Mar 2025 15:01:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts13g-000000063MQ-2Tch;
	Tue, 11 Mar 2025 14:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3AC75C6485;
	Tue, 11 Mar 2025 14:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED553C4CEF2;
	Tue, 11 Mar 2025 14:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741705095;
	bh=y4ryVf0YNOjwtuAvfEB/68jmLIXNfkpji8SHUgQfHwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NR0tVOSg1upZbE2fEnyq9W9Y3RVKJ+tzky3/D+NrptcRvtdtGIWka/OYqly8MeSpp
	 lo076w/j5pWmgipzkujd5xbRgbtBnKD17m9kM2OOZLTqto0fy8xOrPzXDq5DKv+s2l
	 8Gnuyx71HplMB2FE9EZ3yBpwlxvZg9Ck8WL5ZE8KswsxlZ2CQjzvaOOFlwg1F5IpN6
	 fIR7Ht2Iph5kvMCIHhYCLUsas1FS7E3k8G1L9j03WTAdlqfL/yEwBslCuWgmURWkjD
	 oHhikPGChRCkC7VT5m/rET4dXsDx0+mTsLKnuSrGjKF+qC6t0/zyA1TRHC2nXV4zsX
	 6kDLqw8p1twvw==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2bc66e26179so2361853fac.2;
        Tue, 11 Mar 2025 07:58:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHnXrafMSPAoYtM/Mp/ulDMokx70qrWcn4lxdYbim6L9gJZpsJ6anVUZyBqDaABqbMA0mMmXHHriSDYWtdwlTA@lists.infradead.org, AJvYcCUeT+b1eTrJq24R8qZAx4/ZD/vOKtFGKPui7/Ybmx95kyieD+kxc+h7yoE+IBhUj4oI+iGXhQMk4x8R1No=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHnWK+AvN15T8TO83JwJRAoGbhsED7GmPYb05QFow33761SdWA
	sFed0BLHu4+wKMSVYVPo5F0S8QOjDWgzo7yZmcT00WHIt/mgwaOVrE4fzap+wEx0XyEGkJEvFmg
	wBPxIadxJvge8UYVvVDN2q3Q4ieY=
X-Google-Smtp-Source: AGHT+IFQOxYvpetHFZ5qF/modjQEJMQgK5sXcQo1XO+E1NqNBmeXGZ0DgBu5WKIIpycj+LOLM2pmlvVhXDd30xgHFNo=
X-Received: by 2002:a05:6870:b906:b0:2c2:5270:f182 with SMTP id
 586e51a60fabf-2c26136df6bmr9904732fac.39.1741705094125; Tue, 11 Mar 2025
 07:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250307145547.2784821-1-ping.bai@nxp.com> <CAPDyKFqsE4nArB+Qn5gH5P7vVePpZ6Z7ruas2-EGYsctGV-=4w@mail.gmail.com>
In-Reply-To: <CAPDyKFqsE4nArB+Qn5gH5P7vVePpZ6Z7ruas2-EGYsctGV-=4w@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 11 Mar 2025 15:58:02 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jjezx5sUEZwsbsw-iZiwbirmB+690-syOCur26DvOSNQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jpg9YGKxiXZ8IeOPwdPNsqgPkaGl3fl_2Y1dOoOEeGA0VymC_oHOAASzwc
Message-ID: <CAJZ5v0jjezx5sUEZwsbsw-iZiwbirmB+690-syOCur26DvOSNQ@mail.gmail.com>
Subject: Re: [PATCH v5] cpuidle: Init cpuidle only for present CPUs
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: rafael@kernel.org, Jacky Bai <ping.bai@nxp.com>, daniel.lezcano@linaro.org, 
	lpieralisi@kernel.org, sudeep.holla@arm.com, james.morse@arm.com, 
	d-gole@ti.com, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, imx@lists.linux.dev, khilman@baylibre.com, 
	quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_075816_741001_7F871000 
X-CRM114-Status: GOOD (  15.51  )
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

T24gVHVlLCBNYXIgMTEsIDIwMjUgYXQgMzo0M+KAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgNyBNYXIgMjAyNSBhdCAxNTo1NCwgSmFj
a3kgQmFpIDxwaW5nLmJhaUBueHAuY29tPiB3cm90ZToKPiA+Cj4gPiBmb3JfZWFjaF9wb3NzaWJs
ZV9jcHUoKSBpcyBjdXJyZW50bHkgdXNlZCB0byBpbml0aWFsaXplIGNwdWlkbGUKPiA+IGluIGJl
bG93IGNwdWlkbGUgZHJpdmVyczoKPiA+ICAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtYXJtLmMK
PiA+ICAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtYmlnX2xpdHRsZS5jCj4gPiAgIGRyaXZlcnMv
Y3B1aWRsZS9jcHVpZGxlLXBzY2kuYwo+ID4gICBkcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1xY29t
LXNwbS5jCj4gPiAgIGRyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gPgo+ID4g
SG93ZXZlciwgaW4gY3B1X2Rldl9yZWdpc3Rlcl9nZW5lcmljKCksIGZvcl9lYWNoX3ByZXNlbnRf
Y3B1KCkKPiA+IGlzIHVzZWQgdG8gcmVnaXN0ZXIgQ1BVIGRldmljZXMgd2hpY2ggbWVhbnMgdGhl
IENQVSBkZXZpY2VzIGFyZQo+ID4gb25seSByZWdpc3RlcmVkIGZvciBwcmVzZW50IENQVXMgYW5k
IG5vdCBhbGwgcG9zc2libGUgQ1BVcy4KPiA+Cj4gPiBXaXRoIG5vc21wIG9yIG1heGNwdXM9MCwg
b25seSB0aGUgYm9vdCBDUFUgaXMgcHJlc2VudCwgbGVhZAo+ID4gdG8gdGhlIGZhaWx1cmU6Cj4g
Pgo+ID4gICB8ICBGYWlsZWQgdG8gcmVnaXN0ZXIgY3B1aWRsZSBkZXZpY2UgZm9yIGNwdTEKPiA+
Cj4gPiBUaGVuIHJvbGxiYWNrIHRvIGNhbmNlbCBhbGwgQ1BVcycgY3B1aWRsZSByZWdpc3RyYXRp
b24uCj4gPgo+ID4gQ2hhbmdlIGZvcl9lYWNoX3Bvc3NpYmxlX2NwdSgpIHRvIGZvcl9lYWNoX3By
ZXNlbnRfY3B1KCkgaW4gdGhlCj4gPiBhYm92ZSBjcHVpZGxlIGRyaXZlcnMgdG8gZW5zdXJlIGl0
IG9ubHkgcmVnaXN0ZXJzIGNwdWlkbGUgZGV2aWNlcwo+ID4gZm9yIENQVXMgdGhhdCBhcmUgYWN0
dWFsbHkgcHJlc2VudC4KPiA+Cj4gPiBGaXhlczogYjBjNjllMTIxNGJjICgiZHJpdmVyczogYmFz
ZTogVXNlIHByZXNlbnQgQ1BVcyBpbiBHRU5FUklDX0NQVV9ERVZJQ0VTIikKPiA+IFJldmlld2Vk
LWJ5OiBEaHJ1dmEgR29sZSA8ZC1nb2xlQHRpLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBTdWRlZXAg
SG9sbGEgPHN1ZGVlcC5ob2xsYUBhcm0uY29tPgo+ID4gVGVzdGVkLWJ5OiBZdWFuamllIFlhbmcg
PHF1aWNfeXVhbmppZXlAcXVpY2luYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNreSBCYWkg
PHBpbmcuYmFpQG54cC5jb20+Cj4KPiBSZXZpZXdlZC1ieTogVWxmIEhhbnNzb24gPHVsZi5oYW5z
c29uQGxpbmFyby5vcmc+Cj4KPiBSYWZhZWwsIEkgYXNzdW1lIHlvdSB3aWxsIHBpY2sgdGhlc2Ug
dXA/IE9yIGxldCBtZSBrbm93IGlmIHlvdSB3YW50IG1lCj4gdG8gdGFrZSB0aGVtIHZpYSBteSBw
bWRvbWFpbiB0cmVlLgoKSSBjYW4gcGljayBpdCB1cC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
