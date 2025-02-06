Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDE0C02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 01:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LvvTXwEL1ar+pD8T6L2PBOPxz1yqG5QNF3Bm9vx4W8=; b=iq44cWLIpebNU3
	JHZXVsUMmv6p0CzIdE1vDqr1XRzrsdOAt4q1nRg2YI7nmULaJRUSeLeT8AzX9x/kDPXg9tBWLhRth
	pirqhJ8vPcPUx6Ejb5jJrNQhm6nvB3AlrEun7Y3zre4taHZC30I/Z2Polkr6nMkPFlXj2dRT7XrCs
	bjqe+jU/3UJaFxplNVJfxAPe9EiZgF8xVx2sZ+dtY3dwThqMu66Wp/vqLgQ4NH+gHSQt+lY8RSahD
	nlf6aIILtyZn+3vU0Vh7a6GMr4BxfQYKJnDNehj/aPgc1Dd4SzPo9XwVHZeAbRW1nTCPluI4LeEfN
	OeL9eof/AM4bUkMe7ggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfqLP-00000004xfj-0c7f;
	Thu, 06 Feb 2025 01:06:15 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfqLM-00000004xe6-1E96
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 01:06:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38dabb11eaaso153708f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 17:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738803970; x=1739408770; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXC13o6D8+SRcnZ4bUuI8mYmE2RIqCqJ9wgb+sl11jc=;
        b=i+pXF1nnRlO5443Z0hj8xaJYAwN8/NWUmmzYkqwZVTf7fALhy1rfEPUd+Zi/59cGm2
         +kVrL42seMDsGjD1zlq3X7U+OsUcIuqUM73SX8n6LU0s9XRigw8n/QKRyHMkKXUKV3+k
         u7wQKDzOrXfKmjwmk9Mf+Xsxnf2EklxAxY+ofzyEQaK/6KyEMByeTNzsb4tqW1VHVaZV
         6JvtfySvb4iCel1wimtwJidubpCi40kZ8yw11gKQqpb7e+a0/Y0A6mFp6bvBQ5Je565E
         dN0Lc3eur8VucW3OnO68S3nY9licjPFX4Qu6DV+0GoU5sPEAsVSkbgfOVUc+bfFi38MR
         KzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738803970; x=1739408770;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXC13o6D8+SRcnZ4bUuI8mYmE2RIqCqJ9wgb+sl11jc=;
        b=aQQgu2YkA+6h/PO5A+9bkPc1JvlO/EVtXTm0GeXNPh0sgoIw5zxgHtmHrA1Rdopueo
         IUHsWV9jh0W65WCrxQOaFMAyxxpFxFQHVqGEZQyAyQ+28Mbqht43YCFQfgV/dm/EtGEs
         i8/06l9WMBTnLKUFksOVNwnIXKEtXtNLPhBhLTr314v2khSNfwhPN56OfjcBrPogrJyN
         iyjpsqAWaxg/RZ53lUhqarQoJYrBV0QlQAfgEXXp578K5GcpF4uDdk22JPWxxaC4wYRa
         kDT6ZNa3SrAzZQt2QrxttIf/KjdpdP6DUXy/yC6kex8xM+CaOkviKzfETaBX1Znwc2Yg
         ngIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGOMcKfX59Gu4gCpEqBfyLkjFT8k4+QOFlutlSYDjk4WINJnAn4+jiya+0WSlXG32D/+GvHtxpg8cNxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzMgnC7FgphMcEkPW1Gk05SPEe+NI7qEmvGFOwR0WGiq8fOqsk
	CPN2NSyYPxPFgi6To9MxoI0hLcr3P0MzfGPHT5KTh9GBprqetcG+x2Z2qMvz4P0=
X-Gm-Gg: ASbGnctYq+8W7ncT6B3wDjPg/5iPxpGwWUe8uYKGbLKR6DEs4WAzl9XYRy98R8AAAw5
	M0Sl3WEKcENc6yRm1FNWEXkr+79rp4s42iFJEpG6bJmns1sovaposgI2L9lmjP0OTU30q9adcYO
	f0ny9zoL6dQTrUrEuQzOXXWho02C37l2dLsemGOQZoWVktvr2PdKMQy3crFCWyzGltO38EvaZhB
	0pW0RXpyTcLo9s0tr923NIjtlteJfvh+E0NSCPNXsneOfdtM6TGnCSxVD/m+J628fkhfHwPoGAz
	o8xfuTAtkhf7Qq7qM2qdLjVzGfN4
X-Google-Smtp-Source: AGHT+IEwac37+EXHhjn9+QPVtQMUBZtDhAuPXBew4a2Q2YL1bLmJ4OaTvYU/Tl6sFbBaC4yuKH/eUg==
X-Received: by 2002:a05:6000:1f87:b0:386:3e48:f732 with SMTP id ffacd0b85a97d-38db4873819mr4226170f8f.16.1738803969824;
        Wed, 05 Feb 2025 17:06:09 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dcc7sm246954f8f.88.2025.02.05.17.06.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2025 17:06:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for
 x86
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org>
Date: Thu, 6 Feb 2025 01:05:56 +0000
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 luto@kernel.org,
 xin@zytor.com,
 kirill.shutemov@linux.intel.com,
 palmer@dabbelt.com,
 tj@kernel.org,
 andreyknvl@gmail.com,
 brgerst@gmail.com,
 ardb@kernel.org,
 dave.hansen@linux.intel.com,
 jgross@suse.com,
 will@kernel.org,
 akpm@linux-foundation.org,
 arnd@arndb.de,
 corbet@lwn.net,
 dvyukov@google.com,
 richard.weiyang@gmail.com,
 ytcoode@gmail.com,
 tglx@linutronix.de,
 hpa@zytor.com,
 seanjc@google.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 justinstitt@google.com,
 jason.andryuk@amd.com,
 glider@google.com,
 ubizjak@gmail.com,
 jannh@google.com,
 bhe@redhat.com,
 vincenzo.frascino@arm.com,
 rafael.j.wysocki@intel.com,
 ndesaulniers@google.com,
 mingo@redhat.com,
 catalin.marinas@arm.com,
 junichi.nomura@nec.com,
 nathan@kernel.org,
 ryabinin.a.a@gmail.com,
 dennis@kernel.org,
 bp@alien8.de,
 kevinloughlin@google.com,
 morbo@google.com,
 dan.j.williams@intel.com,
 julian.stecklina@cyberus-technology.de,
 peterz@infradead.org,
 kees@kernel.org,
 kasan-dev@googlegroups.com,
 x86@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 llvm@lists.linux.dev,
 linux-doc@vger.kernel.org
Message-Id: <29A74A26-E922-4A4F-9B4A-8DB0336B99DF@jrtc27.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
 <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com>
 <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_170612_343311_39C45A5B 
X-CRM114-Status: UNSURE (   9.91  )
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

T24gNSBGZWIgMjAyNSwgYXQgMTg6NTEsIENocmlzdG9waCBMYW1ldGVyIChBbXBlcmUpIDxjbEBn
ZW50d28ub3JnPiB3cm90ZToKPiAKPiBPbiBUdWUsIDQgRmViIDIwMjUsIEplc3NpY2EgQ2xhcmtl
IHdyb3RlOgo+IAo+PiBJdOKAmXMgbm90IOKAnG5vIHBlcmZvcm1hbmNlIHBlbmFsdHnigJ0sIHRo
ZXJlIGlzIGEgY29zdCB0byB0cmFja2luZyB0aGUgTVRFCj4+IHRhZ3MgZm9yIGNoZWNraW5nLiBJ
biBhc3luY2hyb25vdXMgKG9yIGFzeW1tZXRyaWMpIG1vZGUgdGhhdOKAmXMgbm90IHRvbwo+IAo+
IAo+IE9uIEFtcGVyZSBQcm9jZXNzb3IgaGFyZHdhcmUgdGhlcmUgaXMgbm8gcGVuYWx0eSBzaW5j
ZSB0aGUgbG9naWMgaXMgYnVpbGQKPiBpbnRvIHRoZSB1c3VhbCByZWFkL3dyaXRlIHBhdGhzLiBU
aGlzIGlzIGJ5IGRlc2lnbi4gVGhlcmUgbWF5IGJlIG9uIG90aGVyCj4gcGxhdGZvcm1zIHRoYXQg
Y2Fubm90IGRvIHRoaXMuCgpZb3UgaGVscGZ1bGx5IGN1dCBvdXQgYWxsIHRoZSBleHBsYW5hdGlv
biBvZiB3aGVyZSB0aGUgcGVyZm9ybWFuY2UKcGVuYWx0eSBjb21lcyBmcm9tLiBCdXQgaWYgaXTi
gJlzIGFzIHlvdSBzYXkgSSBjYW4gb25seSBhc3N1bWUgeW91cgpkZXNpZ24gY2hvb3NlcyB0byBz
dGFsbCBhbGwgc3RvcmVzIHVudGlsIHRoZXkgaGF2ZSBhY3R1YWxseSB3cml0dGVuLCBpbgp3aGlj
aCBjYXNlIHlvdSBoYXZlIGEgcGVyZm9ybWFuY2UgY29zdCBjb21wYXJlZCB3aXRoIGhhcmR3YXJl
IHRoYXQKb21pdHRlZCBNVEUgb3Igb3B0aW1pc2VzIGZvciBub24tc3luY2hyb25vdXMgTVRFLiBU
aGUgbGl0ZXJhdHVyZSBvbiBNVEUKYWdyZWVzIHRoYXQgaXQgaXMgbm90IG5vIHBlbmFsdHkgKGJ1
dCBjYW4gYmUgbG93IHBlbmFsdHkpLiBJIGRvbuKAmXQKcmVhbGx5IHdhbnQgdG8gaGF2ZSBzb21l
IGJpZyBkZWJhdGUgaGVyZSBhYm91dCB0aGUgaW5zIGFuZCBvdXRzIG9mIE1URSwKaXTigJlzIG5v
dCB0aGUgcGxhY2UgZm9yIGl0LCBidXQgSSB3aWxsIHN0YW5kIHVwIGFuZCBwb2ludCBvdXQgdGhh
dApjbGFpbWluZyBNVEUgdG8gYmUg4oCcbm8gcGVyZm9ybWFuY2UgcGVuYWx0eeKAnSBpcyBtaXNy
ZXByZXNlbnRhdGl2ZSBvZiB0aGUKdHJ1dGgKCkplc3MKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
