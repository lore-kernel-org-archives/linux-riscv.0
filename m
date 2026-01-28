Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECD1D46BFC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 21:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3AVGNa/6ZbRugKTZahd02Bv8QXinh/hw3A42DGoJPaU=; b=PC6j3/uUxoCllD
	2pRXXQFfEQ0JpMqXL9/hAhb0A+q+vfog4ADWnx+kgeVMzLdGPdEwTsAipEkA0k2pjKywxMDcgrASk
	tWdMDJFRg1ZX1b9m5IPWmc1wHyZRtnm6QSVtUW+2DjfKkrMOooP4o9f36a4N4HyudL+FHM0sIb3t7
	yu8dbvBkhbG12161mF7YbNtoOs1s+nvHZiWFMb/0y10cUy85XpII4CgPSkooTkD9eZO6XBTAMaLLj
	GV6uz7Wd4BlWDy/slkF95FxZtR5KW/YJo9QbZmLyMzs/KvHJ3fFIbt7D1IQAXRvGPrZtxilZvg39b
	kiEIZ80gj6MeGhkY5pZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCfJ-0000000GoUq-2tFW;
	Wed, 28 Jan 2026 21:01:29 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCfE-0000000GoUT-12HF
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 21:01:28 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6494a3d92f5so275712d50.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 13:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769634083; cv=none;
        d=google.com; s=arc-20240605;
        b=ZFwsvdWuPemEYbZz4GsuLGUUiKVRkxv0Hp7jEmy8BzKS3sr1NJqyAHy4uqlQIt89cA
         IE81+MOrAI3pmCw56tUT6GBZ9xR+wtTKQtezsT88TKNPJVnSd8y56UoRZScMBEYzOBKg
         B/RBIQ4oxD3cEM4SZ/y5DpLIkT0iKBYX2+ySBFUBSfpnf4qX0CAHndjlFAjTEKQKv68G
         NLve0BeeQZ3FOwwoNay72CPTX53TphsFV0OrzIs3BxYbMtA630O5DPpk4MyzFa2QmIFM
         y2HKl+pMKx8TdbjplSMf0t1KiMvnBnq7EUL+0zmB/sdOq44FGxrVsRkC1MlrGjAJFqUV
         GLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q366hLe7gQaI5rjlaG/ooZDp0LuYfAPugWB8ysxyHwo=;
        fh=11PhQJSDzopRFyS9zRLnovk5Py5jH8YgdFpYd1tocb8=;
        b=aKLdlFPk9szR8rZxQs3L/8TeKOnLszJWfkyBjJfGL2pSQh5DsNVyyn/rYcA19kmOs6
         w5MM0okOc1l4hgD88mv+c/G4xoW6bgtelVHhqcFOBCHpgCXLqXQ7iafl8u0ftj3vzxfg
         EBbq71qAIVwguv5ylJAcs+e6lQRR5j+8WOwIe6uDdelhweK0+zIIuAoklr51KFH/QlXI
         C8kIJabcu/bQRA68FUNVKs94OYS2p3Ou0FuBXTU4Dwa0hdHeU5XnUDs7QhCs3zcvYbc6
         EUIoVik7k/wiJgzHmv6h0CBRPZfj0Bq5jIgYN3ca7cpzg24/L/9FN5M/9ZT6Nq5x3wjh
         BQGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769634083; x=1770238883; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q366hLe7gQaI5rjlaG/ooZDp0LuYfAPugWB8ysxyHwo=;
        b=bLvetIcjPf/Yz21BO0oJ0r38qn3ez27HpipXxBsFerVlxDSWSH5F4V993UX66LcnO2
         M2T0dQpwJc5kfeeGZ03eiY/SQ/KAUp4OfoNj1xAvo12JioFfO6prECbKlRGtCtVTUjnC
         ocBEOpRicbPa38bFGwfZqvDFU75Ild3lFdMqCI3sSIvw+RAq7mKFcjJe9fmNmgnQKZoL
         rZmUR98V1aR0IjGVqmsEOBLFizZp5UkqOQj8AxnqpgGQ1q0ukUyV1Bq6ps/ehxbV0YzY
         YacohgEfRne7ZpVBVhTypd/uuJuhIbCUwz2y8u32/DFAF3Zjw8PVJoBxmRwCk/E0/k7l
         91Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769634083; x=1770238883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q366hLe7gQaI5rjlaG/ooZDp0LuYfAPugWB8ysxyHwo=;
        b=NVMZHCwGVNyxiZ1XJ+mQnp4JKcRnmH62m81pFBad1V5/gbOy+B1kQhfZ9MrfoTB2U/
         Q/ntuYaCoZCqV0qZOm3Hl27omqIS5sBfrgk3JuTyFcgwIH+zG3ZCdjFbStNecTEmoDo6
         tI30bTWQumSeS4JBPZuycM/NkTJmfb5qC1E6Dq1DZJav6TPwou0SjZ3hz7lYSy6Wu8GN
         oT+L7nD//96t3J7/5FKP9OhvL5VlFwEFiA2ugAz3//y9VVrxjnS6tj2kyWUKMTvEqZ/g
         yktxvOsyrjyJpXUOLHvpyHzVvy7I3Dtk2Prh4h2l2ZbF5XrvSqE3UcvZo+6Inkt1Kf9y
         6mWA==
X-Forwarded-Encrypted: i=1; AJvYcCUgyxmHaWqeuQqywLdRgvFt9DXvicxhOLJ7sH1HP7wvAuNBLW/9zYtOqAmUEtURbwA2JCYA6dIHoM0xXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YztKjLszWmwJkLJ8wykOxsoncq3cUFNz/lZE/40TA3ihToM71FC
	TTUKUg3Jf5kyAzlmCSWozzAkJP+shrhE1vqk+g9PtVhtskyA83o3nBKXIebJL2HPKYev9936F/1
	6PUHxoGSZzafx0eq8Ef+5ZJ6eIg3zAKDUuMSiH/PeNw==
X-Gm-Gg: AZuq6aJAS+UpSkvib8i1QHTYYeLYLaq94aXiMurgGyyJHMdVWnI6eaL/KKNBC5tQF5T
	RUjfEIoG+zC8QfjCCHDIcBITXW6sqecXvfoR1Lh3kJ9G1kbJsd+CMEuUxQatm4WR3ZWNVHw4xLR
	Bt7ywAr6d7iNJLZ7+Jir66dWA8eoGz8+5+Y5FddjOoEp24JbZSI9uVCPOFiwb5F4loBG+fzozSS
	ee+dlssOsGK8m7Brii9FsJC8BVi4yYkdUZ0YucyegUTwaNOLZM5uyxI9aukgCon4c3Cyl1zzGsb
	rGJ9lPUowv2ZoUZFivG1tqukS4mJrae6Jq1T2ZuEx2e7PsKzU2Zfbak4rIA=
X-Received: by 2002:a05:690e:1901:b0:641:e6aa:583f with SMTP id
 956f58d0204a3-6498fbd7285mr5173079d50.15.1769634082636; Wed, 28 Jan 2026
 13:01:22 -0800 (PST)
MIME-Version: 1.0
References: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
 <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com>
 <20260127-mystify-carmaker-150aa3fcd6c6@spud> <CAEev2e-p28J_H2oWdrtgGJ0Z=2iGn8FjFBN8ggU0t_Wtbi62rA@mail.gmail.com>
 <20260128-duckling-confess-88e64fabe752@spud> <CAEev2e9Y95bYDdvhJQ2954K2q5yMrGA3UF2U=QN83ZNbZ5LJBw@mail.gmail.com>
 <20260128-nappy-repaint-e464d9964134@spud>
In-Reply-To: <20260128-nappy-repaint-e464d9964134@spud>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 28 Jan 2026 15:01:11 -0600
X-Gm-Features: AZwV_QgfoguDQdOLdwSNveH96jgRmNQg1sP19SgMVUtC9BAJsQ6YIqpThUYUpUM
Message-ID: <CAEev2e9onS-ogepaTugmGSc4-p6H0ZL54n1yd3bofTWTnLRM-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
To: Conor Dooley <conor@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_130126_687380_F6411D29 
X-CRM114-Status: GOOD (  24.27  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ29ub3IsCgpPbiBXZWQsIEphbiAyOCwgMjAyNiBhdCAxMTozMuKAr0FNIENvbm9yIERvb2xl
eSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEphbiAyOCwgMjAyNiBhdCAw
OTo0Mjo0MkFNIC0wNjAwLCBBbmlydWRoIFNyaW5pdmFzYW4gd3JvdGU6Cj4gPiBIaSBDb25vciwK
PiA+Cj4gPiBPbiBXZWQsIEphbiAyOCwgMjAyNiBhdCA5OjAy4oCvQU0gQ29ub3IgRG9vbGV5IDxj
b25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBKYW4gMjcsIDIwMjYg
YXQgMDU6Mzk6MzNQTSAtMDYwMCwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3RlOgo+ID4gPiA+IEhp
IENvbm9yLAo+ID4gPiA+Cj4gPiA+ID4gT24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgMTo1OOKAr1BN
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gT24gTW9uLCBKYW4gMjYsIDIwMjYgYXQgMDM6MDc6MTRQTSAtMDYwMCwgQW5pcnVkaCBTcmlu
aXZhc2FuIHdyb3RlOgo+ID4gPiA+ID4gPiBEb2N1bWVudCBiaW5kaW5ncyBmb3IgVGVuc3RvcnJl
bnQgQXRsYW50aXMgUFJDTSB0aGF0IG1hbmFnZXMgY2xvY2tzCj4gPiA+ID4gPiA+IGFuZCByZXNl
dHMuIFRoaXMgYmxvY2sgaXMgaW5zdGFudGlhdGVkIDQgdGltZXMgaW4gdGhlIFNvQy4KPiA+ID4g
PiA+ID4gVGhpcyBjb21taXQgZG9jdW1lbnRzIHRoZSBjbG9ja3MgZnJvbSB0aGUgUkNQVSBQUkNN
IGJsb2NrLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmlydWRoIFNy
aW5pdmFzYW4gPGFzcmluaXZhc2FuQG9zcy50ZW5zdG9ycmVudC5jb20+Cj4gPiA+ID4gPiA+IC0t
LQo+ID4gPiA+ID4gVGhpcyBpcyBwcmV0dHkgc3VzcGVjdCBzb3VuZGluZywgaWYgdGhlIFBMTHMg
Zm9yICFyY3B1IGFyZSBjb250cm9sbGVkIGluCj4gPiA+ID4gPiB0aGUgcmNwdSByZWdpc3RlciBy
ZWdpb24sIHdoeSBpcyBpdCBub3QgYSBjbG9jayBwYXJlbnQgZm9yIHRoZSAhcmNwdQo+ID4gPiA+
ID4gcHJjbXM/Cj4gPiA+ID4KCj4gUmlnaHQuIExvb2tpbmcgYXQgdGhlIG1haWwgZnJvbSBLcnp5
c3p0b2YsIEkgc3VzcGVjdCBoZSBtZWFudCB0bwo+IGNvbXBsZXRlbHkgZG9jdW1lbnQgYW5kIGV4
cGxhaW4gdGhlIHJjcHUgcHJjbSwgbm90IGFsbCBvZiB0aGUgcHJjbXMgKGhlCj4gY291bGRuJ3Qg
cmVhbGx5IGtub3cgdGhleSBleGlzdGVkLCBiYXNlZCBvbiB5b3VyIHYxLCByaWdodD8pLgo+IEkn
ZCBzdWdnZXN0IHlvdSBkcm9wIHRoZSAhcmNwdSBzdHVmZiBmb3Igbm93LCBhbmQgc3VibWl0IGl0
IHdoZW4geW91Cj4gaGF2ZSB0aGUgZHJpdmVyIGZvciB0aGVtIHJlYWR5IHRvIGdvLiBUaGF0J3Mg
dHlwaWNhbGx5IHdoYXQncyBkb25lIHRvCj4gYXZvaWQgaW50cm9kdWNpbmcgYmluZGluZ3MgdGhh
dCBuZWVkIHRvIGJlIGNoYW5nZWQgb25jZSB0aGUgZHJpdmVyCj4gYWN0dWFsbHkgdHVybnMgdXAs
IHNpbmNlIGFzIHlvdSBzYXkgeW91J3ZlIG5vdCBhY3R1YWxseSB0ZXN0ZWQgdGhlCj4gZHJpdmVy
IGZvciB0aG9zZSBwcmNtcy4KCk9rYXksIHRoYW5rIHlvdSBmb3IgY2xhcmlmeWluZyB0aGF0LiBJ
IHRoaW5rIEkgaW50ZXJwcmV0ZWQgdGhlCm9yaWdpbmFsIGNvbW1lbnRzIGFzICJvbmNlIHlvdSBh
ZGQgYmluZGluZ3MsIHlvdSBjYW5ub3QgY2hhbmdlIHRoZW0KbGF0ZXIiLiBJIGd1ZXNzIHRoZSBj
aGFuZ2VzIEkgaGF2ZSB3b3VsZG4ndCBicmVhayBiYWNrd2FyZApjb21wYXRpYmlsaXR5LCBzbyB0
aGV5J2QgcHJvYmFibHkgYmUgZmluZS4gSSB3aWxsIGRvIHRoaXMgdGhlIHdheSB5b3UKc3VnZ2Vz
dC4KCj4gSWYgeW91IHRoaW5rIGl0IGlzIGdvaW5nIHRvIGJlIGNvbmZ1c2luZywgdGhlbiBtb3Zl
IHRoZSBiaXRzIGNvbW1vbiB0bwo+ICFyY3B1IGFuZCByY3B1IHByY21zIHRvIGEgZmlsZSwgd2l0
aCB0aGUgdW5pcXVlIGJpdHMgaW4gZGVkaWNhdGVkIGZpbGVzCj4gcGVyaGFwcz8gSXQgc2VlbXMg
bGlrZSB0aGV5J2QgYmUgZmFpcmx5IGRpZmZlcmVudCBldmVuIHdpdGggeW91ciBjdXJyZW50Cj4g
c2NoZW1lIGFuZCBrZWVwaW5nIHRoZW0gYXBhcnQgd291bGQgYWlkIHJlYWRhYmlsaXR5IG9mIHRo
ZSBkcml2ZXIgaW4KPiBlaXRoZXIgY2FzZT8KPiBZb3UgY2FuIGRvIHRoaXMgZXh0cmFjdGlvbiBh
cyBwYXJ0IG9mIGFkZGluZyB0aGUgIXJjcHUgY29kZSwgdGhhdAo+IGRvZXNuJ3QgbmVlZCB0byBi
ZSBkb25lIGZvciB0aGUgcmNwdSBzdHVmZiBzaW5jZSB0aGUgY29uY2VwdCBvZiAiY29tbW9uIgo+
IHdvdWxkbid0IGV4aXN0IGluIHVwc3RyZWFtIHVudGlsIHRoZSAhcmNwdSBzdHVmZiBhcnJpdmVz
LgoKT2theSwgc29tZXRoaW5nIHRvIGZpZ3VyZSBvdXQgZm9yIHdoZW4gSSBhZGQgdGhlICFyY3B1
IGNvZGUgbGF0ZXIuCgo+Cj4gQ2hlZXJzLAo+IENvbm9yLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
