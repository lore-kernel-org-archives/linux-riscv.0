Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826D5C44500
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfiuYxvh8qrBB8NdlMEhYWfcdYrcsLwlElhH8rKNmus=; b=r7tifhhUvQyHm9
	TfDfFBWej/L30mLplVLbHQJ+ZnqgMoTWwbOMIgrMEbKz8QIjveSGj32yd7k1LDFyo00SlVQIDLhJP
	VPGhlvr+ae7VN9DxDG+g4yD2Zzp0y4Gwzo2QEgeV8gIluqBxYov8CprL2MCT07OLYJZ5bss8l6cMq
	rL0DhcW1C14+IziYtLn/bX6NlVNtT3tBpEQ8ToHe74l/9BIkRB3FdANVEyXUoUc8Wz7XsMXguaB6u
	vR/NocQKdQIWLBtGoUnuD28bP/UkSxfQrHtvUukoSFtWX1tYl1pzBE2Q+nkGnkaGCdpVO964GE2Yy
	82UU1Si9ZMnY3K6V08uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6CQ-0000000F5dq-46ZV;
	Tue, 07 Jul 2026 13:50:58 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6CN-0000000F5cC-1sRX
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 13:50:58 +0000
Message-ID: <dd21ee9a-a7a9-46a2-b151-0f5c486772bd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783432252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/pD5OdgWh4vEEhKM48CFXryGtzNwFwor3KN08M92Y0=;
	b=kNXg8Bh/q9j4Llb5rtZWfxrp9Lr2mMLw00i06Tq8leWaM2xmpar4qi+HxLU7esLXEoV2hT
	lRYT5Gna157c2xqc0Rz7Zhbcegjm1LDQ8bTTfNSUnWM44I5A9LU6MiAs96di/YcXOoMgdY
	DHVW9lVr15gj7wPwJRUzkGHE0XkrPW4=
Date: Tue, 7 Jul 2026 21:50:31 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
References: <20260703022507.187457-1-leon.hwang@linux.dev>
 <20260703114128-2a7a4723-0060-436b-99d9-7499bd90fa82@linutronix.de>
 <b6f5f3b2-bf62-4b77-9c74-debbed9a4738@linux.dev>
 <20260707122827-2d6c18d3-8e02-4d9a-bb29-2ec46e759645@linutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260707122827-2d6c18d3-8e02-4d9a-bb29-2ec46e759645@linutronix.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_065056_889992_E80BCB28 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Gary Guo <gary@garyguo.net>, linux-riscv@lists.infradead.org, Vlastimil Babka <vbabka@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Jann Horn <jannh@google.com>, Nathan Chancellor <nathan@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Pedro Falcato <pfalcato@suse.de>, Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Liam R . Howlett" <liam@infradead.org>, Nicolas Schier <nsc@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyNi83LzcgMTg6MzQsIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOgo+IE9uIEZyaSwgSnVs
IDAzLCAyMDI2IGF0IDExOjA5OjU1UE0gKzA4MDAsIExlb24gSHdhbmcgd3JvdGU6Cj4+IE9uIDIw
MjYvNy8zIDE3OjQ0LCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToKPj4+IE9uIEZyaSwgSnVsIDAz
LCAyMDI2IGF0IDEwOjI1OjA3QU0gKzA4MDAsIExlb24gSHdhbmcgd3JvdGU6Cj4+PiAoLi4uKQo+
Pj4KPj4+PiAgICBUaGUgZm9sbG93aW5nIGFyY2hpdGVjdHVyZXMgY3VycmVudGx5IHN1cHBvcnQg
dGhpcyBmZWF0dXJlOiB4ODYtNjQsIGFybTY0LAo+Pj4+IC0gIGxvb25nYXJjaCBhbmQgczM5MC4K
Pj4+PiArICBsb29uZ2FyY2gsIHJpc2N2LCBhbmQgczM5MC4KPj4+Cj4+PiBGb3IgcGVyLWFyY2hp
dGVjdHVyZSBmZWF0dXJlIGRvY3VtZW50YXRpb24gd2UgYWxzbyBoYXZlCj4+PiBEb2N1bWVudGF0
aW9uL2ZlYXR1cmVzLy4gTWF5YmUgbW92ZSBpdCB0aGVyZS4KPj4KPj4gQmV0dGVyIHRvIHJlcGxh
Y2Ugd2l0aCBhIHJlZmVyZW5jZSB0byB0aGUgZmVhdHVyZSBkb2M/Cj4+Cj4+ICsgIFJlZmVyIHRv
IDpkb2M6YGZlYXR1cmVzL2NvcmUvbXNlYWxfc3lzX21hcHBpbmdzL2FyY2gtc3VwcG9ydGAgZm9y
IHRoZQo+PiArICBzdXBwb3J0IHN0YXR1cyBvZiBlYWNoIGFyY2hpdGVjdHVyZS4KPiAKPiBJdCBz
aG91bGQgYXV0b21hdGljYWxseSBzaG93IHVwIGhlcmU6Cj4gaHR0cHM6Ly93d3cua2VybmVsLm9y
Zy9kb2MvaHRtbC9sYXRlc3QvYWRtaW4tZ3VpZGUvZmVhdHVyZXMuaHRtbAo+IAo+IFNlZSBhbHNv
IERvY3VtZW50YXRpb24vc3BoaW54L2tlcm5lbF9mZWF0LnB5Cj4gCj4gU28gSSBkb24ndCB0aGlu
ayBhbiBleHBsaWNpdCBsaW5rIGlzIG5lY2Vzc2FyeS4KPiBCdXQgdGhlIG1haW50YWluZXJzIG1p
Z2h0IGRpc2FncmVlLgo+IEluIG15IG9waW5pb24gdGhlIGxpbmsgc2hvdWxkIHRoZW4gZ28gdG8g
dGhlIHJlbmRlcmVkIHRhYmxlIGVudHJ5Lgo+IAoKTGV0IHVzIGRyb3AgdGhlIHNlbnRlbmNlIGZv
bGxvd2luZyBQZWRybydzIHN1Z2dlc3Rpb24uCgpUaGFua3MsCkxlb24KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
