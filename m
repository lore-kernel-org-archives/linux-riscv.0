Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A3DE9A03B
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Feb 2026 22:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FShXFXjz6WGX252gkQHi8UpUr8FPXWfHWuDfwRbg7qk=; b=qOmU3inkRu8OUq
	5AQzXmjl1jokV9OH2kAsXMHXS7lA+8Wd1Y7RuI4asCig7EnD8k5eCn+QVKRcvw+UNHsHXfTBdetrM
	4GuVI06NLDY+hdQeqjcdh8Y0VwC5LaAECsB2X8t2VDJuPbpPivFC60girYVU9Fvn9/98B/ztlPacJ
	Vbaq9Gyjx91JjraY5TbLLCyfZQr4Py5uPhA94pPzvA6US2Mzm3F0Nyq8VAxpsDKtNc8VDyvb+t4hZ
	q/KOplFg3Qr5WUzcOGg2iw0b/5OkxsxRA9mJPbN0Eho+ox4fOxSz0BW6VVbFA1PynwudAn4dzWYvZ
	17rTYJBFaCpP2ximhmBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsTsh-000000090KE-2wNr;
	Tue, 17 Feb 2026 22:49:23 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsTsf-000000090Je-2iki
	for linux-riscv@lists.infradead.org;
	Tue, 17 Feb 2026 22:49:23 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-64ae1729637so4321197d50.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Feb 2026 14:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771368560; cv=none;
        d=google.com; s=arc-20240605;
        b=DBQa95QmILtGCmLzzBaa9dWKy9bPvYnEU/SardXuzxul1sq2j7Rra1Nxb4fQP4zEfo
         PcmvLVkoPkDKsXgsUlDnrZ9VVStoEIiXnWh/kkAjidD8OBanRS4AJuVfdKHbWUSmuD5K
         xuBCgelp1KLqCD/5jMmKPQrT7t/ImO4eaq1uXAZZQ4xi6CWTUURxy9j2zc8me5m14qmF
         q2XmhMyuHDZDVAnZYoEkkszGumm3xNZD9BkaoJCdD4DBq8GV+6bLBQUNyt4/heKW5wYi
         Rf6XJXds9RL9l51z96Oht/N8mFRf1VZTIWj3/3jj11mpi4JgJqPF9CCT6iqBFY8YdPC1
         CJ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nsna6x3edOZVDgHaZx8mdX2v6amo8aiMzBSafaXBTkc=;
        fh=1Nrpyz0SmttjS81dpAJVpQp0TKaMuhVAPTlPbt0D2t8=;
        b=HuBh1sp9PR4FDWJ3VcFjNZ9EqlDulkU2nztUURDHTP57eAg9b6ioD0ONiwg9F6Wqs3
         rZP/t1qAzFXU/SIJXENixs1rM4ByWPoR/CilxE5jRicoYlBNMR3W0piKAGg+mi2WVj0I
         HOQpTIoFfLnUwLMj1IrWbeKe8vZr2vv1JvE4jgyk24TqA6S2bbzXYbteUInyvpLSyYBM
         4CML5YCkuEWmNEEn0e52LIpMFjyIhp0H4YN2d4EjTAGB4SYeBQEVqT8tTFJ7x3XdpvJF
         cZi5R20MohTdfKfo5jUIobIx+dObZsJs3FkX0t9rWXJLsZWBcz4lqlOSr7TJ2UygbfqI
         Je4A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1771368560; x=1771973360; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsna6x3edOZVDgHaZx8mdX2v6amo8aiMzBSafaXBTkc=;
        b=hIMeXqgcReFJCFwq9A09+LDrpvgWgzM7XlSjR/KOYoUEfzmnRFpgdNAtkmqA6oJi3e
         xlt8lMxGeo9SighMrlsD4YQ7BCswBprW6PH01KuW0gaPz4DUnQ4riWlHQt2shx2cdSi6
         phHJLe/STDhH/tW+Syzp/aS/H6pE+GgGPJmnfB+orsAjCdQcG55EiFCPgX+9g33KjL2h
         r95GWXr6hvTpkieb6HPCqNZKC09zVxUmVvQL88yQrVSdWOF6aI3WuZPiJNuUh24YUrlN
         ljUEp/qil0rlXWbjCUUAlt6hXQttE5PgRSEiqaFQu1yK7DLdIfdtVNpDL8prbtFLOet0
         s9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771368560; x=1771973360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nsna6x3edOZVDgHaZx8mdX2v6amo8aiMzBSafaXBTkc=;
        b=wAxTAYaU04kSFTbPtskq9ZFzD2HkkdnDkewEyR20XX/ouMkDTzFBjxBlAjt0447BT1
         U0FFXOOZRGmy5VAAeVweopIiQoQXtWvPwtm15q09nffr2SuRPfF9y/lcgMKWy9yJe3Yj
         oIih8p+rf5Obu8EDaNy7w5z+469BnejpDiH50Eiy9y2FV0QLwBnZXYn8fGHdehkKlrKM
         PNEarGSqmvxNidFxdsHZAF2namUHJT5DR7Qgdt9A7568ud5uzf9MCRcr/9P3Gw+SVk4O
         EZjU6rTGVYtkhWB/BK6ZgXZnA6uIqA4x/K6fn2VVq4qZcIcB7pbtKgBn3XnJOQ4zdMx0
         iLMg==
X-Forwarded-Encrypted: i=1; AJvYcCUFobP6dhLZvDa/yNleUu9EFXZ7XIiLcOLUJoH1gRAFpoc1HShSdCIQa3n0Vsk7CjKylViLjTgFsZjjVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBjaMWTD9dHZ4iMU58b0dfTcDXbCSGeop6oxgJGH1SGZ2yWx5Z
	xYLdprPpb46UUYF8LWBH7kZ6N3RSFsmZADdZoGOwNpo0X8pKvO44VApTqaFI7uy/ykORkge+pfD
	/CYuw9PsCvHKxsNdlOS0++dU37aHZFuFaPsRlvJXeeg==
X-Gm-Gg: AZuq6aIXb5MV1oE2g1Bluu9X7wpqCoTP/RlZ40IYWHG2cWO2K8kdTKILvHBZOdTD/wX
	L9Z/KwkBc+6Qrc/zkZjbbrkwVAqUFrY83jBp7s74Yp5rQ/8g1zcnowKCcWZQFTdYjQH9xP0hKVv
	PvP1kc66vGCu01viFoMOB6xpj7u014BqtOLXq6EvMHk2xvHMPog6Ng+vhY8aZlbWNwnzxYjRwTy
	CD0HVkEU0A8N5HoI7k+P5U28s0O+O3uoNpZ/9bV/EKdhkmolBhm6mYj+IolNt5z/NPJOxlFUJqE
	yIRQiKbjAlxCD6XstMWiLzOiaaZfUOLZWW0UN8YMlF54OR6FV0i2pMIharlyZHjETjpC+/Q3
X-Received: by 2002:a05:690e:400a:b0:649:422e:a68a with SMTP id
 956f58d0204a3-64c21b18c69mr9328991d50.57.1771368560092; Tue, 17 Feb 2026
 14:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
 <20260216-atlantis-clocks-v6-2-cb46d6a59c73@oss.tenstorrent.com> <015b88b520db434fca21e83958c68cf6308f0f79.camel@pengutronix.de>
In-Reply-To: <015b88b520db434fca21e83958c68cf6308f0f79.camel@pengutronix.de>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 17 Feb 2026 16:49:09 -0600
X-Gm-Features: AaiRm51UZzG8LJuJLKm629r92R1FdsrpU_nWD2avCGXRFaV4lXSvAPtvhubd62w
Message-ID: <CAEev2e-tHySkWQBE6qUNQq+zayc+P30DV0=0LJw09saSoh8fNA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] reset: tenstorrent: Add reset controller for Atlantis
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
	fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
	npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
	bmasney@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_144921_933140_2DB9C37D 
X-CRM114-Status: GOOD (  12.42  )
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

SGVsbyBQaGlsaXBwLAoKT24gVHVlLCBGZWIgMTcsIDIwMjYgYXQgNTo1OeKAr0FNIFBoaWxpcHAg
WmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gTW8sIDIwMjYtMDIt
MTYgYXQgMTY6MTYgLTA2MDAsIEFuaXJ1ZGggU3Jpbml2YXNhbiB3cm90ZToKPiA+IEFkZHMgQXRs
YW50aXMgUmVzZXQgQ29udHJvbGxlciBkcml2ZXIsIHdoaWNoIHNoYXJlcyB0aGUgc2FtZSByZWdt
YXAgYXMKPiA+IHByY20gKCBjbG9jayBjb250cm9sbGVyKS4KPiA+Cj4gPiBUaGlzIHZlcnNpb24g
b2YgdGhlIHJlc2V0IGNvbnRyb2xsZXIgZHJpdmVyIGNvdmVycyByZXNldHMgZnJvbSB0aGUgUkNQ
VQo+ID4gcHJjbS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmlydWRoIFNyaW5pdmFzYW4gPGFz
cmluaXZhc2FuQG9zcy50ZW5zdG9ycmVudC5jb20+Cj4KPiBSZXZpZXdlZC1ieTogUGhpbGlwcCBa
YWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPgo+IGFuZAo+Cj4gQWNrZWQtYnk6IFBoaWxp
cHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CgpZb3Ugc2VlbSB0byBoYXZlIGFkZGVk
IGEgUmIgYW5kIGFuIEFja2VkLUJ5LiBEaWQgeW91IGludGVuZCB0byBhZGQKYm90aCBvciBqdXN0
IGEgUmI/Cgo+Cj4gdG8gYmUgbWVyZ2VkIHZpYSB0aGUgY2xvY2sgdHJlZSwgc2luY2UgdGhpcyBk
ZXBlbmRzIG9uIHBhdGNoIDEuCgpXZSBoYXZlIGEgdGVuc3RvcnJlbnQgc29jIHRyZWUgbm93IGFu
ZCB3ZXJlIHRoaW5raW5nIG9mIHRha2luZyB0aGlzCnNlcmllcyBmb3IgNy4xIHZpYSB0aGF0LgoK
Pgo+IHJlZ2FyZHMKPiBQaGlsaXBwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
