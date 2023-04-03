Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C73AC76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 16:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9XLRWO62L5noNNLKhtKHHjdqegVmuGsj5y0zXxhjjc=; b=cafn0dygEUG+YE
	dOC+L2RDcWH+Kt5EkQPAInSBF9yvfPflwVgK+aJSAHVSPHVRLOqd8kxASWG5PMGGN215bwq/oBZ9N
	ZhdHayj+Kf06OIUyDwR+0vCPBXo1RlFzCYEYsbkQWH9fYRfi0vDTgAUzEoQOWBHAwf0xjT3S5z1sR
	1NEhTqP+mmxc1WkiVDS9YBvOdZpYankekxVsXsRka/jrnrvX5yr/10b9stlnNpMrWD7nHbhiPh0CC
	DLn74dA/26t0s/4QZRphvG8c8aNoZssFPiNFx2yLeFHVW85lqOn1A4uJN+pnWrg5i1kJLPI8S/V0c
	QygYJ2A/jWWAiJt4SRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNA1-00FyZU-1m;
	Mon, 03 Apr 2023 16:36:01 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjN9y-00FyYp-3C
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 16:36:00 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-544787916d9so561770067b3.13
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680539757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dArMv48Z0r8Svv1VMgzG7vSfoXEvpoovHL3ZA5F1Rw=;
        b=Gk/CsizFbvLI4ORGoNJJ7ovPQwr4iV3PWHd48GlCeZA4eeRa9oBDDOT3PidV2jcDsJ
         0YAXl4H0/oAe/uQ9eus8b0hrxOJVRGaW2ATmi4dWgMT46as8OTj1iqEHCY1shn9ew2DL
         36+47CtN8dXb/KaN5+DZrqset8QVBw5tGiWzLU/20SVFHvTUHBgaTcwrlO8VpXF9MYYp
         HgwOdjJ5nqgG332xm0ld6KUm1mDGDMfMwSMrDFvlXuYqsdID8NAAQSDr3GbvxDXUh631
         zo6ML+PKoREerwb7dp86tg9ihUuO45b78s1Yav6k0V/ZWUZHiU1swgIvhNg/Ww+VzpVd
         z0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680539757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dArMv48Z0r8Svv1VMgzG7vSfoXEvpoovHL3ZA5F1Rw=;
        b=eSgMS9feQvr3XXtqoxlgen8bfHr+6dqH3Aa1CkYFz6Wqh4nHoBoq5BI59cQUhk6Vfs
         1/5m2TWG1BabV8uYX692/IIivg611DN+MjS4zTkWMB2yWxe3SEV4RSvSX8efFJZOz3T7
         L9Z5QGVQH3mAGunjHRkSxsYD2T8DO8R+o9Z+kWacy9uDjAzQH5XTwdsw7RjzGLZrfRWC
         IoOSIqCKUc97sxPCM7KxmJYQirOZtaKPbO+YRt88y+9Jt1aDZsWKzSIIBlTiOfwzqxay
         YO+x8MbIMvPEPIWrqPKbeuGGNx0GUsJgv6wIdKAFTl7x0tFWzDeO0xY/pNQIKLAaJnaP
         X6YA==
X-Gm-Message-State: AAQBX9c7Sx+pCKg6eNTYSyXBNMVRO+LZYYNIEo5lv5TEdo77e0bAEYv/
	xWc1t+RVCvG0tgJXENcKu3U/4o/JI03XPz3Zrv0=
X-Google-Smtp-Source: AKy350aleZtSpwGhXEt7/aCxHFxm+jb9JLInxP02y7DKsDbn8FSITj4EbJK65VMViTBbz2Vu90d5UZgyDMar/StOsJ8=
X-Received: by 2002:a81:4406:0:b0:546:63a:6e23 with SMTP id
 r6-20020a814406000000b00546063a6e23mr13362258ywa.0.1680539756862; Mon, 03 Apr
 2023 09:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <CANiq72=i9je2864iTvZBFnhVLhF7Cema7EPCcdWOJ3mr62SqDg@mail.gmail.com>
 <a6220e52-9934-422b-9b05-95705b8fd684@spud> <b5fba6b3-177c-4325-905a-8f9f633a592a@spud>
In-Reply-To: <b5fba6b3-177c-4325-905a-8f9f633a592a@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Apr 2023 18:35:45 +0200
Message-ID: <CANiq72mip7Xs5vnS4KccxCmBmRbKGki7AYTTHxwaeyr3amvSWw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_093559_033834_8D38D79E 
X-CRM114-Status: GOOD (  24.76  )
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

T24gVGh1LCBNYXIgMzAsIDIwMjMgYXQgMTE6MTLigK9BTSBDb25vciBEb29sZXkKPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IEknZCByYXRoZXIgZG8gdGhpcyBpbiB0aGUg
UklTQy1WIE1ha2VmaWxlIHNvIHRoYXQgaXQgZG9lcyBub3QgZ2V0Cj4gZm9yZ290dGVuLgoKU291
bmRzIGdvb2QgdG8gbWUhIFdlIHdhbnQgdG8gaGF2ZSB0aGUgbGVhc3QgYW1vdW50IG9mIHRoaW5n
cyBwb3NzaWJsZQppbiB0aGUgY29tbW9uIHBpZWNlcyAoZS5nLiBmb3IgdGhlIHRhcmdldCBzcGVj
IGZpbGUgd2UgbW92ZWQgc29tZQpmbGFncyk7IHNvIHRoZSBtb3JlIHdlIG1vdmUgb3V0IHRvIGBh
cmNoL2AsIHRoZSBiZXR0ZXIuCgo+IElmIG15IHVuZGVyc3RhbmRpbmcgb2YgYmluZGdlbiBpcyBj
b3JyZWN0LCB3ZSBkb24ndCBhY3R1YWxseSBuZWVkIHRvIGJlCj4gaG9uZXN0IHRvIGl0IGFib3V0
IHdoYXQgZXh0ZW5zaW9ucyB0aGUgcmVzdCBvZiB0aGUga2VybmVsIGlzIGNvbXBpbGVkCj4gd2l0
aCwgb25seSBtYWtlIHN1cmUgdGhhdCBpdCBpcyBub3QgY2FsbGVkIHdpdGggYXJndW1lbnRzIGl0
IGRvZXMgbm90Cj4gdW5kZXJzdGFuZD8KCkFzIGxvbmcgYXMgYmluZGdlbiBnZW5lcmF0ZXMgdGhp
bmdzIHdpdGggdGhlIHJpZ2h0IEFCSSBldGMuLCB5ZWFoLgpCdXQsIGluIHByaW5jaXBsZSwgZW5h
Ymxpbmcgb25lIGV4dGVuc2lvbiBvbmUgc2lkZSBidXQgbm90IHRoZSBvdGhlcgpjb3VsZCBiZSB3
cm9uZyBpZiBpdCBlbmRzIHVwIGluIHNvbWV0aGluZyB0aGF0IFJ1c3QgdXNlcywgZS5nLiBpZiB0
aGUKQyBzaWRlIGRvZXM6CgogICAgI2lmZGVmIF9fQVJNX0FSQ0hfN1JfXwogICAgICAgIGludCB4
OwogICAgI2Vsc2UKICAgICAgICBjaGFyIHg7CiAgICAjZW5kaWYKCmFuZCBSdXN0IGF0dGVtcHRz
IHRvIHVzZSBpdCwgdGhlbiBwYXJ0aWN1bGFyIGAtbWFyY2hgIGJ1aWxkcyBjb3VsZCBiZSBicm9r
ZW4uCgo+IE9oIGFuZCBjbGFuZy0xNyBpcyBnb2luZyB0byBzdXBwb3J0IGJvdGggb2YgdGhlc2Us
IGFuZCBOYXRoYW4gYW5kIEkKPiBhbHJlYWR5IHNwZW50IGEgYnVuY2ggb2YgdGltZSBmaXhpbmcg
dGhlIGZhbGxvdXQgZnJvbSB0aGF0IQo+IEl0IHN0aWxsIGZ1bmN0aW9ucyBjb3JyZWN0bHkgd2l0
aG91dCBoYXZpbmcgdGhlbSBwYXNzZWQsIGJ1dCBJIGhhdmUKPiBoZWFyZCByZXF1aXJpbmcgdGhl
c2UgbWF5IGJlY29tZSB0aGUgZGVmYXVsdCBhdCBzb21lIHBvaW50IHRvby4KPiBXaGF0J3MgZG9u
ZSBoZXJlIG1heSBlbmQgdXAgbmVlZGluZyB0byBiZSBkeW5hbWljLCBidXQgdGhhdCBicmlkZ2Ug
Y2FuIGJlCj4gY3Jvc3NlZCBpZi93aGVuIHdlIGNvbWUgdG8gaXQuCj4KPiBXaGF0IHZlcnNpb24g
b2YgR0NDIGRvIEkgbmVlZCB0byByZXBsaWNhdGUgdGhpcz8gSSBjYW4gYnVpbGQgdGlwLW9mLXRy
ZWUKPiBnY2MgaWYgbmVlZHMgYmUuCgpTb3JyeSwgd2hhdCBkbyB5b3Ugd2FudCB0byByZXBsaWNh
dGU/IElmIHlvdSBtZWFuIHdoYXQgd2UgaGFkIGluIHRoZQpvbGQgR2l0SHViIENJLCBJIHNlZToK
CiAgICBDT05GSUdfQ0NfVkVSU0lPTl9URVhUPSJyaXNjdjY0LWxpbnV4LWdudS1nY2MgKFVidW50
dQoxMS4zLjAtMXVidW50dTF+MjIuMDQpIDExLjMuMCIKCndoaWNoIHN1Y2Nlc3NmdWxseSBib290
cyBpbiBRRU1VIGZvciB0aGUga2VybmVsIGNvbmZpZyB3ZSB0ZXN0ZWQuCgpCdXQgaWYgeW91IGFy
ZSBhc2tpbmcgd2hhdCBzaG91bGQgYmUgc3VwcG9ydGVkLCBJIGd1ZXNzIGl0IGRlcGVuZHMgb24K
dGhlIFJJU0MtViBtYWludGFpbmVycy4gSWRlYWxseSwgZXZlcnl0aGluZyB0aGF0IHRoZSBrZXJu
ZWwgc3VwcG9ydHMKKEdDQyA+PSA1LjEpLCBidXQgc2luY2UgdGhlIEdDQytSdXN0IGJ1aWxkcyBh
cmUgc28gZXhwZXJpbWVudGFsLCBJCnRoaW5rIGFzIGxvbmcgYXMgc29tZXRoaW5nIGlzIHRlc3Rl
ZCBmcm9tIHRpbWUgdG8gdGltZSwgaXQgd291bGQgYmUKZ3JlYXQgKHRvIGF0IGxlYXN0IGtub3cg
bm90IGV2ZXJ5dGhpbmcgaXMgY29tcGxldGVseSBicm9rZW4pLgoKQnV0IGlmIHlvdSB0aGluayB0
aGF0IHdvdWxkIGJlIHRvbyBtdWNoIGVmZm9ydCB0byBtYWludGFpbiwgb3IgZXZlbgpHQ0MgYnVp
bGRzIGluIGdlbmVyYWwsIHRoZW4gcGxlYXNlIGZlZWwgZnJlZSB0byBpZ25vcmUgaXQgZm9yIHRo
ZSB0aW1lCmJlaW5nLCBpLmUuIGl0IGlzIGJldHRlciB0byBoYXZlIExMVk0gYnVpbGRzIHJhdGhl
ciB0aGFuIG5vdGhpbmchIDopCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
