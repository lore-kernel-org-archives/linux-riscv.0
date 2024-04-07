Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F1ACD128A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 21:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=53Id5VT5KPq7EsgKXp198CqKmevSfm9yJQJjKD0zghw=; b=y2Ua1LWCiUWthD
	6FsvTli74S7F1Q8StdOE/DT7ld/reZfKxZ8BMAsNqFQ6LnWLrO4Mbwqv+3tZ4J442Z01SOhPhLDld
	IeFKMdqyoV4458L7POCOb2Aljhsnlyn1d0oM+weqmCssMYQyuEaOqUeMSJUOBxZ7gM/mIW1ZNZdjx
	uZtFXFVQGu0GKTsLFu8et5+47TivmWB77qG1QcEiPoGo3iuGZB2Tj5YqYrfCFVN2DCPBO7otgT23H
	Ta3p44uZiPHxzVXwDOmuzEjsjP4qYFCTbHjABuQlGE3wvXl7o/g962y8tkjH6iir0gbCm0pIR9xTD
	xX4+nTRHjU4Xh0wjcKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rta86-0000000DYYy-0p1d;
	Sun, 07 Apr 2024 21:32:46 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rta82-0000000DYY0-40e2
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 21:32:44 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-56e449187fcso1284009a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 07 Apr 2024 14:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1712525560; x=1713130360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a+DOPqB+KLlf2OTXo3h+6/GJSa1MbFuatLtGIKQirtk=;
        b=EtUGjNlzF/8lZOj16Pkqdn81QzdIDo9LKhxbCx7inOyv1CZjsS5VK0l2R54hbrYpWe
         IK3Qz48PkXpw1FxTCeKES/7h9vYk8GeqretatwhWlhwt+YHZ3tRwRgAXoz1FFUrvU/DE
         5yhlxOF519LUnAzYg6W9VgZ0D5pMEaxE7BcskpLfap/eu5tpeBpEVwgY1ovjieFM7cdv
         1Ko8e64r/jBUutIXnL/j+FWNSgbqAAGFNhs6ZRRZS54aiVodo5nCTxZydmkRDHCRCz2Z
         RR27d7cZOF91g46LTRR8Sc3B70iG9TNhANl9r3g3Gbk+qEdaz/KDu/SUEUcPqour6d8X
         yMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712525560; x=1713130360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+DOPqB+KLlf2OTXo3h+6/GJSa1MbFuatLtGIKQirtk=;
        b=ZPnsEHlz/q4bx83naTpRnOs28EBs789M48TsaSdzCmdkrxOgwUQ0Yn/j5e0Wox9wTb
         WqfeGHZkz+w/DJE0tGpyfUrffIh5dnawlrjRCV/QCmb1s4sys8MX6H1DYJ8y7+XeOAsn
         wErQTkGEvc1bG2FPo9zo2bk6GRzaU9RrcNLupMQACWcOiXcjDIvhtCFvOi7NkW8Z9eKu
         gCC2F+ZFQC+sDDYyIBtiFXSZZuCpUIFD7Xc2SAev3YYqH1iQBq1dBSDRUEx399DhEU4g
         ULDIvyas9odioDXNJ1x/5XoU3K1MnUlbG88oWNZ6w9c0Cak5zt5UYETxiQodpen8PGDm
         vTPg==
X-Gm-Message-State: AOJu0YwHrW1I1x+DVHU1i2t4F03ShPOduyqSGvU6TjvCPcDpIR+Etg3n
	+Y9qQtUprEQrt0btiuG8VGe6q7W923y7LnB5bAovLUOeyonCGbAZoIeuosBjJQXgzeqTGFffVk/
	PPXQ=
X-Google-Smtp-Source: AGHT+IFu8nywPo6SltvVHHM6OeIZviiVKvv1KckE1rqsAWhmLSADm7+GxdfQbJAflNLCBpcMCE2IEg==
X-Received: by 2002:a50:a6da:0:b0:56e:2e94:2964 with SMTP id f26-20020a50a6da000000b0056e2e942964mr4529195edc.15.1712525559515;
        Sun, 07 Apr 2024 14:32:39 -0700 (PDT)
Received: from antares.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id i2-20020a50fc02000000b0056e22be831dsm3267562edr.42.2024.04.07.14.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 14:32:39 -0700 (PDT)
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
	Conor Dooley <conor@kernel.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v3 0/2] RISC-V: Test th.sxstatus.MAEE bit before enabling MAEE
Date: Sun,  7 Apr 2024 23:32:34 +0200
Message-ID: <20240407213236.2121592-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_143243_151391_C68FC875 
X-CRM114-Status: GOOD (  10.05  )
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
biBpc3N1ZSBpcywgdGhhdCBMaW51eCBlbmFibGVzIFhUaGVhZE1hZSBmb3IgQ1BVcyB0aGF0IGhh
dmUgYSBULUhlYWQKbXZlbmRvcmlkIGJ1dCBRRU1VIG1haW50YWluZXJzIGRvbid0IHdhbnQgdG8g
ZW11bGF0ZSBhIENQVSB0aGF0IHVzZXMKcmVzZXJ2ZWQgYml0cyBpbiBQVEVzLiBTZWUgYWxzbyB0
aGUgZm9sbG93aW5nIGRpc2N1c3Npb24gZm9yIG1vcmUKY29udGV4dDoKICBodHRwczovL2xpc3Rz
LmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyNC0wMi9tc2cwMDc3NS5odG1sCgpU
aGlzIHNlcmllcyByZW5hbWVzICJULUhlYWQgUEJNVCIgdG8gIk1BRSIvIlhUaGVhZE1hZSIgYW5k
IG9ubHkgZW5hYmxlcwppdCBpZiB0aGUgdGguc3hzdGF0dXMuTUFFRSBiaXQgaXMgc2V0LgoKVGhl
IHRoLnN4c3RhdHVzIENTUiBpcyBkb2N1bWVudGVkIGhlcmU6CiAgaHR0cHM6Ly9naXRodWIuY29t
L1QtaGVhZC1TZW1pL3RoZWFkLWV4dGVuc2lvbi1zcGVjL2Jsb2IvbWFzdGVyL3h0aGVhZHN4c3Rh
dHVzLmFkb2MKClhUaGVhZE1hZSBpcyBkb2N1bWVudGVkIGhlcmU6CiAgaHR0cHM6Ly9naXRodWIu
Y29tL1QtaGVhZC1TZW1pL3RoZWFkLWV4dGVuc2lvbi1zcGVjL2Jsb2IvbWFzdGVyL3h0aGVhZG1h
ZS5hZG9jCgpUaGUgUUVNVSBwYXRjaCB0byBlbXVsYXRlIHRoLnN4c3RhdHVzIHdpdGggdGhlIE1B
RUUgYml0IG5vdCBzZXQgaXMgaGVyZToKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NDAzMjkxMjA0MjcuNjg0Njc3LTEtY2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1LwoKQWZ0ZXIg
YXBwbHlpbmcgdGhlIHJlZmVyZW5jZWQgUUVNVSBwYXRjaCwgdGhpcyBwYXRjaHNldCBhbGxvd3Mg
dG8Kc3VjY2Vzc2Z1bGx5IGJvb3QgYSBDOTA2IFFFTVUgc3lzdGVtIGVtdWxhdGlvbiAoIi1jcHUg
dGhlYWQtYzkwNiIpLgoKQ2hhbmdlcyBpbiB2MzoKKiBSZW5hbWUgdG8gTUFFIGluc3RlYWQgb2Yg
TUFFRQoKQ2hhbmdlcyBpbiB2MjoKKiB1c2UgdGguc3hzdGF0dXMuTUFFRSBpbnN0ZWFkIG9mIHRo
Lm14c3RhdHVzLk1BRUUKCkNocmlzdG9waCBNw7xsbG5lciAoMik6CiAgcmlzY3Y6IHRoZWFkOiBS
ZW5hbWUgVC1IZWFkIFBCTVQgdG8gTUFFCiAgcmlzY3Y6IFQtSGVhZDogVGVzdCBhdmFpbGFiaWxp
dHkgYml0IGJlZm9yZSBlbmFibGluZyBNQUUgZXJyYXRhCgogYXJjaC9yaXNjdi9LY29uZmlnLmVy
cmF0YSAgICAgICAgICAgIHwgIDggKysrKy0tLS0KIGFyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2Vy
cmF0YS5jICAgICB8IDI0ICsrKysrKysrKysrKysrKy0tLS0tLS0tLQogYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9lcnJhdGFfbGlzdC5oIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCgotLSAKMi40NC4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
