Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06C3D29C2D
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cW8166WOdo/5iBVkHGz3oGKY/XE9IL3T9gDPLoPsWc=; b=HJH5S8W85tnrBP
	Px3O8IZfvfecYvXe0akDG7QUMDlXXFnVqoiK2mYTXb8L3DK+rLrVg9kgtJFGr6FTae8+NEEH9GVso
	Oc4WY8KUZjrjAqJFEZq6ETV9XNa6v1EW6j8WrgcpP+q0RXi2wnnDXNp5BeumSCgKACJKjOeZOqL/c
	vrM/qu+4fVekQKfzr2J2tdnTvYyD2KU/fzje4K/vsuJXoX9StFS72r4v+bUKISYbmZZjwHjufeUJk
	bKdVlQhb44d/+17/3MdoGp0ZtBTJKEfhErhCijeqv3XsTu+VAdjXxd/gfBZGnvTjMvV+q6Azshgo7
	FeX8E4R/W+mw2tgho9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqJN-00000002Gr3-1u38;
	Mon, 19 Jan 2026 14:32:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqJK-00000002Gpu-0uBS
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 14:32:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3880C60054
	for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 14:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2924C19424
	for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 14:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768833172;
	bh=RNBqzmLpQBWPjxkWxGFq/Yj12GbrC/I6jnr8Fh30c7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AMHWNz9KwxpN5sT5NqPxtEsVcW3HEzylhO4yOX4C7vw3AUqrXDNMJChGEUUJfxDq4
	 ztFot7FeIoZVp7s+InhFIs4ByjbRJQvo+952fll2KKucOz9gAiqBLLWMN7/rusDrZY
	 TzcG+Js3lxlB2Rd5HmAt25+LU7B15vCCy2Z9h/fMs7PZJG5oXBPYG0Zq3RXRoBQ5XD
	 me8BsXMsJVdkwt+RiMJuS081L2nsJbIQEZp6oJTHMaWbOYOuVveJWlefmmamO+bI1a
	 jK7R8n5nzfeg43EcshHNKK4pMYO45wrie+tVPrmSLUUoKDQy1se4fKjXKtCeOB9+k1
	 KKpVg+RTri8tg==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6446c1a7a1cso3413118d50.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 06:32:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwLhi/yEWs6AXEOhUeRhPGa21HyvqKuuvgJkHCpRL4kx2zKCj4kDepvm4in8dMU6oIJWK4fC+Kc+OFgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBQ47//0KCpfDwwiAbg5WotUXW2L9gUemnln8Z3bQVHoQVtCzj
	AzvBOY+LW5fuYyJZCsUDdJ1PIrys2bF/5dyjLnugL66kzdUsWuisQPg/e+yhLom7C2a+Y1id6Wy
	tTPGzXaqvCfslp/vrvwLTECehxS3PfiE=
X-Received: by 2002:a05:690e:c43:b0:63f:a6c4:fed6 with SMTP id
 956f58d0204a3-6491648aaf6mr9304327d50.4.1768833172264; Mon, 19 Jan 2026
 06:32:52 -0800 (PST)
MIME-Version: 1.0
References: <029e5e79-ae9c-4d31-b75f-8f48f359d539@muenchen-mail.de>
 <aWk59MT8yWcxiYKr@x1> <0733e741-ec63-4419-a08d-50b70210361b@muenchen-mail.de>
 <CAD++jLkmeEoynOurZoSB_sz0XfJupiJcLPyWqbTe6fQFpYJotQ@mail.gmail.com> <20260119135553.145092-1-thomas.gerner@muenchen-mail.de>
In-Reply-To: <20260119135553.145092-1-thomas.gerner@muenchen-mail.de>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 15:32:41 +0100
X-Gmail-Original-Message-ID: <CAD++jLmyweD1Y1E1qONC41sPF+ZE4ajh=UvT7OeX_0DJPJsLZA@mail.gmail.com>
X-Gm-Features: AZwV_QjL76W2M1XpGuX_BIIsElFLsm-YMJyOU3mvt8Lwu5Cfs7_FyG1j7Y13Z48
Message-ID: <CAD++jLmyweD1Y1E1qONC41sPF+ZE4ajh=UvT7OeX_0DJPJsLZA@mail.gmail.com>
Subject: Re: [PATCH] Re: Typo in pinctrl-th1520.c
To: Thomas Gerner <thomas.gerner@muenchen-mail.de>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org
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

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgMjo1NuKAr1BNIFRob21hcyBHZXJuZXIKPHRob21hcy5n
ZXJuZXJAbXVlbmNoZW4tbWFpbC5kZT4gd3JvdGU6Cj4gT24gTW9uLCAxOSBKYW4gMjAyNiBhdCAx
MDowMDowNiArMDEwMCBMaW51cyBXYWxsZWlqIHdyb3RlCj4KPiA+IE9uIFRodSwgSmFuIDE1LCAy
MDI2IGF0IDg6MTY9RTI9ODA9QUZQTSBUaG9tYXMgR2VybmVyCj4gPiA8dGhvbWFzLmdlcm5lckBt
dWVuY2hlbi1tYWlsLmRlPiB3cm90ZToKPiA+Cj4gPiA+IEknbSBuZXcgaW4gd29ya2luZyBvbiB0
aGUgTGludXgga2VybmVsIGJlY2F1c2Ugb2YgbXkgQmVhZ2xlVi1BaGVhZC4gTmV4dAo+ID4gPiB0
aW1lIHdoZW4gSSBzZW5kIGEgcGF0Y2ggSSB3aWxsIHVzZSBnaXQgc2VuZC1lbWFpbC4KPiA+Cj4g
PiBXaWxsIHlvdSBzZW5kIGEgcHJvcGVyIHBhdGNoIGZvciB0aGlzPwo+ID4KPiA+IE90aGVyd2lz
ZSBwZXJoYXBzIERyZXcgY2FuIHNlbmQgYSBwcm9wZXIgcGF0Y2ggdG8gZml4IHRoaXMgYnVnCj4g
PiBzbyBJIGNhbiBhcHBseSBpdD8KPgo+IEkgaG9wZSB0aGlzIHRpbWUgdGhlIHBhdGNoIGlzIHBy
b3BlciBmb3JtYXR0ZWQuCgpOYWggaXQgZG9lc24ndCB3b3JrLi4uIGJ1dCBJIGNvdWxkIGZpeCB0
aGF0IHVwIGlmIHlvdSBzZW5kIGl0IGFnYWluCmFuZCBwcm92aWRlIHlvdXIgIlNpZ25lZC1vZmYt
YnkiIGJlY2F1c2Ugb3RoZXJ3aXNlIEkgY2Fubm90IGxlZ2FsbHkKYXBwbHkgaXQuCgpZb3VycywK
TGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
