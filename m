Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1295DC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 06:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLSjYE1sfpKlLWokbkeX8xmwZForc83YD09g41FKmc0=; b=Pv3mnmbvUCAL+x
	OxlFOXkQKjUv+EjyhE152Q8AoWPteiwKTZ6p4mrV9ZfaMxS5rF9dlcureL0EmxhLH/3mDDNZSkFr/
	bL7/M7baPUNCysBH1Hx1foL2u5FxboHmp+QzIj/n9AIARs4KZrdUgy9A0D8U9xOUQHWNosLbS83GA
	LqH970ml2ZROkTLSgwmV5xcWaVE95Bb2fhLslfUPUMCyrs7CWu1djLx/XGylpLj0rhMZALViE0KGU
	KpZhAiIsWSo4P4bQjKtS3q/PTsUZf0iJ0+nZvjtTvmR32+Pjj6B7MjQW4CitRUbvuFObPkUV9MvVt
	3PnJK7VGR7qTuo+UZGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKBFB-00000003nHb-3IQD;
	Thu, 20 Jun 2024 06:26:01 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKBF8-00000003nG8-0SsG
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 06:26:00 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52c9034860dso558313e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 23:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718864756; x=1719469556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfOsoI6voHcnzMk74pjD4g6YebgYICnBJRD+PHZtwlQ=;
        b=dvFp8vEWvaWt4+QZk8lcT/z9kTmr28DnCh+rN16Y9zU9G8WAaszl0WP/r49cfBXrKG
         ZW9kRXA59J3FmN2hR6u/lsVvsWixmBLPrpksLMS5K1KJqnH4Uxt1Ap0I0c3pV/AsWkce
         PJsRMBk+PPzEnLfyqhNXeZ04h1qCvpni0tMMkUlItshiwQfwbz/wsokHbZ0H7Veb9AAA
         uRQ4b6kKTZ7gU2tjTiHXAGt+vQUXno4IYpilOTVguhTwxpKrAgD7G3f0BDTyTck/EC6W
         mF552s3IY1rN8mkHEejd06fTvsc4hkgN5EERf54/kDzUgz3JLQ6sOfjpJxso63AGRFks
         EKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718864756; x=1719469556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfOsoI6voHcnzMk74pjD4g6YebgYICnBJRD+PHZtwlQ=;
        b=uD2JXJ5Ian1hR6LeoWXAjR0AQSOlPZMX/8xdPHwifnGuNkU71a1OBqRePjPZh5yaDu
         DUSUADNZUTjVTZlQ2V197b0gCy6ApVWRaoL50i/RFDHfIJW/E79tW9vroRgZeY4qr54k
         NcwBp40/Iu/UJGvhcAm8rm8rv4q99Orgdxmzp7zjTfVJCCP9BU7/psVZhTMfsvTtPwe/
         h8SK6m6MB9nMyBxxCrltMLkKpGH+4ExmTBb8LJbJCWR3SYGm+Vvz9KBNRQROYrV8pBF3
         r23hLEdNPoFk0XvhrfLV48jey+wUJ/FIemPDJzXGqos+eo+Vh6nePg2mdu2GJtPAHWrd
         bTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY8GLIqP3CtWfRUJPwcCUedPSSjhdH5XQqHQ+7ItTHACv5IynrDLxeq8omVsAmux7fbt/mW4iV/ODSoEqDklFtschaXLJ3yie4zmzvNd//
X-Gm-Message-State: AOJu0Yz4WhaNKV+yiKAp5jnfnDEER1V/q6jZJL0od5W3dUEUvrTNhoAV
	RCn08TW1yabPbj70vt0+bdDWOgPgqz72cVeFiEnAYMQzl73Y6NngjvasWO7a2UWNzwDcvFbkZgC
	Z94w9I3VCojnHZMIHbH6U2XwNoUuHudNdub/ZKmrm0z4FChIgb78=
X-Google-Smtp-Source: AGHT+IEdXN/Lta/JiQoTJ2V7PnSptyYKyFl9aQjNj6ALLZJ1jIfulboG94pKBg6oA9ag5d0mkAo46StBtPfrMh4JGjQ=
X-Received: by 2002:a05:6512:5c9:b0:52b:c296:9739 with SMTP id
 2adb3069b0e04-52ccaa375f4mr2897265e87.41.1718864755286; Wed, 19 Jun 2024
 23:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com> <20240605-atrium-neuron-c2512b34d3da@spud>
In-Reply-To: <20240605-atrium-neuron-c2512b34d3da@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 20 Jun 2024 11:55:44 +0530
Message-ID: <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
To: Conor Dooley <conor@kernel.org>
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, alex@ghiti.fr, ajones@ventanamicro.com, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_232558_184102_F8C6D841 
X-CRM114-Status: GOOD (  28.37  )
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

T24gV2VkLCBKdW4gNSwgMjAyNCBhdCAxMDoyNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAwNSwgMjAyNCBhdCAwODoxNTowOFBNICsw
ODAwLCBZb25nLVh1YW4gV2FuZyB3cm90ZToKPiA+IEFkZCBlbnRyaWVzIGZvciB0aGUgU3ZhZGUg
YW5kIFN2YWR1IGV4dGVuc2lvbnMgdG8gdGhlIHJpc2N2LGlzYS1leHRlbnNpb25zCj4gPiBwcm9w
ZXJ0eS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2Fu
Z0BzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sIHwgMzAgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAzMCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiBpbmRleCA0Njhj
NjQ2MjQ3YWEuLjFlMzA5ODg4MjZiOSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+IEBAIC0x
NTMsNiArMTUzLDM2IEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICAgICAgcmF0aWZpZWQgYXQg
Y29tbWl0IDNmOWVkMzQgKCJBZGQgYWJpbGl0eSB0byBtYW51YWxseSB0cmlnZ2VyCj4gPiAgICAg
ICAgICAgICAgd29ya2Zsb3cuICgjMikiKSBvZiByaXNjdi10aW1lLWNvbXBhcmUuCj4gPgo+ID4g
KyAgICAgICAgLSBjb25zdDogc3ZhZGUKPiA+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+
ICsgICAgICAgICAgICBUaGUgc3RhbmRhcmQgU3ZhZGUgc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNp
b24gZm9yIHJhaXNpbmcgcGFnZS1mYXVsdAo+ID4gKyAgICAgICAgICAgIGV4Y2VwdGlvbnMgd2hl
biBQVEUgQS9EIGJpdHMgbmVlZCBiZSBzZXQgYXMgcmF0aWZpZWQgaW4gdGhlIDIwMjQwMjEzCj4g
PiArICAgICAgICAgICAgdmVyc2lvbiBvZiB0aGUgcHJpdmlsZWdlZCBJU0Egc3BlY2lmaWNhdGlv
bi4KPiA+ICsKPiA+ICsgICAgICAgICAgICBCb3RoIFN2YWRlIGFuZCBTdmFkdSBleHRlbnNpb25z
IGNvbnRyb2wgdGhlIGhhcmR3YXJlIGJlaGF2aW9yIHdoZW4KPiA+ICsgICAgICAgICAgICB0aGUg
UFRFIEEvRCBiaXRzIG5lZWQgdG8gYmUgc2V0LiBUaGUgZGVmYXVsdCBiZWhhdmlvciBmb3IgdGhl
IGZvdXIKPiA+ICsgICAgICAgICAgICBwb3NzaWJsZSBjb21iaW5hdGlvbnMgb2YgdGhlc2UgZXh0
ZW5zaW9ucyBpbiB0aGUgZGV2aWNlIHRyZWUgYXJlOgo+ID4gKyAgICAgICAgICAgIDEuIE5laXRo
ZXIgc3ZhZGUgbm9yIHN2YWR1IGluIERUOiBkZWZhdWx0IHRvIHN2YWRlLgo+Cj4gSSB0aGluayB0
aGlzIG5lZWRzIHRvIGJlIGV4cGFuZGVkIG9uLCBhcyB0byB3aHkgbm90aGluZyBtZWFucyBzdmFk
ZS4KCkFjdHVhbGx5IGlmIGJvdGggU3ZhZGUgYW5kIFN2YWR1IGFyZSBub3QgcHJlc2VudCBpbiBE
VCB0aGVuCml0IGlzIGxlZnQgdG8gdGhlIHBsYXRmb3JtIGFuZCBPcGVuU0JJIGRvZXMgbm90aGlu
Zy4KCj4KPiA+ICsgICAgICAgICAgICAyLiBPbmx5IHN2YWRlIGluIERUOiB1c2Ugc3ZhZGUuCj4K
PiBUaGF0J3MgYSBzdGF0ZW1lbnQgb2YgdGhlIG9idmlvdXMsIHJpZ2h0Pwo+Cj4gPiArICAgICAg
ICAgICAgMy4gT25seSBzdmFkdSBpbiBEVDogdXNlIHN2YWR1Lgo+Cj4gVGhpcyBpcyBub3QgcmVs
ZXZhbnQgZm9yIFN2YWRlLgo+Cj4gPiArICAgICAgICAgICAgNC4gQm90aCBzdmFkZSBhbmQgc3Zh
ZHUgaW4gRFQ6IGRlZmF1bHQgdG8gc3ZhZGUgKExpbnV4IGNhbiBzd2l0Y2ggdG8KPiA+ICsgICAg
ICAgICAgICAgICBzdmFkdSBvbmNlIHRoZSBTQkkgRldGVCBleHRlbnNpb24gaXMgYXZhaWxhYmxl
KS4KPgo+ICJUaGUgcHJpdmlsZWdlIGxldmVsIHRvIHdoaWNoIHRoaXMgZGV2aWNldHJlZSBoYXMg
YmVlbiBwcm92aWRlZCBjYW4gc3dpdGNoIHRvCj4gU3ZhZHUgaWYgdGhlIFNCSSBGV0ZUIGV4dGVu
c2lvbiBpcyBhdmFpbGFibGUiLgo+Cj4gPiArICAgICAgICAtIGNvbnN0OiBzdmFkdQo+ID4gKyAg
ICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBTdmFk
dSBzdXBlcnZpc29yLWxldmVsIGV4dGVuc2lvbiBmb3IgaGFyZHdhcmUgdXBkYXRpbmcKPiA+ICsg
ICAgICAgICAgICBvZiBQVEUgQS9EIGJpdHMgYXMgcmF0aWZpZWQgYXQgY29tbWl0IGMxYWJjY2Yg
KCJNZXJnZSBwdWxsIHJlcXVlc3QKPiA+ICsgICAgICAgICAgICAjMjUgZnJvbSB2ZWQtcml2b3Mv
cmF0aWZpZWQiKSBvZiByaXNjdi1zdmFkdS4KPiA+ICsKPiA+ICsgICAgICAgICAgICBCb3RoIFN2
YWRlIGFuZCBTdmFkdSBleHRlbnNpb25zIGNvbnRyb2wgdGhlIGhhcmR3YXJlIGJlaGF2aW9yIHdo
ZW4KPiA+ICsgICAgICAgICAgICB0aGUgUFRFIEEvRCBiaXRzIG5lZWQgdG8gYmUgc2V0LiBUaGUg
ZGVmYXVsdCBiZWhhdmlvciBmb3IgdGhlIGZvdXIKPiA+ICsgICAgICAgICAgICBwb3NzaWJsZSBj
b21iaW5hdGlvbnMgb2YgdGhlc2UgZXh0ZW5zaW9ucyBpbiB0aGUgZGV2aWNlIHRyZWUgYXJlOgo+
Cj4gQEFudXAvRHJldy9BbGV4LCBhcmUgd2UgbWlzc2luZyBzb21lIHdvcmRpbmcgaW4gaGVyZSBh
Ym91dCBpdCBvbmx5IGJlaW5nCj4gdmFsaWQgdG8gaGF2ZSBTdmFkdSBpbiBpc29sYXRpb24gaWYg
dGhlIHByb3ZpZGVyIG9mIHRoZSBkZXZpY2V0cmVlIGhhcwo+IGFjdHVhbGx5IHR1cm5lZCBvbiBT
dmFkdT8gVGhlIGJpbmRpbmcgc2F5cyAidGhlIGRlZmF1bHQgYmVoYXZpb3VyIiwgYnV0Cj4gaXQg
aXMgbm90IHRoZSAiZGVmYXVsdCIgYmVoYXZpb3VyLCB0aGUgYmVoYXZpb3VyIGlzIGEgbXVzdCBB
RkFJQ1QuIElmCj4geW91IHNldCBTdmFkdSBpbiBpc29sYXRpb24sIHlvdSAvbXVzdC8gaGF2ZSB0
dXJuZWQgaXQgb24uIElmIHlvdSBzZXQKPiBTdmFkdSBhbmQgU3ZhZGUsIHlvdSBtdXN0IGhhdmUg
U3ZhZHUgdHVybmVkIG9mZj8KClllcywgdGhlIHdvcmRpbmcgc2hvdWxkIGJlIG1vcmUgb2YgcmVx
dWlyZW1lbnQgc3R5bGUgdXNpbmcKbXVzdCBvciBtYXkuCgpIb3cgYWJvdXQgdGhpcyA/CjEpIEJv
dGggU3ZhZGUgYW5kIFN2YWR1IG5vdCBwcmVzZW50IGluIERUID0+IFN1cGVydmlzb3IgbWF5CiAg
ICBhc3N1bWUgU3ZhZGUgdG8gYmUgcHJlc2VudCBhbmQgZW5hYmxlZCBvciBpdCBjYW4gZGlzY292
ZXIKICAgIGJhc2VkIG9uIG12ZW5kb3JpZCwgbWFyY2hpZCwgYW5kIG1pbXBpZC4KMikgT25seSBT
dmFkZSBwcmVzZW50IGluIERUID0+IFN1cGVydmlzb3IgbXVzdCBhc3N1bWUgU3ZhZGUKICAgIHRv
IGJlIGFsd2F5cyBlbmFibGVkLiAoT2J2aW91cykKMykgT25seSBTdmFkdSBwcmVzZW50IGluIERU
ID0+IFN1cGVydmlzb3IgbXVzdCBhc3N1bWUgU3ZhZHUKICAgIHRvIGJlIGFsd2F5cyBlbmFibGVk
LiAoT2J2aW91cykKNCkgQm90aCBTdmFkZSBhbmQgU3ZhZHUgcHJlc2VudCBpbiBEVCA9PiBTdXBl
cnZpc29yIG11c3QKICAgIGFzc3VtZSBTdmFkdSB0dXJuZWQtb2ZmIGF0IGJvb3QgdGltZS4gVG8g
dXNlIFN2YWR1LCBzdXBlcnZpc29yCiAgICBtdXN0IGV4cGxpY2l0bHkgZW5hYmxlIGl0IHVzaW5n
IHRoZSBTQkkgRldGVCBleHRlbnNpb24uCgpJTU8sIHRoZSAjMiBhbmQgIzMgYXJlIGRlZmluaXRl
bHkgb2J2aW91cyBidXQgc3RpbGwgd29ydGggbWVudGlvbmluZy4KCj4KPiA+ICsgICAgICAgICAg
ICAxLiBOZWl0aGVyIHN2YWRlIG5vciBzdmFkdSBpbiBEVDogZGVmYXVsdCB0byBzdmFkZS4KPiA+
ICsgICAgICAgICAgICAyLiBPbmx5IHN2YWRlIGluIERUOiB1c2Ugc3ZhZGUuCj4KPiBUaGVzZSB0
d28gYXJlIG5vdCByZWxldmFudCB0byBTdmFkdSwgSSdkIGxlYXZlIHRoZW0gb3V0Lgo+Cj4gPiAr
ICAgICAgICAgICAgMy4gT25seSBzdmFkdSBpbiBEVDogdXNlIHN2YWR1Lgo+Cj4gQWdhaW4sIHN0
YXRlbWVudCBvZiB0aGUgb2J2aW91cz8KPgo+ID4gKyAgICAgICAgICAgIDQuIEJvdGggc3ZhZGUg
YW5kIHN2YWR1IGluIERUOiBkZWZhdWx0IHRvIHN2YWRlIChMaW51eCBjYW4gc3dpdGNoIHRvCj4g
PiArICAgICAgICAgICAgICAgc3ZhZHUgb25jZSB0aGUgU0JJIEZXRlQgZXh0ZW5zaW9uIGlzIGF2
YWlsYWJsZSkuCj4KPiBTYW1lIGhlcmUgYXMgaW4gdGhlIFN2YWRlIGVudHJ5Lgo+Cj4gVGhhbmtz
LAo+IENvbm9yLgo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
