Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730ABCFC28D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 15:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWvTebL82tyUcaBaGwfWHLDS1nEhrgICvPiK/vIB/7o=; b=xZHtEoSORAHuD8
	1JwBnnoITbTdi9eZc6jdMe9bcCcxt+FB/lM3FU8tT4DosGcSun/OmJRoSXPdP9pzWEkqSI1FqwuhX
	7wGpM2D/OdExV3wXZ4os+D1dN9EIKQedM6xFPNGWTbZC77sPdQNfv0ArCuFoTBxaSo/9bjumkIhFC
	K9bg1IQyLdu/4YYq4Z6z9LWlStSjr/p/uxuK3LLwYgXMXyczZbjzLA2H1tzWxs8K9C1+ojFEf/Uzs
	/8GMonHvrGpWQYbl/yTlT7kUL3QfhXSq+zBho4Pg1HT0RKZwazrBa7e43oF+qibT8UCQjaipo0k1y
	Mjflts4tOpYccn3KLfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTUu-00000008ewL-1set;
	Fri, 21 Nov 2025 15:56:32 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTUs-00000008evL-1GMj
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 15:56:31 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 772CA219AA;
	Fri, 21 Nov 2025 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763740588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8UVo7cob4soj/N2gDxSROf5m+F/1WrkBeTpLRgjEZPA=;
	b=Cpn9e30c71kagpa6+tt6QXHNvdUiEbthf9oyVP8d+CWsnl31PqNhgef/XN9ODv0l9GnKML
	M0veQuE1+FY/Er6W8gUn+oOlbEEjKfTNUE0PhYmzyKe+YiplzFyJF9adTT4XOVCdNP5w3f
	6fckIxjAzIKTanAkEb0TNrUGJR/LP3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763740588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8UVo7cob4soj/N2gDxSROf5m+F/1WrkBeTpLRgjEZPA=;
	b=V7eEY3nw1P0oVicif98pciUGQqUPEwet7D2XRMowPRTehuAeWPr+81xFuDvpnAlAt5Fc2B
	jz+1OcGPGmiPKUDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763740588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8UVo7cob4soj/N2gDxSROf5m+F/1WrkBeTpLRgjEZPA=;
	b=Cpn9e30c71kagpa6+tt6QXHNvdUiEbthf9oyVP8d+CWsnl31PqNhgef/XN9ODv0l9GnKML
	M0veQuE1+FY/Er6W8gUn+oOlbEEjKfTNUE0PhYmzyKe+YiplzFyJF9adTT4XOVCdNP5w3f
	6fckIxjAzIKTanAkEb0TNrUGJR/LP3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763740588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8UVo7cob4soj/N2gDxSROf5m+F/1WrkBeTpLRgjEZPA=;
	b=V7eEY3nw1P0oVicif98pciUGQqUPEwet7D2XRMowPRTehuAeWPr+81xFuDvpnAlAt5Fc2B
	jz+1OcGPGmiPKUDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 244A83EA61;
	Fri, 21 Nov 2025 15:56:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pSOsB6yLIGkPawAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Nov 2025 15:56:28 +0000
Message-ID: <b626f958-36e6-4dc3-a82b-9656275c3bb0@suse.de>
Date: Fri, 21 Nov 2025 16:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] sysfb: Move edid_info into sysfb_primary_display
To: ardb@kernel.org, javierm@redhat.com, arnd@arndb.de
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20251121135624.494768-1-tzimmermann@suse.de>
 <20251121135624.494768-7-tzimmermann@suse.de>
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
In-Reply-To: <20251121135624.494768-7-tzimmermann@suse.de>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_075630_637869_82AFA59F 
X-CRM114-Status: GOOD (  20.97  )
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

CgpBbSAyMS4xMS4yNSB1bSAxNDozNiBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+IE1vdmUg
eDg2J3MgZWRpZF9pbmZvIGludG8gc3lzZmJfcHJpbWFyeV9kaXNwbGF5IGFzIGEgbmV3IGZpZWxk
IG5hbWVkCj4gZWRpZC4gQWRhcHQgYWxsIHVzZXJzLgo+Cj4gQW4gaW5zdGFuY2Ugb2YgZWRpZF9p
bmZvIGhhcyBvbmx5IGJlZW4gZGVmaW5lZCBvbiB4ODYuIFdpdGggdGhlIG1vdmUKPiBpbnRvIHN5
c2ZiX3ByaW1hcnlfZGlzcGxheSwgaXQgYmVjb21lcyBhdmFpbGFibGUgb24gYWxsIGFyY2hpdGVj
dHVyZXMuCj4gVGhlcmVmb3JlIHJlbW92ZSB0aGlzIGNvbnRyYWludCBmcm9tIENPTkZJR19GSVJN
V0FSRV9FRElELgoKcy9jb250cmFpbnQvY29uc3RyYWludC8KCj4KPiB4ODYgZmlsbHMgdGhlIEVE
SUQgZGF0YSBmcm9tIGJvb3RfcGFyYW1zLmVkaWRfaW5mby4gRFJNIGRyaXZlcnMgcGljawo+IHVw
IHRoZSByYXcgZGF0YSBhbmQgbWFrZSBpdCBhdmFpbGFibGUgdG8gRFJNIGNsaWVudHMuIFJlcGxh
Y2UgdGhlCj4gZHJpdmVycycgcmVmZXJlbmNlcyB0byBlZGlkX2luZm8gYW5kIGluc3RlYWQgdXNl
IHRoZSBzeXNmYl9kaXNwbGF5X2luZm8KPiBhcyBwYXNzZWQgZnJvbSBzeXNmYi4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IC0tLQo+
ICAgYXJjaC94ODYva2VybmVsL3NldHVwLmMgICAgICAgICAgfCA2ICstLS0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3N5c2ZiL2VmaWRybS5jICAgfCA1ICsrLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
c3lzZmIvdmVzYWRybS5jICB8IDUgKystLS0KPiAgIGRyaXZlcnMvdmlkZW8vS2NvbmZpZyAgICAg
ICAgICAgIHwgMSAtCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtb24uYyB8IDggKysr
KystLS0KPiAgIGluY2x1ZGUvbGludXgvc3lzZmIuaCAgICAgICAgICAgIHwgNiArKysrKysKPiAg
IGluY2x1ZGUvdmlkZW8vZWRpZC5oICAgICAgICAgICAgIHwgNCAtLS0tCj4gICA3IGZpbGVzIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC94ODYva2VybmVsL3NldHVwLmMKPiBpbmRl
eCA2NzVlNGI5ZGViMWYuLmQ5YmZlMjAzMmNkOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9rZXJu
ZWwvc2V0dXAuYwo+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9zZXR1cC5jCj4gQEAgLTIxNSwxMCAr
MjE1LDYgQEAgYXJjaF9pbml0Y2FsbChpbml0X3g4Nl9zeXNjdGwpOwo+ICAgCj4gICBzdHJ1Y3Qg
c3lzZmJfZGlzcGxheV9pbmZvIHN5c2ZiX3ByaW1hcnlfZGlzcGxheTsKPiAgIEVYUE9SVF9TWU1C
T0woc3lzZmJfcHJpbWFyeV9kaXNwbGF5KTsKPiAtI2lmIGRlZmluZWQoQ09ORklHX0ZJUk1XQVJF
X0VESUQpCj4gLXN0cnVjdCBlZGlkX2luZm8gZWRpZF9pbmZvOwo+IC1FWFBPUlRfU1lNQk9MX0dQ
TChlZGlkX2luZm8pOwo+IC0jZW5kaWYKPiAgIAo+ICAgZXh0ZXJuIGludCByb290X21vdW50Zmxh
Z3M7Cj4gICAKPiBAQCAtNTMwLDcgKzUyNiw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwYXJzZV9i
b290X3BhcmFtcyh2b2lkKQo+ICAgCVJPT1RfREVWID0gb2xkX2RlY29kZV9kZXYoYm9vdF9wYXJh
bXMuaGRyLnJvb3RfZGV2KTsKPiAgIAlzeXNmYl9wcmltYXJ5X2Rpc3BsYXkuc2NyZWVuID0gYm9v
dF9wYXJhbXMuc2NyZWVuX2luZm87Cj4gICAjaWYgZGVmaW5lZChDT05GSUdfRklSTVdBUkVfRURJ
RCkKPiAtCWVkaWRfaW5mbyA9IGJvb3RfcGFyYW1zLmVkaWRfaW5mbzsKPiArCXN5c2ZiX3ByaW1h
cnlfZGlzcGxheS5lZGlkID0gYm9vdF9wYXJhbXMuZWRpZF9pbmZvOwo+ICAgI2VuZGlmCj4gICAj
aWZkZWYgQ09ORklHX1g4Nl8zMgo+ICAgCWFwbV9pbmZvLmJpb3MgPSBib290X3BhcmFtcy5hcG1f
Ymlvc19pbmZvOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3lzZmIvZWZpZHJtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vc3lzZmIvZWZpZHJtLmMKPiBpbmRleCAyOTUzM2FlOGZiYmYuLjUw
ZTBhZWVmNzA5YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3lzZmIvZWZpZHJtLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3lzZmIvZWZpZHJtLmMKPiBAQCAtMjQsNyArMjQsNiBA
QAo+ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KPiAgICNpbmNsdWRlIDxkcm0vZHJtX3By
b2JlX2hlbHBlci5oPgo+ICAgCj4gLSNpbmNsdWRlIDx2aWRlby9lZGlkLmg+Cj4gICAjaW5jbHVk
ZSA8dmlkZW8vcGl4ZWxfZm9ybWF0Lmg+Cj4gICAKPiAgICNpbmNsdWRlICJkcm1fc3lzZmJfaGVs
cGVyLmgiCj4gQEAgLTIwNyw4ICsyMDYsOCBAQCBzdGF0aWMgc3RydWN0IGVmaWRybV9kZXZpY2Ug
KmVmaWRybV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBkcm1fZHJpdmVyICpkcnYsCj4gICAJCSZmb3Jt
YXQtPmZvcm1hdCwgd2lkdGgsIGhlaWdodCwgc3RyaWRlKTsKPiAgIAo+ICAgI2lmIGRlZmluZWQo
Q09ORklHX0ZJUk1XQVJFX0VESUQpCj4gLQlpZiAoZHJtX2VkaWRfaGVhZGVyX2lzX3ZhbGlkKGVk
aWRfaW5mby5kdW1teSkgPT0gOCkKPiAtCQlzeXNmYi0+ZWRpZCA9IGVkaWRfaW5mby5kdW1teTsK
PiArCWlmIChkcm1fZWRpZF9oZWFkZXJfaXNfdmFsaWQoZHB5LT5lZGlkLmR1bW15KSA9PSA4KQo+
ICsJCXN5c2ZiLT5lZGlkID0gZHB5LT5lZGlkLmR1bW15Owo+ICAgI2VuZGlmCj4gICAJc3lzZmIt
PmZiX21vZGUgPSBkcm1fc3lzZmJfbW9kZSh3aWR0aCwgaGVpZ2h0LCAwLCAwKTsKPiAgIAlzeXNm
Yi0+ZmJfZm9ybWF0ID0gZm9ybWF0Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3lz
ZmIvdmVzYWRybS5jIGIvZHJpdmVycy9ncHUvZHJtL3N5c2ZiL3Zlc2Fkcm0uYwo+IGluZGV4IDE2
ZmMyMjNmOGM1Yi4uMDY4MDYzOGI4MTMxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9z
eXNmYi92ZXNhZHJtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3lzZmIvdmVzYWRybS5jCj4g
QEAgLTI1LDcgKzI1LDYgQEAKPiAgICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gICAjaW5j
bHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KPiAgIAo+IC0jaW5jbHVkZSA8dmlkZW8vZWRp
ZC5oPgo+ICAgI2luY2x1ZGUgPHZpZGVvL3BpeGVsX2Zvcm1hdC5oPgo+ICAgI2luY2x1ZGUgPHZp
ZGVvL3ZnYS5oPgo+ICAgCj4gQEAgLTQ3NCw4ICs0NzMsOCBAQCBzdGF0aWMgc3RydWN0IHZlc2Fk
cm1fZGV2aWNlICp2ZXNhZHJtX2RldmljZV9jcmVhdGUoc3RydWN0IGRybV9kcml2ZXIgKmRydiwK
PiAgIAl9Cj4gICAKPiAgICNpZiBkZWZpbmVkKENPTkZJR19GSVJNV0FSRV9FRElEKQo+IC0JaWYg
KGRybV9lZGlkX2hlYWRlcl9pc192YWxpZChlZGlkX2luZm8uZHVtbXkpID09IDgpCj4gLQkJc3lz
ZmItPmVkaWQgPSBlZGlkX2luZm8uZHVtbXk7Cj4gKwlpZiAoZHJtX2VkaWRfaGVhZGVyX2lzX3Zh
bGlkKGRweS0+ZWRpZC5kdW1teSkgPT0gOCkKPiArCQlzeXNmYi0+ZWRpZCA9IGRweS0+ZWRpZC5k
dW1teTsKPiAgICNlbmRpZgo+ICAgCXN5c2ZiLT5mYl9tb2RlID0gZHJtX3N5c2ZiX21vZGUod2lk
dGgsIGhlaWdodCwgMCwgMCk7Cj4gICAJc3lzZmItPmZiX2Zvcm1hdCA9IGZvcm1hdDsKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aWRlby9LY29uZmlnIGIvZHJpdmVycy92aWRlby9LY29uZmlnCj4g
aW5kZXggZDUxNzc3ZGYxMmQxLi5hZDU1ZTdkNjIxNTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92
aWRlby9LY29uZmlnCj4gKysrIGIvZHJpdmVycy92aWRlby9LY29uZmlnCj4gQEAgLTYzLDcgKzYz
LDYgQEAgZW5kaWYgIyBIQVNfSU9NRU0KPiAgIAo+ICAgY29uZmlnIEZJUk1XQVJFX0VESUQKPiAg
IAlib29sICJFbmFibGUgZmlybXdhcmUgRURJRCIKPiAtCWRlcGVuZHMgb24gWDg2Cj4gICAJaGVs
cAo+ICAgCSAgVGhpcyBlbmFibGVzIGFjY2VzcyB0byB0aGUgRURJRCB0cmFuc2ZlcnJlZCBmcm9t
IHRoZSBmaXJtd2FyZS4KPiAgIAkgIE9uIHg4NiwgdGhpcyBpcyBmcm9tIHRoZSBWRVNBIEJJT1Mu
IERSTSBkaXNwbGF5IGRyaXZlcnMgd2lsbAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJtb24uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1vbi5jCj4gaW5k
ZXggMGE2NWJlZjAxZTNjLi4wN2RmN2U5OGY4YTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRl
by9mYmRldi9jb3JlL2ZibW9uLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJt
b24uYwo+IEBAIC0zMiwxMSArMzIsMTMgQEAKPiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4K
PiAgICNpbmNsdWRlIDxsaW51eC9wY2kuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4g
LSNpbmNsdWRlIDx2aWRlby9lZGlkLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zdHJpbmdfY2hvaWNl
cy5oPgo+ICsjaW5jbHVkZSA8bGludXgvc3lzZmIuaD4KPiArCj4gICAjaW5jbHVkZSA8dmlkZW8v
b2ZfdmlkZW9tb2RlLmg+Cj4gICAjaW5jbHVkZSA8dmlkZW8vdmlkZW9tb2RlLmg+Cj4gKwo+ICAg
I2luY2x1ZGUgIi4uL2VkaWQuaCIKPiAtI2luY2x1ZGUgPGxpbnV4L3N0cmluZ19jaG9pY2VzLmg+
Cj4gICAKPiAgIC8qCj4gICAgKiBFRElEIHBhcnNlcgo+IEBAIC0xNTA0LDcgKzE1MDYsNyBAQCBj
b25zdCB1bnNpZ25lZCBjaGFyICpmYl9maXJtd2FyZV9lZGlkKHN0cnVjdCBkZXZpY2UgKmRldmlj
ZSkKPiAgIAkJcmVzID0gJmRldi0+cmVzb3VyY2VbUENJX1JPTV9SRVNPVVJDRV07Cj4gICAKPiAg
IAlpZiAocmVzICYmIHJlcy0+ZmxhZ3MgJiBJT1JFU09VUkNFX1JPTV9TSEFET1cpCj4gLQkJZWRp
ZCA9IGVkaWRfaW5mby5kdW1teTsKPiArCQllZGlkID0gc3lzZmJfcHJpbWFyeV9kaXNwbGF5LmVk
aWQuZHVtbXk7Cj4gICAKPiAgIAlyZXR1cm4gZWRpZDsKPiAgIH0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9zeXNmYi5oIGIvaW5jbHVkZS9saW51eC9zeXNmYi5oCj4gaW5kZXggZThiZGUz
OTJjNjkwLi41MjI2ZWZkZTlhZDQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9zeXNmYi5o
Cj4gKysrIGIvaW5jbHVkZS9saW51eC9zeXNmYi5oCj4gQEAgLTEyLDYgKzEyLDggQEAKPiAgICNp
bmNsdWRlIDxsaW51eC9zY3JlZW5faW5mby5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+
Cj4gICAKPiArI2luY2x1ZGUgPHZpZGVvL2VkaWQuaD4KPiArCj4gICBzdHJ1Y3QgZGV2aWNlOwo+
ICAgc3RydWN0IHBsYXRmb3JtX2RldmljZTsKPiAgIHN0cnVjdCBzY3JlZW5faW5mbzsKPiBAQCAt
NjIsNiArNjQsMTAgQEAgc3RydWN0IGVmaWZiX2RtaV9pbmZvIHsKPiAgIAo+ICAgc3RydWN0IHN5
c2ZiX2Rpc3BsYXlfaW5mbyB7Cj4gICAJc3RydWN0IHNjcmVlbl9pbmZvIHNjcmVlbjsKPiArCj4g
KyNpZiBkZWZpbmVkKENPTkZJR19GSVJNV0FSRV9FRElEKQo+ICsJc3RydWN0IGVkaWRfaW5mbyBl
ZGlkOwo+ICsjZW5kaWYKPiAgIH07Cj4gICAKPiAgIGV4dGVybiBzdHJ1Y3Qgc3lzZmJfZGlzcGxh
eV9pbmZvIHN5c2ZiX3ByaW1hcnlfZGlzcGxheTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS92aWRl
by9lZGlkLmggYi9pbmNsdWRlL3ZpZGVvL2VkaWQuaAo+IGluZGV4IGMyYjE4NmIxOTMzYS4uNTJh
YWJiNzA2MDMyIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdmlkZW8vZWRpZC5oCj4gKysrIGIvaW5j
bHVkZS92aWRlby9lZGlkLmgKPiBAQCAtNCw4ICs0LDQgQEAKPiAgIAo+ICAgI2luY2x1ZGUgPHVh
cGkvdmlkZW8vZWRpZC5oPgo+ICAgCj4gLSNpZiBkZWZpbmVkKENPTkZJR19GSVJNV0FSRV9FRElE
KQo+IC1leHRlcm4gc3RydWN0IGVkaWRfaW5mbyBlZGlkX2luZm87Cj4gLSNlbmRpZgo+IC0KPiAg
ICNlbmRpZiAvKiBfX2xpbnV4X3ZpZGVvX2VkaWRfaF9fICovCgotLSAKLS0KVGhvbWFzIFppbW1l
cm1hbm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgKRnJhbmtlbnN0ci4gMTQ2LCA5MDQ2MSBOw7xybmJlcmcsIEdlcm1hbnksIHd3
dy5zdXNlLmNvbQpHRjogSm9jaGVuIEphc2VyLCBBbmRyZXcgTWNEb25hbGQsIFdlcm5lciBLbm9i
bGljaCwgKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
