Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA73EBFD0A
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 07:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0bfSJ8RmgHHqcJdCsZ1JP8tdEYJB5+yK7Zi1mmn1O4=; b=f1xKpql64E1hWC
	7RTi5t1ap4N9dg7du7lYu2ApWtQsbKOlhwWliHAcvPX18+bOsycbqUG/qPYRNWvrs1JqJfp9+rVn0
	9lIT5vNI0TR4/gzHXLAZJtAzwTKXIoB4BKC2u5iBWMEuenIG0GkuwzHhKNgm40iwab0vpojnmN2Vc
	4vd7aHE9/evso6ZWlFsWwANDf1Vbwj4DnmLO2IKaHDqEE5cqY2fb/K/2w/HkCpY4TZEVzv3+pVCYw
	0rI29NaqFTcN4tP6H4NzTTlRlhV/jtmUqgMUMPxhS3UD7ZV2Pe0ejivKU8h0D699+smZ6Jme1yQjy
	RBK5XwKVDZ7FyPwSq+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBXp-0000000F7mB-23ei;
	Mon, 13 Apr 2026 07:17:17 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBXm-0000000F7lJ-1I08
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 07:17:16 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0D7BB6A7CA;
	Mon, 13 Apr 2026 07:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776064631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rW5R3xGds9bg8qA2Ep9wnIOEprJ657jFgsGGoKUBMeQ=;
	b=EMPBYo7maOolaDclqrmqB7DoCjl8hY7R4nEKa6AIy3rB1y3LfX+HoXBy7v/39LT1OKozid
	PuG7L6eBwWC+Lp1r7PzZRvDZ4NYYI+DPKy1TUuFlIPTi4EdrW/bHW1Z9cjxBUis2Uw17Sw
	HoiFtvk2JVm4WKbGYsztTjtOmWmQ+QE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776064631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rW5R3xGds9bg8qA2Ep9wnIOEprJ657jFgsGGoKUBMeQ=;
	b=ZvsBVw15CdLOkuECwK4FZfeeJL2S20COYfNUOGcCvtUx5gkYos6MV477z2JoIsUf6YWR/H
	+S/m0SXjg3jbqcDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776064631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rW5R3xGds9bg8qA2Ep9wnIOEprJ657jFgsGGoKUBMeQ=;
	b=EMPBYo7maOolaDclqrmqB7DoCjl8hY7R4nEKa6AIy3rB1y3LfX+HoXBy7v/39LT1OKozid
	PuG7L6eBwWC+Lp1r7PzZRvDZ4NYYI+DPKy1TUuFlIPTi4EdrW/bHW1Z9cjxBUis2Uw17Sw
	HoiFtvk2JVm4WKbGYsztTjtOmWmQ+QE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776064631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rW5R3xGds9bg8qA2Ep9wnIOEprJ657jFgsGGoKUBMeQ=;
	b=ZvsBVw15CdLOkuECwK4FZfeeJL2S20COYfNUOGcCvtUx5gkYos6MV477z2JoIsUf6YWR/H
	+S/m0SXjg3jbqcDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E7034AD72;
	Mon, 13 Apr 2026 07:17:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iMDYFXaY3GkWRQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 13 Apr 2026 07:17:10 +0000
Message-ID: <2fe8ce91-2dc5-4cf2-b7cf-d495e5cff14b@suse.de>
Date: Mon, 13 Apr 2026 09:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] hv: Select CONFIG_SYSFB only for CONFIG_HYPERV_VMBUS
To: Saurabh Singh Sengar <ssengar@microsoft.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "ardb@kernel.org" <ardb@kernel.org>,
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "kernel@xen0n.name" <kernel@xen0n.name>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, KY Srinivasan <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <DECUI@microsoft.com>,
 Long Li <longli@microsoft.com>, "deller@gmx.de" <deller@gmx.de>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Michael Kelley <mhklinux@outlook.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20260402092305.208728-1-tzimmermann@suse.de>
 <20260402092305.208728-2-tzimmermann@suse.de>
 <KUZP153MB14449BBE44CBAEEA7621A4A0BE51A@KUZP153MB1444.APCP153.PROD.OUTLOOK.COM>
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
In-Reply-To: <KUZP153MB14449BBE44CBAEEA7621A4A0BE51A@KUZP153MB1444.APCP153.PROD.OUTLOOK.COM>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,outlook.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[microsoft.com,redhat.com,arndb.de,kernel.org,linaro.org,xen0n.name,linux.intel.com,gmail.com,ffwll.ch,gmx.de];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,outlook.com,linux.microsoft.com];
	R_RATELIMIT(0.00)[to_ip_from(RLykjg6e7ifkwtw7jmpw7b9yio)];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,outlook.com:email,suse.com:url]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_001714_685991_DB60CADF 
X-CRM114-Status: GOOD (  10.86  )
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

SGkKCkFtIDAyLjA0LjI2IHVtIDEyOjUwIHNjaHJpZWIgU2F1cmFiaCBTaW5naCBTZW5nYXI6Cj4+
IEh5cGVydidzIHN5c2ZiIGFjY2VzcyBvbmx5IGV4aXN0cyBpbiB0aGUgVk1CVVMgc3VwcG9ydC4g
VGhlcmVmb3JlIG9ubHkgc2VsZWN0Cj4+IENPTkZJR19TWVNGQiBmb3IgQ09ORklHX0hZUEVSVl9W
TUJVUy4gQXZvaWRzIHN5c2ZiIGNvZGUgb24gc3lzdGVtcwo+PiB0aGF0IGRvbid0IG5lZWQgaXQu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPgo+PiBGaXhlczogOTY5NTkyODNhNThkICgiRHJpdmVyczogaHY6IEFsd2F5cyBzZWxlY3Qg
Q09ORklHX1NZU0ZCIGZvciBIeXBlci1WCj4+IGd1ZXN0cyIpCj4+IENjOiBNaWNoYWVsIEtlbGxl
eSA8bWhrbGludXhAb3V0bG9vay5jb20+Cj4+IENjOiBTYXVyYWJoIFNlbmdhciA8c3NlbmdhckBs
aW51eC5taWNyb3NvZnQuY29tPgo+PiBDYzogV2VpIExpdSA8d2VpLmxpdUBrZXJuZWwub3JnPgo+
PiBDYzogIksuIFkuIFNyaW5pdmFzYW4iIDxreXNAbWljcm9zb2Z0LmNvbT4KPj4gQ2M6IEhhaXlh
bmcgWmhhbmcgPGhhaXlhbmd6QG1pY3Jvc29mdC5jb20+Cj4+IENjOiBEZXh1YW4gQ3VpIDxkZWN1
aUBtaWNyb3NvZnQuY29tPgo+PiBDYzogTG9uZyBMaSA8bG9uZ2xpQG1pY3Jvc29mdC5jb20+Cj4+
IENjOiBsaW51eC1oeXBlcnZAdmdlci5rZXJuZWwub3JnCj4+IENjOiA8c3RhYmxlQHZnZXIua2Vy
bmVsLm9yZz4gIyB2Ni4xNisKPj4gLS0tCj4+ICAgZHJpdmVycy9odi9LY29uZmlnIHwgMiArLQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9odi9LY29uZmlnIGIvZHJpdmVycy9odi9LY29uZmlnIGluZGV4
Cj4+IDc5MzdhYzBjYmQwZi4uMmQwYjNmY2IwZmY4IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2h2
L0tjb25maWcKPj4gKysrIGIvZHJpdmVycy9odi9LY29uZmlnCj4+IEBAIC05LDcgKzksNiBAQCBj
b25maWcgSFlQRVJWCj4+ICAgCXNlbGVjdCBQQVJBVklSVAo+PiAgIAlzZWxlY3QgWDg2X0hWX0NB
TExCQUNLX1ZFQ1RPUiBpZiBYODYKPj4gICAJc2VsZWN0IE9GX0VBUkxZX0ZMQVRUUkVFIGlmIE9G
Cj4+IC0Jc2VsZWN0IFNZU0ZCIGlmIEVGSSAmJiAhSFlQRVJWX1ZUTF9NT0RFCj4+ICAgCXNlbGVj
dCBJUlFfTVNJX0xJQiBpZiBYODYKPj4gICAJaGVscAo+PiAgIAkgIFNlbGVjdCB0aGlzIG9wdGlv
biB0byBydW4gTGludXggYXMgYSBIeXBlci1WIGNsaWVudCBvcGVyYXRpbmcgQEAgLTYyLDYKPj4g
KzYxLDcgQEAgY29uZmlnIEhZUEVSVl9WTUJVUwo+PiAgIAl0cmlzdGF0ZSAiTWljcm9zb2Z0IEh5
cGVyLVYgVk1CdXMgZHJpdmVyIgo+PiAgIAlkZXBlbmRzIG9uIEhZUEVSVgo+PiAgIAlkZWZhdWx0
IEhZUEVSVgo+PiArCXNlbGVjdCBTWVNGQiBpZiBFRkkgJiYgIUhZUEVSVl9WVExfTU9ERQo+PiAg
IAloZWxwCj4+ICAgCSAgU2VsZWN0IHRoaXMgb3B0aW9uIHRvIGVuYWJsZSBIeXBlci1WIFZtYnVz
IGRyaXZlci4KPj4KPj4gLS0KPj4gMi41My4wCj4gUmV2aWV3ZWQtYnk6IFNhdXJhYmggU2VuZ2Fy
IDxzc2VuZ2FyQGxpbnV4Lm1pY3Jvc29mdC5jb20+CgpUaGlzIGZpeCBpcyBpbmRlcGVuZGVudCBm
cm9tIHRoZSByZXN0IG9mIHRoZSBzZXJpZXMuIERvIHlvdSB3YW50IHRvIAptZXJnZSBpdCBvciBj
YW4gSSB0YWtlIGl0IGludG8gRFJNIHRyZWVzPwoKQmVzdCByZWdhcmRzClRob21hcwoKPgoKLS0g
Ci0tClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICkZyYW5rZW5zdHIuIDE0NiwgOTA0NjEgTsO8cm5i
ZXJnLCBHZXJtYW55LCB3d3cuc3VzZS5jb20KR0Y6IEpvY2hlbiBKYXNlciwgQW5kcmV3IE1jRG9u
YWxkLCBXZXJuZXIgS25vYmxpY2gsIChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
