Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2876D3942D
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKrAuDYHvjn/y6WYNVcLm7QG33SqwyepdFfmIoNzOc4=; b=vRQgFazZqu22bw
	HuoG7pn8ESZeuttn3Lh7NtVkP8OzNA/LknVnTEa4RZsdXazzfP17Y5wnGQalbs7CmJjP1xe+6K/8S
	DzFl88mWRfbRlglnzCey4ozrfbsAi59ll+yF3YkXctw7pmOx9WTG8PtBvtYRVa8YRdzprAfzdxPG4
	3Qftl9tjJVzG07ILspHwjTd36553OER1bKPpJutx56vLGWYdTCn0sV0JwtYNDQVtFyO/GP9Zq63jo
	t22xGakvz86BgvRd3MYJdTsbC01ht0+ZZc/E8WuoxzopZJSwwye7oxBT+JYbg4wFhYMPzlw3Z8Cmp
	hQ2sPRrlI3Aha2LknbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ikw-00000000Fo4-3eIU;
	Thu, 02 Apr 2026 14:10:46 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ikt-00000000Fn3-33qa
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 14:10:45 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C9A994D34D;
	Thu,  2 Apr 2026 14:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775139041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ATIJ2JvCqHvnjxC2zyn8h0bvReSf5DUv55srIKdqy/4=;
	b=ghmTCk2lxbNH98lYvz6tJH1dU3F3OuYSLO4M53l2lcvJjYjE9T+DydC+s7tDr0jsLsFz8a
	6JBS04HYJcWpK7ShUP3ZXyXt0SvnEQOzCyINVRi7RMOQH/p2mmD0V89ks5MZ91hVHIy6sr
	dKnnxR/gk5tFxNMkKRY+2YfECcgSd4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775139041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ATIJ2JvCqHvnjxC2zyn8h0bvReSf5DUv55srIKdqy/4=;
	b=AdSg+hiNNCy/NCHR9ueIRcJIk0qYOYToQKtIbfNFJX05e3E4ijc4tznQTYASBbTyTjZCp2
	mV3qUgSp+3LOOqBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ghmTCk2l;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AdSg+hiN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775139041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ATIJ2JvCqHvnjxC2zyn8h0bvReSf5DUv55srIKdqy/4=;
	b=ghmTCk2lxbNH98lYvz6tJH1dU3F3OuYSLO4M53l2lcvJjYjE9T+DydC+s7tDr0jsLsFz8a
	6JBS04HYJcWpK7ShUP3ZXyXt0SvnEQOzCyINVRi7RMOQH/p2mmD0V89ks5MZ91hVHIy6sr
	dKnnxR/gk5tFxNMkKRY+2YfECcgSd4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775139041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ATIJ2JvCqHvnjxC2zyn8h0bvReSf5DUv55srIKdqy/4=;
	b=AdSg+hiNNCy/NCHR9ueIRcJIk0qYOYToQKtIbfNFJX05e3E4ijc4tznQTYASBbTyTjZCp2
	mV3qUgSp+3LOOqBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 31D374A0B0;
	Thu,  2 Apr 2026 14:10:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7zb4CuF4zmlFBgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 02 Apr 2026 14:10:41 +0000
Message-ID: <3e466158-c2e5-4e23-934f-dcdbb71ad41f@suse.de>
Date: Thu, 2 Apr 2026 16:10:40 +0200
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
In-Reply-To: <78f76717-8f1e-41d6-92f7-261df96b84b6@app.fastmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[arndb.de,redhat.com,kernel.org,linaro.org,xen0n.name,linux.intel.com,gmail.com,ffwll.ch,microsoft.com,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[23];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: C9A994D34D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_071044_056956_D06CF496 
X-CRM114-Status: GOOD (  18.59  )
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

SGkKCkFtIDAyLjA0LjI2IHVtIDE1OjA4IHNjaHJpZWIgQXJuZCBCZXJnbWFubjoKPiBPbiBUaHUs
IEFwciAyLCAyMDI2LCBhdCAxMTowOSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4+IEFkZCBh
IGRlc2NyaXB0aXZlIHN0cmluZyBhbmQgaGVscCB0ZXh0IHRvIENPTkZJR19TWVNGQiwgc28gdGhh
dCB1c2Vycwo+PiBjYW4gbW9kaWZ5IGl0LiBGbGlwIGFsbCBpbXBsaWNpdCBzZWxlY3RzIGluIHRo
ZSBLY29uZmlnIG9wdGlvbnMgaW50bwo+PiBkZXBlbmRlbmNpZXMuIFRoaXMgYXZvaWRzIGN5Y2xp
YyBkZXBlbmRlbmNpZXMgaW4gdGhlIGNvbmZpZy4KPj4KPj4gRW5hYmxpbmcgQ09ORklHX1NZU0ZC
IG1ha2VzIHRoZSBrZXJuZWwgcHJvdmlkZSBhIGRldmljZSBmb3IgdGhlIGZpcm13YXJlCj4+IGZy
YW1lYnVmZmVyLiBBcyB0aGlzIGNhbiAoc2xpZ2h0bHkpIGFmZmVjdCBzeXN0ZW0gYmVoYXZpb3Is
IGhhdmluZyBhCj4+IHVzZXItZmFjaW5nIG9wdGlvbiBzZWVtcyBwcmVmZXJhYmxlLiBTb21lIHVz
ZXJzIG1pZ2h0IGFsc28gd2FudCB0byBzZXQKPj4gZXZlcnkgZGV0YWlsIG9mIHRoZWlyIGtlcm5l
bCBjb25maWcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPgo+IEkgZG9uJ3QgcmVhbGx5IGxpa2UgdGhpcyBwYXJ0IG9mIHRoZSBzZXJp
ZXMgYW5kIHdvdWxkIHByZWZlcgo+IHRvIGtlZXAgQ09ORklHX1NZU0ZCIGhpZGRlbiBhcyBtdWNo
IGFzIHBvc3NpYmxlIGFzIGFuIHg4Ngo+IChhbmQgRUZJKSBzcGVjaWZpYyBpbXBsZW1lbnRhdGlv
biBkZXRhaWwsIHdpdGggdGhlIGhvcGUKPiBvZiBldmVudHVhbGx5IHNlcGVyYXRpbmcgb3V0IHRo
ZSB4ODYgYml0cyBmcm9tIHRoZSBFRkkgb25lcy4KCllvdSBtZWFuLCB5b3Ugd2FudCB0byB1c2Ug
dGhlIEVGSS1wcm92aWRlZCBmcmFtZWJ1ZmZlcnMgd2l0aG91dCB0aGUgCmludGVybWVkaWF0ZSBz
dGVwIG9mIGdvaW5nIHRocm91Z2ggc3lzZmJfcHJpbWFyeV9kaXNwbGF5PwoKSW4gdGhhdCBjYXNl
LCBDT05GSUdfU1lTRkIgd291bGQgYmVjb21lIGFuIHg4Ni1pbnRlcm5hbCB0aGluZywgcmlnaHQ/
Cgo+Cj4gSW4gZ2VuZXJhbCwgSSBhbSBhbHdheXMgaW4gZmF2b3Igb2YgcHJvcGVybHkgdXNpbmcg
S2NvbmZpZwo+IGRlcGVuZGVuY2llcyBvdmVyICdzZWxlY3QnIHN0YXRlbWVudHMsIGZvciB0aGUg
c2FtZSByZWFzb25zCj4geW91IGRlc2NyaWJlLCBidXQgSSBkb24ndCB3YW50IHRoZSB0aGUgeDg2
IGxvZ2ljIGZvcgo+IHRoZSBsZWdhY3kgVkVTQSBhbmQgVkdBIGNvbnNvbGUgaGFuZGxpbmcgdG8g
bGVhayBpbnRvIG1vcmUKPiBhcmNoaXRlY3R1cmVzIHRoYW4gbmVjZXNzYXJ5Lgo+Cj4gRG8geW91
IHRoaW5rIHdlIGNvdWxkIGluc3RlYWQgbW92ZSB0aGUgc3lzZmJfaW5pdCgpCj4gZnVuY3Rpb24g
aW50byB0aGUgc2FtZSB0d28gcGxhY2VzIHRoYXQgY29udGFpbiB0aGUKPiBzeXNmYl9wcmltYXJ5
X2Rpc3BsYXkgZGVmaW5pdGlvbiAoYXJjaC94ODYva2VybmVsL3NldHVwLmMsCj4gZHJpdmVycy9m
aXJtd2FyZS9lZmkvZWZpLWluaXQuYykgYW5kIHNpbXBsaWZ5IHRoZSBlZmkgdmVyc2lvbgo+IHRv
IHRha2Ugb3V0IHRoZSB4ODYgYml0cz8gVGhhdCB3b3VsZCByZWR1Y2UgdGhlIHJlc3QKPiBvZiBz
eXNmYi1wcmltYXJ5LmMgdG8gdGhlIGxvZ2ljIHRvIHVucmVnaXN0ZXIgdGhlIGRldmljZSwKPiBh
bmQgdGhhdCBjb3VsZCB0aGVuIGJlIHNlbGVjdGVkIGJ5IGJvdGggeDg2IGFuZCBFRkkuCgpObywg
SSdtIG1vcmUgdGhhbiBoYXBweSB0aGF0IHN5c2ZiIGZpbmFsbHkgY29uc29saWRhdGVzIGFsbCB0
aGUgCmluaXQtZnJhbWVidWZmZXIgc2V0dXAgYW5kIGRldGVjdGlvbiB0aGF0IGZsb2F0ZWQgYXJv
dW5kIGluIHRoZSBrZXJuZWwuIApJIHdvdWxkIG5vdCB3YW50IGl0IHRvIGJlIGR1cGxpY2F0ZWQg
YWdhaW4uCgpGb3Igbm93LCB3ZSBjb3VsZCBjZXJ0YWlubHkga2VlcCBDT05GSUdfU1lTRkIgaGlk
ZGVuIGFuZCBhdXRvc2VsZWN0ZWQuIApBbHRob3VnaCBJIHRoaW5rIHRoaXMgd2lsbCByZXF1aXJl
IHNvZW0gc29ydCBvZiBzb2x1dGlvbiBhdCBhIGxhdGVyIHBvaW50LgoKQmVzdCByZWdhcmRzClRo
b21hcwoKPgo+ICAgICAgICBBcm5kCgotLSAKLS0KVGhvbWFzIFppbW1lcm1hbm4KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKRnJh
bmtlbnN0ci4gMTQ2LCA5MDQ2MSBOw7xybmJlcmcsIEdlcm1hbnksIHd3dy5zdXNlLmNvbQpHRjog
Sm9jaGVuIEphc2VyLCBBbmRyZXcgTWNEb25hbGQsIFdlcm5lciBLbm9ibGljaCwgKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
