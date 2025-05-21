Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CFBC2D0CD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 17:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=heBnl0vSqfs2aPIaMEaPavPJC7Rs9lZIyZXcZz4PUOs=; b=U92+WaWWy3U08E
	32CvsEvmJVchtHZT9f5G5zNA5oXwcgTgRvt9MX72QCaDa1lnXD7dAyQIRWEyDj9HyN4t9GvisdCl6
	sutxlGnIMN/b/r96W6Iy+WYUSV4dBEdPfldxbCsxP7s/LjerVBzSnrjIrdDDW9Lgw/5zYq11pUjB/
	+DeNnScGbpww9bILc+rdo30MFh3YfKb6JcIFd8WYTg8YKjXcct2xMj5tN8qVwBPwW8XfD5RRarh6h
	AmTU6254+U1/JMzC8jfQ9imoHs5UUVoe+wJvfs8v83oQDNIMs1E5UcDiQZ07HQKTSWsQFy1ZZq2BC
	5+qTAhi0o+lCoqczVhHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHnRa-0000000Gb1h-2ZGM;
	Wed, 21 May 2025 17:41:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHnQi-0000000Garm-2YnV
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 17:40:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-442fda876a6so50029415e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 May 2025 10:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747849235; x=1748454035; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1jGbAJIfAmBuq60m9cLcCzR1qg6oy8JqAOHCwyna+M=;
        b=rYE7z18eVXlnr0rD6nZy6l8UERe+0/e86J/BFlnNy9HZcYVtEuU/pRncPqPgHsNbii
         bM/4O/3JPtsfnq/ofjMbVxTGYIqjqwcgMVo0RR8euZ1kYkwvfjJNGclICydrB/HNMmqL
         qtta9L1tUKO/XAtX3NoijKcK3YL/4SAYRq6uicenSJcZEFvFeJiGjpgryLZOJthvok4M
         /u+krXlAplVIKcSuW03LCIXpHffkQ5dPr+2b4yYdD1D5EQIhJJJQl4b17rWLxiCTDwWD
         nx0pNYO2+39ejGrkB11yNZChxclSF/EW7+IL/lHwmfzW/QEnY5JsPLeJ5ZOgmJmLeLb/
         GljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747849235; x=1748454035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1jGbAJIfAmBuq60m9cLcCzR1qg6oy8JqAOHCwyna+M=;
        b=AKotz3RQbkwb/JU2RccA1bxHeFSCIFpOVtVI/GsF8i4rld/kiU8CqhallFm/VBKm+V
         GdybpTb6DvO2S3p+yEBIog36UCtI34AIf7Oi6l0g9EEBcqckosfCPrgy+4rCFrEfXhZ9
         CZd73Oenye1fX6DyfNys7FF9FJc8/USSILJO5hjytwlK1qIKn4ffR8+yyAs3EUovuZEa
         Xd6m464T9/q7UFMbZ2j/dortpF2G9zPcVDz2pIx8qClSdgHVtXDdoXbfuYdVIYg+Rx92
         8fJxDL4+DslnBysDRZRD9/PX+U7vOKLtiGDzDfNhrQqnHYs/c9oTzpXJLmKrlQmGAun9
         kKQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYrvxEEYXz1mD3QZyIuBh3CROUdpxnS4ifC+jbadSCmjT27RsbYC85CdsEQ2CkRL1MJPtpqkC+xiLIJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBMeFOKR6QVStr+/aBLsOX0ITVlXvQxBnruIfzOUi6E+CZ/s4N
	PhcyMwP1sAxkP4cyJ9jp1FCUWEIurwaixN20dL0X7MEm0sC4KhhYzAm6X21ZjNbk9ZuKRX3gRug
	xDUX3+6NVkKsSSzey4Zmd1hAuraRB9/qAFRjwBVfCtA==
X-Gm-Gg: ASbGncsN+WOOyzv8EPw73hFpxgAVqm4uXATlVAo+T9IYbMdzeu15rgnlOp8+5CX6gtH
	txb2Nh2bJoCoSbOotD1M/NsY/l/HYa2KlOxcnaqm43EKXhKtm94k/EJHVqrdQrfbvEnhq3gsObg
	FWXA4yCQ34Ouennxz1MeGBKeLhrfV9Wpp81K07ibzFqUfLyLsWwnAcQD23UMFgX6I4GA==
X-Google-Smtp-Source: AGHT+IF7t556SFgYKCEZNLGSlvhLTbE8zyePAWqPOGCGeXQD0OKNEoiW7nBffL6Xodz6FR//5os8RUXoFUs57s9QzV4=
X-Received: by 2002:a05:600c:154f:b0:43c:eeee:b713 with SMTP id
 5b1f17b1804b1-442fd664a29mr161787315e9.20.1747849235122; Wed, 21 May 2025
 10:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250116230955.867152-1-rkanwal@rivosinc.com> <20250116230955.867152-2-rkanwal@rivosinc.com>
 <CAP-5=fU9ovvb-JopPqQfNaj6xtL=u_WZO-b56RdhBmUw4mY0ZA@mail.gmail.com>
 <CAECbVCvX8St8sXh9pTnyO_94-cJT_DB4MyggtS_-PXqWNtXDXw@mail.gmail.com>
 <CAECbVCui6ZgHBXBr3LdVGd16ERe0GgAnA1zy_zOQZVTU3bPoWw@mail.gmail.com> <CAP-5=fUy0QfmazuNq1yJzAxsuM7wD3zD=KAVMGHuw0wXvez1ww@mail.gmail.com>
In-Reply-To: <CAP-5=fUy0QfmazuNq1yJzAxsuM7wD3zD=KAVMGHuw0wXvez1ww@mail.gmail.com>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Wed, 21 May 2025 18:40:24 +0100
X-Gm-Features: AX0GCFuGfEgMYyqBQoNOMkZCo0wBsBMY3yB9bZY3USVl_oy_pisRJUdYTWzGPgk
Message-ID: <CAECbVCtCDrXu4w5s=3o85GVKRb9o566W-v04wWMO=VgjOOpRHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] perf: Increase the maximum number of samples to 256.
To: Ian Rogers <irogers@google.com>
Cc: ak@linux.intel.com, "Liang, Kan" <kan.liang@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, ajones@ventanamicro.com, 
	anup@brainfault.org, acme@kernel.org, atishp@rivosinc.com, 
	beeman@rivosinc.com, brauner@kernel.org, conor@kernel.org, heiko@sntech.de, 
	mingo@redhat.com, james.clark@arm.com, renyu.zj@linux.alibaba.com, 
	jolsa@kernel.org, jisheng.teoh@starfivetech.com, palmer@dabbelt.com, 
	will@kernel.org, kaiwenxue1@gmail.com, vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_104036_849007_DE75804C 
X-CRM114-Status: GOOD (  53.66  )
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

SSBhbSBub3Qgc3VyZSB0YmguIEkgaGF2ZSBuZXZlciB3b3JrZWQgd2l0aCB0aGlzIHBhcnQgb2Yg
cGVyZiB0b29sIGJlZm9yZS4KSSB0aGluayBzb21lb25lIGVsc2Ugd2l0aCBhIGRlZXBlciB1bmRl
cnN0YW5kaW5nIG9mIHBlcmYgY2FuIGFuc3dlcgp0aGlzIGJldHRlci4gSSB3aWxsIGFsc28gdHJ5
IHRvIGdvIHRocm91Z2ggaXQgdG8gYnVpbGQgc29tZSB1bmRlcnN0YW5kaW5nLgoKQWxzbywgSSB0
aGluayB0aGlzIGNhbiBiZSBkb25lIGFzIGEgbmV3IHdvcmsgaXRlbS9zZXJpZXMuIEN1cnJlbnRs
eSBJIGFtCmp1c3QgdHJ5aW5nIHRvIGluY3JlYXNlIHRoZSBudW1iZXIgb2YgZW50cmllcyB0aGUg
cmVtb3ZlX2xvb3BzIGZ1bmN0aW9uCmNhbiBwcm9jZXNzLiBHb2luZyB0aHJvdWdoIHRoZSBjb21t
aXQgZGVzY3JpcHRpb24gbm93LCBJIGZlZWwgbGlrZQpJIGhhdmUgbm90IGRvbmUgYSBnb29kIGpv
YiBvZiBkZXNjcmliaW5nIHRoZSBjaGFuZ2UuCgpCYXNpY2FsbHkgd2hlbiBJIHVzZSAtLWJyYW5j
aC1oaXN0b3J5IG9wdGlvbiBvbiByZXBvcnQgY21kIHRvCmFkZCB0aGUgYnJhbmNoZXMgdG8gY2Fs
bHN0YWNrLCB0aGUgcmVtb3ZlX2xvb3BzIGxvZ2ljIGNvbXBsYWlucwphYm91dCB0aGUgc2l6ZSBv
ZiB0aGUgc2FtcGxlIGFuZCBkaXNjYXJkcyB0aGUgc2FtcGxlIGFzCmNvcnJ1cHRlZCBzYW1wbGUg
YmVjYXVzZSBpdCdzIGJlZW4gaGFyZGNvZGVkIHRvIHByb2Nlc3MKbWF4aW11bSBvZiAxMjcgZW50
cmllcy4KCkhlcmUgaXMgdGhlIHBhdGNoIHRoYXQgYWRkZWQgdGhpcyBvcHRpb246Cmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8xNDE1ODQ0MzI4LTQ4ODQtMy1naXQtc2VuZC1lbWFpbC1hbmRp
QGZpcnN0Zmxvb3Iub3JnL1QvI3UKClRoYW5rcwpSYWpuZXNoCgpPbiBXZWQsIE1heSAyMSwgMjAy
NSBhdCA0OjM24oCvUE0gSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKPgo+
IE9uIFdlZCwgTWF5IDIxLCAyMDI1IGF0IDM6NDfigK9BTSBSYWpuZXNoIEthbndhbCA8cmthbndh
bEByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgQXByIDE3LCAyMDI1IGF0IDE6
NTHigK9QTSBSYWpuZXNoIEthbndhbCA8cmthbndhbEByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiArIEFkZGluZyBBbmRpIEtsZWVuLgo+ID4gPgo+ID4gPiBPbiBUaHUsIEZlYiAyMCwg
MjAyNSBhdCA2OjUx4oCvUE0gSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90ZToK
PiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgSmFuIDE2LCAyMDI1IGF0IDM6MTDigK9QTSBSYWpuZXNo
IEthbndhbCA8cmthbndhbEByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+
IFJJU0NWIENUUiBleHRlbnNpb24gc3VwcG9ydCBhIG1heGltdW0gZGVwdGggb2YgMjU2IGxhc3Qg
YnJhbmNoIHJlY29yZHMuCj4gPiA+ID4gPiBUaGUgMTI3IGVudHJpZXMgbGltaXQgcmVzdWx0cyBp
biBjb3JydXB0aW5nIENUUiBlbnRyaWVzIGZvciBSSVNDLVYgaWYKPiA+ID4gPiA+IGNvbmZpZ3Vy
ZWQgdG8gYmUgMjU2IGVudHJpZXMuIFRoaXMgd2lsbCBub3QgaW1wYWN0IGFueSBvdGhlciBhcmNo
aXRlY3R1cmVzCj4gPiA+ID4gPiBhcyBpdCBpcyBqdXN0IGluY3JlYXNpbmcgbWF4aW11bSBsaW1p
dCBvZiBwb3NzaWJsZSBlbnRyaWVzLgo+ID4gPiA+Cj4gPiA+ID4gSSB3b25kZXIgaWYgcmF0aGVy
IHRoYW4gYSBjb25zdGFudCB0aGlzIGNvZGUgc2hvdWxkIGp1c3QgdXNlIHRoZSBhdXRvCj4gPiA+
ID4gcmVzaXppbmcgaGFzaG1hcCBjb2RlPwo+ID4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL3Rvb2xzL3Bl
cmYvdXRpbC9oYXNobWFwLmgKPiA+ID4gPgo+ID4gPiA+IEkgYXNzdW1lIHRoZSB2YWx1ZSBvZiAx
MjcgY29tZXMgZnJvbSBwZXJmX2V2ZW50LmgncyBQRVJGX01BWF9TVEFDS19ERVBUSDoKPiA+ID4g
PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxk
cy9saW51eC5naXQvdHJlZS9pbmNsdWRlL3VhcGkvbGludXgvcGVyZl9ldmVudC5oI24xMjUyCj4g
PiA+ID4KPiA+ID4gPiBQZXJoYXBzIHRoZXNlIGNvbnN0YW50cyBzaG91bGRuJ3QgZXhpc3QuIFRo
ZSBwZXJmLXJlY29yZCBtYW4gcGFnZSBtZW50aW9uczoKPiA+ID4gPiBzeXNjdGwua2VybmVsLnBl
cmZfZXZlbnRfbWF4X3N0YWNrCj4gPiA+ID4gd2hpY2ggSSBiZWxpZXZlIGdldHMgYSB2YWx1ZSBm
cm9tCj4gPiA+ID4gL3Byb2Mvc3lzL2tlcm5lbC9wZXJmX2V2ZW50X21heF9zdGFjaywgc28gbWF5
YmUgdGhlc2Ugc2hvdWxkIGJlCj4gPiA+ID4gcnVudGltZSBkZXRlcm1pbmVkIGNvbnN0YW50cyBy
YXRoZXIgdGhhbiBjb21waWxlIHRpbWUuCj4gPgo+ID4gV2hpbGUgd29ya2luZyBvbiB0aGlzLCBJ
IGNhbWUgYWNyb3NzIHRoZSBmb2xsb3dpbmcgdHdvIHBhdGNoZXMuIEl0Cj4gPiBsb29rcyBsaWtl
IHdoYXQKPiA+IHlvdSBoYXZlIHN1Z2dlc3RlZCwgaXQgd2FzIHRyaWVkIGJlZm9yZSBidXQgbGF0
ZXIgb24gQXJuYWxkbyByZXZlcnRlZCB0aGUgY2hhbmdlCj4gPiBmcm9tIHJlcG9ydCBhbmQgc2Ny
aXB0IGNtZHMgZHVlIHRvIHJlYXNvbnMgbWVudGlvbmVkIGluIHRoZSBzZWNvbmQgcGF0Y2guCj4g
Pgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xNDYxNzY3NDcyLTg4MjctMzEtZ2l0
LXNlbmQtZW1haWwtYWNtZUBrZXJuZWwub3JnLwo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8xNDYzNjk2NDkzLTI3NTI4LTgtZ2l0LXNlbmQtZW1haWwtYWNtZUBrZXJuZWwub3JnLwo+
Cj4gVGhhbmtzIFJham5hc2gsIGFncmVlZCBvbiB3aGF0IHlvdSBmb3VuZC4gSSB3b25kZXIgdG8g
cmVzb2x2ZSB0aGUKPiBpc3N1ZSB3ZSBjb3VsZCBhZGQgYSBoZWFkZXIgZmVhdHVyZToKPiBodHRw
czovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGVyZi9wZXJm
LXRvb2xzLW5leHQuZ2l0L3RyZWUvdG9vbHMvcGVyZi91dGlsL2hlYWRlci5oP2g9cGVyZi10b29s
cy1uZXh0I24yMQo+IGZvciBtYXggc3RhY2sgZGVwdGguCj4KPiBUaGFua3MsCj4gSWFuCj4KPiA+
IFJlZ2FyZHMKPiA+IFJham5lc2gKPiA+Cj4gPgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFRoYW5rcyBJ
YW4gZm9yIHlvdXIgZmVlZGJhY2suIEkgYW0gbm90IHN1cmUgaWYgaXQncyBmZWFzaWJsZSB0byB1
c2UgYXV0bwo+ID4gPiByZXNpemluZyBoYXNobWFwIGhlcmUuIE9uIGVhY2ggc2FtcGxlIG9mIDI1
NiBlbnRyaWVzIHdlIHdpbGwgYmUgZG9pbmcKPiA+ID4gNiBjYWxsb2NzIGFuZCB0cmFuc2ZlcnJp
bmcgYSB3aG9sZSBsb3Qgb2YgZW50cmllcyBpbiBoYXNobWFwX2dyb3cuIFdlCj4gPiA+IGNhbid0
IHJldXNlIG9sZCBoYXNobWFwIGFzIHdlbGwuIE9uIGVhY2ggc2FtcGxlIHdlIGJlYXIgdGhlIHNh
bWUgY29zdAo+ID4gPgo+ID4gPiBCdXQgSSBkbyBhZ3JlZSB0aGlzIHNob3VsZCBiZSBtb3JlIGR5
bmFtaWMgYnV0IHRoZSBtYXhpbXVtIG51bWJlcgo+ID4gPiBvZiBlbnRyaWVzIHJlbW92ZV9sb29w
cyBjYW4gcHJvY2VzcyBpcyBsaW1pdGVkIGJ5IHRoZSB0eXBlIG9mIGNoYXNoIGFycmF5Cj4gPiA+
IGhlcmUuIEkgY2FuIGNoYW5nZSBpdCBhbmQgcmVsYXRlZCBsb2dpYyB0byB1c2UgdWludDE2X3Qg
b3IgaGlnaGVyIGJ1dCB3ZQo+ID4gPiB3aWxsIHN0aWxsIGhhdmUgYSBjYXAgb24gdGhlIG51bWJl
ciBvZiBlbnRyaWVzLgo+ID4gPgo+ID4gPiBQRVJGX01BWF9CUkFOQ0hfREVQVEggc2VlbXMgdG8g
YmUgZGVub3Rpbmcgd2hhdCByZW1vdmVfbG9vcHMKPiA+ID4gY2FuIHByb2Nlc3MuIFRoaXMgaXMg
YmVpbmcgdXNlZCBieSB0aHJlYWRfX3Jlc29sdmVfY2FsbGNoYWluX3NhbXBsZSB0bwo+ID4gPiBj
aGVjayBpZiB0aGUgc2FtcGxlIGlzIHByb2Nlc3NhYmxlIGJlZm9yZSBjYWxsaW5nIHJlbW92ZV9s
b29wcy4gSSB0aGluawo+ID4gPiB0aGlzIGNhbid0IGJlIGNoYW5nZWQgdG8gdXNlIHBlcmZfZXZl
bnRfbWF4X3N0YWNrLiBCdXQgSSBjYW4gcmVuYW1lCj4gPiA+IHRoaXMgbWFjcm8gdG8gYXZvaWQg
Y29uZnVzaW9uLgo+ID4gPgo+ID4gPiBJIGRpZG4ndCBub3RpY2UgUEVSRl9NQVhfU1RBQ0tfREVQ
VEguIFRoaXMgc2VlbXMgdG8gYmUgZGVmaW5lZCBpbgo+ID4gPiBtdWx0aXBsZSBwbGFjZXMgYW5k
IHRvdWNoZXMgYnBmIGFzIHdlbGwuIEkgYWdyZWUgdGhhdCB3ZSBzaG91bGQgYXZvaWQKPiA+ID4g
dXNpbmcgdGhpcyBtYWNybyBhbmQgdXNlIHJ1bnRpbWUgZGV0ZXJtaW5lZCB2YWx1ZSBpbnN0ZWFk
LiBUYmggSSBkb24ndAo+ID4gPiBoYXZlIHN1cGVyIGluLWRlcHRoIHBlcmYgdW5kZXJzdGFuZGlu
Zy4gSSB3aWxsIGdpdmUgdGhpcyBhIHRyeSBhbmQgc2VuZCBhCj4gPiA+IHBhdGNoIGluIHRoZSBu
ZXh0IHVwZGF0ZS4gSXQgd291bGQgYmUgaGVscGZ1bCBpZiB5b3UgY2FuIHJldmlldyBpdC4KPiA+
ID4KPiA+ID4gVGhhbmtzCj4gPiA+IC1SYWpuZXNoCj4gPiA+Cj4gPiA+ID4gVGhhbmtzLAo+ID4g
PiA+IElhbgo+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSYWpuZXNoIEthbndhbCA8
cmthbndhbEByaXZvc2luYy5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICB0b29scy9wZXJm
L3V0aWwvbWFjaGluZS5jIHwgMjEgKysrKysrKysrKysrKystLS0tLS0tCj4gPiA+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPiA+ID4gPgo+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9tYWNoaW5lLmMgYi90b29scy9w
ZXJmL3V0aWwvbWFjaGluZS5jCj4gPiA+ID4gPiBpbmRleCAyN2Q1MzQ1ZDJiMzAuLmYyZWIzYzIw
Mjc0ZSAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL3Rvb2xzL3BlcmYvdXRpbC9tYWNoaW5lLmMKPiA+
ID4gPiA+ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9tYWNoaW5lLmMKPiA+ID4gPiA+IEBAIC0yMTc0
LDI1ICsyMTc0LDMyIEBAIHN0YXRpYyB2b2lkIHNhdmVfaXRlcmF0aW9ucyhzdHJ1Y3QgaXRlcmF0
aW9ucyAqaXRlciwKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBpdGVyLT5jeWNsZXMgKz0gYmVb
aV0uZmxhZ3MuY3ljbGVzOwo+ID4gPiA+ID4gIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtI2RlZmlu
ZSBDSEFTSFNaIDEyNwo+ID4gPiA+ID4gLSNkZWZpbmUgQ0hBU0hCSVRTIDcKPiA+ID4gPiA+IC0j
ZGVmaW5lIE5PX0VOVFJZIDB4ZmYKPiA+ID4gPiA+ICsjZGVmaW5lIENIQVNIQklUUyA4Cj4gPiA+
ID4gPiArI2RlZmluZSBOT19FTlRSWSAweGZmVQo+ID4gPiA+ID4KPiA+ID4gPiA+IC0jZGVmaW5l
IFBFUkZfTUFYX0JSQU5DSF9ERVBUSCAxMjcKPiA+ID4gPiA+ICsjZGVmaW5lIFBFUkZfTUFYX0JS
QU5DSF9ERVBUSCAyNTYKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgLyogUmVtb3ZlIGxvb3BzLiAqLwo+
ID4gPiA+ID4gKy8qIE5vdGU6IExhc3QgZW50cnkgKGk9PWZmKSB3aWxsIG5ldmVyIGJlIGNoZWNr
ZWQgYWdhaW5zdCBOT19FTlRSWQo+ID4gPiA+ID4gKyAqIHNvIGl0J3Mgc2FmZSB0byBoYXZlIGFu
IHVuc2lnbmVkIGNoYXIgYXJyYXkgdG8gcHJvY2VzcyAyNTYgZW50cmllcwo+ID4gPiA+ID4gKyAq
IHdpdGhvdXQgY2F1c2luZyBjbGFzaCBiZXR3ZWVuIGxhc3QgZW50cnkgYW5kIE5PX0VOVFJZIHZh
bHVlLgo+ID4gPiA+ID4gKyAqLwo+ID4gPiA+ID4gIHN0YXRpYyBpbnQgcmVtb3ZlX2xvb3BzKHN0
cnVjdCBicmFuY2hfZW50cnkgKmwsIGludCBuciwKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBpdGVyYXRpb25zICppdGVyKQo+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ICAg
ICAgICAgaW50IGksIGosIG9mZjsKPiA+ID4gPiA+IC0gICAgICAgdW5zaWduZWQgY2hhciBjaGFz
aFtDSEFTSFNaXTsKPiA+ID4gPiA+ICsgICAgICAgdW5zaWduZWQgY2hhciBjaGFzaFtQRVJGX01B
WF9CUkFOQ0hfREVQVEhdOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgbWVtc2V0KGNoYXNo
LCBOT19FTlRSWSwgc2l6ZW9mKGNoYXNoKSk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLSAgICAgICBC
VUdfT04oUEVSRl9NQVhfQlJBTkNIX0RFUFRIID4gMjU1KTsKPiA+ID4gPiA+ICsgICAgICAgQlVH
X09OKFBFUkZfTUFYX0JSQU5DSF9ERVBUSCA+IDI1Nik7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAg
ICAgICBmb3IgKGkgPSAwOyBpIDwgbnI7IGkrKykgewo+ID4gPiA+ID4gLSAgICAgICAgICAgICAg
IGludCBoID0gaGFzaF82NChsW2ldLmZyb20sIENIQVNIQklUUykgJSBDSEFTSFNaOwo+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgIC8qIFJlbWFpbmRlciBkaXZpc2lvbiBieSBQRVJGX01BWF9CUkFO
Q0hfREVQVEggaXMgbm90Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICogbmVlZGVkIGFzIGhh
c2hfNjQgd2lsbCBhbnl3YXkgbGltaXQgdGhlIGhhc2gKPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgKiB0byBDSEFTSEJJVFMKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgKi8KPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICBpbnQgaCA9IGhhc2hfNjQobFtpXS5mcm9tLCBDSEFTSEJJVFMpOwo+
ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAvKiBubyBjb2xsaXNpb24gaGFuZGxp
bmcgZm9yIG5vdyAqLwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGlmIChjaGFzaFtoXSA9PSBO
T19FTlRSWSkgewo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDIuMzQuMQo+ID4gPiA+ID4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
