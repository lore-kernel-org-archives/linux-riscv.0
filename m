Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B1AE77188
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 02:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E64UaN/zJBf7YKHFFX2c5jXwDkCMt9tQ1bIiPkecBGg=; b=Eyfh12j/AIGBsX
	PYhpclZPWxkO+1s+NM3/GRcFMiDn0SJBWNlXCaTQR6m2A9UsDgnWl38p9i3mxNKkEG3aYmwilgvx4
	I2J3GRYc5F5O/ACFuQ7FjPxITOFbeT/UKfKbrNVyHUt4Z84yqXKv+o/Otkg6lDcfLZBavwqdgxdso
	EO8dINzXlJcQ51H4Ggen7qhwrY4VRAtmjyMdrGozBsX3Msx196FoPlN+zMODBtzH+PQeHBpQKm+4x
	+po4AxgLJrdEx96dNcWIZT3qTMP3fJWaCZO8i4tY8YIvvyM571k/BzA4Af0G5wXAD4NvWjdkFNT+C
	706XAPlaRuO0Uy9lSxuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQyb-0000000HYqV-3gWR;
	Sat, 11 Jan 2025 02:11:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQxa-0000000HYlJ-31c0
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 02:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 414405C57F0
	for <linux-riscv@lists.infradead.org>; Sat, 11 Jan 2025 02:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0652C4CEE0
	for <linux-riscv@lists.infradead.org>; Sat, 11 Jan 2025 02:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736561443;
	bh=mGzRH7uIpM9oP6ps1cDHZR6Jg8yLX1jT4/DSoE7sAso=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FjUqCiOwMLrWHtelAuzN5edLInpMxwfO8lBENFEYRkTIdscXCLE4yA0F8EEhz9Gzr
	 jrw7NwvuocqB7MlRrzoAePOIbvm0nWGYoS4qOtIQjyXqDoxZVDCEycgQWvhZh7EfhN
	 PGY7lzhR+ZhnGbUWLsR3CtQia/7NKRU0d8WvicGqiplFaah5eSHheIa+6q2Pc6oLiN
	 bYfY4QfNUgDyu1fGqflpenkKev0WuBxfJjuxTVUMlx3eyV9Px3QOU8qvKYvLzp9Ex9
	 qdWoEaUpyPCZO15221CgT4TM4iu2hPZPT1IkGInT/mPKHhiHvvMsL3ncVoCUJ5D3pA
	 +AJd85N0uJNbA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401c52000dso2654805e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 18:10:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaP8noFMqMvfbv612DtLyOarATvzJP6jfzsM8X05ncLL3BirNBObAjBWFou8SAHAbZwFDKRgGSKmorcA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+waOUiNxhYnjJco0D220wCXuSwM5nQaX2ldlbCm6vjrXENeDL
	4ND+pMASKuRiU3eSI0jKzczw6m6aOXGzVjOluI+eSAZn0NwOXmW0uU/Zp59q/3TUhWf2P4dTAmJ
	vCzJpVxFnM1gHjbzUbigyVrTSM9A=
X-Google-Smtp-Source: AGHT+IFl9WseL/aarJcF6pbUOedSlHG3Cs8TbNE6IpIW0JRKQJ0ZyIW3pWCvnyTLYTj5smM1UXAocMZOhlZBTqLlzZE=
X-Received: by 2002:a05:6512:b98:b0:53e:94f9:8c86 with SMTP id
 2adb3069b0e04-542848162f1mr4040192e87.35.1736561442586; Fri, 10 Jan 2025
 18:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20250110082744.457067-2-ardb+git@google.com>
In-Reply-To: <20250110082744.457067-2-ardb+git@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 11:10:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQtpahFZ+pEWO=XfQMi+19QjspqyL3qexW8U28f7mbojQ@mail.gmail.com>
X-Gm-Features: AbW1kvbrxKRMFTdoeyMM3FkNPmqQKbq6uIxbYC1TBxHZgLOZPTYpsCuRzyt1JLs
Message-ID: <CAK7LNAQtpahFZ+pEWO=XfQMi+19QjspqyL3qexW8U28f7mbojQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Strip runtime const RELA sections correctly
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_181047_244190_35445951 
X-CRM114-Status: GOOD (  16.86  )
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

T24gRnJpLCBKYW4gMTAsIDIwMjUgYXQgNToyOOKAr1BNIEFyZCBCaWVzaGV1dmVsIDxhcmRiK2dp
dEBnb29nbGUuY29tPiB3cm90ZToKPgo+IEZyb206IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5l
bC5vcmc+Cj4KPiBEdWUgdG8gdGhlIGZhY3QgdGhhdCBydW50aW1lIGNvbnN0IEVMRiBzZWN0aW9u
cyBhcmUgbmFtZWQgd2l0aG91dCBhCj4gbGVhZGluZyBwZXJpb2Qgb3IgZG91YmxlIHVuZGVyc2Nv
cmUsIHRoZSBSU1RSSVAgbG9naWMgdGhhdCByZW1vdmVzIHRoZQo+IHN0YXRpYyBSRUxBIHNlY3Rp
b25zIGZyb20gdm1saW51eCBmYWlscyB0byBpZGVudGlmeSB0aGVtLiBUaGlzIHJlc3VsdHMKPiBp
biBhIHNpdHVhdGlvbiBsaWtlIGJlbG93LCB3aGVyZSBzb21lIHNlY3Rpb25zIHRoYXQgd2VyZSBz
dXBwb3NlZCB0byBnZXQKPiByZW1vdmVkIGFyZSBsZWZ0IGJlaGluZC4KPgo+ICAgW05yXSBOYW1l
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVHlwZSAgICAgICAgICAgIEFkZHJlc3MgICAg
ICAgICAgT2ZmICAgICBTaXplICAgRVMgRmxnIExrIEluZiBBbAo+Cj4gICBbNThdIHJ1bnRpbWVf
c2hpZnRfZF9oYXNoX3NoaWZ0ICAgICAgICBQUk9HQklUUyAgICAgICAgZmZmZmZmZmY4MzUwMGY1
MCAyOTAwZjUwIDAwMDAxNCAwMCAgIEEgIDAgICAwICAxCj4gICBbNTldIC5yZWxhcnVudGltZV9z
aGlmdF9kX2hhc2hfc2hpZnQgICBSRUxBICAgICAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCA1NWI2
ZjAwIDAwMDA3OCAxOCAgIEkgNzAgIDU4ICA4Cj4gICBbNjBdIHJ1bnRpbWVfcHRyX2RlbnRyeV9o
YXNodGFibGUgICAgICBQUk9HQklUUyAgICAgICAgZmZmZmZmZmY4MzUwMGY2OCAyOTAwZjY4IDAw
MDAxNCAwMCAgIEEgIDAgICAwICAxCj4gICBbNjFdIC5yZWxhcnVudGltZV9wdHJfZGVudHJ5X2hh
c2h0YWJsZSBSRUxBICAgICAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCA1NWI2Zjc4IDAwMDA3OCAx
OCAgIEkgNzAgIDYwICA4Cj4gICBbNjJdIHJ1bnRpbWVfcHRyX1VTRVJfUFRSX01BWCAgICAgICAg
ICBQUk9HQklUUyAgICAgICAgZmZmZmZmZmY4MzUwMGY4MCAyOTAwZjgwIDAwMDIzOCAwMCAgIEEg
IDAgICAwICAxCj4gICBbNjNdIC5yZWxhcnVudGltZV9wdHJfVVNFUl9QVFJfTUFYICAgICBSRUxB
ICAgICAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCA1NWI2ZmYwIDAwMGQ1MCAxOCAgIEkgNzAgIDYy
ICA4Cj4KPiBTbyB0d2VhayB0aGUgbWF0Y2ggZXhwcmVzc2lvbiB0byBzdHJpcCBhbGwgc2VjdGlv
bnMgc3RhcnRpbmcgd2l0aCAucmVsLgo+IFdoaWxlIGF0IGl0LCBjb25zb2xpZGF0ZSB0aGUgbG9n
aWMgdXNlZCBieSBSSVNDLVYsIHMzOTAgYW5kIHg4NiBpbnRvIGEKPiBzaW5nbGUgc2hhcmVkIE1h
a2VmaWxlIGxpYnJhcnkgY29tbWFuZC4KPgo+IENjOiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtl
cm5lbC5vcmc+Cj4gQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGlu
dXgtczM5MEB2Z2VyLmtlcm5lbC5vcmcKPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvQ0FIay09d2prM3luam9tTnZGTjhqZjlBMWs9cVNjPUpGRjU5MVcwMHVYai1xcU5VeFBRQG1h
aWwuZ21haWwuY29tLwo+IFNpZ25lZC1vZmYtYnk6IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5l
bC5vcmc+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvTWFrZWZpbGUucG9zdGxpbmsgfCA5ICstLS0tLS0t
LQo+ICBhcmNoL3MzOTAvTWFrZWZpbGUucG9zdGxpbmsgIHwgNSAtLS0tLQo+ICBhcmNoL3g4Ni9N
YWtlZmlsZS5wb3N0bGluayAgIHwgNSAtLS0tLQo+ICBzY3JpcHRzL01ha2VmaWxlLmxpYiAgICAg
ICAgIHwgMyArKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE4IGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUucG9zdGxpbmsgYi9h
cmNoL3Jpc2N2L01ha2VmaWxlLnBvc3RsaW5rCj4gaW5kZXggODI5YjlhYmM5MWY2Li42NTY1MmZk
NmEyNTIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9NYWtlZmlsZS5wb3N0bGluawo+ICsrKyBi
L2FyY2gvcmlzY3YvTWFrZWZpbGUucG9zdGxpbmsKPiBAQCAtMTksMTMgKzE5LDYgQEAgaWZkZWYg
Q09ORklHX1JFTE9DQVRBQkxFCj4gIHF1aWV0X2NtZF9jcF92bWxpbnV4X3JlbG9jcyA9IENQUkVM
ICAgdm1saW51eC5yZWxvY3MKPiAgY21kX2NwX3ZtbGludXhfcmVsb2NzID0gY3Agdm1saW51eCB2
bWxpbnV4LnJlbG9jcwo+Cj4gLXF1aWV0X2NtZF9yZWxvY3Nfc3RyaXAgPSBTVFJJUFJFTCAkQAo+
IC1jbWRfcmVsb2NzX3N0cmlwID0gJChPQkpDT1BZKSAgIC0tcmVtb3ZlLXNlY3Rpb249Jy5yZWwu
KicgICAgICAgXAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tcmVtb3ZlLXNl
Y3Rpb249Jy5yZWxfXyonICAgICAgXAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tcmVtb3ZlLXNlY3Rpb249Jy5yZWxhLionICAgICAgXAo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tcmVtb3ZlLXNlY3Rpb249Jy5yZWxhX18qJyAkQAo+IC1lbmRpZgo+IC0K
PiAgIyBgQHRydWVgIHByZXZlbnRzIGNvbXBsYWludCB3aGVuIHRoZXJlIGlzIG5vdGhpbmcgdG8g
YmUgZG9uZQo+Cj4gIHZtbGludXg6IEZPUkNFCj4gQEAgLTMzLDcgKzI2LDcgQEAgdm1saW51eDog
Rk9SQ0UKPiAgaWZkZWYgQ09ORklHX1JFTE9DQVRBQkxFCj4gICAgICAgICAkKGNhbGwgaWZfY2hh
bmdlZCxyZWxvY3NfY2hlY2spCj4gICAgICAgICAkKGNhbGwgaWZfY2hhbmdlZCxjcF92bWxpbnV4
X3JlbG9jcykKPiAtICAgICAgICQoY2FsbCBpZl9jaGFuZ2VkLHJlbG9jc19zdHJpcCkKPiArICAg
ICAgICQoY2FsbCBpZl9jaGFuZ2VkLHN0cmlwX3JlbG9jcykKCkJUVywgd2hlbiBpZl9jaGFuZ2Vk
IGFwcGVhcnMgbXVsdGlwbGUgdGltZXMgaW4gdGhlIHNhbWUgdGFyZ2V0LAppdCBpcyBhbHdheXMg
YSBzaWduIG9mIGEgYnVnLgoKU2VlIHRoZXNlIGNvbW1pdHM6CgpiYjgxOTU1ZmQ0YTQ5ZmZmZGQ4
NmQ1MGFmZDBjMWYyZWVhMDQ0YzA1CjkyYTQ3Mjg2MDhhOGZkMjI4YzU3MmJjOGZmNTBkZDk4YWEw
ZGRmMmEKCgpBbnl3YXksIGlmX2NoYW5nZWQgZG9lcyBub3Qgd29yayBpbiBhcmNoLyovTWFrZWZp
bGUucG9zdGxpbmssCmFuZCB0aGlzIGlzIGNvbXBsZXRlbHkgYnJva2VuLgoKCgoKCgoKCi0tIApC
ZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
