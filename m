Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38A1C433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 09:16:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69FE621974
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 09:16:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lSLaJGRd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="mvZiTOpG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69FE621974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WDsIQ9RTOYTyKUuPxOaomPd5EvlUBCuL8gN/eRJoOBM=; b=lSLaJGRdi4jaGtExEyhMDCKo6e
	U20g/2hiSMt776jTDapfnBObDkqQ0GAOyoWgRwEwWZ4ads5yNgO8Rrk4tzruvS8JgYTpy5Ejl3OSr
	JM7WYw2xcciwkwXOYsAXfwJAjKImBKhGeQk7Jblz6IAps2vp+TZ+AgE/2AO9xOTaRPXwR9h8own7Q
	zmbVXYeQVOkvH6AsSDJsUrV9IpSu8Uc8/LT4kr3roIFMXXoHsoN3faut7RVPP4x1g/RF3qFFK/ZEx
	x8EjEb7cK+h7VqcA5SKlLisSW8mmcFFRcV00oYEZxQZzS4PSWvc25RMVZeNtmfnG3WE84iUe9B9Eh
	XwTfuEiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI74q-0005Se-Ql; Tue, 15 Sep 2020 09:16:40 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI74n-0005Rp-JJ
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 09:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600161398; x=1631697398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hS5X/lKRjk7a31ez79HKnxlU8KRSbstS7Fk/Yb3eo7I=;
 b=mvZiTOpGh4VtKCl3XRWmg20UP3S8YMJhdrsevHmGz5j6q/s3IL45LtLN
 aKvGjqLAuNEnpMx2ZyC8CdIVUSrSbQN2dAEDkx7iIdA7ftOmhNBNuCOTT
 mx1GwDCAuHnzK3scmIpfgw1DkOt4hCGQFyRAxJcIGSHlkcYOXYQ3EDOYp
 MVmmj4sqW3WdQgYjZPqTuJWcQJ59FHks2iNasPhXRvCGdl0iP2tfbQh4z
 ob8kmNgpnQ2QHw6328VNUkKg2ujU2vWREeQGr+Odh3uby85KSKcgL1aum
 3h27WPjgCQaYWGDrXFYLliV5r9mpbvuwu7eh+xSZQnzJpUL5+HzpPRWnw A==;
IronPort-SDR: X1wt0pubV85HQy1oT0l6GnOHxsXbXVuVyVce3ieuYS85rBSXL1aRySwXIBRsP/2TwTEdQ4XXHW
 2WmjTGDNoMONjrQws/m0ChyipVU79BWQd8pgJn8/3LanfDycyN2IzhEbzm82QEl93nRSLSDIus
 5qeBsOYLa5yoXXgUMqi7xPmXj45rZzMuGd/ib13jFOWkNyi1sDxY3YSG0hjbfgknHSKAEMTzT6
 f1DWAwJTYnhvtaZb/dMVq+fZdgYYdF3vxoTfK9JZq17O9okOlr7P9QqjiRiQmaj+pOUhN2Mt5G
 QeM=
X-IronPort-AV: E=Sophos;i="5.76,429,1592841600"; d="scan'208";a="147415384"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 17:16:35 +0800
IronPort-SDR: b2wDHnOdEdGMMi+5t6kvTEarWuy2hYOVvMVSw1P093vWnwF4diFSNdS9LQpaRlFERoVWGF0cjj
 Pt5tfMFfl/4A==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 02:02:50 -0700
IronPort-SDR: 55WNC5HCZm8jTXPW87AgHJ9iNi8LlqN6P+n3kXEenbFRclFfVAty4bV3ootYzJXHee9Y7L6Z8T
 FKvXC2+c3rUQ==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO localhost.hgst.com) ([10.84.70.155])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Sep 2020 02:16:33 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] riscv: Fix compilation warning
Date: Tue, 15 Sep 2020 18:16:31 +0900
Message-Id: <20200915091631.84707-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_051637_942517_B28BE914 
X-CRM114-Status: GOOD (  13.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TW92ZSB0aGUgZGVjbGFyYXRpb24gb2YgcHRfb3BzIHVuZGVyICIjaWZkZWYgaUNPTkZJR19NTVUi
IHRvIGF2b2lkIHRoZQpjb21waWxhdGlvbiB3YXJuaW5nOgoKYXJjaC9yaXNjdi9tbS9pbml0LmM6
NDQ6Mjg6IHdhcm5pbmc6IOKAmHB0X29wc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZApbLVd1bnVz
ZWQtdmFyaWFibGVdCiAgIDQ0IHwgc3RhdGljIHN0cnVjdCBwdF9hbGxvY19vcHMgcHRfb3BzOwog
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fgoKd2l0aCBOTyBNTVUgYnVp
bGRzIChlLmcuIG5vbW11X2syMTBfZGVmY29uZmlnKS4KClNpZ25lZC1vZmYtYnk6IERhbWllbiBM
ZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9tbS9pbml0LmMg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQu
YwppbmRleCAzMmU3MjU4ZGE5YmIuLmM4ODhjNDQ3MGIzNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9tbS9pbml0LmMKKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKQEAgLTQxLDggKzQxLDYgQEAg
c3RydWN0IHB0X2FsbG9jX29wcyB7CiAjZW5kaWYKIH07CiAKLXN0YXRpYyBzdHJ1Y3QgcHRfYWxs
b2Nfb3BzIHB0X29wczsKLQogc3RhdGljIHZvaWQgX19pbml0IHpvbmVfc2l6ZXNfaW5pdCh2b2lk
KQogewogCXVuc2lnbmVkIGxvbmcgbWF4X3pvbmVfcGZuc1tNQVhfTlJfWk9ORVNdID0geyAwLCB9
OwpAQCAtMjE0LDYgKzIxMiw4IEBAIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9pZCkKIH0K
IAogI2lmZGVmIENPTkZJR19NTVUKK3N0YXRpYyBzdHJ1Y3QgcHRfYWxsb2Nfb3BzIHB0X29wczsK
KwogdW5zaWduZWQgbG9uZyB2YV9wYV9vZmZzZXQ7CiBFWFBPUlRfU1lNQk9MKHZhX3BhX29mZnNl
dCk7CiB1bnNpZ25lZCBsb25nIHBmbl9iYXNlOwotLSAKMi4yNi4yCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
