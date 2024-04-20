Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E8EC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcWzbko5etKI/gj6JSy/DihJjl91r5gUiHLnbmnLo1E=; b=miCTDQfstLZDqT
	iFcwNf1neT1zwTqWnPSJ2ARSJQ2JopgtKJKIcTcyttnTkhNK0N7dtTJ9fJF+ADZLLRu7t3KimBxny
	3QL9s9q1JyxP6bp370cfeCXaU2xPVhtl+XJq15MtvfY41utZuxLXVK4rZgo0X64FLv8pv0jZJmfCE
	igULNu4t2eNR/ZIU0eYbkjdzLcApj3JYCsk7ulmflH0lmlYRKHvnkV/MmycPOfeAoR7sfMhi25fPd
	IHSCB/8518ZBxVOEwWHRyjBHpVQ9IMvcIrpiNe7pxU2axumSSC7DMY6CVNQ0hel2Eky0ASEMOFT9e
	5P6/23DtXnhJc+rEF2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxT-00000007Ibf-4Aiu;
	Fri, 19 Apr 2024 23:47:55 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxM-00000007IUd-1U8L
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:47:50 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5e8470c1cb7so1680406a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570466; x=1714175266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1oS0ksNazYXtVOBgFTjTYlhVVLdg1h0owq7BrHVbdc=;
        b=AyBdnF8uguRJXH8fTSBly1BXPzjUjZVj0srBPbldNKhS3ZdVLxAjIUOxg9oiG/txbt
         Cv9EZhbYGSyUxXVV6lk6uxugnRxtID4IJa9QBMJKlWgLV9x+TcrdSU6QHz+tVc9iiN4f
         HTVsdKTcFK+Yvmq2/kwA4gLSdM99dn+0yXPmJfZXPkfxszoCO4Woxw2Sh4LzwTdI8HA1
         JmVKGcMooJebKKmawxUup+YnpgA+/0IPhsFDUOKjKHLyUZwEIkkaAZml8UrqiJyuhc7k
         K19ZhD9spfW3477WtjePMAIUIlwrvyS764IMvElbpSvLaGignr1zp+yIfLnaYdOWkyRu
         mbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570466; x=1714175266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1oS0ksNazYXtVOBgFTjTYlhVVLdg1h0owq7BrHVbdc=;
        b=XL8egfKjPGCpVFOvgCt1lcsJ99S4lbEUYc7qrfrz1JXlpH117YwAXcuyDZ75txviz8
         CV5UwgbCNK2LTYzE+TTMmf1aGKR7efgzHETNzz2GkaFuDdzzYqLSvZfbm+vaG4h1dn4i
         LyQ6TbJFpMvTNYcbVxMJuupZ8oxfIgeP3YUI6dUFppZ76Grv4gpSLSizOHWOiAgJXqed
         KS8BfbM59tMSouemnG/uhO5GErxcy4zZVJhBwOUZL5JsYXpLuMx2CzHkPJi9QdVNwYPt
         EUeFFa3YBR6InK37JZ7VrK9SUNxLXLzXiOlaYyoJiQq2+kfCYk2Vccek1oZxQtIwa6/P
         d6bA==
X-Forwarded-Encrypted: i=1; AJvYcCWI89ofMXuKDUZ8mXUsZ+gzYMMvnfP6POxF04Sovm2UNMiPVlK4U00YqNgoWbl4to6CoX5qnZM9tJf9i+5la3jwa5wTnwi8D2ADd3hqnLI5
X-Gm-Message-State: AOJu0YwdapxmQYigw9KV1amRv1cgDXgs5Z+h61jkTOFHwufv7GEUiLYM
	yvKXTZy4Zxkp5Qc7ASV9/ybyg3K/AwZburSM5uB2hzNclIVpjYnGMQGFes/hk9s=
X-Google-Smtp-Source: AGHT+IFVCYaBvcy0sMILQIREFkDThLyGOm3uHSxCPt859IORFbCyXjP0cIaU/flxgT2NJkC34c1s7Q==
X-Received: by 2002:a05:6a20:100b:b0:1a9:5e1f:8485 with SMTP id gs11-20020a056a20100b00b001a95e1f8485mr3527584pzc.31.1713570466351;
        Fri, 19 Apr 2024 16:47:46 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:47:45 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	samuel.holland@sifive.com,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v8 01/24] RISC-V: Fix the typo in Scountovf CSR name
Date: Sat, 20 Apr 2024 08:17:17 -0700
Message-Id: <20240420151741.962500-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_164748_461960_C30D2D42 
X-CRM114-Status: GOOD (  11.02  )
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

VGhlIGNvdW50ZXIgb3ZlcmZsb3cgQ1NSIG5hbWUgaXMgInNjb3VudG92ZiIgbm90ICJzc2NvdW50
b3ZmIi4KCkZpeCB0aGUgY3NyIG5hbWUuCgpGaXhlczogNDkwNWVjMmZiN2U2ICgiUklTQy1WOiBB
ZGQgc3Njb2ZwbWYgZXh0ZW5zaW9uIHN1cHBvcnQiKQpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4KUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+ClJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWlj
cm8uY29tPgpTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4K
LS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIHwgMiArLQogZHJpdmVycy9wZXJmL3Jp
c2N2X3BtdV9zYmkuYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCmluZGV4IDI0NjhjNTU5MzNjZC4uOWQxYjA3
OTMyNzk0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCisrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKQEAgLTI4MSw3ICsyODEsNyBAQAogI2RlZmluZSBD
U1JfSFBNQ09VTlRFUjMwSAkweGM5ZQogI2RlZmluZSBDU1JfSFBNQ09VTlRFUjMxSAkweGM5Zgog
Ci0jZGVmaW5lIENTUl9TU0NPVU5UT1ZGCQkweGRhMAorI2RlZmluZSBDU1JfU0NPVU5UT1ZGCQkw
eGRhMAogCiAjZGVmaW5lIENTUl9TU1RBVFVTCQkweDEwMAogI2RlZmluZSBDU1JfU0lFCQkJMHgx
MDQKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgYi9kcml2ZXJzL3Bl
cmYvcmlzY3ZfcG11X3NiaS5jCmluZGV4IDhjYmU2ZTVmOWMzOS4uM2U0NGQyZmI4YmY4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCisrKyBiL2RyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfc2JpLmMKQEAgLTI3LDcgKzI3LDcgQEAKIAogI2RlZmluZSBBTFRfU0JJX1BNVV9P
VkVSRkxPVyhfX292bCkJCQkJCVwKIGFzbSB2b2xhdGlsZShBTFRFUk5BVElWRV8yKAkJCQkJCVwK
LQkiY3NyciAlMCwgIiBfX3N0cmluZ2lmeShDU1JfU1NDT1VOVE9WRiksCQkJXAorCSJjc3JyICUw
LCAiIF9fc3RyaW5naWZ5KENTUl9TQ09VTlRPVkYpLAkJCQlcCiAJImNzcnIgJTAsICIgX19zdHJp
bmdpZnkoVEhFQURfQzlYWF9DU1JfU0NPVU5URVJPRiksCQlcCiAJCVRIRUFEX1ZFTkRPUl9JRCwg
RVJSQVRBX1RIRUFEX1BNVSwJCQlcCiAJCUNPTkZJR19FUlJBVEFfVEhFQURfUE1VLAkJCQlcCi0t
IAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
