Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F50C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 15:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erHXOeZXzfaCBwVGsInHN2JfNBHN4UhOrJu+TgWQOi0=; b=wjH5XqD9TdcWC0
	vS843qD60t1NgRnP3r9vJTKNI3c/ZdSE0dJxuBWSI4b1Xn9VN7P8VQsmtAVpQUQ+LnJKJxexUXXUf
	ROtnx8H+YfJifnUB9XdRku4AZ6f6wKblL0pNujfRcY2V8QACgImTBFb1/qwLb14Z2/BUCIfiMz57I
	dLD/bVsBPc/IPCULMTBeq0qTQhDPHV1ewoqIBOuTuiC+rkgvKjhaYjMe988d8p54cH0l5R35ofRiL
	LuXbOnc/2NQn6M+enZOiWBa0VlrbeqCRFOHd4vOnczn4NO2DYguRVf2fPTTDXBkNNLTHtMFb/ubOj
	hjxcK9HbeaLFebVWT2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffX8-00000007Mri-1fOr;
	Fri, 03 Jul 2026 15:10:26 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffX5-00000007MrP-3t5V
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 15:10:25 +0000
Message-ID: <b6f5f3b2-bf62-4b77-9c74-debbed9a4738@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783091420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0jQhMPhscsL1NbyNjS1WJWCL9R2xskq5LtPdLuRjgQ=;
	b=j/vuK0n+G28zyIBLktJU1GlREKmOyVhgVtBHvZIfkZ4ZTiO05suHg86BY+INcDSH3/rzg2
	eYKS5nnCjeL0L8QyipRBNB3i4lx61WmR8qewTnZB8a6H4G6v1/uqV3zSQLbG+NWz4f4tBv
	P9w44JsWEgPbVPjshqUB3G39TMkvs9Y=
Date: Fri, 3 Jul 2026 23:09:55 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
References: <20260703022507.187457-1-leon.hwang@linux.dev>
 <20260703114128-2a7a4723-0060-436b-99d9-7499bd90fa82@linutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260703114128-2a7a4723-0060-436b-99d9-7499bd90fa82@linutronix.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_081024_118391_2ADB67E7 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

T24gMjAyNi83LzMgMTc6NDQsIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOgo+IE9uIEZyaSwgSnVs
IDAzLCAyMDI2IGF0IDEwOjI1OjA3QU0gKzA4MDAsIExlb24gSHdhbmcgd3JvdGU6Cj4gKC4uLikK
PiAKPj4gICAgVGhlIGZvbGxvd2luZyBhcmNoaXRlY3R1cmVzIGN1cnJlbnRseSBzdXBwb3J0IHRo
aXMgZmVhdHVyZTogeDg2LTY0LCBhcm02NCwKPj4gLSAgbG9vbmdhcmNoIGFuZCBzMzkwLgo+PiAr
ICBsb29uZ2FyY2gsIHJpc2N2LCBhbmQgczM5MC4KPiAKPiBGb3IgcGVyLWFyY2hpdGVjdHVyZSBm
ZWF0dXJlIGRvY3VtZW50YXRpb24gd2UgYWxzbyBoYXZlCj4gRG9jdW1lbnRhdGlvbi9mZWF0dXJl
cy8uIE1heWJlIG1vdmUgaXQgdGhlcmUuCgoKQmV0dGVyIHRvIHJlcGxhY2Ugd2l0aCBhIHJlZmVy
ZW5jZSB0byB0aGUgZmVhdHVyZSBkb2M/CgorICBSZWZlciB0byA6ZG9jOmBmZWF0dXJlcy9jb3Jl
L21zZWFsX3N5c19tYXBwaW5ncy9hcmNoLXN1cHBvcnRgIGZvciB0aGUKKyAgc3VwcG9ydCBzdGF0
dXMgb2YgZWFjaCBhcmNoaXRlY3R1cmUuCgpUaGFua3MsCkxlb24KCj4gCj4+ICAKPj4gICAgV0FS
TklORzogVGhpcyBmZWF0dXJlIGJyZWFrcyBwcm9ncmFtcyB3aGljaCByZWx5IG9uIHJlbG9jYXRp
bmcKPj4gICAgb3IgdW5tYXBwaW5nIHN5c3RlbSBtYXBwaW5ncy4gS25vd24gYnJva2VuIHNvZnR3
YXJlIGF0IHRoZSB0aW1lCj4gCj4gKC4uLikKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
