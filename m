Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300F9C54ED1
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jun 2025 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KkDTI8/85/FCZxx2Oj8f3UmyyICa0rxMS9jL/q/7CA=; b=iIcFNbh3ozfCkQ
	dzwtSFQvWmKgyUqNOF2JjnNVKaU9uWk1EdPRXUS7Y5myxIK8O1GmaQkHt9w+NJv+29KxVTg2bv2kc
	KqcF0s+VSoDY55/9EZ2sl7koEEk0EK1wF9vCE8th8OBqfCxSgeK643/QYLox6WuykGEENrN6doqVK
	Ly9bzWS7u643peAfCauOR0aJi3rSs2qRgKRnLGnWKtFQ5/Zx1iaAlmpuJe19dfIVTx3Ej2WpeUr7r
	hSwgTWk5UhP6Sm9B7ylOsw9YW6jsxVvjOaF1XTSL2wVyo7Mg00imVbRapakTjdfjtIzx2WThrWMWf
	bExcuxyJwjoAtKq4tkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVVYq-0000000GpNc-1EaR;
	Sat, 28 Jun 2025 13:25:40 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVVYn-0000000GpMw-2k0P;
	Sat, 28 Jun 2025 13:25:39 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-553dceb342fso2713710e87.0;
        Sat, 28 Jun 2025 06:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751117135; x=1751721935; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9hXJHuBvyYPVmVbLpoMFR4H07JOmA06RF+Wl4Z/7RE=;
        b=UNg0+YjOIuTKaSQTk8dwMPEEIdhSkfxjQC+I/+gQrfvMrfCn1Q4Xc9zDPCMkhRZ3Bj
         gK+gEAVFbLcK+gmsWtTvVvRzCm4EHyP0frbKoRK8jhGbFLKyNyrqsKAXHfL52bvmPvBC
         fl39Z6iivpZutEFj012lG9QsmN5F7KXq15SAdP+gkJFxqtLK0Q48JDE+/TB5roe5PZYK
         faqrJj5HU8i+MEnCsP7xd1CE9sW5SzNhhk5njG6uWcBhDDyR88iyEZMkE5oTbGFOxbbk
         uIfMcVQWIjQZ32+u5hH99NqqGgvTd60eJYgoB7RcUPcsbYsPe2+qrLJkARMMDqwWY/Tj
         ikSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751117135; x=1751721935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9hXJHuBvyYPVmVbLpoMFR4H07JOmA06RF+Wl4Z/7RE=;
        b=PMSWe5Fa2ZraP2+AnE1k28mU91OLMLAVSJsrFHR0s5bwtg8vQOF0FHfFrkhZhM7hyT
         cD5IdyVy0ths6M7tAVHsMUyMqRrs4JU2gE7KGY7h1KeD7N5bB7/+vKq4yn/xM+MmzMJe
         LwIPVsUkXwK2lGTM5eU+WEjFjNWqP3NuWhzM4xqgKvwYe+TNdJF9X+GozKdEhjZG8fhA
         5Nu0iAr07/ikLPb2Sa/4Ywz+iCwEDu5hRHh8qUsbsAOFxSnKzfFadahOMdoRtp9tuVe9
         3LMNcSuyeQw+WCG2I/all9Nq7bigBhWifg2lTYFE0FuJphpv6WB7BZQWlMXTVfqB46Xp
         Kr3A==
X-Forwarded-Encrypted: i=1; AJvYcCVPdGzIAtkAnzDKDaQTh5YschpTCmfCEWnl8mqiq5GPGlSvcGJPto+pA/3gsw6vDVIUXRIS9rcDSQo=@lists.infradead.org, AJvYcCW/1h9zk805UmtP5Bunr998BQyDViDCGa2A9URkSynlHP0HHddTSQPWGf8+BalKDuaFI0vhzEbAbi8S3etf0nlB@lists.infradead.org, AJvYcCWQhHhYk7izP3C0zZvMw/tRU1A+T2frR8Zk3JZXrBTOaldHtludG5C13yGWgBjaUl26q9/VA3jneJ0CTJM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHxfgeHdMUYWKYDcAleuAlS+cN3RpCOjRuzMgvdel//au4LWhI
	f/gPGFvUCEWTxndvsEElNceALrW2pPLRXzMDEsFAIVI1RIVM4GFNTgIhNeB38r8yFhaJa+gB95M
	VfTdAhVilh7dA0GXHr+nwMG78UZ1xou2kzDm63rUVKw==
X-Gm-Gg: ASbGncuK7YJxlObgHSGlfBDHcLTd0Wok4U7O7XKz2fUxBSfbgxoOp5Bu5lIpcPRnGz4
	CwBIwtnX+lBjas/RMWcRgYuiFDE0aL9B39d7f/W8G/JcYmifXSufPE+nTgHkZNz4mUK3G03CBjj
	x2LC+wl3NWrEfE5JEVm4xPOT7KKklwmICa8T6G3cma+IvRM3Y=
X-Google-Smtp-Source: AGHT+IGcgqdYgD7HxbDyPqcYV3Heu4fL1zBBGlE2pOeLSvkf48pz8fpRePfbVo/DnCDwvNyc5box4+f/veOvw14SJEw=
X-Received: by 2002:a05:6512:401e:b0:553:d1b0:1f1f with SMTP id
 2adb3069b0e04-5550b817bf9mr2031982e87.21.1751117135042; Sat, 28 Jun 2025
 06:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250626153147.145312-1-snovitoll@gmail.com> <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
In-Reply-To: <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Sat, 28 Jun 2025 18:25:17 +0500
X-Gm-Features: Ac12FXz_1yZEfUGAygYOxkSS_g1GpWf3Y2t1PdPyYRlgb0h3dTvUyL8mVDVK8Qk
Message-ID: <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with kasan_enabled
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	akpm@linux-foundation.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, arnd@arndb.de, rppt@kernel.org, 
	geert@linux-m68k.org, mcgrof@kernel.org, guoweikang.kernel@gmail.com, 
	tiwei.btw@antgroup.com, kevin.brodsky@arm.com, benjamin.berg@intel.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_062537_695953_FCA557CE 
X-CRM114-Status: GOOD (  27.61  )
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

T24gU2F0LCBKdW4gMjgsIDIwMjUgYXQgMzo1N+KAr1BNIEFuZHJleSBLb25vdmFsb3YgPGFuZHJl
eWtudmxAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDI2LCAyMDI1IGF0IDU6MzLi
gK9QTSBTYWJ5cnpoYW4gVGFzYm9sYXRvdgo+IDxzbm92aXRvbGxAZ21haWwuY29tPiB3cm90ZToK
PiA+Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyB1bmlmaWVzIHRoZSBrYXNhbl9hcmNoX2lzX3JlYWR5
KCkgYW5kIGthc2FuX2VuYWJsZWQoKQo+ID4gaW50ZXJmYWNlcyBieSBleHRlbmRpbmcgdGhlIGV4
aXN0aW5nIGthc2FuX2VuYWJsZWQoKSBpbmZyYXN0cnVjdHVyZSB0bwo+ID4gd29yayBjb25zaXN0
ZW50bHkgYWNyb3NzIGFsbCBLQVNBTiBtb2RlcyAoR2VuZXJpYywgU1dfVEFHUywgSFdfVEFHUyku
Cj4gPgo+ID4gQ3VycmVudGx5LCBrYXNhbl9lbmFibGVkKCkgb25seSB3b3JrcyBmb3IgSFdfVEFH
UyBtb2RlIHVzaW5nIGEgc3RhdGljIGtleSwKPiA+IHdoaWxlIG90aGVyIG1vZGVzIGVpdGhlciBy
ZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfS0FTQU4pIChjb21waWxlLXRpbWUKPiA+IGNvbnN0YW50
KSBvciByZWx5IG9uIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBrYXNhbl9hcmNoX2lzX3JlYWR5KCkK
PiA+IGltcGxlbWVudGF0aW9ucyB3aXRoIGN1c3RvbSBzdGF0aWMga2V5cyBhbmQgZ2xvYmFsIHZh
cmlhYmxlcy4KPiA+Cj4gPiBUaGlzIGxlYWRzIHRvOgo+ID4gLSBDb2RlIGR1cGxpY2F0aW9uIGFj
cm9zcyBhcmNoaXRlY3R1cmVzCj4gPiAtIEluY29uc2lzdGVudCBydW50aW1lIGJlaGF2aW9yIGJl
dHdlZW4gS0FTQU4gbW9kZXMKPiA+IC0gQXJjaGl0ZWN0dXJlLXNwZWNpZmljIHJlYWRpbmVzcyB0
cmFja2luZwo+ID4KPiA+IEFmdGVyIHRoaXMgc2VyaWVzOgo+ID4gLSBBbGwgS0FTQU4gbW9kZXMg
dXNlIHRoZSBzYW1lIGthc2FuX2ZsYWdfZW5hYmxlZCBzdGF0aWMga2V5Cj4gPiAtIENvbnNpc3Rl
bnQgcnVudGltZSBlbmFibGUvZGlzYWJsZSBiZWhhdmlvciBhY3Jvc3MgbW9kZXMKPiA+IC0gU2lt
cGxpZmllZCBhcmNoaXRlY3R1cmUgY29kZSB3aXRoIHVuaWZpZWQga2FzYW5faW5pdF9nZW5lcmlj
KCkgY2FsbHMKPiA+IC0gRWxpbWluYXRpb24gb2YgYXJjaCBzcGVjaWZpYyBrYXNhbl9hcmNoX2lz
X3JlYWR5KCkgaW1wbGVtZW50YXRpb25zCj4gPiAtIFVuaWZpZWQgdm1hbGxvYyBpbnRlZ3JhdGlv
biB1c2luZyBrYXNhbl9lbmFibGVkKCkgY2hlY2tzCj4gPgo+ID4gVGhpcyBhZGRyZXNzZXMgdGhl
IGJ1Z3ppbGxhIGlzc3VlIFsxXSBhYm91dCBtYWtpbmcKPiA+IGthc2FuX2ZsYWdfZW5hYmxlZCBh
bmQga2FzYW5fZW5hYmxlZCgpIHdvcmsgZm9yIEdlbmVyaWMgbW9kZSwKPiA+IGFuZCBleHRlbmRz
IGl0IHRvIHByb3ZpZGUgdHJ1ZSB1bmlmaWNhdGlvbiBhY3Jvc3MgYWxsIG1vZGVzLgo+ID4KPiA+
IFsxXSBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNzA0OQo+
Cj4gSGkgU2FieXJ6aGFuLAo+Cj4gVGhhbmsgeW91IGZvciB3b3JraW5nIG9uIHRoaXMhCj4KPiBP
bmUgYXNwZWN0IHRoYXQgaXMgbWlzc2luZyBmcm9tIHRoZSBwYXRjaGVzIGlzIG1vdmluZyB0aGUK
PiBrYXNhbl9hcmNoX2lzX3JlYWR5KCkgY2FsbHMgaW50byB0aGUgaW5jbHVkZS9saW51eC9rYXNh
bi5oICh0aGlzIGlzCj4gbm90IGV4cGxpY2l0bHkgbWVudGlvbmVkIGluIHRoZSBpc3N1ZSwgYnV0
IHRoaXMgaXMgd2hhdCB0aGUgImFkZGluZwo+IF9fd3JhcHBlcnMiIHBhcnQgaXMgYWJvdXQpLgo+
Cj4gQW5vdGhlciB0aGluZyB0aGF0IG5lZWRzIGNhcmVmdWwgY29uc2lkZXJhdGlvbiBpcyB3aGV0
aGVyIGl0J3MKPiBwb3NzaWJsZSB0byBjb21iaW5lIGthc2FuX2FyY2hfaXNfcmVhZHkoKSBhbmQg
a2FzYW5fZW5hYmxlZCgpIGludG8gdGhlCj4gc2FtZSBjaGVjayBsb2dpY2FsbHkgYXQgYWxsLiBU
aGVyZSdzIG9uZSBpc3N1ZSBtZW50aW9uZWQgaW4gWzFdOgoKSGVsbG8sCkkndmUgcmVtb3ZlZCBr
YXNhbl9hcmNoX2lzX3JlYWR5KCkgYXQgYWxsIGluIHRoaXMgc2VyaWVzOgpbUEFUQ0ggdjIgMTEv
MTFdIGthc2FuOiByZXBsYWNlIGthc2FuX2FyY2hfaXNfcmVhZHkgd2l0aCBrYXNhbl9lbmFibGVk
CgpJcyBpdCBub3Qgd2hhdCdzIGV4cGVjdGVkIGJ5IHVuaWZpY2F0aW9uPwoKPgo+ID4gSW4ga2Fz
YW5fY2FjaGVfY3JlYXRlKCkgd2UgdW5jb25kaXRpb25hbGx5IGFsbG9jYXRlIGEgbWV0YWRhdGEg
YnVmZmVyLAo+ID4gYnV0IHRoZSBrYXNhbl9pbml0X3NsYWJfb2JqKCkgY2FsbCB0byBpbml0aWFs
aXNlIGl0IGlzIGd1YXJkZWQgYnkKPiA+IGthc2FuX2VuYWJsZWQoKS4gQnV0IGxhdGVyIHBhcnRz
IG9mIHRoZSBjb2RlIG9ubHkgY2hlY2sgdGhlIHByZXNlbmNlIG9mCj4gPiB0aGUgYnVmZmVyIGJl
Zm9yZSB1c2luZyBpdCwgc28gYmFkIHRoaW5ncyBoYXBwZW4gaWYga2FzYW5fZW5hYmxlZCgpCj4g
PiBsYXRlciB0dXJucyBvbiAoSSB3YXMgZ2V0dGluZyBzb21lIGVycm9yIGFib3V0IGludmFsaWQg
bG9jayBzdGF0ZSkuCj4KPiBBbmQgdGhlcmUgbWlnaHQgYmUgb3RoZXIgY2FsbGJhY2tzIHRoYXQg
c2hvdWxkIGJlIGV4ZWN1dGVkIGV2ZW4gYmVmb3JlCj4ga2FzYW5faW5pdF8uLi4oKSBjb21wbGV0
ZXMuIEJ1dCB0aGVuIGZvciB0aGUgSFdfVEFHUyBtb2RlLCBpZgo+IGthc2FuX2VuYWJsZWQoKSBp
cyBvZmYsIHRoZW4gd2UgZG9uJ3Qgd2FudCB0byBleGVjdXRlIGFueSBjYWxsYmFja3MuCj4KPiBT
byBtYXliZSB3ZSBkbyBhY3R1YWxseSBuZWVkIGEgc2VwYXJhdGUgc3RhdGljIGtleSBmb3IKPiBr
YXNhbl9hcmNoX2lzX3JlYWR5KCkuIEJ1dCBldmVuIGlmIHNvLCBpdCBzdGlsbCBtYWtlcyBzZW5z
ZSB0byBtb3ZlCj4ga2FzYW5fYXJjaF9pc19yZWFkeSgpIGludG8gdGhlIF9fd3JhcHBlcnMgZm9y
IHRoZSBhZmZlY3RlZCBjYWxsYmFja3MuCj4KPiBUaGFua3MhCj4KPiBbMV0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtbW0vQ0ErZkNuWmY3SnFUSDQ2QzdvRzJXazlObkxVN2hnaVZERUsw
RUE4UkF0eXItS2drSGRnQG1haWwuZ21haWwuY29tLwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
