Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11030606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m0DS+d7H;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bk9dSBT+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D1xlmHxa;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D1xlmHxa;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D1xlmHxa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xcYoxA9qQfnyo3+8tb6syU5Julu04X9Cr0dFr0JUloM=; b=m0DS+d7HHDQXJIRm7wsGuXOXnK
	1JsYw0hR6GIL7woYn+kGhaHcHmkZelazatjWoxhvbIoE3Kbohen7n9mJD3Wn4bec35+l/XE4GI1rY
	FAOdHcMA5bmvYjyW8Lt+brEXKn38rajqm7GpH5Zz0Gv7M7Wldn7CMQMavo8y0c9Fw8YO8KJ71qqYn
	YPY0H0twLNMuzCnNTSrMSq1AuY4za/UPdXvGJqkBbFSoDpTn0bUfQmZ45ZR248fIBG34PetTSmhjd
	SVOAOnLQ/5yXQHOifjh9IxPqUNj3Mp40WZuivpn7ytLOElcaHJC1sLMfKvV+lUC6mN/MlUFahNofl
	x+dkSiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuCG-0000000EM9u-11tI;
	Thu, 22 Oct 2026 14:55:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuCD-0000000EM9O-47ed
	for linux-riscv@bombadil.infradead.org;
	Thu, 22 Oct 2026 14:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=; b=bk9dSBT+Oza+6K6IpTU0AA7PDM
	P9BLQkOq1gWPb/Qs0f7/RP5odZoac8ILCGsdCSpdLOhHMVOFiOtpopG8J5zHdedfUWBoaa6TVmKDB
	4C98neIVggfIyiLwLPZbTjeqhacmIXaQPFK8vrOUEA3G32L4DCT8Jh+ltz5nIaNpp1a/3ZZEJTa2z
	AEzW0LWJwXNJtK63Btuovh+LF3zZu16Nk9A7mgj/McRaAL0/AXiWnu6h0bOLK3YdqHBPzZCW57qhn
	o2S0gWAPaqtkpR1xyc0P7wJYe/+9YwQcH4W7jeu24sSH70RSHA0H31HCzx/DrOysHvh3K6e0IQPCW
	y3kPtG/g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu9S-00000007LQf-1SUw
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 14:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792680733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
	b=D1xlmHxaBhFLVHe/WOfo5z+Xme+qZj0i8PzIUJIO7jiRitJk3SBD2wptxHzMCstWWsqwqN
	4cpcJuAntUWmJspcrwjq4cQ5ykJ/MYdNXwkdulaWOVA9yzzM8OkUL/j7IsvGa+1Df+BFAD
	xcFODCnlTQ73XvX1pDO34XCd3hXlt5g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792680733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
	b=D1xlmHxaBhFLVHe/WOfo5z+Xme+qZj0i8PzIUJIO7jiRitJk3SBD2wptxHzMCstWWsqwqN
	4cpcJuAntUWmJspcrwjq4cQ5ykJ/MYdNXwkdulaWOVA9yzzM8OkUL/j7IsvGa+1Df+BFAD
	xcFODCnlTQ73XvX1pDO34XCd3hXlt5g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792680733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
	b=D1xlmHxaBhFLVHe/WOfo5z+Xme+qZj0i8PzIUJIO7jiRitJk3SBD2wptxHzMCstWWsqwqN
	4cpcJuAntUWmJspcrwjq4cQ5ykJ/MYdNXwkdulaWOVA9yzzM8OkUL/j7IsvGa+1Df+BFAD
	xcFODCnlTQ73XvX1pDO34XCd3hXlt5g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-M1RNlNIfM9i1NUldZngJ3g-1; Thu, 22 Oct 2026 10:52:09 -0400
X-MC-Unique: M1RNlNIfM9i1NUldZngJ3g-1
X-Mimecast-MFC-AGG-ID: M1RNlNIfM9i1NUldZngJ3g_1792680728
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48dea677afcso768898f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 07:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680728; x=1793285528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
        b=xSxEfigLWHa9C3CHhaM0FX8IMXaKKvzN04dNnpFTB670BRfpZ7E10JcyzXo5uwZW4x
         XHOzllLLGJw9ov6EfkzRIN8fDiiJYtMCcFLWFt9S72lCGcDqxvprHpnO7/UJ9nxjIOtN
         iLJD05LZeZbGvYTDH2txz22s7rla2qaLDdlsaVeOKfmpStymRyIip+cxvhvBFbC1GHad
         9jg8ZyfqBwY2A02Tlj4UQ2zZP5xOv0AozwFGivr7+vkKUjSupTr8HDnK5wqSW0VBmFgH
         tHxILr74XeYTm+YpMUathf0ahF+QGvkE4bE6/X0LZOBFBLnOWBnLI/O7W/xTALxKzBIQ
         505Q==
X-Forwarded-Encrypted: i=1; AKwUvBwLlGbTREYpRQrqh3+Jitk/v7Y+OLEwv+D+Sxn4az8ktzlY/HnjAQRmeS4QwtyAmx7U3VCFRpYF11DpFQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJVRxvi5ENo725peM0Xk/wTSNgQsTDGaQOKMnQ82OR3+CzOIfhQ
	mdFV3RqKktTm22ess8N7TT+lVFmhZKG2jZmQvtqellXUtcifQZ8psGf4idwQwHIF+Ka8vd08Kp7
	3VnbYe4/vmlBzJSLK/Ad17Ivk8jNQ5o2qMiej8uv2fybqrBA5kxPaIR0d/6s+atdqQa1bi7iR0x
	K4Oy8x0B1gS+McvnE++pCuAaVc/qDb0MHFauk4FhabyX3Y
X-Gm-Gg: AYBFou3tbCTbFo06tYc73zq2sS+FOdyAjPte9bMPmt8rSaQWLpqJRBTDcPGjiQHt3j+
	3s0IYPmkq+uOD9o8T7SKcpijLbepgKWC5MsnuG1eiBw1RyoBU+A1fXRyQwO7AKAfjmBsWufSnue
	e/tLe4lo/80RB0q3cjhlO3SHzF7LRoCiKcLv/s++ChakgjB/ohhTDk+2Uvz4yiCyAzb9XfA1yFx
	IMSMKY4sqY6VfGtmWTCUwy+c6FAZGSaoybdhkIk/WMgWkODfrHM50vdpivcaA==
X-Received: by 2002:a5d:584e:0:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48e2d102cb0mr5941240f8f.7.1792680728055;
        Thu, 22 Oct 2026 07:52:08 -0700 (PDT)
X-Received: by 2002:a5d:584e:0:b0:488:8347:a110 with SMTP id
 ffacd0b85a97d-48e2d102cb0mr5941198f8f.7.1792680727670; Thu, 22 Oct 2026
 07:52:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CABgObfaH4-Ud4VR=GC8giDmWGJWS-tvYSmPOs4TtWg2hm4ocqw@mail.gmail.com>
 <36adc119db9b30984c0df4d1846c0f29e4e46c07.1792679974.git.sashal@kernel.org>
In-Reply-To: <36adc119db9b30984c0df4d1846c0f29e4e46c07.1792679974.git.sashal@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 22 Oct 2026 16:51:55 +0200
X-Gm-Features: AclHuK_FNMnKU9XQXzMyqQJBnCAE8EKPJnl7xQPFMv72VXmRnTfH3i81qFyOj9g
Message-ID: <CABgObfYuP+jeOZhZYaUrUX2-z0zWMH2Ch=hdizkzmKHLB6KALw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Implement kvm_arch_pre_fault_allowed()
To: Sasha Levin <sashal@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, Jinyu Tang <jinyu.tang@linux.dev>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QV3pW6lcMT0sbhLW2t0rDY5HZive_W4T4a9hRxMt65c_1792680728
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_155306_106465_B880A277 
X-CRM114-Status: GOOD (  12.21  )
X-Spam-Note: SpamAssassin invocation failed
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjIsIDIwMjYgYXQgNDo0MuKAr1BNIFNhc2hhIExldmluIDxzYXNoYWxAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBDb21taXQgY2FhNjM2MjBmOWUzICgiS1ZNOiBBbGxvdyBhcmNo
aXRlY3R1cmVzIHRvIGRpc2FsbG93IHByZS1mYXVsdCIpCj4gcmVxdWlyZXMgZXZlcnkgYXJjaGl0
ZWN0dXJlIHRoYXQgc2VsZWN0cyBLVk1fR0VORVJJQ19QUkVfRkFVTFRfTUVNT1JZIHRvCj4gaW1w
bGVtZW50IGt2bV9hcmNoX3ByZV9mYXVsdF9hbGxvd2VkKCksIGFuZCB0aGVyZSBpcyBubyBnZW5l
cmljIGRlZmF1bHQuCj4KPiBDb21taXQgZThiMzJlMzc3OTUxICgiS1ZNOiByaXNjdjogSW1wbGVt
ZW50IEtWTV9QUkVfRkFVTFRfTUVNT1JZIikgd2FzCj4gd3JpdHRlbiBiZWZvcmUgdGhhdCBob29r
IGV4aXN0ZWQsIHNvIGl0IHNlbGVjdHMgdGhlIG9wdGlvbiB3aXRob3V0Cj4gaW1wbGVtZW50aW5n
IHRoZSBob29rLiBXaXRoIGJvdGggY29tbWl0cyBpbiB0aGUgc2FtZSB0cmVlLCByaXNjdiBidWls
ZHMKPiB3aXRoIEtWTSBlbmFibGVkIGZhaWwgdG8gbGluazoKPgo+ICAgbGQubGxkOiBlcnJvcjog
dW5kZWZpbmVkIHN5bWJvbDoga3ZtX2FyY2hfcHJlX2ZhdWx0X2FsbG93ZWQKPiAgID4+PiByZWZl
cmVuY2VkIGJ5IGt2bV9tYWluLmMKPiAgID4+PiAgICAgICAgICAgICAgIHZpcnQva3ZtL2t2bV9t
YWluLm86KGt2bV92Y3B1X3ByZV9mYXVsdF9tZW1vcnkpIGluIGFyY2hpdmUgdm1saW51eC5hCj4K
PiBUaGUgcmlzY3YgaW1wbGVtZW50YXRpb24gZG9lcyBub3QgcmVmdXNlIHByZS1mYXVsdGluZyBp
biBhbnkgc3RhdGUsIHNvCj4gcmV0dXJuIDAgdG8ga2VlcCBpdHMgY3VycmVudCBiZWhhdmlvdXIu
Cj4KPiBGaXhlczogZThiMzJlMzc3OTUxICgiS1ZNOiByaXNjdjogSW1wbGVtZW50IEtWTV9QUkVf
RkFVTFRfTUVNT1JZIikKPiBTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5l
bC5vcmc+Cj4gLS0tCj4gUGFvbG8sIHRoaXMgaXMgbmVlZGVkIHdoZW4ga3ZtLXJpc2N2LTcuNC0x
IGlzIG1lcmdlZCBpbnRvIGt2bS9uZXh0Lgo+IEZlZWwgZnJlZSB0byBzcXVhc2ggaXQgaW50byB0
aGUgbWVyZ2UgaW5zdGVhZC4KCll1cCwgZG9uZS4gSXQgd2lsbCBiZSBpbiB0b21vcnJvdydzIGxp
bnV4LW5leHQgdmlhIGt2bS9uZXh0LgoKSSdsbCBzZW5kIHRoZSBSSVNDLVYgUFIgdG8gTGludXMg
bmV4dCB3ZWVrLCBzbyBpZiBoZSBjb21wbGFpbnMgaXQgd2lsbApiZSB0aGVyZSBpbiBrdm0vbmV4
dCByZWFkeSBmb3IgNy41LiA6KQoKUGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
