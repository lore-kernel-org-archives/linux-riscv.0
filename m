Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3385DCFC526
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Nov 2025 10:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jE3msNbMPpNXB6QexnsG5WCOOKNRrbkaYb/t695tdPI=; b=RMUoMcS/mkHGgx
	yHcaaCi/ZJq6BseRQAzXc0jBmx9yxnYzN8hhu1uwgtdLUJ0nAjUz0X5o5DlNeK2BbXU7t9K9gTEPF
	4L3DFOBtVxfbFmgwGhcoTewg8+OeYiwf+Xnq4kndAVWUGBz2CGssWQhp5Tl+eTUzDXbRQ/JgroFqb
	g+drEmEXYVzFpWMNiopI6yQC+kGYSy6N8GT7LDWxovh1e9rtZPj0kp8x3nVsnZhVhWqbzgGesTGmy
	XMq5kBtszYxpUIcTHvogZ6FO9PXmAikM1uaocN0cBPYJ7a+dq2p2ThMD+DlW1Asg6hEBDITr5dzhO
	jWSyO/F0Fb1UcBfyzsPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMlEK-00000009TGB-2SB5;
	Sat, 22 Nov 2025 10:52:36 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMlEH-00000009TFJ-0LO3
	for linux-riscv@lists.infradead.org;
	Sat, 22 Nov 2025 10:52:35 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E50FE21256;
	Sat, 22 Nov 2025 10:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763808750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Laiiiay7+G7aTYZZCvAkMaVrVoEya/eM5qsNMas60Tw=;
	b=keDw0EdDzAD600Zk+3hAsGixxHUyqG3sl9M9k3SD0u3bZsxBAO4VkHbyaID7ez3KF0suAo
	aRH0JwOLAwNwZGq7AgH9oPo6nxOkftap73Cwkm3vQRyUGI7nzkZWoYcP9gGIn7GeVaykMc
	agLGnoioM6WbQkAHNewYjHxH4BUkFjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763808750;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Laiiiay7+G7aTYZZCvAkMaVrVoEya/eM5qsNMas60Tw=;
	b=kZ1Pfx7gwbFjtvUlhEPm0x0sKg2YR84hpVeH329cVFqNpls46MbPxrr4JzScmTFPtkcGOe
	2m+M5sC75RfNBOBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hddlKNFX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DlECyqnc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763808749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Laiiiay7+G7aTYZZCvAkMaVrVoEya/eM5qsNMas60Tw=;
	b=hddlKNFXH1DPfWpyPOAPQ781tw3qwgaKXryhPR91Fl9LV/mhJ6g79ihgbDLLofuXFL7WU3
	lrGXXCqnVzUAHMJGwOMLYvbALiijjke5Wivkraf7UhgZJ0BsiX7OtpSGpxk71YVUSApAIZ
	nL25h6EQkGbCKYpLeRqjj4szhkAtKWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763808749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Laiiiay7+G7aTYZZCvAkMaVrVoEya/eM5qsNMas60Tw=;
	b=DlECyqncHMj29Uw+yiok5t/wpRQW9OC/IdNna3GJL2mfFM9HXR2TJBomcdzU0QZ64KeAO/
	62Q+n8E55Alb96BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8679E3EA61;
	Sat, 22 Nov 2025 10:52:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PARiH+2VIWl6fAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Sat, 22 Nov 2025 10:52:29 +0000
Message-ID: <4c716fd1-c989-4e48-9878-e7312fefc302@suse.de>
Date: Sat, 22 Nov 2025 11:52:29 +0100
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
 <8d0bc096-e346-462b-a274-f0cc1456eea3@suse.de>
 <CAMj1kXFdethf2sb1tm1V4wRW1SyPt-OnCmaAXc5cHNKuLJMXWA@mail.gmail.com>
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
In-Reply-To: <CAMj1kXFdethf2sb1tm1V4wRW1SyPt-OnCmaAXc5cHNKuLJMXWA@mail.gmail.com>
X-Rspamd-Queue-Id: E50FE21256
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email,suse.com:url];
	DKIM_TRACE(0.00)[suse.de:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_025233_402973_67FCAE00 
X-CRM114-Status: GOOD (  15.92  )
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

SGkKCkFtIDIxLjExLjI1IHVtIDE3OjMxIHNjaHJpZWIgQXJkIEJpZXNoZXV2ZWw6Cj4gT24gRnJp
LCAyMSBOb3YgMjAyNSBhdCAxNzoyNiwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+IHdyb3RlOgo+PiBIaQo+Pgo+PiBBbSAyMS4xMS4yNSB1bSAxNzoxOSBzY2hyaWViIEFy
ZCBCaWVzaGV1dmVsOgo+Pj4gT24gRnJpLCAyMSBOb3YgMjAyNSBhdCAxNzowOSwgVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+Pj4+Cj4+Pj4gQW0gMjEuMTEu
MjUgdW0gMTc6MDggc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPj4+Pj4gSGkKPj4+Pj4KPj4+
Pj4gQW0gMjEuMTEuMjUgdW0gMTY6NTYgc2NocmllYiBBcmQgQmllc2hldXZlbDoKPj4+Pj4+IE9u
IEZyaSwgMjEgTm92IDIwMjUgYXQgMTY6NTMsIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPgo+Pj4+Pj4gd3JvdGU6Cj4+Pj4+Pj4gSGkKPj4+Pj4+Pgo+Pj4+Pj4+IEFtIDIx
LjExLjI1IHVtIDE2OjE2IHNjaHJpZWIgQXJkIEJpZXNoZXV2ZWw6Cj4+Pj4+Pj4+IE9uIEZyaSwg
MjEgTm92IDIwMjUgYXQgMTY6MTAsIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdyb3Rl
Ogo+Pj4+Pj4+Pj4gT24gRnJpLCBOb3YgMjEsIDIwMjUsIGF0IDE0OjM2LCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToKPj4+Pj4+Pj4+PiBSZXBsYWNlIHNjcmVlbl9pbmZvIGFuZCBlZGlkX2luZm8g
d2l0aCBzeXNmYl9wcmltYXJ5X2RldmljZSBvZiB0eXBlCj4+Pj4+Pj4+Pj4gc3RydWN0IHN5c2Zi
X2Rpc3BsYXlfaW5mby4gVXBkYXRlIGFsbCB1c2Vycy4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFN5
c2ZiIERSTSBkcml2ZXJzIGN1cnJlbnRseSBmZXRjaCB0aGUgZ2xvYmFsIGVkaWRfaW5mbyBkaXJl
Y3RseSwKPj4+Pj4+Pj4+PiB3aGVuCj4+Pj4+Pj4+Pj4gdGhleSBzaG91bGQgZ2V0IHRoYXQgaW5m
b3JtYXRpb24gdG9nZXRoZXIgd2l0aCB0aGUgc2NyZWVuX2luZm8KPj4+Pj4+Pj4+PiBmcm9tIHRo
ZWlyCj4+Pj4+Pj4+Pj4gZGV2aWNlLiBXcmFwcGluZyBzY3JlZW5faW5mbyBhbmQgZWRpZF9pbmZv
IGluCj4+Pj4+Pj4+Pj4gc3lzZmJfcHJpbWFyeV9kaXNwbGF5IGFuZAo+Pj4+Pj4+Pj4+IHBhc3Np
bmcgdGhpcyB0byBkcml2ZXJzIGVuYWJsZXMgdGhpcy4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFJl
cGxhY2luZyBib3RoIHdpdGggc3lzZmJfcHJpbWFyeV9kaXNwbGF5IGhhcyBiZWVuIG1vdGl2YXRl
IGJ5Cj4+Pj4+Pj4+Pj4gdGhlIEVGSQo+Pj4+Pj4+Pj4+IHN0dWIuIEVGSSB3YW50cyB0byB0cmFu
c2ZlciBFRElEIHZpYSBjb25maWcgdGFibGUgaW4gYSBzaW5nbGUgZW50cnkuCj4+Pj4+Pj4+Pj4g
VXNpbmcgc3RydWN0IHN5c2ZiX2Rpc3BsYXlfaW5mbyB0aGlzIHdpbGwgYmVjb21lIGVhc2lseSBw
b3NzaWJsZS4KPj4+Pj4+Pj4+PiBIZW5jZQo+Pj4+Pj4+Pj4+IGFjY2VwdCBzb21lIGNodXJuIGlu
IGFyY2hpdGVjdHVyZSBjb2RlIGZvciB0aGUgbG9uZy10ZXJtCj4+Pj4+Pj4+Pj4gaW1wcm92ZW1l
bnRzLgo+Pj4+Pj4+Pj4gVGhpcyBhbGwgbG9va3MgZ29vZCB0byBtZSwKPj4+Pj4+Pj4+Cj4+Pj4+
Pj4+PiBBY2tlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4+Pj4+PiBUaGFu
a3MKPj4+Pj4+Pgo+Pj4+Pj4+Pj4gSXQgc2hvdWxkIGFsc28gYnJpbmcgdXMgb25lIHN0ZXAgY2xv
c2VyIHRvIGV2ZW50dWFsbHkKPj4+Pj4+Pj4+IGRpc2Nvbm5lY3RpbmcgdGhlIHg4NiBib290IEFC
SSBmcm9tIHRoZSBrZXJuZWwtaW50ZXJuYWwKPj4+Pj4+Pj4+IHN5c2ZiX3ByaW1hcnlfZGlzcGxh
eS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEFncmVlZAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBBY2tlZC1ieTog
QXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KPj4+Pj4+PiBUaGFua3MKPj4+Pj4+Pgo+
Pj4+Pj4+PiBJIGNhbiB0YWtlIHBhdGNoZXMgMS0yIHJpZ2h0IGF3YXksIGlmIHRoYXQgaGVscHMg
ZHVyaW5nIHRoZSBuZXh0Cj4+Pj4+Pj4+IGN5Y2xlLgo+Pj4+Pj4+ICAgICBGcm9tIG15IHN5c2Zi
LWZvY3VzZWQgUE9WLCB0aGVzZSBwYXRjaGVzIHdvdWxkIGlkZWFsbHkgYWxsIGdvIHRocm91Z2gK
Pj4+Pj4+PiB0aGUgc2FtZSB0cmVlLCBzYXkgZWZpIG9yIGdlbmVyaWMgYXJjaCwgb3Igd2hhdGV2
ZXIgZml0cyBiZXN0LiBNb3N0IG9mCj4+Pj4+Pj4gdGhlIG90aGVyIGNvZGUgaXMgb25seSByZW5h
bWVzIGFueXdheS4KPj4+Pj4+Pgo+Pj4+Pj4gSSBkb24ndCBtaW5kIHF1ZXVlaW5nIGFsbCBvZiBp
dCwgYnV0IEkgZGlkIGdldCBhIGNvbmZsaWN0IG9uCj4+Pj4+PiBkcml2ZXJzL3BjaS92Z2FhcmIu
Ywo+Pj4+PiBQcm9iYWJseSBmcm9tIGE3ODgzNWI4NmE0NCAoIlBDSS9WR0E6IFNlbGVjdCBTQ1JF
RU5fSU5GTyBvbiBYODYiKQo+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTAx
MzIyMDgyOS4xNTM2MjkyLTEtc3VwZXJtMUBrZXJuZWwub3JnLwo+Pj4+Cj4+PiBZZXMsIGlmIEkg
bWVyZ2UgYmFjayAtcmMyIGZpcnN0LCBJIGNhbiBhcHBseSBwYXRjaGVzIDEtNSBvbnRvIG15Cj4+
PiBlZmkvbmV4dCB0cmVlLiBCdXQgdGhlbiBJIGhpdAo+Pj4KPj4+IEFwcGx5aW5nOiBzeXNmYjog
TW92ZSBlZGlkX2luZm8gaW50byBzeXNmYl9wcmltYXJ5X2Rpc3BsYXkKPj4+IGVycm9yOiBzaGEx
IGluZm9ybWF0aW9uIGlzIGxhY2tpbmcgb3IgdXNlbGVzcyAoZHJpdmVycy9ncHUvZHJtL3N5c2Zi
L2VmaWRybS5jKS4KPj4+IGVycm9yOiBjb3VsZCBub3QgYnVpbGQgZmFrZSBhbmNlc3Rvcgo+Pj4g
UGF0Y2ggZmFpbGVkIGF0IDAwMDYgc3lzZmI6IE1vdmUgZWRpZF9pbmZvIGludG8gc3lzZmJfcHJp
bWFyeV9kaXNwbGF5Cj4+Pgo+Pj4gSWYgeW91IHByZWZlciwgeW91IGNhbiB0YWtlIHRoZSB3aG9s
ZSBsb3QgdmlhIHRoZSBzeXNmYiB0cmVlIGluc3RlYWQsCj4+PiBhc3N1bWluZyBpdCBkb2VzIG5v
dCBkZXBlbmQgb24gdGhlIEVESUQgY2hhbmdlcyBJIGFscmVhZHkgcXVldWVkIHVwPwo+PiBTdXJl
LCBJIGNhbiBhbHNvIGFkZCBpdCB0byB0aGUgZHJtLW1pc2MgdHJlZS4gRVRBIGluIHVwc3RyZWFt
IHdvdWxkIGJlCj4+IHY2LjIwLXJjMS4KPj4KPiBCdXQgZG9lcyB0aGF0IG1lYW4gdGhlIEVESUQg
ZmlybXdhcmUgb24gbm9uLXg4NiB3aWxsIGhhdmUgdG8gd2FpdCBmb3IKPiA2LjIxPyBJIHdhcyB0
cnlpbmcgdG8gYXZvaWQgbWFraW5nIHRoaXMgYSA2IG1vbnRoIGVmZm9ydC4KCk5vIHByb2JsZW0u
IFRoZW4gbGV0IG1lIHJlYmFzZSBvbnRvIGxpbnV4LW5leHQgYW5kIHB1dCB0aGUgZXhpc3Rpbmcg
RURJRCAKcGF0Y2hlcyBmb3IgRUZJIG9uIHRvcC4gSXQncyBtb3N0bHkgYWNrZWQgb3IgcmV2aWV3
ZWQgYWxyZWFkeS4gT25jZSB3ZSAKaGF2ZSBpdCBpbiBnb29kIHNoYXBlIHdlIGNhbiBtZXJnZWQg
aXQgYWxsIGF0IG9uY2UgdmlhIHRoZSBsaW51eC1lZmkgCnRyZWUuIERvZXMgdGhhdCB3b3JrIGZv
ciB5b3U/CgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgoKLS0gCi0tClRob21hcyBaaW1tZXJtYW5uCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJICkZyYW5rZW5zdHIuIDE0NiwgOTA0NjEgTsO8cm5iZXJnLCBHZXJtYW55LCB3d3cuc3VzZS5j
b20KR0Y6IEpvY2hlbiBKYXNlciwgQW5kcmV3IE1jRG9uYWxkLCBXZXJuZXIgS25vYmxpY2gsIChI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
