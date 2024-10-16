Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3734FD2A52C
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 15:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m34p8L0bAS4mlhyddLsLkiU0vA1X+DxdGOEDcwAFOfo=; b=3OXSrbHt1l1Jjg
	KF8TP4MDi61i9HqUGzI2ql1B7ReTVv/x1u80NJhMPv/Nv8ItRLn61jyb9kqSj27x0g26GFzacOw9L
	0GuLS6D7BeSQgLOdSOMhPunJENREOwNeRFwAtp2bynQno7Ilo0NsXYB6tA/OJzxw4A1NjR/ucw/hd
	PfwytFQ2I6JsGAS8SkMYa2JPL7ReKtsVIiUUnjO/ADlLBQSyFiM/i/om80HqHNy+o2s9nLvy17FAU
	S5QrO7TbyzWP3RMJQ6870MgQXX7FvLNXMkTZi+7G0iwBBy9bYLxFtLlgptqpsPoXdLDqKh72gTcb0
	lzaXOoUBHS3uzBUcyRSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t164X-0000000CGjZ-1F3h;
	Wed, 16 Oct 2024 15:36:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t15ys-0000000CFRo-0dxu
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 15:30:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43158625112so133765e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 08:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1729092632; x=1729697432; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fu5iRgYgRkj80j9SZ3py/vD5I5PfSyJqY/THhty4v9w=;
        b=LGhX54zMSisY00HMeObj8CO/r6UHsyw41rlFmEOLp+YTXW5h8/At52HFYJX0S5mSax
         M0AcpQ8qf8IbqyfFFfLbeYwpHp+pS9bN8VbKZW/LnZzP85Wur2MQ35IfgcBC6+05uIOd
         5xClWTAFcxVHVMJcU/fw/Ha3jJ9JKrzcpHmp7S6/SKWB7ELRYfHK+ZkeccY/DAjov7WF
         OcEzABkm+qogy1bPM/mjFr76+RXh5MvEHs4u022H0HjqcA+hxGeUlKmWaMxR+/d2Ecol
         tCWtBuIvWbPJ2ZKOvx6NxCAWanJMyJITMg/kg6VdXEfM+0rne3AAoHY7Lzkd91TDY1qL
         Ed9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729092632; x=1729697432;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fu5iRgYgRkj80j9SZ3py/vD5I5PfSyJqY/THhty4v9w=;
        b=QR4qiO4A4hRbj/Er9bfaU0Hk8WHjeASmXVCm3Rg0ki3n3ZifoYNo+xncBqLuTWNuQs
         4tgbV9GOocpu+YkeR3b8BJpcbIXwRL4XSDtqEZSWVYJbjd9x/9bSJBfh5P+wRxWfdTzU
         OBQoVolMPCOgJxDUjC8Wid1yZ9leqaLABwSwqJVVFVm2xQSetAazWu1zucm727XY4obi
         qqupVsUAit7R3Kj93oDao0X2H2ldslXEDY3GkQwgE/EHnPTC+xQPlv9W/CM0COzIZbCi
         t/fZicXNplohiy8adUCkiwggatWo4UHPSXpbDSo/gD1SLtBS+1HUzCZxN/K/OumdLHuN
         ooCw==
X-Forwarded-Encrypted: i=1; AJvYcCU+H0iM3iBQQZ72JElXmOiQyQ5qsE/ppwubew8wizfdmeiMkat/xlEtcJD1P0KzEXIoDdo4f7UcJ4n6Fg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN3TUpN/f+TZhzIyvSQmy9G0gFj0+vxp/EpzcWSAtdtk+EYie0
	HGk+hJ1L+zkcbuuOhhHk8A8RpmKR+WsoMIIclQkICfGR5WqR8Bs3mYIMlNM2/iw=
X-Google-Smtp-Source: AGHT+IGN4iO/Z4ByP5TditNqCj7XQIWWSN8JvAA6/qnWa/dt+s8Eo87ZFfp0PaLsleCGBhJWo3ulhA==
X-Received: by 2002:a05:600c:1c9d:b0:430:57f1:d6d with SMTP id 5b1f17b1804b1-431255d5099mr135853665e9.1.1729092631642;
        Wed, 16 Oct 2024 08:30:31 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f569aadsm52179615e9.15.2024.10.16.08.30.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2024 08:30:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH -fixes] riscv: Do not use fortify in early code
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <3fe1e610-c863-4fbf-85cb-6e83ba7684af@ghiti.fr>
Date: Wed, 16 Oct 2024 16:30:20 +0100
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko@sntech.de>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Jason Montleon <jmontleo@redhat.com>,
 stable@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
Message-Id: <26E1A34A-CC24-4D6B-9C12-782C837A91E1@jrtc27.com>
References: <20241009072749.45006-1-alexghiti@rivosinc.com>
 <1CA19FB3-C1E3-4C2F-A4FB-05B69EC66D2F@jrtc27.com>
 <3fe1e610-c863-4fbf-85cb-6e83ba7684af@ghiti.fr>
To: Alexandre Ghiti <alex@ghiti.fr>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_083034_242299_93E24EA7 
X-CRM114-Status: GOOD (  27.39  )
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

T24gMTYgT2N0IDIwMjQsIGF0IDEyOjI2LCBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+
IHdyb3RlOgo+IAo+IEhpIEplc3NpY2EsCj4gCj4gT24gMTYvMTAvMjAyNCAwMDowNCwgSmVzc2lj
YSBDbGFya2Ugd3JvdGU6Cj4+IE9uIDkgT2N0IDIwMjQsIGF0IDA4OjI3LCBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Pj4gRWFybHkgY29kZSBkZXNpZ25h
dGVzIHRoZSBjb2RlIGV4ZWN1dGVkIHdoZW4gdGhlIE1NVSBpcyBub3QgeWV0IGVuYWJsZWQsCj4+
PiBhbmQgdGhpcyBjb21lcyB3aXRoIHNvbWUgbGltaXRhdGlvbnMgKHNlZQo+Pj4gRG9jdW1lbnRh
dGlvbi9hcmNoL3Jpc2N2L2Jvb3QucnN0LCBzZWN0aW9uICJQcmUtTU1VIGV4ZWN1dGlvbiIpLgo+
Pj4gCj4+PiBGT1JUSUZZX1NPVVJDRSBtdXN0IGJlIGRpc2FibGVkIHRoZW4gc2luY2UgaXQgY2Fu
IHRyaWdnZXIga2VybmVsIHBhbmljcwo+Pj4gYXMgcmVwb3J0ZWQgaW4gWzFdLgo+Pj4gCj4+PiBS
ZXBvcnRlZC1ieTogSmFzb24gTW9udGxlb24gPGptb250bGVvQHJlZGhhdC5jb20+Cj4+PiBDbG9z
ZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBSkRfYlBKZXM0UWhtWFk1
ZjYzR0hWOUI5SEZrU0NvYVpqay1xQ1QyTkdTN1E5SE9EZ0BtYWlsLmdtYWlsLmNvbS8gWzFdCj4+
PiBGaXhlczogYTM1NzA3YzNkODUwICgicmlzY3Y6IGFkZCBtZW1vcnktdHlwZSBlcnJhdGEgZm9y
IFQtSGVhZCIpCj4+PiBGaXhlczogMjZlN2FhY2I4M2RmICgicmlzY3Y6IEFsbG93IHRvIGRvd25n
cmFkZSBwYWdpbmcgbW9kZSBmcm9tIHRoZSBjb21tYW5kIGxpbmUiKQo+Pj4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKPj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4KPj4gSXMgdGhlIHByb2JsZW0gaW4gWzFdIG5vdCBqdXN0IHRoYXQg
dGhlIGVhcmx5IGJvb3QgcGF0aCB1c2VzIG1lbWNweSBvbgo+PiB0aGUgcmVzdWx0IG9mIEFMVF9P
TERfUFRSLCB3aGljaCBpcyBhIHdpbGRseSBvdXQtb2YtYm91bmRzIHBvaW50ZXIgZnJvbQo+PiB0
aGUgY29tcGlsZXLigJlzIHBlcnNwZWN0aXZlPyBJZiBzbywgaXQgd291bGQgc2VlbSBiZXR0ZXIg
dG8gdXNlCj4+IHVuc2FmZV9tZW1jcHkgZm9yIHRoYXQgb25lIGNhbGwgc2l0ZSByYXRoZXIgdGhh
biB1c2UgdGhlIGJpZwo+PiBfX05PX0ZPUlRJRlkgaGFtbWVyLCBzdXJlbHk/Cj4gCj4gCj4gTm90
IHN1cmUgd2h5IGZvcnRpZnkgY29tcGxhaW5zIGhlcmUsIGFuZCBJIGhhdmUganVzdCBzZWVuIHRo
YXQgSSBmb3Jnb3QgdG8gY2MgS2VlcyAoZG9uZSBub3cpLgo+IAo+IAo+PiAKPj4gUHJlc3VtYWJs
eSB0aGUgbm9uLWVhcmx5IHBhdGggaXMganVzdCBhcyBiYWQgdG8gdGhlIGNvbXBpbGVyLCBidXQg
d29ya3MKPj4gYmVjYXVzZSBwYXRjaF90ZXh0X25vc3luYyBpc27igJl0IGluc3RydW1lbnRlZCwg
c28gdGhhdCB3b3VsZCBqdXN0IGFsaWduCj4+IHRoZSB0d28uCj4+IAo+PiBHZXR0aW5nIHRoZSBp
bXBsZW1lbnRhdGlvbiB0byBub3QgYmUgc2lsZW50IG9uIGZhaWx1cmUgZHVyaW5nIGVhcmx5Cj4+
IGJvb3Qgd291bGQgYWxzbyBiZSBhIGdvb2QgaWRlYSwgYnV0IGl04oCZcyBzdXJlbHkgYmV0dGVy
IHRvIGhhdmUKPj4gRk9SVElGWV9TT1VSQ0UgZW5hYmxlZCB3aXRoIG5vIG91dHB1dCBmb3IgcG9z
aXRpdmVzIHRoYW4gZGlzYWJsZSB0aGUKPj4gY2hlY2tpbmcgaW4gdGhlIGZpcnN0IHBsYWNlIGFu
ZCByaXNrIHVuY2F1Z2h0IGNvcnJ1cHRpb24uCj4gCj4gCj4gSSdtIG5vdCBzdXJlIHRvIGZvbGxv
dzogeW91IHByb3Bvc2UgdG8gdXNlIHVuc2FmZV9tZW1jcHkoKSBpbnN0ZWFkIG9mIGRpc2FibGlu
ZyBmb3J0aWZ5IGVudGlyZWx5LCBzbyB3ZSB3b3VsZCBub3QgZ2V0IGFueSB3YXJuaW5nIGluIGNh
c2Ugb2YgZmFpbHVyZSBhbnl3YXkgcmlnaHQ/CgpZZXMsIGJ1dCBuby4gVGhlIHBvaW50IGlzIHRv
IGRpc2FibGUgaXQgb25seSBmb3IgdGhlIHByb2JsZW1hdGljCmZ1bmN0aW9uIGNhbGwsIG5vdCB0
aGUgZW50aXJlIGZpbGUsIHNvIGFueSBvdGhlciBmb3J0aWZpYWJsZSBmdW5jdGlvbgpjYWxscyB0
aGF0IGV4aXN0IG5vdyBvciBpbiB0aGUgZnV0dXJlIGluIHRoYXQgZmlsZSBkb27igJl0IGdldCBp
dAp1bm5lY2Vzc2FyaWx5IGRpc2FibGVkIHRvby4KCj4gT3IgZG8geW91IHByb3Bvc2UgdG8gbW9k
aWZ5IHRoZSBmb3J0aWZ5IGNvZGUgdG8gc29tZWhvdyBwcmludCBhIHdhcm5pbmc/IElmIHRoZSBs
YXR0ZXIsIGl0J3MgaGFyZCB0aGlzIHNvb24gaW4gdGhlIGJvb3QgcHJvY2VzcyAod2hlcmUgdGhl
IG1tdSBpcyBkaXNhYmxlZCkgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIHByaW50aW5nIHdhcm5pbmcg
cGF0aCBkb2VzIG5vdCB0cnkgdG8gYWNjZXNzIGFueSB2aXJ0dWFsIGFkZHJlc3MgKHdoaWNoIGlz
IHdoeSB0aGUgYm9vdCBmYWlsZWQgaW4gdGhlIGZpcnN0IHBsYWNlKSBidXQgbWF5YmUgS2VlcyBo
YXMgYW4gaWRlYS4KCk5vdCBmb3IgdGhpcyBwYXRjaCwganVzdCBvYnNlcnZpbmcgaXQgd291bGQg
YmUgbmljZSB0byBoYXZlLgoKPiBBbmQgSSBiZWxpZXZlIHRoYXQgZW5hYmxpbmcgZm9ydGlmeSBh
bmQgdXNpbmcgdGhlIHVuc2FmZV8qKCkgdmFyaWFudHMgaXMgZXJyb3ItcHJvbmUgc2luY2Ugd2Un
ZCBoYXZlIHRvIG1ha2Ugc3VyZSB0aGF0IGFsbCB0aGUgImZvcnRpZmllZCIgZnVuY3Rpb25zIHVz
ZWQgaW4gdGhhdCBjb2RlIHVzZSB0aGUgdW5zYWZlXyooKSB2YXJpYW50cy4KCkkgbWVhbiwgdGhh
dOKAmXMgaG93IGFsbCB0aGVzZSB0aGluZ3Mgd29yaywgbm9ybWFsbHk/CgpKZXNzCgo+IFNvIHRv
IG1lLCBpdCdzIHdheSBlYXNpZXIgaW4gdGVybXMgb2YgbWFpbnRlbmFuY2UgdG8ganVzdCBkaXNh
YmxpbmcgZm9ydGlmeS4KPiAKPiBUaGFua3MsCj4gCj4gQWxleAo+IAo+IAo+PiBKZXNzCj4+IAo+
PiAKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
