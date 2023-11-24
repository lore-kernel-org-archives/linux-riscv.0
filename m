Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE15C636BD
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 07:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTyLoXbxD/AnmQO/erj5nYzqD8fDPyHjJ9DMDH9ZB70=; b=LkoASPPpe4FoHl
	P/CKfzkmoyJZPRQDbBo7wA2kZlKGlR10dFRTwS65gpr1W4weMiHcTb6w1elo9+agPtrJ6/feLoaWe
	g4NA2gqiPaqwV8q6frADC0pnoryOIJPsTvv+lKV+fy4wrvaff4FFHchG1Lk8yzCwxd57FNHT2h4Xo
	aR/j4Sxd+Z1xhIRzjodxv3mcNmtdA7cxn8x0fnjRn/lBznzwU558qU0bR1V8C63nU0YjCGUZX0RIA
	mKIcJdSyj7L/LhQvidS5D5wr8xjN7rOvOt3qms/+arhhKMUbQZsU0CsgCdXMdHkHQezF2L9i5Lug5
	warLZf9Dp2wkFtx+mKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QW0-006NMQ-0b;
	Fri, 24 Nov 2023 07:22:16 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QVw-006NJz-30
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 07:22:14 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a04196fc957so225989566b.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 23:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700810529; x=1701415329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVy1jdSL9+WHb2B8ZDIGvqsG60+7Fk4VQGEPcFy9390=;
        b=JakcnK0joCfaOob1cbjm3dR0ZWPry6qVgBgt+WnB0ZImhv33MUQuf/bZ5JkaE5FRxz
         DD0txYi5sIf9VXd7h6d4E6EJjh05FRWU1Xl6TH+gI8/KA7f/8uwctoYC6qB2yPFBqUab
         SoDmUHIZ2Jpf15Y3nJWTlsz6U963u+GkD7Pr1vG9Z4GDU4FzS8GZXT+ScDAFb9URkBx+
         K9/2YxVDxeD8e6BMBtjnbOvC1N3frPXBFLwb8KIDyZ1Fsc0YDH+VQ7pfbbxBp6TQFwno
         L2CrD/G7OCazOFoaAR9fmaPcESqKBGPh9fBcp9ucpaXuCbxncSYHrsT87P/He+GuFfB5
         bZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700810529; x=1701415329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVy1jdSL9+WHb2B8ZDIGvqsG60+7Fk4VQGEPcFy9390=;
        b=E2+rsfb5SM2XG3Qu02q43+belFhWoQ06Srw+LpYswh4jhLykxHOSoELKGRnQ2HKeiz
         3VLEbO4j0hfuvs4PbIrkUcxEs4oedZ5R58606IBVIc9pJIgQRh5u2u9ImnH2rQFvH9qB
         CdmTtyidlFkeNjo3lzwYW6TywsR525khFIJu5tX5TaV2jyrjkeGRNy5MmZZkMhn7oZp6
         qWuQ9nkXgHmmkwLZab5883fJ2+ciH0/q0XD7A4vDozd7XfVZVFDFSkR5dUAuRj56+0gK
         COPeJhfP4gwo7CxpQaEjJ5a7vCLhVesNsyiAqdTuZZVZUKQHoI+6SLbRhQv0faVvBWdJ
         djTA==
X-Gm-Message-State: AOJu0YxtmM2pvu62sEnrs34/+dZxlaVNKoYxeC3bsdCDlIQgtcrtpOyt
	5potcicwnBLBD/ar0+NTih7qGRCJyUgiedZtJIS/ajw4
X-Google-Smtp-Source: AGHT+IEBJIwqDHkFD4oZPvK9TF0KkUAPOFtohVZ/l5fTiA2CidjiZcnxjtG0jzodZ6Xfjt7CfSnlmA==
X-Received: by 2002:a17:906:20d7:b0:9be:40ba:5f1 with SMTP id c23-20020a17090620d700b009be40ba05f1mr1349531ejc.60.1700810528651;
        Thu, 23 Nov 2023 23:22:08 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id q18-20020a1709060e5200b00992f2befcbcsm1709930eji.180.2023.11.23.23.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:22:07 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lustig <dlustig@nvidia.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH 2/5] RISC-V: Expose Ssdtso via hwprobe API
Date: Fri, 24 Nov 2023 08:21:39 +0100
Message-ID: <20231124072142.2786653-3-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_232212_968968_F1791137 
X-CRM114-Status: GOOD (  12.96  )
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

RnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+CgpU
aGlzIHBhdGNoIGFkZHMgU3NkdHNvIHRvIHRoZSBsaXN0IG9mIGV4dGVuc2lvbnMgd2hpY2gKYXJl
IGFubm91bmNlZCB0byB1c2VyLXNwYWNlIHVzaW5nIHRlIGh3cHJvYmUgQVBJLgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Ci0t
LQogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDMgKysrCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9z
eXNfcmlzY3YuYyAgICAgICAgIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0Rv
Y3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRleCA3YjIzODRkZTQ3MWYuLjhk
ZTMzNDllMGNhMiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUu
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdApAQCAtODAsNiAr
ODAsOSBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAgICogOmM6bWFjcm86YFJJ
U0NWX0hXUFJPQkVfRVhUX1pJQ0JPWmA6IFRoZSBaaWNib3ogZXh0ZW5zaW9uIGlzIHN1cHBvcnRl
ZCwgYXMKICAgICAgICByYXRpZmllZCBpbiBjb21taXQgM2RkNjA2ZiAoIkNyZWF0ZSBjbW9iYXNl
LXYxLjAucGRmIikgb2YgcmlzY3YtQ01Pcy4KIAorICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JF
X0VYVF9aSUNCT1pgOiBUaGUgU3NkdHNvIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzCisgICAg
ICAgaW4gdmVyc2lvbiB2MS4wLWRyYWZ0MiBvZiB0aGUgY29ycmVzcG9uZGluZyBleHRlbnNpb24u
CisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0
aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3Rl
ZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgK
aW5kZXggYjY1OWZmY2ZjZGI0Li5lZDQ1MGM2NGU2YjIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaApAQCAtMzAsNiArMzAsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQkIJCSgxIDw8IDQpCiAjZGVmaW5lCQlSSVNDVl9I
V1BST0JFX0VYVF9aQlMJCSgxIDw8IDUpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUNC
T1oJKDEgPDwgNikKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1NTRFRTTwkoMSA8PCA3KQog
I2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklTQ1ZfSFdQ
Uk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVf
TUlTQUxJR05FRF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvc3lzX3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwppbmRleCBjNzEy
MDM3ZGJlMTAuLmM2NTRmNDNiOTY5OSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lz
X3Jpc2N2LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKQEAgLTE2Miw2ICsx
NjIsNyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2Jl
ICpwYWlyLAogCQlFWFRfS0VZKFpCQik7CiAJCUVYVF9LRVkoWkJTKTsKIAkJRVhUX0tFWShaSUNC
T1opOworCQlFWFRfS0VZKFNTRFRTTyk7CiAjdW5kZWYgRVhUX0tFWQogCX0KIAotLSAKMi40MS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
