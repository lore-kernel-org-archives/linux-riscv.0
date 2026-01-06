Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3EACD0438
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 04:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6vPSNN7+pGVCpZUmxpbInapAvtRzCJALq9lm9ID040=; b=qbPWhTye38WVAI
	uLL5yhZAZpQ62OFYYcOeF9mD43E6TQa9U86Ba3B/ILiSiOvqWWfjG+NAXJCXuVElUG5kS+1NDtFxQ
	4/QTiEkoMczpcjcpj1pCp/1f5IfMrUAsN58f9i/Q05W5yNRghQo1XN++6DTuU2XIlSk56GF0PsybT
	LL7ce6oDgt0ZErecdpV3QdtcryUZgZ+p4bXfyDvw0Yk1mEoWWnAnCHkAdZPVIiYB9mykyC+lp0mTM
	Sj4pZn9/dc/IJYutCHqM2+GbRvBIxqBzf0ZEI9OyBm8hhV8+DjUHLeCI1KHkEhU9cl1Xj8RJCim1R
	owe4G6bVnxuXf9lmLQ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcz7h-0000000CQ9W-2O0b;
	Tue, 06 Jan 2026 04:56:49 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcz7f-0000000CQ8C-1SoV
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 04:56:48 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-65d132240b5so328052eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jan 2026 20:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767675406; x=1768280206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXCgyGXdfFw2jhIVzlU19gmITjYf/onAsSkhutvgS3M=;
        b=zZh6BZYgQwcAWyxfj8r/aThMAMh60QyYp3wE+nYco0Kyz79tPhupff+zCYtiNSAMuY
         sNAuGHI42OTbUUbAXGnQM6ZG5ECTu6Sy507QcG/UYQogEczwcozOObfXWN1euf+QoUXu
         AsYwxhC+UwcYVFEd6P2wBAelYz2RJiUSApyCLVh1EGn0e+iIRVM4eqtTTeNXPGnb6bjx
         sfgWQoJft+ZI9I9Z9X+J00hlt0ra+tzXRrEbxbbAKwow8T93oGlMqhahBhjnKutXD2GY
         Wo5EcsT+cB0d+r7YGuy+hrsiuVZQpem9RdcYiVjQHxf3qLLbXSh75wlfXKWsaBdcRXVa
         I7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767675406; x=1768280206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bXCgyGXdfFw2jhIVzlU19gmITjYf/onAsSkhutvgS3M=;
        b=ggldPnOq/Snvk5vJNA7Q0Jp4L8Vb35s9rCCxJb4sYUYq1Zkfvivx1/W/n/4vIp1lcY
         Eqt3hRtJw782VSRsoJE43+I1QsmQnuL17yS0jXCyta1s8rgu7RjfMyUaJScCerG3ZKeJ
         WfjG93uNviN9PS66jVwZZM3xj3bEyrQ9kfX5U4WelHGN35fugTTEm+3/CZu/K5U3yTQo
         txQ2jU6U72WW/SqgYB5Qm+nAtNZKIsvET0ovpfw6XZ82geNdk/a9zJv9LZU3dKlsZR0V
         PnHN2t1bqRt9ijE5vRhfmh3S9+ivKL41gHv6FhRAWKi8V4bGy1aWYXdDTM/Vb6acWm2z
         JUeg==
X-Forwarded-Encrypted: i=1; AJvYcCXi2wtzT4WLpsaR55QJjGYp/F6XRhgBOBYfH7IbL2a9mvd9hPoIfry361wK8ksURUAAF+RISXhllpmxmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB5l89gB0Il33rte8REFQ92hb2Zv9E2pJMFMzNKUHO8hQIaFS/
	r0vVG4utVySp7SV1NoB+TotVutYkOgASAqhZAhIfZyjjLakEsrIZBeUi5qjDY54jTJsS6s8x8pc
	mCLOZ1kLqYOAjYJ+lgdiEOrWJbJdRmS/awPPQZcHapA==
X-Gm-Gg: AY/fxX47CIgQvkGrmUx4pIJHNUtLXfPWySx8YzDfUDD11fXun2PlYvsI9yEYNxSzXkp
	RsKcZds+8StUus6uCJVFZA6m2zhKXkNXgZTLVQrzssv4I1TBqM8FlDa7qnAUJWe+ftlvZOPMbi/
	vUjcn/FkR4dvjWTPANUxhjiUZbHR5ce/iEeTzQ1Fn99AByqJJCYqeGaeddjzq8u2afHqBu8Px6K
	FDW90mE2oFrThizjpB13PkS7gcoEKSDQszNbnTsQfkTwqXBED9gAuwYirEADLWZ0YAFCrSnLG9E
	HgTdtBLfyspzgTq5gNrabFkVUqHsQG7gYgnurSNaE+0Sz7SUw1BjfVPcRA==
X-Google-Smtp-Source: AGHT+IGq83xsWiBnk8S8Wan7SqZp6GnFrv0pdr0Nor1LjDGkvPMfuowdAk7rc0hTsmwGhsAqXr8Xk0551qnx4JMiq/Y=
X-Received: by 2002:a05:6820:2202:b0:65e:f37f:93a4 with SMTP id
 006d021491bc7-65f479d332fmr1135768eaf.8.1767675405972; Mon, 05 Jan 2026
 20:56:45 -0800 (PST)
MIME-Version: 1.0
References: <20251020042904.32096-1-luxu.kernel@bytedance.com>
In-Reply-To: <20251020042904.32096-1-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jan 2026 10:26:34 +0530
X-Gm-Features: AQt7F2rV_3WZCrB_VJwYGn79psT6Smtly97t591oPSUibomNxLFKeK19i9dMZfQ
Message-ID: <CAAhSdy3M8NMF0ojJdoSvtate6FRjS5hno2Wc5i=TeCF84yOK3Q@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] RISC-V: KVM: selftests: Add Zalasr extensions to
 get-reg-list test
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, will@kernel.org, peterz@infradead.org, 
	boqun.feng@gmail.com, mark.rutland@arm.com, atish.patra@linux.dev, 
	pbonzini@redhat.com, shuah@kernel.org, parri.andrea@gmail.com, 
	ajones@ventanamicro.com, brs@rivosinc.com, guoren@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_205647_400928_73D1D596 
X-CRM114-Status: GOOD (  12.63  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgOTo1OeKAr0FNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IFRoZSBLVk0gUklTQy1WIGFsbG93cyBaYWxhc3IgZXh0ZW5z
aW9ucyBmb3IgR3Vlc3QvVk0gc28gYWRkIHRoZXNlCj4gZXh0ZW5zaW9ucyB0byBnZXQtcmVnLWxp
c3QgdGVzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2Uu
Y29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMjAKClRoYW5rcywKQW51cAoKCj4gLS0t
Cj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyB8IDQg
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gaW5kZXggYTBiN2Rh
YmI1MDQwNi4uMzAyMGUzN2Y2MjFiYSAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiBAQCAtNjUsNiArNjUsNyBAQCBib29sIGZp
bHRlcl9yZWcoX191NjQgcmVnKQo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQg
fCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQUFNTzoKPiAg
ICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lO
R0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkFCSEE6Cj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklT
Q1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhU
X1pBQ0FTOgo+ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQUxBU1I6Cj4gICAgICAgICBjYXNl
IEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9S
SVNDVl9JU0FfRVhUX1pBTFJTQzoKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhU
IHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkFXUlM6Cj4g
ICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJ
TkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pCQToKPiBAQCAtNTE3LDYgKzUxOCw3IEBAIHN0YXRp
YyBjb25zdCBjaGFyICppc2FfZXh0X3NpbmdsZV9pZF90b19zdHIoX191NjQgcmVnX29mZikKPiAg
ICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpBQU1PKSwKPiAgICAgICAgICAgICAgICAg
S1ZNX0lTQV9FWFRfQVJSKFpBQkhBKSwKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJS
KFpBQ0FTKSwKPiArICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpBTEFTUiksCj4gICAg
ICAgICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQUxSU0MpLAo+ICAgICAgICAgICAgICAgICBL
Vk1fSVNBX0VYVF9BUlIoWkFXUlMpLAo+ICAgICAgICAgICAgICAgICBLVk1fSVNBX0VYVF9BUlIo
WkJBKSwKPiBAQCAtMTExMiw2ICsxMTE0LDcgQEAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyhz
dnZwdGMsIFNWVlBUQyk7Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemFhbW8sIFpBQU1P
KTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YWJoYSwgWkFCSEEpOwo+ICBLVk1fSVNB
X0VYVF9TSU1QTEVfQ09ORklHKHphY2FzLCBaQUNBUyk7Cj4gK0tWTV9JU0FfRVhUX1NJTVBMRV9D
T05GSUcoemFsYXNyLCBaQUxBU1IpOwo+ICBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHphbHJz
YywgWkFMUlNDKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YXdycywgWkFXUlMpOwo+
ICBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpiYSwgWkJBKTsKPiBAQCAtMTE4Nyw2ICsxMTkw
LDcgQEAgc3RydWN0IHZjcHVfcmVnX2xpc3QgKnZjcHVfY29uZmlnc1tdID0gewo+ICAgICAgICAg
JmNvbmZpZ196YWJoYSwKPiAgICAgICAgICZjb25maWdfemFjYXMsCj4gICAgICAgICAmY29uZmln
X3phbHJzYywKPiArICAgICAgICZjb25maWdfemFsYXNyLAo+ICAgICAgICAgJmNvbmZpZ196YXdy
cywKPiAgICAgICAgICZjb25maWdfemJhLAo+ICAgICAgICAgJmNvbmZpZ196YmIsCj4gLS0KPiAy
LjIwLjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
