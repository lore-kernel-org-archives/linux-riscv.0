Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35616C282D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGYBBpwnt3hWw/5C3fwSPGMNcDYClNDq6N78sbu4zpg=; b=btKLtDQN2+6k51
	Run7KfTTmOdg7kvq4A6329MkD+yS6CJwpRblCtYxaRrwNiOrxEifPFZG7+w8xEJhy1ukCzrJNqDMQ
	PewFZ/qKT+F7IddRZ9XjWUKGaN4B0jBFMVWC8kp1peDJpwMc3XmTurbO5VVIJXRYbbGVBOv20XLoS
	MF89A1a4Yd9xJKiL0r+OcE1qvJB8ctI8z9my08oSaahpmn0NCJQIjgglNnekb1DabA09G5tTQDGza
	RSUjlvtMIjWD01skmQvfGFeQ2hwEqdipPYQNL0EJy9JNBWdBsronSmEsu6a9KAWEqscM5kMUmuyxu
	vHYnccRnGkQAeHmE9t5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6j-00000004Zhc-1vR4;
	Tue, 04 Mar 2025 12:10:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQwg-00000004V7u-1Qr5
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 12:00:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-438a39e659cso37699295e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 04:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089621; x=1741694421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5+0DAJFyGg9dqAHMt/74M2g7aCiRWRLOEFqoe5G5I8=;
        b=KGxWbbLwsAQdDJQi8q2Vn7Df2w0luLTHHOKGEmn457XByLwx2ugI2SiqO5eJSFPvKp
         CCwf8rvdezJd9fluJWrmI4g5fFO+DHLEzrq4GCiLDum7pWexRMmdXa+ar+o1+l1bDSNB
         vC2S6BCYnyhiWFAZbXEg6MdZvAS7R3ijB8WrqQYa77/ecMEfr6SQbyaVAZmVvFTlAQfs
         gbS9x757m/59x6W7pZES8bvLcHiL3uKUhb/dU6MMixElOlVYlde1IU5IuEO+Re4Gl2oF
         Cz1zguEOLE8tFp9sHd6ihOF02U2/v1PKR2V1a12je5YVxkoDSoC8Oj1F8tsSxmGe3vAw
         EpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089621; x=1741694421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5+0DAJFyGg9dqAHMt/74M2g7aCiRWRLOEFqoe5G5I8=;
        b=kdmGDrhCl6/VUzyFq/wMxIcwFYHsGBu5nZX8EAT4PVhH+mW7qI+3941ZMS4wsS5UdE
         LIjzLUwRvz03zC5NIycW5Mpre61wWI1SsJdV/OlkdThu/CrZePwoJjrm0ug1pELi018U
         jFFsoCf88CVd6kV4Yolwd2tEKdAZjSqAWgnWjMdIXT65VgwGdBhjA2cDOLCfLGEHeXUU
         ZRn2ztFB02aKGoPwoLVwWRf5rnpZxTuy4UowzTORtzwpERyKMfLdXFqeQRvcl8nc5oUw
         TKWfOtpLAX/8U5I/DYQ2QQsg9Cxk2oy2OwyhsE9Dj9sGdzTkYxE8Gb7xCNCBul/Cc6ff
         RCBg==
X-Gm-Message-State: AOJu0YyLt3HNZnEjMZ2+RpWdeKy6wHqaiMXh9zJSEFNgkTO3QjjzkSBy
	w1BjLMZJWJEPkOis9yUzJd9FGtvYmos1wPi2/5Zw1SOnH22AKUPNlPwHWKX/7+jOgLYRQUymbhu
	e
X-Gm-Gg: ASbGncserPuDSD9imBBcdGAvvjiavw2jmY/nTL/8GdqPsyLAM1KHgHz94LbQTcxb3kR
	7EeOvcdloxL/hQealPjX2IoQ5zx0cRm9lK3vlxy6Ap3UCGCA8smxS1zx972DesqBbWmYX0HlqBB
	DKGhPmyIW0GOklhY8k91QDI8W3Sr/JwxvWdHcscoBYtnibOMP6g0JCX/BloACl2bbngIuShFs37
	wH5RGmIuvT+eTnv54Ejbg7aQDMhtAwDQeS4CrqfnRHzmF50oLfrF3M5nqMCxk7NH9vcdBRbfngE
	0bi29akOUJWf7ykQllqXdONqyWnONZe2
X-Google-Smtp-Source: AGHT+IEqMgV5t8PcK9JSG+SOO4LPXPlwofpngejjCplSgEhGn5nYR0XjUC86Q3nC0sypwkMwdVM5mQ==
X-Received: by 2002:a05:600c:4693:b0:439:8523:36cc with SMTP id 5b1f17b1804b1-43ba66e66d7mr161122735e9.11.1741089620734;
        Tue, 04 Mar 2025 04:00:20 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795962sm17966864f8f.13.2025.03.04.04.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:20 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 4/8] riscv: Change check_unaligned_access_speed_all_cpus to void
Date: Tue,  4 Mar 2025 13:00:19 +0100
Message-ID: <20250304120014.143628-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_040022_379179_F023380F 
X-CRM114-Status: GOOD (  12.17  )
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

VGhlIHJldHVybiB2YWx1ZSBvZiBjaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVz
KCkgaXMgYWx3YXlzCnplcm8sIHNvIG1ha2UgdGhlIGZ1bmN0aW9uIHZvaWQgc28gd2UgZG9uJ3Qg
bmVlZCB0byBjb25jZXJuIG91cnNlbHZlcwp3aXRoIGl0LiBUaGUgY2hhbmdlIGFsc28gYWxsb3dz
IHVzIHRvIHRpZHkgdXAKY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cygpIGEgYml0LgoK
UmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3
ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jp
c2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgfCAxNSArKysrKy0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYwppbmRleCAwMmI0ODVkYzRiYzQu
Ljc4MGYxYzVmNTEyYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2Fj
Y2Vzc19zcGVlZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3Bl
ZWQuYwpAQCAtMjE4LDcgKzIxOCw3IEBAIHN0YXRpYyBpbnQgcmlzY3Zfb2ZmbGluZV9jcHUodW5z
aWduZWQgaW50IGNwdSkKIH0KIAogLyogTWVhc3VyZSB1bmFsaWduZWQgYWNjZXNzIHNwZWVkIG9u
IGFsbCBDUFVzIHByZXNlbnQgYXQgYm9vdCBpbiBwYXJhbGxlbC4gKi8KLXN0YXRpYyBpbnQgX19p
bml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXModm9pZCkKK3N0YXRpYyB2
b2lkIF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVzKHZvaWQpCiB7
CiAJdW5zaWduZWQgaW50IGNwdTsKIAl1bnNpZ25lZCBpbnQgY3B1X2NvdW50ID0gbnVtX3Bvc3Np
YmxlX2NwdXMoKTsKQEAgLTIyNiw3ICsyMjYsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBjaGVja191
bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVzKHZvaWQpCiAKIAlpZiAoIWJ1ZnMpIHsKIAkJ
cHJfd2FybigiQWxsb2NhdGlvbiBmYWlsdXJlLCBub3QgbWVhc3VyaW5nIG1pc2FsaWduZWQgcGVy
Zm9ybWFuY2VcbiIpOwotCQlyZXR1cm4gMDsKKwkJcmV0dXJuOwogCX0KIAogCS8qCkBAIC0yNjEs
MTIgKzI2MSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX3Nw
ZWVkX2FsbF9jcHVzKHZvaWQpCiAJfQogCiAJa2ZyZWUoYnVmcyk7Ci0JcmV0dXJuIDA7CiB9CiAj
ZWxzZSAvKiBDT05GSUdfUklTQ1ZfUFJPQkVfVU5BTElHTkVEX0FDQ0VTUyAqLwotc3RhdGljIGlu
dCBfX2luaXQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1cyh2b2lkKQorc3Rh
dGljIHZvaWQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXModm9p
ZCkKIHsKLQlyZXR1cm4gMDsKIH0KICNlbmRpZgogCkBAIC00MDMsMTAgKzQwMSwxMCBAQCBzdGF0
aWMgaW50IF9faW5pdCB2ZWNfY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1cyh2
b2lkICp1bnVzZWQgX19hbHdheQogCiBzdGF0aWMgaW50IF9faW5pdCBjaGVja191bmFsaWduZWRf
YWNjZXNzX2FsbF9jcHVzKHZvaWQpCiB7Ci0JYm9vbCBhbGxfY3B1c19lbXVsYXRlZDsKIAlpbnQg
Y3B1OwogCi0JYWxsX2NwdXNfZW11bGF0ZWQgPSBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxh
dGVkX2FsbF9jcHVzKCk7CisJaWYgKCFjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2Fs
bF9jcHVzKCkpCisJCWNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXMoKTsKIAog
CWlmICghaGFzX3ZlY3RvcigpKSB7CiAJCWZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQpAQCAtNDE3
LDkgKzQxNSw2IEBAIHN0YXRpYyBpbnQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxs
X2NwdXModm9pZCkKIAkJCSAgICBOVUxMLCAidmVjX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3Bl
ZWRfYWxsX2NwdXMiKTsKIAl9CiAKLQlpZiAoIWFsbF9jcHVzX2VtdWxhdGVkKQotCQlyZXR1cm4g
Y2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1cygpOwotCiAJcmV0dXJuIDA7CiB9
CiAKLS0gCjIuNDguMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
