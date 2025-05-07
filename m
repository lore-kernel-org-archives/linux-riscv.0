Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3295FC3ABC0
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFx37h/lAfECbt6i/9xePvTYSQPAyDBy7qw8RXht6S0=; b=ap5XYSILspmhZn
	SgcsMbdUUSrDqOTkwf6fUlxT2N9Dv7J/orInEmSJMrwc7GUXtbUUTbgq5jyPmQ/reZ0ZU1QHqmrdo
	qmaz2GC14VjWV/wR8iyLnQM7bfcCVmbUTyY1nYw5hpIyIcg28lcUaxRhAzcF/HCRT1s/XJ6hOoZLi
	GuoGcdWm4Zx4HOS5WouOylNHueH6w/LA4nFCBiA3P4aoXVa02sMxS4sR23vp5tE6k8AqFamy+hsng
	vhNz2fT880H5np81/LaTBmW3KA2wuw9TBZzX1iBob9XBEDvwwmq8VF8vvN98oUlYTkaoxsZmICAxi
	tOOXaNOeHGvC2FHgzgYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCixo-0000000GOvB-1M4K;
	Wed, 07 May 2025 17:53:48 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiZS-0000000GLHJ-1YLf
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 17:28:39 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cee550af2so91685e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 May 2025 10:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746638917; x=1747243717; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1k0mMQcs727Jg3GUuCAHgbefpxoeFAFqTEHafwowpE=;
        b=U8a++3pzLGjvZM/BvmeaVcX+tS4lOI1LrYXqSyzsCOh7yzT36JPQebKkJfqxfIZUQC
         x6Asu1jG1BWVFEXAlil2w5UbmiMHMwhjj8Em02u0MxTxgdG1OFf+8NP6+RscxKb2r9Wx
         nKEGMpR/QDcQXpdpDBHp7xs/uASogdgpgJQeICkKasrZp73zHM2DYgIGLeKgIz+4lpx9
         tBA1KlF0QT0lqlGarK479tGot0vv2QLdjVnnnB7A6wXQ0mOmuNPPLBC4fCS3FwL1GiW4
         qw/6YdaeabzuvGxIObV6J9+pZu0NsZaq3BdmluURPABW4aftsAoRFSKRUpBTvmKjvw5+
         C3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638917; x=1747243717;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n1k0mMQcs727Jg3GUuCAHgbefpxoeFAFqTEHafwowpE=;
        b=oilbcfDSyKQF/qIWe1mzAqhy94f1j0zkcbaVFe4wzy/EqcgXp7zYeRbCrPF2gNonsF
         ffyL/puH1EKT8ZxeBsF8Io0Z7TGExA1DaWB9qK4+z5oA6nrelAWNxgL4D5OOWIe4OggB
         5tYWLpLEX95fmp1UURx5PpH6fYNQZR65fxXqAigm8pmuY4MDhQMm6earuD3iv7Im1KYg
         ZDPStGnlMdYau+gnqZE/GpgH2Yw0eEYZFz8l3+mlSyevdhnbVc60JEDZUqwUS8VLcYyb
         gmcEJ4lBCDvybt31PXNiBbull2JzryH9qlZ0NrNslRwhjY7o2nvLb9nVh88aihNCALRI
         cXPw==
X-Forwarded-Encrypted: i=1; AJvYcCWAllXjAXIqrG1VME5BlG5q133Gq21jbwksEiOtKHbbgBp1noIyZsXwuNG76MW2iMPKc2bAtlst0Z5jXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ2nfuojzwn/WDj+JkIahqCQUJ+HliVrxGi5FTLisIUMWC64RC
	yViYBG7AUaM/kvYdz5JR8U0LtmRZOkWLE2aqKELhTHPD8/WXshOx2OMMWWxWtht8qXI5Rfk4C0C
	r
X-Gm-Gg: ASbGncv7v6P9Qt+5SRfpoA8MmIJ/Ve6IGmJ2VyrBt0go6ruEzEsG/pnolQcVYy2X9Tr
	9L0TtfQ6zORA788Q0Sd7IiF+y/FmF/TKSPBCgT1MApa6/hCuUZ3GaD+ZC648WsTvEFOGPkjLMWW
	Tk9TurgEgaUIDmMKrnoV6CCCcIEirj0Cz4hDBpPcK+wo78+GYZu1vMCQUJ6s8CmzBiWyEPPGEPl
	k5Efks+La27jMH4WcQl9BWH2Hq+ZTlE5f8h7DVvZWxhLiYB9djFQiHxAkO9F0tQqeFk9gR3FiQW
	NywZMbFfajQKqsHb4CKRwZKbA3dEd/b9FQ8m+IhZvr7g9JsB
X-Google-Smtp-Source: AGHT+IHU+1d2rnAPUioAKK829WKkuchI8dVVAYZLNapz3Ruq/guJ3Nrk018+5LxP/Vpdt+N6B5rWQw==
X-Received: by 2002:a05:600c:8711:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-441d44dd3b3mr14261685e9.5.1746638916681;
        Wed, 07 May 2025 10:28:36 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:f39f:9517:bfc5:cd5e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7f18sm7953815e9.40.2025.05.07.10.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:28:36 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 07 May 2025 19:28:35 +0200
Message-Id: <D9Q3TKPXTPMO.39LSPFEO587XO@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 2/5] KVM: RISC-V: refactor sbi reset request
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-5-rkrcmar@ventanamicro.com>
 <CAAhSdy0v7Cw+aGF8DDWh1gjTBXA23=H01KRK8R2LTQHLRHo5Kw@mail.gmail.com>
In-Reply-To: <CAAhSdy0v7Cw+aGF8DDWh1gjTBXA23=H01KRK8R2LTQHLRHo5Kw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_102838_415581_1C7B2830 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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

MjAyNS0wNS0wN1QxNzozMTozMyswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gVGh1LCBBcHIgMywgMjAyNSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxy
a3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3Zt
X3ZjcHVfc2JpLmgKPj4gQEAgLTU1LDYgKzU1LDggQEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlf
Zm9yd2FyZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4pOwo+PiAg
dm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfc3lzdGVtX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fcnVu
ICpydW4sCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgdHlwZSwg
dTY0IGZsYWdzKTsKPj4gK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3JlcXVlc3RfcmVzZXQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIHBjLCB1bnNpZ25lZCBsb25nIGExKTsKPgo+IFVzZSB0YWJzIGZv
ciBhbGlnbm1lbnQgaW5zdGVhZCBvZiBzcGFjZXMuCgpPb3BzLCBJIHRvdGFsbHkgZm9yZ290IHRo
YXQgbGludXggdXNlcyB0YWJzIGV2ZW4gZm9yIGFsaWdubWVudC4KCj4gT3RoZXJ3aXNlLCBpdCBs
b29rcyBnb29kIHRvIG1lLgo+IEkgaGF2ZSB0YWtlbiBjYXJlIG9mIHRoZSBhYm92ZSBjb21tZW50
IGF0IHRoZSB0aW1lCj4gb2YgbWVyZ2luZyB0aGlzIHBhdGNoLgoKVGhhbmtzLCBJJ2xsIHBvc3Qg
djIgd2l0aG91dCB0aGUgdGhyZWUgcGF0Y2hlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
