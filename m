Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C431A606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 06:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wh5UGJQt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=VVy59VhX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lhtIqrvKteT6Z4+ueQgYpvoSXSnXkE/r4+gggUKexnk=; b=Wh5UGJQtTpgSZfkC5G53LdzVIe
	JysWmaz3hg4cpZHCY8OPJYFjdTi47s0yFyAn911jjOmColce92nTeGHfAJu4k+lg9Yl2bbYycrn84
	/VjwMY+cacySZ1qX2pcb0Lu/c3hgwgTbSDtg/QHk5ALI6NGaqQWaGmRJx9sFz7NasMOCk2+6jIcfo
	FCwKvmAUnovGAQ4W9ow8C1JTc7U/k4YrXv1O7K62qOWooK5Y3XIMTATSk/iq4pJizp1WzQEJl0rnN
	Ii6wW1M6WmTN9yje4CIKlCyF7XTrMCWM1Zorz5KybVP8SK7NcA5geFCvRw3SKsBb9QJ0tHVA15x40
	9kOfqU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ7w-00000007uBq-1BqK;
	Wed, 18 Nov 2026 06:26:40 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ7u-00000007uBL-1LFG;
	Wed, 18 Nov 2026 06:26:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794983169; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=II/905t/7s1Bx2boCuHu/7QbYxEz+LgQLzRgga2Y2iNyT2iRlg8cYn/Sh9TeD5z/IL90wCBleYcN4uCdvRRdJWYm0Pe9kseSvuF+VxCLh/PiQIJ2Sop7S61eseKeZAFVwM45ji40cwP5T6E+zjOxc0L0Is0EmgpbeOK80P6RxF8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794983169; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wChTs17w/kPirEcR5u/gSY+8kUIHSjZ+Ainq8hP8/TU=; 
	b=JHhEy+7gRq7N9dwaoUeNiKRqY0KJCJLsbz8t6/Pe733vDBJY95QQy2YA4pEObW2cVV+hem/rSgnNqxoQREvZkpFCldM9ywDm55k+ifV9oZGcLcKN2B4KTyCnE0vsaJmkZvroWUEUeWnH3UCK6H7cQRIPt3RI4uotr2mnhSuw9+w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=VVy59VhXnd3NmcMyl4P+5fUkpk/NxP74/38dN0hJ+TQz/hJRSel3AlhuVs3d/fK1E2tFmbhkQDSBM1TV4GVn2/7pfJA/9XwedNA79MvxorYEBvSwPUQRCt0ycWmlie/UDgtBmQo33Fen2oDdQlfLCFqZ7AR/7o9x0LVKLGajmZ5aLlMvq6LptGs0TFjZL059B/PhrEN0uOvchMxc4njgNPo79UEfQjr2XHNv2Xk8VOyFVCxGWDWy3iZly+wsvucrZp8+Y43R8s3mVJ8BTti0VsnU+F99NOR7xxRYC7RDwQ85J1Qz/dp0axDxmlGdwmeMTkquFlKPQ1+8/JUes9R34w==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=wChTs17w/kPirEcR5u/gSY+8kUIHSjZ+Ainq8hP8/TU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794983165898478.8118549869997;
	Tue, 17 Nov 2026 22:26:05 -0800 (PST)
Message-ID: <9d97d5dbcc619a9c52904ff8c6704a91fe8351e7.camel@icenowy.me>
Subject: Re: [PATCH v2 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
From: Icenowy Zheng <uwu@icenowy.me>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Cody Kang <codykang.hk@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard	 <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring	 <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Vinod Koul
 <vkoul@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu
 <heylenay@4d2.org>, Michael Turquette	 <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Brian Masney	 <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Paul Walmsley	 <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,  Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
	 <u.kleine-koenig@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Date: Wed, 18 Nov 2026 14:25:38 +0800
In-Reply-To: <f4b8c87eb0676500661ebea67363ac27.docular.xu@gmail.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
	 <20260809-k3-display-v2-15-327d7910bf71@gmail.com>
	 <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
	 <f4b8c87eb0676500661ebea67363ac27.docular.xu@gmail.com>
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_222638_443230_D257B335 
X-CRM114-Status: GOOD (  16.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMTfkuoznmoQgMTU6NTEgLTA1MDDvvIxHdW9kb25nIFh15YaZ6YGT77yaCj4g
SGkgSWNlbm93eSwKPiAKPiBPbiBUaHUsIDAzIFNlcCAyMDI2IDIwOjA5OjQyICswODAwLCBJY2Vu
b3d5IFpoZW5nIHdyb3RlOgo+ID4gVGhlIGNvbm5lY3RvciBhdmFpbGFibGUgb24gdGhlIFBpY28t
SVRYIG1haW5ib2FyZCBpc24ndCBhCj4gPiBEaXNwbGF5UG9ydAo+ID4gcG9ydCAtLSBpdCdzIGEg
VVNCIFR5cGUtQyBwb3J0IGluc3RlYWQuCj4gCj4gUmlnaHQsIGl0IGlzIGEgVHlwZS1DIHJlY2Vw
dGFjbGUsIGFuZCB0aGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIHNheQo+IHNvLgo+IAo+ID4gSSB0
aGluayB5b3UgbmVlZCB0byBtb2RlbCB0aGUgVHlwZS1DIHBvcnQgYW5kIGFsdCBmdW5jdGlvbnMg
b2YgaXQuCj4gCj4gSSBhbSBub3Qgc3VyZSB0aGF0IGNhbiBiZSBkb25lIG9uIHRoaXMgYm9hcmQu
IFRoZSByZWRyaXZlci9tdXggaW4KPiBmcm9udCBvZiB0aGUgcmVjZXB0YWNsZSBhbmQgdGhlIFBE
IGNvbnRyb2xsZXIgdGhhdCBzdGVlcnMgaXQgYm90aAo+IHNpdCBvbiB0aGUgRUMncyBvd24gSTJD
IGJ1cywgYW5kIHRoZWlyIGludGVycnVwdCBnb2VzIHRvIHRoZSBFQyB0b28uCj4gVGhlIFNvQyBo
YXMgbm8gYnVzIHRvIGVpdGhlciBjaGlwOyBhbGwgaXQgZ2V0cyBmcm9tIHRoYXQgc2lkZSBpcyB0
aGUKPiBEUDEgSFBEIGxpbmUuCgpUaGUgQ2hyb21lT1MgRUMgZmlybXdhcmUgZXhwb3NlcyBzb21l
IGNvbnRyb2wgZm9yIGEgVHlwZS1DIHBvcnQsIHlvdQpjYW4gc2VhcmNoIGZvciBgZ29vZ2xlLGNy
b3MtZWMtdHlwZWNgIGFuZCBgZ29vZ2xlLGV4dGNvbi11c2JjLWNyb3MtZWNgCmNvbXBhdGlibGUg
c3RyaW5nIGluIGFyY2gvYXJtNjQvYm9vdC9kdHMgZm9yIG1vcmUgZGV0YWlscy4KCkFsdGhvdWdo
IHRoZSBLMyBQaWNvIElUWCBoYXJkd2FyZSBjb25uZWN0cyB0aGUgRUMgdG8gdGhlIFNvQyB3aXRo
IHNvbWUKbm90LXNvLWVtYmVkZGVkIGludGVyZmFjZSAoZVNQSSksIHdoaWNoIG5lZWRzIHRvIGJl
IGhhbmRsZWQgZmlyc3QuCgpUaGFua3MsCkljZW5vd3kKCj4gCj4gU28gYSB1c2ItYy1jb25uZWN0
b3Igbm9kZSB3b3VsZCBoYXZlIG5vdGhpbmcgdG8gbGluayB0byBoZXJlLgo+IAo+IEd1b2RvbmcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
