Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4B2CD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 14:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7XmU/BkIL2uwN//Qp/Xhx5BIV2aTSgiljbUeiH4O2fM=; b=vuKMvQB79YumPS
	Oz3nm4wWezo+Nm2XgOlAF51O/AXd/xjMtOhhlqfQqud2XvISwtUTtVBZZlQBehmiO8ZF/ZWr3Zwt7
	l6p1n4i+NXllGWKKCaPSAca+mZqUQkWjFmK6ZHp0R9j42s3c4l1zc+PP6YIPKvWx2hzVzSXkdza6+
	N/F6krlczBuiZsboUNbTeQh9ykvJbM9BRxcaYYbKcuU2fYCWyxNR5yr+BUQcmm0DbSYrNQfhV5Yp3
	Su+o1FMTm3Iz6sdeBl5K153Kv+nR76FHJnocF86bmznki9R308cmoQEMHuv56jAcy14Q7wNPALLoC
	gteKj9/TEQqDrfYS4jTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOA9-000000033Jl-0ixJ;
	Thu, 04 Apr 2024 14:33:57 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOA4-000000033FN-0xhj
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 14:33:54 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so831731a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 07:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712241230; x=1712846030; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpF7tTa5Sd3tDtJxZDaT9Swi8PyGNUK+y0VMQ7cXB4o=;
        b=DnexOYyz3xTZKH9588udeQtcSmHpaBxeXCDRWntNcR7MUOi9d7eezK2DLthjFjdEWc
         EK44jQnHgwRr7zvrJgt8C1UEfoNo4oxASPGPOAWHY6qdQJpIMZGVES1bsVGGKNfRO6rr
         x9rVBjNf2A5bqbYQmUlYuBBGMeC6Iw1b3WhO0BBTHLSEZoMrqFW/x7x4z90ZgrqWNlno
         h5p7jO4hCxhBsGaQKVsCR4cuuCYLSSXMevf5hKCM43kNIi6R/cZZG5c4oo2Hsx1IzK26
         74fh30kyPYK4GInmNPgBgnw4MfgWn9WrTYKoDy5+DZFpYUIoeiCHiIjOieqfEfUzGY6V
         oRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712241230; x=1712846030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpF7tTa5Sd3tDtJxZDaT9Swi8PyGNUK+y0VMQ7cXB4o=;
        b=aHflD3LAvIMEVR2zP6oyChz+lM3IauUIA4ZN3+eabnYVHTWIRjFWq0bqNcsgrHlCaI
         lb6Sqasv5TSJ28osI/2doHna3yTXU/a4ExTVI8IcGGkZdO7OaY2HslrK/+vd6yVi6MTC
         gjYelf8ziKBwXoF7Y+nF5iBoTf3g1fkGRniG9KokbFo4NtTqQseqknrzbTuecSpvT+0d
         1+upcB4VuMIveRwC8huKMzWJYsfSVjl2ULzZZCzVt/Z3K86er1bNlDi37FXh0YGZjTCs
         zGh3a3RetkxbT6brRN01riYcY5k1NKZF7AULP45sXVMoqkM3KyEhxBIEvImDOvTLMNSC
         6QVg==
X-Gm-Message-State: AOJu0YxO0/iTpBZprLljQnKRa0FCkF+XePESpNxNtpD/5FdkXHLEEMHd
	4+kj8Kxo2vKmc8NS3TPXhMYJoSHmbfflT1UV0UiQDElSgN4ZkAUB0pSzpTNPQnj0KHaSbqi9nT+
	Pn4MwfCH08zvBxCqB6CWhC3FVLm0=
X-Google-Smtp-Source: AGHT+IG20eNpSzNkxnsgTkafpuA97Ew4OmO4JnqBaV5mNVNvOzgcdHEwHOPWG79O1UTpYlFkEm87j6CqNJkr6GVC/L4=
X-Received: by 2002:a17:90b:f18:b0:29d:dd93:5865 with SMTP id
 br24-20020a17090b0f1800b0029ddd935865mr2399668pjb.46.1712241230437; Thu, 04
 Apr 2024 07:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud>
In-Reply-To: <20240404-providing-emporium-e652e359c711@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Apr 2024 16:33:08 +0200
Message-ID: <CANiq72m9YAu=dr1=WMSHOqfpszj4S6OkMEQ05vqbv_zKO5pOsg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	stable@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Ramon de C Valle <rcvalle@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_073352_404907_F93BA07E 
X-CRM114-Status: GOOD (  10.78  )
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

T24gVGh1LCBBcHIgNCwgMjAyNCBhdCA0OjE34oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4KPiBPbiBSSVNDLVYgYW5kIGFybTY0LCBhbmQgcHJlc3VtYWJseSB4ODYsIGlm
IENGSV9DTEFORyBpcyBlbmFibGVkLAo+IGxvYWRpbmcgYSBydXN0IG1vZHVsZSB3aWxsIHRyaWdn
ZXIgYSBrZXJuZWwgcGFuaWMuIFN1cHBvcnQgZm9yCj4gc2FuaXRpc2VycywgaW5jbHVkaW5nIGtj
ZmkgKENGSV9DTEFORyksIGlzIGluIHRoZSB3b3JrcywgYnV0IGZvciBub3cKPiB0aGV5J3JlIG5p
Z2h0bHktb25seSBvcHRpb25zIGluIHJ1c3RjLiBNYWtlIFJVU1QgZGVwZW5kIG9uICFDRklfQ0xB
TkcKPiB0byBwcmV2ZW50IGNvbmZpZ3VyaW5nIGEga2VybmVsIHdpdGhvdXQgc3ltbWV0cmljYWwg
c3VwcG9ydCBmb3Iga2ZpLgo+Cj4gRml4ZXM6IDJmN2FiMTI2N2RjOSAoIktidWlsZDogYWRkIFJ1
c3Qgc3VwcG9ydCIpCj4gY2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+IFNlbmRp
bmcgdGhpcyBvbmUgb24gaXRzIG93biwgdGhlcmUncyBubyBleHBsaWNpdCBkZXAgb24gdGhpcyBm
b3IgdGhlCj4gcmlzY3YgZW5hYmxpbmcgcGF0Y2gsIHYzIHRvIGNvbnRpbnVlIHRoZSBudW1iZXJp
bmcgZnJvbSB0aGVyZS4gTm90aGluZwo+IGhhcyBjaGFuZ2VkIHNpbmNlIHYyLgo+Cj4gQ0M6IE1p
Z3VlbCBPamVkYSA8b2plZGFAa2VybmVsLm9yZz4KPiBDQzogQWxleCBHYXlub3IgPGFsZXguZ2F5
bm9yQGdtYWlsLmNvbT4KPiBDQzogV2Vkc29uIEFsbWVpZGEgRmlsaG8gPHdlZHNvbmFmQGdtYWls
LmNvbT4KPiBDQzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyAob3BlbiBsaXN0KQo+IEND
OiBydXN0LWZvci1saW51eEB2Z2VyLmtlcm5lbC5vcmcKPiBDQzogU2FtaSBUb2x2YW5lbiA8c2Ft
aXRvbHZhbmVuQGdvb2dsZS5jb20+Cj4gQ0M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0u
b3JnPgo+IENDOiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+Cj4gQ0M6IGxs
dm1AbGlzdHMubGludXguZGV2CgpDYydpbmcgTWF0dGhldyAmIFJhbW9uIGFzIHdlbGwgc28gdGhh
dCB0aGV5IGFyZSBhd2FyZSBhbmQgaW4gY2FzZSB0aGV5CndhbnQgdG8gY29tbWVudC4KCkNoZWVy
cywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
