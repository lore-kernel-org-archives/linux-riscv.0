Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD8BEDB7CA
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 07:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0OS94BSw0JQs4mck+HnafRbh40gQev92FZeLmpbVhY=; b=KHF5/AIzSudLWS
	gNYOyxbynUx4c9+E2K25lpmAs1inXZubQI6txk0bXiwNlu6YU7/j4LDFBRiOk8nCPbYxubAoMOKzz
	G+R933ZiSFG/JJoDBVk44xWpWQYS3lh8Injp5SgTdpo3omgN+YPEWIxiNvUQUEjqRkuID53zzf67t
	wR91oRwsZtR8tMm7URFaDShzOYqO7BtgTjEw3gREvibH/rYtqIa/A08U6apDzzDII+347hh8n0u0P
	jJFWrMRkQZxu2NGdmjl1ZvzITqbxaMjqN8o2NcArDxc8YHEcZECRH2ketwRh9kq/4/oGEplt4EOQN
	CLYwgq6LjA7ncsP5CEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA12K-000000065bH-31Qj;
	Tue, 07 Apr 2026 07:39:48 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA12H-000000065Zm-37V5
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 07:39:47 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 72C245BD52;
	Tue,  7 Apr 2026 07:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775547582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YiyWz4jsfCMiFJgdrKu0mvuvn+cBCeIxv71Vm0SOnFs=;
	b=Lwc8SswOcmvDaThhW5gu+ugaSdz/Tur+g3ukpvkHUTg651XIM0qsZh6oEKvQgxaagqmhkk
	frEjXXzQewBMmZbUwIn809pYAZ9F7435SdMZrqdnd+O4rmfU0GhN7ANHAWtHl1Mj8ByaqU
	2lP6YzT+nwzLTAwK1CI3AIqGfZ8g/p4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775547582;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YiyWz4jsfCMiFJgdrKu0mvuvn+cBCeIxv71Vm0SOnFs=;
	b=leyjTsOWX3c+7WT9jTBLifx0FWt0S1CcF/d5c46EcxUtjD0bJZpdP/ROt2HMfqVxT1Ejjk
	V3ZzfS/XlYx9/cDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775547582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YiyWz4jsfCMiFJgdrKu0mvuvn+cBCeIxv71Vm0SOnFs=;
	b=Lwc8SswOcmvDaThhW5gu+ugaSdz/Tur+g3ukpvkHUTg651XIM0qsZh6oEKvQgxaagqmhkk
	frEjXXzQewBMmZbUwIn809pYAZ9F7435SdMZrqdnd+O4rmfU0GhN7ANHAWtHl1Mj8ByaqU
	2lP6YzT+nwzLTAwK1CI3AIqGfZ8g/p4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775547582;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YiyWz4jsfCMiFJgdrKu0mvuvn+cBCeIxv71Vm0SOnFs=;
	b=leyjTsOWX3c+7WT9jTBLifx0FWt0S1CcF/d5c46EcxUtjD0bJZpdP/ROt2HMfqVxT1Ejjk
	V3ZzfS/XlYx9/cDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 263F74A0B0;
	Tue,  7 Apr 2026 07:39:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id opDkB7201GnYZAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Apr 2026 07:39:41 +0000
Message-ID: <0156562f-5fcf-47ce-8fea-03345f2c3fe6@suse.de>
Date: Tue, 7 Apr 2026 09:39:40 +0200
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
 <001efe27-9cbb-4a89-8d2d-a1f3ae15e505@suse.de>
 <295a43ce-92fb-435d-a82f-d1cfa8f4f28d@app.fastmail.com>
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
In-Reply-To: <295a43ce-92fb-435d-a82f-d1cfa8f4f28d@app.fastmail.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[arndb.de,redhat.com,kernel.org,linaro.org,xen0n.name,linux.intel.com,gmail.com,ffwll.ch,microsoft.com,gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.com:url,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_003946_073347_B93C6DAB 
X-CRM114-Status: GOOD (  48.86  )
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

SGkKCkFtIDAyLjA0LjI2IHVtIDE4OjQ3IHNjaHJpZWIgQXJuZCBCZXJnbWFubjoKPiBPbiBUaHUs
IEFwciAyLCAyMDI2LCBhdCAxNzoyNywgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4+IEFtIDAy
LjA0LjI2IHVtIDE2OjU5IHNjaHJpZWIgQXJuZCBCZXJnbWFubjoKPj4+IE9uIFRodSwgQXByIDIs
IDIwMjYsIGF0IDE2OjEwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPj4+PiBBbSAwMi4wNC4y
NiB1bSAxNTowOCBzY2hyaWViIEFybmQgQmVyZ21hbm46Cj4+Pj4+IE9uIFRodSwgQXByIDIsIDIw
MjYsIGF0IDExOjA5LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPj4+Pj4gSSBkb24ndCByZWFs
bHkgbGlrZSB0aGlzIHBhcnQgb2YgdGhlIHNlcmllcyBhbmQgd291bGQgcHJlZmVyCj4+Pj4+IHRv
IGtlZXAgQ09ORklHX1NZU0ZCIGhpZGRlbiBhcyBtdWNoIGFzIHBvc3NpYmxlIGFzIGFuIHg4Ngo+
Pj4+PiAoYW5kIEVGSSkgc3BlY2lmaWMgaW1wbGVtZW50YXRpb24gZGV0YWlsLCB3aXRoIHRoZSBo
b3BlCj4+Pj4+IG9mIGV2ZW50dWFsbHkgc2VwZXJhdGluZyBvdXQgdGhlIHg4NiBiaXRzIGZyb20g
dGhlIEVGSSBvbmVzLgo+Pj4+IFlvdSBtZWFuLCB5b3Ugd2FudCB0byB1c2UgdGhlIEVGSS1wcm92
aWRlZCBmcmFtZWJ1ZmZlcnMgd2l0aG91dCB0aGUKPj4+PiBpbnRlcm1lZGlhdGUgc3RlcCBvZiBn
b2luZyB0aHJvdWdoIHN5c2ZiX3ByaW1hcnlfZGlzcGxheT8KPj4+Pgo+Pj4+IEluIHRoYXQgY2Fz
ZSwgQ09ORklHX1NZU0ZCIHdvdWxkIGJlY29tZSBhbiB4ODYtaW50ZXJuYWwgdGhpbmcsIHJpZ2h0
Pwo+Pj4gVGhlIHBhcnQgdGhhdCBpcyBzdGlsbCBuZWVkZWQgZnJvbSBzeXNmYiBpcyB0aGUgYXJi
aXRyYXRpb24KPj4+IGJldHdlZW4gRFJNX0VGSSBhbmQgdGhlIFBDSSBkZXZpY2UgZHJpdmVyIGZv
ciB0aGUgc2FtZSBoYXJkd2FyZSwKPj4+IHNvIEkgdGhpbmsgc29tZSBwYXJ0IG9mIHN5c2ZiIGlz
IGNsZWFybHkgbmVlZGVkLCBpbiBwYXJ0aWN1bGFyCj4+PiB0aGUgc3lzZmJfZGlzYWJsZSgpIGZ1
bmN0aW9uIHRoYXQgcmVtb3ZlcyB0aGUgRUZJIGZyYW1lYnVmZmVyCj4+PiB3aGVuIHRoZXJlIGlz
IGEgY29uZmxpY3Rpbmcgc2ltcGxlZHJtIG9yIGhhcmR3YXJlIHNwZWNpZmljCj4+PiBkcml2ZXIu
Cj4+IFdlIGRvIG1vc3Qgb2YgdGhhdCBpbiB0aGUgYXBlcnR1cmUtaGVscGVyIG1vZHVsZS4gKHNl
ZQo+PiA8bGludXgvYXBlcnR1cmUuaD4pLiBDYWxsaW5nIHN5c2ZiX2Rpc2FibGUoKSBmcm9tIHRo
ZXJlIGlzIGEgd29ya2Fyb3VuZAo+PiBmb3Igc29tZSBjb3JuZXIgY2FzZXMuIFdlIGNhbiBoYXZl
IGFuIEVGSS1zcGVjaWZpYyBmdW5jdGlvbiB0aGF0IGRvZXMKPj4gdGhlIHNhbWUuCj4gVGhhdCBz
b3VuZHMgZ29vZCwgeWVzLiBUaGUgc2FtZSBjaGFuZ2Ugd291bGQgbmVlZCB0byBnbyBpbnRvCj4g
b2ZfcGxhdGZvcm1fZGVmYXVsdF9wb3B1bGF0ZV9pbml0KCkgdGhlbi4KClRoZSBjYWxsIHRvIHN5
c2ZiX2Rpc2FibGUoKSBpcyBhIHdvcmthcm91bmQgZm9yIGNlcnRhaW4gY2FzZXMgdGhhdCAKYXBl
cnR1cmUgaGVscGVycyBkb24ndCBoYW5kbGUgd2VsbC4gSW4gdGhlIGxvbmdlciB0ZXJtLCBJJ2Qg
d2FudCAKYXBlcnR1cmUgaGVscGVycyB0byBiZSBtb3JlIGNsZXZlciBhYm91dCBhcGVydHVyZSBv
d25lcnNoaXAuIEJ1dCBhcyBhbiAKaW50ZXJtZWRpYXRlIHN0ZXAsIGFkZGluZyBvdGhlciBfZGlz
YWJsZSgpIGZ1bmN0aW9uIHdvdWxkIGJlIGFuIG9wdGlvbi4gCkJ1dCB0aGVyZSdzIG5vIGh1cnJ5
LgoKPgo+PiBCVFcsIHNpbXBsZWRybS1vbi1FRkkvVkVTQSBpcyBjb25zaWRlcmVkIG9ic29sZXRl
IGFuZCBzaG91bGQgcHJlZmVyYWJseQo+PiBiZSByZW1vdmVkIGZyb20gdGhhdCBkcml2ZXIuIFNp
bXBsZWRybSBzaG91bGQgYmVjb21lIGEgZHJpdmVyIGZvcgo+PiBEZXZpY2V0cmVlIG5vZGVzIG9m
IHR5cGUgc2ltcGxlLWZyYW1lYnVmZmVyIChhcyBpdCBvcmlnaW5hbGx5IGhhcyBiZWVuCj4+IGlu
dGVuZGVkKS4KPiBTdXJlLCBJIHdhcyBvbmx5IHRoaW5raW5nIG9mIHRoZSBjYXNlIHdoZXJlIHRo
ZXJlIGFyZSBib3RoCj4gc3lzZmIgKGZyb20gQXJtL3Jpc2N2IFVFRkkpIGFuZCBzaW1wbGVkcm0g
KGZyb20gZGV2aWNldHJlZSkKPiBvYmplY3RzIHJlZmVycmluZyB0byB0aGUgc2FtZSBvbmUsIG5v
dCB0aGUgc2ltcGxlZHJtCj4gZGV2aWNlIGNyZWF0ZWQgYnkgc3lzZmJfc2ltcGxlZmIuCj4KPj4+
IFRoZSBwYXJ0cyB0aGF0IEkgd2FudCB0byBrZWVwIG91dCBvZiB0aGF0IGlzIGFueXRoaW5nCj4+
PiByZWxhdGVkIHRvIHRoZSB4ODYgYm9vdCBwcm90b2NvbCwgbm9uLUVGSSBmcmFtZWJ1ZmZlcnMs
Cj4+PiB0ZXh0IGNvbnNvbGUsIGFuZCBrZXhlYyBoYW5kb2ZmLCB3aGljaCB3ZSBkb24ndCBuZWVk
IG9uCj4+PiBub24teDg2IFVFRkkgc3lzdGVtcy4KPj4+Cj4+PiBJIGRvbid0IG1pbmQgdGhlIGlk
ZWEgb2YgaGF2aW5nIGEgc3lzZmJfcHJpbWFyeV9kaXNwbGF5Cj4+PiBpbiB0aGUgRUZJIGNvZGUg
aWYgdGhhdCBoZWxwcyBrZWVwIEVGSSBzYW5lIG9uIHg4NiwKPj4+IGJ1dCBpdCB3b3VsZCBiZSBn
b29kIHRvIG1ha2UgdGhhdCBsb2NhbCB0bwo+Pj4gZHJpdmVycy9maXJtd2FyZS9lZmkgYW5kIChl
dmVudHVhbGx5KSBkZXRhY2hlZCBmcm9tCj4+PiBpbmNsdWRlL3VhcGkvbGludXgvc2NyZWVuX2lu
Zm8uaC4KPj4gRWZpZHJtIHJldHJpZXZlcyB0aGUgZnJhbWVidWZmZXIgc2V0dGluZ3MgZnJvbSB0
aGUgY29udGFpbmVkIHN0cnVjdAo+PiBzY3JlZW5faW5mby4gRGlzY29ubmVjdGluZyBmcm9tIHNj
cmVlbl9pbmZvIHdvdWxkIHJlcXVpcmUgc2VwYXJhdGUKPj4gZ3JhcGhpY3MgZHJpdmVycyBmb3Ig
eDg2IGFuZCBub24teDg2LiBJZiB3ZSBzcGxpdCBvZmYgRUZJIGZyb20gc3lzZmIsCj4+IHdlJ2Qg
bGlrZWx5IG5lZWQgYSBzeXNmYmRybSBkcml2ZXIgb2Ygc29tZSBzb3J0LiBKdXN0IHNheWluZy4K
PiBZZXMsIEkgc2F3IHRoYXQgYXMgd2VsbCBhbmQgZG9uJ3QgaGF2ZSBhbiBpbW1lZGlhdGUgaWRl
YSBmb3IgaG93Cj4gdG8gYmVzdCBkbyBpdC4gSSBzYXcgdGhhdCB5b3UgYWxyZWFkeSBhYnN0cmFj
dGVkIHRoZSBhY2Nlc3MgdG8KPiB0aGUgc2NyZWVuX2luZm8gbWVtYmVycyBpbiBkcm1fc3lzZmJf
c2NyZWVuX2luZm8uYywgd2hpY2ggSSB0aGluawo+IGlzIGEgc3RlcCBpbiB0aGF0IGRpcmVjdGlv
bi4KPgo+IEkgYWxzbyBub3RpY2VkIHRoYXQgZWZpZHJtIGlzIG1vc3RseSBhIHN1YnNldCBvZiB2
ZXNhZHJtLCBzbwo+IGluIHRoZW9yeSB0aGV5IGNvdWxkIGJlIG1lcmdlZCBiYWNrIGludG8gYW4g
eDg2IGRybSBkcml2ZXIKPiBhbG9uZyB3aXRoIHRoZSBkcm1fc3lzZmJfc2NyZWVuX2luZm8gaGVs
cGVycywgYW5kIGhhdmUgYSBub24teDg2Cj4gZHJpdmVyIHRoYXQgY29uc3RydWN0cyBhIGRybV9z
eXNmYl9kZXZpY2UgZGlyZWN0bHkgZnJvbSB0aGUKPiBFRkkgc3RydWN0dXJlcy4KCkkgd291bGQg
bm90IHdhbnQgdG8gaGF2ZSBhIHVuaWZlZCBkcml2ZXIgZm9yIGFsbC10aGluZ3Mtc2NyZWVuX2lu
Zm8uIFRoZSAKY29kZSB0aGF0IGNhbiBlYXNpbHkgYmUgc2hhcmVkIGlzIGFscmVhZHkgaW4gdGhl
IHN5c2ZiIGhlbHBlcnMuIEJ1dCBJIApkb24ndCBtaW5kIGFkZGluZyBhIHNlcGFyYXRlIGRyaXZl
ciBmb3IgRUZJJ3MgR3JhcGhpY3MgT3V0cHV0IFByb3RvY29sLiAKVGhlbiB0aGVyZSB3b3VsZCBi
ZSBjdXJyZW50IGVmaWRybSBmb3IgRUZJLWZyb20tc2NyZWVuX2luZm8gYW5kIAplZmlnb3Bkcm0g
Zm9yIEVGSSB2aWEgdGhlIEdPUCBpbnRlcmZhY2VzLiBJZiBFRkkgZXZlciBzcGVjaWZpZXMgYW5v
dGhlciAKZ3JhcGhpY3MgaW50ZXJmYWNlLCB3ZSBjb3VsZCBhZGQgYW5vdGhlciBkcml2ZXIuIFRo
ZSBtYWludGVuYW5jZSAKb3ZlcmhlYWQgaXMgc21hbGwgb24gdGhlIERSTSBzaWRlLgoKV2hhdCBp
cyB0aGUgZnV0dXJlIG9mIHg4NidzIGJvb3RfcGFyYW0gYW5kIHRoZSByZWxhdGVkIHNjcmVlbl9p
bmZvIG9uIAp4ODYtNjQ/wqAgSXMgaXQgb2Jzb2xldGU/wqAgV2lsbCBib290IGxvYWRlcnMgcnVu
IHRoZSBFRkkgc3R1YiBpbnN0ZWFkPwoKPgo+PiBJIHRoaW5rIHdlJ2QgYWxzbyBoYXZlIHRvIGR1
cGxpY2F0ZSB0aGUgZnJhbWVidWZmZXItcmVsb2NhdGlvbiBjb2RlIHRoYXQKPj4gY3VycmVudGx5
IHdvcmtzIG9uIGFueXRoaW5nIHVzaW5nIHN0cnVjdCBzY3JlZW5faW5mbyAoc2VlIHBhdGNoIDUp
Lgo+IFlvdSBtZWFuIHRoZSBjb2RlIGZyb20gaW5jbHVkZS9saW51eC9zY3JlZW5faW5mby5oPyBJ
IHRoaW5rCj4gaXQgd291bGQgbWFrZSBzZW5zZSB0byBoYXZlIGFuIHg4NiBzcGVjaWZpYyB2ZXJz
aW9uIG9mIHRoYXQKPiB0byBvcGVyYXRlIG9uIHRoZSB4ODYgc2NyZWVuX2luZm8sIGFuZCBhIHNp
bXBsZXIgdmVyc2lvbgo+IHRoYXQganVzdCB1cGRhdGVzIHRoZSByZXNvdXJjZSBmb3IgdGhlIGVm
aXJkcm0gZHJpdmVyLCBidXQKPiB0aGF0IGNvdWxkIGFsc28gYmUgZG9uZSBvbmUgbGV2ZWwgaGln
aGVyIG9yIGxvd2VyLgoKTWFrZXMgbWUgd29uZGVyIGlmIHRoZSByZWxvY2F0aW9uIGNvZGUgY291
bGQgYmUgaW50ZWdyYXRlZCBpbnRvIHRoZSAKYXBlcnR1cmUgaGVscGVycy4gSXQgd291bGQgaGF2
ZSB0byB0cmFjayB0aGUgcmVsb2NhdGlvbiBvZiBhbGwgUENJIApncmFwaGljcyBkZXZpY2VzIGFu
ZCBwcm9iaW5nIERSTSBkcml2ZXJzIHdvdWxkIHF1ZXJ5IHRoZSByZWxvY2F0aW9uIApvZmZzZXQg
Zm9yIHRoZWlyIGdpdmVuIGZyYW1lYnVmZmVyLgoKPgo+Pj4+PiBJbiBnZW5lcmFsLCBJIGFtIGFs
d2F5cyBpbiBmYXZvciBvZiBwcm9wZXJseSB1c2luZyBLY29uZmlnCj4+Pj4+IGRlcGVuZGVuY2ll
cyBvdmVyICdzZWxlY3QnIHN0YXRlbWVudHMsIGZvciB0aGUgc2FtZSByZWFzb25zCj4+Pj4+IHlv
dSBkZXNjcmliZSwgYnV0IEkgZG9uJ3Qgd2FudCB0aGUgdGhlIHg4NiBsb2dpYyBmb3IKPj4+Pj4g
dGhlIGxlZ2FjeSBWRVNBIGFuZCBWR0EgY29uc29sZSBoYW5kbGluZyB0byBsZWFrIGludG8gbW9y
ZQo+Pj4+PiBhcmNoaXRlY3R1cmVzIHRoYW4gbmVjZXNzYXJ5Lgo+Pj4+Pgo+Pj4+PiBEbyB5b3Ug
dGhpbmsgd2UgY291bGQgaW5zdGVhZCBtb3ZlIHRoZSBzeXNmYl9pbml0KCkKPj4+Pj4gZnVuY3Rp
b24gaW50byB0aGUgc2FtZSB0d28gcGxhY2VzIHRoYXQgY29udGFpbiB0aGUKPj4+Pj4gc3lzZmJf
cHJpbWFyeV9kaXNwbGF5IGRlZmluaXRpb24gKGFyY2gveDg2L2tlcm5lbC9zZXR1cC5jLAo+Pj4+
PiBkcml2ZXJzL2Zpcm13YXJlL2VmaS9lZmktaW5pdC5jKSBhbmQgc2ltcGxpZnkgdGhlIGVmaSB2
ZXJzaW9uCj4+Pj4+IHRvIHRha2Ugb3V0IHRoZSB4ODYgYml0cz8gVGhhdCB3b3VsZCByZWR1Y2Ug
dGhlIHJlc3QKPj4+Pj4gb2Ygc3lzZmItcHJpbWFyeS5jIHRvIHRoZSBsb2dpYyB0byB1bnJlZ2lz
dGVyIHRoZSBkZXZpY2UsCj4+Pj4+IGFuZCB0aGF0IGNvdWxkIHRoZW4gYmUgc2VsZWN0ZWQgYnkg
Ym90aCB4ODYgYW5kIEVGSS4KPj4+PiBObywgSSdtIG1vcmUgdGhhbiBoYXBweSB0aGF0IHN5c2Zi
IGZpbmFsbHkgY29uc29saWRhdGVzIGFsbCB0aGUKPj4+PiBpbml0LWZyYW1lYnVmZmVyIHNldHVw
IGFuZCBkZXRlY3Rpb24gdGhhdCBmbG9hdGVkIGFyb3VuZCBpbiB0aGUga2VybmVsLgo+Pj4+IEkg
d291bGQgbm90IHdhbnQgaXQgdG8gYmUgZHVwbGljYXRlZCBhZ2Fpbi4KPj4+Pgo+Pj4+IEZvciBu
b3csIHdlIGNvdWxkIGNlcnRhaW5seSBrZWVwIENPTkZJR19TWVNGQiBoaWRkZW4gYW5kIGF1dG9z
ZWxlY3RlZC4KPj4+PiBBbHRob3VnaCBJIHRoaW5rIHRoaXMgd2lsbCByZXF1aXJlIHNvZW0gc29y
dCBvZiBzb2x1dGlvbiBhdCBhIGxhdGVyIHBvaW50Lgo+Pj4gQ2FuIHlvdSBjbGFyaWZ5IHdoaWNo
IHByb2JsZW0geW91IGFyZSB0cnlpbmcgdG8gc29sdmUKPj4+IHdpdGggdGhhdD8KPj4gT25lIHRo
aW5nIGlzIHRoYXQgc29tZSB1c2VycyBzaW1wbHkgd2hhdCBjb250cm9sIG92ZXIgdGhlaXIga2Vy
bmVsIGJ1aWxkLgo+Pgo+PiBJIGFsc28gdGhpbmsgdGhhdCB0aGVyZSBtaWdodCBiZSBzeXN0ZW1z
IHRoYXQgd2FudCB0byB1c2UKPj4gc3lzZmJfcHJpbWFyeV9kaXNwbGF5IChwbHVzIHRoZSByZWxv
Y2F0aW9uIGZlYXR1cmUpLCBidXQgbm90IGNyZWF0ZSB0aGUKPj4gZnJhbWVidWZmZXIgZGV2aWNl
LiBTYXkgZm9yIGVmaS1lYXJseWNvbi4gSXQgbmVlZHMgdXNlci1jb250cm9sIG92ZXIgdGhlCj4+
IFNZU0ZCIG9wdGlvbiB0byBkbyB0aGF0Lgo+IEknbSBzdGlsbCBub3QgZm9sbG93aW5nLCBzb3Jy
eS4gZWZpLWVhcmx5Y29uIGRvZXNuJ3QgcmVxdWlyZQo+IENPTkZJR19TWVNGQiB0b2RheSwgYW5k
IEkgZG9uJ3Qgc2VlIHdoeSB0aGF0IHdvdWxkIG5lZWQgdG8gY2hhbmdlLAo+IG9yIHdoeSBpdCBj
b3VsZG4ndCBqdXN0ICdzZWxlY3QgU1lTRkInIGlmIGl0IGl0IGRvZXMgY2hhbmdlLgo+Cj4+IEFz
IGEgc2lkZS1lZmZlY3QsIHVzZXItY29uZmlndXJhYmxlIFNZU0ZCIGdpdmVzIHVzIGEgbmljZSBw
bGFjZSB0byBwdXQKPj4gU1lTRkJfU0lNUExFRkIgYW5kIEZJUk1XQVJFX0VESUQ7IHR3byBvcHRp
b25zIHRoYXQgY3VycmVudGx5IGZsb2F0Cj4+IGFyb3VuZCBpbiB0aGUgY29uZmlnIHNvbWV3aGF0
IGFyYml0cmFyaWx5Lgo+IFlvdSBzYWlkIHRoYXQgU1lTRkJfU0lNUExFRkIgc2hvdWxkIGdldCBw
aGFzZWQgb3V0IGluIHRoZSBmdXR1cmUsCj4gcmlnaHQ/CgpZZXMuIEJldHRlciBzb29uZXIgdGhh
biBsYXRlci4KCj4KPiBJJ20gYWxzbyBtaXNzaW5nIHlvdXIgcGxhbiBmb3IgQ09ORklHX0ZJUk1X
QVJFX0VESUQuIEkgb25seQo+IHNlZSB0aHJlZSBsZWdhY3kgZHJpdmVycyB1c2luZyB0aGUgb2xk
IGZiX2Zpcm13YXJlX2VkaWQoKQo+IGludGVyZmFjZSwgc28gSSBhc3N1bWUgdGhpcyBpcyBub3Qg
d2hhdCB5b3UgYXJlIGludGVyZXN0ZWQgaW4uCj4KPiBGb3IgdGhlIGdsb2JhbCBjb3B5IHRoYXQg
aXMgZmlsbGVkIGJ5IHg4NiBhbmQgZWZpLCBhbmQKPiBjb25zdW1lZCBieSB2ZXNhZHJtIGFuZCBl
Zmlkcm0sIGRvZXMgdGhhdCBldmVuIG5lZWQgdG8KPiBiZSBhIGNvbmZpZ3VyYXRpb24gb3B0aW9u
IHJhdGhlciB0aGFuIGdldCBhbHdheXMgZW5hYmxlZD8KClRoZXJlIGlzIGNvZGUgaW4geDg2J3Mg
b2xkIDE2LWJpdCBib290L2luaXQgY29kZSB0aGF0IHJlYWRzIHRoZSBFRElEIHZpYSAKVkVTQS4g
VGhlIGhlbHAgdGV4dCBvbiBDT05GSUdfRklSTVdBUkVfRURJRCBzb3VuZHMgbGlrZSBpdCBuZWVk
cyB0byBiZSAKY29uZmlndXJhYmxlIGJlY2F1c2Ugc29tZSBzeXN0ZW1zIGNhbid0IGRvIHRoZSBW
RVNBIGNhbGxzLiBIZW5jZSwgdGhlIApsb2dpY2FsIHN0ZXAgc2VlbXMgdG8gYmUgdG8gbWFrZSB0
aGlzIGNvbnNpc3RlbnQgZm9yIGFsbCBzeXN0ZW1zIGJ5IAphZG9wdGluZyB0aGUgb3B0aW9uIGZv
ciBhbGwgRURJRCByZXRyaWV2YWwuCgpJZiB3ZSBjYW4gcmVtb3ZlIENPTkZJR19GSVJNV0FSRV9F
RElEIGFuZCBtYWtlIEVESUQgc3VwcG9ydCAKdW5jb25kaXRpb25hbCwgSSdtIGFsbCBmb3IgaXQu
CgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgo+Cj4gICAgICAgICBBcm5kCgotLSAKLS0KVGhvbWFzIFpp
bW1lcm1hbm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgKRnJhbmtlbnN0ci4gMTQ2LCA5MDQ2MSBOw7xybmJlcmcsIEdlcm1hbnks
IHd3dy5zdXNlLmNvbQpHRjogSm9jaGVuIEphc2VyLCBBbmRyZXcgTWNEb25hbGQsIFdlcm5lciBL
bm9ibGljaCwgKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
