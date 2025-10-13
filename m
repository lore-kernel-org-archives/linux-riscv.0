Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7BFCCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 07:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2zG1lRGJxzUN9aDVK8aaGKa8rao+AX59lcErCJ4tg8=; b=r2wBTNLsniIJP7
	Nop4GXtL/nnCXFSfR6f49yDMpm4K4w0eSy9QF4qqFmsVShM5cYy4MShdqiSZYDMu1k5B6zlmWFwaN
	nCQvjyaTnpV7/dS/yXHhy5Vege1CUfwL/kwE4jI2qt6beNJ+0WqjWx9ktzfTEuo779Xh9QDWYxJZK
	Up9A8sEi3DwfieTspo0xBLcqUcFJmpn1+giGarFjFV4FkjAXrnHJkRSxcuXHdvxyDp4uSWwBDMJab
	fq+H8YtlHd5lHqC6yi8ZaJUf0BytqMYblFsF5zXVwrWMShuHeoPSXH0rkwiHGziA7gLejnd+zWAqo
	7MEQqPlUB2GUloPJxrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ci0-0000000CSg2-3yqT;
	Mon, 13 Oct 2025 07:11:04 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Chv-0000000CSfC-2TBf
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 07:11:00 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-81efcad9c90so55604736d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 00:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760339458; x=1760944258; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJf7xLipisHImEFHEU39LT6SyCTlQl1jbbC0qWu2PoE=;
        b=FvfUn4gsr2KMVImzG35O+4JyZ7nSRUrK6KU1ndQEKhAQX1uGLo5TZ8+djRhoUMCcM3
         RNbTn0BukPDen9fBrATKx0GxZMlva62DF9cQAUXyOiW0Od7bXiUAmGpsbMRlOihckrW9
         knqOhtqgOIxBuF711r1+cZ3wBlsV0OuGz6+6ZQU+XGE4oErYwo7OmzS+J4T24YSX7FZ1
         wiS9rc5b1NUM1/Fe5XYY2+yXq8TH47WnV7fKiEaxzcEBTmmynrWtJPsuITFo0odA4b6C
         jXf1iXqpcGhmmVFmUiV8jkpBySJLoYxIviPaXoU9x/IW0uW2EsUhmygEjdD7MXbB2lS7
         JgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760339458; x=1760944258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJf7xLipisHImEFHEU39LT6SyCTlQl1jbbC0qWu2PoE=;
        b=RNLb6Vs0CTpjRjSPh4hy5BpormENsT23HAAadjM1vy1TMmKmHZM/6hc0Wq2HMVuY/C
         a2brszL+uZ4f4eX73MqwfT2Xsi4fPKz3QVsQOuLwRSgzYCol7CTPs4gWzM5j7/xMmWGQ
         rUysVKj+8T93f0fAeENkCuNX8CDOYDZ2g5HDrg0iVvVVlY84yxJsv1WGD+txFxrC6Rq0
         S0WyoVVo9DOffvPX/K7rottOLshXnL3Ip9/1f9qMAq9hHydejN9FpLsc7EacwHWpZMzE
         BzbJcp4P4vteUylqFuI83uzOe3JMWFdQoD4gEBv+C2tMxSFoZBaqNsjLyN94Y6Gio43v
         cYcw==
X-Forwarded-Encrypted: i=1; AJvYcCWR6fvCuXTcbxpEq3ratDKWlaJ8X5rxzikOKwzNAMJLeEqwmH3YCxVAEVdL3wUpi/b4a+KwfDuIGLoTIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPWGQRykMqHbcNqGzeoEvM0DIuNLUxQ3yu0YSWy4t/OmJmas3m
	IkWWfa/uGMyzjQ0SgwqKOPX9Fh8ZRxYCCByKXe91sPvKfTVaRJJL+6ako6JcmeHQC41uCOcDmdX
	vu3bOCFsz6eIg3vT9lcMGvXP+FMyuIcnsmbMbMec54A==
X-Gm-Gg: ASbGncuv6iuU09apy19KNYSfD5HswUQ96eVuG5IDL2Bk59hXqSrPOt75AcOBppvYvk2
	51rv+nxE7y/Ku2wWhCv3uricj/X7b+ZbtVHbdGbXnJ888UQEW6EumbSHw0sdbwxbvcV++MgPL5Z
	AHKXA2w8BA6INSAY0aR+SRyE1Y5ftUZp3hXzg9+rgJUpiBBgqdWQAUu1W09mk9Q+IkQj3zignoa
	dSijAXpWCh/Pu8HS4hvuZRNAeNQB5nKOMFWb3VEIPx3H+zfskvlhEgkb+h9U93HDK9L8Q==
X-Google-Smtp-Source: AGHT+IHlYmvSPHRRe5m0EkFR5aoK4WfWi+0MJgO2GyIhsHuhKt7Wi0a0UcJqCLk0ZaLHRfD+MX/KxQLvwg+1sKXpILI=
X-Received: by 2002:a05:6214:410:b0:7f2:5aa8:6655 with SMTP id
 6a1803df08f44-87b2ef33b40mr312076176d6.31.1760339457993; Mon, 13 Oct 2025
 00:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250908181717.1997461-1-cleger@rivosinc.com> <86817f9a-c601-81e8-b95b-0f2396275f95@kernel.org>
 <628d357c-f462-4dc8-92f2-99006b73e0c7@rivosinc.com>
In-Reply-To: <628d357c-f462-4dc8-92f2-99006b73e0c7@rivosinc.com>
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Mon, 13 Oct 2025 12:40:46 +0530
X-Gm-Features: AS18NWCt2iy9V0_v7KjFmtjkYMcjvPsZs4IHA_HWv-2SfKnKV8vVHkmqZQbY-so
Message-ID: <CAPd4Wez7eLunDbCmKs19S=q-DM3-kUs0=wwjxRi+pq1waq1RqA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] riscv: add support for SBI Supervisor Software Events
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <pjw@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>, 
	Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_001059_636366_7300E45E 
X-CRM114-Status: GOOD (  41.84  )
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

T24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgMTI6MjPigK9QTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gSGkgUGF1bCwKPgo+IFRoYW5rcyBmb3IgY2FyaW5n
IGFib3V0IHRoaXMgc2VyaWVzIDspCj4KPiBPbiAxMC8xMC8yMDI1IDAzOjMyLCBQYXVsIFdhbG1z
bGV5IHdyb3RlOgo+ID4gSGkgQ2zDqW1lbnQsCj4gPgo+ID4gT24gTW9uLCA4IFNlcCAyMDI1LCBD
bMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gPgo+ID4+IFRoZSBTQkkgU3VwZXJ2aXNvciBTb2Z0d2Fy
ZSBFdmVudHMgKFNTRSkgZXh0ZW5zaW9ucyBwcm92aWRlcyBhIG1lY2hhbmlzbQo+ID4+IHRvIGlu
amVjdCBzb2Z0d2FyZSBldmVudHMgZnJvbSBhbiBTQkkgaW1wbGVtZW50YXRpb24gdG8gc3VwZXJ2
aXNvcgo+ID4+IHNvZnR3YXJlIHN1Y2ggdGhhdCBpdCBwcmVlbXB0cyBhbGwgb3RoZXIgc3VwZXJ2
aXNvciBsZXZlbCB0cmFwcyBhbmQKPiA+PiBpbnRlcnJ1cHRzLiBUaGlzIGV4dGVuc2lvbiBpcyBp
bnRyb2R1Y2VkIGJ5IHRoZSBTQkkgdjMuMCBzcGVjaWZpY2F0aW9uWzFdLgo+ID4+Cj4gPj4gVmFy
aW91cyBldmVudHMgYXJlIGRlZmluZWQgYW5kIGNhbiBiZSBzZW5kIGFzeW5jaHJvbm91c2x5IHRv
IHN1cGVydmlzb3IKPiA+PiBzb2Z0d2FyZSAoUkFTLCBQTVUsIERFQlVHLCBBc3luY2hyb25vdXMg
cGFnZSBmYXVsdCkgZnJvbSBTQkkgYXMgd2VsbAo+ID4+IGFzIHBsYXRmb3JtIHNwZWNpZmljIGV2
ZW50cy4gRXZlbnRzIGNhbiBiZSBlaXRoZXIgbG9jYWwgKHBlci1oYXJ0KSBvcgo+ID4+IGdsb2Jh
bC4gRXZlbnRzIGNhbiBiZSBuZXN0ZWQgb24gdG9wIG9mIGVhY2ggb3RoZXIgYmFzZWQgb24gcHJp
b3JpdHkgYW5kCj4gPj4gY2FuIGludGVycnVwdCB0aGUga2VybmVsIGF0IGFueSB0aW1lLgo+ID4+
Cj4gPj4gRmlyc3QgcGF0Y2ggYWRkcyB0aGUgU1NFIGRlZmluaXRpb25zLiBTZWNvbmQgb25lIGFk
ZHMgc3VwcG9ydCBmb3IgU1NFCj4gPj4gYXQgYXJjaCBsZXZlbCAoZW50cnkgY29kZSBhbmQgc3Rh
Y2sgYWxsb2NhdGlvbnMpIGFuZCB0aGlyZCBvbmUgYXQgZHJpdmVyCj4gPj4gbGV2ZWwuIEZpbmFs
bHksIHRoZSBsYXN0IHBhdGNoIGFkZCBzdXBwb3J0IGZvciBTU0UgZXZlbnRzIGluIHRoZSBTQkkg
UE1VCj4gPj4gZHJpdmVyLiBBZGRpdGlvbmFsIHRlc3RpbmcgZm9yIHRoYXQgcGFydCBpcyBoaWdo
bHkgd2VsY29tZWQgc2luY2UgdGhlcmUKPiA+PiBhcmUgYSBsb3Qgb2YgcG9zc2libGUgcGF0aCB0
aGF0IG5lZWRzIHRvIGJlIGV4ZXJjaXNlZC4KPiA+Pgo+ID4+IEFtb25nc3QgdGhlIHNwZWNpZmlj
IHBvaW50cyB0aGF0IG5lZWRzIHRvIGJlIGhhbmRsZSBpcyB0aGUgaW50ZXJydXB0aW9uCj4gPj4g
YXQgYW55IHBvaW50IG9mIHRoZSBrZXJuZWwgZXhlY3V0aW9uIGFuZCBtb3JlIHNwZWNpZmljYWxs
eSBhdCB0aGUKPiA+PiBiZWdpbm5pbmcgb2YgZXhjZXB0aW9uIGhhbmRsaW5nLiBEdWUgdG8gdGhl
IGZhY3QgdGhhdCB0aGUgZXhjZXB0aW9uIGVudHJ5Cj4gPj4gaW1wbGVtZW50YXRpb24gdXNlcyB0
aGUgU0NSQVRDSCBDU1IgYXMgYm90aCB0aGUgY3VycmVudCB0YXNrIHN0cnVjdCBhbmQKPiA+PiBh
cyB0aGUgdGVtcG9yYXJ5IHJlZ2lzdGVyIHRvIHN3aXRjaCB0aGUgc3RhY2sgYW5kIHNhdmUgcmVn
aXN0ZXIsIGl0IGlzCj4gPj4gZGlmZmljdWx0IHRvIHJlbGlhYmx5IGdldCB0aGUgY3VycmVudCB0
YXNrIHN0cnVjdCBpZiB3ZSBnZXQgaW50ZXJydXB0ZWQKPiA+PiBhdCB0aGlzIHNwZWNpZmljIG1v
bWVudCAoaWUsIGl0IG1pZ2h0IGNvbnRhaW4gMCwgdGhlIHRhc2sgcG9pbnRlciBvciB0cCkuCj4g
Pj4gQSBmaXh1cC1saWtlIG1lY2hhbmlzbSBpcyBub3QgcG9zc2libGUgZHVlIHRvIHRoZSBuZXN0
ZWQgbmF0dXJlIG9mIFNTRQo+ID4+IHdoaWNoIG1ha2VzIGl0IHJlYWxseSBoYXJkIHRvIG9idGFp
biB0aGUgb3JpZ2luYWwgaW50ZXJydXB0aW9uIHNpdGUuIEluCj4gPj4gb3JkZXIgdG8gcmV0cmll
dmUgdGhlIHRhc2sgaW4gYSByZWxpYWJsZSBtYW5uZXIsIGFkZCBhbiBhZGRpdGlvbmFsCj4gPj4g
X19zc2VfZW50cnlfdGFzayBwZXJfY3B1IGFycmF5IHdoaWNoIHN0b3JlcyB0aGUgY3VycmVudCB0
YXNrLiBJZGVhbGx5LAo+ID4+IHdlIHdvdWxkIG5lZWQgdG8gbW9kaWZ5IHRoZSB3YXkgd2UgcmV0
cmlldmUvc3RvcmUgdGhlIGN1cnJlbnQgdGFzayBpbgo+ID4+IGV4Y2VwdGlvbiBoYW5kbGluZyBz
byB0aGF0IGl0IGRvZXMgbm90IGRlcGVuZCBvbiB0aGUgcGxhY2Ugd2hlcmUgaXQncwo+ID4+IGlu
dGVycnVwdGVkLgo+ID4+Cj4gPj4gQ29udHJhcnkgdG8gcHNldWRvIE5NSSBbMl0sIFNTRSBkb2Vz
IG5vdCBtb2RpZmllcyB0aGUgd2F5IGludGVycnVwdHMgYXJlCj4gPj4gaGFuZGxlZCBhbmQgZG9l
cyBub3QgYWRkcyBhbnkgb3ZlcmhlYWQgdG8gZXhpc3RpbmcgY29kZS4gTW9yZW92ZXIsIGl0Cj4g
Pj4gcHJvdmlkZXMgInRydWUiIE5NSS1saWtlIGludGVycnVwdHMgd2hpY2ggY2FuIGludGVycnVw
dCB0aGUga2VybmVsIGF0Cj4gPj4gYW55IHRpbWUgKGV2ZW4gaW4gZXhjZXB0aW9uIGhhbmRsaW5n
KS4gVGhpcyBpcyBwYXJ0aWN1bGFybHkgY3J1Y2lhbCBmb3IKPiA+PiBSQVMgZXJyb3JzIHdoaWNo
IG5lZWRzIHRvIGJlIGhhbmRsZWQgYXMgZmFzdCBhcyBwb3NzaWJsZSB0byBhdm9pZCBhbnkKPiA+
PiBmYXVsdCBwcm9wYWdhdGlvbi4KPiA+Pgo+ID4+IEEgdGVzdCBzdWl0ZSBpcyBhdmFpbGFibGUg
YXMgYSBzZXBhcmF0ZSBrc2VsZnRlc3QgbW9kdWxlLiBJbiBvcmRlciB0bwo+ID4+IGJ1aWxkIGl0
LCB5b3UgY2FuIHVzZSB0aGUgZm9sbG93aW5nIGNvbW1hbmQ6Cj4gPj4KPiA+PiAkIEtESVI9PGJ1
aWxkX2Rpcj4gbWFrZSBPPWJ1aWxkIFRBUkdFVFM9InJpc2N2L3NzZSItaiAkKCgkKG5wcm9jKS0x
KSkgLUMgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMKPiA+Pgo+ID4+IFRoZW4gbG9hZCB0aGUgbW9k
dWxlIHVzaW5nOgo+ID4+Cj4gPj4gJCBzaCBydW5fc3NlX3Rlc3Quc2gKPiA+Pgo+ID4+IEEgS1ZN
IFNCSSBTU0UgZXh0ZW5zaW9uIGltcGxlbWVudGF0aW9uIGlzIGF2YWlsYWJsZSBhdCBbMl0uCj4g
Pj4KPiA+PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1zYmkt
ZG9jL3JlbGVhc2VzL2Rvd25sb2FkL3YzLjAtcmM3L3Jpc2N2LXNiaS5wZGYgWzFdCj4gPj4gTGlu
azogaHR0cHM6Ly9naXRodWIuY29tL3Jpdm9zaW5jL2xpbnV4L3RyZWUvZGV2L2NsZWdlci9zc2Vf
a3ZtIFsyXQo+ID4KPiA+IEkgdXBkYXRlZCB0aGVzZSB0byBhcHBseSBvbiBMaW51cycgY3VycmVu
dCBtYXN0ZXIsIGNvbW1pdCA1NDcyZDYwYzEyOWYsCj4gPiBjbGVhbmVkIHVwIHRoZSBjaGVja3Bh
dGNoLnBsIC0tc3RyaWN0IGlzc3VlcywgYXBwbGllZCBBbnVwJ3MgcHJfaW5mbygpCj4gPiBzdWdn
ZXN0aW9uLCBhbmQgcHVzaGVkIHRoZW0gdXAgaGVyZSB0byBtYWtlIGl0IGNvbnZlbmllbnQgZm9y
IGZvbGtzIHRvCj4gPiBpbnRlZ3JhdGUgYW5kIHRlc3Q6Cj4gPgo+ID4gICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wancvcmlzY3YuZ2l0Lz9oPXJpc2N2
LWV4cGVyaW1lbnRhbC1mb3ItdjYuMTgKPiA+Cj4gPiBBbSBhc3N1bWluZyB5b3UgZGlkbid0IGhh
dmUgb3RoZXIgY2hhbmdlcyB0aGF0IHlvdSB3YW50ZWQgdG8gbWFrZTsgbGV0IG1lCj4gPiBrbm93
IGlmIHRoYXQncyBub3QgdGhlIGNhc2UuCj4KPiBJbmRlZWQsIEkgZG8gbm90IGhhdmUgcGVuZGlu
ZyBtb2RpZmljYXRpb24gZm9yIHRoaXMgc2VyaWVzLiBUaGUgS1ZNIFNCSQo+IFNTRSBzdXBwb3J0
IHdpbGwgYmUgc3VibWl0dGVkIGxhdGVyIHRoYXQgeWVhci4KCkkgYW0gdGVzdGluZyB0aGlzIHNl
cmllcyB3aXRoIG15IFJBUyBwYXRjaCBzZXQuIFdpbGwgdXBkYXRlIG9uIHRoaXMuCgpUaGFua3MK
UmVnYXJkcwpIaW1hbnNodQoKPgo+ID4KPiA+IEkgbm90aWNlZCB0aGF0IHlvdSBhc2tlZCBmb3Ig
Zm9sa3MgdG8gZG8gYWRkaXRpb25hbCB0ZXN0aW5nLCBwYXJ0aWN1bGFybHkKPiA+IG9mIHRoZSBT
QkkgUE1VIGRyaXZlciBpbnRlZ3JhdGlvbiwgYnV0IGRpZG4ndCBub3RpY2UgYW55IGFkZGl0aW9u
YWwKPiA+IFRlc3RlZC1ieTpzLiAgSXQgd291bGQgYmUgZ3JlYXQgaWYgb3RoZXIgZm9sa3Mgb24g
dGhlIGxpc3QgY291bGQgZG8gc29tZQo+ID4gZm9jdXNlZCB0ZXN0aW5nIG5vdywgcGFydGljdWxh
cmx5IHNpbmNlIHdlJ3JlIG9uIHY3IG9mIHRoaXMgc2VyaWVzLCBhbmQKPiA+IEknbSBzdXJlIG90
aGVycyBjYXJlIGFib3V0IHRoaXMuCj4KPiAgSSB3b3VsZCBoYXZlIHByZWZlciBhIGJpdCBtb3Jl
IHJldmlld3MgYW5kIHRlc3RpbmcgYmVmb3JlIGdvaW5nIHRocm91Z2gKPiBzaW5jZSBTU0UgY2Fu
IGJlIHF1aXRlIGludHJ1c2l2ZSBhdCBleGVjdXRpb24gdGltZSAoZXZlbiB0aG91Z2ggdGhlCj4g
Y2xhc3NpYyBJUlEgcGF0aCBzaG91bGQgbm90IGJlIGltcGFjdGVkLCBJIGV4cGVjdCBtb3N0bHkg
ZmVlZGJhY2svYnVncwo+IGZyb20gdGhlIFNTRSBoYW5kbGluZyBwYXRoIGl0c2VsZikuIFdlJ2xs
IHNlZSBpbiBhIGZldyBkYXlzIGlmIHBlb3BsZQo+IGZpbmQgc3VjaCBwcm9ibGVtcy4KPgo+IFRo
YW5rcywKPgo+IENsw6ltZW50Cj4KPgo+ID4KPiA+Cj4gPiB0aGFua3MsCj4gPgo+ID4gLSBQYXVs
Cj4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
