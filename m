Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E26CEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 02:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RLsNf/GOWVOtVthVfYSS77o7PXdmffmq1BZWx+51LLQ=; b=fFyQq3TbEC4a7HTbJFUsnE0Edw
	U04W38Doah1Sg1zNW+L9aL6EK8e0He4Ade3IGmIggvaO5Xc4CinlYKjquY+2ustMNmFR3cyMNRxjg
	o3Jr4MsCzVn8Plf4uJKqBfV8AM7K1hNmXaAPQak2EWCHE0HeIyh/3TWBX5tTqX9E/67cR6YIHqnv+
	kJDby8R+VwJ21OmInB0jBZ0avbaALMe4fNNaRFTQVOGmcRuZmB8vol6awLJV6Ns5OYZkGz4RT3c1O
	VvDSgu9J+N6ZPeqAZOk1/N0gBfCn/HXcAFCbFFeWxzhR+V5wamM4c1fhLqjZ8Zn0Qc8fno7IkCaQu
	MwbmdO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIggi-00AC3W-0F;
	Mon, 10 Jul 2023 02:31:44 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIgge-00AC2R-1k
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 02:31:42 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-77acb944bdfso206695939f.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jul 2023 19:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1688956298; x=1691548298;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isa1f9w1YAsa/74wPYj1r7q419fkTN20HLg99m8qpkA=;
        b=mFZswzl1RlYTs5AWE7GDCCo8UVeEYQHjmFqzYJvYIsP9YMuHde68KL/MO7BqBcUs/j
         Pfzss9dd27Rtu2QxNSq2/ln1Tiw6onWpGNqqXRmuhRsF5e2kMlap+MwafD+AOmyaNKQV
         xpc3XiDHGoY7NpSuxiw+Pz7ZiLl4J0gpyyzJk53/6as1xrky1yiyQD/0xaggkQGBNjag
         jiOx4qPqZgfzq+mITWOrHXZ+nrFYZUNpUzarzlulx3EpWianmMztR69VqOnNVITIEh6I
         29bs54tp8g+FIUEznagf5oxQZ6oiGB/Q8Q4/S50hOPUDw8Imk+dmex1pD+JYEWi9GXfX
         npQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688956298; x=1691548298;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isa1f9w1YAsa/74wPYj1r7q419fkTN20HLg99m8qpkA=;
        b=GH104k4bPggpBIez7FO/Q4Ey5NHFEKJYaFNuc6M1qyTGKLyJDYMLDX2NneEk6lBWe9
         J8ocMDnfjwYDX+/HAbPOX0nYXsJpvP6mocNhXrW6CsF2dENc4DrvRqpPaR1TJPJLJonf
         C3rzSttuYX8PFaF5YigHk6eGOc5/0D+HsmLsmWavwX30EvdGZiDqgmn+A6TLgt683j49
         DalxArP5LfLLVveBqUPrKLoEhpMkdke0Aq6LSaiiJHXWAGQnmntG2f0XAshKlf/AxyXg
         s6F98g5kube+/2jXS6gJ1/6Yp9N8mD1H5kHCMLR40Xo7Y+rb/cPLqPACT90bu00UBp9+
         REvg==
X-Gm-Message-State: ABy/qLYEG9ueP41NRoqQSKxSDDaWm6M7OSgJOlLe6ynieTitXCjWWGTZ
	tlYYhK+yBsoE4gS5q9wsF98Hz2avxDt0rPMcJWjTkg==
X-Google-Smtp-Source: APBJJlHgTcZgGKu2YLtJ/MiJvLEIkJ1ajhXWgPkh99DKnAUjWAuEsY9txbdl4fQ7dZ7Xh/t9mtEv/crQbRLZf49CcKE=
X-Received: by 2002:a5d:898b:0:b0:783:67a3:a69f with SMTP id
 m11-20020a5d898b000000b0078367a3a69fmr12969071iol.18.1688956298607; Sun, 09
 Jul 2023 19:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230531090141.23546-1-zong.li@sifive.com> <CANXhq0rVred1YMcV5449yYt+MhOu2NUx9Oa-1xJqbS=o_1Qb6g@mail.gmail.com>
In-Reply-To: <CANXhq0rVred1YMcV5449yYt+MhOu2NUx9Oa-1xJqbS=o_1Qb6g@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 10 Jul 2023 10:31:27 +0800
Message-ID: <CANXhq0q+tkM=_C5gJq1Hv-uMx_ihiLLYyYgvJNAAMA=9SRurAg@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: xilinx: dma: remove arch dependency
To: vkoul@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	radhey.shyam.pandey@amd.com, dmaengine@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_193140_649058_76CC99F9 
X-CRM114-Status: GOOD (  25.55  )
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

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMTA6NTTigK9BTSBab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXkgMzEsIDIwMjMgYXQgNTowMeKAr1BNIFpvbmcg
TGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQXMgZm9sbG93aW5nIHBhdGNo
ZXMsIHhpbGlueCBkbWEgaXMgYWxzbyBub3cgYXJjaGl0ZWN0dXJlIGFnbm9zdGljLAo+ID4gYW5k
IGl0IGNhbiBiZSBjb21waWxlZCBmb3Igc2V2ZXJhbCBhcmNoaXRlY3R1cmVzLiBXZSBoYXZlIHZl
cmlmaWVkIHRoZQo+ID4gQ0RNQSBvbiBSSVNDLVYgcGxhdGZvcm0sIGxldCdzIHJlbW92ZSB0aGUg
QVJDSCBkZXBlbmRlbmN5IGxpc3QgaW5zdGVhZAo+ID4gb2YgYWRkaW5nIG5ldyBBUkNILgo+ID4K
PiA+IFRvIGF2b2lkIGJyZWFraW5nIHRoZSBzMzkwIGJ1aWxkLCBhZGQgYSBkZXBlbmRlbmN5IG9u
IEhBU19JT01FTS4KPiA+Cj4gPiAnZThiNmM1NGY2ZDU3ICgibmV0OiB4aWxpbng6IHRlbWFjOiBS
ZWxheCBLY29uZmlnIGRlcGVuZGVuY2llcyIpJwo+ID4gJ2Q3ZWFmOTYyYTkwYiAoIm5ldDogYXhp
ZW5ldDogSW4ga2NvbmZpZyByZW1vdmUgYXJjaCBkZXBlbmRlbmN5IGZvciBheGlfZW1hYyIpJwo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+IEFj
a2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiA+IFN1Z2dlc3Rl
ZC1ieTogUmFkaGV5IFNoeWFtIFBhbmRleSA8cmFkaGV5LnNoeWFtLnBhbmRleUBhbWQuY29tPgo+
ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+ID4gLS0t
Cj4gPgo+ID4gIENoYW5nZXMgaW4gdjM6Cj4gPiAgLSBBZGQgYSBkZXBlbmRlbmN5IG9uIEhBU19J
T01FTSB0byBhdm9pZCBicmVha2luZyB0aGUgczM5MCBidWlsZAo+ID4KPiA+ICBDaGFuZ2VzIGlu
IHYyOgo+ID4gIC0gUmVtb3ZlIEFSQ0ggZGVwZW5kZW5jeSBsaXN0IGluc3RlYWQgb2YgYWRkaW5n
IG5ldyBBUkNICj4gPgo+ID4gIGRyaXZlcnMvZG1hL0tjb25maWcgfCAyICstCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZG1hL0tjb25maWcgYi9kcml2ZXJzL2RtYS9LY29uZmlnCj4gPiBpbmRleCBm
NWY0MjJmOWI4NTAuLmZkNWE5NGU2NzE2MyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZG1hL0tj
b25maWcKPiA+ICsrKyBiL2RyaXZlcnMvZG1hL0tjb25maWcKPiA+IEBAIC02OTYsNyArNjk2LDcg
QEAgY29uZmlnIFhHRU5FX0RNQQo+ID4KPiA+ICBjb25maWcgWElMSU5YX0RNQQo+ID4gICAgICAg
ICB0cmlzdGF0ZSAiWGlsaW54IEFYSSBETUFTIEVuZ2luZSIKPiA+IC0gICAgICAgZGVwZW5kcyBv
biAoQVJDSF9aWU5RIHx8IE1JQ1JPQkxBWkUgfHwgQVJNNjQpCj4gPiArICAgICAgIGRlcGVuZHMg
b24gSEFTX0lPTUVNCj4gPiAgICAgICAgIHNlbGVjdCBETUFfRU5HSU5FCj4gPiAgICAgICAgIGhl
bHAKPiA+ICAgICAgICAgICBFbmFibGUgc3VwcG9ydCBmb3IgWGlsaW54IEFYSSBWRE1BIFNvZnQg
SVAuCj4gPiAtLQo+ID4gMi4xNy4xCj4gPgo+Cj4gSGkgVmlub2QsCj4gTGludXggNi41LXJjMSBp
cyBvcGVuaW5nLCBjb3VsZCBJIGtub3cgaWYgdGhpcyBwYXRjaCBpcyBnb29kIGZvciB5b3U/Cj4g
V291bGQgaXQgYmUgY29uc2lkZXJlZCBpbiB0aGlzIG1lcmdlIHdpbmRvdz8KPiBUaGFua3MuCgpI
aSBWaW5vZCwKSXQgc2VlbXMgdGhhdCB3ZSBhcmUgdHJhbnNpdGlvbmluZyB0byBMaW51eCB2Ni41
LXJjMi4gSSdtIHVuY2VydGFpbgp3aGV0aGVyIHlvdSBjb25zaWRlciB0aGlzIGEgbmV3IGZlYXR1
cmUgb3IgYSBmaXguIElzIHRoZXJlIGEKcG9zc2liaWxpdHkgb2YgaW5jb3Jwb3JhdGluZyBpdCBk
dXJpbmcgdGhpcyBjeWNsZT8gVGhhbmsgeW91LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
