Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AAECA6002
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 06:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6FsTqZpW7iDQ15CZav7sAUpgBPG4bCeIg9D9SQUNa4=; b=04g1SzSOcTlePY
	comwzPXp5SSL3GjMc72zwn9UVHBBp8RzHSSgsWD/n6NfemrsIyRAlnkzYH4HEMqNzyJ0d7GgBVUDi
	sC5GHDOKsHg3LvL9V/vSkn0h4op06wh3ALh0fdVNbV57PaEdR3ilq+veaFE8R0j3GZvMHLLQtQXTA
	fGNC4bZwMFy/9NqPqNoloGlCjS5x8Srpibf6wTo8D7Tdohz6mPpeFFBIqIANVHBxKSR623ZfSyS7n
	yXHNLdPQ3wz8R7coLXIsb9oSfwy0xDvZFNFz+HEzwTCC9YBka2ttGU0Gs7SLoM9rMsBlJTBVWSThs
	E0I0dtcRMj08HLI3wHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhIl-00000003cSN-2Ate;
	Thu, 08 Oct 2026 06:08:23 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhIj-00000003cS2-0yNh
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 06:08:22 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-8726acc5eadso22266157b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 23:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791439699; cv=none;
        d=google.com; s=arc-20260327;
        b=GxUOiF/IxgmYAAJ7GG5meWX0Mzh3YLgdjNeZG9+lqmALqgqwM3k1bvXoRZpF7GQu44
         nKiJUp1+714c2jvfzCEjTf3L/bqVFh2Abg+o6VS3THZYRkA3TCR9VTTfwPTka9ox8waa
         F6TbTuW5lSp+ii2qHqaPR2upJDQlSVOFSclaGrJrsmjY7WbPz6WrBLmh+TnZ2c5jaR8n
         L+i2wrb1sHSsXsH/GngYJEvvSmr11BQcP6B+mKQ1sfUrl/txJbBHNgodGe+Tyl0xZdKP
         H5PdsB0GGmM6X1PYXgGPGF4N4ZFAcj3Lls8cI0fCGsGPi+O8BmKC2D0yW2et8h5UyBin
         +qDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g8wi6JDwMhJMDwxybg/6cqRql+OVe0VXJNNLkxqpuLg=;
        fh=IrUHm/cmPkt2vbGvFbjt0IpEsGiR5fccjKQ5yrf3qOY=;
        b=fDwPHaSaOLtcbypJbXR1lRj5k/cjnB6hR8GmYib4h8jfbRgcAN72fdz2EiujQwVISu
         kUK+USj2oCjvFyWLPuegzf65mKjtic7g78dQXJ9FBJw67XE1YW2uOrm7EV2QEekHvtV1
         VpF0AhaZMTVTPpbQecaAwmvKfPDjJOSuYthpxys8orR/biZnzLTaAu2Uu8p/JLwZY4Tn
         4wEGl6JCh1vpOI52xbPJNE8fgwQX/P2AS48EB8rfKtORpc17/BC26GYnDBePBwi9l9Dk
         DBzESULx2qqmngflvfJM5mFgfxNAaAKj+m4dnr3dFC7RdORCFzSNxTQk5sgOc4ey1paw
         jUPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791439699; x=1792044499; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g8wi6JDwMhJMDwxybg/6cqRql+OVe0VXJNNLkxqpuLg=;
        b=cbVknbkNlN06obKXrksMqHrhBaT/RmDmxpwjhxNKD/9MiVmNRYDPatd7XwAuFlOEVH
         WD7Ah2ohphD2gLTGCQ5uiILnwOy3SFkSi9Tidm9dr+bkytBttJ2z5LpjWpY7r9OHc4Jm
         wPnSF9LYUiBTT6H7wevixpcQYqzsaqnyOtiXVXXUl4MfC+P+zujxpwon3OYdvwct213r
         hTgvcH72SBZVIl/yFYuMLjHmdoz1vaGXfNcwGdEWE7jf8C63Y1mrXe+TWPRAkbbEN6Nl
         ZO4PWWkH9CoZw3wYqx/AiQ62RT0rFrzdQN3OFHf/4UKKZbjdUjukZVDfEQy+QdQSDpiO
         saqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439699; x=1792044499;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8wi6JDwMhJMDwxybg/6cqRql+OVe0VXJNNLkxqpuLg=;
        b=vGQh4oCPJD4al0IjRxQBvFMExR9QIY7vob68ySYHkx9ZFx5MH6TI0W9vNKCuvB/IMf
         L96IZEGF/qowOVLR0vAs0e1vEnCjPO0vYjhho0SHgSuzCP0HreDcrIYOhL6KOv1kq28p
         sUcx0Hw74+HgWECfi6XfcnyL+GbFHOHhXBHBPpP7rE8oITqtsYJNDJjsZLaNjF7Fgecq
         mPBKo3Jz6Sj+KEk7PnaHxjkbIjAic1NMMmcqqMDUXnDHA2n0V5U0x7V/B2iRFxLSyB7Q
         eBIq9j8NTyBgQoiEXmX/ui2DQ+QE8vuS3hjUYRxuKD+Cl2TrVdJeZvElhevGp3VeHMo8
         p6NA==
X-Forwarded-Encrypted: i=1; AKwUvBz4iJ7Hq/k+dwAOMERwltK1uVq+hYMoF/Cg94l5w8TRNwUH0gu1JJtaLLhdokxyErpRpT/TisKSiEA21Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYK3mI+M/CAuvLx157WWid0y8WWFuGs7LIQh/EArhNX2X3SWxynv
	E3QhkZQPlXpWahtes9DydGOHfS/t+rO5ZERCEr9LB+FkYXDp3RtUj37n21Ybj973+MHhxXodDzT
	MuwZ12bthw9gX+D7xFijdUBPbB1sJfpSNxNJphGQX/A==
X-Gm-Gg: AYBFou2Tu+N38sI31YkZL/OuZ9ZRuCRsfnAASb/kvyzp+nJtaZXmlxTZYU6m1s99iKZ
	fRNZk+Z1iq78BSUFP1SH+RhyoX0eHjzwnpnKlKF3oy50dOeY05wAud/RnK+TCvPq6d3KSh9A2bC
	L7iSterfpRO8IWo6v/MvC0CRDLDt7ZfnfLX4WtDP8hUt8BsDETRnckB8pb+J6NGAJ9QM/Atnpxy
	ywLEWFMQbmDXlUuZW5dqybesW32NHek8g5wj8RQ06rCzhEY0yjfWme36J8GfUVKdTvyirAw1Ez1
	AR8SUZ9NkqvSNuXtiWDMApJuo7ztwyZH3squK+xG6W+eXJrfP0xU7Ur2YEJBlMS4Pm7D
X-Received: by 2002:a05:690c:112:b0:8ab:3fe4:2e64 with SMTP id
 00721157ae682-8b05acc40a3mr33282027b3.8.1791439698649; Wed, 07 Oct 2026
 23:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261007155748.291814-1-samuel.holland@sifive.com> <20261007155748.291814-2-samuel.holland@sifive.com>
In-Reply-To: <20261007155748.291814-2-samuel.holland@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 8 Oct 2026 14:08:04 +0800
X-Gm-Features: AclHuK9HhR0J7EbrNLoUa0nPmB3mknKzALzsL4XASZvfcGLtl9bza_APMnCqxok
Message-ID: <CANXhq0pwEsZ5C7XopkPRgOv7d6X1m3vLb5ABuxoiXeMrBow2nw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: cfi: Only write envcfg CSR when task is current
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Deepak Gupta <debug@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_230821_302873_D54F32D5 
X-CRM114-Status: GOOD (  14.88  )
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

T24gV2VkLCBPY3QgNywgMjAyNiBhdCAxMTo1N+KAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IHNldF9zaHN0a19zdGF0dXMoKSBhbmQgc2V0
X2luZGlyX2xwX3N0YXR1cygpIHRha2UgYSB0YXNrIGFyZ3VtZW50LCB3aGljaAo+IGxldHMgdGhl
bSBvcGVyYXRlIG9uIHRhc2tzIG90aGVyIHRoYW4gY3VycmVudCwgYnV0IHRoZXkgYWx3YXlzIHdy
aXRlIHRoZQo+IGVudmNmZyBDU1IgZm9yIHRoZSBjdXJyZW50IHRhc2suIEZpeCB0aGlzIHdpdGgg
dGhlIGVudmNmZ191cGRhdGVfYml0cygpCj4gaGVscGVyLCB3aGljaCBvbmx5IHdyaXRlcyB0aGUg
ZW52Y2ZnIENTUiB3aGVuIG9wZXJhdGluZyBvbiBjdXJyZW50Lgo+Cj4gRml4ZXM6IDYxYTAyMDAy
MTFkMzFlICgicmlzY3Y6IEltcGxlbWVudCBhcmNoLWFnbm9zdGljIHNoYWRvdyBzdGFjayBwcmN0
bHMiKQo+IEZpeGVzOiA4YTllMjJkMmNhNTg1NSAoInJpc2N2OiBJbXBsZW1lbnQgaW5kaXJlY3Qg
YnJhbmNoIHRyYWNraW5nIHByY3RscyIpCj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQg
PHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCj4KPiAgYXJjaC9yaXNjdi9rZXJuZWwv
dXNlcmNmaS5jIHwgMTUgKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3VzZXJjZmkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYwo+IGluZGV4IDIzYzRk
NmQ5ZDhjYmMuLjg2MTQxZTViYWI4MjIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
dXNlcmNmaS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5jCj4gQEAgLTE1LDYg
KzE1LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3N5c2NhbGxzLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9wcmN0bC5oPgo+ICAjaW5jbHVkZSA8YXNtL2Nzci5oPgo+ICsjaW5jbHVkZSA8YXNtL3N3aXRj
aF90by5oPgo+ICAjaW5jbHVkZSA8YXNtL3VzZXJjZmkuaD4KPgo+ICB1bnNpZ25lZCBsb25nIHJp
c2N2X25vdXNlcmNmaSBfX3JlYWRfbW9zdGx5Owo+IEBAIC02NiwxMiArNjcsNyBAQCB2b2lkIHNl
dF9zaHN0a19zdGF0dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBib29sIGVuYWJsZSkKPgo+
ICAgICAgICAgdGFzay0+dGhyZWFkX2luZm8udXNlcl9jZmlfc3RhdGUudWJjZmlfZW4gPSBlbmFi
bGUgPyAxIDogMDsKPgo+IC0gICAgICAgaWYgKGVuYWJsZSkKPiAtICAgICAgICAgICAgICAgdGFz
ay0+dGhyZWFkLmVudmNmZyB8PSBFTlZDRkdfU1NFOwo+IC0gICAgICAgZWxzZQo+IC0gICAgICAg
ICAgICAgICB0YXNrLT50aHJlYWQuZW52Y2ZnICY9IH5FTlZDRkdfU1NFOwo+IC0KPiAtICAgICAg
IGNzcl93cml0ZShDU1JfRU5WQ0ZHLCB0YXNrLT50aHJlYWQuZW52Y2ZnKTsKPiArICAgICAgIGVu
dmNmZ191cGRhdGVfYml0cyh0YXNrLCBFTlZDRkdfU1NFLCBlbmFibGUgPyBFTlZDRkdfU1NFIDog
MCk7Cj4gIH0KPgo+ICB2b2lkIHNldF9zaHN0a19sb2NrKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFz
aywgYm9vbCBsb2NrKQo+IEBAIC05NiwxMiArOTIsNyBAQCB2b2lkIHNldF9pbmRpcl9scF9zdGF0
dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBib29sIGVuYWJsZSkKPgo+ICAgICAgICAgdGFz
ay0+dGhyZWFkX2luZm8udXNlcl9jZmlfc3RhdGUudWZjZmlfZW4gPSBlbmFibGUgPyAxIDogMDsK
Pgo+IC0gICAgICAgaWYgKGVuYWJsZSkKPiAtICAgICAgICAgICAgICAgdGFzay0+dGhyZWFkLmVu
dmNmZyB8PSBFTlZDRkdfTFBFOwo+IC0gICAgICAgZWxzZQo+IC0gICAgICAgICAgICAgICB0YXNr
LT50aHJlYWQuZW52Y2ZnICY9IH5FTlZDRkdfTFBFOwo+IC0KPiAtICAgICAgIGNzcl93cml0ZShD
U1JfRU5WQ0ZHLCB0YXNrLT50aHJlYWQuZW52Y2ZnKTsKPiArICAgICAgIGVudmNmZ191cGRhdGVf
Yml0cyh0YXNrLCBFTlZDRkdfTFBFLCBlbmFibGUgPyBFTlZDRkdfTFBFIDogMCk7Cj4gIH0KPgo+
ICB2b2lkIHNldF9pbmRpcl9scF9sb2NrKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgYm9vbCBs
b2NrKQoKTEdUTQoKUmV2aWV3ZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KCj4g
LS0KPiAyLjUyLjAKPgo+IGJhc2UtY29tbWl0OiBhOTBlZTQzMDVjNGE1ZGY3MmMxMWIzMWRhY2Zk
Yzc2ZTAwZmNmNzhhCj4gYnJhbmNoOiB1cC9jZmktZml4ZXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
