Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11567CFC28F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 16:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OA/59IimsnyiJNZzUfLFqpJdkuSFq3lt6qswegQfbE=; b=HZ5JBLasoY35hH
	4tr2ORghx5MPLi2mt3DXHyDbrtdRU/wy+da+n0ow44y7JDS0YDsQDYx8C4CK7LQBKMF3lSfo2OZ0o
	6gGuoDBe5p2mqVDkWO3DFGy7zMQdjhTqIF15i7a2ESVsJFNmh0fIhEbQDpPrlZXGPVCiWH2e+Y2f/
	nKS5eTbG4dEAo3ynZTgzETR+KM2E9Ddj5mNlVSjHnvTjuxNED94u7TW8SMLR6VHdHY2rGxCfSvDZs
	AAYB92yULNCF9iJUwx/o7sDksG60NI9cdCCokq27pjPSeo2O82+/uQLPyogL+Gcg0Z4/B9p6JF3v3
	4pVTXbU/ie0mberOa8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMThn-00000008gky-30W0;
	Fri, 21 Nov 2025 16:09:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMThm-00000008gk1-0j55
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Nov 2025 16:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YWF5Gqatpe7uXgDZfnlzgBYpZAL3G71iq33Vz3XKzbk=; b=ovrK5BOmyNZ1Cmmch1LntAbmui
	XAP+a0rZUZCNZvvuKiLusK7cNcQVpEgAWghUxq9N8EMXtzF6BdL1zMGDFX45stPvnfStciBtQjE6S
	KK5X++A86WHJE3Ak8Mi50Qir6Me4mzEE/0YrHMFMr1+ty5KRv1S8ol1vDHZct1JSAHh7ha/3znX1K
	BZd5IhBfLHULn8uzDJLjTlvuJWW8aQIKEOmOpppclNyd9vg+l1zKgkadz5c2Ed1CzAtD2qdLxM6M1
	NvYMg1r076Bp11qRBaoJCbD5SeYjZmx5B6imFMGugAj9i8nB39OkZ6T0IySPIY1XW7iaOaZmqi908
	MnEdC4TQ==;
Received: from smtp-out1.suse.de ([195.135.223.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSq6-0000000HBV0-2JtW
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 15:14:24 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D08F4219AE;
	Fri, 21 Nov 2025 16:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763741385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YWF5Gqatpe7uXgDZfnlzgBYpZAL3G71iq33Vz3XKzbk=;
	b=VYk3CIpZTuX3vC5TLhYm7CYkRrmnrSCwY8lrHsDWQ4LPmIlsI44hqqxjELFq0r+hpW8EPQ
	sMstgqzW05MRPZCaNMu+1IBShDsRVLPLdVWNi78Y9Ee2twWwpac4OgGIJYngt7Zj3qVaKe
	eRzMnyK1Qfnq/sOsnIQo6hw6OvVkRFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763741385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YWF5Gqatpe7uXgDZfnlzgBYpZAL3G71iq33Vz3XKzbk=;
	b=cNwt4uiJyZBwJoZYAwuqnBfkFXTvQzVZ6uOUWIJRS0CNcypP11CVK9xOLYIkJUUgi9pl1S
	71F/bY5Xp7+WykAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WVgwDCAu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DFkkUfmI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763741384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YWF5Gqatpe7uXgDZfnlzgBYpZAL3G71iq33Vz3XKzbk=;
	b=WVgwDCAulE/giH64FnewbOfb7fwtv1PZeOWZ6FGNhUoYWSp0oodMAp/vUWZzUUmpXqdzNv
	qc+L0PJV28pPXHs/3w/mV0rsm6qgy6xH71zcgys9R3b5D0Hxz9ZC65Thn2JL4B/t16Q/9O
	YdzaNJWmjlbjEU3WygBUd1ydujN37gM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763741384;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YWF5Gqatpe7uXgDZfnlzgBYpZAL3G71iq33Vz3XKzbk=;
	b=DFkkUfmI85+frvQ3XZvNYr5FZLZo6nTmEI8OjOWa1xDFKlwd0Zasc/ZVcqCiFIPv2mCu2F
	pVq66XnyZa/uG4Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B3A73EA61;
	Fri, 21 Nov 2025 16:09:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oC3CHMiOIGlneAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Nov 2025 16:09:44 +0000
Message-ID: <6dff8e7e-c99b-443d-a1d8-22650ca0b595@suse.de>
Date: Fri, 21 Nov 2025 17:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arch, sysfb: Move screen and edid info into single
 place
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20251121135624.494768-1-tzimmermann@suse.de>
 <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
 <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
 <199e7538-5b4a-483b-8976-84e4a8a0f2fd@suse.de>
 <CAMj1kXE+mS1Sm5GaROU0P97J2w1pew0P_To4sKiw8h1iOMuLcg@mail.gmail.com>
 <d080729c-6586-4b9c-b234-470977849d3d@suse.de>
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
In-Reply-To: <d080729c-6586-4b9c-b234-470977849d3d@suse.de>
X-Rspamd-Queue-Id: D08F4219AE
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,arndb.de:email,suse.de:email,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_151422_857419_B7E0E8E9 
X-CRM114-Status: GOOD (  12.24  )
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

CgpBbSAyMS4xMS4yNSB1bSAxNzowOCBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+IEhpCj4K
PiBBbSAyMS4xMS4yNSB1bSAxNjo1NiBzY2hyaWViIEFyZCBCaWVzaGV1dmVsOgo+PiBPbiBGcmks
IDIxIE5vdiAyMDI1IGF0IDE2OjUzLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4gCj4+IHdyb3RlOgo+Pj4gSGkKPj4+Cj4+PiBBbSAyMS4xMS4yNSB1bSAxNjoxNiBzY2hy
aWViIEFyZCBCaWVzaGV1dmVsOgo+Pj4+IE9uIEZyaSwgMjEgTm92IDIwMjUgYXQgMTY6MTAsIEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+Pj4+PiBPbiBGcmksIE5vdiAyMSwg
MjAyNSwgYXQgMTQ6MzYsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+Pj4+Pj4gUmVwbGFjZSBz
Y3JlZW5faW5mbyBhbmQgZWRpZF9pbmZvIHdpdGggc3lzZmJfcHJpbWFyeV9kZXZpY2Ugb2YgdHlw
ZQo+Pj4+Pj4gc3RydWN0IHN5c2ZiX2Rpc3BsYXlfaW5mby4gVXBkYXRlIGFsbCB1c2Vycy4KPj4+
Pj4+Cj4+Pj4+PiBTeXNmYiBEUk0gZHJpdmVycyBjdXJyZW50bHkgZmV0Y2ggdGhlIGdsb2JhbCBl
ZGlkX2luZm8gZGlyZWN0bHksIAo+Pj4+Pj4gd2hlbgo+Pj4+Pj4gdGhleSBzaG91bGQgZ2V0IHRo
YXQgaW5mb3JtYXRpb24gdG9nZXRoZXIgd2l0aCB0aGUgc2NyZWVuX2luZm8gCj4+Pj4+PiBmcm9t
IHRoZWlyCj4+Pj4+PiBkZXZpY2UuIFdyYXBwaW5nIHNjcmVlbl9pbmZvIGFuZCBlZGlkX2luZm8g
aW4gCj4+Pj4+PiBzeXNmYl9wcmltYXJ5X2Rpc3BsYXkgYW5kCj4+Pj4+PiBwYXNzaW5nIHRoaXMg
dG8gZHJpdmVycyBlbmFibGVzIHRoaXMuCj4+Pj4+Pgo+Pj4+Pj4gUmVwbGFjaW5nIGJvdGggd2l0
aCBzeXNmYl9wcmltYXJ5X2Rpc3BsYXkgaGFzIGJlZW4gbW90aXZhdGUgYnkgCj4+Pj4+PiB0aGUg
RUZJCj4+Pj4+PiBzdHViLiBFRkkgd2FudHMgdG8gdHJhbnNmZXIgRURJRCB2aWEgY29uZmlnIHRh
YmxlIGluIGEgc2luZ2xlIGVudHJ5Lgo+Pj4+Pj4gVXNpbmcgc3RydWN0IHN5c2ZiX2Rpc3BsYXlf
aW5mbyB0aGlzIHdpbGwgYmVjb21lIGVhc2lseSBwb3NzaWJsZS4gCj4+Pj4+PiBIZW5jZQo+Pj4+
Pj4gYWNjZXB0IHNvbWUgY2h1cm4gaW4gYXJjaGl0ZWN0dXJlIGNvZGUgZm9yIHRoZSBsb25nLXRl
cm0gCj4+Pj4+PiBpbXByb3ZlbWVudHMuCj4+Pj4+IFRoaXMgYWxsIGxvb2tzIGdvb2QgdG8gbWUs
Cj4+Pj4+Cj4+Pj4+IEFja2VkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Pj4g
VGhhbmtzCj4+Pgo+Pj4+PiBJdCBzaG91bGQgYWxzbyBicmluZyB1cyBvbmUgc3RlcCBjbG9zZXIg
dG8gZXZlbnR1YWxseQo+Pj4+PiBkaXNjb25uZWN0aW5nIHRoZSB4ODYgYm9vdCBBQkkgZnJvbSB0
aGUga2VybmVsLWludGVybmFsCj4+Pj4+IHN5c2ZiX3ByaW1hcnlfZGlzcGxheS4KPj4+Pj4KPj4+
PiBBZ3JlZWQKPj4+Pgo+Pj4+IEFja2VkLWJ5OiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwu
b3JnPgo+Pj4gVGhhbmtzCj4+Pgo+Pj4+IEkgY2FuIHRha2UgcGF0Y2hlcyAxLTIgcmlnaHQgYXdh
eSwgaWYgdGhhdCBoZWxwcyBkdXJpbmcgdGhlIG5leHQgCj4+Pj4gY3ljbGUuCj4+PiDCoCBGcm9t
IG15IHN5c2ZiLWZvY3VzZWQgUE9WLCB0aGVzZSBwYXRjaGVzIHdvdWxkIGlkZWFsbHkgYWxsIGdv
IHRocm91Z2gKPj4+IHRoZSBzYW1lIHRyZWUsIHNheSBlZmkgb3IgZ2VuZXJpYyBhcmNoLCBvciB3
aGF0ZXZlciBmaXRzIGJlc3QuIE1vc3Qgb2YKPj4+IHRoZSBvdGhlciBjb2RlIGlzIG9ubHkgcmVu
YW1lcyBhbnl3YXkuCj4+Pgo+PiBJIGRvbid0IG1pbmQgcXVldWVpbmcgYWxsIG9mIGl0LCBidXQg
SSBkaWQgZ2V0IGEgY29uZmxpY3Qgb24KPj4gZHJpdmVycy9wY2kvdmdhYXJiLmMKPgo+IFByb2Jh
Ymx5IGZyb20gYTc4ODM1Yjg2YTQ0ICgiUENJL1ZHQTogU2VsZWN0IFNDUkVFTl9JTkZPIG9uIFg4
NiIpCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTEwMTMyMjA4MjkuMTUzNjI5Mi0x
LXN1cGVybTFAa2VybmVsLm9yZy8KCgo+IMKgdGhhdCBJIGhhdmUgaW4gbXkgdHJlZS4gWW91IGNh
biBmaXggaXQgYnkgcmVwbGFjaW5nIHNjcmVlbl9pbmZvIHdpdGggCj4gc3lzZmJfcHJpbWFyeV9k
aXNwbGF5LnNjcmVlbi4gVGhlIGxhdGVyIG1lcmdlIGNvbmZsaWN0IHNlZW1zIG1hbmFnZWFibGUu
Cj4KPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPgo+CgotLSAKLS0KVGhvbWFzIFppbW1lcm1hbm4K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgKRnJhbmtlbnN0ci4gMTQ2LCA5MDQ2MSBOw7xybmJlcmcsIEdlcm1hbnksIHd3dy5zdXNl
LmNvbQpHRjogSm9jaGVuIEphc2VyLCBBbmRyZXcgTWNEb25hbGQsIFdlcm5lciBLbm9ibGljaCwg
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
