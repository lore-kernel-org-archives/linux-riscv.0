Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9110FC25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bcsSEiHLbzFe8jHYMolVhbO3HOcKHYsCfkSYSXqF8N4=; b=fftZ8XEvvRVvPa
	aRZj8TQZA/NRAqX47T65xQ3z+InGYUrDrx0U5pmnVd9dOYZRyiEwRl1B9D3zDpIdzgBsULePrDkEH
	VwlAc6ca8NFoYesIkLZMD4VTyd3p9+o2ngEIqNsQhhYstW1ypZyXA8UWn3U3MKVbwa5w8GYDXiqPP
	fDRS1w1iqBxtx2I/53I3sxUu3zN1eb+w/J8kYjcdKy/JK5fdcYCVCZcDj18GdRFdNEB5VgVKlPkWj
	pH4vherjxknHaXusVlUgAZzX++IcC+sGCDOSBJWw0peA7x8bOAUMHzlT1V1DJ4A1I2oF3l/evYF95
	QiCIL6DpvEd9LsN4i+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCMJL-00000004xey-0fqo;
	Wed, 29 May 2024 16:37:59 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCMJG-00000004xaw-1PKK
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 16:37:56 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ea80a18094so1989091fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 09:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717000665; x=1717605465; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vhg3PSDLD+pC/Tu5xX3Yt9O/jtF+LQuu+I4tEFxm4GE=;
        b=M6V2BgmZ+sO6YXrwIx6dD1QyIcmvr9DkNJL2HDojfXJukw38e2fMX541Q14gFCmL+h
         wA4E9rAa/Go9tKzqX8rh+Qm05joySlkRUhoe2vTPzFL53Cq4BhxD5891cEqE06rRwM2M
         rM1FBYhvas4vFlBeiieyBr6yUZgCTRNLv2ABb2DuADDVuhk65FMMKk5bVPAMFA0p8RMD
         V0fwk1X/MjCrtaFhM4Tva/zNmbGL/VAzKljHCtAULU93Rw9eaifWEGER9Mu8uahuQsR8
         /vHnTnRwVCK31g4szeKoEAZF8r+FgHQRListFmkaES1Og9SP4H191ydrBPk+cxgJBFHV
         m1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717000665; x=1717605465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vhg3PSDLD+pC/Tu5xX3Yt9O/jtF+LQuu+I4tEFxm4GE=;
        b=Ue1283mvKHo0aZ3Dj0Fq0v1AjDWFV+l4Ol/ukvuE0xSJtytule7AmbeYXqQufc4PgY
         Tw2qZ3cA88r30dRYGqyRqIk5OiWZzNVs1AHCCEhUlzBbAuKwbRCMF83tmxDRC9MhMK0f
         EAQES+srYAC+fZlrWUoNjTJAJd3DQlT6e63uoCVByHzT//EXjBC3/IDlM4nFVChGH3f7
         QIrDMzpdUMI/W96GU2vR8IEBrsVCUX21ehdwz0NSoL1Vadxw7bC76sfiUWJFoCZvt7c/
         sSZVOwbaCIRMbZIAJiHADGrkCf9Z1Q3jthG5468fa4Nf411FyMNjAd8SJfWeEGnHXmgT
         Aj9A==
X-Forwarded-Encrypted: i=1; AJvYcCWwCMixqQAJC9TbKninbT2bWzcHJ+Q3n8Ffz5L+u9DNOznBxqodlkLm12RDHOvvpvM4vnP9oDEKwCoLpQL8fygqJkGD25lZbdZ7wFfVkdkn
X-Gm-Message-State: AOJu0Yy/lSTk7F+pP0mji6fvNpkLHJiCNzevH/YgMd2SrrCzVkeCYxDa
	T5vwlqj2Coa8sQgWT1mlruBBcXyloMZ4P4QmKf7iiyhtgI0mRCIAXI3jpwjya6YYD+9Pauk8OSa
	Xe6jaJkhHyNnsn7+HS4Zqrxnx0P+0WANmyjg8GA==
X-Google-Smtp-Source: AGHT+IFb7OdP5izYBsFIM8KNbnVSke/aDi57hq/CQb9jSjOOLKEcu+ukVpWtaVdyek30b6o6ySohcFJ0aUZA5z/4PtE=
X-Received: by 2002:a05:6512:3ed:b0:529:b6d1:572c with SMTP id
 2adb3069b0e04-52a848cf73bmr728684e87.32.1717000664855; Wed, 29 May 2024
 09:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240528164132.2451685-1-maz@kernel.org> <CAK9=C2XNPJP0X=pg5TSrQbsuouDD3jP-gy2Sm4BXNJp0ZiWp+A@mail.gmail.com>
 <86bk4pm8j1.wl-maz@kernel.org> <CAK9=C2XRx==OTPoGW_AHmjq4Th0bv4okwcq6-3L5JYwHwQp97A@mail.gmail.com>
 <86a5k8nbh1.wl-maz@kernel.org> <CAK9=C2Ugq=0y8M86CD75mQccBo=TBLBomb4rqC4i1naKy2LyWQ@mail.gmail.com>
 <868qzsn7zs.wl-maz@kernel.org> <20240529-rust-tile-a05517a6260f@spud>
In-Reply-To: <20240529-rust-tile-a05517a6260f@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 29 May 2024 22:07:33 +0530
Message-ID: <CAK9=C2UvppYBUE8_u+M86KSdtULyMAMA=kPvmb4xS0S1_UJGhQ@mail.gmail.com>
Subject: Re: [PATCH] of: property: Fix fw_devlink handling of interrupt-map
To: Conor Dooley <conor@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Saravana Kannan <saravanak@google.com>, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_093754_414240_3E63BFBF 
X-CRM114-Status: GOOD (  24.72  )
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

T24gV2VkLCBNYXkgMjksIDIwMjQgYXQgODo0N+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAyOSwgMjAyNCBhdCAwMTowMDowN1BNICsw
MTAwLCBNYXJjIFp5bmdpZXIgd3JvdGU6Cj4gPiA+ID4gPiBJbiB0aGUgUklTQy1WIHdvcmxkLCB0
aGVyZSBoYXZlIGJlZW4gcXVpdGUgYSBmZXcgUUVNVSByZWxlYXNlcwo+ID4gPiA+ID4gd2hlcmUg
dGhlIGdlbmVyYXRlZCBEVCBub2RlIG9mIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciBkb2VzIG5v
dAo+ID4gPiA+ID4gaGF2ZSB0aGUgIiNhZGRyZXNzLWNlbGxzIiBwcm9wZXJ0eS4gVGhpcyBwYXRj
aCBicmVha3MgdGhlIGtlcm5lbAo+ID4gPiA+ID4gZm9yIGFsbCBzdWNoIFFFTVUgcmVsZWFzZXMu
Cj4gPiA+ID4KPiA+ID4gPiBDb25ncmF0dWxhdGlvbnMsIHlvdSd2ZSBmb3JrZWQgRFQuIE5ld3Mg
YXQgMTEuCj4gPiA+Cj4gPiA+IENhbiB5b3UgZWxhYm9yYXRlIGhvdyA/Cj4gPgo+ID4gWW91J3Zl
IHN0YXRlZCBpdCB5b3Vyc2VsZi4gWW91IGFyZSByZWx5aW5nIG9uIGEgYmVoYXZpb3VyIHRoYXQK
PiA+IGRldmlhdGVzIGZyb20gdGhlIHN0YW5kYXJkIGJ5IGhhdmluZyBEVHMgd2l0aCBtaXNzaW5n
IHByb3BlcnRpZXMKPiA+Cj4gPiBBbmQgc2luY2Ugd2UgY2FuJ3QgdHJhdmVsIGJhY2sgaXQgdGlt
ZSB0byBmaXggdGhpcywgdGhlIG9ubHkgc29sdXRpb24KPiA+IEkgY2FuIHNlZSBpcyB0byBzdXBw
b3J0IGJvdGggYmVoYXZpb3VycyBieSBxdWlya2luZyBpdC4KPgo+IEknbSBub3QgY29udmluY2Vk
IHRoYXQgdGhlcmUgaXMgYW55IGFjdHVhbCBwcm9kdWN0aW9uIGhhcmR3YXJlIHRoYXQKPiB3b3Vs
ZCBnZXQgYnJva2VuIGJ5IHlvdXIgcGF0Y2gsIGp1c3QgUUVNVSwgc28gSSB0aGluayBpdCBzaG91
bGQgZ2V0Cj4gZml4ZWQgdG8gb3V0cHV0IGRldmljZXRyZWVzIHRoYXQgYXJlIHNwZWMgY29tcGxp
YW50IHJhdGhlciB0aGFuIGFkZCBzb21lCj4gcmlzY3Ytc3BlY2lmaWMgaGFja3MgdGhhdCB3ZSBj
YW4ndCBldmVuIGdhdGUgb24gdGhlICJxZW11LGFwbGljIgo+IGNvbXBhdGlibGUgYmVjYXVzZSBR
RU1VIGRvZXNuJ3QgdXNlIHRoZSBjb21wYXRpYmxlIGNyZWF0ZWQgZm9yIGl0Li4uCgpJIGFsc28g
ZGlkIGZ1cnRoZXIgZGlnZ2luZyBhbmQgaXQgdHVybnMgb3V0IHRoZSAiI2FkZHJlc3MtY2VsbHMi
CmlzIG1pc3Npbmcgb25seSBmb3IgQVBMSUMgRFQgbm9kZXMgYW5kIHRoaXMgaXNzdWUgb25seSBp
bXBhY3RzCkFQTElDIERUIG5vZGUgY3JlYXRpb24gaW4gUUVNVSBSSVNDLVYgdmlydCBtYWNoaW5l
LiBXZQpzaG91bGQganVzdCBnbyBhaGVhZCBhbmQgZml4IFFFTVUuCgo+Cj4gU3BlYyB2aW9sYXRp
b25zIGFzaWRlLCB0aGUgUUVNVSBhcGxpYyBub2RlcyBpbiB0aGUgRFQgY29udGFpbiBhIGJ1bmNo
Cj4gb2Ygb3RoZXIgaXNzdWVzLCBpbmNsdWRpbmcgdXNpbmcgcHJvcGVydGllcyB0aGF0IGNoYW5n
ZWQgaW4gdGhlCj4gdXBzdHJlYW1pbmcgcHJvY2Vzcy4gSGVyZSdzIHRoZSBpc3N1ZXMgd2l0aCBB
bGlzdGFpcidzIGN1cnJlbnQgcmlzY3YKPiB0cmVlIGZvciBRRU1VIHcvIC1zbXAgNCAtTSB2aXJ0
LGFpYT1hcGxpYyxkdW1wZHRiPSQocWVtdV9kdGIpIC1jcHUgbWF4IC1tIDFHIC1ub2dyYXBoaWMK
Pgo+IHFlbXUuZHRiOiBhcGxpY0BkMDAwMDAwOiAkbm9kZW5hbWU6MDogJ2FwbGljQGQwMDAwMDAn
IGRvZXMgbm90IG1hdGNoICdeaW50ZXJydXB0LWNvbnRyb2xsZXIoQFswLTlhLWYsXSspKiQnCj4g
ICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2lu
dGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LGFwbGljLnlhbWwjCj4gcWVtdS5kdGI6IGFwbGljQGQw
MDAwMDA6IGNvbXBhdGlibGU6MDogJ3Jpc2N2LGFwbGljJyBpcyBub3Qgb25lIG9mIFsncWVtdSxh
cGxpYyddCj4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LGFwbGljLnlhbWwjCj4gcWVtdS5kdGI6
IGFwbGljQGQwMDAwMDA6IGNvbXBhdGlibGU6IFsncmlzY3YsYXBsaWMnXSBpcyB0b28gc2hvcnQK
PiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
aW50ZXJydXB0LWNvbnRyb2xsZXIvcmlzY3YsYXBsaWMueWFtbCMKPiBxZW11LmR0YjogYXBsaWNA
ZDAwMDAwMDogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQgKCdjb21wYXRp
YmxlJyB3YXMgdW5leHBlY3RlZCkKPiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvaW50ZXJydXB0LWNvbnRyb2xsZXIvcmlzY3YsYXBsaWMueWFt
bCMKPiBxZW11LmR0YjogYXBsaWNAYzAwMDAwMDogJG5vZGVuYW1lOjA6ICdhcGxpY0BjMDAwMDAw
JyBkb2VzIG5vdCBtYXRjaCAnXmludGVycnVwdC1jb250cm9sbGVyKEBbMC05YS1mLF0rKSokJwo+
ICAgICAgICAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9p
bnRlcnJ1cHQtY29udHJvbGxlci9yaXNjdixhcGxpYy55YW1sIwo+IHFlbXUuZHRiOiBhcGxpY0Bj
MDAwMDAwOiBjb21wYXRpYmxlOjA6ICdyaXNjdixhcGxpYycgaXMgbm90IG9uZSBvZiBbJ3FlbXUs
YXBsaWMnXQo+ICAgICAgICAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9pbnRlcnJ1cHQtY29udHJvbGxlci9yaXNjdixhcGxpYy55YW1sIwo+IHFlbXUuZHRi
OiBhcGxpY0BjMDAwMDAwOiBjb21wYXRpYmxlOiBbJ3Jpc2N2LGFwbGljJ10gaXMgdG9vIHNob3J0
Cj4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LGFwbGljLnlhbWwjCj4gcWVtdS5kdGI6IGFwbGlj
QGMwMDAwMDA6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgnY29tcGF0
aWJsZScsICdyaXNjdixkZWxlZ2F0ZScgd2VyZSB1bmV4cGVjdGVkKQo+ICAgICAgICAgZnJvbSBz
Y2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pbnRlcnJ1cHQtY29udHJv
bGxlci9yaXNjdixhcGxpYy55YW1sIwo+Cj4gSSBndWVzcyBub29uZSB1cGRhdGVkIFFFTVUgdG8g
Y29tcGx5IHdpdGggdGhlIGJpbmRpbmdzIHRoYXQgYWN0dWFsbHkgZ290Cj4gdXBzdHJlYW1lZCBm
b3IgdGhlIGFwbGljPwoKWWVzLCB3ZSBuZXZlciBib3RoZXJlZCB0byB1cGRhdGUgdGhlIFFFTVUg
RFQgZ2VuZXJhdGlvbiBhZnRlcgpBSUEgRFQgYmluZGluZ3Mgd2VyZSBhY2NlcHRlZC4gVGhhbmtz
IGZvciBjYXRjaGluZy4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
