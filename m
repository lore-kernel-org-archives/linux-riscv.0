Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEDFC61D85
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 20:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qeKba4mST/qfERcbG6ORpd9k2j+4b7JIoyI1GBLnMkA=; b=HxMSy/Dd6lcesp
	WLxgKTuHe8NX4tlyXX5u8Egfywq1lcXNZZcrKAsOphpuREyKp/yfA25WalsFuYtjkubztcwgYtw5B
	a5VEMQjjx3fvWW7ws+tM0K2DmyR0o9PhYY0SXDGffQ6VfGkqNuUP8r74Bcs1zPFf6ZlRc5DWlhRPA
	InrbdK6cArVx29+cmuyl3iwZZBROgH0Qk/dPL/YhW/jvaW1FhfaZu7+m1uizWuuoXX4+0MT7IG4pX
	xR5Y/URXYepSDUZJqP9MiJEsFPxjRShDB6/IuEMPoMYTTHZjbtwcEdi0Hlq4HHxyghJAQZnrypHZL
	o1+nCixkn2kZfayFAsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5XJD-0001mb-2Q;
	Tue, 21 Nov 2023 20:25:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5XJB-0001m3-0M
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 20:25:22 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32faea0fa1fso83123f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 12:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700598318; x=1701203118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8lC0ovH1sMR+X7ZTtQkf2fWPZEJbRi0PVuO8TV/5qUo=;
        b=agE/vCPRgcWWM6WWLxk6ZJ3mCSm7VY7Iietw7lw7syOkbYagqy0Usd2KlDgn88tZmL
         kcCTYWCv2/UJZWYHX+aVfAmyZziE8x/TYpj9hzbBlLdDdrmFDrACOaVY+jy5KzlK8Wt2
         hsOWYb1+/gUeZRHl3B2p0NF6l7yWc4AT6U6Julqs0hkRRL0dDh4RN7cr5o+AtKddXmQZ
         XCXj5Sz6DhPamCrc6H2OM/3CKGqPOf8MvzPBlsUlW3ogEQTFNIKlDyVtJrt4uiLWki9I
         XQlyUIYTfKraliwzENU3PsIYzrd9VkXunXCdT12HnkK8ssxy93uEKxQS4MWmNdc5D6+T
         7XOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700598318; x=1701203118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lC0ovH1sMR+X7ZTtQkf2fWPZEJbRi0PVuO8TV/5qUo=;
        b=BI/4N9xty1QODLblFGtEw0K76fT421OsuzfRB/Uj52Q7ji9GnMrzuefsunFKkz3NFD
         7MI9yyOB1w9G/00ATo9ewwl8XfN1d6TJxLLXYSVoC2mobXv39ClM+W+fnk5iCC5uHzeh
         YJvus9/EDISezt3/aH4muv2IHgn6utQwTujENKnNer/7lT9U7wVB2JEICLQbYS/6l9WC
         2XLNZjl+fCX9UmD+dz7kPlAhlEv5eoFWiKfLsc9glYwL6WmlxIqArAUae2AH8KbUf/5O
         gpuRVGCgrotbqD55F5rvMsrWaqc69WrUOB2xkEKbOG3jV97hM4uyYiWbeUI8bXCGe9Py
         fmBg==
X-Gm-Message-State: AOJu0YzyyOBrMdi5NyJfXK/n1JUcwlZKn9paK0qfgI7XtDNWV7yC/wuR
	LHV73xLLaCP9WPj/f+cc2Ag=
X-Google-Smtp-Source: AGHT+IGnOJCswD/GMiWfzz5U/DvJq6IUq4AzQP1MJUZYSDpefmTpGDGZ71qCsRphGv/gClRSdHwzFg==
X-Received: by 2002:a5d:584b:0:b0:32f:7a22:8b42 with SMTP id i11-20020a5d584b000000b0032f7a228b42mr3418449wrf.23.1700598318173;
        Tue, 21 Nov 2023 12:25:18 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:cf5b:fb56:995b:b106])
        by smtp.gmail.com with ESMTPSA id p11-20020adfcc8b000000b0032d9337e7d1sm15370009wrj.11.2023.11.21.12.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 12:25:17 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yu Chien Peter Lin <peterlin@andestech.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] riscv: errata: andes: Probe IOCP during boot stage
Date: Tue, 21 Nov 2023 20:24:59 +0000
Message-Id: <20231121202459.36874-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_122521_152614_BEC1A7CE 
X-CRM114-Status: GOOD (  11.59  )
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
Y29tPgoKV2Ugc2hvdWxkIGJlIHByb2JpbmcgZm9yIElPQ1AgZHVyaW5nIGJvb3Qgc3RhZ2Ugb25s
eS4gQXMgd2Ugd2VyZSBwcm9iaW5nCmZvciBJT0NQIGZvciBhbGwgdGhlIHN0YWdlcyB0aGlzIGNh
dXNlZCB0aGUgYmVsb3cgaXNzdWUgZHVyaW5nIG1vZHVsZS1pbml0CnN0YWdlLAoKWzkuMDE5MTA0
XSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJl
c3MgZmZmZmZmZmY4MTAwZDNhMApbOS4wMjcxNTNdIE9vcHMgWyMxXQpbOS4wMjk0MjFdIE1vZHVs
ZXMgbGlua2VkIGluOiByY2FyX2NhbmZkIHJlbmVzYXNfdXNiaHMgaTJjX3JpaWMgY2FuX2RldiBz
cGlfcnNwaSBpMmNfY29yZQpbOS4wMzc2ODZdIENQVTogMCBQSUQ6IDkwIENvbW06IHVkZXZkIE5v
dCB0YWludGVkIDYuNy4wLXJjMSsgIzU3Cls5LjA0Mzc1Nl0gSGFyZHdhcmUgbmFtZTogUmVuZXNh
cyBTTUFSQyBFVksgYmFzZWQgb24gcjlhMDdnMDQzZjAxIChEVCkKWzkuMDUwMzM5XSBlcGMgOiBy
aXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQrMHgxMC8weDNlCls5LjA1NTU1OF0gwqByYSA6IGFu
ZGVzX2VycmF0YV9wYXRjaF9mdW5jKzB4NGEvMHg1MgpbOS4wNjA0MThdIGVwYyA6IGZmZmZmZmZm
ODAwMGQ4YzIgcmEgOiBmZmZmZmZmZjgwMDBkOTVjIHNwIDogZmZmZmZmYzgwMDNhYmIwMApbOS4w
Njc2MDddIMKgZ3AgOiBmZmZmZmZmZjgxNGUyNWEwIHRwIDogZmZmZmZmZDgwMzYxZTU0MCB0MCA6
IDAwMDAwMDAwMDAwMDAwMDAKWzkuMDc0Nzk1XSDCoHQxIDogMDAwMDAwMDAwOTAwMDMxZSB0MiA6
IDAwMDAwMDAwMDAwMDAwMDEgczAgOiBmZmZmZmZjODAwM2FiYjIwCls5LjA4MTk4NF0gwqBzMSA6
IGZmZmZmZmZmMDE1YjU3YzcgYTAgOiAwMDAwMDAwMDAwMDAwMDAwIGExIDogMDAwMDAwMDAwMDAw
MDAwMQpbOS4wODkxNzJdIMKgYTIgOiAwMDAwMDAwMDAwMDAwMDAwIGEzIDogMDAwMDAwMDAwMDAw
MDAwMCBhNCA6IGZmZmZmZmZmODEwMGQ4YmUKWzkuMDk2MzYwXSDCoGE1IDogMDAwMDAwMDAwMDAw
MDAwMSBhNiA6IDAwMDAwMDAwMDAwMDAwMDEgYTcgOiAwMDAwMDAwMDA5MDAwMzFlCls5LjEwMzU0
OF0gwqBzMiA6IGZmZmZmZmZmMDE1YjU3ZDcgczMgOiAwMDAwMDAwMDAwMDAwMDAxIHM0IDogMDAw
MDAwMDAwMDAwMDMxZQpbOS4xMTA3MzZdIMKgczUgOiA4MDAwMDAwMDAwMDA4YTQ1IHM2IDogMDAw
MDAwMDAwMDAwMDUwMCBzNyA6IDAwMDAwMDAwMDAwMDAwM2YKWzkuMTE3OTI0XSDCoHM4IDogZmZm
ZmZmYzgwMDNhYmQ0OCBzOSA6IGZmZmZmZmZmMDE1YjExNDAgczEwOiBmZmZmZmZmZjgxNTFhMWIw
Cls5LjEyNTExM10gwqBzMTE6IGZmZmZmZmZmMDE1YjEwMDAgdDMgOiAwMDAwMDAwMDAwMDAwMDAx
IHQ0IDogZmVmZWZlZmVmZWZlZmVmZgpbOS4xMzIzMDFdIMKgdDUgOiBmZmZmZmZmZjAxNWI1N2M3
IHQ2IDogZmZmZmZmZDhiNjNhNjAwMApbOS4xMzc1ODddIHN0YXR1czogMDAwMDAwMDIwMDAwMDEy
MCBiYWRhZGRyOiBmZmZmZmZmZjgxMDBkM2EwIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBmCls5LjE0
NTQ2OF0gWzxmZmZmZmZmZjgwMDBkOGMyPl0gcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKzB4
MTAvMHgzZQpbOS4xNTE5NzJdIFs8ZmZmZmZmZmY4MDAwMjdlOD5dIF9hcHBseV9hbHRlcm5hdGl2
ZXMrMHg4NC8weDg2Cls5LjE1Nzc4NF0gWzxmZmZmZmZmZjgwMDAyOWJlPl0gYXBwbHlfbW9kdWxl
X2FsdGVybmF0aXZlcysweDEwLzB4MWEKWzkuMTY0MTEzXSBbPGZmZmZmZmZmODAwMDhmY2M+XSBt
b2R1bGVfZmluYWxpemUrMHg1ZS8weDdhCls5LjE2OTU4M10gWzxmZmZmZmZmZjgwMDg1Y2Q2Pl0g
bG9hZF9tb2R1bGUrMHhmZDgvMHgxNzljCls5LjE3NDk2NV0gWzxmZmZmZmZmZjgwMDg2NjMwPl0g
aW5pdF9tb2R1bGVfZnJvbV9maWxlKzB4NzYvMHhhYQpbOS4xODA5NDhdIFs8ZmZmZmZmZmY4MDA4
NjdmNj5dIF9fcmlzY3Zfc3lzX2Zpbml0X21vZHVsZSsweDE3Ni8weDJhOApbOS4xODczNjVdIFs8
ZmZmZmZmZmY4MDg4OTg2Mj5dIGRvX3RyYXBfZWNhbGxfdSsweGJlLzB4MTMwCls5LjE5MjkyMl0g
WzxmZmZmZmZmZjgwODkyMGJjPl0gcmV0X2Zyb21fZXhjZXB0aW9uKzB4MC8weDY0Cls5LjE5ODU3
M10gQ29kZTogMDAwOSBiN2U5IDY3OTcgMDE0ZCBhNzgzIDg1YTcgYzc5OSA0Nzg1IDA3MTcgMDEw
MCAoMDEyMykgYWVmNwpbOS4yMDU5OTRdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAg
XS0tLQoKVGhpcyBpcyBiZWNhdXNlIHdlIGNhbGxlZCByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0
ZWQoKSBmb3IgYWxsIHRoZSBzdGFnZXMKZHVyaW5nIElPQ1AgcHJvYmUuIHJpc2N2X25vbmNvaGVy
ZW50X3N1cHBvcnRlZCgpIGZ1bmN0aW9uIHNldHMKbm9uY29oZXJlbnRfc3VwcG9ydGVkIHZhcmlh
YmxlIHRvIHRydWUgd2hpY2ggaGFzIGFuIGFubm90YXRpb24gc2V0IHRvCiJfX3JvX2FmdGVyX2lu
aXQiIGR1ZSB0byB3aGljaCB3ZSB3ZXJlIHNlZWluZyB0aGUgYWJvdmUgc3BsYXQuIEZpeCB0aGlz
IGJ5CnByb2JpbmcgSU9DUCBkdXJpbmcgYm9vdCBzdGFnZSBvbmx5LgoKRml4ZXM6IGUwMjFhZTdm
NTE0NSAoInJpc2N2OiBlcnJhdGE6IEFkZCBBbmRlcyBhbHRlcm5hdGl2ZSBwb3J0cyIpClNpZ25l
ZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5l
c2FzLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJhdGEuYyB8IDMgKystCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmMgYi9hcmNoL3Jpc2N2L2VycmF0YS9h
bmRlcy9lcnJhdGEuYwppbmRleCBkMmUxYWJjYWM5NjcuLjFjMGZlZjExMTI3MyAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmMKKysrIGIvYXJjaC9yaXNjdi9lcnJh
dGEvYW5kZXMvZXJyYXRhLmMKQEAgLTYwLDcgKzYwLDggQEAgdm9pZCBfX2luaXRfb3JfbW9kdWxl
IGFuZGVzX2VycmF0YV9wYXRjaF9mdW5jKHN0cnVjdCBhbHRfZW50cnkgKmJlZ2luLCBzdHJ1Y3Qg
YWwKIAkJCQkJICAgICAgdW5zaWduZWQgbG9uZyBhcmNoaWQsIHVuc2lnbmVkIGxvbmcgaW1waWQs
CiAJCQkJCSAgICAgIHVuc2lnbmVkIGludCBzdGFnZSkKIHsKLQllcnJhdGFfcHJvYmVfaW9jcChz
dGFnZSwgYXJjaGlkLCBpbXBpZCk7CisJaWYgKHN0YWdlID09IFJJU0NWX0FMVEVSTkFUSVZFU19C
T09UKQorCQllcnJhdGFfcHJvYmVfaW9jcChzdGFnZSwgYXJjaGlkLCBpbXBpZCk7CiAKIAkvKiB3
ZSBoYXZlIG5vdGhpbmcgdG8gcGF0Y2ggaGVyZSBBVE0gc28ganVzdCByZXR1cm4gYmFjayAqLwog
fQotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
