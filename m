Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92835C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9B8FeQZZ2KO5IYoSDJZrSZw+wQqGx+abyKZCqOu+4HE=; b=AaykjFT1kJ3w12
	EsaRUh1c09oSANKJRTjRQFdnHOzkXzG4ruyxEdcyzcYBhNIeNCPjVs848kyz2/lV5MLKis1MTGlEy
	jY8PwZEX2W7BUcSgfCVTFQW5zkDZhIka0goHSlKMYSVTrcvCHL0uWCGwkvjEMyzc/Qb2Xotaeqe82
	FxcZP+EX/ZaH2FpzHXBBjsddcCjIjLj58o4KOHFW8SsXgcHwrknqxrDMXftF2NbwTHdcriHey0OQ2
	05/sI9+zEfJjfPI2c1g3/MeTTpAKo7zngSrWOKnz05wSQmixdNK4odEL9AgnOwZPci+C3uriHPccF
	S2vR9ALwlL13LbGSc8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVnC-00000009zYh-05uw;
	Wed, 27 Mar 2024 16:06:22 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVmQ-00000009zAS-2XRj
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 16:05:43 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e6afb754fcso13475b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 09:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711555530; x=1712160330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Kov3PdEwmxTDPnCfMLEhtVN8PjsiHGUhl+QZHrnJpM=;
        b=Ua7yEZjeA2Nxk1Pv35Vqhpy56/QP1ozgQqy+wVLgJI3jE6/1NOM3Cb8aKKb8gmg6Vc
         0kzDalsajoHPymX9HEg5CydJ9WYnS0S8j/Cdp+S1vidrZBUx+sdseWI4Ax1QwIesZBNj
         FxKqwJhTJIYqaBlH2OCYeFyAws53nZooPexQB2sEdgCZRpktDyleVId/7HDOEuSP1xqE
         T0jsVIzdfjX0WAxvpZ2lmTuGG/coWABOTe0jqpPvmxucTSrhcaoL63YRcYiBDl8KjclH
         6Jsi+ncqiYWxh7VO4PRrT9T9dZQhDG2ohhxXD3qc3EhFybXC9quSZyzuW9dAQRyho2ZE
         46zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711555530; x=1712160330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Kov3PdEwmxTDPnCfMLEhtVN8PjsiHGUhl+QZHrnJpM=;
        b=olkvmfCJ9FH/jJMcUNhU6gBocuyfcXANnI/kgNmv3L7ah14THyOSuFiKmpbwJlqIkY
         8SkolHprQbNZDmqSPaXgflA4ac+OtTjigUjYTexfrZC7+fDoINGVjk1pqbM3/Bx8pKRq
         EnJyyzE6GhQFJqGp2Yov8SnqdR3j8NxI3FfXzM+1IyeZyL0hYSj/gG5xaYBB60cvZyPI
         uGR7Xz7pgliMPFli/WLG7rkNAbkMaSO4WpioXjdr9n6DzGE7f5WgjYowpdpaqvLs1mNt
         jmy3bUJaQqf4PQnuF1daLwY4HatU6LLxve9jxq9+UfrKIL2jnwgyv8eiUB81mIF4iUUg
         pFQA==
X-Forwarded-Encrypted: i=1; AJvYcCVXeipXplDGh1IUovz02L6kb4844mzMhGV82rWzfgVV/vEhZEM+4NSz1Fk+B+N6vh6jQ7U+tVBUEJGX937b+UjFQRDM9jyc0UNZgHPp/y8F
X-Gm-Message-State: AOJu0YwQf8oin0ljG35+uR9u2ltcgTxM0gc87XcDCCJ9vzeSBL9Ybxci
	ky5axPoXp/FzFDL/pwVDb+DoyV2o84cz3oSKJFqLdR5iPxbJHeX0TLYVgPUqiqI=
X-Google-Smtp-Source: AGHT+IE/3RrmK8SccBkrnois/GdB5+EKW8GlWLws9exiXDtK106qyPALy+gzO7adzUXL5RZSyOOPLw==
X-Received: by 2002:a17:903:2b04:b0:1dc:ce6e:bf06 with SMTP id mc4-20020a1709032b0400b001dcce6ebf06mr184008plb.0.1711555530628;
        Wed, 27 Mar 2024 09:05:30 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bf4-20020a170902b90400b001e14807f9cesm1718226plb.125.2024.03.27.09.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 09:05:30 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 6/7] riscv: Use offset_in_page() in text patching functions
Date: Wed, 27 Mar 2024 09:04:45 -0700
Message-ID: <20240327160520.791322-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327160520.791322-1-samuel.holland@sifive.com>
References: <20240327160520.791322-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_090539_162619_BDF01066 
X-CRM114-Status: GOOD (  11.29  )
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

VGhpcyBpcyBhIGJpdCBlYXNpZXIgdG8gcGFyc2UgdGhhbiB0aGUgZXF1aXZhbGVudCBiaXQgbWFu
aXB1bGF0aW9uLgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNv
bT4KU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5j
b20+Ci0tLQoKKG5vIGNoYW5nZXMgc2luY2UgdjEpCgogYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2gu
YyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9wYXRjaC5jCmluZGV4IDI0M2UxNTczNDEwYi4uY2ZjYjk5MjZlNzIyIDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Bh
dGNoLmMKQEAgLTU0LDcgKzU0LDcgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkICpwYXRj
aF9tYXAodm9pZCAqYWRkciwgY29uc3QgdW5zaWduZWQgaW50IGZpeG1hcCkKIAlCVUdfT04oIXBh
Z2UpOwogCiAJcmV0dXJuICh2b2lkICopc2V0X2ZpeG1hcF9vZmZzZXQoZml4bWFwLCBwYWdlX3Rv
X3BoeXMocGFnZSkgKwotCQkJCQkgKHVpbnRhZGRyICYgflBBR0VfTUFTSykpOworCQkJCQkgb2Zm
c2V0X2luX3BhZ2UoYWRkcikpOwogfQogCiBzdGF0aWMgdm9pZCBwYXRjaF91bm1hcChpbnQgZml4
bWFwKQpAQCAtNjUsOCArNjUsOCBAQCBOT0tQUk9CRV9TWU1CT0wocGF0Y2hfdW5tYXApOwogCiBz
dGF0aWMgaW50IF9fcGF0Y2hfaW5zbl9zZXQodm9pZCAqYWRkciwgdTggYywgc2l6ZV90IGxlbikK
IHsKKwlib29sIGFjcm9zc19wYWdlcyA9IChvZmZzZXRfaW5fcGFnZShhZGRyKSArIGxlbikgPiBQ
QUdFX1NJWkU7CiAJdm9pZCAqd2FkZHIgPSBhZGRyOwotCWJvb2wgYWNyb3NzX3BhZ2VzID0gKCgo
dWludHB0cl90KWFkZHIgJiB+UEFHRV9NQVNLKSArIGxlbikgPiBQQUdFX1NJWkU7CiAKIAkvKgog
CSAqIE9ubHkgdHdvIHBhZ2VzIGNhbiBiZSBtYXBwZWQgYXQgYSB0aW1lIGZvciB3cml0aW5nLgpA
QCAtOTgsOCArOTgsOCBAQCBOT0tQUk9CRV9TWU1CT0woX19wYXRjaF9pbnNuX3NldCk7CiAKIHN0
YXRpYyBpbnQgX19wYXRjaF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24s
IHNpemVfdCBsZW4pCiB7CisJYm9vbCBhY3Jvc3NfcGFnZXMgPSAob2Zmc2V0X2luX3BhZ2UoYWRk
cikgKyBsZW4pID4gUEFHRV9TSVpFOwogCXZvaWQgKndhZGRyID0gYWRkcjsKLQlib29sIGFjcm9z
c19wYWdlcyA9ICgoKHVpbnRwdHJfdCkgYWRkciAmIH5QQUdFX01BU0spICsgbGVuKSA+IFBBR0Vf
U0laRTsKIAlpbnQgcmV0OwogCiAJLyoKLS0gCjIuNDMuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
