Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B3CC02181
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 01:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h32zVvWHl5v9M0Lkb+LfilRew5Iq/rQu4pqAEptwzqw=; b=xuK9r2/TiKUUY8
	XkPjIz27SKeiQhJod1hYNh3OtLj+Qtfg8IVgR1G6d1yGJMuo92sl4nsGH3WVXj54ZSZvB9U/Fx+qH
	0MbU6DMb/Nh7zTpDNnR9S6Wsv/C+jPE5YyXgHpu21xcDULtQs00uQJfyBjKXXqdKNM+iYq4tNhFMW
	YpG1Xf3VNpbKvDgse31tw3s7cS/FqwFxPzB6m/K4ODyM2MWjOoJePHeWpoXcucQhjCNHBIUSjGWj6
	QQM9l6wSemQwRdkKo9iukEVsUZVZCKlmWwDsJK0vUT9CgNEoD33iajFsoglPQ2tKvYlCIvZ3DDbtR
	ap+F2D9wPioWJ1GS1VSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta2hl-00000006eiu-3eGr;
	Tue, 21 Jan 2025 01:05:21 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta2hj-00000006eiX-1q4Z
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 01:05:20 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e39f43344c5so7193690276.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jan 2025 17:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737421518; x=1738026318; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+VaffXFJSHx4O5rg6sm1LsrdJeldPi2fbJBmQQ0x1o=;
        b=GIJscyiI5jguibsE+Sy42Rwpd+gi0pL97ZREJyUQnlv9mbKeQXCJfL70ftC2ANZyTf
         o1qItlHo1qOXMWAn7UCdFejr5ctoTBaXch2zYZ8nkFlutcevGcH19yUDepdhPLOHXqDj
         dNNMdttGAFNDk1MRo1D2HkqP8LddvdBemdGwA6pXXr6PdfG8fWYwsUPVCpZsJRAusaL2
         past6fp55JHeTSD8J9p1qNwNUBs0DVNCEhpLDnjwsLnYRMSIKWYWY+F/Z+XBwg6CbDvo
         fizdl1qyJXdrBGAuycodWAN/fDzikyJNsBZ4FuH+8Xe1ULkhZA5H4IrK7i4j1jY1C0c7
         XUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737421518; x=1738026318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+VaffXFJSHx4O5rg6sm1LsrdJeldPi2fbJBmQQ0x1o=;
        b=FU8L3i+0nHFP+NjGoHFM7uaHI+OPQoCyOBZ9E04pYt0WV0hoTh9uZPaxE18Ti+gt5G
         KrePb4BEm2+wNjUspeBg6gLGvHkZVOhJScIdDrij82hLtiD6Y+UjlwTPrr3IoJiGvfQp
         dY+6NIBUJKODEDPixBTUC16GypO10agkvjo+9FnhEx4A4dtfWkwEMLSlMQEYTG0E5jko
         fWVJuAf47ooqw58UdkkvhQ4+KiE02IZ0KMByabQ63byNLOSKIxiNZ/kpuTJ7AItWzJp5
         Mbj8ELXSYRIh3D8kOV7QAlA6oO/IcwznybXkNJZssiHw/bAhWiZK7I6p2vmfNSJdDTKc
         ZHQA==
X-Forwarded-Encrypted: i=1; AJvYcCWTGma0EUgJKqEmOEqmc36ZImC9P6ppYgE7Jnkh2haEj8kD01WtChY6t2xkbpEaWPDeeeCR6ThjIyazYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YznDP/e+JOtR5IwA35CJPs5O0OHhdDROfM1Kv10BYGbHdJoXq8o
	UZoMF4cXYm6BFmAL2/xoI2rGYIqFvjlo1ISJZW82I/2iPaTdurvRzKCDBb8MNGoabEYVAE77zpa
	yP8Jn4VdVHvc+FTngCiI//oEBvjs=
X-Gm-Gg: ASbGncuLmf0Ktm8aKUF87P+aHs5cxb/VVsqce0iKbbFMIQ7s0hs+BWAEBrpDujA7MMs
	XSrI5teHfRgbaQ7jKM4/OTyp7BSWoGrYJ+DgwP35jzUyRt35zhkJTHIJwh5MN1+ClxNWHn/CyGP
	AsQXt3Iw==
X-Google-Smtp-Source: AGHT+IEPaX6n0NT+lAPMazt+JygUJNKsnflv5pMGNHQdiJGUrnCmk1oIO2er9YPKz9EsW9pwl55wSfKjKa/fYredA0M=
X-Received: by 2002:a05:690c:7349:b0:6ef:8296:359d with SMTP id
 00721157ae682-6f6eb6b570dmr104379677b3.22.1737421517974; Mon, 20 Jan 2025
 17:05:17 -0800 (PST)
MIME-Version: 1.0
References: <20250120022359.125952-1-gch981213@gmail.com> <20250120-skyrocket-fiftieth-5fd770df030f@spud>
In-Reply-To: <20250120-skyrocket-fiftieth-5fd770df030f@spud>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 21 Jan 2025 09:04:47 +0800
X-Gm-Features: AbW1kvaZsh8UADYrwew_H5UY0Oy5wdYC8OhEauVVDnSrU3chPzKd7mrjoE_nuBo
Message-ID: <CAJsYDVJMSdYQ9mLhbt_-CwvfS75piT-cV+-Q5EBvh6CEeQPiJw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: add Siflower RISC-V SoC family Kconfig support
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_170519_498537_869CAA25 
X-CRM114-Status: GOOD (  12.23  )
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

SGVsbG8hCgpPbiBUdWUsIEphbiAyMSwgMjAyNSBhdCAyOjQ44oCvQU0gQ29ub3IgRG9vbGV5IDxj
b25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDIwLCAyMDI1IGF0IDEwOjIz
OjU4QU0gKzA4MDAsIENodWFuaG9uZyBHdW8gd3JvdGU6Cj4gPiBTaWZsb3dlciBSSVNDLVYgU29D
cywgaW5jbHVkaW5nIFNGMjFBNjgyNiwgU0YyMUg4ODk4IGFuZCBzb21lIG90aGVyCj4gPiB1cGNv
bXBpbmcgY2hpcHMsIGFyZSBSSVNDLVYgY2hpcHMgd2l0aCBULUhlYWQgQzkwOCBjb3JlcyBmb3Ig
aG9tZQo+ID4gcm91dGVycyBhbmQgZ2F0ZXdheXMuIEFkZCBhIEtjb25maWcgZW50cnkgbmFtZWQg
QVJDSF9TSUZMT1dFUiBmb3IKPiA+IHRoZW0uCj4gPiBOb3RhYmx5IHRoZXNlIGNoaXBzIHVzZXMg
QVJNIFBMMDExIGZvciBVQVJULiBBUk1fQU1CQSBpcyBzZWxlY3RlZAo+ID4gZm9yIGl0cyBkcml2
ZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1YW5ob25nIEd1byA8Z2NoOTgxMjEzQGdtYWls
LmNvbT4KPgo+IFRoaXMgbmVlZHMgdG8gYmUgaW4gYSBzZXJpZXMgd2l0aCB0aGUgdXNlciAoeW91
ciBkdHMpCgpDb3VsZCB0aGUgdXNlciBiZSBhIGRyaXZlciBLY29uZmlnIGluc3RlYWQ/IFdoZW4g
c3VibWl0dGluZyBhIEdQSU8gZHJpdmVyIEkKd2FzIHN1Z2dlc3RlZCB0byBub3QgZGVwZW5kIG9u
IGFyY2hpdGVjdHVyZSBzeW1ib2wgYW5kIGFkZCBzb2Mtc3BlY2lmaWMKb25lcyB0byBhcmNoLyBm
aXJzdC4gWzBdCgpJIHN0aWxsIG5lZWQgdG8gcG9saXNoIHRoZSBjbG9jay9yZXNldCBkcml2ZXIg
YSBiaXQgYmVmb3JlIHN1Ym1pdHRpbmcgdGhlbS4KV2l0aG91dCBhIGNsb2NrIGRyaXZlciBJIGNh
bid0IHJlYWxseSBzdWJtaXQgYSBkdHMgd2l0aCBtZWFuaW5nZnVsIGNvbnRlbnQuCgpbMF0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZ3Bpby9DQUNScGtkWWlfK2FRNUwtYzQ9dzlNSy02
VWgwZTlkWDBublU2TGNaY0hkOTBqOTdxN3dAbWFpbC5nbWFpbC5jb20vVC8jbWYyMzUyZmIzNmVk
MmNiOGM2NTc0ZDllYjBkNGMyNjFkOTM0NmJmMTAKCi0tIApSZWdhcmRzLApDaHVhbmhvbmcgR3Vv
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
