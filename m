Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E235CFC294
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPflpOYt4fC119qrfjJaGXTiPAN03t1D1fcHiezEOcI=; b=HSyMOwbPVAGLH+
	m0C1Dj345tugLBVbL4It1KIWzKv9w5xm5QKWyCffSWKeimDjx4OAS1eQP7qwEmRcpIltlvyU401AI
	r71bbkwt3yqHFO1KCrTDHIu7FyVnItS1UGklQo7uE481xmzGGV0M9/H2wiN9D9GmiTgd/tAlJD4A9
	YCVwIMTOWqbYJdTf7pWns1d5q1T+1al95YqNHC9CqNgiSmGh8AjTES0Wzf3/lHyJlfTb5Qs5s4puj
	UkpZl12Wndme078Kx0TdF2P2ZgcYBXBVMCwYRtFz+wQDuIgZcIzQlrge7J9dcO/MpyCxxa6FOypCb
	bKPdg8++L1FjjiSqx9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTxw-00000008i7x-0yyT;
	Fri, 21 Nov 2025 16:26:32 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTxY-00000008i55-0Fcs
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 16:26:31 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 787425BCC3;
	Fri, 21 Nov 2025 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763742366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2EbQbMBVh+wtPe2xKxStWSFqDMGQxv4HinVXPej2xOg=;
	b=e3xa/MVuw2mTa15pphIIiW3Fo7ayZEAeOTwDRCYR+LSYpJRosugF3q8BfYZsKiIeylcIKN
	YIYoyBuposxE+4Rr1Ce+L4ACEOKq+vf77cEx7yYM/ws7Z+bMZl0KxfmusjiCcEWmaVBZcz
	20pSRFRcmE31f9WhvQ7MpDYL7bY2Snw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763742366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2EbQbMBVh+wtPe2xKxStWSFqDMGQxv4HinVXPej2xOg=;
	b=6iaW69cVy6XAOoi/21AmFXwZp5jxrwUMBQUI59lgt1PS9XOI1mtWjrvhU9z5hhbcc+K3tV
	/iuFckSa5kxqfoDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763742365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2EbQbMBVh+wtPe2xKxStWSFqDMGQxv4HinVXPej2xOg=;
	b=VV/AperTpowj2cQmB95YfLGIhbpQrsQdRUpH6FBgAa1qYMuAS6fMKFCPCqOaoIKYR5pSB4
	s6yuV4YEVNYreBx6rSo410SJITGRhO777f9G+Ep18SefHIXYGhrp2EVLCJPMUAQB58tYIt
	0Jx4ZrMAj5vAxEIoUWzrP4mvhqCnn1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763742365;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2EbQbMBVh+wtPe2xKxStWSFqDMGQxv4HinVXPej2xOg=;
	b=+DorV6SINtIaTNa/HgRma0Y9SsO2x1mw1lziFfqwcAn1sqMO59qo7Cirv+ZBnP7ohtLy2P
	CM9XZ8kP0TEKzvBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B7E63EA61;
	Fri, 21 Nov 2025 16:26:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0FlbBZ2SIGnICQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Nov 2025 16:26:05 +0000
Message-ID: <8d0bc096-e346-462b-a274-f0cc1456eea3@suse.de>
Date: Fri, 21 Nov 2025 17:26:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arch, sysfb: Move screen and edid info into single
 place
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
 <6dff8e7e-c99b-443d-a1d8-22650ca0b595@suse.de>
 <CAMj1kXGpC_162bFL65kQw=7qVP7ezYw77Q76y217dDs8pqHogw@mail.gmail.com>
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
In-Reply-To: <CAMj1kXGpC_162bFL65kQw=7qVP7ezYw77Q76y217dDs8pqHogw@mail.gmail.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,arndb.de:email,suse.com:url,suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_082608_399664_4B396C96 
X-CRM114-Status: GOOD (  15.16  )
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

SGkKCkFtIDIxLjExLjI1IHVtIDE3OjE5IHNjaHJpZWIgQXJkIEJpZXNoZXV2ZWw6Cj4gT24gRnJp
LCAyMSBOb3YgMjAyNSBhdCAxNzowOSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+IHdyb3RlOgo+Pgo+Pgo+PiBBbSAyMS4xMS4yNSB1bSAxNzowOCBzY2hyaWViIFRob21h
cyBaaW1tZXJtYW5uOgo+Pj4gSGkKPj4+Cj4+PiBBbSAyMS4xMS4yNSB1bSAxNjo1NiBzY2hyaWVi
IEFyZCBCaWVzaGV1dmVsOgo+Pj4+IE9uIEZyaSwgMjEgTm92IDIwMjUgYXQgMTY6NTMsIFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+Pj4+IHdyb3RlOgo+Pj4+PiBIaQo+
Pj4+Pgo+Pj4+PiBBbSAyMS4xMS4yNSB1bSAxNjoxNiBzY2hyaWViIEFyZCBCaWVzaGV1dmVsOgo+
Pj4+Pj4gT24gRnJpLCAyMSBOb3YgMjAyNSBhdCAxNjoxMCwgQXJuZCBCZXJnbWFubiA8YXJuZEBh
cm5kYi5kZT4gd3JvdGU6Cj4+Pj4+Pj4gT24gRnJpLCBOb3YgMjEsIDIwMjUsIGF0IDE0OjM2LCBU
aG9tYXMgWmltbWVybWFubiB3cm90ZToKPj4+Pj4+Pj4gUmVwbGFjZSBzY3JlZW5faW5mbyBhbmQg
ZWRpZF9pbmZvIHdpdGggc3lzZmJfcHJpbWFyeV9kZXZpY2Ugb2YgdHlwZQo+Pj4+Pj4+PiBzdHJ1
Y3Qgc3lzZmJfZGlzcGxheV9pbmZvLiBVcGRhdGUgYWxsIHVzZXJzLgo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBTeXNmYiBEUk0gZHJpdmVycyBjdXJyZW50bHkgZmV0Y2ggdGhlIGdsb2JhbCBlZGlkX2luZm8g
ZGlyZWN0bHksCj4+Pj4+Pj4+IHdoZW4KPj4+Pj4+Pj4gdGhleSBzaG91bGQgZ2V0IHRoYXQgaW5m
b3JtYXRpb24gdG9nZXRoZXIgd2l0aCB0aGUgc2NyZWVuX2luZm8KPj4+Pj4+Pj4gZnJvbSB0aGVp
cgo+Pj4+Pj4+PiBkZXZpY2UuIFdyYXBwaW5nIHNjcmVlbl9pbmZvIGFuZCBlZGlkX2luZm8gaW4K
Pj4+Pj4+Pj4gc3lzZmJfcHJpbWFyeV9kaXNwbGF5IGFuZAo+Pj4+Pj4+PiBwYXNzaW5nIHRoaXMg
dG8gZHJpdmVycyBlbmFibGVzIHRoaXMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFJlcGxhY2luZyBib3Ro
IHdpdGggc3lzZmJfcHJpbWFyeV9kaXNwbGF5IGhhcyBiZWVuIG1vdGl2YXRlIGJ5Cj4+Pj4+Pj4+
IHRoZSBFRkkKPj4+Pj4+Pj4gc3R1Yi4gRUZJIHdhbnRzIHRvIHRyYW5zZmVyIEVESUQgdmlhIGNv
bmZpZyB0YWJsZSBpbiBhIHNpbmdsZSBlbnRyeS4KPj4+Pj4+Pj4gVXNpbmcgc3RydWN0IHN5c2Zi
X2Rpc3BsYXlfaW5mbyB0aGlzIHdpbGwgYmVjb21lIGVhc2lseSBwb3NzaWJsZS4KPj4+Pj4+Pj4g
SGVuY2UKPj4+Pj4+Pj4gYWNjZXB0IHNvbWUgY2h1cm4gaW4gYXJjaGl0ZWN0dXJlIGNvZGUgZm9y
IHRoZSBsb25nLXRlcm0KPj4+Pj4+Pj4gaW1wcm92ZW1lbnRzLgo+Pj4+Pj4+IFRoaXMgYWxsIGxv
b2tzIGdvb2QgdG8gbWUsCj4+Pj4+Pj4KPj4+Pj4+PiBBY2tlZC1ieTogQXJuZCBCZXJnbWFubiA8
YXJuZEBhcm5kYi5kZT4KPj4+Pj4gVGhhbmtzCj4+Pj4+Cj4+Pj4+Pj4gSXQgc2hvdWxkIGFsc28g
YnJpbmcgdXMgb25lIHN0ZXAgY2xvc2VyIHRvIGV2ZW50dWFsbHkKPj4+Pj4+PiBkaXNjb25uZWN0
aW5nIHRoZSB4ODYgYm9vdCBBQkkgZnJvbSB0aGUga2VybmVsLWludGVybmFsCj4+Pj4+Pj4gc3lz
ZmJfcHJpbWFyeV9kaXNwbGF5Lgo+Pj4+Pj4+Cj4+Pj4+PiBBZ3JlZWQKPj4+Pj4+Cj4+Pj4+PiBB
Y2tlZC1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KPj4+Pj4gVGhhbmtzCj4+
Pj4+Cj4+Pj4+PiBJIGNhbiB0YWtlIHBhdGNoZXMgMS0yIHJpZ2h0IGF3YXksIGlmIHRoYXQgaGVs
cHMgZHVyaW5nIHRoZSBuZXh0Cj4+Pj4+PiBjeWNsZS4KPj4+Pj4gICAgRnJvbSBteSBzeXNmYi1m
b2N1c2VkIFBPViwgdGhlc2UgcGF0Y2hlcyB3b3VsZCBpZGVhbGx5IGFsbCBnbyB0aHJvdWdoCj4+
Pj4+IHRoZSBzYW1lIHRyZWUsIHNheSBlZmkgb3IgZ2VuZXJpYyBhcmNoLCBvciB3aGF0ZXZlciBm
aXRzIGJlc3QuIE1vc3Qgb2YKPj4+Pj4gdGhlIG90aGVyIGNvZGUgaXMgb25seSByZW5hbWVzIGFu
eXdheS4KPj4+Pj4KPj4+PiBJIGRvbid0IG1pbmQgcXVldWVpbmcgYWxsIG9mIGl0LCBidXQgSSBk
aWQgZ2V0IGEgY29uZmxpY3Qgb24KPj4+PiBkcml2ZXJzL3BjaS92Z2FhcmIuYwo+Pj4gUHJvYmFi
bHkgZnJvbSBhNzg4MzViODZhNDQgKCJQQ0kvVkdBOiBTZWxlY3QgU0NSRUVOX0lORk8gb24gWDg2
IikKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMDEzMjIwODI5LjE1MzYyOTIt
MS1zdXBlcm0xQGtlcm5lbC5vcmcvCj4+Cj4gWWVzLCBpZiBJIG1lcmdlIGJhY2sgLXJjMiBmaXJz
dCwgSSBjYW4gYXBwbHkgcGF0Y2hlcyAxLTUgb250byBteQo+IGVmaS9uZXh0IHRyZWUuIEJ1dCB0
aGVuIEkgaGl0Cj4KPiBBcHBseWluZzogc3lzZmI6IE1vdmUgZWRpZF9pbmZvIGludG8gc3lzZmJf
cHJpbWFyeV9kaXNwbGF5Cj4gZXJyb3I6IHNoYTEgaW5mb3JtYXRpb24gaXMgbGFja2luZyBvciB1
c2VsZXNzIChkcml2ZXJzL2dwdS9kcm0vc3lzZmIvZWZpZHJtLmMpLgo+IGVycm9yOiBjb3VsZCBu
b3QgYnVpbGQgZmFrZSBhbmNlc3Rvcgo+IFBhdGNoIGZhaWxlZCBhdCAwMDA2IHN5c2ZiOiBNb3Zl
IGVkaWRfaW5mbyBpbnRvIHN5c2ZiX3ByaW1hcnlfZGlzcGxheQo+Cj4gSWYgeW91IHByZWZlciwg
eW91IGNhbiB0YWtlIHRoZSB3aG9sZSBsb3QgdmlhIHRoZSBzeXNmYiB0cmVlIGluc3RlYWQsCj4g
YXNzdW1pbmcgaXQgZG9lcyBub3QgZGVwZW5kIG9uIHRoZSBFRElEIGNoYW5nZXMgSSBhbHJlYWR5
IHF1ZXVlZCB1cD8KClN1cmUsIEkgY2FuIGFsc28gYWRkIGl0IHRvIHRoZSBkcm0tbWlzYyB0cmVl
LiBFVEEgaW4gdXBzdHJlYW0gd291bGQgYmUgCnY2LjIwLXJjMS4KCkJlc3QgcmVnYXJkcwpUaG9t
YXMKCgotLSAKLS0KVGhvbWFzIFppbW1lcm1hbm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKRnJhbmtlbnN0ci4gMTQ2LCA5MDQ2
MSBOw7xybmJlcmcsIEdlcm1hbnksIHd3dy5zdXNlLmNvbQpHRjogSm9jaGVuIEphc2VyLCBBbmRy
ZXcgTWNEb25hbGQsIFdlcm5lciBLbm9ibGljaCwgKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
