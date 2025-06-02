Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9207EC5B555
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 20:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S7+PI8wqqJbYkgKmWUc2W/V/tVqFYQ+W+wuDtTkIImQ=; b=f4rn0Dyc9rzKGh
	413SYg0U46NJkST6QaEx7myWlACKdzp4R01W0OMN717sjOii6pmQ2X12pOHxTzYoY3OrCHhODF/WQ
	DX3/2OtJuBQ7kpndAOfT/ccETGvBXBQuieNvF5Fk1sysTS+0c08/bHCk+5nKmw0oP+pQhBEnCVxb8
	fnX0AP7vm7gVFHme4qBaL90PgpteFLGYKERafKvDLtgt9s4pxts3IVhHMMtjH7aM/ztOf6UeMBnXf
	dhdgD5l/+T6ZU6s2ut+R+DgJl9HB+UqtLnBKdgXAS+T9tI4jBkccwp6YajliAgpDB+YTkBhWhKnra
	AT1Sj1xzDwtDE5dkxrKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBVx-00000008gyp-1jHo;
	Mon, 02 Jun 2025 20:12:09 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMB57-00000008ZcF-0FBb
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 19:44:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-234c5b57557so42665335ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 12:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748893464; x=1749498264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEp6s4mJMfBcwAEqOMhM3Y5rF5BuKFrDXF+odKAiT60=;
        b=G2VJxpPwzHEk9YjtMeGPg/p5GXoF8JJk4+68t9trCoVOZgJkJaVh8fxlrVZ0cQRF/v
         O611EUUoF0NzxQlSiKLWOsrkyd3DqhaFRz9S0/OLv5I7f9Qyg0eYOSu3hpGpxgDH6LEu
         4FhC4my43sUz3AVZ14nNUo49yUsLUiHk3SSEuU5w15PQ3Xezqfs/OSH76EkvQXcpp3uc
         YfFxi1vROL0hTSngLPl22jSB5yg3mFxXZ/rvbiirdwMiTriau4S+0qMjD5/J8ogBBWZd
         iCBSa/axWGkK1wXL83XO6p+b9Sopj2bEfDbKhY5P6JOGVKnjk+vS2m57JP+rkJWQMlCC
         xrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748893464; x=1749498264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEp6s4mJMfBcwAEqOMhM3Y5rF5BuKFrDXF+odKAiT60=;
        b=RgDkY463YdBaBP1+u6rRoQyo2zyBkaJZLMDJbawfLzMg27fskDw5/Gr/1Ed8QAxRZV
         2/j+UuHmMjKpO/qvflXLzr1oqCZNBXDpaOsbEShc3RIByfVf+EMaLR+wKT5hpuUCY8Jf
         2ZF0ea76rPPBXnqGgt6wyPD1259u0L7QSOLhDFqprL0qB3M1+CDEzlyUXgzw1llK4gMd
         9Qc3raaO487V2dH0RKdrdZkSnHr983RgDnUY/K2S3Sn/5DJUiqexqi+A6p5vWmkvFNNl
         2j97tlxagBbAVx3bIiMkh7vH/Iaphps4+uIOC8wM1P4l6rS5Diwy2A+YQpv0TM3MlJdT
         lRYA==
X-Gm-Message-State: AOJu0Yw3Ulzt9L3tcQXS0bnii28FTprgfmBfbPkDbwj6BuPpHYfd/0S2
	bng9Cw4Gs1zQ92UzuDIJZ7lPiPg5L5RjsrpsHt/QgjWVxoiOho3XxkB28XfWuWTkB8h9nJigm1J
	0uGU0Y9k=
X-Gm-Gg: ASbGnctHiVow/cZ3swupWVtZj8L4vVo0Ue/gWMGJcYH3xU0OV0BcYhObL1RssEt3/Eh
	PF1cbBA2c4dFVcZaH1u3dhuBhFBs5c/dKNi4F0/vEA9wUmV9oq2hxnj4/nQlTRpZofmokb02K6p
	A6vvnuOO6HP8ffnSjZFnho2TnLGzhbxxdncL2s6G2GbZQMwS4eCg/UUPeBpB7CTGotCb9S2UlC/
	PAiXQ9OJ8+mstcOrCRNetu5C7bs5+SZt5zRB3ONrSHY70t1DXBN+TaaomacVpY/FBM2HNBAzLSV
	cArjynVo7y49pzOSVmxQ+K0pImwJ53In3KRhkZIjWd/S56/Zz1jmjZ11999HCUs=
X-Google-Smtp-Source: AGHT+IGD2HqrpkV1OTN2wI4y4q9I/M/RJTvbZGxdiPyPOVpVJFsIw9woqbqaTfcw13MkY7ZaQohTCw==
X-Received: by 2002:a17:902:e5c4:b0:234:9670:cc73 with SMTP id d9443c01a7336-2353942405bmr202413845ad.5.1748893463876;
        Mon, 02 Jun 2025 12:44:23 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd974asm74589615ad.97.2025.06.02.12.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 12:44:23 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2 0/3] riscv: misaligned: fix misaligned accesses handling in put/get_user()
Date: Mon,  2 Jun 2025 21:39:13 +0200
Message-ID: <20250602193918.868962-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_124425_166474_B16D9C50 
X-CRM114-Status: GOOD (  12.55  )
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

V2hpbGUgZGVidWdnaW5nIGEgZmV3IHByb2JsZW1zIHdpdGggdGhlIG1pc2FsaWduZWQgYWNjZXNz
IGtzZWxmdGVzdCwKQWxleGFuZHJlIGRpc2NvdmVyZWQgc29tZSBjcmFzaCB3aXRoIHRoZSBjdXJy
ZW50IGNvZGUuIEluZGVlZCwgc29tZQptaXNhbGlnbmVkIGFjY2VzcyB3YXMgZG9uZSBieSB0aGUg
a2VybmVsIHVzaW5nIHB1dF91c2VyKCkuIFRoaXMKd2FzIHJlc3VsdGluZyBpbiB0cmFwIGFuZCBh
IGtlcm5lbCBjcmFzaCBzaW5jZS4gVGhlIHBhdGggd2FzIHRoZQpmb2xsb3dpbmc6CnVzZXIgLT4g
a2VybmVsIC0+IGFjY2VzcyB0byB1c2VyIG1lbW9yeSAtPiBtaXNhbGlnbmVkIHRyYXAgLT4gdHJh
cCAtPgprZXJuZWwgLT4gbWlzYWxpZ25lZCBoYW5kbGluZyAtPiBtZW1jcHkgLT4gY3Jhc2ggZHVl
IHRvIGZhaWxlZCBwYWdlIGZhdWx0CndoaWxlIGluIGludGVycnVwdCBkaXNhYmxlZCBzZWN0aW9u
LgoKTGFzdCBkaXNjdXNzaW9uIGFib3V0IGtlcm5lbCBtaXNhbGlnbmVkIGhhbmRsaW5nIGFuZCBp
bnRlcnJ1cHQgcmVlbmFibGluZwp3ZXJlIGFjdHVhbGx5IG5vdCB0byByZWVuYWJsZSBpbnRlcnJ1
cHQgd2hlbiBoYW5kbGluZyBtaXNhbGlnbmVkIGFjY2VzcwpiZWluZyBkb25lIGJ5IGtlcm5lbC4g
VGhlIGJlc3Qgc29sdXRpb24gYmVpbmcgbm90IHRvIGRvIGFueSBtaXNhbGlnbmVkCmFjY2Vzc2Vz
IHRvIHVzZXJzcGFjZSBtZW1vcnksIHdlIGNvbnNpZGVyZWQgYSBmZXcgb3B0aW9uczoKCi0gUmVt
b3ZlIGFueSBjYWxsIHRvIHB1dC9nZXRfdXNlcigpIHBvdGVudGlhbGx5IGRvaW5nIG1pc2FsaWdu
ZWQKICBhY2Nlc3NlcwotIERvIG5vdCBkbyBhbnkgbWlzYWxpZ25lZCBhY2Nlc3NlcyBpbiBwdXQv
Z2V0X3VzZXIoKSBpdHNlbGYKClRoZSBzZWNvbmQgc29sdXRpb24gd2FzIHRoZSBvbmUgY2hvc2Vu
IGFzIHRoZXJlIGFyZSB0b28gbWFueSBjYWxsc2l0ZXMgdG8KcHV0L2dldF91c2VyKCkgdGhhdCBj
b3VsZCBwb3RlbnRpYWxseSBkbyBtaXNhbGlnbmVkIGFjY2Vzc2VzLiBXZSB0cmllZAp0d28gYXBw
cm9hY2hlcyBmb3IgdGhhdCwgZWl0aGVyIHNwbGl0IGFjY2VzcyBpbiB0d28gYWxpZ25lZCBhY2Nl
c3NlcwooYW5kIGRvIFJNVyBmb3IgcHV0X3VzZXIoKSkgb3IgY2FsbCBjb3B5X2Zyb20vdG9fdXNl
cigpIHdoaWNoIGRvZXMgbm90CmRvIGFueSBtaXNhbGlnbmVkIGFjY2Vzc2VzLiBUaGUgbGF0ZXIg
b25lIHdhcyB0aGUgc2ltcGxlciB0byBpbXBsZW1lbnQKKGFsdGhvdWdoIHRoZSBwZXJmb3JtYW5j
ZXMgYXJlIHByb2JhYmx5IGxvd2VyIHRoYW4gc3BsaXQgYWxpZ25lZAphY2Nlc3NlcyBidXQgc3Rp
bGwgd2F5IGJldHRlciB0aGFuIGRvaW5nIG1pc2FsaWduZWQgYWNjZXNzIGVtdWxhdGlvbikKYW5k
IGFsbG93cyB0byBzdXBwb3J0IHdoYXQgd2Ugd2FudGVkLgoKVGhlc2UgY29tbWl0cyBhcmUgYmFz
ZWQgb24gdG9wIG9mIEFsZXggZGV2L2FsZXgvZ2V0X3VzZXJfbWlzYWxpZ25lZF92MQpicmFuY2gu
CgotLS0KdjI6CiAtIFVzZSBfX2ludHR5cGUgaW5zdGVhZCBvZiB1bnNpZ25lZCBsb25nIGZvciBw
b2ludGVyIGNhc3QKIC0gQWRkIEFsZXggcGF0Y2ggdG8gbWFrZSB1bnNhZmUgZnVuYyB1c2UgZXhp
c3RpbmcgYXNzZW1ibHkuCiAgIC0gQWRkIG1pc3NpbmcgRVhQT1JUX1NZTUJPTChfX2FzbV9jb3B5
X3RvX3VzZXJfc3VtX2VuYWJsZWQpCgpBbGV4YW5kcmUgR2hpdGkgKDEpOgogIHJpc2N2OiBtYWtl
IHVuc2FmZSB1c2VyIGNvcHkgcm91dGluZXMgdXNlIGV4aXN0aW5nIGFzc2VtYmx5IHJvdXRpbmVz
CgpDbMOpbWVudCBMw6lnZXIgKDIpOgogIHJpc2N2OiBwcm9jZXNzOiB1c2UgdW5zaWduZWQgaW50
IGluc3RlYWQgb2YgdW5zaWduZWQgbG9uZyBmb3IKICAgIHB1dF91c2VyKCkKICByaXNjdjogdWFj
Y2VzczogZG8gbm90IGRvIG1pc2FsaWduZWQgYWNjZXNzZXMgaW4gZ2V0L3B1dF91c2VyKCkKCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmggfCAgMiArLQogYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS91YWNjZXNzLmggICAgICAgIHwgNDggKysrKysrKysrKystLS0tLS0tLS0t
LS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgICAgICAgICAgICAgfCAgMiArLQogYXJj
aC9yaXNjdi9saWIvcmlzY3Zfdl9oZWxwZXJzLmMgICAgICAgIHwgMTEgKysrKy0tCiBhcmNoL3Jp
c2N2L2xpYi91YWNjZXNzLlMgICAgICAgICAgICAgICAgfCA1MCArKysrKysrKysrKysrKysrKy0t
LS0tLS0tCiBhcmNoL3Jpc2N2L2xpYi91YWNjZXNzX3ZlY3Rvci5TICAgICAgICAgfCAxNSArKysr
KystLQogNiBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspLCA1MCBkZWxldGlvbnMoLSkK
Ci0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
