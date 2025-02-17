Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A7FC0219E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BnDySzv2fwOK0AOz+Co1rAB3tj/s4rhSV212MG6gHpA=; b=gC9dksKUOGAgtm
	E/FXnEc8+sQohZMxJdsDqq313RRt2tIkS7yiZL46DjanYlw39R97n/DcjBqLzCMRoXm/jwsIiPgYY
	Leh/o20H8tiNYsw2RIEsl6rSrUqIpTiybdV1XdgdAjlxjhnw7gUW5+VzinzyeHjEHmwz6GGxuPalI
	9BeRcIP5ixd9jJhQH+bMo9jgT/f4wk/1S0c2BCPuLy6XRm47vLRjvnWRN171O40aIRvln4KbIUF05
	AWmBnEUEZmJ7+ewmexEJQgr56FH9970VYEFhATRFMoE2p/b/6hJVcQstTDTXtOUoN/SQ1kYi/rcHI
	T/sQPtS4KxjSRaMRsGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjylq-00000004Cqr-46hE;
	Mon, 17 Feb 2025 10:54:39 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjybp-000000049TG-0Y3c
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 10:44:18 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3ce868498d3so14106945ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 02:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1739789056; x=1740393856; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEC9IKTHffK3WvFzTVA0qo6PFNnuHBV9vhhQNHZZ8nE=;
        b=h1AcqMP+mMJRzisY41GwnL9L1kY9KEqMJL9/vFxL2hC27sUASZhR/PLloRR7XCUjal
         kVpFIp/YGQpysnbjk7aYZz0NREw0J+HeLqf1u305JvRqV27cPax3ht1ylods5+e/zN0/
         CsXMG26mNPh0NkOCiPNHf3UMXmVAsXi6eMBMG52amsQQ+Ob+0mzGA7DUB6ZkrwtEHmEH
         RCxX02WfMM0rv/DFnQJTnmXXhsocS60BeabQQew79Dl/f09foezlRbfVUf5AgZ3FWknw
         YaALaQSAlZhO9BASQIKQPTX2w1ZAfBXcFG2o43oAQR8mcsSE99IzbJ0heK24pDQwid9Q
         jnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739789056; x=1740393856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEC9IKTHffK3WvFzTVA0qo6PFNnuHBV9vhhQNHZZ8nE=;
        b=wrBui9wAi4SOcvoRryJCqpHSCECEOMYTM/aoTmsNOwd7deh+Rba1ZnColyesIAS1/f
         DnUAMkKbxlb9Jg2/TMAGaW2Cj8UzAvyqJ7r7mynKzRYB2gNVi/PrbsFdbQap2nAgvVEC
         6DQez9UOkg0CGzw8pVehEdAVY5/zRj+tNlpFRalR2HC5T66nxlKlMjLbbQwIbS6QC0Er
         Loyxw3S6b+o8RtuQGmrgbZmgmNW2gNfAzsuUqivyOivPbVflVqhL5EzO2iEK+E+ViUIV
         p2aWMNP2kTQ6DEhRBfnazp4ZoosTmtfvDHqQ34PVEsOkRT7PpjXktoR7XbpuGjPo++Te
         2tOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4dMZt0o4SZPutqL7sCPmP/Y3Xj8Vlwwp2ar9ySW3SX1qp3njA9QUGUOkuix12ilHcy73aNZCg+XBT7g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn4YdDjje42TuGcSTIacCCu8J5Ggfk/gPYqn8Rz7zGsBnye5jE
	rqgzl8B7+6IC3p6vsC1NhKyNYfCufXfaa0oOn1VzaXc8CUqJu9e/bH6MJK/y3om2HvgOgfXPtQi
	6+fFkg292ZWWBWoSmcdQ+RNgIuLdPzlT+cRhS/A==
X-Gm-Gg: ASbGncv+XQ6IjTv4Jg2d7nT0lTxXePrLQUORhFhU2qX9UjPMFl4SHmLgNRTyQrlCSjD
	NVoEVP24ZGpsX8PKFhGmKf+itVpY4KEjsb76V15w2KClXBqJAUnF2kUJ71Y07r2G34Yg0sHBH4w
	==
X-Google-Smtp-Source: AGHT+IEx965Kes7J9PFe/fEC2qu7c1lQXF8r1O+rb4FsIYIqeAylTS8U1CDqrpwteAP6QAUGVznUvUBjnd38LJ5N3iE=
X-Received: by 2002:a05:6e02:2181:b0:3d1:4b97:4f2d with SMTP id
 e9e14a558f8ab-3d280763f51mr58551715ab.5.1739789056483; Mon, 17 Feb 2025
 02:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20250217084506.18763-7-ajones@ventanamicro.com> <20250217084506.18763-11-ajones@ventanamicro.com>
In-Reply-To: <20250217084506.18763-11-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Feb 2025 16:14:05 +0530
X-Gm-Features: AWEUYZkbD0BHzIgdISlWzpxxTEzeWANGopBZGPKVtWrdTFLAAwqfFFUQyuGlYn8
Message-ID: <CAAhSdy2y-hsdNLQf3YVGkC-v7ZdK1NpR6TDnJRoce+qD+7m3Wg@mail.gmail.com>
Subject: Re: [PATCH 4/5] riscv: KVM: Fix SBI TIME error generation
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, cleger@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_024417_167870_515A78E0 
X-CRM114-Status: GOOD (  13.44  )
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

T24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgMjoxNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gV2hlbiBhbiBpbnZhbGlkIGZ1bmN0aW9uIElEIG9m
IGFuIFNCSSBleHRlbnNpb24gaXMgdXNlZCB3ZSBzaG91bGQKPiByZXR1cm4gbm90LXN1cHBvcnRl
ZCwgbm90IGludmFsaWQtcGFyYW0uCj4KPiBGaXhlczogNWY4NjJkZjU1ODVjICgiUklTQy1WOiBL
Vk06IEFkZCB2MC4xIHJlcGxhY2VtZW50IFNCSSBleHRlbnNpb25zIGRlZmluZWQgaW4gdjAuMiIp
Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4K
CkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJl
Z2FyZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYyB8
IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jCj4gaW5kZXggNzRlM2EzOGM2YTI5Li41ZmJmM2Y5
NGYxZTggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jCj4g
KysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jCj4gQEAgLTIxLDcgKzIxLDcg
QEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF90aW1lX2hhbmRsZXIoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAgdTY0IG5leHRfY3ljbGU7Cj4KPiAg
ICAgICAgIGlmIChjcC0+YTYgIT0gU0JJX0VYVF9USU1FX1NFVF9USU1FUikgewo+IC0gICAgICAg
ICAgICAgICByZXRkYXRhLT5lcnJfdmFsID0gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+ICsgICAg
ICAgICAgICAgICByZXRkYXRhLT5lcnJfdmFsID0gU0JJX0VSUl9OT1RfU1VQUE9SVEVEOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIH0KPgo+IC0tCj4gMi40OC4xCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
