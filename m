Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B0BC44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 10:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOA3pGu5hQJu7Md3rh2en1Wid5xNqekIGegsdLGv9T8=; b=MsE7M8JBnWfkGF
	A92jmYLlVg/60m+c++C0ALz3sAH0qDgydm2JXi6Fsx2a31DyXfTWF9CWjZ5MN2i5riEewLqX2L7co
	pAEX3o4Jf2L8ySkZM9lQoNsVEx0iOnWox4uUwrZhyO/et+9mg6DHCCv7Sz9jbu6KtxNlIKrWKdGrz
	Wk5nF5MoU2k3aE1w+GSodxGc6R+//ZSmKZOWqGqMBoD615+HVhy+rTWS4WgTkyF5Cug+FzYqJP1ea
	GW0UU/U4bMQt8zdOoeVepHltSIcrqhR4/7ChHSKUunOdlvvo7i1uulOT/PSqmFB513t5Os5S0fJsD
	nBK3FWm6bJoyeHMw0Jeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6R-00000006rHy-1R7X;
	Thu, 22 Jan 2026 10:39:51 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6O-00000006rH4-25M0
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 10:39:50 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A4A7B33694;
	Thu, 22 Jan 2026 10:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769078386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TkCSPT+9XJZzQ81lfCewAIgnjVdGJHtK1VhI9nX0RPs=;
	b=qXPGql49k6jMUPBkmWt5dBw5dDiPaLXcnwEIQ/BCHmcSCazbcXSPaEA4bT41n2+h46Zom4
	cjTrEmwEzYJbvEBe8zJdPn/WS//+bDE+wU7EaCMTC6pnAnWIWxDaEIk0kDnm4lPExresHK
	avLG2l3FWbN0kH+4uelsFEkRVt+BonY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769078386;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TkCSPT+9XJZzQ81lfCewAIgnjVdGJHtK1VhI9nX0RPs=;
	b=GSfNplAbulgvVQ+YDy9cE22oUUQFtouosS2aiKncIIb8NSdqDMpzwaU+b5rxdy0Ok0tP4Y
	WAVzNx7jh+jx7nDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769078386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TkCSPT+9XJZzQ81lfCewAIgnjVdGJHtK1VhI9nX0RPs=;
	b=qXPGql49k6jMUPBkmWt5dBw5dDiPaLXcnwEIQ/BCHmcSCazbcXSPaEA4bT41n2+h46Zom4
	cjTrEmwEzYJbvEBe8zJdPn/WS//+bDE+wU7EaCMTC6pnAnWIWxDaEIk0kDnm4lPExresHK
	avLG2l3FWbN0kH+4uelsFEkRVt+BonY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769078386;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TkCSPT+9XJZzQ81lfCewAIgnjVdGJHtK1VhI9nX0RPs=;
	b=GSfNplAbulgvVQ+YDy9cE22oUUQFtouosS2aiKncIIb8NSdqDMpzwaU+b5rxdy0Ok0tP4Y
	WAVzNx7jh+jx7nDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1B8E1395E;
	Thu, 22 Jan 2026 10:39:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /SzZMXH+cWmxHgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 22 Jan 2026 10:39:45 +0000
Message-ID: <5fc5439b-ef21-416a-90fe-07f0d21de87d@suse.de>
Date: Thu, 22 Jan 2026 11:39:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] drm: verisilicon: add a driver for Verisilicon
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
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
 <20260116043746.336328-4-zhengxingda@iscas.ac.cn>
 <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
 <0eb4b6ba8ef3b47cd28eb8d652b05eb5a6d1409c.camel@icenowy.me>
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
In-Reply-To: <0eb4b6ba8ef3b47cd28eb8d652b05eb5a6d1409c.camel@icenowy.me>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqj7cgak6aet4eyc7so6kz1wx)];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,samsung.com,bootlin.com,gmail.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,iscas.ac.cn];
	FREEMAIL_TO(0.00)[icenowy.me,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,suse.com:url]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_023948_832207_DB13AC22 
X-CRM114-Status: GOOD (  26.41  )
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

SGkKCkFtIDIyLjAxLjI2IHVtIDEwOjIzIHNjaHJpZWIgSWNlbm93eSBaaGVuZzoKPiDlnKggMjAy
Ni0wMS0yMeaYn+acn+S4ieeahCAxMzo1NiArMDEwMO+8jFRob21hcyBaaW1tZXJtYW5u5YaZ6YGT
77yaCj4KPiA9PT09PT09PT09PT09PT0gODwgPT09PT09PT09PT09PT09PT09PQo+Pj4gKwo+Pj4g
K8KgwqDCoMKgwqDCoMKgZGV2X2luZm8oZGV2LCAiREMleCByZXYgJXggY3VzdG9tZXIgJXhcbiIs
IGRjLQo+Pj4+IGlkZW50aXR5Lm1vZGVsLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBkYy0+aWRlbnRpdHkucmV2aXNpb24sIGRjLT5pZGVudGl0eS5jdXN0b21lcl9pZCk7Cj4+
IGRybV9kYmcoKS7CoCBEcml2ZXJzIHNob3VsZCBiZSBxdWl0ZSBieSBkZWZhdWx0Lgo+IFdlbGwg
Zm9yIHRoaXMga2luZCBvZiBpZGVudGlmaWNhdGlvbiBpbmZvcm1hdGlvbiBJIHRoaW5rIGRyaXZl
ciBpcwo+IHVzdWFsbHkgbm90IHF1aWV0LCBhdCBsZWFzdCBhbWRncHUgKHdoZW4gZG9pbmcgSVAg
ZGlzY292ZXJ5KSwgcGFuZnJvc3QKPiBhbmQgZXRuYXZpdiAod2hpY2ggc2hhcmVzIHRoZSBzYW1l
IHNldCBvZiBpZGVudGlmaWNhdGlvbiByZWdpc3RlcnMgd2l0aAo+IHRoaXMgZHJpdmVyKSBpcyBy
ZXBvcnRpbmcgaXQuCgpUaGVzZSBkcml2ZXJzIG9ubHkgZ2V0IGF3YXkgd2l0aCBpdCBiZWNhdXNl
IG1hbnkgb3RoZXIgZHJpdmVycyBrZWVwIApxdWl0ZS4gT3RoZXJ3aXNlIHRoZSBrZXJuZWwgbG9n
IHdvdWxkIGJlIGZpbGxlZCB3aXRoIGluaXQgcmVwb3J0cy4gWW91ciAKY2hvaWNlLCBidXQgaXQn
cyBxdWVzdGlvbmFibGUgaWYgYW55b25lIGV2ZXIgY2FyZXMgZXhjZXB0IGZvciBkZWJ1Z2dpbmcu
CgoKPgo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgaWYgKHBvcnRfY291bnQgPiBkYy0+aWRlbnRp
dHkuZGlzcGxheV9jb3VudCkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRl
dl9lcnIoZGV2LCAidG9vIG1hbnkgZG93bnN0cmVhbSBwb3J0cyB0aGFuIEhXCj4+PiBjYXBhYmls
aXR5XG4iKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSAtRUlOVkFM
Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX3JzdF9hc3NlcnQ7
Cj4+PiArwqDCoMKgwqDCoMKgwqB9Cj4+PiArCj4gPT09PT09PT09PT09PT09IDg8ID09PT09PT09
PT09PT09PT09PT0KPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoGlmICghc3RhdGUtPnZpc2libGUg
fHwgIWZiKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnbWFwX3dyaXRl
KGRjLT5yZWdzLCBWU0RDX0ZCX0NPTkZJRyhvdXRwdXQpLCAwKTsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZWdtYXBfd3JpdGUoZGMtPnJlZ3MsIFZTRENfRkJfQ09ORklHX0VY
KG91dHB1dCksCj4+PiAwKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3Rv
IGNvbW1pdDsKPj4+ICvCoMKgwqDCoMKgwqDCoH0gZWxzZSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmVnbWFwX3NldF9iaXRzKGRjLT5yZWdzLAo+Pj4gVlNEQ19GQl9DT05G
SUdfRVgob3V0cHV0KSwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFZTRENfRkJfQ09ORklHX0VYX0ZCX0VOKTsKPj4+ICvC
oMKgwqDCoMKgwqDCoH0KPj4gU2luY2UgeW91IGhhbmRsZSB0aGUgcGxhbmUgb24vcGxhbmUgb2Zm
IGNhc2VzIGhlcmUsIEknZCBhZHZpc2UgdG8KPj4gaW1wbGVtZW50IGF0b21pY19lbmFibGUgYW5k
IGF0b21pY19kaXNhYmxlIGZvciB0aGUgcGxhbmUsIGlmIHRoZQo+PiBoYXJkd2FyZSBhbGxvd3Mg
aXQuIChUaGVyZSBpcyBoYXJkd2FyZSB3ZXJlIHRoZSBjdXJyZW50IHBhdHRlcm4gbWFrZXMKPj4g
c2Vuc2UgdGhvdWdoLikKPiBJZiBhdG9taWNfKmFibGUgaXMgZ29pbmcgdG8gYmUgaW1wbGVtZW50
ZWQsIHNob3VsZCBhdG9taWNfdXBkYXRlKCkga2VlcAo+IHRoZSBwbGFuZSBvbi9vZmYgY29kZT8K
CkluIHRoaXMgY2FzZSwgYXRvbWljX3VwZGF0ZSBzaG91bGQgb25seSBwZXJmb3JtIGFuIHVwZGF0
ZSBvZiB0aGUgcGxhbmUncyAKZ3JhcGhpY3MgYnVmZmVyIChzY2Fub3V0IGFkZHJlc3MsIGNvbG9y
IGZvcm1hdCkuIFRoZSBsb2dpYyB0aGVuIGlzCgplbmFibGUgYW5kIG1vZGUgc2V0dGluZzoKCiDC
oGF0b21pY191cGRhdGUsIHBsdXMKIMKgYXRvbWljX2VuYWJsZQoKZGlzYWJsZToKCiDCoGF0b21p
Y19kaXNhYmxlIG9ubHkKCnBhZ2UgZmxpcHM6CgogwqBhdG9taWNfdXBkYXRlIG9ubHkKClNlZSAK
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTguNi9zb3VyY2UvZHJpdmVycy9n
cHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMjTDMwMjIKClRoYXQncyB1c3VhbGx5IGNsZWFuZXIu
IEJ1dCB0aGVyZSdzIGhhcmR3YXJlIHdoZXJlIHVwZGF0ZS9lbmFibGUvZGlzYWJsZSAKaXMgY29u
bmVjdGVkIGluIHN1Y2ggYSB3YXkgdGhhdCBhIHNpbmdsZSBhdG9taWNfdXBkYXRlIGlzIGJldHRl
ci4KCgo+Cj4gQlRXIGl0IHNlZW1zIHRoYXQgREM4MjAwIGhhcyB0aGUgc2hhZG93IHJlZ2lzdGVy
IGNhcGFiaWxpdHkgdGhhdCBjb3VsZAo+IGJlIG1hbnVhbGx5IGNvbW1pdGVkIGJ1dCB0aGUgb2xk
ZXIgREM4MDAwIGhhcyBubyAodGhlCj4gVlNEQ19GQl9DT05GSUdfRVhfQ09NTUlUIGJpdCB3cml0
dGVuIGJlbG93IGlzIGEgbmV3IHRoaW5nKSAtLSB0aGUKPiBWU0RDX0ZCX0NPTkZJRyByZWdpc3Rl
ciBvbiBEQzgwMDAgaGFzIGEgd3JpdGUtb25seSBiaXQgdGhhdCB3aGVuCj4gd3JpdHRlbiB3aXRo
IDAgdGhlIGRpc3BsYXkgaXMgcHV0IHRvIHJlc2V0IGFuZCB3aGVuIHdyaXR0ZW4gd2l0aCAxIHRo
ZQo+IGRpc3BsYXkgd2lsbCBzdGFydCB0byBydW4uIFRoaXMgcGF0dGVybiBzZWVtcyB0byBiZSBu
b3QgYWJsZSB0byBrZWVwCj4gdGhlIGVuYWJsZWQgc3RhdGUgd2hpbGUgcHJvZ3JhbW1pbmcgKGF0
IGxlYXN0IHBhcnQgb2YpIG5ldyBwbGFuZQo+IGNvbmZpZ3VyYXRpb24sIHNlZSBbMV0uCgpJIGNh
bm5vdCBjb21tZW50IG9uIHRoZSBoYXJkd2FyZS4gQnV0IG9uIHRoZSBEUk0gc2lkZSwgd2UgYWx3
YXlzIGRpc2FibGUgCnRoZSBwaXBlbGluZSBmb3Igd2UgcHJvZ3JhbSBhIG5ldyBkaXNwbGF5IG1v
ZGU7IGFuZCB0aGVuIGRvIGFuIGVuYWJsZSAKc3RlcCB0byBwcm9ncmFtIHRoZSBuZXcgbW9kZS4g
VGhpcyBoYXBwZW5zIG9uIHRoZSBDUlRDLCBidXQgaXQgYWxzbyAKYWZmZWN0cyB0aGUgQ1JUQydz
IHBsYW5lcyBhY2NvcmRpbmdseS4gRm9yIHBhZ2VmbGlwcywgd2Ugb25seSBydW4gdGhlIApwbGFu
ZSdzIGF0b21pY191cGRhdGUuCgpJZiB5b3UgeW91IHNlZSBhIHBhZ2UgZmxpcCwgYnV0IG5lZWQg
YSBmdWxsIG1vZGUtc2V0dGluZyBvcGVyYXRpb24sIHlvdSAKY2FuIG1hbnVhbGx5IHRyaWdnZXIg
aXQgYnkgc2V0dGluZyBkcm1fY3J0Y19zdGF0ZS5tb2RlX2NoYW5nZWQgZnJvbSB0aGUgCnBsYW5l
J3MgYXRvbWljX2NoZWNrLiBIZXJlJ3MgYW4gZXhhbXBsZTogCmh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y2LjE4LjYvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfbW9kZS5jI0w1MDMKCklmIHRoZSBEQzgwMDAgYW5kIERDODIwMCBiZWhhdmUgc3VmZmljaWVu
dGx5IGRpZmZlcmVudGx5LCBteSBhZHZpc2UgaXMgCnRvIHdyaXRlIG11bHRpcGxlIF9mdW5jcyBz
dHJ1Y3RzIHdpdGggY3VzdG9tIGhlbHBlcnMgYW5kIHBpY2sgdGhlIApjb3JyZWN0IG9uZSB3aGVu
IHlvdSBpbml0aWFsaXplIHRoZSBtb2Rlc2V0dGluZyBwaXBlbGluZS4KCkJlc3QgcmVnYXJkcwpU
aG9tYXMKCj4KPiBbMV0KPiBodHRwczovL2dpdGh1Yi5jb20vbWlsa3YtbWVncmV6L3JvY2tvcy11
LWJvb3QvYmxvYi9jOTIyMWNmMmZhNzdkMzljMGIyNDFhYjRiMDMwYzcwOGU3ZWJlMjc5L2RyaXZl
cnMvdmlkZW8vZXN3aW4vZXN3aW5fZGNfcmVnLmgjTDM1NzkKPgo+Pj4gKwo+Pj4gK8KgwqDCoMKg
wqDCoMKgZHJtX2Zvcm1hdF90b192c19mb3JtYXQoc3RhdGUtPmZiLT5mb3JtYXQtPmZvcm1hdCwg
JmZtdCk7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqByZWdtYXBfdXBkYXRlX2JpdHMoZGMtPnJl
Z3MsIFZTRENfRkJfQ09ORklHKG91dHB1dCksCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVlNEQ19GQl9DT05GSUdfRk1UX01BU0ssCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVlNEQ19G
Ql9DT05GSUdfRk1UKGZtdC5jb2xvcikpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgcmVnbWFwX3VwZGF0
ZV9iaXRzKGRjLT5yZWdzLCBWU0RDX0ZCX0NPTkZJRyhvdXRwdXQpLAo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFZTRENfRkJfQ09ORklHX1NX
SVpaTEVfTUFTSywKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBWU0RDX0ZCX0NPTkZJR19TV0laWkxFKGZtdC5zd2l6emxlKSk7Cj4+PiArwqDC
oMKgwqDCoMKgwqByZWdtYXBfYXNzaWduX2JpdHMoZGMtPnJlZ3MsIFZTRENfRkJfQ09ORklHKG91
dHB1dCksCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgVlNEQ19GQl9DT05GSUdfVVZfU1dJWlpMRV9FTiwKPj4+IGZtdC51dl9zd2l6emxlKTsK
Pj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoC8qIEdldCB0aGUgcGh5c2ljYWwgYWRkcmVzcyBvZiB0
aGUgYnVmZmVyIGluIG1lbW9yeSAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgZ2VtID0gZHJtX2ZiX2Rt
YV9nZXRfZ2VtX29iaihmYiwgMCk7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAvKiBDb21wdXRl
IHRoZSBzdGFydCBvZiB0aGUgZGlzcGxheWVkIG1lbW9yeSAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKg
YnBwID0gZmItPmZvcm1hdC0+Y3BwWzBdOwo+Pj4gK8KgwqDCoMKgwqDCoMKgZG1hX2FkZHIgPSBn
ZW0tPmRtYV9hZGRyICsgZmItPm9mZnNldHNbMF07Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAv
KiBGaXh1cCBmcmFtZWJ1ZmZlciBhZGRyZXNzIGZvciBzcmMgY29vcmRpbmF0ZXMgKi8KPj4+ICvC
oMKgwqDCoMKgwqDCoGRtYV9hZGRyICs9IChzdGF0ZS0+c3JjLngxID4+IDE2KSAqIGJwcDsKPj4g
YnBwIGlzIGRlcHJlY2F0ZWQgYW5kIHNob3VsZCBiZSBhdm9pZGVkIGluIG5ldyBjb2RlLiBZb3Ug
Y2FuIGNvbXB1dGUKPj4gdGhlCj4+IG9mZnNldCB3aXRoIGRybV9mb3JtYXRfbWluX3BpdGNoKCk6
Cj4+Cj4+IGRybV9mb3JtYXRfbWluX3BpdGNoKGZiLT5mb3JtYXQsIDAsIHN0YXRlLT5zcmMueDEg
Pj4gMTYgKQo+Pgo+PiBCZXN0IHJlZ2FyZHMKPj4gVGhvbWFzCj4+Cj4+PiArwqDCoMKgwqDCoMKg
wqBkbWFfYWRkciArPSAoc3RhdGUtPnNyYy55MSA+PiAxNikgKiBmYi0+cGl0Y2hlc1swXTsKPj4+
ICsKPj4+ICvCoMKgwqDCoMKgwqDCoHJlZ21hcF93cml0ZShkYy0+cmVncywgVlNEQ19GQl9BRERS
RVNTKG91dHB1dCksCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bG93ZXJfMzJfYml0cyhkbWFfYWRkcikpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgcmVnbWFwX3dyaXRl
KGRjLT5yZWdzLCBWU0RDX0ZCX1NUUklERShvdXRwdXQpLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZiLT5waXRjaGVzWzBdKTsKPj4+ICsKPj4+ICvCoMKgwqDC
oMKgwqDCoHJlZ21hcF93cml0ZShkYy0+cmVncywgVlNEQ19GQl9UT1BfTEVGVChvdXRwdXQpLAo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFZTRENfTUFLRV9QTEFO
RV9QT1Moc3RhdGUtPmNydGNfeCwgc3RhdGUtCj4+Pj4gY3J0Y195KSk7Cj4+PiArwqDCoMKgwqDC
oMKgwqByZWdtYXBfd3JpdGUoZGMtPnJlZ3MsIFZTRENfRkJfQk9UVE9NX1JJR0hUKG91dHB1dCks
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVlNEQ19NQUtFX1BM
QU5FX1BPUyhzdGF0ZS0+Y3J0Y194ICsgc3RhdGUtCj4+Pj4gY3J0Y193LAo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdGF0ZS0+Y3J0Y195ICsgc3RhdGUtCj4+Pj4gY3J0Y19oKSk7Cj4+PiAr
wqDCoMKgwqDCoMKgwqByZWdtYXBfd3JpdGUoZGMtPnJlZ3MsIFZTRENfRkJfU0laRShvdXRwdXQp
LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFZTRENfTUFLRV9Q
TEFORV9TSVpFKHN0YXRlLT5jcnRjX3csIHN0YXRlLQo+Pj4+IGNydGNfaCkpOwo+Pj4gKwo+Pj4g
K8KgwqDCoMKgwqDCoMKgcmVnbWFwX3dyaXRlKGRjLT5yZWdzLCBWU0RDX0ZCX0JMRU5EX0NPTkZJ
RyhvdXRwdXQpLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFZT
RENfRkJfQkxFTkRfQ09ORklHX0JMRU5EX0RJU0FCTEUpOwo+Pj4gK2NvbW1pdDoKPj4+ICvCoMKg
wqDCoMKgwqDCoHJlZ21hcF9zZXRfYml0cyhkYy0+cmVncywgVlNEQ19GQl9DT05GSUdfRVgob3V0
cHV0KSwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
VlNEQ19GQl9DT05GSUdfRVhfQ09NTUlUKTsKPj4+ICt9Cj4+PiArCj4gPT09PT09PT09PT09PT09
IDg8ID09PT09PT09PT09PT09PT09PT0KCi0tIAotLQpUaG9tYXMgWmltbWVybWFubgpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApG
cmFua2Vuc3RyLiAxNDYsIDkwNDYxIE7DvHJuYmVyZywgR2VybWFueSwgd3d3LnN1c2UuY29tCkdG
OiBKb2NoZW4gSmFzZXIsIEFuZHJldyBNY0RvbmFsZCwgV2VybmVyIEtub2JsaWNoLCAoSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
