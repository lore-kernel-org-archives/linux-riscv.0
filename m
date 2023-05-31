Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA40C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 00:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dud4fLMwfh2XcTvszslwg1neIYPtyayuqjuTyyztL5c=; b=eUBVCxGROR76bC
	cg+j017rAlbQU5fm7o4rGqXu9lVMQU8OBq3XYTczg8tHkM1C/qeKC4bNBmb0GyOEIW1mTTZHy1kgB
	u/uOb9JEarb97HihmIpuHjzxjLamMkfsUp2LAvvUi8DFEEIwUNYcExITa3bMyNvJ36w0MyXL19RC4
	kYhCDbi6DkErLLJdMBG465X1ykJRJKRE3XFX1m7ooiOKIICz/Jv6YHiuwaDPkC0md2mmw9/0ctL3W
	ISfOMPCCIV6DbT5GWgCe7vKiGGUqjjYXlAxvZJVmvi8kUCdSfLq80pGBzsHa8scjTxCCOM6xVa386
	b8aHzXLIjzvCMaOrOdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q49n2-00FcXz-0F;
	Wed, 31 May 2023 00:34:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q49mz-00FcVp-1V
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 00:34:10 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b05d0bc2bfso10574005ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 17:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685493246; x=1688085246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5f5G6Z5TX6jSNSW7iZ4219jNh0M1Ixv7KFZOMk7yBdk=;
        b=l9VKAMH6WudZIZRhNlh71t6tXPDlsutsmJmLWqRRW2iFdXdhtFrqpS+dXNZnLjIoFx
         X7NDzTAMsMsrBMj5MVv9ZOyOPvEkdf5l32hodPIVj3rprhLMmmcUOwSVHYlnqNfLcVmg
         FwdUHrvYq9AxBfxDwMlDvH4ygVfvGGu483lK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685493246; x=1688085246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5f5G6Z5TX6jSNSW7iZ4219jNh0M1Ixv7KFZOMk7yBdk=;
        b=XToDT+N1MxZy4P3BhjkD/sNZywVtgUvq+GtkEKI+IQiYBY4B8eYUlrwllpBoL68kVw
         +QAlOA4VJQf5CfFGqKbdqkCmpQzzTEbwx2qovt5Ro756PxudAeWZwA0bVNZ9PXpmIJtH
         5lsdUQnVl9wqpM51bCl9URsznN0TB3Seg1t0zytU8+KGC7hp9MAJZOVRq1w4sXhU7GA/
         FlqppzWxQUCns3ZyfmZNFIzE5muBTvqI4Y5YkveQJgDhUj2vpm4shVfcoB0QZbqZ2Eyk
         IKjwVoirw9hhGFuNahTtVQ+SswC7oibNaNl1lzc4ZZHdWGjXj3lwVWVXcAkgzbR/x4eD
         7etQ==
X-Gm-Message-State: AC+VfDxNhKrB9XmpzADpw3h7i0Wn/B9bd5xjjqwel38HvcVp8EAAq17/
	ngn2F1xQeIUjFq1I7tP4TqflAg==
X-Google-Smtp-Source: ACHHUZ5/++6K7OTO9X9PqwE6aBl5HupJYUjF7HBbHsNePlIAEb2cGG8BSsZvcRS0ILBFNlBs/WfZ3Q==
X-Received: by 2002:a17:902:d4c3:b0:1b0:348f:c48c with SMTP id o3-20020a170902d4c300b001b0348fc48cmr4556864plg.2.1685493246586;
        Tue, 30 May 2023 17:34:06 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u12-20020a170902b28c00b001b022f2aa12sm7548958plr.239.2023.05.30.17.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 17:34:06 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] riscv/purgatory: Do not use fortified string functions
Date: Tue, 30 May 2023 17:34:04 -0700
Message-Id: <20230531003404.never.167-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2193; h=from:subject:message-id; bh=/JxqFfJ6nuR0/6IE7Sc4flmcXznFeg2cPC6sgocVuNU=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBkdpX8G4kqMGXXMDB6QczvHZO2WMQWHuNrSDDCbUQ3 nkFlCHaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZHaV/AAKCRCJcvTf3G3AJoHXD/ 9VFWg0OwdTmI5Ri78v0MVimMvM+qTS532cnKbCQjAMvJB0aTiyikiMWU1kssDuWYCsWMGrGZL6CiKT kX5eQ071IpzqrvWr+lDigf92GAztBf0FLgC4M2rdgkVinvXEAnzRp2NFMFXRP+pSqv+Fr2Jo7Ke4Ty rBdoUUXJKDCz2n5UXUobVPdvOY+iJWhb/Zt+zHu05O/6JirOLgr6elUbixDbjBH/SvGoi/k4oFPHro Ohl1jQXp7wCmWUiid65oYJb/Wp5CfjTPipiBd1CKC2aPjc/RCuZDCwxxByLY8I21j7+VMJCUfHV+r2 cdJWFXFxoOPW6qeEP1Cc1j/oGP0eAcKESAsiLE/q8nxXU5CbzW4CxZLHqQcIUAXPJRi9edvZm5W1ec 1FxsaGKvgjyGUqzw1WlYU+aGBOXFuldUIHtADp6CZWI3KTWE9o0lnk6a0d0Cxo4bzKHkq6fPmzc81z jS4x587NgH3+JThRZ2GEejTMGxd4Tm0G92jEyEH7evy3ojJNh14+7lS166LEVaLlUnVDp8Ge5xT7xw rEixWCU/RYdU9+P/ukZoI+81IQCIU4cR57jko6FkwnW7vYxMlDIxW2CbNf5W1u2ygPg0eF0KMTS/bO eci3+H2fkfeKH7LlezfLbBssyk5pjZ5iKUY0oSY0E7uPl7z8PKqUnuMY+hPg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_173409_500711_D49631DC 
X-CRM114-Status: GOOD (  12.05  )
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
ZC1vZmYtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgotLS0KIGFyY2gvcmlz
Y3YvcHVyZ2F0b3J5L01ha2VmaWxlIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9wdXJnYXRv
cnkvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L3B1cmdhdG9yeS9NYWtlZmlsZQppbmRleCA1NzMwNzk3
YTZiNDAuLjExZjRjMjc1ZjE0MSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9wdXJnYXRvcnkvTWFr
ZWZpbGUKKysrIGIvYXJjaC9yaXNjdi9wdXJnYXRvcnkvTWFrZWZpbGUKQEAgLTMxLDkgKzMxLDkg
QEAgJChvYmopL3N0cm5jbXAubzogJChzcmN0cmVlKS9hcmNoL3Jpc2N2L2xpYi9zdHJuY21wLlMg
Rk9SQ0UKICQob2JqKS9zaGEyNTYubzogJChzcmN0cmVlKS9saWIvY3J5cHRvL3NoYTI1Ni5jIEZP
UkNFCiAJJChjYWxsIGlmX2NoYW5nZWRfcnVsZSxjY19vX2MpCiAKLUNGTEFHU19zaGEyNTYubyA6
PSAtRF9fRElTQUJMRV9FWFBPUlRTCi1DRkxBR1Nfc3RyaW5nLm8gOj0gLURfX0RJU0FCTEVfRVhQ
T1JUUwotQ0ZMQUdTX2N0eXBlLm8gOj0gLURfX0RJU0FCTEVfRVhQT1JUUworQ0ZMQUdTX3NoYTI1
Ni5vIDo9IC1EX19ESVNBQkxFX0VYUE9SVFMgLURfX05PX0ZPUlRJRlkKK0NGTEFHU19zdHJpbmcu
byA6PSAtRF9fRElTQUJMRV9FWFBPUlRTIC1EX19OT19GT1JUSUZZCitDRkxBR1NfY3R5cGUubyA6
PSAtRF9fRElTQUJMRV9FWFBPUlRTIC1EX19OT19GT1JUSUZZCiAKICMgV2hlbiBsaW5raW5nIHB1
cmdhdG9yeS5ybyB3aXRoIC1yIHVucmVzb2x2ZWQgc3ltYm9scyBhcmUgbm90IGNoZWNrZWQsCiAj
IGFsc28gbGluayBhIHB1cmdhdG9yeS5jaGsgYmluYXJ5IHdpdGhvdXQgLXIgdG8gY2hlY2sgZm9y
IHVucmVzb2x2ZWQgc3ltYm9scy4KLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
