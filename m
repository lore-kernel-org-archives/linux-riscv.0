Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C94CFC28D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 15:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iuoPvilYWcheM7m/x58eIADcYfkrVv0yJDhmkUV01KA=; b=Jt6MAQnFuyCnU6
	nmtTSzUmkkh5ZY8QMKuhMRpA2QkkElpyjyYpCVmWwd/78Y2q2J6B31Yzm1qdUD36lIP+0vMMs762T
	1IK3Aw7Amv9vtt93qy+OlYmtZ/Af6QxJYU9PjpLnqyF/dqz9WhAAk+qLL0HdEQ5hjZZS5FZ6E6coc
	smN+VOB41aniJdei6LhNBUXzMgLiwt1WN4V3z/j5NWC1ge3BoPMwaiwkgOiadKSgTtqkw4l/nl2U4
	BPbY2d8drBGl3sSAGc8kG1YW5tilxxQQvVMq/o2yRo6w7DirHy7I4FE9R4ZVggsJTLqSZxPgLiTqp
	YkXcYkwJ+HpCQhTvFq9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTSO-00000008eat-1vd0;
	Fri, 21 Nov 2025 15:53:56 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTSL-00000008eZk-1PSE
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 15:53:54 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F0656210B7;
	Fri, 21 Nov 2025 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763740431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NZ4fMvYN09XV3DpCLtI4Q6IQM3b2RzHinbyel8yt7oE=;
	b=SvHuPvJ1qVFh4N7vqUZR6Vqe6XD2GAtLliOSLQJw2rEc/wZIv8u4tyqsotgBVI5uLhXqIp
	6/YsJ2jjESWyO6n4PgCxpYK8hGJN624afaODcxozWXLIwxrt9kDQfl5oNx95AClQp12LAg
	4rez778JRfx/F+7BTjy5dBih314U3e8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763740431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NZ4fMvYN09XV3DpCLtI4Q6IQM3b2RzHinbyel8yt7oE=;
	b=TGM4PY6IO5/5Kf4+ELC7PJ+a/shhsrgHvQbR9Q4HOGHhJqeTZ2ZMAnmJiumYdXqh+PWOhe
	2ka0uDIuigQpQnDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="l/gDYfrD";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="G4QprW/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763740429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NZ4fMvYN09XV3DpCLtI4Q6IQM3b2RzHinbyel8yt7oE=;
	b=l/gDYfrDXgeDbB4fL7Qcnf/JDYWOxIHEkYjXKVVeSrDAea8L2qkR8RL7RJbBpjEZsDKw/A
	RDrF3z2NVgRA06TIqBIdE+j861sjCM0o61oUPOYREGxqbg5c0KCnb85JEzZRTNi7prim4p
	GL9HUDt3+urp78EzRLjqYn7Vq1ylido=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763740429;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NZ4fMvYN09XV3DpCLtI4Q6IQM3b2RzHinbyel8yt7oE=;
	b=G4QprW/hSJfX8bBwPUtlzi4YuwS3d5rUVuNBab8NOAPT/6kmn6uHNaqcfFLUXtdltnNWUZ
	cOLzPAspcfqoF4BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8BEC93EA61;
	Fri, 21 Nov 2025 15:53:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vYq5IA2LIGniaAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Nov 2025 15:53:49 +0000
Message-ID: <199e7538-5b4a-483b-8976-84e4a8a0f2fd@suse.de>
Date: Fri, 21 Nov 2025 16:53:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arch, sysfb: Move screen and edid info into single
 place
To: Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20251121135624.494768-1-tzimmermann@suse.de>
 <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
 <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
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
In-Reply-To: <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
X-Rspamd-Queue-Id: F0656210B7
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,arndb.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_075353_706988_062DB0BA 
X-CRM114-Status: GOOD (  10.98  )
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

SGkKCkFtIDIxLjExLjI1IHVtIDE2OjE2IHNjaHJpZWIgQXJkIEJpZXNoZXV2ZWw6Cj4gT24gRnJp
LCAyMSBOb3YgMjAyNSBhdCAxNjoxMCwgQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3Jv
dGU6Cj4+IE9uIEZyaSwgTm92IDIxLCAyMDI1LCBhdCAxNDozNiwgVGhvbWFzIFppbW1lcm1hbm4g
d3JvdGU6Cj4+PiBSZXBsYWNlIHNjcmVlbl9pbmZvIGFuZCBlZGlkX2luZm8gd2l0aCBzeXNmYl9w
cmltYXJ5X2RldmljZSBvZiB0eXBlCj4+PiBzdHJ1Y3Qgc3lzZmJfZGlzcGxheV9pbmZvLiBVcGRh
dGUgYWxsIHVzZXJzLgo+Pj4KPj4+IFN5c2ZiIERSTSBkcml2ZXJzIGN1cnJlbnRseSBmZXRjaCB0
aGUgZ2xvYmFsIGVkaWRfaW5mbyBkaXJlY3RseSwgd2hlbgo+Pj4gdGhleSBzaG91bGQgZ2V0IHRo
YXQgaW5mb3JtYXRpb24gdG9nZXRoZXIgd2l0aCB0aGUgc2NyZWVuX2luZm8gZnJvbSB0aGVpcgo+
Pj4gZGV2aWNlLiBXcmFwcGluZyBzY3JlZW5faW5mbyBhbmQgZWRpZF9pbmZvIGluIHN5c2ZiX3By
aW1hcnlfZGlzcGxheSBhbmQKPj4+IHBhc3NpbmcgdGhpcyB0byBkcml2ZXJzIGVuYWJsZXMgdGhp
cy4KPj4+Cj4+PiBSZXBsYWNpbmcgYm90aCB3aXRoIHN5c2ZiX3ByaW1hcnlfZGlzcGxheSBoYXMg
YmVlbiBtb3RpdmF0ZSBieSB0aGUgRUZJCj4+PiBzdHViLiBFRkkgd2FudHMgdG8gdHJhbnNmZXIg
RURJRCB2aWEgY29uZmlnIHRhYmxlIGluIGEgc2luZ2xlIGVudHJ5Lgo+Pj4gVXNpbmcgc3RydWN0
IHN5c2ZiX2Rpc3BsYXlfaW5mbyB0aGlzIHdpbGwgYmVjb21lIGVhc2lseSBwb3NzaWJsZS4gSGVu
Y2UKPj4+IGFjY2VwdCBzb21lIGNodXJuIGluIGFyY2hpdGVjdHVyZSBjb2RlIGZvciB0aGUgbG9u
Zy10ZXJtIGltcHJvdmVtZW50cy4KPj4gVGhpcyBhbGwgbG9va3MgZ29vZCB0byBtZSwKPj4KPj4g
QWNrZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CgpUaGFua3MKCj4+Cj4+IEl0
IHNob3VsZCBhbHNvIGJyaW5nIHVzIG9uZSBzdGVwIGNsb3NlciB0byBldmVudHVhbGx5Cj4+IGRp
c2Nvbm5lY3RpbmcgdGhlIHg4NiBib290IEFCSSBmcm9tIHRoZSBrZXJuZWwtaW50ZXJuYWwKPj4g
c3lzZmJfcHJpbWFyeV9kaXNwbGF5Lgo+Pgo+IEFncmVlZAo+Cj4gQWNrZWQtYnk6IEFyZCBCaWVz
aGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+CgpUaGFua3MKCj4KPiBJIGNhbiB0YWtlIHBhdGNoZXMg
MS0yIHJpZ2h0IGF3YXksIGlmIHRoYXQgaGVscHMgZHVyaW5nIHRoZSBuZXh0IGN5Y2xlLgoKIEZy
b20gbXkgc3lzZmItZm9jdXNlZCBQT1YsIHRoZXNlIHBhdGNoZXMgd291bGQgaWRlYWxseSBhbGwg
Z28gdGhyb3VnaCAKdGhlIHNhbWUgdHJlZSwgc2F5IGVmaSBvciBnZW5lcmljIGFyY2gsIG9yIHdo
YXRldmVyIGZpdHMgYmVzdC4gTW9zdCBvZiAKdGhlIG90aGVyIGNvZGUgaXMgb25seSByZW5hbWVz
IGFueXdheS4KCkJlc3QgcmVnYXJkcwpUaG9tYXMKCgotLSAKLS0KVGhvbWFzIFppbW1lcm1hbm4K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgKRnJhbmtlbnN0ci4gMTQ2LCA5MDQ2MSBOw7xybmJlcmcsIEdlcm1hbnksIHd3dy5zdXNl
LmNvbQpHRjogSm9jaGVuIEphc2VyLCBBbmRyZXcgTWNEb25hbGQsIFdlcm5lciBLbm9ibGljaCwg
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
