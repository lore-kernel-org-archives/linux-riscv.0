Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8974C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 07:38:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 715CA61506
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 07:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 715CA61506
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzQfSZniMMPQXUY/06BGklbG6rmTyTBFdSs3IYGR35Y=; b=B4DDAr8fAd02bL
	khFzYuICcC3Yqke0sg/gOakbb9AgYpuDte7/hxxzALr5IlA948px3+9JHSnGmCGJvW/jhAwKx8XhR
	/ImB/XPAoE+cmVMoZn9jt1X8PVnX0d+JQQ2w0xqA7LB9ivFdtaUp3VmoQ4BWB/S5A7d6Jf0cXVYN+
	uutejUr3L3ObRh1TPxjnHShCmtAi1q3U1vmWY0GyN41YEqLi7Z3Of6R4xFPmvWVnCy6O6XRe865R/
	ZEVEBmZE+5jfj4wtuk65gFcU+Oln30G3HatQLoDdnHvIIla1aPQpKojy05VNhql7OqP7N5/QTXXEL
	RoMZKz9Ac7lgFtHXdpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXf1E-009OvK-Cn; Tue, 05 Oct 2021 07:37:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXf1B-009OrF-OL
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 07:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633419453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=49p/2VYCpgzSUPriPCQYlTSgRQVf+nlRSvbtUTXuaMU=;
 b=YyYiz8Cn00YDWiD26zQzQuYQnwFiuC+mpyGjvIQJxJcwTlZtg2L/8erhtHwtByy9vNPnEj
 pf+hBsjTWCNg5Jgkt4l4CtvLxcYi+9LYJuhaR9Hwcf2X6oL6JxbbdAOs/TvSXcPDE0Fq30
 Z82HxbNRNiC88+uAyL34fX0jnL2Wk90=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-OCgarENtM6WJBYas38pI4Q-1; Tue, 05 Oct 2021 03:37:30 -0400
X-MC-Unique: OCgarENtM6WJBYas38pI4Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so1579305edl.18
 for <linux-riscv@lists.infradead.org>; Tue, 05 Oct 2021 00:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=49p/2VYCpgzSUPriPCQYlTSgRQVf+nlRSvbtUTXuaMU=;
 b=TNg1ZPncn38pIAq8hvxMPIiQB7Enpp8KlvwNhod5/xDaUd1zyyz8yMIK9UKHqYAYFO
 kkESwJ+GQzcsQ9/8lu9uc5QfbIK86xVRhResH9Yj8/7Y9528quVjNwnaO+cu25Z8oKqL
 Yh7jCfUnfRymJ1VQoS8uOzdGcy1sI2PQg7+WWhds347Dnim34Vbxw5l+I9yK1uiByw2W
 fmwjW/Kxa/G74RIdrEceUY7WxQoyl7RkTtaYv1MWVD/I0NLjhz/ooIu1u1dVbJqHYXYv
 r81D75poZyCqEMdgUZF8krg30lMUBwNIMCR0LvMQ7ZZnmbY80Uxy8Wvgm06hMdO50PDr
 f/EQ==
X-Gm-Message-State: AOAM531FJGF3qHMriD/vDywqn4WRMDDO4BiWKyKP6szHLZRwXVFPKHyT
 6rJutm6dqAePnBBEeyi42+klSYLxZh3mH/NAGX4oT60lkN8lwYiwmpFvi+A1fPhKqTbX8eu+WzW
 V2KwJfzG5acAJf2fElfkKOymLHJsi
X-Received: by 2002:aa7:d78e:: with SMTP id s14mr23518898edq.171.1633419449719; 
 Tue, 05 Oct 2021 00:37:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYKBVFrLpIIpPhu4m8RSBp05E7KVTz4BenJWgbIUX3s52OfAYe/V6Krl1NZzZwvRsRNqEHBQ==
X-Received: by 2002:aa7:d78e:: with SMTP id s14mr23518858edq.171.1633419449429; 
 Tue, 05 Oct 2021 00:37:29 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.162.200])
 by smtp.gmail.com with ESMTPSA id d10sm7349501eja.81.2021.10.05.00.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 00:37:28 -0700 (PDT)
Message-ID: <ea3a9bab-28f2-48e7-761e-b41d7bc7d0a5@redhat.com>
Date: Tue, 5 Oct 2021 09:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v20 00/17] KVM RISC-V Support
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, graf@amazon.com,
 Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, anup@brainfault.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-1bfcbce2-3da3-4490-bcc5-45173ad84285@palmerdabbelt-glaptop>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <mhng-1bfcbce2-3da3-4490-bcc5-45173ad84285@palmerdabbelt-glaptop>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_003741_878285_2E4E209D 
X-CRM114-Status: GOOD (  14.01  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDQvMTAvMjEgMjA6MDEsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IAo+IEp1c3QgdG8gbWFr
ZSBzdXJlIHdlJ3JlIG9uIHRoZSBzYW1lIHBhZ2UgaGVyZSwgSSd2ZSBnb3QKPiAKPiAgwqDCoCBj
b21taXQgNmMzNDFhMjg1OTEyZGRiMjg5NGVmNzkzYTU4YWQ0Zjg0NjJmMjZmNCAoSEVBRCAtPiBm
b3ItbmV4dCkKPiAgwqDCoCBNZXJnZTogMDhkYTE2MDhhMWNhIDNmMjQwMWY0N2QyOQo+ICDCoMKg
IEF1dGhvcjogUGFsbWVyIERhYmJlbHQgPHBhbG1lcmRhYmJlbHRAZ29vZ2xlLmNvbT4KPiAgwqDC
oCBEYXRlOsKgwqAgTW9uIE9jdCA0IDEwOjEyOjQ0IDIwMjEgLTA3MDAKPiAgwqDCoMKgwqDCoMKg
IE1lcmdlIHRhZyAnZm9yLXJpc2N2JyBvZiAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vdmlydC9rdm0va3ZtLmdpdCBpbnRvIGZvci1uZXh0Cj4gIMKgwqDCoMKgwqDCoCBIIGV4dGVu
c2lvbiBkZWZpbml0aW9ucywgc2hhcmVkIGJ5IHRoZSBLVk0gYW5kIFJJU0MtViB0cmVlcy4KPiAg
wqDCoMKgwqDCoMKgICogdGFnICdmb3ItcmlzY3YnIG9mIAo+IHNzaDovL2dpdG9saXRlLmtlcm5l
bC5vcmcvcHViL3NjbS92aXJ0L2t2bS9rdm06ICgzMDEgY29tbWl0cykKPiAgwqDCoMKgwqDCoMKg
wqDCoCBSSVNDLVY6IEFkZCBoeXBlcnZpc29yIGV4dGVuc2lvbiByZWxhdGVkIENTUiBkZWZpbmVz
Cj4gIMKgwqDCoMKgwqDCoMKgwqAgS1ZNOiBzZWxmdGVzdHM6IEVuc3VyZSBhbGwgbWlncmF0aW9u
cyBhcmUgcGVyZm9ybWVkIHdoZW4gdGVzdCAKPiBpcyBhZmZpbmVkCj4gIMKgwqDCoMKgwqDCoMKg
wqAgS1ZNOiB4ODY6IFN3YXAgb3JkZXIgb2YgQ1BVSUQgZW50cnkgImluZGV4IiB2cy4gInNpZ25p
ZmljYW50IAo+IGZsYWciIGNoZWNrcwo+ICDCoMKgwqDCoMKgwqDCoMKgIHB0cDogRml4IHB0cF9r
dm1fZ2V0Y3Jvc3N0c3RhbXAgaXNzdWUgZm9yIHg4NiBwdHBfa3ZtCj4gIMKgwqDCoMKgwqDCoMKg
wqAgeDg2L2t2bWNsb2NrOiBNb3ZlIHRoaXNfY3B1X3B2dGkgaW50byBrdm1jbG9jay5oCj4gIMKg
wqDCoMKgwqDCoMKgwqAgS1ZNOiBzMzkwOiBGdW5jdGlvbiBkb2N1bWVudGF0aW9uIGZpeGVzCj4g
IMKgwqDCoMKgwqDCoMKgwqAgc2VsZnRlc3RzOiBLVk06IERvbid0IGNsb2JiZXIgWE1NIHJlZ2lz
dGVyIHdoZW4gcmVhZAo+ICDCoMKgwqDCoMKgwqDCoMKgIEtWTTogVk1YOiBGaXggYSBUU1hfQ1RS
TF9DUFVJRF9DTEVBUiBmaWVsZCBtYXNrIGlzc3VlCj4gIMKgwqDCoMKgwqDCoMKgwqAgc2VsZnRl
c3RzOiBLVk06IEV4cGxpY2l0bHkgdXNlIG1vdnEgdG8gcmVhZCB4bW0gcmVnaXN0ZXJzCj4gIMKg
wqDCoMKgwqDCoMKgwqAgc2VsZnRlc3RzOiBLVk06IENhbGwgdWNhbGxfaW5pdCB3aGVuIHNldHRp
bmcgdXAgaW4gcnNlcV90ZXN0Cj4gIMKgwqDCoMKgwqDCoMKgwqAgS1ZNOiBSZW1vdmUgdGxic19k
aXJ0eQo+ICDCoMKgwqDCoMKgwqDCoMKgIEtWTTogWDg2OiBTeW5jaHJvbml6ZSB0aGUgc2hhZG93
IHBhZ2V0YWJsZSBiZWZvcmUgbGluayBpdAo+ICDCoMKgwqDCoMKgwqDCoMKgIEtWTTogWDg2OiBG
aXggbWlzc2VkIHJlbW90ZSB0bGIgZmx1c2ggaW4gcm1hcF93cml0ZV9wcm90ZWN0KCkKPiAgwqDC
oMKgwqDCoMKgwqDCoCBLVk06IHg4NjogblNWTTogZG9uJ3QgY29weSB2aXJ0X2V4dCBmcm9tIHZt
Y2IxMgo+ICDCoMKgwqDCoMKgwqDCoMKgIEtWTTogeDg2OiBuU1ZNOiB0ZXN0IGVheCBmb3IgNEsg
YWxpZ25tZW50IGZvciBHUCBlcnJhdGEgCj4gd29ya2Fyb3VuZAo+ICDCoMKgwqDCoMKgwqDCoMKg
IEtWTTogeDg2OiBzZWxmdGVzdHM6IHRlc3Qgc2ltdWx0YW5lb3VzIHVzZXMgb2YgVl9JUlEgZnJv
bSBMMSAKPiBhbmQgTDAKPiAgwqDCoMKgwqDCoMKgwqDCoCBLVk06IHg4NjogblNWTTogcmVzdG9y
ZSBpbnRfdmVjdG9yIGluIHN2bV9jbGVhcl92aW50cgo+ICDCoMKgwqDCoMKgwqDCoMKgIGt2bTog
eDg2OiBBZGQgQU1EIFBNVSBNU1JzIHRvIG1zcnNfdG9fc2F2ZV9hbGxbXQo+ICDCoMKgwqDCoMKg
wqDCoMKgIEtWTTogeDg2OiBuVk1YOiByZS1ldmFsdWF0ZSBlbXVsYXRpb25fcmVxdWlyZWQgb24g
bmVzdGVkIFZNIGV4aXQKPiAgwqDCoMKgwqDCoMKgwqDCoCBLVk06IHg4NjogblZNWDogZG9uJ3Qg
ZmFpbCBuZXN0ZWQgVk0gZW50cnkgb24gaW52YWxpZCBndWVzdCAKPiBzdGF0ZSBpZiAhZnJvbV92
bWVudHJ5Cj4gIMKgwqDCoMKgwqDCoMKgwqAgLi4uCj4gCj4gaW50byAKPiBzc2g6Ly9naXRAZ2l0
b2xpdGUua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGFsbWVyL2xpbnV4Lmdp
dCAKPiBmb3ItbmV4dAo+IChJIGtub3cgdGhhdCdzIGtpbmQgb2YgYSBjb25mdXNpbmcgbmFtZSwg
YnV0IGl0J3Mgd2hhdCBJJ3ZlIGJlZW4gdXNpbmcgCj4gYXMgbXkgc2hvcnQtdGVybSBzdGFnaW5n
IGJyYW5jaCBzbyBJIGNhbiBkbyBhbGwgbXkgdGVzdHMgYmVmb3JlIHNheWluZyAKPiAiaXQncyBv
biBmb3ItbmV4dCIpLgo+IAo+IElmIHRoYXQgbG9va3MgT0sgSSBjYW4gbWFrZSBpdCBhIHRvdWNo
IG1vcmUgb2ZmaWNpYWwgYnkgcHV0dGluZyBpbnRvIHRoZSAKPiBSSVNDLVYgdHJlZS4KClllcy4g
IEFsbCBvZiB0aGUgcGF0Y2hlcyBpbiB0aGVyZSwgZXhjZXB0IHRoZSBsYXN0LCBhcmUgYWxyZWFk
eSBpbiAKTGludXMncyB0cmVlLgoKVGhhbmsgeW91LAoKUGFvbG8KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
