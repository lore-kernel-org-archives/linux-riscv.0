Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B4C606AA34
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oJQDYKAc;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=FjuC4ywp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5fAaEPnWpAgst8E6HHZj5AvtK3CCLd5EgJWL5j3YCN0=; b=oJQDYKAc3XAdFqDlukktyNV024
	2OHz9NBfir9GZuiK5TtrnUk/6Ao8ti5bzL4QrudHmnRXcWyuLrbN8jwSb9n9WwFLSoAW7W9xuFSW3
	BsCA6FxDOMR5+GVGOnFcrZH7kS1G6AEHAxcD0gcs2O8F51ZfFnioGOg9kV/xz5LakUDtyerferFYC
	1MC2Id7A+3f5ChY6PTAAxiCXnxxPZAh+4jTxe4IhhtngyMiX+TbxtdD5gfOSGcw4ldbp8omfXMfxb
	Naz7itm9OzOoSi/Vmti38vUUrm+8AESc+6epScbrlxC/A26tmy4XHfND2IcVxnxWRrQDxTeO5h+Mu
	Y5HonCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr7T-0000000GU5d-3CVQ;
	Mon, 02 Nov 2026 12:26:35 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr7M-0000000GU3h-0aJg
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 12:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793622370;
	bh=kYoEHv1yJWT5CYnv9W1t01akAHdAj5zwmImIgwGqYBU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=FjuC4ywpgmDhy1DVijeU0zlWbRfHWZvmAxDzZDk0A9GiKemI8FT4u43vmPJf+zJiS
	 fQGYn7a7wZNd/46mESKNy8b8yVEmR554lXCcMWsJAr9MfsLU33zirii8+sRcKzo2oi
	 LTdgKvaybh+JhC8/AyKPKmcJwfZ1YI6EDNLg8akg=
X-QQ-mid: esmtpgz13t1793622369tffcc5b9d
X-QQ-Originating-IP: MewkfB/vp1fpn1TFVKSdKp0dl1l1LY0o1YkpxDBlOr4=
Received: from mail-pl1-f171.google.com ( [209.85.214.171])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 20:26:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16018785558085199489
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e7e742a2c7so18852555ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 04:26:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwNHqXBekjhkd3GeBywEeIiTd0j30mKpaZm145beJCRKKhaTd2S/LX8CCclvBwscILucAKLJyJtgj+e0w==@lists.infradead.org
X-Gm-Message-State: APuU4Z8gphy5p/lr5zegmgJKCm7rAGqKMXQ3B0iGc9ZlO+qZxaJdLMYG
	tcGwDvN3RSNMY+JUw7utvQBjZIxRxg0eo9W5G8TWaJ3ikhDwrHYzvuYFHJfnQl1YdLSf+eaXKTF
	Gj+eexL+5K+KUVRMk7033qkzTMGKdHEQ=
X-Received: by 2002:a17:903:1212:b0:2e9:fd49:64a with SMTP id
 d9443c01a7336-2eb3640f012mr65226725ad.1.1793622366169; Mon, 02 Nov 2026
 04:26:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com>
 <auYxFRtKWbGAlRTL@aurel32.net> <CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>
 <DMKIFFUY4T1C.TTDVVD0FOSF1@kernel.org>
In-Reply-To: <DMKIFFUY4T1C.TTDVVD0FOSF1@kernel.org>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Mon, 2 Nov 2026 20:25:29 +0800
X-Gmail-Original-Message-ID: <648788BF6233AD63+CAAfSe-uMrrX2Y_mzt5-Hhr+ssfwLVhs094PBb-ZTgKFLPwVjgA@mail.gmail.com>
X-Gm-Features: AclHuK8Nf_Wjx0Fs3iSP6YTyXDr4sshL9mP7vgixNBtorqmmqEdGoXFlzXEdNkY
Message-ID: <CAAfSe-uMrrX2Y_mzt5-Hhr+ssfwLVhs094PBb-ZTgKFLPwVjgA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
To: Troy Mitchell <troy@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, devicetree@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>, 
	Troy Mitchell <troy.mitchell@linux.dev>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M+3MKZmQIfwi6Co6/vf4q2UGW2uJI9BbabwuJq+lAL0dBJ7slFOYeu1Y
	cJ01R1xJ9c7dJT5f2omXf4UL41QOOACjC5V9k8ZkxWUg4LTLvB0Pd/iN30QlKzMQ3V1vQqb
	QmN9qrqUJ6kYVFptMJMqTudZJvpbUpyM8CB4SQ8XU9Xo2Uef0CPTUVXRs4ujJI24shAC5Tx
	u4TJMPGP7c6m25jGOmDfk3Rz8tQVsMZDV4llYImKS7nonrMG45RIx2p5eklzoScQ4L5dWH4
	JcL2h6ubJJzKEY8c1m3baLr0dmdNWk4IayinV96NLkFLDp7m+id72rAsR7gxETxyBHElZTR
	z/MfGy9zZt9+RX1bhhoup2h2xE7TQybO96SBquM0xAkKAZLINcn3Jye9Z9M4/dW75yEBBN/
	boSGybpP6A0+40uaRlx7/qZdccQrRDq8KpHv/pLRMpI0f2zDajjtGIxkKAT58Usw/xWjtiA
	jblcP7+fFXwavOqPQRmWaMYOM7bLfI1vic4iLza+CbHKsRAw2cMYbiWq4rcP8iai+F2BguK
	9alHobrVxN8MXdxc4PzLHiZUazsXg43eYimwVUeGiW9jHWK11ECyI1AG+DSbrCr6UgtMVZH
	oeR6iqCZLaftadfSu+ZJKBy6uujf7iMiPkrf2u/+if14YGrvB+yN9myKt9QAv58L/LTVhJE
	Lx7ge9QuThSD/DLN+BnkTTVmJ7XB2twWPs+XS0IVU+zgbNCgHYxq2QFlJlKXVb/yh18enY3
	zImCLWXIvs7a8+GDBiYvx21azXLo3nw8dO4vIXDqFJpGrn9p63ao35x7lHsS7c7o1/lZbQn
	d1Djevflc59nK4Mmf/Bvry2/cZ12V7Y+jdzWDiafNQIjBJ7kzHTjQs6FbRO0mUr47nvfk0s
	gCs+V7eeovj+lnvebQ4CyJ88zlC7N8gp/ITnHi9XhMae6YLQQf1zrHiHsm9prk2MUkyS7HE
	WuJgBQwDG6VkJMXGU/Elgt8Lv/AR1amsURQvJdLjNhi4iISKX4e25kn4lrzS4/WUtpdJBGt
	sIccHXS8oagTfgmGB1EF4ivZOpUJnCWYp0r6pE4/wKNwQKNDHuwSlOJ8kr1OEkkqVFzrMe5
	g==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_042628_700699_5CE4F409 
X-CRM114-Status: GOOD (  14.44  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVHJveSwKCk9uIE1vbiwgMiBOb3YgMjAyNiBhdCAxNDoyNywgVHJveSBNaXRjaGVsbCA8dHJv
eUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhpIENodW55YW4sCj4KPiBPbiBGcmkgT2N0IDMwLCAy
MDI2IGF0IDU6NDAgUE0gKzA4MDAsIENodW55YW4gWmhhbmcgd3JvdGU6Cj4gPiBEZXNjcmliZSB0
aGUgRFdDMyBjb250cm9sbGVyIGFuZCBpdHMgVVNCIDIuMCBQSFkgZm9yIFVTQjMgcG9ydCBBCj4g
PiBvZiB0aGUgSzMgU29DLgo+ID4KPiA+IE9ubHkgdGhlIFUyIGxhbmUgaXMgZGVzY3JpYmVkOiBQ
b3J0IEEncyBTdXBlclNwZWVkIFBIWSBoYXMgbm8gZHJpdmVyCj4gPiB5ZXQsIHNvIHRoZSBwb3J0
IHJ1bnMgYXQgaGlnaC1zcGVlZCAobWF4aW11bS1zcGVlZCA9ICJoaWdoLXNwZWVkIikuCj4gPgo+
ID4gRW5hYmxlIFVTQjMgcG9ydCBBIHdpdGggZHJfbW9kZSA9ICJwZXJpcGhlcmFsIiwgc28gaXQg
Y2FuIGJlIHVzZWQgYXMKPiA+IGEgVVNCIGRldmljZS4KPgo+IFBvcnQgQSBpcyBhIFR5cGUtQyBw
b3J0IGJlaGluZCBhIEZVU0IzMDEsIHNvIHBsZWFzZSBub3RlIGluIHRoZSBjb21taXQKPiBtZXNz
YWdlIHRoYXQgaXQncyBkZXZpY2Utb25seSB1bnRpbCB0aGUgQ0MgY29udHJvbGxlciBpcyBkZXNj
cmliZWQuCj4KPiBXYXMgdGhpcyB0ZXN0ZWQgd2l0aCBhIEMtdG8tQyBjYWJsZT8gVGhhdCBkZXBl
bmRzIG9uIHRoZSBGVVNCMzAxJ3MKPiBwb3dlci1vbiBDQyBtb2RlLCBzaW5jZSBub3RoaW5nIGNv
bmZpZ3VyZXMgaXQgeWV0LgoKSnVzdCB0ZXN0ZWQsCgpPbiBLMzoKfiAjIGxzIC9zeXMvY2xhc3Mv
dWRjCmNhZDAwMDAwLnVzYgp+ICMgY2F0IC9zeXMvY2xhc3MvdWRjL2NhZDAwMDAwLnVzYi9zdGF0
ZTsgZWNobwpjb25maWd1cmVkCn4gIyBjYXQgL3N5cy9jbGFzcy91ZGMvY2FkMDAwMDAudXNiL2N1
cnJlbnRfc3BlZWQ7IGVjaG8KaGlnaC1zcGVlZAp+ICMgY2F0IC9zeXMva2VybmVsL2NvbmZpZy91
c2JfZ2FkZ2V0L2cxL2lkVmVuZG9yOyBlY2hvCjB4MWQ2Ygp+ICMgY2F0IC9zeXMva2VybmVsL2Nv
bmZpZy91c2JfZ2FkZ2V0L2cxL2lkUHJvZHVjdDsgZWNobwoweDAxMDQKfiAjIGxzIC9zeXMva2Vy
bmVsL2NvbmZpZy91c2JfZ2FkZ2V0L2cxL2Z1bmN0aW9ucwphY20udXNiMCAgICAgICAgICAgZWNt
LnVzYjAgICAgICAgICAgIG1hc3Nfc3RvcmFnZS51c2IwCn4gIwoKQW5kIHRoZSBob3N0IHNpZGUg
c2VlcyBWSURfMUQ2QjowMTA0IHdpdGggbm8gZXJyb3IuIFRoaXMgaXMgbm90Cmd1YXJhbnRlZWQg
YWNyb3NzIGFsbCBDLXRvLUMgaG9zdC9jYWJsZSBjb21iaW5hdGlvbnMg4oCUIHdpbGwgbm90ZSBp
bgp0aGUgY29tbWl0IG1lc3NhZ2UgdGhhdCBQb3J0IEEgaXMgZGV2aWNlLW9ubHkgdW50aWwgdGhl
IENDIGNvbnRyb2xsZXIKaXMgZGVzY3JpYmVkLCBhbmQgdGhhdCBDLXRvLUMgYmVoYXZpb3IgZGVw
ZW5kcyBvbiB0aGUgRlVTQjMwMSBwb3dlci1vbgpkZWZhdWx0LgoKVGhhbmtzLApDaHVueWFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
