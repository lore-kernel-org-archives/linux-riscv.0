Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EA6CA0EFA
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IT8+yjRBmtNAyqB2w8ShUvPgOTuRJq9aTxtEb1va5E=; b=mPkM53CaDDr2WY
	+tgdnG7BXIikLFE6TovAqfZfscG6lB/ULpW93XF0baGLUF/0POQ9+cSakBX3RUiZfKTHvqoChpf/b
	CbOEcG21SrSexb6PBS8OXrT7wt6Rqe82cNmbEaHIu/ZN8yAe5lsMoSoCdQhAcUQ/uik2ojoInvGTB
	pPk/fLKyw+8Fb3ND0sUT4V8jiB5/PpzoAKwpd9UuCQ2fjRMwBN0DC10vuXQNXO6igoqzbA3s/fsP1
	4lcMZtOBLcrnRoaIWINQhlxonNgitcv+8N3i+0pGV0XADxNKhcyeuEQ2SYyLfkOsqKhIIOr8b6JQD
	fNTM7lttFiddqVkHY7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqa6b-00000008faY-1qWY;
	Mon, 25 Aug 2025 16:31:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZE3-00000008XEU-1v08;
	Mon, 25 Aug 2025 15:35:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A3034069E;
	Mon, 25 Aug 2025 15:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011FEC4CEED;
	Mon, 25 Aug 2025 15:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756136115;
	bh=DJjOmkVujeC5JzsbUheOOz5HCUqqi0gOpXXCgeiknkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdmBXckubJWHEXmKqcoBXuKEg4sUWopFtgGS8CKU6AYg17qDR9d4sAIFF7YZcTjLg
	 +9bpRB9qMnzrlApo2L4kU8KTtH6EcgOtoChsicI3YfkBfzj3bTXYtQTAvsmdef+4mu
	 jZFOTgnbrqRUuqb+wMsUj7pzNS7gmcdr2KHeo+Bb2Z79HW6SoBTsAHksQkkMSxZeIr
	 m0yNkjx2elCNQ9F5SA2nuLkJmL+4yl9P4s5D64UAf2gU1/uH3I2g1zdoE5ZeomcWI5
	 35NMHJFivKJtXYbojPIzbyphYxV4aWgHrEIdOtDPkaX0ujVfi3lGMMVyaYnorRZOvv
	 ETPnUGlCWOgNg==
Date: Mon, 25 Aug 2025 08:35:14 -0700
From: Kees Cook <kees@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>,
	Sami Tolvanen <samitolvanen@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
Message-ID: <202508250834.E2456B9@keescook>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_083515_514874_2D49B7CA 
X-CRM114-Status: GOOD (  13.02  )
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

T24gTW9uLCBBdWcgMjUsIDIwMjUgYXQgMDU6MDE6MTNQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIE1vbiwgQXVnIDI1LCAyMDI1IGF0IDQ6MjjigK9QTSBLZWVzIENvb2sgPGtlZXNA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gLWNvbmZpZyBDRklfQ0xBTkcKPiA+IC0gICAgICAg
Ym9vbCAiVXNlIENsYW5nJ3MgQ29udHJvbCBGbG93IEludGVncml0eSAoQ0ZJKSIKPiA+IC0gICAg
ICAgZGVwZW5kcyBvbiBBUkNIX1NVUFBPUlRTX0NGSV9DTEFORwo+ID4gK2NvbmZpZyBDRkkKPiA+
ICsgICAgICAgYm9vbCAiVXNlIEtlcm5lbCBDb250cm9sIEZsb3cgSW50ZWdyaXR5IChrQ0ZJKSIK
PiA+ICsgICAgICAgZGVwZW5kcyBvbiBBUkNIX1NVUFBPUlRTX0NGSQo+ID4gICAgICAgICBkZXBl
bmRzIG9uICQoY2Mtb3B0aW9uLC1mc2FuaXRpemU9a2NmaSkKPiA+ICAgICAgICAgaGVscAo+IAo+
IERvIHdlIG5lZWQgdG8gZG8gc29tZXRoaW5nIHRvIG1ha2UgdGhlIHRyYW5zaXRpb24gc21vb3Ro
ZXIsIGkuZS4KPiBrZWVwaW5nIHRoZSBvbGQgb25lIGZvciBhIHdoaWxlIHRvIGF2b2lkIGEgbmV3
IHF1ZXN0aW9uIGV0Yy4/CgpZZWFoLCB0aGF0J3MgYSBnb29kIGlkZWEuIFdoYXQgdGhlIHJpZ2h0
IHdheSB0byBkbyB0aGF0PwoKY29uZmlnIENGSV9DTEFORwoJYm9vbCAiVXNlIENsYW5nJ3MgQ29u
dHJvbCBGbG93IEludGVncml0eSAoQ0ZJKSIKCWRlcGVuZHMgb24gQVJDSF9TVVBQT1JUU19DRkkK
CXNlbGVjdCBDRkkKCj8KCi0tIApLZWVzIENvb2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
