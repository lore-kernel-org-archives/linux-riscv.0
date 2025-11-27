Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F62BCFD2F6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qQXO/cTrti+Pp/LAcPBjHsOoD9p8CyGgb5IYzNoOoI=; b=CIp5jBOmICQkcn
	tfiJGG/UGILGHJm8S3FbBE0a67H+lCQwi8h+EKYYc0DJ/0d6dmiitRv1v1KduzVHXr5fsqu+3yIyI
	PnNp1xRy284B8sGspcyG//lp7l6sO/P4381zoMJjvXWSJsvET6czy8AMxLLFyvv++J5yJuN64IINj
	RNP9Oy0N7PuUdbtNzHAtANk8ZNgcjjLNTIgR+MzHbdW1X8eGKEuOVmlLWVUfoMFfZlsHZjouGFXHR
	y4WpXfz1kiqhoLgSxnawnVzb7DGYopY93JXK4oL0dstmuaXd4//MoAOCqde+UanGOkTi+X9hYU6lu
	0o3X0/Y11NTGYASWjlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWf3-0000000G94K-1cde;
	Thu, 27 Nov 2025 07:43:29 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWf0-0000000G93f-1K8w
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 07:43:27 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7CBC85BCC4;
	Thu, 27 Nov 2025 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764229402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WyScJv6L7nzXkZtam1LWxY9xGCwufyeEcL9m/K/r7IE=;
	b=tHKYVma4XZcx7EoM5DNtmhDH8d9dYIT1zjyPWiuzOKkrRbwdogT20g9OvB1gPa65N29ize
	4GtRmeOztqDc1JFFXCNPXnbPEn6m/rt5ROFlvRnW8gSriK+vchWuJejUle4Bf0lctpAMe0
	BsoNiayfk0hMxzZbyHAvwrSNJm15elw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764229402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WyScJv6L7nzXkZtam1LWxY9xGCwufyeEcL9m/K/r7IE=;
	b=sSfQgU6T/Yx+fCh1hUALVRAufEwp3ATFz5uXMj/P6VqdhPQInFT9HtHsc4EUhWkDPLvvYo
	oVeaJ0hOAb6l9vDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764229402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WyScJv6L7nzXkZtam1LWxY9xGCwufyeEcL9m/K/r7IE=;
	b=tHKYVma4XZcx7EoM5DNtmhDH8d9dYIT1zjyPWiuzOKkrRbwdogT20g9OvB1gPa65N29ize
	4GtRmeOztqDc1JFFXCNPXnbPEn6m/rt5ROFlvRnW8gSriK+vchWuJejUle4Bf0lctpAMe0
	BsoNiayfk0hMxzZbyHAvwrSNJm15elw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764229402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WyScJv6L7nzXkZtam1LWxY9xGCwufyeEcL9m/K/r7IE=;
	b=sSfQgU6T/Yx+fCh1hUALVRAufEwp3ATFz5uXMj/P6VqdhPQInFT9HtHsc4EUhWkDPLvvYo
	oVeaJ0hOAb6l9vDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A0413EA63;
	Thu, 27 Nov 2025 07:43:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DU/CABoBKGnXfAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 27 Nov 2025 07:43:22 +0000
Message-ID: <fc4ea259-3389-46e2-b860-972aa8179507@suse.de>
Date: Thu, 27 Nov 2025 08:43:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] arch,sysfb,efi: Support EDID on non-x86 EFI
 systems
To: Richard Lyu <richard.lyu@suse.com>, ardb@kernel.org, javierm@redhat.com,
 arnd@arndb.de, helgaas@kernel.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20251126160854.553077-1-tzimmermann@suse.de>
 <aSe1ZBXa3JBidhem@r1chard>
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
In-Reply-To: <aSe1ZBXa3JBidhem@r1chard>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.com:url]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_234326_644181_CC9A3D5F 
X-CRM114-Status: GOOD (  22.45  )
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

SGkKCkFtIDI3LjExLjI1IHVtIDAzOjIwIHNjaHJpZWIgUmljaGFyZCBMeXU6Cj4gSGkgVGhvbWFz
LAo+Cj4gSSBhbSBhdHRlbXB0aW5nIHRvIHRlc3QgdGhpcyBwYXRjaCBzZXJpZXMgYnV0IGVuY291
bnRlcmVkIG1lcmdlIGNvbmZsaWN0cyB3aGVuIGFwcGx5aW5nIGl0IHRvIHZhcmlvdXMgdHJlZXMu
Cj4gQ291bGQgeW91IHBsZWFzZSBjbGFyaWZ5IHRoZSBzcGVjaWZpYyBiYXNlIGNvbW1pdCAob3Ig
YnJhbmNoL3RhZykgdGhpcyBzZXJpZXMgd2FzIGdlbmVyYXRlZCBhZ2FpbnN0PwoKVGhhbmtzIGZv
ciB0ZXN0aW5nLgoKPgo+IFdoZW4gdGVzdGluZyBvbiB0aGUgbmV4dCBicmFuY2ggb24gY29tbWl0
cyA3YTJmZjAwIGFuZCBlNDFlZjM3LCBJIGhpdCBhIGNvbmZsaWN0IG9uIFBBVENIIHYzIDQvOToK
PiBwYXRjaGluZyBmaWxlIGRyaXZlcnMvcGNpL3ZnYWFyYi5jCj4gSHVuayAjMiBGQUlMRUQgYXQg
NTU3Lgo+IDEgb3V0IG9mIDIgaHVua3MgRkFJTEVEIC0tIHJlamVjdHMgaW4gZmlsZSBkcml2ZXJz
L3BjaS92Z2FhcmIuYwo+Cj4gV2hlbiB0ZXN0aW5nIGFnYWluc3QgM2E4NjYwOCAoTGludXggNi4x
OC1yYzEpLCB0aGUgZm9sbG93aW5nIGNvbmZsaWN0cyBvY2N1cnJlZDoKPiBwYXRjaGluZyBmaWxl
IGRyaXZlcnMvZ3B1L2RybS9zeXNmYi9lZmlkcm0uYwo+IEh1bmsgIzEgRkFJTEVEIGF0IDI0Lgo+
IDEgb3V0IG9mIDIgaHVua3MgRkFJTEVEIC0tIHJlamVjdHMgaW4gZmlsZSBkcml2ZXJzL2dwdS9k
cm0vc3lzZmIvZWZpZHJtLmMKPiBwYXRjaGluZyBmaWxlIGRyaXZlcnMvZ3B1L2RybS9zeXNmYi92
ZXNhZHJtLmMKPiBIdW5rICMxIEZBSUxFRCBhdCAyNS4KPiAxIG91dCBvZiAyIGh1bmtzIEZBSUxF
RCAtLSByZWplY3RzIGluIGZpbGUgZHJpdmVycy9ncHUvZHJtL3N5c2ZiL3Zlc2Fkcm0uYwo+Cj4g
UGxlYXNlIGxldCBtZSBrbm93IHRoZSBjb3JyZWN0IGJhc2UsIGFuZCBJIHdpbGwgcmV0ZXN0LgoK
SXQncyBpbiB0aGUgY292ZXIgbGV0dGVyOiBkNzI0YzZmODVlODBhMjNlZDQ2YjdlYmM2ZTM4YjUy
N2MwOWQ2NGY1IFRoZSAKY29tbWl0IGlzIGluIGxpbnV4LW5leHQuIFRoZSBpZGVhIGlzIHRoYXQg
dGhlIEVGSSB0cmVlIGNhbiBwaWNrIHVwIHRoZSAKY2hhbmdlcyBlYXNpbHkgaW4gdGhlIG5leHQg
Y3ljbGUuIGxpbnV4LW5leHQgc2VlbWVkIGxpa2UgdGhlIGJlc3QgCmNob2ljZS4gQmVzdCByZWdh
cmRzIFRob21hcwo+Cj4gVGhhbmtzLAo+IFJpY2hhcmQgTHl1Cj4KPiBPbiAyMDI1LzExLzI2IDE3
OjAzLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPj4gUmVwbGFjZSBzY3JlZW5faW5mbyBhbmQg
ZWRpZF9pbmZvIHdpdGggc3lzZmJfcHJpbWFyeV9kZXZpY2Ugb2YgdHlwZQo+PiBzdHJ1Y3Qgc3lz
ZmJfZGlzcGxheV9pbmZvLiBVcGRhdGUgYWxsIHVzZXJzLiBUaGVuIGltcGxlbWVudCBFRElEIHN1
cHBvcnQKPj4gaW4gdGhlIGtlcm5lbCBFRkkgY29kZS4KPj4KPj4gU3lzZmIgRFJNIGRyaXZlcnMg
Y3VycmVudGx5IGZldGNoIHRoZSBnbG9iYWwgZWRpZF9pbmZvIGRpcmVjdGx5LCB3aGVuCj4+IHRo
ZXkgc2hvdWxkIGdldCB0aGF0IGluZm9ybWF0aW9uIHRvZ2V0aGVyIHdpdGggdGhlIHNjcmVlbl9p
bmZvIGZyb20gdGhlaXIKPj4gZGV2aWNlLiBXcmFwcGluZyBzY3JlZW5faW5mbyBhbmQgZWRpZF9p
bmZvIGluIHN5c2ZiX3ByaW1hcnlfZGlzcGxheSBhbmQKPj4gcGFzc2luZyB0aGlzIHRvIGRyaXZl
cnMgZW5hYmxlcyB0aGlzLgo+Pgo+PiBSZXBsYWNpbmcgYm90aCB3aXRoIHN5c2ZiX3ByaW1hcnlf
ZGlzcGxheSBoYXMgYmVlbiBtb3RpdmF0ZSBieSB0aGUgRUZJCj4+IHN0dWIuIEVGSSB3YW50cyB0
byB0cmFuc2ZlciBFRElEIHZpYSBjb25maWcgdGFibGUgaW4gYSBzaW5nbGUgZW50cnkuCj4+IFVz
aW5nIHN0cnVjdCBzeXNmYl9kaXNwbGF5X2luZm8gdGhpcyB3aWxsIGJlY29tZSBlYXNpbHkgcG9z
c2libGUuIEhlbmNlCj4+IGFjY2VwdCBzb21lIGNodXJuIGluIGFyY2hpdGVjdHVyZSBjb2RlIGZv
ciB0aGUgbG9uZy10ZXJtIGltcHJvdmVtZW50cy4KPj4KPj4gUGF0Y2hlcyAxIGFuZCAyIHJlZHVj
ZSB0aGUgZXhwb3N1cmUgb2Ygc2NyZWVuX2luZm8gaW4gRUZJLXJlbGF0ZWQgY29kZS4KPj4KPj4g
UGF0Y2ggMyBhZGRzIHN0cnVjdCBzeXNmYl9kaXNwbGF5X2luZm8uCj4+Cj4+IFBhdGNoIDQgcmVw
bGFjZXMgc2NyZW5faW5mbyB3aXRoIHN5c2ZiX3ByaW1hcnlfZGlzcGxheS4gVGhpcyByZXN1bHRz
IGluCj4+IHNldmVyYWwgY2hhbmdlcyB0aHJvdWdodCB0aGUga2VybmVsLCBidXQgaXMgcmVhbGx5
IGp1c3QgYSByZWZhY3RvcmluZy4KPj4KPj4gUGF0Y2ggNSB1cGRhdGVzIHN5c2ZiIHRvIHRyYW5z
ZmVyIHN5c2ZiX3ByaW1hcnlfZGlzcGxheSB0byB0aGUgcmVsYXRlZAo+PiBkcml2ZXJzLgo+Pgo+
PiBQYXRjaCA2IG1vdmVzIGVkaWRfaW5mbyBpbnRvIHN5c2ZiX3ByaW1hcnlfZGlzcGxheS4gVGhp
cyByZXNvbHZlcyBzb21lCj4+IGRyaXZlcnMnIHJlZmVyZW5jZSB0byB0aGUgZ2xvYmFsIGVkaWRf
aW5mbywgYnV0IGFsc28gbWFrZXMgdGhlIEVESUQgZGF0YQo+PiBhdmFpbGFibGUgb24gbm9uLXg4
NiBhcmNoaXRlY3R1cmVzLgo+Pgo+PiBQYXRjaGVzIDcgYW5kIDggYWRkIHN1cHBvcnQgZm9yIEVE
SUQgdHJhbnNmZXJzIG9uIG5vbi14ODYgRUZJIHN5c3RlbXMuCj4+Cj4+IFBhdGNoIDkgY2xlYW5z
IHVwIHRoZSBjb25maWctdGFibGUgYWxsb2NhdGlvbiB0byBiZSBlYXNpZXIgdG8gdW5kZXJzdGFu
ZC4KPj4KPj4gdjM6Cj4+IC0gcmVwbGFjZSBTQ1JFRU5fSU5GTyB0YWJsZSBlbnRyeSAoQXJkKQo+
PiAtIG1lcmdlIGxpYnN0dWIgcGF0Y2ggaW50byBrZXJuZWwgcGF0Y2gKPj4gdjI6Cj4+IC0gY29t
YmluZSB2MSBvZiB0aGUgc2VyaWVzIGF0IFsxXSBwbHVzIGNoYW5nZXMgZnJvbSBbMl0gYW5kIFsz
XS4KPj4KPj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDI1MTEyMTEz
NTYyNC40OTQ3NjgtMS10emltbWVybWFubkBzdXNlLmRlLwo+PiBbMl0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvZHJpLWRldmVsLzIwMjUxMDE1MTYwODE2LjUyNTgyNS0xLXR6aW1tZXJtYW5uQHN1
c2UuZGUvCj4+IFszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1lZmkvMjAyNTExMTkx
MjMwMTEuMTE4NzI0OS01LWFyZGIrZ2l0QGdvb2dsZS5jb20vCj4+Cj4+IFRob21hcyBaaW1tZXJt
YW5uICg5KToKPj4gICAgZWZpOiBlYXJseWNvbjogUmVkdWNlIG51bWJlciBvZiByZWZlcmVuY2Vz
IHRvIGdsb2JhbCBzY3JlZW5faW5mbwo+PiAgICBlZmk6IHN5c2ZiX2VmaTogUmVkdWNlIG51bWJl
ciBvZiByZWZlcmVuY2VzIHRvIGdsb2JhbCBzY3JlZW5faW5mbwo+PiAgICBzeXNmYjogQWRkIHN0
cnVjdCBzeXNmYl9kaXNwbGF5X2luZm8KPj4gICAgc3lzZmI6IFJlcGxhY2Ugc2NyZWVuX2luZm8g
d2l0aCBzeXNmYl9wcmltYXJ5X2Rpc3BsYXkKPj4gICAgc3lzZmI6IFBhc3Mgc3lzZmJfcHJpbWFy
eV9kaXNwbGF5IHRvIGRldmljZXMKPj4gICAgc3lzZmI6IE1vdmUgZWRpZF9pbmZvIGludG8gc3lz
ZmJfcHJpbWFyeV9kaXNwbGF5Cj4+ICAgIGVmaTogUmVmYWN0b3IgaW5pdF9wcmltYXJ5X2Rpc3Bs
YXkoKSBoZWxwZXJzCj4+ICAgIGVmaTogU3VwcG9ydCBFRElEIGluZm9ybWF0aW9uCj4+ICAgIGVm
aTogbGlic3R1YjogU2ltcGxpZnkgaW50ZXJmYWNlcyBmb3IgcHJpbWFyeV9kaXNwbGF5Cj4+Cj4+
ICAgYXJjaC9hcm02NC9rZXJuZWwvaW1hZ2UtdmFycy5oICAgICAgICAgICAgICAgIHwgIDIgKy0K
Pj4gICBhcmNoL2xvb25nYXJjaC9rZXJuZWwvZWZpLmMgICAgICAgICAgICAgICAgICAgfCAzOCAr
KysrLS0tLS0KPj4gICBhcmNoL2xvb25nYXJjaC9rZXJuZWwvaW1hZ2UtdmFycy5oICAgICAgICAg
ICAgfCAgMiArLQo+PiAgIGFyY2gvcmlzY3Yva2VybmVsL2ltYWdlLXZhcnMuaCAgICAgICAgICAg
ICAgICB8ICAyICstCj4+ICAgYXJjaC94ODYva2VybmVsL2tleGVjLWJ6aW1hZ2U2NC5jICAgICAg
ICAgICAgIHwgIDQgKy0KPj4gICBhcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgICAg
ICAgICAgICAgfCAxNiArKy0tCj4+ICAgYXJjaC94ODYvdmlkZW8vdmlkZW8tY29tbW9uLmMgICAg
ICAgICAgICAgICAgIHwgIDQgKy0KPj4gICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9lYXJseWNvbi5j
ICAgICAgICAgICAgICAgfCA0MiArKysrKy0tLS0tCj4+ICAgZHJpdmVycy9maXJtd2FyZS9lZmkv
ZWZpLWluaXQuYyAgICAgICAgICAgICAgIHwgNDYgKysrKysrLS0tLS0KPj4gICBkcml2ZXJzL2Zp
cm13YXJlL2VmaS9lZmkuYyAgICAgICAgICAgICAgICAgICAgfCAgNCArLQo+PiAgIGRyaXZlcnMv
ZmlybXdhcmUvZWZpL2xpYnN0dWIvTWFrZWZpbGUgICAgICAgICB8ICAyICstCj4+ICAgZHJpdmVy
cy9maXJtd2FyZS9lZmkvbGlic3R1Yi9lZmktc3R1Yi1lbnRyeS5jIHwgMzYgKysrKysrKy0tCj4+
ICAgZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9lZmktc3R1Yi5jICAgICAgIHwgNDkgKysr
KysrKy0tLS0KPj4gICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL2VmaXN0dWIuaCAgICAg
ICAgfCAgNyArLQo+PiAgIC4uLi9maXJtd2FyZS9lZmkvbGlic3R1Yi9wcmltYXJ5X2Rpc3BsYXku
YyAgICB8IDQxICsrKysrKysrKysKPj4gICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL3Nj
cmVlbl9pbmZvLmMgICAgfCA1MyAtLS0tLS0tLS0tLS0KPj4gICBkcml2ZXJzL2Zpcm13YXJlL2Vm
aS9saWJzdHViL3pib290LmMgICAgICAgICAgfCAgNiArLQo+PiAgIGRyaXZlcnMvZmlybXdhcmUv
ZWZpL3N5c2ZiX2VmaS5jICAgICAgICAgICAgICB8IDgxICsrKysrKysrKystLS0tLS0tLS0KPj4g
ICBkcml2ZXJzL2Zpcm13YXJlL3N5c2ZiLmMgICAgICAgICAgICAgICAgICAgICAgfCAxMyArLS0K
Pj4gICBkcml2ZXJzL2Zpcm13YXJlL3N5c2ZiX3NpbXBsZWZiLmMgICAgICAgICAgICAgfCAgMiAr
LQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9zeXNmYi9lZmlkcm0uYyAgICAgICAgICAgICAgICB8IDE0
ICsrLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vc3lzZmIvdmVzYWRybS5jICAgICAgICAgICAgICAg
fCAxNCArKy0tCj4+ICAgZHJpdmVycy9odi92bWJ1c19kcnYuYyAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDYgKy0KPj4gICBkcml2ZXJzL3BjaS92Z2FhcmIuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNCArLQo+PiAgIGRyaXZlcnMvdmlkZW8vS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA4ICstCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibW9uLmMgICAg
ICAgICAgICAgIHwgIDggKy0KPj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZiLmMgICAgICAg
ICAgICAgICAgICAgfCAxMCArKy0KPj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Zlc2FmYi5jICAg
ICAgICAgICAgICAgICAgfCAxMCArKy0KPj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZnYTE2ZmIu
YyAgICAgICAgICAgICAgICAgfCAgOCArLQo+PiAgIGRyaXZlcnMvdmlkZW8vc2NyZWVuX2luZm9f
cGNpLmMgICAgICAgICAgICAgICB8ICA1ICstCj4+ICAgaW5jbHVkZS9saW51eC9lZmkuaCAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDkgKystCj4+ICAgaW5jbHVkZS9saW51eC9zY3JlZW5f
aW5mby5oICAgICAgICAgICAgICAgICAgIHwgIDIgLQo+PiAgIGluY2x1ZGUvbGludXgvc3lzZmIu
aCAgICAgICAgICAgICAgICAgICAgICAgICB8IDIzICsrKystLQo+PiAgIGluY2x1ZGUvdmlkZW8v
ZWRpZC5oICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0IC0KPj4gICAzNCBmaWxlcyBjaGFu
Z2VkLCAzMjEgaW5zZXJ0aW9ucygrKSwgMjU0IGRlbGV0aW9ucygtKQo+PiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL3ByaW1hcnlfZGlzcGxheS5jCj4+
ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvc2NyZWVu
X2luZm8uYwo+Pgo+Pgo+PiBiYXNlLWNvbW1pdDogZDcyNGM2Zjg1ZTgwYTIzZWQ0NmI3ZWJjNmUz
OGI1MjdjMDlkNjRmNQo+PiAtLSAKPj4gMi41MS4xCj4+CgotLSAKLS0KVGhvbWFzIFppbW1lcm1h
bm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgKRnJhbmtlbnN0ci4gMTQ2LCA5MDQ2MSBOw7xybmJlcmcsIEdlcm1hbnksIHd3dy5z
dXNlLmNvbQpHRjogSm9jaGVuIEphc2VyLCBBbmRyZXcgTWNEb25hbGQsIFdlcm5lciBLbm9ibGlj
aCwgKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
