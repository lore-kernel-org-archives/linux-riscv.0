Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8F7FD461F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 05:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBhozhrZ3XnJi0x+E3yvTwZIfk5y1gIKtobrgnCXX+s=; b=jQ7h2xzY+inCD+
	ocinkaqzt+fqs+F60w5RpeShtOCXSBSW77GCe378KtD94gfkrg3mXU3HlAzfx9UNvhfj5Wvbbc2kI
	9H1g/cxf96tMZyaMS62b9/Du0UAq6SED45HmaMUEmumIGkRXKB6xuFP2j2jzFqmLS2m73OprI9kG/
	OCu+GufCm0nNNnAfmoUbf+/XWfkf2zmgw5FxC9A83kMk/41FeRJza1rR3pCtRoGThYlXZcP4F7lCM
	DnDSzH4hRfS1rN52iUDgmO6a0YTj//V2Gyls+fY+2TT9/U4I0j0smiG9aH28nBajV4rFA1FQq1/uI
	SYfB5lPK0IJ7wURScupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUDz-00000005RgQ-0DiX;
	Thu, 26 Feb 2026 05:47:47 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUDw-00000005Rfe-0krz
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 05:47:45 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6774d63d2e0so234391eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 21:47:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772084863; cv=none;
        d=google.com; s=arc-20240605;
        b=TSyhjMEvmxaXL0bs0BgyDo4zYRBTFjUDKCbzQMok5/s9nEuTZ4NhMLlG72w5tzOshZ
         1cve4yo5+RJ/cZQvs0E7ToQQqIkqUuufhmdnMijhJeNTirqtCcZ358hBl9Wtx2lqyVaM
         zlPu8iZo+pxuZ3mnyEk9hsaYr3wmFO4HDnU802nLo0uP2S4/kwR9VfK5zopUQy4f//gI
         R73Mt6C1OzFKUC3SeeV9zRQ/eqcnD8PQD0oU64Gmf9fPZF35oPwwqalF6YV458AoEeN1
         /2Y/himOFO7Nmv8iP0jCffReUQ+PXMQyh52pBUFJ3+KAVkXrbSBtGv4f+io+Dgb6J0n4
         +YzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b3GT5Na22u0rkZZPCLAOp9C1u+Nx1823EYWE29L6QxQ=;
        fh=IThf503KILgyHC5c/qeSgmT6QRPJG6zxQiUnNeHGNVA=;
        b=ZIGR7jwE23tvNCHzlvoh9QZbN78g+9DQGv7n+TFU149YB7O5KUW+KHPhgVMXKf/VmX
         EnVQKuDz78yCTOkVEllKCpmVtQPL1Mpj+YDqSBSnmPFTeHdR2wn+uo+UVO6pLF2My4n5
         gC0S5r1IY6CdSLe/3/tgV2buRl3lTNJyzZ4vJuy9StxH+JQcbrPYmb3Wai9SscAFJgCT
         eyVZgX0jYDBSv9vwFYaPDzlruWEj43ePeIUeBNRkLK21EO+RQoepAOm9BjhKphdv5F7Q
         cOTNFfJDnFxQvYF2jei80v1FVK/VhZUua9C1b5PeIWebGd649boQ2dBbH1+P3N6htAKn
         QE3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772084863; x=1772689663; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3GT5Na22u0rkZZPCLAOp9C1u+Nx1823EYWE29L6QxQ=;
        b=re6HHM5DV544NU77aouLhwCHVf0SbABUoNBivVU47eWnG7ygQ+g9L9vQv+AEDBVzpv
         Ve7QTxZWqpjhx7UzIt4Ltpqbt4H32Ic0rHjq8MgTGkHRk9OJgF3Tm19DzUpFc7bo31Y7
         qfVtsBZ229d4oqrHYuUMYAx2N04PrpcUoARUM89ZNODcsyJi6CPHY9/NpQahklKxTKda
         /zYGqSJbHm9td2FneKyWHx2Vxk32zlIINjaaUbohfPqS3e6EiwRUkpnl76QXeG0fIYmJ
         gIkm+ajOEB+62lO8fFzlS9YQRsN/1dB4ZT3LGjBVvi9IZIRMPAChEWQ/XTHtus81xt22
         h2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772084863; x=1772689663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3GT5Na22u0rkZZPCLAOp9C1u+Nx1823EYWE29L6QxQ=;
        b=MOGgPCJYWeDkqRkIO/GNCzTzdPVCdzEYB/yBD97OWx4yZNCpYOfnq8FI8jLfQW92hp
         mVdUxTTXQXTZ9JsXP2twTZLahdn2ab+232hbIrMrUX85U3TQNJh7swdPSKwJxdY4rceS
         VR97g+WuCrX4b/kh4FgCdO7OZK6K24q6NpCtXr0aJMgw7IpNFQueXJj9N0JknjuhFOks
         fY4Y/v66MJmOguf3YqJ3FOs43NGkLfjBInEpJyNfu+ljJkgC3X7ZsyZgO3jMnkwGj4Zo
         oKD62ztjxu9ZLoCDvI3fAwsziBGPEIcY+F+nUhnE9Mk+u1kF8fkgOCCccE8LSV5Pkmut
         85RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOu7PmKdLb6mJwFVFLnJ9ucdBioYEQdjerlR0C6vrbz5f+zceyB3ONs/HGTsC9gMStW/MhhlEjUXOdsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPKrxqexgT/pT2jzGS/WgnUEHwnr8rliZRbIV2khAMmgF+ethe
	reiMr5UeZuGscZQtsGfiaWs/y18cyBXzzC5tq3CrLZcry+GqNlR88T1o5yJ6PMA4/6Y9CesK5dh
	jwdnMtqSLlpOD1mpfvVt/eJGll4+5FI/TNKGfr0ERyQ==
X-Gm-Gg: ATEYQzzv+i3HN9nLkjJ47mHZwbiGFnnpUtarBzceVPX8l7ijJGw4rdIGdVyEKuILHCz
	A1ggTZMMAJxhybnTTfQdYiegcfMHKB8xwQmLMQVWN3QwpQ46b5YQ5SdlqnYgrtxJx0MbuWZIvAh
	1eynXhjzP09nayccSWe7+c8YyMcRewQpOsLZIrpgXP7Y2iq3k4np5X2EW0PctYC64dbi/9TGw73
	N4dmTdnxHR4EllPbF4uwsKMJegQOPGKdjCn6Mx9tQt8HG9J+H7kDsWtzdvakmOk7BJj5Hq4YrF9
	FYS5LxGQQb/iei3NBt913JWYize/AD+AyyYM8tahr95qjJrbsLnfT6OV3ABIoygDqBQZlB++qQ0
	uAdOFrZF0hiVG5Tavtj0kdWlNxrM=
X-Received: by 2002:a05:6820:1892:b0:679:a5d2:569b with SMTP id
 006d021491bc7-679ef97d50bmr1284924eaf.40.1772084862848; Wed, 25 Feb 2026
 21:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20260116095731.24555-1-lukas.gerlach@cispa.de>
In-Reply-To: <20260116095731.24555-1-lukas.gerlach@cispa.de>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Feb 2026 11:17:31 +0530
X-Gm-Features: AaiRm50VNfj9kpGvvhZpT9bmuFIeIxzxQ2bB45ExZQGoqQfOYd839ZCCNnG0AHA
Message-ID: <CAAhSdy1g7pYoF5uXMx4L9zVkRHd8Fj2SMgsc3MS7sQkh74eELw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Fix Spectre-v1 in APLIC interrupt handling
To: Lukas Gerlach <lukas.gerlach@cispa.de>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	daniel.weber@cispa.de, marton.bognar@kuleuven.be, jo.vanbulck@kuleuven.be, 
	michael.schwarz@cispa.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_214744_255341_03D87E57 
X-CRM114-Status: GOOD (  14.93  )
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

T24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMzoyN+KAr1BNIEx1a2FzIEdlcmxhY2ggPGx1a2FzLmdl
cmxhY2hAY2lzcGEuZGU+IHdyb3RlOgo+Cj4gR3Vlc3RzIGNhbiBjb250cm9sIElSUSBpbmRpY2Vz
IHZpYSBNTUlPLiBTYW5pdGl6ZSB0aGVtIHdpdGgKPiBhcnJheV9pbmRleF9ub3NwZWMoKSB0byBw
cmV2ZW50IHNwZWN1bGF0aXZlIG91dC1vZi1ib3VuZHMgYWNjZXNzCj4gdG8gdGhlIGFwbGljLT5p
cnFzW10gYXJyYXkuCj4KPiBTaW1pbGFyIHRvIGFybTY0IGNvbW1pdCA0MWI4NzU5OWM3NDMgKCJL
Vk06IGFybS9hcm02NDogdmdpYzogZml4IHBvc3NpYmxlCj4gc3BlY3RyZS12MSBpbiB2Z2ljX2dl
dF9pcnEoKSIpIGFuZCB4ODYgY29tbWl0IDhjODY0MDVmNjA2YyAoIktWTTogeDg2Ogo+IFByb3Rl
Y3QgaW9hcGljX3JlYWRfaW5kaXJlY3QoKSBmcm9tIFNwZWN0cmUtdjEvTDFURiBhdHRhY2tzIiku
Cj4KPiBGaXhlczogNzQ5NjdhYTIwOGUyICgiUklTQy1WOiBLVk06IEFkZCBpbi1rZXJuZWwgZW11
bGF0aW9uIG9mIEFJQSBBUExJQyIpCj4gU2lnbmVkLW9mZi1ieTogTHVrYXMgR2VybGFjaCA8bHVr
YXMuZ2VybGFjaEBjaXNwYS5kZT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIGFzIGZpeCBmb3IgTGludXgtNy4wLXJjWAoK
UmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMgfCAyMyAr
KysrKysrKysrKystLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhX2Fw
bGljLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYwo+IGluZGV4IGY1OWQxYzBjOGM0My4u
YTJiODMxZTU3ZWNkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jCj4g
KysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMKPiBAQCAtMTAsNiArMTAsNyBAQAo+ICAj
aW5jbHVkZSA8bGludXgvaXJxY2hpcC9yaXNjdi1hcGxpYy5oPgo+ICAjaW5jbHVkZSA8bGludXgv
a3ZtX2hvc3QuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21hdGguaD4KPiArI2luY2x1ZGUgPGxpbnV4
L25vc3BlYy5oPgo+ICAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L3N3YWIuaD4KPiAgI2luY2x1ZGUgPGt2bS9pb2Rldi5oPgo+IEBAIC00NSw3ICs0Niw3IEBA
IHN0YXRpYyB1MzIgYXBsaWNfcmVhZF9zb3VyY2VjZmcoc3RydWN0IGFwbGljICphcGxpYywgdTMy
IGlycSkKPgo+ICAgICAgICAgaWYgKCFpcnEgfHwgYXBsaWMtPm5yX2lycXMgPD0gaXJxKQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiAtICAgICAgIGlycWQgPSAmYXBsaWMtPmlycXNbaXJx
XTsKPiArICAgICAgIGlycWQgPSAmYXBsaWMtPmlycXNbYXJyYXlfaW5kZXhfbm9zcGVjKGlycSwg
YXBsaWMtPm5yX2lycXMpXTsKPgo+ICAgICAgICAgcmF3X3NwaW5fbG9ja19pcnFzYXZlKCZpcnFk
LT5sb2NrLCBmbGFncyk7Cj4gICAgICAgICByZXQgPSBpcnFkLT5zb3VyY2VjZmc7Cj4gQEAgLTYx
LDcgKzYyLDcgQEAgc3RhdGljIHZvaWQgYXBsaWNfd3JpdGVfc291cmNlY2ZnKHN0cnVjdCBhcGxp
YyAqYXBsaWMsIHUzMiBpcnEsIHUzMiB2YWwpCj4KPiAgICAgICAgIGlmICghaXJxIHx8IGFwbGlj
LT5ucl9pcnFzIDw9IGlycSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+IC0gICAgICAgaXJx
ZCA9ICZhcGxpYy0+aXJxc1tpcnFdOwo+ICsgICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1thcnJh
eV9pbmRleF9ub3NwZWMoaXJxLCBhcGxpYy0+bnJfaXJxcyldOwo+Cj4gICAgICAgICBpZiAodmFs
ICYgQVBMSUNfU09VUkNFQ0ZHX0QpCj4gICAgICAgICAgICAgICAgIHZhbCA9IDA7Cj4gQEAgLTgx
LDcgKzgyLDcgQEAgc3RhdGljIHUzMiBhcGxpY19yZWFkX3RhcmdldChzdHJ1Y3QgYXBsaWMgKmFw
bGljLCB1MzIgaXJxKQo+Cj4gICAgICAgICBpZiAoIWlycSB8fCBhcGxpYy0+bnJfaXJxcyA8PSBp
cnEpCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+IC0gICAgICAgaXJxZCA9ICZhcGxpYy0+
aXJxc1tpcnFdOwo+ICsgICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1thcnJheV9pbmRleF9ub3Nw
ZWMoaXJxLCBhcGxpYy0+bnJfaXJxcyldOwo+Cj4gICAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNh
dmUoJmlycWQtPmxvY2ssIGZsYWdzKTsKPiAgICAgICAgIHJldCA9IGlycWQtPnRhcmdldDsKPiBA
QCAtOTcsNyArOTgsNyBAQCBzdGF0aWMgdm9pZCBhcGxpY193cml0ZV90YXJnZXQoc3RydWN0IGFw
bGljICphcGxpYywgdTMyIGlycSwgdTMyIHZhbCkKPgo+ICAgICAgICAgaWYgKCFpcnEgfHwgYXBs
aWMtPm5yX2lycXMgPD0gaXJxKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4gLSAgICAgICBp
cnFkID0gJmFwbGljLT5pcnFzW2lycV07Cj4gKyAgICAgICBpcnFkID0gJmFwbGljLT5pcnFzW2Fy
cmF5X2luZGV4X25vc3BlYyhpcnEsIGFwbGljLT5ucl9pcnFzKV07Cj4KPiAgICAgICAgIHZhbCAm
PSBBUExJQ19UQVJHRVRfRUlJRF9NQVNLIHwKPiAgICAgICAgICAgICAgICAoQVBMSUNfVEFSR0VU
X0hBUlRfSURYX01BU0sgPDwgQVBMSUNfVEFSR0VUX0hBUlRfSURYX1NISUZUKSB8Cj4gQEAgLTEx
Niw3ICsxMTcsNyBAQCBzdGF0aWMgYm9vbCBhcGxpY19yZWFkX3BlbmRpbmcoc3RydWN0IGFwbGlj
ICphcGxpYywgdTMyIGlycSkKPgo+ICAgICAgICAgaWYgKCFpcnEgfHwgYXBsaWMtPm5yX2lycXMg
PD0gaXJxKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gLSAgICAgICBpcnFkID0g
JmFwbGljLT5pcnFzW2lycV07Cj4gKyAgICAgICBpcnFkID0gJmFwbGljLT5pcnFzW2FycmF5X2lu
ZGV4X25vc3BlYyhpcnEsIGFwbGljLT5ucl9pcnFzKV07Cj4KPiAgICAgICAgIHJhd19zcGluX2xv
Y2tfaXJxc2F2ZSgmaXJxZC0+bG9jaywgZmxhZ3MpOwo+ICAgICAgICAgcmV0ID0gKGlycWQtPnN0
YXRlICYgQVBMSUNfSVJRX1NUQVRFX1BFTkRJTkcpID8gdHJ1ZSA6IGZhbHNlOwo+IEBAIC0xMzIs
NyArMTMzLDcgQEAgc3RhdGljIHZvaWQgYXBsaWNfd3JpdGVfcGVuZGluZyhzdHJ1Y3QgYXBsaWMg
KmFwbGljLCB1MzIgaXJxLCBib29sIHBlbmRpbmcpCj4KPiAgICAgICAgIGlmICghaXJxIHx8IGFw
bGljLT5ucl9pcnFzIDw9IGlycSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+IC0gICAgICAg
aXJxZCA9ICZhcGxpYy0+aXJxc1tpcnFdOwo+ICsgICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1th
cnJheV9pbmRleF9ub3NwZWMoaXJxLCBhcGxpYy0+bnJfaXJxcyldOwo+Cj4gICAgICAgICByYXdf
c3Bpbl9sb2NrX2lycXNhdmUoJmlycWQtPmxvY2ssIGZsYWdzKTsKPgo+IEBAIC0xNzAsNyArMTcx
LDcgQEAgc3RhdGljIGJvb2wgYXBsaWNfcmVhZF9lbmFibGVkKHN0cnVjdCBhcGxpYyAqYXBsaWMs
IHUzMiBpcnEpCj4KPiAgICAgICAgIGlmICghaXJxIHx8IGFwbGljLT5ucl9pcnFzIDw9IGlycSkK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+IC0gICAgICAgaXJxZCA9ICZhcGxpYy0+
aXJxc1tpcnFdOwo+ICsgICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1thcnJheV9pbmRleF9ub3Nw
ZWMoaXJxLCBhcGxpYy0+bnJfaXJxcyldOwo+Cj4gICAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNh
dmUoJmlycWQtPmxvY2ssIGZsYWdzKTsKPiAgICAgICAgIHJldCA9IChpcnFkLT5zdGF0ZSAmIEFQ
TElDX0lSUV9TVEFURV9FTkFCTEVEKSA/IHRydWUgOiBmYWxzZTsKPiBAQCAtMTg2LDcgKzE4Nyw3
IEBAIHN0YXRpYyB2b2lkIGFwbGljX3dyaXRlX2VuYWJsZWQoc3RydWN0IGFwbGljICphcGxpYywg
dTMyIGlycSwgYm9vbCBlbmFibGVkKQo+Cj4gICAgICAgICBpZiAoIWlycSB8fCBhcGxpYy0+bnJf
aXJxcyA8PSBpcnEpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPiAtICAgICAgIGlycWQgPSAm
YXBsaWMtPmlycXNbaXJxXTsKPiArICAgICAgIGlycWQgPSAmYXBsaWMtPmlycXNbYXJyYXlfaW5k
ZXhfbm9zcGVjKGlycSwgYXBsaWMtPm5yX2lycXMpXTsKPgo+ICAgICAgICAgcmF3X3NwaW5fbG9j
a19pcnFzYXZlKCZpcnFkLT5sb2NrLCBmbGFncyk7Cj4gICAgICAgICBpZiAoZW5hYmxlZCkKPiBA
QCAtMjA1LDcgKzIwNiw3IEBAIHN0YXRpYyBib29sIGFwbGljX3JlYWRfaW5wdXQoc3RydWN0IGFw
bGljICphcGxpYywgdTMyIGlycSkKPgo+ICAgICAgICAgaWYgKCFpcnEgfHwgYXBsaWMtPm5yX2ly
cXMgPD0gaXJxKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gLSAgICAgICBpcnFk
ID0gJmFwbGljLT5pcnFzW2lycV07Cj4gKyAgICAgICBpcnFkID0gJmFwbGljLT5pcnFzW2FycmF5
X2luZGV4X25vc3BlYyhpcnEsIGFwbGljLT5ucl9pcnFzKV07Cj4KPiAgICAgICAgIHJhd19zcGlu
X2xvY2tfaXJxc2F2ZSgmaXJxZC0+bG9jaywgZmxhZ3MpOwo+Cj4gQEAgLTI1NCw3ICsyNTUsNyBA
QCBzdGF0aWMgdm9pZCBhcGxpY191cGRhdGVfaXJxX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwgdTMy
IGZpcnN0LCB1MzIgbGFzdCkKPiAgICAgICAgIGZvciAoaXJxID0gZmlyc3Q7IGlycSA8PSBsYXN0
OyBpcnErKykgewo+ICAgICAgICAgICAgICAgICBpZiAoIWlycSB8fCBhcGxpYy0+bnJfaXJxcyA8
PSBpcnEpCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gLSAgICAgICAgICAg
ICAgIGlycWQgPSAmYXBsaWMtPmlycXNbaXJxXTsKPiArICAgICAgICAgICAgICAgaXJxZCA9ICZh
cGxpYy0+aXJxc1thcnJheV9pbmRleF9ub3NwZWMoaXJxLCBhcGxpYy0+bnJfaXJxcyldOwo+Cj4g
ICAgICAgICAgICAgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSgmaXJxZC0+bG9jaywgZmxhZ3Mp
Owo+Cj4gQEAgLTI4Myw3ICsyODQsNyBAQCBpbnQga3ZtX3Jpc2N2X2FpYV9hcGxpY19pbmplY3Qo
c3RydWN0IGt2bSAqa3ZtLCB1MzIgc291cmNlLCBib29sIGxldmVsKQo+Cj4gICAgICAgICBpZiAo
IWFwbGljIHx8ICFzb3VyY2UgfHwgKGFwbGljLT5ucl9pcnFzIDw9IHNvdXJjZSkpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+IC0gICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1tz
b3VyY2VdOwo+ICsgICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1thcnJheV9pbmRleF9ub3NwZWMo
c291cmNlLCBhcGxpYy0+bnJfaXJxcyldOwo+ICAgICAgICAgaWUgPSAoYXBsaWMtPmRvbWFpbmNm
ZyAmIEFQTElDX0RPTUFJTkNGR19JRSkgPyB0cnVlIDogZmFsc2U7Cj4KPiAgICAgICAgIHJhd19z
cGluX2xvY2tfaXJxc2F2ZSgmaXJxZC0+bG9jaywgZmxhZ3MpOwo+IC0tCj4gMi41MS4wCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
