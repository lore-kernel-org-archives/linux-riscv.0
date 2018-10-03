Return-Path: <SRS0=xmLI=MP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A18C64EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 01:41:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B17D520878
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 01:41:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QKQHto4f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKZ2X55U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B17D520878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vuk4gKDQyqZi6ooRuwxPsfMB7JK5hTAr3DuKS5VF9As=; b=QKQHto4fjCNm9/
	WopwbRXx96Rv5Cv73mxfBsrhFZIsLx16VqrMr8Q8PgBKQK7kFRHpdfqeAy8mCDwqttBZ6x/+6BBar
	dU2L/teFMQ5hYDsrCsX5ACKr8EpleR2q7rdrf7M9trOl6RspsnQSn12TRwUpn/+n3ext/E3BBx7Fg
	LVnVT1rdtG/B2zDDXNqYm5WnYu8rq6TS6K6/j5YeAcCmnAKpBc6A/h9cO/YPeC9/gSuPiyUCqYfSw
	+if0pvPajE6noOAledB51ErH2v6BDzu0TSKtl5ZpF4/rpGEuHGVj19Uec7/y4enaWJRiudiHzlkB9
	o70lxO554LptsQqsnpKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7WAK-0008Iy-9u; Wed, 03 Oct 2018 01:41:28 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7W9E-0006jT-GU
 for linux-riscv@lists.infradead.org; Wed, 03 Oct 2018 01:40:52 +0000
Received: by mail-it1-x143.google.com with SMTP id w200-v6so6591013itc.4
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 18:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k27ZAsrfok5lqbiX1m5u8MlcU7L7zjUrrltAsSQGuuw=;
 b=GKZ2X55UeaFV0AdF8+Cpd8bjbxoXA++BYiVzKJKJlWPqgQLvorJaOGTSovoxmc9f6w
 FqJHT6PGedkG+HsnFkCe4UUAPu1ClH67JiitMJwb2WpJmD10J9MqHw7YldmtqNzNYs6G
 mSbmr8jvud708Aku0fBfZAq3xbXf9NWqWT5hfYAAR64FV9QkkNL+hK/sFmjLlhGBzJFO
 caeve0qsjr93Rhz71l1zrZxMRlpehnlN1a5J8ebMzw6ouzt4ZZccLPs4YenQLE7d409p
 dP+WHVh7ez22jUzglHfegvUaCCknHx9bJ+ruXxeJHch7Uf+tacWQGsAHp4zjWeK6/lWA
 GflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k27ZAsrfok5lqbiX1m5u8MlcU7L7zjUrrltAsSQGuuw=;
 b=hQZjGZ0+G322yERpypRlcMN5q1Lj73FOTZxVvnivFnifRRg141m9mvhkLWpuGyByLu
 EdcqwWvU9A0N5g9CDmMmeyTzCTurZRv4B43nMH3C1EzjDcpJbDZQUB2sjj3Av/UZztys
 Zwp0lmSW2NmCJ7QyaZPfZd9aFHEBlrbs1sDkVRuylNki0fot7MMCMlcDbVWBkk1vecnG
 RDAKsGw36p9Lv0KGIIUYgh43l7gPf4/o3WAfzfUOGOgOEou4AbL/P6sU2WLklSsUnh6Q
 HSMCtJ+0nKgraSYPb0k3BbuPrax5vNWNDjXXUz3S9gOGw+kBMWiU9uEKb+vXd3h7+X8m
 Qw2g==
X-Gm-Message-State: ABuFfojDjrgKBY0XJfv5fIXe4f8d76GrIhOpkmW69EPjXp6ipfzVdT5M
 8x4b6zHPhcAMjH1SzJwiRLbezKoC7QEovUvxBLU=
X-Google-Smtp-Source: ACcGV63PjrGEVeVEd5xZDWu0Tnm44mJMNNJlgGWddHCiMODFdT9OJV6xawfnFVN2fSGIZ70keHZLfqgWOposXh7BH8M=
X-Received: by 2002:a02:a505:: with SMTP id
 e5-v6mr13791346jam.63.1538530809035; 
 Tue, 02 Oct 2018 18:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20181002145041.GC3889@infradead.org>
 <mhng-2b0c98e6-298b-4fc4-842c-809002de3451@palmer-si-x1c4>
In-Reply-To: <mhng-2b0c98e6-298b-4fc4-842c-809002de3451@palmer-si-x1c4>
From: Zong Li <zongbox@gmail.com>
Date: Wed, 3 Oct 2018 09:39:58 +0800
Message-ID:
 <CA+ZOyajMbaUrpPMeTgynyJpBtLh-19=VR=t0rq=bGcTmh0LF1w@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_184020_592854_4FB1FC73 
X-CRM114-Status: GOOD (  27.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, Zong Li <zong@andestech.com>,
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181003013958.KsxEm39Yy0OOYXTZ7GI2zuQYVwNT68TGcccXvj0xuOQ@z>

UGFsbWVyIERhYmJlbHQgPHBhbG1lckBzaWZpdmUuY29tPiDmlrwgMjAxOOW5tDEw5pyIMuaXpSDp
gLHkuowg5LiL5Y2IMTE6MDLlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgMDIgT2N0IDIwMTggMDc6NTA6
NDEgUERUICgtMDcwMCksIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4+IFRoZSB1ZGl2bW9k
ZGk0IGFuZCB1bW9kZGkzIGFyZSBjb3BpZXMgZnJvbSBsaWJnY2MgaW4gZ2NjLiBUaGVyZSBhcmUg
b3RoZXIKPiA+PiBmdW5jdGlvbnMgdXNlIHRoZSB1ZGl2bW9kZGk0IGluIGxpYmdjYywgc28gSSBz
ZXBhcmF0ZSB0aGUgdW1vZGRpMyBhbmQKPiA+PiB1ZGl2bW9kZGk0IGZvciBmbGV4aWJsZSBleHRl
bnNpb24gaW4gdGhlIGZ1dHVyZS4KPiA+Cj4gPiBDYW4geW91IHBsZWFzZSBtZW50aW9uIHdoaWNo
IGV4YWN0IHZlcnNpb24gb2YgYW4gZXh0ZXJuYWwgcHJvamVjdGVkCj4gPiB5b3UgaW1wb3J0ZWQg
dGhpbmdzIGZyb20/ICBUaGF0IHdpbGwgZ2VuZXJhbGx5IGhlbHAgaWYvd2hlbiBzb21lb25lCj4g
PiBoYXMgdG8gZGlnIGludG8gZGl2ZXJnaW5nIHZlcnNpb25zLgo+ID4KPiA+PiArKysgYi9saWIv
dWRpdm1vZGRpNC5jCj4gPj4gQEAgLTAsMCArMSwzMTAgQEAKPiA+PiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+PiArCj4gPj4gKy8qCj4gPj4gKyAqIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5
Cj4gPj4gKyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgYXMgcHVibGlzaGVkIGJ5Cj4gPj4gKyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCj4gPj4gKyAqIChhdCB5b3Vy
IG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCj4gPj4gKyAqCj4gPj4gKyAqIFRoaXMgcHJvZ3Jh
bSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAo+ID4+
ICsgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3
YXJyYW50eSBvZgo+ID4+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJU
SUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCj4gPj4gKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGZvciBtb3JlIGRldGFpbHMuCj4gPj4gKyAqCj4gPj4gKyAqIFlvdSBzaG91bGQgaGF2ZSBy
ZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCj4gPj4gKyAq
IGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHNlZSB0aGUgZmlsZSBDT1BZSU5HLCBv
ciB3cml0ZQo+ID4+ICsgKiB0byB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCj4g
Pj4gKyAqLwo+ID4KPiA+IFRoZSBTUERYIHRhZyB3YXMgc3VwcG9zZWQgdG8gcmVwbGFjZSB0aGlz
IGJvaWxlciBwbGF0ZS4gIE9uIHRoZSBvdGhlcgo+ID4gaGFuZCBJJ20gc3VycHJpY2VkIHRoZXJl
IGlzIG5vIENvcHlyaWdodCBzdGF0ZW1lbnQgaGVyZSAtIHRoZSBGU0YgaXMKPiA+IHVzdWFsbHkg
dmVyeSBnb29kIGFib3V0IGhhdmluZyB0aGVtIHVwdG9kYXRlIGluIGV2ZXJ5IEdOVSBwcm9qZWN0
Lgo+Cj4gSSBzdWdnZXN0ZWQgaGUgaW1wb3J0IHRoZSBnY2MtNC4yLjEgdmVyc2lvbiwgd2hpY2gg
aGFzIGEgYmlnIGNvcHlyaWdodCBub3RpY2UKPgo+ICAgICAvKiBNb3JlIHN1YnJvdXRpbmVzIG5l
ZWRlZCBieSBHQ0Mgb3V0cHV0IGNvZGUgb24gc29tZSBtYWNoaW5lcy4gICovCj4gICAgIC8qIENv
bXBpbGUgdGhpcyBvbmUgd2l0aCBnY2MuICAqLwo+ICAgICAvKiBDb3B5cmlnaHQgKEMpIDE5ODks
IDE5OTIsIDE5OTMsIDE5OTQsIDE5OTUsIDE5OTYsIDE5OTcsIDE5OTgsIDE5OTksCj4gICAgICAg
IDIwMDAsIDIwMDEsIDIwMDIsIDIwMDMsIDIwMDQsIDIwMDUgIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbiwgSW5jLgo+Cj4gICAgIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIEdDQy4KPgo+ICAgICBHQ0Mg
aXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeSBp
dCB1bmRlcgo+ICAgICB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZQo+ICAgICBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRo
ZXIgdmVyc2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlcgo+ICAgICB2ZXJzaW9u
Lgo+Cj4gICAgIEluIGFkZGl0aW9uIHRvIHRoZSBwZXJtaXNzaW9ucyBpbiB0aGUgR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UsIHRoZQo+ICAgICBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24gZ2l2
ZXMgeW91IHVubGltaXRlZCBwZXJtaXNzaW9uIHRvIGxpbmsgdGhlCj4gICAgIGNvbXBpbGVkIHZl
cnNpb24gb2YgdGhpcyBmaWxlIGludG8gY29tYmluYXRpb25zIHdpdGggb3RoZXIgcHJvZ3JhbXMs
Cj4gICAgIGFuZCB0byBkaXN0cmlidXRlIHRob3NlIGNvbWJpbmF0aW9ucyB3aXRob3V0IGFueSBy
ZXN0cmljdGlvbiBjb21pbmcKPiAgICAgZnJvbSB0aGUgdXNlIG9mIHRoaXMgZmlsZS4gIChUaGUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSByZXN0cmljdGlvbnMKPiAgICAgZG8gYXBwbHkgaW4gb3Ro
ZXIgcmVzcGVjdHM7IGZvciBleGFtcGxlLCB0aGV5IGNvdmVyIG1vZGlmaWNhdGlvbiBvZgo+ICAg
ICB0aGUgZmlsZSwgYW5kIGRpc3RyaWJ1dGlvbiB3aGVuIG5vdCBsaW5rZWQgaW50byBhIGNvbWJp
bmUKPiAgICAgZXhlY3V0YWJsZS4pCj4KPiAgICAgR0NDIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBo
b3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsIGJ1dCBXSVRIT1VUIEFOWQo+ICAgICBXQVJSQU5U
WTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mIE1FUkNIQU5UQUJJTElUWSBv
cgo+ICAgICBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UKPiAgICAgZm9yIG1vcmUgZGV0YWlscy4KPgo+ICAgICBZb3Ug
c2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZQo+ICAgICBhbG9uZyB3aXRoIEdDQzsgc2VlIHRoZSBmaWxlIENPUFlJTkcuICBJZiBub3Qs
IHdyaXRlIHRvIHRoZSBGcmVlCj4gICAgIFNvZnR3YXJlIEZvdW5kYXRpb24sIDUxIEZyYW5rbGlu
IFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEKPiAgICAgMDIxMTAtMTMwMSwgVVNBLiAg
Ki8KPgo+IHNvIGl0IGxvb2tzIGxpa2Ugc29tZXRoaW5nIHdlbnQgd3JvbmcgaGVyZS4gIFpvbmc6
IGRpZCB5b3UgZ28gYmFjayBhbmQKPiByZS1jb25zdHJ1Y3QgdGhpcyBmdW5jdGlvbiBmcm9tIHRo
ZSBHUEx2MiBzb3VyY2U/CgpZZXMsIEkgcmUtY29uc3RydWN0IHRoaXMgZnVuY3Rpb24gZnJvbSBH
Q0MgNC4yLjEuIFRoZSBjb3B5cmlnaHQgcGFydCwKSSByZWZlcnJlZCB0byB0aGUgb3RoZXIgR0ND
IHJvdXRpbmUgY29waWVzIGluIGtlcm5lbCBzdWNoIGFzIHVjbXBkaTIsCm11bGRpMywgYXNobGRp
MyBhbmQgc28gb24sIEkgZm91bmQgdGhleSByZW1vdmVkIHRoZSAnR0NDJyBzdHJpbmcsIHNvIEkK
dXNlIHRoZSBzYW1lIGNvcHlyaWdodCBmcm9tIHRoZXNlIGZpbGVzLgpJIHdpbGwgcmUtd3JpdGUg
dGhlIGNvcHlyaWdodCBwYXJ0IGFuZCBzdWJtaXQgdGhlIG5leHQgdmVyc2lvbi4gVGhhbmtzCnRv
IGFsbCBmb3IgaGVscC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
