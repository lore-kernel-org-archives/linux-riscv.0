Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA75EC1E81
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVpbN0mfa2gvNVo0LixAAiZ81o2Kg1sg+5mKx3h97Jc=; b=GKjpE8H2Tb98aDXz7VTXhx7s4F
	Lc9DivNnYtYv9+RUGL/IZuEFCsyssc/2uelP8k1ibno1G0BK2+EUEWzgI1m6JkoLZk/EoQgZ6bPeO
	ni5XzeyFTgN8sKz6Jgh+yzyFaH1SHtDu6YqBhSqzHtZqEKwW+uKoyeipPUxkL46rlPjbbkOSvDTPe
	Ni8b8Fg1qYeyRBqHr9zQQxLDqj4pph/QDlgKskYTYDUSuytAXuEpuo06FS96VbB7MgKRLGNOxssXl
	/6ndSrjhtGEuJihQXP1t+b812g0+itDffX4KJ6MOWP+QybRIHyzFwAVpbsNSxk8vNKtmyd81eWQTJ
	dvFaDXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvhY-00000009huD-032l;
	Thu, 05 Feb 2026 09:31:04 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvhT-00000009htm-3wQl
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 09:31:02 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B14743E766;
	Thu,  5 Feb 2026 09:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770283856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XY+5F7eiJUNFHYoaIWWokkpSAzmiSLPZoyLUPmhmHa0=;
	b=JgrWYSbMyCnsSiRoegio6OgghlGookwTHCTt6MGIwkcH+3Ce8EkBUKYRH9w+QVI8NJXtVy
	s0ckwlMuu2uSlfSlfc1jDcogJUsjywoyCce/q/FlzDEoQe+lH+aYGwEAPkRQdHQR3xBEs0
	lLyrwIptIO8MmoYoUi7LqQ6xzxEtq9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770283856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XY+5F7eiJUNFHYoaIWWokkpSAzmiSLPZoyLUPmhmHa0=;
	b=x/Xr4eTIhaFcjxgVIGvLEDun1keoGuUzASn1QtGAiz5tSTyfMaMLo8blh9Cq4KK1t89gle
	QQH8TRcS1CGj/HAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770283856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XY+5F7eiJUNFHYoaIWWokkpSAzmiSLPZoyLUPmhmHa0=;
	b=JgrWYSbMyCnsSiRoegio6OgghlGookwTHCTt6MGIwkcH+3Ce8EkBUKYRH9w+QVI8NJXtVy
	s0ckwlMuu2uSlfSlfc1jDcogJUsjywoyCce/q/FlzDEoQe+lH+aYGwEAPkRQdHQR3xBEs0
	lLyrwIptIO8MmoYoUi7LqQ6xzxEtq9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770283856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XY+5F7eiJUNFHYoaIWWokkpSAzmiSLPZoyLUPmhmHa0=;
	b=x/Xr4eTIhaFcjxgVIGvLEDun1keoGuUzASn1QtGAiz5tSTyfMaMLo8blh9Cq4KK1t89gle
	QQH8TRcS1CGj/HAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 016AF3EA63;
	Thu,  5 Feb 2026 09:30:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9tp3Ok9jhGnGJQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 05 Feb 2026 09:30:55 +0000
Message-ID: <ccb973b8-4b13-4a70-be48-06b2cbe0adf8@suse.de>
Date: Thu, 5 Feb 2026 10:30:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] Verisilicon DC8200 driver (and adaption to TH1520)
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
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
In-Reply-To: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqj7cgak6aet4eyc7so6kz1wx)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,suse.com:url]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_013100_130370_ACE93386 
X-CRM114-Status: GOOD (  24.82  )
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
Cc: devicetree@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, Yao Zi <ziyao@disroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpwYXRjaGVzIDEgdG8gNSBoYXZlIGJlZW4gbWVyZ2VkIGludG8gZHJtLW1pc2MtbmV4dC4g
SW4gcGF0Y2ggMywgSSAKcmVwbGFjZWQgQ09NUElMRVJfVEVTVCB3aXRoIENPTVBJTEVfVEVTVCBp
biB0aGUgS2NvbmZpZyBmaWxlLgoKQmVzdCByZWdhcmRzClRob21hcwoKQW0gMjkuMDEuMjYgdW0g
MDM6Mzkgc2NocmllYiBJY2Vub3d5IFpoZW5nOgo+IFRoaXMgcGF0Y2hzZXQgdHJpZXMgdG8gYWRk
IGEgZHJpdmVyIGZvciBWZXJpc2lsaWNvbiBEQzgyMDAgZHJpdmVyLCBhbmQKPiBkZW1vbnN0cmF0
ZXMgdGhlIGRyaXZlciBvbiBULUhlYWQgVEgxNTIwIHdpdGggaXRzIEhETUkgb3V0cHV0Lgo+Cj4g
VGhpcyBkaXNwbGF5IGNvbnRyb2xsZXIgSVAgaXMgdXNlZCBvbiBTdGFyRml2ZSBKSDcxMTAgdG9v
LCBidXQgYXMgdGhlCj4gSERNSSBjb250cm9sbGVyIHVzZWQgdGhlcmUgaXNuJ3QgYXMgY29tbW9u
IGFzIHRoZSBEZXNpZ25XYXJlIG9uZSwgSQo+IGNob29zZSB0byB1c2UgVEgxNTIwIGluIHRoaXMg
cGF0Y2hzZXQuCj4KPiBUaGUgREMgZHJpdmVyIGlzIHdyaXR0ZW4gd2l0aCBvdGhlciBEQy1zZXJp
ZXMgKG1haW5seSBEQzgwMDAsIHdoaWNoIGlzCj4ga25vd24gdG8gYmUgdXNlZCBvbiBFc3dpbiBF
SUM3NzAwIFNvQykgZGlzcGxheSBjb250cm9sbGVycyBpbiBtaW5kLCBhbmQKPiB1c2VzIHRoZSBp
ZGVudGlmaWNhdGlvbiByZWdpc3RlcnMgYXZhaWxhYmxlIG9uIGFsbCBWaXZhbnRlIGJyYW5kZWQg
SVBzLgo+IEEga25vd24gZXhjZXB0aW9uIGlzIERDTmFubyBkaXNwbGF5IGNvbnRyb2xsZXIsIHdo
aWNoIGlzIHVubGlrZWx5IHRvIGJlCj4gc3VwcG9ydGVkIGJ5IHRoaXMgZHJpdmVyIGJlY2F1c2Ug
b2YgdG90YWxseSBkaWZmZXJlbnQgcmVnaXN0ZXIgbWFwIGFuZAo+IG5vIGtub3duIGlkZW50aWZp
Y2F0aW9uIHJlZ2lzdGVycy4gKFAuUy4gdGhlIGluLXRyZWUgbG9vbmdzb24gRFJNIGRyaXZlcgo+
IHNlZW1zIHRvIGJlIGZvciBzb21lIERDTmFubyBpbnN0YW5jZXMgYmFzZWQgb24gdGhlIHJlZ2lz
dGVyIG1hcC4pCj4KPiBUaGUgSERNSSBjb250cm9sbGVyIHNlZW1zIHRvIGNvbWUgd2l0aCBzb21l
IGNvbW1vbiBQSFkgYnkgU3lub3BzeXMsIHRoZQo+IERlc2lnbldhcmUgSERNSSBUWCAyLjAgUEhZ
LiBCeSBzZWFyY2hpbmcgYSBmZXcgcmVnaXN0ZXIgbmFtZXMgZnJvbSB0aGUKPiBCU1AgZHJpdmVy
IG9mIHRoYXQgUEhZLCB0aGF0IFBIWSBzZWVtcyB0byBiZSB1c2VkIGJ5IGEgaW4tdHJlZSBkdy1o
ZG1pCj4gZ2x1ZSwgcmNhcl9kd19oZG1pIC0tIGFuIHVwZGF0ZWQgZG93bnN0cmVhbSB2ZXJzaW9u
IG9mIHJjYXJfZHdfaGRtaQo+IGNvbnRhaW5zIGFsbCA2IHJlZ2lzdGVycyBzZXQgaGVyZSBpbiB0
aGUgdGgxNTIwLWR3LWhkbWkgZHJpdmVyLiBTb21lCj4gbW9yZSBzdXByaXNpbmcgdGhpbmcgaXMg
dGhhdCBSSzMyODggdXNlcyB0aGUgc2FtZSBQSFkgdG9vLCBidXQgdGhlCj4gaW4tdHJlZSBkd19o
ZG1pLXJvY2tjaGlwIGRyaXZlciB3cml0ZXMgdGhlIGNvbmZpZ3VyYXRpb24gZGF0YSBhcnJheSBp
biBhCj4gd2VpcmQgd2F5IHRvIHJldXNlIHRoZSBIRE1JIDNEIFRYIFBIWSBjb25maWd1cmluZyBm
dW5jdGlvbi4gSXQgbWlnaHQgYmUKPiB2YWx1YWJsZSB0byBhZGQgY29tbW9uIGNvbmZpZ3VyaW5n
IGZ1bmN0aW9uIGFuZCBjb25maWd1cmF0aW9uIGRhdGEKPiBkZWZpbml0aW9uIGZvciB0aGlzIEhE
TUkgMi4wIFBIWSB0b28sIGJ1dCB0aGUgY3VycmVudCBkcml2ZXIgaW4gdGhpcwo+IHBhdGNoc2V0
IHNpbXBseSBkdXBsaWNhdGVkIG1vc3QgY29uZmlndXJhdGlvbiBsb2dpYyBmcm9tIHJjYXJfZHdf
aGRtaQo+IGRyaXZlciAoYnV0IHdpdGggMyBleHRyYSBjb25maWd1cmF0aW9uIHJlZ2lzdGVycyBj
b25maWd1cmVkLCB3aGljaCBpcwo+IGRvbmUgYnkgdGhlaXIgZG93bnN0cmVhbSBrZXJuZWwpLgo+
Cj4gVGhpcyByZXZpc2lvbiBjb250YWlucyBvbmx5IGxpdHRsZSBjb2RlIGNoYW5nZSAtLSBvbmx5
IGEgS2NvbmZpZyBzZWxlY3QKPiBpcyBhZGRlZC4gVGhlIG90aGVyIHB1cnBvc2UgaXMgdG8gY29s
bGVjdCBUaG9tYXMgWmltbWVybWFubidzIHRhZ3MgYW5kCj4gc3F1YXNoIE1BSU5UQUlORVJTIGNo
YW5nZSB0byByZWFsIGRyaXZlciBwZXIgaGlzIHN1Z2dlc3Rpb24uCj4KPiBJY2Vub3d5IFpoZW5n
ICg4KToKPiAgICBkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVzOiBhZGQgdmVyaXNpbGljb24K
PiAgICBkdC1iaW5kaW5nczogZGlzcGxheTogYWRkIHZlcmlzaWxpY29uLGRjCj4gICAgZHJtOiB2
ZXJpc2lsaWNvbjogYWRkIGEgZHJpdmVyIGZvciBWZXJpc2lsaWNvbiBkaXNwbGF5IGNvbnRyb2xs
ZXJzCj4gICAgZHQtYmluZGluZ3M6IGRpc3BsYXkvYnJpZGdlOiBhZGQgYmluZGluZyBmb3IgVEgx
NTIwIEhETUkgY29udHJvbGxlcgo+ICAgIGRybS9icmlkZ2U6IGFkZCBhIGRyaXZlciBmb3IgVC1I
ZWFkIFRIMTUyMCBIRE1JIGNvbnRyb2xsZXIKPiAgICByaXNjdjogZHRzOiB0aGVhZDogYWRkIERQ
VSBhbmQgSERNSSBkZXZpY2UgdHJlZSBub2Rlcwo+ICAgIHJpc2N2OiBkdHM6IHRoZWFkOiBsaWNo
ZWUtcGktNGE6IGVuYWJsZSBIRE1JCj4gICAgbWFpbG1hcDogbWFwIGFsbCBJY2Vub3d5IFpoZW5n
J3MgbWFpbCBhZGRyZXNzZXMKPgo+ICAgLm1haWxtYXAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA0ICsKPiAgIC4uLi9kaXNwbGF5L2JyaWRnZS90aGVhZCx0aDE1MjAt
ZHctaGRtaS55YW1sICB8IDEyMCArKysrKysKPiAgIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3Zlcmlz
aWxpY29uLGRjLnlhbWwgICAgICB8IDEyMiArKysrKysKPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sICB8ICAgMiArCj4gICBNQUlOVEFJTkVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKwo+ICAgLi4uL2Jvb3QvZHRzL3RoZWFk
L3RoMTUyMC1saWNoZWUtcGktNGEuZHRzICAgIHwgIDI1ICsrCj4gICBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3RoZWFkL3RoMTUyMC5kdHNpICAgICAgICAgfCAgNjYgKysrKwo+ICAgZHJpdmVycy9ncHUv
ZHJtL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKPiAgIGRyaXZlcnMvZ3B1
L2RybS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL0tjb25maWcgICAgICAgICAgICAgICAgfCAgMTAgKwo+ICAgZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAxICsKPiAgIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGgxNTIwLWR3LWhkbWkuYyAgICAgICB8IDE3MyArKysrKysrKwo+ICAg
ZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL0tjb25maWcgICAgICAgICAgIHwgIDE2ICsKPiAg
IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9NYWtlZmlsZSAgICAgICAgICB8ICAgNSArCj4g
ICBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfYnJpZGdlLmMgICAgICAgfCAzNzEgKysr
KysrKysrKysrKysrKysrCj4gICBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfYnJpZGdl
LmggICAgICAgfCAgMzkgKysKPiAgIGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19icmlk
Z2VfcmVncy5oICB8ICA1NCArKysKPiAgIGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19j
cnRjLmMgICAgICAgICB8IDE5MSArKysrKysrKysKPiAgIGRyaXZlcnMvZ3B1L2RybS92ZXJpc2ls
aWNvbi92c19jcnRjLmggICAgICAgICB8ICAzMSArKwo+ICAgZHJpdmVycy9ncHUvZHJtL3Zlcmlz
aWxpY29uL3ZzX2NydGNfcmVncy5oICAgIHwgIDYwICsrKwo+ICAgZHJpdmVycy9ncHUvZHJtL3Zl
cmlzaWxpY29uL3ZzX2RjLmMgICAgICAgICAgIHwgMjA3ICsrKysrKysrKysKPiAgIGRyaXZlcnMv
Z3B1L2RybS92ZXJpc2lsaWNvbi92c19kYy5oICAgICAgICAgICB8ICAzOCArKwo+ICAgZHJpdmVy
cy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2RjX3RvcF9yZWdzLmggIHwgIDI3ICsrCj4gICBkcml2
ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZHJtLmMgICAgICAgICAgfCAxODIgKysrKysrKysr
Cj4gICBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZHJtLmggICAgICAgICAgfCAgMjgg
KysKPiAgIGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19od2RiLmMgICAgICAgICB8IDE1
MCArKysrKysrCj4gICBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfaHdkYi5oICAgICAg
ICAgfCAgMjkgKysKPiAgIGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19wbGFuZS5jICAg
ICAgICB8IDEyNCArKysrKysKPiAgIGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19wbGFu
ZS5oICAgICAgICB8ICA3MiArKysrCj4gICAuLi4vZ3B1L2RybS92ZXJpc2lsaWNvbi92c19wcmlt
YXJ5X3BsYW5lLmMgICAgfCAxNzMgKysrKysrKysKPiAgIC4uLi9kcm0vdmVyaXNpbGljb24vdnNf
cHJpbWFyeV9wbGFuZV9yZWdzLmggICB8ICA1MyArKysKPiAgIDMxIGZpbGVzIGNoYW5nZWQsIDIz
ODQgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aGVhZCx0aDE1MjAtZHctaGRtaS55YW1s
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvdmVyaXNpbGljb24sZGMueWFtbAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGgxNTIwLWR3LWhkbWkuYwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9LY29uZmlnCj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL01ha2VmaWxlCj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2JyaWRnZS5jCj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2JyaWRnZS5oCj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2JyaWRnZV9y
ZWdzLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24v
dnNfY3J0Yy5jCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxp
Y29uL3ZzX2NydGMuaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJp
c2lsaWNvbi92c19jcnRjX3JlZ3MuaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS92ZXJpc2lsaWNvbi92c19kYy5jCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2RjLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZGNfdG9wX3JlZ3MuaAo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19kcm0uYwo+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19kcm0uaAo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19od2RiLmMKPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfaHdkYi5oCj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX3BsYW5lLmMK
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfcGxh
bmUuaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92
c19wcmltYXJ5X3BsYW5lLmMKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
dmVyaXNpbGljb24vdnNfcHJpbWFyeV9wbGFuZV9yZWdzLmgKPgoKLS0gCi0tClRob21hcyBaaW1t
ZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJICkZyYW5rZW5zdHIuIDE0NiwgOTA0NjEgTsO8cm5iZXJnLCBHZXJtYW55LCB3
d3cuc3VzZS5jb20KR0Y6IEpvY2hlbiBKYXNlciwgQW5kcmV3IE1jRG9uYWxkLCBXZXJuZXIgS25v
YmxpY2gsIChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
