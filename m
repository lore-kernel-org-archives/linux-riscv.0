Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6493AC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3P8Tlj4IZ3DrTMw0Fdh1Ushy/tCorV3/FXZwamqacok=; b=wKftWMm2BXi4/V
	yehzWbd8s1hE9Sp2+SgoiT0wOxVKEwAZVAjxXnCtIS9MzB4ss8kEVfsx16renbB3A6KufjWBplQVJ
	6yQ+SFjHU+Mer2KJEoSbo285NAYRiLkAqOVYM3X3lYP0d2swrCEkogUHVw3TiPLGKpzQjPHsuT5Mp
	2PAD9wIDvuN+PemUC3DQmt8V79ei58gSZeURsEU2vIUKBKFH7y6IPzlerW4u6Zgj3vMEtAD8oHUfP
	xXYW4BQL8Sb0GIYYIh5Tml0WRNlOuezNFXf6SSb9B0WlH7EpWWDxtm4c2gVTzRGTgAA9ZK9WdFX9i
	TUBen0bYWVDf5Z+Fet9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipLm-00000006bCL-2YL6;
	Thu, 22 Jan 2026 07:43:30 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipLj-00000006bBl-3E1l
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:43:29 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C64215BCC3;
	Thu, 22 Jan 2026 07:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769067806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SA14Nw/OY5MOciYSiWN8BJpdP9sMLJwUxS+vtfoM38U=;
	b=nwVKO4Yb7MS27xXaSzhW4IG13LMfBx+ZNp19IHs4umaV956tdYmABsmrU+xosfp8OsIfrI
	x1AchfkBubDHFAuuNiXcvmkwH0EhJgxN01ksT6p5edNnlx68h2nUZ611+m11VKaSWcCYGy
	Lq4HtQev8LVL0kLM4r/Jzt8hzNiD7t0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769067806;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SA14Nw/OY5MOciYSiWN8BJpdP9sMLJwUxS+vtfoM38U=;
	b=MFJAkEuto1Kf9bu5xLgLP4FOrY3lkVQtr/JsnGCUA4Qqg2/iQ3QTzddcch+/1mFFXE6snM
	+TBXFvxJfDrY7vCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ph/Z3pE5";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zQKl2IqS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769067805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SA14Nw/OY5MOciYSiWN8BJpdP9sMLJwUxS+vtfoM38U=;
	b=ph/Z3pE5M0m/16iCfWHPtNDXBHKT06ObgNDrMpE3YCs7+H5xbSxwR5gzpeg1cLFBMbexSp
	ewjA++0vsbKT8FGjqUSFLSAdL8gzbhxp0EsekfsqAcUqN5vJo5XZ686qhwT/9YCFnw2dXX
	dm1UKtLeWhGPtsNHdRtPRAY+xGjyJl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769067805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SA14Nw/OY5MOciYSiWN8BJpdP9sMLJwUxS+vtfoM38U=;
	b=zQKl2IqSehXMLV0iFReu4yNWIP4XMGiI4RF6n2CprdyfLIhHLqNu/a4DhltCGriFNv1o+4
	8ueE09V4eYji88AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18A273EA63;
	Thu, 22 Jan 2026 07:43:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id s9GmBB3VcWn9OgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 22 Jan 2026 07:43:25 +0000
Message-ID: <9a7533ae-c1a2-4871-923d-500c8b0a3bc7@suse.de>
Date: Thu, 22 Jan 2026 08:43:24 +0100
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
 <f49d5e01-1e01-4393-9ba3-2079006984ae@suse.de>
 <bf129af81c999b9b0760036ed2755e0c3da3e9c1.camel@icenowy.me>
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
In-Reply-To: <bf129af81c999b9b0760036ed2755e0c3da3e9c1.camel@icenowy.me>
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[icenowy.me,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,samsung.com,bootlin.com,gmail.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,iscas.ac.cn];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLhco1tq9et14njsu3qecxcejq)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.com:url]
X-Rspamd-Queue-Id: C64215BCC3
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_234328_100008_CE807DD2 
X-CRM114-Status: GOOD (  11.66  )
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

CgpBbSAyMi4wMS4yNiB1bSAwODozNyBzY2hyaWViIEljZW5vd3kgWmhlbmc6Cj4g5ZyoIDIwMjYt
MDEtMjLmmJ/mnJ/lm5vnmoQgMDg6MzEgKzAxMDDvvIxUaG9tYXMgWmltbWVybWFubuWGmemBk++8
mgo+PiBIaQo+Pgo+PiBBbSAyMi4wMS4yNiB1bSAwODowNiBzY2hyaWViIEljZW5vd3kgWmhlbmc6
Cj4+PiDlnKggMjAyNi0wMS0yMeaYn+acn+S4ieeahCAxMzo1NiArMDEwMO+8jFRob21hcyBaaW1t
ZXJtYW5u5YaZ6YGT77yaCj4+Pgo+Pj4gPT09PT09PT09PT09PT09IDg8ID09PT09PT09PT09PT09
PT09Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgaWYgKGlycXMpCj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwcl93YXJuKCJVbmtub3duIFZlcmlzaWxpY29uIERDIGlu
dGVycnVwdCAweCV4Cj4+Pj4+IGZpcmVkIVxuIiwgaXJxcyk7Cj4+Pj4gSSdkIGF2b2lkIHByX3dh
cm4oKSBoZXJlLiBUaGlzIGNhbiBmaWxsIHlvdXIgbG9ncyBxdWlja2x5Lgo+Pj4gVGhlbiBpcyBw
cl93YXJuX29uY2UoKSBva2F5Pwo+PiBZZWFoLCB3YXJuX29uY2Ugc2hvdWxkIGJlIGZpbmUuCj4+
Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIElSUV9IQU5ETEVEOwo+Pj4+PiAr
fQo+Pj4gPT09PT09PT09PT09PT09IDg8ID09PT09PT09PT09PT09PT09Cj4+IE1heWJlIGNvbnNp
ZGVyIHJldHVybmluZyBJUlFfTk9ORSBpZiB0aGUgKGlycSkgdGVzdHMgc3VjY2VlZHMuCj4gV2Vs
bCwgdGhlIElSUXMgYXJlIHJlYWQgZnJvbSB0aGUgZGV2aWNlJ3MgcmVnaXN0ZXIsIGFuZCB0aGUg
cmVhZAo+IG9wZXJhdGlvbiBhdXRvbWF0aWNhbGx5IEFDS3MgdGhlIElSUSwgc28gaXQgc291bmRz
IG1vcmUgYXBwcm9wcmlhdGUgdG8KPiBhbHdheXMgcmV0dXJuIElSUV9IQU5ETEVELgoKVGhhdCBt
YWtlcyBzZW5zZS4KCj4KPiAoV2VsbCBtYXliZSB0aGlzIGZ1bmN0aW9uIHNob3VsZCBiZSBtYWRl
IHJldHVybiB2b2lkLCBhbmQgcmV0dXJuaW5nCj4gSVJRX0hBTkRMRUQgc2hvdWxkIGJlIGRvbmUg
aW4gdGhlIGNhbGxlciBvZiB0aGlzIGZ1bmN0aW9uLAo+IHZzX2RjX2lycV9oYW5kbGVyKCkgKQo+
Cj4gVGhhbmtzLAo+IEljZW5vd3kKCi0tIAotLQpUaG9tYXMgWmltbWVybWFubgpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApGcmFu
a2Vuc3RyLiAxNDYsIDkwNDYxIE7DvHJuYmVyZywgR2VybWFueSwgd3d3LnN1c2UuY29tCkdGOiBK
b2NoZW4gSmFzZXIsIEFuZHJldyBNY0RvbmFsZCwgV2VybmVyIEtub2JsaWNoLCAoSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
