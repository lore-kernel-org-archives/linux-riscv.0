Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D7FC7EE32
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 08:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oV+q5iB/GZ+Sj2nYeE5cKCIoJ+19lHBKBBhnifqLlvA=; b=AHowTfT89kOfBS
	n11a+o+jyLRroKhvdNhQZg6+YHd6h25VohzjxR4/OHHw2gM/+5tovJZ2BWI3G2LldQQq0fD65qUzD
	IE53EflOvBQRiO3q0IRNYtZFzI18YCugTFMsxWtnEm4cq/X8Gh+23Oh4c7dT6DOMjGkLlpmeJ7W/D
	EE14JN+1UMTXvDEsB93ZrlrZ/X07+qfeZKhpepkp96+k0faGQROh0yoJ5gCi7OyCaaX25ik/ohhEQ
	/ov9FSUkr4YEOkkShLQRrDTwH0xA5DM8TQ8QqtC0hVOWpsYT2KUX5/lrqwuiBP7mOrFOZImukHe+H
	ui61tzLZy4yO5cJrfnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUi6Q-0000000AzUX-3UJ8;
	Thu, 26 Jun 2025 08:37:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhh9-0000000AuWJ-18BA
	for linux-riscv@bombadil.infradead.org;
	Thu, 26 Jun 2025 08:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eqDcDFqVxxmfDYDp+n2CkhXfGQP/jzowgprIS5/mF4E=; b=EJsuPpLPJGJ6VFa8DgFuDfTAD4
	jTY2wIZ+drh+XV4G8nXXhTuO80lAAs3a736LR6lI1OMRw8jKQ2UgfTQf5bugcnqFz+TwUV3nqgdMr
	z37EidD027dlSZhEUJoA9JGTAN99Pt6Gz6/TzEo4fXTVcb1AIuFqgzgj3yMAGXkIUjOOD6kBSI+m0
	J/jXwZozwsq9yCfqEyy4QQQvp+VZihMWZ0pz2W8aCiOXAkigiaL9ogCvbwzs4hHsDogRDi/fb7Zj+
	w7yEwKBh5Mr2tYuUK7YmHP3L8tkj9U7OOKBu9SKEBHiEyyLDpVwh1BuR/+vOCfd/jF/BFuPJuBrTj
	2qySunzw==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhh6-000000063ak-1gt2
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 08:10:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso106688f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750925450; x=1751530250; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqDcDFqVxxmfDYDp+n2CkhXfGQP/jzowgprIS5/mF4E=;
        b=YKZ04fnDmwIszD4Vmx1DSCy9xUEaS/JTosBV2fl+Hgs+Nl+kIViWVX9k3/cZTdfm89
         IUZsDi7mXmEUFVnnyI4qFl8iMgaJa2nWfIR8n090NNX/LuHsBFxf+pIdqAGJQSjHI8M9
         YXeMq0gn6netyiMh1XQWtG4IdswcDbJbJFBsWxR4uNwsJAWetrp694kftSsS25qUlIOb
         gK+Pu5wDEokhsVTyuRi2siOGBp4GRZGDJAAJV2pJ2uddj58CkhqNL/6puRxVECYQlYC/
         gmb7OsB2YvkVw9Q37bd6QOVOle8dJtdjMpZThinlQbHgpyxSks/dTH6m6jczMNoyEcIh
         QiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750925450; x=1751530250;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eqDcDFqVxxmfDYDp+n2CkhXfGQP/jzowgprIS5/mF4E=;
        b=ZGh+RLDYhDiTK2Pc6E4aIBnaAJc0MhttFJsbGXBbV8WETl6oO9+iK4vxmj3hSlkKFK
         ejDtC4SSfgxFL9RF/lz7pcmc3T+iFR5qQwQUtziLm4szos4CypgFu+W+3xXBB4FNiTYU
         S6j5+Iwi7/ZRJPDYurSLSvuWix2sguHhtM+S74/y6UnYPUzit0L9Q8X/g1AEvVB82v3X
         AdBBkWFIeBqGawdDBnLCuR0mB8qwS1vQ1aSQAplTS36LYzQPf2ukcRuN1xjqpMaurq1n
         5QIUWEnFFpGA78Pqo+NOhQdhSXjXmElOSb9iWLibRwDzJDJkZuRXLL/uL1OZG/gqePtJ
         QmKg==
X-Forwarded-Encrypted: i=1; AJvYcCWh3g1c4wBweL0WuPE8N5Vd++OjUMLcqvl8oujwkyPpWYmVEoBSvNzfv6LnPa9c6/lwnZ6REpbfH3lnLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGgS7r+mqrcj/SEDCQuX2Wr1Bdu3vj3uYdWZB3K2Rmn1ar1Mj3
	2cF202IJjvgJ05f/+rIwl7r5RJ8C9ZIVfHJqNFkEZTe8Fjeb2a7jf0Em/WNsBB0Wmd8=
X-Gm-Gg: ASbGncuCJrNDsag+jKoHbFc+hcyQ4YZ3Kz8UjTuHEMvP8PYY7LACwNCaZ+d+s2Iac1P
	52IC7xDlSo4VzGiH/1hEB+mia28scbRkHjUtK3q+ENzhaHiUnHX6+qYRJvEu67Nr8BdQ12ANTHm
	8Db0II2jGLEhn1l1lV2lAl+yTAzunANI8Q8mZCL83yAC6PEUJQWdRXuYgHBhoJXyvu31H/Z0XVg
	z3X4ESUq9g4KnGXjrxL9X8bOmbow54lS75nbOsLinj4n/uuX+CbwpNafFCFJytKwgaiZvNkxN3d
	iojmcR7otzVQ1eZnlXOucWwRHW/ku/YXXm5eeYzNF4CDhJk6w4iWQoRMk7Rodk5CBYtmvTK3TDy
	OUDNpm1OFeR5I3gTnKF9JuA==
X-Google-Smtp-Source: AGHT+IHSmCzUrd+nL3B2qqDTAaRyJLpa2weNsiFvKQJ1cPJjRjxohsfvUf3LU44ZAaoCQYUEjHLtJA==
X-Received: by 2002:a05:600c:3b22:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-45381af75f0mr24351205e9.8.1750925449799;
        Thu, 26 Jun 2025 01:10:49 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e810977esm6616970f8f.83.2025.06.26.01.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:10:49 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 26 Jun 2025 10:10:48 +0200
Message-Id: <DAWB9QUQGPAZ.Z5454RAZXOF7@ventanamicro.com>
Subject: Re: [PATCH v2 3/2] RISC-V: sbi: remove sbi_ecall tracepoints
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>,
 <ajones@ventanamicro.com>, <cleger@rivosinc.com>,
 <apatel@ventanamicro.com>, <thomas.weissschuh@linutronix.de>, "Jeff Law"
 <jlaw@ventanamicro.com>
To: "David Laight" <david.laight.linux@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250619190315.2603194-4-rkrcmar@ventanamicro.com>
 <mhng-516082EA-5A9A-4A76-9448-70828749F95F@palmerdabbelt-mac>
 <DAUSD38QIV6D.1YO5ASNI3EUGV@ventanamicro.com>
 <DAVG8M70SJ4Q.ZSTC5VSJWGSK@ventanamicro.com>
 <20250625093415.53fd21cf@pumpkin>
In-Reply-To: <20250625093415.53fd21cf@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_091052_677897_B0A2F068 
X-CRM114-Status: GOOD (  14.19  )
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

MjAyNS0wNi0yNVQwOTozNDoxNSswMTowMCwgRGF2aWQgTGFpZ2h0IDxkYXZpZC5sYWlnaHQubGlu
dXhAZ21haWwuY29tPjoKPiBPbiBXZWQsIDI1IEp1biAyMDI1IDA5OjUxOjQ1ICswMjAwCj4gUmFk
aW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiAyMDI1LTA2
LTI0VDE1OjA5OjA5KzAyOjAwLCBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3Jv
LmNvbT46Cj4+ID4gRm9yIGFub3RoZXIgZXhhbXBsZSwgbGV0J3MgaGF2ZSB0aGUgZm9sbG93aW5n
IGZ1bmN0aW9uOgo+PiA+Cj4+ID4gICBzdHJ1Y3Qgc2JpcmV0IHNvbWVfc2JpX2VjYWxsKHVpbnRw
dHJfdCBhMCwgdWludHB0cl90IGExKQo+PiA+ICAgewo+PiA+ICAgICByZXR1cm4gc2JpX2VjYWxs
KDEyMywgNDU2LCBhMCwgYTEpOwo+PiA+ICAgfQo+PiA+Cj4gLi4uCj4+IAo+PiBHQ0MgMTUuMSBz
dGlsbCBsZWF2ZXMgIm12IiBvdXRzaWRlIHRoZSBicmFuY2gsIGJ1dCBhdCBsZWFzdCBzZWVtcyB0
byBiZQo+PiBvbiB0aGUgcmlnaHQgdHJhY2sgKHVuZGVzaXJlZCBvdmVyaGVhZCBpcyBtYXJrZWQg
d2l0aCBsZWFkaW5nIHN0YXJzKToKPj4gCj4+ICAgIDB4ZmZmZmZmZmY4MDAyMzZlOCA8KzA+Oglh
ZGRpCXNwLHNwLC00OAo+PiAgICAweGZmZmZmZmZmODAwMjM2ZWEgPCsyPjoJc2QJczAsMzIoc3Ap
Cj4+ICAgIDB4ZmZmZmZmZmY4MDAyMzZlYyA8KzQ+OglzZAlyYSw0MChzcCkKPj4gICAgMHhmZmZm
ZmZmZjgwMDIzNmVlIDwrNj46CWFkZGkJczAsc3AsNDgKPj4gKiAgMHhmZmZmZmZmZjgwMDIzNmYw
IDwrOD46CW12CWE0LGEwCj4+ICogIDB4ZmZmZmZmZmY4MDAyMzZmMiA8KzEwPjoJbXYJYTUsYTEK
Pj4gICAgMHhmZmZmZmZmZjgwMDIzNmY0IDwrMTI+Oglub3AKPj4gKiAgMHhmZmZmZmZmZjgwMDIz
NmY4IDwrMTY+OgltdglhMCxhNAo+PiAqICAweGZmZmZmZmZmODAwMjM2ZmEgPCsxOD46CW12CWEx
LGE1Cj4+ICAgIDB4ZmZmZmZmZmY4MDAyMzZmYyA8KzIwPjoJbGkJYTcsMTIzCj4+ICAgIDB4ZmZm
ZmZmZmY4MDAyMzcwMCA8KzI0PjoJbGkJYTYsNDU2Cj4+ICAgIDB4ZmZmZmZmZmY4MDAyMzcwNCA8
KzI4PjoJZWNhbGwKPj4gKiAgMHhmZmZmZmZmZjgwMDIzNzA4IDwrMzI+OgltdglhNSxhMAo+PiAq
ICAweGZmZmZmZmZmODAwMjM3MGEgPCszND46CW12CWEyLGExCj4+ICAgIDB4ZmZmZmZmZmY4MDAy
MzcwYyA8KzM2PjoJbm9wCj4+ICAgIDB4ZmZmZmZmZmY4MDAyMzcxMCA8KzQwPjoJbGQJcmEsNDAo
c3ApCj4+ICAgIDB4ZmZmZmZmZmY4MDAyMzcxMiA8KzQyPjoJbGQJczAsMzIoc3ApCj4+ICogIDB4
ZmZmZmZmZmY4MDAyMzcxNCA8KzQ0PjoJbXYJYTAsYTUKPj4gKiAgMHhmZmZmZmZmZjgwMDIzNzE2
IDwrNDY+OgltdglhMSxhMgo+PiAgICAweGZmZmZmZmZmODAwMjM3MTggPCs0OD46CWFkZGkJc3As
c3AsNDgKPj4gICAgMHhmZmZmZmZmZjgwMDIzNzFhIDwrNTA+OglyZXQKPj4gICAgW1RyYWNpbmcg
Z29lcyB0byArMTI2XQo+Cj4gSG93IG11Y2ggZG8gYSBmZXcgcmVnaXN0ZXIgbW92ZXMvc3BpbGxz
IG1hdHRlciBjb21wYXJlZCB0byB0aGUKPiBjb3N0IG9mIHRoZSBjYWxsZWQgY29kZT8KCkkgZGlk
bid0IGRvIGFueSBzZXJpb3VzIGFuYWx5c2lzLi4uIEluIGdlbmVyYWwsIHNpbXBsZXIgZnVuY3Rp
b25zIGFyZQpnb2luZyB0byBzdWZmZXIgYSBoaWdoZXIgcmF0aW8gb2Ygb3ZlcmhlYWQgZnJvbSBh
ZGRpbmcgdHJhY2Vwb2ludHMsIGFuZAp0aGUgY29uc3RhbnQgb3ZlcmhlYWQgcGVyIGFkZGVkIHRy
YWNlcG9pbnQgaW5jcmVhc2VzIHdpdGggdGhlIG51bWJlciBvZgppdHMgYXJndW1lbnRzLgoKRm9y
IGEgdHJhcCB0byBrZXJuZWwgbW9kZSB0aGF0IHBhc3NlcyB0aHJvdWdoIGEgZG96ZW4gdHJhY2Vw
b2ludCBzaXRlcywKd2UgY291bGQgc2F2ZSB1bmRlciBhIGh1bmRyZWQgaW5zdHJ1Y3Rpb25zIGlm
IGRpc2FibGVkIHRyYWNlcG9pbnRzIGhhZAp0aGUgbWluaW1hbCBvdmVyaGVhZC4gIEkgZG9uJ3Qg
aGF2ZSBhIGdvb2QgaWRlYSBob3cgbXVjaCBvZiB0aGUgdG90YWwKdHJhcCBleGVjdXRpb24tdGlt
ZS9pbnN0cnVjdGlvbi1jb3VudC9lbnRyb3B5LWluY3JlYXNlIHRoYXQgYWN0dWFsbHkgaXMuCgo+
IFRoZXJlIHdpbGwgYnV0IG11Y2ggd29yc2UgdGhpbmdzIG91dCB0aGVyZSBpZiB5b3UgbG9vay4K
CkRlZmluaXRlbHksIEkgYW0gdHJ5aW5nIG15IGJlc3Qgbm90IHRvIGxvb2ssIGJ1dCBJIHNvbWV0
aW1lcyBoYXBwZW4gdG8Kc3R1bWJsZSB1cG9uIHNvbWV0aGluZywgYW5kIHRyeSB0byB1bmRlcnN0
YW5kIGl0LgoKV2FpdGluZyB0aWxsIHRoZSB0cmFjZXBvaW50IG92ZXJoZWFkIHJlc29sdmVzIGl0
c2VsZiBzb3VuZHMgZmluZSB0byBtZS4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
