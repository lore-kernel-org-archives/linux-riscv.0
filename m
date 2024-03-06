Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AB1C5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvwlRANOpIzJ9SWS0RQjxJnXhVQYeB/paj+ZxIDyF7Y=; b=GIFW5BPBL+DNtU
	zso7uw526vDQy0+TceoW4PhCRUOkNaztumbkHk5HKtI/hIpTJ+jK1YwMlZFg/CvGf3eouKWnIgILk
	HjQrd1zeiau9jzxrDZkXXLxHWPly49f1ur4KnSoeT5zrDsxiVb+KBaibtfC+WSZUFX7TgxcKsLhF6
	r8AFFEkbrrTRF1kb+yUxCg0JkPJVoaG/TR3J9u/Af2dnJOg4eNtIl8lWKYG1bf3/qvu4Vj7GpGNVN
	TzpVkolX/jjlVTJWrIj6g2TYC+UE1zq+3OJ7/kW8S4DVgClLlv+ddJ/gkU1AzloKWtwyjBPjXqMP8
	XQxrs2X7MvqFACAYvVZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhqTn-00000000DKI-2ZwG;
	Wed, 06 Mar 2024 12:34:39 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhqTj-00000000DHr-1e3z
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 12:34:37 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3bbbc6e51d0so4727148b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 04:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1709728472; x=1710333272; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBGRXmGCAD/uVlbKtB45vlqVQka6EkYD3kJejOBpkfw=;
        b=KVH49Kh5OMQt2OnstZ1InJOI4lMch+ZH8SF8ZwP6BnTKwH40FC3Eq26TBGuXwxJFJL
         tJCbFPRHZDzWB6Lddu9NfMkU1HkxEITeNns9PGgW9DuE5DrsqZqVpCvo7AYy9jsgb95x
         OGHx7lEnY7XETiSHYhvA5llBEC4fk4cBZLN8ir6Y15GnY/yly1uVhN9IirxR+e98UTRv
         gWgHijCbb30MMygORxSBJvnYkVAzdFmIPlMEEAoPQ4FehrD1tV8y0T4tebKxeIWdvD5Z
         +8Yi/D0tjvP6FlpN0buTCa1S17PmVR0kD2ijMqjlnpn8VVz5AjnoVaxQp3sRG4MYb4sh
         /W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709728472; x=1710333272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBGRXmGCAD/uVlbKtB45vlqVQka6EkYD3kJejOBpkfw=;
        b=j+1EmcTECJSfJGiLfmdvudodmL64ATtUwAtghyhMLAudtll3nROTeBpmXHECEi5qSx
         LZasydGsnqKIWk+cb6j7FM0D0GKc0WpSoHboreu7jCsu7u0mPcHcgAjpimQFQCpIDMao
         Br6e1pxm9rA4mDWl+4FtblF3OyWVtD9YpujrelOwPxTvaQFSINlXAzeNWeQMdSs5tw49
         GV9QSqHF0Lt0ZLEt75KnUt3sEirPQBu8UgoPQMHpjdlTqIWazpe0UEboS8ivpXJ4pzcP
         C3gLpCKOK+ep+pRsD5e+m5GGhjfpYhYNPFCOhd67KDded/rK2eL1olHU2v4X6yozjpE2
         NNtA==
X-Forwarded-Encrypted: i=1; AJvYcCUoMCOIos7jW84pJG9A9Sg8Iz5Y3HSHncDZL2SO/GcaAwHKAjh4xRfSVdS9lanSVi6NorAfjjT8zuNwRmlr/J2SFiz73loP+LEQiMwfTR4K
X-Gm-Message-State: AOJu0Yw0x+8VYQVh1kxxXT+yIrPdzrlShVCnZ0HONXRGpvxxozWvblNo
	FyAFEEVVJTychLxVlGmMaN2kxnJonk5OUtWMq88gIeePbt+VbKqU6manLce3MuZ609+fVZfcz2P
	A5/maUswKZOY1xxOOQ5KXFwLIMODwEPwMrCqLSg==
X-Google-Smtp-Source: AGHT+IEKZchaHuxM+IkeNKMSoR23Mk/EGmhIpibhcWiKs7wVibMip+LebNngnKtOjIhBOtdjNHUw+nGKFWAgS+qZ5g4=
X-Received: by 2002:a05:6870:c192:b0:21f:dc6e:e4f9 with SMTP id
 h18-20020a056870c19200b0021fdc6ee4f9mr5153338oad.1.1709728472158; Wed, 06 Mar
 2024 04:34:32 -0800 (PST)
MIME-Version: 1.0
References: <20240306085622.87248-1-cuiyunhui@bytedance.com>
 <20240306085622.87248-3-cuiyunhui@bytedance.com> <CAMj1kXEjjFAeVAVwiDO22RJECSM=L=0q6J=zog7JR38rUZpLGQ@mail.gmail.com>
In-Reply-To: <CAMj1kXEjjFAeVAVwiDO22RJECSM=L=0q6J=zog7JR38rUZpLGQ@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 6 Mar 2024 20:34:21 +0800
Message-ID: <CAEEQ3w=2pX+pjwoz=hNFpR4thD+d6o9OmBob8LMzZ8BbKZ=pqg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 3/3] efistub: fix missed the initialization
 of gp
To: Ard Biesheuvel <ardb@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, samitolvanen@google.com, 
	bp@alien8.de, xiao.w.wang@intel.com, jan.kiszka@siemens.com, 
	kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_043435_725905_53249F59 
X-CRM114-Status: GOOD (  19.21  )
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

SGkgQXJkLAoKT24gV2VkLCBNYXIgNiwgMjAyNCBhdCA1OjM24oCvUE0gQXJkIEJpZXNoZXV2ZWwg
PGFyZGJAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIDYgTWFyIDIwMjQgYXQgMDk6NTYs
IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+Cj4gPiBDb21w
YXJlZCB3aXRoIGdjYyB2ZXJzaW9uIDEyLCBnY2MgdmVyc2lvbiAxMyB1c2VzIHRoZSBncAo+ID4g
cmVnaXN0ZXIgZm9yIGNvbXBpbGF0aW9uIG9wdGltaXphdGlvbiwgYnV0IHRoZSBlZmlzdHViIG1v
ZHVsZQo+ID4gZG9lcyBub3QgaW5pdGlhbGl6ZSBncC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZ
dW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+IENvLURldmVsb3BlZC1ieTog
WmhpcGVuZyBYdSA8eHV6aGlwZW5nLjE5NzNAYnl0ZWRhbmNlLmNvbT4KPgo+IFRoaXMgbmVlZHMg
YSBzaWduLW9mZiwgYW5kIHlvdXIgc2lnbm9mZiBuZWVkcyB0byBjb21lIGFmdGVyLgo+Cj4gPiAt
LS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVyLlMgfCAxMSArKysrKysrKysrLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2VmaS1oZWFkZXIuUyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2VmaS1oZWFkZXIuUwo+ID4gaW5kZXggNTE1YjJkZmJjYTc1Li5mYTE3YzA4YzA5
MmEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVyLlMKPiA+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL2VmaS1oZWFkZXIuUwo+ID4gQEAgLTQwLDcgKzQwLDcgQEAg
b3B0aW9uYWxfaGVhZGVyOgo+ID4gICAgICAgICAubG9uZyAgIF9fcGVjb2ZmX2RhdGFfdmlydF9l
bmQgLSBfX3BlY29mZl90ZXh0X2VuZCAgICAgIC8vIFNpemVPZkluaXRpYWxpemVkRGF0YQo+ID4g
ICNlbmRpZgo+ID4gICAgICAgICAubG9uZyAgIDAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAvLyBTaXplT2ZVbmluaXRpYWxpemVkRGF0YQo+ID4gLSAgICAgICAubG9uZyAg
IF9fZWZpc3R1Yl9lZmlfcGVfZW50cnkgLSBfc3RhcnQgICAgICAgICAvLyBBZGRyZXNzT2ZFbnRy
eVBvaW50Cj4gPiArICAgICAgIC5sb25nICAgX2VmaXN0dWJfZW50cnkgLSBfc3RhcnQgICAgICAg
ICAvLyBBZGRyZXNzT2ZFbnRyeVBvaW50Cj4gPiAgICAgICAgIC5sb25nICAgZWZpX2hlYWRlcl9l
bmQgLSBfc3RhcnQgICAgICAgICAgICAgICAgIC8vIEJhc2VPZkNvZGUKPiA+ICAjaWZkZWYgQ09O
RklHXzMyQklUCj4gPiAgICAgICAgIC5sb25nICBfX3BlY29mZl90ZXh0X2VuZCAtIF9zdGFydCAg
ICAgICAgICAgICAgIC8vIEJhc2VPZkRhdGEKPiA+IEBAIC0xMjEsNCArMTIxLDEzIEBAIHNlY3Rp
b25fdGFibGU6Cj4gPgo+ID4gICAgICAgICAuYmFsaWduIDB4MTAwMAo+ID4gIGVmaV9oZWFkZXJf
ZW5kOgo+ID4gKwo+ID4gKyAgICAgICAuZ2xvYmFsIF9lZmlzdHViX2VudHJ5Cj4gPiArX2VmaXN0
dWJfZW50cnk6Cj4KPiBUaGlzIHNob3VsZCBnbyBpbnRvIC50ZXh0IG9yIC5pbml0LnRleHQsIG5v
dCB0aGUgaGVhZGVyLgo+Cj4gPiArICAgICAgIC8qIFJlbG9hZCB0aGUgZ2xvYmFsIHBvaW50ZXIg
Ki8KPiA+ICsgICAgICAgbG9hZF9nbG9iYWxfcG9pbnRlcgo+ID4gKwo+Cj4gV2hhdCBpcyBzdXBw
b3NlZCB0byBoYXBwZW4gaGVyZSBpZiBDT05GSUdfU0hBRE9XX0NBTExfU1RBQ0s9eT8gVGhlIEVG
SQo+IHN0dWIgTWFrZWZpbGUgcmVtb3ZlcyB0aGUgU0NTIENGTEFHUywgc28gdGhlIHN0dWIgd2ls
bCBiZSBidWlsdAo+IHdpdGhvdXQgc2hhZG93IGNhbGwgc3RhY2sgc3VwcG9ydCwgd2hpY2ggSSBn
dWVzcyBtZWFucyB0aGF0IGl0IG1pZ2h0Cj4gdXNlIEdQIGFzIGEgZ2xvYmFsIHBvaW50ZXIgYXMg
dXN1YWw/Cj4KPiA+ICsgICAgICAgY2FsbCBfX2VmaXN0dWJfZWZpX3BlX2VudHJ5Cj4gPiArICAg
ICAgIHJldAo+ID4gKwo+Cj4gWW91IGFyZSByZXR1cm5pbmcgdG8gdGhlIGZpcm13YXJlIGhlcmUs
IGJ1dCBhZnRlciBtb2RpZnlpbmcgdGhlIEdQCj4gcmVnaXN0ZXIuIFNob3VsZG4ndCB5b3UgcmVz
dG9yZSBpdCB0byBpdHMgb2xkIHZhbHVlPwpUaGVyZSBpcyBubyBuZWVkIHRvIHJlc3RvcmUgdGhl
IHZhbHVlIG9mIHRoZSBncCByZWdpc3Rlci4gV2hlcmUgZ3AgaXMKbmVlZGVkLCB0aGUgZ3AgcmVn
aXN0ZXIgbXVzdCBmaXJzdCBiZSBpbml0aWFsaXplZC4gQW5kIGhlcmUgaXMgdGhlCmVudHJ5LgoK
UmVnYXJkaW5nIHlvdXIgZmlyc3QgdHdvIGNvbW1lbnRzIGFib3ZlLCBJIHBsYW4gdG8gbWFrZSB0
aGUgZm9sbG93aW5nCmNoYW5nZXMgaW4gdjIsCmVmaV9oZWFkZXJfZW5kOgorCisgICAgICAgX19J
TklUCisgICAgICAgLmdsb2JhbCBfZWZpc3R1Yl9lbnRyeQorX2VmaXN0dWJfZW50cnk6CisgICAg
ICAgLyogUmVsb2FkIHRoZSBnbG9iYWwgcG9pbnRlciAqLworLm9wdGlvbiBwdXNoCisub3B0aW9u
IG5vcmVsYXgKKyAgICAgICBsYSBncCwgX19nbG9iYWxfcG9pbnRlciQKKy5vcHRpb24gcG9wCisK
KyAgICAgICBjYWxsIF9fZWZpc3R1Yl9lZmlfcGVfZW50cnkKKyAgICAgICByZXQKKyAgICAgICBf
X0hFQUQKKwogICAgICAgIC5lbmRtCgp3aGF0IGRvIHlvdSB0aGluaz8KClRoYW5rcywKWXVuaHVp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
