Return-Path: <SRS0=rfC7=BJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE27C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 18:53:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B66820809
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 18:53:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KpJevTf9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cs.washington.edu header.i=@cs.washington.edu header.b="aNmEAluR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B66820809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cs.washington.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b2LKBi1x/4ePIuj+7eoRlIQ8VDafQqh/I5A9/t8Em/A=; b=KpJevTf9zE0xmjkd5xdQgyJeF
	IRORCPgfauUwz75q8T2sSDsL3c0Oi8h2cVXQH7JMOgHw2DVxImUwFZjxJ4vkGMaT2C4zD8hB1FTtm
	0zFvFTHfF7i3NUfl0Sj+K+XgRfo10+ykosbmNrwCdg8mZsVGf94Dpy+H0IqhJXscjrSOfzwKfpLoD
	1x75NbDzgRAEA7AcuG4IisOhSCzQ6iI1W5V4EiO521/VFqA7tPY3sINJny3sdrQC52OmbokzRI9xn
	DuqPTCxo7pNIshvos4SVmwBdzETY2EtwCVVeP2cByYaN1Q4d03Rzhggs6xg/yldot9hXUR0NQGuAY
	L/9/DWdZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1DgE-0003Aw-UA; Thu, 30 Jul 2020 18:53:26 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1DgB-00038G-OK
 for linux-riscv@lists.infradead.org; Thu, 30 Jul 2020 18:53:24 +0000
Received: by mail-il1-x143.google.com with SMTP id l17so13144691ilq.13
 for <linux-riscv@lists.infradead.org>; Thu, 30 Jul 2020 11:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cs.washington.edu; s=goo201206;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=42l4ctj1Gypy+YF97+QpYMW91oh26x5wOMqUsgssC6s=;
 b=aNmEAluRstld+RIo7hQUz4NM8ImkejUWF/fEJtMXvDNc1ZLsHGVAj1sX3XZx8SHsBT
 DQnU61itpM1kTzbT6mU+RlB4m8Oj08Z/4BRq1prQZadsUGnlY7giifhAe0vxUFe3EFyZ
 bFf7SgKzakHLoGV7Jfie/FBaf3nE9fJVIOMJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=42l4ctj1Gypy+YF97+QpYMW91oh26x5wOMqUsgssC6s=;
 b=UHGnJgv3m8LHFNmXO9O/niMyrLftyGrdqVqZI07/r+EJC7akASD3pIVBUtgPGd3+7V
 junWly4Dwycng+nCj8gxF5bcJiXMBmnRP83I144MjEgrQAT0A0Fn7kfI91+MtRKljJe/
 YkIattFtdyEAH0h/BPetp6gbxxVhgsY5SftS4msD3IW+zU7ZJitlO2dM8psLIvw+vIvo
 FxbMqhZkY1ePf7F2/9xNt4wJaYRx6vNyg8HR66524sI8gUCHBNntL8AmcC/aiBErKk4r
 eOyNDcB+ZEkLuOfgoGw2bYmCU+AaBbzOEYnhcH3CPFv9vrgsuQYtjL9SY75Rh2fbiycS
 QOrg==
X-Gm-Message-State: AOAM532SFP0lfzbDQ86+ph5goLDJ2jGLRZAg+QOpqALyOHbrQAZznWeL
 uGzl9jP/CKI7pHBuXEDf7Tk+5g0XE06P1PGb+dDyvg==
X-Google-Smtp-Source: ABdhPJxSedzy/Q7HXRU/z9wJWqDWTBmt62c9ADo7O1Zj105UNNtxV6tpIvvZ5SGx50X91HnHl5zU5uT1AtbgwHDVVFY=
X-Received: by 2002:a92:918b:: with SMTP id e11mr29802679ill.201.1596135196772; 
 Thu, 30 Jul 2020 11:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200722152422.72532-1-kernel@esmil.dk>
 <20200722152422.72532-2-kernel@esmil.dk>
In-Reply-To: <20200722152422.72532-2-kernel@esmil.dk>
From: Luke Nelson <lukenels@cs.washington.edu>
Date: Thu, 30 Jul 2020 11:53:06 -0700
Message-ID: <CADasFoDfRwcfFHM_Sa-HzwSDyXEr2PNu3Wfe5riwZJM9XsELBQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] riscv: Clean up module relocations
To: Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_145323_857726_2865D83A 
X-CRM114-Status: GOOD (  12.27  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, LKML <linux-kernel@vger.kernel.org>,
 Zong Li <zong@andestech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org,
 Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhhbmtzIGZvciB0aGUgcGF0Y2ghCgo+IEFsc28gUklTQy1WIGhhcyBhIG51bWJlciBvZiBpbnN0
cnVjdGlvbiBwYWlycyB0bwo+IGdlbmVyYXRlIDMyYml0IGltbWVkaWF0ZXMgb3IganVtcC9jYWxs
IG9mZnNldHMuIEVnLjoKPgo+IGx1aSAgIHJkLCBoaTIwCj4gYWRkaSAgcmQsIHJkLCBsbzEyCgpP
biBSVjY0LCBib3RoIGhpMjAgZnJvbSBsdWkgYW5kIGxvMTIgZnJvbSBhZGRpIGFyZSBzaWduLWV4
dGVuZGVkIHRvIDY0IGJpdHMuClRoaXMgbWVhbnMgdGhhdCB0aGVyZSBhcmUgc29tZSAzMi1iaXQg
c2lnbmVkIG9mZnNldHMgKGluIHRoZSByYW5nZQpbMl4zMS0yXjExLCAyXjMxLTFdKQp0aGF0IGFy
ZSBub3QgZW5jb2RhYmxlIHVzaW5nIChsdWkrYWRkaSksIChhdWlwYytqYWxyKSwgZXRjLiAoc2Vl
CmRpc2N1c3Npb24gYXQgWzFdKS4KClRoZSBmb2xsb3dpbmcgbm90ZSBpcyBmcm9tIHRoZSBJU0Eg
bWFudWFsOgo+Pj4gTm90ZSB0aGF0IHRoZSBzZXQgb2YgYWRkcmVzcyBvZmZzZXRzIHRoYXQgY2Fu
IGJlIGZvcm1lZCBieSBwYWlyaW5nIExVSSB3aXRoIExELAo+Pj4gQVVJUEMgd2l0aCBKQUxSLCBl
dGMuIGluIFJWNjRJIGlzIFviiJIyXjMx4oiSMl4xMSwgMl4zMeKIkjJeMTHiiJIxXS4KClRoZSBl
eGlzdGluZyBjb2RlIGFuZCB0aGUgbmV3IGNvZGUgYm90aCBzZWVtIGJ1Z2d5IGlmIHRoZSBvZmZz
ZXQgaGFwcGVucyB0bwpiZSBhIDMyLWJpdCBpbnQgYnV0IGZhbGxzIG91dHNpZGUgb2YgdGhlIGVu
Y29kYWJsZSByYW5nZS4KCj4gKyAgICAgICBpZiAob2Zmc2V0ICE9IChzMzIpb2Zmc2V0KSB7Cj4g
Wy4uLl0KPiArICAgICAgIGlmIChvZmZzZXQgIT0gKHMzMilvZmZzZXQpIHsKPiBbLi4uXQoKVGhl
c2UgY2hlY2tzIHNob3VsZCBwcm9iYWJseSBiZSByZXBsYWNlZCB3aXRoIHNvbWV0aGluZyBzaW1p
bGFyIHRvCndoYXQncyB1c2VkIGluIHRoZSBSVjY0IEJQRiBKSVQgaGVyZTogWzJdLApleGNlcHQg
dGhhdCB0aGlzIGNvZGUgc2hvdWxkIGNoZWNrIGlmIHVzaW5nIFJWMzIgb3IgUlY2NCwgc2luY2Ug
dGhlCmVuY29kYWJsZSByYW5nZSBkaWZmZXJzIGZvciBlYWNoLgoKPiBNeSBob3BlIGlzIHRoYXQg
d2UgY2FuIGV2ZW50dWFsbHkgZmFjdG9yIG91dCB0aGUgY29kZSB0byBnZW5lcmF0ZQo+IGltbWVk
aWF0ZXMgYW5kIGluc3RydWN0aW9ucyBzbyBpdCBjYW4gYmUgcmV1c2VkIGJvdGggaGVyZSwgaW4g
dGhlCj4ganVtcC1sYWJlbCBjb2RlIGFuZCBpbiB0aGUgYnBmLWppdCBjb2RlLCBidXQgbGV0J3Mg
dGFrZSBpdAo+IG9uZSBzdGVwIGF0IGEgdGltZS4KClRoaXMgc291bmRzIGdyZWF0ISBIYXZpbmcg
ZmV3ZXIgY29waWVzIG9mIFJJU0MtViBlbmNvZGluZyBsb2dpYyBhcm91bmQgd2lsbApob3BlZnVs
bHkgZGVjcmVhc2UgdGhlIGxpa2VsaWhvb2Qgb2YgYnVncyA6KSBTb21lIG90aGVyIGFyY2hzIGFs
cmVhZHkKaGF2ZSBzaGFyZWQKaW5mcmFzdHJ1Y3R1cmUgZm9yIGRvaW5nIGluc3RydWN0aW9uIGVu
Y29kaW5nIChlLmcuLCBpbgphcmNoL2FybTY0L2tlcm5lbC9pbnNuLmMpOwp3ZSBzaG91bGQgY29u
c2lkZXIgZG9pbmcgc29tZXRoaW5nIHNpbWlsYXIgZm9yIFJJU0MtVi4KCi0gTHVrZSBOZWxzb24K
ClsxXTogaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9hL2dyb3Vwcy5yaXNjdi5vcmcvZm9ydW0v
IyF0b3BpYy9pc2EtZGV2L2J3V0ZoQm5uWkZRClsyXTogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnBmL2JwZi5naXQvY29tbWl0Lz9pZD00ODk1NTNkZDEz
YTg4ZDhhODgyZGIxMDYyMmJhOGI5YjU4NTgyY2U0CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
