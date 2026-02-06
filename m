Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CFEEE2091
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 11:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFohkilic67s6HD5nYmashZ09sUu9mz2yHkX9vKrOQ8=; b=Mg2lnP0wd2zrVc
	kWMTnJVD2EmN1sjSk++DdBfvOQt7eVjjZ6S7tqoji1NDZXTyPjaL6oRNfcVilLJNS8U7x9L76+9hO
	Y5RlqU+eSoA0EGIEBm5x1jgkiaoDM5Q+ExV4VGOvtzP1erJX48CC+Z8qzJZABhKhMGRhXxDj7dRK2
	LcvZmJuMQZgwFajSV3F8g8gcqcinNa2IYjduWYlxD04viYrKf+qJqxLbL15mipCPZUmslO8W4MQGF
	w5ip2iONG0NcuKEl6rwJO7Ms0moh9wbB3qEZhog3/uvQalllcj3WAdN7Recvfr3HI0Gs0g8Q5JMYL
	uWERjOGmnADfr6Tg+1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKUB-0000000BGe0-2N88;
	Fri, 06 Feb 2026 11:58:55 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKUA-0000000BGde-0b9w
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 11:58:55 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2a0c20ee83dso17187445ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 03:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770379133; x=1770983933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5ZW0Lp2uS+rJ6cqos6DM9CIgCyO+gQDhoGFyA1Jyks=;
        b=MWa7JkeJ+RcArFs9wTspSkNtg+aat28OiBd6g2yjM2pAG9Rukh4WjDS37YgZynnF0w
         PzR1IdfArMWqk6grw4J6kp2J5OpbdXmTaz/HHCkUJL+295l3/o3ukIvBSNldm1/gV55J
         L3CorYdQ52ShrFQ1X7e+b1YCir0jQ/p5xIJ5FvPjEyoFQiRbowOFUWyOHW+UHWKeRvrH
         YzLQZL/xpI++t5Z3cHj3PwzGb2SPnD74FAfRxZUwxHVB+tw5VnUzUjG5Xd7LIpujL0mT
         v4YxOCIFqPIv/vQRArb613jxvRZo8MMq6S7icxZgVkLPSomyJXHXKX2ISmFUk6VXR6YH
         8xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770379133; x=1770983933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n5ZW0Lp2uS+rJ6cqos6DM9CIgCyO+gQDhoGFyA1Jyks=;
        b=ZUXS70vu+R6HiDIaGV2nvx6p+5Tok+zMteQncuTMVE2V0lUu0WISuL+XzFganXUQq2
         GI6aJJ6cPoX7nJaX/cHiv48kbM2pncpqnR0GVR+EC4r0f1k81KlwLak46BQjaUdk4qwB
         CxFTm2PqXaLsMIpe51z+y0m2q8meTOiWOgsEWfvSZRmM8rWMQ0tHoZC8RsumB682owDr
         MbyNeUcVXv6tKW98OHGBHdHQUZO33QWCgiEd+d8CEpO46bwq8Xu7lxcETn7wTePwLBrK
         lP0wiB7wWm0iZsJqLVDTCCiYSr94Z71wD/rVn+Pbql9bJdcBJUU0kIxUU4wQSABZwb6N
         Zujw==
X-Forwarded-Encrypted: i=1; AJvYcCXtUyFXyctCjogDKOQkB62tCV1DfZjMT8AEQSW1/wnTvgQUmCK1APKFnd7CsSO+eIh68ePtH0fk35ME+w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3kCE5TM/34swalcxy4q88RG0zEtp1PbTyouBIAIMGthaTnwkh
	Zjc62KHvbBe45p0LWw5gOB3YpK9uOLSWoEeubqqHezo60BZQqA1WArue
X-Gm-Gg: AZuq6aKRthr4bcpVws0UP61kYpFg9hD34lgxpsfW9h3zCzFOcNGPgWStHRP9min5GmS
	TfaKop2DqRNvtmu+dFEJcQwcK9KRpki1Bj8YGF41VvSl71a+kfc+Fd1BABe8QggiM4VlBeQbttU
	DzuljBiHKMnGMFd281D+y8OOH8C2oHF2yc0q7AU2k3ut8OkghRKbJ2ESgNqdAPMQ9Q369Qoqdfj
	YQnFUYJeO0FNxkV1KQcLInw0V+Qp/gcjED8YciNn+DGT2jnibHhYsIFJeMb3z+aeoL0HVtMbYlj
	6GKBzouNbejHRDKMRPCjPz6UG517COtsdiOsrFRUpGxt0AciD673rLyG1dLXJXw/IoejaF2mKrh
	KfFyIQTMZcrkWaI3WEap7fknxsViq3kHwSMgJaoD/TsMOuQuKSJwF+6IHEzdjtNJ558xaEhiSHK
	3BmK2BaTk07vdf3GwYI2M=
X-Received: by 2002:a17:903:8c3:b0:2a7:7c72:42b6 with SMTP id d9443c01a7336-2a95162538amr31216585ad.18.1770379133082;
        Fri, 06 Feb 2026 03:58:53 -0800 (PST)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c8ac5asm22856395ad.35.2026.02.06.03.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:58:52 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org,
	bjorn@kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jiang.biao@linux.dev
Subject: [PATCH bpf-next v2 1/3] bpf, riscv: introduce emit_store_stack_imm64() for trampoline
Date: Fri,  6 Feb 2026 19:58:21 +0800
Message-ID: <20260206115823.1070354-2-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206115823.1070354-1-dongml2@chinatelecom.cn>
References: <20260206115823.1070354-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_035854_184679_19A2A8B1 
X-CRM114-Status: GOOD (  11.99  )
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

SW50cm9kdWNlIGEgaGVscGVyIHRvIHN0b3JlIDY0LWJpdCBpbW1lZGlhdGUgb24gdGhlIHRyYW1w
b2xpbmUgc3RhY2sgd2l0aAphIGhlbHAgb2YgYSByZWdpc3Rlci4KClNpZ25lZC1vZmYtYnk6IE1l
bmdsb25nIERvbmcgPGRvbmdtbDJAY2hpbmF0ZWxlY29tLmNuPgpUZXN0ZWQtYnk6IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAyNSArKysr
KysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggMzc4ODhhYmVlNzBj
Li5lNGY0NWUyZTdlMmYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpAQCAtOTI2LDYgKzkyNiwx
NCBAQCBzdGF0aWMgdm9pZCByZXN0b3JlX3N0YWNrX2FyZ3MoaW50IG5yX3N0YWNrX2FyZ3MsIGlu
dCBhcmdzX29mZiwgaW50IHN0a19hcmdfb2ZmLAogCX0KIH0KIAorc3RhdGljIHZvaWQgZW1pdF9z
dG9yZV9zdGFja19pbW02NCh1OCByZWcsIGludCBzdGFja19vZmYsIHU2NCBpbW02NCwKKwkJCQkg
ICBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKK3sKKwkvKiBMb2FkIGltbTY0IGludG8gcmVn
IGFuZCBzdG9yZSBpdCBhdCBbRlAgKyBzdGFja19vZmZdLiAqLworCWVtaXRfaW1tKHJlZywgKHM2
NClpbW02NCwgY3R4KTsKKwllbWl0X3NkKFJWX1JFR19GUCwgc3RhY2tfb2ZmLCByZWcsIGN0eCk7
Cit9CisKIHN0YXRpYyBpbnQgaW52b2tlX2JwZl9wcm9nKHN0cnVjdCBicGZfdHJhbXBfbGluayAq
bCwgaW50IGFyZ3Nfb2ZmLCBpbnQgcmV0dmFsX29mZiwKIAkJCSAgIGludCBydW5fY3R4X29mZiwg
Ym9vbCBzYXZlX3JldCwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCiB7CkBAIC05MzMsMTIg
Kzk0MSwxMCBAQCBzdGF0aWMgaW50IGludm9rZV9icGZfcHJvZyhzdHJ1Y3QgYnBmX3RyYW1wX2xp
bmsgKmwsIGludCBhcmdzX29mZiwgaW50IHJldHZhbF9vZgogCXN0cnVjdCBicGZfcHJvZyAqcCA9
IGwtPmxpbmsucHJvZzsKIAlpbnQgY29va2llX29mZiA9IG9mZnNldG9mKHN0cnVjdCBicGZfdHJh
bXBfcnVuX2N0eCwgYnBmX2Nvb2tpZSk7CiAKLQlpZiAobC0+Y29va2llKSB7Ci0JCWVtaXRfaW1t
KFJWX1JFR19UMSwgbC0+Y29va2llLCBjdHgpOwotCQllbWl0X3NkKFJWX1JFR19GUCwgLXJ1bl9j
dHhfb2ZmICsgY29va2llX29mZiwgUlZfUkVHX1QxLCBjdHgpOwotCX0gZWxzZSB7CisJaWYgKGwt
PmNvb2tpZSkKKwkJZW1pdF9zdG9yZV9zdGFja19pbW02NChSVl9SRUdfVDEsIC1ydW5fY3R4X29m
ZiArIGNvb2tpZV9vZmYsIGwtPmNvb2tpZSwgY3R4KTsKKwllbHNlCiAJCWVtaXRfc2QoUlZfUkVH
X0ZQLCAtcnVuX2N0eF9vZmYgKyBjb29raWVfb2ZmLCBSVl9SRUdfWkVSTywgY3R4KTsKLQl9CiAK
IAkvKiBhcmcxOiBwcm9nICovCiAJZW1pdF9pbW0oUlZfUkVHX0EwLCAoY29uc3QgczY0KXAsIGN0
eCk7CkBAIC0xMTIzLDEzICsxMTI5LDEwIEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBm
X3RyYW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJZW1pdF9zZChSVl9SRUdf
RlAsIC1zcmVnX29mZiwgUlZfUkVHX1MxLCBjdHgpOwogCiAJLyogc3RvcmUgaXAgYWRkcmVzcyBv
ZiB0aGUgdHJhY2VkIGZ1bmN0aW9uICovCi0JaWYgKGZsYWdzICYgQlBGX1RSQU1QX0ZfSVBfQVJH
KSB7Ci0JCWVtaXRfaW1tKFJWX1JFR19UMSwgKGNvbnN0IHM2NClmdW5jX2FkZHIsIGN0eCk7Ci0J
CWVtaXRfc2QoUlZfUkVHX0ZQLCAtaXBfb2ZmLCBSVl9SRUdfVDEsIGN0eCk7Ci0JfQorCWlmIChm
bGFncyAmIEJQRl9UUkFNUF9GX0lQX0FSRykKKwkJZW1pdF9zdG9yZV9zdGFja19pbW02NChSVl9S
RUdfVDEsIC1pcF9vZmYsICh1NjQpZnVuY19hZGRyLCBjdHgpOwogCi0JZW1pdF9saShSVl9SRUdf
VDEsIG5yX2FyZ19zbG90cywgY3R4KTsKLQllbWl0X3NkKFJWX1JFR19GUCwgLW5yZWdzX29mZiwg
UlZfUkVHX1QxLCBjdHgpOworCWVtaXRfc3RvcmVfc3RhY2tfaW1tNjQoUlZfUkVHX1QxLCAtbnJl
Z3Nfb2ZmLCBucl9hcmdfc2xvdHMsIGN0eCk7CiAKIAlzdG9yZV9hcmdzKG5yX2FyZ19zbG90cywg
YXJnc19vZmYsIGN0eCk7CiAKLS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
