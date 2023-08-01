Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E93C04A94
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 16:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIYzdpJIRQ48BteyIx3Euhv8ahWlq3+aJB5jZQyS9NY=; b=JphXLsb9goHlCX9omo1tSrQcju
	CQP44Eh9kvYLLnOJztQnop33bZjmss/0okF8w1SmRGdHilfFq98CS8IKvTYbU/ppRLwRy0P4ZQnMv
	HLuLyx7ixxmvJbd5WNl97COo3Xkocj70E7/sgUEGQGOc30psA0FbRB1pxaYDUXZc/BVaDxT5vC6rE
	+de3wD4bxVZFWPPXWih+xDwTrONnWmzWmugyX7J4eko03bTxgHoOAzlTJteceNvm27z5QUu7meOn0
	U4klMiVeHsAIdRG+K5O+pFaZkQNVelxdQRz71DQhHr3wTqy4FPOKFOF07c/w8IxwD+GyNJERy8tRY
	VFYaLtNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQsf0-002rEy-24;
	Tue, 01 Aug 2023 16:55:50 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQsex-002rDb-2d
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 16:55:49 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 675E321C5A;
	Tue,  1 Aug 2023 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1690908943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2wJGrCodiFacIQZflH9R6dQqAyomHz+cFLPpNk0lajQ=;
	b=TDZ9lKQMhrHc1AR1LuAXp5Tf9AguCo8xpgKK+zjT39q4efiYfn94Cm/Ko5k4J2u1h4VRFR
	w3vB8r/E1dpFLL4dNofINx/9Six8SvZLoppUT2y29YjHdEMfDage5T1VBrtxL0OLlg1drC
	AcBJLYMaXgik1cwS5siI8RxGNGcxHuc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690908943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2wJGrCodiFacIQZflH9R6dQqAyomHz+cFLPpNk0lajQ=;
	b=U97WmX2iRrPFW29Xxax7UDZILg2veMmwjNvB+tnpBQcLv54/EakR9Ow1Xd6dAkdUZYAXxU
	B3eRzcWwi/4EuzBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1862D139BD;
	Tue,  1 Aug 2023 16:55:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id rIn0BA85yWTiMAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Tue, 01 Aug 2023 16:55:43 +0000
Message-ID: <70690ae5-c2eb-6f8e-8335-e5052db5204b@suse.de>
Date: Tue, 1 Aug 2023 18:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 1/4] vgacon: rework Kconfig dependencies
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
Cc: javierm@redhat.com, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, Ard Biesheuvel <ardb@kernel.org>,
 Helge Deller <deller@gmx.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
References: <20230707095415.1449376-1-arnd@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230707095415.1449376-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_095547_995612_6096EE92 
X-CRM114-Status: GOOD (  28.61  )
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
Content-Type: multipart/mixed; boundary="===============8763832032467848713=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8763832032467848713==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------V2Kx07z5UT1mt9SnMBadeWbI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------V2Kx07z5UT1mt9SnMBadeWbI
Content-Type: multipart/mixed; boundary="------------2bQgjjzopkAYok3GbchMEycT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: javierm@redhat.com, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, Ard Biesheuvel <ardb@kernel.org>,
 Helge Deller <deller@gmx.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Message-ID: <70690ae5-c2eb-6f8e-8335-e5052db5204b@suse.de>
Subject: Re: [PATCH 1/4] vgacon: rework Kconfig dependencies
References: <20230707095415.1449376-1-arnd@kernel.org>
In-Reply-To: <20230707095415.1449376-1-arnd@kernel.org>

--------------2bQgjjzopkAYok3GbchMEycT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

cGluZyEgV2hhdCdzIHRoZSBzdGF0dXMgb2YgdGhpcyBwYXRjaHNldD8NCg0KQW0gMDcuMDcu
MjMgdW0gMTE6NTIgc2NocmllYiBBcm5kIEJlcmdtYW5uOg0KPiBGcm9tOiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPg0KPiANCj4gVGhlIGxpc3Qgb2YgZGVwZW5kZW5jaWVzIGhl
cmUgaXMgcGhyYXNlZCBhcyBhbiBvcHQtb3V0LCBidXQgdGhpcyBpcyBtaXNzaW5nDQo+IGEg
bG90IG9mIGFyY2hpdGVjdHVyZXMgdGhhdCBkb24ndCBhY3R1YWxseSBzdXBwb3J0IFZHQSBj
b25zb2xlcywgYW5kIHNvbWUNCj4gb2YgdGhlIGVudHJpZXMgYXJlIHN0YWxlOg0KPiANCj4g
ICAtIHBvd2VycGMgdXNlZCB0byBzdXBwb3J0IFZHQSBjb25zb2xlcyBpbiB0aGUgb2xkIGFy
Y2gvcHBjIGNvZGViYXNlLCBidXQNCj4gICAgIHRoZSBtZXJnZWQgYXJjaC9wb3dlcnBjIG5l
dmVyIGRpZA0KPiANCj4gICAtIGFybSBsaXN0cyBmb290YnJpZGdlLCBpbnRlZ3JhdG9yIGFu
ZCBuZXR3aW5kZXIsIGJ1dCBuZXR3aW5kZXIgaXMgYWN0dWFsbHkNCj4gICAgIHBhcnQgb2Yg
Zm9vdGJyaWRnZSwgYW5kIGludGVncmF0b3IgZG9lcyBub3QgYXBwZWFyIHRvIGhhdmUgYW4g
YWN0dWFsDQo+ICAgICBWR0EgaGFyZHdhcmUsIG9yIGxpc3QgaXQgaW4gaXRzIEFUQUcgb3Ig
RFQuDQo+IA0KPiAgIC0gbWlwcyBoYXMgYSBmZXcgcGxhdGZvcm1zIChqYXp6LCBzaWJ5dGUs
IGFuZCBzbmkpIHRoYXQgaW5pdGlhbGl6ZQ0KPiAgICAgc2NyZWVuX2luZm8sIG9uIGV2ZXJ5
dGhpbmcgZWxzZSB0aGUgY29uc29sZSBpcyBzZWxlY3RlZCBidXQgY2Fubm90DQo+ICAgICBh
Y3R1YWxseSB3b3JrLg0KPiANCj4gICAtIGNza3ksIGhleGdhZ29uLCBsb29uZ2FyY2gsIG5p
b3MyLCByaXNjdiBhbmQgeHRlbnNhIGFyZSBub3QgbGlzdGVkDQo+ICAgICBpbiB0aGUgb3B0
LW91dCB0YWJsZSBhbmQgZGVjbGFyZSBhIHNjcmVlbl9pbmZvIHRvIGFsbG93IGJ1aWxkaW5n
DQo+ICAgICB2Z2FfY29uLCBidXQgdGhpcyBjYW5ub3Qgd29yayBiZWNhdXNlIHRoZSBjb25z
b2xlIGlzIG5ldmVyIHNlbGVjdGVkLg0KPiANCj4gUmVwbGFjZSB0aGlzIHdpdGggYW4gb3B0
LWluIHRhYmxlIHRoYXQgbGlzdHMgb25seSB0aGUgcGxhdGZvcm1zIHRoYXQNCj4gcmVtYWlu
LiBUaGlzIGlzIGVmZmVjdGl2ZWx5IHg4NiwgcGx1cyBhIGNvdXBsZSBvZiBoaXN0b3JpYyB3
b3Jrc3RhdGlvbg0KPiBhbmQgc2VydmVyIG1hY2hpbmVzIHRoYXQgcmV1c2VkIHBhcnRzIG9m
IHRoZSB4ODYgc3lzdGVtIGFyY2hpdGVjdHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8v
Y29uc29sZS9LY29uZmlnIHwgNiArKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlkZW8vY29uc29sZS9LY29uZmlnIGIvZHJpdmVycy92aWRlby9jb25zb2xlL0tjb25maWcN
Cj4gaW5kZXggYTJhODhkNDJlZGYwYy4uNDdjNDk4ZGVmYzIxMSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy92aWRlby9jb25zb2xlL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy92aWRlby9j
b25zb2xlL0tjb25maWcNCj4gQEAgLTcsOSArNyw5IEBAIG1lbnUgIkNvbnNvbGUgZGlzcGxh
eSBkcml2ZXIgc3VwcG9ydCINCj4gICANCj4gICBjb25maWcgVkdBX0NPTlNPTEUNCj4gICAJ
Ym9vbCAiVkdBIHRleHQgY29uc29sZSIgaWYgRVhQRVJUIHx8ICFYODYNCj4gLQlkZXBlbmRz
IG9uICE0eHggJiYgIVBQQ184eHggJiYgIVNQQVJDICYmICFNNjhLICYmICFQQVJJU0MgJiYg
ICFTVVBFUkggJiYgXA0KPiAtCQkoIUFSTSB8fCBBUkNIX0ZPT1RCUklER0UgfHwgQVJDSF9J
TlRFR1JBVE9SIHx8IEFSQ0hfTkVUV0lOREVSKSAmJiBcDQo+IC0JCSFBUk02NCAmJiAhQVJD
ICYmICFNSUNST0JMQVpFICYmICFPUEVOUklTQyAmJiAhUzM5MCAmJiAhVU1MDQo+ICsJZGVw
ZW5kcyBvbiBBTFBIQSB8fCBJQTY0IHx8IFg4NiB8fCBcDQo+ICsJCShBUk0gJiYgQVJDSF9G
T09UQlJJREdFKSB8fCBcDQo+ICsJCShNSVBTICYmIChNSVBTX01BTFRBIHx8IFNJQllURV9C
Q00xMTJYIHx8IFNJQllURV9TQjEyNTAgfHwgU0lCWVRFX0JDTTF4ODAgfHwgU05JX1JNKSkN
Cj4gICAJc2VsZWN0IEFQRVJUVVJFX0hFTFBFUlMgaWYgKERSTSB8fCBGQiB8fCBWRklPX1BD
SV9DT1JFKQ0KPiAgIAlkZWZhdWx0IHkNCj4gICAJaGVscA0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJn
LCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFs
ZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------2bQgjjzopkAYok3GbchMEycT--

--------------V2Kx07z5UT1mt9SnMBadeWbI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTJOQ4FAwAAAAAACgkQlh/E3EQov+C8
AA/+KnRDuYQRR/mF98DBfmrHT5Ia6xQSG3uvFuQDrbaKBsjqD2QXy1PNFOGyjSmDdFvEkQgLUEF0
pU8EoGE0mG7m//BybV/hRDjLmylbBIjgjv4uzYT6sQQ2HFgJe5bhU+lTUJ7ou5S72bFvVbrsU2ed
7ZJth7Gg/0ISIuQ+YvMlNOubgolEVWpb3vv4iFOMwf/Z8OtmWhXe0hae/PhUtJgtGGpDA22NQMWw
C8Xgy4sj+oDLHOGKljPDTYphn2wnbBHbniQB6+16mkaCbC0jj83h0aglF3doR5+VtsqJlulUGw2L
o1Da2b1fj6gNd4j+nUCihbmBjEoyW6Z92ObBaIRPJ6mXGHPylW1ilH9TFvvRqzlgngckgNPN2b5y
P+mLTquYg1QI2DOue03EH+hs4ENNC8UeIJsAAtk8qtN9U/SsKfRgKn04/PG2zkT1NvB68nfm34g4
B30CeLIVUSrAPt9s3veG6GovLraSTf4jznRAVXrXwB9AxqRexyVN02g7hXqsBgK/OIyyjd81rvyj
lzzyMjwCnSnHktiLvoS3Chej5vW3kCLbayrLgkGMbztNuD8bbQgaFYtzqMJ+cBF7xKWNq5Ebx3zc
SQb+HvTRbdT/2HsCEwaJILuWF9xcbkMMk2yJykvBFCmd9JfOZT55CMp27lyUlKqsMy8nYyV+HyZH
HMA=
=PJsE
-----END PGP SIGNATURE-----

--------------V2Kx07z5UT1mt9SnMBadeWbI--


--===============8763832032467848713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8763832032467848713==--

