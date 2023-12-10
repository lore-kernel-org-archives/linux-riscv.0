Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7AAC4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Dec 2023 22:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o26PFmMtLKNYjUyiLFKFlf5rV3VCsW0mMK6azKG43Bo=; b=zFLgn6dCPhxz5W
	OxBJPtqsRkQYCTv+9mzD/TcMD+b5cOX9mZ4+uooW7udXtPHnLhIawD0OX7yBaLrfErf/uy3hiLZ5n
	HvdWT1nK0h6r4QbVeRHh3RbP/bxyi8PkLXfUj/ytsHe1zae5F2MWIPOz7Cf2bWdv2R66soO4XMX+F
	VmNsZN191I+teuO+v6dalKsMQzubom3PNKGDKWDNBU2e4JaE7DL1oXiJ0do6e8sE0tqU+61Hg13ZW
	YHGsQi8YOR/TGcfF3VUS4eU6C6dQcPmsquf5HHdF9/yWuATSeyU+Ec74qIucYDzFwlDSEuo990rzK
	LZ4z05e8qjKBMuK1xv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCSfs-003Ztb-14;
	Sun, 10 Dec 2023 22:53:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCSfp-003ZsG-0P
	for linux-riscv@lists.infradead.org;
	Sun, 10 Dec 2023 22:53:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c2db0ca48so43045e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 10 Dec 2023 14:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702248794; x=1702853594; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKS/AHcM2NBWqMD4zsEUfP2kt6MSIwHJfrO8WzI99T8=;
        b=M+8rzghItPHhZU7H3NEf9iTLdd7/F3qGABUW2ATEKZWlqs+wDSdJ+bMjJIhrwvKLQP
         NqpRU7Ly6m7XvyM33Oj1o1duTh9EBU1MIPKa74NzvZ6lB5JZ1RlQirF/IuQAT7LxZFC2
         7X1JNnKZ/oY2yuG0ieyLIJSGgt8oNXRM0k9DL3lsQuABxMhuf3YYu1aC1oNUhoh3byU7
         IRxzXRzvFR4m0VcJFhpdeuGz1ReWbv4w1JsriPs3D0m0s/m6PDAOSami5xzRXJX/1Ybh
         iQoBuJsIQD+1J4hLrglqVlsZaN54Y5R/Uy6ESvoYHtw5mPQOxBj+FzavTQdUUARctpty
         U6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702248794; x=1702853594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKS/AHcM2NBWqMD4zsEUfP2kt6MSIwHJfrO8WzI99T8=;
        b=kNdaQ/XGZaKqqiSR61YNUizP7qcpfdsLrgv2w0zVV1bBjWemTcm/nSq7u/vwL2OGuS
         o/gotTnIm8cJtM3fXIEE4vRSl8+2hZgbULDobRcVxfkAofvpDv09EoHxWZ+KJJ4DmgPs
         4/VSgAPmSygcHLxFfvD5SXJzQaMA37BnibO2foo4WzW4wT32S3Yf+gLmyskSX43VVdoX
         S0L6Qv+Ha1jxamB6hy8DqYnpA+8MZ8WM08bSbtE0Sorb3cHniNrwJjlJLsCA/45k4Oj+
         9gsXpow1frOsgSmP0Dr3BTDP4jblT4juELaz3V7+GiuYWgmyS52zZal1FguXR5y9PYvs
         qHXQ==
X-Gm-Message-State: AOJu0YzeL+EYdbnAx0qZRKwNq6joi80qJXl0nrtBMPhbzDrtOmzkp2gi
	jo9c4znUA2RcJrwYjVLuysHH5FCGQbyD/TXtDbF0rw==
X-Google-Smtp-Source: AGHT+IHfF/YK8dgWEfqDIfnTDLirkLeJB4fVu6OmnYB7yxbJvNgiVETL/lA8ongHRpHXQrS4L8RMiXwyvPov+eoWnK8=
X-Received: by 2002:a05:600c:5113:b0:40c:329:d498 with SMTP id
 o19-20020a05600c511300b0040c0329d498mr170595wms.1.1702248794289; Sun, 10 Dec
 2023 14:53:14 -0800 (PST)
MIME-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
 <ZXHw7tykubfG04Um@google.com>
In-Reply-To: <ZXHw7tykubfG04Um@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Sun, 10 Dec 2023 14:52:59 -0800
Message-ID: <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
To: Sean Christopherson <seanjc@google.com>
Cc: alexandru.elisei@arm.com, anup@brainfault.org, aou@eecs.berkeley.edu, 
	atishp@atishpatra.org, borntraeger@linux.ibm.com, chenhuacai@kernel.org, 
	david@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	james.morse@arm.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mlevitsk@redhat.com, 
	oliver.upton@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	pbonzini@redhat.com, suzuki.poulose@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231210_145321_186757_1DC733B0 
X-CRM114-Status: GOOD (  10.18  )
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

T24gVGh1LCBEZWMgNywgMjAyMyBhdCA4OjIx4oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+IERvaC4gIFdlIGdvdCB0aGUgbGVzcyBvYnZpb3VzIGNh
c2VzIGFuZCBtaXNzZWQgdGhlIG9idmlvdXMgb25lLgo+Cj4gVWdoLCBhbmQgd2UgYWxzbyBtaXNz
ZWQgYSByZWxhdGVkIG1lc3MgaW4ga3ZtX2d1ZXN0X2FwaWNfaGFzX2ludGVycnVwdCgpLiAgVGhh
dAo+IHRoaW5nIHNob3VsZCByZWFsbHkgYmUgZm9sZGVkIGludG8gdm14X2hhc19uZXN0ZWRfZXZl
bnRzKCkuCj4KPiBHb29kIGdyYXZ5LiAgQW5kIHZteF9pbnRlcnJ1cHRfYmxvY2tlZCgpIGRvZXMg
dGhlIHdyb25nIHRoaW5nIGJlY2F1c2UgdGhhdAo+IHNwZWNpZmljYWxseSBjaGVja3MgaWYgTDEg
aW50ZXJydXB0cyBhcmUgYmxvY2tlZC4KPgo+IENvbXBpbGUgdGVzdGVkIG9ubHksIGFuZCBkZWZp
bml0ZWx5IG5lZWRzIHRvIGJlIGNodW5rZWQgaW50byBtdWx0aXBsZSBwYXRjaGVzLAo+IGJ1dCBJ
IHRoaW5rIHNvbWV0aGluZyBsaWtlIHRoaXMgbWVzcz8KClRoZSBwcm9wb3NlZCBwYXRjaCBkb2Vz
IG5vdCBmaXggdGhlIHByb2JsZW0uIEluIGZhY3QsIGl0IG1lc3NlcyB0aGluZ3MKdXAgc28gbXVj
aCB0aGF0IEkgZG9uJ3QgZ2V0IGFueSB0ZXN0IHJlc3VsdHMgYmFjay4KCkdvb2dsZSBoYXMgYW4g
aW50ZXJuYWwgSy1VLVQgdGVzdCB0aGF0IGRlbW9uc3RyYXRlcyB0aGUgcHJvYmxlbS4gSQp3aWxs
IHBvc3QgaXQgc29vbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
