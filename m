Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F77FF886D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 18:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrllccFoCzkfveEb8ZYqhDtOpi1vopN0yZD9vOnWUzs=; b=HXECfvkIgqoT9n0mGdtEAm+v7p
	Aq6ggsaC4OPkqxow3YwA5mXfr2zt1SJBJYI/VgvvWbfAVkuIsUjxYkq+IWOnth/cbDO3TW+sDMDlB
	QBEkLkerNBV06VMc87Qmgh2F+c34148ZrK8BxgEHSgMEi5YO2t3xzw4VBhsyGo5cgFy0Vcu4LiMII
	3JXgNDUpmy0HEO/86gTx7IMsZ0yVWQLYbUDYn5icBLtHp8RCSowymS+r4/tkoZLeawnX/Aab9EV6Z
	5ifIXjBbmFX6Uqv46YSkSyKMhTBp9beZUK9G812NZmDwMCch0Vsvr72/50IFGf3nm88i3u6sZPPtZ
	mGCEr6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnSk-000000027Qa-1rGN;
	Tue, 28 Apr 2026 18:47:14 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnSh-000000027Pd-2QO4
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 18:47:13 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso13263034a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 11:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777402029; x=1778006829; darn=lists.infradead.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q+6hGBdPYlsa7maVYqZH/KB0/kt9UqvynCEzNjn3L/w=;
        b=OZXoPxs97hHV/eQNACfxM2+5yklrV/OPotbXfgBgBSARNuOyq/G/5aGpY0GGG/FjUN
         vkFaScDXmXdisdGVrN9nvVVQrv5rRLwuriR72hjSSc21oDOdu5l47/gmdTsuIjT7GQZ7
         eMlaRP0abzkHJ6aMMbZXB4TD0cPghAyargS8PPTZeDdtM14aKv7iBA+p6Yn6z8RTcTCl
         wr/16sGxZ5ieZTSm8Q2qubaIjnk+n91WkQNrcJE+abZjGrXHy6Z8FbzTo33OMpXu/Bcf
         473rxhsfSrD55YI0kBRhJ7X1zNtaVGKAsQrRWKArSNMybDKjKIg/B3k3z3zgnm2g0tmf
         L0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402029; x=1778006829;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+6hGBdPYlsa7maVYqZH/KB0/kt9UqvynCEzNjn3L/w=;
        b=PFHMdDYL/emAXyIBN7fZmccAFO/PUwSeFV3+95W670I1CQ82G1zf+SUDHztNLBPVB9
         ISYXorpc25A7TOK3Jw7YI9xtTu07sugqMDULj2I/Dzfed2Ku6O3KJg5q6hRMZcm36eZd
         hoETXvNrilKoAtQZxcJu1uACSAem94bVdzHFR/JbuPEIO67UmA1ZxO1TSbqnon20kmN0
         ntLw86ojkVR9U2kDxsfbY+ALX8BqBAZEuP2PbugzvJaOfXb664GnRp6cZDFau3IqxDTd
         MlCk23YSP0MZZzT/8NDQksB4/lDdPuNx7B57GpZ+B8Ol0qLD1WGw9SeQ5vZi7yTstCkC
         sK7g==
X-Gm-Message-State: AOJu0Yxzwa+Ol2EZlja6C5Q8ta+WFyvzhM86U1aoQ5jacecp4aNVP0fc
	cA/0aD8zfCESNcAK2xs6A5Tjoe/3gKusLZh6KUncJdoajj0MF2fx4VKQP1gdmKrFTMo=
X-Gm-Gg: AeBDieuar6S1EKuTi32hVVKRivmzE83VM+RB6ecyOEFfgw9/3SQLjArpf+Ue4aFwlwr
	Nm/+fFrLtemiWhtlwU07YZvij7HLjRdfc7NLPLVISpUNETP8kFIB4Pwoe75b75IDhfqeuQaT97a
	Nz6EVbr8Qg2U8ugwq3bEB5f/dLYFgFPNZaoQvYi1BoVnIDtHq9rF6Ul7ICO3z6NUXRo62L6R0ir
	MmOY2oBZl8BGW9a5SdLuSqAW0nNMwOtvBw9IGSmPX+podLLzTAycPSCm/ZfTwKSe3TcAN3MPa7V
	t2zYLhwUTG5MtQqQ1oN2v7AtlLaox1nb+u7oteKNg2/1FCsXWaE/D8eymQAIlklg/LeVcfZ6iUF
	MQL8FuotZqieDnOuWcdkaWPUJQovxNCZ96s5Pj2KLDrT9UOEVnNxldgivVTgdkbhlQblyg5uXxh
	+sTH7wSgzsIn+E/Zbcvcds6XelPt6ossagsMkp+PHsCaSszPXXNKGCVzpLBIkbUHqxKjUHfnzmh
	e/JZDUj0xWtMlYxmz8RJqKRngmDUjXkQ6ClTzPcf4q7OCmRjY3FvWhSejSmGXQC
X-Received: by 2002:a05:6402:4556:b0:676:e2c2:9034 with SMTP id 4fb4d7f45d1cf-67b1fe295aemr407739a12.13.1777402028448;
        Tue, 28 Apr 2026 11:47:08 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b686406asm1069598a12.30.2026.04.28.11.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 11:47:07 -0700 (PDT)
Message-ID: <62bb9013-bec1-4e69-91fa-c28b39771470@suse.com>
Date: Tue, 28 Apr 2026 20:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/riscv: per-CPU devid setup for Xen event channel IRQ on
 IMSIC
To: Baptiste Le Duc <baptiste.leduc@etik.com>,
 Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, oleksii.kurochko@gmail.com,
 xen-devel-owner@lists.xenproject.org
References: <75820aee-f842-4f40-983b-f360ae6e6d29@etik.com>
 <CAAhSdy2HK2DKF_9Z_Cdx3NzsOs9DxHBPM0-1xVHgMwiYsv9-Og@mail.gmail.com>
 <d1ddacc1-83be-4e3a-97a0-74ca45429584@etik.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <d1ddacc1-83be-4e3a-97a0-74ca45429584@etik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_114711_689563_AC95DB19 
X-CRM114-Status: GOOD (  21.11  )
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
Content-Type: multipart/mixed; boundary="===============5919717020582008625=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5919717020582008625==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RQ0gmQjRIKHKjLDLrmkMfwbw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RQ0gmQjRIKHKjLDLrmkMfwbw
Content-Type: multipart/mixed; boundary="------------nb85OOryLC1m7JZBEANIUrSZ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Baptiste Le Duc <baptiste.leduc@etik.com>,
 Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, oleksii.kurochko@gmail.com,
 xen-devel-owner@lists.xenproject.org
Message-ID: <62bb9013-bec1-4e69-91fa-c28b39771470@suse.com>
Subject: Re: [RFC] xen/riscv: per-CPU devid setup for Xen event channel IRQ on
 IMSIC
References: <75820aee-f842-4f40-983b-f360ae6e6d29@etik.com>
 <CAAhSdy2HK2DKF_9Z_Cdx3NzsOs9DxHBPM0-1xVHgMwiYsv9-Og@mail.gmail.com>
 <d1ddacc1-83be-4e3a-97a0-74ca45429584@etik.com>
In-Reply-To: <d1ddacc1-83be-4e3a-97a0-74ca45429584@etik.com>

--------------nb85OOryLC1m7JZBEANIUrSZ
Content-Type: multipart/mixed; boundary="------------vWhXvWUNtKgtS7F8DCoHZ6Dk"

--------------vWhXvWUNtKgtS7F8DCoHZ6Dk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDQuMjYgMTg6NDAsIEJhcHRpc3RlIExlIER1YyB3cm90ZToNCj4gSGksDQo+IA0K
PiBUaGFua3MgZm9yIHlvdXIgcXVpY2sgcmVzcG9uc2UuDQo+IA0KPiBJJ3ZlIGltcGxlbWVu
dGVkIFhlbiBldmVudCBjaGFubmVscyBhcyBhIGxvY2FsIGludGVycnVwdCwgd2hpY2ggd29y
a3MgY29ycmVjdGx5IA0KPiBmb3IgWGVuIDwtPiBkb20wIGNvbW11bmljYXRpb24uDQo+IA0K
PiBIb3dldmVyLCB0aGlzIGFwcHJvYWNoIGhpdHMgYSBsaW1pdGF0aW9uIHdoZW4gZG9tMCBu
ZWVkcyB0byBub3RpZnkgYW5vdGhlciBndWVzdCANCj4gZG9tYWluOiBydW5uaW5nIGluIFZT
LW1vZGUsIGRvbTAgaGFzIG5vIGFjY2VzcyB0byB0aGUgaHZpcCBDU1IgYW5kIHRoZXJlZm9y
ZSANCj4gY2Fubm90IGluamVjdCBhbiBJUlFfU19TT0ZUV0FSRSBpbnRlcnJ1cHQgaW50byBh
bm90aGVyIGd1ZXN0IGRpcmVjdGx5IGFzIGl0IGNhbiANCj4gb25seSBiZSBkb25lIGJ5IHRo
ZSBoeXBlcnZpc29yIGZyb20gSFMtbW9kZS4NCj4gDQo+IERvIHlvdSBoYXZlIGFueSBpZGVh
cyB0byBoYW5kbGUgdGhpcyA/DQoNCllvdSBuZWVkIHRvIGlzc3VlIGFuIGV2dGNobiBoeXBl
cmNhbGwgdG8gdGhlIFhlbiBoeXBlcnZpc29yIGZvciBzZW5kaW5nIGFuIGV2ZW50DQp0byBh
bm90aGVyIGd1ZXN0Lg0KDQpKdWVyZ2VuDQoNCj4gDQo+IFRoYW5rcyBpbiBhZHZhbmNlLg0K
PiANCj4gUmVnYXJkcywNCj4gQmFwdGlzdGUNCj4gDQo+IE9uIDQvMjQvMjYgNjo1NSBQTSwg
QW51cCBQYXRlbCB3cm90ZToNCj4gDQo+PiBPbiBGcmksIEFwciAyNCwgMjAyNiBhdCAxMDow
OeKAr1BNIEJhcHRpc3RlIExlIER1Yw0KPj4gPGJhcHRpc3RlLmxlZHVjQGV0aWsuY29tPiB3
cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IFdoaWxlIGFkZGluZyBYZW4vUklTQy1WIHN1cHBv
cnQsIHRoZSBndWVzdCBldmVudCBjaGFubmVsIGludGVycnVwdCBpcw0KPj4+IGFsbG9jYXRl
ZCB2aWEgaXJxX29mX3BhcnNlX2FuZF9tYXAoKSBhZ2FpbnN0IHRoZSBJTVNJQyBkb21haW4g
YW5kLCBpZg0KPj4+IHdlIHJlZmVyIHRvIHRoZSBBUk0gaW1wbGVtZW50YXRpb24sIGl0IG11
c3QNCj4+PiBiZSBlbmFibGVkL2Rpc2FibGVkIHBlciB2Q1BVIHRocm91Z2ggZW5hYmxlX3Bl
cmNwdV9pcnEoKSAvDQo+Pj4gZGlzYWJsZV9wZXJjcHVfaXJxKCkgaW4gdGhlIENQVSBob3Rw
bHVnIGNhbGxiYWNrcy4NCj4+Pg0KPj4+IFdpdGggSU1TSUMgdXNpbmcgaGFuZGxlX2VkZ2Vf
aXJxICh0aGUgdXBzdHJlYW0gZGVmYXVsdCksDQo+Pj4gZW5hYmxlX3BlcmNwdV9pcnEoKSBu
ZXZlciBjbGVhcnMgSVJRRF9JUlFfRElTQUJMRUQuIFRoYXQgZmxhZyBpcyBzZXQgYXQNCj4+
PiBpcnFfZGVzYyBhbGxvY2F0aW9uIHRpbWUgKGlycWRlc2MuYykgYW5kIGlzIG9ubHkgY2xl
YXJlZCBieQ0KPj4+IGlycV9zdGFydHVwKCksIHdoaWNoIGlzIGNhbGxlZCBmcm9tIF9fc2V0
dXBfaXJxKCkgb25seSB3aGVuDQo+Pj4gaXJxX3NldHRpbmdzX2Nhbl9hdXRvZW5hYmxlKCkg
cmV0dXJucyB0cnVlLg0KPj4+DQo+Pj4gaXJxX3NldF9wZXJjcHVfZGV2aWQoKSBzZXRzIElS
UV9OT0FVVE9FTiAodmlhIGlycV9zZXRfcGVyY3B1X2RldmlkX2ZsYWdzKSwNCj4+PiBzbyBp
cnFfc3RhcnR1cCgpIGlzIGludGVudGlvbmFsbHkgc2tpcHBlZCBmb3IgcGVyY3B1LWRldmlk
IElSUXMuDQo+Pj4gZW5hYmxlX3BlcmNwdV9pcnEoKSBjYWxscyBpcnFfcGVyY3B1X2VuYWJs
ZSgpIHdoaWNoIGRvZXMgaXJxX2VuYWJsZS91bm1hc2sNCj4+PiBvbiB0aGUgY2hpcCBidXQg
bmV2ZXIgdG91Y2hlcyBJUlFEX0lSUV9ESVNBQkxFRC4NCj4+Pg0KPj4+IFJlc3VsdDogaGFu
ZGxlX2VkZ2VfaXJxKCkgaGl0cyBpcnFfY2FuX2hhbmRsZV9hY3Rpb25zKCkg4oaSIGNoZWNr
cw0KPj4+IGlycWRfaXJxX2Rpc2FibGVkKCkg4oaSIHJldHVybnMgZmFsc2Ug4oaSIElSUSBz
aWxlbnRseSBkcm9wcGVkLg0KPj4+DQo+Pj4gVGhpcyB3YXMgY29uZmlybWVkIGJ5IGxvZ3M6
DQo+Pj4NCj4+PiDCoMKgwqAgWEVOX1RSQUNFIGlycT0xMiBwZXJjcHVfZW5hYmxlIGNwdT0w
IElSUURfRElTQUJMRUQ9MQ0KPj4+IMKgwqDCoCBYRU5fVFJBQ0UgaXJxPTEyIGhhbmRsZV9l
ZGdlIERST1AgSVJRRF9ESVNBQkxFRD0xIGFjdGlvbj0uLi4NCj4+Pg0KPj4+IFdoYXQgd2Ug
dHJpZWQNCj4+PiAtLS0tLS0tLS0tLS0tDQo+Pj4gLSByZXF1ZXN0X2lycSgpIGNvcnJlY3Rs
eSB3b3JrcyB3aXRoIHVwc3RyZWFtIElNU0lDIHdoaWNoIHVzZXMNCj4+PiBoYW5kbGVfZWRn
ZV9pcnEgd2l0aCBubw0KPj4+IGlycV9zZXRfcGVyY3B1X2RldmlkKCkgYnV0IGl0IG1lYW5z
IHdlIG9ubHkgY2FuIGhhdmUgb25lIHZDUFUgd2hpY2ggd2lsbA0KPj4+IGFsd2F5cyBoYW5k
bGUgdGhlIGlycSwNCj4+PiBhbmQgd2UgZG9uJ3Qgd2FudCB0aGF0Lg0KPj4+DQo+Pj4gLSBB
ZGRpbmcgaXJxX3NldF9wZXJjcHVfZGV2aWQoKSArIHN3aXRjaGluZyB0byBoYW5kbGVfcGVy
Y3B1X2RldmlkX2lycSBpbg0KPj4+IGltc2ljX2lycV9kb21haW5fYWxsb2MoKSBmaXhlcyB0
aGUgWGVuIGNhc2UgYnV0IGJyZWFrcyBhbGwgb3RoZXIgSU1TSUMNCj4+PiB1c2VycyAoUENJ
IE1TSSwgcGxhdGZvcm0gZGV2aWNlcykgdGhhdCBjYWxsIHJlcXVlc3RfaXJxKCksIHNpbmNl
DQo+Pj4gcmVxdWVzdF90aHJlYWRlZF9pcnEoKSByZWplY3RzIElSUXMgbWFya2VkIF9JUlFf
UEVSX0NQVV9ERVZJRDoNCj4+Pg0KPj4+IMKgwqDCoCBXQVJOSU5HOiBDUFU6IDAgUElEOiAx
IGF0IGtlcm5lbC9pcnEvbWFuYWdlLmM6MjEwMQ0KPj4+IMKgwqDCoCByZXF1ZXN0X3RocmVh
ZGVkX2lycSsweDgwLzB4MTJjDQo+Pj4NCj4+PiBUaGVyZWZvcmUsIGRvIHlvdSBoYXZlIGFu
eSByZWNvbW1lbmRhdGlvbnMgb24gaG93IHNob3VsZCBJIGhhbmRsZSB0aGlzDQo+Pj4gY2Fz
ZSA/DQo+Pj4NCj4+IFRoZSBSSVNDLVYgSU1TSUMgZHJpdmVyIGRvZXMgbm90IHJlZ2lzdGVy
IHBlci1DUFUgaW50ZXJydXB0cw0KPj4gcmF0aGVyIGl0IHRyZWF0cyBJRHMgYWNyb3NzIGFs
bCBDUFVzIGFzIGluZGVwZW5kZW50IHZlY3RvcnMgYW5kDQo+PiBwaWNrcyB0aGUgcmlnaHQg
dmVjdG9yIGZvciBhIGRldmljZSBNU0kgYmFzZWQgb24gYXZhaWxhYmlsaXR5ICsgYWZmaW5p
dHkuDQo+Pg0KPj4gT25seSB0aGUgUklTQy1WIGludGMgZHJpdmVyIG1hbmFnZXMgcGVyLUNQ
VSBpbnRlcnJ1cHRzIHNvIHRoZQ0KPj4gWGVuIGd1ZXN0IGV2ZW50IGNoYW5uZWwgaW50ZXJy
dXB0IHNob3VsZCBiZSBhIGxvY2FsIGludGVycnVwdA0KPj4gbWFuYWdlZCBieSBSSVNDLVYg
aW50YyBkcml2ZXIuDQo+Pg0KPj4gUmVnYXJkcywNCj4+IEFudXANCj4gDQo+IA0KDQo=
--------------vWhXvWUNtKgtS7F8DCoHZ6Dk
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------vWhXvWUNtKgtS7F8DCoHZ6Dk--

--------------nb85OOryLC1m7JZBEANIUrSZ--

--------------RQ0gmQjRIKHKjLDLrmkMfwbw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnxAKsFAwAAAAAACgkQsN6d1ii/Ey8U
Wwf+Oiu1TgGR+QvJ0b8NCtdtsIMO8SyDb2n5zLf7BKbMqUCkEs9aODQP02GdzI1UpW7MhS84AOdH
xnWtg1vd1sP8NfiII5ooZ/KdgceeKWLMTNQi6bj0dquA65xDnV9GzjbRODALNJcJjoBAYlSYAKyl
JC5ghfKZNTQ1yRiHe6P7ePsv8SiJ7sUHcvpHc0oUwszQXaiIGSS2XrPLYMDv3VzweYukSJuIJV9T
/f4MYHfBbktBlb3viRZQfdpL65llWXQvoVcUpalg7C4cqYeBeB+d8FjuBbQREj97W4NLnxXJ1GZM
ExTqcSqInzeUjeZ34xtkb9XoZZz+G4HWCzYAhPH+TA==
=9/0/
-----END PGP SIGNATURE-----

--------------RQ0gmQjRIKHKjLDLrmkMfwbw--


--===============5919717020582008625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5919717020582008625==--

