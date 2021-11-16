Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCB4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 23:58:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5A5C613A7
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 23:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5A5C613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPrHWmF/7NCS7hpaExYpNSipnz2t/qlhmTlvjID1Ico=; b=X/gPo6D6wymyyV
	r+zUacGCm+yZLm+g+tlC6KRDXIg4kzbrybu2zskqc4PRTmN3NRcpAhYoOSChdOktmK5KWd0Kl5Fs2
	5pPwaQ5O/W9ia8cFWY323z46t6Z4uY92VM2fYNP5OpR5ZLSJ7C/5dD7BrZtctyDpZsuBrxdb/MBIE
	MjI5057Z+w6Hq3zoKRSf90t+H57kZpfY6ibpCmKzHjJ0X/l2zPggFfUEvdS7JY7sYz+/2MNn6PCpj
	Vy3vadL1qon99jDm/x3Fz5Pdkn7JbwKX4i/kEMhb0EIRvSstBtUafZcU79X5pT69eWN6qpO8jVLoE
	QfHMJNYMymgtN+44C+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn8Ko-003005-MC; Tue, 16 Nov 2021 23:57:54 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn8Ki-002zwA-3H
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 23:57:50 +0000
Received: by mail-pf1-x435.google.com with SMTP id 8so911033pfo.4
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 15:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/zwzMgCKlV1Dn38wdj12JN6kln/RrqctqE2A6Lwr2FE=;
 b=ZysnW7EWtqkGYnKDLftVi2BN9z+BXclDtaC6OcEZIR4ipTPYCiZGxz+vs51ytOMJGS
 y5ynfxXnj+NoVKKvo0FFFFdzKLaplwCO9xdVEIdNy5XZax/Lc8Wr7o4DgKP4KKFB30qf
 wpo9HXc5jKrgxDmjpEKrWdnHrP0tRemck3qBerV62EgmhGgKBL1x2wob5gNGLvpvFf3b
 s66Et6kiY+/grIJ6nrxVNZnAtbU5MDuNfKeOOj7qfjnEJhm15tzwT3W0U8QBgzKq63Nj
 bFB64EslnTFrN+5NP4c4bsMrD/xooYnLed9juV1G2w5d9EI+RmjtGcX+rclX7tvD30dT
 GoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/zwzMgCKlV1Dn38wdj12JN6kln/RrqctqE2A6Lwr2FE=;
 b=fo25vQKHapAYYThiTStIr1R/nM4CLIqAntL/s/DRMw/FPRTOvEzZcoc/zp7WMdVtqP
 J4isdZbonzd9UAo1eUWxVMeQzrR3rfd2zIFYQ6W5QsjObGpzY8E3oq/U5iGfIWUTUYVu
 47HWfMYQQn5eogIx7Utgo/cWvcBBWwW8pMO1LDD487nCqrvnDx1/9eneDfDzoq7DsaMW
 WBtp8dmT+BhyfzbxmmLudDMcUX+POLVSO/d5uHZobMQ1eNMvzokl9Bj0wC1Pv/WZS3i1
 agGKVKb96lfu4/k8Fh1UHwoSdr1wS3+kLZ4uJU4sJkZGLMrSAm3JhHFb24ktJ6/aZk7B
 F8kw==
X-Gm-Message-State: AOAM5303mVkpNg4yk9eWrmgy4CRSWRITay+6o6Ybw1oD0MZgSlwFgPzi
 LlNDtVwzdlY964fo7ur8X40=
X-Google-Smtp-Source: ABdhPJwMuieDf+DAk+m7r28QGKlTvTljYzr9P1nwGXj+b6V4bkxiqN/+dz+stexAM8vKUuyqc43iMA==
X-Received: by 2002:a63:5257:: with SMTP id s23mr2112128pgl.473.1637107067577; 
 Tue, 16 Nov 2021 15:57:47 -0800 (PST)
Received: from localhost.lan (p4899162-ipngn25301marunouchi.tokyo.ocn.ne.jp.
 [122.18.9.162])
 by smtp.gmail.com with ESMTPSA id il13sm3458697pjb.52.2021.11.16.15.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 15:57:46 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id BCE9A900958;
 Tue, 16 Nov 2021 23:57:44 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH v2 4/6] riscv: dts: sifive unmatched: Expose the FU740 core
 supply regulator
Date: Tue, 16 Nov 2021 23:57:40 +0000
Message-Id: <f0a1ddd78f1a50a10d3cf36a18c7afcc4dfd1d41.1637107062.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
References: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_155748_178602_EFA07949 
X-CRM114-Status: GOOD (  10.11  )
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

UHJvdmlkZXMgbW9uaXRvcmluZyBvZiBjb3JlIHZvbHRhZ2UgYW5kIGN1cnJlbnQ6CnRwczU0NGIy
MC1pMmMtMC0xZQpBZGFwdGVyOiBpMmMtb2NvcmVzCnZvdXQxOiAgICAgICA5MDYuMDAgbVYKdGVt
cDE6ICAgICAgICAtNDAuMMKwQyAgKGhpZ2ggPSArMTI1LjDCsEMsIGNyaXQgPSArMTUwLjDCsEMp
CmlvdXQxOiAgICAgICAgIDUuMDYgQSAgKG1heCA9ICsyMC4wMCBBLCBjcml0IG1heCA9ICsyNi4w
MCBBKQoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBQZWxsZXRpZXIgPHBsci52aW5jZW50QGdtYWls
LmNvbT4KCi0tCk5vdGU6IGNoZWNrcGF0Y2gucGwgY29tcGxhaW5zIGFib3V0IHVuZG9jdW1lbnRl
ZCBkZXZpY2V0cmVlIGJpbmRpbmcsCndoaWNoIGlzIGZpeGVkIGJ5OgogIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWRldmljZXRyZWUvMjAyMTExMTYxMTAyMDcuNjg0OTQtMS1rcnp5c3p0
b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20vVC8jdQoKQ2hhbmdlcyBzaW5jZSB2MToKLSBBZGRl
ZCBtaXNzaW5nICJ0aSwiIHByZWZpeCBpbiBjb21wYXRpYmxlIHN0cmluZy4KLSBSZW1vdmUgdHJh
aWxpbmcgIi4iIG9uIHN1YmplY3QgbGluZS4KLSBSZW5hbWUgdHJlZSBub2RlLgotLS0KIGFyY2gv
cmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cyB8IDUgKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMgYi9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMKaW5kZXggMjcwMzYwYjI1OGI3
Li42ZTc3NzVmZGFlMzIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hp
Zml2ZS11bm1hdGNoZWQtYTAwLmR0cworKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9o
aWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMKQEAgLTUxLDYgKzUxLDExIEBAICZ1YXJ0MSB7CiAmaTJj
MCB7CiAJc3RhdHVzID0gIm9rYXkiOwogCisJcmVndWxhdG9yQDFlIHsKKwkJY29tcGF0aWJsZSA9
ICJ0aSx0cHM1NDRiMjAiOworCQlyZWcgPSA8MHgxZT47CisJfTsKKwogCXRlbXBlcmF0dXJlLXNl
bnNvckA0YyB7CiAJCWNvbXBhdGlibGUgPSAidGksdG1wNDUxIjsKIAkJcmVnID0gPDB4NGM+Owot
LSAKMi4zMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
