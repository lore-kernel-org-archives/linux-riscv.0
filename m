Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB90C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E0HIii9+T+VeB3fmXBtK8JUd/bBlqdMM+k3yAFlvntQ=; b=UqQMETDD3SqG2x
	XbSEXiYUA+Rg322wfWW+YNXOeBCGedzbOJTYrORgG1Y1R+nu8oZwU+kFW3KGw3uZBEAh3l/kIgfEa
	2vobB/bTGFtq9HUuYMN6LQ10lq+/hf9qKMa1a4EjKQDlfa7q/3t7vkaWuq8qTROAOjgN3+u/kPDw6
	h+NYGy9btCLsFfp0Wuh2FOxG5Y48J33wMQ8a1dbsKTZlGkHGVzSlDMF+La/79MfVEPeIDNVb3/Cut
	z24WI3VssmlUWyc669yZNXDwtqAGmUfV+onQL5GGvIuDllvE8Gw4+MYPg5q4i645vD16dURBxi14X
	s7+SrBjMFWQel49BO/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFf8-0000000AjVX-3DuT;
	Thu, 03 Jul 2025 08:51:22 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFcI-0000000Aj0W-2Mqd
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 08:48:27 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso6616220a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Jul 2025 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751532505; x=1752137305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3Z107VnaAMLtYbjfxHTZ3Ws4rPY5VMWknkGImN8dII=;
        b=I8wHAMpczLYfRdW1dRC+oZfxIHfi5rX5f7iwtflapc3QqyOErbvPLu0xiaGDqWDF9d
         ZGgvBA73V2S3pfba8n0qT0mAbYW0I1Y6SfVY3+0biLlTeaPXCIgHx0kCKyh2pIu+F0+V
         yN652e11HEvJrC0xGMCxHDsmKrIW5J6MOyFqae9SqZBxeabkpuvyfhRZ3k2jXPisbh3f
         SecpbQSge9OAp+pwP6bH2Kue+ZEpZ74WmMsMhOpz9z7QNN1kRQNBqzfKPu7iDN9ML6JZ
         4ltqoR2xh+JuXQwBL/IPttvgocbGK97Fe4gtHrbLHgeBoBRHcy6MO37Anbl7xnHKTEet
         7dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532505; x=1752137305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3Z107VnaAMLtYbjfxHTZ3Ws4rPY5VMWknkGImN8dII=;
        b=v4gcVGSLvoyv7tR9ikQ1fJ/kEpJ/KnWYsefjm0gOmcvja0DfaW7IZxRosnBo3LSSkV
         dTZtOPWyMYRlpefZcFBgpN0ONqQEF7koi0jXqgY+f2LTNWw5OjyYXHrFXy+uYbQJWqoE
         u25fZg7tmYbi1yoVPeoPl3zwam3sRRMjZmpsPrlK8w+uuBGijdqtOZPAq8IZxULregFL
         3h7RJUgHdzTlWT4n5DrH1CBnbTi1o4kX5im4zvK+epg9Nt6vOMJBpeTE6OiXGf9uZ0Yh
         iAXI3RtQEn20TsCKRFhkR4t/bMSXaFMoqOcAmtdkSJTtqc7uJaHakL8uKIwRd+Td7uAm
         YzfA==
X-Gm-Message-State: AOJu0YxmmyYS9um4BuJK5ZArD63BnhTw6pCyI4UbKeMAvxX5SuN3XXIu
	Z+JTKOnkTJCaYxP06WYX54zXfcgLPWyeYoN43npTNlKK62BPDYo1J7nyf8O2Wo3BORfXay8B
X-Gm-Gg: ASbGncvMO6y1AdFz2PTnCHG6luc7iTjIuqyGp453v4nYhN2YlJYWTeJO1Hh8cjnd3Xe
	qnTOnX6cgPScXErRohIU6bC6rBviIyBNuU0sVZHcjCMaWx54xGJyuimSyXJQmC0MC9OXnlSwGKO
	KbW3ApMdFfYbKXwK/Spj7E+zTBNS4QqAPu+BqF/v4i/1MFLNR/0f5E+CfrQSnLKtl12yt036NTk
	cgTgckDGtbAFTmCggw96K0lUccbhkITVHvTMe2NaLwZzjscxF59zG1eluN1fg00valMmYWtGC0m
	r/Het5FBS5MZCK0nnVOxHgimjNEWIKIG+8IbHjlR01dT9QY35NC3aBXvTA==
X-Google-Smtp-Source: AGHT+IFTOtu+9aAXgOpMaoBZ0/mn07PugNdJ048Y9jIQJXy0X3cY4WnEabZiSrdDycIabLApQUg2Vw==
X-Received: by 2002:a17:90b:4d0f:b0:311:9c1f:8522 with SMTP id 98e67ed59e1d1-31a9deae29bmr2995436a91.10.1751532505321;
        Thu, 03 Jul 2025 01:48:25 -0700 (PDT)
Received: from nyaos.. ([202.212.79.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f069csm145433795ad.59.2025.07.03.01.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:48:24 -0700 (PDT)
From: ChenMiao <chenmiao.ku@gmail.com>
To: Linux RISCV <linux-riscv@lists.infradead.org>
Cc: chenmiao <chenmiao.ku@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE selection
Date: Thu,  3 Jul 2025 08:48:18 +0000
Message-ID: <20250703084818.394491-1-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_014826_596420_F96BF4DD 
X-CRM114-Status: GOOD (  12.58  )
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

RnJvbTogY2hlbm1pYW8gPGNoZW5taWFvLmt1QGdtYWlsLmNvbT4KCldoZW4gSSB3YXMgcmVhZGlu
ZyB0aGUgc291cmNlIGNvZGUgb2YgZnRyYWNlLCBJIGxlYXJuZWQgdGhhdApmdHJhY2UgaGFzIHR3
byB0eXBlczogc3RhdGljIGFuZCBkeW5hbWljLiBJbml0aWFsbHksIEkgcGxhbm5lZAp0byBwcmlv
cml0aXplIHJlYWRpbmcgdGhlIHN0YXRpYyBzb3VyY2UgY29kZSwgc28gSSBkaXNhYmxlZAp0aGUg
ZW5hYmxlIGR5bmFtaWMgb3B0aW9uIGluIFJJU0NWLgoKWypdICAgS2VybmVsIEZ1bmN0aW9uIFRy
YWNlcgpbIF0gICBLZXJuZWwgRnVuY3Rpb24gR3JhcGggVHJhY2VyClsgXSAgIGVuYWJsZS9kaXNh
YmxlIGZ1bmN0aW9uIHRyYWNpbmcgZHluYW1pY2FsbHkgKE5FVykKCkhvd2V2ZXIsIHdoZW4gSSB0
cmllZCB0byBjb21waWxlIGl0LCB0aGUgYnVpbGQgZmFpbGVkLgoKLi9pbmNsdWRlL2xpbnV4L2Z0
cmFjZS5oOjE5MDoxNjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mCmZ1bmN0aW9uIOKA
mGFyY2hfZnRyYWNlX2dldF9yZWdz4oCZOyBkaWQgeW91IG1lYW4g4oCYYXJjaF9mdHJhY2VfcmVn
c+KAmT8KWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgMTkwIHwgICAgICAgICBy
ZXR1cm4gYXJjaF9mdHJhY2VfZ2V0X3JlZ3MoZnJlZ3MpOwogICAgICB8ICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgICAgIHwgICAgICAgICAgICAgICAgYXJjaF9mdHJhY2Vf
cmVncwoKQWZ0ZXIgY29tcGFyaW5nIGl0IHdpdGggdGhlIEFSTTY0IGFyY2hpdGVjdHVyZSwgSSBm
b3VuZCB0aGF0CkFSTTY0IGF1dG9tYXRpY2FsbHkgZW5hYmxlcyBEWU5BTUlDX0ZUUkFDRSBieSBk
ZWZhdWx0IG9uY2UKRlVOQ1RJT05fVFJBQ0VSIGlzIHR1cm5lZCBvbiwgYW5kIHRoaXMgY2Fubm90
IGJlIHNldCB0byAibm8iLgpUaGVyZWZvcmUsIEkgYmVsaWV2ZSB0aGUgb3B0aW9uYWwgRFlOQU1J
Q19GVFJBQ0Ugc2V0dGluZyBpbgpSSVNDLVYgaGFzIGEgbG9naWMgZmxhd+KAlGlmIEZVTkNUSU9O
X1RSQUNFUiBpcyBlbmFibGVkLApEWU5BTUlDX0ZUUkFDRSBzaG91bGQgYWxzbyBiZSBlbmFibGVk
LCBhbmQgdmljZSB2ZXJzYS4gTW9yZW92ZXIsCml0J3MgY2xlYXIgdGhhdCBSSVNDLVYgbGFja3Mg
dGhlIG5lY2Vzc2FyeSBzdXBwb3J0IHRvIHN1Y2Nlc3NmdWxseQpjb21waWxlIHRoZSBrZXJuZWwg
d2hlbiBEWU5BTUlDX0ZUUkFDRSBpcyBkaXNhYmxlZC4KClsqXSAgIEtlcm5lbCBGdW5jdGlvbiBU
cmFjZXIKWyBdICAgS2VybmVsIEZ1bmN0aW9uIEdyYXBoIFRyYWNlcgotKi0gICBlbmFibGUvZGlz
YWJsZSBmdW5jdGlvbiB0cmFjaW5nIGR5bmFtaWNhbGx5CgpTaWduZWQtb2ZmLWJ5OiBjaGVubWlh
byA8Y2hlbm1pYW8ua3VAZ21haWwuY29tPgotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9L
Y29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IDM2MDYxZjQ3My4uZjdmYzhiNDYwIDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCkBA
IC05Nyw2ICs5Nyw3IEBAIGNvbmZpZyBSSVNDVgogCXNlbGVjdCBDTE9ORV9CQUNLV0FSRFMKIAlz
ZWxlY3QgQ09NTU9OX0NMSwogCXNlbGVjdCBDUFVfUE0gaWYgQ1BVX0lETEUgfHwgSElCRVJOQVRJ
T04gfHwgU1VTUEVORAorCXNlbGVjdCBEWU5BTUlDX0ZUUkFDRSBpZiBGVU5DVElPTl9UUkFDRVIK
IAlzZWxlY3QgRURBQ19TVVBQT1JUCiAJc2VsZWN0IEZSQU1FX1BPSU5URVIgaWYgUEVSRl9FVkVO
VFMgfHwgKEZVTkNUSU9OX1RSQUNFUiAmJiAhRFlOQU1JQ19GVFJBQ0UpCiAJc2VsZWN0IEZUUkFD
RV9NQ09VTlRfVVNFX1BBVENIQUJMRV9GVU5DVElPTl9FTlRSWSBpZiBEWU5BTUlDX0ZUUkFDRQot
LSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
