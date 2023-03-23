Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAAEC76196
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHV0Et1Lof9Yhb8+dJw02tlFt07gD4/0Jg69PnmIUdY=; b=eWKIIoD3FFyAOz
	Gigtx39Ta5FpYOlUVIc+XuAqH9+7A5XZiWR40TIW38yZqaWQVLKywwCB/An4caPzACmY48SaCn6LO
	jtXt4vEXN4rKQNhbwISWkmruWfVWREsvDDK5Dbw/JywiYs4dS0w2ufN/fBzMossM2xW0ykNXLLHsD
	8+t9feRE9fCJzQEAV8cpVGnd2cE/bvB72EoZ9yfR2z4rvMj6+VcKGoGzwwKmBn5xPQpk/ihuCGkPS
	Vqctn8V8pwesUnu0bQ9WJ58M718AWn0K7tY/rgMOTVWCbMhK98itEILFw3tLA7KR+0A8ZrFj2HNWq
	Lhy/DxmzQ9p3dpO0/+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRE-002HXV-0B;
	Thu, 23 Mar 2023 15:01:12 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMR8-002HEw-0J
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 15:01:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id kq3so10159384plb.13
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tw8ZKuKEPT8AsBgdKtvPSORjjdmidJuqaPi4DZ1mAhU=;
        b=bvy7I8TUNU8naMd+Sfj2fslrCHGLNUMYZmK4vqGpgAllweyGDZG/ntUpunVR7XmcDy
         cFmMoL64R0BJzlawqUpuiG4fk2qVBThebJPGwUwLXmG6EE0AeID7RulZTQJJ6PebQbXd
         PSCg5hBp4Ic9MUA1hIjJ4uyxUbiAEYPqAxAQIpDuTJ5Q9tUdN4sbAH/K+WDJk4gNk7dI
         ZpfZfEAwxOJziT9CUh3RBQMQ54UyRKMS1MRmVqI4lk43cMMboLlPWNyV0nT6NcE6nKOF
         JjOjjckmn40wuL3NkIXiN0jC8NF+gTrC5XyKCB+ByHhOudHv1GN6+nNsJqEVbpR38Cby
         g/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tw8ZKuKEPT8AsBgdKtvPSORjjdmidJuqaPi4DZ1mAhU=;
        b=dBMnK8cozMptzThmkIUvP6Nz5w/bhcWmPEKii4rKzOULxgryjJwNFC8JX5bJuxvkdn
         Ls3vYeetK3ME9AshZIqKKoI+3LtUzNK2vVAcufE7iLRWa9PR4rTBWVttqdthsvvWJlTa
         lxhsCuLVHvNVFVOehwJjGVRkuAw1EfC+6iXBNofhJDQNLwjmCrd7IwdvLGwmecEiTg93
         pHqHfq+Vk+z4rx0Hl3eft+N41GydR6utZLjN3PfwktK44KRLN5XhYMhnnsryn8To0LJt
         0RI54+Wy8s69B2rzQa+FyVAi9BpoywwVHVw/ReI5BjBfHSGXQdRQDprlnGUZU9o1iQoJ
         nlnA==
X-Gm-Message-State: AAQBX9eLYAOPjRIqo23XCC1DhEB3MzPejHIKIMYoppxH2nP3RaWsd0V2
	gWhFzMc5i3yYa+2kWNJfn75Ci+FwR4LsPuzSYV+f9bFYD9XLIovsI2fH9Q6qy7s7PgvHv5JDaBy
	G4MkxF5l5ec/3CtrhRcF1YHLYHrRWu0FL3e1qJTfyUeHULH7GMyeQk89em1c8eS5WdKOmHGerfR
	CHsnNmgbMlrnWX
X-Google-Smtp-Source: AKy350aaFJ1127aBTrhi4lqsUpIZSap+STJ0lRVnnhWekHIcI2E2Ot/a8mgbJ7WsyqB4nmBzy1fPEA==
X-Received: by 2002:a17:902:d489:b0:19a:9dab:3438 with SMTP id c9-20020a170902d48900b0019a9dab3438mr7001571plg.2.1679583665088;
        Thu, 23 Mar 2023 08:01:05 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.08.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:01:04 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v16 14/20] riscv: signal: Report signal frame size to userspace via auxv
Date: Thu, 23 Mar 2023 14:59:18 +0000
Message-Id: <20230323145924.4194-15-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080106_141538_9BF4A639 
X-CRM114-Status: GOOD (  23.15  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Kees Cook <keescook@chromium.org>, Nick Knight <nick.knight@sifive.com>, Andrew Bresticker <abrestic@rivosinc.com>, vineetg@rivosinc.com, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Al Viro <viro@zeniv.linux.org.uk>, Vincent Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Eric Biederman <ebiederm@xmission.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Zong Li <zong.li@sifive.com>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KClRoZSB2ZWN0b3Ig
cmVnaXN0ZXIgYmVsb25ncyB0byB0aGUgc2lnbmFsIGNvbnRleHQuIFRoZXkgbmVlZCB0byBiZSBz
dG9yZWQKYW5kIHJlc3RvcmVkIGFzIGVudGVyaW5nIGFuZCBsZWF2aW5nIHRoZSBzaWduYWwgaGFu
ZGxlci4gQWNjb3JkaW5nIHRvIHRoZQpWLWV4dGVuc2lvbiBzcGVjaWZpY2F0aW9uLCB0aGUgbWF4
aW11bSBsZW5ndGggb2YgdGhlIHZlY3RvciByZWdpc3RlcnMgY2FuCmJlIDJeMTYuIEhlbmNlLCBp
ZiB1c2Vyc3BhY2UgcmVmZXJzIHRvIHRoZSBNSU5TSUdTVEtTWiB0byBjcmVhdGUgYQpzaWdmcmFt
ZSwgaXQgbWF5IG5vdCBiZSBlbm91Z2guIFRvIHJlc29sdmUgdGhpcyBwcm9ibGVtLCB0aGlzIHBh
dGNoIHJlZmVycwp0byB0aGUgY29tbWl0IDk0YjA3YzFmOGMzOWMKKCJhcm02NDogc2lnbmFsOiBS
ZXBvcnQgc2lnbmFsIGZyYW1lIHNpemUgdG8gdXNlcnNwYWNlIHZpYSBhdXh2IikgdG8gZW5hYmxl
CnVzZXJzcGFjZSB0byBrbm93IHRoZSBtaW5pbXVtIHJlcXVpcmVkIHNpZ2ZyYW1lIHNpemUgdGhy
b3VnaCB0aGUgYXV4aWxpYXJ5CnZlY3RvciBhbmQgdXNlIGl0IHRvIGFsbG9jYXRlIGVub3VnaCBt
ZW1vcnkgZm9yIHNpZ25hbCBjb250ZXh0LgoKTm90ZSB0aGF0IGF1eHYgYWx3YXlzIHJlcG9ydHMg
c2l6ZSBvZiB0aGUgc2lnZnJhbWUgYXMgaWYgViBleGlzdHMgZm9yCmFsbCBzdGFydGluZyBwcm9j
ZXNzZXMsIHdoZW5ldmVyIHRoZSBrZXJuZWwgaGFzIENPTkZJR19SSVNDVl9JU0FfVi4gVGhlCnJl
YXNvbiBpcyB0aGF0IHVzZXJzIHVzdWFsbHkgcmVmZXJlbmNlIHRoaXMgdmFsdWUgdG8gYWxsb2Nh
dGUgYW4KYWx0ZXJuYXRpdmUgc2lnbmFsIHN0YWNrLCBhbmQgdGhlIHVzZXIgbWF5IHVzZSBWIGFu
eXRpbWUuIFNvIHRoZSB1c2VyCm11c3QgcmVzZXJ2ZSBhIHNwYWNlIGZvciBWLWNvbnRleHQgaW4g
c2lnZnJhbWUgaW4gY2FzZSB0aGF0IHRoZSBzaWduYWwKaGFuZGxlciBpbnZva2VzIGFmdGVyIHRo
ZSBrZXJuZWwgYWxsb2NhdGluZyBWLgoKU2lnbmVkLW9mZi1ieTogR3JlZW50aW1lIEh1IDxncmVl
bnRpbWUuaHVAc2lmaXZlLmNvbT4KU2lnbmVkLW9mZi1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50
LmNoZW5Ac2lmaXZlLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lm
aXZlLmNvbT4KQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+ClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ClJldmll
d2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2VsZi5oICAgICAgICAgfCAgOSArKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcHJvY2Vzc29yLmggICB8ICAyICsrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vYXV4
dmVjLmggfCAgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYyAgICAgICAgICAgfCAyMCAr
KysrKysrKysrKysrKystLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oCmluZGV4IDMwZTdkMjQ1NTk2MC4uY2EyM2M0
ZjZjNDQwIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oCisrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmgKQEAgLTEwNSw2ICsxMDUsMTUgQEAgZG8gewkJCQkJ
CQkJXAogCQlnZXRfY2FjaGVfc2l6ZSgzLCBDQUNIRV9UWVBFX1VOSUZJRUQpKTsJCVwKIAlORVdf
QVVYX0VOVChBVF9MM19DQUNIRUdFT01FVFJZLAkJCVwKIAkJZ2V0X2NhY2hlX2dlb21ldHJ5KDMs
IENBQ0hFX1RZUEVfVU5JRklFRCkpOwlcCisJLyoJCQkJCQkJIFwKKwkgKiBTaG91bGQgYWx3YXlz
IGJlIG5vbnplcm8gdW5sZXNzIHRoZXJlJ3MgYSBrZXJuZWwgYnVnLiBcCisJICogSWYgd2UgaGF2
ZW4ndCBkZXRlcm1pbmVkIGEgc2Vuc2libGUgdmFsdWUgdG8gZ2l2ZSB0bwkgXAorCSAqIHVzZXJz
cGFjZSwgb21pdCB0aGUgZW50cnk6CQkJCSBcCisJICovCQkJCQkJCSBcCisJaWYgKGxpa2VseShz
aWduYWxfbWluc2lnc3Rrc3opKQkJCQkgXAorCQlORVdfQVVYX0VOVChBVF9NSU5TSUdTVEtTWiwg
c2lnbmFsX21pbnNpZ3N0a3N6KTsgXAorCWVsc2UJCQkJCQkJIFwKKwkJTkVXX0FVWF9FTlQoQVRf
SUdOT1JFLCAwKTsJCQkgXAogfSB3aGlsZSAoMCkKICNkZWZpbmUgQVJDSF9IQVNfU0VUVVBfQURE
SVRJT05BTF9QQUdFUwogc3RydWN0IGxpbnV4X2JpbnBybTsKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nl
c3Nvci5oCmluZGV4IGYwZGRmNjkxYWM1ZS4uMzhkZWQ4YzVmMjA3IDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcHJvY2Vzc29yLmgKQEAgLTcsNiArNyw3IEBACiAjZGVmaW5lIF9BU01fUklTQ1ZfUFJPQ0VT
U09SX0gKIAogI2luY2x1ZGUgPGxpbnV4L2NvbnN0Lmg+CisjaW5jbHVkZSA8bGludXgvY2FjaGUu
aD4KIAogI2luY2x1ZGUgPHZkc28vcHJvY2Vzc29yLmg+CiAKQEAgLTgxLDYgKzgyLDcgQEAgaW50
IHJpc2N2X29mX3BhcmVudF9oYXJ0aWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLCB1bnNpZ25l
ZCBsb25nICpoYXJ0aWQpOwogZXh0ZXJuIHZvaWQgcmlzY3ZfZmlsbF9od2NhcCh2b2lkKTsKIGV4
dGVybiBpbnQgYXJjaF9kdXBfdGFza19zdHJ1Y3Qoc3RydWN0IHRhc2tfc3RydWN0ICpkc3QsIHN0
cnVjdCB0YXNrX3N0cnVjdCAqc3JjKTsKIAorZXh0ZXJuIHVuc2lnbmVkIGxvbmcgc2lnbmFsX21p
bnNpZ3N0a3N6IF9fcm9fYWZ0ZXJfaW5pdDsKICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KIAog
I2VuZGlmIC8qIF9BU01fUklTQ1ZfUFJPQ0VTU09SX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9hdXh2ZWMuaAppbmRleCBmYjE4N2EzM2NlNTguLjEwYWFhODNkYjg5ZSAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9hdXh2ZWMuaApAQCAtMzUsNSArMzUsNiBAQAogCiAvKiBlbnRyaWVzIGlu
IEFSQ0hfRExJTkZPICovCiAjZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gJOQorI2RlZmluZSBB
VF9NSU5TSUdTVEtTWgkJNTEKIAogI2VuZGlmIC8qIF9VQVBJX0FTTV9SSVNDVl9BVVhWRUNfSCAq
LwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zaWduYWwuYwppbmRleCA1M2IxNzgzOWQ2MDYuLjZiOGJmOTM1YjMzYSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2ln
bmFsLmMKQEAgLTIxLDYgKzIxLDggQEAKICNpbmNsdWRlIDxhc20vdmVjdG9yLmg+CiAjaW5jbHVk
ZSA8YXNtL2Nzci5oPgogCit1bnNpZ25lZCBsb25nIHNpZ25hbF9taW5zaWdzdGtzeiBfX3JvX2Fm
dGVyX2luaXQ7CisKIGV4dGVybiB1MzIgX191c2VyX3J0X3NpZ3JldHVyblsyXTsKIHN0YXRpYyBz
aXplX3QgcmlzY3Zfdl9zY19zaXplIF9fcm9fYWZ0ZXJfaW5pdDsKIApAQCAtMTk1LDcgKzE5Nyw3
IEBAIHN0YXRpYyBsb25nIHJlc3RvcmVfc2lnY29udGV4dChzdHJ1Y3QgcHRfcmVncyAqcmVncywK
IAlyZXR1cm4gZXJyOwogfQogCi1zdGF0aWMgc2l6ZV90IGdldF9ydF9mcmFtZV9zaXplKHZvaWQp
CitzdGF0aWMgc2l6ZV90IGdldF9ydF9mcmFtZV9zaXplKGJvb2wgY2FsX2FsbCkKIHsKIAlzdHJ1
Y3QgcnRfc2lnZnJhbWUgX191c2VyICpmcmFtZTsKIAlzaXplX3QgZnJhbWVfc2l6ZTsKQEAgLTIw
Myw4ICsyMDUsMTAgQEAgc3RhdGljIHNpemVfdCBnZXRfcnRfZnJhbWVfc2l6ZSh2b2lkKQogCiAJ
ZnJhbWVfc2l6ZSA9IHNpemVvZigqZnJhbWUpOwogCi0JaWYgKGhhc192ZWN0b3IoKSAmJiByaXNj
dl92X3ZzdGF0ZV9xdWVyeSh0YXNrX3B0X3JlZ3MoY3VycmVudCkpKQotCQl0b3RhbF9jb250ZXh0
X3NpemUgKz0gcmlzY3Zfdl9zY19zaXplOworCWlmIChoYXNfdmVjdG9yKCkpIHsKKwkJaWYgKGNh
bF9hbGwgfHwgcmlzY3Zfdl92c3RhdGVfcXVlcnkodGFza19wdF9yZWdzKGN1cnJlbnQpKSkKKwkJ
CXRvdGFsX2NvbnRleHRfc2l6ZSArPSByaXNjdl92X3NjX3NpemU7CisJfQogCS8qCiAJICogUHJl
c2VydmVkIGEgX19yaXNjdl9jdHhfaGRyIGZvciBFTkQgc2lnbmFsIGNvbnRleHQgaGVhZGVyIGlm
IGFuCiAJICogZXh0ZW5zaW9uIHVzZXMgX19yaXNjdl9leHRyYV9leHRfaGVhZGVyCkBAIC0yMjQs
NyArMjI4LDcgQEAgU1lTQ0FMTF9ERUZJTkUwKHJ0X3NpZ3JldHVybikKIAlzdHJ1Y3QgcnRfc2ln
ZnJhbWUgX191c2VyICpmcmFtZTsKIAlzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2s7CiAJc2lnc2V0
X3Qgc2V0OwotCXNpemVfdCBmcmFtZV9zaXplID0gZ2V0X3J0X2ZyYW1lX3NpemUoKTsKKwlzaXpl
X3QgZnJhbWVfc2l6ZSA9IGdldF9ydF9mcmFtZV9zaXplKGZhbHNlKTsKIAogCS8qIEFsd2F5cyBt
YWtlIGFueSBwZW5kaW5nIHJlc3RhcnRlZCBzeXN0ZW0gY2FsbHMgcmV0dXJuIC1FSU5UUiAqLwog
CWN1cnJlbnQtPnJlc3RhcnRfYmxvY2suZm4gPSBkb19ub19yZXN0YXJ0X3N5c2NhbGw7CkBAIC0z
MjAsNyArMzI0LDcgQEAgc3RhdGljIGludCBzZXR1cF9ydF9mcmFtZShzdHJ1Y3Qga3NpZ25hbCAq
a3NpZywgc2lnc2V0X3QgKnNldCwKIHsKIAlzdHJ1Y3QgcnRfc2lnZnJhbWUgX191c2VyICpmcmFt
ZTsKIAlsb25nIGVyciA9IDA7Ci0Jc2l6ZV90IGZyYW1lX3NpemUgPSBnZXRfcnRfZnJhbWVfc2l6
ZSgpOworCXNpemVfdCBmcmFtZV9zaXplID0gZ2V0X3J0X2ZyYW1lX3NpemUoZmFsc2UpOwogCiAJ
ZnJhbWUgPSBnZXRfc2lnZnJhbWUoa3NpZywgcmVncywgZnJhbWVfc2l6ZSk7CiAJaWYgKCFhY2Nl
c3Nfb2soZnJhbWUsIGZyYW1lX3NpemUpKQpAQCAtNDgzLDQgKzQ4NywxMCBAQCB2b2lkIF9faW5p
dCBpbml0X3J0X3NpZ25hbF9lbnYodm9pZCkKIHsKIAlyaXNjdl92X3NjX3NpemUgPSBzaXplb2Yo
c3RydWN0IF9fcmlzY3ZfY3R4X2hkcikgKwogCQkJICBzaXplb2Yoc3RydWN0IF9fc2NfcmlzY3Zf
dl9zdGF0ZSkgKyByaXNjdl92X3ZzaXplOworCS8qCisJICogRGV0ZXJtaW5lIHRoZSBzdGFjayBz
cGFjZSByZXF1aXJlZCBmb3IgZ3VhcmFudGVlZCBzaWduYWwgZGVsaXZlcnkuCisJICogVGhlIHNp
Z25hbF9taW5zaWdzdGtzeiB3aWxsIGJlIHBvcHVsYXRlZCBpbnRvIHRoZSBBVF9NSU5TSUdTVEtT
WiBlbnRyeQorCSAqIGluIHRoZSBhdXhpbGlhcnkgYXJyYXkgYXQgcHJvY2VzcyBzdGFydHVwLgor
CSAqLworCXNpZ25hbF9taW5zaWdzdGtzeiA9IGdldF9ydF9mcmFtZV9zaXplKHRydWUpOwogfQot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
