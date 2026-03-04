Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A49CEB7ECA
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 11:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMiRQG3NkfmbHbi+22wm8oKNjQc4LxhxpF9Z5MYVsyw=; b=MDo+8vPpSjVdpv
	ntyPq6BfuggzS4ya6LvqIjpkz95mz8VEcLdG6LgHjKFuqHmwGtctrTGmApJ2bqfWCTPnGEWsnTUvC
	mVStdwzBP59k7g+KCdpYzHfBjJyzGeold1iqGFXeULxYapvkxbcM51aoZ+tIkhRtDxujgHmgBLQ79
	WHx1fWNvbCFgaicmt0dtFaKs/jiKx2xgZmANeUnvLxXm4JZStkeZf35q+YuvL4mmI4j2NwmfcmVue
	zhIAuuicLfb00Fzbq2b9eiHlsqQZ/OR8UcqwdupLEL6UXlaVUUclnWqaV2CnG6dTt0uOcirMY8mjh
	ww36RtVtUSPqck2oRWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxk5t-0000000H3RG-0bu5;
	Wed, 04 Mar 2026 11:08:45 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxk5q-0000000H3QA-1QIQ
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 11:08:44 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7d19bfe1190so6118658a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 03:08:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772622521; cv=none;
        d=google.com; s=arc-20240605;
        b=NQvRG3AHnq/uQkbHgAFhCPBURbKlZ4MNxMSbVHiQdSftnXDtE3QWkfi6M2EQfkajzg
         /GYeyhwSlcO1Fo0s+KUm9BS0l68zXELpRQhvI6o6VRdDHTnBpWlavKkEK9zsmhkSPs3v
         NlhL1fMyUImELXhvzCR/ZhkAPQ87lIdzmitUzmw+9P0kRuNRbmfjxM1ZIuZ+vt1XlKVk
         mBTRMegKO2es2+n3Ae7XDcpdX7QC6PqrgcyWIls8x2oKWBCPNbQKBw+Q09N3SVlsmRYE
         goDB8Nw/hhLOfl7bvHCg7eJJiy518cCQV7aZATZwwoL95qNp6afDLF0bvDNYRwKRHaXD
         YFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=20V0HsiRCM8u2CycbPAhWN5bAO7CHOUhSKzXrUPLlhE=;
        fh=mkeWgxMPzqwF0H5GXusIQ95i7OeDU6ssW1NAUUCldzw=;
        b=K9NI4ULyLKW+7nYNMRZrRz5kzAledvnRDGtuNIpWYrYiCbS/m0bnJad7IABmKe/PXz
         gMxdFzOKPaoeNIud2YW1e+cFBMUk6sbujdObKPj1RPYKWiav71w8kx4G544jlq4kQV5q
         JcyrmcOHDZYQxoOvtBjlS1yYRsFA6T0AIGdjCzL7TCOMv/XD6Qgz+SKrnHNccLuA8rRV
         YxlkhhNbLTMxNzY6WPDjD95Gp05fFvP6iAtvXrYtMdup1PIAqxPUd2Sjw4RUjeNB9An1
         jkSqtaZscofIqiacyZh5C6FwSjUJAo+i5D+65SgjIMtiRuERa04fN8fcsyI2as0OZOV1
         LOzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772622521; x=1773227321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20V0HsiRCM8u2CycbPAhWN5bAO7CHOUhSKzXrUPLlhE=;
        b=0TdzYEAdsfIQIyHOGvX7ProYWojA8+be0CgdftfJFfhk5ek+Veblp+Fi+iQxjPd+Rn
         XXLXknveDygQOcvJSDm4rbrb2gtz1lGYskBquV3Scpwn4TRgy5xDU3qBomroa024vrik
         +puSuqsa/2u/bw828Ua+v2fPic7Mn9PdXMQMoREV/FmOe1hpkRwOxo9MbT3xpVE/k1+9
         17VGnsBtm0++Sk8/uFLMvaWZij3bGXCXQWzH47k/PtP7sAz4kguyaENsAERlRdqCvCTW
         fnvL8uXquq9D+C2DC4dpWEpV2JKefhUvjTm/MaEEEitOmaysgRya9DEZqY23vHB/zYj0
         lCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622521; x=1773227321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=20V0HsiRCM8u2CycbPAhWN5bAO7CHOUhSKzXrUPLlhE=;
        b=G5D/HQbLef3o2G0vVCKK9BNYxiWPui1McPUXfl4eBlJ1VbVVYDXFeG/Vu82V8Z/nBF
         l4yqCN11/UE0d+p0i/wAqLC8d+lVGRlwptz/ACgfp0Dw/UMcW6CoEQr4lGrpppimQFqb
         7VuVyXAbkZW3epBi4k6YvTDVFkMsdF4ioHmWePjjazCrlPb80jPF6gCA/7s2UDd15M4N
         4tl0sRZmfHEYI4mm8F9ASHybP7DrEYH1LXYrDe9wt+CwhkQl0er2gN6ovoM8wvaost61
         pXU5UjlWvhrbuFmqGn9a14ZgPs29hyetXI634iqjAomMX2bT4vPIQSNwTo6m1BP0b+GQ
         p3OA==
X-Forwarded-Encrypted: i=1; AJvYcCUyuYv6rnZTY/JE3l7D1CRRCsCjlMjrbU+7qXUeOo4m/37a8UIQZjw5UgdgHdrlB1SiS6B6Ctz0RAJokQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJAOYH0eWubAbSi6LBZVi16o+A89v/JLmnaIFr4mNmU7gY63R8
	zUoWUBtMIxh6CY/X4obS19+aB5ZzIhWTTdDWsvMqnimJvaIe+CwPn93UMCCeQ/csxxqwmf7Aub9
	5wU3NISo7xOe5Vnn9z2ZvCZuuzV77j4VCUvj1pkLOZg==
X-Gm-Gg: ATEYQzw2rWPbJMlrY6cb/vmamGQYegucR+9AOCjOrKbmMYzgtNcRdaA+D9/39ygvdIP
	QlPfo7nnW7XhvgFT96TUBB45y2mXErp2sB4B0R9PtV37RwkwsQB3YUng2VOGcW0VeOpNifI4v/a
	3E3IwkTSGMt0i0NbedsPY5eCDmhFBZeSz3AX1O/XcjgUq1mYBYYgH8PDQXg5p3Jonzr7cqMi8Hn
	tvUay49+yhl83NEHbl9OwBkSquM7bByRbJb2szvOOVoIHPdlpG6ZGoL8aH6z7YEAIJD7M93spaX
	QnYYwQVxaRQWkboVgOE1QjXYzclObTMsFtvC4CvMy5B9l514aoGn/4J7NEERyXtJsmk/63aW2lX
	QVVZjyhufwoi/DSX5DpLXC5s2/GU=
X-Received: by 2002:a05:6820:f021:b0:679:a463:c933 with SMTP id
 006d021491bc7-67b1e932124mr914892eaf.71.1772622520701; Wed, 04 Mar 2026
 03:08:40 -0800 (PST)
MIME-Version: 1.0
References: <20260303-kvm-riscv-spectre-v1-v2-0-192caab8e0dc@cispa.de>
In-Reply-To: <20260303-kvm-riscv-spectre-v1-v2-0-192caab8e0dc@cispa.de>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Mar 2026 16:38:29 +0530
X-Gm-Features: AaiRm50FApq9ik0ETo3HXP7rfW4o3U8qtmgzjhKd-QdWkzujkTa_K8xattka4x8
Message-ID: <CAAhSdy0nkke8sJR-wV9nrzc=VqdY4igYu9c8g14qudbEeR=27g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] KVM: riscv: Fix Spectre-v1 vulnerabilities in
 register access
To: Lukas Gerlach <lukas.gerlach@cispa.de>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Daniel Weber <daniel.weber@cispa.de>, Michael Schwarz <michael.schwarz@cispa.de>, 
	Marton Bognar <marton.bognar@kuleuven.be>, Jo Van Bulck <jo.vanbulck@kuleuven.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_030842_630236_62879EE6 
X-CRM114-Status: UNSURE (   9.92  )
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

T24gVHVlLCBNYXIgMywgMjAyNiBhdCA3OjQ54oCvUE0gTHVrYXMgR2VybGFjaCA8bHVrYXMuZ2Vy
bGFjaEBjaXNwYS5kZT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBhZGRzIGFycmF5X2luZGV4X25v
c3BlYygpIHRvIFJJU0MtViBLVk0gdG8gcHJldmVudAo+IHNwZWN1bGF0aXZlIG91dC1vZi1ib3Vu
ZHMgYWNjZXNzIHRvIGtlcm5lbCBtZW1vcnkuCj4KPiBTaW1pbGFyIGZpeGVzIGV4aXN0IGZvciB4
ODYgKGlvYXBpYywgbGFwaWMsIFBNVSkgYW5kIGFybTY0ICh2Z2ljKS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEx1a2FzIEdlcmxhY2ggPGx1a2FzLmdlcmxhY2hAY2lzcGEuZGU+Cj4gLS0tCj4gQ2hhbmdl
cyBpbiB2MjoKPiBBZGQgYXJyYXlfaW5kZXhfbm9zcGVjKCkgdG8gZm91ciBhZGRpdGlvbmFsIHNp
dGVzIGluIHZjcHVfcG11LmMKPiAoUmFkaW0gS3LEjW3DocWZKQo+Cj4gLS0tCj4gTHVrYXMgR2Vy
bGFjaCAoNCk6Cj4gICAgICAgS1ZNOiByaXNjdjogRml4IFNwZWN0cmUtdjEgaW4gT05FX1JFRyBy
ZWdpc3RlciBhY2Nlc3MKPiAgICAgICBLVk06IHJpc2N2OiBGaXggU3BlY3RyZS12MSBpbiBBSUEg
Q1NSIGFjY2Vzcwo+ICAgICAgIEtWTTogcmlzY3Y6IEZpeCBTcGVjdHJlLXYxIGluIGZsb2F0aW5n
LXBvaW50IHJlZ2lzdGVyIGFjY2Vzcwo+ICAgICAgIEtWTTogcmlzY3Y6IEZpeCBTcGVjdHJlLXYx
IGluIFBNVSBjb3VudGVyIGFjY2Vzcwo+Cj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAg
fCAxMSArKysrKysrKystLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2ZwLmMgICAgIHwgMTcgKysr
KysrKysrKysrKy0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyB8IDM2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Bt
dS5jICAgIHwgMTQgKysrKysrKysrKystLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRp
b25zKCspLCAxNyBkZWxldGlvbnMoLSkKClF1ZXVlZCB0aGVzZSBwYXRjaGVzIGFzIGZpeGVzIGZv
ciBMaW51eC03LjAtcmNYCgpUaGFua3MsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
