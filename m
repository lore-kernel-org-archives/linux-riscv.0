Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E1AD44C5D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 14:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TtDNOxc7QLO7TISvDbCQ11Znx2NAGmxPPsmjd8yf1Ho=; b=4JlIaOeJFTOnU4
	9amVJSfGthQjvmxylk+arm/Z13Uxvy48zlB9j4lvHAMh8PC+tkHbTrOuKlO2x7s81SJ9m67sTtw8P
	zv8samUO/HwnCGO3hxGasc6PPrYmgcnBJt0ybCrxiy69mzistLhXJjviZXwAzZCyWRj5h3OkpGREQ
	obpgy+9opVgCtkESi71FdAIC+/FzYDsELKqnk+hmovfTfH1lY6fVhsbDhM4D5Yc2qdZNanZRak8WJ
	Rg1rHR8aWmvgfYWS+sLYP66McqvVDuCtMO1x9304TJnzDzfGZfR5NVVm6u30QUQaV5h1Wx8vN6CVe
	h4M3oIrW7I9A2xApL9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOkC-0000000CXi7-3wb5;
	Thu, 15 Jan 2026 14:54:40 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOk2-0000000CXcu-0Nic
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 14:54:39 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 60FEqoH5039422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 22:52:50 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Thu, 15 Jan 2026
 22:52:50 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
        Ben Zong-You Xie
	<ben717@andestech.com>
Subject: [PATCH 3/4] MAINTAINERS: add an entry for Andes I2C driver
Date: Thu, 15 Jan 2026 22:52:43 +0800
Message-ID: <20260115145244.435890-4-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115145244.435890-1-ben717@andestech.com>
References: <20260115145244.435890-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 60FEqoH5039422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_065430_496176_3A02D176 
X-CRM114-Status: UNSURE (   7.84  )
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

QWRkIGFuIGVudHJ5IGZvciB0aGUgQW5kZXMgSTJDIGRyaXZlciBpbiB0aGUgTUFJTlRBSU5FUlMg
ZmlsZS4KClNpZ25lZC1vZmYtYnk6IEJlbiBab25nLVlvdSBYaWUgPGJlbjcxN0BhbmRlc3RlY2gu
Y29tPgotLS0KIE1BSU5UQUlORVJTIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGRj
NzMxZDM3YzhmZS4uM2IwNTAzOWVmNDk3IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9N
QUlOVEFJTkVSUwpAQCAtMTgxNyw2ICsxODE3LDEyIEBAIFM6CVN1cHBvcnRlZAogRjoJZHJpdmVy
cy9jbGsvYW5hbG9nYml0cy8qCiBGOglpbmNsdWRlL2xpbnV4L2Nsay9hbmFsb2diaXRzKgogCitB
TkRFUyBJMkMgRFJJVkVSCitNOglCZW4gWm9uZy1Zb3UgWGllIDxiZW43MTdAYW5kZXN0ZWNoLmNv
bT4KK1M6CVN1cHBvcnRlZAorRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ky
Yy9hbmRlc3RlY2gsYXRjaWljMTAwLnlhbWwKK0Y6CWRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXRj
aWljMTAwLmMKKwogQU5EUk9JRCBEUklWRVJTCiBNOglHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPgogTToJQXJ2ZSBIasO4bm5ldsOlZyA8YXJ2ZUBhbmRyb2lk
LmNvbT4KLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
