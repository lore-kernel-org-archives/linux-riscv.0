Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C14C61D92
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jF7GAGWXhGkF6YIDUCO2yC4H6k9wUIX69xmCcONwIUY=; b=qLDvh7aZnD5V0F
	wPTmhHg2PGXXwdfT72yzRbvZnkWQNUkaftCib+v4ea7GE7Y9Ze0/0rwNye4vZBD5TAEETW9Xoph+c
	kDwWXxcy+k1mh9A19r3UaacaCytAjfTe17PQJqkf0Xtua7DfssFPLMB211xZSbGfCd3GSrfW9n1dt
	eTKSQwP8iS+LldggGMKci4YTtI0B1D0Jia1c3wLHVNFBb/fQSwLGS0BTDjPfmEx1IsvkjI3cFM9Ei
	Ggkys5Zou1YsZBbTrrxVVyYXKLZHR4l7JT+wmA2B9EV3CIkAty5958jIGkp8RL4o529XkKlvzGbZ2
	b9GJFEaURqTsnhTAVkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5iMD-0011IW-2O;
	Wed, 22 Nov 2023 08:13:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5iMA-0011HD-01
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 08:13:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4083f613275so32046075e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 00:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700640786; x=1701245586; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FzPPKXZyEg7qy/J2H0aK0NbgOULhdPKN22jDT3Q9NdY=;
        b=N2DiyO2M+TCt7BFa+3qQtj8Aey155HL5eTYLNWX0pTxSQGxiFSTy3ASBvXAEQ0olhl
         TTylWOjr7XdSe+KIYPgGyv7dtERL9hBrA1aBJDeiuVADht5fmZFmoigqgDzcdtvJDtxa
         Ww60sl6pVEE7HO0eS/H62EKM2ZpyUSiPGN2Xy8AmkPjvDagxHWWZKLESVSStDltiBWIN
         AQRpbkHJWRPH3Np7zMdP2yWTIZ6B9w7w96rGOUYn3tEjEcWCb41UJAaXOkvFKJD0Bly6
         biyBIX15cBXZ0ENw1+qCdde+mRQvOFgX4IWNq0qVNLuIubyJ3rmdHu+U7meUOMAywKGm
         /bXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700640786; x=1701245586;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzPPKXZyEg7qy/J2H0aK0NbgOULhdPKN22jDT3Q9NdY=;
        b=Z3Pza7zgBFRthM6CTpWA59OXtBVJ/f92WslP6AGcexzIW0o40jHdcHl1DEFFS0BXk7
         JIHuYi9mipyI8/v2f1TX7gsdGYXGqetfbI3GkfthVrUJizCwRwK5N+EEDL4Z+nz5Ecxm
         agZLtKHWF3s5l7O/hGZrZlJpwtXwN2eUE8fosQSgzA874jA8uos0z7W8TPEnFbGp9HW4
         1H1pkJgbYDs8TB1fl4TW1U0Op+1isoLSCWLsp5o6HLmbiOGKOiWnEj/wjtx2LTDjb8pl
         m2Q8J4kdl0eANXt2Ha0NCPHC6u5mILbaAj921faJNrf7pL6BpvLvrVBj1A+oUDh29RA5
         JXOQ==
X-Gm-Message-State: AOJu0YyxivPrT14rfNXx04JE828+JlE/Jv7KqGjn0vakOVR7q6ACn2yA
	LwGjS83G24mQAExavV67mvEFAg==
X-Google-Smtp-Source: AGHT+IHPZfaDHkxQULB/N6YwAHSW77gMAbzbjK0nZaSfLb1EK8uIfrnvGjJE9KnZqt2r7I6qEwdCDQ==
X-Received: by 2002:a05:600c:4e89:b0:405:e492:8aef with SMTP id f9-20020a05600c4e8900b00405e4928aefmr832641wmq.40.1700640786547;
        Wed, 22 Nov 2023 00:13:06 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id az39-20020a05600c602700b0040596352951sm1364960wmb.5.2023.11.22.00.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 00:13:05 -0800 (PST)
Date: Wed, 22 Nov 2023 09:13:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/9] KVM: selftests: Unify the makefile rule for split
 targets
Message-ID: <20231122-b471122622059496906801c1@orel>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <cda6cc71c9bdde87fe87f6c2dec4f03ca249dd62.1694421911.git.haibo1.xu@intel.com>
 <20231003-d44206f71d0b22e539833697@orel>
 <CAJve8o=Q74U0Z3PayrzY7heNc0qeTw5VYS+tdkpm=aJdefQEbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8o=Q74U0Z3PayrzY7heNc0qeTw5VYS+tdkpm=aJdefQEbQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_001310_067804_1172F4F0 
X-CRM114-Status: GOOD (  22.39  )
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

T24gU3VuLCBPY3QgMDgsIDIwMjMgYXQgMTA6NTg6NTdBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gVHVlLCBPY3QgMywgMjAyMyBhdCA2OjI44oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNA
dmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQg
MDk6MzY6NTZBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+IEEgc2VwYXJhdGUgbWFrZWZp
bGUgcnVsZSB3YXMgdXNlZCBmb3Igc3BsaXQgdGFyZ2V0cyB3aGljaCB3YXMgYWRkZWQKPiA+ID4g
aW4gcGF0Y2goS1ZNOiBhcm02NDogc2VsZnRlc3RzOiBTcGxpdCBnZXQtcmVnLWxpc3QgdGVzdCBj
b2RlKS4gVGhpcwo+ID4gPiBjb3VsZCBiZSBhdm9pZGVkIGJ5IG1pbm9yIGNoYW5nZXMgdG8gdGhl
IHJlY2lwZXMgb2YgY3VycmVudCBydWxlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBIYWli
byBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICB0b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUgfCA2ICsrLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9NYWtlZmlsZQo+ID4gPiBpbmRleCBhM2JiMzZmYjNjZmMuLjc5NzIyNjllOGM1
ZiAxMDA2NDQKPiA+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01ha2VmaWxl
Cj4gPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZQo+ID4gPiBA
QCAtMjQ5LDEzICsyNDksMTAgQEAgVEVTVF9ERVBfRklMRVMgKz0gJChwYXRzdWJzdCAlLm8sICUu
ZCwgJChTUExJVF9URVNUU19PQkpTKSkKPiA+ID4gIC1pbmNsdWRlICQoVEVTVF9ERVBfRklMRVMp
Cj4gPiA+Cj4gPiA+ICAkKFRFU1RfR0VOX1BST0dTKSAkKFRFU1RfR0VOX1BST0dTX0VYVEVOREVE
KTogJTogJS5vCj4gPiA+IC0gICAgICQoQ0MpICQoQ0ZMQUdTKSAkKENQUEZMQUdTKSAkKExERkxB
R1MpICQoVEFSR0VUX0FSQ0gpICQ8ICQoTElCS1ZNX09CSlMpICQoTERMSUJTKSAtbyAkQAo+ID4g
PiArICAgICAkKENDKSAkKENGTEFHUykgJChDUFBGTEFHUykgJChMREZMQUdTKSAkKFRBUkdFVF9B
UkNIKSAkXiAkKExETElCUykgLW8gJEAKPiA+ID4gICQoVEVTVF9HRU5fT0JKKTogJChPVVRQVVQp
LyUubzogJS5jCj4gPiA+ICAgICAgICQoQ0MpICQoQ0ZMQUdTKSAkKENQUEZMQUdTKSAkKFRBUkdF
VF9BUkNIKSAtYyAkPCAtbyAkQAo+ID4gPgo+ID4gPiAtJChTUExJVF9URVNUU19UQVJHRVRTKTog
JTogJS5vICQoU1BMSVRfVEVTVFNfT0JKUykKPiA+ID4gLSAgICAgJChDQykgJChDRkxBR1MpICQo
Q1BQRkxBR1MpICQoTERGTEFHUykgJChUQVJHRVRfQVJDSCkgJF4gJChMRExJQlMpIC1vICRACj4g
PiA+IC0KPiA+ID4gIEVYVFJBX0NMRUFOICs9ICQoTElCS1ZNX09CSlMpICQoVEVTVF9ERVBfRklM
RVMpICQoVEVTVF9HRU5fT0JKKSAkKFNQTElUX1RFU1RTX09CSlMpIGNzY29wZS4qCj4gPiA+Cj4g
PiA+ICB4IDo9ICQoc2hlbGwgbWtkaXIgLXAgJChzb3J0ICQoZGlyICQoTElCS1ZNX0NfT0JKKSAk
KExJQktWTV9TX09CSikpKSkKPiA+ID4gQEAgLTI3NCw2ICsyNzEsNyBAQCAkKExJQktWTV9TVFJJ
TkdfT0JKKTogJChPVVRQVVQpLyUubzogJS5jCj4gPiA+ICB4IDo9ICQoc2hlbGwgbWtkaXIgLXAg
JChzb3J0ICQoZGlyICQoVEVTVF9HRU5fUFJPR1MpKSkpCj4gPiA+ICAkKFRFU1RfR0VOX1BST0dT
KTogJChMSUJLVk1fT0JKUykKPiA+ID4gICQoVEVTVF9HRU5fUFJPR1NfRVhURU5ERUQpOiAkKExJ
QktWTV9PQkpTKQo+ID4gPiArJChTUExJVF9URVNUU19UQVJHRVRTKTogJChPVVRQVVQpLyU6ICQo
QVJDSF9ESVIpLyUubwo+ID4gPgo+ID4gPiAgY3Njb3BlOiBpbmNsdWRlX3BhdGhzID0gJChMSU5V
WF9UT09MX0lOQ0xVREUpICQoTElOVVhfSERSX1BBVEgpIGluY2x1ZGUgbGliIC4uCj4gPiA+ICBj
c2NvcGU6Cj4gPiA+IC0tCj4gPiA+IDIuMzQuMQo+ID4gPgo+ID4KPiA+IEkganVzdCBub3RpY2Vk
IHRoYXQgd2l0aCBhbmQgd2l0aG91dCB0aGlzIHBhdGNoIHdlJ3JlIGJ1aWxkaW5nIHRoZQo+ID4g
YXJjaC1zcGVjaWZpYyBwYXJ0IGluIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdiBl
dmVuIHdoZW4gd2UgaGF2ZQo+ID4gYW4gJChPVVRQVVQpIGRpcmVjdG9yeSAoZS5nLiBPPWJ1aWxk
KS4gVGhvc2UgYnVpbGQgYXJ0aWZhY3RzIHNob3VsZCBiZSBpbgo+ID4gYnVpbGQva3NlbGZ0ZXN0
L2t2bS9yaXNjdiBpbnN0ZWFkLgo+ID4KPiAKPiBUaGFua3MgZm9yIHBvaW50aW5nIGl0IG91dC4g
SSB3aWxsIGhhdmUgYSBsb29rIGluIG5leHQgd2VlayEKPgoKSGkgSGFpYm8sCgpQYW9sbyBqdXN0
IGZpeGVkIHRoaXMKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTEyMTE2NTYzMS4x
MTcwNzk3LTEtcGJvbnppbmlAcmVkaGF0LmNvbS8KClRoYW5rcywKZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
