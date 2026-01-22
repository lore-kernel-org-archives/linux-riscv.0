Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224BBC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eFZBD6miEyYlWOOIh6mq2GHXxpf/hNpDVwG8SkSSpo=; b=Mp9AWL0F9SPWFm
	mqmM5SP5RUYtuVk9LW0buStbEa2ZcoM+MLGjf2BNZJ6yttEyC2V9LpzVi50crEmHdy3UtOyXdVJPR
	SCSAHzV7gojPmitjA+vbsg1p1P9MyMzqJ9qPwTxShAtdqYMGzY4YW7MBMFsHFw2tefeMdsQkwyfs7
	w3zXPnQFqTJWr0MkXHzO2zz+pR69PwPqZ9x+UUkY+lVxiykz6eTd6cdiZA0ZmfVJ0Goj1+MT8eWqX
	JhuZwiYaN8JW+afJO6aNzcZbsb2eO8avCjhya/SHRPVCieGmGbcrqih71+bKu6esIs4w98wLA9wV4
	e/QKzCX7FvpJ1QXgcjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vip9p-00000006Xsa-2yU2;
	Thu, 22 Jan 2026 07:31:09 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vip9l-00000006Xqa-3P0Y
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:31:07 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AD4EE5BCC2;
	Thu, 22 Jan 2026 07:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769067063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Zds7ar7v5g5Zfy6nZu/sZddvRqj3tHHgtYNUyPDMLOY=;
	b=BKIEXhPBNlMqa4KA8MBPHDeo1upbzEK5MlzQVoYAVsP4ZE8VuLcCgfybohU+Akj6f4gXKO
	qTYo7ZDbD7AjcRUL08vstlLQMA4YPv0pgzdozsXUE4LP8VvjENjm3vtmRPmr7+hUE8CwIJ
	Sgw5R6tnHVwFonOvGDoipAzWBb0tfWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769067063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Zds7ar7v5g5Zfy6nZu/sZddvRqj3tHHgtYNUyPDMLOY=;
	b=DSWkRW5BL/88o66JJrlt/grExPXRl81+3a0vwaFfseFFxrpzKLj8yLP6nb5EjaWkZcwJeN
	JW5XDiaer0mGt+DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769067062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Zds7ar7v5g5Zfy6nZu/sZddvRqj3tHHgtYNUyPDMLOY=;
	b=KLPH+UJUTgCGGYf5v3FE0sBLnssT/o1ijNyISC9uSSyEE93Criz1ItQ9fWwYW/u/zcyOqX
	e7JmzlyxvsPaCEXeTcXxNbx0+RpVh3rWl6Cjxf46csAQlfBLCkdPUFDpDaTgtkZt6dV0JN
	0ZUjABmwFwM+KBdADjSIsp+Jh4oLj6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769067062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Zds7ar7v5g5Zfy6nZu/sZddvRqj3tHHgtYNUyPDMLOY=;
	b=adwSttq3Z5xu6VHu//dn9CYagj9e0n0IdCPfR+7LUVEYJN83X+fdwqL7+k3jOCMtfBEPm0
	iPWFGXPCPulOHNAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D07563EA63;
	Thu, 22 Jan 2026 07:31:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T43fMDXScWnMLwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 22 Jan 2026 07:31:01 +0000
Message-ID: <f49d5e01-1e01-4393-9ba3-2079006984ae@suse.de>
Date: Thu, 22 Jan 2026 08:31:01 +0100
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
 <4afa6f3110790c701c5e24901e9e66560cf21ad0.camel@icenowy.me>
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
In-Reply-To: <4afa6f3110790c701c5e24901e9e66560cf21ad0.camel@icenowy.me>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[icenowy.me,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,samsung.com,bootlin.com,gmail.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,iscas.ac.cn];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	R_RATELIMIT(0.00)[to_ip_from(RLqj7cgak6aet4eyc7so6kz1wx)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233106_014501_5E1DC969 
X-CRM114-Status: GOOD (  12.72  )
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

SGkKCkFtIDIyLjAxLjI2IHVtIDA4OjA2IHNjaHJpZWIgSWNlbm93eSBaaGVuZzoKPiDlnKggMjAy
Ni0wMS0yMeaYn+acn+S4ieeahCAxMzo1NiArMDEwMO+8jFRob21hcyBaaW1tZXJtYW5u5YaZ6YGT
77yaCj4KPiA9PT09PT09PT09PT09PT0gODwgPT09PT09PT09PT09PT09PT0KPj4+ICsKPj4+ICvC
oMKgwqDCoMKgwqDCoGlmIChpcnFzKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHByX3dhcm4oIlVua25vd24gVmVyaXNpbGljb24gREMgaW50ZXJydXB0IDB4JXgKPj4+IGZpcmVk
IVxuIiwgaXJxcyk7Cj4+IEknZCBhdm9pZCBwcl93YXJuKCkgaGVyZS4gVGhpcyBjYW4gZmlsbCB5
b3VyIGxvZ3MgcXVpY2tseS4KPiBUaGVuIGlzIHByX3dhcm5fb25jZSgpIG9rYXk/CgpZZWFoLCB3
YXJuX29uY2Ugc2hvdWxkIGJlIGZpbmUuCgo+Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqByZXR1
cm4gSVJRX0hBTkRMRUQ7Cj4+PiArfQo+ID09PT09PT09PT09PT09PSA4PCA9PT09PT09PT09PT09
PT09PQoKTWF5YmUgY29uc2lkZXIgcmV0dXJuaW5nIElSUV9OT05FIGlmIHRoZSAoaXJxKSB0ZXN0
cyBzdWNjZWVkcy4KCj4KPj4+ICvCoMKgwqDCoMKgwqDCoC8qIEZpeHVwIGZyYW1lYnVmZmVyIGFk
ZHJlc3MgZm9yIHNyYyBjb29yZGluYXRlcyAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgZG1hX2FkZHIg
Kz0gKHN0YXRlLT5zcmMueDEgPj4gMTYpICogYnBwOwo+PiBicHAgaXMgZGVwcmVjYXRlZCBhbmQg
c2hvdWxkIGJlIGF2b2lkZWQgaW4gbmV3IGNvZGUuIFlvdSBjYW4gY29tcHV0ZQo+PiB0aGUKPj4g
b2Zmc2V0IHdpdGggZHJtX2Zvcm1hdF9taW5fcGl0Y2goKToKPj4KPj4gZHJtX2Zvcm1hdF9taW5f
cGl0Y2goZmItPmZvcm1hdCwgMCwgc3RhdGUtPnNyYy54MSA+PiAxNiApCj4gV2VsbCBpdCBzZWVt
cyBxdWl0ZSBkaWZmaWN1bHQgdG8gdHJhY2sgd2hhdCdzIGRlcHJlY2F0ZWQgaW4gdGhlIERSTQo+
IHN1YnN5c3RlbSwgaXMgdGhlcmUgYW55dGhpbmcgbGlrZSBhIGJ1bGxldGluPwoKTm8sIHlvdSBl
aXRoZXIga25vdyBvciBmaW5kIG91dCBkdXJpbmcgdGhlIHJldmlldy4gOikgV2UgYWxzbyB0ZW5k
IHRvIApsZWF2ZSBjb21tZW50cyBpbiB0aGUgY29kZS4gWzFdCgpbMV0gCmh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE4LjYvc291cmNlL2luY2x1ZGUvZHJtL2RybV9mb3VyY2Mu
aCNMODIKCkJlc3QgcmVnYXJkcwpUaG9tYXMKCj4KPgo+IFRoYW5rcywKPiBJY2Vub3d5CgotLSAK
LS0KVGhvbWFzIFppbW1lcm1hbm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKRnJhbmtlbnN0ci4gMTQ2LCA5MDQ2MSBOw7xybmJl
cmcsIEdlcm1hbnksIHd3dy5zdXNlLmNvbQpHRjogSm9jaGVuIEphc2VyLCBBbmRyZXcgTWNEb25h
bGQsIFdlcm5lciBLbm9ibGljaCwgKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
