Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456C4C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 06:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRVKmNXQtuttePU/d6O8DS+1ywrf2lndXa2QIQd5Roc=; b=OfLNH8DKG+gutP
	lBmz+jlqn9QuzuTeyeQkEbsGCG6x8LhWW6zFmnqyeM+W3KSX6nl4DVM1Dg3NtVYPWCBHDBiEc5Eue
	r7J8/VM2lv1IywO6P/nZ0OoVH4ThBhSq/7wuwWgJI5h3Spw/YJ3QqGZlXWoX2XGrInljVzmfUTNKb
	OsMT2G+SHfXnxueZ/ltjC3zhglY199zPEyhW+j+6Bl5wB2LdVzQ2SK498Et85aLhsedA8G6DMNmek
	QhVYMMZrbzJVx5bwdHMj1D59g5N2sThKHK1j3Z9525iKpVeAEr3HRhy8eR11/lWKvNd55XlTTgRsS
	q5zIpE/ff8PHY+G/8Yfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJJ6-0000000DIC6-2UpS;
	Tue, 20 Feb 2024 06:08:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJIg-0000000DHov-2xS4
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 06:08:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1dc0e5b223eso7332195ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 22:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708409296; x=1709014096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=104PBPP87dGRJ1dWRj3TJVt38h0tClUYGYzJ0Qy5+KM=;
        b=j54iTf9UFyzn8rSUefx5TkMHa/4Tf+/BxCRz3OkqmEkOxRCxsaSYW2IPTz0zpNrtWd
         qUKvBPTQs777mQUEVfMqzbY2360oAEhXTMpPVvTdWefX2Dk7LQKKIJcpw+M5Q9QtZ1DB
         nzwDNAsKxKPNqiTNIYjhmluhVSRA/KIQMryHAIOQQEwZhd+hH6fGuY13fUitmK1Jvbt7
         KInJxKemmFnbil4/+yi1EXdNqZTJ/69JxtNX0xge1dGHOEdin5pYPVZ6/uZdV6GEJJ4R
         6k0spS1prH46M8T6eVWhxR06eSQ1mKpuDFBGeacG0JkYbwnli0vcNlX8EB4gUqikU6aY
         y7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708409296; x=1709014096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=104PBPP87dGRJ1dWRj3TJVt38h0tClUYGYzJ0Qy5+KM=;
        b=GDD3VFs6SBi4pnb4gsnHkYDtxsgkzABRWcUG26qwPXIllWAK04VtcRqgP6YuVoff2p
         aIv1NyARctk2vAg9KkFUXbiZAyBsXtlq/jaSBkMzClsq5zDLl4A54pqZmKm3A2DxrWAq
         j91STI0VpNLdWRJYIhTA28sUTw2RQjNKxmebG6g+n5XcrtV2Ur2M/E6YOJ/bDosCaMUv
         +UJeZqYl1P2ZiaDmMpkqkZV5LgLOiYflEY+kBVL7RxEUmYPSns15x9JZsN/u1qcsnfPx
         tTIdz3M71DEFbkiulwMUto3IoHNHU2gO716mZJNNJUveUZePgCmL/B3+Xw5AnJIsIJmF
         MfYw==
X-Forwarded-Encrypted: i=1; AJvYcCX/bGgMtY7PV83OIj92p+7PL6R7mZEl4oi+yneSuJbHvn3IM0amtvfE0mW/Hnl6N/DUyjvjPMzq+YdxFCWSc8fgNMXgpuRt0cNYG2/2AKnM
X-Gm-Message-State: AOJu0YzybZxLyEiRCC2BKvjRWY46wRStpZI863zeL/xqjwXxfeVwWUI0
	vpy5sUGbb6eqgrjMuzfqOlQk3z6FQv5zXWeA2s/B+NSZHj0aExUtqblqoj/6Q/4=
X-Google-Smtp-Source: AGHT+IFY/JcHrI+xAG094ZcXNaFl0GQyv1RbkAVoM5o1aUQFAbhKoPaBFMazisxA1YDdZaveAQB90g==
X-Received: by 2002:a17:902:cf0e:b0:1db:a164:3e50 with SMTP id i14-20020a170902cf0e00b001dba1643e50mr13726229plg.40.1708409296360;
        Mon, 19 Feb 2024 22:08:16 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.86])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090276c600b001db4c89aea5sm5368114plt.158.2024.02.19.22.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 22:08:15 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v13 05/13] genirq/matrix: Dynamic bitmap allocation
Date: Tue, 20 Feb 2024 11:37:10 +0530
Message-Id: <20240220060718.823229-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220060718.823229-1-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_220819_229855_C9ABB421 
X-CRM114-Status: GOOD (  13.95  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKU29tZSAoZnV0dXJlKSB1
c2VycyBvZiB0aGUgaXJxIG1hdHJpeCBhbGxvY2F0b3IsIGRvIG5vdCBrbm93IHRoZSBzaXplCm9m
IHRoZSBtYXRyaXggYml0bWFwcyBhdCBjb21waWxlIHRpbWUuCgpUbyBhdm9pZCB3YXN0aW5nIG1l
bW9yeSBvbiB1bm5lY2Vzc2FyeSBsYXJnZSBiaXRtYXBzLCBzaXplIHRoZSBiaXRtYXAKYXQgbWF0
cml4IGFsbG9jYXRpb24gdGltZS4KClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFt
aWNyby5jb20+Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20vaHdfaXJxLmggfCAgMiAtLQoga2Vy
bmVsL2lycS9tYXRyaXguYyAgICAgICAgICAgfCAyOCArKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h3X2lycS5oIGIvYXJjaC94ODYvaW5j
bHVkZS9hc20vaHdfaXJxLmgKaW5kZXggYjAyYzNjZDNjMGY2Li5lZGViZjEwMjBlMDQgMTAwNjQ0
Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h3X2lycS5oCisrKyBiL2FyY2gveDg2L2luY2x1
ZGUvYXNtL2h3X2lycS5oCkBAIC0xNiw4ICsxNiw2IEBACiAKICNpbmNsdWRlIDxhc20vaXJxX3Zl
Y3RvcnMuaD4KIAotI2RlZmluZSBJUlFfTUFUUklYX0JJVFMJCU5SX1ZFQ1RPUlMKLQogI2lmbmRl
ZiBfX0FTU0VNQkxZX18KIAogI2luY2x1ZGUgPGxpbnV4L3BlcmNwdS5oPgpkaWZmIC0tZ2l0IGEv
a2VybmVsL2lycS9tYXRyaXguYyBiL2tlcm5lbC9pcnEvbWF0cml4LmMKaW5kZXggNzVkMGFlNDkw
ZTI5Li44ZjIyMmQxY2NjZWMgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9pcnEvbWF0cml4LmMKKysrIGIv
a2VybmVsL2lycS9tYXRyaXguYwpAQCAtOCw4ICs4LDYgQEAKICNpbmNsdWRlIDxsaW51eC9jcHUu
aD4KICNpbmNsdWRlIDxsaW51eC9pcnEuaD4KIAotI2RlZmluZSBJUlFfTUFUUklYX1NJWkUJKEJJ
VFNfVE9fTE9OR1MoSVJRX01BVFJJWF9CSVRTKSkKLQogc3RydWN0IGNwdW1hcCB7CiAJdW5zaWdu
ZWQgaW50CQlhdmFpbGFibGU7CiAJdW5zaWduZWQgaW50CQlhbGxvY2F0ZWQ7CkBAIC0xNyw4ICsx
NSw4IEBAIHN0cnVjdCBjcHVtYXAgewogCXVuc2lnbmVkIGludAkJbWFuYWdlZF9hbGxvY2F0ZWQ7
CiAJYm9vbAkJCWluaXRpYWxpemVkOwogCWJvb2wJCQlvbmxpbmU7Ci0JdW5zaWduZWQgbG9uZwkJ
YWxsb2NfbWFwW0lSUV9NQVRSSVhfU0laRV07Ci0JdW5zaWduZWQgbG9uZwkJbWFuYWdlZF9tYXBb
SVJRX01BVFJJWF9TSVpFXTsKKwl1bnNpZ25lZCBsb25nCQkqbWFuYWdlZF9tYXA7CisJdW5zaWdu
ZWQgbG9uZwkJYWxsb2NfbWFwW107CiB9OwogCiBzdHJ1Y3QgaXJxX21hdHJpeCB7CkBAIC0zMiw4
ICszMCw4IEBAIHN0cnVjdCBpcnFfbWF0cml4IHsKIAl1bnNpZ25lZCBpbnQJCXRvdGFsX2FsbG9j
YXRlZDsKIAl1bnNpZ25lZCBpbnQJCW9ubGluZV9tYXBzOwogCXN0cnVjdCBjcHVtYXAgX19wZXJj
cHUJKm1hcHM7Ci0JdW5zaWduZWQgbG9uZwkJc2NyYXRjaF9tYXBbSVJRX01BVFJJWF9TSVpFXTsK
LQl1bnNpZ25lZCBsb25nCQlzeXN0ZW1fbWFwW0lSUV9NQVRSSVhfU0laRV07CisJdW5zaWduZWQg
bG9uZwkJKnN5c3RlbV9tYXA7CisJdW5zaWduZWQgbG9uZwkJc2NyYXRjaF9tYXBbXTsKIH07CiAK
ICNkZWZpbmUgQ1JFQVRFX1RSQUNFX1BPSU5UUwpAQCAtNTAsMjQgKzQ4LDMyIEBAIF9faW5pdCBz
dHJ1Y3QgaXJxX21hdHJpeCAqaXJxX2FsbG9jX21hdHJpeCh1bnNpZ25lZCBpbnQgbWF0cml4X2Jp
dHMsCiAJCQkJCSAgIHVuc2lnbmVkIGludCBhbGxvY19zdGFydCwKIAkJCQkJICAgdW5zaWduZWQg
aW50IGFsbG9jX2VuZCkKIHsKKwl1bnNpZ25lZCBpbnQgY3B1LCBtYXRyaXhfc2l6ZSA9IEJJVFNf
VE9fTE9OR1MobWF0cml4X2JpdHMpOwogCXN0cnVjdCBpcnFfbWF0cml4ICptOwogCi0JaWYgKG1h
dHJpeF9iaXRzID4gSVJRX01BVFJJWF9CSVRTKQotCQlyZXR1cm4gTlVMTDsKLQotCW0gPSBremFs
bG9jKHNpemVvZigqbSksIEdGUF9LRVJORUwpOworCW0gPSBremFsbG9jKHN0cnVjdF9zaXplKG0s
IHNjcmF0Y2hfbWFwLCBtYXRyaXhfc2l6ZSAqIDIpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIW0pCiAJ
CXJldHVybiBOVUxMOwogCisJbS0+c3lzdGVtX21hcCA9ICZtLT5zY3JhdGNoX21hcFttYXRyaXhf
c2l6ZV07CisKIAltLT5tYXRyaXhfYml0cyA9IG1hdHJpeF9iaXRzOwogCW0tPmFsbG9jX3N0YXJ0
ID0gYWxsb2Nfc3RhcnQ7CiAJbS0+YWxsb2NfZW5kID0gYWxsb2NfZW5kOwogCW0tPmFsbG9jX3Np
emUgPSBhbGxvY19lbmQgLSBhbGxvY19zdGFydDsKLQltLT5tYXBzID0gYWxsb2NfcGVyY3B1KCpt
LT5tYXBzKTsKKwltLT5tYXBzID0gX19hbGxvY19wZXJjcHUoc3RydWN0X3NpemUobS0+bWFwcywg
YWxsb2NfbWFwLCBtYXRyaXhfc2l6ZSAqIDIpLAorCQkJCSBfX2FsaWdub2ZfXygqbS0+bWFwcykp
OwogCWlmICghbS0+bWFwcykgewogCQlrZnJlZShtKTsKIAkJcmV0dXJuIE5VTEw7CiAJfQorCisJ
Zm9yX2VhY2hfcG9zc2libGVfY3B1KGNwdSkgeworCQlzdHJ1Y3QgY3B1bWFwICpjbSA9IHBlcl9j
cHVfcHRyKG0tPm1hcHMsIGNwdSk7CisKKwkJY20tPm1hbmFnZWRfbWFwID0gJmNtLT5hbGxvY19t
YXBbbWF0cml4X3NpemVdOworCX0KKwogCXJldHVybiBtOwogfQogCi0tIAoyLjM0LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
