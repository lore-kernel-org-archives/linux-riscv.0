Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D54C5519F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 08:27:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE6D024655
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 08:27:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yuKLSnux";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APkdHfk/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE6D024655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KuHDgxH9LVbWu4uxAATirK8FK2O3c3kp2gfzZZk8kxM=; b=yuKLSnux8eRzn4v5TAoE2G5eaa
	twEhIX+VJpS7KZrhHxGr8ky4IaSt79PMltel4P9TA3pkivJdJN0kwNMl4dxiw3Dwq2jP9B43uTfDu
	iyMGUg39BVRyJaia0S2W8+vkboUgs7KVvbhGy2iPYcUrDnd24UaKLnn2QfK2vAkLzheXPdX43E61C
	SwA9gWWv1+n7AKlNnoVCE1GCXbnhBQ5QuW7N0si0h1mrs+vkegj8xBUl3Vmi7NlQ10fVxByuvRExn
	E7U+tqk3rkouit1Il5EdvuY37EUrzMG9I/jFEnFQioDOzH9WPwUNWC+Msa20K5MUSD2iV6iXjJOcq
	FYXz8sFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kewKK-0008T0-Ot; Tue, 17 Nov 2020 08:27:00 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kewKI-0008SZ-Ja
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 08:26:59 +0000
Received: by mail-pf1-x430.google.com with SMTP id 10so16839096pfp.5
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 00:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lWxaqBdhoJLWHCbKsjLTbdE3l/2x2uYyyZVuBw0tu10=;
 b=APkdHfk/ecF1LsBLszpAlRHHUwF7IvXnqcnbxW7hhhJ8MKPNjYd61AHClU+GAS9Qt4
 R9hODm2CQko74tD9/grElbeGbTMah1o+R59Qs+iATBj77obw3bLj3/ob91je2Z43dVAk
 RIwTgxt8VleMTe1AOusML/W2EbHSFdrV5OU3XTiwk/S7WiwiTo/+XOq0zTgBzqJ/A7P0
 P8m/DFXGmsex+YBDdjhBAnpV+9b88KMpqpFCgQQr6/U2tAHPIpSKsJG51YQfgioItgP/
 j3H74wtl4arDpK+MSakCpCbGRSGNHd31fnKy1LGcZ5+KMPsZfklQFgEYpjFEmm7m8mXJ
 ikTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lWxaqBdhoJLWHCbKsjLTbdE3l/2x2uYyyZVuBw0tu10=;
 b=YPSssmOxJEHKL7YSNL7xx98i74RhuLbgDXcYqLJ/xll5CcLPc60WROkm2xlt8EBDP9
 qAisSLJLGamhJvtyujWVd+vLrPSZgKNo9T0/kMzhU6cIINJZectv5KwGAFQiww7B7nB2
 oa4e7WC7PtRNOqDo8jXhsdqgn90d40lOGYjChxY7I8fFCfTniU2fnFDlhJgISNThy/4k
 1wEiWw5a+0XAyUCNXUBfXy5lZJY7XynxWMsUH9xgdj5lInKwlT5kpk9k+GYnftzzs8V9
 aAM41iTGhSxVWd3vLvNM5DUrxu+CHM5JXqJdKLBQfZsyYWQHFMKtlrEVzNKl8OanHXqK
 fgKQ==
X-Gm-Message-State: AOAM531e54V00ITYHQjAYsMX/ZXC/JAh7BJgFU3WPtdTk4D2NxWJdjcZ
 CrGoPViwxBqAgBqMajdUBYc=
X-Google-Smtp-Source: ABdhPJw/20J9aJnynQ18oyYmbo4w4o3XFMN3krvy2E2soJiudn0nqgqvnqu0j1/LsbLxThkGz/UZ/A==
X-Received: by 2002:a63:4c24:: with SMTP id z36mr2569977pga.432.1605601614730; 
 Tue, 17 Nov 2020 00:26:54 -0800 (PST)
Received: from btopel-mobl.ger.intel.com ([192.55.54.40])
 by smtp.gmail.com with ESMTPSA id c12sm2251671pjs.8.2020.11.17.00.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 00:26:53 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Subject: [PATCH bpf-next 0/3] RISC-V selftest/bpf fixes
Date: Tue, 17 Nov 2020 09:26:35 +0100
Message-Id: <20201117082638.43675-1-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_032658_693836_334FABA1 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-riscv@lists.infradead.org, xi.wang@gmail.com, luke.r.nels@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXJpZXMgY29udGFpbiBzb21lIGZpeGVzIGZvciBzZWxmdGVzdHMvYnBmIHdoZW4gYnVp
bGRpbmcvcnVubmluZwpvbiBhIFJJU0MtViBob3N0LiBEZXRhaWxzIGNhbiBiZSBmb3VuZCBpbiBl
YWNoIGluZGl2aWR1YWwgY29tbWl0LgoKCkNoZWVycywKQmrDtnJuCgpCasO2cm4gVMO2cGVsICgz
KToKICBzZWxmdGVzdHMvYnBmOiBGaXggYnJva2VuIHJpc2N2IGJ1aWxkCiAgc2VsZnRlc3RzL2Jw
ZjogQXZvaWQgcnVubmluZyB1bnByaXZpbGVnZWQgdGVzdHMgd2l0aCBhbGlnbm1lbnQKICAgIHJl
cXVpcmVtZW50cwogIHNlbGZ0ZXN0cy9icGY6IE1hcmsgdGVzdHMgdGhhdCByZXF1aXJlIHVuYWxp
Z25lZCBtZW1vcnkgYWNjZXNzCgogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxl
ICAgICAgICAgIHwgIDMgKy0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X3Zlcmlm
aWVyLmMgICB8IDEyICsrKy0tCiAuLi4vc2VsZnRlc3RzL2JwZi92ZXJpZmllci9jdHhfc2tfbG9v
a3VwLmMgICAgfCAgNyArKysKIC4uLi9icGYvdmVyaWZpZXIvZGlyZWN0X3ZhbHVlX2FjY2Vzcy5j
ICAgICAgICB8ICAzICsrCiAuLi4vdGVzdGluZy9zZWxmdGVzdHMvYnBmL3ZlcmlmaWVyL21hcF9w
dHIuYyAgfCAgMSArCiAuLi4vc2VsZnRlc3RzL2JwZi92ZXJpZmllci9yYXdfdHBfd3JpdGFibGUu
YyAgfCAgMSArCiAuLi4vc2VsZnRlc3RzL2JwZi92ZXJpZmllci9yZWZfdHJhY2tpbmcuYyAgICAg
fCAgNCArKwogLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi92ZXJpZmllci9yZWdhbGxvYy5jIHwg
IDggKysrKwogLi4uL3NlbGZ0ZXN0cy9icGYvdmVyaWZpZXIvd2lkZV9hY2Nlc3MuYyAgICAgIHwg
NDYgKysrKysrKysrKystLS0tLS0tLQogOSBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCsp
LCAyMiBkZWxldGlvbnMoLSkKCi0tIAoyLjI3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
