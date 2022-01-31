Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554BEC43217
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 11:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/0yPzT3Q09oV3z+cAIX1MCY2yT128+TLqvfOlG4qTas=; b=M4gviohevS95V3
	Ui30rpxCjYWz7lGXukOzAOZszu450Z7w0xcA0IHMuVX5dr5w/RBjmjp1KlZvcs8qZPl//V8+tEjMQ
	UROFobylY2j7qg+57mGwpZioqsInezZk4rtmJt2XrvZddD1/psG2flLg6PKHRQI/aNjwmw0eO4fzJ
	GICVdDBQoAG8OPx4PqAIkBCbrwLP3xszpUkZKwayfPmz/2r8ed12DSNgBKU+4UmxXyBEywGpmFyN6
	Hx4LWVzyzA/e8Xj381I8OIRBGhyQ+CebjVLZbYmkb3FQx21iGmsxnxsVxY1xIleKZhIA+0qVJfTIi
	lrxKgBhDNDRLVlE1yBcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEUT4-0090tw-49; Mon, 31 Jan 2022 11:03:30 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEUT0-0090q6-49
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 11:03:27 +0000
Received: by mail-ej1-x633.google.com with SMTP id a8so41721743ejc.8
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 03:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sK8JR4wpkvls27MNU4s8AnmC/+c6q6h3rMPNEZP9Prw=;
 b=kV2WIOTc9oeQLWaV5sGXLC5+V2MEcy/nFB1aBE7UYHZknUJxEqn2H0ruaImw1LSudd
 YBNzrjQWd/WX2Hwg40tGHGWkbqDBoouxh0A/Ayeb9CepJhcdoHJDOuEDKwUofDr3YDeM
 hypgPlPu6mQinAPkGCyMdCsKQFU1fjATndvTJhEYqTY98McJfIDfjY9+HkzOqsVitBdG
 Xqq2dS+6YDzqE1kx/SWP4oOd8ZWxeaWizxmD8bzbtJrPZjZL0RU+y2OTYfMbjmhvmp3z
 8k476frHL7MmRK5tcQZCY+9vUWimfJMI8mN1upj5vNfqM0LhYOiHXz53dPIBVr83Q+i+
 5dZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sK8JR4wpkvls27MNU4s8AnmC/+c6q6h3rMPNEZP9Prw=;
 b=BZbRvucAPyZk91ClPyGpZEqpmFJ8pAbd5NvBX/8iAcX5lNGKWwTQqfTP6Q/aTy7z5X
 hecKw1ub6dq9ecvU83lN5/W7+IIVboTtH5q5zwQpirYam3CVcpIbCVeApp8ZwQ+UiVo4
 1cNKDShQHdS8ZwvBOTQIBh1wyzm0rIeVPqA8shPDUJa78tIR/xkz04J0lf/7JXdoJKE1
 UpX7ZAMLFJfUw2SaPsJddTVY0/fVHHT5kf+XiGzDhusxrLvUcYcSunZFX+SttWfYQbcz
 VG+qPRz7qtnJxdLozxNmPColRBzM9gYbfFxgWQ+MKg4L1MvtaMxoU64h9kJULV9HAlPE
 iXcA==
X-Gm-Message-State: AOAM530UFG3MhQi574+EFyc6cJsyDBrYNwZMghCq7uprY7WNgkBlj6it
 wqYpcMMEyAxEn6GJmxfwW1eXyA==
X-Google-Smtp-Source: ABdhPJwJd++NGD5qapxySFts1jFknGVNB3DUXPDIe+XtkytAhXK38pCvvhgrbKuKdHAxqBOBaLUB0w==
X-Received: by 2002:a17:907:1b0f:: with SMTP id
 mp15mr16717542ejc.493.1643627003918; 
 Mon, 31 Jan 2022 03:03:23 -0800 (PST)
Received: from platform-PowerEdge-T440.dc1.ventanamicro.com ([117.248.109.221])
 by smtp.gmail.com with ESMTPSA id b7sm14338971edv.58.2022.01.31.03.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 03:03:23 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: anup@brainfault.org
Cc: atishp@atishpatra.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH] RISC-V: KVM: make CY, TM,
 and IR counters accessible in VU mode
Date: Mon, 31 Jan 2022 16:33:07 +0530
Message-Id: <20220131110307.1684739-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_030326_197801_59440086 
X-CRM114-Status: UNSURE (   8.94  )
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

VGhvc2UgYXBwbGljYXRpb25zIHRoYXQgcnVuIGluIFZVIG1vZGUgYW5kIGFjY2VzcyB0aGUgdGlt
ZSBDU1IgY2F1c2UKYSB2aXJ0dWFsIGluc3RydWN0aW9uIHRyYXAgYXMgR3Vlc3Qga2VybmVsIGN1
cnJlbnRseSBkb2VzIG5vdAppbml0aWFsaXplIHRoZSBzY291bnRlcmVuIENTUi4KwqAKVG8gZml4
IHRoaXMsIHdlIHNob3VsZCBtYWtlIENZLCBUTSwgYW5kIElSIGNvdW50ZXJzIGFjY2Vzc2liaWxl
CmJ5IGRlZmF1bHQgaW4gVlUgbW9kZSAoc2ltaWxhciB0byBPcGVuU0JJKS4KCkZpeGVzOiBhMzNj
NzJmYWYyZDczICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBWQ1BVIGNyZWF0ZSwgaW5pdCBhbmQK
ZGVzdHJveSBmdW5jdGlvbnMiKQpDYzpzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYt
Ynk6IE1heXVyZXNoIENoaXRhbGUgPG1jaGl0YWxlQHZlbnRhbmFtaWNyby5jb20+Ci0tLQogYXJj
aC9yaXNjdi9rdm0vdmNwdS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdS5jCmluZGV4IDBjNTIzOWUwNTcyMS4uY2FhZjgyNDM0N2I5IDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1LmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCkBAIC05MCw2ICs5
MCw3IEBAIGludCBrdm1fYXJjaF92Y3B1X3ByZWNyZWF0ZShzdHJ1Y3Qga3ZtICprdm0sIHVuc2ln
bmVkIGludCBpZCkKIGludCBrdm1fYXJjaF92Y3B1X2NyZWF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUpCiB7CiAJc3RydWN0IGt2bV9jcHVfY29udGV4dCAqY250eDsKKwlzdHJ1Y3Qga3ZtX3ZjcHVf
Y3NyICpyZXNldF9jc3IgPSAmdmNwdS0+YXJjaC5ndWVzdF9yZXNldF9jc3I7CiAKIAkvKiBNYXJr
IHRoaXMgVkNQVSBuZXZlciByYW4gKi8KIAl2Y3B1LT5hcmNoLnJhbl9hdGxlYXN0X29uY2UgPSBm
YWxzZTsKQEAgLTEwNiw2ICsxMDcsOSBAQCBpbnQga3ZtX2FyY2hfdmNwdV9jcmVhdGUoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KQogCWNudHgtPmhzdGF0dXMgfD0gSFNUQVRVU19TUFZQOwogCWNudHgt
PmhzdGF0dXMgfD0gSFNUQVRVU19TUFY7CiAKKwkvKiBCeSBkZWZhdWx0LCBtYWtlIENZLCBUTSwg
YW5kIElSIGNvdW50ZXJzIGFjY2Vzc2libGUgaW4gVlUgbW9kZSAqLworCXJlc2V0X2Nzci0+c2Nv
dW50ZXJlbj0weDc7CisKIAkvKiBTZXR1cCBWQ1BVIHRpbWVyICovCiAJa3ZtX3Jpc2N2X3ZjcHVf
dGltZXJfaW5pdCh2Y3B1KTsKIAotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
