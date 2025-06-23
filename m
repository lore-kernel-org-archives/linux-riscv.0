Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02317C7115B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 10:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hI/JQz50KBKSkIYoX/3Kt78SAOIbqSaDQxNjeMODmQ=; b=YpNHgQagKTKft1
	6bW0gvEAKhmq8YBRv3WD0b8tK/9ay9UGgIV5EeEYjE2HdkBadaGLBess6GAbL3Ff//UTsnkiSf8JV
	kJneyUiEKRQDqJfqe/3gZM/gxgrD1WyuHj7xwaXNZws4kD2cw1lM+6k37TEykS+N/MIysXDjtp+7Z
	iXDSbypVJQxik5Lu8puszYxOdGchZ4K6wZpNBFPFyTVgkE0t+Mm8XoIbWmXjlF3KmFItVpdFOyUOv
	XAdX5fnoLi+jb+hJwjfur5Kk/VsDSb0lqaaYdkWgbDUZKv2smMFSv99Ei02MC379oQsIfYw7mW3Le
	rkLZOG6Q1fRS2TguvmWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeqh-00000002SFm-2HE2;
	Mon, 23 Jun 2025 10:56:27 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTe2T-00000002Het-0ZhT
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 10:04:34 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so235089f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750673071; x=1751277871; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q72uVLN6Dd/lEgG34G+gl19V3OHTLM7bT/jbIRgpIbI=;
        b=NTDhrfsGJfZAgTctrCflavoWgJSC7fXE9uJac7P+7OfZ0l5tKUM5rlpoXQU3GC3Uw3
         T2S6hK2VxOHC7THExsrC4Izw7pUPIqS5Q2d17YuVsqvhS3PyIRYtolRHWhCCRqgL1tc8
         Gsqb15w1OjocV1y+fdw9iEqMT2yiz1MjLfeiaeKAzv7QYCp1uKGHAwVeN9li12GaU24D
         OpStHmKfTMhsipCIznNCAfRnNWz+tjh2KIi0KjTyfjenqQtnpcAEmO9z9Ki2oiLz7ARm
         bmyqVy3F+PacY31Im9PNj3HL74y4ZxVmdT+dH+Kb+9RqnNwd/GjFitgZf9AMTXOESRy4
         iu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750673071; x=1751277871;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q72uVLN6Dd/lEgG34G+gl19V3OHTLM7bT/jbIRgpIbI=;
        b=EVkFRUwQPf3w795Ly/Q4RersdPX4e962o2PYdT/XHuG5vymq3ONlw14KY+DH0W6Fr7
         3PvVwwtl19DUX3FbaS1DrhV45HuFimnW+DGwBu1xHFkJ73vgf8/Xq+biLYZb9pJzlKcs
         4Yer5syRNDAL9x0J4viNpW6akbKOc/Xv0JAKx51g07EJYfXTrgDJbzjTsAEsz3Zg/kfd
         0VmCZN2ndBuwjQr37Ym5XqXiSNgGGjgYensy5tLTGuGPjTPoaYamCpQpI9PqU7+TZWc0
         50nlwdhUSYkjqWJ0/C/GaPWqamX/OunO5ZjxtD9LLOD/gnCNdjR/wZ2U6lXRNpBu2PDt
         R1OQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4iRp6czpIWkgmH9k5qhZ5UpRSIZ1/yok42ppvc1FjDu6EyJS/CrXT74HSwboSFiB1UkQ+Mn3Cd1EXIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKNx0wnto2gDnf2tEmfMWXVNCVV6GsJ98Dv90jbgL4PM8/Zs6Y
	zDHHzErzPAZ150xVR/4jIo0OmrcRTdXtENouHfdtwLHeWy3pSuvBcRHE82AjECedPJU=
X-Gm-Gg: ASbGnctozF1BP9crRuzMid5jRyPcaXX6RkJ9HQ9hWDcdhQalj4/EqfKel2DW7Bg8KNP
	Uj6yuRNpkO9SHkwgbvsN4w0K5okJ1KqX3oeYxJq4Ue5bHcS3GcZO3w2WdAbj3l5L2lWXfWcJCdy
	96/VbN+qPW/TiV2QGhe3Y0pj46H23Pk4dwUDd/kTgqzHCWfbnovC6hVfsgUhSW8zYDT6lSurhHQ
	Kwb3VPsylyo3cKl4SyqlZF+Zt+1/TQn/QYDc/pFg7ZYcuNtEs3VbYgGEusL1BVI4iTMSIEioesk
	prmq0XWleV42QyjwG+NXywmI1mgCswlXmAPRFLEhQJLyalXTjvKWrcCsqdG7p504m8c=
X-Google-Smtp-Source: AGHT+IFs2pQCa+3bKTkdor2w3FPfdSYUbedMYRtHjGttAZlhUfRN/r/Qxtzp7NLRxL4SrXakOUW0PA==
X-Received: by 2002:a05:6000:24c8:b0:3a4:e193:e6e7 with SMTP id ffacd0b85a97d-3a6d12e995amr3291773f8f.5.1750673071422;
        Mon, 23 Jun 2025 03:04:31 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8947:973b:de:93b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f19f9esm9077130f8f.39.2025.06.23.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:04:31 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 23 Jun 2025 12:04:30 +0200
Message-Id: <DATTT5U64J4L.3UTDRVT2YP7GT@ventanamicro.com>
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal
 instruction fault
Cc: <anup@brainfault.org>, <atish.patra@linux.dev>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Xu Lu" <luxu.kernel@bytedance.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
 <CAPYmKFvcnDJWXAUEX8oY6seQrgwKiZjDqrJ_R2rJ4kWq7RQUSg@mail.gmail.com>
In-Reply-To: <CAPYmKFvcnDJWXAUEX8oY6seQrgwKiZjDqrJ_R2rJ4kWq7RQUSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_030433_186872_56DB5A82 
X-CRM114-Status: GOOD (  18.63  )
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

MjAyNS0wNi0yMlQxODoxMTo0OSswODowMCwgWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5j
b20+Ogo+IEhpIFJhZGltLAo+Cj4gT24gRnJpLCBKdW4gMjAsIDIwMjUgYXQgODowNOKAr1BNIFJh
ZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4KPj4gMjAy
NS0wNi0yMFQxNzoxNzoyMCswODowMCwgWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+
Ogo+PiA+IERlbGVnYXRlIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQgdG8gVlMgbW9kZSBpbiBk
ZWZhdWx0IHRvIGF2b2lkIHN1Y2gKPj4gPiBleGNlcHRpb25zIGJlaW5nIHRyYXBwZWQgdG8gSFMg
YW5kIHJlZGlyZWN0ZWQgYmFjayB0byBWUy4KPj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6IFh1IEx1
IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+PiA+IC0tLQo+PiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV9ob3N0LmgKPj4gPiBAQCAtNDgsNiArNDgsNyBAQAo+PiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEJJVChFWENfSU5TVF9JTExFR0FMKSAgICB8IFwKPj4KPj4g
WW91IHNob3VsZCBhbHNvIHJlbW92ZSB0aGUgZGVhZCBjb2RlIGluIGt2bV9yaXNjdl92Y3B1X2V4
aXQuCj4KPiBJIG9ubHkgd2FudCB0byBkZWxlZ2F0ZSBpdCBieSBkZWZhdWx0LiBBbmQgS1ZNIG1h
eSBzdGlsbCB3YW50IHRvCj4gZGVsZWdhdGUgZGlmZmVyZW50IGV4Y2VwdGlvbnMgZm9yIGRpZmZl
cmVudCBWTXMgbGlrZSB3aGF0IGl0IGRvZXMgZm9yCj4gRVhDX0JSRUFLUE9JTlQuCgooSSB0aGlu
ayB3ZSBjb3VsZCBlYXNpbHkgcmVpbnRyb2R1Y2UgdGhlIGNvZGUgaWYgS1ZNIHdhbnRzIHRvIGRv
IHRoYXQgaW4KIHRoZSBmdXR1cmUuICBJIGFsc28gdGhpbmsgdGhhdCBpdCdzIGJhZCB0aGF0IHRo
aXMgcGF0Y2ggaXMgZG9pbmcgYW4KIG9ic2VydmFibGUgY2hhbmdlIHdpdGhvdXQgdXNlcnNwYWNl
IGludm9sdmVtZW50IC0tIHRoZSBjb3VudGluZyBvZiBLVk0KIFNCSSBQTVUgZXZlbnRzLCBidXQg
b3RoZXJzIHdpbGwgcHJvYmFibHkgZGlzYWdyZWUgd2l0aCBtZSBvbiB0aGlzLikKCj4gICAgICAg
ICAgICAgICAgIFNvIG1heWJlIGl0IGlzIGJldHRlciB0byByZXNlcnZlIHRoZXNlIGNvZGVzPwoK
UG9zc2libHksIHRoZSBjdXJyZW50IGlzIGFjY2VwdGFibGUgaWYgeW91IGhhdmUgY29uc2lkZXJl
ZCB0aGUKaW1wbGljYXRpb25zIG9uIFBNVSBldmVudHMuCgo+PiBBbmQgd2h5IG5vdCBkZWxlZ2F0
ZSB0aGUgb3RoZXJzIGFzIHdlbGw/Cj4+IChFWENfTE9BRF9NSVNBTElHTkVELCBFWENfU1RPUkVf
TUlTQUxJR05FRCwgRVhDX0xPQURfQUNDRVNTLAo+PiAgRVhDX1NUT1JFX0FDQ0VTUywgYW5kIEVY
Q19JTlNUX0FDQ0VTUy4pCj4KPiBUaGFua3MgZm9yIHRoZSByZW1pbmRlci4gSSB3aWxsIGhhdmUg
YSB0ZXN0IGFuZCByZXNlbmQgdGhlIHBhdGNoIGlmIGl0IHdvcmtzLgoKVGhlIG1pc2FsaWduZWQg
ZXhjZXB0aW9ucyBhcmUgYWxyZWFkeSBiZWluZyB3b3JrZWQgb24sIHNvIGRvbid0IHdhc3RlCnlv
dXIgdGltZSBvbiB0aGVtLCBzb3JyeS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
