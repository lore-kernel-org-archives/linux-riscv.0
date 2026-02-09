Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EF8EE0ADD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 08:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D88uSIKBBuS1YmhffKXQS7I35S0oVIraEUNJ9cufHL0=; b=ZgF9YPKeGww7dh2FuTxPge9j4d
	s9aYIKiZvgQO9eRaJQGROBxa3sLn6I4qUV/AkkATEsjq7BsIDveAcD44n4C9yfc/HT/yBthwCkjWs
	Vs0mz4M33rWUDFxhERXApaqATApYEn3NfVGGgerKjxDhNr3UdY2NsSoN3b3IKZEEhcKJFxfRzpWLv
	ZTn/e0qDuAKzhAXP7Pup1YwHVciOVNuR7XlR3faH1/dfh+EsNaaHSyboyamVC2uVv85sveHBlKCy6
	9tgLq2yc22EA/djwdUgsjCTq4DYYjyxFwYMwImsL8LpCaLy7iq4QDzhYT8pJ22osimtM/xGXPXOUG
	XN8XK1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMEf-0000000Eyn5-2RxR;
	Mon, 09 Feb 2026 08:03:09 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMEd-0000000Eym7-2GX3
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 08:03:08 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D2905BCEC;
	Mon,  9 Feb 2026 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770624184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oAseYaBlIa0wk2SgHmQQWBLJ+Oh6zcJaf3sVRIYszAo=;
	b=Xkn+cgqNsi+m2Jb8e+1zBcA2+WQ6Ok+qoxaBfsXyEXp4fiS3zVmouTasgUNYJ3wkg947zK
	5+qPzs8NwOmxfIy/LuKedv9jGl2FCtV9xSOxBZrGTVaUvCeFQk2+Asw/ivFAnBUBajAMPj
	j8xSPWlc0wquz/+f53mlxLcbZ7GQa+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770624184;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oAseYaBlIa0wk2SgHmQQWBLJ+Oh6zcJaf3sVRIYszAo=;
	b=qqjG0AOWkCvyn5fOsKnWUDnJCNldy4ezL1yUwjrHxfzqcMXcv1Ai6SYQe+M4u025YkxON3
	2Vsxd287Gx/4vACA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770624184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oAseYaBlIa0wk2SgHmQQWBLJ+Oh6zcJaf3sVRIYszAo=;
	b=Xkn+cgqNsi+m2Jb8e+1zBcA2+WQ6Ok+qoxaBfsXyEXp4fiS3zVmouTasgUNYJ3wkg947zK
	5+qPzs8NwOmxfIy/LuKedv9jGl2FCtV9xSOxBZrGTVaUvCeFQk2+Asw/ivFAnBUBajAMPj
	j8xSPWlc0wquz/+f53mlxLcbZ7GQa+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770624184;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oAseYaBlIa0wk2SgHmQQWBLJ+Oh6zcJaf3sVRIYszAo=;
	b=qqjG0AOWkCvyn5fOsKnWUDnJCNldy4ezL1yUwjrHxfzqcMXcv1Ai6SYQe+M4u025YkxON3
	2Vsxd287Gx/4vACA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DDE03EA63;
	Mon,  9 Feb 2026 08:03:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8iPmD7eUiWl4EwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 09 Feb 2026 08:03:03 +0000
Message-ID: <cafa2a0b-0b6c-4a21-a151-13839848cbfd@suse.de>
Date: Mon, 9 Feb 2026 09:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] Verisilicon DC8200 driver (and adaption to TH1520)
To: Drew Fustini <fustini@kernel.org>
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
 <ccb973b8-4b13-4a70-be48-06b2cbe0adf8@suse.de> <aYfgjMVHXpCAOOj-@gen8>
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
In-Reply-To: <aYfgjMVHXpCAOOj-@gen8>
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
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[iscas.ac.cn,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com,pengutronix.de,samsung.com,bootlin.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,icenowy.me];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_000307_742236_D3075522 
X-CRM114-Status: GOOD (  13.39  )
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
Cc: dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, Jonas Karlman <jonas@kwiboo.se>, Han Gao <gaohan@iscas.ac.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkKCkFtIDA4LjAyLjI2IHVtIDAyOjAyIHNjaHJpZWIgRHJldyBGdXN0aW5pOgo+IE9uIFRodSwg
RmViIDA1LCAyMDI2IGF0IDEwOjMwOjU1QU0gKzAxMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Ogo+PiBIaSwKPj4KPj4gcGF0Y2hlcyAxIHRvIDUgaGF2ZSBiZWVuIG1lcmdlZCBpbnRvIGRybS1t
aXNjLW5leHQuIEluIHBhdGNoIDMsIEkgcmVwbGFjZWQKPj4gQ09NUElMRVJfVEVTVCB3aXRoIENP
TVBJTEVfVEVTVCBpbiB0aGUgS2NvbmZpZyBmaWxlLgo+IEhpLCBkbyB5b3UgdGhpbmsgdGhlcmUg
d2lsbCBiZSBhIHB1bGwgcmVxdWVzdCBmb3IgdGhlIHVwY29taW5nIDYuMjAvNy4wCj4gbWVyZ2Ug
d2luZG93IHdpdGggdGhlc2UgcGF0Y2hlcz8KCkl0J3MgdG9vIGxhdGUgZm9yIDcuMC4gVGhlIGRy
aXZlciB3aWxsIGJlIGluIDcuMS4KCkJlc3QgcmVnYXJkcwpUaG9tYXMKCj4KPiBJJ20gdHJ5aW5n
IHRvIGRlY2lkZSB3aGV0aGVyIG9yIG5vdCBJIG5lZWQgdG8gc2VuZCBpbiBhIGxhdGUKPiB0aGVh
ZC1kdC1mb3ItbmV4dCBwdWxsIHJlcXVlc3QgdG8gdGhlIHNvYyB0cmVlIG1haW50YWluZXJzLgo+
Cj4gdGhhbmtzLAo+IGRyZXcKCi0tIAotLQpUaG9tYXMgWmltbWVybWFubgpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApGcmFua2Vu
c3RyLiAxNDYsIDkwNDYxIE7DvHJuYmVyZywgR2VybWFueSwgd3d3LnN1c2UuY29tCkdGOiBKb2No
ZW4gSmFzZXIsIEFuZHJldyBNY0RvbmFsZCwgV2VybmVyIEtub2JsaWNoLCAoSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
