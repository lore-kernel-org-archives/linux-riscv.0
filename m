Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296EDE7B60F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IlcqwAesteoMcjgVjXnPtF99VU0EXVLZ/st5cfmnCPA=; b=whn/5Ix1DMgZML
	cK0K3sANLraO4dx8BRJ/QCDoxEdgpm1aBelYTcM2ciUTolQIUZB5k/V8j+KkSvR88afC7MJ1RpHJ+
	xg4UZLsgeNDuK/Rbj1cxm5rlS8Vbw7au6tnNEl7B1NTT5+AnY2ZZyx1dGdx6F2Lu2+6vc+djGwGlm
	IojCNyrB4m1mdWWO6sgeazHQwC1w61KTd3lcx+7yEamMHm44JxAVE4k6nRskS+oKYZqdlaxWbbiY+
	Oq09rqKUjl8EsSniWZkEc1cvFJdob76jiNf6oq+41W/NbuTR9ynV7iB32hLSzg+fb/GCKHwmqI2Je
	2YQOiqbllJZUziAislcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo1e9-0005SM-13;
	Wed, 04 Oct 2023 13:10:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo1e3-0005Rh-2P
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 13:10:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-406532c49dcso4704595e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 06:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696425028; x=1697029828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z15iGiezxYK5XcqIfgGulDEdBAkSg8R0+TumWNSNnqo=;
        b=f8GU09IB4t5MYfCS1fQ1jk8SJ45pPm349jGHoT7zGQc5lbjHwMtnIdGa85Am5VYTSd
         qBD/ec1MFzHNm2KrZnn725mJmnzikLL7T4Ngrx2CN0GJfYGE3O784ns3dwd1T6ujpkog
         oxoDbNiEsVOdwK02QsWwH4CtbX0NLYsjGRnHu5HHwiiBhfGh40Fpqc8c468WlaI6PNpY
         kRIpuEMP7zrBNIBS346SxsSLUoii9otwRLpaEbRNeVdoSeRoCgu6qq1DjlxH63OY35oL
         XJa1BS/vPA4+BBHQwBDyFRezvxwSe+3xQ2TehgfM0hzmwH8YWY9zhkv+NOFV88bZWhUc
         LUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696425028; x=1697029828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z15iGiezxYK5XcqIfgGulDEdBAkSg8R0+TumWNSNnqo=;
        b=u+RYH9WN8JRQsg8Vf6Z0wm4glLIGMUd8PgApz2E+ZAnhmUIemgvufofnHhFf4438ZO
         hl27Nvpb7qqh3+8i4i3x474moUSweoGxMpFuEwdFZHXvKwezhrlTtVD7YtmUOqDp6UjG
         cbuU+8RbWqZrtbC5NOl5981F7k79HvaezYnZxJ6NBqLCVVwNrGXERlYBxa0bq2AI0JGd
         F3L1KvKyLkze3UpWiJYGlaSDbfIARcvWGe3Ujqw4LVpDiUANVIJB7XblURwkzANq7yJn
         582lndVpnaA+93+ReQsxg1rxyy68tc/9tZjMEVFk3erb6vHYi9PtKGLq6sFKXtIEYMcd
         RJBQ==
X-Gm-Message-State: AOJu0YwK3DQ6buPe6UKyndrp1i6F09Qwe6tduI8hZ2xRUQwPHVUFZVnV
	ku5qvfaDdkL7tBfYhA0rIZifhA==
X-Google-Smtp-Source: AGHT+IFnbZnW549ZWt1PzlFvEq2ZFwMTlc5GL20gDuzsNXnx6EeJFuLFcPl6tcuFSBDuZ7Gy71wyWw==
X-Received: by 2002:a7b:ca59:0:b0:3fe:d637:7b25 with SMTP id m25-20020a7bca59000000b003fed6377b25mr2345430wml.0.1696425027197;
        Wed, 04 Oct 2023 06:10:27 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9474:8d75:5115:42cb])
        by smtp.gmail.com with ESMTPSA id m10-20020a7bce0a000000b00405953973c3sm1497074wmc.6.2023.10.04.06.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 06:10:26 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: blacklist assembly symbols for kprobe
Date: Wed,  4 Oct 2023 15:10:09 +0200
Message-ID: <20231004131009.409193-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_061032_030383_3DB49F59 
X-CRM114-Status: UNSURE (   9.34  )
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

QWRkaW5nIGtwcm9iZXMgb24gc29tZSBhc3NlbWJseSBmdW5jdGlvbnMgKG1haW5seSBleGNlcHRp
b24gaGFuZGxpbmcpCndpbGwgcmVzdWx0IGluIGNyYXNoZXMgKGVpdGhlciByZWN1cnNpdmUgdHJh
cCBvciBwYW5pYykuIFRvIGF2b2lkIHN1Y2gKZXJyb3JzLCBhZGQgQVNNX05PS1BST0JFKCkgbWFj
cm8gd2hpY2ggYWxsb3cgYWRkaW5nIHNwZWNpZmljIHN5bWJvbHMKaW50byB0aGUgX19rcHJvYmVf
YmxhY2tsaXN0IHNlY3Rpb24gYW5kIHVzZSB0byBibGFja2xpc3QgdGhlIGZvbGxvd2luZwpzeW1i
b2xzIHRoYXQgc2hvd2VkIHRvIGJlIHByb2JsZW1hdGljOgotIGhhbmRsZV9leGNlcHRpb24oKQot
IHJldF9mcm9tX2V4Y2VwdGlvbigpCi0gaGFuZGxlX2tlcm5lbF9zdGFja19vdmVyZmxvdygpCgpT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaCB8IDEwICsrKysrKysrKysKIGFyY2gvcmlzY3Yv
a2VybmVsL2VudHJ5LlMgICAgfCAgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2FzbS5oCmluZGV4IDExNGJiYWRhZWY0MS4uOTE5NGUzMzRkZTE1IDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS5oCisrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vYXNtLmgKQEAgLTE0Miw2ICsxNDIsMTYgQEAKIAlSRUdfTCB4MzEsIFBUX1Q2
KHNwKQogCS5lbmRtCiAKKy8qIEFubm90YXRlIGEgZnVuY3Rpb24gYXMgYmVpbmcgdW5zdWl0YWJs
ZSBmb3Iga3Byb2Jlcy4gKi8KKyNpZmRlZiBDT05GSUdfS1BST0JFUworI2RlZmluZSBBU01fTk9L
UFJPQkUobmFtZSkJCQkJXAorCS5wdXNoc2VjdGlvbiAiX2twcm9iZV9ibGFja2xpc3QiLCAiYXci
OwkJXAorCVJJU0NWX1BUUiBuYW1lOwkJCQkJXAorCS5wb3BzZWN0aW9uCisjZWxzZQorI2RlZmlu
ZSBBU01fTk9LUFJPQkUobmFtZSkKKyNlbmRpZgorCiAjZW5kaWYgLyogX19BU1NFTUJMWV9fICov
CiAKICNlbmRpZiAvKiBfQVNNX1JJU0NWX0FTTV9IICovCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwppbmRleCAxNDNhMmJi
M2U2OTcuLmYyNGJjNGVlZWRkZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnku
UworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCkBAIC0xMDEsNiArMTAxLDcgQEAgX3Nh
dmVfY29udGV4dDoKIDE6CiAJdGFpbCBkb190cmFwX3Vua25vd24KIFNZTV9DT0RFX0VORChoYW5k
bGVfZXhjZXB0aW9uKQorQVNNX05PS1BST0JFKGhhbmRsZV9leGNlcHRpb24pCiAKIC8qCiAgKiBU
aGUgcmV0X2Zyb21fZXhjZXB0aW9uIG11c3QgYmUgY2FsbGVkIHdpdGggaW50ZXJydXB0IGRpc2Fi
bGVkLiBIZXJlIGlzIHRoZQpAQCAtMTY3LDYgKzE2OCw3IEBAIFNZTV9DT0RFX1NUQVJUX05PQUxJ
R04ocmV0X2Zyb21fZXhjZXB0aW9uKQogCXNyZXQKICNlbmRpZgogU1lNX0NPREVfRU5EKHJldF9m
cm9tX2V4Y2VwdGlvbikKK0FTTV9OT0tQUk9CRShyZXRfZnJvbV9leGNlcHRpb24pCiAKICNpZmRl
ZiBDT05GSUdfVk1BUF9TVEFDSwogU1lNX0NPREVfU1RBUlRfTE9DQUwoaGFuZGxlX2tlcm5lbF9z
dGFja19vdmVyZmxvdykKQEAgLTI1NCw2ICsyNTYsNyBAQCByZXN0b3JlX2NhbGxlcl9yZWc6CiAJ
bW92ZSBhMCwgc3AKIAl0YWlsIGhhbmRsZV9iYWRfc3RhY2sKIFNZTV9DT0RFX0VORChoYW5kbGVf
a2VybmVsX3N0YWNrX292ZXJmbG93KQorQVNNX05PS1BST0JFKGhhbmRsZV9rZXJuZWxfc3RhY2tf
b3ZlcmZsb3cpCiAjZW5kaWYKIAogU1lNX0NPREVfU1RBUlQocmV0X2Zyb21fZm9yaykKLS0gCjIu
NDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
