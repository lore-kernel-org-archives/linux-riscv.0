Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E60BC5478C
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 11:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RT13gPEcf+fVZ1iUBTADXoctFIIf4g1kCuBfgvhOZiE=; b=PoFsHTGDOJsFrx
	Ua0ljlQ9AbQyKwNAeK75XmHXN3S8qwB2S0sAf9Dzivrl9z4+myc21laspM+iFz/qUV/bpB3v1zjv1
	CKjG0rGxeoaMsI+G9xUxzguRNDa4EbYC2OD1BYXIzQrBPBKdm59fQTF3Pong40F5DGv3rMXQZfml7
	/h+szJt3xOkLf4gvIg8+ZQzuVg2A5K+7bdf/+oq5NlQeeyT4+DDMiUca4w/wKl4EzL5DX6An/nny4
	TUVDUUzkGdFGycx0qRnQMGk2FvUMReffEVOWx0lSWyWkRyjHm9HsZhrA7hDuqm9BL3olro6NYhEcU
	p7mRnTl5bNjyZmbfyBMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg15A-0000000HaIm-23i7;
	Fri, 01 Mar 2024 11:29:40 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg151-0000000HaCj-1UrJ
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 11:29:38 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-56694fdec74so2516068a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 03:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709292569; x=1709897369; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6rqbYpfS5pcWnhkyceNm4nCsA9xdZ82hdVcREX/cMw=;
        b=EzToU8nvlXvs2F1pa+tzM/JjXSUPkWgoCmUWlpJeSuMPHe8MOPsJD37bAxtWIjzPsM
         cRhK3rFf8Dr/DWAJeHwaEfOj0WC10WfoF6jSOBHCJ1C7YbGvGLaEKNLpUfcszflhXOZs
         XdSYCbAqCfOKP0eDROjK4tL5illklmtboFZwNRlmjedCIe2qHlIXfQwC67ETExufOf2i
         UZpbg8EqlP3GN6UTsxkXBKvYDlccM2zt/6xAaw9Ri/0eyvdJil5fXEppw2408vpnZZBM
         e1zQNYsuLBFKI4CHB/oJN02vfGPUB/QfwlRZeW7e9N2aTXh4vv/2HKS9EoNH0w/b8w3D
         D8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709292569; x=1709897369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6rqbYpfS5pcWnhkyceNm4nCsA9xdZ82hdVcREX/cMw=;
        b=rzksnxfxmLE4PKH6CncqE8pk+8dUtYaOZcM269jTUAjgHZqQJI+IGUs7iHv04Z8KRB
         BRYWFAG/vbjQhTGzmwEXdayCcCEx6kOPqT34bvBvKGdqAm9SLEyYjH5tDxZj2xIKp1V+
         Wx6wBEsm/aN2Mh9qRmXI3lCrz+ZKuRD2UD0HbqfzlaOm+FXdTwmdAEJax+WAY9uEuE09
         P2zmAA8i9g/V91vFuuBsJoGQ+TEbmYb43UywobLNA12PtRpmy+6DYVnT5HetCq8Lsp/S
         I4PIusuy2BdxW/2s9u0Fn1CmHf7p1dlruVKZPAzqkvgOXUzC0zAWd8PlIaGZfw51vZMk
         NPew==
X-Forwarded-Encrypted: i=1; AJvYcCVRwmjJTmSYIy1jqZQpZ8+sg/uH5aD98Y7C2VpgZwtP5mSorHFJGktUDuzR2UcII61PcW7INkiQDwCMiIDZE3QS4wFusf95DfDQ9P+KbXCl
X-Gm-Message-State: AOJu0Ywz4TVHLwc22kCx4MLiPTA6hR1ZinD94Zs3flsFtPn/M/dvjwcC
	dVZgmHESxJltVdgAOaQd2m8IfnfKZfO4RzBTI6/wigAlBFS2l5GOzuZANHCEHVL3mIV2Dj+L345
	N3cSbk7WQlIDDz/okq4BTWY5APIQWbbdAYiiDgQ==
X-Google-Smtp-Source: AGHT+IGhWExtL6QtBViwPNAoKlHWs7DOlO2fT48mVk9Foe5Dl0xsN+CFFn8dgQruLadr4n6Yxb7nj2ska+hps6+i1zE=
X-Received: by 2002:a05:6402:222b:b0:566:6640:10e5 with SMTP id
 cr11-20020a056402222b00b00566664010e5mr938238edb.12.1709292569232; Fri, 01
 Mar 2024 03:29:29 -0800 (PST)
MIME-Version: 1.0
References: <20240301091455.246686-1-alexghiti@rivosinc.com> <b99f47f9-18d0-4619-aae7-19274197b85e@arm.com>
In-Reply-To: <b99f47f9-18d0-4619-aae7-19274197b85e@arm.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 1 Mar 2024 12:29:18 +0100
Message-ID: <CAHVXubiH64beFuB_GHSq5BKCus=O_+bqYTCwWQ+=2Q-F=T=ctQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] Merge arm64/riscv hugetlbfs contpte support
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_032931_846698_EE951271 
X-CRM114-Status: GOOD (  26.40  )
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

SGkgUnlhbiwKCk9uIEZyaSwgTWFyIDEsIDIwMjQgYXQgMTE6NDXigK9BTSBSeWFuIFJvYmVydHMg
PHJ5YW4ucm9iZXJ0c0Bhcm0uY29tPiB3cm90ZToKPgo+IEhpIEFsZXhhbmRyZSwKPgo+IEkgY29u
ZmVzcyBJIGhhdmVuJ3QgbG9va2VkIGF0IHRoZSBwYXRjaGVzIHlldCwgYnV0IHRoaXMgY292ZXIg
bGV0dGVyIHJhaXNlcyBhCj4gZmV3IHF1ZXNpb25zIGZvciBtZS4gSSdsbCBhaW0gdG8gbG9vayBh
dCB0aGUgYWN0dWFsIHBhdGNoZXMgaW4gZHVlIGNvdXJzZS4KPgo+IE9uIDAxLzAzLzIwMjQgMDk6
MTQsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IFRoaXMgcGF0Y2hzZXQgaW50ZW5kcyB0byBt
ZXJnZSB0aGUgY29udGlndW91cyBwdGVzIGh1Z2V0bGJmcyBpbXBsZW1lbnRhdGlvbgo+ID4gb2Yg
YXJtNjQgYW5kIHJpc2N2Lgo+ID4KPiA+IEJvdGggYXJtNjQgYW5kIHJpc2N2IHN1cHBvcnQgdGhl
IHVzZSBvZiBjb250aWd1b3VzIHB0ZXMgdG8gbWFwIHBhZ2VzIHRoYXQKPiA+IGFyZSBsYXJnZXIg
dGhhbiB0aGUgZGVmYXVsdCBwYWdlIHRhYmxlIHNpemUsIHJlc3BlY3RpdmVseSBjYWxsZWQgY29u
dHB0ZQo+ID4gYW5kIHN2bmFwb3QuCj4gPgo+ID4gVGhlIHJpc2N2IGltcGxlbWVudGF0aW9uIGRp
ZmZlcnMgZnJvbSB0aGUgYXJtNjQncyBpbiB0aGF0IHRoZSBMU0JzIG9mIHRoZQo+ID4gcGZuIG9m
IGEgc3ZuYXBvdCBwdGUgYXJlIHVzZWQgdG8gc3RvcmUgdGhlIHNpemUgb2YgdGhlIG1hcHBpbmcs
IGFsbG93aW5nCj4gPiBmb3IgZnV0dXJlIHNpemVzIHRvIGJlIGFkZGVkIChmb3Igbm93IG9ubHkg
NjRLQiBpcyBzdXBwb3J0ZWQpLiBUaGF0J3MgYW4KPiA+IGlzc3VlIGZvciB0aGUgY29yZSBtbSBj
b2RlIHdoaWNoIGV4cGVjdHMgdG8gZmluZCB0aGUgKnJlYWwqIHBmbiBhIHB0ZSBwb2ludHMKPiA+
IHRvLiBQYXRjaCAxIGZpeGVzIHRoYXQgYnkgYWx3YXlzIHJldHVybmluZyBzdm5hcG90IHB0ZXMg
d2l0aCB0aGUgcmVhbCBwZm4KPiA+IGFuZCByZXN0b3JlcyB0aGUgc2l6ZSBvZiB0aGUgbWFwcGlu
ZyB3aGVuIGl0IGlzIHdyaXR0ZW4gdG8gYSBwYWdlIHRhYmxlLgo+Cj4gWWVzIHRoYXQgbWFrZXMg
c2Vuc2UgdG8gbWUuIFRoZSBpbnRlbnRpb24gZm9yIG1USFAgKCFodWdldGxiKSBpcyB0byBmdWxs
eQo+IGVuY2Fwc3VsYXRlIFBURXMgYmVpbmQgc2V0X3B0ZXMoKSwgcHRlcF9nZXQoKSBhbmQgZnJp
ZW5kcywgc28gd2hhdCdzIGFjdHVhbGx5Cj4gd3JpdHRlbiB0byB0aGUgcGd0YWJsZSBpcyBhcmNo
LXNwZWNpZmljIGFuZCB3ZWxsIGFic3RyYWN0ZWQuCj4KPiA+Cj4gPiBUaGUgZm9sbG93aW5nIHBh
dGNoZXMgYXJlIGp1c3QgbWVyZ2VzIG9mIHRoZSAyIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMK
PiA+IHRoYXQgY3VycmVudGx5IGV4aXN0IGluIGFybTY0IGFuZCByaXNjdiB3aGljaCBhcmUgdmVy
eSBzaW1pbGFyLiBJdCBwYXZlcwo+ID4gdGhlIHdheSB0byB0aGUgcmV1c2Ugb2YgdGhlIHJlY2Vu
dCBjb250cHRlIFRIUCB3b3JrIGJ5IFJ5YW4gWzFdIHRvIGF2b2lkCj4gPiByZWltcGxlbWVudGlu
ZyB0aGUgc2FtZSBpbiByaXNjdi4KPgo+IFlvdSBzZWVtIHRvIGJlIHRhbGtpbmcgYWJvdXQgYm90
aCBodWdldGxiICh3aGljaCB1c2VzIHRoZSAiaHVnZSIgcHRlIGhlbHBlcnMpCj4gYW5kIGNvbnRw
dGUgZm9yIFRIUCAoaS5lLiBtVEhQLCB3aGljaCB1c2VzIHRoZSByZWd1bGFyIHB0ZSBoZWxwZXJz
KS4gVGhleSBhcmUKPiBwcmV0dHkgc2VwYXJhdGUgaW4gbXkgbWluZCwgc28gbm90IHN1cmUgd2h5
IHlvdSB3b3VsZCBiZSBtb2RpZnlpbmcgdGhlbSBib3RoIGluCj4gdGhlIHNhbWUgc2VyaWVzPwoK
SSBkb24ndCwgdGhpcyBwYXRjaHNldCBvbmx5IGRlYWxzIHdpdGggaHVnZXRsYiwgSSBqdXN0IG1l
YW50IHRoYXQgdGhpcwpzZXJpZXMgd2FzIGp1c3QgdGhlIGJlZ2lubmluZyBhcyBJJ20gd29ya2lu
ZyBvbiBtb3ZpbmcgdGhlIGNvbnRwdGUgZm9yClRIUCBzdXBwb3J0IGluIHRoZSBnZW5lcmljIGNv
ZGUgZm9yIHJpc2N2IHRvIHVzZS4KClNvcnJ5IG15IHdvcmRpbmcgd2FzIGFtYmlndW91cyA6KQoK
VGhhbmtzLAoKQWxleAoKPgo+IFRoYW5rcywKPiBSeWFuCj4KPiA+Cj4gPiBUaGlzIHBhdGNoc2V0
IHdhcyB0ZXN0ZWQgYnkgcnVubmluZyB0aGUgbGliaHVnZXRsYmZzIHRlc3RzdWl0ZSB3aXRoIDY0
S0IKPiA+IGFuZCAyTUIgcGFnZXMgb24gYm90aCBhcmNoaXRlY3R1cmVzIChvbiBhIDRLQiBiYXNl
IHBhZ2Ugc2l6ZSBhcm02NCBrZXJuZWwpLgo+ID4KPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjQwMjE1MTAzMjA1LjI2MDcwMTYtMS1yeWFuLnJvYmVy
dHNAYXJtLmNvbS8KPiA+Cj4gPiBBbGV4YW5kcmUgR2hpdGkgKDkpOgo+ID4gICByaXNjdjogUmVz
dG9yZSB0aGUgcGZuIGluIGEgTkFQT1QgcHRlIHdoZW4gbWFuaXB1bGF0ZWQgYnkgY29yZSBtbSBj
b2RlCj4gPiAgIHJpc2N2OiBTYWZlbHkgcmVtb3ZlIGh1Z2VfcHRlX29mZnNldCgpIHdoZW4gbWFu
aXB1bGF0aW5nIE5BUE9UIHB0ZXMKPiA+ICAgbW06IFVzZSBjb21tb24gaHVnZV9wdGVwX2dldCgp
IGZ1bmN0aW9uIGZvciByaXNjdi9hcm02NAo+ID4gICBtbTogVXNlIGNvbW1vbiBzZXRfaHVnZV9w
dGVfYXQoKSBmdW5jdGlvbiBmb3IgcmlzY3YvYXJtNjQKPiA+ICAgbW06IFVzZSBjb21tb24gaHVn
ZV9wdGVfY2xlYXIoKSBmdW5jdGlvbiBmb3IgcmlzY3YvYXJtNjQKPiA+ICAgbW06IFVzZSBjb21t
b24gaHVnZV9wdGVwX2dldF9hbmRfY2xlYXIoKSBmdW5jdGlvbiBmb3IgcmlzY3YvYXJtNjQKPiA+
ICAgbW06IFVzZSBjb21tb24gaHVnZV9wdGVwX3NldF9hY2Nlc3NfZmxhZ3MoKSBmdW5jdGlvbiBm
b3IgcmlzY3YvYXJtNjQKPiA+ICAgbW06IFVzZSBjb21tb24gaHVnZV9wdGVwX3NldF93cnByb3Rl
Y3QoKSBmdW5jdGlvbiBmb3IgcmlzY3YvYXJtNjQKPiA+ICAgbW06IFVzZSBjb21tb24gaHVnZV9w
dGVwX2NsZWFyX2ZsdXNoKCkgZnVuY3Rpb24gZm9yIHJpc2N2L2FybTY0Cj4gPgo+ID4gIGFyY2gv
YXJtNjQvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAxICsKPiA+ICBhcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaCAgICB8ICA1OSArKysrKy0KPiA+ICBhcmNoL2FybTY0L21tL2h1
Z2V0bGJwYWdlLmMgICAgICAgICB8IDI5MSArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
PiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHVnZXRsYi5oICAgIHwgICAyICstCj4gPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggfCAgMTEgKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUuaCAgICB8IDEyMCArKysrKysrKysrKy0KPiA+ICBhcmNoL3Jpc2N2L21tL2h1
Z2V0bGJwYWdlLmMgICAgICAgICB8IDIyNyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgbW0v
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKwo+ID4gIG1tL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiA+ICBtbS9jb250cHRlLmMgICAgICAg
ICAgICAgICAgICAgICAgICB8IDI2OCArKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMTEg
ZmlsZXMgY2hhbmdlZCwgNDU2IGluc2VydGlvbnMoKyksIDUyOCBkZWxldGlvbnMoLSkKPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgbW0vY29udHB0ZS5jCj4gPgo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
