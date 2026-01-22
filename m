Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBBBC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPGaO1YfUp9gZNoluGEiRBLDTuYHmffrlTGNyfY8pt8=; b=GuXI+Ow1QCRM4z
	NmR4rz+v3VTDLNzCdYucnp4+Xme9uqu3tiVPhG59+sCowS2vv9+o8Pp/fTz98gaIy6or3ciZDuO1b
	T54gn0xb93JDl7xuvOZUfBF40psUqMHkb1AkoURiJAjcq+t6XwKhEu/6lxyER7xzVwCFBYe8Y3nHO
	JovOozSz0hdinCV18oy0d7SsWPlKt45DeUaQNHHeJP+lGT/X04D8R3IQ8dzYAcPfoyap/EIJFEDlB
	Eoo6IqFklOpVQ2Y1zBkISTZrTzaszbY4i5/B1R5vXLJE2O72UaoWwVlamcbZAVupZzT95b/gjrcXt
	gu+ZldOoUKWSb078ACkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipGy-00000006aqQ-2JJP;
	Thu, 22 Jan 2026 07:38:32 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipGv-00000006apl-4C3J
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:38:31 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 37F365BCC7;
	Thu, 22 Jan 2026 07:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769067162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oKS0u/GglQcp/lNyRVwVTZ698khWL/vphTnJ2a9GzKc=;
	b=qqqhE8601qbJBhz3U8yC4ukHxLcCqB06H2uCNxrbunLdYztcX1xJf5Xoe832ZmvSD9KVlU
	vDm4Pts7qjapBfx7GIlFoojjiUepB0sH1k+NZZCm42ejXoOuofRatbLcGphHj21SVuAtUA
	jNz5aKS01hAWoogv5jwqx+bnJ8nS71U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769067162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oKS0u/GglQcp/lNyRVwVTZ698khWL/vphTnJ2a9GzKc=;
	b=m4DpVuIb3SCRdjFd87eCu812CDxXihAn8mm/pXKXgdzEgGV8yysMQS8Tzg+rclQgltDVfa
	1l14IJwOB7FhdgCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qqqhE860;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=m4DpVuIb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769067162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oKS0u/GglQcp/lNyRVwVTZ698khWL/vphTnJ2a9GzKc=;
	b=qqqhE8601qbJBhz3U8yC4ukHxLcCqB06H2uCNxrbunLdYztcX1xJf5Xoe832ZmvSD9KVlU
	vDm4Pts7qjapBfx7GIlFoojjiUepB0sH1k+NZZCm42ejXoOuofRatbLcGphHj21SVuAtUA
	jNz5aKS01hAWoogv5jwqx+bnJ8nS71U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769067162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oKS0u/GglQcp/lNyRVwVTZ698khWL/vphTnJ2a9GzKc=;
	b=m4DpVuIb3SCRdjFd87eCu812CDxXihAn8mm/pXKXgdzEgGV8yysMQS8Tzg+rclQgltDVfa
	1l14IJwOB7FhdgCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7DD5D3EA63;
	Thu, 22 Jan 2026 07:32:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hd5iHZnScWnGMAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 22 Jan 2026 07:32:41 +0000
Message-ID: <22b8d941-3e02-4526-b5e4-3c6cf4e1b431@suse.de>
Date: Thu, 22 Jan 2026 08:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
From: Thomas Zimmermann <tzimmermann@suse.de>
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
Content-Language: en-US
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
In-Reply-To: <f49d5e01-1e01-4393-9ba3-2079006984ae@suse.de>
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,samsung.com,bootlin.com,gmail.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,iscas.ac.cn];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLhco1tq9et14njsu3qecxcejq)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 37F365BCC7
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233830_326893_1228FDFA 
X-CRM114-Status: GOOD (  13.62  )
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

SGkKCkFtIDIyLjAxLjI2IHVtIDA4OjMxIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46Cj4gSGkK
Pgo+IEFtIDIyLjAxLjI2IHVtIDA4OjA2IHNjaHJpZWIgSWNlbm93eSBaaGVuZzoKPj4g5ZyoIDIw
MjYtMDEtMjHmmJ/mnJ/kuInnmoQgMTM6NTYgKzAxMDDvvIxUaG9tYXMgWmltbWVybWFubuWGmemB
k++8mgo+Pgo+PiA9PT09PT09PT09PT09PT0gODwgPT09PT09PT09PT09PT09PT0KPj4+PiArCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgaWYgKGlycXMpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHByX3dhcm4oIlVua25vd24gVmVyaXNpbGljb24gREMgaW50ZXJydXB0IDB4JXgKPj4+
PiBmaXJlZCFcbiIsIGlycXMpOwo+Pj4gSSdkIGF2b2lkIHByX3dhcm4oKSBoZXJlLiBUaGlzIGNh
biBmaWxsIHlvdXIgbG9ncyBxdWlja2x5Lgo+PiBUaGVuIGlzIHByX3dhcm5fb25jZSgpIG9rYXk/
Cj4KPiBZZWFoLCB3YXJuX29uY2Ugc2hvdWxkIGJlIGZpbmUuCgpCVFcgZHJtX3dhcm5fb25jZSgp
IHdvdWxkIGJlIHByZWZlcmFibGUgb3ZlciBwbGFpbiBwcl93YXJuKCkuCgo+Cj4+Cj4+Pj4gKwo+
Pj4+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBJUlFfSEFORExFRDsKPj4+PiArfQo+PiA9PT09PT09
PT09PT09PT0gODwgPT09PT09PT09PT09PT09PT0KPgo+IE1heWJlIGNvbnNpZGVyIHJldHVybmlu
ZyBJUlFfTk9ORSBpZiB0aGUgKGlycSkgdGVzdHMgc3VjY2VlZHMuCj4KPj4KPj4+PiArwqDCoMKg
wqDCoMKgwqAvKiBGaXh1cCBmcmFtZWJ1ZmZlciBhZGRyZXNzIGZvciBzcmMgY29vcmRpbmF0ZXMg
Ki8KPj4+PiArwqDCoMKgwqDCoMKgwqBkbWFfYWRkciArPSAoc3RhdGUtPnNyYy54MSA+PiAxNikg
KiBicHA7Cj4+PiBicHAgaXMgZGVwcmVjYXRlZCBhbmQgc2hvdWxkIGJlIGF2b2lkZWQgaW4gbmV3
IGNvZGUuIFlvdSBjYW4gY29tcHV0ZQo+Pj4gdGhlCj4+PiBvZmZzZXQgd2l0aCBkcm1fZm9ybWF0
X21pbl9waXRjaCgpOgo+Pj4KPj4+IGRybV9mb3JtYXRfbWluX3BpdGNoKGZiLT5mb3JtYXQsIDAs
IHN0YXRlLT5zcmMueDEgPj4gMTYgKQo+PiBXZWxsIGl0IHNlZW1zIHF1aXRlIGRpZmZpY3VsdCB0
byB0cmFjayB3aGF0J3MgZGVwcmVjYXRlZCBpbiB0aGUgRFJNCj4+IHN1YnN5c3RlbSwgaXMgdGhl
cmUgYW55dGhpbmcgbGlrZSBhIGJ1bGxldGluPwo+Cj4gTm8sIHlvdSBlaXRoZXIga25vdyBvciBm
aW5kIG91dCBkdXJpbmcgdGhlIHJldmlldy4gOikgV2UgYWxzbyB0ZW5kIHRvIAo+IGxlYXZlIGNv
bW1lbnRzIGluIHRoZSBjb2RlLiBbMV0KPgo+IFsxXSAKPiBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92Ni4xOC42L3NvdXJjZS9pbmNsdWRlL2RybS9kcm1fZm91cmNjLmgjTDgyCj4K
PiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPgo+Pgo+Pgo+PiBUaGFua3MsCj4+IEljZW5vd3kKPgoK
LS0gCi0tClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICkZyYW5rZW5zdHIuIDE0NiwgOTA0NjEgTsO8
cm5iZXJnLCBHZXJtYW55LCB3d3cuc3VzZS5jb20KR0Y6IEpvY2hlbiBKYXNlciwgQW5kcmV3IE1j
RG9uYWxkLCBXZXJuZXIgS25vYmxpY2gsIChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
