Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13494C636D3
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FkC0AcdZ55EBbqEoVuJu5no0TK8mrBabjaIlONz9Ow=; b=M1DA/BgmVk6uVK
	h+secEy853WcTdpv73q+aiIUfQlSeYIGqybXxcjGck0iNJN/rpc7bbyI7upm1m65XLfcTck6k+H8r
	zd3DvgbseaG1trfZOMjKGoA8o3xdK4TLJhPs1xGp882Bh/swoLVsa1puuPVpRmyU3SsaOHWnvtuSb
	a6EQHVO508x4RCvJpASVPPgYv+T8QKTKd4WsMSQv0/EdqMEE4HFNd7zaQ5vJAPLSX9BD+rdcB32+A
	Fvbrwp36EEV/f5Q2T3BGRCldBSyp5OMyIwOyConsLKge92MYS3aXXuhE14R6AOOejOEd5WFpScq3j
	HJeK/K0r1gkHJH6gva9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6EuL-005YIz-0V;
	Thu, 23 Nov 2023 18:58:37 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6EuF-005YGH-1x
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 18:58:32 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-548f6f3cdc9so1774162a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 10:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700765910; x=1701370710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D52mho4bbVBLhO1MqSHLzeH5mafSEJrrR5dOy4gDBr8=;
        b=PmHuRPfq2cz9/E3USBWR1xv0+3wjMi+iEiihnUIvHI8FdsI3iyJrbZAhhwlIyYdL3Z
         efULM2dm//7fz92KTJUtT1iwXIw7cDC6kJdszkM8aJpqOKcUR7LCj5MGuN5bmcbkSZGa
         h0GlxPJ9JDJH9DGo/kE+65Sg3N6HCioMPdyv31zgkjrPQQMLg4ISIwdZLMVbSSY/MfUn
         YPGJ3iZHZ6Bw5K0lsPEJy++1o/u+5YkFmUtL4+ZchdybK6+Fw+rtM8gyKhd7Fa+Qe+jd
         8rSlyxPVWJxbOyn5YO5SbMRWLUMcNWg16r5TTipT1kpbk8BhJEt5ilB8GBiK1prP57GD
         W2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700765910; x=1701370710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D52mho4bbVBLhO1MqSHLzeH5mafSEJrrR5dOy4gDBr8=;
        b=hpT9v0LMcVi+/iQUC/vZ3p8mXwIldE8XiT/SxfB0XcuOsS6o5ueNtsfrkuyOKtNSj/
         Xr1t2wRq+lMjrbUa+Y5DhbA8JIzezSwfpwRdUuB+OnqgcK+b3xvz0ZUYqhuN4VdI9Glm
         6TWZTumXdy4e5/rF1Aau9On8el7AslfCQpGcToNvoNJbGHGzeNumyUh5juPgJSeHjL6j
         vj8VdUt69SAz+FZe0dbYVMHM9hQ1oQr6wOYhTHnSol3GgIuPD4Gfid02OsGEJmPe1w+D
         Z1VB62GXXWHkfSANzILdHsRR9qKjy6/D5HMiNVeWc+NotaiBcqkJ3RwuWhlw7x0vB7xt
         UMaQ==
X-Gm-Message-State: AOJu0Yw6B9jaZi2+gDZnCfBd3HfRsrKCxpML33rkw/6mw11avht+I0TP
	wxidiWjN4AqESURY0hghzNeRkquinzcUdjwIk9+b3A7K
X-Google-Smtp-Source: AGHT+IFVVpG1Z6gxPdaL7IaaTFJinrPmrgoX6cwu9dsiRja9dZsbaJhr6jSoHE3EsEV83YZM2drU6A==
X-Received: by 2002:a17:906:738b:b0:9f8:2f30:d74f with SMTP id f11-20020a170906738b00b009f82f30d74fmr185134ejl.7.1700765909911;
        Thu, 23 Nov 2023 10:58:29 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id l23-20020a170906231700b009ff1997ce86sm1115944eja.149.2023.11.23.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:58:29 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH 2/5] tools: selftests: riscv: Fix compile warnings in cbo
Date: Thu, 23 Nov 2023 19:58:18 +0100
Message-ID: <20231123185821.2272504-3-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
References: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_105831_647004_25F759B3 
X-CRM114-Status: GOOD (  10.70  )
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

RnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+CgpH
Q0MgcHJpbnRzIGEgY291cGxlIG9mIGZvcm1hdCBzdHJpbmcgd2FybmluZ3Mgd2hlbiBjb21waWxp
bmcKdGhlIGNibyB0ZXN0LiBMZXQncyBmb2xsb3cgdGhlIHJlY29tbWVuZGF0aW9uIGluCkRvY3Vt
ZW50YXRpb24vcHJpbnRrLWZvcm1hdHMudHh0IHRvIGZpeCB0aGVzZSB3YXJuaW5ncy4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1
PgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvY2JvLmMgfCA2ICsr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2Niby5jIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9iZS9jYm8uYwppbmRleCA1MGEyY2M4
YWVmMzguLmM2YTgzYWIxMWUyMiAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
cmlzY3YvaHdwcm9iZS9jYm8uYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9o
d3Byb2JlL2Niby5jCkBAIC05Nyw3ICs5Nyw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfemljYm96KHZv
aWQgKmFyZykKIAlibG9ja19zaXplID0gcGFpci52YWx1ZTsKIAlrc2Z0X3Rlc3RfcmVzdWx0KHJj
ID09IDAgJiYgcGFpci5rZXkgPT0gUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9aX0JMT0NLX1NJWkUg
JiYKIAkJCSBpc19wb3dlcl9vZl8yKGJsb2NrX3NpemUpLCAiWmljYm96IGJsb2NrIHNpemVcbiIp
OwotCWtzZnRfcHJpbnRfbXNnKCJaaWNib3ogYmxvY2sgc2l6ZTogJWxkXG4iLCBibG9ja19zaXpl
KTsKKwlrc2Z0X3ByaW50X21zZygiWmljYm96IGJsb2NrIHNpemU6ICVsbHVcbiIsIGJsb2NrX3Np
emUpOwogCiAJaWxsZWdhbF9pbnNuID0gZmFsc2U7CiAJY2JvX3plcm8oJm1lbVtibG9ja19zaXpl
XSk7CkBAIC0xMjEsNyArMTIxLDcgQEAgc3RhdGljIHZvaWQgdGVzdF96aWNib3oodm9pZCAqYXJn
KQogCQlmb3IgKGogPSAwOyBqIDwgYmxvY2tfc2l6ZTsgKytqKSB7CiAJCQlpZiAobWVtW2kgKiBi
bG9ja19zaXplICsgal0gIT0gZXhwZWN0ZWQpIHsKIAkJCQlrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwo
ImNiby56ZXJvIGNoZWNrXG4iKTsKLQkJCQlrc2Z0X3ByaW50X21zZygiY2JvLnplcm8gY2hlY2s6
IG1lbVslZF0gIT0gMHgleFxuIiwKKwkJCQlrc2Z0X3ByaW50X21zZygiY2JvLnplcm8gY2hlY2s6
IG1lbVslbGx1XSAhPSAweCV4XG4iLAogCQkJCQkgICAgICAgaSAqIGJsb2NrX3NpemUgKyBqLCBl
eHBlY3RlZCk7CiAJCQkJcmV0dXJuOwogCQkJfQpAQCAtMjAxLDcgKzIwMSw3IEBAIGludCBtYWlu
KGludCBhcmdjLCBjaGFyICoqYXJndikKIAlwYWlyLmtleSA9IFJJU0NWX0hXUFJPQkVfS0VZX0lN
QV9FWFRfMDsKIAlyYyA9IHJpc2N2X2h3cHJvYmUoJnBhaXIsIDEsIHNpemVvZihjcHVfc2V0X3Qp
LCAodW5zaWduZWQgbG9uZyAqKSZjcHVzLCAwKTsKIAlpZiAocmMgPCAwKQotCQlrc2Z0X2V4aXRf
ZmFpbF9tc2coImh3cHJvYmUoKSBmYWlsZWQgd2l0aCAlZFxuIiwgcmMpOworCQlrc2Z0X2V4aXRf
ZmFpbF9tc2coImh3cHJvYmUoKSBmYWlsZWQgd2l0aCAlbGRcbiIsIHJjKTsKIAlhc3NlcnQocmMg
PT0gMCAmJiBwYWlyLmtleSA9PSBSSVNDVl9IV1BST0JFX0tFWV9JTUFfRVhUXzApOwogCiAJaWYg
KHBhaXIudmFsdWUgJiBSSVNDVl9IV1BST0JFX0VYVF9aSUNCT1opIHsKLS0gCjIuNDEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
