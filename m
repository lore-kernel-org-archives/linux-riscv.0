Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D002CC021BC
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 09:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/fY8bBCvDUFmN00N/nZ+sgaJnFA2E2ssEGbSctDzLA=; b=cAEHVF39uLZC0L
	7TCOL2kKDbt4svI/rJrNBMqgE3szFF0p2G35u8/Xq0qz1YlbucLEqy9PqH17N4VNaF2JmoG+tOjuM
	1hpgyRGOOTMZv9Mv4LP+SFEpf7Zc6iLGFXhKi/lphRMvqjBLKew/zmjRagyab+uXrLb4VMGrcyyCL
	Rl07XhKBimncC2q6qPeBSf5AT7yJcAIeOIU2SSVSfigChQiUAKm8yFEZES4USAj3AelkRt6TAwkhl
	9eBPYqx2qFM6d7/2GJcC6nXAj851Rk7/2lwLi00QeXQwvU3ZoiSe4dCBeo2qLnsFls4vO8UE7Nc+s
	cgvNq5Q06jqP/kpAohLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDdE-0000000346j-2Aeh;
	Wed, 26 Feb 2025 09:23:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDYy-000000033Jf-0Rcs
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 09:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740561522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
	b=Rf885z9zKsUeVGoHjYi1SlL0UvYLLhYKz62kRSxOeaokidwl/4sQ+4u6ASc9NuQ1hvhqsz
	XT8TC01xe8hI93VIIMXCPAxyEb7BSIaWHiHpNbi+OOD9zWzKXD4rdxuUDsVowHn0HqnZl1
	KBcWa8oGmPFRggcp9eCh4WjQqyRG6jY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-aRtMybNiPLK6j1z4AJE1HQ-1; Wed, 26 Feb 2025 04:18:39 -0500
X-MC-Unique: aRtMybNiPLK6j1z4AJE1HQ-1
X-Mimecast-MFC-AGG-ID: aRtMybNiPLK6j1z4AJE1HQ_1740561518
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38f2f438fb6so7487798f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 01:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740561518; x=1741166318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
        b=FAWnhVwbxUx8K79jzCJwphm0r3llOrSGHPsIuiYPErL9VAW4J/1LuXXNsICE5NVxtj
         UvNKwsArNYGT2E8U4otCgF7Lzo9SQreWICzmhmXxLvookZYYJjrX0wceJkUkAylFkZkW
         hSMiV9SmxiGSVuIMAURcf8IyAyPPR5V61xsekxPyT9/xbtZL317Md7+XvKD+LMo6FDAY
         60Ho07n0vLWlTubnC421SwJrr5xMocoDyrxIUotLKxUJ3Q5XK9pnmX8hW38ajRWauUtc
         s7v8zh/jOhP2EZa3LXFc8ly/YKxPSgPtgny4IXSBz2JD/E8ESh66/07Ppk7dCTMjijuK
         XtQg==
X-Forwarded-Encrypted: i=1; AJvYcCWWk/MG4N0LHb5oZIIFL9PH1E3+Drd2MCvjLbYFIYcF+R9gMyD2aYj7LUmTtm1GpIu9umVLR3LoSYCHxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE1s85etVXDTNcKzEdKkD5GwPxSoCbl79UQoOPcCEThBoPjdkf
	TVuoYaJOsoiBlngAQs17VOXBirEg/RChq567qV0+Yd2EAC+SjGsA8/jtNT6zJsuE5yRZQt9YKiU
	oOWe/m3NNz7CvNdmQcgmk9iI9sQLD+S++gYGSFAz/O9kfQvBn/up0AXQbHtStuClxHR81k9o6p+
	69igzy2+4Fs6NEXrjJFsiZlRWjmqszySznkMY54Kzy
X-Gm-Gg: ASbGncsaAW+qy1NM2jeSjEoDAI62ztoxYWt/pXkHxHRgt+dzlzpkfRmQIJ4WKUiQP1Y
	AC3dRrxndCiuz5xRKyv/aRet9hZbynLguUnxqtGvj+cWhvhgkeZmD568wtWS5KMmIQXjq/hMgzQ
	==
X-Received: by 2002:a5d:47af:0:b0:390:d61c:c777 with SMTP id ffacd0b85a97d-390d61cc85fmr1296757f8f.46.1740561517827;
        Wed, 26 Feb 2025 01:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM8QJcltKK3icbvaiTIyjEom27+uMjjmS3V6slM8kbmQaHs57lufLQIp1ODz/r9AND77qyPMNyl+BQOe7Hd40=
X-Received: by 2002:a5d:47af:0:b0:390:d61c:c777 with SMTP id
 ffacd0b85a97d-390d61cc85fmr1296733f8f.46.1740561517436; Wed, 26 Feb 2025
 01:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com> <Z75f9GuA9NfKo37c@google.com>
In-Reply-To: <Z75f9GuA9NfKo37c@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 26 Feb 2025 10:18:26 +0100
X-Gm-Features: AQ5f1JqpfKleIgYhNDBuhYOTkE7mUvo6hlKxjC4ts72PAS8Q4WmxhhjJCWdlkGA
Message-ID: <CABgObfZWqBm089dkOpWwX-d6Bgp84zP_0Gow4ow7ZKHov=8oxg@mail.gmail.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Aaron Lewis <aaronlewis@google.com>, 
	Jim Mattson <jmattson@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xRH7Yx12vpB9tnJ4wMjsn_yVGIQhI504L-dmyaU7IzA_1740561518
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_011844_288124_FD554E2A 
X-CRM114-Status: GOOD (  13.96  )
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

T24gV2VkLCBGZWIgMjYsIDIwMjUgYXQgMToyN+KAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgRmViIDI2LCAyMDI1LCBQYW9sbyBC
b256aW5pIHdyb3RlOgo+ID4gT24gMi8yNS8yNSAwMDo1NSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3
cm90ZToKPiA+ID4gRnJlZSB2Q1BVcyBiZWZvcmUgZnJlZWluZyBhbnkgVk0gc3RhdGUsIGFzIGJv
dGggU1ZNIGFuZCBWTVggbWF5IGFjY2Vzcwo+ID4gPiBWTSBzdGF0ZSB3aGVuICJmcmVlaW5nIiBh
IHZDUFUgdGhhdCBpcyBjdXJyZW50bHkgImluIiBMMiwgaS5lLiB0aGF0IG5lZWRzCj4gPiA+IHRv
IGJlIGtpY2tlZCBvdXQgb2YgbmVzdGVkIGd1ZXN0IG1vZGUuCj4gPiA+Cj4gPiA+IENvbW1pdCA2
ZmNlZTAzZGY2YTEgKCJLVk06IHg4NjogYXZvaWQgbG9hZGluZyBhIHZDUFUgYWZ0ZXIgLnZtX2Rl
c3Ryb3kgd2FzCj4gPiA+IGNhbGxlZCIpIHBhcnRpYWxseSBmaXhlZCB0aGUgaXNzdWUsIGJ1dCBm
b3IgdW5rbm93biByZWFzb25zIG9ubHkgbW92ZWQgdGhlCj4gPiA+IE1NVSB1bmxvYWRpbmcgYmVm
b3JlIFZNIGRlc3RydWN0aW9uLiAgQ29tcGxldGUgdGhlIGNoYW5nZSwgYW5kIGZyZWUgYWxsCj4g
PiA+IHZDUFUgc3RhdGUgcHJpb3IgdG8gZGVzdHJveWluZyBWTSBzdGF0ZSwgYXMgblZNWCBhY2Nl
c3NlcyBldmVuIG1vcmUgc3RhdGUKPiA+ID4gdGhhbiBuU1ZNLgo+ID4KPiA+IEkgYXBwbGllZCB0
aGlzIHRvIGt2bS1jb2NvLXF1ZXVlLCBJIHdpbGwgcGxhY2UgaXQgaW4ga3ZtL21hc3RlciB0b28g
dW5sZXNzCj4gPiB5b3Ugc2hvdXQuCj4KPiBEZXBlbmRzIG9uIHdoYXQgInRoaXMiIGlzIDotKQo+
Cj4gTXkgcGxhbi9ob3BlIGlzIHRvIGxhbmQgcGF0Y2hlcyAxIGFuZCAyIGluIDYuMTQsIGkuZS4g
aW4ga3ZtL21hc3RlcgoKSSBtZWFudCBvbmx5IDEsIGJ1dCBpZiB5b3Ugd2FudCB0byBoYXZlIDIg
YXMgd2VsbCB0aGVuIHRoYXQncyBmaW5lIHRvby4KCkFzIHRvIGt2bS1jb2NvLXF1ZXVlLCBiYXNl
ZCBvbiBZYW4ncyByZXBseSBJIGhhdmUgMSAob2YgY291cnNlKSwgNCBhbmQKYW4gZXh0cmEgcGF0
Y2ggdG8gbW92ZSBrdm1feDg2X2NhbGwodm1fZGVzdHJveSkgYXQgdGhlIHZlcnkgZW5kIG9mCmt2
bV9hcmNoX2Rlc3Ryb3lfdm07IEknbGwgcG9zdCBldmVyeXRoaW5nIGFzIHNvb24gYXMgSSBmaW5p
c2ggYnVpbGRpbmcKYW5kIHRlc3RpbmcuCgpQYW9sbwoKPiByZXN0IGFyZSBmaXJtbHkgNi4xNSBJ
TU8uICBBbmQgYmFzZWQgb24gWWFuJ3MgZmVlZGJhY2ssIEknbSBwbGFubmluZyBvbiBhZGRpbmcg
YQo+IGZldyBtb3JlIGNsZWFudXBzICh0aG91Z2ggSSB0aGluayB0aGV5J3JlIGZ1bGx5IGFkZGl0
aXZlLCBpLmUuIGNhbiBnbyBvbiB0b3ApLgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
