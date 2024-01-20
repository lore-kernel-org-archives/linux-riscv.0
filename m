Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B222EC47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 06:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cGHefARTOznrfKuT3F2GeOfVnFev7qMP6XhoA+hal0Y=; b=vBm4jKwH6L7CVi
	bNpRrJz9WWqmizSfLb7ShMwHfYpoI1xPc7RwWg2DHF2SgsXqHSpGRZUKQY8gTX/vL5HTTuN+20n5L
	L5IhDgP68KUcM3FkWvk/6K7qu1Eed0cTwgqP6KU103qQURpYAc+rJFrAAIi9ATAXPH88Enbq+AyRS
	onYTl7ClUtOi6mqlhUaK63/uJp7UKo61XsiQ2xxyBtnEAc1Lb1RCkoGUrbHFN61AZ6f456vurkViS
	TWpL9mXFT7ow1/K4LcE2xf0u1VSTBPNq7BuCVVMfChwOvAKaCWOLnp9MW8Pi9BeNWyv3aLgnd/vRn
	fMVZxQL7e4ysL6xarkFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rR4VO-007IHR-1C;
	Sat, 20 Jan 2024 06:06:58 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rR4VE-007IGy-1K
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 06:06:53 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5957ede4deaso891123eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 22:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705730746; x=1706335546; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5GhrPmUqNjhEKloGKJrNJQ6aV7Aj5DyE10VHkvtmOrs=;
        b=aWvKqu/be4cyoTiWjhN9P8d9Uzty6FRvb2FDTBPbKkg9yD+RCOz5B4dkPBitOaDJAy
         j3/mvAs4uwsKqFRykHoj+8w19gME86qQa+/bGn0k4dAxFGkW6zsxa3GXBvQozp9AIF2g
         qIJYal3NFNyLmY4CatVKHyAM05W7uD8mJv8CV/gx0hjO8EB8nrii5OiS8SGPYCRQo08t
         9Xg3NN4Kq+wx3rbJ2KynxvQF1dNOjcbp6WHwzIN1zA34+2lYNnVwIFn1cq3/rgiU2pIs
         dZE/meBtde9h2Sdzzfs9F5Nof7M3pDBWf877X+bm09Iz+O7f+UF3IjfLaYECUQk0R8Sv
         qRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705730746; x=1706335546;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GhrPmUqNjhEKloGKJrNJQ6aV7Aj5DyE10VHkvtmOrs=;
        b=UQbCjaYuiHscguxSlVr+Uj3dh9ud5wvHS7F45iCweFheLt8BlT3g2k/c6K7g3CU/OL
         xekRcTkEWaCboayytSED6567PWEeRcOnlYNZ0rsNAwDH0XRbU4P9Ombdd4s5so9njz9V
         JIuZeI3/1HAudQ/tysQBATReZm61PB8ksqT8ojpiDB7BedmXFbqviWrMLV6mQ2wZy+Az
         yIzUawgAuTwH//jlA7PKHZzEyhim1/CQv4jACnLuzuehLBMNYxROAexAC0nRVpFqlRjX
         jHKhPSmOLWXYRlDUVoJXnVGqPFs17vlj7DEBVSPebLav15Qw1V1jbfcRV3j7Qq5X7mu8
         CVPg==
X-Gm-Message-State: AOJu0Ywt/wlOtO1uahNaHdS3Rq1sjWoh/NYkiLWgKhRQz+bZLeBlg4a7
	X8NMZePM9W3+/A5vpgA4pO78Id/Gb94pPxSHKYcNIv4tAkCTzsQmazu4SkMzrH4=
X-Google-Smtp-Source: AGHT+IFstt02R5h9azI4fZ+YSk2ofRHpWnsb8UqjujvxAU7z6tvc+KaYeSTI5llhYGZMs4rAPvWT7Q==
X-Received: by 2002:a05:6808:3992:b0:3bd:93e7:b61b with SMTP id gq18-20020a056808399200b003bd93e7b61bmr1802345oib.42.1705730746580;
        Fri, 19 Jan 2024 22:05:46 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l21-20020a170903005500b001d72beb3a90sm598499pla.250.2024.01.19.22.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 22:05:46 -0800 (PST)
Message-ID: <65ab62ba.170a0220.2aa6c.1e77@mx.google.com>
Date: Fri, 19 Jan 2024 22:05:46 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.8-mw3
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (riscv-for-linus-6.8-mw3)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_220649_478800_039D76E9 
X-CRM114-Status: UNSURE (   1.65  )
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

cmlzY3YvZm9yLW5leHQgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQgKHJpc2N2
LWZvci1saW51cy02LjgtbXczKQoKRnVsbCBCdWlsZCBTdW1tYXJ5OiBodHRwczovL2tlcm5lbGNp
Lm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVsL3Jpc2N2LWZvci1saW51cy02
LjgtbXczLwoKVHJlZTogcmlzY3YKQnJhbmNoOiBmb3ItbmV4dApHaXQgRGVzY3JpYmU6IHJpc2N2
LWZvci1saW51cy02LjgtbXczCkdpdCBDb21taXQ6IDRiNjBhMjNjM2NiNWE5NzQ5MzkzNzJjOTQ2
MGJhYzY5ZjdmYmY2NDIKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1
cmUKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxk
IHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBnY2Mt
MTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQg
UEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgY2xhbmctMTYp
IOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZytDT05GSUdfU01QPW4gKHJpc2N2LCBnY2Mt
MTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgY2xh
bmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNo
ZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwg
Z2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRj
aGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcg
KHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9u
IG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2Rl
ZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3Ms
IDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8aW5mb0Br
ZXJuZWxjaS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
