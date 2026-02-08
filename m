Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A12EF06E3
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 05:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DENNtL+FLTzRjqVBQ13AWGbrWC/QiHJ/nVix6roD4Y=; b=PnLM8yQxD7zvPO
	W80PAxsUPlp1Elj+x+XIFmLup3j2UzpNOrFmexavLDgib39/YJtPnfQtZon2nk4g9rUm9tIhn/409
	YpOCHW8dT6bQ8N1YnI2qeN7pB/hYT5kyQYKE6Df010uwl3tRE577PVUYQwjg7O4ifs6t+LNWRriPp
	Asl29gjub8hSlY/snOyzt9AZP8NOWgvIP3qoRKHuolLFF+y40R8J2/HLoXZ5dhYy/lPH41LMLA9ZG
	9VqIG/xELdcxlHWjLCszif9hzQeqh2iwFT9xMUuKuTCj50AnKbOdH/Oqp7SEPKzc+wM759mahoHFJ
	vIxZs+7tO70alBZWHeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voxQw-0000000D347-0VGU;
	Sun, 08 Feb 2026 05:34:10 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voxQq-0000000D32r-02Gq
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 05:34:05 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-82458495219so342024b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 21:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770528843; x=1771133643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOZtDu7jSNri6wkbo2wj70FyVnPCcpHXFtiLHwbu29Y=;
        b=Q71qsYJXmsleeq7kdGVTTU6ElexiDHSujE46z3+8ye0312aiRDtsOpjU8rmwXLtmff
         h7encSXJe65pM3yEBGzuoyedINN4ik8d/ALFkUCdRbywacZaXr4xxxeUPOqdptKHHMue
         i5PRsDTltk3h7MKgVV8I8vMbu4awqDh7BuzNtVdo3a9UOgpknEheRxRRHoL5Z+PPbFbB
         /bNVg6HeM9aWQCyAwmKtVqcMEBjeJVAX82kCblop2QUKbZ3spcBU+WeEhejaxuDZzW+N
         7uFOb/iZ4QqNFGMKosEaHYHhX+YSA9sN6UGi+CanyWftKHwK4V/jqx9nO6SaIkOLeDYC
         7JUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770528843; x=1771133643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOZtDu7jSNri6wkbo2wj70FyVnPCcpHXFtiLHwbu29Y=;
        b=jjsc10Q09geA/U641ve70End490NC8PE2zf8sQyZbTYuctzoomkgz4KEwv2uLtqv8f
         lOYcd7yLadMdsunJljIEvU4Hc94rXMEGKRD6P/ku7xU7Ny0zIbfjKGe5oVU5DC42oGis
         ZouD2YXQyXhl7do+b5D91yg2R9Nu5fXTrQlOY9Y/WCi+jP+ftkg/jZOzg5UwLhjUlUyc
         SbgbqgQr/8wSvEZnGJmw90r/DZiB7nZuE67FiotB5lciN00iKgpbDndCpJ5E5Gv178WC
         xU2kiIiHYMXSy0hFstzNFYmjOR6ylCoNuXcOs9vxVmPjlod9vNK+p1RXzEE9mC1+IZYW
         HxnA==
X-Forwarded-Encrypted: i=1; AJvYcCVEZb6ASW8uVZhvLf15jmEX/8MwjkQIZpPy4tjDlb6IPZNBIeMjov8ikXoWqVNIwZeWqTVBBBkuJjm4AQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs26rTU8D1iinsucaZR9pTZO6qtkMq1Gc5zN4YJjlq25MZFbQA
	yadsmfpoSgBd1Xy792C1bj9cH0LKBwEX1AR3OegH6iGGPeeLcshvdwUL
X-Gm-Gg: AZuq6aIkcpgpiSUoGDCOvvuY16rrGsa0nRroXF+FXzvW5O98nfYn66gXIMEzkdgSH22
	A/1ykGlDN4pzH8Oq9F9XXYhB/lgETtkw3n84KpSH0qLdE9c/0wdzK0jop9ywrdXFNpN2iG5Sg9D
	UcSv+S0+DUwniJ8ZdnL6XkmpcPwbmunPIVFwj6EmAS9VGODJPBgdI3zx8cIoQQyA6KG3PIGp+ri
	ReWLZp7+aOFnGrxdXyUpoaPdPh2/eUbPo2EhP2q8DdROgaraY64F9ZuFM+VKtMtBm5sWOmj6E3g
	IdeD43WnuK2W8108ZUW7vb2r4GBKqpHUi1ib1otx1mrtd+QwCfPKAsZxn+HkmUSZ4ueMYw3GrUW
	VHcbAYchLy1W+qRA17JICaCgPNpGxVAf77sIMmlgSMj0K8va1q9OvtQ2hJvvM2X/cAXmGI8T4I7
	qQzwnGMQSIVfIaX9fQWSs=
X-Received: by 2002:a05:6a00:4b01:b0:824:3cae:54b5 with SMTP id d2e1a72fcca58-824416002fbmr6625757b3a.14.1770528843309;
        Sat, 07 Feb 2026 21:34:03 -0800 (PST)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418de80dsm6067700b3a.62.2026.02.07.21.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 21:34:03 -0800 (PST)
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
Subject: [PATCH bpf-next v4 3/3] selftests/bpf: enable fsession_test on riscv64
Date: Sun,  8 Feb 2026 13:33:11 +0800
Message-ID: <20260208053311.698352-4-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208053311.698352-1-dongml2@chinatelecom.cn>
References: <20260208053311.698352-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_213404_044620_04D2EFFF 
X-CRM114-Status: UNSURE (   9.97  )
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
