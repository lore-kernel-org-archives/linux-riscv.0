Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D526BC77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 04:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jt6qjQNdSXjAjK90UQ3bmaxjHOpXiG7T5EJxaIGchgg=; b=Seft21tSWfPu6Z
	+dZOWOyWgoSsychiE4GISjLlCeyzAQmgKFbdjA0D7MWx0/Cwb620Rbc/win8VB7zjZbS6d/w+U2VT
	O7inHvL+wGIbhO5siHkH4qRO9KhEnc3cPA+GJ3GPdVPNxPMigeQ79+ThsR+NEy8+JCSLVV3yFkZGb
	+HBTUQ3gO5X4vftGqTIVfIUlHnWsPjcYX+QDwqBY9UY84rUMLGb/QywSBCFcx21pRDLD8wSm/10vy
	4p72vOiIcDPCffm4+fv+v9B+1FUxcI8P05UymAR856mmnliZ6vYxDFjOUngXdRLJ8btZ1ra0jxlni
	lvU9sJ9HLpAeVoUCkVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pljEb-00EYXY-0C;
	Mon, 10 Apr 2023 04:34:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pljEW-00EYWK-1L
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 04:34:27 +0000
Received: by mail-pj1-x102f.google.com with SMTP id bp17-20020a17090b0c1100b0023f187954acso3455954pjb.2
        for <linux-riscv@lists.infradead.org>; Sun, 09 Apr 2023 21:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681101262; x=1683693262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ecKT1WgumVZWHqkbiz0HGwciSPCvvYfzypMqhbHlCE=;
        b=QeXYCEsNv40wBCRXzI295jNyAdVdPf1PAT7061zh5DS9PYmUTru+XSI1I5rHE3bO/4
         ss3EC9Q09/WYM3qK0shaKpyWwXPY8nx2QvxIGM9AAQZZG1jySu7ApGQ6NwPd4ICfKJZP
         XC35bbkXCIGvFh1iW2Row1UVlmNObI3qntQegPZFn+b1GsBJYbWkHWvqgJ27Aiz8Skiu
         zbeqfaMDrcFh8EsmZ5LlYJMckFgfck35VHCd1MhtXRVXFfNrD1bJwxPRs9vU2lVPzv4B
         Y93xMZD2qCtzjfzgigWrk0zTfBQ/gSHKf7nxJ2HG3RaxVsB+mEDfYklHgQs2Y3T3eTSq
         OHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681101262; x=1683693262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ecKT1WgumVZWHqkbiz0HGwciSPCvvYfzypMqhbHlCE=;
        b=kxEL8cGKluBmgFyqWwf2vV2HcYrTN45DW3HLQarmqeUxWwF1Q/InqmTjtjYPa6RHVm
         alu3a6IDqhvwRQ4UW141P5LdWDAZyGcP9Z45yIXcnWMBoPowp+vArzid9BOQAbHsilq6
         VGisCYkdyk8sMyh/g9iRc2FtCgzN2ReOtRTvk4AfomTZHKEtTgs2S5RNgO7ItUI1UnRD
         jKtkt3y+kE/RwxCd6YvmyA6N3fEJyCPxCaEeDVVlAmadzp5rKBNKlItl18L47knniIou
         D00ihKzw622z0IkfaDTxOuXwWqNaJP5vlrdDT7VCWEJNFbbUYTvPSLx2Sg5Qo0OBnKZb
         TbPg==
X-Gm-Message-State: AAQBX9fZdR2mhC4Vfq65Hp6j/2FlgUxy+7egAgUFbJvvWBwrM+nG5OuR
	z6yHnhEsfeMbFG0tklpolDmIpsDwNEOpcV1mJ4Sd/g==
X-Google-Smtp-Source: AKy350YsGs/FeHP8pm5lKkePm0VFJjupN5AEbHfEF4j3r2KlkU/WQ4HHiT/4WGzUGPr/Kvpv92e3Lg==
X-Received: by 2002:a05:6a20:4b15:b0:da:c7e:6ec0 with SMTP id fp21-20020a056a204b1500b000da0c7e6ec0mr5945527pzb.25.1681101262373;
        Sun, 09 Apr 2023 21:34:22 -0700 (PDT)
Received: from x1.. ([2601:1c2:1801:d250:45c0:94f2:eea7:6dc3])
        by smtp.gmail.com with ESMTPSA id x24-20020aa793b8000000b00634a96493f7sm2394411pff.128.2023.04.09.21.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 21:34:21 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	James Morse <james.morse@arm.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 1/2] RISC-V: Detect the Ssqosid extension
Date: Sun,  9 Apr 2023 21:36:45 -0700
Message-Id: <20230410043646.3138446-2-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410043646.3138446-1-dfustini@baylibre.com>
References: <20230410043646.3138446-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230409_213424_636471_7CAC37F6 
X-CRM114-Status: GOOD (  11.06  )
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

RnJvbTogS29ybmVsIER1bMSZYmEgPG1pbmRhbEBzZW1paGFsZi5jb20+CgpEZXRlY3QgdGhlIFNz
cW9zaWQgZXh0ZW5zaW9uIChTdXBlcnZpc29yLW1vZGUgUXVhbGl0eSBvZiBTZXJ2aWNlIElEKSBh
cwpkZWZpbmVkIGluIHRoZSBDQlFSSSAoQ2FwYWNpdHkgYW5kIEJhbmR3aWR0aCBRb1MgUmVnaXN0
ZXIgSW50ZXJmYWNlKQpzcGVjaWZpY2F0aW9uLgoKTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2LW5vbi1pc2EvcmlzY3YtY21xcmkvYmxvYi9tYWluL3Jpc2N2LWNicXJpLnBkZgpTaWduZWQt
b2ZmLWJ5OiBLb3JuZWwgRHVsxJliYSA8bWluZGFsQHNlbWloYWxmLmNvbT4KW2RmdXN0aW5pOiBy
ZWJhc2UgZnJvbSB2Ni4wIHRvIHY2LjNdClNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZGZ1
c3RpbmlAYmF5bGlicmUuY29tPgotLS0KTm90ZTogdGhlIFNzcW9zaWQgZXh0ZW5zaW9uIGFuZCBD
QlFSSSBzcGVjIGFyZSBzdGlsbCBpbiBhIGRyYWZ0IHN0YXRlLgoKIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaHdjYXAuaCB8IDIgKysKIGFyY2gvcmlzY3Yva2VybmVsL2NwdS5jICAgICAgICB8IDEg
KwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdj
YXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCA5YWY3OTM5NzA4NTUu
LjZkZDcxNzAzMDcyMyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
CisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtNDQsNiArNDQsOCBAQAog
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNFCTMyCiAjZGVmaW5lIFJJU0NWX0lTQV9F
WFRfU1ZOQVBPVAkJMzMKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUNCT1oJCTM0CisjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfU1NRT1NJRAkJMzUKKwogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFY
CQk2NAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX05BTUVfTEVOX01BWAkzMgpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwppbmRleCA5
MjAzZTE4MzIwZjkuLjA0YmQwYTIxOTEwZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKQEAgLTE5MCw2ICsxOTAsNyBAQCBz
dGF0aWMgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSBpc2FfZXh0X2FycltdID0gewogCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHppaGludHBhdXNlLCBSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNFKSwK
IAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmIsIFJJU0NWX0lTQV9FWFRfWkJCKSwKIAlfX1JJU0NW
X0lTQV9FWFRfREFUQShzc2NvZnBtZiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiksCisJX19SSVND
Vl9JU0FfRVhUX0RBVEEoc3Nxb3NpZCwgUklTQ1ZfSVNBX0VYVF9TU1FPU0lEKSwKIAlfX1JJU0NW
X0lTQV9FWFRfREFUQShzc3RjLCBSSVNDVl9JU0FfRVhUX1NTVEMpLAogCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBKHN2aW52YWwsIFJJU0NWX0lTQV9FWFRfU1ZJTlZBTCksCiAJX19SSVNDVl9JU0FfRVhU
X0RBVEEoc3ZuYXBvdCwgUklTQ1ZfSVNBX0VYVF9TVk5BUE9UKSwKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
YwppbmRleCAwMGQ3Y2QyYzkwNDMuLjk0YmY1NTU2MzQ3ZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
YwpAQCAtMjI2LDYgKzIyNiw3IEBAIHZvaWQgX19pbml0IHJpc2N2X2ZpbGxfaHdjYXAodm9pZCkK
IAkJCX0gZWxzZSB7CiAJCQkJLyogc29ydGVkIGFscGhhYmV0aWNhbGx5ICovCiAJCQkJU0VUX0lT
QV9FWFRfTUFQKCJzc2NvZnBtZiIsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYpOworCQkJCVNFVF9J
U0FfRVhUX01BUCgic3Nxb3NpZCIsIFJJU0NWX0lTQV9FWFRfU1NRT1NJRCk7CiAJCQkJU0VUX0lT
QV9FWFRfTUFQKCJzc3RjIiwgUklTQ1ZfSVNBX0VYVF9TU1RDKTsKIAkJCQlTRVRfSVNBX0VYVF9N
QVAoInN2aW52YWwiLCBSSVNDVl9JU0FfRVhUX1NWSU5WQUwpOwogCQkJCVNFVF9JU0FfRVhUX01B
UCgic3ZuYXBvdCIsIFJJU0NWX0lTQV9FWFRfU1ZOQVBPVCk7Ci0tIAoyLjM0LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
