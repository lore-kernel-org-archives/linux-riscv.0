Return-Path: <SRS0=YITu=KG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466E3C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 10:59:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F91D61183
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 10:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F91D61183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=angband.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5qFtG6cEmGh98BnUvivIWvh+/TgWSxhKySlI94YfL/0=; b=O3hNaZc1dyUFDfqdEe8uWghIH
	NxUFKSHwXejqr8rf2EiHn2A8cvFgmcFQkWL64p/ARQeQkGBVOwZJc2K10B7/AarvpXFcsY4Hhc7W+
	qEuPR6PuVkKRzBkALSL4dNJAtPFbdUWLNWyGi5RbexIdyTzpVbTtOqgw1X2uQyAK1V6ByzstUdIhG
	WjszJJ2zSabOZpB7NXCQFCa4TO2UB6HKBZQTfP1QzvJFf4xv4Pd8V3cOsFS+DRoPYpgmT5yZUSBQO
	UCVGO35qQ3zfAmBH1H1dUISvszltaBNe7ozsn0tEsdjFB4LOjowy0GID3mUJbC589xVEqx8TOlElH
	sjgE0BSeg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgQ6G-00H30H-H8; Tue, 11 May 2021 10:58:52 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgE0X-00FnFO-T4; Mon, 10 May 2021 22:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=gJGpFaB3hD4HkiIWd+mO95z/N9f2/pmkZ9Bg1WNsE34=; b=5E/Bp/a9cMYNUH+unbPDQM+Vyb
 ZgNCvvP4CQyJP0SHBIkgOYtIfwPKvePWawkNutn3K7c3IO/8k/CQAyzwkB5aRtOpv6NM/r+mSIPRM
 CRHs3FFvJsWFn92siIpaqWoNu5odnxi3lgQlAQGQSQH8fbkObxhk/T917wTxnxnUnqqQWMezmhdI5
 TgSc0/e01Ur7EnlOH6s2TmZ0+ZM2JZxjQf8M7pAOrkdktYSIeekgAknYNAoBjzh3ao+3UCGZ/ALeY
 oIYieD2QKjGU51oLMvzzwTLYy+PrHNRxFmni9b5kNjsTaTKyVjPgdXzRA3nA9WIUiGXeIvuDzGlwB
 KzYYiJ/A==;
Received: from tartarus.angband.pl ([51.83.246.204])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgE0S-0099Au-UD; Mon, 10 May 2021 22:04:06 +0000
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.94.2)
 (envelope-from <kilobyte@angband.pl>)
 id 1lgDtp-00EKjz-Lm; Mon, 10 May 2021 23:57:13 +0200
Date: Mon, 10 May 2021 23:57:13 +0200
From: Adam Borowski <kilobyte@angband.pl>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
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
Message-ID: <YJmsOYzPIsQ04Zxb@angband.pl>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_150404_993593_FAEF96B1 
X-CRM114-Status: GOOD (  14.79  )
/bin/ln: failed to access
 'reaver_cache/texts/20210510_150404_993593_FAEF96B1': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_150404_993593_FAEF96B1 
X-CRM114-Status: GOOD (  11.30  )
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

T24gTW9uLCBNYXkgMTAsIDIwMjEgYXQgMTI6MjY6MTJQTSArMDIwMCwgTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIHdyb3RlOgo+IFRoZXJlIGFyZSBzZXZlcmFsIFVURi04IGNoYXJhY3RlcnMgYXQgdGhl
IEtlcm5lbCdzIGRvY3VtZW50YXRpb24uClsuLi5dCj4gT3RoZXIgVVRGLTggY2hhcmFjdGVycyB3
ZXJlIGFkZGVkIGFsb25nIHRoZSB0aW1lLCBidXQgdGhleSdyZSBlYXNpbHkKPiByZXBsYWNlYWJs
ZSBieSBBU0NJSSBjaGFycy4KPiAKPiBBcyBMaW51eCBkZXZlbG9wZXJzIGFyZSBhbGwgYXJvdW5k
IHRoZSBnbG9iZSwgYW5kIG5vdCBldmVyeWJvZHkgaGFzIFVURi04Cj4gYXMgdGhlaXIgZGVmYXVs
dCBjaGFyc2V0CgpJJ20gbm90IGF3YXJlIG9mIGEgZGlzdHJpYnV0aW9uIHRoYXQgc3RpbGwgYWxs
b3dzIHNlbGVjdGluZyBhIG5vbi1VVEYtOApjaGFyc2V0IGluIGEgbm9ybWFsIGZsb3cgaW4gdGhl
aXIgaW5zdGFsbGVyLiAgQW5kIGlmIHRoZXkgaGF2ZW4ndCBwdXJnZWQKc3VwcG9ydCBmb3IgYW5j
aWVudCBlbmNvZGluZ3MsIHRoYXQgc3VwcG9ydCBpcyB0aG9yb3VnaGx5IGJpdHJvdHRlbi4KVGh1
cywgSSBkaXNhZ3JlZSB0aGF0IHRoaXMgaXMgYSBsZWdpdGltYXRlIGNvbmNlcm4uCgpXaGF0IF9j
b3VsZF8gYmUgYSBsZWdpdGltYXRlIHJlYXNvbiBpcyB0aGF0IHNvbWVvbmUgaXMgb24gYSBfdGVy
bWluYWxfCnRoYXQgY2FuJ3QgZGlzcGxheSBhIHdpZGUgZW5vdWdoIHNldCBvZiBnbHlwaHMuICBT
dWNoIHRlcm1pbmFscyBhcmU6CiDigKIgTGludXggY29uc29sZSAoYmVjYXVzZSBvZiB2Z2Fjb24g
bGltaXRhdGlvbnM7IHBhdGNoc2V0cyB0byBpbXByb3ZlCiAgIG90aGVyIGNvbnMgaGF2ZW4ndCBi
ZWVuIG1haW5saW5lZCkKIOKAoiBzb21lIFdpbmRvd3MgdGVybWluYWxzIChwdXR0eSwgb2xkIFdp
bmRvd3MgY29uc29sZSkgdGhhdCBjYW4ndCBib3Jyb3cKICAgZ2x5cGhzIGZyb20gb3RoZXIgZm9u
dHMgbGlrZSBmb250Y29uZmlnIGNhbgoKRm9yIHRoZSBmb3JtZXIsIGl0J3Mgd2hhdGV2ZXIgeW91
ciBkaXN0cmlidXRpb24gc2hpcHMgaW4KL3Vzci9zaGFyZS9jb25zb2xlZm9udHMvIG9yIGFuIGVx
dWl2YWxlbnQsIHdoaWNoIGlzIGJhc2VkIG9uIGhpc3RvcmljCklTTy04ODU5IGFuZCBWVDEwMCB0
cmFkaXRpb25zLgoKRm9yIHRoZSBsYXR0ZXIsIHRoZSBuZWFyLWd1YXJhbnRlZWQgY2hhcmFjdGVy
IHNldCBpcyBXR0w0LgoKClRodXMsIGF0IGxlYXN0IHR3byBvZiB5b3VyIGNob2ljZXMgc2VlbSB0
byBkaXNhZ3JlZSB3aXRoIHRoZSBhYm92ZToKW2Ryb3BwZWRdCj4gCTB4ZDcgICA9PiAneCcsCQkj
IE1VTFRJUExJQ0FUSU9OIFNJR04KW3JldGFpbmVkXQo+IAktIFUrMmIwZCAoJ+KsjScpOiBVUCBE
T1dOIEJMQUNLIEFSUk9XCgrDlyBpcyBwcmVzZW50IGluIElTTy04ODU5LCBWMTAwLCBXR0w0OyBJ
J3ZlIGZvdW5kIG5vIGZvbnQgaW4KL3Vzci9zaGFyZS9jb25zb2xlZm9udHMvIG9uIG15IERlYmlh
biB1bnN0YWJsZSBib3ggdGhhdCBsYWNrcyB0aGlzCmNoYXJhY3Rlci4KCuKsjSBpcyBub3QgZm91
bmQgaW4gYW55IG9mIHRoZSBhYm92ZS4gIFlvdSBtaWdodCB3YW50IHRvIGF0IGxlYXN0CmNvbnZl
cnQgaXQgdG8g4oaVIHdoaWNoIGlzIGF0IGxlYXN0IHByZXNlbnQgaW4gV0dMNCwgYW5kIHRodXMg
bGlrZWx5CnRvIGJlIHN1cHBvcnRlZCBpbiBmb250cyBoZWVkaW5nIFdpbmRvd3MvTWFjL09wZW5U
eXBlIHJlY29tbWVuZGF0aW9ucy4KVGhhdCBzdGlsbCB3b24ndCBtYWtlIGl0IHdvcmsgb24gVlQu
CgoKTWVvdyEKLS0gCuKigOKjtOKgvuKgu+KituKjpuKggCAuLS1bIE1ha2VmaWxlIF0K4qO+4qCB
4qKg4qCS4qCA4qO/4qGBICMgYmV3YXJlIG9mIHJhY2VzCuKiv+KhhOKgmOKgt+KgmuKgi+KggCBh
bGw6IHBpbGxhZ2UgYnVybgrioIjioLPio4TioIDioIDioIDioIAgYC0tLS0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
