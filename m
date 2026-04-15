Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D91F419A5
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 13:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0p60mWcllR+yQ2KPZNQ2Vc5wtPvLaf3Dfu1cc4033o=; b=mtuPEVhfRjsiWJ
	Zes9QSENX0iML2VTTL2qCiqK2mY/qKKrfgrI7uKnY6UFMnvo4/2Mwr51Rcx+uvDwvrrfBnesTl04G
	oEqmXZ+wYslo34HcobGxTRYwlZIa8K3w3oKLqZ303WHTsuvxGhXXYcLc4fwXb09HZPd5LPXmXInow
	/aZnmzN1z2ijtirp74iuBcYLUQ+PsuQZnhx1ISJXNBv8hy6dXwAqnad8T8aiXoJTYp0vGW6MCpzzz
	EdsbripqlugNtecHmH1R8gjsYmjM1rAZ7H/n5boToK4bsrBF3UA57UgHFYL8jtvZSfydsxVrYtKFc
	5NmdJMB50FEUwIr0GuLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0Vg-00000001CJM-1lgh;
	Wed, 15 Apr 2026 13:42:28 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0Ve-00000001CIi-0ka5
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 13:42:27 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C2DBB5BE18;
	Wed, 15 Apr 2026 13:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776260543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xbakwLiR2rEnKTxBn3FzwQHM7RC+vsanmKRXbj1/ojc=;
	b=0XdKdzmZdtGaH98pzEzXN+IJopXEUlm+O8wDvA7gvlyIEGk1cc9QfJFTuc+t990CRZkQsd
	wxcCnuuffogRR6+I9INIIJ4Yhgu9Mbfb3tN9y7EkwPjLRX1xe52YVLcLlZj6X+aJblwmfE
	fwivYf6DBT40A6/MBxioY+Ah20mCbag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776260543;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xbakwLiR2rEnKTxBn3FzwQHM7RC+vsanmKRXbj1/ojc=;
	b=GP4N0pWp/u1QV2T2DgOQYsIaDizfUqSdXquMQyMhFUgHjd1jKookSCTUketMHB/xpTmwe0
	S8+k9XsdI7orUmDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0aTtfnJ+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=laFsjYPY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776260542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xbakwLiR2rEnKTxBn3FzwQHM7RC+vsanmKRXbj1/ojc=;
	b=0aTtfnJ+FTXjwqAhJIlHLwkVOF3TWgA7RXczO/zw88HsxOZFuOnLg8vaUfHhZljH5ydJBo
	YQ1IHVJO9QrIjDAkb7Ms4vpIap8LQXZdE9gXXvnUdGwh9P54FSv6NyhywnvPwIM4zix+vb
	THfXDaz9alRjAKXxnN4pEuYGkMAeud4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776260542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xbakwLiR2rEnKTxBn3FzwQHM7RC+vsanmKRXbj1/ojc=;
	b=laFsjYPYz7BI0pLBvTDj/X3IVwQapH0JijVv0dSi2g0JDOnWlyzXkGni6k0IqTOwdRFS/m
	2ErdJEzqAoW8RQCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14C884BA2F;
	Wed, 15 Apr 2026 13:42:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3/PmA76V32kUcgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 15 Apr 2026 13:42:22 +0000
Message-ID: <90667815-b914-46fa-acfa-f5aa79689c2f@suse.de>
Date: Wed, 15 Apr 2026 15:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH 1/8] hv: Select CONFIG_SYSFB only for
 CONFIG_HYPERV_VMBUS
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
 <2fe8ce91-2dc5-4cf2-b7cf-d495e5cff14b@suse.de>
 <KUZP153MB1444885C302B353C02C2FA2FBE242@KUZP153MB1444.APCP153.PROD.OUTLOOK.COM>
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
In-Reply-To: <KUZP153MB1444885C302B353C02C2FA2FBE242@KUZP153MB1444.APCP153.PROD.OUTLOOK.COM>
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:url];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[microsoft.com,redhat.com,arndb.de,kernel.org,linaro.org,xen0n.name,linux.intel.com,gmail.com,ffwll.ch,gmx.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[27];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,outlook.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,outlook.com,linux.microsoft.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLtfyjk8sg4x43ngtem9djprcp)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C2DBB5BE18
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_064226_359026_5B804E83 
X-CRM114-Status: UNSURE (   6.58  )
X-CRM114-Notice: Please train this message.
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

CgpBbSAxMy4wNC4yNiB1bSAxMDoyMiBzY2hyaWViIFNhdXJhYmggU2luZ2ggU2VuZ2FyOgpbLi4u
XQo+Pgo+Pj4gUmV2aWV3ZWQtYnk6IFNhdXJhYmggU2VuZ2FyIDxzc2VuZ2FyQGxpbnV4Lm1pY3Jv
c29mdC5jb20+Cj4+IFRoaXMgZml4IGlzIGluZGVwZW5kZW50IGZyb20gdGhlIHJlc3Qgb2YgdGhl
IHNlcmllcy4gRG8geW91IHdhbnQgdG8gbWVyZ2UgaXQgb3IKPj4gY2FuIEkgdGFrZSBpdCBpbnRv
IERSTSB0cmVlcz8KPiBQbGVhc2UgZmVlbCBmcmVlIHRvIHRha2UgaXQgdmlhIERSTSB0cmVlLgoK
RG9uZSBub3cuIFRoYW5rcyBhIGxvdC4KCj4gQ0MgOiBXZWkgTGl1Cj4KPiAtIFNhdXJhYmgKPgoK
LS0gCi0tClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICkZyYW5rZW5zdHIuIDE0NiwgOTA0NjEgTsO8
cm5iZXJnLCBHZXJtYW55LCB3d3cuc3VzZS5jb20KR0Y6IEpvY2hlbiBKYXNlciwgQW5kcmV3IE1j
RG9uYWxkLCBXZXJuZXIgS25vYmxpY2gsIChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
