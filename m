Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBD0D5B87E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 01:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++HprC3YNQ7Yj9FyjFZEWCFtlMHp1mKU7Xw/Tp0AW8U=; b=4k4gb/LPscYnx/
	Ln0EJlt427iOEn/x/A5+ZRLG1GzyAw8dl3BDws1HUjmmOdyfWy4WoJglmdvRW+qQT/hxtoSrvn/Oe
	rVCg8lGzrl3sHrnV/Cb4guMOLk62+IMvYAOUmZNkyZW8/KbfAs0obGLl5gLLGADRImS2XJvMay80b
	DgyoyjGIHlAqTZAI0WmUHS73/jsDdpnNFJ2iBxxsoH2Epz0ZUza34ij6RzEA1mbEYkJ9dJN1ihnQ+
	apzHZyOnrr8zdAqCEOSKkXF0+WH1ZtZukn9etnr5wcQIPz4djjVK6lha/NJ3cymeu+BvUmSuatj+z
	JsUro0iqWTBeAbQkqteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKAm-00000004VmQ-2ytQ;
	Tue, 16 Dec 2025 01:48:20 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKAj-00000004VlI-2ys2
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 01:48:19 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so5072500b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Dec 2025 17:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765849697; x=1766454497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPaduSWe86itOLJLDO9/qRxhQFQa/4nam9IeEV1MY2g=;
        b=SmhjokObTeVfYQILfuPyd4NK+hY+RlnoKykW/fX5NitiCwtgRJY7YtyFf5fXBtujLi
         N6dfB6Q2QVba9cW7BEgx+m5IXK87HpIUihEi9uJBxK+oluRAJGOmYWK6RLoHzTdo1Yyp
         4kBg3Y0rZNC0pLLJ8YHx/53l/EQmzhxMZ5y+dgIOrGZrZ4l33+1E/8aq/o4PdetPM46P
         B6Op+gS6l5ksPeNQ0ItShIV1j6RteBAJbJzO1MN/s72KcDutJ1IGDz0O3T154/lcFXhj
         0VIUKCHtcft9BhsWUDtbKyOFHZiQu99X+dkLnt+HsO7qWmQO8ZZQ5IY3KOdav2lbhzCi
         pL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765849697; x=1766454497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oPaduSWe86itOLJLDO9/qRxhQFQa/4nam9IeEV1MY2g=;
        b=iCnJkYltf36Afbh+W6IcOvqEpCYAWiyp8bywzml4z532EieKRFdvumumu6aRmHyneU
         5U73LELGNVJwjtWv+n2aWW4p11NUNJzCqTbgX9NlDerRldecby5cfbqtI6K99gapB79X
         lrjQuJXWXj9odH+G09X4/3R4W+L4Qiy3MUINZDFPhY3XjIuSwc2csLJR0XKt6lkW96bN
         YsgIA+V0SNQe3Vl6y2+Fl0nKC0SeUfZUxqE8BkuHjl7yJhNZyG6clrHP7pxshbvnConZ
         0JHv1zIuAjxgytHifXbOsw08emaoxl3/s3lgZ4E8tgmlvisajMuryUy3N1o04ma2TEI2
         6iVg==
X-Forwarded-Encrypted: i=1; AJvYcCVm/ww+tSUofjBq3rN+J9FHFZaJeOhWPgo2rUNVpZtmcuG2OuwXt4w5CGi1Iqrk370ZWCJdNAKNzWoA5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmVJZbsw6GiIcAQSalML0BUyMvlNTFRT9GFxpDtkTwUeLrs3SN
	if1V+X23qYSGE2nE7onpFuyiIb5SuWol74M425gwYpLaLQI9Y4pKuMkd3IYXQGmhnvU=
X-Gm-Gg: AY/fxX4rVubjbdSTd1vn6/vrTZaVbC5i+Zipo2HmFpADr0Djsmp+ttns/+9tZ6z+Svb
	b9coBsNqU+7lrQ3LWVJVnGkyl3QSguTrzw9febs36OiWz15woNR6nyjGJjl3S9WTsoCoOOqMO0g
	JtQnt9E+KZO9DDV30MS9z9uJGXUh5n98FqI+Uo+r5ihJvkkk3cHiJy6tvC3nHsjcVmNK7CZUVDQ
	WfG1hCE+BgTMxjV0qhSHRXMP/WVqO7RZyaHu05zCDoRxdHJjk+Si6h0uRLNxIC7CCkJcZc4norc
	6q3Yz8XOTuX00BX+Hx34KuPqpu2r/Q3bytdgk/jggQQfuTj7Mb/UAvoxXTQQgXXzp44lZiP89WP
	FzeOrx8lgLKCEcLWFtOC8sONiYXmikUZb1kWr1zcSaeuiuySmToEhZLU6O12sgmlW23RycKuW2i
	j8i8pAXa7b/MU1MYe5MPt3cUa23Pv7+DYjnjWtvkE4gGTC
X-Google-Smtp-Source: AGHT+IGq1tjZWtQhKRKbnMgnlKR2obxbHUXs706wZEaM0LNbNkdcq+HNiaw0vmfCMXTy97ide8fzgQ==
X-Received: by 2002:a05:6a20:6a20:b0:320:3da8:34d7 with SMTP id adf61e73a8af0-369adebe03amr13055886637.22.1765849696602;
        Mon, 15 Dec 2025 17:48:16 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2c963b53sm13632790a12.36.2025.12.15.17.48.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Dec 2025 17:48:16 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andii@kernel.org,
	andybnac@gmail.com,
	apatel@ventanamicro.com,
	ast@kernel.org,
	ben.dooks@codethink.co.uk,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	charlie@rivosinc.com,
	cl@gentwo.org,
	conor.dooley@microchip.com,
	cuiyunhui@bytedance.com,
	cyrilbur@tenstorrent.com,
	daniel@iogearbox.net,
	debug@rivosinc.com,
	dennis@kernel.org,
	eddyz87@gmail.com,
	haoluo@google.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk,
	martin.lau@linux.dev,
	palmer@dabbelt.com,
	pjw@kernel.org,
	puranjay@kernel.org,
	pulehui@huawei.com,
	ruanjinjie@huawei.com,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	sdf@fomichev.me,
	song@kernel.org,
	tglx@linutronix.de,
	tj@kernel.org,
	thuth@redhat.com,
	yonghong.song@linux.dev,
	yury.norov@gmail.com,
	zong.li@sifive.com
Subject: [PATCH v3 3/3] riscv: store percpu offset into thread_info
Date: Tue, 16 Dec 2025 09:47:21 +0800
Message-Id: <20251216014721.42262-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251216014721.42262-1-cuiyunhui@bytedance.com>
References: <20251216014721.42262-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_174817_760178_3CE0B55B 
X-CRM114-Status: GOOD (  16.44  )
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

T3JpZ2luYWxseSB3ZSBwbGFubmVkIHRvIGFkZCBhIHJlZ2lzdGVyIGZvciB0aGUgcGVyY3B1IG9m
ZnNldCwKd2hpY2ggd291bGQgc3BlZWQgdXAgcGVyY3B1IHZhcmlhYmxlIFIvVyBhbmQgcmVkdWNl
IGFjY2VzcwppbnN0cnVjdGlvbnMuIEFmdGVyIGRpc2N1c3Npb24gWzFdLCBpdOKAmXMgbm93IHN0
b3JlZCBpbiB0aHJlYWRfaW5mby4KClsxXSBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gt
cHJpdmlsZWdlZC90b3BpYy9yaXNjX3ZfdGVjaF9hcmNoX3Jldmlldy8xMTM0Mzc1NTM/cGFnZT0y
CgpTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS5oICAgICAgICAgfCA2ICstLS0tLQogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZXJjcHUuaCAgICAgIHwgNCArKysrCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3N3aXRjaF90by5oICAgfCA4ICsrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3RocmVhZF9pbmZvLmggfCA1ICsrKy0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5j
ICAgICAgfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyAgICAgICAgICB8IDcgKysr
KysrKwogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyAgICAgIHwgOSArLS0tLS0tLS0K
IDcgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vYXNtLmgKaW5kZXggZTllOGJhODNlNjMyZi4uMTM3YTQ5NDg4MzI1ZSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2FzbS5oCkBAIC05MSwxMSArOTEsNyBAQAogCiAjaWZkZWYgQ09ORklHX1NNUAogLm1hY3Jv
IGFzbV9wZXJfY3B1IGRzdCBzeW0gdG1wCi0JbHcgICAgXHRtcCwgVEFTS19USV9DUFVfTlVNKHRw
KQotCXNsbGkgIFx0bXAsIFx0bXAsIFJJU0NWX0xHUFRSCi0JbGEgICAgXGRzdCwgX19wZXJfY3B1
X29mZnNldAotCWFkZCAgIFxkc3QsIFxkc3QsIFx0bXAKLQlSRUdfTCBcdG1wLCAwKFxkc3QpCisJ
UkVHX0wgXHRtcCwgVEFTS19USV9QQ1BVX09GRlNFVCh0cCkKIAlsYSAgICBcZHN0LCBcc3ltCiAJ
YWRkICAgXGRzdCwgXGRzdCwgXHRtcAogLmVuZG0KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGVyY3B1LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BlcmNwdS5oCmluZGV4
IGM1YmFjZjZkODY0ZWUuLjM1YTYzNDIwYTc2YTQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGVyY3B1LmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZXJjcHUuaApA
QCAtNyw3ICs3LDkgQEAKIAogI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS1tYWNyb3MuaD4KICNp
bmNsdWRlIDxhc20vY3B1ZmVhdHVyZS1tYWNyb3MuaD4KKyNpbmNsdWRlIDxhc20vY3VycmVudC5o
PgogI2luY2x1ZGUgPGFzbS9od2NhcC5oPgorI2luY2x1ZGUgPGFzbS90aHJlYWRfaW5mby5oPgog
CiAjZGVmaW5lIFBFUkNQVV9SV19PUFMoc3opCQkJCQkJXAogc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBsb25nIF9fcGVyY3B1X3JlYWRfIyNzeih2b2lkICpwdHIpCQlcCkBAIC0yMzksNiArMjQxLDgg
QEAgX3BjcF9wcm90ZWN0X3JldHVybihfX3BlcmNwdV9hZGRfcmV0dXJuX2Ftb19jYXNlXzY0LCBw
Y3AsIHZhbCkKIH0pCiAjZW5kaWYKIAorI2RlZmluZSBfX215X2NwdV9vZmZzZXQgKCgoc3RydWN0
IHRocmVhZF9pbmZvICopY3VycmVudCktPnBjcHVfb2Zmc2V0KQorCiAjaW5jbHVkZSA8YXNtLWdl
bmVyaWMvcGVyY3B1Lmg+CiAKICNlbmRpZiAvKiBfX0FTTV9QRVJDUFVfSCAqLwpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc3dpdGNoX3RvLmgKaW5kZXggMGU3MWViODJmOTIwYy4uNzMzYjZjZDMwNmU0MCAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaAorKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3N3aXRjaF90by5oCkBAIC04OCw2ICs4OCwxMyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgX19zd2l0Y2hfdG9fZW52Y2ZnKHN0cnVjdCB0YXNrX3N0cnVjdCAqbmV4dCkKIAkJ
CTo6ICJyIiAobmV4dC0+dGhyZWFkLmVudmNmZykgOiAibWVtb3J5Iik7CiB9CiAKK3N0YXRpYyBp
bmxpbmUgdm9pZCBfX3N3aXRjaF90b19wY3B1X29mZnNldChzdHJ1Y3QgdGFza19zdHJ1Y3QgKm5l
eHQpCit7CisjaWZkZWYgQ09ORklHX1NNUAorCW5leHQtPnRocmVhZF9pbmZvLnBjcHVfb2Zmc2V0
ID0gX19teV9jcHVfb2Zmc2V0OworI2VuZGlmCit9CisKIGV4dGVybiBzdHJ1Y3QgdGFza19zdHJ1
Y3QgKl9fc3dpdGNoX3RvKHN0cnVjdCB0YXNrX3N0cnVjdCAqLAogCQkJCSAgICAgICBzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKik7CiAKQEAgLTEyMiw2ICsxMjksNyBAQCBkbyB7CQkJCQkJCVwKIAlpZiAo
c3dpdGNoX3RvX3Nob3VsZF9mbHVzaF9pY2FjaGUoX19uZXh0KSkJXAogCQlsb2NhbF9mbHVzaF9p
Y2FjaGVfYWxsKCk7CQlcCiAJX19zd2l0Y2hfdG9fZW52Y2ZnKF9fbmV4dCk7CQkJXAorCV9fc3dp
dGNoX3RvX3BjcHVfb2Zmc2V0KF9fbmV4dCk7CQlcCiAJKChsYXN0KSA9IF9fc3dpdGNoX3RvKF9f
cHJldiwgX19uZXh0KSk7CQlcCiB9IHdoaWxlICgwKQogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVh
ZF9pbmZvLmgKaW5kZXggMzY5MThjOTIwMGM5Mi4uOGQ3ZDQzY2M5YzQwNSAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdGhyZWFkX2luZm8uaApAQCAtNTIsNyArNTIsOCBAQAogICovCiBzdHJ1Y3QgdGhy
ZWFkX2luZm8gewogCXVuc2lnbmVkIGxvbmcJCWZsYWdzOwkJLyogbG93IGxldmVsIGZsYWdzICov
Ci0JaW50ICAgICAgICAgICAgICAgICAgICAgcHJlZW1wdF9jb3VudDsgIC8qIDA9PnByZWVtcHRp
YmxlLCA8MD0+QlVHICovCisJaW50CQkJcHJlZW1wdF9jb3VudDsJLyogMD0+cHJlZW1wdGlibGUs
IDwwPT5CVUcgKi8KKwlpbnQJCQljcHU7CiAJLyoKIAkgKiBUaGVzZSBzdGFjayBwb2ludGVycyBh
cmUgb3ZlcndyaXR0ZW4gb24gZXZlcnkgc3lzdGVtIGNhbGwgb3IKIAkgKiBleGNlcHRpb24uICBT
UCBpcyBhbHNvIHNhdmVkIHRvIHRoZSBzdGFjayBpdCBjYW4gYmUgcmVjb3ZlcmVkIHdoZW4KQEAg
LTYwLDggKzYxLDggQEAgc3RydWN0IHRocmVhZF9pbmZvIHsKIAkgKi8KIAlsb25nCQkJa2VybmVs
X3NwOwkvKiBLZXJuZWwgc3RhY2sgcG9pbnRlciAqLwogCWxvbmcJCQl1c2VyX3NwOwkvKiBVc2Vy
IHN0YWNrIHBvaW50ZXIgKi8KLQlpbnQJCQljcHU7CiAJdW5zaWduZWQgbG9uZwkJc3lzY2FsbF93
b3JrOwkvKiBTWVNDQUxMX1dPUktfIGZsYWdzICovCisJdW5zaWduZWQgbG9uZwkJcGNwdV9vZmZz
ZXQ7CiAjaWZkZWYgQ09ORklHX1NIQURPV19DQUxMX1NUQUNLCiAJdm9pZAkJCSpzY3NfYmFzZTsK
IAl2b2lkCQkJKnNjc19zcDsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZz
ZXRzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jCmluZGV4IGFmODI3NDQ4YTYw
OWUuLmZiZjUzYjY2YjBlMDYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZz
ZXRzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwpAQCAtMzgsNiArMzgs
NyBAQCB2b2lkIGFzbV9vZmZzZXRzKHZvaWQpCiAJT0ZGU0VUKFRBU0tfVEhSRUFEX1NVTSwgdGFz
a19zdHJ1Y3QsIHRocmVhZC5zdW0pOwogCiAJT0ZGU0VUKFRBU0tfVElfQ1BVLCB0YXNrX3N0cnVj
dCwgdGhyZWFkX2luZm8uY3B1KTsKKwlPRkZTRVQoVEFTS19USV9QQ1BVX09GRlNFVCwgdGFza19z
dHJ1Y3QsIHRocmVhZF9pbmZvLnBjcHVfb2Zmc2V0KTsKIAlPRkZTRVQoVEFTS19USV9QUkVFTVBU
X0NPVU5ULCB0YXNrX3N0cnVjdCwgdGhyZWFkX2luZm8ucHJlZW1wdF9jb3VudCk7CiAJT0ZGU0VU
KFRBU0tfVElfS0VSTkVMX1NQLCB0YXNrX3N0cnVjdCwgdGhyZWFkX2luZm8ua2VybmVsX3NwKTsK
IAlPRkZTRVQoVEFTS19USV9VU0VSX1NQLCB0YXNrX3N0cnVjdCwgdGhyZWFkX2luZm8udXNlcl9z
cCk7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zbXBib290LmMKaW5kZXggZDg1OTE2YTM2NjBjMy4uOWU5NWMwNjhiOTY2YiAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCisrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3NtcGJvb3QuYwpAQCAtMjA5LDYgKzIwOSwxMSBAQCBpbnQgX19jcHVfdXAodW5zaWduZWQg
aW50IGNwdSwgc3RydWN0IHRhc2tfc3RydWN0ICp0aWRsZSkKIH0KICNlbmRpZgogCit2b2lkIF9f
aW5pdCBzbXBfcHJlcGFyZV9ib290X2NwdSh2b2lkKQoreworCV9fbXlfY3B1X29mZnNldCA9IHBl
cl9jcHVfb2Zmc2V0KHNtcF9wcm9jZXNzb3JfaWQoKSk7Cit9CisKIHZvaWQgX19pbml0IHNtcF9j
cHVzX2RvbmUodW5zaWduZWQgaW50IG1heF9jcHVzKQogewogfQpAQCAtMjM0LDYgKzIzOSw4IEBA
IGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgc21wX2NhbGxpbih2b2lkKQogCW1tZ3JhYihtbSk7
CiAJY3VycmVudC0+YWN0aXZlX21tID0gbW07CiAKKwlfX215X2NwdV9vZmZzZXQgPSBwZXJfY3B1
X29mZnNldChzbXBfcHJvY2Vzc29yX2lkKCkpOworCiAjaWZkZWYgQ09ORklHX0hPVFBMVUdfUEFS
QUxMRUwKIAljcHVocF9hcF9zeW5jX2FsaXZlKCk7CiAjZW5kaWYKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2
NC5jCmluZGV4IDVmOTQ1N2U5MTBlODcuLjRhNDkyYTZhMWNjMWUgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b21wNjQuYwpAQCAtMTM0NSwxNSArMTM0NSw4IEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25z
dCBzdHJ1Y3QgYnBmX2luc24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAogCQkJ
aWYgKHJkICE9IHJzKQogCQkJCWVtaXRfbXYocmQsIHJzLCBjdHgpOwogI2lmZGVmIENPTkZJR19T
TVAKLQkJCS8qIExvYWQgY3VycmVudCBDUFUgbnVtYmVyIGluIFQxICovCi0JCQllbWl0X2x3KFJW
X1JFR19UMSwgb2Zmc2V0b2Yoc3RydWN0IHRocmVhZF9pbmZvLCBjcHUpLAorCQkJZW1pdF9sdyhS
Vl9SRUdfVDEsIG9mZnNldG9mKHN0cnVjdCB0aHJlYWRfaW5mbywgcGNwdV9vZmZzZXQpLAogCQkJ
CVJWX1JFR19UUCwgY3R4KTsKLQkJCS8qIExvYWQgYWRkcmVzcyBvZiBfX3Blcl9jcHVfb2Zmc2V0
IGFycmF5IGluIFQyICovCi0JCQllbWl0X2FkZHIoUlZfUkVHX1QyLCAodTY0KSZfX3Blcl9jcHVf
b2Zmc2V0LCBleHRyYV9wYXNzLCBjdHgpOwotCQkJLyogR2V0IGFkZHJlc3Mgb2YgX19wZXJfY3B1
X29mZnNldFtjcHVdIGluIFQxICovCi0JCQllbWl0X3NoM2FkZChSVl9SRUdfVDEsIFJWX1JFR19U
MSwgUlZfUkVHX1QyLCBjdHgpOwotCQkJLyogTG9hZCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV0gaW4g
VDEgKi8KLQkJCWVtaXRfbGQoUlZfUkVHX1QxLCAwLCBSVl9SRUdfVDEsIGN0eCk7CiAJCQkvKiBB
ZGQgdGhlIG9mZnNldCB0byBSZCAqLwogCQkJZW1pdF9hZGQocmQsIHJkLCBSVl9SRUdfVDEsIGN0
eCk7CiAjZW5kaWYKLS0gCjIuMzkuNQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
