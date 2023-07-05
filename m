Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1038C001DB
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 23:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Sper0qNSWmwuap7+ONTu2QKt8ccUAblYB9RHi/b+sw=; b=2K8HRsegBKirAP
	ejqiDYCntjHu4GP8vmBOJPKsacSl0lh1q1ptlxdC70n+WlF7cGcAwbPYVrRhJjYDahRlN4Os/F27Z
	cezBiomEu05rM/Bfo3lIYiNEccKmu106LH1PVVOMq2lhyrCJnsPJ0hG6VX3UZTx797IM8u/BaWdwF
	5Yvtvan/HmZhis5HwC9ySmfF9Z2yn6YntoiOp/5/PbVqV1dNEf6LvsTWo1pxha6991OtfXG+0c1kx
	INwkdqvi2pGpYyJLIQ3lwOhi9GoHPu+IxBkgXTiPhtkn8Q01ZtEwousJ8x4iqFK6h0qRGZ3vpFQHx
	buQDkgm8pvJ/T4J54ADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHC73-00HN6L-2e;
	Wed, 05 Jul 2023 23:40:45 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHC6y-00HN3m-2X
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 23:40:42 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-55ae51a45deso79225a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 16:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688600439; x=1691192439;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heq1Q1+wvbmb5OAij38OsJQX4YW0Eh3uUJoVnnFKKL0=;
        b=w7ObabrxLzWbFZucsKbXsxG872nezRh31k9tgMIKAmOV1ZnhQy797FIaBqEHUd/S6u
         yqa3PCq34Th7JgfLwyPgxW6/xSPozlZhDK9/i8xmrzHgPtPK/vtnx1ChdB+67VPUR7Hi
         9p3D08Y1dTf2Ur/iw1NhgTL8dzYd7W4De9TKoknq64Q2N+iH81rDvYSReXlWVF+nzBb1
         kzh8UeQbi+057HGg7/4ohJitSPFwglsZBDO9Rd69vvR/Cp54estk3Q7fTzTHUjKvA775
         +EPtZ/X6mQ2sET5RP60mdz/BLaIY0qRd67Y+3nMNjSJbFl6e8wtsK28/2QfZyJ+NtB38
         gWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688600439; x=1691192439;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=heq1Q1+wvbmb5OAij38OsJQX4YW0Eh3uUJoVnnFKKL0=;
        b=k6uXTEAYE8vw/aiUwDdCay8Q9rK9sTVdZXl08oawwu+Am8Hvrjuj7RRDV5C26nUgJ1
         lWZK9lhV4nHYMbWnvZrtO1wo6/lQ0a8OZVrvpLMbjHskTgS/Z2pV5fy3QrcbmE5L+fYp
         7G7JBDAieY1bIMIGGgGlVw2kh96qEBcBJK5pchCJIYK8oNDF+0rNWskY8nl4pNSpDFAn
         FqshdX+sPH6E7suRkNe2VFqLafrBiWhmpLmDwD75ReLVAUvD4IIGh9cnDNnvZDpgTw+u
         iVXsRYkEnBZh2eT72GWDGMFWhPEWdFyLBvhTnIS5HYLh6WraZglnfZB32Z75amjhlGRY
         Tkww==
X-Gm-Message-State: ABy/qLZkwjV16y0B7xemkLWdONbofY6DkNmczCm1wdSym1lI8fJBmkYE
	Xw/C3etLyXoTaAVUwubMjXMayQ==
X-Google-Smtp-Source: APBJJlHrF+ReT3bql2iEnECkOOHScprHU4DO/XyssfWMSQft03OZhJD+Z19gAWqG11ZIacyCwW68qA==
X-Received: by 2002:a05:6a21:9983:b0:12d:cf28:3bc7 with SMTP id ve3-20020a056a21998300b0012dcf283bc7mr280116pzb.11.1688600439500;
        Wed, 05 Jul 2023 16:40:39 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b001ac2be26340sm25658plp.222.2023.07.05.16.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 16:40:38 -0700 (PDT)
In-Reply-To: <20230629142228.1125715-1-bjorn@kernel.org>
References: <20230629142228.1125715-1-bjorn@kernel.org>
Subject: Re: [PATCH v4] riscv: Discard vector state on syscalls
Message-Id: <168860030759.22647.12460788590492187878.b4-ty@rivosinc.com>
Date: Wed, 05 Jul 2023 16:38:27 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: =C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org,
  linux@rivosinc.com, C3=A9mi_Denis-Courmont?= <remi@remlab.net>, Darius Rad <darius@bluespec.com>,
  Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Andy Chiu <andy.chiu@sifive.com>,
  =C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_164040_823048_5DBE411C 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
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

Ck9uIFRodSwgMjkgSnVuIDIwMjMgMTY6MjI6MjggKzAyMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6
Cj4gVGhlIFJJU0MtViB2ZWN0b3Igc3BlY2lmaWNhdGlvbiBzdGF0ZXM6Cj4gICBFeGVjdXRpbmcg
YSBzeXN0ZW0gY2FsbCBjYXVzZXMgYWxsIGNhbGxlci1zYXZlZCB2ZWN0b3IgcmVnaXN0ZXJzCj4g
ICAodjAtdjMxLCB2bCwgdnR5cGUpIGFuZCB2c3RhcnQgdG8gYmVjb21lIHVuc3BlY2lmaWVkLgo+
IAo+IFRoZSB2ZWN0b3IgcmVnaXN0ZXJzIGFyZSBzZXQgdG8gYWxsIDFzLCB2aWxsIGlzIHNldCAo
aW52YWxpZCksIGFuZCB0aGUKPiB2ZWN0b3Igc3RhdHVzIGlzIHNldCB0byBEaXJ0eS4KPiAKPiBb
Li4uXQoKQXBwbGllZCwgdGhhbmtzIQoKWzEvMV0gcmlzY3Y6IERpc2NhcmQgdmVjdG9yIHN0YXRl
IG9uIHN5c2NhbGxzCiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcGFsbWVyL2MvOTY1N2U5
YjdkMjUzCgpCZXN0IHJlZ2FyZHMsCi0tIApQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
