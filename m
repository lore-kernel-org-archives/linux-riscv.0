Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C66C77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 15:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YvH7LDuw9eKzo0P1YdgUaffCrIwFjoW3VdP6q6mwjU=; b=HniJjOW3e2jnum
	jZnmHNe3J0YkYDQ6YyNxPliYcKHrAC3vUKdHqdlyUcUOoshpjNQzAkglayRfbh0cWnx7fo4FjBm8H
	M/TI94WBgrt0dZ04C5ubvju44AslvvmNDa2mMUMaCMfESq3OJbaZtDDmK+EuQ0olcEKlQf3Hfl0Gc
	OGlxV8w93B4QqbFMv+3603AK5xieq09Oz5Nv3wbM13NU9gcHG+NRMbHQ5B+JtSDvDQz5EeuNXXCKd
	CC4h+Gn0sl2A+tfoXOnlJw/inwkIpaLovs/1PDKs9KGIbphmW3kElEruwTh4Mrv4HR/5pGdKOXHGx
	Ypc9kK/phQOvNClMcCTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpy-00A1n7-30;
	Fri, 14 Apr 2023 15:59:46 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpw-00A1l6-1J
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 15:59:46 +0000
Received: by mail-pl1-x633.google.com with SMTP id kh6so17138038plb.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 08:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681487982; x=1684079982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahp5kQnTghgkZmiSTxR6+eMYSF2yeYW/B9Sl3mLm86I=;
        b=jWHmU/ESlEHOVioBV8QithJ4pWOgoHH5LTG4cTPCqQwFXhWGAV+CAw9vIPolQzdFKg
         1O8hU9YR2eD4QNJ4eslFexI6xAN7K+8XELN9YWB/Q5ikzgY4TKcWePvNli9yKYw2Qf//
         UGjw4S3bQB0GRC/9puQ/wr8kgEXdBfo5dqG0yEU3DuPl4SDI5vKnvhdG5aWoD97UQuZe
         qI1AGxRQmg0qa/pJDjOuU/WuRmfA+ua04g027fEB2zwwZiuTlvIzlPC/I4xVtvft3Akc
         JRcNGAbJ9my8qAf2FFNaXFNEhXyL2mS31Upn6s6ICL1VPqmeM9RzDm2hiP5epyqX6YTu
         KmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487982; x=1684079982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahp5kQnTghgkZmiSTxR6+eMYSF2yeYW/B9Sl3mLm86I=;
        b=FZbUYEwjr3jdNCLQHUflf/H9dSZFp4+sEc/V06wINDDT7de+yg5eAeEQCBq5v4+MBW
         2GlNDC18RcVJfaKsaKv48XRaPAMvqzd2hJKqgvSQOWBR7PnCe1pu4SDlnDJRpD94f+6s
         bg0F04CYSDvKzXrv7HO2435KG64OsaBIldH+c3u1Wis9k91JmlMAI3ijOoKPtfbJaMvO
         rGwvrRH1q4rMYozQUr4dxcoPuLQClkfHL9F1JBAFyjZQFL9FCfmtz45MoDoHuFtvuaNn
         pu0yEKn7H5nFTa8YmuepwEmOFwoYgn2nnuKAa30eoaOKP0XwJwfNCmzNcw3vNxXB6s4m
         qXnQ==
X-Gm-Message-State: AAQBX9fccSQijlK6AXX5kFYBjwfNtUx8gza/LpqsPaCIZ7CmJvZR2/MV
	JZBHPmfDZnN/7ft0m0ffDK1v2YZxXYtY0Qq7rl6RrEKugWQ1XbK4gIBXRxJttGDuqA6i1oPFHev
	Sr6WMBzc4LeCyIDv+BZC/FUaqnUXjz0FkUiCgHoF8lopjaRxOFZvNqCAYNwtLvjiO7pyrHHtZX5
	yPJxBR1vLu5bYb
X-Google-Smtp-Source: AKy350ZKao8CL5faXPhsQHH/k9HmEq8p+sEw8aF/D7/B8/02SnVH9xnwups8GJsXNgURoBC0Xrs70Q==
X-Received: by 2002:a17:90a:2e13:b0:23f:3f9c:7878 with SMTP id q19-20020a17090a2e1300b0023f3f9c7878mr5945626pjd.2.1681487981638;
        Fri, 14 Apr 2023 08:59:41 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.08.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 08:59:41 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH -next v18 08/20] riscv: Introduce struct/helpers to save/restore per-task Vector state
Date: Fri, 14 Apr 2023 15:58:31 +0000
Message-Id: <20230414155843.12963-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_085944_443072_33D46C86 
X-CRM114-Status: GOOD (  12.14  )
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

RnJvbTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KCkFkZCB2ZWN0b3Ig
c3RhdGUgY29udGV4dCBzdHJ1Y3QgdG8gYmUgYWRkZWQgbGF0ZXIgaW4gdGhyZWFkX3N0cnVjdC4g
QW5kCnByZXBhcmUgbG93LWxldmVsIGhlbHBlciBmdW5jdGlvbnMgdG8gc2F2ZS9yZXN0b3JlIHZl
Y3RvciBjb250ZXh0cy4KClRoaXMgaW5jbHVkZSBWZWN0b3IgUmVnZmlsZSBhbmQgQ1NScyBob2xk
aW5nIGR5bmFtaWMgY29uZmlndXJhdGlvbiBzdGF0ZQoodnN0YXJ0LCB2bCwgdnR5cGUsIHZjc3Ip
LiBUaGUgVmVjIFJlZ2lzdGVyIHdpZHRoIGNvdWxkIGJlIGltcGxlbWVudGF0aW9uCmRlZmluZWQs
IGJ1dCBzYW1lIGZvciBhbGwgcHJvY2Vzc2VzLCBzbyB0aGF0IGlzIHNhdmVkIHNlcGFyYXRlbHku
CgpUaGlzIGlzIG5vdCB5ZXQgd2lyZWQgaW50byBmaW5hbCB0aHJlYWRfc3RydWN0IC0gd2lsbCBi
ZSBkb25lIHdoZW4KX19zd2l0Y2hfdG8gYWN0dWFsbHkgc3RhcnRzIGRvaW5nIHRoaXMgaW4gbGF0
ZXIgcGF0Y2hlcy4KCkdpdmVuIHRoZSB2YXJpYWJsZSAoYW5kIHBvdGVudGlhbGx5IGxhcmdlKSBz
aXplIG9mIHJlZ2ZpbGUsIHRoZXkgYXJlCnNhdmVkIGluIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBt
ZW1vcnksIHBvaW50ZWQgdG8gYnkgZGF0YXAgcG9pbnRlciBpbgpfX3Jpc2N2X3ZfZXh0X3N0YXRl
LgoKQ28tZGV2ZWxvcGVkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29t
PgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgpT
aWduZWQtb2ZmLWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBWaW5lZXQgR3VwdGEgPHZpbmVldGdAcml2b3NpbmMuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgpBY2tlZC1ieTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1
b3JlbkBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgpSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZydWxs
LmV1PgpUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVsbC5ldT4K
LS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oICAgICAgfCA5NSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmgg
fCAxNyArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3ZlY3Rvci5oCmluZGV4IDY4YzlmZTgzMWE0MS4uN2E1NmJiMDc2OWFhIDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdmVjdG9yLmgKQEAgLTExLDggKzExLDEwIEBACiAKICNpZmRlZiBDT05GSUdfUklTQ1Zf
SVNBX1YKIAorI2luY2x1ZGUgPGxpbnV4L3N0cmluZ2lmeS5oPgogI2luY2x1ZGUgPGFzbS9od2Nh
cC5oPgogI2luY2x1ZGUgPGFzbS9jc3IuaD4KKyNpbmNsdWRlIDxhc20vYXNtLmg+CiAKIGV4dGVy
biB1bnNpZ25lZCBsb25nIHJpc2N2X3ZfdnNpemU7CiBpbnQgcmlzY3Zfdl9zZXR1cF92c2l6ZSh2
b2lkKTsKQEAgLTIyLDYgKzI0LDI2IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNf
dmVjdG9yKHZvaWQpCiAJcmV0dXJuIHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KFJJU0NWX0lT
QV9FWFRfdik7CiB9CiAKK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX2NsZWFu
KHN0cnVjdCBwdF9yZWdzICpyZWdzKQoreworCXJlZ3MtPnN0YXR1cyA9IChyZWdzLT5zdGF0dXMg
JiB+U1JfVlMpIHwgU1JfVlNfQ0xFQU47Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl92
X3ZzdGF0ZV9vZmYoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCit7CisJcmVncy0+c3RhdHVzID0gKHJl
Z3MtPnN0YXR1cyAmIH5TUl9WUykgfCBTUl9WU19PRkY7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9p
ZCByaXNjdl92X3ZzdGF0ZV9vbihzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3sKKwlyZWdzLT5zdGF0
dXMgPSAocmVncy0+c3RhdHVzICYgflNSX1ZTKSB8IFNSX1ZTX0lOSVRJQUw7Cit9CisKK3N0YXRp
YyBpbmxpbmUgYm9vbCByaXNjdl92X3ZzdGF0ZV9xdWVyeShzdHJ1Y3QgcHRfcmVncyAqcmVncykK
K3sKKwlyZXR1cm4gKHJlZ3MtPnN0YXR1cyAmIFNSX1ZTKSAhPSAwOworfQorCiBzdGF0aWMgX19h
bHdheXNfaW5saW5lIHZvaWQgcmlzY3Zfdl9lbmFibGUodm9pZCkKIHsKIAljc3Jfc2V0KENTUl9T
U1RBVFVTLCBTUl9WUyk7CkBAIC0zMiwxMyArNTQsODYgQEAgc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSB2b2lkIHJpc2N2X3ZfZGlzYWJsZSh2b2lkKQogCWNzcl9jbGVhcihDU1JfU1NUQVRVUywgU1Jf
VlMpOwogfQogCitzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX192c3RhdGVfY3NyX3NhdmUo
c3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKmRlc3QpCit7CisJYXNtIHZvbGF0aWxlICgKKwkJ
ImNzcnIJJTAsICIgX19zdHJpbmdpZnkoQ1NSX1ZTVEFSVCkgIlxuXHQiCisJCSJjc3JyCSUxLCAi
IF9fc3RyaW5naWZ5KENTUl9WVFlQRSkgIlxuXHQiCisJCSJjc3JyCSUyLCAiIF9fc3RyaW5naWZ5
KENTUl9WTCkgIlxuXHQiCisJCSJjc3JyCSUzLCAiIF9fc3RyaW5naWZ5KENTUl9WQ1NSKSAiXG5c
dCIKKwkJOiAiPXIiIChkZXN0LT52c3RhcnQpLCAiPXIiIChkZXN0LT52dHlwZSksICI9ciIgKGRl
c3QtPnZsKSwKKwkJICAiPXIiIChkZXN0LT52Y3NyKSA6IDopOworfQorCitzdGF0aWMgX19hbHdh
eXNfaW5saW5lIHZvaWQgX192c3RhdGVfY3NyX3Jlc3RvcmUoc3RydWN0IF9fcmlzY3Zfdl9leHRf
c3RhdGUgKnNyYykKK3sKKwlhc20gdm9sYXRpbGUgKAorCQkiLm9wdGlvbiBwdXNoXG5cdCIKKwkJ
Ii5vcHRpb24gYXJjaCwgK3Zcblx0IgorCQkidnNldHZsCSB4MCwgJTIsICUxXG5cdCIKKwkJIi5v
cHRpb24gcG9wXG5cdCIKKwkJImNzcncJIiBfX3N0cmluZ2lmeShDU1JfVlNUQVJUKSAiLCAlMFxu
XHQiCisJCSJjc3J3CSIgX19zdHJpbmdpZnkoQ1NSX1ZDU1IpICIsICUzXG5cdCIKKwkJOiA6ICJy
IiAoc3JjLT52c3RhcnQpLCAiciIgKHNyYy0+dnR5cGUpLCAiciIgKHNyYy0+dmwpLAorCQkgICAg
InIiIChzcmMtPnZjc3IpIDopOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNjdl92X3Zz
dGF0ZV9zYXZlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICpzYXZlX3RvLAorCQkJCQkgdm9p
ZCAqZGF0YXApCit7CisJdW5zaWduZWQgbG9uZyB2bDsKKworCXJpc2N2X3ZfZW5hYmxlKCk7CisJ
X192c3RhdGVfY3NyX3NhdmUoc2F2ZV90byk7CisJYXNtIHZvbGF0aWxlICgKKwkJIi5vcHRpb24g
cHVzaFxuXHQiCisJCSIub3B0aW9uIGFyY2gsICt2XG5cdCIKKwkJInZzZXR2bGkJJTAsIHgwLCBl
OCwgbTgsIHRhLCBtYVxuXHQiCisJCSJ2c2U4LnYJCXYwLCAoJTEpXG5cdCIKKwkJImFkZAkJJTEs
ICUxLCAlMFxuXHQiCisJCSJ2c2U4LnYJCXY4LCAoJTEpXG5cdCIKKwkJImFkZAkJJTEsICUxLCAl
MFxuXHQiCisJCSJ2c2U4LnYJCXYxNiwgKCUxKVxuXHQiCisJCSJhZGQJCSUxLCAlMSwgJTBcblx0
IgorCQkidnNlOC52CQl2MjQsICglMSlcblx0IgorCQkiLm9wdGlvbiBwb3Bcblx0IgorCQk6ICI9
JnIiICh2bCkgOiAiciIgKGRhdGFwKSA6ICJtZW1vcnkiKTsKKwlyaXNjdl92X2Rpc2FibGUoKTsK
K30KKworc3RhdGljIGlubGluZSB2b2lkIF9fcmlzY3Zfdl92c3RhdGVfcmVzdG9yZShzdHJ1Y3Qg
X19yaXNjdl92X2V4dF9zdGF0ZSAqcmVzdG9yZV9mcm9tLAorCQkJCQkgICAgdm9pZCAqZGF0YXAp
Cit7CisJdW5zaWduZWQgbG9uZyB2bDsKKworCXJpc2N2X3ZfZW5hYmxlKCk7CisJYXNtIHZvbGF0
aWxlICgKKwkJIi5vcHRpb24gcHVzaFxuXHQiCisJCSIub3B0aW9uIGFyY2gsICt2XG5cdCIKKwkJ
InZzZXR2bGkJJTAsIHgwLCBlOCwgbTgsIHRhLCBtYVxuXHQiCisJCSJ2bGU4LnYJCXYwLCAoJTEp
XG5cdCIKKwkJImFkZAkJJTEsICUxLCAlMFxuXHQiCisJCSJ2bGU4LnYJCXY4LCAoJTEpXG5cdCIK
KwkJImFkZAkJJTEsICUxLCAlMFxuXHQiCisJCSJ2bGU4LnYJCXYxNiwgKCUxKVxuXHQiCisJCSJh
ZGQJCSUxLCAlMSwgJTBcblx0IgorCQkidmxlOC52CQl2MjQsICglMSlcblx0IgorCQkiLm9wdGlv
biBwb3Bcblx0IgorCQk6ICI9JnIiICh2bCkgOiAiciIgKGRhdGFwKSA6ICJtZW1vcnkiKTsKKwlf
X3ZzdGF0ZV9jc3JfcmVzdG9yZShyZXN0b3JlX2Zyb20pOworCXJpc2N2X3ZfZGlzYWJsZSgpOwor
fQorCiAjZWxzZSAvKiAhIENPTkZJR19SSVNDVl9JU0FfViAgKi8KIAogc3RydWN0IHB0X3JlZ3M7
CiAKIHN0YXRpYyBpbmxpbmUgaW50IHJpc2N2X3Zfc2V0dXBfdnNpemUodm9pZCkgeyByZXR1cm4g
LUVPUE5PVFNVUFA7IH0KIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNfdmVjdG9yKHZv
aWQpIHsgcmV0dXJuIGZhbHNlOyB9CitzdGF0aWMgaW5saW5lIGJvb2wgcmlzY3Zfdl92c3RhdGVf
cXVlcnkoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpIHsgcmV0dXJuIGZhbHNlOyB9CiAjZGVmaW5lIHJp
c2N2X3ZfdnNpemUgKDApCisjZGVmaW5lIHJpc2N2X3ZfdnN0YXRlX29mZihyZWdzKQkJZG8ge30g
d2hpbGUgKDApCisjZGVmaW5lIHJpc2N2X3ZfdnN0YXRlX29uKHJlZ3MpCQkJZG8ge30gd2hpbGUg
KDApCiAKICNlbmRpZiAvKiBDT05GSUdfUklTQ1ZfSVNBX1YgKi8KIApkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3B0cmFjZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL3B0cmFjZS5oCmluZGV4IDg4MjU0N2Y2YmQ1Yy4uNTg2Nzg2ZDAyM2M0IDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmgKKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL3B0cmFjZS5oCkBAIC03Nyw2ICs3NywyMyBAQCB1bmlvbiBfX3Jp
c2N2X2ZwX3N0YXRlIHsKIAlzdHJ1Y3QgX19yaXNjdl9xX2V4dF9zdGF0ZSBxOwogfTsKIAorc3Ry
dWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgeworCXVuc2lnbmVkIGxvbmcgdnN0YXJ0OworCXVuc2ln
bmVkIGxvbmcgdmw7CisJdW5zaWduZWQgbG9uZyB2dHlwZTsKKwl1bnNpZ25lZCBsb25nIHZjc3I7
CisJdm9pZCAqZGF0YXA7CisJLyoKKwkgKiBJbiBzaWduYWwgaGFuZGxlciwgZGF0YXAgd2lsbCBi
ZSBzZXQgYSBjb3JyZWN0IHVzZXIgc3RhY2sgb2Zmc2V0CisJICogYW5kIHZlY3RvciByZWdpc3Rl
cnMgd2lsbCBiZSBjb3BpZWQgdG8gdGhlIGFkZHJlc3Mgb2YgZGF0YXAKKwkgKiBwb2ludGVyLgor
CSAqCisJICogSW4gcHRyYWNlIHN5c2NhbGwsIGRhdGFwIHdpbGwgYmUgc2V0IHRvIHplcm8gYW5k
IHRoZSB2ZWN0b3IKKwkgKiByZWdpc3RlcnMgd2lsbCBiZSBjb3BpZWQgdG8gdGhlIGFkZHJlc3Mg
cmlnaHQgYWZ0ZXIgdGhpcworCSAqIHN0cnVjdHVyZS4KKwkgKi8KK307CisKICNlbmRpZiAvKiBf
X0FTU0VNQkxZX18gKi8KIAogI2VuZGlmIC8qIF9VQVBJX0FTTV9SSVNDVl9QVFJBQ0VfSCAqLwot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
