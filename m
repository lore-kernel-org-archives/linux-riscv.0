Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6214C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 19:22:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B22461582
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 19:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B22461582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ErwFmIrAS+odMVorPbMOJjIQuUXByN8IY+5dmxBD+Ow=; b=iEt7bPosfIGurjpqnaj9+QnYW
	wyPrG01Mz1hZEwo9WZzIeGublXksCqypLZafB093eusELr1EVybK0206MgqrtAHamU8ABEX/fdsND
	MkQG0K3FvnNI/NCaqJwIdY2k6aL4yMZmwjVhcWr/12TuaxLkC+KAbGU9mszA49BxzKo385eN//gYu
	B72OE88mZDkYJ6OKtXLnpRzIQmMvqZPD2rcJmY7cEn7gh2PDV3gT1wXJQge1/+7QpCLCcuA84V8b2
	tgdMnqCYTj2V3+2iGeUmatAwa52amrBP/ZLqhppvx+rmARB3A58pk05O/eb3zeRfNbFATOmu2pHhK
	kCSr2wFBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgBU5-00FXnL-6L; Mon, 10 May 2021 19:22:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgBTz-00FXmi-VT; Mon, 10 May 2021 19:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=im7yptB7Cnn0+/0nEjxp2q806kDi7qdxtBjeZI/94RE=; b=3zR296gG5ofYqiyPCzAIoHTJig
 2LdscvLHb36v0bGLo6ZjTPiq+UaOelesRp7kQp8MZVYb5T78NfB+KPnueP0IL3HV4ZmZbm6eNPBsb
 /+GHp009qdJCW2gm+9Djdz3uZLthwxm3cCWLqus1pp9bgAXLXM/GLHdJIje2IQmEbRs3Y6BBULxjv
 cB5e6nnlM9dD2pWunPogKvHZBPEW5uyvwdwLQDOZVNU7dp8QMWM8OsRwWecTuymNJrx/k8P3P77ZA
 agpSK/f5812kTSXoeI7eyrRCOnKsjpDDt9AqFnXIgImTMvL/C/LHJ42LydlmVu00d5F37RroWlNXd
 woR+0UAg==;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgBTx-0094G9-6E; Mon, 10 May 2021 19:22:22 +0000
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 14AJM3dI013584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 15:22:05 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id F267215C3CD9; Mon, 10 May 2021 15:22:02 -0400 (EDT)
Date: Mon, 10 May 2021 15:22:02 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 alsa-devel@alsa-project.org, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org,
 kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sgx@vger.kernel.org, linux-usb@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, netdev@vger.kernel.org,
 rcu@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
Message-ID: <YJmH2irxoRsyNudb@mit.edu>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <de6d1fa5b7934f4afd61370d9c58502bef588466.camel@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de6d1fa5b7934f4afd61370d9c58502bef588466.camel@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_122221_430737_E3FDF084 
X-CRM114-Status: GOOD (  17.07  )
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

T24gTW9uLCBNYXkgMTAsIDIwMjEgYXQgMDI6NDk6NDRQTSArMDEwMCwgRGF2aWQgV29vZGhvdXNl
IHdyb3RlOgo+IE9uIE1vbiwgMjAyMS0wNS0xMCBhdCAxMzo1NSArMDIwMCwgTWF1cm8gQ2FydmFs
aG8gQ2hlaGFiIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgZG9pbmcgY29udmVyc2lv
biBvbmx5IHdoZW4gdXNpbmcgQVNDSUkgbWFrZXMKPiA+IG1vcmUgc2Vuc2UgdGhhbiB1c2luZyBV
VEYtOC4gCj4gPiAKPiA+IFNlZSwgYSBudW1iZXIgb2YgY29udmVydGVkIGRvY3VtZW50cyBlbmRl
ZCB3aXRoIHdlaXJkIGNoYXJhY3RlcnMKPiA+IGxpa2UgWkVSTyBXSURUSCBOTy1CUkVBSyBTUEFD
RSAoVStGRUZGKSBjaGFyYWN0ZXIuIFRoaXMgc3BlY2lmaWMKPiA+IGNoYXJhY3RlciBkb2Vzbid0
IGRvIGFueSBnb29kLgo+ID4gCj4gPiBPdGhlcnMgdXNlIE5PLUJSRUFLIFNQQUNFIChVK0EwKSBp
bnN0ZWFkIG9mIDB4MjAuIEhhcm1sZXNzLCB1bnRpbAo+ID4gc29tZW9uZSB0cmllcyB0byB1c2Ug
Z3JlcFsxXS4KPiAKPiBSZXBsYWNpbmcgdGhvc2UgbWFrZXMgc2Vuc2UuIEJ1dCByZXBsYWNpbmcg
ZW1kYXNoZXMg4oCUIHdoaWNoIGFyZSBhCj4gZGlzdGluY3QgY2hhcmFjdGVyIHRoYXQgaGFzIG5v
IGRpcmVjdCByZXBsYWNlbWVudCBpbiBBU0NJSSBhbmQgd2hpY2gKPiBwZW9wbGUgZG8gKmRlbGli
ZXJhdGVseSogdXNlIGluc3RlYWQgb2YgaHlwaGVuLW1pbnVzIOKAlCBkb2VzIG5vdC4KCkkgcmVn
dWxhcmx5IHVzZSAtLS0gZm9yIGVtLWRhc2hlcyBhbmQgLS0gZm9yIGVuLWRhc2hlcy4gIE1hcmtk
b3duIHdpbGwKYXV0b21hdGljYWxseSB0cmFuc2xhdGUgMyBBU0NJSSBoeXBlbnMgdG8gZW0tZGFz
aGVzLCBhbmQgMiBBU0NJSQpoeXBoZW5zIHRvIGVuLWRhc2hlcy4gIEl0J3MgbXVjaCwgbXVjaCBl
YXNpZXIgZm9yIG1lIHRvIHR5cGUgMiBvciAzCmh5cGVucyBpbnRvIG15IHRleHQgZWRpdG9yIG9m
IGNob2ljZSB0aGFuIHRyeWluZyB0byBlbnRlciB0aGUgVVRGLTgKY2hhcmFjdGVycy4gIElmIHdl
IGNhbiBtYWtlIHNwaGlueCBkbyB0aGlzIHRyYW5zbGF0aW9uLCBtYXliZSB0aGF0J3MKdGhlIGJl
c3Qgd2F5IG9mIGRlYWxpbmcgd2l0aCB0aGVzZSB0d28gY2hhcmFjdGVycz8KCkNoZWVycywKCgkJ
CQkJLSBUZWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
