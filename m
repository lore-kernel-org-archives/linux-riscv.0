Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820A9C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 10:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lz6YHx/hYd1vgiiJOcwGlWn73gz76M4ttKNNh16J7wg=; b=yEdYDpzyGwf5LK
	cwN/BQ2Gy8kYo0ERqv5Kqaa8rszGZlTIlMHl39T3FBWPU8OakUNuBZ5IxXr9kRP7ZxH609QEpGVxI
	TMhnHbPTdI7GFE9KZ97uZ6QU4Mq4VByYRX3i5acN+C5hPtaDP1rddRL/z1ow8G1LgZZsoeWL56C2l
	u2BwDaLprV6xtyPoK6jJWAfu4IWvTIioSFF1jTsfg1KOdIWXIgQpxcJL/Elp/296J8qtdkqFKG6+c
	FssN7pHnWdEd1yMHK0hsgfacv9+p28hu1l8o6IJM1FO0YsIWcgyWtB2+/mQR0GsVoS1r2Y3/G7XSV
	wPkrlwqTMQ5t5W8wPt4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQZQ-00000008QIM-1lQd;
	Wed, 27 Mar 2024 10:31:48 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQZM-00000008QEk-2mO5
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 10:31:46 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a4a393b699fso115764666b.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1711535493; x=1712140293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KabXKG7QzV07xEnqAZlFM9GzBMwE9AX8NiZo1iI6OCQ=;
        b=PbQwDDcuXZ8aCz3MkEcxITZyPCAoSXpZqA/of+eG5lMKb5AlBqr2DKyfJJ6NXkh+QO
         oi7OR6HQJMml+kofYp2J7h6Qv9GdezWYkM4hSXMP55KJK0odZxN3x92UTshmpDXD1TDV
         B48joVa7GQd1vQS/W7BugnrF/JgML0y5RDpNX2qPTe/eRO4/g0v8P8eOmbAqIqH+Y46C
         CTynzchN3HESjGCfHzqmI7hAXGd8a+tGdcUTFLSHb23zIJx7U9P44dgcvX0xQm1AQ8eW
         GkWztuWQrifhcromqhFPz3YA/8K4Ecp03bnf04uimJFVhPf5HjHO7U8E3rbTkdGZpVse
         gkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711535493; x=1712140293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KabXKG7QzV07xEnqAZlFM9GzBMwE9AX8NiZo1iI6OCQ=;
        b=Mndftijp/ihvQfPDgltOHALBgYjljLai4JjDaPjox2m24R88/rKmKakLddg07lTrMY
         IyEzFZJdEygCWm9eT9xHTODKaF4KhDJ1jZK6HUqE12VxS6xNJauFqJuXSRbcV3ttOzOy
         HuYlUw7YgKdUNPMX37wKRtLmdnqgwt4ZW/CSUlz5yleLNY1m3mSRhE86GPc3eYSxtOfs
         ZbzIUAkyYGN3xkzplvhTk0G6yN/czhXi4SZu5/8y6mX8d3FXFFV4otmsDO/9NX02321K
         YgxPedQkK+MTNjmk3YZrCfOzdWi33aw8ltsaoKjY+6VoSwGXAExCgsgo/bYgrNP9KWZf
         oSuw==
X-Gm-Message-State: AOJu0Yz8m9cioVp7xPjj6pp9DOwqrygp7GHwsG3SIqxqkSHjMI05i27c
	fENG5NR1hgsh0Zz+6liqqZHjxLaExCAHOjMcBYhRRVsbho+3SZrnNLwK+fUnwlllbc0lWlGivoU
	uKcY=
X-Google-Smtp-Source: AGHT+IF70lDcd+7mVT/V5sDOo51cv+JWRqcD4/cE8DYPzR0glhB/3uBYMYV3tk23Xj1H5yHPw4Xtaw==
X-Received: by 2002:a17:907:31cd:b0:a45:f9c5:3024 with SMTP id xf13-20020a17090731cd00b00a45f9c53024mr4156607ejb.11.1711535493584;
        Wed, 27 Mar 2024 03:31:33 -0700 (PDT)
Received: from antares.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id z15-20020a170906270f00b00a46b8cd9b51sm5294078ejc.185.2024.03.27.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 03:31:32 -0700 (PDT)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Cooper Qu <cooper.qu@linux.alibaba.com>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
	Huang Tao <eric.huang@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH 0/2] RISC-V: Test th.mxstatus.MAEE bit before enabling MAEE
Date: Wed, 27 Mar 2024 11:31:28 +0100
Message-ID: <20240327103130.3651950-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_033144_776168_5D06CB8B 
X-CRM114-Status: GOOD (  10.39  )
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

Q3VycmVudGx5LCB0aGUgTGludXgga2VybmVsIHN1ZmZlcnMgZnJvbSBhIGJvb3QgcmVncmVzc2lv
biB3aGVuIHJ1bm5pbmcKb24gdGhlIGM5MDYgUUVNVSBlbXVsYXRpb24uIERldGFpbHMgaGF2ZSBi
ZWVuIHJlcG9ydGVkIGhlcmUgYnkgQmrDtnJuIFTDtnBlbDoKICBodHRwczovL2xpc3RzLmdudS5v
cmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyNC0wMS9tc2cwNDc2Ni5odG1sCgpUaGUgbWFp
biBpc3N1ZSBpcywgdGhhdCBMaW51eCBlbmFibGVzIE1BRUUgZm9yIENQVXMgdGhhdCBoYXZlIGEg
VC1IZWFkCm12ZW5kb3JpZCBidXQgUUVNVSBtYWludGFpbmVycyBkb24ndCB3YW50IHRvIGVtdWxh
dGUgYSBDUFUgdGhhdCB1c2VzCnJlc2VydmVkIGJpdHMgaW4gUFRFcy4gU2VlIGFsc28gdGhlIGZv
bGxvd2luZyBkaXNjdXNzaW9uIGZvciBtb3JlCmNvbnRleHQ6CiAgaHR0cHM6Ly9saXN0cy5nbnUu
b3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjQtMDIvbXNnMDA3NzUuaHRtbAoKVGhpcyBz
ZXJpZXMgcmVuYW1lcyAiVC1IZWFkIFBCTVQiIHRvICJNQUVFIiBhbmQgb25seSBlbmFibGVzIGl0
IGlmCnRoZSB0aC5teHN0YXR1cy5NQUVFIGJpdCBpcyBzZXQuCgpTaW5jZSB0aC5teHN0YXR1cyBp
cyBvbmx5IGFjY2Vzc2libGUgaW4gTS1tb2RlLCB0aGlzIHBhdGNoIGRlcGVuZHMgb24KdGhlIGZv
bGxvd2luZyBPcGVuU0JJIHNlcmllczoKICBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBl
cm1haWwvb3BlbnNiaS8yMDI0LU1hcmNoLzAwNjcxOC5odG1sCgpUaGUgdGgubXhzdGF0dXMgQ1NS
IGlzIGRvY3VtZW50ZWQgaGVyZToKICBodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvdGhl
YWQtZXh0ZW5zaW9uLXNwZWMvcHVsbC80NQoKVGhlIFFFTVUgcGF0Y2ggdG8gZW11bGF0ZSB0aC5t
eHN0YXR1cyB3aXRoIE1BRUUgbm90IHNldCBpcyBoZXJlOgogIGh0dHBzOi8vbGlzdHMuZ251Lm9y
Zy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDI0LTAzL21zZzA2MzY4Lmh0bWwKCkFmdGVyIGFw
cGx5aW5nIGFsbCByZWZlcmVuY2VkIHBhdGNoc2V0cywgdGhpcyBwYXRjaHNldCBhbGxvd3MgdG8K
c3VjY2Vzc2Z1bGx5IGJvb3QgYSBDOTA2IFFFTVUgc3lzdGVtIGVtdWxhdGlvbiAoIi1jcHUgdGhl
YWQtYzkwNiIpLgoKQ2hyaXN0b3BoIE3DvGxsbmVyICgyKToKICByaXNjdjogdGhlYWQ6IFJlbmFt
ZSBULUhlYWQgUEJNVCB0byBNQUVFCiAgcmlzY3Y6IFQtSGVhZDogVGVzdCBhdmFpbGFiaWxpdHkg
Yml0IGJlZm9yZSBlbmFibGluZyBNQUVFIGVycmF0YQoKIGFyY2gvcmlzY3YvS2NvbmZpZy5lcnJh
dGEgICAgICAgICAgICB8ICA4ICsrKystLS0tCiBhcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJh
dGEuYyAgICAgfCAyMiArKysrKysrKysrKysrKy0tLS0tLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2VycmF0YV9saXN0LmggfCAyMCArKysrKysrKysrLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFu
Z2VkLCAyOCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCi0tIAoyLjQ0LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
