Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E192C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 03:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=kBd6ouMuqdPoQt8VWmWsGYJDm5KC8nkAEd13MJUfX4M=; b=ZCAlSQPZ3Kjf+p059Ax/aP9OGD
	27oSnDZT5ZxWDFDO5ey2E7OlTj+UlymK6rIU7IunoaVzxnGcYuga6sec5awfnTFJzcii1AgzperiH
	So2NzaiehQbl2prkoCw70wtSsFSWCPImWH7xAkraXcSHXX/RfALtUgE1R6C96Qh5JsU+Tf+1EDyTY
	R4YXLJ/aZNmWkiWg+QahamIjrxk2Qq9TA+guWUNqy3au8rIcc5wlQMMOFzqrlpgMAWxe+UIt7g/hj
	Z3vAd/5v/KjmvtnofXCaQN3BwEzE8S+zTWtcqZjsfTMG9alfUr1poJiMpQY1v/kT0ARDvTzkEwTEp
	fihoKw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcHX6-00C7zw-1y;
	Wed, 15 Mar 2023 03:10:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcHX3-00C7yi-1v
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 03:10:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id i5so18662566pla.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678849828;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0o3VwfPR2cLzg5vBfLTssUbP9mVO5G8lO12zWDvqTuo=;
        b=3r2znFq8V0L0lb1M+m7WVJI+DvR0L4/m/vGI+lZX8crozrsY0hWt5jO/lS/Qs9lpuY
         XXzcDXbovaqXncE799EZQ59xDChUO5KyizsjFqItZG2oYoTb8ISTXnohIvCn8DRG8Jd4
         VKmNlbwQCezzynkCapPoE0Ax30F0XAqwbqYpZRuR+Dcildqcsc+vFU+DbVkXJSnJelU6
         A4GZWJmilLNUvReGszKrbjZHiIzfVK5BTtBj118yq9bFraVrhgjMVpdEU9raoWqxrLyF
         wn8Nk8tSdyMGzzn0mm4C6Rqz+z/MaTB0692ojrG2WNeLW8KyJDO+iHbpI3uYRAsdoCMJ
         b8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678849828;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0o3VwfPR2cLzg5vBfLTssUbP9mVO5G8lO12zWDvqTuo=;
        b=OyeqEGTxwGgVe+5vxeRVNcFL25v77XRiD5H7bZk4M5y07eIXEqbUXRJRpbzwTRJOiJ
         47SuCbiZM6Vk9JQhN3QmiayG4JiInq9jV6nHtRK954QP2IMkpZkuvOnCxF1c3xazZ+EF
         1U9D9LVUf/iFKbawWSlNebAi/ZXmGSX/JC3WzM6YH1MAYJxNBbqvP0O8XRxN8s49eQRt
         EKoEzUUU0K0S4QqFqPMZb+mJzC2tmiKumrgeW5vWbZ1gH9X9AvNV40zDnQKwRIJt/14B
         w9Dwf60tJORMQ9dleQrppjE88Zb/fcjeGBmBmVfIMdvVnmQIyM0wjtTnQhnETRXz7XXK
         FFkQ==
X-Gm-Message-State: AO0yUKUEstw0iLWP9zfSSvXHj/8Iw6ydWh8jCD/EA9NwsMEKM1j30uJG
	zJ7v7ZKLMOsutQluPhPREV6aFQ==
X-Google-Smtp-Source: AK7set9o/IdveqFEi+34PRXS3foRlDleO+WT9363xelftZvGpD139okSvfBC74nLf1bpP4TAr2O1nA==
X-Received: by 2002:a17:902:cad5:b0:19f:1f0a:97f1 with SMTP id y21-20020a170902cad500b0019f1f0a97f1mr919209pld.30.1678849828320;
        Tue, 14 Mar 2023 20:10:28 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902820900b001a0448731c2sm2452709pln.47.2023.03.14.20.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:10:27 -0700 (PDT)
Date: Tue, 14 Mar 2023 20:10:27 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Mar 2023 20:09:07 PDT (-0700)
Subject: Re: [PATCH 1/3] kernel/reboot: Use the static sys-off handler for any priority
In-Reply-To: <0a8358cd-4c2e-ed70-2cc5-1cff27b7594d@collabora.com>
CC: samuel@sholland.org, rafael.j.wysocki@intel.com, aou@eecs.berkeley.edu,
  apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>, geert@linux-m68k.org, heiko@sntech.de,
  kai.heng.feng@canonical.com, mcgrof@kernel.org, paulmck@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, pmladek@suse.com, yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, tangmeng@uniontech.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dmitry.osipenko@collabora.com, linux-pm@vger.kernel.org, rafael@kernel.org
Message-ID: <mhng-480cc68b-261d-4ef2-a67a-205a154c3895@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_201029_800655_BD0591D4 
X-CRM114-Status: GOOD (  17.73  )
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

T24gU2F0LCAxOCBGZWIgMjAyMyAxNTozMjowNiBQU1QgKC0wODAwKSwgZG1pdHJ5Lm9zaXBlbmtv
QGNvbGxhYm9yYS5jb20gd3JvdGU6Cj4gT24gMi8xOS8yMyAwMjoyMCwgU2FtdWVsIEhvbGxhbmQg
d3JvdGU6Cj4+IE9uIDIvMTQvMjMgMTg6MTcsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IC4uLgo+
Pj4gU29ycnkgZm9yIGJlaW5nIHNsb3cgaGVyZSwgSSdkIGJlZW4gYXNzdW1pbmcgc29tZW9uZSB3
b3VsZCBBY2sgdGhpcyBidXQKPj4+IGl0IGxvb2tzIGxpa2UgbWF5YmUgdGhlcmUncyBub2JvZHkg
aW4gdGhlIG1haW50YWluZXJzIGZpbGUgZm9yCj4+PiBrZXJuZWwvcmVib290LmM/wqAgSSdtIGZp
bmUgdGFraW5nIHRoaXMgdmlhIHRoZSBSSVNDLVYgdHJlZSBpZiB0aGF0J3MgT0sKPj4+IHdpdGgg
cGVvcGxlLCBidXQgdGhlIGNvdmVyIGxldHRlciBzdWdnZXN0cyB0aGUgcGF0Y2ggaXMgbmVjZXNz
YXJ5IGZvcgo+Pj4gbXVsdGlwbGUgcGF0Y2ggc2V0cy4KPj4KPj4gU2VlIGFsc28gRG1pdHJ5J3Mg
cmVwbHlbMF0gdG8gdGhlIFBTQ0kgdGhyZWFkLiAoTWF5YmUgSSBzaG91bGQgaGF2ZSBzZW50Cj4+
IGJvdGggY29udmVyc2lvbnMgYXMgb25lIHNlcmllcz8pCj4+Cj4+IEkgYW0gaGFwcHkgd2l0aCB0
aGUgcGF0Y2hlcyBnb2luZyB0aHJvdWdoIGFueSB0cmVlLiBUaGUga2VybmVsL3JlYm9vdC5jCj4+
IHBhdGNoIGlzIGV4YWN0bHkgdGhlIHNhbWUgYmV0d2VlbiB0aGUgdHdvIHNlcmllcywgc28gaXQg
c2hvdWxkIG5vdCBodXJ0Cj4+IGlmIGl0IGdldHMgbWVyZ2VkIHR3aWNlLiBUaG91Z2ggaWYgeW91
IHRha2UgdGhpcyBzZXJpZXMgdGhyb3VnaCB0aGUKPj4gUklTQy1WIHRyZWUsIG1heWJlIHlvdSB3
YW50IHRvIGNyZWF0ZSBhIHRhZyBmb3IgaXQ/Cj4+Cj4+IEkgYW0gbm90IHN1cmUgZXhhY3RseSB3
aGF0IG5lZWRzIHRvIGJlIGRvbmUgaGVyZTsgSSBhbSBoYXBweSB0byBkbwo+PiBhbnl0aGluZyB0
aGF0IHdvdWxkIGFzc2lzdCBnZXR0aW5nIGJvdGggc2VyaWVzIG1lcmdlZCBmb3IgdjYuMywgdG8g
YXZvaWQKPj4gYSByZWdyZXNzaW9uIHdpdGggYXhwMjB4WzFdLgo+Pgo+PiBSZWdhcmRzLAo+PiBT
YW11ZWwKPj4KPj4gWzBdOgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzBhMTgwODQ5
LWJhMWItMmE4Mi1hYjA2LWVkMWI4MTU1ZDVjYUBjb2xsYWJvcmEuY29tLwo+PiBbMV06Cj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvZTM4ZDI5ZjUtY2QzYy00YTJiLWIzNTUtMmJjZmFk
MDBhMjRiQHNob2xsYW5kLm9yZy8KPgo+IFRoZSByZWJvb3QuYyBjaGFuZ2VzIHNob3VsZCBiZSBh
Y2tlZC9hcHBsaWVkIGJ5IFJhZmFlbC4KPiBJIG5vdGljZWQgdGhhdCB5b3UgaGF2ZW4ndCBDQydk
IHRoZSBsaW51eC1wbSBNTCwgbWF5YmUgdGhhdCdzIHdoeSBpdAo+IGhhc24ndCBnb3QgdGhlIGF0
dGVudGlvbi4KCk9LLCBJJ20gYWRkaW5nIHRoZW0gaGVyZS4gIE5vdCBzdXJlIGlmIHdlJ3JlIG1l
bnQgdG8gcmUtc2VuZCBpdCB0byB0aGUgCmxpc3QsIG5vIHJ1c2ggb24gbXkgZW5kIEknbSBqdXN0
IHNjcnViYmluZyB0aHJvdWdoIHNvbWUgb2xkIHN0dWZmIG9uIApwYXRjaHdvcmsgYWdhaW4uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
