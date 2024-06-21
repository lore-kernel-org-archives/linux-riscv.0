Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784F3C2BA1A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 06:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/6lRJAigHnjXLb/qab1AJiXMQZoltxeaXncQ++8cyo=; b=rgc739pA5kaJtp
	1CbkrC17p/AgjyT0WDHg1pHD7lVQekcdnHvM6uyBcO6/B3tCPSPVKaYRmLhuhT7aDNgEEN0kAdn0x
	JXi8HczHeFQLEHeMeOW5LqH3ZypUMlZGcj/MlUTZrSLyUlk1s1O1TZf7uwnKYvZS+5LeIturRrIih
	/2R5cbsrYMkD9UXKKxOu5ozpfYDVS1BMUTsWj/u9wEHa+r1b/vtULJM3ySJxTKmzcOutNL64MQdna
	2FcCYbmScehyW2/q7mV8Jg+cAkGO1/aVzsDlH3fUQGrQe5fzWiMwfO6tkliAMVtFTW1nut1ioGixr
	1pWrVNIH8IQeTj1dEPdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXw4-000000080sZ-3SwE;
	Fri, 21 Jun 2024 06:39:48 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXw1-000000080rb-1Dow
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 06:39:47 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so1066528a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 23:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718951984; x=1719556784; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XIGjmxpD8vHtgswj1EvnHC+JKRATcoZKG+yQ94+3Xdg=;
        b=OcywVzaFw30nsa+DRmLt16Y4fWX5QKmUK9T8b179zDegSVGzlp6rajqSy6e9323SmM
         vTcsmXJHCkwP6TAEJysMtCTCINu4s4IC+dX3gYaLq4cqg7TmhcQWV4f1/2c1vbL7BKog
         dbcke/4MB5pRktJKzUYWcEXUWzL+FwVCltof15Z00mh2yapYwbf5GmBeXa6+lEoNZEPk
         AIvTf3aHyxJN34sYvNGiuAlZQ+Xdr3a73oMBzcwmjrvrDSPdIXyydpLHiyfYkBHvXi+9
         RU3NACRVZ3kJB3QDX7W/jLma0I6yyP/vZ7ead/1q0XnBEzV3R6o0cvypOO2oZgUPU5Hg
         qkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718951984; x=1719556784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XIGjmxpD8vHtgswj1EvnHC+JKRATcoZKG+yQ94+3Xdg=;
        b=ClBWMr2DD7J4fH49KwSPLsPVU89M0TJNfYJVK9MAeCzuyEjCbw2c33dgRSiXOp7sTu
         rKw26J6f1ek9faBW1lF/a0ni6LHjBqC6V96ZVPcwZSjKlHs1EmGclFDE5XxUWquNHMDw
         E0Zp97S+J9uPw+QeBJl5zWFlWOLsvqMNTCfD785149ometBz98CN5iPqOqj4/tVUUNUR
         6ZFi7FwiOAIjvNj8TOwOLyE4K5ZwfH2w/LaR/j9XMiHH1J+z0mvPByLxXBiMc1xBMFF+
         Fe1XFwJobFV7c71dULSMKB9KotfQKxLSrumtwxRm6XqNcWwkuvn1tnQyUmbg/Iqy+chg
         CWuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLKpAslttRloU/vwrng55RkgRNwqPxEnWbTKXCT1tFdfjZU+OlUxEIUr9ZHTukQcGf7YRveZkBN7KvvFXR+3WLf+Rm4x12maS8VzUzyz9s
X-Gm-Message-State: AOJu0YzwiS5N+hX9937WbpoouQeqhKnJ09qvXc6dnalG1sJV/zT3BL1u
	rWkSbM4JovYB9bt1U8YnqrQXgMQByqvZGwMI2U3CvsTyfYvBlYFZ/p53HfshgMc=
X-Google-Smtp-Source: AGHT+IEMZS4cVoReUDY+Bpe+zsFKW+rFHNx/nrRypfyBZLh8aU4qRKL8sxg1cVYyWpJ9mX14g4671A==
X-Received: by 2002:a05:6a20:3b84:b0:1b5:cf9c:2936 with SMTP id adf61e73a8af0-1bcbb686f51mr7771982637.39.1718951984040;
        Thu, 20 Jun 2024 23:39:44 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:cfe:eaff:a05e:659d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819a623bcsm792294a91.2.2024.06.20.23.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:39:43 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:39:41 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: rppt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
	akpm@linux-foundation.org, bhe@redhat.com, dawei.li@shingroup.cn,
	jszhang@kernel.org, namcao@linutronix.de, bjorn@rivosinc.com,
	vishal.moola@gmail.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH] RISC-V: cmdline: Add support for 'memmap'
 parameter
Message-ID: <ZnUgLZow2ODPH7vp@ghost>
References: <20240618120842.15159-1-cuiyunhui@bytedance.com>
 <ZnTRbptoowL+1GOP@ghost>
 <CAEEQ3wnNZJviirqWCAG7mXsbynC+=Gq5q4jh6b4yamm8cnzMAw@mail.gmail.com>
 <ZnTvArAQpfCm10tc@ghost>
 <CAEEQ3w=6EZMFsH2y7efZsX00CzytyMu+Be_RT8CicejMB6qAJA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=6EZMFsH2y7efZsX00CzytyMu+Be_RT8CicejMB6qAJA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_233945_538755_4C6C09DD 
X-CRM114-Status: GOOD (  47.46  )
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

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMDI6MDI6MThQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBDaGFybGll77yMCj4gCj4gT24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMTE6MTDigK9B
TSBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBP
biBGcmksIEp1biAyMSwgMjAyNCBhdCAxMDowODozOUFNICswODAwLCB5dW5odWkgY3VpIHdyb3Rl
Ogo+ID4gPiBIaSBDaGFybGllLAo+ID4gPgo+ID4gPiBPbiBGcmksIEp1biAyMSwgMjAyNCBhdCA5
OjAz4oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4g
PiA+ID4KPiA+ID4gPiBPbiBUdWUsIEp1biAxOCwgMjAyNCBhdCAwODowODo0MlBNICswODAwLCBZ
dW5odWkgQ3VpIHdyb3RlOgo+ID4gPiA+ID4gSW1wbGVtZW50IHN1cHBvcnQgZm9yIHBhcnNpbmcg
J21lbW1hcCcga2VybmVsIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXIuCj4gPiA+ID4gPgo+ID4gPiA+
ID4gVGhpcyBwYXRjaCBjb3ZlcnMgcGFyc2luZyBvZiB0aGUgZm9sbG93aW5nIHR3byBmb3JtYXRz
IGZvciAnbWVtbWFwJwo+ID4gPiA+ID4gcGFyYW1ldGVyIHZhbHVlczoKPiA+ID4gPiA+Cj4gPiA+
ID4gPiAtIG5uW0tNR11Ac3NbS01HXQo+ID4gPiA+ID4gLSBubltLTUddJHNzW0tNR10KPiA+ID4g
PiA+Cj4gPiA+ID4gPiAoW0tNR10gPSBLIE0gb3IgRyAoa2lsbywgbWVnYSwgZ2lnYSkpCj4gPiA+
ID4gPgo+ID4gPiA+ID4gVGhlc2UgdHdvIGFsbG93ZWQgZm9ybWF0cyBmb3IgcGFyYW1ldGVyIHZh
bHVlIGFyZSBhbHJlYWR5IGRvY3VtZW50ZWQKPiA+ID4gPiA+IGluIGZpbGUga2VybmVsLXBhcmFt
ZXRlcnMudHh0IGluIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUgZm9sZGVyLgo+ID4gPiA+ID4g
U29tZSBhcmNoaXRlY3R1cmVzIGFscmVhZHkgc3VwcG9ydCB0aGVtLCBidXQgTWlwcyBkaWQgbm90
IHByaW9yIHRvCj4gPiA+ID4KPiA+ID4gPiBDb3B5LXBhc3RlIGZyb20gYSBNaXBzIHBhdGNoPyBT
aG91bGQgc2F5IHJpc2N2IDopCj4gPiA+ID4KPiA+ID4gPiBJdCBsb29rcyBsaWtlIHRoaXMgY29k
ZSBpcyBkdXBsaWNhdGVkIGZyb20geHRlbnNhIGFuZCBpcyBlZmZlY3RpdmVseSB0aGUKPiA+ID4g
PiBzYW1lIGFzIG1pcHMuIENhbiB0aGlzIGNvZGUgYmUgcGxhY2VkIGluIGEgZ2VuZXJpYyBmaWxl
IHNvIHRoYXQgdGhlIGNvZGUKPiA+ID4gPiBjYW4gYmUgc2hhcmVkIGJldHdlZW4gbWlwcywgcmlz
Y3YsIGFuZCB4dGVuc2EgLS0gbWF5YmUgYSBuZXcgY29uZmlnIHRoYXQKPiA+ID4gPiBnZXRzIHNl
bGVjdGVkIGJ5IG1pcHMvcmlzY3YveHRlbnNhPwo+ID4gPgo+ID4gPiBZZWFoLCB0aGF0J3MgYWN0
dWFsbHkgd2hhdCBJIHdhcyB0aGlua2luZy4gV2hpY2ggZ2VuZXJhbCBmaWxlIGRvIHlvdQo+ID4g
PiB0aGluayB3b3VsZCBiZSBtb3JlIHN1aXRhYmxlIHRvIHB1dCBpdCBpbj8KPiA+Cj4gPiBJIGFt
IG5vdCBzdXJlIHRoZSBiZXN0IHBsYWNlIHRvIHB1dCBpdC4gV2hhdCBkbyB5b3UgdGhpbmsgYWJv
dXQKPiA+IG1tL21lbWJsb2NrLmMgbmV4dCB0byB0aGUgIm1lbWJsb2NrIiBlYXJseSBwYXJhbT8K
PiAKPiBJcyBpdCBpbmFwcHJvcHJpYXRlIHRvIHB1dCBpdCBpbiBtZW1ibG9jaz8gVGhlIGltcGxl
bWVudGF0aW9uIG9mIG1pcHMKPiBpcyBkaWZmZXJlbnQgZnJvbSB0aGF0IG9mIHh0ZW5zYSwgYW5k
IGVhcmx5X21lbSBpcyBhbHNvIGRpc3RyaWJ1dGVkIGluCj4gdmFyaW91cyBhcmNocywgc28gd2Ug
c3RpbGwgcHV0IG1lbW1hcCBpbiByaXNjdi8sIGFuZCB0aGVuIEkgd2lsbAo+IG1vZGlmeSB0aGUg
Y29tbWl0IGxvZy4KPiBXaGF0IGRvIHlvdSB0aGluaz8KClRoZSBtaXBzIGltcGxlbWVudGF0aW9u
IGlzIHZlcnkgY2xvc2UgdG8gYmVpbmcgdGhlIHNhbWUsIGJ1dCBJIGFtIG5vdApzdXJlIGlmIHRo
ZSBkaWZmZXJlbmNlcyB3b3VsZCBwcmV2ZW50IHN0YW5kYXJkaXphdGlvbi4geHRlbnNhIGFuZCBu
b3cKcmlzY3Ygd291bGQgaGF2ZSBpZGVudGljYWwgaW1wbGVtZW50YXRpb25zIHRob3VnaCBzbyBh
IGdlbmVyaWMgbWVtbWFwCmltcGxlbWVudGF0aW9uIGNvdWxkIGJlIG9ubHkgYXBwbGllZCB0byB0
aG9zZSB0d28gYXJjaHMuCgpUaGUgIm1lbSIgZWFybHkgcGFyYW0gaXMgYWxzbyBzY2F0dGVyZWQg
YWNyb3NzIGFyY2hzIGFzIHlvdSBwb2ludCBvdXQsCmJ1dCB0aGF0IGxvb2tzIG1vcmUgZnJhZ21l
bnRlZCBpbiBob3cgdGhlIGRpZmZlcmVudCBhcmNoaXRlY3R1cmVzIGhhdmUKaW1wbGVtZW50ZWQg
aXQuCgpJIHdpbGwgY29weSBNaWtlIFJhcG9wb3J0IHRvIHNlZSBpZiBoZSBoYXMgYW55IGNvbW1l
bnRzIHNpbmNlIGhlIGlzIHRoZQptYWludGFpbmVyIG9mIG1lbWJsb2NrIGFuZCBtZW1vcnkgbWFu
YWdlbWVudCBpbml0aWFsaXphdGlvbi4KCj4gCj4gPgo+ID4gPgo+ID4gPiA+IC0gQ2hhcmxpZQo+
ID4gPiA+Cj4gPiA+ID4gPiB0aGlzIHBhdGNoLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEV4Y2VycHQg
ZnJvbSBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dDoKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBtZW1tYXA9bm5bS01HXUBzc1tLTUddCj4gPiA+ID4gPiBbS05MXSBG
b3JjZSB1c2FnZSBvZiBhIHNwZWNpZmljIHJlZ2lvbiBvZiBtZW1vcnkuCj4gPiA+ID4gPiBSZWdp
b24gb2YgbWVtb3J5IHRvIGJlIHVzZWQgaXMgZnJvbSBzcyB0byBzcytubi4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBtZW1tYXA9bm5bS01HXSRzc1tLTUddCj4gPiA+ID4gPiBNYXJrIHNwZWNpZmljIG1l
bW9yeSBhcyByZXNlcnZlZC4KPiA+ID4gPiA+IFJlZ2lvbiBvZiBtZW1vcnkgdG8gYmUgcmVzZXJ2
ZWQgaXMgZnJvbSBzcyB0byBzcytubi4KPiA+ID4gPiA+IEV4YW1wbGU6IEV4Y2x1ZGUgbWVtb3J5
IGZyb20gMHgxODY5MDAwMC0weDE4NjlmZmZmCj4gPiA+ID4gPiBtZW1tYXA9NjRLJDB4MTg2OTAw
MDAKPiA+ID4gPiA+IG9yCj4gPiA+ID4gPiBtZW1tYXA9MHgxMDAwMCQweDE4NjkwMDAwCj4gPiA+
ID4gPgo+ID4gPiA+ID4gVGhlcmUgaXMgbm8gbmVlZCB0byB1cGRhdGUgdGhpcyBkb2N1bWVudGF0
aW9uIGZpbGUgd2l0aCByZXNwZWN0IHRvCj4gPiA+ID4gPiB0aGlzIHBhdGNoLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2Uu
Y29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgYXJjaC9yaXNjdi9tbS9pbml0LmMgfCA1MCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+ID4g
PiA+IGluZGV4IGUzNDA1ZTRiOTlhZi4uN2JlN2VjMzA5MmFkIDEwMDY0NAo+ID4gPiA+ID4gLS0t
IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5p
dC5jCj4gPiA+ID4gPiBAQCAtMjA4LDYgKzIwOCw1NiBAQCBzdGF0aWMgaW50IF9faW5pdCBlYXJs
eV9tZW0oY2hhciAqcCkKPiA+ID4gPiA+ICB9Cj4gPiA+ID4gPiAgZWFybHlfcGFyYW0oIm1lbSIs
IGVhcmx5X21lbSk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gK3N0YXRpYyB2b2lkIF9faW5pdCBwYXJz
ZV9tZW1tYXBfb25lKGNoYXIgKnApCj4gPiA+ID4gPiArewo+ID4gPiA+ID4gKyAgICAgY2hhciAq
b2xkcDsKPiA+ID4gPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnRfYXQsIG1lbV9zaXplOwo+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgaWYgKCFwKQo+ID4gPiA+ID4gKyAgICAgICAgICAg
ICByZXR1cm47Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICBvbGRwID0gcDsKPiA+ID4gPiA+
ICsgICAgIG1lbV9zaXplID0gbWVtcGFyc2UocCwgJnApOwo+ID4gPiA+ID4gKyAgICAgaWYgKHAg
PT0gb2xkcCkKPiA+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gKyAgICAgc3dpdGNoICgqcCkgewo+ID4gPiA+ID4gKyAgICAgY2FzZSAnQCc6Cj4gPiA+
ID4gPiArICAgICAgICAgICAgIHN0YXJ0X2F0ID0gbWVtcGFyc2UocCArIDEsICZwKTsKPiA+ID4g
PiA+ICsgICAgICAgICAgICAgbWVtYmxvY2tfYWRkKHN0YXJ0X2F0LCBtZW1fc2l6ZSk7Cj4gPiA+
ID4gPiArICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgY2Fz
ZSAnJCc6Cj4gPiA+ID4gPiArICAgICAgICAgICAgIHN0YXJ0X2F0ID0gbWVtcGFyc2UocCArIDEs
ICZwKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgbWVtYmxvY2tfcmVzZXJ2ZShzdGFydF9hdCwg
bWVtX3NpemUpOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICBicmVhazsKPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ICsgICAgIGNhc2UgMDoKPiA+ID4gPiA+ICsgICAgICAgICAgICAgbWVtYmxvY2tfcmVz
ZXJ2ZShtZW1fc2l6ZSwgLW1lbV9zaXplKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgYnJlYWs7
Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICBkZWZhdWx0Ogo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICBwcl93YXJuKCJVbnJlY29nbml6ZWQgbWVtbWFwIHN5bnRheDogJXNcbiIsIHApOwo+ID4g
PiA+ID4gKyAgICAgICAgICAgICBicmVhazsKPiA+ID4gPiA+ICsgICAgIH0KPiA+ID4gPiA+ICt9
Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArc3RhdGljIGludCBfX2luaXQgcGFyc2VfbWVtbWFwX29w
dChjaGFyICpzdHIpCj4gPiA+ID4gPiArewo+ID4gPiA+ID4gKyAgICAgd2hpbGUgKHN0cikgewo+
ID4gPiA+ID4gKyAgICAgICAgICAgICBjaGFyICprID0gc3RyY2hyKHN0ciwgJywnKTsKPiA+ID4g
PiA+ICsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgaWYgKGspCj4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgKmsrKyA9IDA7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgICAgICAg
IHBhcnNlX21lbW1hcF9vbmUoc3RyKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgc3RyID0gazsK
PiA+ID4gPiA+ICsgICAgIH0KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgIHJldHVybiAwOwo+
ID4gPiA+ID4gK30KPiA+ID4gPiA+ICtlYXJseV9wYXJhbSgibWVtbWFwIiwgcGFyc2VfbWVtbWFw
X29wdCk7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jv
b3RtZW0odm9pZCkKPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiAgICAgICBwaHlzX2FkZHJfdCB2bWxp
bnV4X2VuZCA9IF9fcGFfc3ltYm9sKCZfZW5kKTsKPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiAyLjIw
LjEKPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+ID4gPiA+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiA+ID4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+ID4g
Pgo+ID4gPiBUaGFua3MsCj4gPiA+IFl1bmh1aQo+IAo+IFRoYW5rcywKPiBZdW5odWkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
