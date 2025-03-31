Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE157C3600B
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Mar 2025 10:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WK8QRLRpmH4/ZDHGkh+hn2As2ScTNadvGwAjAibur9k=; b=APhZ2Ce2JYLCnZ
	lT4ZBx/ZMKUulH5vcRLvCAnjTQfWQDbmFrRBRe+9VXnFkRqeQGd2KdmXP5DWxvRw3zJEmu0iUv1be
	g+1npPYvwARdJrGVzT8jRhLJHGGeQZv0QI2gl9kMNL6igbsNPsLpMFHcym+WEHQoYKgQ73Gr5PkP0
	rS8DDjkENjI9NZ84InHiDALDDFP5USHFxoO9T1PO8cSz2UEJyKpawJQyBzZ5W6QBUTHgfHSzPtr4z
	48L7pT9PY3DyXo6YfAYe80fWduV/E74U+nXgXfxQE6lp66PYN+FcNodhTj8PGV49TEi1xJLnfT8Yg
	qQ8pisRKEWjGYHrxMoGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCpf-000000007gW-2D2Y;
	Mon, 31 Mar 2025 10:57:31 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCpd-000000007gB-1xya
	for linux-riscv@lists.infradead.org;
	Mon, 31 Mar 2025 10:57:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-227cf12df27so61054605ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Mar 2025 03:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743418648; x=1744023448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQxoGO+j1MyZc3JaI/rKrHOI5r9i4Uu5nnw1H4HdvvM=;
        b=gttPjCpdwKvaNPL+cceWlbZOEK5QA7Pe4l6CN9pGPr0VyTpwHjp2VkmV7lrqYhHu/Y
         C9hEdOGWDRZ4waKJGJfS5kyTa0HkLFSj6Losq+BI4ARukN5E0zxYYx0+dXrDxzDlhyLZ
         2zXYGQ/CoHU+ulKvxhq3dLL1KuR+wSoD/dKYZWDmEtUTzWYLmHffZXBk3YlPIifCY5Vl
         kyf0OCA8suvankIavsLVkQiO5UWqfU5mKstn0B5ztzS9hCYM9WONUtTWi4SJPw+nKEec
         g7RW9PB5olxXDqDnDaf30AmCS5CaZ4Bx5E8JgWXQ33sQ1gRPUOFYkP1c0gdF71UZdZJ0
         clkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743418648; x=1744023448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQxoGO+j1MyZc3JaI/rKrHOI5r9i4Uu5nnw1H4HdvvM=;
        b=r3uvF8u3Q/HDZl2vIyKbDjNY7eK5q/wBtOSuaU+nDAPDAwjuZ359RpPDy6hVF5FhbS
         +YXs1wW+3tkaueKhBcVcTn9RFinQrLGJ47cRDxE4kPP0fTuquRyutT56r5NLXwae4NlO
         BGsLNASYngsFxxtLinMMSFfcaNQMXDTGrkynw5NuMrdaHsmZ0oCBlXSbaeuBhXimbyX9
         QY2il4aXBAqLxDBf7I8fzOIWRi6d6IzfUwVc31QPKDbLipVbNzUAETwcb9ftaHCVZ9hq
         MhqSkowPHJV3vw6PIUI1VSynlcaX7Qe8b1upMCITwgUyD14jcVnQn0Noj+oR1ueJYV0S
         Oz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3LHrwtIKzCMI3WfPPydzd7Kw5rD2XOWWEUC8in7qywsF+T5+yz6PpVJNQXOMpFNrh40G4uD7mrv2OzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCNk3i0BdTB69G9YLXJHp0vZ3d+hpKt8uXINe008ziv3hLx6ir
	raVb0KC8mE+0xNONgx8BE1JhZMcsDggrj4PIxX32QigoSB/vJVMb
X-Gm-Gg: ASbGncslX/fGV0amp7CLx9dI0sYOhZp46En+c5R0DpsBPSPton0ZguNb6JFeiJks+T3
	fleyH3GKBuutDahHqVVzpujXBKa6/WHTKY2Ns787T5F7A0beOo6j+TOoDyhgtLacfWZgftmQ1zz
	6wmbmtISh6BdIVZIjVlxcdeZ1QTsZspcIZ/WgBpnFrlUDrWbisyZo4yX+5zCCnfkjUR9JBpF0L6
	+2iwsWlFyZ2ruyHMBABWvWceOuCTppKsFNrtcS7W6464j6Y1tHcKU/9S1B8lBzhW0AIzops9TAJ
	yDyJFJTLh93dAR3E1GPuzfEXXWi1vVoP55KdXiTxnaArKe+gRQlCWuY5q/HGdEOFFeLvi9hjMPF
	dk5B6xZlxHgClvnR0bf2xMRKJnmy4OueJ6im0lyNwwg==
X-Google-Smtp-Source: AGHT+IHNmQ9Qu2Wh8ipfkyOz9gG66AB6OTRqclxipqrg+lUH4XOIHmm7HxeHOz4+gDNk+/q1p1iFAA==
X-Received: by 2002:a17:903:2341:b0:21f:6f33:f96 with SMTP id d9443c01a7336-22921ca356bmr192345245ad.6.1743418648294;
        Mon, 31 Mar 2025 03:57:28 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397109d241sm6660848b3a.129.2025.03.31.03.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 03:57:28 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: bigeasy@linutronix.de
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	ryotkkr98@gmail.com,
	samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v3 2/2] serial: sifive: Switch to nbcon console
Date: Mon, 31 Mar 2025 19:57:19 +0900
Message-Id: <20250331105719.8409-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250331080318.BdZQodhu@linutronix.de>
References: <20250331080318.BdZQodhu@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_035729_510439_3A038A84 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

SGkgU2ViYXN0aWFuLAoKT24gTW9uLCAzMSBNYXIgMjAyNSAxMDowMzoxOCArMDIwMCwgU2ViYXN0
aWFuIEFuZHJ6ZWogU2lld2lvciB3cm90ZToKPk9uIDIwMjUtMDMtMzAgMjA6MjE6MDkgWyswOTAw
XSwgUnlvIFRha2FrdXJhIHdyb3RlOgo+PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2lmaXZl
LmMKPj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3NpZml2ZS5jCj4+IEBAIC03ODUsMzMgKzc4
Niw4OCBAQCBzdGF0aWMgdm9pZCBzaWZpdmVfc2VyaWFsX2NvbnNvbGVfcHV0Y2hhcihzdHJ1Y3Qg
dWFydF9wb3J0ICpwb3J0LCB1bnNpZ25lZCBjaGFyCj4+ICAKPj4gIAlfX3NzcF93YWl0X2Zvcl94
bWl0cihzc3ApOwo+PiAgCV9fc3NwX3RyYW5zbWl0X2NoYXIoc3NwLCBjaCk7Cj4+ICsKPj4gKwlz
c3AtPmNvbnNvbGVfbGluZV9lbmRlZCA9IChjaCA9PSAnXG4nKTsKPj4gK30KPj4gKwo+PiArc3Rh
dGljIHZvaWQgc2lmaXZlX3NlcmlhbF9kZXZpY2VfbG9jayhzdHJ1Y3QgY29uc29sZSAqY28sIHVu
c2lnbmVkIGxvbmcgKmZsYWdzKQo+PiArewo+PiArCXN0cnVjdCB1YXJ0X3BvcnQgKnVwID0gJnNp
Zml2ZV9zZXJpYWxfY29uc29sZV9wb3J0c1tjby0+aW5kZXhdLT5wb3J0Owo+PiArCj4+ICsJcmV0
dXJuIF9fdWFydF9wb3J0X2xvY2tfaXJxc2F2ZSh1cCwgZmxhZ3MpOwo+Cj50aGlzIGRvZXMgbG9v
ayBvZGQuIEEgcmV0dXJuIHN0YXRlbWVudCBpbiBhIHJldHVybi12b2lkIGZ1bmN0aW9uLiBUaGUK
PmlteCBkcml2ZXIgc3RhcnRlZCBpdOKApgoKT2ggSSBzZWUuIEkgd2Fzbid0IHBheWluZyBlbm91
Z2ggYXR0ZXRpb24gdG8gaXQuLi4KSSdsbCBmaXggaXQgZm9yIHRoZSBuZXh0IHZlcnNpb24sIFRo
YW5rcyEKClNpbmNlcmVseSwKUnlvIFRha2FrdXJhCgo+PiArfQo+PiArCj4+ICtzdGF0aWMgdm9p
ZCBzaWZpdmVfc2VyaWFsX2RldmljZV91bmxvY2soc3RydWN0IGNvbnNvbGUgKmNvLCB1bnNpZ25l
ZCBsb25nIGZsYWdzKQo+PiArewo+PiArCXN0cnVjdCB1YXJ0X3BvcnQgKnVwID0gJnNpZml2ZV9z
ZXJpYWxfY29uc29sZV9wb3J0c1tjby0+aW5kZXhdLT5wb3J0Owo+PiArCj4+ICsJcmV0dXJuIF9f
dWFydF9wb3J0X3VubG9ja19pcnFyZXN0b3JlKHVwLCBmbGFncyk7Cj4+ICB9Cj4KPlNlYmFzdGlh
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
