Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC480FCC9DE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 08:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OL+l+3d0St5XUCfm05dp+WnbYBhJfVqO/bTI9KTKtWY=; b=1TsmZn8rWcWypG
	rh9CyTvfTOxd5NkZU2M60nx+gWoKatsxtWERXnSgkFwnJz3PLlgHdyVv9XR9NujtgVMDNlPmFHSdW
	9KD9gjx6wq76h8BtrLfdrQ8e8m2xqlApnwy2dZ5GclISLb3lZgcTac+pEJRYAHzFCttRUdDBRt/Yb
	jL9RWmPAZg7y/bxStXCYyb8UpOofIr6Adj1gKKoQWw2jbp6IYn1Xxi8ohcfvSB3UkQOjAfub4IMrB
	T9F3EJUPzKuS2dLBFoQBLYUBAbOOeh+OGnK6dCnkCI3fKxyTqxLl4ZI4uJkbClMt6krrTjYpjdbt/
	s7BS23Wn4KbuAukFXuOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsRR-00000008wkY-2r2l;
	Tue, 10 Mar 2026 08:27:49 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsRO-00000008wjv-31aK
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 08:27:48 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B693B5BCCF;
	Tue, 10 Mar 2026 08:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773131264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Y0yzkuVRMo4+tfuJlX+VT/E2VUDW6nGfkmWA37KRrGg=;
	b=x00VKp3Kd/rA9mnhn06YdWqt3gKBueP4z230ttlqlTPUDPKmeKsQ7TANlkXlCgfzJWBLmb
	vqdKFDalwpbCoIAhScfpI5IEFFBqMhcLFT2WEeIAWMpYx3nJEt03cjrljB7ODKZIMPrZpP
	o79l40W6q8zAoAym21BXRDX5meSZvb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773131264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Y0yzkuVRMo4+tfuJlX+VT/E2VUDW6nGfkmWA37KRrGg=;
	b=AkpRRStJoLhkL2X+hxPci9ASkSWuasX/htSTiejyF/VRyaK+38V80uBb0gAj9Uo3fKgI45
	8OAUVoQPWbnNPyCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=x00VKp3K;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AkpRRStJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773131264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Y0yzkuVRMo4+tfuJlX+VT/E2VUDW6nGfkmWA37KRrGg=;
	b=x00VKp3Kd/rA9mnhn06YdWqt3gKBueP4z230ttlqlTPUDPKmeKsQ7TANlkXlCgfzJWBLmb
	vqdKFDalwpbCoIAhScfpI5IEFFBqMhcLFT2WEeIAWMpYx3nJEt03cjrljB7ODKZIMPrZpP
	o79l40W6q8zAoAym21BXRDX5meSZvb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773131264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Y0yzkuVRMo4+tfuJlX+VT/E2VUDW6nGfkmWA37KRrGg=;
	b=AkpRRStJoLhkL2X+hxPci9ASkSWuasX/htSTiejyF/VRyaK+38V80uBb0gAj9Uo3fKgI45
	8OAUVoQPWbnNPyCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 149123F36C;
	Tue, 10 Mar 2026 08:27:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RyjIAwDWr2nVEgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Mar 2026 08:27:44 +0000
Message-ID: <a85e33fe-b36b-4f4f-99a4-ba9d00687385@suse.de>
Date: Tue, 10 Mar 2026 09:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>, Han Gao <gaohan@iscas.ac.cn>,
 Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
 <20260129023922.1527729-4-zhengxingda@iscas.ac.cn>
 <DGY9GWWLXGNX.265MMEXXCG8YA@bootlin.com>
 <301a33fc27bd01bb50d57779c2f9eb51a4fafaa5.camel@iscas.ac.cn>
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
In-Reply-To: <301a33fc27bd01bb50d57779c2f9eb51a4fafaa5.camel@iscas.ac.cn>
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[iscas.ac.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:url,suse.de:mid,suse.de:dkim,suse.de:email,bootlin.com:url,samsung.com:email,icenowy.me:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[iscas.ac.cn,bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[27];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLhco1tq9et14njsu3qecxcejq)];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,bootlin.com:url,iscas.ac.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:url]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B693B5BCCF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_012747_055749_EEDFEE65 
X-CRM114-Status: GOOD (  31.09  )
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

SGkKCkFtIDA5LjAzLjI2IHVtIDE3OjM1IHNjaHJpZWIgSWNlbm93eSBaaGVuZzoKPiDlnKggMjAy
Ni0wMy0wOeS4gOeahCAxMzo0NyArMDEwMO+8jEx1Y2EgQ2VyZXNvbGnlhpnpgZPvvJoKPj4gSGVs
bG8gSWNlbm93eSBaaGVuZywKPj4KPj4gT24gVGh1IEphbiAyOSwgMjAyNiBhdCAzOjM5IEFNIENF
VCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+IEZyb206IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vu
b3d5Lm1lPgo+Pj4KPj4+IFRoaXMgaXMgYSBmcm9tLXNjcmF0Y2ggZHJpdmVyIHRhcmdldGluZyBW
ZXJpc2lsaWNvbiBEQy1zZXJpZXMKPj4+IGRpc3BsYXkKPj4+IGNvbnRyb2xsZXJzLCB3aGljaCBm
ZWF0dXJlIHNlbGYtaWRlbnRpZmljYXRpb24gZnVuY3Rpb25hbGl0eSBsaWtlCj4+PiB0aGVpcgo+
Pj4gR0Mtc2VyaWVzIEdQVXMuCj4+Pgo+Pj4gT25seSBEQzgyMDAgaXMgYmVpbmcgc3VwcG9ydGVk
IG5vdywgYW5kIG9ubHkgdGhlIG1haW4gZnJhbWVidWZmZXIKPj4+IGlzIHNldAo+Pj4gdXAgKGFz
IHRoZSBEUk0gcHJpbWFyeSBwbGFuZSkuIFN1cHBvcnQgZm9yIG1vcmUgREMgbW9kZWxzIGFuZCBt
b3JlCj4+PiBmZWF0dXJlcyBpcyBteSBmdXJ0aGVyIHRhcmdldHMuCj4+Pgo+Pj4gQXMgdGhlIGRp
c3BsYXkgY29udHJvbGxlciBpcyBkZWxpdmVyZWQgdG8gU29DIHZlbmRvcnMgYXMgYSB3aG9sZQo+
Pj4gcGFydCwKPj4+IHRoaXMgZHJpdmVyIGRvZXMgbm90IHVzZSBjb21wb25lbnQgZnJhbWV3b3Jr
IGFuZCBleHRyYSBicmlkZ2VzCj4+PiBpbnNpZGUgYQo+Pj4gU29DIGlzIGV4cGVjdGVkIHRvIGJl
IGltcGxlbWVudGVkIGFzIGRlZGljYXRlZCBicmlkZ2VzICh0aGlzIGRyaXZlcgo+Pj4gcHJvcGVy
bHkgc3VwcG9ydHMgYnJpZGdlIGNoYWluaW5nKS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBJY2Vu
b3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPj4+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhl
bmcgPHpoZW5neGluZ2RhQGlzY2FzLmFjLmNuPgo+Pj4gVGVzdGVkLWJ5OiBIYW4gR2FvIDxnYW9o
YW5AaXNjYXMuYWMuY24+Cj4+PiBUZXN0ZWQtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6
eW5za2lAc2Ftc3VuZy5jb20+Cj4+PiBSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+Cj4+IEkgaGF2ZSByZXZpZXdlZCB0aGUgYnJpZGdlIHBhcnQgb2Yg
dGhpcyBwYXRjaCBhbmQgaGF2ZSBhIGZldyByZW1hcmtzLAo+PiBzZWUKPj4gYmVsb3cuCj4+Cj4+
IFsuLi5dCj4+Cj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfYnJpZGdl
LmMKPj4+IEBAIC0wLDAgKzEsMzcxIEBACj4+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seQo+Pj4gKy8qCj4+PiArICogQ29weXJpZ2h0IChDKSAyMDI1IEljZW5vd3kg
WmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+Pj4gKyAqLwo+Pj4gKwo+Pj4gKyNpbmNsdWRlIDxsaW51
eC9vZi5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPj4+ICsKPj4+ICsjaW5jbHVk
ZSA8dWFwaS9saW51eC9tZWRpYS1idXMtZm9ybWF0Lmg+Cj4+PiArCj4+PiArI2luY2x1ZGUgPGRy
bS9kcm1fYXRvbWljLmg+Cj4+PiArI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgo+
Pj4gKyNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPgo+Pj4gKyNpbmNsdWRlIDxkcm0vZHJtX2Jy
aWRnZV9jb25uZWN0b3IuaD4KPj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9jb25uZWN0b3IuaD4KPj4+
ICsjaW5jbHVkZSA8ZHJtL2RybV9lbmNvZGVyLmg+Cj4+PiArI2luY2x1ZGUgPGRybS9kcm1fb2Yu
aD4KPj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgo+Pj4gKyNpbmNsdWRlIDxkcm0vZHJt
X3NpbXBsZV9rbXNfaGVscGVyLmg+Cj4+PiArCj4+PiArI2luY2x1ZGUgInZzX2JyaWRnZS5oIgo+
Pj4gKyNpbmNsdWRlICJ2c19icmlkZ2VfcmVncy5oIgo+Pj4gKyNpbmNsdWRlICJ2c19jcnRjLmgi
Cj4+PiArI2luY2x1ZGUgInZzX2RjLmgiCj4+PiArCj4+PiArc3RhdGljIGludCB2c19icmlkZ2Vf
YXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4+PiArCQkJwqDCoMKgIHN0cnVjdCBk
cm1fZW5jb2RlciAqZW5jb2RlciwKPj4+ICsJCQnCoMKgwqAgZW51bSBkcm1fYnJpZGdlX2F0dGFj
aF9mbGFncyBmbGFncykKPj4+ICt7Cj4+PiArCXN0cnVjdCB2c19icmlkZ2UgKnZicmlkZ2UgPQo+
Pj4gZHJtX2JyaWRnZV90b192c19icmlkZ2UoYnJpZGdlKTsKPj4+ICsKPj4+ICsJcmV0dXJuIGRy
bV9icmlkZ2VfYXR0YWNoKGVuY29kZXIsIHZicmlkZ2UtPm5leHRfYnJpZGdlLAo+Pj4gKwkJCQkg
YnJpZGdlLCBmbGFncyk7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0cnVjdCB2c2RjX2RwX2Zvcm1hdCB7
Cj4+PiArCXUzMiBsaW51eF9mbXQ7Cj4+PiArCWJvb2wgaXNfeXV2Owo+Pj4gKwl1MzIgdnNkY19m
bXQ7Cj4+PiArfTsKPj4gTW92aW5nIHRoZSBib29sIGFmdGVyIHRoZSB0d28gJ3UzMidzIHdvdWxk
IGJlIGJldHRlciBmb3IgcGFja2luZyBhbmQKPj4gc3BhdGlhbCBsb2NhbGl0eSAoZXNwZWNpYWxs
eSBpbiBjYXNlIG1vcmUgZmllbGRzIGFyZSBhZGRlZCBpbiB0aGUKPj4gZnV0dXJlKS4KPiBZZXMg
dGhpcyBzZWVtcyB0byBzb3VuZCByaWdodCwgYnV0IGRvaW5nIHN1Y2ggcmV3b3JrIHNvdW5kcyBx
dWl0ZSBiaWcKPiBhbmQgdW5uZWNlc3NhcnkgYWZ0ZXIgaXQncyBhcHBsaWVkLi4uCgpXaHk/IFlv
dSBhcmUgbWVyZWx5IG1vdmluZyBmaWVsZHMgYXJvdW5kLCByaWdodD8gSnVzdCBzZW5kIGEgcGF0
Y2ggdGhlbi4KCkJlc3QgcmVnYXJkcwpUaG9tYXMKCj4KPj4+ICsKPj4+ICtzdGF0aWMgc3RydWN0
IHZzZGNfZHBfZm9ybWF0IHZzZGNfZHBfc3VwcG9ydGVkX2ZtdHNbXSA9IHsKPj4+ICsJLyogZGVm
YXVsdCB0byBSR0I4ODggKi8KPj4+ICsJeyBNRURJQV9CVVNfRk1UX0ZJWEVELCBmYWxzZSwKPj4+
IFZTRENfRElTUF9EUF9DT05GSUdfRk1UX1JHQjg4OCB9LAo+Pj4gKwl7IE1FRElBX0JVU19GTVRf
UkdCODg4XzFYMjQsIGZhbHNlLAo+Pj4gVlNEQ19ESVNQX0RQX0NPTkZJR19GTVRfUkdCODg4IH0s
Cj4+PiArCXsgTUVESUFfQlVTX0ZNVF9SR0I1NjVfMVgxNiwgZmFsc2UsCj4+PiBWU0RDX0RJU1Bf
RFBfQ09ORklHX0ZNVF9SR0I1NjUgfSwKPj4+ICsJeyBNRURJQV9CVVNfRk1UX1JHQjY2Nl8xWDE4
LCBmYWxzZSwKPj4+IFZTRENfRElTUF9EUF9DT05GSUdfRk1UX1JHQjY2NiB9LAo+Pj4gKwl7IE1F
RElBX0JVU19GTVRfUkdCMTAxMDEwXzFYMzAsCj4+PiArCcKgIGZhbHNlLCBWU0RDX0RJU1BfRFBf
Q09ORklHX0ZNVF9SR0IxMDEwMTAgfSwKPj4gWW91IGNhbiBwdXQgdXAgdG8gMTAwIGNoYXJzIHBl
ciBsaW5lIGFuZCBhdm9pZCB0aGUgbmV3bGluZSBoZXJlIHRvCj4+IG1ha2UKPj4gdGhpcyB0YWJs
ZSBtb3JlIHJlYWRhYmxlLiBTYW1lIGJlbG93Lgo+IEFoIEkgcHJlZmVyIHRvIGtlZXAgODAgQ1BM
IHdoZW4gSSBjYW4sIGFuZCB0aGUgYGNvZGluZy1zdHlsZS5yc3RgCj4gZG9jdW1lbnQgc3RpbGwg
c3VnZ2VzdHMgODAuCj4KPj4+ICsJeyBNRURJQV9CVVNfRk1UX1VZVlk4XzFYMTYsIHRydWUsCj4+
PiBWU0RDX0RJU1BfRFBfQ09ORklHX1lVVl9GTVRfVVlWWTggfSwKPj4+ICsJeyBNRURJQV9CVVNf
Rk1UX1VZVlkxMF8xWDIwLCB0cnVlLAo+Pj4gVlNEQ19ESVNQX0RQX0NPTkZJR19ZVVZfRk1UX1VZ
VlkxMCB9LAo+Pj4gKwl7IE1FRElBX0JVU19GTVRfWVVWOF8xWDI0LCB0cnVlLAo+Pj4gVlNEQ19E
SVNQX0RQX0NPTkZJR19ZVVZfRk1UX1lVVjggfSwKPj4+ICsJeyBNRURJQV9CVVNfRk1UX1lVVjEw
XzFYMzAsIHRydWUsCj4+PiBWU0RDX0RJU1BfRFBfQ09ORklHX1lVVl9GTVRfWVVWMTAgfSwKPj4+
ICsJeyBNRURJQV9CVVNfRk1UX1VZWVZZWThfMF81WDI0LAo+Pj4gKwnCoCB0cnVlLCBWU0RDX0RJ
U1BfRFBfQ09ORklHX1lVVl9GTVRfVVlZVllZOCB9LAo+Pj4gKwl7IE1FRElBX0JVU19GTVRfVVlZ
VllZMTBfMF81WDMwLAo+Pj4gKwnCoCB0cnVlLCBWU0RDX0RJU1BfRFBfQ09ORklHX1lVVl9GTVRf
VVlZVllZMTAgfSwKPj4+ICt9Owo+Pj4gKwo+PiBbLi4uXQo+Pgo+Pj4gK3N0cnVjdCB2c19icmlk
Z2UgKnZzX2JyaWRnZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2LAo+Pj4gKwkJCQkg
c3RydWN0IHZzX2NydGMgKmNydGMpCj4+PiArewo+Pj4gKwl1bnNpZ25lZCBpbnQgb3V0cHV0ID0g
Y3J0Yy0+aWQ7Cj4+PiArCXN0cnVjdCB2c19icmlkZ2UgKmJyaWRnZTsKPj4gSW4gY29tbW9uIHBy
YWN0aWNlIGEgdmFyaWFibGUgbmFtZWQgJ2JyaWRnZScgaXMgdXNlZCB0byBwb2ludCB0byBhCj4+
ICdzdHJ1Y3QKPj4gZHJtX2JyaWRnZScsIHNvIGl0IGZlZWxzIHdlaXJkIHdoZW4gaXQgaXMgdXNl
ZCBmb3IgYW5vdGhlciB0eXBlLiBDYW4KPj4geW91Cj4+IHJlbmFtZSB0byAndmJyaWRnZScgb3Ig
J3ZzYnJpZGdlJyBvciBzaW1pbGFyLCB0byBjbGFyaWZ5IGl0J3MgdGhlCj4+ICJWZXJpc2lsaWNv
biBicmlkZ2UiPwo+IFRoaXMgc291bmRzIHJpZ2h0Lgo+Cj4gQlRXIHdoZXJlIGlzIHN1Y2gga2lu
ZCBvZiBjb21tb24gcHJhY3RpY2UgZG9jdW1lbnRlZD8KPgo+PiBUaGlzIGlzIGFmdGVyIGFsbCB3
aGF0IHlvdSBkaWQgaW4gdnNfYnJpZGdlX2F0dGFjaCgpIGFib3ZlLCB3aGVyZSB0aGUKPj4gYW1i
aWd1aXR5IG9mIHRoZSAnYnJpZGdlJyBuYW1lIHVzZWQgZm9yIGEgZHJpdmVyLXNwZWNpZmljIHN0
cnVjdCBpcwo+PiBldmlkZW50Lgo+Pgo+Pj4gKwlzdHJ1Y3QgZHJtX2JyaWRnZSAqbmV4dDsKPj4+
ICsJZW51bSB2c19icmlkZ2Vfb3V0cHV0X2ludGVyZmFjZSBpbnRmOwo+Pj4gKwljb25zdCBzdHJ1
Y3QgZHJtX2JyaWRnZV9mdW5jcyAqYnJpZGdlX2Z1bmNzOwo+Pj4gKwlpbnQgcmV0LCBlbmN0eXBl
Owo+Pj4gKwo+Pj4gKwlpbnRmID0gdnNfYnJpZGdlX2RldGVjdF9vdXRwdXRfaW50ZXJmYWNlKGRy
bV9kZXYtPmRldi0KPj4+PiBvZl9ub2RlLAo+Pj4gKwkJCQkJCSBvdXRwdXQpOwo+Pj4gKwlpZiAo
aW50ZiA9PSAtRU5PREVWKSB7Cj4+PiArCQlkcm1fZGJnKGRybV9kZXYsICJTa2lwcGluZyBvdXRw
dXQgJXVcbiIsIG91dHB1dCk7Cj4+PiArCQlyZXR1cm4gTlVMTDsKPj4+ICsJfQo+Pj4gKwo+Pj4g
KwluZXh0ID0gZGV2bV9kcm1fb2ZfZ2V0X2JyaWRnZShkcm1fZGV2LT5kZXYsIGRybV9kZXYtPmRl
di0KPj4+PiBvZl9ub2RlLAo+Pj4gKwkJCQnCoMKgwqDCoMKgIG91dHB1dCwgaW50Zik7Cj4+PiAr
CWlmIChJU19FUlIobmV4dCkpIHsKPj4+ICsJCXJldCA9IFBUUl9FUlIobmV4dCk7Cj4+PiArCQlp
ZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpCj4+PiArCQkJZHJtX2Vycihkcm1fZGV2LAo+Pj4gKwkJ
CQkiQ2Fubm90IGdldCBkb3duc3RyZWFtIGJyaWRnZSBvZgo+Pj4gb3V0cHV0ICV1XG4iLAo+Pj4g
KwkJCQlvdXRwdXQpOwo+PiAxMDAgY2hhcnMgcGVyIGxpbmUgYXJlIGFsbG93ZWQsIHNvIHRoaXMg
Y291bGQgZml0IG9uIGEgc2luZ2xlIGxpbmUKPj4gYmVpbmcKPj4gbmljZXIgdG8gcmVhZC4gVGhp
cyBhcHBsaWVzIHRvIGEgbG90IHBsYWNlcyBpbiB0aGlzIGRyaXZlciwgb2YKPj4gbG9nZ2luZwo+
PiBjYWxscyBpbiBwYXJ0aWN1bGFyLiBJIHVuZGVyc3RhbmQgdGhpcyB3b3VsZCBiZSBhbm5veWlu
ZyB0byBjaGFuZ2Ugb24KPj4gYW4KPj4gYWxyZWFkeSByZXZpZXdlZCBwYXRjaCBhbmQgYXQgdjcg
c28gdXAgdG8geW91LCBidXQgaXQgd291bGQgYmUgZ29vZAo+PiB0byBrZWVwCj4+IGl0IGluIG1p
bmQgZm9yIHRoZSBmdXR1cmUuCj4+Cj4+PiArCQlyZXR1cm4gRVJSX1BUUihyZXQpOwo+Pj4gKwl9
Cj4+PiArCj4+PiArCWlmIChpbnRmID09IFZTRENfT1VUUFVUX0lOVEVSRkFDRV9EUEkpCj4+PiAr
CQlicmlkZ2VfZnVuY3MgPSAmdnNfZHBpX2JyaWRnZV9mdW5jczsKPj4+ICsJZWxzZQo+Pj4gKwkJ
YnJpZGdlX2Z1bmNzID0gJnZzX2RwX2JyaWRnZV9mdW5jczsKPj4+ICsKPj4+ICsJYnJpZGdlID0g
ZGV2bV9kcm1fYnJpZGdlX2FsbG9jKGRybV9kZXYtPmRldiwgc3RydWN0Cj4+PiB2c19icmlkZ2Us
IGJhc2UsCj4+PiArCQkJCcKgwqDCoMKgwqDCoCBicmlkZ2VfZnVuY3MpOwo+PiBUaGUgJ3N0cnVj
dCBkcm1fYnJpZGdlJyBmaWVsZCBlbWJlZGRlZCBpbiBhIGRyaXZlci1zcGVjaWZpYyBzdHJ1Y3Qg
aXMKPj4gY29udmVudGlvbmFsbHkgY2FsbGVkICdicmlkZ2UnLCBzbyByZW5hbWluZyBpdCBmcm9t
ICdiYXNlJyB0bwo+PiAnYnJpZGdlJwo+PiB3b3VsZCBtYWtlIGl0IG1vcmUgY29uc2lzdGVudCB3
aXRoIG90aGVyIGRyaXZlcnMuIFRoYXQgd291bGQgZ28gaW4KPj4gc3luYwo+PiB3aXRoIHRoZSBj
b2RpbmcgY29udmVudGlvbiBJIG1lbnRpb25lZCBhYm92ZTogJ2JyaWRnZScgZm9yIHN0cnVjdAo+
PiBkcm1fYnJpZGdlLCA8WFlaPmJyaWRnZSBvciBqdXN0IDxYWVpaPiBmb3IgYSBjdXN0b20gZHJp
dmVyIHN0cnVjdAo+PiBlbWJlZGRpbmcKPj4gYSBicmlkZ2UuCj4gQWgsIGFsbCBzdWJjbGFzc2Vz
IGluIHRoaXMgZHJpdmVyIGNhbGwgdGhlIGJhc2UgY2xhc3MgYGJhc2VgLCBhbmQgSQo+IHN0aWxs
IHdvbmRlciBob3cgc3VjaCBjb252ZW50aW9uIGlzIGRvY3VtZW50ZWQuCj4KPj4+ICsJaWYgKElT
X0VSUihicmlkZ2UpKQo+Pj4gKwkJcmV0dXJuIEVSUl9QVFIoUFRSX0VSUihicmlkZ2UpKTsKPj4+
ICsKPj4+ICsJYnJpZGdlLT5jcnRjID0gY3J0YzsKPj4+ICsJYnJpZGdlLT5pbnRmID0gaW50ZjsK
Pj4+ICsJYnJpZGdlLT5uZXh0X2JyaWRnZSA9IG5leHQ7Cj4+IFRoZXJlIGlzIG5vdyBhIG5leHRf
YnJpZGdlIGZpZWxkIGluIHN0cnVjdCBkcm1fYnJpZGdlLCB3aGljaCBoYW5kbGVzCj4+IHRoZQo+
PiBicmlkZ2UgbGlmZXRpbWUgaW4gYSBzYWZlciB3YXkgYW5kIG1vcmUgc2ltcGx5IFswXSwgc28g
eW91IGNvdWxkIHVzZQo+PiBpdDoKPiBHbGFkIHRvIGhlYXIgc3VjaCBhIGZpZWxkIGV4aXN0cyBu
b3cuIFdpbGwgbW9yZSBjb2RlIGFib3V0IG5leHRfYnJpZGdlCj4gbGlmZXRpbWUgbWFuYWdlbWVu
dCBiZWluZyBzaGFyZWQ/Cj4KPiBUaGFua3MsCj4gSWNlbm93eQo+Cj4+ICDCoMKgwqDCoMKgwqAg
YnJpZGdlLT5iYXNlLm5leHRfYnJpZGdlID0gbmV4dDsKPj4KPj4gT3IsIGFmdGVyIHRoZSByZW5h
bWVzIEkgc3VnZ2VzdGVkIGFib3ZlOgo+Pgo+PiAgwqDCoMKgwqDCoMKgIHZicmlkZ2UtPmJyaWRn
ZS5uZXh0X2JyaWRnZSA9IG5leHQ7Cj4+Cj4+IFswXQo+PiBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92Ny4wLXJjMi9zb3VyY2UvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oI0wxMjY5
LUwxMjc4Cj4+Cj4+IEx1Y2EKPj4KPj4gLS0KPj4gTHVjYSBDZXJlc29saSwgQm9vdGxpbgo+PiBF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4+IGh0dHBzOi8vYm9vdGxpbi5j
b20KCi0tIAotLQpUaG9tYXMgWmltbWVybWFubgpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApGcmFua2Vuc3RyLiAxNDYsIDkwNDYx
IE7DvHJuYmVyZywgR2VybWFueSwgd3d3LnN1c2UuY29tCkdGOiBKb2NoZW4gSmFzZXIsIEFuZHJl
dyBNY0RvbmFsZCwgV2VybmVyIEtub2JsaWNoLCAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
