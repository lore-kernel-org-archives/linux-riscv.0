Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76563CCFA1E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 07:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S14rNHny4SLgDMqXOdiTdunGyLkoL+8yjYSCHA+ukrE=; b=RsvKynfh5A3Y7f
	YWqm9xhm/GMAq12LTwHAPZCMlorA3Ll+UcBsLoDGIiG6jY5Y5gWocz+h/kAq0JLdL7EEpq6YZRAqS
	eIH1Z2qZS/0+sKVH+duQ2AT6y1VUd7bVJo3c6axSjKUeiSQ6+SbfF0snK6/854S0176ZliKWRBmP7
	YbHbfWkiGbC9qEzqh4lNx8dXvz+FR/zuWhcBAtjdbjVnQD0XOTH8DSbWDKCji/ejUe3ils26Ga66l
	kv8GoHpbZYh/P9XF4ghuIztV4lOwQBNRM53A2CYab+zvp27CEKVv+NAo+6gCXp4x7vJ/h/dzovxAb
	G1E6S7iJpl81S0AZB+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILsp-00000004rrX-0CXK;
	Mon, 10 Nov 2025 07:00:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILsn-00000004rqe-0W5V
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 07:00:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 696E1441FA
	for <linux-riscv@lists.infradead.org>; Mon, 10 Nov 2025 07:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4930FC16AAE
	for <linux-riscv@lists.infradead.org>; Mon, 10 Nov 2025 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762758005;
	bh=JdTdMo+NFiglCdCfKW95/AM4C/gcOP2vda5nUzM0Gcs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fOiYkuEKJeG64GjSkTz0f062EymlHD37s8k68FmgmEKb1QyozA9aH3644MecRv1rk
	 MSLlU/QP/Vt/gBlJ3JMXb/jrSpZafF8b64XnG21/d2+aOMESrCAudIQeEymVVsc7Az
	 u1E8J6JpR7C4w6R0ivD078MdWdFEsqExMLydk09mClOb76WxnIdBZ15Zb9VZf0GtbC
	 CnGwXRkUIN8wtWYTzbK8xdN2DEE8A9YeQvTVi8aKXLDnghnVc2v/Nlj6QpAt4iK/SU
	 cSdKQXbZzBawYnrauz+xbosh04Pz0PacM2n1UkAbs05FpZ5o8rWz6Bubs4wmTyw0Gu
	 Wezc5Ezmnbkbw==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b6d402422c2so531548666b.2
        for <linux-riscv@lists.infradead.org>; Sun, 09 Nov 2025 23:00:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX70DhhG22JhnhXYpmat2MCZNG/j0jsUNJhASy6pmhtRTO9kbAcM07/IjZlUKcn/RUhCnXKQj5YKdpf/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyql38wQp0WXQLnFnQk9kKQCIqKeDwm47QtisdLs52o4crBbwrh
	we9gRh6KJ8LXF2dJgqoOua82RzwMMfArLEwTnjzfhDlvFfbvUcfKfTby+JwGFnXmb7iRjdDXHOM
	pjMG+TQbmnDsfQirceWNS7tw8M4yNMIU=
X-Google-Smtp-Source: AGHT+IHkpMQjNw20ZABNl3NXRRjTGeTjlilbmH88N08NrWz3UtRyqo7y/Vo93oYm+gCDPeDFcWZjLsRDB5fNntbnReU=
X-Received: by 2002:a17:907:3fa9:b0:b6d:5262:a615 with SMTP id
 a640c23a62f3a-b72e045bbe3mr518748666b.41.1762758003839; Sun, 09 Nov 2025
 23:00:03 -0800 (PST)
MIME-Version: 1.0
References: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
 <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
 <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
 <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn> <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com> <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn>
In-Reply-To: <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 10 Nov 2025 15:00:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
X-Gm-Features: AWmQ_bmq5wLFGGuKpNEar1lHdOssPyNtLtsWck9HgwZgdpmEeIMHmCh0kt8j7JI
Message-ID: <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_230009_226474_9CCCDFCC 
X-CRM114-Status: GOOD (  28.22  )
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

T24gTW9uLCBOb3YgMTAsIDIwMjUgYXQgOToxOeKAr0FNIFRpZXpodSBZYW5nIDx5YW5ndGllemh1
QGxvb25nc29uLmNuPiB3cm90ZToKPgo+IE9uIDIwMjUvMTAvMjgg5LiL5Y2IOTo0NywgQXJkIEJp
ZXNoZXV2ZWwgd3JvdGU6Cj4gPiBPbiBTdW4sIDI2IE9jdCAyMDI1IGF0IDEyOjIwLCBIdWFjYWkg
Q2hlbiA8Y2hlbmh1YWNhaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+ID4+IE9uIFRodSwgT2N0
IDIzLCAyMDI1IGF0IDQ6MDfigK9QTSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3
cm90ZToKPiA+Pj4KPiA+Pj4gT24gVGh1LCAyMyBPY3QgMjAyNSBhdCAxMDowMSwgSHVhY2FpIENo
ZW4gPGNoZW5odWFjYWlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gT24gVGh1LCBP
Y3QgMjMsIDIwMjUgYXQgMjo1NeKAr1BNIFRpZXpodSBZYW5nIDx5YW5ndGllemh1QGxvb25nc29u
LmNuPiB3cm90ZToKPiA+Pj4+Pgo+ID4+Pj4+IEhpIEpvc2ggYW5kIEFyZCwKPiA+Pj4+Pgo+ID4+
Pj4+IE9uIDIwMjUvMTAvMjAg5LiL5Y2IMjo1NSwgSHVhY2FpIENoZW4gd3JvdGU6Cj4gPj4+Pj4+
IE9uIE1vbiwgT2N0IDIwLCAyMDI1IGF0IDk6MjTigK9BTSBUaWV6aHUgWWFuZyA8eWFuZ3RpZXpo
dUBsb29uZ3Nvbi5jbj4gd3JvdGU6Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSGkgSm9zaCwgQXJkIGFu
ZCBIdWFjYWksCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gT24gMjAyNS8xMC8xOCDkuIrljYgxOjA1LCBK
b3NoIFBvaW1ib2V1ZiB3cm90ZToKPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiAuLi4KPiA+Pj4+Pj4+Cj4g
Pj4+Pj4+Pj4gQnV0IElJVUMsIHRoZSBsaWJzdHViIGNvZGUgcnVucyAqdmVyeSogZWFybHksIGFu
ZCB3b3VsZG4ndCBzaG93IHVwIGluIGEKPiA+Pj4+Pj4+PiBzdGFjayB0cmFjZSBhbnl3YXksIGJl
Y2F1c2UgdGhlcmUgYXJlIG5vIHRyYWNlcyBvZiBpdCBvbiB0aGUgc3RhY2sgb25jZQo+ID4+Pj4+
Pj4+IGl0IGJyYW5jaGVzIHRvIGhlYWQuUyBjb2RlICh3aGljaCBkb2Vzbid0IHNhdmUgdGhlIGxp
bmsgcmVnaXN0ZXIpLgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IFRoYW5rcyBmb3IgeW91ciBkaXNjdXNz
aW9ucy4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBBcmUgeW91IE9LIHdpdGggdGhpcyBjdXJyZW50IHBh
dGNoPwo+ID4+Pj4+PiBGb3IgbWUgdGhlIGN1cnJlbnQgcGF0Y2ggaXMganVzdCBPSy4KPiA+Pj4+
Pgo+ID4+Pj4+IFdlIGhhdmUgZGlzY3Vzc2VkIHRoaXMgYSBmZXcgdGltZXMgYnV0IHRoZXJlIGlz
IGFsbW9zdCBubyBjb25zZW5zdXMKPiA+Pj4+PiBvZiB3aGF0IHNob3VsZCBoYXBwZW4gbmV4dCBh
bmQgbm90aGluZyBjaGFuZ2VzLgo+ID4+Pj4+Cj4gPj4+Pj4gQ291bGQgeW91IHBsZWFzZSBnaXZl
IG1lIGEgY2xlYXIgcmVwbHk/IFRoZW4gSSBjYW4gbWFrZSBwcm9ncmVzcyBmb3IKPiA+Pj4+PiB0
aGUgZm9sbG93aW5nIHNlcmllczoKPiA+Pj4+Pgo+ID4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xvb25nYXJjaC8yMDI1MDkxNzExMjcxNi4yNDQxNS0xLXlhbmd0aWV6aHVAbG9vbmdzb24u
Y24vCj4gPj4+PiBGb3IgbWUsIHRoaXMgcGF0Y2ggaXMgT0ssIGlnbm9yZSBfX2VmaXN0dWJfIHBy
ZWZpeCBpbiBvYmp0b29sIGlzIGFsc28KPiA+Pj4+IE9LIFsxXS4gQnV0IEkgY2Fubm90IGFjY2Vw
dCB0aGUgd2F5IHRoYXQgbW9kaWZ5aW5nIHRoZSBlZmlzdHViIHBhcnQKPiA+Pj4+IG9ubHkgZm9y
IExvb25nQXJjaC4KPiA+Pj4+Cj4gPj4+PiBDbGVhciBlbm91Z2g/Cj4gPj4+Pgo+ID4+Pgo+ID4+
PiBMb29uZ0FyY2ggaXMgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlIHdoaWNoIGhhcyB0aGUgcHJvYmxl
bSwgc28gSSBkb24ndAo+ID4+PiBzZWUgYSByZWFzb24gdG8gbW9kaWZ5IG90aGVyIGFyY2hpdGVj
dHVyZXMuCj4gPj4gIEZyb20geW91ciByZXBseSBJIHRoaW5rIHRoZSBlZmlzdHViIGNvZGUgaXMg
Y29tcGxldGVseSByaWdodCwgYnV0Cj4gPj4gb2JqdG9vbCBjYW5ub3QgaGFuZGxlIHRoZSAibm9y
ZXR1cm4iIGZ1bmN0aW9uIHBvaW50ZXIuIEFuZCB0aGlzIHBhdGNoCj4gPj4gaXMgYSB3b3JrYXJv
dW5kIHJhdGhlciB0aGFuIGEgcHJvcGVyIGZpeCAoc28geW91IGRvbid0IHdhbnQgdG8gdG91Y2gK
PiA+PiBvdGhlciBhcmNoaXRlY3R1cmVzKSwgcmlnaHQ/Cj4gPj4KPiA+Cj4gPiBUaGF0IGlzIG15
IHJlYXNvbmluZywgeWVzLiBCdXQgSm9zaCBpcyByaWdodCB0aGF0IGl0IHNob3VsZG4ndCBtYWtl
IGEKPiA+IGRpZmZlcmVuY2UgaW4gcHJhY3RpY2UsIEkgYW0ganVzdCByZWx1Y3RhbnQgdG8gbWFr
ZSBjaGFuZ2VzIHRvIHRoZQo+ID4gY29kZSBydW5uaW5nIG9uIHRoZSB0YXJnZXQgdG8gYWNjb21t
b2RhdGUgYSBmbGF3ZWQgYnVpbGQgdGltZSB0b29sLgo+Cj4gSWYgSSB1bmRlcnN0YW5kIGNvcnJl
Y3RseSwgSSBzaG91bGQgbW9kaWZ5IHRoaXMgcGF0Y2ggdG8gcmVtb3ZlIHRoZQo+IGNoYW5nZXMg
b2YgYXJtIGFuZCByaXNjdiBmb3Igbm93LCBkbyB0aGUgY2hhbmdlcyBvbmx5IHdoZW4gdGhlcmUg
aXMKPiBhIHJlYWwgcHJvYmxlbSBvciByZXF1aXJlbWVudCBzb21lIGRheSwgcmlnaHQ/IElmIG5v
IG1vcmUgY29tbWVudHMsCj4gSSB3aWxsIHNlbmQgdjMgbGF0ZXIuCk5vdyBldmVyeW9uZSBpbnZv
bHZlZCBhZ3JlZXMgdGhhdCB0aGUgZWZpc3R1YiBjb2RlIGlzIGNvcnJlY3QsIHNvIHRoZQpwcm9w
ZXIgc29sdXRpb24gaXMgdG8gZml4IHRoZSBjb21waWxlci4gQ2hhbmdpbmcgZWZpc3R1YiBjb2Rl
IGFuZApjaGFuZ2luZyBvYmp0b29sIChpZ25vcmUgX19lZmlzdHViIHByZWZpeCkgYXJlIGJvdGgg
d29ya2Fyb3VuZHMsIGJ1dCBJCnRoaW5rIGNoYW5naW5nIG9ianRvb2wgaXMgYSBsaXR0bGUgbW9y
ZSByZWFzb25hYmxlLiBNYXliZSBKb3NoIGhhcwpkaWZmZXJlbnQgaWRlYXM/CgpIdWFjYWkKCj4K
PiBUaGFua3MsCj4gVGllemh1Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
