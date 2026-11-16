Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407A5606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eJbLQN6c;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FtaKOs8h;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GBSuIaQU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=P3S+S1W2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m4uH2vq2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zW/zIgAqyKYDcTyr8dDlSYLl9VrypBAXo3+i/JcEICk=; b=eJbLQN6c5HQi46kLTambJTtM3Y
	umXAKE0YcJJNxNqowZDGheWvqmbVEckT1n1WvbFMueNTb7S8BExxnFXo7FujebKtZdMsHBf0GZQxf
	NUoZQCvACfAzxnV30vnFSMKBJePZvDm6hj8NvcYLA0GRQJpYtp6zjKM6YEkOJJDUDawBDzwmiXMms
	gslXqO9p+d02HjGxIMX9mM6QIcARCOvG/FTUDFQyosaec70nmqSoqZyks596TIAjrJvJMsGEWuNcw
	pWF+KP5spxZVCsMm3BMPaXVI7tAc2VW1FEdS2qqgrSh3iTTh163Yc2P/hp3s/7uW1aC9w1t6P1PH0
	cVCg+2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvQN-00000002I1P-3oQM;
	Mon, 16 Nov 2026 12:03:03 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvQK-00000002Hzq-2EYg
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 12:03:02 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A1ECF1FCCE;
	Mon, 16 Nov 2026 12:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794830577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XakR3HwaA61RTSRKXiY8u1VTW14yNDhbXxD2aqPLa0k=;
	b=FtaKOs8hvk+CE2ZxqchRuwfNwjPCWOBBQ7CutkK26oUGD1gNrt9zVCb5PxXoOHJehzZ/Z5
	cggkNuBcYvs3rGBzd7/dpG1/zj2f5AUOd8HJp6r8II4mpLiQJGmtdem/U3WtuhAwJfOKI1
	/Ip0wxIpQAp71btrl2gqKRbO+CqbI3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794830577;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XakR3HwaA61RTSRKXiY8u1VTW14yNDhbXxD2aqPLa0k=;
	b=GBSuIaQU5ThIrz/oluo1RR3cm1bwZBjvuXHvh0e46+prp8sjlDlRUuzXMaZHYO+wNvAmyb
	sdTKkl+a2sWfp7Bg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P3S+S1W2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=m4uH2vq2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794830575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XakR3HwaA61RTSRKXiY8u1VTW14yNDhbXxD2aqPLa0k=;
	b=P3S+S1W2B+8RBnkjAEiL/iW91tFQ/ddvGRD6L3uZ6KiJo/PVj2r51SkeB04ijTsMedfDPT
	RAkeYQ0mLgH7tAWyTQkdFvsuXYq6NsMtBJRCBeuz7WDuE3PCpg+oLHljOFwJdQ3eZSsm8Y
	82//XxnPTT2sARbLGOgN+bP4EUoJyps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794830575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XakR3HwaA61RTSRKXiY8u1VTW14yNDhbXxD2aqPLa0k=;
	b=m4uH2vq2lFTxM0W0B60ZOnueb9UoU+DZG+208VhICmOcB1wdjf1w/1b0vY41UpHocz4kDd
	7VzlEY1J8gAqgaCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CD4F1334C;
	Mon, 16 Nov 2026 12:02:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QYP5Au/w+moNTQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 16 Nov 2026 12:02:55 +0000
Message-ID: <41d20d93-9961-4695-a9d1-cf80be0ec640@suse.de>
Date: Mon, 16 Nov 2026 13:02:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware/sysfb: Avoid simple-framebuffer behind DT PCI
 host bridges
To: gaohan@iscas.ac.cn, Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Borislav Petkov <bp@suse.de>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 Han Gao <rabenda.cn@gmail.com>, stable@vger.kernel.org
References: <20261107-sysfb-dt-pci-efifb-v1-1-86d6c598671a@iscas.ac.cn>
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
In-Reply-To: <20261107-sysfb-dt-pci-efifb-v1-1-86d6c598671a@iscas.ac.cn>
X-Spamd-Result: default: False [-12.00 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:url,suse.de:dkim,iscas.ac.cn:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -12.00
X-Spam-Level: 
X-Rspamd-Queue-Id: A1ECF1FCCE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_040300_871186_58A7D198 
X-CRM114-Status: GOOD (  29.15  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkKCkFtIDA3LjExLjI2IHVtIDA5OjQ2IHNjaHJpZWIgSGFuIEdhbyB2aWEgQjQgUmVsYXk6Cj4g
RnJvbTogSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+Cj4gV2l0aCBTWVNGQl9TSU1QTEVG
Qiwgc3lzZmIgcmVnaXN0ZXJzIGEgc2ltcGxlLWZyYW1lYnVmZmVyIGRldmljZSB0aGF0Cj4gY2xh
aW1zIHRoZSBmcmFtZWJ1ZmZlciBtZW1vcnkgd2hlbiBpdCBpcyBhZGRlZC4gT24gRFQgc3lzdGVt
cywgdGhlIFBDSQo+IGhvc3QgYnJpZGdlIG1heSBwcm9iZSBsYXRlciBhbmQgdGhlbiBmYWlscyB0
byBjbGFpbSBpdHMgbWVtb3J5IHdpbmRvdy4KPiBPbiBRRU1VIFJJU0MtViB2aXJ0IHdpdGggRURL
MiwgYSBib2Nocy1kaXNwbGF5IGFuZCBwY2ktaG9zdC1nZW5lcmljCj4gYnVpbHQgYXMgYSBtb2R1
bGU6Cj4KPiAgICBbICAgIDAuNzAzODEzXSBwY2ktaG9zdC1nZW5lcmljIDMwMDAwMDAwLnBjaTog
cmVzb3VyY2UgY29sbGlzaW9uOiBbbWVtIDB4NDAwMDAwMDAtMHg3ZmZmZmZmZl0gY29uZmxpY3Rz
IHdpdGggQk9PVEZCIFttZW0gMHg0MDAwMDAwMC0weDQwM2U3ZmZmXQo+Cj4gSW4gdGhhdCBjYXNl
LCByZWdpc3RlciBhbiBlZmktZnJhbWVidWZmZXIgZGV2aWNlIGluc3RlYWQuIEl0IGNsYWltcyBu
bwo+IG1lbW9yeSBiZWZvcmUgaXQgcHJvYmVzLCBhbmQgY29tbWl0IDY0YzhhMGNkMGE1MyAoImVm
aS9hcm06IERlZmVyIHByb2JlCgpCdXQgaXQgc2hvdWxkIGNsYWltIHRoZSBtZW1vcnkgZXhhY3Rs
eSBmb3IgZGV0ZWN0aW5nIHRoZXNlIGNvbGxpc2lvbnMuCgoKPiBvZiBQQ0llIGJhY2tlZCBlZmlm
YiBvbiBEVCBzeXN0ZW1zIikgbWFrZXMgaXQgd2FpdCBmb3IgdGhlIGhvc3QgYnJpZGdlLgo+Cj4g
VGVzdGVkIG9uIGEgSGlGaXZlIFVubWF0Y2hlZCB3aXRoIEVESzIgYW5kIGEgUENJZSBncmFwaGlj
cyBjYXJkLCBhbmQgb24KPiBRRU1VLgo+Cj4gRml4ZXM6IDg2MzNlZjgyZjEwMSAoImRyaXZlcnMv
ZmlybXdhcmU6IGNvbnNvbGlkYXRlIEVGSSBmcmFtZWJ1ZmZlciBzZXR1cCBmb3IgYWxsIGFyY2hl
cyIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBIYW4gR2Fv
IDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4gLS0tCj4gSW4gUUVNVSwgZWZpZmIgdGFrZXMgb3ZlciB3
aXRoIFNZU0ZCX1NJTVBMRUZCIGFuZCBlZmlkcm0gd2l0aG91dCBpdC4KCkl0J3MgZWl0aGVyIGVm
aWZiIG9yIGVmaWRybS4gQW5kIHRoZSBsYXR0ZXIgaXMgc3Ryb25nbHkgcHJlZmVycmVkLgoKPiBX
aXRoIHBjaS1ob3N0LWdlbmVyaWMgYnVpbHQgaW4sIHNpbXBsZWRybSBpcyBzdGlsbCB1c2VkLgoK
QW5kIHRoYXQgd291bGQgYmUgeW91ciB3b3JrYXJvdW5kLgoKSSBkaXNjdXNzZWQgd2l0aCBKYXZp
ZXIgYSBiaXQuIFdlIGFncmVlZCB0aGF0IGEgcmVhbCBzb2x1dGlvbiB3b3VsZCBydW4gCnRoZSBz
eXNmYiBjb2RlIGFzIHBhcnQgb2YgdGhlIFBDSSBpbml0aWFsaXphdGlvbi4gVGhhdCB3b3VsZCBm
aXggYSBmZXcgCm90aGVyIHByb2JsZW1zLCBJIHRoaW5rLgoKQmVzdCByZWdhcmRzClRob21hcwoK
Cj4gLS0tCj4gICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9zeXNmYl9lZmkuYyB8IDE2ICsrKysrKysr
KysrKysrKysKPiAgIGRyaXZlcnMvZmlybXdhcmUvc3lzZmIuYyAgICAgICAgIHwgIDggKysrKysr
Ky0KPiAgIGluY2x1ZGUvbGludXgvc3lzZmIuaCAgICAgICAgICAgIHwgIDYgKysrKysrCj4gICAz
IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL2VmaS9zeXNmYl9lZmkuYyBiL2RyaXZlcnMvZmlybXdh
cmUvZWZpL3N5c2ZiX2VmaS5jCj4gaW5kZXggMjMzOGRlNzNjNjJjLi41YzJjYjg3MTc4ZmYgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9lZmkvc3lzZmJfZWZpLmMKPiArKysgYi9kcml2
ZXJzL2Zpcm13YXJlL2VmaS9zeXNmYl9lZmkuYwo+IEBAIC00MjEsNiArNDIxLDIyIEBAIF9faW5p
dCB2b2lkIHN5c2ZiX2FwcGx5X2VmaV9xdWlya3Moc3RydWN0IHNjcmVlbl9pbmZvICpzaSkKPiAg
IAkJZG1pX2NoZWNrX3N5c3RlbShlZmlmYl9kbWlfc3dhcF93aWR0aF9oZWlnaHQpOwo+ICAgfQo+
ICAgCj4gKy8qIFJldHVybnMgdHJ1ZSBpZiB0aGUgRUZJIGZyYW1lYnVmZmVyIGlzIGluIGEgRFQg
UENJIGhvc3QgYnJpZGdlIHdpbmRvdyAqLwo+ICtfX2luaXQgYm9vbCBzeXNmYl9lZmlmYl9iZWhp
bmRfZHRfcGNpKGNvbnN0IHN0cnVjdCBzY3JlZW5faW5mbyAqc2kpCj4gK3sKPiArCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnA7Cj4gKwo+ICsJaWYgKHNpLT5vcmlnX3ZpZGVvX2lzVkdBICE9IFZJREVP
X1RZUEVfRUZJIHx8ICFJU19FTkFCTEVEKENPTkZJR19QQ0kpKQo+ICsJCXJldHVybiBmYWxzZTsK
PiArCj4gKwlucCA9IGZpbmRfcGNpX292ZXJsYXBfbm9kZSgpOwo+ICsJaWYgKCFucCkKPiArCQly
ZXR1cm4gZmFsc2U7Cj4gKwo+ICsJb2Zfbm9kZV9wdXQobnApOwo+ICsJcmV0dXJuIHRydWU7Cj4g
K30KPiArCj4gICBfX2luaXQgdm9pZCBzeXNmYl9zZXRfZWZpZmJfZndub2RlKGNvbnN0IHN0cnVj
dCBzY3JlZW5faW5mbyAqc2ksIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkKQo+ICAgewo+ICAg
CWlmIChzaS0+b3JpZ192aWRlb19pc1ZHQSA9PSBWSURFT19UWVBFX0VGSSAmJiBJU19FTkFCTEVE
KENPTkZJR19QQ0kpKSB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvc3lzZmIuYyBi
L2RyaXZlcnMvZmlybXdhcmUvc3lzZmIuYwo+IGluZGV4IDg4MzM1ODJjMTg4My4uODg1M2E3NDU2
MGI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvc3lzZmIuYwo+ICsrKyBiL2RyaXZl
cnMvZmlybXdhcmUvc3lzZmIuYwo+IEBAIC0xNjQsOCArMTY0LDE0IEBAIHN0YXRpYyBfX2luaXQg
aW50IHN5c2ZiX2luaXQodm9pZCkKPiAgIAkJZ290byB1bmxvY2tfbXV0ZXg7Cj4gICAJfQo+ICAg
Cj4gLQkvKiB0cnkgdG8gY3JlYXRlIGEgc2ltcGxlLWZyYW1lYnVmZmVyIGRldmljZSAqLwo+ICsJ
LyoKPiArCSAqIFRyeSB0byBjcmVhdGUgYSBzaW1wbGUtZnJhbWVidWZmZXIgZGV2aWNlLiBJdCBj
bGFpbXMgdGhlIG1lbW9yeQo+ICsJICogd2hlbiBpdCBpcyBhZGRlZCwgc28gYSBEVCBQQ0kgaG9z
dCBicmlkZ2UgdGhhdCBwcm9iZXMgbGF0ZXIgd291bGQKPiArCSAqIGZhaWwuIFVzZSBhbiBlZmkt
ZnJhbWVidWZmZXIgZGV2aWNlIHRoZXJlOyBpdCB3YWl0cyBmb3IgdGhlIGJyaWRnZS4KPiArCSAq
Lwo+ICAgCWNvbXBhdGlibGUgPSBzeXNmYl9wYXJzZV9tb2RlKHNpLCAmbW9kZSk7Cj4gKwlpZiAo
Y29tcGF0aWJsZSAmJiAhcGFyZW50ICYmIHN5c2ZiX2VmaWZiX2JlaGluZF9kdF9wY2koc2kpKQo+
ICsJCWNvbXBhdGlibGUgPSBmYWxzZTsKPiAgIAlpZiAoY29tcGF0aWJsZSkgewo+ICAgCQlwZCA9
IHN5c2ZiX2NyZWF0ZV9zaW1wbGVmYihzaSwgJm1vZGUsIHBhcmVudCk7Cj4gICAJCWlmICghSVNf
RVJSKHBkKSkKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zeXNmYi5oIGIvaW5jbHVkZS9s
aW51eC9zeXNmYi5oCj4gaW5kZXggZWQyM2Q2NTE2MjIzLi5iMTM2ZmRlYmM3NDYgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9saW51eC9zeXNmYi5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9zeXNmYi5o
Cj4gQEAgLTk1LDYgKzk1LDcgQEAgc3RhdGljIGlubGluZSBib29sIHN5c2ZiX2hhbmRsZXNfc2Ny
ZWVuX2luZm8odm9pZCkKPiAgIAo+ICAgZXh0ZXJuIHN0cnVjdCBlZmlmYl9kbWlfaW5mbyBlZmlm
Yl9kbWlfbGlzdFtdOwo+ICAgdm9pZCBzeXNmYl9hcHBseV9lZmlfcXVpcmtzKHN0cnVjdCBzY3Jl
ZW5faW5mbyAqc2kpOwo+ICtib29sIHN5c2ZiX2VmaWZiX2JlaGluZF9kdF9wY2koY29uc3Qgc3Ry
dWN0IHNjcmVlbl9pbmZvICpzaSk7Cj4gICB2b2lkIHN5c2ZiX3NldF9lZmlmYl9md25vZGUoY29u
c3Qgc3RydWN0IHNjcmVlbl9pbmZvICpzaSwgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGQpOwo+
ICAgCj4gICAjZWxzZSAvKiBDT05GSUdfRUZJICovCj4gQEAgLTEwMyw2ICsxMDQsMTEgQEAgc3Rh
dGljIGlubGluZSB2b2lkIHN5c2ZiX2FwcGx5X2VmaV9xdWlya3Moc3RydWN0IHNjcmVlbl9pbmZv
ICpzaSkKPiAgIHsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW5saW5lIGJvb2wgc3lzZmJfZWZpZmJf
YmVoaW5kX2R0X3BjaShjb25zdCBzdHJ1Y3Qgc2NyZWVuX2luZm8gKnNpKQo+ICt7Cj4gKwlyZXR1
cm4gZmFsc2U7Cj4gK30KPiArCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgc3lzZmJfc2V0X2VmaWZi
X2Z3bm9kZShjb25zdCBzdHJ1Y3Qgc2NyZWVuX2luZm8gKnNpLAo+ICAgCQkJCQkgIHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkKQo+ICAgewo+Cj4gLS0tCj4gYmFzZS1jb21taXQ6IDY2MjhlN2Q0
YzZiMjVjOGQxOGYxMzQ1ZTNhMjBkMjE4MjlhYWU3ZTQKPiBjaGFuZ2UtaWQ6IDIwMjYxMTA3LXN5
c2ZiLWR0LXBjaS1lZmlmYi1kNzNiMDhkZWQ0YjIKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IEhh
biBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPgo+CgotLSAKLS0KVGhvbWFzIFppbW1lcm1hbm4K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgKRnJhbmtlbnN0ci4gMTQ2LCA5MDQ2MSBOw7xybmJlcmcsIEdlcm1hbnksIHd3dy5zdXNl
LmNvbQpHRjogU3RlZmFuIEdhaXNlciwgSm9jaGVuIEphc2VyLCBBYmhpbmF2IFB1cmksIChIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
