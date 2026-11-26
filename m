Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C430606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BtEDhqso;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uRmF1n3J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6KJK/P6F6L1CLmCQPhnzagrCRq4O9yHtZ7NW1JxD4Kw=; b=BtEDhqso+pEEBVU0rJ1R82UHad
	F92iQf+JpP+tcnrV7Pn4oK9Mewt6tiru46Bf86LPh5AMYMiUR+M+AJoeq9/jTryZGeDwDWZjUmSwH
	ebPrEzKidkP5N4ihtuXUkD0JiZUJXtoudlSXV5Ia6vH8WkqDikjwq4G2zqt1Jtiw+vLWr3qsi9HA3
	c/SWlgyN0IlGvFEe1mPlnWN8JIO3dubpMjMRqc23H0YTFrOPDNI4JdWoESrnHeOH5L2Uy+JjB57X+
	jeGffpTyPeV58bCPVX7avrmchi0VZc4nEC3ZVC2sd4NMjCobVHC6KfJMewEDiCGNe7uihcKqN62Wi
	6B1AC0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTok-0000000CHg6-1RQR;
	Thu, 26 Nov 2026 07:22:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWToh-0000000CHfg-2CU8
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 07:22:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so8398631a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 23:22:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795677769; cv=none;
        d=google.com; s=arc-20260327;
        b=C1H14q/Ul1PZ44VIRei7w2yVozvtm+AcRO8ew0J4lZCfbStEUWIQ+vt7dTqFVMrjxK
         MTSIryL9zHSz9xHQjHcT8o4gn+GQZxqxKqNHa1oSndU+KwrCZyuW4+VGgpYOAIIw2vp+
         +6ZT99kEtLw1qLGo42Ik8hvlYJLAzPOYIlqNp8ppChm/Wh5cUBRC0YQxNhDn/BFL9xIY
         JPd31T6OCCNyNERtsvyVJrQPsQ9DJDgBGeOgJ2N5uxD1dJeqsxcq/j6Nt1TIdIcBDLaE
         QV2INjYljgVQOSwiKp+hftyEfuifHwG4VoPAuDZCMhmmlWRlSlRKKITeYnr7WzuzO46e
         T+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SPUgkbv+5hbrbd2VDmsoa2vVwDhsYIwbnba5cs+Fw+s=;
        fh=vJ1PkHoAKBpUgsBR/94dIli4pxoYE2f/uOjbDqRdtsQ=;
        b=U71EcWHZOYjWbByLOlVWYNUE5rWfbm61HBDu/RgG1/pns5yqswHtfbkCq8mZHXMtnV
         3fBziCgkcosA2/LcuBQVOepFfQkAHlatGbRt7JqUx5RDSlJJDM72NVRaQOpnxEYIFim/
         T6kYLIYdgq35u3/GeKRWk82SWV+J24SskPHqjBlkSBpsR0lU1hSmzhN1G3Xar50w1JuL
         wghzOqo4BCi80lFzAckDkAGQyKbfjssjtp9ZD8F2A49SD1uzSaOcNrr4omcNzWD7Y6RD
         MR9K3pJlYss5hlkIBzaayA/KcRls1NpQhF7Yoy8+9GvC9xepsGaXX6GzflRG7HRdPqWF
         Kvbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795677769; x=1796282569; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SPUgkbv+5hbrbd2VDmsoa2vVwDhsYIwbnba5cs+Fw+s=;
        b=uRmF1n3Jd7RPNCkMeMS6T2sRF7mUgfVAuu+Vyj8oNiCZwiPB46KmGHOZO+fEhGeJDt
         Ic0+SiLKIFL9bU6SjcXVBijyF3I+rSgSZz+Fz5olvefQRlAFmgUiBu1+UHmEuijvUk8d
         rVch/tglFryeBkHWlIvjiooPeg9LvL29MbcOqmuxNG1JZclsQ43IwqVNfoGurk9Ueqbx
         dda9MS9u2jR6CI+Eze4jjxuJD36uWDez3pNxXdAvLZEQDBM8PDtnhhdDqNezHLwcMcWe
         kvA+esNqkfYOvj9kHo4SU8sOODH9IiWEIaSU1MKSN6uV4iY9qTPj5yjICQGY1LD2ZhkF
         n/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677769; x=1796282569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPUgkbv+5hbrbd2VDmsoa2vVwDhsYIwbnba5cs+Fw+s=;
        b=ICCXYxZDo0F0UDJIZPoLdtO2WpmWgiUzwW0yvYbVYwlLLYlIu++JXv/H692PnUUcvy
         l2Pepho47+nFneDyG/AAeAdfQpf4XOPQ2QB69JoykSivKsBnIBBi1YXFRJaqy9mV1KOX
         4hx+DDHQalCHO+td5Qr2aYnhFZf2gSxhTC10M5U4F22O1i1XSWNfpF+3AnAScl7jWCHs
         UFsZSRlJnv7J6aQc6X6GHESQ4tdWP48xUIpIrykHP1H6y59EiIDeMgfbdWgmDatYXNNN
         xMtEZp4g6itsKaTDE3SJ7ZOGk1+PN0uTys3zJgmJwwF4hhWgjuMJ7/M4Pl2iOhrfJ0iy
         v6Dw==
X-Forwarded-Encrypted: i=1; AL+hErHFL3TN/lOIsHwG0bjgmiKxy5YQa7oktPqqEY5piCUPtwwMGy/FnZy/JWa2Hfthfd56Ls++QQUWfL1K1Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/ERNal24BB/a7QMEN5eYaDDP3zJFrfI1WsKawFcv1eqLzlj77J
	yrVwAhE8x7ajd8H3e4A9uZOCooHcPsLakSJQXDll32pUZvLIc+qP9dlqk1WQkxadamwM8QxwVqc
	Tmh2EpQqm0+pJq6H3Yr05EMlCK5k1HLE=
X-Gm-Gg: AZFdTZcqxqxLiPGXDlSPpLKUVrEBh8BCUxUGRtvXdpbZCSTzxlmX/04cJD8OS1MPQzA
	rzYkcU0ggpfPvQEuTPACl+wksQd4g3OW0b56Nok5lY7ceok81MtbFq981X2iRoVAExkqivPMMtI
	K6bggeKdgcUHGBeuvaDtqhnBlueQKQ/+tcnuZ233FzOozrLjmb5ul9BvUgAulaOLAD3QV635siL
	ElxJvfJcm13R+fho7v4/RYuHfvqxf3xEp6eXPL/rcMiDrLpsHPlUk14+EFxkDU+P/OPHlMYaRuB
	+1uweNDlGheRc/I+n4e3Nx5qdZSvM0h6VPxKt0cBE8pz8M7cMRP8WDiHup5w4TysF1Z+6+GdP2l
	2TCtFMRf8tjyctofcKQrPLZ79NoTGtphcZ7E=
X-Received: by 2002:a05:6402:4028:b0:6bb:791:ff67 with SMTP id
 4fb4d7f45d1cf-6bb079203damr5476823a12.5.1795677769197; Wed, 25 Nov 2026
 23:22:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net> <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
 <awXUSuYOUQMPCl-5@aurel32.net> <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
 <CAKyUbwUyYptzZrMFKD-RjmufU7Wni8-w5vQvPyxUgx9BU++vsw@mail.gmail.com>
 <CANAwSgSNuEC72PM=1ai3xj31+=veLkDhAfuNJ3pmCggBtx9v-Q@mail.gmail.com> <CAKyUbwVuigJqbXiVYS28QKodMELPEd1yNu1Q9xZvmA_TmRHOmg@mail.gmail.com>
In-Reply-To: <CAKyUbwVuigJqbXiVYS28QKodMELPEd1yNu1Q9xZvmA_TmRHOmg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 26 Nov 2026 12:52:35 +0530
X-Gm-Features: Aa3M54pMN9b6aWYnLqqIo-KqyU1z4jP6pGRJ-3rxY5I_CHcjHcYErK2-yuz-XjA
Message-ID: <CANAwSgQv_QJyfMkqnwrNe0T8qRz-djjCPNB++yP-_AYqCZqQrg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_232251_622917_E37C3A79 
X-CRM114-Status: GOOD (  49.96  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgWml4aWFuLAoKT24gVGh1LCAyNiBOb3YgMjAyNiBhdCAwODozMCwgWml4aWFuIFplbmcgPHN5
Y2Ftb3JlbW9vbjM3NkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQW5hbmQsCj4KPiBPbiBXZWQs
IE5vdiAyNSwgMjAyNiBhdCAxMDoyMuKAr1BNIEFuYW5kIE1vb24gPGxpbnV4LmFtb29uQGdtYWls
LmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgWml4aWFuLAo+ID4KPiA+IE9uIFdlZCwgMjUgTm92IDIw
MjYgYXQgMTU6MDgsIFppeGlhbiBaZW5nIDxzeWNhbW9yZW1vb24zNzZAZ21haWwuY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gSGkgQW5hbmQsCj4gPiA+Cj4gPiA+IE9uIFdlZCwgTm92IDI1LCAyMDI2
IGF0IDM6NTLigK9QTSBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+IHdyb3RlOgo+
ID4gPiA+Cj4gPiA+ID4gSGkgQXVyZWxpZW4sCj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQsIDI1IE5v
diAyMDI2IGF0IDAwOjE0LCBBdXJlbGllbiBKYXJubyA8YXVyZWxpZW5AYXVyZWwzMi5uZXQ+IHdy
b3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhpIFppeGlhbiwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBP
biAyMDI2LTExLTI0IDExOjMxLCBaaXhpYW4gWmVuZyB3cm90ZToKPiA+ID4gPiA+ID4gSGkgQXVy
ZWxpZW4sCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIDIwMjYvMTEvMjQgNTo1OCwgQXVyZWxp
ZW4gSmFybm8gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gSGksCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiBPbiAyMDI2LTExLTIzIDEyOjQxLCBaaXhpYW4gWmVuZyB3cm90ZToKPiA+ID4gPiA+ID4g
PiA+IFRoZSBiYW5hbmFwaS1mMyBjYXJyaWVzIGFuIEFUMjRDMDIgY29tcGF0aWJsZSBFRVBST00g
R1QyNEMwMkIgWzFdOgo+ID4gPiA+ID4gPiA+ID4gMjU2IGJ5dGVzIHdpdGggYW4gOC1ieXRlIHdy
aXRlIHBhZ2UsIHdoaWNoIGNhbiBiZSBmb3VuZCBpbiBzY2hlbWF0aWNbMl0uCj4gPiA+ID4gPiA+
ID4gPiBUaGUgZGV2aWNlIHRyZWUgZGVjbGFyZXMgcGFnZXNpemUgPSA8MTY+LCB3aGljaCBkb2Vz
IG5vdCBtYXRjaCB0aGUKPiA+ID4gPiA+ID4gPiA+IGVlcHJvbSBjaGlwIGRhdGFzaGVldCB3aGlj
aCBkZWNsYXJlcyBwYWdlc2l6ZSA4IGJ5dGVzLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
T29wcywgSSBhbSBub3Qgc3VyZSBob3cgSSBnb3QgdGhhdCB3cm9uZy4gU29ycnkgYWJvdXQgdGhh
dC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgcXVlc3Rpb24gb2YgdGhlIHBhZ2Ugc2l6ZSBoYXMg
YmVlbiByYWlzZWQgaW4gdGhlIGluaXRpYWwgcmV2aWV3IFsxXSwKPiA+ID4gPiA+IGFuZCBpdCBz
ZWVtcyB0aGF0IHRoZSBHVDI0QzAyIGhhcyBhIDE2LWJ5dGUgcGFnZSBzaXplLCB3aGlsZSB0aGUK
PiA+ID4gPiA+IEdUMjRDMDJCIFsyXSBoYXMgYSA4LWJ5dGUgcGFnZSBzaXplLiBUaGUgQlBJLUYz
IHNjaGVtYXRpY3MgY29uZmlybXMgdGhhdAo+ID4gPiA+ID4gdGhlIEIgdmVyc2lvbiBpcyB1c2Vk
LiBTb3JyeSBhYm91dCB0aGUgbWlzdGFrZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBFRVBS
T00gcGFnZXNpemUgb2YgazEtYmFuYW5hcGktY202LWlvWzNdIGFuZCBrMS1vcmFuZ2VwaS1ydjJb
NF0gY2hhbmdlZAo+ID4gPiA+ID4gPiA+ID4gdG9nZXRoZXIsIGJhc2VkIG9uIHRoZSBjaGlwIG1v
ZGVsIHNob3duIGluIHRoZSBzY2hlbWF0aWMgZGlhZ3JhbS4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+IFRoZSBrMS1taWxrdi1qdXBpdGVyIGJvYXJkIGlzIGFsc28gYWZmZWN0ZWQgd2l0aCB0
aGUgc2FtZSBpc3N1ZSwgZGVzcGl0ZQo+ID4gPiA+ID4gPiA+IHVzaW5nIGEgc2xpZ2h0bHkgZGlm
ZmVyZW50IEVFUFJPTSAoMjRDMDQpLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IFRoZSBHVDI0QzA0QSBFRVBST00gdXNlZCBvbiBrMS1taWxrdi1qdXBpdGVyIGJvYXJkIGRv
ZXNuJ3Qgc2VlbSB0byBoYXZlCj4gPiA+ID4gPiA+IHRoZSBzYW1lIGlzc3VlLCB3aGljaCB5b3Ug
Y2FuIGZpbmQgIlBhZ2UgU2l6ZTogMTYgYnl0ZXMiIGluIGRhdGFzaGVldDoKPiA+ID4gPiA+ID4g
aHR0cHM6Ly93d3cuZ2lhbnRlYy1zZW1pLmNvbS91cGxvYWRzLzIwMjIwOTI5L0dUMjRDMDRBLnBk
Zgo+ID4gPiA+ID4KPiA+ID4gPiA+IEluZGVlZCB5b3UgYXJlIGNvcnJlY3QsIGFuZCBJIGNvbmZp
cm0gdGhhdCB0aGlzIGlzIHRoZSBleGFjdCB2ZXJzaW9uCj4gPiA+ID4gPiB1c2VkIG9uIHRoZSBz
Y2hlbWF0aWNzLiBUaGVyZWZvcmUgdGhlcmUgaXMgbm8gbmVlZCB0byBleHRlbmQgeW91ciBwYXRj
aCwKPiA+ID4gPiA+IGl0IGNhbiBiZSBtZXJnZWQgdGhhdCB3YXkuCj4gPiA+ID4gPgo+ID4gPiA+
ID4gPiBCdXQgSSBkb24ndCBoYXZlIHRoZSBib2FyZCwgc2ltcGxlIHRlc3Qgd291bGQgYmUgYXBw
cmVjaWF0ZWQuIFBlcmhhcHMgSQo+ID4gPiA+ID4gPiBzaG91bGQgaW5jbHVkZSB0ZXN0IHN0ZXBz
IGluIHRoZSBjb21taXQgbWVzc2FnZSBmb3IgdGhlIG5leHQgcmV2aXNpb24uCj4gPiA+ID4gPgo+
ID4gPiA+ID4gVW5mb3J0dW5hdGVseSB0aGUgYm9hcmQgaGFzIHRoZSBFRVBST00gd3JpdGUgcHJv
dGVjdGlvbiBwaW4gY29ubmVjdGVkIHRvCj4gPiA+ID4gPiBWQ0MsIHdoaWNoIG1lYW5zIHRoZSB3
cml0ZSBwcm90ZWN0aW9uIGlzIGVuYWJsZWQuIFRoZXJlZm9yZSB0ZXN0aW5nIGlzCj4gPiA+ID4g
PiBub3Qgc28gZWFzeS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBSZWdhcmRzCj4gPiA+ID4gPiBBdXJl
bGllbgo+ID4gPiA+ID4KPiA+ID4gPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1yaXNjdi9hTkx6UkpjS0NZT25nYzd6QGF1cmVsMzIubmV0Lwo+ID4gPiA+ID4gWzJdIGh0dHBz
Oi8vd3d3LmdpYW50ZWMtc2VtaS5jb20vanVjaGVuMTEyMy91cGxvYWRzL3BkZi9HVDI0QzAyX0RT
X0F1LnBkZgo+ID4gPiA+ID4KPiA+ID4gPiBBcG9sb2dpZXMsIHRoaXMgaXMgYSBkaWZmZXJlbnQg
aXNzdWUuCj4gPiA+ID4KPiA+ID4gPiBJIGFtIGN1cnJlbnRseSB3b3JraW5nIG9uIGVuYWJsaW5n
IG11bHRpLURUQiBzdXBwb3J0IGluIFUtQm9vdCBTUEwKPiA+ID4gPiBmb3IgU3BhY2VtaVQgSzEg
Ym9hcmRzLgo+ID4gPiA+Cj4gPiA+ID4gV2hpbGUgaW52ZXN0aWdhdGluZyB0aGUgYm9hcmQgZGV0
ZWN0aW9uIGlzc3VlLCBJIG5vdGljZWQgdGhhdCB0aGUgRUVQUk9NCj4gPiA+ID4gb24gbXkgQmFu
YW5hIFBpIEJQSS1GMyBkb2VzIG5vdCBjb250YWluIGEgUHJvZHVjdCBOYW1lIFRMViBlbnRyeS4K
PiA+ID4gPgo+ID4gPiA+IGFsYXJtQGsxOn4kIHN1ZG8gaGV4ZHVtcCAtQyAvc3lzL2J1cy9pMmMv
ZGV2aWNlcy8yLTAwNTAvZWVwcm9tCj4gPiA+ID4gMDAwMDAwMDAgIDU0IDZjIDc2IDQ5IDZlIDY2
IDZmIDAwICAwMSAwMCAyMCAyNCAwNiBmZSBmZSBmZSAgfFRsdkluZm8uLi4gJC4uLi58Cj4gPiA+
ID4gMDAwMDAwMTAgIGQ1IDUyIGJkIDJhIDAyIDAwIDAyIDIzICAwYyAzOSAzOCA2MSAzOSA2MyAz
MyA2MSAgfC5SLiouLi4jLjk4YTljM2F8Cj4gPiA+ID4gMDAwMDAwMjAgIDMyIDYyIDY0IDM0IDM3
IGZlIDA0IDNiICBlMyBmZiBiZCBmZiBmZiBmZiBmZiBmZiAgfDJiZDQ3Li47Li4uLi4uLi58Cj4g
PiA+ID4gMDAwMDAwMzAgIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gPiA+ID4gKgo+ID4gPiA+IDAwMDAwMTAwCj4g
PiA+ID4KPiA+ID4gPiBBbHRob3VnaCB0aGUgRUVQUk9NIGlzIHJlYWRhYmxlLCB0aGUgbWlzc2lu
ZyBQcm9kdWN0IE5hbWUgVExWIGVudHJ5Cj4gPiA+ID4gZXhwbGFpbnMgd2h5IHJlYWRfcHJvZHVj
dF9uYW1lKCkgcmV0dXJucyBgLUVOT0VOVGAgKC0yKSwgYXNzdW1pbmcgdGhlCj4gPiA+ID4gRUVQ
Uk9NIHJlYWQgYW5kIHZhbGlkYXRpb24gc3VjY2VlZC4KPiA+ID4gPgo+ID4gPiA+IENvbnNlcXVl
bnRseSwgYXV0b21hdGljIGJvYXJkIGRldGVjdGlvbiBmYWlscywgYW5kIFUtQm9vdCBmYWxscyBi
YWNrIHRvCj4gPiA+ID4gQ09ORklHX0RFRkFVTFRfREVWSUNFX1RSRUUsIHdoaWNoIG1heSBzZWxl
Y3QgYW4gaW5jb3JyZWN0IGRldmljZQo+ID4gPiA+IHRyZWUgZm9yIHRoZSB0YXJnZXQgYm9hcmQu
Cj4gPiA+Cj4gPiA+IFllcywgZXhhY3RseS4gSSBlbmNvdW50ZXJlZCB0aGUgc2FtZSBwcm9ibGVt
LiBCb2FyZCBkZXRlY3QgZmFpbGVkIGFuZCB0aGVuIHVzZWQKPiA+ID4gZGVmYXVsdCBkZXZpY2Ug
dHJlZSAoTXVzZVBpIFBybykuCj4gPiA+Cj4gPiA+ID4gU2luY2UgdGhlIFNEIGNhcmQtZGV0ZWN0
IEdQSU8gcG9sYXJpdHkgZGlmZmVycyBiZXR3ZWVuIHRoZSBCYW5hbmEgUGkgQlBJLUYzCj4gPiA+
ID4gYW5kIE11c2VQaSBQcm8sIHNlbGVjdGluZyB0aGUgaW5jb3JyZWN0IGRldmljZSB0cmVlIGNh
biByZXN1bHQgaW4gU0QKPiA+ID4gPiBjYXJkIGRldGVjdGlvbgo+ID4gPiA+IGFuZCBib290IGZh
aWx1cmVzLgo+ID4gPiA+Cj4gPiA+ID4gVGhlIGZvbGxvd2luZyBTUEwgYm9vdCBsb2cgc2hvd3Mg
dGhlIGJvYXJkIGRldGVjdGlvbiBmYWlsdXJlLCBhbHRob3VnaAo+ID4gPiA+IEREUiBpbml0aWFs
aXphdGlvbiBjb21wbGV0ZXMgc3VjY2Vzc2Z1bGx5Ogo+ID4gPiA+Cj4gPiA+ID4gYGBgCj4gPiA+
ID4gVS1Cb290IFNQTCAyMDI2LjEwLTAxMDYwLWdmMzA4MGFiY2ZlOTItZGlydHkgKE9jdCAyNCAy
MDI2IC0gMTc6MzA6MDMgKzA1MzApCj4gPiA+ID4gRmFpbCB0byBkZXRlY3QgYm9hcmQ6LTIKPiA+
ID4gPiB2ZGRfY29yZSwgdmFsdWU6OTAwMDAwCj4gPiA+ID4gdmRkXzF2OCwgdmFsdWU6MTgwMDAw
MAo+ID4gPiA+IHZkZF8xdjhfbW1jLCB2YWx1ZToxODAwMDAwCj4gPiA+ID4gRERSIGZpcm13YXJl
OiBbMHhjMDgyMDkwMF06MHhmMDIyNzE3OSwgc2l6ZToweDhkOTgKPiA+ID4gPiBERFIgaXMgcmVh
ZHkKPiA+ID4gPiBgYGAKPiA+ID4gPiBDb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gd2hldGhlciB0
aGUgUHJvZHVjdCBOYW1lIFRMViBlbnRyeSBpcwo+ID4gPiA+IGV4cGVjdGVkIHRvIGJlIHByb2dy
YW1tZWQgaW50byB0aGUgRUVQUk9NIGR1cmluZyBtYW51ZmFjdHVyaW5nPwo+ID4gPgo+ID4gPiBZ
ZXMsIE5vIHByb2R1Y3QgbmFtZSBUTFYgZW50cnkgaW4gbXkgQmFuYW5hcGktZjMgRUVQUk9NLiBU
aGF0J3MgdGhlIHJlYXNvbgo+ID4gPiBJIHdhbnRlZCB0byB3cml0ZSBFRVBST00gYW5kIGZvdW5k
IHRoaXMgRUVQUk9NIHBhZ2VzaXplIGlzc3VlLgo+ID4gPgo+ID4gPiA+IEFsc28sIGlzIHRoZXJl
IGEgcmVjb21tZW5kZWQgYXBwcm9hY2ggZm9yIGhhbmRsaW5nIGJvYXJkcyB3aXRoIG1pc3NpbmcK
PiA+ID4gPiBwcm9kdWN0IGluZm9ybWF0aW9uIGluIHRoZSBFRVBST00gdG8gZW5zdXJlIHJlbGlh
YmxlIGF1dG9tYXRpYyBkZXZpY2UKPiA+ID4gPiB0cmVlIHNlbGVjdGlvbj8KPiA+ID4KPiA+ID4g
SSdtIG5vdCBzdXJlLiBDdXJyZW50bHksIGFmdGVyIEkgY29ycmVjdGVkIHBhZ2VzaXplLCBJIHdy
b3RlIEVFUFJPTSBtYW51YWxseToKPiA+ID4gYGBgCj4gPiA+IFUtQm9vdCBTUEwgMjAyNy4wMS1y
YzItMDAwMzktZzRjZmY1MGY0MDM0Mwo+ID4gPiBHZXQgYm9hcmQgbmFtZTprMS14X2RlYjEKPiA+
ID4gdmRkX2NvcmUsIHZhbHVlOjkwMDAwMAo+ID4gPiB2ZGRfMXY4LCB2YWx1ZToxODAwMDAwCj4g
PiA+IEREUiBmaXJtd2FyZTogWzB4YzA4MWRmODBdOjB4ZjAyMjcxNzksIHNpemU6MHg4ZDk4Cj4g
PiA+IEREUiBpcyByZWFkeQo+ID4gPiBObyBTUEkgY29udHJvbGxlciAoLTE5KQo+ID4gPiBUcnlp
bmcgdG8gYm9vdCBmcm9tIE1NQzIKPiA+ID4gLi4uLgo+ID4gPiA9PiB0bHZfZWVwcm9tCj4gPiA+
IFRMVjogMAo+ID4gPiBUbHZJbmZvIEhlYWRlcjoKPiA+ID4gICAgSWQgU3RyaW5nOiAgICBUbHZJ
bmZvCj4gPiA+ICAgIFZlcnNpb246ICAgICAgMQo+ID4gPiAgICBUb3RhbCBMZW5ndGg6IDI5Cj4g
PiA+IFRMViBOYW1lICAgICAgICAgICAgIENvZGUgTGVuIFZhbHVlCj4gPiA+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tIC0tLS0gLS0tIC0tLS0tCj4gPiA+IEJhc2UgTUFDIEFkZHJlc3MgICAgIDB4MjQg
ICA2IEZFOkZFOkZFOjkwOjFFOkYwCj4gPiA+IFByb2R1Y3QgTmFtZSAgICAgICAgIDB4MjEgICA5
IGsxLXhfZGViMQo+ID4gPiBNQUMgQWRkcmVzc2VzICAgICAgICAweDJBICAgMiAyCj4gPiA+IENS
Qy0zMiAgICAgICAgICAgICAgIDB4RkUgICA0IDB4QTg4QzkzRjAKPiA+ID4gYGBgCj4gPiA+IE1h
eWJlIHdlIGNhbiBkaXNjdXNzIHRoaXMgaW4gdS1ib290IG1haWxsaW5nIGxpc3Q/IFRoaXMgaXMg
aW5kZWVkIGEKPiA+ID4gc2VwYXJhdGUgaXNzdWUuCj4gPiBDb3JyZWN0LCBJIHdpbGwgcmFpc2Ug
dGhpcyBpc3N1ZSBvdmVyIHRoZXJlLgo+ID4KPiA+IFJldmlld2VkLWJ5OiBBbmFuZCBNb29uIDxs
aW51eC5hbW9vbkBnbWFpbC5jb20+Cj4gPiBUZXN0ZWQtYnk6IEFuYW5kIE1vb24gPGxpbnV4LmFt
b29uQGdtYWlsLmNvbT4KPiA+Cj4gPiBDYW4geW91IGZvbGxvdyB1cCB3aXRoIHRoZSBwYXRjaCB0
byByZWFkIHRoZSBNQUMgYWRkcmVzcyBmcm9tIHRoZSBFRVBST00uCj4gPgo+ID4gJCBnaXQgZGlm
ZiAuCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5h
bmFwaS1mMy5kdHMKPiA+IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFw
aS1mMy5kdHMKPiA+IGluZGV4IDFkYjg5NjUzNjI1Ni4uMzkyOGE0N2I3NzAyIDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMKPiA+
ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCj4g
PiBAQCAtMTM3LDYgKzEzNyw4IEBAICZldGgwIHsKPiA+ICAgICAgICAgcGluY3RybC0wID0gPCZn
bWFjMF9jZmc+LCA8JmdtYWMwX2Nsa19yZWZfY2ZnPjsKPiA+ICAgICAgICAgcngtaW50ZXJuYWwt
ZGVsYXktcHMgPSA8MD47Cj4gPiAgICAgICAgIHR4LWludGVybmFsLWRlbGF5LXBzID0gPDA+Owo+
ID4gKyAgICAgICBudm1lbS1jZWxscyA9IDwmbWFjX2FkZHJlc3MgMD47Cj4gPiArICAgICAgIG52
bWVtLWNlbGwtbmFtZXMgPSAibWFjLWFkZHJlc3MiOwo+ID4gICAgICAgICBzdGF0dXMgPSAib2th
eSI7Cj4gPgo+ID4gICAgICAgICBtZGlvLWJ1cyB7Cj4gPiBAQCAtMTYwLDYgKzE2Miw4IEBAICZl
dGgxIHsKPiA+ICAgICAgICAgcGluY3RybC0wID0gPCZnbWFjMV9jZmc+LCA8JmdtYWMxX2Nsa19y
ZWZfY2ZnPjsKPiA+ICAgICAgICAgcngtaW50ZXJuYWwtZGVsYXktcHMgPSA8MD47Cj4gPiAgICAg
ICAgIHR4LWludGVybmFsLWRlbGF5LXBzID0gPDI1MD47Cj4gPiArICAgICAgIG52bWVtLWNlbGxz
ID0gPCZtYWNfYWRkcmVzcyAxPjsKPiA+ICsgICAgICAgbnZtZW0tY2VsbC1uYW1lcyA9ICJtYWMt
YWRkcmVzcyI7Cj4gPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+Cj4gPiAgICAgICAgIG1k
aW8tYnVzIHsKPiA+IEBAIC0yMDIsNyArMjA2LDcgQEAgZWVwcm9tQDUwIHsKPiA+ICAgICAgICAg
ICAgICAgICBudm1lbS1sYXlvdXQgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJvbmllLHRsdi1sYXlvdXQiOwo+ID4KPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
IG1hYy1hZGRyZXNzIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIG1hY19hZGRyZXNzOiBt
YWMtYWRkcmVzcyB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNudm1lbS1j
ZWxsLWNlbGxzID0gPDE+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgfTsKPiA+Cj4gPgo+
IEhlcmUncyB0aGUgb3V0cHV0IGFmdGVyIGFwcGx5IHBhdGNoIGFib3ZlOgo+Cj4gYGBgCj4gIyBp
cCBhCj4gMTogbG86IDxMT09QQkFDSyxVUCxMT1dFUl9VUD4gbXR1IDY1NTM2IHFkaXNjIG5vcXVl
dWUgc3RhdGUgVU5LTk9XTiBxbGVuIDEwMDAKPiAgICAgbGluay9sb29wYmFjayAwMDowMDowMDow
MDowMDowMCBicmQgMDA6MDA6MDA6MDA6MDA6MDAKPiAgICAgaW5ldCAxMjcuMC4wLjEvOCBzY29w
ZSBob3N0IGxvCj4gICAgICAgIHZhbGlkX2xmdCBmb3JldmVyIHByZWZlcnJlZF9sZnQgZm9yZXZl
cgo+ICAgICBpbmV0NiA6OjEvMTI4IHNjb3BlIGhvc3QKPiAgICAgICAgdmFsaWRfbGZ0IGZvcmV2
ZXIgcHJlZmVycmVkX2xmdCBmb3JldmVyCj4gMjogZXRoMDogPEJST0FEQ0FTVCxNVUxUSUNBU1Qs
VVAsTE9XRVJfVVA+IG10dSAxNTAwIHFkaXNjIHBmaWZvX2Zhc3QKPiBzdGF0ZSBVUCBxbGVuIDEw
MDAKPiAgICAgbGluay9ldGhlciBmZTpmZTpmZTo5MDoxZTpmMCBicmQgZmY6ZmY6ZmY6ZmY6ZmY6
ZmYKPiAgICAgaW5ldCAxMC41LjEuMTYvMjQgYnJkIDEwLjUuMS4yNTUgc2NvcGUgZ2xvYmFsIGR5
bmFtaWMgbm9wcmVmaXhyb3V0ZSBldGgwCj4gICAgICAgIHZhbGlkX2xmdCA3MTYwc2VjIHByZWZl
cnJlZF9sZnQgNjI2MHNlYwo+ICAgICBpbmV0NiBmZTgwOjpjZDk0OjVjZGY6NDUwOTphODIwLzY0
IHNjb3BlIGxpbmsKPiAgICAgICAgdmFsaWRfbGZ0IGZvcmV2ZXIgcHJlZmVycmVkX2xmdCBmb3Jl
dmVyCj4gMzogZXRoMTogPEJST0FEQ0FTVCxNVUxUSUNBU1QsVVAsTE9XRVJfVVA+IG10dSAxNTAw
IHFkaXNjIHBmaWZvX2Zhc3QKPiBzdGF0ZSBVUCBxbGVuIDEwMDAKPiAgICAgbGluay9ldGhlciBm
ZTpmZTpmZTo5MDoxZTpmMSBicmQgZmY6ZmY6ZmY6ZmY6ZmY6ZmYKPiAgICAgaW5ldCAxMC41LjEu
MTQvMjQgYnJkIDEwLjUuMS4yNTUgc2NvcGUgZ2xvYmFsIGR5bmFtaWMgbm9wcmVmaXhyb3V0ZSBl
dGgxCj4gICAgICAgIHZhbGlkX2xmdCA3MTYwc2VjIHByZWZlcnJlZF9sZnQgNjI2MHNlYwo+ICAg
ICBpbmV0NiBmZTgwOjo0NTJiOmUwMzI6NTYzMDozOWFjLzY0IHNjb3BlIGxpbmsKPiAgICAgICAg
dmFsaWRfbGZ0IGZvcmV2ZXIgcHJlZmVycmVkX2xmdCBmb3JldmVyCj4gIyBoZXhkdW1wIC1DIC9z
eXMvYnVzL2kyYy9kZXZpY2VzLzItMDA1MC9lZXByb20KPiAwMDAwMDAwMCAgNTQgNmMgNzYgNDkg
NmUgNjYgNmYgMDAgIDAxIDAwIDFkIDI0IDA2IGZlIGZlIGZlICB8VGx2SW5mby4uLi4kLi4uLnwK
PiAwMDAwMDAxMCAgOTAgMWUgZjAgMjEgMDkgNmIgMzEgMmQgIDc4IDVmIDY0IDY1IDYyIDMxIDJh
IDAyICB8Li4uIS5rMS14X2RlYjEqLnwKPiAwMDAwMDAyMCAgMDAgMDIgZmUgMDQgYTggOGMgOTMg
ZjAgIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICB8Li4uLi4uLi4uLi4uLi4uLnwKPiAwMDAwMDAz
MCAgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICB8Li4u
Li4uLi4uLi4uLi4uLnwKPiAqCj4gMDAwMDAxMDAKPiBgYGAKPgo+IEkgdGhpbmsgJ2ZlOmZlOmZl
OjkwOjFlOmYwJyBpcyByZWFkIGZyb20gRUVQUk9NLiBidHcsIEkgd3JvdGUgcHJvZHVjdCBuYW1l
Cj4gbWFudWFsbHkgKGsxLXhfZGViKS4KPgpZZXMsIGl0IGxvb2tzIGNvcnJlY3QuIEkgaGF2ZSB0
aGUgc2FtZSByZXN1bHQgb24gbXkgZW5kLgo+IEJlc3QgcmVnYXJkcywKPiBaaXhpYW4KClRoYW5r
cwotQW5hbmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
