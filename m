Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AC1FD004B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 15:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rz8w95Aq+cZHS9h4+4JBpQBVh1Kj83RlxYF/Yx7QjZs=; b=NZqD3m72FQrmYA
	icaTFWp7bn1/NtTXLSeKO+Tu5vFemaA+FI5aUVLuU3+yDzXnd3a/yQbfsuO8P6Te2Wu09Zh333G3R
	KmvLwlaM66Gh6RQmHLcwhtheAyl7PHazv9WfhGDn1hTvxBni0hY2Jtt3DKo+vUNbh4W8MMA3iXaq8
	fV3F/rY6FEMTLqoCT+gr4slFg0TAUaZRGSIqTdj156uv5TA51mIDAp9OVGllQRMEKcFSH0EYaMZZ7
	o3iyreTVbRiWQvNv23K7oV8oFk1OuPWjhvMIQGgk6JzuH2VYZYl/1q1NHt5/wuBMtwCI+hdFlpYmM
	jrSj3QSOhzhsbXr6ZQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Jx1-00000000RHl-1GAr;
	Thu, 02 Apr 2026 15:27:19 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Jwx-00000000RFY-21SI
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 15:27:17 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 71E825BE1C;
	Thu,  2 Apr 2026 15:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775143633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IIJkyZ4vqVqocU0260kV/9e9mxp7Nf7GppVgKAYDdSY=;
	b=NcND9pxl0yg+bfnMPz3DZPhuSNTO7WXGIqZ2SRslgy6FRLaAKFjKfkltXIT8wMKtvaQMat
	wdr7zHgc3mhpRKS/hH180m35ntqkHAutmXyxaqyjx+/Z6WXlp6SuMsGmLMtgtv9Lppw1la
	YAbd3oISpYzHZJ1J85SjGAqbskJUCUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775143633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IIJkyZ4vqVqocU0260kV/9e9mxp7Nf7GppVgKAYDdSY=;
	b=+XN1aYgEZxrW4VREe8WxPTgskOQKj2Mh89mLE/+Ni4A5KzK+ErobJbFr7AepIrMve9+sA3
	rF1W61MS7QyQnIDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NcND9pxl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+XN1aYgE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775143633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IIJkyZ4vqVqocU0260kV/9e9mxp7Nf7GppVgKAYDdSY=;
	b=NcND9pxl0yg+bfnMPz3DZPhuSNTO7WXGIqZ2SRslgy6FRLaAKFjKfkltXIT8wMKtvaQMat
	wdr7zHgc3mhpRKS/hH180m35ntqkHAutmXyxaqyjx+/Z6WXlp6SuMsGmLMtgtv9Lppw1la
	YAbd3oISpYzHZJ1J85SjGAqbskJUCUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775143633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IIJkyZ4vqVqocU0260kV/9e9mxp7Nf7GppVgKAYDdSY=;
	b=+XN1aYgEZxrW4VREe8WxPTgskOQKj2Mh89mLE/+Ni4A5KzK+ErobJbFr7AepIrMve9+sA3
	rF1W61MS7QyQnIDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC57A4A0B0;
	Thu,  2 Apr 2026 15:27:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6UFUNNCKzmnZUwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 02 Apr 2026 15:27:12 +0000
Message-ID: <001efe27-9cbb-4a89-8d2d-a1f3ae15e505@suse.de>
Date: Thu, 2 Apr 2026 17:27:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] firmware: sysfb: Make CONFIG_SYSFB a user-selectable
 option
To: Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, longli@microsoft.com,
 Helge Deller <deller@gmx.de>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20260402092305.208728-1-tzimmermann@suse.de>
 <20260402092305.208728-4-tzimmermann@suse.de>
 <78f76717-8f1e-41d6-92f7-261df96b84b6@app.fastmail.com>
 <3e466158-c2e5-4e23-934f-dcdbb71ad41f@suse.de>
 <d3d7c545-3b07-4881-a16d-45b6f039de19@app.fastmail.com>
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
In-Reply-To: <d3d7c545-3b07-4881-a16d-45b6f039de19@app.fastmail.com>
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[arndb.de,redhat.com,kernel.org,linaro.org,xen0n.name,linux.intel.com,gmail.com,ffwll.ch,microsoft.com,gmx.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 71E825BE1C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_082715_809009_65D5EB8C 
X-CRM114-Status: GOOD (  28.78  )
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

SGkKCkFtIDAyLjA0LjI2IHVtIDE2OjU5IHNjaHJpZWIgQXJuZCBCZXJnbWFubjoKPiBPbiBUaHUs
IEFwciAyLCAyMDI2LCBhdCAxNjoxMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4+IEFtIDAy
LjA0LjI2IHVtIDE1OjA4IHNjaHJpZWIgQXJuZCBCZXJnbWFubjoKPj4+IE9uIFRodSwgQXByIDIs
IDIwMjYsIGF0IDExOjA5LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPj4+IEkgZG9uJ3QgcmVh
bGx5IGxpa2UgdGhpcyBwYXJ0IG9mIHRoZSBzZXJpZXMgYW5kIHdvdWxkIHByZWZlcgo+Pj4gdG8g
a2VlcCBDT05GSUdfU1lTRkIgaGlkZGVuIGFzIG11Y2ggYXMgcG9zc2libGUgYXMgYW4geDg2Cj4+
PiAoYW5kIEVGSSkgc3BlY2lmaWMgaW1wbGVtZW50YXRpb24gZGV0YWlsLCB3aXRoIHRoZSBob3Bl
Cj4+PiBvZiBldmVudHVhbGx5IHNlcGVyYXRpbmcgb3V0IHRoZSB4ODYgYml0cyBmcm9tIHRoZSBF
Rkkgb25lcy4KPj4gWW91IG1lYW4sIHlvdSB3YW50IHRvIHVzZSB0aGUgRUZJLXByb3ZpZGVkIGZy
YW1lYnVmZmVycyB3aXRob3V0IHRoZQo+PiBpbnRlcm1lZGlhdGUgc3RlcCBvZiBnb2luZyB0aHJv
dWdoIHN5c2ZiX3ByaW1hcnlfZGlzcGxheT8KPj4KPj4gSW4gdGhhdCBjYXNlLCBDT05GSUdfU1lT
RkIgd291bGQgYmVjb21lIGFuIHg4Ni1pbnRlcm5hbCB0aGluZywgcmlnaHQ/Cj4gVGhlIHBhcnQg
dGhhdCBpcyBzdGlsbCBuZWVkZWQgZnJvbSBzeXNmYiBpcyB0aGUgYXJiaXRyYXRpb24KPiBiZXR3
ZWVuIERSTV9FRkkgYW5kIHRoZSBQQ0kgZGV2aWNlIGRyaXZlciBmb3IgdGhlIHNhbWUgaGFyZHdh
cmUsCj4gc28gSSB0aGluayBzb21lIHBhcnQgb2Ygc3lzZmIgaXMgY2xlYXJseSBuZWVkZWQsIGlu
IHBhcnRpY3VsYXIKPiB0aGUgc3lzZmJfZGlzYWJsZSgpIGZ1bmN0aW9uIHRoYXQgcmVtb3ZlcyB0
aGUgRUZJIGZyYW1lYnVmZmVyCj4gd2hlbiB0aGVyZSBpcyBhIGNvbmZsaWN0aW5nIHNpbXBsZWRy
bSBvciBoYXJkd2FyZSBzcGVjaWZpYwo+IGRyaXZlci4KCldlIGRvIG1vc3Qgb2YgdGhhdCBpbiB0
aGUgYXBlcnR1cmUtaGVscGVyIG1vZHVsZS4gKHNlZSAKPGxpbnV4L2FwZXJ0dXJlLmg+KS4gQ2Fs
bGluZyBzeXNmYl9kaXNhYmxlKCkgZnJvbSB0aGVyZSBpcyBhIHdvcmthcm91bmQgCmZvciBzb21l
IGNvcm5lciBjYXNlcy4gV2UgY2FuIGhhdmUgYW4gRUZJLXNwZWNpZmljIGZ1bmN0aW9uIHRoYXQg
ZG9lcyAKdGhlIHNhbWUuCgpCVFcsIHNpbXBsZWRybS1vbi1FRkkvVkVTQSBpcyBjb25zaWRlcmVk
IG9ic29sZXRlIGFuZCBzaG91bGQgcHJlZmVyYWJseSAKYmUgcmVtb3ZlZCBmcm9tIHRoYXQgZHJp
dmVyLiBTaW1wbGVkcm0gc2hvdWxkIGJlY29tZSBhIGRyaXZlciBmb3IgCkRldmljZXRyZWUgbm9k
ZXMgb2YgdHlwZSBzaW1wbGUtZnJhbWVidWZmZXIgKGFzIGl0IG9yaWdpbmFsbHkgaGFzIGJlZW4g
CmludGVuZGVkKS4KCj4KPiBUaGUgcGFydHMgdGhhdCBJIHdhbnQgdG8ga2VlcCBvdXQgb2YgdGhh
dCBpcyBhbnl0aGluZwo+IHJlbGF0ZWQgdG8gdGhlIHg4NiBib290IHByb3RvY29sLCBub24tRUZJ
IGZyYW1lYnVmZmVycywKPiB0ZXh0IGNvbnNvbGUsIGFuZCBrZXhlYyBoYW5kb2ZmLCB3aGljaCB3
ZSBkb24ndCBuZWVkIG9uCj4gbm9uLXg4NiBVRUZJIHN5c3RlbXMuCj4KPiBJIGRvbid0IG1pbmQg
dGhlIGlkZWEgb2YgaGF2aW5nIGEgc3lzZmJfcHJpbWFyeV9kaXNwbGF5Cj4gaW4gdGhlIEVGSSBj
b2RlIGlmIHRoYXQgaGVscHMga2VlcCBFRkkgc2FuZSBvbiB4ODYsCj4gYnV0IGl0IHdvdWxkIGJl
IGdvb2QgdG8gbWFrZSB0aGF0IGxvY2FsIHRvCj4gZHJpdmVycy9maXJtd2FyZS9lZmkgYW5kIChl
dmVudHVhbGx5KSBkZXRhY2hlZCBmcm9tCj4gaW5jbHVkZS91YXBpL2xpbnV4L3NjcmVlbl9pbmZv
LmguCgpFZmlkcm0gcmV0cmlldmVzIHRoZSBmcmFtZWJ1ZmZlciBzZXR0aW5ncyBmcm9tIHRoZSBj
b250YWluZWQgc3RydWN0IApzY3JlZW5faW5mby4gRGlzY29ubmVjdGluZyBmcm9tIHNjcmVlbl9p
bmZvIHdvdWxkIHJlcXVpcmUgc2VwYXJhdGUgCmdyYXBoaWNzIGRyaXZlcnMgZm9yIHg4NiBhbmQg
bm9uLXg4Ni4gSWYgd2Ugc3BsaXQgb2ZmIEVGSSBmcm9tIHN5c2ZiLCAKd2UnZCBsaWtlbHkgbmVl
ZCBhIHN5c2ZiZHJtIGRyaXZlciBvZiBzb21lIHNvcnQuIEp1c3Qgc2F5aW5nLgoKSSB0aGluayB3
ZSdkIGFsc28gaGF2ZSB0byBkdXBsaWNhdGUgdGhlIGZyYW1lYnVmZmVyLXJlbG9jYXRpb24gY29k
ZSB0aGF0IApjdXJyZW50bHkgd29ya3Mgb24gYW55dGhpbmcgdXNpbmcgc3RydWN0IHNjcmVlbl9p
bmZvIChzZWUgcGF0Y2ggNSkuCgo+Cj4+PiBJbiBnZW5lcmFsLCBJIGFtIGFsd2F5cyBpbiBmYXZv
ciBvZiBwcm9wZXJseSB1c2luZyBLY29uZmlnCj4+PiBkZXBlbmRlbmNpZXMgb3ZlciAnc2VsZWN0
JyBzdGF0ZW1lbnRzLCBmb3IgdGhlIHNhbWUgcmVhc29ucwo+Pj4geW91IGRlc2NyaWJlLCBidXQg
SSBkb24ndCB3YW50IHRoZSB0aGUgeDg2IGxvZ2ljIGZvcgo+Pj4gdGhlIGxlZ2FjeSBWRVNBIGFu
ZCBWR0EgY29uc29sZSBoYW5kbGluZyB0byBsZWFrIGludG8gbW9yZQo+Pj4gYXJjaGl0ZWN0dXJl
cyB0aGFuIG5lY2Vzc2FyeS4KPj4+Cj4+PiBEbyB5b3UgdGhpbmsgd2UgY291bGQgaW5zdGVhZCBt
b3ZlIHRoZSBzeXNmYl9pbml0KCkKPj4+IGZ1bmN0aW9uIGludG8gdGhlIHNhbWUgdHdvIHBsYWNl
cyB0aGF0IGNvbnRhaW4gdGhlCj4+PiBzeXNmYl9wcmltYXJ5X2Rpc3BsYXkgZGVmaW5pdGlvbiAo
YXJjaC94ODYva2VybmVsL3NldHVwLmMsCj4+PiBkcml2ZXJzL2Zpcm13YXJlL2VmaS9lZmktaW5p
dC5jKSBhbmQgc2ltcGxpZnkgdGhlIGVmaSB2ZXJzaW9uCj4+PiB0byB0YWtlIG91dCB0aGUgeDg2
IGJpdHM/IFRoYXQgd291bGQgcmVkdWNlIHRoZSByZXN0Cj4+PiBvZiBzeXNmYi1wcmltYXJ5LmMg
dG8gdGhlIGxvZ2ljIHRvIHVucmVnaXN0ZXIgdGhlIGRldmljZSwKPj4+IGFuZCB0aGF0IGNvdWxk
IHRoZW4gYmUgc2VsZWN0ZWQgYnkgYm90aCB4ODYgYW5kIEVGSS4KPj4gTm8sIEknbSBtb3JlIHRo
YW4gaGFwcHkgdGhhdCBzeXNmYiBmaW5hbGx5IGNvbnNvbGlkYXRlcyBhbGwgdGhlCj4+IGluaXQt
ZnJhbWVidWZmZXIgc2V0dXAgYW5kIGRldGVjdGlvbiB0aGF0IGZsb2F0ZWQgYXJvdW5kIGluIHRo
ZSBrZXJuZWwuCj4+IEkgd291bGQgbm90IHdhbnQgaXQgdG8gYmUgZHVwbGljYXRlZCBhZ2Fpbi4K
Pj4KPj4gRm9yIG5vdywgd2UgY291bGQgY2VydGFpbmx5IGtlZXAgQ09ORklHX1NZU0ZCIGhpZGRl
biBhbmQgYXV0b3NlbGVjdGVkLgo+PiBBbHRob3VnaCBJIHRoaW5rIHRoaXMgd2lsbCByZXF1aXJl
IHNvZW0gc29ydCBvZiBzb2x1dGlvbiBhdCBhIGxhdGVyIHBvaW50Lgo+IENhbiB5b3UgY2xhcmlm
eSB3aGljaCBwcm9ibGVtIHlvdSBhcmUgdHJ5aW5nIHRvIHNvbHZlCj4gd2l0aCB0aGF0PwoKT25l
IHRoaW5nIGlzIHRoYXQgc29tZSB1c2VycyBzaW1wbHkgd2hhdCBjb250cm9sIG92ZXIgdGhlaXIg
a2VybmVsIGJ1aWxkLgoKSSBhbHNvIHRoaW5rIHRoYXQgdGhlcmUgbWlnaHQgYmUgc3lzdGVtcyB0
aGF0IHdhbnQgdG8gdXNlIApzeXNmYl9wcmltYXJ5X2Rpc3BsYXkgKHBsdXMgdGhlIHJlbG9jYXRp
b24gZmVhdHVyZSksIGJ1dCBub3QgY3JlYXRlIHRoZSAKZnJhbWVidWZmZXIgZGV2aWNlLiBTYXkg
Zm9yIGVmaS1lYXJseWNvbi4gSXQgbmVlZHMgdXNlci1jb250cm9sIG92ZXIgdGhlIApTWVNGQiBv
cHRpb24gdG8gZG8gdGhhdC4KCkFzIGEgc2lkZS1lZmZlY3QsIHVzZXItY29uZmlndXJhYmxlIFNZ
U0ZCIGdpdmVzIHVzIGEgbmljZSBwbGFjZSB0byBwdXQgClNZU0ZCX1NJTVBMRUZCIGFuZCBGSVJN
V0FSRV9FRElEOyB0d28gb3B0aW9ucyB0aGF0IGN1cnJlbnRseSBmbG9hdCAKYXJvdW5kIGluIHRo
ZSBjb25maWcgc29tZXdoYXQgYXJiaXRyYXJpbHkuCgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgo+Cj4g
ICAgICAgQXJuZAoKLS0gCi0tClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICkZyYW5rZW5zdHIuIDE0
NiwgOTA0NjEgTsO8cm5iZXJnLCBHZXJtYW55LCB3d3cuc3VzZS5jb20KR0Y6IEpvY2hlbiBKYXNl
ciwgQW5kcmV3IE1jRG9uYWxkLCBXZXJuZXIgS25vYmxpY2gsIChIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
