Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2846C4345F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 May 2024 19:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0+iCsnjAbF4Ti06OzjhjqNJUQbXH4Kq5Mu+bZ/Et64=; b=GAnflgV5LRUbCy
	uZOY6YDhbpQiSfPISzS6lJTVtmN/dJR5RpaMPT44euiLlrRKFgy/H8ZWJEjg09b8GFwRlnBgwXiqL
	z+ykvOEStzI/Xeuv9gRD634wLelN7Tfv3gP7J8b93rD8jOyZFOVhLz3QLr7QQQ2m4YEnlisUjlJK9
	tq1Srs7681gBayJs4qDdgkAtgnX23LgrBdFIO0y5j+dP2zPJ3fweFwfvfNu/a7Q9BaTwqWphREXgb
	2tFCILFAWIqxBRaBMl8rl+OtQ2XHyv94EXcBTqFRzj9bxq6xoKRcBuzNb4JKCREpNgCR/9YH9OHBt
	3M//wzD1k2qwqKoj/IMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3L9w-00000002jJx-3t98;
	Sat, 04 May 2024 19:35:00 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3L9t-00000002jHy-064V
	for linux-riscv@lists.infradead.org;
	Sat, 04 May 2024 19:34:58 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B57773FE63
	for <linux-riscv@lists.infradead.org>; Sat,  4 May 2024 19:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714851291;
	bh=XYcyH30Tdg0L1XT/KhSL5KHFpF2lXtDsTt+QyOMRfmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=r9Y4m7dxMZXV3maoVzMFgVwXYJxNGQ4EPQDIrsaD7DLhkrvIIOGfL3MMpwzjSACpl
	 grskiZuCNLWG8r0scYnZ0D3TsZ5FdepFsFq/RkRpOuV+0gYv2bKv4YuT3QH9QNtlra
	 6yqtC+Q1uxtkEDxwhoskc9chlE8mBlwTQebVuvWbjGk+s1T3RvNAqtxiHhq7ClDzXk
	 modFrNarb/Vmqh3pVX+XRXPX09iBPhbhowjHZjttu7C4ZOd0uHq0QMgiSD5vdfk1so
	 n+MN32F+dCrHGVVgoCwwKsd+5z9tqneq4CW1P87OmIiP9OQnb1v920ptcaawTSUQyj
	 +Vw/TBq/3XFwA==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5726d06aa18so78212a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 04 May 2024 12:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714851290; x=1715456090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYcyH30Tdg0L1XT/KhSL5KHFpF2lXtDsTt+QyOMRfmk=;
        b=M5VFrp/e3SRgcHw3BDL2XAY/PzJYWtfpRpyuQnR2qyUICfWZH8C4U+apzfxH0ceUEZ
         z0kEDxBzvbldkykYwgY3XeChno1GVqzKHlgc+9d03kcIdd6z3HI3Vw1VPuR/UKnra5jw
         bUEUTPLmLvu5B447/QNCcyZxwsuA0AbnDA6ST0ytHOaClY50WQCRPr4QgAlsm5upb6mA
         5BUKTy4oh3j+9nWlagIAxFAcCIeQ3YBRLwMkyS7akyGD4WGc//YEi0JNVyldhP+R/oIn
         /L7koTEcqTqS36jXVtI6Lq48uRyn1yS+McbM5inH0m8k0pd7BtC8z+8vSFaSuuG5Oh+9
         PyuA==
X-Gm-Message-State: AOJu0Yx1OaxILb2BBZZXIoVZOu1djZYXXxpfRBa2y2uQ+c/ugjVgAh+K
	Zzts3qf6iAU+ySKDbbrbGnI2BHT3u7lu4hGsehuE3YnX4lBKXhT2+5O8BmRB6ssmC53Kf5qvn1n
	Z18RbNpgiFJSL5UTVolzQ96uZnnbuGSvjvqJ8MEa+ru7IhILNxOOxD/OYCwRqeQCPU+9A0Knjvh
	vC/0PzDsGz+TUuxw==
X-Received: by 2002:a50:d5d8:0:b0:572:4fc3:3a28 with SMTP id g24-20020a50d5d8000000b005724fc33a28mr3895875edj.23.1714851290380;
        Sat, 04 May 2024 12:34:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnRJR1GyEL9wACd0QWSYElWiR8PckNNzcjss6a2GKF18p7Qs7LRVI0kBoEyI6PAN3xCIefKQ==
X-Received: by 2002:a50:d5d8:0:b0:572:4fc3:3a28 with SMTP id g24-20020a50d5d8000000b005724fc33a28mr3895868edj.23.1714851290043;
        Sat, 04 May 2024 12:34:50 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id et4-20020a056402378400b00572d255e342sm2227021edb.10.2024.05.04.12.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 12:34:49 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Terrell <terrelln@fb.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v2 1/2] riscv: make image compression configurable
Date: Sat,  4 May 2024 21:34:38 +0200
Message-ID: <20240504193446.196886-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
References: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_123457_225110_DDA622B2 
X-CRM114-Status: GOOD (  14.12  )
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

UHJldmlvdXNseSB0aGUgYnVpbGQgcHJvY2VzcyB3b3VsZCBhbHdheXMgc2V0IEtCVUlMRF9JTUFH
RSB0byB0aGUKdW5jb21wcmVzc2VkIEltYWdlIGZpbGUgKHVubGVzcyBYSVBfS0VSTkVMIG9yIEVG
SV9aQk9PVCB3YXMgZW5hYmxlZCkgYW5kCnVuY29uZGl0aW9uYWxseSBjb21wcmVzcyBpdCBpbnRv
IEltYWdlLmd6LiBIb3dldmVyIHRoZXJlIGFyZSBhbHJlYWR5CmJ1aWxkIHRhcmdldHMgZm9yIElt
YWdlLmJ6MiwgSW1hZ2UubHo0LCBJbWFnZS5sem1hLCBJbWFnZS5sem8gYW5kCkltYWdlLnpzdGQs
IHNvIGxldCdzIG1ha2UgdXNlIG9mIHRob3NlLCBtYWtlIHRoZSBjb21wcmVzc2lvbiBtZXRob2QK
Y29uZmlndXJhYmxlIGFuZCBzZXQgS0JVSUxEX0lNQUdFIGFjY29yZGluZ2x5IHNvIHRoYXQgdGFy
Z2V0cyBsaWtlCidtYWtlIGluc3RhbGwnIGFuZCAnbWFrZSBiaW5kZWItcGtnJyB3aWxsIHVzZSB0
aGUgY2hvc2VuIGltYWdlLgoKVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2lu
Yy5jb20+ClNpZ25lZC1vZmYtYnk6IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5i
ZXJ0aGluZ0BjYW5vbmljYWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBSZWJhc2Ugb24gcmlz
Y3YvZm9yLW5leHQKLSBVc2UgYm9vdC1pbWFnZS0kKENPTkZJR18uLikgOj0gYXNzaWdubWVudHMg
cmF0aGVyIHRoYW4gaWZlcSB0cmFpbgotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgIHwg
IDcgKysrKysrKwogYXJjaC9yaXNjdi9NYWtlZmlsZSAgICAgICAgfCAzOCArKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9ib290L2luc3RhbGwuc2ggfCAg
OSArKysrKystLS0KIDMgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29u
ZmlnCmluZGV4IDZiZWMxYmNlNjU4Ni4uNzllNTU4Mzk3ZjQxIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L0tjb25maWcKKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCkBAIC0xNDAsNiArMTQwLDEzIEBA
IGNvbmZpZyBSSVNDVgogCXNlbGVjdCBIQVZFX0dDQ19QTFVHSU5TCiAJc2VsZWN0IEhBVkVfR0VO
RVJJQ19WRFNPIGlmIE1NVSAmJiA2NEJJVAogCXNlbGVjdCBIQVZFX0lSUV9USU1FX0FDQ09VTlRJ
TkcKKwlzZWxlY3QgSEFWRV9LRVJORUxfQlpJUDIgaWYgIVhJUF9LRVJORUwgJiYgIUVGSV9aQk9P
VAorCXNlbGVjdCBIQVZFX0tFUk5FTF9HWklQIGlmICFYSVBfS0VSTkVMICYmICFFRklfWkJPT1QK
KwlzZWxlY3QgSEFWRV9LRVJORUxfTFo0IGlmICFYSVBfS0VSTkVMICYmICFFRklfWkJPT1QKKwlz
ZWxlY3QgSEFWRV9LRVJORUxfTFpNQSBpZiAhWElQX0tFUk5FTCAmJiAhRUZJX1pCT09UCisJc2Vs
ZWN0IEhBVkVfS0VSTkVMX0xaTyBpZiAhWElQX0tFUk5FTCAmJiAhRUZJX1pCT09UCisJc2VsZWN0
IEhBVkVfS0VSTkVMX1VOQ09NUFJFU1NFRCBpZiAhWElQX0tFUk5FTCAmJiAhRUZJX1pCT09UCisJ
c2VsZWN0IEhBVkVfS0VSTkVMX1pTVEQgaWYgIVhJUF9LRVJORUwgJiYgIUVGSV9aQk9PVAogCXNl
bGVjdCBIQVZFX0tQUk9CRVMgaWYgIVhJUF9LRVJORUwKIAlzZWxlY3QgSEFWRV9LUFJPQkVTX09O
X0ZUUkFDRSBpZiAhWElQX0tFUk5FTAogCXNlbGVjdCBIQVZFX0tSRVRQUk9CRVMgaWYgIVhJUF9L
RVJORUwKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L01ha2Vm
aWxlCmluZGV4IDhiMmFlMjdmMWQ5OC4uMDdmZjJmMzRmMGRjIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKQEAgLTEzNiwyMCArMTM2LDIw
IEBAIGVuZGlmCiBDSEVDS0ZMQUdTICs9IC1EX19yaXNjdiAtRF9fcmlzY3ZfeGxlbj0kKEJJVFMp
CiAKICMgRGVmYXVsdCB0YXJnZXQgd2hlbiBleGVjdXRpbmcgcGxhaW4gbWFrZQotYm9vdAkJOj0g
YXJjaC9yaXNjdi9ib290Ci1pZmVxICgkKENPTkZJR19YSVBfS0VSTkVMKSx5KQotS0JVSUxEX0lN
QUdFIDo9ICQoYm9vdCkveGlwSW1hZ2UKLWVsc2UKLWlmZXEgKCQoQ09ORklHX1JJU0NWX01fTU9E
RSkkKENPTkZJR19BUkNIX0NBTkFBTikseXkpCi1LQlVJTERfSU1BR0UgOj0gJChib290KS9sb2Fk
ZXIuYmluCi1lbHNlCi1pZmVxICgkKENPTkZJR19FRklfWkJPT1QpLCkKLUtCVUlMRF9JTUFHRQk6
PSAkKGJvb3QpL0ltYWdlLmd6Ci1lbHNlCi1LQlVJTERfSU1BR0UgOj0gJChib290KS92bWxpbnV6
LmVmaQotZW5kaWYKLWVuZGlmCitib290CQkJCQk6PSBhcmNoL3Jpc2N2L2Jvb3QKK2Jvb3QtaW1h
Z2UteQkJCQk6PSBJbWFnZQorYm9vdC1pbWFnZS0kKENPTkZJR19LRVJORUxfQlpJUDIpCTo9IElt
YWdlLmJ6MgorYm9vdC1pbWFnZS0kKENPTkZJR19LRVJORUxfR1pJUCkJOj0gSW1hZ2UuZ3oKK2Jv
b3QtaW1hZ2UtJChDT05GSUdfS0VSTkVMX0xaNCkJCTo9IEltYWdlLmx6NAorYm9vdC1pbWFnZS0k
KENPTkZJR19LRVJORUxfTFpNQSkJOj0gSW1hZ2UubHptYQorYm9vdC1pbWFnZS0kKENPTkZJR19L
RVJORUxfTFpPKQkJOj0gSW1hZ2UubHpvCitib290LWltYWdlLSQoQ09ORklHX0tFUk5FTF9aU1RE
KQk6PSBJbWFnZS56c3QKK2lmZGVmIENPTkZJR19SSVNDVl9NX01PREUKK2Jvb3QtaW1hZ2UtJChD
T05GSUdfQVJDSF9DQU5BQU4pCTo9IGxvYWRlci5iaW4KIGVuZGlmCitib290LWltYWdlLSQoQ09O
RklHX0VGSV9aQk9PVCkJCTo9IHZtbGludXouZWZpCitib290LWltYWdlLSQoQ09ORklHX1hJUF9L
RVJORUwpCQk6PSB4aXBJbWFnZQorS0JVSUxEX0lNQUdFCQkJCTo9ICQoYm9vdCkvJChib290LWlt
YWdlLXkpCiAKIGxpYnMteSArPSBhcmNoL3Jpc2N2L2xpYi8KIGxpYnMtJChDT05GSUdfRUZJX1NU
VUIpICs9ICQob2JqdHJlZSkvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9saWIuYQpAQCAt
MTY4LDIxICsxNjgsMTkgQEAgZW5kaWYKIHZkc28taW5zdGFsbC15CQkJKz0gYXJjaC9yaXNjdi9r
ZXJuZWwvdmRzby92ZHNvLnNvLmRiZwogdmRzby1pbnN0YWxsLSQoQ09ORklHX0NPTVBBVCkJKz0g
YXJjaC9yaXNjdi9rZXJuZWwvY29tcGF0X3Zkc28vY29tcGF0X3Zkc28uc28uZGJnCiAKLUJPT1Rf
VEFSR0VUUyA6PSBJbWFnZSBJbWFnZS5neiBsb2FkZXIgbG9hZGVyLmJpbiB4aXBJbWFnZSB2bWxp
bnV6LmVmaQorQk9PVF9UQVJHRVRTIDo9IEltYWdlIEltYWdlLmd6IEltYWdlLmJ6MiBJbWFnZS5s
ejQgSW1hZ2UubHptYSBJbWFnZS5sem8gSW1hZ2UuenN0IGxvYWRlciBsb2FkZXIuYmluIHhpcElt
YWdlIHZtbGludXouZWZpCiAKIGFsbDoJJChub3RkaXIgJChLQlVJTERfSU1BR0UpKQogCiBsb2Fk
ZXIuYmluOiBsb2FkZXIKLUltYWdlLmd6IGxvYWRlciB2bWxpbnV6LmVmaTogSW1hZ2UKK0ltYWdl
Lmd6IEltYWdlLmJ6MiBJbWFnZS5sejQgSW1hZ2UubHptYSBJbWFnZS5sem8gSW1hZ2UuenN0IGxv
YWRlciB4aXBJbWFnZSB2bWxpbnV6LmVmaTogSW1hZ2UKKwogJChCT09UX1RBUkdFVFMpOiB2bWxp
bnV4CiAJJChRKSQoTUFLRSkgJChidWlsZCk9JChib290KSAkKGJvb3QpLyRACiAJQCQoa2VjaG8p
ICcgIEtlcm5lbDogJChib290KS8kQCBpcyByZWFkeScKIAotSW1hZ2UuJTogSW1hZ2UKLQkkKFEp
JChNQUtFKSAkKGJ1aWxkKT0kKGJvb3QpICQoYm9vdCkvJEAKLQotaW5zdGFsbDogS0JVSUxEX0lN
QUdFIDo9ICQoYm9vdCkvSW1hZ2UKLXppbnN0YWxsOiBLQlVJTERfSU1BR0UgOj0gJChib290KS9J
bWFnZS5negorIyB0aGUgaW5zdGFsbCB0YXJnZXQgYWx3YXlzIGluc3RhbGxzIEtCVUlMRF9JTUFH
RSAod2hpY2ggbWF5IGJlIGNvbXByZXNzZWQpCisjIGJ1dCBrZWVwIHRoZSB6aW5zdGFsbCB0YXJn
ZXQgZm9yIGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlciByZWxlYXNlcwogaW5zdGFsbCB6aW5zdGFs
bDoKIAkkKGNhbGwgY21kLGluc3RhbGwpCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9p
bnN0YWxsLnNoIGIvYXJjaC9yaXNjdi9ib290L2luc3RhbGwuc2gKaW5kZXggNGM2M2YzZjA2NDNk
Li5hOGRmNzU5MTUxM2EgMTAwNzU1Ci0tLSBhL2FyY2gvcmlzY3YvYm9vdC9pbnN0YWxsLnNoCisr
KyBiL2FyY2gvcmlzY3YvYm9vdC9pbnN0YWxsLnNoCkBAIC0xNywxNSArMTcsMTggQEAKICMgICAk
MyAtIGtlcm5lbCBtYXAgZmlsZQogIyAgICQ0IC0gZGVmYXVsdCBpbnN0YWxsIHBhdGggKGJsYW5r
IGlmIHJvb3QgZGlyZWN0b3J5KQogCi1pZiBbICIkKGJhc2VuYW1lICQyKSIgPSAiSW1hZ2UuZ3oi
IF07IHRoZW4KK2Nhc2UgIiR7MiMjKi99IiBpbgogIyBDb21wcmVzc2VkIGluc3RhbGwKK0ltYWdl
Lip8dm1saW51ei5lZmkpCiAgIGVjaG8gIkluc3RhbGxpbmcgY29tcHJlc3NlZCBrZXJuZWwiCiAg
IGJhc2U9dm1saW51egotZWxzZQorICA7OwogIyBOb3JtYWwgaW5zdGFsbAorKikKICAgZWNobyAi
SW5zdGFsbGluZyBub3JtYWwga2VybmVsIgogICBiYXNlPXZtbGludXgKLWZpCisgIDs7Citlc2Fj
CiAKIGlmIFsgLWYgJDQvJGJhc2UtJDEgXTsgdGhlbgogICBtdiAkNC8kYmFzZS0kMSAkNC8kYmFz
ZS0kMS5vbGQKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
