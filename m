Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07E2D6ACF6
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 16:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7JyM5TsYnMHW/Q82AqwjCXgdQE+9nNkaEIPVFybAx4=; b=Dtjp66RtXrto63
	HLlR4c0y9p0xSeoyV+ZiWuLQroLFlaCU1xrxqMVeuwRWTPB+JwsM6luzN0JYasaqArRuPoEjfeEp2
	ZWrZhgk9aHrBhz7MgMXmbHUXzpy2cTxFleM6wIS2uzFa9OfyY5Fv7BFP4zQJO9Yh1HuTOzzX0HLY/
	EqaQx6mNPiEj6/vG3amVLTTJVt7UiMrTHN05ETcOm43LIA1CC1hUfxT+R9klNXdy4xGS6Gp3LQw65
	sv4cnL0eLCtMvIgA4OdSbXa33Sp/WfYtJhz1cyGpQzp070hZ7i/qBkPadi+wtk1Ohn+hniltkbq1b
	YGH3yhjlx3MBnwpxROTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLLw-0000000DhWA-0jqt;
	Wed, 27 Nov 2024 16:57:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLCG-0000000Dfvh-0CU6
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 16:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732726043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Y9Le1Qou9VDWL2Er7ukdS8f8KHT58ETuT1igFfZRnU=;
	b=M7cq2zYJFLRu+JRoCt3CaaNHnSKdCYnhkPNCic8HjEDoGE/miYhZ0Be0WU2XOTwGhLK1dz
	mMHk16w4DFKH/K7iWH9T2vTRApsV/GimxMJsnV835/HgAjPIpsYZZ82o13Fh5GvPcIKnRZ
	EBHjRBekkysbdh8TDNCSUx2ZkmGOxWY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-to0gJ2R3P6K_L0T2cr_MmQ-1; Wed, 27 Nov 2024 11:47:20 -0500
X-MC-Unique: to0gJ2R3P6K_L0T2cr_MmQ-1
X-Mimecast-MFC-AGG-ID: to0gJ2R3P6K_L0T2cr_MmQ
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-434a467e970so18517495e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 08:47:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732726039; x=1733330839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Y9Le1Qou9VDWL2Er7ukdS8f8KHT58ETuT1igFfZRnU=;
        b=EHqlez77eXilvkf/RoJ3Ba6Udxmacv+I3KtdVVR+pxOp/zZIravJJ3w/fUqXrhzRw0
         kWmjvkm61qKTRiFeFvY+hQmCOdu2RmkRgqYhKvq/cZZbxeSPqiWymY3sg3QZQy8uPOgl
         yZ4I5Sa7vv8xrLtM4IH9LrfNuovVUGXvpiv0pRtGfvrN3ZhpEgCB1rUQxCzi5Nevu8Le
         hTTJQCYTQp0LfsLOhvp2LIJEv2gf+T1zxTJ1PQDmzGBGlvvjFBslTez81MM/NdiGwu2U
         Prqz4rEKj7I5g5UKvWnPO15jCCP83/uNQaYCP+ousKOvAYoWF1qT3Taj2/QfvsZxzhHu
         hOFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg24wc/90mxr9vIneLypCV03x8SiI0Z23UJa0I7Ho6fBCOJBMs9UWHsWW/EkSqcrGpQWLlYWK862RWIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdQR+Nzrbbn+/hDsgMJPCVPzXSYyVJjAcCSBRc7oGK5qdOb3vv
	ySBSGDBonAkaXexGoT0uQelQ1hSsjRPQNMlkYyW1TXH9E9ebX1awTyYuuwMyi+Ft9mnoemegSwY
	VOeGfW7jOrDtFYPPmScad11TxS/RUkfnBqnY+FSJEu+Ap0bhfVWBkkoGBS3EDojf12EzpnfLMNr
	9qB+xP8ivvRpI7PKyXey8S1Sn9IAF61BZsFq8yNGkd
X-Gm-Gg: ASbGncu3Q4Ei8qTZwFgLYwdYGWuNCBhob6NqWj9PoEcYgc/OhquImpZhiQoFNUVq75y
	jTqcw9XNUzVZN0EYEgulcOXpi2Cr+mo/5
X-Received: by 2002:a5d:47a2:0:b0:382:3816:f50e with SMTP id ffacd0b85a97d-385c6ec0c20mr2844827f8f.34.1732726039549;
        Wed, 27 Nov 2024 08:47:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFyIJjCJsUsjTkEPyjKk/HdgXkYrWMJZ2C2yYVcuGldlRnE+mex1jvt62mbPHFSs9dS+0exPW1ON8tsC0Ue1s=
X-Received: by 2002:a5d:47a2:0:b0:382:3816:f50e with SMTP id
 ffacd0b85a97d-385c6ec0c20mr2844810f8f.34.1732726039255; Wed, 27 Nov 2024
 08:47:19 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy2mLBzE63wpQrOaHtOV0rwqkaxTUMBA9oMZsk68o0EHMg@mail.gmail.com>
 <CABgObfacuB-8KN1+Czt5DaXQbaiw9=jP5zYGatw6CGooLnz9Sg@mail.gmail.com> <CAAhSdy1eYZc__ynDrF8sQCk8Rj+CRj+LBBbGnV+Hc4qHfYiEOA@mail.gmail.com>
In-Reply-To: <CAAhSdy1eYZc__ynDrF8sQCk8Rj+CRj+LBBbGnV+Hc4qHfYiEOA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 27 Nov 2024 17:47:07 +0100
Message-ID: <CABgObfbKYc0Dqcq36dHsV=uopV+TAGu9-SuZF+QP=u6x0uMiHg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.13, part #2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xHGWi4_1bwq3ZvQdx8IH9bOgGQsb3xfQO2-AReY5SQQ_1732726039
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_084724_154523_57704CC3 
X-CRM114-Status: GOOD (  21.32  )
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

T24gV2VkLCBOb3YgMjcsIDIwMjQgYXQgNTo0NOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjcsIDIwMjQgYXQgMTA6MDjigK9QTSBQ
YW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUs
IE5vdiAyMSwgMjAyNCBhdCAxOjU14oCvUE0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIFBhb2xvLAo+ID4gPgo+ID4gPiBBcyBtZW50aW9uZWQg
aW4gdGhlIGxhc3QgUFIsIGhlcmUgYXJlIHRoZSByZW1haW5pbmcgS1ZNIFJJU0MtVgo+ID4gPiBj
aGFuZ2VzIGZvciA2LjEzIHdoaWNoIG1haW5seSBjb25zaXN0cyBvZiBTdmFkZS9TdmFkdSBleHRl
bnNpb24KPiA+ID4gc3VwcG9ydCBmb3IgSG9zdCBhbmQgR3Vlc3QvVk0uCj4gPiA+Cj4gPiA+IFBs
ZWFzZSBub3RlIHRoYXQgUGFsbWVyIGhhcyBub3QgeWV0IHNlbnQgdGhlIFJJU0MtViBQUiBmb3Ig
Ni4xMwo+ID4gPiBzbyB0aGVzZSBwYXRjaGVzIHdpbGwgY29uZmxpY3Qgd2l0aCB0aGUgUklTQy1W
IHRyZWUuCj4gPgo+ID4gVGhlIFJJU0MtViBQUiBoYXMgbm90IGJlZW4gbWVyZ2VkIHlldCAoaGFz
IGl0IGJlZW4gc2VudD8pIGFuZCBJIGFtIG5vdAo+ID4gc3VyZSB3aGF0J3MgaGFwcGVuaW5nIGhl
cmUuIElmIHRoZXNlIGFyZSBtZXJnZWQgZmlyc3QsIHByZXN1bWFibHkKPiA+IExpbnVzIHdpbGwg
YnVtcCB0aGUgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGNvbnN0YW50cyAtLQo+ID4g
bGVhdmluZyBTVkFERS9TVkFEVSBhdCA4NyBhbmQgODggYW5kIGFkanVzdGluZyB0aGUgb3RoZXJz
LiBTaG91bGQgSSBkbwo+ID4gdGhhdCBvciBpcyBpdCBkZWxheWVkIHRvIDYuMTQgYXQgdGhpcyBw
b2ludD8KPgo+IFllcywgUGFsbWVyIHNlbmQtb3V0IFJJU0MtViBQUiBvbmUgaG91ciBhZ28uCj4g
KHN1YmplY3QgIltHSVQgUFVMTF0gUklTQy1WIFBhY2hlcyBmb3IgdGhlIDYuMTMgTWVyZ2UgV2lu
ZG93LCBQYXJ0IDEiKQo+IChnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvcmlzY3YvbGludXguZ2l0Cj4gdGFncy9yaXNjdi1mb3ItbGludXMtNi4xMy1tdzEpCj4K
PiBXZSBoYXZlIGFscmVhZHkgc2tpcHBlZCBTdmFkZSAmIFN2YWR1IHN1cHBvcnQgaW4gdGhlIDYu
MTIgbWVyZ2UKPiB3aW5kb3cuIElmIHBvc3NpYmxlIHBsZWFzZSB0YWtlIGl0IGluIHRoaXMgbWVy
Z2Ugd2luZG93LgoKT2ssIHdpbGwgZG8uIEJ1dCBJJ2QgbGlrZSB0byB1bmRlcnN0YW5kIGlmIEtW
TSBwYXRjaGVzIG5lZWRlZCB0aGUgYmFyZQptZXRhbCBzdXBwb3J0LiBJZiBub3QsIGFuZCB0aGUg
b25seSByZWFzb24gdG8gc2tpcCBpdCBpbiA2LjEyIHdhcyB0aGUKaHdjYXAuaCBjb25zdGFudHMs
IHRoZW4gdGhlcmUgd2FzIG5vIHJlYXNvbiB0byBkZWxheSBpdC4gSnVzdCBzZW5kIHRoZQpod2Nh
cC5oIHVwZGF0ZSBhcyBhIHB1bGwgcmVxdWVzdCB0byBib3RoIG1lIGFuZCBQYWxtZXIsIGFuZCB3
ZSdsbAptZXJnZSBpdCBmcm9tIHRoZSBzYW1lIGNvbW1pdCBpbnRvIG91ciB0cmVlcy4KClBhb2xv
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
