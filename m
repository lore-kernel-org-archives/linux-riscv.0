Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1F8C624B4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDTlhWN8YzuscW9LMc+iLonUnYryHGmjmgeUX/jpe48=; b=2djJfJITLPQyMv
	ETUJj2QbHmXC+p9FJiUjVjvMt2Bg3b9MHLe4xccClsDOMRo6pNB+ZfKF2GxmmNyXU1ll01OlVc2bG
	CumjkOKrvocKjfvWUU22NUrrKzx3Bff6NSvDrWKbuoijSTyEucJPG2MW44lPhfTN86DZmDWnrFou5
	fOs7uvMyUY3FK4dM71q8OI9KrZWAQzbd+vP1JuZ0COs0rSLWEAqULVUnZY/J4UNS/jPAUsUCoa3fh
	zyjqMbP698yWlt9UerbIXgFm0bP+pCC0lvDBG/3I7qGvXUd+Q6BiIn1NqOyFSpKPqCSlB8OnD6HoT
	KToEFPkNmU1/5fZR4cJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6EuO-005YMS-2x;
	Thu, 23 Nov 2023 18:58:40 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6EuK-005YHL-34
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 18:58:38 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a00c200782dso168483866b.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 10:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700765913; x=1701370713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r701pvo9PbgE9h16+HzDZMKOHNQtZ1R5aBMPWWKprHM=;
        b=Ne9S8jdD/Ewhn4/3wHWatsIhy01zlZl0kjbZ09IwLKi9RtJOBxW4dk2JTrCCOvHm+U
         XICaVmmHf2y344NJlLwDI4WfqzaVu06gWr0JD/5QIW5aHld9j1MIIB9lQfAFeshIjItQ
         qZ8SJUpV3GKnNJTp/U/34kKUjTv9uZ9JmQF9fy1RfSqrwwALyItkSM2MsqTDisJY93c5
         xAzZPPZAYysENcP0YcoDUOkXgo1EXp5Vja6z9/H4nTyZumAvpmtPTkMiwEx5vs+IUPb/
         IB6OX1vOV/7WJDAc1D6SB33I0ca1y+3zdkY6BuVj6YDlsu/o7VSX4tL6BERsOCOr5AbF
         GpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700765913; x=1701370713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r701pvo9PbgE9h16+HzDZMKOHNQtZ1R5aBMPWWKprHM=;
        b=TSB1j90zXn9f+KiQ32eoU2fJtrups1CAX7QVAk22W1LavSt2sfJhqRwfNkX9bJeaiD
         GCgnoP86fCvECsDZFxbVyEgVC1mc/JH9BGBkua/Wxf6QL/UNT47CqG+qGvbQXB5ZqsXJ
         65t7/QdK47Doq4E7kDBVW9ao82ngcZvNp1q3cpY0Q3E1YR86l41zdtOaR8PEzPuBscJt
         ZP3GSn8+/S9HVJQQ66EQuw/NcsGzCJUAwQWiT26oCiBQe4Qj45duq6hLZ2o0cj0AG8Rb
         hfHETdg5ajmzn6CDjQkTvKdoHF6qxlxzvDjHp2+hVyjm/vKyj0EN2ytNSaCzgISMyyiI
         gnhw==
X-Gm-Message-State: AOJu0YxnIlr4XfEBV6ahP0o0VfRRwcXY/3CqiGOxC6e0H1bOndYVm1Mi
	a+luIidcbSuLDIHffCfLmCfDpiBDRN9K80XXltPNarNG
X-Google-Smtp-Source: AGHT+IGo/4pGiY2CzvH24z/qYlIQMvNju8tGcNRKHAO+YNqcSuXvNbr1QJbcmN9PcnnekmGYewrQBw==
X-Received: by 2002:a17:906:b188:b0:9e6:f7c6:792f with SMTP id w8-20020a170906b18800b009e6f7c6792fmr159047ejy.17.1700765913533;
        Thu, 23 Nov 2023 10:58:33 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id l23-20020a170906231700b009ff1997ce86sm1115944eja.149.2023.11.23.10.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:58:32 -0800 (PST)
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
Subject: [PATCH 4/5] tools: selftests: riscv: Fix compile warnings in vector tests
Date: Thu, 23 Nov 2023 19:58:20 +0100
Message-ID: <20231123185821.2272504-5-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
References: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_105837_005932_E6D5E07A 
X-CRM114-Status: GOOD (  11.61  )
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
bmcKdGhlIHZlY3RvciB0ZXN0cy4gTGV0J3MgZm9sbG93IHRoZSByZWNvbW1lbmRhdGlvbiBpbgpE
b2N1bWVudGF0aW9uL3ByaW50ay1mb3JtYXRzLnR4dCB0byBmaXggdGhlc2Ugd2FybmluZ3MuCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggTcO8bGxuZXIgPGNocmlzdG9waC5tdWVsbG5lckB2cnVs
bC5ldT4KLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3Ivdl9pbml0dmFs
X25vbGliYy5jIHwgMiArLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3Zz
dGF0ZV9wcmN0bC5jICAgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
cmlzY3YvdmVjdG9yL3ZfaW5pdHZhbF9ub2xpYmMuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3Jpc2N2L3ZlY3Rvci92X2luaXR2YWxfbm9saWJjLmMKaW5kZXggNjY3NjRlZGIwZDUyLi4xZGQ5
NDE5N2RhMzAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rv
ci92X2luaXR2YWxfbm9saWJjLmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3Yv
dmVjdG9yL3ZfaW5pdHZhbF9ub2xpYmMuYwpAQCAtMjcsNyArMjcsNyBAQCBpbnQgbWFpbih2b2lk
KQogCiAJZGF0YXAgPSBtYWxsb2MoTUFYX1ZTSVpFKTsKIAlpZiAoIWRhdGFwKSB7Ci0JCWtzZnRf
dGVzdF9yZXN1bHRfZmFpbCgiZmFpbCB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIHNpemUgPSAlbHVc
biIsIE1BWF9WU0laRSk7CisJCWtzZnRfdGVzdF9yZXN1bHRfZmFpbCgiZmFpbCB0byBhbGxvY2F0
ZSBtZW1vcnkgZm9yIHNpemUgPSAlZFxuIiwgTUFYX1ZTSVpFKTsKIAkJZXhpdCgtMSk7CiAJfQog
CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRl
X3ByY3RsLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX3By
Y3RsLmMKaW5kZXggYjM0OGI0NzViZTU3Li44YWQ5NGUwOGZmNGQgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci92c3RhdGVfcHJjdGwuYworKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX3ByY3RsLmMKQEAgLTY4LDcg
KzY4LDcgQEAgaW50IHRlc3RfYW5kX2NvbXBhcmVfY2hpbGQobG9uZyBwcm92aWRlZCwgbG9uZyBl
eHBlY3RlZCwgaW50IGluaGVyaXQpCiAJfQogCXJjID0gbGF1bmNoX3Rlc3QoaW5oZXJpdCk7CiAJ
aWYgKHJjICE9IGV4cGVjdGVkKSB7Ci0JCWtzZnRfdGVzdF9yZXN1bHRfZmFpbCgiVGVzdCBmYWls
ZWQsIGNoZWNrICVkICE9ICVkXG4iLCByYywKKwkJa3NmdF90ZXN0X3Jlc3VsdF9mYWlsKCJUZXN0
IGZhaWxlZCwgY2hlY2sgJWQgIT0gJWxkXG4iLCByYywKIAkJCQkgICAgICBleHBlY3RlZCk7CiAJ
CXJldHVybiAtMjsKIAl9CkBAIC04Nyw3ICs4Nyw3IEBAIGludCBtYWluKHZvaWQpCiAJcGFpci5r
ZXkgPSBSSVNDVl9IV1BST0JFX0tFWV9JTUFfRVhUXzA7CiAJcmMgPSByaXNjdl9od3Byb2JlKCZw
YWlyLCAxLCAwLCBOVUxMLCAwKTsKIAlpZiAocmMgPCAwKSB7Ci0JCWtzZnRfdGVzdF9yZXN1bHRf
ZmFpbCgiaHdwcm9iZSgpIGZhaWxlZCB3aXRoICVkXG4iLCByYyk7CisJCWtzZnRfdGVzdF9yZXN1
bHRfZmFpbCgiaHdwcm9iZSgpIGZhaWxlZCB3aXRoICVsZFxuIiwgcmMpOwogCQlyZXR1cm4gLTE7
CiAJfQogCi0tIAoyLjQxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
