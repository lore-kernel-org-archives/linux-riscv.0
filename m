Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EE5C54E60
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 03:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gXAQ3iBLQlIju2VPRdY6qaJqWwNHSgHy1yJwYDbKC8=; b=fsteT7JD0HTem1
	RpfcOdxlyV2jb+g5cDsF1IpAiy6UALBuutuz17+XFikXHSpq6oOmyz4rN8Z6wzdt9IGVkf4nR1ju8
	IH3gWqutL1/B2gKIlNtweLltjoGzBEYtQjJAQII/Q00lPUEf7QUYPGdFBn7MBKE3Bx0jmnM9YYk8g
	jvdLncYAYkoJA4MgRsve431p8z34beJ5Fag6QEEbjMQ2njtYypMj/3iMqP718yHU/At09Ntxlk46+
	xm17O3PGacUnmC3+AhM82+3tULFOPePAotOrG9EepVnZNIidhfRe3d+ltywharcNdTBUGLk7mrZEH
	kxlXM5/5gL8rtaviAyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmQYh-0000000B8YB-2Kfo;
	Tue, 19 Mar 2024 03:54:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmQYd-0000000B8XF-3d4V
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 03:54:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9DDB4CE0A36
	for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 03:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF8BC433C7
	for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 03:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710820470;
	bh=/XkrawLqG2i47PS72vOgp+3FbB6mD7ygQqFf/7AMfjw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jcyxTowYYzfrv4rpE0FqqexZohD/qnSrpgxqXaF/gpAt/03gHwAvDD90PTE8yWe3R
	 0kEPFDGtKioXB/mM4BsAgcTxonG2ZDAAT7rtKxD5haafvtL2eaMPC1c0k6vSuvk1jB
	 CrRZekiBRqi6HkRED/x66q2+Ju/GS24+VGW/NHvBkI3vXyEqeXD6ZQEyVi0jOQ/NNC
	 D77pDqnuzrzYfVN7vkifhvRS68XiTjUqdxT0Y6HriXR05AgRRizNuuWLN8xMTpfJCh
	 /DnYX8kj6wa2yb5SjRoKB6o3FO7aFN+IAyhXIkuMxIXpVeO54vKnTuxSWpG+SkxXnt
	 suLNbuPVBJoKw==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso5707551a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 20:54:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5Aq374gMiqsN3kwZ23yEq6BKLBF+fs6KJ1byfG+EJv+X9yeETl+lzQwPuUZe/aeCjkvMLSSkxtmdKRNEYvnrVkwnF15SuVxclXG20vKli
X-Gm-Message-State: AOJu0YxaHbfbmiPdzXsU/7DHcU0qT7KUCeKRlq/fE7/0vDz1C32VJbV8
	ste8qWfqlx+OWUx4aN/Au1X+TYyZQWkXgu4Z45ozmx2ZCVC85xpoDcaWBOdpThuoVzYuRnqrGXl
	zu5b3Qn0WIqd0/h359OP++uCnlNU=
X-Google-Smtp-Source: AGHT+IHULGVOK33jSlydOXp0yUv+oahLhhqOCvIpeWsTZCuGDW/Vx3lvBuGyR+N7M9F6DxqmjpoRLna7CCEpQnR47D8=
X-Received: by 2002:a05:6402:1cc4:b0:567:f643:fc5c with SMTP id
 ds4-20020a0564021cc400b00567f643fc5cmr1180305edb.20.1710820469374; Mon, 18
 Mar 2024 20:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240313085843.17661-1-vladimir.isaev@syntacore.com>
In-Reply-To: <20240313085843.17661-1-vladimir.isaev@syntacore.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 19 Mar 2024 11:54:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSjVKhX4RZKYHo392g56yczg2j6rLUqTqR9GM3i2zOBOw@mail.gmail.com>
Message-ID: <CAJF2gTSjVKhX4RZKYHo392g56yczg2j6rLUqTqR9GM3i2zOBOw@mail.gmail.com>
Subject: Re: [PATCH] riscv: hwprobe: do not produce frtace relocation
To: Vladimir Isaev <vladimir.isaev@syntacore.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, evan@rivosinc.com, nicolas@fjasle.eu, 
	tglx@linutronix.de, samitolvanen@google.com, masahiroy@kernel.org, 
	maskray@google.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Artemev <roman.artemev@syntacore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_205436_359913_AF63C1EC 
X-CRM114-Status: GOOD (  16.42  )
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

T24gV2VkLCBNYXIgMTMsIDIwMjQgYXQgNTowNeKAr1BNIFZsYWRpbWlyIElzYWV2Cjx2bGFkaW1p
ci5pc2FldkBzeW50YWNvcmUuY29tPiB3cm90ZToKPgo+IFN1Y2ggcmVsb2NhdGlvbiBjYXVzZXMg
Y3Jhc2ggb2YgYW5kcm9pZCBsaW5rZXIgc2ltaWxhciB0byBvbmUKPiBkZXNjcmliZWQgaW4gY29t
bWl0IGUwNWQ1N2RjYjhjNwo+ICgicmlzY3Y6IEZpeHVwIF9fdmRzb19nZXR0aW1lb2ZkYXkgYnJv
a2UgZHluYW1pYyBmdHJhY2UiKS4KPgo+IExvb2tzIGxpa2UgdGhpcyByZWxvY2F0aW9uIGlzIGFk
ZGVkIGJ5IENPTkZJR19EWU5BTUlDX0ZUUkFDRSB3aGljaCBpcwo+IGRpc2FibGVkIGluIHRoZSBk
ZWZhdWx0IGFuZHJvaWQga2VybmVsLgo+Cj4gQmVmb3JlOgo+Cj4gcmVhZGVsZiAtclcgYXJjaC9y
aXNjdi9rZXJuZWwvdmRzby92ZHNvLnNvOgo+Cj4gUmVsb2NhdGlvbiBzZWN0aW9uICcucmVsYS5k
eW4nIGF0IG9mZnNldCAweGQwMCBjb250YWlucyAxIGVudHJ5Ogo+ICAgICBPZmZzZXQgICAgICAg
ICAgICAgSW5mbyAgICAgICAgICAgICBUeXBlCj4gMDAwMDAwMDAwMDAwMGQyMCAgMDAwMDAwMDAw
MDAwMDAwMyBSX1JJU0NWX1JFTEFUSVZFCj4KPiBvYmpkdW1wOgo+IDAwMDAwMDAwMDAwMDBjODYg
PF9fdmRzb19yaXNjdl9od3Byb2JlQEBMSU5VWF80LjE1PjoKPiAgYzg2OiAgIDAwMDEgICAgICAg
ICAgICAgICAgICAgIG5vcAo+ICBjODg6ICAgMDAwMSAgICAgICAgICAgICAgICAgICAgbm9wCj4g
IGM4YTogICAwMDAxICAgICAgICAgICAgICAgICAgICBub3AKPiAgYzhjOiAgIDAwMDEgICAgICAg
ICAgICAgICAgICAgIG5vcAo+ICBjOGU6ICAgZTIxMSAgICAgICAgICAgICAgICAgICAgYm5leiAg
ICBhMixjOTIgPF9fdmRzb19yaXNjdl9od3Byb2JlLi4uCj4KPiBBZnRlcjoKPiByZWFkZWxmIC1y
VyBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3Zkc28uc286Cj4KPiBUaGVyZSBhcmUgbm8gcmVsb2Nh
dGlvbnMgaW4gdGhpcyBmaWxlLgo+Cj4gb2JqZHVtcDoKPiAwMDAwMDAwMDAwMDAwYzg2IDxfX3Zk
c29fcmlzY3ZfaHdwcm9iZUBATElOVVhfNC4xNT46Cj4gIGM4NjogICBlMjExICAgICAgICAgICAg
ICAgICAgICBibmV6ICAgIGEyLGM4YSA8X192ZHNvX3Jpc2N2X2h3cHJvYmUuLi4KPiAgYzg4OiAg
IGM2YjkgICAgICAgICAgICAgICAgICAgIGJlcXogICAgYTMsY2Q2IDxfX3Zkc29fcmlzY3ZfaHdw
cm9iZS4uLgo+ICBjOGE6ICAgZTczOSAgICAgICAgICAgICAgICAgICAgYm5leiAgICBhNCxjZDgg
PF9fdmRzb19yaXNjdl9od3Byb2JlLi4uCj4gIGM4YzogICBmZmZmZDc5NyAgICAgICAgICAgICAg
ICBhdWlwYyAgIGE1LDB4ZmZmZmQKPgo+IEFsc28gZGlzYWJsZSBTQ1Mgc2luY2UgaXQgYWxzbyBz
aG91bGQgbm90IGJlIGF2YWlsYWJsZSBpbiB2ZHNvLgo+Cj4gRml4ZXM6IGFhNWFmMGFhOTBiYSAo
IlJJU0MtVjogQWRkIGh3cHJvYmUgdkRTTyBmdW5jdGlvbiBhbmQgZGF0YSIpCj4gU2lnbmVkLW9m
Zi1ieTogUm9tYW4gQXJ0ZW1ldiA8cm9tYW4uYXJ0ZW1ldkBzeW50YWNvcmUuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IFZsYWRpbWlyIElzYWV2IDx2bGFkaW1pci5pc2FldkBzeW50YWNvcmUuY29tPgo+
IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgMSArCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3Zkc28vTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCj4gaW5kZXgg
OWI1MTdmZTFiOGE4Li4yNzJjNDMxYWM1YjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdmRzby9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUK
PiBAQCAtMzcsNiArMzcsNyBAQCBlbmRpZgo+Cj4gICMgRGlzYWJsZSAtcGcgdG8gcHJldmVudCBp
bnNlcnQgY2FsbCBzaXRlCj4gIENGTEFHU19SRU1PVkVfdmdldHRpbWVvZmRheS5vID0gJChDQ19G
TEFHU19GVFJBQ0UpICQoQ0NfRkxBR1NfU0NTKQo+ICtDRkxBR1NfUkVNT1ZFX2h3cHJvYmUubyA9
ICQoQ0NfRkxBR1NfRlRSQUNFKSAkKENDX0ZMQUdTX1NDUykKTEdUTSwgZ29vZCBjYXRjaCwgdGhh
bmtzIDopCgpSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cgo+Cj4gICMg
RGlzYWJsZSBwcm9maWxpbmcgYW5kIGluc3RydW1lbnRhdGlvbiBmb3IgVkRTTyBjb2RlCj4gIEdD
T1ZfUFJPRklMRSA6PSBuCj4gLS0KPiAyLjQzLjAKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBS
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
