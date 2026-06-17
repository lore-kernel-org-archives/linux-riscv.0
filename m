Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D76CD98E2
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 14:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B604eeuO4UzWX2ZCQ+SioJ6uQLDPHR1IkPw++7yQby4=; b=xcsoQm5jBJg4GL
	GKUm1rHbwwZuLuO6fKqHmQA6Mr7zRezFjlRSpE4mSDOgWyML4xat87Ym7ebVB+rDk64LWDfcq6jys
	ZZq17sSLn8ph7e9HSx77HVyJa57u9DFvEgLTfdAaV5uUfaJRo63yr9B7E5cRh5YxZP/sZU8ljDrIw
	nByJc/Gobaquho/Pj2RY1CVM8oCfPUzA26VsUNRr06fqwDWlRChqvcntKJkD3kdFB3/JNZhUVPI+1
	SVanr5hCGNSAm0CO7dpEv5Yk8dLzJ+p7v5kTuceAv+dnvfpkku/1ffKFOExE1BFcOYI08y6a/lwO/
	D+kNyeOFpKnE4pa46bZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZr9h-0000000HTah-1pP1;
	Wed, 17 Jun 2026 14:22:13 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZr9e-0000000HTaH-3sGw
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 14:22:12 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-7ff05e5d009so5974997b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 07:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781706129; cv=none;
        d=google.com; s=arc-20240605;
        b=KrcOuDnFM3D1n3iIYD+tvFzi+ImgPucMAkQJmf4GzEk2geBkmMacgBAU+MxBi5zmhS
         Kb4dwWXnPqg6YF89NHVr8cBRrK4wvTXKPPlAHnqu9Yqr6r0MvfaKNT5DYDig3SKCwjpn
         viTz623KVOYqgd0vMhmkYiV2kqmEjgN7F7Sg+F8wQeU1iYah3A5oNM44ccXA6n+XWELR
         dD73SIZIXf6/Tpc6Tx8Of9NeHUlaVKxSy+Igce5tQjN1Siq3uKfOJiy6NRy69v9cKfa4
         XRLxo5a7uHuJeLR9Qq6nfo3x38t93gDuBUwiUUJpR0cnmy98Yo77Zfx+nKYJSJah640Z
         N37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QzYLQ7HqiaX0GiEykQq31fDh8mlyUNa4TQ0GCxgeMo0=;
        fh=nqLpvr9U76IDwkrv+vDS9qFWBEsBLKz0HoHJMTfhpS0=;
        b=aM8B13bTL1iBW4brv6UCeYqDsX5b5qGeYfeUyqI2AlCR2m6tB9fONhsabOntWVLdKh
         t++j0hIv9Jl2y9YDl1sXyaDvjIaMhOJjyr6WsNhjexaBVcad83QWL/R/MjowoDbx71c0
         FVKamYfVsSXql7wZKphdMkd9Y+swMfjlcy8r9MWeWBQJvGZ6Bw47co/gamqh2EL+15TS
         9sXkxE0OS9AsocMNeykG1lsmB84eVMHDQ+nLzQxcHM4v6rXK44dc+JDWzXVmD10RUwpf
         qNGPcaj+Dh0wx3WWX/tLaxvIFFXNv0F7D64VSmNfGn/vQzoSlcdmlMElGclVU9BlRdn3
         yZsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1781706129; x=1782310929; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzYLQ7HqiaX0GiEykQq31fDh8mlyUNa4TQ0GCxgeMo0=;
        b=e59bu2GYLwI5kEnNJOKa6Wqh4pzOI014S36omjZSlQB3WLBili6l3pCExEU+W53WuD
         yoOM2ga6GDvwE6Jw2nMiwhUTM2dsnGx2i+xN7Ud6U1/oA+7fwrVIZZLSe3sEV9++WGVg
         cdv9hvVq2zuxuHXabYIZUYHjEPjGjMlt06Dde+nQowr1sN1M/KowXA+JgknMlFpE3f57
         6BWvDU3ZGR5dAOpKZ3IhsosFMt0L23TmZZnL6G4A8S2zf/IFE9cY3/IIIh3HWaUhivl/
         xQEaS6MuqKV/eUzAJoNpM3K6sZ0TYKPYWKT7XJzWhZXXs0rcqC0GWwAPopjwU9LfNOxo
         4m6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781706129; x=1782310929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QzYLQ7HqiaX0GiEykQq31fDh8mlyUNa4TQ0GCxgeMo0=;
        b=NBTxs7c7y/v+Em51CLyCKNdsNmQtHGeVizx+tez+nav37RygmwrwkIBA7LUhn26Okz
         uEkjF4F9EKF/zRLo3J79Lou4rXYh5Ht8jJgz4CGkql5uNWMijGzP7zQwv4DoP2BVKJK2
         /6TgxX/rQYkvZ6+AnrNAYcEF5TAuICeIXDOvwDOvpzY5tIut9tzbJzpxBtVT+tkNTRi5
         n86qDsRzlnOo+gBgYFygjLp/I5ekTUdttSmm4VYW1Srq8uxeWdvmJpH9KmXw3kQVG1R/
         loLHpsVG2znn9X8JbDOo5eU0+Z3Gnt094V5EA6iItoup8qxNu3mdJ4oK6RcqdYGBUyJE
         WZng==
X-Forwarded-Encrypted: i=1; AFNElJ+6X+cj203qa4Zt5GrPC5O658sbio+o8s6EeE7jidsZ47mekOy9Sd25iurG6xxvKl7KnRnQf4kkt7Cdlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaR0x6FzgZLc943lCI8W9Z6hzJI5UHeCh+wAcL903sPWW6ovW3
	f7ckfZwz9aQImE+IozMYActMgaT0L5urQkb+xO+ZS2vw0XcZFDlueuoCROV1UM0K7X0AImbn8Am
	m/c5fLo8dvHsKIvoLQlRMhQXVM7yu4JvsqKSsZQosBw==
X-Gm-Gg: AfdE7ck/pxkace3XdHvlg3jz0+pvQbKKzVOVBG77YfSuBAtnwzirPMluu86MhEVSyaK
	zNEgiucI6gZAOUj5EaFnN7hS4dJJ1ZvuOSx8kbSqMGA4hihwgQs2OP3Ca8d7rTQxd6xsid5/nF5
	e36bE5gQ+ajrk9fkaKQhZGpFafuBUBy8EEBizgZdr0W39hp+AxhPtKkJfZy0MbuD0LBsO3nF+Dl
	qWvoHKjreVFxbl0NdF1PPuLaIm4yEVcf4kpTYtaZe+L9l4dGzCfukpNKRbEKWQEhUj80+erfHb8
	2YzwhYouNLH3yB/xtDz7BBxebNk=
X-Received: by 2002:a05:690c:c14:b0:7fd:fba1:154d with SMTP id
 00721157ae682-7fe5d7a4538mr38569997b3.30.1781706128598; Wed, 17 Jun 2026
 07:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1781666867.git.namcao@linutronix.de>
In-Reply-To: <cover.1781666867.git.namcao@linutronix.de>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 17 Jun 2026 09:21:57 -0500
X-Gm-Features: AVVi8CeM-pPW6pZyxcA8M4HMXKgTkPfe4iRVn5fZ2l5s0n1cm-QOviV81APesqw
Message-ID: <CAEev2e_nUHUvjfnn9fOe9b3t-tb3F9AYETh-LWfqx=ovf8TLPQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: unaligned: stop using kthread for vector speed probe
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Jingwei Wang <wangjingwei@iscas.ac.cn>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_072211_098558_F23AD7E9 
X-CRM114-Status: GOOD (  15.86  )
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

SGksCgpPbiBUdWUsIEp1biAxNiwgMjAyNiBhdCAxMDozOOKAr1BNIE5hbSBDYW8gPG5hbWNhb0Bs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IEhpLAo+Cj4gVGhpcyBzZXJpZXMgaXMgZm9sbG93LXVw
IHRvIHRoZSBkaXNjdXNzaW9uIGF0Ogo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzIwMjYwNjEyLXZlY191bmFsaWduZWRfZHJvcF9pbml0LXYxLTEtZGY5NjkyMTBhZTM0QG9z
cy50ZW5zdG9ycmVudC5jb20vCj4KPiBJdCByZW1vdmVzIHRoZSBrdGhyZWFkIHVzYWdlIGZvciB1
bmFsaWduZWQgdmVjdG9yIGFjY2VzcyBzcGVlZCBwcm9iZSwgYXZvaWRpbmcKPiBhIGJ1ZyB0aGF0
IHRoZSBrdGhyZWFkIG1heSBzdGlsbCBiZSBleGN1dGluZyBhIF9faW5pdCBmdW5jdGlvbiB0aGF0
IGhhdmUKPiBhbHJlYWR5IGJlZW4gZnJlZWQuCj4KPiBJdCBhbHNvIGFsbG93cyByZW1vdmluZyBz
b21lIHZkc28gc3luY2hyb25pemF0aW9uLCBzaW1wbGlmeSB0aGUgY29kZS4KPgo+IFRoaXMga3Ro
cmVhZCBoYXMgYmVlbiBib3RoZXJpbmcgbWUgZm9yIGEgd2hpbGUgbm93LCBhbmQgdGhlIHJlY2Vu
dCBidWcgcmVwb3J0Cj4gcHVzaGVkIG1lIHRvIHBvc3QgdGhpcyBzZXJpZXMuCj4KPiBOYW0gQ2Fv
ICgyKToKPiAgIHJpc2N2OiB1bmFsaWduZWQ6IHN0b3AgdXNpbmcga3RocmVhZCBmb3IKPiAgICAg
Y2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3MoKQo+ICAgUmV2ZXJ0ICJyaXNjdjogaHdwcm9i
ZTogRml4IHN0YWxlIHZEU08gZGF0YSBmb3IgbGF0ZS1pbml0aWFsaXplZCBrZXlzCj4gICAgIGF0
IGJvb3QiCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmggICAgICAgICAgIHwg
IDcgLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9hcmNoX2RhdGEuaCAgICB8ICA2
IC0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgICAgICB8IDcwICsr
KystLS0tLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vz
c19zcGVlZC5jIHwgMTkgKy0tLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vaHdwcm9iZS5j
ICAgICAgICAgICB8ICAyICstCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
ODkgZGVsZXRpb25zKC0pCgpUZXN0ZWQgb24gVGVuc3RvcnJlbnQgQmxhY2tob2xlIHdpdGggU2lm
aXZlIHgyODAgY29yZXMuIFNsb3dpbmcgZG93bgp0aGUgdW5hbGlnbmVkIHZlY3RvciBhY2Nlc3Mg
c3BlZWQgcHJvYmUgZG9lc24ndCBjYXVzZSBib290IHRvIGZhaWwKbm93LgoKVGVzdGVkLWJ5OiBB
bmlydWRoIFNyaW5pdmFzYW4gPGFzcmluaXZhc2FuQG9zcy50ZW5zdG9ycmVudC5jb20+Cgo+IC0t
Cj4gMi40Ny4zCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
