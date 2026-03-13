Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353C4107BCCD
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8qxa4pL4LbUTkptRsOeBryYtxxKmIXSEQeeCiX9MGQk=; b=B/xDxtLPcD3apA
	ahp8pLzJ+VqF5FbKi0z2vEkO7zteVs7f/5Om71HymTpeHD8RrAXpMQ3HDvXKMwhIO2dks3YevWKS+
	piW6LVRLt0eGlUSZiqtSdgKFSB7sUIKQ681Uh6eT15XMv2o9SJwK72XmV8TapaNTnzLVAQZm7oPiw
	GQCjXAvOE2fVOUSu0KBhenHInJZaVhOjg161u41k2XkwJe5gy29wxmRbedN4CG811XaCZAXT97Dva
	PmJoIs+L1P6S0F8rlOcb7kSSqv6x5mdhCoUSQ2S1oIhVs6JbLfS5AEzYKgkNEiPq8TwweE9lvviaO
	Xm0sUJ2JnG1rUt8XS+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Ys-00000000fMG-3QsV;
	Fri, 13 Mar 2026 16:40:30 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Yp-00000000fLs-2IEM
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 16:40:29 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso21850615e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 09:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773420025; x=1774024825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSO6SwB96Ac5IwDQDP8ot+lTMTygSHJiKPac08bxEfw=;
        b=lkYJ2+1zXp0Ac9h5IHub2QAAkOtfWRRuVGHLdZnp2qJpKGotXpKLMyfW4jgGr6aASs
         uEnV2KWqjA1jowC8QcZLyRM9AIf1TIfq+3BxNg1Ehg3ntlXsqbCqFcZx4IYFKAVabpJq
         jN7R3S5yxzhGgV4xLqtexjVnzXoWCZhcFC42kBXPO1gHc8IMAv7HCfxjfex4FfdmMdvE
         RWol0yPvpnnV5MnfQwJ5JRzQD2IuhvceeHzJjMdE/R2Mw1h5bPAWnq64JhyncGYGAsyn
         oNS0Cit/xIO/XZn90oIbnpfhTfD3hnNFu4z57Ffq+r9exw+gfQki/IBMS8g69DbtW77c
         5T/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420025; x=1774024825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSO6SwB96Ac5IwDQDP8ot+lTMTygSHJiKPac08bxEfw=;
        b=J7+OPGzULWdbvSv7+tT3RzJEJ8X9H/1p9Q+ndpG3d2S3qFzFG9bCxpmUimdrodnavx
         2cnNxrdAG9172CF9iTK4hvw+n0/icD8bs+xq3d1+YXzJvuobb99Iz6LlwIwIabn0bl07
         A/PTANngIU/hhgDs9svXefWhTV6hPULBPV51mM9ADxMIMbSniGnwpCyvPYcn1Y569bm8
         dopuijcobkpKYmk+vg0RfGpsV7pXDhG2MkkiyTEW7fCUctxzgp2xccvHx4OknRFAk0zt
         PHZ1MtH+yhUKfTrCrxm1tCvrltPuvsm3hrlNxdcMn5uwXKawRILc13Aw7a0Tg5MOtBCq
         52AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdv8ute1HoIgGHdMCCJw6B0+t59PhXFSZnpdsb/vyQqU7CYkGuZC5ax27Ze1H+Cw83llCCrKGc7TMSmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGD/wBGVx4OHACi1aqBGduC25/H2qQvQUarusYrqKgsRD5XuXK
	fN6uwHrEm++qiLLnB6h4hlKHm8BccI+HafmYv8Jg8nGZNdlK8xHR9lEY5KElPg8LG0Y=
X-Gm-Gg: ATEYQzyKkgdKQWetZGnh+VCNxoi7LOqZqztNFkQkBdYn7NporzIcKYIfIV5y6cknQyu
	oaumX8RMnYZz/MpgTHNwKp4g1nCSarDXkpD8/u00PIfwGxMxZwbTYzzFil8b9GEcOPbVzSHqYkR
	TuaiyEQpMEpr8kKpBfwiQ9JVd4iTinH5Xf5PJntQnAZpIm2VVQ45uQfE9HhsyvhgS0wLlJ2+S1W
	kBTv5V9Bl1S8fLZ9vwJH1Yu+sAnTmMt25j8TsKrAzzRISJaL/RQYbLKQ2V58VsuYktWRFb2Xsmv
	ooRoKT8wIhfPs0t1TlX9oNvSwq1uLo/UoEuhcAcDaet198qUzw+VGIZSUW/6RxXwc4Js1Vf1X5p
	YvlEstv8bDZItBM/mB47inFGvKOUi5TLMkH34Q8Rre6Q6nKnoHqiwKcGiIsZt9dI3e8x5rbvJV2
	HlNiJCsyxvQEC00v5Fxd1sAn8aPJW3L+TOk6gXji7GWv1IMZ6qR0FrheRYgsLz0Urs0GsRjS1Fd
	a7tpHnqHm5dCyg=
X-Received: by 2002:a05:600c:3b10:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-485566db72dmr63069585e9.15.1773420024694;
        Fri, 13 Mar 2026 09:40:24 -0700 (PDT)
Received: from localhost (p200300f65f20eb04e38cb340bbc8706d.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:e38c:b340:bbc8:706d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4854e2537c3sm216123695e9.15.2026.03.13.09.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:40:24 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Simplify assignment for UTS_MACHINE
Date: Fri, 13 Mar 2026 17:40:11 +0100
Message-ID: <20260313164012.1153936-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1445; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ZoGHkQlgAjK47do0+1C/tkk6DnnvskM6xoflpZA8R74=; b=owGbwMvMwMXY3/A7olbonx/jabUkhswttm8uPNVe8dvjul3Bl8JjMxab2IX55DwPT969S0Pzb Xif7vaYTkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAmcuc6B8MKm44PRlYVJ2an z0qYE2QZ8dPG/9WNgFi5VW3ePsZJp7TDFr9bKxxZ2q6a2BkVLObBeSiwZ1uvjeuZ6U9mHbvXKLW 0xvFZTGlf1+XSFUzWrCkttkdvyWsXnKzbonYpcLWuS86BCXrfrzuyWKn4GEdNPLZ0xon/6mVn5O YVaezWY9QKyt9kVbXn0Axj/wlKUQ8cIy/dSHvC6tM2fc+SBZGF8455+XHVH9XzE8tRmc0i6JE6x f90llPv7aMVvnsbteozthaVNwusl/pS7PTw34Ou1plfP5yecb0q4Lhz44RZ/1s0Q3Qk71rxS7a9 OG2jc83dWXTnruQ6Nv4Ja15wlD+N2mtxa1WLfXaK/eb/AA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_094027_708326_13F65B6A 
X-CRM114-Status: UNSURE (   9.54  )
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

VGhlIEJJVFMgdmFyaWFibGUgY29udmVuaWVudGx5IGFsbG93cyB0byBzaW1wbGlmeSB0aGUgYXNz
aWdubWVudCBmb3IKVVRTX01BQ0hJTkUuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5p
ZyAoVGhlIENhcGFibGUgSHViKSA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCkhl
bGxvLAoKSSBmb3VuZCB0aGF0IHdoaWxlIHdvcmtpbmcgb24gYSByaXNjdiBleHRlbnNpb24gdGhh
dCAocHJvYmFibHkpIHdpbGwKcmVxdWlyZSB0byBhZGQgYW5vdGhlciBzdWZmaXggdG8gVVRTX01B
Q0hJTkUuIEZvciBub3cgdGhpcyBwYXRjaCBvbmx5CnNhdmVzIGEgbGluZSwgYnV0IGNvbmRpdGlv
bmFsbHkgYXBwZW5kaW5nIGFub3RoZXIgc3RyaW5nIHRoaXMgaXMgdmVyeQpjb252ZW5pZW50LiBC
dXQgYWxzbyB3aXRob3V0IHRoaXMgbW90aXZhdGlvbiwgSSBjb25zaWRlciB0aGlzIGEgbmljZQps
aXR0bGUgY2xlYW51cC4KCkJlc3QgcmVnYXJkcwpVd2UKCiBhcmNoL3Jpc2N2L01ha2VmaWxlIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCmlu
ZGV4IDM3MWRhNzVhNDdmOS4uODcxMDIzMTQxMDNjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L01h
a2VmaWxlCisrKyBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKQEAgLTI4LDcgKzI4LDYgQEAgZW5kaWYK
IGV4cG9ydCBCSVRTCiBpZmVxICgkKENPTkZJR19BUkNIX1JWNjRJKSx5KQogCUJJVFMgOj0gNjQK
LQlVVFNfTUFDSElORSA6PSByaXNjdjY0CiAKIAlLQlVJTERfQ0ZMQUdTICs9IC1tYWJpPWxwNjQK
IAlLQlVJTERfQUZMQUdTICs9IC1tYWJpPWxwNjQKQEAgLTM5LDEzICszOCwxNCBAQCBpZmVxICgk
KENPTkZJR19BUkNIX1JWNjRJKSx5KQogCQkJICAgIC1Dbm8tcmVkem9uZQogZWxzZQogCUJJVFMg
Oj0gMzIKLQlVVFNfTUFDSElORSA6PSByaXNjdjMyCiAKIAlLQlVJTERfQ0ZMQUdTICs9IC1tYWJp
PWlscDMyCiAJS0JVSUxEX0FGTEFHUyArPSAtbWFiaT1pbHAzMgogCUtCVUlMRF9MREZMQUdTICs9
IC1tZWxmMzJscmlzY3YKIGVuZGlmCiAKK1VUU19NQUNISU5FIDo9IHJpc2N2JChCSVRTKQorCiAj
IExMVk0gaGFzIGFuIGlzc3VlIHdpdGggdGFyZ2V0LWZlYXR1cmVzIGFuZCBMVE86IGh0dHBzOi8v
Z2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9pc3N1ZXMvNTkzNTAKICMgRW5zdXJlIGl0IGlz
IGF3YXJlIG9mIGxpbmtlciByZWxheGF0aW9uIHdpdGggTFRPLCBvdGhlcndpc2UgcmVsb2NhdGlv
bnMgbWF5CiAjIGJlIGluY29ycmVjdDogaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9q
ZWN0L2lzc3Vlcy82NTA5MAotLSAKMi40Ny4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
