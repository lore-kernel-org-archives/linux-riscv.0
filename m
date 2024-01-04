Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9332C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 11:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xD0CLWxfzIpnFqD/Qoxva8QFcXabd8XAtwnRUGMK7N0=; b=bC0HXnSk8lgnos
	XeVY7ZRbQ5BrkiWkE1PXg0ysGMbsceEII0odkE8M0u50pa/Zh8knJUfR3GSRmufLFeWx3gtnrKED6
	UQJ8ER0uf71ViLqD08qkhbSLCz/CduyqTy03P/ts2JG5KSUpGkUv3MeD+MPaHUNw7eVSd8yRN3WWt
	TOE3azfXy5uCa8d/Wx0aL8QV75x6Fb5adAijqx4FbYxyBKjQchH23N9RhItrnPcmu9yqXj4I4Ot2g
	kO9zXoY6A2L2Xh53ql7KuCvMegbDwGuJrKhirfte7fwKTEN7N2E7OpEIiMAyGIOJKDOJpkQ/vx0Ad
	cfs5qO7XNuU3RZrMeX+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLbm-00Dejk-2L;
	Thu, 04 Jan 2024 11:09:54 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLbh-00DefY-2E
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 11:09:53 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-55711962c3fso135606a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 03:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704366577; x=1704971377; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=74N1Cq913BTRhayzvgQnIcxYARZsluZ7x3qTYNrywUw=;
        b=bWZRFB00BmKfAVOWVAuZvNZXNwHNGfTSbiybamu11Ga0kPKqVn9ADBLWVQmt9fz9CP
         yShAhrmAWkpKM2bQcoAtR6yOKRMEVDrp2yF8LXNTkHn8HnYS0PgF6N2QgIJxbUETwozt
         9xRizoy7Arcf9FyOW0dpn2pB0w8JcSvDVl9m0DeG1BAze+FyHGeWWdAj/hqy1W5HohDa
         aqbYeFcTfAyDR1MPBzATHbBhg7imvkQItTE5TiKgyZf7to75/N5di7xFCHOHnsW1lbFY
         WN5XliQvUYJBsuijMyYRdBg441GDYm6uv++Vp7hG9QStU63C+P1StWwVvUvFUx2pSQgo
         VDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704366577; x=1704971377;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=74N1Cq913BTRhayzvgQnIcxYARZsluZ7x3qTYNrywUw=;
        b=UkYyZROY/F6ev97V+7foYLb0PQyAXc/ugCnE++RUIxqo+IU+SNvW76NfRfXZtJlV09
         J0c/dNUjbLEeRb0iv6Uoe6wIUM+PWu8IeR9AkmUQbo5SLx73ks92dJYBPAvpL18Qxxc0
         G3j+TWXnK3/HLKCjjvn4LS5Pvnx3ZUyRY1c4BmyXwwUSzx2biw9JXx0x0kvDekg7Wyjc
         v5FQ9+U3ijC1rGJ+sS1Q/IfBmnbTt7Ca/JyRJa/hPtxQqAcoqsn6FKHVE/pWZmBs8prl
         L3+0JoSvwNFZilzFZFwe6/tiWMUMIerGutVX0LCzqYi6Flgtyw13/B1SeKXydKWlgg7d
         tiaw==
X-Gm-Message-State: AOJu0YzVU7qqJabeZKRt3mTx9LgSePr1zQjqeBYJpIf12ue4bbwgAVPg
	haCe0hwKYkU5OZ1yfaeBpU/fkYb7AWeB+w==
X-Google-Smtp-Source: AGHT+IEQCwN9GP2QDGQCOCSlVQdGYcgmdoQnHVO1JwxIhclSNsrhshtNA82sSQCt5a2uS2CNGPMffw==
X-Received: by 2002:a05:6402:3193:b0:556:b393:7559 with SMTP id di19-20020a056402319300b00556b3937559mr231896edb.23.1704366576957;
        Thu, 04 Jan 2024 03:09:36 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 8-20020a0564021f4800b005545dffa0bdsm16441289edz.13.2024.01.04.03.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 03:09:36 -0800 (PST)
Date: Thu, 4 Jan 2024 12:09:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Greentime Hu <greentime.hu@sifive.com>, 
	wchen <waylingii@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Minda Chen <minda.chen@starfivetech.com>, 
	Samuel Holland <samuel@sholland.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, Like Xu <likexu@tencent.com>, 
	Vipin Sharma <vipinsh@google.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	Aaron Lewis <aaronlewis@google.com>, Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: Re: [PATCH v4 11/11] KVM: selftests: Enable tunning of
 err_margin_us in arch timer test
Message-ID: <20240104-be1acabe472432f709ee408c@orel>
References: <cover.1702371136.git.haibo1.xu@intel.com>
 <0343a9e4bfa8011fbb6bca0286cee7eab1f17d5d.1702371136.git.haibo1.xu@intel.com>
 <8734vy832j.wl-maz@kernel.org>
 <CAJve8onc0WN5g98aOVBmJx15wFBAqfBKJ+ufoLY+oqYyVL+=3A@mail.gmail.com>
 <f98879dc24f948f7a8a7b5374a32bc04@kernel.org>
 <CAJve8ona7g=LxW1YeRB_FqGodF973H=A3b2m8054gmzK=Z7_ww@mail.gmail.com>
 <87zfy5t1qt.wl-maz@kernel.org>
 <CAJve8o=nTsAwwgSib4vOLXjOWSMV2+J+BFsUZ57OdAK7eW8q8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8o=nTsAwwgSib4vOLXjOWSMV2+J+BFsUZ57OdAK7eW8q8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_030949_749060_9407BE67 
X-CRM114-Status: GOOD (  32.48  )
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

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6NTg6NDBBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgOTo1OOKAr1BNIE1hcmMgWnluZ2llciA8bWF6QGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgMjAgRGVjIDIwMjMgMTM6NTE6MjQgKzAw
MDAsCj4gPiBIYWlibyBYdSA8eGlhb2JvNTV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IE9uIFdlZCwgRGVjIDIwLCAyMDIzIGF0IDU6MDDigK9QTSBNYXJjIFp5bmdpZXIgPG1hekBrZXJu
ZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIDIwMjMtMTItMjAgMDY6NTAsIEhhaWJv
IFh1IHdyb3RlOgo+ID4gPiA+ID4gT24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgMjoyMuKAr0FNIE1h
cmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4g
T24gVHVlLCAxMiBEZWMgMjAyMyAwOTozMToyMCArMDAwMCwKPiA+ID4gPiA+PiBIYWlibyBYdSA8
aGFpYm8xLnh1QGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPj4gPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvdGltZXJfdGVzdC5oIGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvdGltZXJfdGVzdC5oCj4gPiA+ID4gPj4gPiBpbmRl
eCA5NjgyNTdiODkzYTcuLmIxZDQwNWU3MTU3ZCAxMDA2NDQKPiA+ID4gPiA+PiA+IC0tLSBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3RpbWVyX3Rlc3QuaAo+ID4gPiA+ID4+
ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvdGltZXJfdGVzdC5o
Cj4gPiA+ID4gPj4gPiBAQCAtMjIsNiArMjIsNyBAQCBzdHJ1Y3QgdGVzdF9hcmdzIHsKPiA+ID4g
PiA+PiA+ICAgICAgIGludCBucl9pdGVyOwo+ID4gPiA+ID4+ID4gICAgICAgaW50IHRpbWVyX3Bl
cmlvZF9tczsKPiA+ID4gPiA+PiA+ICAgICAgIGludCBtaWdyYXRpb25fZnJlcV9tczsKPiA+ID4g
PiA+PiA+ICsgICAgIGludCB0aW1lcl9lcnJfbWFyZ2luX3VzOwo+ID4gPiA+ID4+Cj4gPiA+ID4g
Pj4gLi4uIGV4Y2VwdCB0aGF0IHlvdSBhcmUgc3RvcmluZyBpdCBhcyBhIHNpZ25lZCB2YWx1ZS4g
U29tZSBjb25zaXN0ZW5jeQo+ID4gPiA+ID4+IHdvdWxkbid0IGh1cnQsIHJlYWxseSwgYW5kIHdv
dWxkIGF2b2lkIGlzc3VlcyB3aGVuIHBhc3NpbmcgbGFyZ2UKPiA+ID4gPiA+PiB2YWx1ZXMuCj4g
PiA+ID4gPj4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBZZXMsIGl0J3MgbW9yZSBwcm9wZXIgdG8gdXNl
IGFuIHVuc2lnbmVkIGludCBmb3IgdGhlIG5vbi1uZWdhdGl2ZSBlcnJvcgo+ID4gPiA+ID4gbWFy
Z2luLgo+ID4gPiA+ID4gU3RvcmluZyBhcyBzaWduZWQgaGVyZSBpcyBqdXN0IHRvIGtlZXAgdGhl
IHR5cGUgY29uc2lzdGVudCB3aXRoIHRoYXQKPiA+ID4gPiA+IG9mIHRpbWVyX3BlcmlvZF9tcwo+
ID4gPiA+ID4gc2luY2UgdGhlcmUgd2lsbCBiZSAnKycgb3BlcmF0aW9uIGluIG90aGVyIHBsYWNl
cy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9hYXJjaDY0L2FyY2hfdGltZXIuYwo+ID4gPiA+ID4gICAgICAgICAvKiBTZXR1cCBhIHRpbWVv
dXQgZm9yIHRoZSBpbnRlcnJ1cHQgdG8gYXJyaXZlICovCj4gPiA+ID4gPiAgICAgICAgICB1ZGVs
YXkobXNlY3NfdG9fdXNlY3ModGVzdF9hcmdzLnRpbWVyX3BlcmlvZF9tcykgKwo+ID4gPiA+ID4g
ICAgICAgICAgICAgIHRlc3RfYXJncy50aW1lcl9lcnJfbWFyZ2luX3VzKTsKPiA+ID4gPgo+ID4g
PiA+IEJ1dCB0aGF0J3MgZXhhY3RseSB3aHkgdXNpbmcgYSBzaWduZWQgcXVhbnRpdHkgaXMgd3Jv
bmcuCj4gPiA+ID4gV2hhdCBkb2VzIGl0IG1lYW4gdG8gaGF2ZSBhIGh1Z2UgKm5lZ2F0aXZlKiBt
YXJnaW4/Cj4gPiA+ID4KPiA+ID4KPiA+ID4gSGkgTWFyYywKPiA+ID4KPiA+ID4gSSBhZ3JlZSB0
aGF0IG5lZ2F0aXZlIHZhbHVlcyBhcmUgbWVhbmluZ2xlc3MgZm9yIHRoZSBtYXJnaW4uCj4gPiA+
IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHRoZSBuZWdhdGl2ZSBtYXJnaW4gc2hvdWxkIGJl
IGZpbHRlcmVkIGJ5Cj4gPiA+IGFzc2VydGlvbiBpbiBhdG9pX25vbl9uZWdhdGl2ZSgpLgo+ID4K
PiA+IE5vLiBQbGVhc2UuCj4gPgo+ID4gYXRvaV9ub25fbmVnYXRpdmUoKSByZXR1cm5zIGEgdWlu
dDMyX3QsIHdoaWNoIGlzIHdoYXQgaXQgc2hvdWxkIGRvLgo+ID4gVGhlIGJ1ZyBpcyBzcXVhcmVs
eSBpbiB0aGUgdXNlIG9mIGFuICdpbnQnIHRvIHN0b3JlIHN1Y2ggdmFsdWUsIGFuZCBpdAo+ID4g
aXMgdGhlICpzdG9yYWdlKiB0aGF0IHR1cm5zIGEgcG9zaXRpdmUgdmFsdWUgaW50byBhIG5lZ2F0
aXZlIG9uZS4KPiA+Cj4gCj4gVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgaW5mbyEKPiAKPiBNYXkg
SSB1bmRlcnN0YW5kIHRoYXQgeW91ciBjb25jZXJuIGlzIG1haW5seSBmb3IgYSBwbGF0Zm9ybSB3
aXRoIDY0Yml0IGludCB0eXBlLAo+IHdoaWNoIG1heSB0cmlnZ2VyIHRoZSBwb3NpdGl2ZSB0byBu
ZWdhdGl2ZSBjb252ZXJ0Pwo+IAo+IElmIHNvLCBJIHRoaW5rIHdlIG1heSBuZWVkIHRvIGRvIGEg
Y2xlYW4gdXAgZm9yIHRoZSB0ZXN0IGNvZGUgc2luY2UKPiBzZXZlcmFsIG90aGVyCj4gcGxhY2Vz
IGhhdmUgdGhlIHNhbWUgaXNzdWUuCgpZZXMsIEkgdGhpbmsgd2Ugc2hvdWxkIGRvIHRoYXQgY2xl
YW51cC4gV2hpbGUgdGhlcmUgYXJlIHByb2JhYmx5IHNldmVyYWwKb2ZmZW5kZXJzIHNjYXR0ZXJl
ZCB0aHJvdWdob3V0IGt2bSBzZWxmdGVzdHMsIHdlIGNhbiBrZWVwIHRoZSBzY29wZSBvZgp0aGlz
IHNlcmllcyBmb2N1c2VkIG9uIGFyY2hfdGltZXIuYy4gTGV0J3MgYXVkaXQgYWxsIHVzZXMgb2Yg
c2lnbmVkIHR5cGVzCmFuZCBjb252ZXJ0IHRoZW0gdG8gdW5zaWduZWQgYXMgbmVjZXNzYXJ5IHdp
dGggc29tZSBzZXBhcmF0ZSBwYXRjaChlcykKYmVmb3JlIHNwbGl0dGluZyB0aGUgdGVzdCwgc28g
Ym90aCBhYXJjaDY0IGFuZCByaXNjdiBnZXQgdGhlIGNsZWFudXBzLgoKVGhhbmtzLApkcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
