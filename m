Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA386C636D0
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwcCVA3Tti0bjZWEQTj/b4q1YaJHHkcaon4lWJrRSlw=; b=vVRcPVIsPIAYr0
	uGg7Gq/Nb75DMiTo8W0rzht445QRq5BkvDjcE6fYFNwH++NCcZaOlOSeHXPEUSf8817wqhTfA3tQS
	Njq879zj1fnQvo8l57fqlTUBaDDhmPT07v52CQOS5Fs5P+hcfJzP7NH2ViOyrbUUw2rj73p26FKeY
	GBlzmUZY/Xy3FfloZ01Fwi7r2HyWigc1l3jjTV2FoNOqgDSSrKJ+T5jgDvT2yaS/JP/mrUaXkOvnN
	6oxN7+YPRGs93qaS5WqtOsRNhFm8WjpmhpemX8ZE3UdqNRAmOeAyFSdeLF/wU8lnfB1d+j6P2SAQw
	dnjsuX/dJm8eyvYK4OmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6EuK-005YHu-10;
	Thu, 23 Nov 2023 18:58:36 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6EuF-005YG1-1x
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 18:58:32 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-548f0b7ab11so1680480a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 10:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700765908; x=1701370708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhz1HO1TFrn+esU2JyrDQXLuWyA0tprcaBHDYdqjcxQ=;
        b=f1a8ZVdtTwngh6l92e5xA2vTSlu2MY6m8y6a3Vm4LgZrmbpJzObmts4Hr84t1ygVfP
         com1a+UnW216hnfa2Ro4k020a7xkNqhoUbqiXWG5f09e8/8fUpz9NCj+tzav1x5phN6P
         Y+yifwGG8bz9iOvJfFPUKl8byXyRUJdGyuPtpqOHVAr+SHlj2/IxZ5ncKPOxqHN+XQ/N
         TsclMFNywYW+cw8m2z+O+Tm53NXFZ/AHCiindXC+Gq7ECxL0PYBhy4cJsLMwLZHN+j6b
         SWpmjukVA6m9Abu3st+929NspSZ2bnmZ7CEEgVqwWwtpPnROPi11+k38lggKrZzIxZtH
         7G9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700765908; x=1701370708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhz1HO1TFrn+esU2JyrDQXLuWyA0tprcaBHDYdqjcxQ=;
        b=vYS0NNAhtfhwbYwSdo5YiJUMMlXbuGnZ41lyDraYRJqhPY2Z8srMhehMGI5vYatFDp
         Mrze5DIOiFRQl4D+6j1Q9q+P5lltgQhdjkde+C1jT3iy194LY6jXcIqn/oiaSE+PHleB
         I/jzStmqaATocOs/KfPmtoC7YXO87ycnmLJEZJLRW2vFD7fR4UTFFirzGtZc74sSbX29
         QWZPd8RQRI6fqobesd8xTvskKCQmt5NlRITHSiZnbfYO6QsC0uoZwEUziR/jLh6nI8yk
         FXaqhhok99+MX9fOjJWRk/ENc2fueI1WT0RmP2Dzv/8Eh1UMsZ4jXxm732LEaLhRr7au
         I4Sw==
X-Gm-Message-State: AOJu0YxmrAkilnouKICVpA8EG8BYmaWNzAXFlPY1VDfvvVJF32/HyJz3
	Nt3FsXqy92Y3gwlho9GhCuqGBbLyamjRcrLVtBnqRTzn
X-Google-Smtp-Source: AGHT+IHuV5dXf2Er0VwPFonFK4Fp1h+h+XsSB+7tO9pY2bovS/v0cFYLhOuYH9heihq0E1lWqqNMWw==
X-Received: by 2002:a17:906:d4:b0:a01:8ef2:849 with SMTP id 20-20020a17090600d400b00a018ef20849mr177665eji.4.1700765908104;
        Thu, 23 Nov 2023 10:58:28 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id l23-20020a170906231700b009ff1997ce86sm1115944eja.149.2023.11.23.10.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:58:27 -0800 (PST)
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
Subject: [PATCH 1/5] tools: selftests: riscv: Fix compile warnings in hwprobe
Date: Thu, 23 Nov 2023 19:58:17 +0100
Message-ID: <20231123185821.2272504-2-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
References: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_105831_646799_5F361860 
X-CRM114-Status: GOOD (  10.21  )
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
bmcKdGhlIGh3cHJvYmUgdGVzdC4gTGV0J3MgZm9sbG93IHRoZSByZWNvbW1lbmRhdGlvbiBpbgpE
b2N1bWVudGF0aW9uL3ByaW50ay1mb3JtYXRzLnR4dCB0byBmaXggdGhlc2Ugd2FybmluZ3MuCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggTcO8bGxuZXIgPGNocmlzdG9waC5tdWVsbG5lckB2cnVs
bC5ldT4KLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2h3cHJvYmUu
YyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2h3
cHJvYmUuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvaHdwcm9iZS5j
CmluZGV4IGM0NzQ4OTFkZjMwNy4uYWJiODI1ODExYzcwIDEwMDY0NAotLS0gYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2h3cHJvYmUuYworKysgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2h3cHJvYmUuYwpAQCAtMjksNyArMjksNyBAQCBpbnQg
bWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJCS8qIEZhaWwgaWYgdGhlIGtlcm5lbCBjbGFp
bXMgbm90IHRvIHJlY29nbml6ZSBhIGJhc2Uga2V5LiAqLwogCQlpZiAoKGkgPCA0KSAmJiAocGFp
cnNbaV0ua2V5ICE9IGkpKQogCQkJa3NmdF9leGl0X2ZhaWxfbXNnKCJGYWlsZWQgdG8gcmVjb2du
aXplIGJhc2Uga2V5OiBrZXkgIT0gaSwgIgotCQkJCQkgICAia2V5PSVsZCwgaT0lbGRcbiIsIHBh
aXJzW2ldLmtleSwgaSk7CisJCQkJCSAgICJrZXk9JWxsZCwgaT0lbGRcbiIsIHBhaXJzW2ldLmtl
eSwgaSk7CiAKIAkJaWYgKHBhaXJzW2ldLmtleSAhPSBSSVNDVl9IV1BST0JFX0tFWV9CQVNFX0JF
SEFWSU9SKQogCQkJY29udGludWU7CkBAIC0zNyw3ICszNyw3IEBAIGludCBtYWluKGludCBhcmdj
LCBjaGFyICoqYXJndikKIAkJaWYgKHBhaXJzW2ldLnZhbHVlICYgUklTQ1ZfSFdQUk9CRV9CQVNF
X0JFSEFWSU9SX0lNQSkKIAkJCWNvbnRpbnVlOwogCi0JCWtzZnRfZXhpdF9mYWlsX21zZygiVW5l
eHBlY3RlZCBwYWlyOiAoJWxkLCAlbGQpXG4iLCBwYWlyc1tpXS5rZXksIHBhaXJzW2ldLnZhbHVl
KTsKKwkJa3NmdF9leGl0X2ZhaWxfbXNnKCJVbmV4cGVjdGVkIHBhaXI6ICglbGxkLCAlbGx1KVxu
IiwgcGFpcnNbaV0ua2V5LCBwYWlyc1tpXS52YWx1ZSk7CiAJfQogCiAJb3V0ID0gcmlzY3ZfaHdw
cm9iZShwYWlycywgOCwgMCwgMCwgMCk7Ci0tIAoyLjQxLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
