Return-Path: <SRS0=tJfH=PN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0483C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  5 Jan 2019 13:51:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 752D3206A3
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  5 Jan 2019 13:51:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lwg78HIY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQ9vZW2J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 752D3206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9M9/KbzXrUKz/i8+LXM4ypIZSfvKPQmpfOwCsyBHsbo=; b=Lwg78HIYTSYH27
	tSlAUiQfSW2rZ/Ys6Dr3jgLRmrD62xkIqLZJeLH5qK3W3OCQyOpx8xyyKulKiLd5N0rUoLIkU+4Z8
	qFzawX0g+yYZhYCNDpPLdz06p02dgnmz3lVXovcif+DyHLYSMFnNISPcyzje2qj2BNVWGLflnCrMf
	7qSgT1aOJuKn1swmn7YKtG3Jrei83mMz1IbGDr0rax6+NX9g4Vsmixj2m4Chqbr4mtaMyxmitd15H
	WKQ0C2ZmxZoDExJqWPIod+QxwJ9p4qtC6kPBrThrLIvll9UMZw5OHXjRzWfpDBOOn/G9U6nn5bW32
	4SWjsMoiYKTponZtfOiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfmMM-0008Gi-Jl; Sat, 05 Jan 2019 13:51:30 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfmMJ-0008GK-Cn
 for linux-riscv@lists.infradead.org; Sat, 05 Jan 2019 13:51:28 +0000
Received: by mail-pf1-x443.google.com with SMTP id b7so19628102pfi.8
 for <linux-riscv@lists.infradead.org>; Sat, 05 Jan 2019 05:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8dVLekkVOf2ByX/vpYMz+8O/3o4U+A+CblvU7QOBdpQ=;
 b=OQ9vZW2JyXRy7DXWNEAH3mD9Zomoeh0+0FhHVkd+gS5JfucRarJEc4vLSmUtajGjlP
 LTs/L7LDp0WnjtnQmGQPg8fx08DuWGfpxjZF+qBCahgiCg185FguO+OjQ/wR3fdSMsLy
 +KwXWgGK2w4rF6MngsUd1RubLX9KwRkKtNSsPfk+X7ujYDZnEAfPOff15szx0t3VT7ut
 8bs3u9xz6SAdKYMbJyi/XRt7qKXQcQcYYgvDfMN8nnunj/7I//MkDZddo7qUDI+Iks6N
 BUOOD4acpRGYBCvmYoU7mzQzEuHwmBSZIg4CJhkGJXdT/TM79wlTiKh57wAmu4SusyYk
 OCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8dVLekkVOf2ByX/vpYMz+8O/3o4U+A+CblvU7QOBdpQ=;
 b=kFaUH5H29oFQGMVyBkOtWPejFHq133FF/Yk9wPCAwwOwJ8B8814PEg1LZwxGJOntKO
 ju3Wmp6an8KsWfBsZ0oKM1bBLkH/jCF0nIgd9NRQYOMaVGXozga0WWWhO8mfvsS7e3pl
 W+X58qB8vnJL+EdGqnV9n86ZsTlq3pMRKpDivVrGshOp+2+6eJ91/WKY3XGJn7lhzEel
 0MlpS4NWXYf54SHqiZ8lXX3bKGCKq05bWntKm26m8C0i2pC1LZ+ZBWdSAIUT4LGBrtz1
 AZHzVYXycXkxH/3HrpmLR7IxLO4sKteMI5ioIOIw6bdPS71NDoFQGcr34wuPERS5J30e
 0seA==
X-Gm-Message-State: AJcUukcVp7KKDCjwKvhbgBu+bQGEsglbY/2Gbd5vgljooDOh5uKfrBzJ
 u0dJQqGH1sX22qLY85W5eCUnF/n/
X-Google-Smtp-Source: ALg8bN6R28VkF1QcYAjn6RLGWuRIEg0mDIhQ8ZG9AA64AkKF+drDK2H+IFyahaVEns0bbkqKmuZy5Q==
X-Received: by 2002:a63:e5c:: with SMTP id 28mr4555403pgo.369.1546696285982;
 Sat, 05 Jan 2019 05:51:25 -0800 (PST)
Received: from localhost.localdomain ([49.207.51.61])
 by smtp.gmail.com with ESMTPSA id j21sm87048257pfn.175.2019.01.05.05.51.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 05 Jan 2019 05:51:25 -0800 (PST)
From: G SatishKumar <gsatish.ldd@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISCV:IRQ: Adds Err column to /proc/interrupts
Date: Sat,  5 Jan 2019 19:21:12 +0530
Message-Id: <1546696272-19152-1-git-send-email-gsatish.ldd@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190105_055127_468644_38368D4B 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: G SatishKumar <gsatish.ldd@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

CVRoaXMgcGF0Y2ggYWRkcyBleHRyYSByb3cgc2hvd2luZyBlcnJvciBjb3VudCB0byBvdXRwdXQg
b2YKCS9wcm9jL2ludGVycnVwdHMgdXNpbmcgc2VxX3ByaW50ZigpLgoKCXNlcV9wcmludGYoKSBB
UEkgaXMgdXNlZCB3aGVuIHByaW50aW5nIHRvIC9wcm9jLyBmaWxlcyBhcyBhCgloZWxwZXIgZnVu
Y3Rpb25zIHRvIHJldHVybiBmb3JtYXR0ZWQgb3V0cHV0IGZyb20g4oCYcHJvY19yZWFk4oCZCglj
YWxsYmFjay4KCglJdCBhZGRzIEVycjogcm93IHRvIC9wcm9jL2ludGVycnVwdHMKCglyb290QChu
b25lKTp+IyBjYXQgL3Byb2MvaW50ZXJydXB0cwoJICAgICAgICAgICBDUFUwCgkgODogICAgICAg
IDM1NiAgU2lGaXZlIFBMSUMgICA4ICB2aXJ0aW8wCgkxMDogICAgICAgMTcxNyAgU2lGaXZlIFBM
SUMgIDEwICB0dHlTMAoJSVBJMDogICAgICAgICAwICBSZXNjaGVkdWxpbmcgaW50ZXJydXB0cwoJ
SVBJMTogICAgICAgICAwICBGdW5jdGlvbiBjYWxsIGludGVycnVwdHMKCUVycjogICAgICAgICAg
MAoKU2lnbmVkLW9mZi1ieTogRyBTYXRpc2hLdW1hciA8Z3NhdGlzaC5sZGRAZ21haWwuY29tPgot
LS0KIGFyY2gvcmlzY3Yva2VybmVsL2lycS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9pcnEuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL2lycS5jCmluZGV4IDFkNzZiNjAuLjUwOWM5NmIgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2lycS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2lycS5jCkBAIC0y
NCw5ICsyNCwxMiBAQAogICovCiAjZGVmaW5lIElOVEVSUlVQVF9DQVVTRV9GTEFHCSgxVUwgPDwg
KF9fcmlzY3ZfeGxlbiAtIDEpKQogCit1bnNpZ25lZCBsb25nIGlycV9lcnJfY291bnQ7CisKIGlu
dCBhcmNoX3Nob3dfaW50ZXJydXB0cyhzdHJ1Y3Qgc2VxX2ZpbGUgKnAsIGludCBwcmVjKQogewog
CXNob3dfaXBpX3N0YXRzKHAsIHByZWMpOworCXNlcV9wcmludGYocCwgIiUqczogJTEwbHVcbiIs
IHByZWMsICJFcnIiLCBpcnFfZXJyX2NvdW50KTsKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi43LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
