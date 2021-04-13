Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343B4C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 11:35:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FAA661244
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 11:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FAA661244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:Date:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d5K8sxB2ywZKgpSv58WX12KAmtKCxU3qdGvMac/LgrU=; b=YoQ5qeYj4jWxLlkAQNOkjmHZU
	lHYz+C9XqS9bMiZfGQ6OEK2FDeMAmyxZJgB5X7xqAsyxgrq1cEWkab81uBwV0LswkYOrBzouJN1fb
	GtXmAkhjnoaYXkfGwpOcGlnQ6bTKXLgXxiVCRFhYpMA6RUH73kgzJontCDzldg5Mi5lCV9ZoV8KVH
	wZqM3ls0j4bTGCFoWMqTlKmVixVnpUt5jesxnsE5wxUjvNdYYBrmTkvdEaD4E8qE2AZoQQUu+UItV
	fTGfiMwrh2ve3UrLbNp9+UugHvNX9GZF/WIXlGCF2yc317M0LuuqDiB/vY5y7N0CoqZ3rmzy6HOwl
	T5Yw9VX5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWHKD-00951S-KH; Tue, 13 Apr 2021 11:35:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGzd-008zLI-7E
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 11:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:In-reply-to:Date:Subject:Cc:To:From:
 References:Sender:Reply-To:Content-ID:Content-Description;
 bh=Cu3neruluoSCQXicI1kgn+ehmqNJHkuNyetxZuBFmfY=; b=1+99BHBOmxY6DUZht0/nJQvXc+
 m8yp/6gtBtLNoznHCUM3vKLJ3A5uoKVliFeGhjF0pxD+j9EzbifDs0aW8va4okip703Mb6MooCnPW
 7OFE36rBgN3g1knYus2JrbRCOpcQf9IdhYH3u62BxdM9emeZeGW7F9E0zjMoeb5IZj19LpTbHMett
 6osXjOAsVYqboiblscVv+l9FHtCdz1reR8rwpUDdtDfbBbNE9uPefvx+kIwXcLoLZqvEhseMEGzv1
 CaYYNX8magtMz2r+2Mw3JXIHu4aglJbKRokDWjZfiNVoaoQs5aH73qabZfrA01p3i/9SUDYH1KBEt
 tkdlOdWQ==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGza-006xYB-Ix
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 11:14:03 +0000
Received: by mail-wr1-x436.google.com with SMTP id h4so6999496wrt.12
 for <linux-riscv@lists.infradead.org>; Tue, 13 Apr 2021 04:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Cu3neruluoSCQXicI1kgn+ehmqNJHkuNyetxZuBFmfY=;
 b=hfiiqOLquAbv0Zo8WwVW2P07q1yK3rArOdZiB3bFdqqgKEY4lhM+0k9N7CEc6B7dmD
 //pm3E0tK9HCL2QxUb6/PVLhUGdQc10kea72DZarCyaqCO0WxxJqcCLQmwn7hJEkjfoH
 2Iiqt6IqBtzKI9PfTgrsHx2BGKb2PpShkXb0fjnkpqqjDf78j39yJlk3ZbEDkvgPa93c
 2/cJipB4xQ+mHSaKtRMPfX/Lxs8cPxa8S+O7QT1OJ0UHk1/ZbjFuQ8awzP/0P8bG1Q6w
 hzU5VD/Pn9vta+7UKZmMtV44h1AS9WC2Ii173EYi71sMGuGasWPvDVwjcwUHvycImZde
 gRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Cu3neruluoSCQXicI1kgn+ehmqNJHkuNyetxZuBFmfY=;
 b=dT9wIFi7R+D6fSRKxkfw3GmjPNTEX9h3oNhcX+Sz82JMMYN+wjPiCZurN6DkffQa33
 QI6R0Pg2pFM8foWrjj9iSiY8Uw/vw63+fPD1kYPW5Z2yx09bLkcpDEfjdWjW1SDQYA2m
 V/6Yc6b5sKSZyao5zkkUAOvBwJJyCfcbS9bad50bV/3Tj7shiCb0BFURmctvvmHSIyyH
 G/2FM0pkFyf7lZ4MQm3VPJG1/TEqUOxfSmcBAcDIvdUgnrkNUQ5epdRr4J9oguv5jqZ4
 WRXv8OdjTTktziBOYFF3qI5azP14K1fOCRyLljEBo89+DjN6iY6PYM06SYjcRqkM86L0
 MXtw==
X-Gm-Message-State: AOAM530zJ1o4fTWErGeL3Y2hkqycVtXiqfbpDXWvor5DlQ+gaLNIryBP
 IeuAx0asKaXJRsNa22RZY1JRuA==
X-Google-Smtp-Source: ABdhPJzY9shCczKjSRW6Y2rpwOvSTMSuxueUgRqhkgPrE9aInqm3+aebb0vYVhHDuo9TmXBtfSBYUQ==
X-Received: by 2002:a5d:43c1:: with SMTP id v1mr11267064wrr.419.1618312432810; 
 Tue, 13 Apr 2021 04:13:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j6sm2130276wmq.16.2021.04.13.04.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 04:13:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 012321FF7E;
 Tue, 13 Apr 2021 12:13:50 +0100 (BST)
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <43f1ee89-89f3-95a3-58f1-7a0a12c2b92f@metux.net>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 corbet@lwn.net, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
 mst@redhat.com, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-riscv@lists.infradead.org, Jean-Philippe Brucker
 <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Date: Tue, 13 Apr 2021 12:07:58 +0100
In-reply-to: <43f1ee89-89f3-95a3-58f1-7a0a12c2b92f@metux.net>
Message-ID: <87lf9mmo7l.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_041402_647159_89858EEC 
X-CRM114-Status: GOOD (  23.60  )
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

CiJFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3VsdCIgPGluZm9AbWV0dXgubmV0PiB3cml0
ZXM6Cgo+IE9uIDA0LjEyLjIwIDA0OjM1LCBKYXNvbiBXYW5nIHdyb3RlOgo+Cj4gSGksCj4KPj4g
SXMgdGhlIHBsYW4gdG8ga2VlcCB0aGlzIGRvYyBzeW5jZWQgd2l0aCB0aGUgb25lIGluIHRoZSB2
aXJ0aW8KPj4gc3BlY2lmaWNhdGlvbj8KPgo+IFllcywgb2YgY291cnNlLiBJJ20gc3RpbGwgaW4g
cHJvZ3Jlc3Mgb2YgZG9pbmcgdGhlIGJlYXVyb2NyYXRpYyBzdHVmZiB3Lwo+IHZpcnRpby10YyBm
b2xrcyAoSUQgcmVnaXN0cmF0aW9uLCAuLi4pIC0geWV0IGhhdmUgdG8gc2VlIHdoZXRoZXIgdGhl
eQo+IHdhbm5hIGFkZCBpdCB0byB0aGVpciBzcGVjIGRvY3VtZW50cyAuLi4KPgo+IEJUVzogaWYg
eW91IGZlZWwsIHNvbWV0aW5ncyBub3QgZ29vZCB3LyB0aGUgY3VycmVudCBzcGVjLCBwbGVhc2Ug
cmFpc2UKPiB5b3VyIHZvaWNlIG5vdy4KPgo+PiBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIHVzZSB1
OCBvdCB1aW50OF90IGhlcmUuR2l0IGdyZXAgdG9sZCBtZSB0aGUKPj4gZm9ybWVyIGlzIG1vcmUg
cG9wdWxhciB1bmRlciBEb2N1bWVudGF0aW9uLy4KPgo+IHRoeCwgSSdsbCBmaXggdGhhdAo+Cj4+
PiArLSBmb3IgdmVyc2lvbiBmaWVsZCBjdXJyZW50bHkgb25seSB2YWx1ZSAxIHN1cHBvcnRlZC4K
Pj4+ICstIHRoZSBsaW5lIG5hbWVzIGJsb2NrIGhvbGRzIGEgc3RyZWFtIG9mIHplcm8tdGVybWlu
YXRlZCBzdHJpbmdzLAo+Pj4gK8KgIGhvbGRpbmcgdGhlIGluZGl2aWR1YWwgbGluZSBuYW1lcy4K
Pj4gCj4+IEknbSBub3Qgc3VyZSBidXQgZG9lcyB0aGlzIG1lYW4gd2UgZG9uJ3QgaGF2ZSBhIGZp
eGVkIGxlbmd0aCBvZiBjb25maWcKPj4gc3BhY2U/IE5lZWQgdG8gY2hlY2sgd2hldGhlciBpdCBj
YW4gYnJpbmcgYW55IHRyb3VibGUgdG8KPj4gbWlncmF0aW9uKGNvbXBhdGliaWxpdHkpLgo+Cj4g
WWVzLCBpdCBkZXBlbmRzIG9uIGhvdyBtYW55IGdwaW8gbGluZXMgYXJlIHByZXNlbnQgYW5kIGhv
dyBtdWNoIHNwYWNlCj4gdGhlaXIgbmFtZXMgdGFrZSB1cC4KPgo+IEEgZml4ZWQgc2l6ZSB3b3Vs
ZCBlaXRoZXIgcHV0IHVucGxlYXNlbnQgbGltaXRzIG9uIHRoZSBtYXggbnVtYmVyIG9mCj4gbGlu
ZXMgb3Igd2FzdGUgYSBsb3Qgc3BhY2Ugd2hlbiBvbmx5IGZldyBsaW5lcyBwcmVzZW50Lgo+Cj4g
Tm90IHRoYXQgdmlydGlvLWdwaW8gaXMgYWxzbyBtZWFudCBmb3Igc21hbGwgZW1iZWRkZWQgd29y
a2xvYWRzIHJ1bm5pbmcKPiB1bmRlciBzb21lIGh5cGVydmlzb3IuCj4KPj4+ICstIHVuc3BlY2lm
aWVkIGZpZWxkcyBhcmUgcmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1c2UgYW5kIHNob3VsZCBiZSB6ZXJv
Lgo+Pj4gKwo+Pj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gK1ZpcnRxdWV1ZXMgYW5k
IG1lc3NhZ2VzOgo+Pj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gKwo+Pj4gKy0gUXVl
dWUgIzA6IHRyYW5zbWlzc2lvbiBmcm9tIGhvc3QgdG8gZ3Vlc3QKPj4+ICstIFF1ZXVlICMxOiB0
cmFuc21pc3Npb24gZnJvbSBndWVzdCB0byBob3N0Cj4+IAo+PiAKPj4gVmlydGlvIGJlY2FtZSBt
b3JlIGEgcG9wdWxhciBpbiB0aGUgYXJlYSB3aXRob3V0IHZpcnR1YWxpemF0aW9uLiBTbyBJCj4+
IHRoaW5rIGl0J3MgYmV0dGVyIHRvIHVzZSAiZGV2aWNlL2RyaXZlciIgaW5zdGVhZCBvZiAiaG9z
dC9ndWVzdCIgaGVyZS4KPgo+IEdvb2QgcG9pbnQuIEJ1dCBJJ2QgcHJlZmVyICJjcHUiIGluc3Rl
YWQgb2YgImRyaXZlciIgaW4gdGhhdCBjYXNlLgoKSSB0aGluayB5b3UgYXJlIGdvaW5nIHRvIHRp
ZSB5b3Vyc2VsZiB1cCBpbiBrbm90cyBpZiB5b3UgZG9uJ3QgbW92ZSB0aGlzCnRvIHRoZSBPQVNJ
UyBzcGVjLiBUaGUgcmVhc29uIGJlaW5nIHRoZSBWaXJ0SU8gc3BlYyBoYXMgZGVmaW5pdGlvbnMg
Zm9yCndoYXQgYSAiRGV2aWNlIiBhbmQgYSAiRHJpdmVyIiBpcyB0aGF0IGFyZSBjbGVhciBhbmQg
dW5hbWJpZ3VvdXMuIFRoZQp1cHN0cmVhbSBzcGVjIHNob3VsZCBiZSBjb25zaWRlcmVkIHRoZSBj
YW5vbmljYWwgc291cmNlIG9mIHRydXRoIGZvciBhbnkKaW1wbGVtZW50YXRpb24gKExpbnV4IG9y
IG90aGVyd2lzZSkuCgpCeSBhbGwgbWVhbnMgaGF2ZSB0aGUgZGlzdGlsbGVkIGRvY3VtZW50YXRp
b24gZm9yIHRoZSBkcml2ZXIgaW4gdGhlCmtlcm5lbCBzb3VyY2UgdHJlZSBidXQgdHJ5aW5nIHRv
IHVwc3RyZWFtIGFuIGltcGxlbWVudGF0aW9uIGJlZm9yZQpzdGFydGluZyB0aGUgZGVmaW5pdGlv
biBpbiB0aGUgc3RhbmRhcmQgaXMgYSBsaXR0bGUgYmFjayB0byBmcm9udCBJTUhPKi4KCiogdGhh
dCdzIG5vdCB0byBzYXkgdGhlc2UgdGhpbmdzIGNhbid0IGJlIGRvbmUgaW4gcGFyYWxsZWwgYXMg
dGhlIHNwZWMKICBpcyByZXZpZXdlZCBhbmQgd29ya2VkIG9uIGFuZCB0aGUga2lua3Mgd29ya2Vk
IG91dCBidXQgeW91IHdhbnQgdGhlCiAgZmluYWwgb3JkZXIgb2YgdXBzdHJlYW1pbmcgdG8gc3Rh
cnQgd2l0aCB0aGUgc3BlYy4KCi0tIApBbGV4IEJlbm7DqWUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
