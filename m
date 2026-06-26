Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BF2CDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73CCxqAjs40KWKhxWc8rMisncmheE7iq+ijZVNO9mkE=; b=Sr8yZPhRLEaU1m
	DptynO2ArFcb8DJy38UN42iuaSm9MMNte3glCRiryNqoxGcLI2Cr6zM92YwzypvEtdNJl7pPPdO4m
	YAt6gYHRHzcXX5KO2eZr8DVOu8lpM5u7kTGKH8mwlrqw1rDAq8+cTUARGg5jaSoONwVtgJ45v2D2R
	0YRmMvknFfjuYqUWCc1Zu2cMISdPYUsARjyOm74UlxsuKQ1ROjtXSOC/bYRSJdKZn37/5CBD5bWvh
	6+Lu14n9OeSZvA70PhyM77XdUZyn2dfWwAwUin3ZAw3284k10UMfvgy+TkGeD3+6JwI2S2DN6BWmd
	1vkBh3G2OStC42fJ1cTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1ad-0000000Al7h-0DvD;
	Fri, 26 Jun 2026 08:07:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1aZ-0000000Al7D-2CbE
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782461221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lIgeO+X2vwzTq4XhASktreFTW3e+NC5uIr2FcOBPz9M=;
	b=JvM55tZMGfmMR6dQ4yue55FqLFWpUBBpUqvswBWbVV36GRShLfiGIICkYBapzt1LactMZ/
	gSfr+SQroUuKLDgeFqeh5lPaQW6iNIB3hZGtzNTALUiWZI1msLAEOsSwz65BzS1h30RygW
	PfBDjT7zuewQk4Gc1DtaSw0beBwClJ0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-qXDkOkEMOZSGaGP1f893LA-1; Fri, 26 Jun 2026 04:04:51 -0400
X-MC-Unique: qXDkOkEMOZSGaGP1f893LA-1
X-Mimecast-MFC-AGG-ID: qXDkOkEMOZSGaGP1f893LA_1782461090
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5aea7213a04so333463e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2026 01:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782461090; x=1783065890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lIgeO+X2vwzTq4XhASktreFTW3e+NC5uIr2FcOBPz9M=;
        b=QVmRrXxTWYhQkDLqmA4Dd+7Z2XpLMuTUhgiH2ioqzSiauGMMXYwzxR41lPIDvK3+na
         8Yb6Upkq08X72g4H9/l+ESux8OSm7BiVnyvrEZ66qS7v9pM2Z1GZ3zkLQt8P49Ad4y2K
         Z86AL7GCbvT0YDzRvPoUU8CVz9oQnPmJpFw8DZ0XsKR3r8JBSm7wX5YoOPZEmKbFap2x
         SUtp8Ht4MZbXAF9k5/LV/VXZ7eEACzxFu/hQGqEzbkz59pi/v2ODhSyCdK0Xg76E1Ln6
         C9E4w1MquMSt7Au3zG0BpZDB/wF8ULVXpTX5as8L5uWgDlHKnSOCNURyz15wNbmSQcJZ
         Q2Wg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+P5cnkMsR5ENnaH/KWKIToVmx96vokW3hHr0CmjkKHDqOZmMcjDyhpjAwtLFfyUKcUwKnDriNM8MSFA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj4ONQ7VG2e3G+5RbNUVEBgzSHQoxx06qt8pZo70iXVrHwT1JI
	XhjQoDsHf5PzoMbWKE+JjkZPdsHYZC1GSIITcSivc8i+osUmoMwdGgDxghrWrIUD36pyzQNO+dQ
	9DnXUKD8MviH/Lgd8cvhY4eMs+waaCsrusu5xMbvr4jTITzWZJAt2Zxr9M+/Ck5hvRbJLhb8rtm
	o+9Sx2gaol2H6UcI7+oZwcHIzNzMMBcFqJ4QphwGwrqhAg
X-Gm-Gg: AfdE7cnsLDIK6l3cQNtIZ07qTKfi2h6J45fSid3mbpHMj6dlTYYDW52xPOn8AgqJsUH
	/ZQv6aSCI8bjPv4ls40+IVtsmnE//z2m+WTtDt4mUbIXVZf/dWaNdiu+2FzSiwUO9ur5MJ1PRCP
	cICnb02ZxCumjqmygPbvb9F4nrzedARibW4wit23wbYuGZgvN6Z64+I+TI/nacharNvw==
X-Received: by 2002:a05:6512:252c:b0:5ae:a822:d095 with SMTP id 2adb3069b0e04-5aea822d1dfmr255347e87.20.1782461089576;
        Fri, 26 Jun 2026 01:04:49 -0700 (PDT)
X-Received: by 2002:a05:6512:252c:b0:5ae:a822:d095 with SMTP id
 2adb3069b0e04-5aea822d1dfmr255335e87.20.1782461089046; Fri, 26 Jun 2026
 01:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260529032739.13264-2-ltao@redhat.com> <CAO7dBbW+LEy8SBGAKcrxEDzK5Xctw-r7ztgnXuURa9g0xntbtQ@mail.gmail.com>
In-Reply-To: <CAO7dBbW+LEy8SBGAKcrxEDzK5Xctw-r7ztgnXuURa9g0xntbtQ@mail.gmail.com>
From: Baoquan He <bhe@redhat.com>
Date: Fri, 26 Jun 2026 16:04:37 +0800
X-Gm-Features: AVVi8CcYdrkpgr8-G7cNCgcpkfh9Qy-n4dIwvNbnG1GCr-0ywSv4JL4rHejIwe0
Message-ID: <CAP_BRoQEM8Re1dT7JNQgO72o50GAnb2y7R1HWPd+E772GVYAJg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix a NULL pointer reference in machine_kexec_prepare
To: Tao Liu <ltao@redhat.com>, kexec@lists.infradead.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zHd5fqT-Em4KVy9r6cEW8E0NKvhTkkXXW8hdvSTI2kE_1782461090
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_010703_655543_6A0B4293 
X-CRM114-Status: GOOD (  20.17  )
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

QWRkIGtleGVjIE1MIHRvIENDLgoKT24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgNzo0NuKAr0FNIFRh
byBMaXUgPGx0YW9AcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBLaW5kbHkgcGluZywgYW55IGNvbW1l
bnRzPwo+Cj4gVGhhbmtzLAo+IFRhbyBMaXUKPgo+IE9uIEZyaSwgTWF5IDI5LCAyMDI2IGF0IDM6
MzXigK9QTSBUYW8gTGl1IDxsdGFvQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IEEgTlVMTCBw
b2ludGVyIHJlZmVyZW5jZSBpc3N1ZSBpcyBub3RpY2VkIGluIHJpc2N2J3MgbWFjaGluZV9rZXhl
Y19wcmVwYXJlLAo+ID4gd2hlcmUgaW1hZ2UtPnNlZ21lbnRbaV0uYnVmIG1pZ2h0IGJlIE5VTEwg
YW5kIGNvcGllZCB1bmNoZWNrZWQuCj4gPgo+ID4gVGhlIE5VTEwgYnVmIGNvbWVzIGZyb20gc2Vj
dXJpdHkvaW50ZWdyaXR5L2ltYS9pbWFfa2V4ZWMuYzoKPiA+IGltYV9hZGRfa2V4ZWNfYnVmZmVy
KCksIHdoZXJlIGtidWYgaXMgYWRkZWQgYnkga2V4ZWNfYWRkX2J1ZmZlcigpLAo+ID4gYnV0IGti
dWYuYnVmZmVyIGlzIE5VTEwuCj4gPgo+ID4gRml4IHRoaXMgYnkgc2ltcGx5IGFkZGluZyBhIGNo
ZWNrIGJlZm9yZSBjb3B5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFRhbyBMaXUgPGx0YW9AcmVk
aGF0LmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYyB8
IDMgKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9tYWNoaW5lX2tleGVjLmMKPiA+IGluZGV4IDIzMDZjZTNlNWYyMi4uZDgxZDU3NmY5Y2I1
IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhlYy5jCj4gPiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMKPiA+IEBAIC00MSw2ICs0MSw5
IEBAIG1hY2hpbmVfa2V4ZWNfcHJlcGFyZShzdHJ1Y3Qga2ltYWdlICppbWFnZSkKPiA+ICAgICAg
ICAgICAgICAgICBpZiAoaW1hZ2UtPnNlZ21lbnRbaV0ubWVtc3ogPD0gc2l6ZW9mKGZkdCkpCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+Cj4gPiArICAgICAgICAgICAg
ICAgaWYgKGltYWdlLT5zZWdtZW50W2ldLmJ1ZiA9PSBOVUxMKQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgY29udGludWU7Cj4gPiArCgpUaGlzIGlzIGEgZ29vZCBmaXgsIG1heWJlIHdlIGNh
biBhZGQgY29kZSBjb21tZW50cyB0byBleHBsYWluIGl0IGFzCmJlbG93LCBqdXN0IGZvciByZWZl
cmVuY2UuCgogICAgICAgICAgICAgICAvKgogICAgICAgICAgICAgICAgKiBTb21lIHNlZ21lbnRz
IChlLmcuIElNQSkgcmVzZXJ2ZSBzcGFjZSBidXQgaGF2ZSBubyBidWZmZXIKICAgICAgICAgICAg
ICAgICogbG9hZGVkIHlldC4gU2tpcCB0aGVtIGFzIHRoZXkgY2Fubm90IGNvbnRhaW4gYW4gRkRU
LgogICAgICAgICAgICAgICAgKi8KQW5kIGlzIHRoZXJlIGFueSBvdGhlciBwbGFjZSB3aGVyZSB0
aGUgc2ltaWxhciBpc3N1ZSBleGlzdHM/IGUuZyBvbiBMb29uZ0FyY2g/CgpPdGhlciB0aGFuIGFi
b3ZlIGNvbmNlcm5zLCB0aGlzIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWU6CgpBY2tlZC1ieTogQmFv
cXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+Cgo+ID4gICAgICAgICAgICAgICAgIGlmIChpbWFnZS0+
ZmlsZV9tb2RlKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgbWVtY3B5KCZmZHQsIGltYWdl
LT5zZWdtZW50W2ldLmJ1Ziwgc2l6ZW9mKGZkdCkpOwo+ID4gICAgICAgICAgICAgICAgIGVsc2Ug
aWYgKGNvcHlfZnJvbV91c2VyKCZmZHQsIGltYWdlLT5zZWdtZW50W2ldLmJ1Ziwgc2l6ZW9mKGZk
dCkpKQo+ID4gLS0KPiA+IDIuNDcuMAo+ID4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
