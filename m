Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7174BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 22:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HDVoaL3EV+JB3KUUXuyh208SKuZZZ2SG/wog2sg1n1Q=; b=Xi2XYhAl3hHdcv1PEPi95qUici
	xih2/jf8uRnQw0euFOVcccbPMOfqofqZX9Q+pEi9OvxVC8KY/Fp+5iy0ZZ8eNkdmzhQE3oNGNqjKJ
	j2iQaYswolO7I9z1riDI0XbEySwNEZ05zj7u/c514Pyn3WlBBppnVMoZR+R4wEt+JS95q82E5G4l0
	u+yY5fYOpTt6bWQ/1tx7Gzox65JfE6k5vsKEObhUgzooLrKwwfG7aY3LhQKzOc71HEW5/bkaSNAcd
	UieLt/XhbslQb07jhbRz3b5+zx4FG3Oa6hSG2WdHSxVHq/bVWtYwrukHA1+SsVqtkOObwDRr0p6lu
	ceRxAlaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDYCQ-00GC89-0s;
	Wed, 13 Dec 2023 22:59:30 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDYCL-00GC5Y-2T
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 22:59:28 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dbcc6933a14so1973045276.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 14:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702508358; x=1703113158; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+J5uhAeT04KXTELzQDOfFmLaVLnZ2vRpEsBsoOgLL4=;
        b=r1jryfbj3yXQBG35BuewYaUA7c7mkXeFiBp0Vsh/zoMxxCLb4X1YdVQ4w8SIuQ4wnX
         cmQTBbqLpJG9AoLIB8y+1ks8qrXdBDWjAWDuEw797iS9kJhq7GqK10NLBpuDhqeILJ5v
         ebhhMcnX8Hx6VX/lvn0zcm6LRcy5p1ZCPtdyWH2ye9FszHpxyjww0KvhGerSjc68nf9a
         Fv8paK3zlinkxt1zwh9I3jBo84xPnWRuylxZWV1QngtG7yVT8inGP11/6RBQoD3PWRA+
         3WCwmSDhfOwEaEN90ho6zkWnzue/NiP+614G/AAHpeCYuqK/MplElo8X0cprA+Jkz0vJ
         0uPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702508358; x=1703113158;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P+J5uhAeT04KXTELzQDOfFmLaVLnZ2vRpEsBsoOgLL4=;
        b=PWE3ngFSa6ht7s1+6hH14TbCeDAFNHAucLu4iCFXdyESt/dxQ7usrDDqgg7iZf5TNL
         oZNVRdEFVi7SwGVFPjU7xud29PRbix1aZ9rPekdv3Dtzj6RL36TTFNNnoex5KCzuHegU
         KPPpYxtzI35D6PHPRO7oBaqhSpUzLtlDZdOnFpPHwYK6VYFk0nFtientAOYR7ie1j+lz
         3PgJrIEju9UWOw1/VekjSrahHR0q+CPWtp8LNCYIyocDVqgYGaLL2GcTWL6t3wJ+LY8I
         Uyth78P3uKEFm8BMgj42WwlIQjc9RLBZQWZxZeWez8x5DK9oZox8AIJVYSfnjI/jNAVR
         3ExA==
X-Gm-Message-State: AOJu0YzoMZCk7AJvKPY7GeDBXbKASpWfpRZfNyeOi2jLGKXEejHeWl+K
	y5ft3hmH9Mn1wepvaZLWHkJSIkYL1L4=
X-Google-Smtp-Source: AGHT+IF/2tOKGAnp02CUAmcGGknds7jEyZkdjWAgG3ZJhjWlZQOPu75oZHl38j1efeikxZ9gYUCkkMb1/cI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:a28c:0:b0:dbc:d4c4:15d3 with SMTP id
 c12-20020a25a28c000000b00dbcd4c415d3mr27833ybi.5.1702508358541; Wed, 13 Dec
 2023 14:59:18 -0800 (PST)
Date: Wed, 13 Dec 2023 14:59:16 -0800
In-Reply-To: <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
Mime-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
 <ZXHw7tykubfG04Um@google.com> <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
 <ZXh8Nq_y_szj1WN0@google.com> <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
Message-ID: <ZXo3REB8g-ZecT2U@google.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Jim Mattson <jmattson@google.com>, alexandru.elisei@arm.com, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atishp@atishpatra.org, borntraeger@linux.ibm.com, 
	chenhuacai@kernel.org, david@redhat.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, james.morse@arm.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	maz@kernel.org, oliver.upton@linux.dev, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, suzuki.poulose@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_145925_810185_BDD88DD3 
X-CRM114-Status: GOOD (  34.86  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMsIE1heGltIExldml0c2t5IHdyb3RlOgo+IE9uIFR1ZSwgMjAy
My0xMi0xMiBhdCAwNzoyOCAtMDgwMCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiA+IE9u
IFN1biwgRGVjIDEwLCAyMDIzLCBKaW0gTWF0dHNvbiB3cm90ZToKPiA+ID4gT24gVGh1LCBEZWMg
NywgMjAyMyBhdCA4OjIx4oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5j
b20+IHdyb3RlOgo+ID4gPiA+IERvaC4gIFdlIGdvdCB0aGUgbGVzcyBvYnZpb3VzIGNhc2VzIGFu
ZCBtaXNzZWQgdGhlIG9idmlvdXMgb25lLgo+ID4gPiA+IAo+ID4gPiA+IFVnaCwgYW5kIHdlIGFs
c28gbWlzc2VkIGEgcmVsYXRlZCBtZXNzIGluIGt2bV9ndWVzdF9hcGljX2hhc19pbnRlcnJ1cHQo
KS4gIFRoYXQKPiA+ID4gPiB0aGluZyBzaG91bGQgcmVhbGx5IGJlIGZvbGRlZCBpbnRvIHZteF9o
YXNfbmVzdGVkX2V2ZW50cygpLgo+ID4gPiA+IAo+ID4gPiA+IEdvb2QgZ3JhdnkuICBBbmQgdm14
X2ludGVycnVwdF9ibG9ja2VkKCkgZG9lcyB0aGUgd3JvbmcgdGhpbmcgYmVjYXVzZSB0aGF0Cj4g
PiA+ID4gc3BlY2lmaWNhbGx5IGNoZWNrcyBpZiBMMSBpbnRlcnJ1cHRzIGFyZSBibG9ja2VkLgo+
ID4gPiA+IAo+ID4gPiA+IENvbXBpbGUgdGVzdGVkIG9ubHksIGFuZCBkZWZpbml0ZWx5IG5lZWRz
IHRvIGJlIGNodW5rZWQgaW50byBtdWx0aXBsZSBwYXRjaGVzLAo+ID4gPiA+IGJ1dCBJIHRoaW5r
IHNvbWV0aGluZyBsaWtlIHRoaXMgbWVzcz8KPiA+ID4gCj4gPiA+IFRoZSBwcm9wb3NlZCBwYXRj
aCBkb2VzIG5vdCBmaXggdGhlIHByb2JsZW0uIEluIGZhY3QsIGl0IG1lc3NlcyB0aGluZ3MKPiA+
ID4gdXAgc28gbXVjaCB0aGF0IEkgZG9uJ3QgZ2V0IGFueSB0ZXN0IHJlc3VsdHMgYmFjay4KPiA+
IAo+ID4gRHJhdC4KPiA+IAo+ID4gPiBHb29nbGUgaGFzIGFuIGludGVybmFsIEstVS1UIHRlc3Qg
dGhhdCBkZW1vbnN0cmF0ZXMgdGhlIHByb2JsZW0uIEkKPiA+ID4gd2lsbCBwb3N0IGl0IHNvb24u
Cj4gPiAKPiA+IFJlY2VpdmVkLCBJJ2xsIGRpZyBpbiBzb29uaXNoLCB0aG91Z2ggInNvb25pc2gi
IG1pZ2h0IHVuZm9ydHVuYXRlbHkgbWlnaHQgbWVhbgo+ID4gMjAyNC4KPiA+IAo+IAo+IEhpLAo+
IAo+IFNvIHRoaXMgaXMgd2hhdCBJIHRoaW5rOgo+IAo+IEtWTSBkb2VzIGhhdmUga3ZtX2d1ZXN0
X2FwaWNfaGFzX2ludGVycnVwdCgpIGZvciB0aGlzIGV4YWN0IHB1cnBvc2UsCj4gdG8gY2hlY2sg
aWYgbmVzdGVkIEFQSUN2IGhhcyBhIHBlbmRpbmcgaW50ZXJydXB0IGJlZm9yZSBoYWx0aW5nLgoK
Rm9yIGFsbCBpbnRlbnRzIGFuZCBwdXJwb3Nlcywgc28gd2FzIG5lc3RlZF9vcHMtPmhhc19ldmVu
dHMoKS4gIEkgZG9uJ3Qgc2VlCmFueSByZWFzb24gdG8gaGF2ZSB0d28gQVBJcyB0aGF0IGRvIHRo
ZSBzYW1lIHRoaW5nLCBhbmQgdGhlIGNhbGwgdG8Ka3ZtX2d1ZXN0X2FwaWNfaGFzX2ludGVycnVw
dCgpIGlzIHdyb25nIGluIHRoYXQgaXQgZG9lc24ndCB2ZXJpZnkgdGhhdCBJUlFzIGFyZQplbmFi
bGVkIGZvciBfTDJfLiAgVGhhdCdzIHdoeSBteSBwcmVmZXJlbmNlIGlzIHRvIGZvbGQgdGhlIHR3
byB0b2dldGhlci4KCj4gSG93ZXZlciB0aGUgcHJvYmxlbSBpcyBiaWdnZXIgLSB3aXRoIEFQSUN2
IHdlIGhhdmUgaW4gZXNzZW5jZSAyIHBlbmRpbmcKPiBpbnRlcnJ1cHQgYml0bWFwcyAtIHRoZSBQ
SVIgYW5kIHRoZSBJUlIsIGFuZCB0byBrbm93IGlmIHRoZSBndWVzdCBoYXMgYQo+IHBlbmRpbmcg
aW50ZXJydXB0IG9uZSBoYXMgaW4gdGhlb3J5IHRvIGNvcHkgUElSIHRvIElSUiwgdGhlbiBzZWUg
aWYgdGhlIG1heAo+IGlzIGxhcmdlciB0aGVuIHRoZSBjdXJyZW50IFBQUi4KClllYWgsIHRoaXMg
aXMgd2hhdCBteSB1bnRlc3RlZCBoYWNrLWEtcGF0Y2ggdHJpZWQgdG8gZG8uCgo+IFNpbmNlIHdl
IGRvbid0IHdhbnQgdG8gd3JpdGUgdG8gZ3Vlc3QgbWVtb3J5LAoKVGhlIGNoYW5nZWxvZyBpcyBt
aXNsZWFkaW5nL3dyb25nLiAgV3JpdGluZyBndWVzdCBtZW1vcnkgaXMgb2ssIHdoYXQgaXNuJ3Qg
c2FmZQppcyBibG9ja2luZyBvciBzbGVlcGluZywgaS5lLiBLVk0gbXVzdCBub3QgdHJpZ2dlciBh
IGhvc3QgcGFnZSBmYXVsdCBkdWUgdG8KYWNjZXNzaW5nIGEgcGFnZSB0aGF0J3MgYmVlbiBzd2Fw
cGVkIG91dC4gIFJlYWQgdnMuIHdyaXRlIGRvZXNuJ3QgbWF0dGVyLgoKU28gS1ZNIGNhbiBzYWZl
bHkgcmVhZCBhbmQgd3JpdGUgZ3Vlc3QgbWVtb3J5IHNvIGxvbmcgYXMgaXQgYWxyZWFkeSBtYXBw
ZWQgYnkgCmt2bV92Y3B1X21hcCgpIChvciBJIHN1cHBvc2UgaWYgd2Ugd3JhcHBlZCBhbiBhY2Nl
c3Mgd2l0aCBwYWdlZmF1bHRfZGlzYWJsZSgpLApidXQgSSBjYW4ndCB0aGluayBvZiBhIHNhbmUg
cmVhc29uIHRvIGRvIHRoYXQpLiAgRS5nLiBuVk1YIGNhbiBhY2Nlc3MgYSB2Q1BVJ3MKUElEIG1h
cHBpbmcsIGJ1dCBzeW50aGVzaXppbmcgYSBuZXN0ZWQgVk0tRXhpdCB3aWxsIGNhdXNlIGV4cGxv
c2lvbnMgb24gblNWTS4KCj4gYW5kIHRoZSBJUlIgaGVyZSByZXNpZGVzIGluIHRoZSBndWVzdCBt
ZW1vcnksIEkgZ3Vlc3Mgd2UgaGF2ZSB0byBkbyBhCj4gJ2RyeS1ydW4nIHZlcnNpb24gb2YgJ3Zt
eF9jb21wbGV0ZV9uZXN0ZWRfcG9zdGVkX2ludGVycnVwdCcgYW5kIGNhbGwgaXQgZnJvbQo+IGt2
bV9ndWVzdF9hcGljX2hhc19pbnRlcnJ1cHQoKS4KCm5lc3RlZF9vcHMtPmhhc19ldmVudHMoKSBp
cyB0aGUgbXVjaCBiZXR0ZXIgZml0LCBlLmcuIHRoZSBuYW1pbmcgd29uJ3QgZ2V0IHdlaXJkCmFu
ZCB3ZSBjYW4gZ2F0ZSB0aGUgd2hvbGUgdGhpbmcgb24gaXNfZ3Vlc3RfbW9kZSgpLiAgVGhvdWdo
IHdlIHByb2JhYmx5IG5lZWQgYQp3cmFwcGVyIHRvIGhhbmRsZSBhbnkgY29tbW9uYWxpdGllcyBi
ZXR3ZWVuIG5WTVggYW5kIG5TVk0uCgo+IFdoYXQgZG8geW91IHRoaW5rPyBJIGNhbiBwcmVwYXJl
IGEgcGF0Y2ggZm9yIHRoaXMuCgpBcyBhYm92ZSwgdGhpcyBpcyB3aGF0IEkgdHJpZWQgdG8gZG8s
IHNvcnQgb2YuICBUaG91Z2ggaXQncyBvYnZpb3VzbHkgYnJva2VuLiAgV2UKZG9uJ3QgbmVlZCBh
IGZ1bGwgZHJ5LXJ1biBiZWNhdXNlIEtWTSBvbmx5IG5lZWRzIHRvIGRldGVjdCBldmVudHMgdGhh
dCBhcmUgdW5pcXVlCnRvIEwyLCBlLmcuIG5WTVgncyBwcmVlbXB0aW9uIHRpbWVyLCBNVEYsIGFu
ZCBwZW5kaW5nIHZpcnR1YWwgaW50ZXJydXB0cyAoaG1tLApJIHN1c3BlY3QgblNWTSdzIHZOTUkg
aXMgYnJva2VuIHRvbykuICBUaGluZ3MgbGlrZSBJTklUIGFuZCBTTUkgZG9uJ3QgcmVxdWlyZQpu
ZXN0ZWQgdmlydHVhbGl6YXRpb24gYXdhcmVuZXNzIGJlY2F1c2UgdGhlIGV2ZW50IGl0c2VsZiBp
cyB0cmFja2VkIGZvciB0aGUgdkNQVQphcyBhIHdob2xlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
