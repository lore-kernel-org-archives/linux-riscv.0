Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059F1D35688
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 07:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcekEQDaExBl/lsy04JxXtdpzkZJCz5MfBuniNLGOcw=; b=k6GgmFG2OVPxjJ
	oX0cP3xJHVT4LEl2qHIlCmkFL2e8HEU8DTTr1RompO6RWG3Yj5toNqhu08PXAz/a4rkmrD9Y9zSny
	syif+zlC1PwbqGaIBCBZLUZbXdayh0Wy+jenrZdljC2xefdnHX5X55Jw5BPCVWCYIgVBawJeUxwr5
	iSQOpt5uZl2LVBefTumLNO369Y4YaTEM4TSbfgbLm7Dio0/UmT1PlzQy3qa2DjW6NvU06Ndzbp/of
	5GrrJO5Y/kaEZ5697OWIuSbVyhD5RIn5NPBNpASLT3wEs5+Kc1LVa6oomE1giUWrx6Ul9jysKRI3D
	efd81gOqRlJq0lCDd3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0K9-0000000FcFp-46eC;
	Wed, 28 Jan 2026 07:50:50 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0K3-0000000FcFN-1PPl
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 07:50:48 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5687F33A81;
	Wed, 28 Jan 2026 07:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769586641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Aa1gMe/mq9inWqiC7tTfzhj550KM1ThH2HM5vZVIxzY=;
	b=DtDnefQJMkDWCKpWgRGa1AWF70af8MVO2vSRsePVQvDPmU7MRFTigsLtO14DD8EidgMMip
	pXbcgpijwj/xD2oJbl2QZMoQAVTGaX6KFB6iuJbzRa9EUEahxPHVZxtQPPN0pdhNORdc0n
	G+xPL/9RbwJMLAwi78VO6QzluruBDLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769586641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Aa1gMe/mq9inWqiC7tTfzhj550KM1ThH2HM5vZVIxzY=;
	b=s/Ki7tDOtT+GM0o2CO3oxKCJmMo8NxCui5jFNFp56r+SCKX5YruNJFkKuAmm14iFHwAT+d
	d7HpuyZldGSlywAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DtDnefQJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="s/Ki7tDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769586641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Aa1gMe/mq9inWqiC7tTfzhj550KM1ThH2HM5vZVIxzY=;
	b=DtDnefQJMkDWCKpWgRGa1AWF70af8MVO2vSRsePVQvDPmU7MRFTigsLtO14DD8EidgMMip
	pXbcgpijwj/xD2oJbl2QZMoQAVTGaX6KFB6iuJbzRa9EUEahxPHVZxtQPPN0pdhNORdc0n
	G+xPL/9RbwJMLAwi78VO6QzluruBDLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769586641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Aa1gMe/mq9inWqiC7tTfzhj550KM1ThH2HM5vZVIxzY=;
	b=s/Ki7tDOtT+GM0o2CO3oxKCJmMo8NxCui5jFNFp56r+SCKX5YruNJFkKuAmm14iFHwAT+d
	d7HpuyZldGSlywAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 957CC3EA61;
	Wed, 28 Jan 2026 07:50:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yyMLI9C/eWnYegAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 28 Jan 2026 07:50:40 +0000
Message-ID: <6c037a3d-8061-422b-827b-c3795dd89477@suse.de>
Date: Wed, 28 Jan 2026 08:50:40 +0100
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
 <7bffdc45628fec9dd8175f696d3a68aa1e12f0a2.camel@icenowy.me>
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
In-Reply-To: <7bffdc45628fec9dd8175f696d3a68aa1e12f0a2.camel@icenowy.me>
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[icenowy.me,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[28];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,samsung.com,bootlin.com,gmail.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,iscas.ac.cn];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLhco1tq9et14njsu3qecxcejq)];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 5687F33A81
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_235046_846822_38D9919A 
X-CRM114-Status: GOOD (  12.71  )
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

SGkKCkFtIDIyLjAxLjI2IHVtIDEwOjQ3IHNjaHJpZWIgSWNlbm93eSBaaGVuZzoKPiDlnKggMjAy
Ni0wMS0yMeaYn+acn+S4ieeahCAxMzo1NiArMDEwMO+8jFRob21hcyBaaW1tZXJtYW5u5YaZ6YGT
77yaCj4KPiA9PT09PT09PT09PT09PT09PT09IDg8ID09PT09PT09PT09PT09PT09PT09Cj4+PiAr
dm9pZCBkcm1fZm9ybWF0X3RvX3ZzX2Zvcm1hdCh1MzIgZHJtX2Zvcm1hdCwgc3RydWN0IHZzX2Zv
cm1hdAo+Pj4gKnZzX2Zvcm1hdCkKPj4+ICt7Cj4+PiArwqDCoMKgwqDCoMKgwqBzd2l0Y2ggKGRy
bV9mb3JtYXQpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9YUkdCNDQ0NDoK
Pj4+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JYNDQ0NDoKPj4+ICvCoMKgwqDC
oMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9YQkdSNDQ0NDoKPj4+ICvCoMKgwqDCoMKgwqDCoGNhc2Ug
RFJNX0ZPUk1BVF9CR1JYNDQ0NDoKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2
c19mb3JtYXQtPmNvbG9yID0gVlNEQ19DT0xPUl9GT1JNQVRfWDRSNEc0QjQ7Cj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4+PiArwqDCoMKgwqDCoMKgwqBjYXNlIERS
TV9GT1JNQVRfQVJHQjQ0NDQ6Cj4+PiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfUkdC
QTQ0NDQ6Cj4+PiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQUJHUjQ0NDQ6Cj4+PiAr
wqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQkdSQTQ0NDQ6Cj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgdnNfZm9ybWF0LT5jb2xvciA9IFZTRENfQ09MT1JfRk9STUFUX0E0
UjRHNEI0Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX1hSR0IxNTU1Ogo+Pj4gK8KgwqDCoMKgwqDCoMKg
Y2FzZSBEUk1fRk9STUFUX1JHQlg1NTUxOgo+Pj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9S
TUFUX1hCR1IxNTU1Ogo+Pj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0JHUlg1NTUx
Ogo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZzX2Zvcm1hdC0+Y29sb3IgPSBW
U0RDX0NPTE9SX0ZPUk1BVF9YMVI1RzVCNTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBicmVhazsKPj4+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9BUkdCMTU1NToK
Pj4+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JBNTU1MToKPj4+ICvCoMKgwqDC
oMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9BQkdSMTU1NToKPj4+ICvCoMKgwqDCoMKgwqDCoGNhc2Ug
RFJNX0ZPUk1BVF9CR1JBNTU1MToKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2
c19mb3JtYXQtPmNvbG9yID0gVlNEQ19DT0xPUl9GT1JNQVRfQTFSNUc1QjU7Cj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4+PiArwqDCoMKgwqDCoMKgwqBjYXNlIERS
TV9GT1JNQVRfUkdCNTY1Ogo+Pj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0JHUjU2
NToKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2c19mb3JtYXQtPmNvbG9yID0g
VlNEQ19DT0xPUl9GT1JNQVRfUjVHNkI1Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGJyZWFrOwo+Pj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX1hSR0I4ODg4Ogo+
Pj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX1JHQlg4ODg4Ogo+Pj4gK8KgwqDCoMKg
wqDCoMKgY2FzZSBEUk1fRk9STUFUX1hCR1I4ODg4Ogo+Pj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBE
Uk1fRk9STUFUX0JHUlg4ODg4Ogo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZz
X2Zvcm1hdC0+Y29sb3IgPSBWU0RDX0NPTE9SX0ZPUk1BVF9YOFI4RzhCODsKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPj4+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJN
X0ZPUk1BVF9BUkdCODg4ODoKPj4+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JB
ODg4ODoKPj4+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9BQkdSODg4ODoKPj4+ICvC
oMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9CR1JBODg4ODoKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB2c19mb3JtYXQtPmNvbG9yID0gVlNEQ19DT0xPUl9GT1JNQVRfQThS
OEc4Qjg7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4+PiArwqDC
oMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQVJHQjIxMDEwMTA6Cj4+PiArwqDCoMKgwqDCoMKg
wqBjYXNlIERSTV9GT1JNQVRfUkdCQTEwMTAxMDI6Cj4+PiArwqDCoMKgwqDCoMKgwqBjYXNlIERS
TV9GT1JNQVRfQUJHUjIxMDEwMTA6Cj4+PiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRf
QkdSQTEwMTAxMDI6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdnNfZm9ybWF0
LT5jb2xvciA9IFZTRENfQ09MT1JfRk9STUFUX0EyUjEwRzEwQjEwOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+Pj4gK8KgwqDCoMKgwqDCoMKgZGVmYXVsdDoKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBEUk1fV0FSTigiVW5leHBlY3RlZCBkcm0g
Zm9ybWF0IVxuIik7Cj4+IGRybV93YXJuKCkuIElmIHRoaXMgY2FuIGJlIGludm9rZWQgZnJvbSB1
c2VyIHNwYWNlLGVhc2lseSwgYmV0dGVyIHVzZQo+PiBkcm1fZGJnKCkKPiBUaGlzIGZ1bmN0aW9u
IGlzIGNhbGxlZCBkdXJpbmcgYXRvbWljX3VwZGF0ZSBvZiBwbGFuZXMsIGFuZCBJIHRoaW5rIGlu
Cj4gdGhpcyBjYXNlIHRoZSB1bmtub3duIGZvcm1hdHMgc2hvdWxkIGFscmVhZHkgYmUgcmVqZWN0
ZWQgYmVjYXVzZQo+IHRoZXkncmUgbm90IGFkdmVydGlzZWQgZm9yIGFueSBwbGFuZXMuCj4KPiBE
aWQgSSBnZXQgaXQgcmlnaHQgb24gdGhpcz8KClllcy4gSW4gcHJpbmNpcGxlIHlvdSBzaG91bGQg
bmV2ZXIgcmVhY2ggdGhlIGRlZmF1bHQgY2FzZS4gVGhpcyBtZXNzYWdlIAppcyBvbmx5IGZvciB0
ZXN0aW5nIGludGVybmFsbHkuCgpXaGF0IEkgdXN1YWxseSBkbyBpcyB0byBjb21wdXRlIHN1Y2gg
aW50ZXJuYWwgdmFsdWVzIGluIHRoZSBhdG9taWNfY2hlY2sgCmhlbHBlciBhbmQgdGhlbiBzdG9y
ZSB0aGVtIGluIHRoZSByZXNwZWN0aXZlIHN0YXRlLiBIZXJlLCB5b3UnZCBuZWVkIGEgCmN1c3Rv
bSBzdHJ1Y3QgdnNfcGxhbmVfc3RhdGUgdG8gaG9sZCB0aGVtLiBJZiB0aGUgZm9ybWF0IGNvbnZl
cnNpb24gCmZhaWxzIGluIGF0b21pY19jaGVjaywgaXQgY2FuIHN0aWxsIHJldHVybiBhbiBlcnJu
byBjb2RlIHRvIHVzZXIgc3BhY2UuCgpEb2luZyB0aGlzIHRocm91Z2hvdXQgdGhlIGRyaXZlciBw
dXNoZXMgYWxsL21vc3QgZmFpbCBzdGF0ZXMgYmVmb3JlIHRoZSAKJ21hZ2ljIGJhcnJpZXIuJyBb
MV0KClsxXSAKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTktcmM1L3NvdXJj
ZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyNMMjI3OAoKCj4KPj4+ICvCoMKg
wqDCoMKgwqDCoH0KPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoHN3aXRjaCAoZHJtX2Zvcm1hdCkg
ewo+Pj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX1JHQlg0NDQ0Ogo+Pj4gK8KgwqDC
oMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX1JHQkE0NDQ0Ogo+Pj4gK8KgwqDCoMKgwqDCoMKgY2Fz
ZSBEUk1fRk9STUFUX1JHQlg1NTUxOgo+Pj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFU
X1JHQkE1NTUxOgo+Pj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX1JHQlg4ODg4Ogo+
Pj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX1JHQkE4ODg4Ogo+Pj4gK8KgwqDCoMKg
wqDCoMKgY2FzZSBEUk1fRk9STUFUX1JHQkExMDEwMTAyOgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHZzX2Zvcm1hdC0+c3dpenpsZSA9IFZTRENfU1dJWlpMRV9SR0JBOwo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+Pj4gK8KgwqDCoMKgwqDCoMKg
Y2FzZSBEUk1fRk9STUFUX1hCR1I0NDQ0Ogo+Pj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9S
TUFUX0FCR1I0NDQ0Ogo+Pj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX1hCR1IxNTU1
Ogo+Pj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0FCR1IxNTU1Ogo+Pj4gK8KgwqDC
oMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0JHUjU2NToKPj4+ICvCoMKgwqDCoMKgwqDCoGNhc2Ug
RFJNX0ZPUk1BVF9YQkdSODg4ODoKPj4+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9B
QkdSODg4ODoKPj4+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9BQkdSMjEwMTAxMDoK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2c19mb3JtYXQtPnN3aXp6bGUgPSBW
U0RDX1NXSVpaTEVfQUJHUjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVh
azsKPj4+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9CR1JYNDQ0NDoKPj4+ICvCoMKg
wqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9CR1JBNDQ0NDoKPj4+ICvCoMKgwqDCoMKgwqDCoGNh
c2UgRFJNX0ZPUk1BVF9CR1JYNTU1MToKPj4+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1B
VF9CR1JBNTU1MToKPj4+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9CR1JYODg4ODoK
Pj4+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9CR1JBODg4ODoKPj4+ICvCoMKgwqDC
oMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9CR1JBMTAxMDEwMjoKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB2c19mb3JtYXQtPnN3aXp6bGUgPSBWU0RDX1NXSVpaTEVfQkdSQTsKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPj4+ICvCoMKgwqDCoMKgwqDC
oGRlZmF1bHQ6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogTi9BIGZvciBZ
VVYgZm9ybWF0cyAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZzX2Zvcm1h
dC0+c3dpenpsZSA9IFZTRENfU1dJWlpMRV9BUkdCOwo+Pj4gK8KgwqDCoMKgwqDCoMKgfQo+Pj4g
Kwo+Pj4gK8KgwqDCoMKgwqDCoMKgLyogTi9BIGZvciBub24tWVVWIGZvcm1hdHMgKi8KPj4+ICvC
oMKgwqDCoMKgwqDCoHZzX2Zvcm1hdC0+dXZfc3dpenpsZSA9IGZhbHNlOwo+Pj4gK30KClRoZXNl
IHZhbHVlcyBjb3VsZCBhbHNvIGdvIGludG8gdnNfcGxhbmVfc3RhdGUuCgpCZXN0IHJlZ2FyZApU
aG9tYXMKCgotLSAKLS0KVGhvbWFzIFppbW1lcm1hbm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKRnJhbmtlbnN0ci4gMTQ2LCA5
MDQ2MSBOw7xybmJlcmcsIEdlcm1hbnksIHd3dy5zdXNlLmNvbQpHRjogSm9jaGVuIEphc2VyLCBB
bmRyZXcgTWNEb25hbGQsIFdlcm5lciBLbm9ibGljaCwgKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
