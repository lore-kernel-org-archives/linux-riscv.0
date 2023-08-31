Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC3BC83F33
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIRsOt8NfAZ9Ct/b816kOksusJleiuw9R9Ds7OLFAlI=; b=HoMRypeRALlAnc
	mt9i1udpP3vEsnQ732AUG6+Hn58ELnzpz7791uSfkNYjSPKEkz1O98qxAuhS9Xu7iijTlTEa6Dt5m
	OzQnXC4m7gRpKnD2pd4J+lR8Xo59xwuSWKYUZ5eWrDpI618Dyv3NsKP+5H12dczW3bLNyP8MRgHmz
	+yyioVX+4DCi78Zc12mAYXzfE7RLBqm6UYr7RuB5TIxkeRcQD107FvzIGwtfHALusI7o2aCjn4EGc
	uzHABKFniLlNsjLhSgzuHsjXvVh7WFT57ycdZgxStTucgP0FzTs/0UITWSJtkB4EbwCTLVJ+pysQ4
	CoF30S6gBN3s8rZghftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbhTY-00FLDW-0Q;
	Thu, 31 Aug 2023 13:12:44 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbhTQ-00FLA1-1q
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 13:12:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31aeee69de0so604712f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693487552; x=1694092352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vw9aCO6QF7ehSGg3eSofLWFhJ8EHSCsmR6IG4YjeGA0=;
        b=U697WiVWH2LdzgL3eVe5M+9/IimkGdZC/G2X8uY4SNFguL+NYYd6sNLsiuvdHmsYw8
         8jCHbU3pK+UVKMBmlClNCcVC8S1+tLpAsCOnRk1J8Srts68P4toP8qvRaRCx/02sXMX8
         M0dFoNPv1dtR1am+vTnbFTsQNOl+cR1E7i+4Bu5tWViUonYqOUDk2OPWftC7Hv3jtCvc
         VcPDquB7dd1ljNUThmb6qOhRWrpWaJ7l4PqemKB2JSAkCRueK7s4gXibN55G5XtrLGS8
         tehH4XO4pz+vaxJrGAC/1JrojgXDgGYmlbaQsSojec0YetbOp00AEef/9TfPIIpryr3Z
         lYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693487552; x=1694092352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vw9aCO6QF7ehSGg3eSofLWFhJ8EHSCsmR6IG4YjeGA0=;
        b=Im4Sq4MfDOa/LMue9SOEN00NzP37rNGwWyq3NLjqnuLrNz+5DNUwf0BVu7j19N5h00
         1zUERFSh8+tlujWQyec7hRxVDdVQZZZKJvexLyv6N+l7f2inVV7RrHFfwRNy2WqIGU0o
         Q0sff8KcyCIWSjfhhUyPuvUJVCZDST1GjCSAbS/y0mRs7PArpPn0+kCwQURsTyv1Nm9+
         MbkRBsmRhCRIDFMjBnkgS9msgUfKYaOtPU7jwjvsDvigFMco2Z45btfeU2h3grLgR8nQ
         tJv1noIpIGPjbRsAFzzeTN8/lk8frBNHWRiVZ0/3zVdRV9lLyW9MM1BCi7fk/I3BGHG4
         WW6Q==
X-Gm-Message-State: AOJu0YwevEYNmnQGtg4oWK2XMr8/UHNNgFv3U05QpoF8sSt1eV1bIlfI
	qY56tU1Dnod82oZ1v6Aq+lEJJBjWjrfbu6nEtVk=
X-Google-Smtp-Source: AGHT+IEV1nZTWVMPYeNOWwrZQScu0+JsXp36Y/oH9nCnr88bGLZYxfwLclYlSX63KCt8UHKIEmHBIA==
X-Received: by 2002:adf:e54f:0:b0:319:82c9:8e7d with SMTP id z15-20020adfe54f000000b0031982c98e7dmr3698994wrm.31.1693487551537;
        Thu, 31 Aug 2023 06:12:31 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-54-170-241-106.eu-west-1.compute.amazonaws.com. [54.170.241.106])
        by smtp.gmail.com with ESMTPSA id a28-20020a5d457c000000b00317f70240afsm2206607wrc.27.2023.08.31.06.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 06:12:31 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	pulehui@huawei.com,
	conor.dooley@microchip.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	song@kernel.org,
	yhs@fb.com,
	kpsingh@kernel.org,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next v4 1/4] bpf: make bpf_prog_pack allocator portable
Date: Thu, 31 Aug 2023 13:12:26 +0000
Message-Id: <20230831131229.497941-2-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230831131229.497941-1-puranjay12@gmail.com>
References: <20230831131229.497941-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_061236_614231_C1D56E75 
X-CRM114-Status: GOOD (  13.39  )
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

VGhlIGJwZl9wcm9nX3BhY2sgYWxsb2NhdG9yIGN1cnJlbnRseSB1c2VzIG1vZHVsZV9hbGxvYygp
IGFuZAptb2R1bGVfbWVtZnJlZSgpIHRvIGFsbG9jYXRlIGFuZCBmcmVlIG1lbW9yeS4gVGhpcyBp
cyBub3QgcG9ydGFibGUKYmVjYXVzZSBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlcyB1c2UgZGlmZmVy
ZW50IG1ldGhvZHMgZm9yIGFsbG9jYXRpbmcKbWVtb3J5IGZvciBCUEYgcHJvZ3JhbXMuIExpa2Ug
QVJNNjQgYW5kIHJpc2N2IHVzZSB2bWFsbG9jKCkvdmZyZWUoKS4KClVzZSBicGZfaml0X2FsbG9j
X2V4ZWMoKSBhbmQgYnBmX2ppdF9mcmVlX2V4ZWMoKSBmb3IgbWVtb3J5IG1hbmFnZW1lbnQKaW4g
YnBmX3Byb2dfcGFjayBhbGxvY2F0b3IuIE90aGVyIGFyY2hpdGVjdHVyZXMgY2FuIG92ZXJyaWRl
IHRoZXNlIHdpdGgKdGhlaXIgaW1wbGVtZW50YXRpb24gYW5kIHdpbGwgYmUgYWJsZSB0byB1c2Ug
YnBmX3Byb2dfcGFjayBkaXJlY3RseS4KCk9uIGFyY2hpdGVjdHVyZXMgdGhhdCBkb24ndCBvdmVy
cmlkZSBicGZfaml0X2FsbG9jL2ZyZWVfZXhlYygpIHRoaXMgaXMKYmFzaWNhbGx5IGEgTk9QLgoK
U2lnbmVkLW9mZi1ieTogUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPgpBY2tl
ZC1ieTogU29uZyBMaXUgPHNvbmdAa2VybmVsLm9yZz4KQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQGtlcm5lbC5vcmc+ClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgotLS0KIGtlcm5lbC9icGYvY29yZS5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9rZXJuZWwv
YnBmL2NvcmUuYyBiL2tlcm5lbC9icGYvY29yZS5jCmluZGV4IDBmOGYwMzZkOGJkMS4uNGUzY2Uw
NTQyZTMxIDEwMDY0NAotLS0gYS9rZXJuZWwvYnBmL2NvcmUuYworKysgYi9rZXJuZWwvYnBmL2Nv
cmUuYwpAQCAtODcwLDcgKzg3MCw3IEBAIHN0YXRpYyBzdHJ1Y3QgYnBmX3Byb2dfcGFjayAqYWxs
b2NfbmV3X3BhY2soYnBmX2ppdF9maWxsX2hvbGVfdCBicGZfZmlsbF9pbGxfaW5zCiAJCSAgICAg
ICBHRlBfS0VSTkVMKTsKIAlpZiAoIXBhY2spCiAJCXJldHVybiBOVUxMOwotCXBhY2stPnB0ciA9
IG1vZHVsZV9hbGxvYyhCUEZfUFJPR19QQUNLX1NJWkUpOworCXBhY2stPnB0ciA9IGJwZl9qaXRf
YWxsb2NfZXhlYyhCUEZfUFJPR19QQUNLX1NJWkUpOwogCWlmICghcGFjay0+cHRyKSB7CiAJCWtm
cmVlKHBhY2spOwogCQlyZXR1cm4gTlVMTDsKQEAgLTg5NCw3ICs4OTQsNyBAQCB2b2lkICpicGZf
cHJvZ19wYWNrX2FsbG9jKHUzMiBzaXplLCBicGZfaml0X2ZpbGxfaG9sZV90IGJwZl9maWxsX2ls
bF9pbnNucykKIAltdXRleF9sb2NrKCZwYWNrX211dGV4KTsKIAlpZiAoc2l6ZSA+IEJQRl9QUk9H
X1BBQ0tfU0laRSkgewogCQlzaXplID0gcm91bmRfdXAoc2l6ZSwgUEFHRV9TSVpFKTsKLQkJcHRy
ID0gbW9kdWxlX2FsbG9jKHNpemUpOworCQlwdHIgPSBicGZfaml0X2FsbG9jX2V4ZWMoc2l6ZSk7
CiAJCWlmIChwdHIpIHsKIAkJCWJwZl9maWxsX2lsbF9pbnNucyhwdHIsIHNpemUpOwogCQkJc2V0
X3ZtX2ZsdXNoX3Jlc2V0X3Blcm1zKHB0cik7CkBAIC05MzIsNyArOTMyLDcgQEAgdm9pZCBicGZf
cHJvZ19wYWNrX2ZyZWUoc3RydWN0IGJwZl9iaW5hcnlfaGVhZGVyICpoZHIpCiAKIAltdXRleF9s
b2NrKCZwYWNrX211dGV4KTsKIAlpZiAoaGRyLT5zaXplID4gQlBGX1BST0dfUEFDS19TSVpFKSB7
Ci0JCW1vZHVsZV9tZW1mcmVlKGhkcik7CisJCWJwZl9qaXRfZnJlZV9leGVjKGhkcik7CiAJCWdv
dG8gb3V0OwogCX0KIApAQCAtOTU2LDcgKzk1Niw3IEBAIHZvaWQgYnBmX3Byb2dfcGFja19mcmVl
KHN0cnVjdCBicGZfYmluYXJ5X2hlYWRlciAqaGRyKQogCWlmIChiaXRtYXBfZmluZF9uZXh0X3pl
cm9fYXJlYShwYWNrLT5iaXRtYXAsIEJQRl9QUk9HX0NIVU5LX0NPVU5ULCAwLAogCQkJCSAgICAg
ICBCUEZfUFJPR19DSFVOS19DT1VOVCwgMCkgPT0gMCkgewogCQlsaXN0X2RlbCgmcGFjay0+bGlz
dCk7Ci0JCW1vZHVsZV9tZW1mcmVlKHBhY2stPnB0cik7CisJCWJwZl9qaXRfZnJlZV9leGVjKHBh
Y2stPnB0cik7CiAJCWtmcmVlKHBhY2spOwogCX0KIG91dDoKLS0gCjIuMzkuMgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
