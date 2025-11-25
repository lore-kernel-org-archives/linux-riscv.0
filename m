Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091E7CFD364
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 07:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FK8peHstaHrK9dmsF3RT8nBkLiQ59rAhfUYihhjYkU=; b=mgDJVofo9PoD2m
	7Mq3/45s6M8wvilJvilpdYarw4cnCWHPj/cFhLONHPft1t5FVVKh6uq3r5m2k4sUyiW9/W+lzoVs9
	tk7+XzGsKRfEihpxY1Qi/L6xI2D46ZbGULTJkjd2IQWIbUrmvrKEAkuPspYxHqYxB9/Q4yxOs6vSx
	TfnP9ZH75s9hQyWLhq+WxxC4l3B+02v++flpPbnTygz841u6WY0Vspdsu3MIRKRjLEDTvZ9HvkYLq
	mayU72IVUXAPH7VWVEulCGTy/kXS5CR9Sg8ZATlz2oyzdejTpjYFUwiStT5mnDQ8b08fV2sobhtA7
	692NDQJVjYm9umXdWTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnLC-0000000CsoY-1eYb;
	Tue, 25 Nov 2025 07:19:58 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnL9-0000000CsnW-2wLi
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 07:19:56 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 99FA922653;
	Tue, 25 Nov 2025 07:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764055193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TPntlOqdFWfhwr/Kbhykec41hobmmKyQB3TzxwFkUv4=;
	b=WUdO/WfD173ZFq/tfqsxWjrcSCfzNOy7tCuCaHuzEzYTyMWLfWbSib+W6SkFD1tRLlwL/q
	DwpKjQoEkV9VRf3QULw259l6zaM7JVcR8IAq395MIcXM75BJY7k0P2uefrI5y2ffhOsh6Z
	sE6cnd7fyct7T3tkXKZJnYk4rUZ0pjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764055193;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TPntlOqdFWfhwr/Kbhykec41hobmmKyQB3TzxwFkUv4=;
	b=dl8Ok7ikIupkgbJXbm1AVIfcq/9jM7IhiDaGX+BG12s20Hlm7OY4gJHWiPARPiIZOS2wnd
	GrZUz0T1bdH7R3AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764055193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TPntlOqdFWfhwr/Kbhykec41hobmmKyQB3TzxwFkUv4=;
	b=WUdO/WfD173ZFq/tfqsxWjrcSCfzNOy7tCuCaHuzEzYTyMWLfWbSib+W6SkFD1tRLlwL/q
	DwpKjQoEkV9VRf3QULw259l6zaM7JVcR8IAq395MIcXM75BJY7k0P2uefrI5y2ffhOsh6Z
	sE6cnd7fyct7T3tkXKZJnYk4rUZ0pjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764055193;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TPntlOqdFWfhwr/Kbhykec41hobmmKyQB3TzxwFkUv4=;
	b=dl8Ok7ikIupkgbJXbm1AVIfcq/9jM7IhiDaGX+BG12s20Hlm7OY4gJHWiPARPiIZOS2wnd
	GrZUz0T1bdH7R3AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2035F3EA63;
	Tue, 25 Nov 2025 07:19:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ynIsBplYJWn5QQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 25 Nov 2025 07:19:53 +0000
Message-ID: <8ff77586-724e-48a4-9282-643e8fa84d96@suse.de>
Date: Tue, 25 Nov 2025 08:19:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] efi: Support EDID information
To: Ard Biesheuvel <ardb@kernel.org>
Cc: javierm@redhat.com, arnd@arndb.de, richard.lyu@suse.com, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20251124165116.502813-1-tzimmermann@suse.de>
 <20251124165116.502813-9-tzimmermann@suse.de>
 <CAMj1kXFu4=L=ROVAaRORG5HMmYWHb6OXQf6pJ3yAZpeDmfmSeg@mail.gmail.com>
 <CAMj1kXFtsneE3dFgUx6Hd=iBhD8YpvjfTSi-KZpuNaXfX07KyA@mail.gmail.com>
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
In-Reply-To: <CAMj1kXFtsneE3dFgUx6Hd=iBhD8YpvjfTSi-KZpuNaXfX07KyA@mail.gmail.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.com:url]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_231955_887311_27260387 
X-CRM114-Status: GOOD (  10.10  )
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

SGkKCkFtIDI0LjExLjI1IHVtIDE4OjA0IHNjaHJpZWIgQXJkIEJpZXNoZXV2ZWw6Cj4gT24gTW9u
LCAyNCBOb3YgMjAyNSBhdCAxODowMSwgQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4g
d3JvdGU6Cj4+IE9uIE1vbiwgMjQgTm92IDIwMjUgYXQgMTc6NTIsIFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToKPj4+IEFkZCBMSU5VWF9FRklfUFJJTUFSWV9E
SVNQTEFZX1RBQkxFX0dVSUQgdG8gdGhlIGxpc3Qgb2YgY29uZmlnLXRhYmxlCj4+PiBVVUlEcy4g
UmVhZCBzeXNmYl9wcmltYXJ5X2Rpc3BsYXkgZnJvbSB0aGUgZW50cnkuIFRoZSBVVUlEIGhhcyBi
ZWVuCj4+PiBnZW5lcmF0ZWQgd2l0aCB1dWlkZ2VuLgo+Pj4KPj4+IFN0aWxsIHN1cHBvcnQgTElO
VVhfRUZJX1NDUkVFTl9JTkZPX1RBQkxFX0dVSUQgYXMgZmFsbGJhY2sgaW4gY2FzZSBhbgo+Pj4g
b2xkZXIgYm9vdCBsb2FkZXIgaW52b2tlcyB0aGUga2VybmVsLgo+Pj4KPj4+IElmIENPTkZJR19G
SVJNV0FSRV9FRElEPW4sIEVESUQgaW5mb3JtYXRpb24gaXMgZGlzYWJsZWQuCj4+Pgo+Pj4gTWFr
ZSB0aGUgS2NvbmZpZyBzeW1ib2wgQ09ORklHX0ZJUk1XQVJFX0VESUQgYXZhaWxhYmxlIHdpdGgg
RUZJLiBTZXR0aW5nCj4+PiB0aGUgdmFsdWUgdG8gJ24nIGRpc2FibGVzIEVESUQgc3VwcG9ydC4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4KPj4gV2h5IGFyZSB3ZSBhZGRpbmcgYSBuZXcgY29uZmlnIHRhYmxlIGFnYWluPwo+Pgo+
Pgo+IE5vdGUgdGhhdCBMSU5VWF9FRklfU0NSRUVOX0lORk9fVEFCTEVfR1VJRCBpcyBpbnRlcm5h
bCBBQkkgb25seQo+IGJldHdlZW4gdGhlIEVGSSBzdHViIGFuZCB0aGUgY29yZSBrZXJuZWwuCgpB
aCwgb2suIFRoYXQncyBteSBtaXNjb25jZXB0aW9uLiBJIHdhcyB0aGlua2luZyB0aGF0IHdlIGhh
dmUgdG8gc3VwcG9ydCAKZXh0ZXJuYWwgYm9vdCBsb2FkZXJzIGJ1aWxkaW5nIGEgY29uZmlnIHRh
YmxlLgoKSSdsbCBqdXN0IGV4dGVuZCB0aGUgZXhpc3RpbmcgVVVJRCB0aGVuLgoKQmVzdCByZWdh
cmRzClRob21hcwoKCi0tIAotLQpUaG9tYXMgWmltbWVybWFubgpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApGcmFua2Vuc3RyLiAx
NDYsIDkwNDYxIE7DvHJuYmVyZywgR2VybWFueSwgd3d3LnN1c2UuY29tCkdGOiBKb2NoZW4gSmFz
ZXIsIEFuZHJldyBNY0RvbmFsZCwgV2VybmVyIEtub2JsaWNoLCAoSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
