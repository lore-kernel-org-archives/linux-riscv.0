Return-Path: <SRS0=9/xT=LY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE1CC11F65
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jun 2021 11:59:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9F9E61585
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jun 2021 11:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9F9E61585
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLKSzj4k390jHm1ROWEBxMiosHqQnHgogcbqqsYW9LE=; b=bjzVoD0mZRFyKM
	IapqCCBsUgTuUTZuHDA3s73uAFOLe2s3B+oeqdfVAqfq8fjeUJWUPhp4udqJd+TyEzir1tyq11YT7
	JIGOh0WRZqLhWaEEDjPncPT9RFTYUcWvC/MUue2YiWjUfKF+vyVPTQkhlzXQxykqTbis+hRLUv+Sn
	T+PwCqIKU574dlZqO/44l87c/bNd1sv7M/BEM14Fqhh63GhcPnsUgbgPgCrZBddoOlGxGxVO6AJFH
	o9URt7rJ3oyuxGS9LHIiREILTWao9Vno6yESI4XKowEklrn3UbAHIOs8TjKyrnLnsYVK88/wkD/Za
	CTIb117SkxYYHsNRupBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyYrv-00DmEN-O3; Wed, 30 Jun 2021 11:59:03 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyYrk-00DmCS-TH
 for linux-riscv@lists.infradead.org; Wed, 30 Jun 2021 11:58:54 +0000
Received: by mail-yb1-xb35.google.com with SMTP id m9so4541786ybo.5
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 04:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EoB32QbQ3pte8D0g3hxaB2ZapmzM19t9cU1a9ijg6c0=;
 b=lk3MSBC2Q39HUJKogdU4FCGZV7LBZZHy5y7CJAAHQ9Evp0XLYibQqvwDGpSm9OPGfY
 MzfhUWMbOPFmTR7vVemZLdcwGlCAba8gjh6JDRaA0Bmeerti55Ca8Wwr+4XAxpJJeHu4
 MZIrs6clEfSZkY0ov02PGi8Gr+ElBoT36F3gu8TAIP6W2PZBzRmADm0n6JMp2xvyduJr
 ozXKDKYHSc/KFxDqOEs5k6BRgcyJxrOJGSyE0t3q57ezOBUghoxTYyuspJCtszwp3Xtc
 ES5GuVEpUu6q2QS8Q03q51Lqvbs1aS86GDHPcP+Cz2uHxAoY8M2soBuPP0ffKM4WJXGJ
 049A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EoB32QbQ3pte8D0g3hxaB2ZapmzM19t9cU1a9ijg6c0=;
 b=SWB2dln5tdtVXR9Ap/J7K6llv88ZCdm7gFWG5//2BCVcJEB14cGLkYmJ54dnZ+VlVv
 s6kONTQBIC37GWkAqGSnl5v6MmoA3ksZLeuXo/hNqOkfmVjxFsRIo3q59qw3eWzc40Ld
 4EvbimlOFgR51gtZ1QQ5VQaiRIv7RLpz9pCanr96+ph5T3VYOmVzavfAAVR6kda4GWHa
 AxZkju/ri2UaFzdPAL3i+nVx1EkVQAQLnL0ae3BQYEp/q3tdrk9xYVlQhXuuihR+/wSG
 hToShWrT+Kzhm/0DcqlZ14A55c6XenoPclQZLgmxrjjaPmRQ6MyC8NwkeDm4ugkYPJUM
 s82Q==
X-Gm-Message-State: AOAM5316Y7j0MVnJhb6ykox5behhcsYmhUJFQAeDmiUEbTQu4BpwjKVq
 7BEPKK75atFn8KlYhaXw4V17NfksFR2keeHmAdI=
X-Google-Smtp-Source: ABdhPJx0T9n/JTcxj2+m85UxkpSF62bTVpXOJ0ynahVA6xKjm0cwVmfFvSj5go+WHqQsjdGb2DR2yYyiGr8Ihw1G/X0=
X-Received: by 2002:a25:b701:: with SMTP id t1mr42905464ybj.517.1625054330916; 
 Wed, 30 Jun 2021 04:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210627135117.28641-1-bmeng.cn@gmail.com>
 <11706f7e-a53a-5640-d713-bc4562db71fa@huawei.com>
 <CAEUhbmV=h3nZ8Aa94_uyjrZ_NGe+9-xAorUMubSPJXu3y60PeQ@mail.gmail.com>
 <aa1f027c-bbc7-92f8-80a6-fe290cd1cdf8@huawei.com>
 <CAEUhbmXeqAsLxm+oCHRPHMZq2mQXPD6fJOFerwp_BRv1kCc7ow@mail.gmail.com>
In-Reply-To: <CAEUhbmXeqAsLxm+oCHRPHMZq2mQXPD6fJOFerwp_BRv1kCc7ow@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 30 Jun 2021 19:58:39 +0800
Message-ID: <CAEUhbmUvDSocWobb26PcrV6vi6kHjg8o6pNomt9AnGWGbvAuhw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix 32-bit RISC-V boot failure
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Atish Patra <atish.patra@wdc.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, stable <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_045852_988696_93AF9D46 
X-CRM114-Status: GOOD (  18.55  )
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

T24gTW9uLCBKdW4gMjgsIDIwMjEgYXQgMTE6MjEgQU0gQmluIE1lbmcgPGJtZW5nLmNuQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAyOCwgMjAyMSBhdCAxMDoyOCBBTSBLZWZlbmcg
V2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+ID4KPiA+Cj4gPiBPbiAy
MDIxLzYvMjggOToxNSwgQmluIE1lbmcgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgSnVuIDI4LCAyMDIx
IGF0IDg6NTMgQU0gS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPiB3cm90
ZToKPiA+ID4+IEhp77yMIHNvcnJ5IGZvciB0aGUgbWlzdGFrZe+8jHRoZSBidWcgaXMgZml4ZWQg
YnkKPiA+ID4+Cj4gPiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIx
MDYwMjA4NTUxNy4xMjc0ODEtMi13YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbS8KPiA+ID4gV2hh
dCBhcmUgd2Ugb24gdGhlIHBhdGNoIHlvdSBtZW50aW9uZWQ/Cj4gPiA+Cj4gPiA+IEkgZG9uJ3Qg
c2VlIGl0IGFwcGxpZWQgaW4gdGhlIGxpbnV4L21hc3Rlci4KPiA+ID4KPiA+ID4gQWxzbyB0aGVy
ZSBzaG91bGQgYmUgYSAiRml4ZXMiIHRhZyBhbmQgc3RhYmxlQHZnZXIua2VybmVsLm9yZyBjYydl
ZAo+ID4gPiBiZWNhdXNlIDMyLWJpdCBpcyBicm9rZW4gc2luY2UgdjUuMTIuCj4gPgo+ID4gaHR0
cHM6Ly9rZXJuZWwuZ29vZ2xlc291cmNlLmNvbS9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlz
Y3YvbGludXgvKy9jOTgxMWUzNzliMjExYzY3YmEyOWZiMDlkNmY2NDRkZDQ0Y2ZjZmYyCj4gPgo+
ID4gaXQncyBvbiBQYWxtZXInIHJpc2N2LW5leHQuCj4KPiBOb3Qgc3VyZSByaXNjdi1uZXh0IGlz
IGZvciB3aGljaCByZWxlYXNlPyBUaGlzIGlzIGEgcmVncmVzc2lvbiBhbmQKPiBzaG91bGQgYmUg
b24gNS4xMy4KPgo+ID4KPiA+IEhpIFBhbG1lciwgc2hvdWxkIEkgcmVzZW5kIG9yIGNvdWxkIHlv
dSBoZWxwIG1lIHRvIGFkZCB0aGUgZml4ZXMgdGFnPwoKWW91ciBwYXRjaCBtaXhlZCAyIHRoaW5n
cyAoZml4IHBsdXMgb25lIGZlYXR1cmUpIHRvZ2V0aGVyLCBzbyBpdCBpcwpub3QgcHJvcGVyIHRv
IGJhY2sgcG9ydCB5b3VyIHBhdGNoLgoKSGVyZSBpcyBteSAyIGNlbnRzOgoKMS4gRHJvcCB5b3Vy
IHBhdGNoIGZyb20gcmlzY3YtbmV4dAoyLiBBcHBseSBteSBwYXRjaCBhcyBpdCBpcyBhIHNpbXBs
ZSBmaXggdG8gcHJldmlvdXMgY29tbWl0LiBUaGlzCmFsbG93cyBzdGFibGUga2VybmVsIHRvIGNo
ZXJyeS1waWNrIHRoZSBmaXggdG8gdjUuMTIgYW5kIHY1LjEzLgozLiBSZWJhc2UgeW91ciBwYXRj
aCBhZ2FpbnN0IG1pbmUsIGFuZCByZXNlbmQgdjIKCkxldCBtZSBrbm93IGlmIHRoaXMgbWFrZXMg
c2Vuc2UuCgpSZWdhcmRzLApCaW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
