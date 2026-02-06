Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8F3EE2084
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 11:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DENNtL+FLTzRjqVBQ13AWGbrWC/QiHJ/nVix6roD4Y=; b=Vtg6IehjmZbOsO
	wvNJNqkVLUEVx+9A74C0KDY7b8q/vrz/SBiNXi2ZfvadoFakTsIIYGEN3md3/LJfC06X1nyGsX2DZ
	XecE1aFyVl56NCQNunaqDpYsNbMlqMyvcU6QE4YKJlKjrE0nGKvQ3+dk/9AQO89IPuav7dMie6XPF
	sxiiFcWEbs1DlxjM4e5g2759329d47R+E+EZ6o44EWzS+v3krwbdFTXBhG8/Du7SGARiqmMn6GfLD
	RGNl+qKpWftL3hNWwp73hOgutGGqHuaS1/kipOmq7c0lPh0fhpqsnx76NDPxF0cmpuZpvzzu10uFG
	+tDPM3zMQY/7uZJ/FmCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKUc-0000000BGko-0pn1;
	Fri, 06 Feb 2026 11:59:22 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKUZ-0000000BGjY-43oR
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 11:59:21 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2a95bfdb31eso447925ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 03:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770379159; x=1770983959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOZtDu7jSNri6wkbo2wj70FyVnPCcpHXFtiLHwbu29Y=;
        b=YW2LgpxIDHN3rXDLidoGFhHlfDM0bj9/n2Z65bFawIt07J97DQ72jir47mktf9pypK
         K8LWSFzjRcsBsPm19UAvrWFzCNcGJmnnRrQPEHhF9UUTOb5vbnrqH+PZhWTZw9qNwRJo
         j5WDBVSY+B6vltoT1E44sr1SjFpLoAbvpj4MFq9uasm8gP2c3pvwtxJ7Lgb+gqIjHBFA
         HcsTRS2s3fvjREx0m6ZQOxkl5rhXW09uHcEMjlM/Av6R+y0q/IGXT5i1w1Cau4MlPexk
         hwOJV8+HsoyRDuSSfn3ady5FOgyF/rD8bMbwNEuN70hYgXkmzb9GGR+0TTKCzPRj5yyc
         /Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770379159; x=1770983959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOZtDu7jSNri6wkbo2wj70FyVnPCcpHXFtiLHwbu29Y=;
        b=A1eos4pp8ARYWgclHNlRE+l1Onmz4BLkzRRtiZEpH+nHfpV0+c0NzomgGeifY5qaX5
         kcrXy9dqW3crOeWorBDhuyfvZFJCHi4XebdmyThiO3ulb3DymqUZs0qVoooz+cmXuNM2
         ugDnp/MUrOaA7uFW4HgPPPErasHL4p3Zx2KmkcDFA0A4Wn53SaONoFKoDLya83kZ7dpG
         JKbiX2YAlHg+oTzpa0EkYmLX90rBkOIAFLHPC+3H9CHEeE9pjsNi0RBknBpRsEMi0Umb
         QMFhSeCrtSI3yoeF0nshI8zzwSlh6juXT6ID9PEW3NYq710wn/ojjdQFK5hs+rv0vHqz
         0LuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD5Ef/KFpfdd902z2haLgUv/f9AcTa9VjSdrWvrawwHifiyZMDqGjRyMPkmBoh3Xvtex20+zvJLJBWiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFMNkud/oT2s5AEaCAM1LrxQqbZ18IZoTO3N332A7YE8VHTrcl
	5ZTIz+B09AT/JYdzYatEitsfpcQTQRRBceVW6OP3H/EZ75HINY9QaOu1
X-Gm-Gg: AZuq6aIrfCBBmrVYelOAz1qnWj8YbU+7rc9V8P+54jbGBxf9eItkL3w6s+AZztr5Lz0
	6gcY7RueB3BcIduwGa/5PKe4ZXC3eVpWZmbTbjJO+EEEOf53QxhWbsqv6uI2FrM5dY2St64MeTK
	RrK2yWH0NpKV4VWLryggN/9gTKy4gb7ZBOdRtbtl31mALohuefSANVfC3Dob4Q/RQJnaStdsWdh
	Bqmxp/h0kXxBCYGfEz1OpO0JSbb3aOxETbo1ktj5BLQ+qfz0GVbYc42quexb1oDn2Nfkji1lWI8
	do7i1Msd0IltaFcBfVZ8KMu0ZCfpMnqbVzVkUxWAkZU7EdbOylPWPgIje6sRIxWDHGAZJnjto0R
	YSEs3BR/l2o8TlpzAgOQsn11UYK80ZfQfw2fRmX8SlvqpNdwBY1PAbtYwwP5d2bZJ/UAq8oXUop
	bC3kXC8Vxal+U4qZBIFuo=
X-Received: by 2002:a17:902:d58a:b0:2a0:f0e5:3f5c with SMTP id d9443c01a7336-2a9521f3f28mr26054885ad.34.1770379158955;
        Fri, 06 Feb 2026 03:59:18 -0800 (PST)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c8ac5asm22856395ad.35.2026.02.06.03.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:59:18 -0800 (PST)
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
Subject: [PATCH bpf-next v2 3/3] selftests/bpf: enable fsession_test on riscv64
Date: Fri,  6 Feb 2026 19:58:23 +0800
Message-ID: <20260206115823.1070354-4-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206115823.1070354-1-dongml2@chinatelecom.cn>
References: <20260206115823.1070354-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_035920_006025_9707E5E1 
X-CRM114-Status: GOOD (  10.19  )
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

Tm93IHRoYXQgdGhlIFJJU0MtViB0cmFtcG9saW5lIEpJVCBzdXBwb3J0cyBCUEZfVFJBQ0VfRlNF
U1NJT04sIHJ1bgp0aGUgZnNlc3Npb24gc2VsZnRlc3Qgb24gcmlzY3Y2NCBhcyB3ZWxsIGFzIHg4
Nl82NC4KClNpZ25lZC1vZmYtYnk6IE1lbmdsb25nIERvbmcgPGRvbmdtbDJAY2hpbmF0ZWxlY29t
LmNuPgpUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CkFja2VkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2JwZi9wcm9ncy9nZXRfZnVuY19hcmdzX3Rlc3QuYyB8IDIgKy0KIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9nZXRfZnVuY19pcF90ZXN0LmMgICB8IDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9nZXRfZnVuY19hcmdzX3Rlc3QuYyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9nZXRfZnVuY19hcmdzX3Rlc3QuYwpp
bmRleCAxODBiYTUwOThjYTEuLjA3NWExMTgwZWMyNiAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvYnBmL3Byb2dzL2dldF9mdW5jX2FyZ3NfdGVzdC5jCisrKyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9nZXRfZnVuY19hcmdzX3Rlc3QuYwpAQCAtMTY3LDcg
KzE2Nyw3IEBAIGludCBCUEZfUFJPRyh0cF90ZXN0MikKIH0KIAogX191NjQgdGVzdDdfcmVzdWx0
ID0gMDsKLSNpZiBkZWZpbmVkKGJwZl90YXJnZXRfeDg2KSB8fCBkZWZpbmVkKGJwZl90YXJnZXRf
YXJtNjQpCisjaWYgZGVmaW5lZChicGZfdGFyZ2V0X3g4NikgfHwgZGVmaW5lZChicGZfdGFyZ2V0
X2FybTY0KSB8fCBkZWZpbmVkKGJwZl90YXJnZXRfcmlzY3YpCiBTRUMoImZzZXNzaW9uL2JwZl9m
ZW50cnlfdGVzdDEiKQogaW50IEJQRl9QUk9HKHRlc3Q3KQogewpkaWZmIC0tZ2l0IGEvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL2dldF9mdW5jX2lwX3Rlc3QuYyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9nZXRfZnVuY19pcF90ZXN0LmMKaW5kZXggNDNmZjgz
NmE4ZWQ4Li40NWVhYTU0ZDFhYzcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2JwZi9wcm9ncy9nZXRfZnVuY19pcF90ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvYnBmL3Byb2dzL2dldF9mdW5jX2lwX3Rlc3QuYwpAQCAtMTA2LDcgKzEwNiw3IEBAIGludCBC
UEZfVVJFVFBST0JFKHRlc3Q4LCBpbnQgcmV0KQogCiBfX3U2NCB0ZXN0OV9lbnRyeV9yZXN1bHQg
PSAwOwogX191NjQgdGVzdDlfZXhpdF9yZXN1bHQgPSAwOwotI2lmIGRlZmluZWQoYnBmX3Rhcmdl
dF94ODYpIHx8IGRlZmluZWQoYnBmX3RhcmdldF9hcm02NCkKKyNpZiBkZWZpbmVkKGJwZl90YXJn
ZXRfeDg2KSB8fCBkZWZpbmVkKGJwZl90YXJnZXRfYXJtNjQpIHx8IGRlZmluZWQoYnBmX3Rhcmdl
dF9yaXNjdikKIFNFQygiZnNlc3Npb24vYnBmX2ZlbnRyeV90ZXN0MSIpCiBpbnQgQlBGX1BST0co
dGVzdDksIGludCBhKQogewotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
