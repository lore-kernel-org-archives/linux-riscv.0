Return-Path: <SRS0=s7xG=NB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50F7C4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Aug 2021 01:31:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 330F360E97
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Aug 2021 01:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 330F360E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MDZbiF42tI03fwbS2CJn2wAqKP0fDpTrxyiPyzm/K8=; b=DuiMovsdhL5h7i
	u1g7hNE/6lQmW6BzIdKYyW77s/aDAGhYmjARRVf77lecrHISp7Za7j6rLH+gmGDIvCXQGsOARv7yz
	X7r1OmYAyCCm64PBX6mcj5mK32NyX3I8Zz3jysqoK98qWPYif7ZJxLKdNDw3CzioWrtwpYeXd8fz4
	aHgUsV2kmQE/pq61yGOrgWyvsmZ7C99NWAgpKvz+8tReSkTSbCTov1fBgxJ/rhaGTCIMpfbtHdCP/
	yl5H069MQy9wT3zlNc+wb21+PvR2YG3E6hkaEvrVgXFqbynFlu8I2Y1EOVYqdZ1J6buMbmOqsm+gx
	yMaz7SCDrdlHC7BVx9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDGbR-002Drw-L5; Tue, 10 Aug 2021 01:30:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDGbM-002Dqi-Ed
 for linux-riscv@lists.infradead.org; Tue, 10 Aug 2021 01:30:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 630696105A
 for <linux-riscv@lists.infradead.org>; Tue, 10 Aug 2021 01:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628559043;
 bh=S42P87zuOxcShQBFog8uPKE6+86eeoijqysy2RGAP6Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oXbyQ+/6McNx6XOrHDKr9vnNwpwajhsipBglzuTLxlVf3Ypc3mRGk1PsZOp9Npmuc
 PvbQY/U9I1noVOLzCKG/Rc68/hQ3bQzc6Lh6ySXRaeAdGDQ38ubcQR6z/JiweKLOIl
 CiGArjGM7CtjEZClcLSq3t04xq/f7epiyagr/qn8VI3ddsJ1opNH1F0ruSpdznb1/F
 33T8laf5U30ndMegErBsStj0mhEHJbfyBhLUEkEnUMqqgTgn2eCPMHYPXvDP8lHU/H
 wrnLlVxuQPHvZZsnutZ10+vPWSRPwVp2Q8yULRpV6k5tuhTW0uBc6ZQHQsoTwBiRWt
 63UKy5f+CH75Q==
Received: by mail-lf1-f54.google.com with SMTP id b6so21667275lff.10
 for <linux-riscv@lists.infradead.org>; Mon, 09 Aug 2021 18:30:43 -0700 (PDT)
X-Gm-Message-State: AOAM533bM4NjLvHSmwiXIC4VN3/m3x0Gvc5ejFQoc/1yj8GtMw82O1JY
 Nv8RCn5PN83h+zRvOL/ZWJPmP1tOAo83ZcxZX7w=
X-Google-Smtp-Source: ABdhPJw9OPdu/bMj6+nQcqx2Of0EJ7zweLdKgPop70koiNNTZpEc8HxMacnrohGa3cIHb1iRqhZg/sL2HKygJpeI0+c=
X-Received: by 2002:ac2:454f:: with SMTP id j15mr20404372lfm.555.1628559041654; 
 Mon, 09 Aug 2021 18:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210807145537.124744-1-xianting.tian@linux.alibaba.com>
 <20210809003044.6692ddce@xhacker>
 <6a189d9d-b35d-3a15-5bfa-172c50e60c8c@linux.alibaba.com>
In-Reply-To: <6a189d9d-b35d-3a15-5bfa-172c50e60c8c@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 10 Aug 2021 09:30:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTjBDF9cpN4J=ff2pCLXjc9uoBpfTzeTHhMAwg7OCShfA@mail.gmail.com>
Message-ID: <CAJF2gTTjBDF9cpN4J=ff2pCLXjc9uoBpfTzeTHhMAwg7OCShfA@mail.gmail.com>
Subject: Re: [PATCH] riscv: add ARCH_DMA_MINALIGN support
To: Xianting TIan <xianting.tian@linux.alibaba.com>
Cc: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_183044_568170_D3F15373 
X-CRM114-Status: GOOD (  23.87  )
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

T24gTW9uLCBBdWcgOSwgMjAyMSBhdCA5OjU1IEFNIFhpYW50aW5nIFRJYW4KPHhpYW50aW5nLnRp
YW5AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4KPiDlnKggMjAyMS84Lzkg5LiK5Y2IMTI6
MzAsIEppc2hlbmcgWmhhbmcg5YaZ6YGTOgo+ID4gT24gU2F0LCAgNyBBdWcgMjAyMSAyMjo1NToz
NyArMDgwMAo+ID4gWGlhbnRpbmcgVGlhbiA8eGlhbnRpbmcudGlhbkBsaW51eC5hbGliYWJhLmNv
bT4gd3JvdGU6Cj4gPgo+ID4+IEludHJvZHVjZSBBUkNIX0RNQV9NSU5BTElHTiB0byByaXNjdiBh
cmNoLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogWGlhbnRpbmcgVGlhbiA8eGlhbnRpbmcudGlh
bkBsaW51eC5hbGliYWJhLmNvbT4KPiA+PiAtLS0KPiA+PiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY2FjaGUuaCB8IDIgKysKPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
PiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlLmgKPiA+PiBpbmRleCA5YjU4YjEwNDUuLjI5NDVi
YmUyYiAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlLmgKPiA+
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlLmgKPiA+PiBAQCAtMTEsNiArMTEs
OCBAQAo+ID4+Cj4gPj4gICAjZGVmaW5lIEwxX0NBQ0hFX0JZVEVTICAgICAgICAgICAgICgxIDw8
IEwxX0NBQ0hFX1NISUZUKQo+ID4+Cj4gPj4gKyNkZWZpbmUgQVJDSF9ETUFfTUlOQUxJR04gICBM
MV9DQUNIRV9CWVRFUwo+ID4gSXQncyBub3QgYSBnb29kIGlkZWEgdG8gYmxpbmRseSBzZXQgdGhp
cyBmb3IgYWxsIHJpc2N2LiBGb3IgImNvaGVyZW50Igo+ID4gcGxhdGZvcm1zLCB0aGlzIGlzIG5v
dCBuZWNlc3NhcnkgYW5kIHdpbGwgd2FzdGUgbWVtb3J5LgoKcXVvdGUgZnJvbSBzbGFiLmg6CiAq
IFNvbWUgYXJjaHMgd2FudCB0byBwZXJmb3JtIERNQSBpbnRvIGttYWxsb2MgY2FjaGVzIGFuZCBu
ZWVkIGEgZ3VhcmFudGVlZAogKiBhbGlnbm1lbnQgbGFyZ2VyIHRoYW4gdGhlIGFsaWdubWVudCBv
ZiBhIDY0LWJpdCBpbnRlZ2VyLgogKiBTZXR0aW5nIEFSQ0hfS01BTExPQ19NSU5BTElHTiBpbiBh
cmNoIGhlYWRlcnMgYWxsb3dzIHRoYXQuCgpBUkNIX0RNQV9NSU5BTElHTiBpcyBmb3IgdGhlIHdo
b2xlIHN5c3RlbSwgbWF5YmUgd2UgY291bGQgZ2l2ZSBhCkRNQV9NSU5BTElHTiBLY29uZmlnIGVu
dHJ5IGluIGFyY2gvcmlzY3Y/Cgo+ID4KPiB0aGFua3MgZm9yIHRoZSByZXBseSwKPgo+IFNvIHJp
c2N2IGlzIHRoZSAiY29oZXJlbnQiIHBsYXRmb3JtPwo+Cj4gSSBzdWJtaXQgdGhpcyBwYXRjaCBh
cyBJIGdvdCBhIGZpeCBzdWdnZXN0aW9uIG9mIGFub3RoZXIgcGF0Y2ggdG8gdXNlCj4gQVJDSF9E
TUFfTUlOQUxJR04sIGJ1dCByaXNjdiBkb2Vzbid0IGRlZmluZSBpdC4KPgo+IGh0dHBzOi8vbGtt
bC5vcmcvbGttbC8yMDIxLzgvNi83MjMgPGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIxLzgvNi83
MjM+Cj4KPiBDb25zaWRlcmluZyB0aGUgcG9ydGFiaWxpdHkgb2YgdGhlIGNvZGUsIGluIG15IG9w
aW5pb24sIGl0IGlzIGJldHRlciB0bwo+IGRlZmluZSBpdCBmb3IgcmlzY3YgaWYgaXQgaXMgbm90
ICJjb2hlcmVudCIgcGxhdGZvcm0uCj4KPiA+PiArCj4gPj4gICAvKgo+ID4+ICAgICogUklTQy1W
IHJlcXVpcmVzIHRoZSBzdGFjayBwb2ludGVyIHRvIGJlIDE2LWJ5dGUgYWxpZ25lZCwgc28gZW5z
dXJlIHRoYXQKPiA+PiAgICAqIHRoZSBmbGF0IGxvYWRlciBhbGlnbnMgaXQgYWNjb3JkaW5nbHku
CgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
