Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8FBC88E7D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 17:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWVCrbZ1hcGEkwO/u//wQoGcu014fY7dJE5vfynIICA=; b=ICqiDpTdmzYAHk
	tnARBtFVRyvKopFVCZo7tLzU3llRHlRPrZonBSS0QLGfXV+AlI+0mT5vS+QUbczkRWj1FeK7iHz7Z
	mF0wz/hErPSnydIhmqEGGej3r+P7P2O8J3xnopFRF5PCVxP+BcEmvnkbKmON+VxUS/X4+fBvOel1c
	QEv/hXD0o/aYfyZV+srtl03BCv8QYfLCQQchV6odjoFl/ALjfvaLMlSZW9BI4+4EDOwMFxhypbEyx
	7giKsTvQGFmg4dscrZ9sw6QMmMNb0kLIenWOd5MspWtQpCb4VpRdY6/7ZzCVscmf8Z77urejWZCXW
	pn3RmGADCAAJ/c245PAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XG6-00000007dds-1K9u;
	Tue, 15 Sep 2026 17:47:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XG3-00000007db2-2Vfe
	for linux-riscv@bombadil.infradead.org;
	Tue, 15 Sep 2026 17:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=; b=aq714smfIjY1Cc4iCO65uNdCHB
	WLa5l/AuQ4+RKWAmlujpTmHkOanJ1Puif+XMDerYPZBTJYGCyp/YOU8g+i7/2TeTMFe2/OIjkgtCg
	d76QZMpvDDTnQm49bW7wEQDmtO6L+MtzfEKFWX3MOW6WU/7iDdSg5qY4iKiIctZVitD1pEqrGhaR4
	R4w4aDw5U9VA9sVcMTkLlCo++t4oXq4D1xvS/hsDbn14RYu12VbsiOIvqKRY/Y+3P9iLQfFMbhhgB
	DQZlho5/iL9m/YpO5FZhTUiXdilWr2FRHFyWuKwt2AfVcQnlZl1C3XTNzdtKFOhr00VsvzpbSEwQn
	Rneu5+AQ==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6XG0-000000076Pv-1HM4
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 17:47:50 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso5417545e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 10:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494466; cv=none;
        d=google.com; s=arc-20260327;
        b=fOCRF0aju1BzsztXhDO7g16mHgAzU8WjdZnSj6cvjpv45Bn/I22vF2uUzncTo6Lv8g
         fx4m+ncUvuGa05O8YqkFslYZ4fmMDd/RMRQtPRgzQcC3GOYZcrnVdebtml44ErBdiWdY
         ofe4aXkJ0KgoOtSLE3EMx04LvyZzsopfBMJwe5jDwk1ruVhCdknQ08XqOIX47vWLOLgZ
         st3ajVVD/LHdgctj/6HwXPKP38969Tmdxj/X3iBtPCREYT9vUeBlFJ6yWejExJThGitp
         VAxcgqwNcLypVLq7wwiTesnOK0N6FGpb/KAGEK8tKVR8vvLIk/yEKQWcab6DiVOfPBoW
         P9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
        fh=SXXIcnjLoe6Gjnbg0/9TWRnAZMhxqedK+LXPRwtpygc=;
        b=m+sfNEAoqdZwhm5IvRjTjtRgzIlbo83ODVmPt3Jo/y4S4rIpLDS5ySWYdqU591JpsP
         6+JPoTSRfTH0loi/MitxwD0y18C080EZx1O/zmEY2tfoI+c+EJYcgNzB7FVw+CFuh7wh
         3SB3XO4ospT6670o5CyStI7JP3Mlgc9hHD3u747Ip1sJFRsigOmbFFzO4Ou16MbfIQ+W
         ctX77OE9uYTNw73yVC3o7PZ3X+5rJfIJ2QSQ1Y+0VQ1UYiGDFqj2LK9BOI2ulioTXpw4
         amxyuPILBu58CQqBmWsE5ej8iA0uRpQPD0U7LfADV31WbSSIRolAN6FrDKoV4RrrM1UK
         haUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494466; x=1790099266; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
        b=CoKUUVlN1oSwnbXhaYAwlzci7rjeNQ9q9faAQQPuGq03jlF9kpzqbvo+ZlgbrqQnWP
         Oc+j24qn1n5RjATkqbfxbOle1/FjB7HjrxXDM/Tims9GJn2Sd7I3Bnz4kBEC+CLdGqGn
         RkbPFGJtKLkOORiZjYLEp0SoRztJt7opxgHuCbgl8Ym6fV6fjSJHwFYn19ZgqA3axY3I
         gsrzA85KaR4Z+x/u6aVRb8Rp8bgmvR6tvq4kOyQdTz7yQ3W/tv9gA5ujCSchBYRivaZO
         aXhluvtz+P/3muOUBML3P04D9+70j2I3M8f5NRwWWSX/7anGDR55SQkIaCO3qp0HlP8q
         1WOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494466; x=1790099266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
        b=LI/QZPUmfL/sYeRvi949eOQmnbodM0862W3Tb1HpDtGuQJ9k9Nw79ertB+BcAOsnGB
         q+awuydyDpmqYKs9MGWkQggBxc6NLzNuJcfhhgsU/RzvBI5SZozfeZ++z1sUn3eo28Ge
         +Sn88lfGWgkw/0R9rpmce/7tAkMHm5BOFnOvdVZipPsPvGumKjyWCPHmWK/DUo9TJRnA
         BjsB7r6wh1h3gwaev9UmhObC/0c3dSep1TckW6CjASi03o19fy/d1hb6B0cd62WjNz0Y
         trm3KmvYUZaFL97odTF/fO+JiO7AGpI5pBBSV3k9QWm4rQctQ1saLiOML+a9VwT40N4J
         cIfg==
X-Forwarded-Encrypted: i=1; AKwUvBx/d1EYzb7fn5stV/Ao8RPdZQmDiGL3Fccf4SDCgntMuGMD5U/UCzX6v3K2AnhzqRSPmN1rL0XGMFhPBg==@lists.infradead.org
X-Gm-Message-State: AFuF++kQ93VOD8jqusvWZdhzzwu2X0jd9p/+ojiWKLZNFyipZ5HeCj3/
	OucueF7YxWN6EWZ2SOD7Q5WTzZZ3EnD4AC2expsVRdpx0lOiM4NH1W7ijW2M9XKdA+L+GaCdD8L
	MKvWPDcBX1Ecv7CnHl+DhTkeRR7BAWOeStx4pGtzN
X-Gm-Gg: AYBFou2Lp9C5KI9uAGLdNUHnYqV1Zop38KPnYLOU9H+1gzXq0zSUCxKwRWDaF07YBwU
	hMKbX5yexgGxLuSLyhg48BAlzgL4BC4WIHoQzbaP9DqmpuH3t3eMo3Ykme8nefslFGDvAduQaNI
	DNz/Pc7pphymEOtfG4wcvgCKfjeZDjRWvDF/BfiLYI7hRDeuOgeNHDP/rdwoSm7r0eB+9jat5QY
	5+JYdxK1Qmwvac9UL2JrCmIB3EdGhAxgNdfsjmhRf9MbsWf5BRQZxnieJyIUqW9CuBECqi5uAVu
	KyzKYKSHFfeB9kpLnKWEW9t7l/euKBV4kb6akgkahEzsa5tKDqyxGaE38HymUioX3eGQnWKsuxj
	Nu38RmsaglgaYvNToeFL3QG/gHA1V7z315lgN/ITDY1EzOXPg7yjSfrxzk4TAJmVOtP4=
X-Received: by 2002:a05:600d:84ca:10b0:49c:ff66:7d88 with SMTP id
 5b1f17b1804b1-49e7d725e6fmr51370615e9.7.1789494465544; Tue, 15 Sep 2026
 10:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org> <202609140844.FA7E848A@keescook>
 <aqk9gakQhxToLnDI@gremlin> <202609150955.A51C9F7A20@keescook>
In-Reply-To: <202609150955.A51C9F7A20@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Sep 2026 10:47:34 -0700
X-Gm-Features: AcwNN1U4CY7rpoxX3OGd9mqCs-kE5osRcDbnjG2lLmWDcf89pyFwGTPPrVzl7qI
Message-ID: <CAKwvOdmgeyqivO4pVa=30XDWpXvdRzBR8f13rfuPzDx=LJ1Tsw@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if available
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_184748_359226_EC0A22D6 
X-CRM114-Status: GOOD (  23.32  )
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

T24gVHVlLCBTZXAgMTUsIDIwMjYgYXQgMTA6MzHigK9BTSBLZWVzIENvb2sgPGtlZXNAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIFNlcCAxNSwgMjAyNiBhdCAwMzozMDo0M1BNICswMTAw
LCBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgd3JvdGU6Cj4gPiBPbiBNb24sIFNlcCAxNCwgMjAyNiBh
dCAwOTozOTowN0FNIC0wNzAwLCBLZWVzIENvb2sgd3JvdGU6Cj4gPiA+IEhvd2V2ZXIsIHBhcmFs
bGVsaXNtIG5lZWRzIHRvIGJlIHNldC4gV2UgY2FuJ3QgbGV0IGl0IGVhdCBhbGwgQ1BVczogaXQK
PiA+ID4gbmVlZHMgdG8gcmVzcGVjdCB0aGUgLWogbWFrZSBvcHRpb24gKGFuZCBtYWtlIGl0cyBD
UFUgcmVzZXJ2YXRpb24ga25vd24KPiA+ID4gdG8gIm1ha2UiKSwgd2hpY2ggd2UgYWxyZWFkeSBo
YXZlIGEgc29sdXRpb24gZm9yIGluCj4gPiA+IHNjcmlwdHMvam9ic2VydmVyLWV4ZWMuCj4gPgo+
ID4gVGhlIG9ubHkgcGxhY2Ugd2hlcmUgaXQncyBpbnZva2VkIGlzIHZtbGludXguYmluIGF0IHRo
ZSBlbmQgb2YgdGhlIHNlcmlhbAo+ID4gdGFpbCwgd2hlcmUgYWxsIHRoZSB0b2tlbnMgd291bGQg
YmUgZnJlZSBhbnl3YXkuCj4gPgo+ID4gU28gSSBkb24ndCB0aGluayBpdCByZWFsbHkgYnV5cyBh
bnl0aGluZyBhdCBhbGw/Cj4KPiBUaGVyZSBhcmUgMiB0aGluZ3MgSSdtIHRoaW5raW5nIGFib3V0
Ogo+Cj4gYSkKPiBNeSBtYWluIGNvbmNlcm4gaXMgdGhlIGxhY2sgb2YgcmVzcGVjdGluZyB0aGUg
LWogbWFrZSBhcmd1bWVudC4gSW4gbXkKPiBtaW5kLCB0aGlzIGlzIGEgYmxvY2tlciwgYmVjYXVz
ZSBpdCBtZWFucyBhIGJ1aWxkIHdpbGwgbm93IF9hbHdheXNfIHNwaW4KPiB1cCBtYXggQ1BVcyAo
bm90IHdoYXQgLWogaGFzIGxpbWl0ZWQgaXQgdG8pLCBhbmQgZm9yIENJcywgc2hhcmVkIGNvbXB1
dGUKPiBzeXN0ZW1zLCBvciB3aGF0ZXZlciwgdGhpcyB2aW9sYXRlcyB0aGUgcmVxdWVzdGVkIHBh
cmFsbGVsaXNtIGxldmVsLiBGb3IKPiBleGFtcGxlLCBpZiBJJ20gZG9pbmcgYSBsb25nLXJ1bm5p
bmcgQ29jY2luZWxsZSByZXBsYWNlbWVudCBpbiBvbmUgdHJlZQo+ICh3aGljaCB1c2VzIGhhbGYg
dGhlIENQVXMpLCBhbnkgYnVpbGRzIEkgbGF1bmNoIEknbSBhc2tpbmcgZm9yIHRoZSBvdGhlcgo+
IGhhbGYgb2YgbXkgQ1BVcyB0byBiZSB1c2VkIHNvIHRoZXkgZG9uJ3QgdGhyYXNoIG15IGNhY2hl
Lgo+Cj4gVGhpcyBpcyB0aGUga2luZCBvZiAid2h5IGFyZSBhbGwgdGhlIENQVXMgc3Bpbm5pbmcg
dXA/IiBxdWVzdGlvbiBJCj4gaGVscGVkIHRyYWNrIGRvd24gd2l0aCBjb21taXQgNTFlNDZjN2E0
MDA3ICgiZG9jcywgcGFyYWxsZWxpc206IFJlYXJyYW5nZQo+IGhvdyBqb2JzZXJ2ZXIgcmVzZXJ2
YXRpb25zIGFyZSBtYWRlIikgZm9yZXZlciBhZ28uCgpQYXJzZSAtaiBmcm9tIE1BS0VGTEFHUyAo
aHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9hLzc2NTE3ODg2KSwKZm9yd2FyZCBpdCB0byBwaWd6
PwoKLS0gClRoYW5rcywKfk5pY2sgRGVzYXVsbmllcnMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
