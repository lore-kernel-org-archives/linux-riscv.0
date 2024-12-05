Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B2AE7716C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OfOkZuBD12bCnuLpYzh9cbEV63n6BA3XjTcVfnb4/3w=; b=Ztj+tTHPLhvgTb
	vj/Ng7MP8MCJ9afFPHkxfIup0lh3PIOd4caqzOKUKWTUSK7KOOVU9Q35aiWou3hMWZzbktPeVi8OB
	BHhy53F0hl+qtRnXsJNHQYjh0JP8oXna6SQZXnzCObRsWkwS4RFAINTUafn96ysqoY9nmiHnhCVtS
	82CQKF16OJkC3OHpl6P6HSVFk99TCXxmOJWvtq/0c5O8ek8ptjg8MnZq4iGKPxN7Z1tStqYuc68iQ
	FGorf66ycdYUyC+5kJjV6/03o/4P8/rrKpsgbgdzD5E8BSb2SmYg9c8Ckdd8+sZCCK86pS6Fahboa
	qmJ06xsD67vj+itMk01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDou-0000000GXu0-0BeJ;
	Thu, 05 Dec 2024 15:31:12 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDop-0000000GXrf-11CP
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 15:31:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-385e0e224cbso558851f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 07:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733412664; x=1734017464; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dtS1bKOZ3hPKA4NVU4gutae53nEuJSLIZSDEzMhQ8d4=;
        b=fVQ3ySfEeniQcjbIMAhwsW/caJLXR3jy2WtpUg6gSxtfZ+4fvvm4s1tBHGnC/eLPEH
         q+X755iAWDvG+iG90TScqQ7VIY478x3fDL8IiEAl6y1aldOR78kzHI5SEeW0KMd3gvEC
         Ie8HSrPb5RqAEQRBiwH/kqeZY6LI2IDIMI5VswUuKWc6BwQSHLm+SVcOgFpUUZvL8JV4
         ClDJvJICpukHtAi8hVohqW4lXYw9lmy5jJygtuJ0AHEX8TmH6f9ntmomssy4S/tsvYUR
         zkXbWOJNhPwGoKYEXYds2INidNYOtTpnKqEAcoOQzDMbE/C81sfKWmyrfSjTBnwNCOxx
         1Ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733412664; x=1734017464;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtS1bKOZ3hPKA4NVU4gutae53nEuJSLIZSDEzMhQ8d4=;
        b=DLGKOZip+sjDxC68tLKSEEgPfgFMk1d+4377Sljc++9TGtoiAsmaVonOjRgyqTmW97
         e4ye67zHxBTOzT3rKzLjaay8tK232XzKQSh+drpuqOI8xhEZ1cjTB/EEl7efUZ373b4u
         VYqVEIzC8ShXD7JTvz7jFKbcqJrAXDjSnyh6p8DzYiRWHe6ZCV1AQFTHCtRY2T/0id7B
         OYGRpL1zSUFEY1yqBlznCwwOzvAlsrfI5MuqtGVUGF4q1xTvXhRBekHXA3QzP41PyrzT
         XdWCev4K28muUL+hm8PbHnv60OLvNwEQgMeGdzI8JJumkT8xW9VD3W2YIQnmdpWOpx/f
         2sZw==
X-Gm-Message-State: AOJu0YwG+oqmWOVJLe0a/Mu1MGO2AkCaiK7azpkqWRGNyCNtoXiCfmiO
	ekH8SvUZPPBJAstP8flD4QWdvHi6jYaBC5ziXNAyQ963eUjIbd9fKhq2XZjFoP4=
X-Gm-Gg: ASbGnctjcytDRxyiqwfoe5mYBU+1j0XRriig9Oa0FNEd7hYQ4kknUurDncmTFXWQkgZ
	eaJkS7N0oAk5T5nRZwkFPxQWfrV2CmMqwERVc2Csf/IYec3ImQeY5jLWddM6MYLyBHsTRnd23FT
	e9+95o6PYkatoB0sbnaBcTxPO/nu8tGYrTOgICn9RSpgjsm3ArIUSqf4sn5+4K9R+1hHLpxbCbs
	YQpCZd3gGMaPTS81GKgvipdgH2ZOj2PROCRwg==
X-Google-Smtp-Source: AGHT+IFykNNt5I74DWAWk9fEIuIL6X0Y3aoyfQBFjOQdIdFjY+RLYTWdqmooS1ZbDOTp+bzVO9jxvA==
X-Received: by 2002:a05:6000:2a85:b0:382:49f9:74bb with SMTP id ffacd0b85a97d-385fd3f92f8mr7466485f8f.35.1733412664560;
        Thu, 05 Dec 2024 07:31:04 -0800 (PST)
Received: from localhost ([152.250.153.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef27078a86sm3411309a91.35.2024.12.05.07.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 07:31:04 -0800 (PST)
From: "Ricardo B. Marliere" <rbm@suse.com>
Date: Thu, 05 Dec 2024 12:31:01 -0300
Subject: [PATCH] riscv: Constify ctl_table variables
MIME-Version: 1.0
Message-Id: <20241205-sysctl_const-riscv-v1-1-04231ca9a78f@suse.com>
X-B4-Tracking: v=1; b=H4sIADTHUWcC/x3MTQqAIBBA4avErBPU/qirRETpVANh4UQU4t2Tl
 t/ivQCMnpChywJ4vInpcAkqz8Bsk1tRkE0GLXWptKwEv2yufTSH40t4YnOLeWoLa61sVFVDCk+
 PCz3/tB9i/AA7C0jpZAAAAA==
X-Change-ID: 20241205-sysctl_const-riscv-ba93ddd07156
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1802; i=rbm@suse.com;
 h=from:subject:message-id; bh=FVQB62YfVdS6LV25/gpSV866FvSEUm9K/5r4tQYw+TU=;
 b=owEBbQKS/ZANAwAIAckLinxjhlimAcsmYgBnUcc2NFGiCmkdwwlB23DFBjbPBAsnKPwrp+Aex
 V/vWo7CSliJAjMEAAEIAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZ1HHNgAKCRDJC4p8Y4ZY
 pqkdD/45o5I6UbMj9rFLqPyz+SFZ+dS9mlwTzLvaaMx4cdZcda5P1645pEhypH81gaOnOiXbfTi
 fWurP1ALzm5PHH+wOWNNEd/W0jeZCkPhkIiv1UqmvFjOMS132V4+lQwXd6/ecSFrsHCGH/p6X+j
 FjxLeTZ4ZAHZv2xSDVPEp3NOUyM9OA+e+LKwXcQ+Xn7aMhXJqFrtGeEtyN1PdaxY9lhcxz2rlM7
 UqzwPjnS7pGiL7b61JWdPgjdy7Cu97Jg+TqnnNIHQ01jDwbEGXS8UZB3vBQODBJ1k9l2pXwDhfe
 xB4D9VpBBMGSNojPJhtUd3/RIHYD81fwV20lfQHL89lD6k/B77fkP6Nw8N4KUQr+xpVdoXPUU/T
 A/e0CRB4Mi3vkNo6Q6fvWnwgyz9gDfpFXCkOlL1qzsZLMVW6bOXnawcAzPHzJA+anDVZJcksYf3
 E8d5PTz6dHEo4Bi6uSYHIbnygemaHf3IbE44brYUGjofACXP/FJMPp7g96JUc2CO5Rx0ZckUblp
 CTVVLeoaI+hWG0NU7C7C0M036aBOEz0mafWZCDOyCM7QP2Mw+iiKG/55wL+ntvNPR7kFuumeXIn
 /dteHOOqDyDCi/R8ypNQKAvpNRe+XM0+pJklB6s+cZ0/cb1zWtfEEbwvk2bJ4xJpa0Y825sBiYm
 8AR9dnCJ1HW7PjA==
X-Developer-Key: i=rbm@suse.com; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_073107_289240_37ACE176 
X-CRM114-Status: UNSURE (   9.75  )
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

U2luY2UgN2FiYzliNTNiZDUxICgic3lzY3RsOiBhbGxvdyByZWdpc3RyYXRpb24gb2YgY29uc3Qg
c3RydWN0CmN0bF90YWJsZSIpLCBpdCBpcyBwb3NzaWJsZSB0byBwdXQgY3RsX3RhYmxlIHZhcmlh
YmxlcyBpbnRvIHJlYWQtb25seQpzdG9yYWdlLiBTbywgbWFrZSB0YWdnZWRfYWRkcl9zeXNjdGxf
dGFibGUgYW5kIHJpc2N2X3ZfZGVmYXVsdF92c3RhdGVfdGFibGUKY29uc3QuCgpDYzogVGhvbWFz
IFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0PgpTdWdnZXN0ZWQtYnk6IFRob21hcyBX
ZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KU2lnbmVkLW9mZi1ieTogUmljYXJkbyBC
LiBNYXJsaWVyZSA8cmJtQHN1c2UuY29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3Mu
YyB8IDIgKy0KIGFyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jICB8IDIgKy0KIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwppbmRl
eCA1OGI2NDgyYzJiZjY2MmJmNTIyNGNhNTBjOGUyMWE2ODc2MGE2YjQxLi43ODkxMjk0YWJmNDkz
N2RlM2M3ZTQ0MDU3Mzg0NDI1M2U4NTZiMzlmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9wcm9jZXNzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCkBAIC0zNjQsNyAr
MzY0LDcgQEAgc3RhdGljIGJvb2wgdHJ5X3RvX3NldF9wbW0odW5zaWduZWQgbG9uZyB2YWx1ZSkK
ICAqIGRpc2FibGUgaXQgZm9yIHRhc2tzIHRoYXQgYWxyZWFkeSBvcHRlZCBpbiB0byB0aGUgcmVs
YXhlZCBBQkkuCiAgKi8KIAotc3RhdGljIHN0cnVjdCBjdGxfdGFibGUgdGFnZ2VkX2FkZHJfc3lz
Y3RsX3RhYmxlW10gPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGN0bF90YWJsZSB0YWdnZWRfYWRk
cl9zeXNjdGxfdGFibGVbXSA9IHsKIAl7CiAJCS5wcm9jbmFtZQk9ICJ0YWdnZWRfYWRkcl9kaXNh
YmxlZCIsCiAJCS5tb2RlCQk9IDA2NDQsCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92
ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCmluZGV4IDgyMTgxODg4NmZhYjA2
YWEwNTRlMmJhMzI2Njg5N2U5YjRkMTYxYzAuLmQwMjJiMDI4YWMzZmY1Mzc1ZjUyMjk0N2QzNDE2
NjI2NmNlYjQyNGEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCisrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCkBAIC0yODcsNyArMjg3LDcgQEAgbG9uZyByaXNj
dl92X3ZzdGF0ZV9jdHJsX3NldF9jdXJyZW50KHVuc2lnbmVkIGxvbmcgYXJnKQogCiAjaWZkZWYg
Q09ORklHX1NZU0NUTAogCi1zdGF0aWMgc3RydWN0IGN0bF90YWJsZSByaXNjdl92X2RlZmF1bHRf
dnN0YXRlX3RhYmxlW10gPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGN0bF90YWJsZSByaXNjdl92
X2RlZmF1bHRfdnN0YXRlX3RhYmxlW10gPSB7CiAJewogCQkucHJvY25hbWUJPSAicmlzY3Zfdl9k
ZWZhdWx0X2FsbG93IiwKIAkJLmRhdGEJCT0gJnJpc2N2X3ZfaW1wbGljaXRfdWFjYywKCi0tLQpi
YXNlLWNvbW1pdDogOGQ0ZjFlMDVmZjgyMWE1ZDU5MTE2YWI4YzNhMzBmY2FlODFkODU5NwpjaGFu
Z2UtaWQ6IDIwMjQxMjA1LXN5c2N0bF9jb25zdC1yaXNjdi1iYTkzZGRkMDcxNTYKCkJlc3QgcmVn
YXJkcywKLS0gClJpY2FyZG8gQi4gTWFybGllcmUgPHJibUBzdXNlLmNvbT4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
