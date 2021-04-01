Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89544C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 06:17:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C83661055
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 06:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C83661055
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xlwGwLwbh4xDZ7zmsEpGvnqh5WuqexLbEVOZgm0xC/Q=; b=guENS4lWY2rE4Schh8WftCyU1
	VT29W6m8X8gfd2SBXp6h6nfwc/Z8/RrTvsATVNvHdxy6pyyTRLT96hV+UXP7i3aG8Sjd6svc45fAm
	q8pktcEWdpiBJ05HxsyxIzpG3Li53rPFrVocE7RjFpLh1RJbE0p9TSfS/frK1IflAN8Qyi8WAOnfD
	rdtUvryN+W17FRv3qAYGgdrD4mDI0JGOA+vJ7kISG/l8UelBNF5lbBi8AuFAhM4pdc5ZyzebDxWpH
	cApx8hWZa20TnYuuQ/DN4BAo4PZ8eyk59cX6tdh+RvNcSxYw8mTFzhIvzK5oYqQ9s/uep3lHKy7Hh
	xo04yzRhg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRqdK-008elG-89; Thu, 01 Apr 2021 06:16:46 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRqdE-008ekj-Km
 for linux-riscv@lists.infradead.org; Thu, 01 Apr 2021 06:16:44 +0000
Received: by mail-qk1-x72e.google.com with SMTP id 7so1212380qka.7
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 23:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/tdHq+eMgfvUCfgr19g4KGgjUw8dwNFaPcptJLMvv20=;
 b=d1tet9Y2otJ4bPKkudFR7D1GN4TSxbb31ttdrlkl/P3sIGNBKqc6I78rPuwagFZLLP
 91dZeX1IuFNgTohpD/7akTLAyWiZR/t0GCbC7hQJFaTYIzg/1yxYzN48AUTERaZYb92I
 d5X5ASx9YOH20slwp7tXU1V8OlvUf4JNjbmasNAhuntVXe11XdwFpLt/Pqm/VPF3LI98
 wj9AKLkB4qVEmBFKJposxVO3VlPRrmBgrjmHiJRND+jlasqobxNVWZF6L0k5Po8PJh5Q
 DK3ZIR+/syfAhiRsujKvn1J0W61ILlAfeucEfPwH7DPcWSxFLVCfg/WaEjEWdcWbeJQO
 TDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/tdHq+eMgfvUCfgr19g4KGgjUw8dwNFaPcptJLMvv20=;
 b=H+hO6knhSA553/24yY88OfJWzaGnofefdpulCLuFxwHoxvSw8I67bT6oJRWTTTcn1p
 r1Xqw7MSdQBXJL+Dtbp/PrmknFueKNcW/7TNGzU9yQuwQCZsudbVuRLNEHgsZZqb4JBa
 hxJgqZHK9/qdIvLHKRc/HV5xgoU+b0zglWdYm/JsGWH55QUgUTROebhOy2Qb7X2VwvHC
 17x9+8BJ3CA2bBRyJtfioUQXUbNIJXjy1W7xRzCSKG0LNTHb4e5M4pd5m6QnJQC5iEHo
 YgCtzLtGeeaqddJq+Ig4ZzPzSNHGKphLiZtrfsrBG0/ZlbDckGSSSFZoITvDbe1XsULZ
 uhzw==
X-Gm-Message-State: AOAM532IbaDsV6EvlszZq9u9lm5kFFtzjlSaoFuYG4lPAr6XwhmeeST5
 rl6lr+OT2jgpfZ8GRCNFqjHY7NV39cd03Dg2o5o0Iw==
X-Google-Smtp-Source: ABdhPJxN7gKZfahwJhOWLIepnEZQQrrtp1Bkzqp9sIf8uf8W7egGtdMcqMlqet9G2ktx96KkylccNRofqZFJM0jdU/A=
X-Received: by 2002:a37:66cd:: with SMTP id a196mr7046403qkc.374.1617257799357; 
 Wed, 31 Mar 2021 23:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615954045.git.greentime.hu@sifive.com>
 <161704512808.3012082.7539298875497991635@swboyd.mtv.corp.google.com>
In-Reply-To: <161704512808.3012082.7539298875497991635@swboyd.mtv.corp.google.com>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Thu, 1 Apr 2021 14:16:28 +0800
Message-ID: <CAHCEehJyzsTOHpMhRQ4U3Ex+QiO8h2emBAq3ZemFrgqB-XRZNw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Add SiFive FU740 PCIe host controller driver
 support
To: Stephen Boyd <sboyd@kernel.org>
Cc: alex.dewar90@gmail.com, Albert Ou <aou@eecs.berkeley.edu>, 
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, 
 Erik Danie <erik.danie@sifive.com>, hayashi.kunihiko@socionext.com, 
 Bjorn Helgaas <helgaas@kernel.org>, hes@sifive.com, jh80.chung@samsung.com, 
 khilman@baylibre.com, linux-clk@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-pci@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, lorenzo.pieralisi@arm.com, 
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 robh+dt@kernel.org, vidyas@nvidia.com, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_071641_621637_50AE4D91 
X-CRM114-Status: GOOD (  13.89  )
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

U3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPiDmlrwgMjAyMeW5tDPmnIgzMOaXpSDpgLHk
uowg5LiK5Y2IMzoxMuWvq+mBk++8mgo+Cj4gUXVvdGluZyBHcmVlbnRpbWUgSHUgKDIwMjEtMDMt
MTcgMjM6MDg6MDcpCj4gPiBUaGlzIHBhdGNoc2V0IGluY2x1ZGVzIFNpRml2ZSBGVTc0MCBQQ0ll
IGhvc3QgY29udHJvbGxlciBkcml2ZXIuIFdlIGFsc28KPiA+IGFkZCBwY2llX2F1eCBjbG9jayBh
bmQgcGNpZV9wb3dlcl9vbl9yZXNldCBjb250cm9sbGVyIHRvIHByY2kgZHJpdmVyIGZvcgo+ID4g
UENJZSBkcml2ZXIgdG8gdXNlIGl0Lgo+ID4KPiA+IFRoaXMgaXMgdGVzdGVkIHdpdGggZTEwMDBl
OiBJbnRlbChSKSBQUk8vMTAwMCBOZXR3b3JrIENhcmQsIEFNRCBSYWRlb24gUjUKPiA+IDIzMCBn
cmFwaGljcyBjYXJkIGFuZCBTUCBNLjIgUENJZSBHZW4gMyBTU0QgaW4gU2lGaXZlIFVubWF0Y2hl
ZCBiYXNlZCBvbgo+ID4gdjUuMTEgTGludXgga2VybmVsLgo+Cj4gQ2FuIEkgbWVyZ2UgdGhlIGNs
ayBwYXRjaGVzIHRvIGNsay1uZXh0PyBPciBpcyB0aGUgZHRzIHBhdGNoIGdvaW5nIHRvIGJlCj4g
c2VudCBpbiBmb3IgdGhlIG1lcmdlIHdpbmRvdz8gSSdkIGxpa2UgdG8gbWVyZ2UgdGhlIGNsayBw
YXRjaGVzIGlmIHRoZQo+IG90aGVyIHBhdGNoZXMgYXJlIGdvaW5nIHRvIG1pc3MgdGhlIG5leHQg
bWVyZ2Ugd2luZG93LgoKSGkgU3RlcGhlbiwKClRoYW5rIHlvdSBmb3IgcmV2aWV3aW5nLiBJIGFt
IG9rIHdpdGggZWl0aGVyIHdheS4gOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
