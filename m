Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E8DE7E35F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 09:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3bjs1lNlsMYe3NCHCFQbhtf2gVcS09oUq1o7YFbKtoU=; b=WiWf5oLHzjQn6K
	xh2X4qreHN0g1ZxnYXeA7zZDuY9l90JVYTLnS9MXbUEws2cCpDevIABhSgVGPShxGGzWXfPsqPYWI
	0SYdP9sHJO55ieGHpKKMBBsahGIjgchKNKiR/iey+MSq0MSdifzPI34AL/noYxfhPc69pxwqHTcgY
	oLXJtcTZDBjKOzSzJTsfu5SAyolA9S7TC2+z5qo82Y5Pqb2PBmygcvwvjPS00UoSvkaugevui5quD
	45Z6ukUC08E4eCQI+sOcDEGxJa94PaGz9XuNi+gStefJ55p/2ObOkFzzTXH+nqgBaoRU32XpAYpTC
	pMPpUxPAkz7eqUgWeEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8b2l-00000001pZt-1uvS;
	Fri, 03 Apr 2026 09:42:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8b2j-00000001pYh-0eXQ
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 09:42:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F06F44514
	for <linux-riscv@lists.infradead.org>; Fri,  3 Apr 2026 09:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53515C2BCB7
	for <linux-riscv@lists.infradead.org>; Fri,  3 Apr 2026 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775209340;
	bh=GdA5Glxo6eWa4W/ST2bpPz/cVuoZBhUidEmnv04LsNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sr5PK5c3V49Uy3VYwCD9vYigDLKR4gGc2AtzThKwNAfYfobhRzZIrB/5r8WmJwWkT
	 P89Js6i/LZQeljSwc7IprHEtqzVFHul50y3lde1GlIS/U++wLo7KEi9z930RS9aHeF
	 91xnhm2780BYhzNKVsATmZMERd5V6zrIFTMuI4ixwYaHjs8lOtHPCdC/6ijQ0osxUH
	 B5iTnHwYG8Oye9w9N/ITXuANXU5zSiPn7gqaFQKBhAkjZyIS3xb+lIlmSYK5AMqhKC
	 /RdWw6cCzD+axy4JLFVzNLJvJrCSED4ggnr7TK+IikoXn1xCxMEST8sO2hZXXUd5IX
	 nP6hq6G84PujA==
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so17429215e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 02:42:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJ8JTlNNmS11VUapbwz1irP02AxWOfm4Ty1/zYwpLs7Gs8JgB03XOJ+wN5XGI/HYZRTM7yfHusHZoNgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQYs+mq9Y0PL+Ztih0di5US+ZK4/PC5GwcY2HRsI5h1yX43qMN
	SzlPmBP/ldh+su5ybAi3h70YDoMZszCMEBBO+BxX7gdJoqWYJLGfH3BBe4HuRJNJt3Z5YtlCHPf
	C899FdWBxtS261gbdsdWmNTyKOpv9E6Y=
X-Received: by 2002:a05:600d:1:b0:485:50ac:b8cf with SMTP id
 5b1f17b1804b1-488993be280mr33529815e9.0.1775209338532; Fri, 03 Apr 2026
 02:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260402112250.2138-1-kprateek.nayak@amd.com> <20260402112250.2138-5-kprateek.nayak@amd.com>
In-Reply-To: <20260402112250.2138-5-kprateek.nayak@amd.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 3 Apr 2026 17:42:06 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSDg7JWHGS5E_OQWibFRTrY5bUuoOntmVE-MCt+FawLZw@mail.gmail.com>
X-Gm-Features: AQROBzAUeD-7TzkN4Yu-x7VvnBwCOKoW_8ACkDGIhwIZtFzQ_Q59qb4XpopnZvw
Message-ID: <CAJF2gTSDg7JWHGS5E_OQWibFRTrY5bUuoOntmVE-MCt+FawLZw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] riscv/runtime-const: Introduce runtime_const_mask_32()
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, David Laight <david.laight.linux@gmail.com>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Charlie Jenkins <charlie@rivosinc.com>, Charles Mirabile <cmirabil@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_024221_231975_9D27B74F 
X-CRM114-Status: GOOD (  19.82  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCA3OjM54oCvUE0gSyBQcmF0ZWVrIE5heWFrIDxrcHJhdGVl
ay5uYXlha0BhbWQuY29tPiB3cm90ZToKPgo+IEZ1dGV4IGhhc2ggY29tcHV0YXRpb24gcmVxdWly
ZXMgYSBtYXNrIG9wZXJhdGlvbiB3aXRoIHJlYWQtb25seSBhZnRlcgo+IGluaXQgZGF0YSB0aGF0
IHdpbGwgYmUgY29udmVydGVkIHRvIGEgcnVudGltZSBjb25zdGFudCBpbiB0aGUgc3Vic2VxdWVu
dAo+IGNvbW1pdC4KPgo+IEludHJvZHVjZSBydW50aW1lX2NvbnN0X21hc2tfMzIgdG8gZnVydGhl
ciBvcHRpbWl6ZSB0aGUgbWFzayBvcGVyYXRpb24KPiBpbiB0aGUgZnV0ZXggaGFzaCBjb21wdXRh
dGlvbiBob3QgcGF0aC4gR0NDIGdlbmVyYXRlcyBhOgo+Cj4gICBsdWkgICBhMCwgMHgxMjM0NiAg
ICAgICAjIHVwcGVyOyArMHg4MDAgdGhlbiA+PjEyIGZvciBjb3JyZWN0IHJvdW5kaW5nCj4gICBh
ZGRpICBhMCwgYTAsIDB4Njc4ICAgICAjIGxvd2VyIDEyIGJpdHMKPiAgIGFuZCAgIGExLCBhMSwg
YTAgICAgICAgICMgYTEgPSBhMSAmIGEwCj4KPiBwYXR0ZXJuIHRvIHRhY2tsZSBhcmJpdHJhcnkg
MzItYml0IG1hc2tzIGFuZCB0aGUgc2FtZSB3YXMgYWxzbyBzdWdnZXN0ZWQKPiBieSBDbGF1ZGUg
d2hpY2ggaXMgaW1wbGVtZW50ZWQgaGVyZS4gVGhlIChfX21hc2sgJiB2YWwpIG9wZXJhdGlvbiBp
cwo+IGludGVudGlvbmFsbHkgcGxhY2VkIG91dHNpZGUgb2YgYXNtIGJsb2NrIHRvIGFsbG93IGNv
bXBpbGVycyB0byBmdXJ0aGVyCj4gb3B0aW1pemUgaXQgaWYgcG9zc2libGUuCj4KPiBfX3J1bnRp
bWVfZml4dXBfcHRyKCkgYWxyZWFkeSBwYXRjaGVzIGEgImx1aSArIGFkZGkiIHNlcXVlbmNlIHdo
aWNoIGhhcwo+IGJlZW4gcmV1c2VkIHRvIHBhdGNoIHRoZSBzYW1lIHNlcXVlbmNlIGZvciBfX3J1
bnRpbWVfZml4dXBfbWFzaygpLgo+Cj4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtc29ubmV0
LTQtNQo+IFNpZ25lZC1vZmYtYnk6IEsgUHJhdGVlayBOYXlhayA8a3ByYXRlZWsubmF5YWtAYW1k
LmNvbT4KPiAtLS0KPiBDaGFuZ2Vsb2cgdjIuLnYzOgo+Cj4gbyBNb3ZlZCB0aGUgIiYiIG9wZXJh
dGlvbiBvdXRzaWRlIHRoZSBpbmxpbmUgYXNtIGJsb2NrIHRvIGFsbG93IGZvcgo+ICAgY29tcGls
ZXJzIHRvIGZ1cnRoZXIgb3B0aW1pemUgaXQgaWYgcG9zc2libGUuIChCYXNlZCBvbiBEYXZpZCdz
Cj4gICBjb21tZW50IG9uIEFSTTY0IGJpdHMpLgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3J1bnRpbWUtY29uc3QuaCB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3J1bnRpbWUtY29uc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcnVudGlt
ZS1jb25zdC5oCj4gaW5kZXggZDc2NmUyYjllNmRmLi44NWVmYmE4ZWNmMTIgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9ydW50aW1lLWNvbnN0LmgKPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3J1bnRpbWUtY29uc3QuaAo+IEBAIC0xNTMsNiArMTUzLDIyIEBACj4g
ICAgICAgICBfX3JldDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiAgfSkKPgo+ICsjZGVmaW5lIHJ1bnRpbWVfY29uc3RfbWFza18zMih2YWwsIHN5
bSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArKHsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAg
dTMyIF9fbWFzazsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gKyAgICAgICBhc21faW5saW5lKCIub3B0aW9uIHB1c2hcblx0IiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgIi5vcHRpb24gbm9ydmNcblx0IiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAiMTpcdCIgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICJsdWkg
ICAgJVtfX21hc2tdLDB4ODlhYmRcblx0IiAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAg
ICAgICAgImFkZGkgICAlW19fbWFza10sJVtfX21hc2tdLC0weDIxMVxuXHQiICAgICAgICAgXApS
ZWYgaW5jbHVkZS91YXBpL2xpbnV4L3JlYm9vdC5oOgojZGVmaW5lIExJTlVYX1JFQk9PVF9DTURf
Q0FEX09OIDB4ODlBQkNERUYKCiNkZWZpbmUgUlVOVElNRV9NQUdJQyAweDg5QUJDREVGCgoibHVp
ICVbX19tYXNrXSwgJSVoaShSVU5USU1FX01BR0lDKVxuXHQiCiJhZGRpICVbX19tYXNrXSwgJVtf
X21hc2tdLCAlJWxvKFJVTlRJTUVfTUFHSUMpXG5cdCIKCgo+ICsgICAgICAgICAgICAgICAiLm9w
dGlvbiBwb3Bcblx0IiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAg
ICAgICAgICIucHVzaHNlY3Rpb24gcnVudGltZV9tYXNrXyIgI3N5bSAiLFwiYVwiXG5cdCIgIFwK
PiArICAgICAgICAgICAgICAgIi5sb25nIDFiIC0gLlxuXHQiICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAiLnBvcHNlY3Rpb24iICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIDogW19fbWFza10gIj1yIiAo
X19tYXNrKSk7ICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIChfX21hc2sgJiB2YWwp
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICt9KQo+ICsKPiAg
I2RlZmluZSBydW50aW1lX2NvbnN0X2luaXQodHlwZSwgc3ltKSBkbyB7ICAgICAgICAgICAgICAg
ICAgICAgXAo+ICAgICAgICAgZXh0ZXJuIHMzMiBfX3N0YXJ0X3J1bnRpbWVfIyN0eXBlIyNfIyNz
eW1bXTsgICAgICAgICAgICBcCj4gICAgICAgICBleHRlcm4gczMyIF9fc3RvcF9ydW50aW1lXyMj
dHlwZSMjXyMjc3ltW107ICAgICAgICAgICAgIFwKPiBAQCAtMjU2LDYgKzI3MiwxMiBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgX19ydW50aW1lX2ZpeHVwX3NoaWZ0KHZvaWQgKndoZXJlLCB1bnNpZ25l
ZCBsb25nIHZhbCkKPiAgICAgICAgIG11dGV4X3VubG9jaygmdGV4dF9tdXRleCk7Cj4gIH0KPgo+
ICtzdGF0aWMgaW5saW5lIHZvaWQgX19ydW50aW1lX2ZpeHVwX21hc2sodm9pZCAqd2hlcmUsIHVu
c2lnbmVkIGxvbmcgdmFsKQo+ICt7Cj4gKyAgICAgICBfX3J1bnRpbWVfZml4dXBfMzIod2hlcmUs
IHdoZXJlICsgNCwgdmFsKTsKPiArICAgICAgIF9fcnVudGltZV9maXh1cF9jYWNoZXMod2hlcmUs
IDIpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW5saW5lIHZvaWQgcnVudGltZV9jb25zdF9maXh1cCh2
b2lkICgqZm4pKHZvaWQgKiwgdW5zaWduZWQgbG9uZyksCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB2YWwsIHMzMiAqc3RhcnQsIHMzMiAqZW5k
KQo+ICB7Cj4gLS0KPiAyLjM0LjEKPgo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
