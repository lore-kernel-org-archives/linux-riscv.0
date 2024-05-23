Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B60C25B79
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 11:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M6McBCff15cyu3zbkWOygrVUzRVo0pZUh0QdXH6qfB4=; b=JUJLyM3mS1oZvt
	LErt/vLCxO/K7zOWa2fk3M9628OdDZoqUSCwCusCL6mKzfiir3bp8d9FBy33D8Tx9eUy6hPefDWvN
	2S73N/g2ZGG87iP5uUBTcWATau7UyTY3Jd+BdDFUGNcQ/5kyPz7aBpVE1yj62wP7fNQtKxB7DR2vo
	ZfR+CwxRV8RfXzM6EN/1OgqDhkuTFFu4iUrpDM7XuoTGGfdO3Riy2UywxcjcrghpNasExi1W+Cshs
	E4hTYSAfvVVfbmD0fwm/yyAAiacdYiL0pTcdfZHHqD0JLqmMImUXfQLiS45shd6Ral3yyBgaz/Jex
	THmnOqfUBKgQfa3H6McQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6z0-0000000668I-3D44;
	Thu, 23 May 2024 11:51:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6yx-0000000667U-3jFp
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 11:51:41 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-354f6ab168aso443330f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 04:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716465096; x=1717069896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tomuose927MUcTT3sGm0eYQ4ZHc9XHuBgI6ykSWqNcI=;
        b=HYYrEt/uEsGfng7PYFNm8HF7ckuJkio4wNxdp5DKWlSwX05lvaIOCp+xvZd3dqvXWl
         fbqu7l/DeLxOY5slHs/g7cSrm4MFsbIRm5MQRjMLq4YEx01eRfaEo8lp09y6lLBaSp9E
         7F3q6UG3fU2a5XB+haydYh9if+PHYmFivA/iNqE7OQu+y3xC3aiJYt7LkR0aefWSyOy9
         2dQOeu6NjNdQLSETu6hoFyy1ky+52CzgIctuNllD/uuvLcWXhuKmjAK/7JTOa8K/xJlO
         O50CYhhJsT6AYFBBy4U3K+vyTqbUtJE7dki/r37lBxqD5Pdfi5+nv7qwnZlbO+tV8L2B
         rGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716465096; x=1717069896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tomuose927MUcTT3sGm0eYQ4ZHc9XHuBgI6ykSWqNcI=;
        b=AG7Sa0gHvK4rF0i1+cnXF7nJw75WiaeXBnxh9t1y2j7yNvAtD0wsA2LKf1CZev4G5f
         4ml5vd0YYQhu2DI/XPhItWabDnQnxRC2sIR+uoOwCFFy+jSHkhvw5Ids/O2h64DC4i8p
         rvK00P0vp6vKIOp4ndxNpwhmvb9+fJ696IZ3mOyFFTIgH94M/6vH4XLgWck8ELkltGCw
         qLTdOkiQ9ORoBb1p+gC1/MCJUf3+XzoNKZpywf8D9cArLkSbwXBakYEWM8BLHUDRdDtV
         N3r8wmSHQqEsNTrjBPyoJDJmSHQKOqtPTFMIcfL3REQr8YUuAy+mkE+V49Ytiprw0GtF
         Popg==
X-Forwarded-Encrypted: i=1; AJvYcCWo12UYpbkoo+e8hBbsE5bW8vmL/HB9Pmo/zumZREb9DvpRMuchxQXJeqfih6nG7TFws9fWIhfsUwrIEduv7x5G1yJlXkd8KMYza1K44Z1w
X-Gm-Message-State: AOJu0YzJTd+IAuj3Shqj2luf3rbiy2IabFz4YtA+6j2qNgJuLVM51SL1
	EE7bVQj3gwpFora0AFEQq8EH8ky4BSWjz4TDHxMjGHok14C+FYlHzYAx8TsUrH7jaPZspu23XXW
	R
X-Google-Smtp-Source: AGHT+IFe90bcCCk3DsNh1uSEukvSAXaPs6XHlXPOkfTOcX5gFcR6LlB//XRU3ng08XrqXVcAz3+1YQ==
X-Received: by 2002:adf:fd04:0:b0:34d:ce05:29ef with SMTP id ffacd0b85a97d-354f75216eamr2192712f8f.17.1716465096610;
        Thu, 23 May 2024 04:51:36 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354e03420b4sm3414511f8f.24.2024.05.23.04.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 04:51:36 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH] riscv: Fix early ftrace nop patching
Date: Thu, 23 May 2024 13:51:34 +0200
Message-Id: <20240523115134.70380-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_045140_069751_CD7E23F6 
X-CRM114-Status: GOOD (  11.00  )
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

Q29tbWl0IGM5N2JmNjI5OTYzZSAoInJpc2N2OiBGaXggdGV4dCBwYXRjaGluZyB3aGVuIElQSSBh
cmUgdXNlZCIpCmNvbnZlcnRlZCBmdHJhY2VfbWFrZV9ub3AoKSB0byB1c2UgcGF0Y2hfaW5zbl93
cml0ZSgpIHdoaWNoIGRvZXMgbm90CmVtaXQgYW55IGljYWNoZSBmbHVzaCByZWx5aW5nIGVudGly
ZWx5IG9uIF9fZnRyYWNlX21vZGlmeV9jb2RlKCkgdG8gZG8KdGhhdC4KCkJ1dCB3ZSBtaXNzZWQg
dGhhdCBmdHJhY2VfbWFrZV9ub3AoKSB3YXMgY2FsbGVkIHZlcnkgZWFybHkgZGlyZWN0bHkgd2hl
bgpjb252ZXJ0aW5nIG1jb3VudCBjYWxscyBpbnRvIG5vcHMgKGFjdHVhbGx5IG9uIHJpc2N2IGl0
IGNvbnZlcnRzIDJCIG5vcHMKZW1pdHRlZCBieSB0aGUgY29tcGlsZXIgaW50byA0QiBub3BzKS4K
ClRoaXMgY2F1c2VkIGNyYXNoZXMgb24gbXVsdGlwbGUgSFcgYXMgcmVwb3J0ZWQgYnkgQ29ub3Ig
YW5kIEJqw7ZybiBzaW5jZQp0aGUgYm9vdGluZyBjb3JlIGNvdWxkIGhhdmUgaGFsZi1wYXRjaGVk
IGluc3RydWN0aW9ucyBpbiBpdHMgaWNhY2hlCndoaWNoIHdvdWxkIHRyaWdnZXIgYW4gaWxsZWdh
bCBpbnN0cnVjdGlvbiB0cmFwOiBmaXggdGhpcyBieSBlbWl0dGluZyBhCmxvY2FsIGZsdXNoIGlj
YWNoZSB3aGVuIGVhcmx5IHBhdGNoaW5nIG5vcHMuCgpGaXhlczogYzk3YmY2Mjk5NjNlICgicmlz
Y3Y6IEZpeCB0ZXh0IHBhdGNoaW5nIHdoZW4gSVBJIGFyZSB1c2VkIikKU2lnbmVkLW9mZi1ieTog
QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIHwgNiArKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL2Z0
cmFjZS5jICAgICAgICAgIHwgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAppbmRleCBkZDhkMDcxNDYxMTYuLmNlNzlj
NTU4YTRjOCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKQEAgLTEzLDYgKzEzLDEy
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9mbHVzaF9pY2FjaGVfYWxsKHZvaWQpCiAJYXNt
IHZvbGF0aWxlICgiZmVuY2UuaSIgOjo6ICJtZW1vcnkiKTsKIH0KIAorc3RhdGljIGlubGluZSB2
b2lkIGxvY2FsX2ZsdXNoX2ljYWNoZV9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LAorCQkJCQkg
ICAgdW5zaWduZWQgbG9uZyBlbmQpCit7CisJbG9jYWxfZmx1c2hfaWNhY2hlX2FsbCgpOworfQor
CiAjZGVmaW5lIFBHX2RjYWNoZV9jbGVhbiBQR19hcmNoXzEKIAogc3RhdGljIGlubGluZSB2b2lk
IGZsdXNoX2RjYWNoZV9mb2xpbyhzdHJ1Y3QgZm9saW8gKmZvbGlvKQpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYwppbmRl
eCA0ZjQ5ODdhNmQ4M2QuLjMyZTdjNDAxZGZiNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvZnRyYWNlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMKQEAgLTEyMCw2ICsx
MjAsOSBAQCBpbnQgZnRyYWNlX2luaXRfbm9wKHN0cnVjdCBtb2R1bGUgKm1vZCwgc3RydWN0IGR5
bl9mdHJhY2UgKnJlYykKIAlvdXQgPSBmdHJhY2VfbWFrZV9ub3AobW9kLCByZWMsIE1DT1VOVF9B
RERSKTsKIAltdXRleF91bmxvY2soJnRleHRfbXV0ZXgpOwogCisJaWYgKCFtb2QpCisJCWxvY2Fs
X2ZsdXNoX2ljYWNoZV9yYW5nZShyZWMtPmlwLCByZWMtPmlwICsgTUNPVU5UX0lOU05fU0laRSk7
CisKIAlyZXR1cm4gb3V0OwogfQogCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
