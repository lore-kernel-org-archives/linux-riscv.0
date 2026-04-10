Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6692E9905F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 09:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/II8a4Ye6xYfzq7+zit9Ga15twKNJ0dLqF+d2l7B14=; b=hQVaJY7FJlFoga
	KNTtSB1XgJnVxHgGc8TXpNggqiV+jxW4xO8Tyj8BmcWKzHZ9NY9OaDL1Y88h5FMEkp3H4S0YmlDX5
	+DnO+2azoUf3JNXsYGFHNRBfzS4oEsRfxLfBNWEhJ9IUY4iskV0SMFxYbCaTcojI1VgOPielaaA8t
	ioZ9JpvZHE30E3qjs246YpVmezbco+4Ub3h0fYTpSj+PcrK3bYtEeIG9tUFkzO4D7i31SrGslb9aU
	UH4mhMxJYwnT4otHihMx10iu2gurG7BDJONf424KTxf5vzJTQq3cciaY1VL52OHaoE2aruJ+MMcSL
	3IowGj8bwA3KrknQbgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7za-0000000BtsR-3usr;
	Fri, 10 Apr 2026 09:17:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7zZ-0000000BtsF-1Hfx
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 09:17:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DE2660181
	for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 09:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45055C2BCAF
	for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 09:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775812652;
	bh=x8z3iqaV+oIFP4lbmFngGMI+OLDetf8IK/RMivcNMkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gywpIAdq+SfwaE/pBv/CnDiqgOAQgBf7KsszEGiJvcpP9fzCyF6lJa83nOk8wtldp
	 6UqxFLPUxCPWc+QbBlzJya52icRDhVbWeeKTt8CJgzz5Ad9/9UzECIDutqmnGT9guc
	 MQdfDN/ewN1AaVG/tgMKb7eFcGaIy2CWL+bF1hsOkN7ZQFgvJVejntFdfjkoyV4sOC
	 6SmNAxpyM77ByLdk+VF93pK4qL4NSyGzWKSBO2Fk/QKt45W778XlMupBA84YrP/43q
	 VxAWYg9FKA3M7Wpw2ErajKDAO1i5Sd9uGXzCI+lPm3DjnUxdIF82hX4f0jh37whg4L
	 /m+pXLWpVoFPQ==
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4888375f735so17700705e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 02:17:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU58P7bXAcceIQeRVWIrxSTfx3XoEUO+R1rwVnWEEkHgkBNnnYQlyPdkqgLyqyGMNPB2EaZjL2LEAhClA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yye9fG/IeBM0iYKw5+cr9VJBB8i6QULEq24ZWygEDO5H3QDOD8h
	P00JaG2TaZ0d2JvaGySrNat/oZNXHqEl1nqDs56VJZvkqwGMZ2zDCn90XwZfOfjP7P88cYR3HWV
	yLIZx0HP1lNUAPCHwNTpPZazQvlfP3DI=
X-Received: by 2002:a05:600c:64cf:b0:485:b6dd:5066 with SMTP id
 5b1f17b1804b1-488d67ce664mr26080445e9.7.1775812650787; Fri, 10 Apr 2026
 02:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260409114736.907-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260409114736.907-1-cp0613@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 10 Apr 2026 17:17:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS6mwZJ+j0uChzxgA73Ez5Jd_sGUTn1FfCaNcSG2qbNsg@mail.gmail.com>
X-Gm-Features: AQROBzCf8u1lVDr6TWvzncelUN_ti2aTe3D3braO96akvEWY90LReTI1PY3Jlqw
Message-ID: <CAJF2gTS6mwZJ+j0uChzxgA73Ez5Jd_sGUTn1FfCaNcSG2qbNsg@mail.gmail.com>
Subject: Re: [PATCH] riscv: ftrace: select HAVE_BUILDTIME_MCOUNT_SORT
To: cp0613@linux.alibaba.com
Cc: pjw@kernel.org, alex@ghiti.fr, andybnac@gmail.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

SGkgQ2hlbiwKCkNvb2wsIHdlIG1pc3NlZCB0aGF0LiBHb29kIGNhdGNoIQoKVGVzdGVkLWJ5OiBH
dW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCk9uIFRodSwgQXByIDksIDIwMjYgYXQgNzo0OOKA
r1BNIDxjcDA2MTNAbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ2hlbiBQZWkg
PGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4KPgo+IFJJU0MtViBhbHJlYWR5IHNhdGlzZmllcyBh
bGwgcHJlcmVxdWlzaXRlcyBmb3IgYnVpbGQtdGltZSBtY291bnQgc29ydGluZzoKPiB0aGUgc29y
dHRhYmxlIGhvc3QgdG9vbCBoYW5kbGVzIEVNX1JJU0NWIGluIGl0cyBtYWNoaW5lLXR5cGUgZGlz
cGF0Y2gsIGFuZAo+IHRoZSBfX21jb3VudF9sb2Mgc2VjdGlvbiBlbnRyaWVzIGFyZSBzdG9yZWQg
YXMgZGlyZWN0IHZpcnR1YWwgYWRkcmVzc2VzIGluCj4gdGhlIGZpbmFsIHZtbGludXggYmluYXJ5
LCBzbyBubyByZWxvY2F0aW9uIHByb2Nlc3NpbmcgaXMgcmVxdWlyZWQgZHVyaW5nCj4gdGhlIHNv
cnQgc3RlcC4KPgo+IFNlbGVjdCBIQVZFX0JVSUxEVElNRV9NQ09VTlRfU09SVCBzbyB0aGF0IEJV
SUxEVElNRV9NQ09VTlRfU09SVCBpcwo+IGF1dG9tYXRpY2FsbHkgZW5hYmxlZCB3aGVuIERZTkFN
SUNfRlRSQUNFIGlzIGNvbmZpZ3VyZWQuICBUaGlzIGFsbG93cwo+IHNvcnR0YWJsZSB0byBzb3J0
IHRoZSBfX21jb3VudF9sb2Mgc2VjdGlvbiBhdCBsaW5rIHRpbWUsIG1ha2luZyB0aGUKPiBydW4t
dGltZSBmdHJhY2UgaW5pdGlhbGlzYXRpb24gcGF0aCBza2lwIHRoZSBzb2Z0d2FyZSBzb3J0IGFu
ZCByZWR1Y2luZwo+IGtlcm5lbCBzdGFydHVwIG92ZXJoZWFkLgo+Cj4gVmVyaWZpZWQgd2l0aCBD
T05GSUdfRlRSQUNFX1NPUlRfU1RBUlRVUF9URVNUPXksIHdoaWNoIGNvbmZpcm1zIHRoYXQKPiB0
aGUgc2VjdGlvbiBwcm9kdWNlZCBieSB0aGUgYnVpbGQgaXMgYWxyZWFkeSBpbiBhc2NlbmRpbmcg
b3JkZXI6Cj4KPiAgIFsgICAgMC4wMDAwMDBdIGZ0cmFjZSBzZWN0aW9uIGF0IGZmZmZmZmZmODEw
MTVhNjAgc29ydGVkIHByb3Blcmx5Cj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFBlaSA8Y3AwNjEz
QGxpbnV4LmFsaWJhYmEuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgfCAxICsKPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggOTBjNTMxZTZhYmY1Li42ZmU5
MDU5MWEyNzQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9y
aXNjdi9LY29uZmlnCj4gQEAgLTE1MSw2ICsxNTEsNyBAQCBjb25maWcgUklTQ1YKPiAgICAgICAg
IHNlbGVjdCBIQVZFX0FSQ0hfVVNFUkZBVUxURkRfV1AgaWYgNjRCSVQgJiYgTU1VICYmIFVTRVJG
QVVMVEZEICYmIFJJU0NWX0lTQV9TVlJTVzYwVDU5Qgo+ICAgICAgICAgc2VsZWN0IEhBVkVfQVJD
SF9WTUFQX1NUQUNLIGlmIE1NVSAmJiA2NEJJVAo+ICAgICAgICAgc2VsZWN0IEhBVkVfQVNNX01P
RFZFUlNJT05TCj4gKyAgICAgICBzZWxlY3QgSEFWRV9CVUlMRFRJTUVfTUNPVU5UX1NPUlQKPiAg
ICAgICAgIHNlbGVjdCBIQVZFX0NPTlRFWFRfVFJBQ0tJTkdfVVNFUgo+ICAgICAgICAgc2VsZWN0
IEhBVkVfREVCVUdfS01FTUxFQUsKPiAgICAgICAgIHNlbGVjdCBIQVZFX0RNQV9DT05USUdVT1VT
IGlmIE1NVQo+IC0tCj4gMi41MC4xCj4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
