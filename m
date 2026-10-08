Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE73CA600D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOFRMxamUoqmOI52tYPIhG4ZrZWfvUrWXCWCr4gQTzM=; b=W8K2Gt+4hNa0ss
	dPl+8qqMi0V1YWMgYAiYzuAfwkRUVkk0LV/MIWuyFwGshspYlXuiVJbiPgVWHR4QKhyPGAYg556Pw
	ROMr+tnWNCeqUmIzlVXXn4zIy/s2ZJI4aK3/iHeZ9tvJYIrb8rpmYfq6XtLZTZwzqGt01Xvz1rd8P
	dcUZlGZA4CSvNyr3iDw34cS8czSMvPiXD7fu37NrwxibiY9f6EYh+/byvzNbXRrPGqV/+rvSpSP3X
	msKVXfecCmWxZ/pmG4Qsf8ub+IM/UIASYoj7rNivd1U3OAoeYWLpieET8YZWMRnCtWikTrhDlKocu
	TU6GZ94/EILALDMCPs3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsxu-00000004sFU-0ZcV;
	Thu, 08 Oct 2026 18:35:38 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsxr-00000004sEl-0QKJ
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 18:35:36 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-885cf67963eso37446347b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 11:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791484533; x=1792089333; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b0T97z3jJR8wExZaSoTXfgxsp5uU387qTrmZ967ydos=;
        b=S2ZEVbizbWlKuhjjPXxX6h9Drb01pf5CygRBaUEu69pHX82UFJWxtKzhjIiceK29RR
         rRMBNSWi5OdLv/UR8O6DLs+ssUqp+RjM0tGZHrU68h1Qo/9C7O2uDUFpDT7iDm9tMqF9
         F/6Yp46XpyPk5qQzfTB71d2wWFy5CC2jZl+SYFxvIEke2WwS1KYtJfAJ66ZyAhFrKqUB
         tFvCkDFFFm3gQP2+C4dSb2q6ZmgD++1hGRPydY30VCjHhfMWb1+tVbSGXP+KHt0x9r8w
         /3Uq+u2aY4fJD038Lmvr3+zfWqNqgWuqmNjp1hzv3JWnj6Qk9dm8EHpyFCkLTfWu9aaE
         ebng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791484533; x=1792089333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b0T97z3jJR8wExZaSoTXfgxsp5uU387qTrmZ967ydos=;
        b=zidQ3FpxmkforcQCVyVBhnEAPNERLqih8b+/Yon+lCIg0i7qTI03YTGL1lOYcDg9hU
         feYXnqoKyDu6X+yhCIdpLGKD15jFBQgiXdJF8pzMj6XjjYf5BTATJjbbViPvNa2dfQHQ
         tCABbhJy37BNb7azHaORTKooj+nznNk2JAqZamT4SNV1GeGkSbQAmJbT4LlRZlArhG6i
         8aK15lwDKS2N8MqYB1tQy0GPb3mCTAtShRV0INGJRi1UWRWfpuRFSls4yCkkMGermp4K
         hX7zb4eGBShDkjAlCA25wHSRbsQkRcDPysJ2PWK0wZJG8UNzNZgB7rfGUMPKlW6BiPN2
         TuAw==
X-Forwarded-Encrypted: i=1; AKwUvBzykeidLI9KChjOWiEa+ZQFRyG6CXCuO8rV5P6DT5yGPGQHDXogN3LgyCwloz2oycr8m4Vy1Gw3S1q5Fg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJosziAPQ+yacY6CZ8yxJWWn/Pa+T366+n/M+MvyFLzaKfc0NHO
	BNMlFVsIhp3nfQgLKurVX/OUORXsPG7J8qcG/v1qL/V8FG0p+qQiLk/cpVhkV1HMjR8=
X-Gm-Gg: AYBFou2/DeFtHv9wx6GuVuN1KC0jkYrRWXTFPGBMKyOcmyee2RbX//yQVrgGZ+zGU7o
	RAXfCzzBnl4gKjs4oCrs5XBSQPRO+bZLysQICLTSyndPqFtyOabTcn1Hi/6Yseae9SpDe4G2Gyi
	h4Ls3BeQcHbqUTMXGkWo7YolT40k7akQwpK+dRa3slkCnp8OW59sfw4cnwcn7sapntxo3e8EkBi
	xOmfOAe/kDoJGFhbpo6TWM03R2TRIek5RzeJ5rpZS+f7ObefG/4wT7fKIggrQmLaCcCsjiASX2g
	utzOA8GoY0u6N2Xw3DPxFgq+JuqehEGbBXH/XDBv9FFGyIdHEZBOzZA/Jf/3MKB35gFBxnwQNQx
	uHDT5UXJiJ0EysX32uPx8+BCY+lE5MqEZksjR6CJV+DwMQ9sTe/N3RhPdXqdxM7T5st5Bn1XQ4i
	fuAyz7t8ANC8f1JXRdp/nrtY1d60CT108lZJAoHB4aCNe7Papwp02UKz8ZzQLecLpOv89grwDhu
	8AjorGcXrZdshd8j/6HY0a/9GpwWCUMUjWT9Q==
X-Received: by 2002:a05:690c:f14:b0:8a4:aeb2:acfa with SMTP id 00721157ae682-8b05afc3ad7mr41482347b3.54.1791484533157;
        Thu, 08 Oct 2026 11:35:33 -0700 (PDT)
Received: from toolbox ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07d1af1b1sm261407b3.0.2026.10.08.11.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:35:32 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:35:07 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Radim Krcmar <rkrcmar@qti.qualcomm.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atishp@rivosinc.com>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, "apatel@ventanamicro.com" <apatel@ventanamicro.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, David Laight <david.laight.linux@gmail.com>, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] RISC-V: make use of variadic sbi_ecall
Message-ID: <cqdum6vuev3c3vrhsa4uaxfbjy3jutdbdhz4g3tl7pgjalttkt@xax6i7oaaimw>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
 <20250619190315.2603194-3-rkrcmar@ventanamicro.com>
 <650d23e8-b51b-85da-f9f3-52a06fed81e5@kernel.org>
 <DLYI0I8PT4LZ.ZSXV160QVO0H@qti.qualcomm.com>
 <d94ecb9c-def7-a9cb-456b-60b18489d0f3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d94ecb9c-def7-a9cb-456b-60b18489d0f3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_113535_240958_CD421EE7 
X-CRM114-Status: GOOD (  24.18  )
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

T24gV2VkLCBPY3QgMDcsIDIwMjYgYXQgMDg6NDY6NTdQTSAtMDYwMCwgUGF1bCBXYWxtc2xleSB3
cm90ZToKPiBPbiBXZWQsIDcgT2N0IDIwMjYsIFJhZGltIEtyY21hciB3cm90ZToKPiAKPiA+IDIw
MjYtMTAtMDZUMDM6NTU6MTItMDY6MDAsIFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPjoK
PiA+ID4gT24gVGh1LCAxOSBKdW4gMjAyNSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+ID4gPgo+
ID4gPj4gVGhlIG5ldyBzYmlfZWNhbGwgZG9lc24ndCBoYXZlIHRvIGxpc3QgYWxsIDggYXJndW1l
bnRzIGFueW1vcmUsIHNvIG9ubHkKPiA+ID4+IHBhc3MgdGhlIGFjdHVhbCBudW1iZXJzIG9mIGFy
Z3VtZW50cyBmb3IgZWFjaCBTQkkgZnVuY3Rpb24uCj4gPiA+PiAKPiA+ID4+IFRoZSByZW1haW5p
bmcgdHJhaWxpbmcgMCBhcmUgaW50ZW50aW9uYWwgYXMgdGhleSByZXByZXNlbnQgYW4gYXJndW1l
bnQuCj4gPiA+PiAKPiA+ID4+IFNCSSAwLjEgc2hvdWxkbid0IGJlIHVzaW5nIHRoZSBzYmlfZWNh
bGwsIGJlY2F1c2UgaXQncyBvbmx5IGZvciAwLjIrLAo+ID4gPj4gYnV0IGFsbG93IGl0IGJ5IHBh
c3NpbmcgMCBpcyB0aGUgcmVzZXJ2ZWQgcmVnaXN0ZXIuCj4gPiA+PiAKPiA+ID4+IFNpZ25lZC1v
ZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgo+ID4gPgo+
ID4gPiBUaGFua3MsIHF1ZXVlZCBmb3IgdjcuNC4gIAo+ID4gPgo+ID4gPiBGb3IgZXZlcnlvbmUs
IG5vdCBqdXN0IFJhZGltIC0gcHJvYmFibHkgaXQncyB3b3J0aCBsb29raW5nIHRocm91Z2ggdGhl
IAo+ID4gPiBjb2RlYmFzZSB0byBjb252ZXJ0IGFueSBTQkkgZWNhbGxzIHRoYXQgd2VyZSBhZGRl
ZCBvdmVyIHRoZSBwYXN0IHllYXIgdGhhdCAKPiA+ID4gd2VyZW4ndCBjb3ZlcmVkIGJ5IHRoaXMg
cGF0Y2ggKGUuZy4sIHRoZSBNUFhZIGRyaXZlcnMpIGFuZCB0byBkb3VibGVjaGVjayAKPiA+ID4g
dGhlIG92ZXJhbGwgYXJndW1lbnQgY291bnRzLgo+ID4gCj4gPiBJIHN0YXJ0ZWQgd29ya2luZyBv
biBhIGZvbGxvd3VwIGFuZCBub3RpY2VkIGEgYnVnLgo+ID4gCj4gPiBQbGVhc2Ugc3F1YXNoIHRo
ZSBmb2xsb3dpbmcgY2hhbmdlIG9yIGp1c3QgZHJvcCB0aGUgc2Vjb25kIHBhdGNoLCBzaW5jZQo+
ID4gd2UgbWF5IGJlIHRvdWNoaW5nIHRoZSBzYW1lIGxpbmVzIGFnYWluIHNvb24sIHNvcnJ5IGFi
b3V0IHRoYXQuCj4gCj4gVGhhbmtzLCBzcXVhc2hlZCBpbi4KClRoYW5rcyBQYXVsLiBGWUkgdGhp
cyBidWcgaXMgY2F1c2luZyBlYXJseWNvbiBjb25zb2xlIG91dHB1dCB0byBicmVhawpvbiBibGFj
a2hvbGUgYmVjYXVzZSBpdCB1c2VzIHRoZSBTQkkgSFZDIGNvbnNvbGUgZm9yIG91dHB1dC4gUmFk
aW0ncyBmaXgKc2hvdWxkIGhvcGVmdWxseSBzb2x2ZSB0aGlzLgoKPiAKPiAKPiAtIFBhdWwKCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
