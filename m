Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92471CCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0xAkFk9zwBsXjpht9zaoTwRdSSRQQP7S9D09K5h7w0=; b=0vvIHdQEuQuu78
	Io7Ekhg3+tApAPky1AppNMy36P5CBFrGfaCme4k4Qj4eTZqpLnqxCokUCcZWnWtErrQJTimvdJ4iu
	vhKezsj02xs+aJnepICpKWi78PMRdqPIAUX4qGWqBubcTjEIL8tx7MQByzGvDPNwCjHFjUOvUuepG
	m8+m6h+QQdqH9+sIgegD7lQWkSUzxFZGC9bdF9NxgtxOIcll+Ee++f2wo/bYtzWXEVWC9YATuO9cS
	pnmMDHW+obi92o9Q3bcXSEhuzCpCZP4dhK3QIS4mQ62+j0Qgd+zmZWLC8Iuq/2TCOpD08q/Vwfhrz
	xdRz2rkE5F9zxXFDHhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmmP-0000000GLXC-3OLl;
	Tue, 28 Oct 2025 16:42:41 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmmN-0000000GLWS-0lbE
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 16:42:41 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b67684e2904so4503807a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 09:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761669758; x=1762274558; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/gmStdv3FU0oGBzCptCijx3MdjTDsamveWiRrc2ft4=;
        b=ojzBdOl5+LTWiAAcX8/+g3k59k4hlJk9yQbWCGps7ARqPI/G1vL7khrnX02zvbGUP9
         q9FrwG9gIssU8rzkviTAi52kL7TJeIaBQLjc076zFfo9XJmJmykkuIrC9KAcc6ntqe7B
         qGzL8/sUoIWK06Ot4lFU8p3AKdHroYfBeVoPSGWKlFQiFHr03+qpmSJ0V4nU4DafeC9x
         cFGkcgrrfPVvxeCkLKDDA3WPgQykg6AVwh2QhOb13Eh8UXLcT85yUTidw2SnK/a+MESv
         QxBccmeWnA0HD5aWLxS/h/M+xiq6lxl7RZwMU2rlFtHZXWXXl045weclV+bVdntR/E/N
         0gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761669758; x=1762274558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/gmStdv3FU0oGBzCptCijx3MdjTDsamveWiRrc2ft4=;
        b=IG3mBZCsWiM4wzDASJdtghUlCIguqlI+e2OFH8GlCrd0u6QN1bR85Rw6tAhb0HtgUL
         L16Mn52WMpaZs6kpBWB7D/23MHYfqSzMS+VCanZgRoswrRbu7sMTVj3Ply3Wo+D8ehBM
         tO/pmiuC9U5QMIQXdYLKUQpzKagVACO8x4p+nK/2xgSLN9NsblGj2ErwJqcUefbOCUY4
         0njjj8unxxBrNlwCbq1hWlAkRdg/tCplzsNKgCUz/qEw02T/aQUvBjxWKRyeORVLgbWS
         /vT8TQbbkJEj6QWSmw/UCxrItA9jIMkk6J7kiXUbx4KPQrXJu98+FIUscgMQ6D680KLP
         7gyA==
X-Forwarded-Encrypted: i=1; AJvYcCXyh13eAIrFV6jOoUvLqPFdvbgDwZeNhxZ1qsW6QeSJKdVQpt2AEC694mgd/kLJdseYr0R55uVutZQ/5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDp+zS4gjnmMWEITZnrJJTlV5Wt5YIlzFXWXHetX5cbqmEB7/B
	2C0wQMNvurqDJnUiKfYub0/4qX6Em/++J4EN36Qds79Z5qyfYOO/FeyyEysha8PChebc6wVFFy0
	jq9YKBktchnjboiiuHmvXPwIPi5kY1EUBeq6HoBL4
X-Gm-Gg: ASbGnctDUwvX9fK0FemDD8zxv3uOu1zO+mSmmG6XplIVu5W7GXDoJDo99e4S3eyBW00
	z/xDUiTFUq5ASDkNcK875C6MgzL1mZywMCGVx0V7z8pD0ahAgiZ5dCulohYhX84RKv5TFkZaWxv
	tNE8JVrce8MRQqVzKx+8iPDtiwicL38v8FHv4qw1BOK9Do65cMH1P4UA90uIuAKSLYjvSIRPs2D
	d7oL27f0MmQCaoZQen3MMAcrxqM/h2PMl/m12AVDAlMYV1KI7BkWavVz4VLkpumHsOgmbpNixpQ
	JdKEfkez5spmTtxL1RSJaztkYg==
X-Google-Smtp-Source: AGHT+IEA9HqIHKBrDRAdapOaEhdj5ptHdSYRpb4qWqp0AQjJ5Y7jaBBFwbe3KRRyVBlj5jpvCvwUbXxGS+XHLaIF4JY=
X-Received: by 2002:a17:902:d484:b0:290:c0ed:de3a with SMTP id
 d9443c01a7336-294cb522c8bmr51946525ad.30.1761669757359; Tue, 28 Oct 2025
 09:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
 <20251028053330.2391078-1-kuniyu@google.com> <20251028095407.2bb53f85@pumpkin>
In-Reply-To: <20251028095407.2bb53f85@pumpkin>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 28 Oct 2025 09:42:25 -0700
X-Gm-Features: AWmQ_bmNBvZgs1Mp1FllgTi4GNPibwKiayJAa04sxsmAaaKLfS_gUEVbDU0m9lw
Message-ID: <CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
To: David Laight <david.laight.linux@gmail.com>
Cc: dave.hansen@intel.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	axboe@kernel.dk, bp@alien8.de, brauner@kernel.org, catalin.marinas@arm.com, 
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com, edumazet@google.com, 
	hpa@zytor.com, kuni1840@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, 
	tglx@linutronix.de, torvalds@linux-foundation.org, will@kernel.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_094239_226285_B9BD3659 
X-CRM114-Status: GOOD (  17.44  )
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

T24gVHVlLCBPY3QgMjgsIDIwMjUgYXQgMjo1NOKAr0FNIERhdmlkIExhaWdodAo8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDI4IE9jdCAyMDI1IDA1OjMy
OjEzICswMDAwCj4gS3VuaXl1a2kgSXdhc2hpbWEgPGt1bml5dUBnb29nbGUuY29tPiB3cm90ZToK
Pgo+IC4uLi4KPiA+IEkgcmViYXNlZCBvbiAxOWFiMGEyMmVmYmQgYW5kIHRlc3RlZCA0IHZlcnNp
b25zIG9uCj4gPiBBTUQgRVBZQyA3QjEyIG1hY2hpbmU6Cj4KPiBUaGF0IGlzIHplbjUgd2hpY2gg
SSBiZWxpZXZlIGhhcyBtdWNoIGZhc3RlciBjbGFjL3N0YWMgdGhhbiBhbnl0aGluZyBlbHNlLgo+
IChJdCBtaWdodCBhbHNvIGhhdmUgYSBmYXN0ZXIgbGZlbmNlIC0gbm90IHN1cmUuKQoKVGhpcyBp
cyB0aGUgWmVuIDIgcGxhdGZvcm0sIHNvIHByb2JhYmx5IHRoZSBzdGFjL2NsYWMgY29zdCB3aWxs
IGJlCm1vcmUgZXhwZW5zaXZlIHRoYW4geW91IGV4cGVjdCBvbiBaZW4gNS4KCj4KPiBHZXR0aW5n
IGEgMyUgY2hhbmdlIGZvciB0aGF0IGRpZmYgYWxzbyBzZWVtcyB1bmxpa2VseS4KPiBFdmVuIGlm
IHlvdSBoYWx2ZWQgdGhlIGV4ZWN1dGlvbiB0aW1lIG9mIHRoYXQgY29kZSB0aGUgc3lzdGVtIHdv
dWxkIGhhdmUKPiB0byBiZSBzcGVuZGluZyA2JSBvZiB0aGUgdGltZSBpbiB0aGF0IGxvb3AuCj4g
RXZlbiB5b3VyIG9yaWdpbmFsIHBvc3Qgb25seSBzaG93cyAxJSBpbiBlcF90cnlfc2VuZF9ldmVu
dHMoKS4KCldlIHNhdyBhIHNpbWlsYXIgaW1wcm92ZW1lbnQgb24gdGhlIHNhbWUgcGxhdGZvcm0g
YnkKMWZiMGU0NzE2MTFkICgibmV0OiByZW1vdmUgb25lIHN0YWMvY2xhYyBwYWlyIGZyb20KbW92
ZV9hZGRyX3RvX3VzZXIoKSIpLgoKCj4KPiBBbiAnaW50ZXJlc3RpbmcnIHRlc3QgaXMgdG8gcmVw
bGljYXRlIHRoZSBjb2RlIHlvdSBhcmUgb3B0aW1pc2luZwo+IHRvIHNlZSBob3cgbXVjaCBzbG93
ZXIgaXQgZ29lcyAtIHlvdSBjYW4ndCBnYWluIG1vcmUgdGhhbiB0aGUgc2xvd2Rvd24uCj4KPiBX
aGF0IGlzIG1vcmUgbGlrZWx5IGlzIHRoYXQgYnJlYXRoaW5nIG9uIHRoZSBjb2RlIGNoYW5nZXMg
dGhlIGNhY2hlCj4gbGluZSBsYXlvdXQgYW5kIHRoYXQgY2F1c2VzIGEgbGFyZ2VyIHBlcmZvcm1h
bmNlIGNoYW5nZS4KPgo+IEEgYmV0dGVyIHRlc3QgZm9yIGVwb2xsX3B1dF9ldmVudCB3b3VsZCBi
ZSB0byBjcmVhdGUgMTAwMCBmZCAocGlwZXMgb3IgZXZlbnRzKS4KPiBUaGVuIHRpbWUgY2FsbHMg
ZXBvbGxfd2FpdCgpIHRoYXQgcmV0dXJuIGxvdHMgb2YgZXZlbnRzLgo+Cj4gICAgICAgICBEYXZp
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
