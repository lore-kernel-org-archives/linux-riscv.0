Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87CEC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 21:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+AMmsnzifBOylGIAfb1rDCI3SP3sENwcht1VSp/lIZE=; b=oy/wWGmeKGCWy8
	U7UkDamUshTiPXocwQuAIz++T+lJHDdrxBV7WBQOnBOtGmuON3AJH9/o4m3BCQdRDCjf1eEorbUQN
	M1uEQmw8kEuk7t7fiEgWBtZnB+T6K4MwGdNNAP+46lOjMbwEtZ8enfueoUr1tsCMaSbbDMxIox64a
	O2R4QFWWtRLIP5ZBNZXfnHkPZv56BapNhRSWpJg1O+YVWVinBAYeptJBRVvw2SYsAmz3AIu+eZrYo
	hksShTl6FqBCUgCIGCUjmnDoLzD1OOIxx1Akn7gXxJQMPZ288zJKJ/SzX7bPpc/k3hmaaRxq1uI4G
	b7UGhf9XVRLg+humLeQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8oZ8-00BwVr-1S;
	Thu, 30 Nov 2023 21:27:22 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8oZ5-00BwVI-1k
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 21:27:21 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-332ddd8e0bdso1724717f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 13:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701379637; x=1701984437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KqgjcL24ZMnKLsXbYwH0Kk7Ypb9AJnVc4DeykxITi3c=;
        b=ffExK6WsWsoJXFOUMxvT3nFAprb7vbQzjBtqTzTwH9zSvrJh61/JXVgrBL1FTJ9Ri3
         c3kzSlTMsOk6Rt29EVEbE0rLCXo7PC08wPGgaIZC1dRrrTUK9PNTCB/UwDwogyjayFoB
         I+9oxQJoWSSfkXrRxI4Oi2QKfAc/F1pwp5kiw4g/6gxG8bmbSOUm0eyIyUtMgFsGw+sU
         FnrpIuYhH8VBGcIvLTvedJdyd+1j+4t9XakE9SWBCW6uo7WwPRrPf4dZyPdAz8KrB6a2
         airTmKDts1W2R3XTZK03DOTPS/3DU3uoA1qA7nONe4/yvvP8yWKXLPqQB8kQDYvBM3wz
         NsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701379637; x=1701984437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqgjcL24ZMnKLsXbYwH0Kk7Ypb9AJnVc4DeykxITi3c=;
        b=mQUfWrek0qS3JbrR5V/l26h3fi5og0Ooi6TizKjqXotNz+Wpm65F6l8Ll3gr/7Onj/
         BSMIwXKAJz3aG4Ac0aFE+ErU8CzgUSyYkRAVbzbG5gjC42XfTF1tOrQGC3fLbSkqGJDl
         pYW/FaqcMCQK6Y8UMSDUHQY6QfWkOVo2rf15CB+vRAcG0e3kqGIY7MwHNXsJP6wKf+VG
         bjFoxkTlMnB+YvcZjdJoe9cv8i6HirN7bJGqXx/g/js64yech43830NLMbElsumg9ZKv
         nePhbxZsy4fyO99Ti7BVUcRMvbj76q6QbcamJ/0p0L+4XOoP4Kx+ESvD7Gxp3zEAM+Bc
         xr9w==
X-Gm-Message-State: AOJu0Yxk1dWxU5io4Zep8ilE/a2u+VKIOwEKQTwCel+axTb2wqlQ2wIj
	5Ch8BGPdXZQpYsK5TGLdyj6ejoN0CXLtNw==
X-Google-Smtp-Source: AGHT+IHKBeHl7stvLYTFaI4jG/zWMybVzNEIz41y+IHoeV42m4AZDHT+xqfJgF2OkZwBJforvNzzyA==
X-Received: by 2002:a05:600c:4da4:b0:40b:5e26:238c with SMTP id v36-20020a05600c4da400b0040b5e26238cmr95459wmp.61.1701379637105;
        Thu, 30 Nov 2023 13:27:17 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c2e:cd45:f50f:f083])
        by smtp.gmail.com with ESMTPSA id az27-20020a05600c601b00b003fc0505be19sm3271440wmb.37.2023.11.30.13.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 13:27:16 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yu Chien Peter Lin <peterlin@andestech.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3] riscv: errata: andes: Probe for IOCP only once in boot stage
Date: Thu, 30 Nov 2023 21:26:47 +0000
Message-Id: <20231130212647.108746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_132719_606101_5664113D 
X-CRM114-Status: GOOD (  13.06  )
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

RnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPgoKV2UgbmVlZCB0byBwcm9iZSBmb3IgSU9DUCBvbmx5IG9uY2UgZHVyaW5nIGJvb3Qgc3Rh
Z2UsIGFzIHdlIHdlcmUgcHJvYmluZwpmb3IgSU9DUCBmb3IgYWxsIHRoZSBzdGFnZXMgdGhpcyBj
YXVzZWQgdGhlIGJlbG93IGlzc3VlIGR1cmluZyBtb2R1bGUtaW5pdApzdGFnZSwKCls5LjAxOTEw
NF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBhZGRy
ZXNzIGZmZmZmZmZmODEwMGQzYTAKWzkuMDI3MTUzXSBPb3BzIFsjMV0KWzkuMDI5NDIxXSBNb2R1
bGVzIGxpbmtlZCBpbjogcmNhcl9jYW5mZCByZW5lc2FzX3VzYmhzIGkyY19yaWljIGNhbl9kZXYg
c3BpX3JzcGkgaTJjX2NvcmUKWzkuMDM3Njg2XSBDUFU6IDAgUElEOiA5MCBDb21tOiB1ZGV2ZCBO
b3QgdGFpbnRlZCA2LjcuMC1yYzErICM1NwpbOS4wNDM3NTZdIEhhcmR3YXJlIG5hbWU6IFJlbmVz
YXMgU01BUkMgRVZLIGJhc2VkIG9uIHI5YTA3ZzA0M2YwMSAoRFQpCls5LjA1MDMzOV0gZXBjIDog
cmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKzB4MTAvMHgzZQpbOS4wNTU1NThdIMKgcmEgOiBh
bmRlc19lcnJhdGFfcGF0Y2hfZnVuYysweDRhLzB4NTIKWzkuMDYwNDE4XSBlcGMgOiBmZmZmZmZm
ZjgwMDBkOGMyIHJhIDogZmZmZmZmZmY4MDAwZDk1YyBzcCA6IGZmZmZmZmM4MDAzYWJiMDAKWzku
MDY3NjA3XSDCoGdwIDogZmZmZmZmZmY4MTRlMjVhMCB0cCA6IGZmZmZmZmQ4MDM2MWU1NDAgdDAg
OiAwMDAwMDAwMDAwMDAwMDAwCls5LjA3NDc5NV0gwqB0MSA6IDAwMDAwMDAwMDkwMDAzMWUgdDIg
OiAwMDAwMDAwMDAwMDAwMDAxIHMwIDogZmZmZmZmYzgwMDNhYmIyMApbOS4wODE5ODRdIMKgczEg
OiBmZmZmZmZmZjAxNWI1N2M3IGEwIDogMDAwMDAwMDAwMDAwMDAwMCBhMSA6IDAwMDAwMDAwMDAw
MDAwMDEKWzkuMDg5MTcyXSDCoGEyIDogMDAwMDAwMDAwMDAwMDAwMCBhMyA6IDAwMDAwMDAwMDAw
MDAwMDAgYTQgOiBmZmZmZmZmZjgxMDBkOGJlCls5LjA5NjM2MF0gwqBhNSA6IDAwMDAwMDAwMDAw
MDAwMDEgYTYgOiAwMDAwMDAwMDAwMDAwMDAxIGE3IDogMDAwMDAwMDAwOTAwMDMxZQpbOS4xMDM1
NDhdIMKgczIgOiBmZmZmZmZmZjAxNWI1N2Q3IHMzIDogMDAwMDAwMDAwMDAwMDAwMSBzNCA6IDAw
MDAwMDAwMDAwMDAzMWUKWzkuMTEwNzM2XSDCoHM1IDogODAwMDAwMDAwMDAwOGE0NSBzNiA6IDAw
MDAwMDAwMDAwMDA1MDAgczcgOiAwMDAwMDAwMDAwMDAwMDNmCls5LjExNzkyNF0gwqBzOCA6IGZm
ZmZmZmM4MDAzYWJkNDggczkgOiBmZmZmZmZmZjAxNWIxMTQwIHMxMDogZmZmZmZmZmY4MTUxYTFi
MApbOS4xMjUxMTNdIMKgczExOiBmZmZmZmZmZjAxNWIxMDAwIHQzIDogMDAwMDAwMDAwMDAwMDAw
MSB0NCA6IGZlZmVmZWZlZmVmZWZlZmYKWzkuMTMyMzAxXSDCoHQ1IDogZmZmZmZmZmYwMTViNTdj
NyB0NiA6IGZmZmZmZmQ4YjYzYTYwMDAKWzkuMTM3NTg3XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAx
MjAgYmFkYWRkcjogZmZmZmZmZmY4MTAwZDNhMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZgpbOS4x
NDU0NjhdIFs8ZmZmZmZmZmY4MDAwZDhjMj5dIHJpc2N2X25vbmNvaGVyZW50X3N1cHBvcnRlZCsw
eDEwLzB4M2UKWzkuMTUxOTcyXSBbPGZmZmZmZmZmODAwMDI3ZTg+XSBfYXBwbHlfYWx0ZXJuYXRp
dmVzKzB4ODQvMHg4NgpbOS4xNTc3ODRdIFs8ZmZmZmZmZmY4MDAwMjliZT5dIGFwcGx5X21vZHVs
ZV9hbHRlcm5hdGl2ZXMrMHgxMC8weDFhCls5LjE2NDExM10gWzxmZmZmZmZmZjgwMDA4ZmNjPl0g
bW9kdWxlX2ZpbmFsaXplKzB4NWUvMHg3YQpbOS4xNjk1ODNdIFs8ZmZmZmZmZmY4MDA4NWNkNj5d
IGxvYWRfbW9kdWxlKzB4ZmQ4LzB4MTc5YwpbOS4xNzQ5NjVdIFs8ZmZmZmZmZmY4MDA4NjYzMD5d
IGluaXRfbW9kdWxlX2Zyb21fZmlsZSsweDc2LzB4YWEKWzkuMTgwOTQ4XSBbPGZmZmZmZmZmODAw
ODY3ZjY+XSBfX3Jpc2N2X3N5c19maW5pdF9tb2R1bGUrMHgxNzYvMHgyYTgKWzkuMTg3MzY1XSBb
PGZmZmZmZmZmODA4ODk4NjI+XSBkb190cmFwX2VjYWxsX3UrMHhiZS8weDEzMApbOS4xOTI5MjJd
IFs8ZmZmZmZmZmY4MDg5MjBiYz5dIHJldF9mcm9tX2V4Y2VwdGlvbisweDAvMHg2NApbOS4xOTg1
NzNdIENvZGU6IDAwMDkgYjdlOSA2Nzk3IDAxNGQgYTc4MyA4NWE3IGM3OTkgNDc4NSAwNzE3IDAx
MDAgKDAxMjMpIGFlZjcKWzkuMjA1OTk0XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAw
IF0tLS0KClRoaXMgaXMgYmVjYXVzZSB3ZSBjYWxsZWQgcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9y
dGVkKCkgZm9yIGFsbCB0aGUgc3RhZ2VzCmR1cmluZyBJT0NQIHByb2JlLiByaXNjdl9ub25jb2hl
cmVudF9zdXBwb3J0ZWQoKSBmdW5jdGlvbiBzZXRzCm5vbmNvaGVyZW50X3N1cHBvcnRlZCB2YXJp
YWJsZSB0byB0cnVlIHdoaWNoIGhhcyBhbiBhbm5vdGF0aW9uIHNldCB0bwoiX19yb19hZnRlcl9p
bml0IiBkdWUgdG8gd2hpY2ggd2Ugd2VyZSBzZWVpbmcgdGhlIGFib3ZlIHNwbGF0LiBGaXggdGhp
cyBieQpwcm9iaW5nIGZvciBJT0NQIG9ubHkgb25jZSBpbiBib290IHN0YWdlIGJ5IGhhdmluZyBh
IGJvb2xlYW4gdmFyaWFibGUKImRvbmUiIHdoaWNoIHdpbGwgYmUgc2V0IHRvIHRydWUgdXBvbiBJ
T0NQIHByb2JlIGluIGVycmF0YV9wcm9iZV9pb2NwKCkKYW5kIHdlIGJhaWwgb3V0IGVhcmx5IGlm
ICJkb25lIiBpcyBzZXQgdG8gdHJ1ZS4KCldoaWxlIGF0IGl0IG1ha2UgcmV0dXJuIHR5cGUgb2Yg
ZXJyYXRhX3Byb2JlX2lvY3AoKSB0byB2b2lkIGFzIHdlIHdlcmUKbm90IGNoZWNraW5nIHRoZSBy
ZXR1cm4gdmFsdWUgaW4gYW5kZXNfZXJyYXRhX3BhdGNoX2Z1bmMoKS4KCkZpeGVzOiBlMDIxYWU3
ZjUxNDUgKCJyaXNjdjogZXJyYXRhOiBBZGQgQW5kZXMgYWx0ZXJuYXRpdmUgcG9ydHMiKQpTaWdu
ZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20+Ci0tLQogYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmMgfCAyMCArKysr
KysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmMg
Yi9hcmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJhdGEuYwppbmRleCAxOTdkYjY4Y2M4ZGEuLjE3
YTkwNDg2OTcyNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmMK
KysrIGIvYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmMKQEAgLTM4LDI5ICszOCwzNSBA
QCBzdGF0aWMgbG9uZyBheDQ1bXBfaW9jcF9zd193b3JrYXJvdW5kKHZvaWQpCiAJcmV0dXJuIHJl
dC5lcnJvciA/IDAgOiByZXQudmFsdWU7CiB9CiAKLXN0YXRpYyBib29sIGVycmF0YV9wcm9iZV9p
b2NwKHVuc2lnbmVkIGludCBzdGFnZSwgdW5zaWduZWQgbG9uZyBhcmNoX2lkLCB1bnNpZ25lZCBs
b25nIGltcGlkKQorc3RhdGljIHZvaWQgZXJyYXRhX3Byb2JlX2lvY3AodW5zaWduZWQgaW50IHN0
YWdlLCB1bnNpZ25lZCBsb25nIGFyY2hfaWQsIHVuc2lnbmVkIGxvbmcgaW1waWQpCiB7CisJc3Rh
dGljIGJvb2wgZG9uZTsKKwogCWlmICghSVNfRU5BQkxFRChDT05GSUdfRVJSQVRBX0FOREVTX0NN
TykpCi0JCXJldHVybiBmYWxzZTsKKwkJcmV0dXJuOworCisJaWYgKGRvbmUpCisJCXJldHVybjsK
KworCWRvbmUgPSB0cnVlOwogCiAJaWYgKGFyY2hfaWQgIT0gQU5ERVNURUNIX0FYNDVNUF9NQVJD
SElEIHx8IGltcGlkICE9IEFOREVTVEVDSF9BWDQ1TVBfTUlNUElEKQotCQlyZXR1cm4gZmFsc2U7
CisJCXJldHVybjsKIAogCWlmICghYXg0NW1wX2lvY3Bfc3dfd29ya2Fyb3VuZCgpKQotCQlyZXR1
cm4gZmFsc2U7CisJCXJldHVybjsKIAogCS8qIFNldCB0aGlzIGp1c3QgdG8gbWFrZSBjb3JlIGNi
byBjb2RlIGhhcHB5ICovCiAJcmlzY3ZfY2JvbV9ibG9ja19zaXplID0gMTsKIAlyaXNjdl9ub25j
b2hlcmVudF9zdXBwb3J0ZWQoKTsKLQotCXJldHVybiB0cnVlOwogfQogCiB2b2lkIF9faW5pdF9v
cl9tb2R1bGUgYW5kZXNfZXJyYXRhX3BhdGNoX2Z1bmMoc3RydWN0IGFsdF9lbnRyeSAqYmVnaW4s
IHN0cnVjdCBhbHRfZW50cnkgKmVuZCwKIAkJCQkJICAgICAgdW5zaWduZWQgbG9uZyBhcmNoaWQs
IHVuc2lnbmVkIGxvbmcgaW1waWQsCiAJCQkJCSAgICAgIHVuc2lnbmVkIGludCBzdGFnZSkKIHsK
LQllcnJhdGFfcHJvYmVfaW9jcChzdGFnZSwgYXJjaGlkLCBpbXBpZCk7CisJaWYgKHN0YWdlID09
IFJJU0NWX0FMVEVSTkFUSVZFU19CT09UKQorCQllcnJhdGFfcHJvYmVfaW9jcChzdGFnZSwgYXJj
aGlkLCBpbXBpZCk7CiAKIAkvKiB3ZSBoYXZlIG5vdGhpbmcgdG8gcGF0Y2ggaGVyZSBBVE0gc28g
anVzdCByZXR1cm4gYmFjayAqLwogfQotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
