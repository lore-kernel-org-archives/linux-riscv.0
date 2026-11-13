Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009F4606A332
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 19:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cwmqWNpI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHr3mJ7p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IJvBOOt2+qO+zFlAr1DOvUKzquz42wuLRpn7YtA10+g=; b=cwmqWNpIdpU7a0G1n61aK15GMh
	6oWEa1SBHmDMIjkikq8wPKIAPtAICYEUrgmB2kCDeMiJt2ZV5CQO9lyB7W8LTn+uTQVEknvoaGoTv
	szQv7ItXlUkCU/ozeCvR1dWEYX2BWe8Q8SeahrKVb1/c58SRRmh4bfgWRmDffWGp2MOIAEPHGc9bB
	9OWnxyB1b7rmIL5iJnuuS5bpQMK+rL/6qU81rTENL0M29npEaih4Yfvkyn+j64Db7v0e3I4SvaiL4
	4rdIqApIzigIjXdaHULQqWA9gxaSNaov3nEKfGS6eR/4HlgXggaJSgcJi1BrVMBxMu9DNLYaYbIJS
	r08gMonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwjp-0000000E88u-2Phl;
	Fri, 13 Nov 2026 19:15:05 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwjm-0000000E87Y-2VKb
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 19:15:04 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-67c02c106e6so1304328d50.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 11:15:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794597299; cv=none;
        d=google.com; s=arc-20260327;
        b=g/6UI1OGhJgWks5dpy1wx9OqxMUwjQwhUSeabQhr5hRLDtJiKWRvU4qt1kfPB6xqs2
         2joFuSFRVFSUhhEQdioupS8II8X9+vJiUjTVpv1grXeDvXaNvWMBorNp4fEsQVUlsygV
         HIUg/ujx/gkSVgRXc9OG2Y6pe7kwO9obn2YF0SBo2td3vRrr21zgEtTAa6tBSdU8BFsm
         T+ykNtKeA7ri8Ngkjui93LvohH9tLX09N2Tue2Hhdm65hmvt+4LWcqGCACA4/v6jcNqa
         dTTJcx57b8nXg4pykjEr1SRXn4GZ+jl6PhfMdNn8qVenq9+O52+ovHohyGUONGV1Kf60
         1h6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
        fh=6mqWMmCwI5lNtDXu768Iau0djLMSIuDl+8ETvxw3KE8=;
        b=LFWQ9R6O3rfH9Lzdbg3EPJ4+9P1QswBfRxuxTTvcl4/wpBBL8JyMvCYfxfeqyDB5JC
         R6JgRo/aSF6KFWOxRuGRlWhqvHOT0FF4AAA1XflGVWsXRYHbJVNoV2qJuLlDiQwj2euH
         2gY53ph7bz4tn7+IZFxEynmruoD7lfpXzuO0D7ItJRx6vweLt1QHVayHpZqYwSm+XqEJ
         LUADvUPnm6IrUMlMcuQkhk7PAlbMyOGB+yieMSHEdwF0OLPdt54Vl5A/0UYTkV07L60Q
         L+HY+Kl13CZRMF/aYE2zpDsJ7uIL31BwvswbrhoEz6kfu7wkdpYRqQaUTjdxpKleWBH9
         LD7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794597299; x=1795202099; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
        b=jHr3mJ7p3CsSlkcq4e+nb7UlYOxxE5++HOy3U0vdIOg/ld02/9O9d/18uf1quQcHNZ
         GHWWFQHkX8bBLu2v8H/uMRsPegGmdoevPdU1M54WygZu1+8i+LtwtnFyK4/Fy+PLK+po
         255gBIivCG3XLe/LFQ3Wu1KyiWRIgfNGmb5BGFX4LOHI7VFrdH9b+vopANHEffqKsenz
         DDlFloUR/lSw+2jyIl01n8lVf2grqTnxHoL0oQsMB28Q/CYAzzxSJ40A3IDpaYDCh5yk
         o2g+Rm1EcqCgdsTLADzfnfQ4S4ET7Zs89Tbiag4xy0uREl2Y8eiR/4k4/zk+7S+UeB5n
         LMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597299; x=1795202099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
        b=rrl+aWkTC/ldlRacWShPyuV83a/A6Kn7dNkZlnW/7LtWV3cAbroUm2iU+IQdvJg+RE
         vanPTbuk42c2buD8YdX3Hn3FutozS6an2Ck0wtmWnKbTlYY8CYo+MT6FHJ/45HagCGEJ
         v9Ub/C8z0xM79/LQoef834tw7LS4Lu3Ki14UM/LptwHjsXMg04kmeS3Ybl+rBCcIrchz
         2KsNBo0F1lE6x/IaYVCOcDkwyzkChxlxG9BDvTvvX+JnX63Himxk3Dm7T7dV/uLzS54A
         oaOqPhRn3h3o8VMEwWghvckedULsFfAYHIp04mJ50fjPMnUIHzKc9a1wgYZ8wXwQNN1T
         H4Kw==
X-Forwarded-Encrypted: i=1; AL+hErFBUYFXcN324Oujr2cBvi6CVRrQ6yFSSGTXekTLhWyf20tp3BndVsoSoffNy30NMCO2ItA6ZDvDLTFenA==@lists.infradead.org
X-Gm-Message-State: APuU4Z93k78akWibNNg3uZf+B+zqgmikBPakBVFp/QApu1tD9awvqHrW
	OO695IpzWB+OuJ+xFQVJbuS7yv6gXOhIef7zD6efz+xjmca/hW11XXWkkSC4nHcZg07gkjFXMTz
	XGIdAPCoo2JkzE6WgCQSrzCghhqgSXic=
X-Gm-Gg: AYBFou0M4gRbmtj1ci67cZ5cYpJCo/ojxSvT+OJMGwjQQZrYWE7c0taPZnvTRkz2pEY
	QKSAuIQN7K0ixttWN+qWNbll6+alrOAbWmGVGh5QBlOeuMQOzt4BQvxkFEF2jbsQEnQvx0t5nS8
	CbGFtC+S55YA7XsLiZnVOUwTU/Ev+TYbd9Ho2J44fyycA92z63lxUBFJcHbccNNOSuHgwGb92L9
	keWzxSRVgNCZ8aFlWnRkzlF9SPWvWqmJfWDbJQrKU8LTvQBdr5/1VfkCzmF+xu5NCobBzK7bKfd
	gxOEv+ucrrJjpvHP4/FO+pB6YOlAYQvA79HtiYMKCIzot+57PRV7qkyS4pPI4Ty9WDw1U+tNf2f
	BIcq3nZS6kImHEyP+M4oNKvZQMLaT5696f05BPA==
X-Received: by 2002:a05:690e:1188:b0:67d:98b7:8861 with SMTP id
 956f58d0204a3-67d98b79810mr345876d50.48.1794597299405; Fri, 13 Nov 2026
 11:14:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
 <20261015-orangepi-gpu-v1-1-03566a615660@gmail.com> <20261111004732-GKB2005@kernel.org>
In-Reply-To: <20261111004732-GKB2005@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 13 Nov 2026 20:13:00 +0100
X-Gm-Features: AclHuK_kboH0z5fWoPol696e94WfTnxywiDJDP5pOyMB6ipnYxJpzrLU0NPVDpw
Message-ID: <CABdCQ=MPPuTQ-3aCds7F6C1AZ2c79HVJXGjtqN9_jHpKo+0E2w@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] riscv: dts: spacemit: k1: add PowerVR GPU device node
To: Yixun Lan <dlan@kernel.org>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_111502_648227_7A6FFCED 
X-CRM114-Status: GOOD (  13.33  )
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgWWl4dW4sCgpFbCBtacOpLCAxMSBub3YgMjAyNiBhIGxhcyAxOjQ3LCBZaXh1biBMYW4gKDxk
bGFuQGtlcm5lbC5vcmc+KSBlc2NyaWJpw7M6Cj4KPiBIaSBJa2VyLAo+Cj4gWW91IGNvdWxkIGRy
b3AgIlJGQyIgcHJlZml4IG5leHQgdGltZS4uCj4KPiBUaGlzIHBhdGNoIGdlbmVyYWxseSBsb29r
cyBnb29kLCB3aGlsZSBub3RlIHRoYXQgaXQgaGFzIHRvCj4gd2FpdCBmb3IgcG93ZXIgZG9tYWlu
IHRvIGJlIGtpY2tlZCBpbgoKVGhhdCBtYWtlcyBwZXJmZWN0IHNlbnNlLCBJIGFscmVhZHkgbm90
ZWQgaXQgaW4gdGhlIGNvdmVyIGxldHRlciBhbmQKSSdtIGZpbmUgd2FpdGluZyB1bnRpbCB0aGF0
IG9uZSBpcyBtZXJnZWQuCgo+Cj4gT24gMjA6NTYgVGh1IDE1IE9jdCAgICAgLCBJa2VyIFBlZHJv
c2Egd3JvdGU6Cj4gWy4uLl0KPiA+IERpc2FibGVkIGJ5IGRlZmF1bHQ7IGJvYXJkcyBlbmFibGUg
aXQgaW5kaXZpZHVhbGx5Lgo+ID4KPiBBcyBHUFUgaXMgaW50ZWdyYXRlZCB3aXRoaW4gU29DLCBJ
J2QgcmF0aGVyIHNlZSBpdCBlbmFibGVkIGJ5IGRlZmF1bHQsCj4gc28gd2lsbCBub3Qgb25seSBv
bmUgc3BlY2lmaWMgYm9hcmQgYmVmZW5pdCBmcm9tIHRoaXMgcGF0Y2gsCj4gYmVzaWRlcywgSSBz
ZWUgbm8gcmVhc29uIHdoeSBwZW9wbGUgc2hvdWxkIGRpc2FibGUgaXQgYnkgZGVmYXVsdD8KClRo
aXMgaXMgb25lIG9mIHRoZSByZWFzb25zIEkgc2VudCBpdCB3aXRoIHRoZSBSRkMgdGFnIHNpbmNl
IEkgZGlkbid0Cmtub3cgaG93IHRvIHByb2NlZWQuIEknbGwgbWFrZSBzdXJlIHRvIGVuYWJsZSBp
dCBieSBkZWZhdWx0IGluIHRoZQpuZXh0IHZlcnNpb24uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
