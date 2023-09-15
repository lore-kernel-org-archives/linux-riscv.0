Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0921AEE021D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 06:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqQytRS0VqXZeLWtlkXA4tlqXE8w3UsElv+RFpgsnOM=; b=QHle4zMe3qQOL7
	gvRxeufvY6/NC86fFNbwYjGpQJ2nSS1gaZ6BMd2XgKd0McBwkoRF3O4rl/SEnSroaz14DA7HpI+P3
	HA0bVSWvJ+qhIDE3h9Zp8uXNQbb+OoJ09rLYxbpeQE8kLoYB6i6WhdNBBjtE/Ip1SyoVrIP+IHRfh
	duAsyUj+BfLZrfrqGtXWvcf53CT11nGlakzxU9oz2zknWLZ0EfSRMYr3bcldbP6rPvPdiXSWsMOKW
	PXuwjxYC3nVd0AhGQOzibynaEr4mzbMgLxZkD8U1gufqVhr3P0ckqINO9Q2whlZM5j9tlQ4KV4hma
	/My/WuMG5TtrTo6Kx6lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh20i-009sYj-0R;
	Fri, 15 Sep 2023 06:09:00 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh20f-009sXA-23;
	Fri, 15 Sep 2023 06:08:58 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-501bd7711e8so2913514e87.1;
        Thu, 14 Sep 2023 23:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694758133; x=1695362933; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrUex7tZYzG80r+HRntdlogt24bgAFnmLNhpPfiHTo4=;
        b=BextXgMaON3Sk8BvuiRVTZWfj6piVm0BAlfy6FI/KeDUyPaeBLCFLyk8l7TxOrFgK3
         c6u//XodCiGC64AfgWtjUG1ISmz8dwD3M3uozTl5ROdMiOKh0ma+W1UkTQR0obd9LKLe
         wTKpLVV5MZkwrsETISg8xepwgwdIURZMcqJ7lnLqqQxwD14mgOTWBFW7aYuc4Rbvnbzc
         lypmC5oNkQUSGdoKa7aoRt4wQKptwEItFkyWQP5uaqDP2uLlul8jr/xiBfgoEAJmp/4z
         q9dNej6OpdmafOLbXnSRjbFNjk6EC1NIoox2tPngE1I3EotQFwtUUW2O5QXuI+f3yqI7
         wapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694758133; x=1695362933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KrUex7tZYzG80r+HRntdlogt24bgAFnmLNhpPfiHTo4=;
        b=OF2ozYb2ElJrkGGKlhbqnR10cN+vWBwtSc1vZJpVM3GcuSK+QmiPSx7PoVPJOGfYpA
         o26P7l5geiraJ4AzMTfaMqw9zj1HcgaRecFm+KiGM56ao9PuspWOi7GOssJYhe2wnxbC
         ZlGHRy4qVPYlHtqHDESE5ZAKamN5JXZShRgHhj9HJVvrpQUvRHrCx96VUZb+5tuDp6ew
         wN/Zvjyb0VDVNkZKwrVOhtD4FaukVXdjeoQwsPF6stbl/PCgMIPFg8XTBjP1Otp+lBa+
         8AiJdeIkcYtQxr1WQbUd/XQa67bmd82HAtEr0xkuCMgxogZhugTmu6HBhghgTmZgzAwA
         jk5A==
X-Gm-Message-State: AOJu0YxP9AUSDO5XL0/KpfV+rxzx4yCyfgUAzpBRvCW8XNQklAHDu4iv
	z5itTvmWaU3S2p/iEOo3wD6r6F+c4VIm6DJQoYs=
X-Google-Smtp-Source: AGHT+IE/XgBcSpKnAyn9kLVpBkUHetxKd4F0nqWTi/DQv3hNtF8/i08aGRvx7cFjKU4BchcvkCmtqJALN6++fwsZ4H0=
X-Received: by 2002:a05:6512:3096:b0:500:9969:60bf with SMTP id
 z22-20020a056512309600b00500996960bfmr655736lfd.68.1694758132725; Thu, 14 Sep
 2023 23:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694421911.git.haibo1.xu@intel.com> <119c9d06d64b7e4932c5f74a05af1e769cbe7da6.1694421911.git.haibo1.xu@intel.com>
 <20230914-90a562a03985a9a97afd953a@orel>
In-Reply-To: <20230914-90a562a03985a9a97afd953a@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 15 Sep 2023 14:08:41 +0800
Message-ID: <CAJve8o=uZGovGBdtYYxiodGnXO-kE9jj=8pkc5+_Tk+dirQO1Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] tools: riscv: Add header file csr.h
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Thomas Huth <thuth@redhat.com>, 
	Aaron Lewis <aaronlewis@google.com>, Colton Lewis <coltonlewis@google.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_230857_673040_4D534A29 
X-CRM114-Status: GOOD (  20.87  )
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgNDoxNOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMDk6MzY6
NThBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBCb3Jyb3cgdGhlIGNzciBkZWZpbml0aW9u
cyBhbmQgb3BlcmF0aW9ucyBmcm9tIGtlcm5lbCdzCj4gPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Nzci5oIHRvIHRvb2xzLyBmb3IgcmlzY3YuIFNpbmNlCj4gPiBvbmx5IDY0Yml0IHdhcyBzdXBw
b3J0ZWQgZm9yIFJJU0MtViBLVk0gc2VsZnRlc3RzLCBhZGQKPiA+IENPTkZJR182NEJJVCBkZWZp
bml0aW9uIGluIGt2bS9NYWtlZmlsZSB0byBlbnN1cmUgb25seQo+ID4gNjRiaXQgcmVnaXN0ZXJz
IHdlcmUgYXZhaWxhYmxlIGluIGNzci5oLgo+ID4KPiA+IFN1Z2dlc3RlZC1ieTogQW5kcmV3IEpv
bmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1
IDxoYWlibzEueHVAaW50ZWwuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpv
bmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2Nzci5oICAgfCA1MjEgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01ha2VmaWxlIHwgICAzICsKPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDUyNCBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL3Rvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3NyLmgKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjRl
ODZjODJhYWNiZAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvdG9vbHMvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jc3IuaAo+IC4uLgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmls
ZQo+ID4gaW5kZXggMDEwMmEwMjk3Yjg0Li44OWVjZWUyZmRiNzMgMTAwNjQ0Cj4gPiAtLS0gYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZQo+ID4gQEAgLTIyMiw2ICsyMjIsOSBAQCBDRkxBR1Mg
Kz0gLVdhbGwgLVdzdHJpY3QtcHJvdG90eXBlcyAtV3VuaW5pdGlhbGl6ZWQgLU8yIC1nIC1zdGQ9
Z251OTkgXAo+ID4gIGlmZXEgKCQoQVJDSCksczM5MCkKPiA+ICAgICAgIENGTEFHUyArPSAtbWFy
Y2g9ejEwCj4gPiAgZW5kaWYKPiA+ICtpZmVxICgkKEFSQ0gpLHJpc2N2KQo+ID4gKyAgICAgQ0ZM
QUdTICs9IC1EQ09ORklHXzY0QklUCj4gPiArZW5kaWYKPgo+IFRoaXMgc2hvdWxkIGJlIGEgc2Vw
YXJhdGUgcGF0Y2gsIHNpbmNlIHRoZSAiaW1wb3J0IGNzci5oIHRvIHRvb2xzIiBzaG91bGQKPiBi
ZSBjb21wbGV0ZWx5IHNlcGFyYXRlIGZyb20gYW55dGhpbmcgZWxzZS4gQWxzbywgYWxsIGFyY2hp
dGVjdHVyZXMgdGhhdAo+IEtWTSBzZWxmdGVzdHMgc3VwcG9ydHMgYXJlIDY0LWJpdCwgc28sIGFz
IGFub3RoZXIgY29tcGxldGVseSBzZXBhcmF0ZQo+IHBhdGNoLCBJIHRoaW5rIHdlIHNob3VsZCBq
dXN0IGFkZCBDT05GSUdfNjRCSVQgdG8gQ0ZMQUdTIGZvciBhbGwgYnVpbGRzLAo+IGVzcGVjaWFs
bHkgc2luY2UgdGhlcmUncyBhIGNoYW5jZSBzb21lIG9mIHRoZSBpbmNsdWRlcyB0aGUgb3RoZXIK
PiBhcmNoaXRlY3R1cmVzIGFyZSB1c2luZyBtYXkgbmVlZCBpdC4gT2YgY291cnNlIHdlJ2xsIG5l
ZWQgc2lnbi1vZmYgYW5kCj4gdGVzdGluZyBmcm9tIHRoZSBvdGhlciBhcmNoIG1haW50YWluZXJz
Lgo+CgpTdXJlLiBXaWxsIGZpeCBpdCBpbiBWNC4KClRoYW5rcywKSGFpYm8KCj4gVGhhbmtzLAo+
IGRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
