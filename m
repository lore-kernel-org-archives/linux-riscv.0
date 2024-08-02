Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBCEC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 16:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=399y4++TnOTyfIu331CCFXS3dtcJUiqySZum2/uN34A=; b=qztBInny+I1CVi
	yvYYOAKKnK226V/WSiswICVriz8OdT5dRr8e5BAvBC6XUYQA4ypDcqfDHcW1Yh1S+PsRnvUyiSrDd
	eYEMHpGYtc8poqVG9cbo8TuKoeZv3GPc9f/gMzRwbwgcQRaBYuAod1lBzC5I5YPHVz4FgsEZ/AO+c
	xhEpLvkIsvwTe/Jl7ZSAlexbqOyF+4v8pHrcSZbL5i1OBN9+2wnSfvtvb1Dc0M8FFhi6dNkX17+cC
	Zim3HyyiXEjmXMn6ZJnbVeFyM1Z1Uga0nm3NLz/NQhntfWQtBkCr0Xxl/rw4iQDG9tPRQLNLLfx6F
	d8kTzInDEcPKhPONCOzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZvBC-00000009Tf0-1KkI;
	Fri, 02 Aug 2024 16:30:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZvB8-00000009TdJ-3DcM
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 16:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722616253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6m06RkjGkxPJM65V/V+1h9jWB5bDFy1DlMvt28wHMlU=;
	b=OimQL5ivYy3CyoR1j9xtqqNzmu3+WQ5Ds/Tw1UnLQUWFTrc3wfkhU5ZOV3Q9lqjt9ttp0k
	76sSlLsyc7nANj91Cgbz2dufVy2OLFbGKDMUMvwKb89Ijcm5l5QAkDOPBWmWhHVjy+KItv
	5Duy3qWkLX6n026+rimQt6VTVQZiPZM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-PrRht-7rPGWXlY8VsrBWdg-1; Fri, 02 Aug 2024 12:30:51 -0400
X-MC-Unique: PrRht-7rPGWXlY8VsrBWdg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3687e6d7a3aso3851604f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 09:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722616250; x=1723221050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6m06RkjGkxPJM65V/V+1h9jWB5bDFy1DlMvt28wHMlU=;
        b=qs06weTz2/8Td4tYCXp+iIiO8yec3aJufb9lG+8QnYa1Cvoe7QfIoGBbW6Kti4lvsP
         z9r3pC9SaOm4rxS+yI2iz3kbwDWQ3pIMzVEawlqxT5R7cObhP3umVTKJCzG1982lZrCK
         IvVb1wgotNxZWs7Nn9h31U4IsOy8oFmCN7z66XWTJN/4Cvyp/AwL3TNTrU1qxbIzrdwh
         UzppqrO/QUjHHSHo9oWd6xhmI8yqSbfPsKzLzhIcu+JSuWW8vItUO67ESUui5ROUjnu4
         oxxexSjvMbuThJb+6sr6UFMxZ1HUm7EZZ+9DEyxpDtav9wj6mnXnUURfr1w9WkJ3fNz7
         w2Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXbLlQ0D+nruc5/Zszd6pRmSfMIZv+SutfOf8UmY6SBuIuoOMR2Ci16Y6EO2lVvVh8I0hGqOIPepyKyPe2R0ZBu9GsGDfyBXXlTJzNnIYqH
X-Gm-Message-State: AOJu0YxkQscZkMT/7BYBSqLBUph7grZSX0iIJN4RAAX/F3EDYtx6P2co
	vbeT7v1tXsBJZXH+RvyD80YZAIEcGv5Ks1FY/UbOORHZyNTs5nbBgfWSD3fuoFzm4WPS37JkYKm
	EbBerwRaXZeYyPVQYw7Jm4b64HR/geaKcZv+KbCnFEW2KcmxfIKUjQd/6Lc3ZAYHrfWJv+J2Ons
	Ozknz7JmDvSLtpXUadE85HefcsTDhlgvYubKGE1ksK
X-Received: by 2002:adf:e852:0:b0:367:99d8:70 with SMTP id ffacd0b85a97d-36bbc18308amr2537983f8f.61.1722616250127;
        Fri, 02 Aug 2024 09:30:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGstwkR60ibEcw8CeHcDOIV3+NDKED6h/oyKd5Ygh4Ao3Y1Vhk8VrDPd0uSFakXvoOcz/+u/W/yEx8hy6i2+mg=
X-Received: by 2002:adf:e852:0:b0:367:99d8:70 with SMTP id ffacd0b85a97d-36bbc18308amr2537958f8f.61.1722616249614;
 Fri, 02 Aug 2024 09:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy3ZhXmbDFrWneA9aA8ALYy+SgMpyopd_9MPzYgWksMLBQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3ZhXmbDFrWneA9aA8ALYy+SgMpyopd_9MPzYgWksMLBQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 2 Aug 2024 18:30:38 +0200
Message-ID: <CABgObfaakho9SPTjkSo0uDZ_UyOv08Mxc2ym_88gGgQTAA5OQg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.11 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_093054_902187_9CD64E8C 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCBBdWcgMiwgMjAyNCBhdCAxOjQy4oCvUE0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4gd3JvdGU6Cj4KPiBIaSBQYW9sbywKPgo+IFdlIGhhdmUgb25lIGNvbXBpbGF0aW9u
IGZpeCBmb3IgZ2V0LXJlZy1saXN0IHNlbGZ0ZXN0cwo+IGluIHRoZSA2LjExIGtlcm5lbC4KPgo+
IFBsZWFzZSBwdWxsLgo+Cj4gUmVnYXJkcywKPiBBbnVwCj4KPiBUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IDg0MDAyOTFlMjg5ZWU2YjJiZjk3NzlmZjFjODNhMjkxNTAxZjAxN2I6
Cj4KPiAgIExpbnV4IDYuMTEtcmMxICgyMDI0LTA3LTI4IDE0OjE5OjU1IC0wNzAwKQo+Cj4gYXJl
IGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0dHBzOi8vZ2l0aHVi
LmNvbS9rdm0tcmlzY3YvbGludXguZ2l0IHRhZ3Mva3ZtLXJpc2N2LWZpeGVzLTYuMTEtMQo+Cj4g
Zm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGRkNGE3OTliY2MxMzk5MmRkOGJlOTcwOGU1
YzU4NWY1NTIyNmI1Njc6Cj4KPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogRml4IGNvbXBpbGUg
ZXJyb3IgKDIwMjQtMDctMjkgMTA6MTA6NTYgKzA1MzApCgpQdWxsZWQsIHRoYW5rcy4KClBhb2xv
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
