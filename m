Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4636CFC28F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 16:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ze/usWjwbKIyVUzU1ehKv1sO7o2KG66OnNLWahCOV78=; b=k2jEBt6qUczgrw
	kfGNo116hiZTaQaA4bNVyMyUUbW9fqLrR75nd/UGs29WXbAalaV4hts/Qq6V7youM4agbR9drOGCk
	J+S8kYid1UzW64L9DjO08cQ9UncZlS11kumtYf+HGAZ4cOa7zdqkn29xsFHu9AJxeRe1IVPDwYF0y
	PJEL1h33SmwlOGFXN7AnMls+KXp7ZzUWZtAGkXGxfNRWIDD6kq23WukKTXdb7V0qTs9rkAHJg8PLR
	yxwOtlvJirupJc1FxmPuqrrgyxvzyLI6lCuaarwHr5DnVHb180sw+97TJoUY8uKchuc/vQtZWjeyc
	RKQqKOVbuN8arvZI5aHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTgv-00000008gVi-3vaB;
	Fri, 21 Nov 2025 16:08:57 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTgt-00000008gUC-0btO
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 16:08:56 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 40CB2210B6;
	Fri, 21 Nov 2025 16:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763741333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gcxBLr3F/5lE8XqvZf0BdirjoLrn8mHqc5wXJOu33nM=;
	b=dQ/XolazWBsZXOTwxxFmnS6J2UfG5TZwyLm7Oc1CuywZ8NZb1aizpzpG4DKXOTl4N/QB/5
	kNuTjZ4Onugh8ZObLuNJTRhhbU4aE7w4wfKeFwmS8x7phnKUAa4gqmDEZFfYrNtPgoz5uu
	Isubfvu95R7fLyrxU7MqaYb4mwFauN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763741333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gcxBLr3F/5lE8XqvZf0BdirjoLrn8mHqc5wXJOu33nM=;
	b=ApVxltIeKG5SOQPJVMiBh5F+1cxWq6BN659Jeqi9RInOyHk4lD/Biv7c3jRggorEbf4yTy
	Y+LYVV3W99uTItBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763741333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gcxBLr3F/5lE8XqvZf0BdirjoLrn8mHqc5wXJOu33nM=;
	b=dQ/XolazWBsZXOTwxxFmnS6J2UfG5TZwyLm7Oc1CuywZ8NZb1aizpzpG4DKXOTl4N/QB/5
	kNuTjZ4Onugh8ZObLuNJTRhhbU4aE7w4wfKeFwmS8x7phnKUAa4gqmDEZFfYrNtPgoz5uu
	Isubfvu95R7fLyrxU7MqaYb4mwFauN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763741333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gcxBLr3F/5lE8XqvZf0BdirjoLrn8mHqc5wXJOu33nM=;
	b=ApVxltIeKG5SOQPJVMiBh5F+1cxWq6BN659Jeqi9RInOyHk4lD/Biv7c3jRggorEbf4yTy
	Y+LYVV3W99uTItBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D15723EA61;
	Fri, 21 Nov 2025 16:08:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 17EGMZSOIGkNdwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Nov 2025 16:08:52 +0000
Message-ID: <d080729c-6586-4b9c-b234-470977849d3d@suse.de>
Date: Fri, 21 Nov 2025 17:08:52 +0100
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
In-Reply-To: <CAMj1kXE+mS1Sm5GaROU0P97J2w1pew0P_To4sKiw8h1iOMuLcg@mail.gmail.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,arndb.de:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_080855_331390_58342CDB 
X-CRM114-Status: GOOD (  11.78  )
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

SGkKCkFtIDIxLjExLjI1IHVtIDE2OjU2IHNjaHJpZWIgQXJkIEJpZXNoZXV2ZWw6Cj4gT24gRnJp
LCAyMSBOb3YgMjAyNSBhdCAxNjo1MywgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+IHdyb3RlOgo+PiBIaQo+Pgo+PiBBbSAyMS4xMS4yNSB1bSAxNjoxNiBzY2hyaWViIEFy
ZCBCaWVzaGV1dmVsOgo+Pj4gT24gRnJpLCAyMSBOb3YgMjAyNSBhdCAxNjoxMCwgQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4+Pj4gT24gRnJpLCBOb3YgMjEsIDIwMjUsIGF0
IDE0OjM2LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPj4+Pj4gUmVwbGFjZSBzY3JlZW5faW5m
byBhbmQgZWRpZF9pbmZvIHdpdGggc3lzZmJfcHJpbWFyeV9kZXZpY2Ugb2YgdHlwZQo+Pj4+PiBz
dHJ1Y3Qgc3lzZmJfZGlzcGxheV9pbmZvLiBVcGRhdGUgYWxsIHVzZXJzLgo+Pj4+Pgo+Pj4+PiBT
eXNmYiBEUk0gZHJpdmVycyBjdXJyZW50bHkgZmV0Y2ggdGhlIGdsb2JhbCBlZGlkX2luZm8gZGly
ZWN0bHksIHdoZW4KPj4+Pj4gdGhleSBzaG91bGQgZ2V0IHRoYXQgaW5mb3JtYXRpb24gdG9nZXRo
ZXIgd2l0aCB0aGUgc2NyZWVuX2luZm8gZnJvbSB0aGVpcgo+Pj4+PiBkZXZpY2UuIFdyYXBwaW5n
IHNjcmVlbl9pbmZvIGFuZCBlZGlkX2luZm8gaW4gc3lzZmJfcHJpbWFyeV9kaXNwbGF5IGFuZAo+
Pj4+PiBwYXNzaW5nIHRoaXMgdG8gZHJpdmVycyBlbmFibGVzIHRoaXMuCj4+Pj4+Cj4+Pj4+IFJl
cGxhY2luZyBib3RoIHdpdGggc3lzZmJfcHJpbWFyeV9kaXNwbGF5IGhhcyBiZWVuIG1vdGl2YXRl
IGJ5IHRoZSBFRkkKPj4+Pj4gc3R1Yi4gRUZJIHdhbnRzIHRvIHRyYW5zZmVyIEVESUQgdmlhIGNv
bmZpZyB0YWJsZSBpbiBhIHNpbmdsZSBlbnRyeS4KPj4+Pj4gVXNpbmcgc3RydWN0IHN5c2ZiX2Rp
c3BsYXlfaW5mbyB0aGlzIHdpbGwgYmVjb21lIGVhc2lseSBwb3NzaWJsZS4gSGVuY2UKPj4+Pj4g
YWNjZXB0IHNvbWUgY2h1cm4gaW4gYXJjaGl0ZWN0dXJlIGNvZGUgZm9yIHRoZSBsb25nLXRlcm0g
aW1wcm92ZW1lbnRzLgo+Pj4+IFRoaXMgYWxsIGxvb2tzIGdvb2QgdG8gbWUsCj4+Pj4KPj4+PiBB
Y2tlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4gVGhhbmtzCj4+Cj4+Pj4g
SXQgc2hvdWxkIGFsc28gYnJpbmcgdXMgb25lIHN0ZXAgY2xvc2VyIHRvIGV2ZW50dWFsbHkKPj4+
PiBkaXNjb25uZWN0aW5nIHRoZSB4ODYgYm9vdCBBQkkgZnJvbSB0aGUga2VybmVsLWludGVybmFs
Cj4+Pj4gc3lzZmJfcHJpbWFyeV9kaXNwbGF5Lgo+Pj4+Cj4+PiBBZ3JlZWQKPj4+Cj4+PiBBY2tl
ZC1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KPj4gVGhhbmtzCj4+Cj4+PiBJ
IGNhbiB0YWtlIHBhdGNoZXMgMS0yIHJpZ2h0IGF3YXksIGlmIHRoYXQgaGVscHMgZHVyaW5nIHRo
ZSBuZXh0IGN5Y2xlLgo+PiAgIEZyb20gbXkgc3lzZmItZm9jdXNlZCBQT1YsIHRoZXNlIHBhdGNo
ZXMgd291bGQgaWRlYWxseSBhbGwgZ28gdGhyb3VnaAo+PiB0aGUgc2FtZSB0cmVlLCBzYXkgZWZp
IG9yIGdlbmVyaWMgYXJjaCwgb3Igd2hhdGV2ZXIgZml0cyBiZXN0LiBNb3N0IG9mCj4+IHRoZSBv
dGhlciBjb2RlIGlzIG9ubHkgcmVuYW1lcyBhbnl3YXkuCj4+Cj4gSSBkb24ndCBtaW5kIHF1ZXVl
aW5nIGFsbCBvZiBpdCwgYnV0IEkgZGlkIGdldCBhIGNvbmZsaWN0IG9uCj4gZHJpdmVycy9wY2kv
dmdhYXJiLmMKClByb2JhYmx5IGZyb20gYTc4ODM1Yjg2YTQ0ICgiUENJL1ZHQTogU2VsZWN0IFND
UkVFTl9JTkZPIG9uIFg4NiIpIHRoYXQgSSAKaGF2ZSBpbiBteSB0cmVlLiBZb3UgY2FuIGZpeCBp
dCBieSByZXBsYWNpbmcgc2NyZWVuX2luZm8gd2l0aCAKc3lzZmJfcHJpbWFyeV9kaXNwbGF5LnNj
cmVlbi4gVGhlIGxhdGVyIG1lcmdlIGNvbmZsaWN0IHNlZW1zIG1hbmFnZWFibGUuCgpCZXN0IHJl
Z2FyZHMKVGhvbWFzCgoKLS0gCi0tClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICkZyYW5rZW5zdHIu
IDE0NiwgOTA0NjEgTsO8cm5iZXJnLCBHZXJtYW55LCB3d3cuc3VzZS5jb20KR0Y6IEpvY2hlbiBK
YXNlciwgQW5kcmV3IE1jRG9uYWxkLCBXZXJuZXIgS25vYmxpY2gsIChIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
