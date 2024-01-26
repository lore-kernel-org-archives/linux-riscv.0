Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2275FC47258
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 02:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGmPH/vj3DZjBg1g5RglO2wjxu5Z8EtgA9aFWCQXc+8=; b=VyCPiWfntqZIcM
	xo6U6McrKnv+OASPh0NxM+CKCDxn+R/+KwhKi1M3h1YQkcKP9rzmskmRdiSAIIVy5088W8QQIzNKp
	sd037gz4iCGKjjWQ/yTtvZCXF0ElQqnCh7tge5pNvyoYz3vsrJoZYauQ4owe07dXJIb6oN1e0nlgD
	oUles4IOdfrZRb6U2ejy5ZGG4WBLOepcrSQnIYYC6qUJCbV//NKQDCosBIcJgMtPOP0htFzeOZDfK
	EN1p21z2Y6D/3TnAA6nyT+TDwvkK18HQof5/XQaVcsyxiZ6x6gJMjLSnFGqJ//xDtVgP/ieJNcy3F
	DfjwxBpzsGlaEZiX8iOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTBog-00000002qv0-0aWs;
	Fri, 26 Jan 2024 02:19:38 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTBoc-00000002qtU-3iuu
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 02:19:36 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5ffd5620247so3122987b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 18:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706235573; x=1706840373; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItFgj4jgK5sZKOgTM9vrgG8H+a4jRjcTY7CINpA2Wvw=;
        b=wvfqz3w2jcFYD8SajlTiFZu+dWHlC4Eq3CsAJ655OkuPeU+dmhbcpM0rAZs8Dw4IPi
         9f4NGn8IcanxhqIKKzlNffhXtpc+MpzsNR0uVkzV8NNAfDsGqZYHcLYU8qT98+PgTEDJ
         ACSk9djOso6VvvyhWaQU3HgyYYc6ZRKG22TWh1TV1SAXdG0lsMCOgbuzpy6FyJl9LaSD
         qOwY5ChhENz6Hkb4i9ZayN8JjZeqyvt9JUA2BWq+JfvlWjQjfArEOMHazG/5vgymkjYO
         HD3Ud9F0miYcXrtH5272aUg2tNGEL98/AB8YKE67217aG5Zlg17JpwL2TCnVI3bVkCUQ
         gjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706235573; x=1706840373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItFgj4jgK5sZKOgTM9vrgG8H+a4jRjcTY7CINpA2Wvw=;
        b=eJmNZcA6cw6ASNSfZT9cjN7LLmDnyYyTAWUTJSdXLH2dASCqwZxZhCR8MCwt8j5dmB
         TpgP907sBlsvSH7Pfn2YhfvcUfw+qJWx+nm9dbQo1SzGZYhzf72ALYlhyGWuT0RVLq1z
         sFKNowha5ghoXTvzhgdLNBrXjZYnFDN7MaSP/ruTL6qBrLPC7QC7qa0o+Nc6q8jFhFw0
         p//NEvc2WdPKwrSC+FJ+ppFxe57BSeINLzygFX0cXfWhj5tBSJ91+QMloEHPn3JnCSw+
         uEYKxbzExfr/UtHr8uL0+Y97f6DUH06Ve8KMWMFERJmnVtyuU74wcEdUZP7RaHiGgJqE
         TtJQ==
X-Gm-Message-State: AOJu0YxO9mKIhi8JHRg7IwrAwSgVyV6M3T3figvYK36uLLDGPeMUgAQa
	rlgF8N7r2dAhnz9WUSM7Yz0nJGC5uLIckACq+CQFiGrgLGL3cDWLKOSTzTFMIFFKBinY9+sVR34
	/0og0Ximv6JtAyBW5RsfZBmyeJoQEg2zfiBiN
X-Google-Smtp-Source: AGHT+IGaiNJjkVpexInpWQwByTe3797L2nUjpt0NZIQ90tD35vlByjZTnFzZwYmbW6zfg0hQ6um63uQcPL9NRTHsJjs=
X-Received: by 2002:a81:a188:0:b0:5e8:995f:6a0f with SMTP id
 y130-20020a81a188000000b005e8995f6a0fmr805824ywg.13.1706235573358; Thu, 25
 Jan 2024 18:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20240123064305.2829244-1-surenb@google.com> <20240125180424.121455beae4d56799a0bac28@linux-foundation.org>
In-Reply-To: <20240125180424.121455beae4d56799a0bac28@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 25 Jan 2024 18:19:19 -0800
Message-ID: <CAJuCfpGy=AmngLNMG737N4W_RXz=pRfisa1o7j9chBQ7=Mq6Kw@mail.gmail.com>
Subject: Re: [PATCH 1/1] arch/arm/mm: fix major fault accounting when retrying
 under per-VMA lock
To: Andrew Morton <akpm@linux-foundation.org>
Cc: willy@infradead.org, will@kernel.org, catalin.marinas@arm.com, 
	palmer@dabbelt.com, mpe@ellerman.id.au, christophe.leroy@csgroup.eu, 
	agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Russell King <rmk+kernel@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_181934_964488_B479D1C3 
X-CRM114-Status: GOOD (  12.53  )
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

T24gVGh1LCBKYW4gMjUsIDIwMjQgYXQgNjowNOKAr1BNIEFuZHJldyBNb3J0b24gPGFrcG1AbGlu
dXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCAyMiBKYW4gMjAyNCAyMjo0Mzow
NSAtMDgwMCBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPiB3cm90ZToKPgo+
ID4gVGhlIGNoYW5nZSBbMV0gbWlzc2VkIEFSTSBhcmNoaXRlY3R1cmUgd2hlbiBmaXhpbmcgbWFq
b3IgZmF1bHQgYWNjb3VudGluZwo+ID4gZm9yIHBhZ2UgZmF1bHQgcmV0cnkgdW5kZXIgcGVyLVZN
QSBsb2NrLiBBZGQgbWlzc2luZyBjb2RlIHRvIGZpeCBBUk0KPiA+IGFyY2hpdGVjdHVyZSBmYXVs
dCBhY2NvdW50aW5nLgo+ID4KPiA+IFsxXSA0NmU3MTRjNzI5YzggKCJhcmNoL21tL2ZhdWx0OiBm
aXggbWFqb3IgZmF1bHQgYWNjb3VudGluZyB3aGVuIHJldHJ5aW5nIHVuZGVyIHBlci1WTUEgbG9j
ayIpCj4gPgo+ID4gRml4ZXM6IDEyMjE0ZWJhMTk5MiAoIm1tOiBoYW5kbGUgcmVhZCBmYXVsdHMg
dW5kZXIgdGhlIFZNQSBsb2NrIikKPgo+IFdoYXQgYXJlIHRoZSB1c2Vyc3BhY2UtdmlzaWJsZSBy
dW50aW1lIGVmZmVjdHMgb2YgdGhpcyBjaGFuZ2U/CgpUaGUgdXNlci12aXNpYmxlIGVmZmVjdHMg
aXMgdGhhdCBpdCByZXN0b3JlcyBjb3JyZWN0IG1ham9yIGZhdWx0CmFjY291bnRpbmcgdGhhdCB3
YXMgYnJva2VuIGFmdGVyIFsyXSB3YXMgbWVyZ2VkIGluIDYuNyBrZXJuZWwuIFRoZQptb3JlIGRl
dGFpbGVkIGRlc2NyaXB0aW9uIGlzIGluIFszXSBhbmQgdGhpcyBwYXRjaCBzaW1wbHkgYWRkcyB0
aGUKc2FtZSBmaXggdG8gQVJNIGFyY2hpdGVjdHVyZSB3aGljaCBJIG1pc3NlZCBpbiBbM10uIEkg
Y2FuIHJlLXNlbmQgdGhlCnBhdGNoIHdpdGggdGhlIGZ1bGwgZGVzY3JpcHRpb24gZnJvbSBbM10g
aWYgbmVlZGVkLgoKPgo+IElzIGEgY2M6c3RhYmxlIGJhY2twb3J0IGRlc2lyYWJsZT8KClllcywg
SSBndWVzcyBzaW5jZSBbMl0gd2FzIG1lcmdlZCBpbiA2LjcsIGNjLWluZyBzdGFibGUgd291bGQg
YmUgZGVzaXJhYmxlLgpQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHdhbnQgbWUgdG8gcmUtc2Vu
ZCB0aGUgcGF0Y2ggd2l0aCBmdWxsCmRlc2NyaXB0aW9uIGFuZCBDQydpbmcgc3RhYmxlLgoKWzJd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTAwNjE5NTMxOC40MDg3MTU4LTYtd2ls
bHlAaW5mcmFkZWFkLm9yZy8KWzNdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTIy
NjIxNDYxMC4xMDkyODItMS1zdXJlbmJAZ29vZ2xlLmNvbS8KCj4KPiA+IFJlcG9ydGVkLWJ5OiBS
dXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgo+ID4gU2ln
bmVkLW9mZi1ieTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
