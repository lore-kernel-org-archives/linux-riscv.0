Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1965C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 11:12:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6579601FC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 11:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6579601FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysiPV7PHMcryMPcZVpYZh/6JYnreS0yUrkB+E1nS884=; b=MqQErAMDLEsE2v
	fhsvWyjT8xChL89Ox+HlmthkR0c5qqMShE4xdadR9mjVKbT1pi5cocW6aJNe/JCrxK5pzGyzdz8H0
	q/xzBBjKsWtq4PMedelTlLgdPcWLzRQi4dLLiAelj/rK3SX9czPHABTDKKa3KlM1+T+Fb1KpKm80h
	se9Kqyp6v3fFfWFE6BfUvI7yTkWRvF0M21bfH4RbXaRi93pRc31XE9Haxl1PYIJUaNL1uOe8dEL/t
	DmGBS9G0guFtXjjnlH+2muBcg43aoxzjXT7PCD+6D4EcMqXtmCr1RKDzopOi2oQ+uNQQnbONIhi1t
	GqUII3XXSXQVEAV9gVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1macAY-00GDXj-IY; Wed, 13 Oct 2021 11:11:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maaIV-00Fixm-JC
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 09:11:42 +0000
Received: by mail-wr1-x42e.google.com with SMTP id g25so5991787wrb.2
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PV4TDA9Wg4a3/4+lvLr8uQ2IGR+/8BcN/iS1LNsPzfE=;
 b=4cWkdw4CWnHs6G7XTSrFY0htwwCVCl8pqcD74gAXvrbpdAaxoIEYgALY2LK9WjZzJH
 V+0gi186XUglWAfVoTSWZVZlGQiBhOJDJmvuKd/vl2gyWCMY7Mede+Nt0p1IG5ND9j2y
 MA+rynIjYs1BP+4dsgA7GNVmvifaiB3O+6IFGdYV523C1GewdGkP1z0CrmjMuiJKv3uk
 TPJMtDnORLiWkJb/wGgv9FB1n/13IYx3t7Q9V+XaMFIniQkYEKNf4tcKWoNKpZa+0+QC
 Y+/eKYV5A/5T/Ye3+X3sWp5yVRxkR7G8dXtAi9fkxxZUY17hpwCZPPeLnF08baaJ0zeU
 GTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PV4TDA9Wg4a3/4+lvLr8uQ2IGR+/8BcN/iS1LNsPzfE=;
 b=zeeycV1muhsBOh43+zZUmp3O3LPTE7F/eIGCvxvaBQ6cAJE5Le068o0dsLFMQy+9X5
 +wurfaL4UHLNGhfugRB80A0hQbzFC7QD3egyrSxhV3Z+AHfaapsR5nzjjpA2kt8KzZWR
 Zf1ZKk9X2pXeDerBeZ8rmF3FeeP7Bl+DLI/z6huI98WUpHHwO28ErYqpdT/ZQdc0bXeI
 R8MnVAtrEdDFLp0uJkoIg75zgm489QwMu9GsEXR5dOwmiXkuboSdfgm7dgS7p7iLC6Js
 ekg24wlW7REYdCej1TQTdhFsHANpuRtra/ceIm69UObcBwHkX4Gth/oX/xonWq9ovgTv
 J7Cg==
X-Gm-Message-State: AOAM530az9VhWYXymjNNbQHM36WjnlhGKTfzoqB2mJlJi7XtLBk1z7eR
 BEn1SH6UD0PS9Y7H3JLZypaECADu5iu0tBRYCfc94A==
X-Google-Smtp-Source: ABdhPJyCqFgQZJ7BVVPy5O3gqM1t6WzuFwPHsuGG7tJ+0UNwo2/ilMMITf9N/zNU2s2XOzmiaJxHmD8PludN+2F64gc=
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr11281690wmh.137.1634116297799; 
 Wed, 13 Oct 2021 02:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211013012149.2834212-1-guoren@kernel.org>
 <CAAhSdy042JY_Vm2j_d5t4jweS3gf51h30j1O9LXDnE6KkB8AEg@mail.gmail.com>
 <4039032.XOxOlHldtI@diego>
In-Reply-To: <4039032.XOxOlHldtI@diego>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Oct 2021 14:41:26 +0530
Message-ID: <CAAhSdy3j2Co2ckxn4vDtOxL=Ym3hgb66vkmnTbUjec+x7bRRDA@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: update riscv plic compatible string
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Guo Ren <guoren@kernel.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_021139_750889_16CB66CA 
X-CRM114-Status: GOOD (  23.40  )
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

T24gV2VkLCBPY3QgMTMsIDIwMjEgYXQgMjoyNyBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBBbSBNaXR0d29jaCwgMTMuIE9rdG9iZXIg
MjAyMSwgMDc6MTE6NDYgQ0VTVCBzY2hyaWViIEFudXAgUGF0ZWw6Cj4gPiBPbiBXZWQsIE9jdCAx
MywgMjAyMSBhdCA2OjUyIEFNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4KPiA+ID4gQWRk
IHRoZSBjb21wYXRpYmxlIHN0cmluZyAidGhlYWQsYzkwMC1wbGljIiB0byB0aGUgcmlzY3YgcGxp
Ywo+ID4gPiBiaW5kaW5ncyB0byBzdXBwb3J0IFNPQ3Mgd2l0aCB0aGVhZCxjOXh4IHByb2Nlc3Nv
ciBjb3Jlcy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4
LmFsaWJhYmEuY29tPgo+ID4gPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+
ID4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2dsZS5jb20+Cj4gPiA+IENj
OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+ID4gPiBDYzogQXRpc2ggUGF0cmEg
PGF0aXNoLnBhdHJhQHdkYy5jb20+Cj4gPiA+Cj4gPiA+IC0tLQo+ID4gPgo+ID4gPiBDaGFuZ2Vz
IHNpbmNlIFYzOgo+ID4gPiAgLSBSZW5hbWUgImM5eHgiIHRvICJjOTAwIgo+ID4gPiAgLSBBZGQg
dGhlYWQsYzkwMC1wbGljIGluIHRoZSBkZXNjcmlwdGlvbiBzZWN0aW9uCj4gPiA+IC0tLQo+ID4g
PiAgLi4uL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlh
bWwgICAgfCA2ICsrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+
ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMt
MS4wLjAueWFtbAo+ID4gPiBpbmRleCAwOGQ1YTU3Y2UwMGYuLjgyNjI5ODMyZTVhNSAxMDA2NDQK
PiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1j
b250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEu
MC4wLnlhbWwKPiA+ID4gQEAgLTM1LDYgKzM1LDExIEBAIGRlc2NyaXB0aW9uOgo+ID4gPiAgICBj
b250YWlucyBhIHNwZWNpZmljIG1lbW9yeSBsYXlvdXQsIHdoaWNoIGlzIGRvY3VtZW50ZWQgaW4g
Y2hhcHRlciA4IG9mIHRoZQo+ID4gPiAgICBTaUZpdmUgVTUgQ29yZXBsZXggU2VyaWVzIE1hbnVh
bCA8aHR0cHM6Ly9zdGF0aWMuZGV2LnNpZml2ZS5jb20vVTU0LU1DLVJWQ29yZUlQLnBkZj4uCj4g
PiA+Cj4gPiA+ICsgIFdoaWxlIHRoZSAidGhlYWQsYzkwMC1wbGljIiB3b3VsZCBtYXNrIElSUSB3
aXRoIHJlYWRsKGNsYWltKSwgc28gaXQgbmVlZG4ndAo+ID4gPiArICBtYXNrL3VubWFzayB3aGlj
aCBuZWVkZWQgaW4gUklTQy1WIFBMSUMuIFdoZW4gaW4gSVJRU19PTkVTSE9UICYgSVJRQ0hJUF9F
T0lfVEhSRUFERUQKPiA+ID4gKyAgcGF0aCwgdW5uZWNlc3NhcnkgbWFzayBvcGVyYXRpb24gd291
bGQgY2F1c2UgYSBibG9ja2luZyBpcnEgYnVnIGluIHRoZWFkLGM5MDAtcGxpYy4KPiA+ID4gKyAg
QmVjYXVzZSB3aGVuIElSUSBpcyBkaXNhYmxlZCBpbiBjOTAwLCB3cml0ZWwoaHdpcnEsIGNsYWlt
KSB3b3VsZCBiZSBpbnZhbGlkLgo+ID4KPiA+IFRoaXMgaXMgYSB0b3RhbGx5IGluY29ycmVjdCBk
ZXNjcmlwdGlvbiBvZiB0aGUgZXJyYXRhIHJlcXVpcmVkIGZvciBDOXh4IFBMSUMuCj4gPgo+ID4g
UGxlYXNlIGRvbid0IHByb2plY3Qgbm9uLWNvbXBsaWFuY2UgYXMgYSBmZWF0dXJlIG9mIEM5eHgg
UExJQy4KPiA+Cj4gPiA+ICsKPiA+ID4gIG1haW50YWluZXJzOgo+ID4gPiAgICAtIFNhZ2FyIEth
ZGFtIDxzYWdhci5rYWRhbUBzaWZpdmUuY29tPgo+ID4gPiAgICAtIFBhdWwgV2FsbXNsZXkgIDxw
YXVsLndhbG1zbGV5QHNpZml2ZS5jb20+Cj4gPiA+IEBAIC00Niw2ICs1MSw3IEBAIHByb3BlcnRp
ZXM6Cj4gPiA+ICAgICAgICAtIGVudW06Cj4gPiA+ICAgICAgICAgICAgLSBzaWZpdmUsZnU1NDAt
YzAwMC1wbGljCj4gPiA+ICAgICAgICAgICAgLSBjYW5hYW4sazIxMC1wbGljCj4gPiA+ICsgICAg
ICAgICAgLSB0aGVhZCxjOTAwLXBsaWMKPgo+IHdlIHN0aWxsIHdhbnQgc3BlY2lmaWMgU29DIG5h
bWVzIGluIHRoZSBjb21wYXRpYmxlLCB0aGUgImM5MDAiCj4gaXMgc3RpbGwgYSBzb3J0LW9mIHBs
YWNlaG9sZGVyLgoKWWVzLCB3ZSBuZWVkICJjOTAwIiBjb21wYXRpYmxlIHN0cmluZyBhcyB3ZWxs
LiBUaGUgImM5eHgiCmNvbXBhdGlibGUgc3RyaW5nIGlzIGZvciB0aGUgY3VzdG9tIFBMSUMgc3Bl
YyBmb2xsb3dlZCBieSBULUhFQUQuCgo+Cj4KPiA+ID4gICAgICAgIC0gY29uc3Q6IHNpZml2ZSxw
bGljLTEuMC4wCj4gPgo+ID4gVGhlIFBMSUMgRFQgbm9kZSByZXF1aXJlcyB0d28gY29tcGF0aWJs
ZSBzdHJpbmc6Cj4gPiA8aW1wbGVtZW50YXRpb25fY29tcGF0PiwgPHNwZWNfY29tcGF0Pgo+ID4K
PiA+IFRoZSBDOXh4IFBMSUMgaXMgbm90IFJJU0MtViBQTElDIHNvLCB0aGUgRFQgbm9kZSBzaG91
bGQKPiA+IGJlOiAidGhlYWQsYzkwMC1wbGljIiwgInRoZWFkLGM5eHgtcGxpYyIKPiA+Cj4gPiBZ
b3UgbmVlZCB0byBjaGFuZ2UgIi0gY29uc3Q6IHNpZml2ZSxwbGljLTEuMC4wIiB0bwo+ID4gLSBl
bnVtOgo+ID4gICAgIC0gc2lmaXZlLHBsaWMtMS4wLjAKPiA+ICAgICAtIHRoZWFkLGM5eHgtcGxp
Ywo+Cj4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
