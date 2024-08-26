Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23BDC5472D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 17:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMKEtVeQF+zivjOWnvmNAtTQPZ4oC6TnhGzVnJyGSDE=; b=z9H4Dq/GttNwEg
	rl1Zf2czI3qJqp0gvbTBogQkmLTCZMmLs4zSK1gUvM6bGkft3p1E5PNTggRCMU+UpRFb9JNKEX3ST
	NLJ5RW5X2Y+RWNUyA0EhtAB2PExqoQidOLk1c4PnGiJWrr4LPwMNJWv+0zzs5yBVrmFyQzOtDJdJn
	0FpJz6FYKdJ0OSR3MFau9BiaHRgKC4v0ltA/BRaUYLpgEpuPIoX0t0Wht+zmcd/+WNGUtMYSjkUHy
	9qj+4JZbL6X0Umv4yF1wREhcPTkeMsRBf3l1973g26vx9x0eZbCzud9hFKkxxnzFD3FggL/6dpq9E
	2B6mszwWMQFlgcMsQ7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sidTt-00000008Cbf-2flo;
	Mon, 26 Aug 2024 17:26:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sidQC-00000008BR2-03Am
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 17:22:29 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-428243f928cso40944955e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 10:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724692945; x=1725297745; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=owbqJXu8r6ZVrIB9CmtF0sA6DYb33fLeb9l3H1ArS6Y=;
        b=mTwRnBwgkVDyMXS3kBRLlIE7DWGdwix6rNK6uSLrXSPL4n/Oj4yArGbv95yIM9y5yp
         bshD4Ya+IlmzQFdn18gMb1gsvqun/Yd5nGR2ZqlfgBCq5EDGgkQgrBBdzl3eaaPOpE4V
         3kZHhtl4Er0w9GE00vjsHwZCRDh0gE4iiSZr1ppheyyXxqPLXLzv6oyskRv0MnTIxRUD
         H2i4Xv3k35vs5f1hGqWVWPDLQgZuZXshnPsJNYnMQYgKS7bnnma8JlxapkpN9268CJQE
         hpvYmFxspuR3GtiXhTpvj1Ruga/yK1zqImasW7SvTuS+rlqEV50xdljtF/0YSb06TWUe
         iJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724692945; x=1725297745;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owbqJXu8r6ZVrIB9CmtF0sA6DYb33fLeb9l3H1ArS6Y=;
        b=n+eHtOrkzkS+LvLiOyNIHo2MXGEB8fxTEFvf8plReMH/28s1lzHgigWSoJSexHi/zU
         l4I7wYhfg61/OAJWW/xy1HoBdGt+/jo7kySJ8bMr2GtmxtNPHzhS/zaTBrlNExk8oOpE
         IWukQQFRsTM86KRBAUAZWXMHLU280fuJcBBr/zUse1xWuQ8UmxS+ok48c2ePAXukdc3X
         BBqq1aPURa1BVj8F4ls4SFWLL2+MTp6mZ/HQib34TaJSUpnTeFx5UeJZ8cDG6Q2J6hMx
         DXpaRZFs1tW4G81Md9dBgRBcoYLExhLUYkI20dTRcKxsL3d/XVC79kLNJtPxiE+0hy/G
         AgeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwJm/Ls0+JLdQFaQRSAIR6b+vZMD7RZdd91wdOxgGReZ+wUwNKfp89q0M7q8Se8YPNigeLc3MkHAoVZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YynQf1DChtGL52uk1HDFh4sCga70lFexEx0dJEAMwnpTRAzkqM4
	pXXRo4mpuaG/q45k6kWCSXdsYOWvQInk6HYYoY2StQX1lDxqRa1gjQ0XB4bgSdwWrmLn8SZEU81
	8MuU=
X-Google-Smtp-Source: AGHT+IE/SRgvK54LwpBMAx+pBV1j6adr/sKFTs5Qr83pIPvX8proSmWucvbwrmsFVhpNjSBejE38cQ==
X-Received: by 2002:a05:600c:444e:b0:428:1965:450d with SMTP id 5b1f17b1804b1-42acc8e2397mr78248345e9.17.1724692401303;
        Mon, 26 Aug 2024 10:13:21 -0700 (PDT)
Received: from sunil-laptop ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abed8b666sm196588125e9.1.2024.08.26.10.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 10:13:20 -0700 (PDT)
Date: Mon, 26 Aug 2024 22:43:07 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: Re: [PATCH v8 00/17] RISC-V: ACPI: Add external interrupt controller
 support
Message-ID: <Zsy3o_N8hvc6GfTp@sunil-laptop>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
 <ZrlgVUXC_dCW9ISM@sunil-laptop>
 <87mskzcnmf.ffs@tglx>
 <CAJZ5v0imJcU4cwDuZKEvGf93fZm4ea4s2Ocp3Cnfb3+nBQ0-Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0imJcU4cwDuZKEvGf93fZm4ea4s2Ocp3Cnfb3+nBQ0-Gg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_102228_075332_CA97551D 
X-CRM114-Status: GOOD (  21.00  )
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

T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgMDY6MTU6MThQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgNToyNeKAr1BNIFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEF1ZyAxMiAy
MDI0IGF0IDA2OjM3LCBTdW5pbCBWLiBMLiB3cm90ZToKPiA+ID4gT24gTW9uLCBBdWcgMTIsIDIw
MjQgYXQgMDY6Mjk6MTJBTSArMDUzMCwgU3VuaWwgViBMIHdyb3RlOgo+ID4gPj4gVGhpcyBzZXJp
ZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgYmVsb3cgRUNSIGFwcHJvdmVkIGJ5IEFTV0cuCj4gPiA+
PiAxKSBNQURUIC0gaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xb01HUHlPRDU4SmFQ
Z01sMXBLYXNULVZLc0lLaWE3elIvdmlldz91c3A9c2hhcmluZwo+ID4gPj4KPiA+ID4+IFRoZSBz
ZXJpZXMgcHJpbWFyaWx5IGVuYWJsZXMgaXJxY2hpcCBkcml2ZXJzIGZvciBSSVNDLVYgQUNQSSBi
YXNlZAo+ID4gPj4gcGxhdGZvcm1zLgo+ID4gPgo+ID4gPiBUaGlzIHNlcmllcyBoYXMgc3BlbnQg
cXVpdGUgYSBiaXQgb2YgdGltZSBub3cgb24gdGhlIGxpc3QuIEFzIHlvdSBhcmUKPiA+ID4gYXdh
cmUsIGZldyBjbGFyaWZpY2F0aW9ucyBsaWtlIF9QSUMgY29kZXMgYXJlIGFsc28gZG9uZSBub3cu
IFRoZXJlIGlzCj4gPiA+IG5vIG1ham9yIGNoYW5nZSBhZnRlciB5b3UgaGFkIGFncmVlZCBmb3Ig
dGhlIGRlc2lnbi4gU28sIGNhbiB0aGlzIGJlCj4gPiA+IGNvbnNpZGVyZWQgZm9yIHRoZSBuZXh0
IHJlbGVhc2UgcGxlYXNlPwo+ID4KPiA+IFJhZmFlbCwgaWYgeW91IHdhbnQgdG8gdGFrZSBpdCB0
aHJvdWdoIHRoZSBBQ1BJIHRyZWUsIHRoZW4gZm9yIHRoZQo+ID4gaXJxY2hpcCBwYXJ0cyBwbGVh
c2UgYWRkOgo+ID4KPiA+ICAgQWNrZWQtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJv
bml4LmRlPgo+IAo+IFllcywgSSdtIGdvaW5nIHJvIGRvIHRoaXMuCj4gCj4gVGhhbmsgeW91IQpU
aGFua3MhCgpUaGVyZSB3aWxsIGJlIGEgY29uZmxpY3QgaW4gUExJQyBpcnFjaGlwIGRyaXZlciBk
dWUgdG8gYSByZWNlbnQgcGF0Y2ggWzFdLgpUaGlzIHBhdGNoIGlzIG5vdCBpbiBsYXRlc3QgUkM1
IHJlbGVhc2UgYnV0IGluIGxpbnV4LW5leHQuIEkgdXN1YWxseSBiYXNlIHRoZQpzZXJpZXMgb24g
bGF0ZXN0IFJDIHJlbGVhc2UuIFNob3VsZCBJIHJlYmFzZSB0byBsaW51eC1uZXh0IGluIHRoaXMg
Y2FzZQphbmQgc2VuZCB0aGUgbmV4dCByZXZpc2lvbiBvZiB0aGUgc2VyaWVzIHJlc29sdmluZyB0
aGUgY29uZmxpY3Q/CgpbMV0gLSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L2NvbW1pdC8/aWQ9NGQ5MzZmMTBmZjgwMjc0
ODQxNTM3YTI2ZDFmYmZlOTk4NGRlMGVmOQoKVGhhbmtzLApTdW5pbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
