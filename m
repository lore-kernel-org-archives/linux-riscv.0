Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED5ACD13D3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVoy9ZT60ADrYTqMsuJMkeRiIIzqCzC47GRiXyQAu4s=; b=UbIliDmuJ0tLdh
	Svz99SY5ckUXTXhQFBybEs9KpnnTwFcRZJTNWdRWJu4eTV8dV73N9hXyoWZ+YsmSlOgOv/jfnKADg
	j5VjHtI3BUeuZyVHcUutfM/TgayymfaAScQuTycIxxLgk3JDD7O9qs69BAWbs6egzWQCByIa+3IRi
	a8YCKkrhiYuxiv9SeETR/H8PTC06Wg224r7abRFBHN7rJ/HdUftI6H/F/niUZmUVP1g2/1G/yOlzR
	6Ok4iOXak6pBfMyUNKihzH6HFhiWk4UHTwLy3d3+yoolKwLSiHOcpUyNKSrF37TFg9Vo/N4bcDuMp
	wKD3LdFDbiz1aQ+RtVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIKzh-00000004mIx-2lmw;
	Thu, 30 Apr 2026 06:35:29 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIKze-00000004mHd-36EI
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 06:35:28 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 88D5F5BD6E;
	Thu, 30 Apr 2026 06:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777530923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a0LF9opS/4b9B5ZY/UhjqVoZf/jyWF4njFUo2Jwl3Jg=;
	b=KQ61o7p4Lud8fy8AuyJ5fPImBAR44t1XUReUywn47MtP+OkBWooU6zMWYg2a05H5x0y3NC
	6fY5Tn8gBiUR1/lNx1u0PZlXoTtva2b+f+7s3VOcpya9eEgI4hZtOTi7jX06z9gO7k7ir2
	WwYgcnuWLl1f2yAwhRltkbP2DN/aZLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777530923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a0LF9opS/4b9B5ZY/UhjqVoZf/jyWF4njFUo2Jwl3Jg=;
	b=cZn5CA9fBiY9CgVLbVPBwOShViQOhEx7epHbKyV+WHvfSb3BQ8InkrR6ksK5FnBy1JzhkS
	1KQGwrECYhXZUCBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777530922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a0LF9opS/4b9B5ZY/UhjqVoZf/jyWF4njFUo2Jwl3Jg=;
	b=rNprQVbr58snlf0nWjdC8xT6swp9DU4zo9KAyEO5LBExhaa69LfzB9hC84Nm1zrXVcuYRy
	LGPzuNsQNnJawTf4y0r3zQbdvz7SE5YrSP1CBEBfn7BWMZ1jmreBEic6kSxYqz7xnGI+/c
	rOo92tNFNGal0oDaVdyKQywbgxVDFzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777530922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a0LF9opS/4b9B5ZY/UhjqVoZf/jyWF4njFUo2Jwl3Jg=;
	b=kmexgdeqeFSnoq8f26oKl38iMGX2IFk04AQ84o2Xy0n/o14JzuiefpBblXbVyyHDJ+AAvt
	eH/vEWwpLDqvV3BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E564F593B0;
	Thu, 30 Apr 2026 06:35:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v3YtNin48mlKFAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 30 Apr 2026 06:35:21 +0000
Message-ID: <fb6e2aa8-3636-407f-a3fc-846a80e34d7b@suse.de>
Date: Thu, 30 Apr 2026 08:35:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] firmware: sysfb: Consolidate config/code wrt.
 sysfb_primary_screen
To: patchwork-bot+linux-riscv@kernel.org
Cc: linux-riscv@lists.infradead.org, javierm@redhat.com, arnd@arndb.de,
 ardb@kernel.org, ilias.apalodimas@linaro.org, chenhuacai@kernel.org,
 kernel@xen0n.name, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, deller@gmx.de, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-efi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20260402092305.208728-1-tzimmermann@suse.de>
 <177751955329.2274119.12779807302343885295.git-patchwork-notify@kernel.org>
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
In-Reply-To: <177751955329.2274119.12779807302343885295.git-patchwork-notify@kernel.org>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[linux-riscv];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,redhat.com,arndb.de,kernel.org,linaro.org,xen0n.name,linux.intel.com,gmail.com,ffwll.ch,microsoft.com,gmx.de,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.com:url,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_233527_068653_6DB1A6F1 
X-CRM114-Status: GOOD (  11.94  )
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

SGkKCkFtIDMwLjA0LjI2IHVtIDA1OjI1IHNjaHJpZWIgcGF0Y2h3b3JrLWJvdCtsaW51eC1yaXNj
dkBrZXJuZWwub3JnOgo+IEhlbGxvOgo+Cj4gVGhpcyBzZXJpZXMgd2FzIGFwcGxpZWQgdG8gcmlz
Y3YvbGludXguZ2l0IChmaXhlcykKPiBieSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3Jn
PjoKClBhdGNoIDMgd2FzIGZhaXJseSBjb250cm92ZXJzaWFsLgoKQmVzdCByZWdhcmRzClRob21h
cwoKPgo+IE9uIFRodSwgIDIgQXByIDIwMjYgMTE6MDk6MTQgKzAyMDAgeW91IHdyb3RlOgo+PiBU
aGUgZ2xvYmFsIHN0YXRlIHN5c2ZiX3ByaW1hcnlfc2NyZWVuIGhvbGRzIGluZm9ybWF0aW9uIGFi
b3V0IHRoZQo+PiBmcmFtZWJ1ZmZlciBwcm92aWRlZCBieSBFRkkvQklPUyBzeXN0ZW1zLiBJdCBp
cyBwYXJ0IG9mIHRoZSBzeXNmYgo+PiBtb2R1bGUsIGJ1dCB1c2VkIGluIHNldmVyYWwgcGxhY2Vz
IHdpdGhvdXQgZGlyZWN0IGNvbm5lY3Rpb24gdG8KPj4gc3lzZmIuIEZpeCB0aGlzIGJ5IG1ha2lu
ZyB1c2VycyBvZiBzeXNmYl9wcmltYXJ5X3NjcmVlbiBkZXBlbmQgb24KPj4gQ09ORklHX1NZU0ZC
LiBGaXggYSBmZXcgaXNzdWVzIGluIHRoZSBwcm9jZXNzLgo+Pgo+PiBQYXRjaGVzIDEgYW5kIDIg
Zml4IGdlbmVyYWwgZXJyb3JzIGluIHRoZSBLY29uZmlnIHJ1bGVzLiBJbiBhbnkgY2FzZSwKPj4g
dGhlc2UgcGF0Y2hlcyBzaG91bGQgYmUgY29uc2lkZXJlZCBldmVuIHdpdGhvdXQgdGhlIHJlc3Qg
b2YgdGhlIHNlcmllcy4KPj4KPj4gWy4uLl0KPiBIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlu
a3M6Cj4gICAgLSBbMS84XSBodjogU2VsZWN0IENPTkZJR19TWVNGQiBvbmx5IGZvciBDT05GSUdf
SFlQRVJWX1ZNQlVTCj4gICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvZDMzZGI5
NTZjOTYxCj4gICAgLSBbMi84XSBmaXJtd2FyZTogZWZpOiBOZXZlciBkZWNsYXJlIHN5c2ZiX3By
aW1hcnlfZGlzcGxheSBvbiB4ODYKPiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3Yv
Yy81MjQxYzJjYTMzYmIKPiAgICAtIFszLzhdIGZpcm13YXJlOiBzeXNmYjogTWFrZSBDT05GSUdf
U1lTRkIgYSB1c2VyLXNlbGVjdGFibGUgb3B0aW9uCj4gICAgICAobm8gbWF0Y2hpbmcgY29tbWl0
KQo+ICAgIC0gWzQvOF0gZmlybXdhcmU6IHN5c2ZiOiBTcGxpdCBzeXNmYi5jIGludG8gc3lzZmJf
cHJpbWFyeS5jIGFuZCBzeXNmYl9wY2kuYwo+ICAgICAgKG5vIG1hdGNoaW5nIGNvbW1pdCkKPiAg
ICAtIFs1LzhdIGZpcm13YXJlOiBzeXNmYjogSW1wbGVtZW50IHNjcmVlbl9pbmZvIHJlbG9jYXRp
b24gZm9yIHByaW1hcnkgZGlzcGxheQo+ICAgICAgKG5vIG1hdGNoaW5nIGNvbW1pdCkKPiAgICAt
IFs2LzhdIGZpcm13YXJlOiBzeXNmYjogQXZvaWQgZm9yd2FyZC1kZWNsYXJpbmcgc3lzZmJfcGFy
ZW50X2RldigpCj4gICAgICAobm8gbWF0Y2hpbmcgY29tbWl0KQo+ICAgIC0gWzcvOF0gZmlybXdh
cmU6IGVmaTogTWFrZSBDT05GSUdfRUZJX0VBUkxZQ09OIGRlcGVuZCBvbiBDT05GSUdfU1lTRkI7
IGNsZWFuIHVwCj4gICAgICAobm8gbWF0Y2hpbmcgY29tbWl0KQo+ICAgIC0gWzgvOF0gZmlybXdh
cmU6IHN5c2ZiOiBNb3ZlIENPTkZJR19GSVJNV0FSRV9FRElEIHRvIGZpcm13YXJlIG9wdGlvbnMK
PiAgICAgIChubyBtYXRjaGluZyBjb21taXQpCj4KPiBZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlv
dSEKCi0tIAotLQpUaG9tYXMgWmltbWVybWFubgpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApGcmFua2Vuc3RyLiAxNDYsIDkwNDYx
IE7DvHJuYmVyZywgR2VybWFueSwgd3d3LnN1c2UuY29tCkdGOiBKb2NoZW4gSmFzZXIsIEFuZHJl
dyBNY0RvbmFsZCwgV2VybmVyIEtub2JsaWNoLCAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
