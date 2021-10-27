Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62872C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 00:13:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23C5A61002
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 00:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23C5A61002
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=XMrl/WE+kt4YV5vLesM1jqzlPad8K/JZ+wwKAtzZtqc=; b=vnhdX+/S8MSWPqefSrdm+sfm5O
	GQt1MbbWOlht2qmW9+i1Zv1deC/z+2hYFqBFb1JijthMOSVVTPVmmNCHLlZQ3BNm9YMSo7z/d9aSb
	HQv1kycHgnQMdzs32rY+FtdhDuoh68cd4y5RRkSLwMaoVNoA/Sbg2xTdxGlQRO5Y5u/eEvVoZMAnh
	mhx9u8ajWCnj8/dRsTIoig2onTmOEw/KTUQ3FYDF7Ko7i3DMTI9mz4fX5MtFvsx74gZ5X1zqq25p6
	p7b+wI1cL7g8A7HQ35SRy5xdwMj63jUzqXOpnAX/bwC8wZt0xtJdIltaZ01NOwKvlfP6cqN+bt8VJ
	hfNdMR/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfWYv-003MmO-6I; Wed, 27 Oct 2021 00:13:01 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfWYs-003Mlv-29
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 00:12:59 +0000
Received: by mail-pg1-x52f.google.com with SMTP id t7so1129543pgl.9
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 17:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=FjppYRWyCAJSkLalMKvDYJo3XiQkcxPLw34XLmzJVZg=;
 b=WVD3mqOD9gkjyh8K/rvNcPe/TYeIilGpXvZkcgoGGN5VKGbZTLphd075nFAi76oE6k
 rTYEruae/E3Kb7EYA5J+E2itk3Dd+kxxQvrl1R74/fMiIdBHXmNqUPemu5EsID+uMQkw
 DQkojNazBtJ10dvK0uCxtVOJxCk/7KJE0NH/hy/sJF2wafeMrrPTs7i0n5O542aqyks2
 lSmAPV3Kf/iI0sOV7KVju0jFjBN96Y37ValzdRRPHFAxbTgrWow6bMoK86en1UqSMsVN
 o1NxWjlVLpQZVBi/b51bwZ9cp+Nd5PdYjjH+c97qXReuVfK3bfm3LqO/JWIgVNiYYmqd
 6+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=FjppYRWyCAJSkLalMKvDYJo3XiQkcxPLw34XLmzJVZg=;
 b=FrFP+MiGhKiC18O4cKYf/5eH/VEoCmJ/LQP9geh8/U+7ega6sBqZzJuPWrosdQp8qp
 biYPQOxq3UbtY3WFoU82GtAlyTYsPBLne2qbEgGziJ120fm98jzLAuI8bce1m5F7uBkG
 REpeQ53ucrKpFji2F48hwuXAGkZDE1++3AHfdY6QYwLXGpnZ/uxkb4qpM5vUTeYgrpmg
 32AKVOPolbr7345AlMdACWFN1UcdwHLgYhUbMJQ9ZcoHRbKzYaBqab1t2rEeiTas3tdu
 3rQk0jFNpB5nnB9W7Ay+7FQutrTgyMT6GTYPrTYTzshxyWNPZGNyx10RMJ5kp3EweyY5
 cx0g==
X-Gm-Message-State: AOAM533Bytdg99+ai+REgSZt/kWItf79wuGwrrmaSRZ3rY31SQl8QQPf
 MIhECBawS+cvp/y6IWq/mMMjcw==
X-Google-Smtp-Source: ABdhPJxnbqFvruMJ3zBomBhJkfN6LQPdGjY39ZCIeckMen9Tegf60Y3/1Bjs98G8J4BntqnZDKPA4g==
X-Received: by 2002:a63:b349:: with SMTP id x9mr21330657pgt.421.1635293576927; 
 Tue, 26 Oct 2021 17:12:56 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:676c:ab93:f48d:23ae])
 by smtp.gmail.com with ESMTPSA id p13sm8922920pfo.102.2021.10.26.17.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 17:12:56 -0700 (PDT)
Date: Tue, 26 Oct 2021 17:12:56 -0700 (PDT)
X-Google-Original-Date: Tue, 26 Oct 2021 17:12:52 PDT (-0700)
Subject: Re: [RESEND PATCH V3 0/2] riscv: add RISC-V Svpbmt Standard Extension
 supports
In-Reply-To: <20211025040607.92786-1-wefu@redhat.com>
CC: Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 Christoph Hellwig <hch@lst.de>, liush@allwinnertech.com, wefu@redhat.com,
 lazyparser@gmail.com, 
 drew@beagleboard.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, 
 gordan.markus@canonical.com, guoren@linux.alibaba.com,
 Arnd Bergmann <arnd@arndb.de>, wens@csie.org, 
 maxime@cerno.tech, Daniel Lustig <dlustig@nvidia.com>, gfavor@ventanamicro.com,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, mick@ics.forth.gr, 
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: wefu@redhat.com
Message-ID: <mhng-ac32ff92-86cb-4377-ba63-de1856e84fb1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_171258_151533_92895128 
X-CRM114-Status: GOOD (  24.64  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyNCBPY3QgMjAyMSAyMTowNjowNSBQRFQgKC0wNzAwKSwgd2VmdUByZWRoYXQuY29t
IHdyb3RlOgo+IEZyb206IEZ1IFdlaSA8d2VmdUByZWRoYXQuY29tPgo+Cj4gVGhpcyBwYXRjaCBm
b2xsb3dzIHRoZSAgUklTQy1WIHN0YW5kYXJkIFN2cGJtdCBleHRlbnNpb24gaW4KPiBwcml2aWxl
Z2Ugc3BlYyB0byBzb2x2ZSB0aGUgbm9uLWNvaGVyZW50IFNPQyBETUEgc3luY2hyb25pemF0aW9u
Cj4gaXNzdWVzLgo+Cj4gVGhlIHN2cGJtdCBQVEUgZm9ybWF0Ogo+IHwgNjMgfCA2Mi02MSB8IDYw
LTggfCA3IHwgNiB8IDUgfCA0IHwgMyB8IDIgfCAxIHwgMAo+ICAgTiAgICAgTVQgICAgIFJTVyAg
ICBEICAgQSAgIEcgICBVICAgWCAgIFcgICBSICAgVgo+ICAgICAgICAgXgo+Cj4gT2YgdGhlIFJl
c2VydmVkIGJpdHMgWzYzOjU0XSBpbiBhIGxlYWYgUFRFLCB0aGUgYml0cyBbNjI6NjFdIGFyZSB1
c2VkIGFzCj4gdGhlIE1UIChha2EgTWVtVHlwZSkgZmllbGQuIFRoaXMgZmllbGQgc3BlY2lmaWVz
IG9uZSBvZiB0aHJlZSBtZW1vcnkgdHlwZXMKPiBhcyBzaG93biBpbiB0aGUgZm9sbG93aW5nIHRh
Ymxl77yaCj4gTWVtVHlwZSAgICAgUklTQy1WIERlc2NyaXB0aW9uCj4gLS0tLS0tLS0tLSAgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gMDAgLSBQTUEg
ICAgTm9ybWFsIENhY2hlYWJsZSwgTm8gY2hhbmdlIHRvIGltcGxpZWQgUE1BIG1lbW9yeSB0eXBl
Cj4gMDEgLSBOQyAgICAgTm9uLWNhY2hlYWJsZSwgaWRlbXBvdGVudCwgd2Vha2x5LW9yZGVyZWQg
TWFpbiBNZW1vcnkKPiAxMCAtIElPICAgICBOb24tY2FjaGVhYmxlLCBub24taWRlbXBvdGVudCwg
c3Ryb25nbHktb3JkZXJlZCBJL08gbWVtb3J5Cj4gMTEgLSBSc3ZkICAgUmVzZXJ2ZWQgZm9yIGZ1
dHVyZSBzdGFuZGFyZCB1c2UKCkRvIHlvdSBoYXZlIGEgcG9pbnRlciB0byB0aGUgc3BlYyB0aGF0
IGNvbnRhaW5zIHRoZXNlPyAgSSdtIHNwZWNpZmljYWxseQp3b3JyaWVkIGFib3V0IHRoZXNlIHBh
Z2UtYmFzZWQgYXR0cmlidXRlcyBiZWluZyBlbGlkZWQgd2hlbiBwYWdpbmcgaXMKb2ZmIChpZSwg
TS1tb2RlKSwgd2hpY2ggaGFzIGNhdXNlZCBpc3N1ZXMgaW4gc3lzdGVtcyBJJ3ZlIHdvcmtlZCB3
aXRoIGluCnRoZSBwYXN0LiAgSSdtIGFzc3VtaW5nIHRoZXJlJ3Mgc29tZXRoaW5nIHJlbGF0ZWQg
dG8gdGhpcyBpbiB0aGUgc3BlY3MsCmJ1dCBJJ20gd29ycmllZCB3ZSdsbCBuZWVkIHNvbWUgc29y
dCBvZiBhY2sgZnJvbSBNLW1vZGUgdGhhdCBpdCdzIGJlZW4Kc2V0dXAgdG8gd29yayB0aGF0IHdh
eS4gIE9uZSBjb3VsZCBpbWFnaW5lIGFuIE1QUlYtbGlrZSBhcHByb2FjaCAKd29ya2luZywgYnV0
IEkgZG9uJ3Qgc2VlIGVub3VnaCBpbiB0aGUgb2xkIHNwZWNzIGFuZCBJJ20gaGF2aW5nIHRyb3Vi
bGUgCmZpZ3VyaW5nIG91dCB3aGVyZSB0aGUgY2Fub25pY2FsIHZlcnNpb24gb2YgdGhpcyBsaXZl
cy4KCj4gVGhlIHN0YW5kYXJkIHByb3RlY3Rpb25fbWFwW10gbmVlZG4ndCBiZSBtb2RpZmllZCBi
ZWNhdXNlIHRoZSAiUE1BIgo+IHR5cGUga2VlcHMgdGhlIGhpZ2hlc3QgYml0cyB6ZXJvLgo+IEFu
ZCB0aGUgd2hvbGUgbW9kaWZpY2F0aW9uIGlzIGxpbWl0ZWQgaW4gdGhlIGFyY2gvcmlzY3YvKiBh
bmQgdXNpbmcKPiBhIGdsb2JhbCB2YXJpYWJsZShfX3Jpc2N2X3N2cGJtdCkgYXMgX1BBR0VfRE1B
X01BU0svSU8vTkMgZm9yCj4gcGdwcm90X25vbmNhY2hlZCAoJndyaXRlY29tYmluZSkgaW4gcGd0
YWJsZS5oLgo+IFdlIGFsc28gYWRkIF9QQUdFX0NIR19NQVNLIHRvIGZpbHRlciBQRk4gdGhhbiBi
ZWZvcmUuCj4KPiBFbmFibGUgaXQgaW4gZGV2aWNldHJlZSAtIChBZGQgIm1tdS1zdXBwb3J0cy1z
dnBibXQiIGluIGNwdSBub2RlKQo+ICAtIG1tdS1zdXBwb3J0cy1zdnBibXQKCk1heWJlIHRoaXMg
aXMgZW5vdWdoIG9mIGFuIGFjaywgYnV0IHdlJ2xsIG5lZWQgdG8gaGF2ZSBzb21lIHByZXR0eQpz
cGVjaWZpYyBkb2N1bWVudGF0aW9uIGlmIHRoYXQncyB0aGUgY2FzZS4gIEl0J3Mgbm90IGRlc2Ny
aWJlZCB0aGF0IHdheSAKaW4gdGhlIGRvY3MgcmlnaHQgbm93LCB0aGV5IGp1c3QgdGFsayBhYm91
dCBDUFUgc3VwcG9ydCAoSU1PIHdlIGNvdWxkIApwcm9iZSB0aGF0IHdpdGggYSB0cmFwLCBidXQg
SSdtIGZpbmUgd2l0aCB0aGUgRFQgZW50cnkgYXMgaXQncyBhIGJpdCAKc2ltcGxlcikuCgo+IFdl
aSBGdSAoMik6Cj4gICBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBtbXUtc3VwcG9ydHMtc3ZwYm10
IGZvciBTdnBibXQKPiAgIHJpc2N2OiBhZGQgUklTQy1WIFN2cGJtdCBleHRlbnNpb24gc3VwcG9y
dHMKPgo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgICAgICAgfCAg
NSArKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9maXhtYXAuaCAgICAgICAgICAgICAgIHwg
IDIgKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggICAgICAgICAgIHwg
IDggKystLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtYml0cy5oICAgICAgICAg
fCA0MSArKysrKysrKysrKysrKysrKystCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oICAgICAgICAgICAgICB8IDM5ICsrKysrKysrKysrKysrLS0tLQo+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMgICAgICAgICAgICAgICAgfCAzMiArKysrKysrKysrKysrKysKPiAg
YXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysrCj4g
IDcgZmlsZXMgY2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
