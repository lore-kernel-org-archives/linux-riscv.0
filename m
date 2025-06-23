Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761EDC7115B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ad0vkOtz2dnSbSffFQcjL0EM5JJKfSAKjeFB0Zrwmg8=; b=D4rum44m6DQOeEIzxEH/wxJVsh
	/aLWjTAHZfCUjz6IZdq37olE1HtCXsC2200+yZj5QoAGPi9IX42O0iZkFgaXECN28XOA+Cludh87o
	pEMAxpArJLPapAiywBguX5NsIEfUsEpsZ1eKtY/2iPw+PIxOYpoOMccm7oXRQyOHK4yqvZivftLpj
	QXs0IQclksoJMZdV9P9gKFIqrXv2p0NzrK2XuycHZ1f6oSatc73ymMIvWcvA042sxWOnAhtiFgmZJ
	wfnSkXHf7oJ7exP3rcYt6kIs7zytBu+4W37RmC1Vv0r9OY/S4+2VZjSAEhUF8YWdXoQhoFDDp5hWl
	UdlMK5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscY-00000004O2q-42P0;
	Tue, 24 Jun 2025 01:38:46 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTq36-000000048EW-2TJX
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 22:54:02 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-742c3d06de3so5678314b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 15:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750719239; x=1751324039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VF7LW57cCFEi2hNBbg3wdBgr2GfXhP/R3PlTJsBQ0II=;
        b=T2UiHJ9ViGE7ca4BwJ3DuAGjbBlqOK2gAt0z2v7N6fJKC8zZtZ3upDCLb76BZ2DeCu
         BRKLmRrXcQEcES7J46AynCTGT+BviZ5U8cJKCO5c2s9qCejbWXuQePT+tXwhHemHvvqk
         2nfMUcTcnNibtI3cA/nUSwf3Dat73p0oFK34bq2pIhieZB9GoBzY1cRkOc38Eb5lKQCH
         NtLXaWuKr2u/7nxCyR0jskxUlYsA0XfbNFpOsHDAQzOAOLtbLz3tBm8TrPX6Cgle5pyS
         GdLdyOf8Fr7ppgHKBmDFdD2xPr/1HSxpfxHzDBywxuVyKk/WvuWrT+INdE17se0S/+MV
         /95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750719239; x=1751324039;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF7LW57cCFEi2hNBbg3wdBgr2GfXhP/R3PlTJsBQ0II=;
        b=j5fGUMGaPMa41SnCC79UcdMqxvHG5K34l0WY+RqJLAf3FTt3gpGQufKJPnYwDJnngs
         BalSJcoxG4kTSwT3zXW0ZUSS5N4W2AWRd71h5/jIEyF1xQapFFjiXd4iTHkJ8w24HCZX
         q7t/nOQmvHol2w/a1z1kJNfzxXhGe7e/k3q8yYn7nezREwC8J+3rA9clBO9jBGZRQweT
         1h+proYU1FZ5tXI6RkvK1GCM1rVr2PZVfyBCSESMR5e/tjWaapoJA2L1/XTO2sMfd9j1
         FHD94q2tQjNEvCJZDEkkcY5s4/g6r7Go24itY1kQa+BZ/By3jh9+6Z9ktKW/zRHAdB0/
         FYIQ==
X-Gm-Message-State: AOJu0YxSuZC9T+0VCHj8a0d/5qDz9aUVXm4oNmeqRlGsq7FXJaH64HUE
	zXtxmswwbB9Hegs29z//KOF2lgYiuRSxsNq8ci6PkGmSpc1fh3BsqCAkBvzJzh4puUV3ZALYiqv
	ULfyQIeo=
X-Gm-Gg: ASbGncu4hPNUb5bwGHeHx6j0w7xz+X7DfOA6m+JQ/4Y9POLatGhQC8/wsJYp49dHToI
	UXDujNLZAKB3ln7Vx6Pxtvz/YDppVjMq+6oDEr15DT1w+9jNCi6+zmv5wy6MmWcVKDdS4OWR//a
	2O6pVbVQtUAnQubgWVcdwLObTvJny47m6ghYUw7a0AUrTi5/OL9sQSgT7iBvkWfD9vgNWhODGOq
	ub6L76qgmjv2SysicDKTT/Hs8zs2WsQWtLxEc6h+PaU4L0JZ5DojrGfoKw4FdALdp32f5K9rl0R
	t8Ns0A1tSbVK3cjvzlm2V/uhmCjgAS6vwDh4QkqGYd2EuIpJ4ptJ3tSWFA/I
X-Google-Smtp-Source: AGHT+IHPYxBbwWzfYVYSX5RUoq82qKJTDkiQtcM7tH8Zwp5Kzu9wEm4JpM4W84LXzDwaRm+Ru6dy6w==
X-Received: by 2002:a05:6a00:1804:b0:748:e38d:fed4 with SMTP id d2e1a72fcca58-7490d691e08mr23029362b3a.6.1750719239108;
        Mon, 23 Jun 2025 15:53:59 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-749c882cccfsm200194b3a.79.2025.06.23.15.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:53:58 -0700 (PDT)
Date: Mon, 23 Jun 2025 15:53:58 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 15:49:24 PDT (-0700)
Subject: Re: [PATCH v2 0/2] RISC-V: turn sbi_ecall into a variadic macro
In-Reply-To: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
  Atish Patra <atishp@rivosinc.com>, ajones@ventanamicro.com, cleger@rivosinc.com, apatel@ventanamicro.com,
  thomas.weissschuh@linutronix.de, david.laight.linux@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rkrcmar@ventanamicro.com
Message-ID: <mhng-C1133FA3-71C3-4ECC-B3BF-13DC7640464D@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_155400_630764_30D61155 
X-CRM114-Status: GOOD (  22.38  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxOSBKdW4gMjAyNSAxMjowMzoxMiBQRFQgKC0wNzAwKSwgcmtyY21hckB2ZW50YW5h
bWljcm8uY29tIHdyb3RlOgo+IHYyIGhhcyBhIGNvbXBsZXRlbHkgcmV3cml0dGVuIFsxLzJdLCBh
bmQgZml4ZXMgc29tZSBtaXNzZWQgdHJhaWxpbmcKPiB6ZXJvZXMgaW4gWzIvMl0uICBUaGUgZml4
ZXMgaW4gWzIvMl0gYXJlIGltcG9ydGFudCBmb3IgdjIsIGJlY2F1c2UKPiBzYmlfZWNhbGwgZG9l
c24ndCBmaWxsIHRoZSByZWdpc3RlcnMgd2l0aCB6ZXJvZXMgYW55bW9yZS4KClRoZSBTQkkgc3Bl
YyBzYXlzICJSZWdpc3RlcnMgdGhhdCBhcmUgbm90IGRlZmluZWQgaW4gdGhlIFNCSSBmdW5jdGlv
biAKY2FsbCBhcmUgbm90IHJlc2VydmVkLiIgYW5kIEknbSBub3QgcmVhbGx5IHN1cmUgd2hhdCB0
byBtYWtlIG9mIHRoYXQuICAKU3BlY2lmaWNhbGx5OiBkb2VzIHRoYXQgbWVhbiBpbXBsZW1lbnRh
dGlvbnMgYXJlIGFsbG93ZWQgdG8gYXNjcmliZSAKY3VzdG9tIG1lYW5pbmcgdG8gdGhvc2UgcGFy
YW1ldGVycyBhbmQgbWlnaHQgc3RhcnQgZG9pbmcgc3R1ZmYgaWYgCnRoZXkncmUgbm90IHNldCB0
byB6ZXJvPwoKPiBJbiB0aGUgZnV0dXJlLCBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2
ZSBhIHdyYXBwZXIgZnVuY3Rpb24gZm9yCj4gZWFjaCBzYmlfZWNhbGwsIHRvIG1ha2UgdGhlIGNv
ZGUgbGVzcyBlcnJvci1wcm9uZS4KPgo+IEdDQyBpc24ndCBkb2luZyBhIGdvb2Qgam9iIHdpdGgg
c2JpX2VjYWxsLiAgdjIgaXMgYSBiaXQgYmV0dGVyIHRoYW4gdjEsCj4gYmVjYXVzZSBzb21lIGVj
YWxsIHJlZ2lzdGVycyBhcmUgbm90IHVzZWQgaW4gdGhlIGFzc2VtYmx5LCBidXQgbm93aGVyZQo+
IG5lYXIgZ29vZCBlbm91Z2guLi4KPiBUaGUgY29tcGlsZXIgZG9lc24ndCBjb25zaWRlciBzdGF0
aWMga2V5J2QgdHJhY2Vwb2ludCBicmFuY2hlcyB0byBiZQo+IHNwZWNpYWwsIGFuZCBwcmVwYXJl
cyBmb3IgdHJhY2UgZnVuY3Rpb24gY2FsbHMgb3V0c2lkZSBvZiB0aGUgdW5saWtlbHkKPiBwYXRo
LiAgSW5zdGVhZCBvZiBhIHNpbmdsZSAibm9wIiBmb3IgYSB0cmFjZXBvaW50LCB0aGUgbm9uLXRy
YWNlIHBhdGgKPiBhbHNvIGRvZXMgYSBsb3Qgb2YgcG9pbnRsZXNzIHJlZ2lzdGVyIHNhdmUvcmVz
dG9yZS4KPiBJJ20gbG9va2luZyBmb3IgaGVscCB3aXRoIHRoaXMgaXNzdWUgaW4gWzMvMl0uCj4K
PiB2MjoKPiAgKiB1c2UgbGludXgvYXJncy5oIFtUaG9tYXNdIFsxLzJdCj4gICogY29tcGxldGVs
eSByZXdyaXRlIFsxLzJdCj4gICogcmVtb3ZlIF9fc2JpX2VjYWxsIFsxLzJdCj4gICogYWRkIHNv
bWUgbWlzc2VkIHRyYWlsaW5nIDAgaW4gcG11IFtEYXZpZF0gWzIvMl0KPiAgKiBhZGFwdCB0byB0
aGUgbmV3IHNiaV9lY2FsbCB0aGF0IGRvZXNuJ3QgYWxsb3cgYSBzaW5nbGUgYXJndW1lbnQgWzIv
Ml0KPgo+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDYxMjE0
NTc1NC4yMTI2MTQ3LTItcmtyY21hckB2ZW50YW5hbWljcm8uY29tL1QvI20xZDQ0MWFiM2RlM2U2
ZDZiM2I4ZDEyMGI5MjNmMmUyMDgxOTE4YTk4Cj4KPiBSYWRpbSBLcsSNbcOhxZkgKDMpOgo+ICAg
UklTQy1WOiBzYmk6IHR1cm4gc2JpX2VjYWxsIGludG8gdmFyaWFkaWMgbWFjcm8KPiAgIFJJU0Mt
VjogbWFrZSB1c2Ugb2YgdmFyaWFkaWMgc2JpX2VjYWxsCj4gICBSSVNDLVY6IHNiaTogcmVtb3Zl
IHNiaV9lY2FsbCB0cmFjZXBvaW50cwo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX25h
Y2wuaCB8ICA0ICstLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oICAgICAgfCA1NSAr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Ry
YWNlLmggICAgfCAzNiAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2Nw
dV9vcHNfc2JpLmMgICB8ICA2ICsrLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcGFyYXZpcnQuYyAg
ICAgIHwgIDIgKy0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICAgICAgIHwgNTcgKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zYmlfZWNh
bGwuYyAgICAgfCAzNCArLS0tLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3Vz
cGVuZC5jICAgICAgIHwgIDQgKy0tCj4gIGFyY2gvcmlzY3Yva3ZtL25hY2wuYyAgICAgICAgICAg
ICB8ICA3ICsrLS0KPiAgZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYyAgICAgICAgIHwgIDQgKy0t
Cj4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgICAgICB8IDQ5ICsrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tCj4gIDExIGZpbGVzIGNoYW5nZWQsIDExNSBpbnNlcnRpb25zKCspLCAxNDMg
ZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
