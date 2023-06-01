Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00F0C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q+N1LaccOyfy/Uqk+U0h/KwUSLyWjaCacLd866x5YhA=; b=zYKeIhd0kNYJ3q
	6Bf0HW/B7lP/N2dRQRp0SLLG5ntmZWzjn85lg3hDvpWjT9F1lKeyy9XpA1Yn9gGWwFxZDVKY1DbCC
	jP49fw7BUd+m6PAx3zro4/UI8j24Yn8Dd1hQMV5vev0c0m2Zh/DBfP0RT4UE3GEU8cedKPh08lu4v
	woUIDajSwvjroFTo4UyjEm39BSMEW6XXJIeSKYfb4exntzzgvUdgzqYai3VxdT+FBo88lpAc+kYBW
	PCELJISpwT9JCZ6v514/hg9/Hz0raKwcKPogkQFUA+hJ21Z2y+981LK9+FzqP0WVkFjBrCLF5/PKV
	7vPfjMMsL1LJz3T9yprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4kj9-0048WD-0O;
	Thu, 01 Jun 2023 16:00:39 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4kj6-0048TZ-2b
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 16:00:38 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-53fe2275249so557104a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Jun 2023 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685635233; x=1688227233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CSSMVbhKiQKes2FXn07HT2PehTcS3LvEK8iBz94W+GE=;
        b=G40YuqS1UsFpH+HN2SRB+wSxhkekURBx9NKclSP3kmF3V6Fhww8jiP3cDwI15wLucl
         SVk/ii9MR6JUzAtMSQ3vdNuC9icNcRIH+N5v2o4AiDjDBIa49c6JdpsvTGQJfLdq/7lp
         S3EubNPyT2dJIDTD1Pvpj6u6Qf5IlwBF0m/Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685635233; x=1688227233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSSMVbhKiQKes2FXn07HT2PehTcS3LvEK8iBz94W+GE=;
        b=jOqH122v186QZlh4nigUu4H0WAwmbvB0yAwwj4MSBgFswETlWzS63W06DMB5xxTQqY
         dE3/LGN5LvF7sR3lI1eLZJMUQUW2W4NOuFtP4WjoXzNh7ZzWBpGMk5/M40pInMyQm+KD
         TDmKa+BoaHoqeR1ojo/LajQRmJnZY5g30IUFibjiZbofjZkq+WjqJhFsCf6ZeGW0h5jS
         T0EVmgn+CT1fW1TuQvt9JIq66/XODTI66UC4UPhbAeMslTtQDSb0CHkI/KutRvdRd2F2
         sRuHUmTcQRxYhlDjLNMyVRiPFykF5+Yq78Izu7R/d1QN/xWeVKLoLtUm0Uz0hpI5dUdA
         B0IA==
X-Gm-Message-State: AC+VfDyld7Vv3Lf11BGESA6cviOjpLkM+WZe34iX4/bMjTLAjnqk2UiK
	VZNKkb4f9zWWTcpBvCW+61QT9w==
X-Google-Smtp-Source: ACHHUZ7Y/j1K0K+OI8RiBenflSTAHsKRmF86JYQCC8TX/WswDP9/djNgLEAJ0bZT13bWWUVoH+F2WQ==
X-Received: by 2002:a17:902:8307:b0:1ae:305f:e949 with SMTP id bd7-20020a170902830700b001ae305fe949mr5823287plb.6.1685635232876;
        Thu, 01 Jun 2023 09:00:32 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u10-20020a17090341ca00b001ae42480c82sm3662096ple.226.2023.06.01.09.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 09:00:32 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Kees Cook <keescook@chromium.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	=?UTF-8?q?Joan=20Bruguera=20Mic=C3=B3?= <joanbrugueram@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Alyssa Ross <hi@alyssa.is>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] riscv/purgatory: Do not use fortified string functions
Date: Thu,  1 Jun 2023 09:00:28 -0700
Message-Id: <20230601160025.gonna.868-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046; h=from:subject:message-id; bh=D3i2fx38SuZJfTLJnG4ariCLKDkYJ4XMlsdasO2er94=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBkeMCcr4GEaZm3mIC8bLTgzCfv0iCFwT3u6pSWp2/4 oidJwVuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZHjAnAAKCRCJcvTf3G3AJosmD/ 9VUGMkQRPLvYkOTpl4FX/cepeYlRCO0IrieC8te7msoWdE6Be3W2w+fdYWKAqFdqWAsxpFdq+r1dWa OlSjzEEEhmDAzdQyqllhVMRdKGSYQXUnj2QrDrq+ZHaMpAAQK9xDhDdsqtgpfpUQkfH4HPnJKn7EUJ 9fiG93rORBeoFqTeTjFguaR7qgPET/W/RhadhoeETdqeYKEibyeHTwnrONdW6SLkfmuXn9M4FOCE44 z+z7CZMwLYp5MxSQptwNFeg/XsQXCZlf2ieOvsS3J4xAoOFHGXaSQNorAzm+woUUMP2rdiK6xa08Hl IrCYt5TNpi/0oL0SEUnrEwj+wqCUQ1KPP2AnmfvST8kW/YDCCgEmonSuSNLtPw3LmUcEkc4nLXVPbN wul8nbMNGrFwms1JhbMFkjxGW1xvvqv3uqVahy0MPNOf9a7rABAbfmx5KQE3IjK8OQb75ieWxK5F+s shhk0Qz/JS5E8PM9YKzwIpMFA+I48NuQOSc0zNmxwCvKvJMUspLhUQaqqyosz+IGQw9wLNPLLycEdX PS+r83Gn1ZtHgbteZK2hGOlv4oDVxDE4OYZL/Fl2lHCvjDnXUxGqeqA40rVpidDWZyMkQMP372jPwa WbKuQ7fIa8qQqvkrjU8EzNp/oqETsJZs6fuaXUDAj5uLbRH6uHn2fB2I9BvQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_090036_864034_359F9B5C 
X-CRM114-Status: GOOD (  12.41  )
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

V2l0aCB0aGUgYWRkaXRpb24gb2YgLWZzdHJpY3QtZmxleC1hcnJheXM9Mywgc3RydWN0IHNoYTI1
Nl9zdGF0ZSdzCnRyYWlsaW5nIGFycmF5IGlzIG5vIGxvbmdlciBpZ25vcmVkIGJ5IENPTkZJR19G
T1JUSUZZX1NPVVJDRToKCnN0cnVjdCBzaGEyNTZfc3RhdGUgewogICAgICAgIHUzMiBzdGF0ZVtT
SEEyNTZfRElHRVNUX1NJWkUgLyA0XTsKICAgICAgICB1NjQgY291bnQ7CiAgICAgICAgdTggYnVm
W1NIQTI1Nl9CTE9DS19TSVpFXTsKfTsKClRoaXMgbWVhbnMgdGhhdCB0aGUgbWVtY3B5KCkgY2Fs
bHMgd2l0aCAiYnVmIiBhcyBhIGRlc3RpbmF0aW9uIGluCnNoYTI1Ni5jJ3MgY29kZSB3aWxsIGF0
dGVtcHQgdG8gcGVyZm9ybSBydW4tdGltZSBib3VuZHMgY2hlY2tpbmcsIHdoaWNoCmNvdWxkIGxl
YWQgdG8gY2FsbGluZyBtaXNzaW5nIGZ1bmN0aW9ucywgc3BlY2lmaWNhbGx5IGEgcG90ZW50aWFs
CldBUk5fT05DRSwgd2hpY2ggaXNuJ3QgY2FsbGFibGUgZnJvbSBwdXJnYXRvcnkuCgpSZXBvcnRl
ZC1ieTogVGhvcnN0ZW4gTGVlbWh1aXMgPGxpbnV4QGxlZW1odWlzLmluZm8+CkNsb3NlczogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xNzU1NzhlYy05ZGVjLTdhOWMtOGQzYS00M2YyNGZm
ODZiOTJAbGVlbWh1aXMuaW5mby8KQmlzZWN0ZWQtYnk6ICJKb2FuIEJydWd1ZXJhIE1pY8OzIiA8
am9hbmJydWd1ZXJhbUBnbWFpbC5jb20+CkZpeGVzOiBkZjhmYzRlOTM0YzEgKCJrYnVpbGQ6IEVu
YWJsZSAtZnN0cmljdC1mbGV4LWFycmF5cz0zIikKQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2Fs
bXNsZXlAc2lmaXZlLmNvbT4KQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+
CkNjOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KQ2M6IE1hc2FoaXJvIFlhbWFk
YSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+CkNjOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPgpDYzogTmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5j
b20+CkNjOiBBbHlzc2EgUm9zcyA8aGlAYWx5c3NhLmlzPgpDYzogSGVpa28gU3R1ZWJuZXIgPGhl
aWtvLnN0dWVibmVyQHZydWxsLmV1PgpDYzogIkd1c3Rhdm8gQS4gUi4gU2lsdmEiIDxndXN0YXZv
YXJzQGtlcm5lbC5vcmc+CkNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnClNpZ25l
ZC1vZmYtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgotLS0KdjI6IC0gb25s
eSBsaW1pdCBmb3J0aWZ5IGZvciBzaGEyNTYgKGNvbm9yKQp2MTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC8yMDIzMDUzMTAwMzQwNC5uZXZlci4xNjcta2Vlc0BrZXJuZWwub3JnCi0tLQog
YXJjaC9yaXNjdi9wdXJnYXRvcnkvTWFrZWZpbGUgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L3B1cmdh
dG9yeS9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvcHVyZ2F0b3J5L01ha2VmaWxlCmluZGV4IDU3MzA3
OTdhNmI0MC4uOGM3MzM2MGM0MmJiIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L3B1cmdhdG9yeS9N
YWtlZmlsZQorKysgYi9hcmNoL3Jpc2N2L3B1cmdhdG9yeS9NYWtlZmlsZQpAQCAtMzEsNyArMzEs
NyBAQCAkKG9iaikvc3RybmNtcC5vOiAkKHNyY3RyZWUpL2FyY2gvcmlzY3YvbGliL3N0cm5jbXAu
UyBGT1JDRQogJChvYmopL3NoYTI1Ni5vOiAkKHNyY3RyZWUpL2xpYi9jcnlwdG8vc2hhMjU2LmMg
Rk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdlZF9ydWxlLGNjX29fYykKIAotQ0ZMQUdTX3NoYTI1Ni5v
IDo9IC1EX19ESVNBQkxFX0VYUE9SVFMKK0NGTEFHU19zaGEyNTYubyA6PSAtRF9fRElTQUJMRV9F
WFBPUlRTIC1EX19OT19GT1JUSUZZCiBDRkxBR1Nfc3RyaW5nLm8gOj0gLURfX0RJU0FCTEVfRVhQ
T1JUUwogQ0ZMQUdTX2N0eXBlLm8gOj0gLURfX0RJU0FCTEVfRVhQT1JUUwogCi0tIAoyLjM0LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
