Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29685D35692
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRDs+tFWNDK66i0FCNAazuVvYtFGrAJLpH+5sgRIZ1k=; b=wzAcSyQBqNOT+1
	7P6fmOexqHwjCRiDG6IyCsYlusCVHIH94OypfiNOLGw1w5ZY9UUZe8ZmVOyOFZfBaLga4IiHTYm6s
	02+y+7pMuhQxVbYhaNH6O4bT5ffaHHi+InddgnNirlh6QOVpfGN7VLPsP6eqBj+4NZ/xriBmI5kuv
	8ACa3w2vqzwmnk0niNaMKJZ9SJJ+cjZRWmkhPeviswuBDkvzrREHcpwOKgLqPcJQN3AZlm0MOz5OU
	o7XSdUNPHZfOVCCaikqXPbT2TDOxjWgsxSvJcEDsaCCwasc6ltUsA0UIvSjE11OERc4SEC7aW+bBe
	HR5JG5v/yaja4ZiRi2nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1JS-0000000FhWx-0GhP;
	Wed, 28 Jan 2026 08:54:10 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1JP-0000000FhWX-0gXq
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 08:54:08 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8D66D33AC7;
	Wed, 28 Jan 2026 08:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769590444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YAZv04ffo29XkeHFmB2TvNcIVwje6Cc1W0+JshUHI34=;
	b=D6Emq1kKQ9rR3HCv3++5y8vDuP1wp7Lc52hnUbIne9NBRYafTmKdvUO8jHp4FW6LlgYm42
	1xk1XGrtTt3N70SmieibTjS1oWLqdf8a+THbf2LbF1E+Ssz8Jhar4cFHj3RCjKkwRz6UiH
	7syXwZQn/76EU+WvgbjrQfMrqe0GbDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769590444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YAZv04ffo29XkeHFmB2TvNcIVwje6Cc1W0+JshUHI34=;
	b=SAxqf04bZT74hu6Ze4O+VQY0ypMxopnjepcvbIJftS4aiqGHxfJJFB6RT+OPABp3ZR8gEl
	ggm44ZNHawxcvmCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769590444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YAZv04ffo29XkeHFmB2TvNcIVwje6Cc1W0+JshUHI34=;
	b=D6Emq1kKQ9rR3HCv3++5y8vDuP1wp7Lc52hnUbIne9NBRYafTmKdvUO8jHp4FW6LlgYm42
	1xk1XGrtTt3N70SmieibTjS1oWLqdf8a+THbf2LbF1E+Ssz8Jhar4cFHj3RCjKkwRz6UiH
	7syXwZQn/76EU+WvgbjrQfMrqe0GbDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769590444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YAZv04ffo29XkeHFmB2TvNcIVwje6Cc1W0+JshUHI34=;
	b=SAxqf04bZT74hu6Ze4O+VQY0ypMxopnjepcvbIJftS4aiqGHxfJJFB6RT+OPABp3ZR8gEl
	ggm44ZNHawxcvmCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC44C3EA61;
	Wed, 28 Jan 2026 08:54:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K4qSLKvOeWn4NgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 28 Jan 2026 08:54:03 +0000
Message-ID: <064dd2b7-415b-4794-8867-73bdd7ac17df@suse.de>
Date: Wed, 28 Jan 2026 09:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
To: Icenowy Zheng <uwu@icenowy.me>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <rabenda.cn@gmail.com>,
 Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-4-zhengxingda@iscas.ac.cn>
 <6ea016d6-42a4-4d83-89fd-eee918a834ef@suse.de>
 <7301d5f80c7f247d4a2f82c242b3d8b8ad69f5e1.camel@icenowy.me>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <7301d5f80c7f247d4a2f82c242b3d8b8ad69f5e1.camel@icenowy.me>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqj7cgak6aet4eyc7so6kz1wx)];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,samsung.com,bootlin.com,gmail.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,iscas.ac.cn];
	FREEMAIL_TO(0.00)[icenowy.me,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:email,suse.com:url,imap1.dmz-prg2.suse.org:helo,0.0.0.0:email,iscas.ac.cn:email,samsung.com:email];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:url]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_005407_574659_67CCBE7C 
X-CRM114-Status: GOOD (  25.24  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkKCkFtIDI4LjAxLjI2IHVtIDA5OjM5IHNjaHJpZWIgSWNlbm93eSBaaGVuZzoKPiDlnKggMjAy
Ni0wMS0yOOaYn+acn+S4ieeahCAwODo1OCArMDEwMO+8jFRob21hcyBaaW1tZXJtYW5u5YaZ6YGT
77yaCj4+IEhpCj4+Cj4+IEFtIDIzLjAxLjI2IHVtIDEwOjI4IHNjaHJpZWIgSWNlbm93eSBaaGVu
ZzoKPj4+IEZyb206IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+Pj4KPj4+IFRoaXMg
aXMgYSBmcm9tLXNjcmF0Y2ggZHJpdmVyIHRhcmdldGluZyBWZXJpc2lsaWNvbiBEQy1zZXJpZXMK
Pj4+IGRpc3BsYXkKPj4+IGNvbnRyb2xsZXJzLCB3aGljaCBmZWF0dXJlIHNlbGYtaWRlbnRpZmlj
YXRpb24gZnVuY3Rpb25hbGl0eSBsaWtlCj4+PiB0aGVpcgo+Pj4gR0Mtc2VyaWVzIEdQVXMuCj4+
Pgo+Pj4gT25seSBEQzgyMDAgaXMgYmVpbmcgc3VwcG9ydGVkIG5vdywgYW5kIG9ubHkgdGhlIG1h
aW4gZnJhbWVidWZmZXIKPj4+IGlzIHNldAo+Pj4gdXAgKGFzIHRoZSBEUk0gcHJpbWFyeSBwbGFu
ZSkuIFN1cHBvcnQgZm9yIG1vcmUgREMgbW9kZWxzIGFuZCBtb3JlCj4+PiBmZWF0dXJlcyBpcyBt
eSBmdXJ0aGVyIHRhcmdldHMuCj4+Pgo+Pj4gQXMgdGhlIGRpc3BsYXkgY29udHJvbGxlciBpcyBk
ZWxpdmVyZWQgdG8gU29DIHZlbmRvcnMgYXMgYSB3aG9sZQo+Pj4gcGFydCwKPj4+IHRoaXMgZHJp
dmVyIGRvZXMgbm90IHVzZSBjb21wb25lbnQgZnJhbWV3b3JrIGFuZCBleHRyYSBicmlkZ2VzCj4+
PiBpbnNpZGUgYQo+Pj4gU29DIGlzIGV4cGVjdGVkIHRvIGJlIGltcGxlbWVudGVkIGFzIGRlZGlj
YXRlZCBicmlkZ2VzICh0aGlzIGRyaXZlcgo+Pj4gcHJvcGVybHkgc3VwcG9ydHMgYnJpZGdlIGNo
YWluaW5nKS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93
eS5tZT4KPj4+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHpoZW5neGluZ2RhQGlzY2Fz
LmFjLmNuPgo+Pj4gVGVzdGVkLWJ5OiBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4+PiBU
ZXN0ZWQtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4+
IFJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPj4K
Pj4gSSBvbmx5IGJyaWVmbHkgbG9va2VkIG92ZXIgdGhpcyByZXZpc2lvbiwgYXMgdjUgYWxyZWFk
eSBzZWVtZWQgcXVpdGUKPj4gZ29vZC4gSWYgeW91IHdhbnQgdG8gZG8gYSBmb2xsb3ctdXAgcGF0
Y2gsIHNlZSBteSBvdGhlciByZXBseSB0byB2NQo+PiBvbgo+PiBzdG9yaW5nIGhhcmR3YXJlIGZv
cm1hdHMgaW4gdGhlIHBsYW5lIHN0YXRlLgo+IFdlbGwgdGhlIGtlcm5lbCB0ZXN0IHJvYm90IGZv
dW5kIGEgc21hbGwgS2NvbmZpZyBwcm9ibGVtIGluIHRoaXMKPiByZXZpc2lvbiAtLSBEUk1fRElT
UExBWV9IRUxQRVIgc2hvdWxkIGJlIHNlbGVjdGVkLgo+Cj4gTWF5YmUgSSdtIGdvaW5nIHRvIHNl
bmQgYSB2NyB0byBhZGRyZXNzIHRoaXMuCj4KPiBTaG91bGQgSSBhbHNvIG1ha2UgZGVyaXZlZCBw
bGFuZSBzdGF0ZSBhIGNoYW5nZSBpbiB2Nywgb3IgbGVhdmUgaXQgYXMgYQo+IGZvbGxvdy11cD8K
ClRoYXQgd291bGQgcmVxdWlyZSBhbm90aGVyIHJvdW5kIG9mIHJldmlldywgSSBndWVzcy4gQmV0
dGVyIGxlYXZlIGl0IGZvciAKYSBzZXBhcmF0ZSBzZXJpZXMuCgo+Cj4gQnkgdGhlIHdheSwgSSB0
aGluayBQQVRDSCAxLTUgc2hvdWxkIGdvIHRocm91Z2ggZHJtLW1pc2MgdHJlZSwgYW0gSQo+IHJp
Z2h0PyBXaG8ncyBnb2luZyB0byBwaWNrIGl0IGlmIGdvaW5nIHRocm91Z2ggZHJtLW1pc2M/CgpJ
IGNhbiBkbyB0aGF0LiBJbiB2NywgeW91IGNhbiBtZXJnZSBwYXRjaCA4IChNQUlOVEFJTkVSUykg
aW50byBwYXRjaCAzLCAKc28gdGhhdCBpdCBnb2VzIGluIGFzIHdlbGwuCgpQYXRjaGVzIDYgYW5k
IDcgYXJlIHNtYWxsLCBzbyBJIGNhbiBhbHNvIHRha2UgdGhlbSBpbnRvIGRybS1taXNjIGlmIHRo
ZXkgCnJpc2N2IG1haW50YWluZXJzIGFyZSBPSyB3aXRoIHRoYXQuCgpCZXN0IHJlZ2FyZHMKVGhv
bWFzCgo+Cj4+IEJlc3QgcmVnYXJkcwo+PiBUaG9tYXMKPj4KPj4+IC0tLQo+Pj4gQ2hhbmdlcyBp
biB2NjoKPj4+IC0gU29ydGVkIEtjb25maWcgZGVwZW5kZW5jeS4KPj4+IC0gR2V0IHJpZCBvZiBv
YnNvbGV0ZSB1cHBlcmNhc2UgRFJNXyogcHJpbnRrIG1hcmNvcy4KPj4+IC0gT3B0aW1pemF0aW9u
IHRvIHByaW50ayBtZXNzYWdlcyAodW5rbm93biBJUlEgbWVzc2FnZSBpcyBvbmx5Cj4+PiBwcmlu
dGVkCj4+PiAgwqDCoCBvbmNlLCBkZXZpY2UgcmVjb2duaXRpb24gbWVzc2FnZSBoYXMgIkZvdW5k
IiBhZGRlZCwgIlNraXBwaW5nCj4+PiBvdXRwdXQiCj4+PiAgwqDCoCBtZXNzYWdlIHByaW9yaXR5
IGxvd2VyZWQgdG8gZGVidWcpLgo+Pj4gLSBTcGxpdHRlZCBtb3N0IGJyaWRnZSBmdW5jdGlvbnMg
Zm9yIERQSS9EUCBvdXRwdXQuCj4+PiAtIEdldCByaWQgb2YgY3VzdG9tIENSVEMgYXRvbWljX2Zs
dXNoLCB3aGljaCBkb2Vzbid0IGRvIGFueXRoaW5nCj4+PiAgwqDCoCBkZXZpY2Utc3BlY2lmaWMu
Cj4+PiAtIEFkYXB0ZWQgbWFjcm8gSFpfUEVSX0tIWiBhbmQgVlNEQ19ESVNQX1RJTUlOR19WQUxV
RV9NQVguCj4+PiAtIFN3aXRjaGVkIHRvIHVzZSBkcm1fbW9kZV9zaXplX2R1bWIoKSB0byBhbGln
biBkdW1iIGJ1ZmZlciBwaXRjaC4KPj4+IC0gUmVvcmRlcmVkIHNvbWUgZnVuY3Rpb24gY2FsbHMg
aW4gdnNfZHJtX2luaXRpYWxpemUoKSAoCj4+PiAgwqDCoCBhcGVydHVyZV9yZW1vdmVfYWxsX2Nv
bmZsaWN0aW5nX2RldmljZXMoKSBpcyBub3cgY2FsbGVkIGVhcmxpZXIKPj4+IGFuZAo+Pj4gIMKg
wqAgZHJtX21vZGVfY29uZmlnX3Jlc2V0KCkgaXMgbm93IGNhbGxlZCBsYXRlcikuCj4+PiAtIFNw
bGl0dGVkIG91dCB2c19mYl9nZXRfZG1hX2FkZHIoKSBhbmQgc3dpdGNoZWQgdG8gdXNlCj4+PiAg
wqDCoCBkcm1fZm9ybWF0X2luZm9fbWluX3BpdGNoKCkgdG8gY2FsY3VsYXRlIHRoZSBzcmMgWCBv
ZmZzZXQgdG8gdGhlCj4+PiAgwqDCoCBmcmFtZWJ1ZmZlciBhZGRyZXNzLgo+Pj4gLSBTcGxpdHRl
ZCBvdXQgYXRvbWljX3tlbixkaXN9YWJsZSBmb3IgcHJpbWFyeSBwbGFuZS4KPj4+IC0gUmVtb3Zl
ZCBhbiB1bnVzZWQgcG1fcnVudGltZS5oIGluY2x1c2lvbiBiZWNhdXNlIHRoZSBkcml2ZXIgbm93
Cj4+PiBkb2VzCj4+PiAgwqDCoCBub3QgZG8gcnVucG0uCj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2NToK
Pj4+IC0gU3dpdGNoaW5nIHRvIGRybV9hdG9taWNfZ2V0X25ld19icmlkZ2Vfc3RhdGUsIHdoaWNo
IHNlZW1zIHRvIGxldAo+Pj4gdGhlCj4+PiAgwqDCoCBkcml2ZXIgZ2V0IHJpZCBvZiB0aGUgaGFj
ayBvZiBzYXZpbmcgYnVzIGZvcm1hdCBpdHNlbGYuCj4+PiAtIEFkZCB0aGUgaW50ZXJuYWwgYnJp
ZGdlIGJlZm9yZSBhdHRhY2hpbmcgaXQuCj4+PiAtIEFkYXB0ZWQgbmV4dF9icmlkZ2Ugc3RydWN0
IGZpZWxkIG5hbWUgc3VnZ2VzdGVkIGJ5IEx1Y2EgQ2VyZXNvbGkuCj4+PiAtIFJlZmFjdG9yZWQg
dGhlIHByb2JlIGNvZGUgdG8gbm90IHVzZSBwb3J0IGNvdW50LCB0byBhbGxvdyBwb3J0QDAKPj4+
IGJlaW5nCj4+PiAgwqDCoCBtaXNzaW5nLgo+Pj4KPj4+IENoYW5nZXMgaW4gdjQ6Cj4+PiAtIFN3
aXRjaCB0byBkcm1fKiBsb2dnZXIgd2hlbiB3ZSdyZSBoYW5kbGluZyB3aXRoIHN0cnVjdAo+Pj4g
ZHJtX2RldmljZS4KPj4+Cj4+PiBDaGFuZ2VzIGluIHYzOgo+Pj4gLSBHZXQgcmlkIG9mIGRybV9h
dG9taWNfZ2V0X2V4aXN0aW5nX2NydGNfc3RhdGUoKSB3aGljaCBpcyBtYXJrZWQKPj4+ICDCoMKg
IGRlcHJlY2F0ZWQuCj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+IC0gQ2hhbmdlZCBzb21lIENv
bnRyb2wgZmxvd3MgYWNjb3JkaW5nIHRvIHByZXZpb3VzIHJldmlld3MuCj4+PiAtIEFkZGVkIG1p
c3Npbmcgb2Zfbm9kZV9wdXQgd2hlbiBjaGVja2luZyBvZiBlbmRwb2ludHMgZm9yIG91dHB1dAo+
Pj4gdHlwZS4KPj4+IC0gU3dpdGNoZWQgYWxsIHVzZXJzcGFjZS12aXNpYmxlIG1vZGVzZXQgb2Jq
ZWN0cyB0byBiZSBtYW5hZ2VkIGJ5Cj4+PiBkcm1tCj4+PiAgwqDCoCBpbnN0ZWFkIG9mIGRldm0u
Cj4+PiAtIFV0aWxpemUgZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgaW4gaW50ZXJuYWwgYnJpZGdl
Lgo+Pj4gLSBQcmV2ZW50ZWQgdGhlIHVzYWdlIG9mIHNpbXBsZSBlbmNvZGVyIGhlbHBlcnMgYnkg
cGFzc2luZyBhIE5VTEwKPj4+IGZ1bmNzIHBvaW50ZXIuCj4+PiAtIExldCBkZXZtIGVuYWJsZSBj
bG9ja3Mgd2hlbiBnZXR0aW5nIHRoZW0uCj4+PiAtIFJlbW92ZWQgZXhwbGljaXQgYC5jYWNoZV90
eXBlID0gUkVHQ0FDSEVfTk9ORWAgaW4gcmVnbWFwIGNvbmZpZy4KPj4+IC0gRml4ZWQgYSBkZWJ1
ZyBwcmludCB1c2luZyBhIHZhcmlhYmxlIGJlZm9yZSBpbml0aWFsaXphdGlvbi4KPj4+IC0gRml4
ZWQgYSB3cm9uZyBpbmRleCB3aGVuIHVzaW5nIGJ1bGsgdG8gaGFuZGxlIHJlc2V0cy4KPj4+IC0g
QWRkZWQgbWlzc2luZyBjb25maWd1cmF0aW9uIGZvciBEUEkgZm9ybWF0IChjdXJyZW50bHkgZml4
ZWQKPj4+IFJHQjg4OCkuCj4+Pgo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArCj4+PiAgwqAg
ZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgIDEgKwo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9L
Y29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDE1ICsKPj4+ICDCoCBkcml2ZXJzL2dwdS9k
cm0vdmVyaXNpbGljb24vTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNSArCj4+PiAg
wqAgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2JyaWRnZS5jwqDCoMKgwqDCoMKgIHwg
MzcxCj4+PiArKysrKysrKysrKysrKysrKysKPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNp
bGljb24vdnNfYnJpZGdlLmjCoMKgwqDCoMKgwqAgfMKgIDM5ICsrCj4+PiAgwqAgZHJpdmVycy9n
cHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2JyaWRnZV9yZWdzLmjCoCB8wqAgNTQgKysrCj4+PiAgwqAg
ZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2NydGMuY8KgwqDCoMKgwqDCoMKgwqAgfCAx
OTEgKysrKysrKysrCj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2NydGMu
aMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMxICsrCj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL3Zlcmlz
aWxpY29uL3ZzX2NydGNfcmVncy5owqDCoMKgIHzCoCA2MCArKysKPj4+ICDCoCBkcml2ZXJzL2dw
dS9kcm0vdmVyaXNpbGljb24vdnNfZGMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjA3ICsrKysr
KysrKysKPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZGMuaMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAzOCArKwo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNv
bi92c19kY190b3BfcmVncy5owqAgfMKgIDI3ICsrCj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL3Zl
cmlzaWxpY29uL3ZzX2RybS5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTgyICsrKysrKysrKwo+Pj4g
IMKgIGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19kcm0uaMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMjggKysKPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfaHdkYi5j
wqDCoMKgwqDCoMKgwqDCoCB8IDE1MCArKysrKysrCj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL3Zl
cmlzaWxpY29uL3ZzX2h3ZGIuaMKgwqDCoMKgwqDCoMKgwqAgfMKgIDI5ICsrCj4+PiAgwqAgZHJp
dmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX3BsYW5lLmPCoMKgwqDCoMKgwqDCoCB8IDEyNCAr
KysrKysKPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfcGxhbmUuaMKgwqDC
oMKgwqDCoMKgIHzCoCA3MiArKysrCj4+PiAgwqAgLi4uL2dwdS9kcm0vdmVyaXNpbGljb24vdnNf
cHJpbWFyeV9wbGFuZS5jwqDCoMKgIHwgMTczICsrKysrKysrCj4+PiAgwqAgLi4uL2RybS92ZXJp
c2lsaWNvbi92c19wcmltYXJ5X3BsYW5lX3JlZ3MuaMKgwqAgfMKgIDUzICsrKwo+Pj4gIMKgIDIx
IGZpbGVzIGNoYW5nZWQsIDE4NTIgaW5zZXJ0aW9ucygrKQo+Pj4gIMKgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vS2NvbmZpZwo+Pj4gIMKgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vTWFrZWZpbGUKPj4+ICDCoCBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2JyaWRnZS5j
Cj4+PiAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92
c19icmlkZ2UuaAo+Pj4gIMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVy
aXNpbGljb24vdnNfYnJpZGdlX3JlZ3MuaAo+Pj4gIMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfY3J0Yy5jCj4+PiAgwqAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19jcnRjLmgKPj4+ICDCoCBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2NydGNfcmVncy5oCj4+
PiAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19k
Yy5jCj4+PiAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNv
bi92c19kYy5oCj4+PiAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJp
c2lsaWNvbi92c19kY190b3BfcmVncy5oCj4+PiAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19kcm0uYwo+Pj4gIMKgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZHJtLmgKPj4+ICDCoCBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2h3ZGIuYwo+Pj4gIMKgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfaHdkYi5oCj4+
PiAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19w
bGFuZS5jCj4+PiAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2ls
aWNvbi92c19wbGFuZS5oCj4+PiAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS92ZXJpc2lsaWNvbi92c19wcmltYXJ5X3BsYW5lLmMKPj4+ICDCoCBjcmVhdGUgbW9kZSAxMDA2
NDQKPj4+IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19wcmltYXJ5X3BsYW5lX3JlZ3Mu
aAoKLS0gCi0tClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICkZyYW5rZW5zdHIuIDE0NiwgOTA0NjEg
TsO8cm5iZXJnLCBHZXJtYW55LCB3d3cuc3VzZS5jb20KR0Y6IEpvY2hlbiBKYXNlciwgQW5kcmV3
IE1jRG9uYWxkLCBXZXJuZXIgS25vYmxpY2gsIChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
