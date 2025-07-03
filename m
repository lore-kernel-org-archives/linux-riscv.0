Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C999C83030
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 08:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E0HIii9+T+VeB3fmXBtK8JUd/bBlqdMM+k3yAFlvntQ=; b=iJC+bZQByNu2DE
	/uEnjc8Sh8Kup5tTopQFvXR64U8k6A1G8mFwxuXECPMGiD8JscPd+UOuSY2w9D5E+6O5Ff2Y18tCn
	MU78QpY5V6I0mJ34MdOSNCFcg0fNpx2rr829bmi9GcDed080Vlj4e4Y0rBu5vszfn516Llz6Rd1wA
	UymYONvo/PhJaKhwD6ZTwKBZZLlkf/ivrHfILxd/hytWAyBlekIcprdY8viZPZRnYgMBz5bliu9t5
	cP/vxvL7Fx3eG8KLtkp8tGQ8zSvRlwyQLP1yDBJs0Pko4csaxaDb9mlaefx8E/tmZTZ91WVnBUDL1
	olQut8+/JlcnUYS0S1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFaU-0000000AicP-2U1t;
	Thu, 03 Jul 2025 08:46:34 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFZA-0000000AiIv-1tGV
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 08:45:13 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b170c99aa49so6005395a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Jul 2025 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751532311; x=1752137111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3Z107VnaAMLtYbjfxHTZ3Ws4rPY5VMWknkGImN8dII=;
        b=SuzE4wdnPa4fcu64UC0tTCkS1HgXyjBnWAHqDTs+OpdU+ZmGUuw98/Uij+H1hWJEz9
         DIEIM0M67nqPQyu9bKLe0MqobbT817FPwY8IwFRKdAhYzwCBZAg9p5JksOT6r49JVUgD
         kE+Uy1GymEm1zIHgbCOvbj0qSmR3ET49mM4jUaH+DbV7RICq8xHRwIMDjhipnvZXnuvJ
         ccDKMQVoTmnS39qiyc79s8WDeGM8BAmLg40scAioPj79l2MUzqTOvmoeplTjoUDF2N3D
         8RzTMWkjo+w9NQdY9p7niQ84uVCMTDWfTMzr/lXUezVnH6aekUL0qAw2+rN3X7JNfG7H
         qLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532311; x=1752137111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3Z107VnaAMLtYbjfxHTZ3Ws4rPY5VMWknkGImN8dII=;
        b=PqeHQHiqJ/5G2ACfupJ9VFzTM4U/Xf73NpCAWIveqgZXPURWpmq4jSnXaGc2fDjoTV
         8JdrUdSViknszn7dmdKXoJYo5cNe0MB1rvaPXc1MzFwFr+GjTIqYitQgvxSihibSKpsj
         7hLMBb0uHUw6VDieOpOxDJTILufB3bDr+0VArWovu78j8+UKkEWInknk0XecS2sKWhLi
         dlpraFvpI249z9sNeOURtGxtfr9YPhFk+oiQazNFR1M3N4yn9FcV3ziyWBBgN/anxckT
         ShLPZjUESDns020p2d8LF5pHEV0OEiIigHGbb+lvTp2EQPgdFXKCNjNn7Bq2JXKI/qWQ
         ZONw==
X-Forwarded-Encrypted: i=1; AJvYcCVia3r0cNjJ7ANhwIMws4msSHRff08FRWQE4sqIUtH3Xc09CqgBzyJ7n7xRXojBGOe4SqFiTnXR1CZkVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmlxzqmBwr7WUjwocnap+bbnBt9W1zAOkqEZKyNVSngcnyBA0i
	eOw2hJti4VT0L5gaXqolrV636OnKjjJzWkifn3zyUqpkDM9gCrJ6JVBp
X-Gm-Gg: ASbGnctzlZj5TC2TRcdxRgVu/Pi+sHy5A9O1ejX3Yi+jj0b+usslxdc8p6fSezz/+DQ
	ZXaWOWFE2TLslAUFuSyN45xJPT9JYJ/P66MjmN3zxSfvZsxDsRXLf2do/9XxxNizELYY1YXMKnk
	9XWS+x5387NXbi3DYV1P4FD5LaT+/5Zk57/b7mn+QzUw5F3GdtY83h3sSdMC3sz+F6xJlxyb1P7
	y4quBLotlzUgfIs50Iz68MA1YsJWQMoOjHyaxpEVszEQaD+0dW4jAKro2FP8eiYGNi/Yum/mzRg
	qIrMlW32u+CgGopQ5gdVi6Pmo8OuRdDq68Vwdt8ovzy69qgGCTGFNvf2iA==
X-Google-Smtp-Source: AGHT+IEnjPIE4RkD8yeyExMffXHw1vkN2HUWnhx/66EOeXkQyVnH+BLsxBWYvtQaheJO0JIaL9o5zA==
X-Received: by 2002:a05:6a21:498:b0:21a:e751:e048 with SMTP id adf61e73a8af0-222d7f086f0mr11000209637.35.1751532311182;
        Thu, 03 Jul 2025 01:45:11 -0700 (PDT)
Received: from nyaos.. ([202.212.79.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3023a11sm12982398a12.25.2025.07.03.01.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:45:10 -0700 (PDT)
From: ChenMiao <chenmiao.ku@gmail.com>
To: Linux RISCV <linux-riscv@vger.kernel.org>
Cc: chenmiao <chenmiao.ku@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE selection
Date: Thu,  3 Jul 2025 08:45:02 +0000
Message-ID: <20250703084502.394406-1-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_014512_504277_3C7472EE 
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
