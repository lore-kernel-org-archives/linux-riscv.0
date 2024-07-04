Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BD0C3271F
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 18:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pV9b0Eul2JaOsIa0o8coPzwWmoVsW56OJt6ShZpyTYI=; b=iErKcXCOe5i+NW
	y9SIfphu/sXkOAEYo6OznFqrBk4Lz3AOcPfghj+mgKablcYa9w5dlwos9WmDqqnla+W3kPOReTwGd
	eEm7CwPb0jsAUrK0lu/Q9zog2XejG/JdbUNXdiwYCOaxRrzqg9ZdqCfJ6Sm+pIu5hKjSlfQikv1XR
	+X37YJySWK6TbQyYiWn7uf4fO3bb7aa/75ScG+GWvGkbZ9CPPzDrY9ZwaU987lbQ917j7xfgFh/vg
	SqhnJynaezon9j62Rbfax5VH/M1gUyfGsd2JAxm3IOJqHbfjganwIYkcgUHCDYaVS8VG6Lp0HG5fr
	yI5TvlaW5LPYAo5ox6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPRAA-0000000E8sG-1i1L;
	Thu, 04 Jul 2024 18:26:34 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPRA7-0000000E8rq-2Qmn
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 18:26:33 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so497753a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2024 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1720117590; x=1720722390; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wGnguu9D1to+hkWzEqASXJj71Kp32uPczCKcWpb8tjY=;
        b=SswGRy2PLBxqLLC3Qyx6LYaMj+rZwR1Kpny5DgEOLCbj0dSTZXMM6vapUBdfK8fUpY
         vMoH7UpPY5c5y14TCy3vXkF5qmIketdLqiSqpeaP0H/cRgoWZ85FlvD5nHr6FrRiKIbX
         wVTIqBvKJuj8aFDQj8OjjpT9X92yhtm5dtOW2NM7M97evbVU8DQ+dezZe2Ta/8j7DxjX
         hwt1nt5fGjvab0vLzyNKvImjXuTVVNCOm2NO+oRZaJuGNuue2b7JK8KYLEzZIpCO8WBk
         8pwDB1DL7uiIeKby0G2JUqkAf829bokZrH+zOS/odpT/96lBn4A+0lAYsDdatMQ1yd6C
         WooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720117590; x=1720722390;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGnguu9D1to+hkWzEqASXJj71Kp32uPczCKcWpb8tjY=;
        b=KDa27IboVzaPxssstSKZZnrWt6ggmvGF4Aad4iUMIiIOSPsq7ieR0QGwoz5cx3lGAY
         VdaoEgip0Lil459PKku+ZjYBPwiRx4i6Y4fTWiTf5eXuPzkbIa50rYsRi6psI+QYugTx
         /1HfFYtt3geEzeMnJwJG5/4eR/5LHiTitDPdQYjytJD2wNG1KNRbeAl2mNCD5IwEArvg
         z5ZvXpplCdt7VzvdLd5m+Eh97mCrR8n3yXkp3eZyHRCvX9FkkUup8dwUW/exsU6lC/MG
         nmvb3qJCp9O8/wHL9xgIBn/qILH8YQbdAQJg6oW6oWGCSARC9bwHwYvpZvGtJVe+balX
         941g==
X-Forwarded-Encrypted: i=1; AJvYcCW+3lU+EQAM9v2rMeWjFrmQJ/3hvvawDu8WdmLSFYh3BSjKpkPlW8tbxj+IcVLVMMyqnd9wPZ6Ns0Y/ahA708X8C/2W+aHJSkaBBgvAjRHJ
X-Gm-Message-State: AOJu0YwAD8D7cQy8/E44vzNhbF0T/0BqHD5oJts4fbi4Tzs5xWU826Qw
	XtAQL/MIkz8wr3aFLg+0hU073Ma8AnGeDpeSRAG33VJ9Twby/q7QQRObRW/SrWzE3t8FYpWT+te
	K
X-Google-Smtp-Source: AGHT+IEWGXLXEp3TtVCqo2VNNnps307PRaGkSJT6/D4KxhXWg/oEmQRwNkjiv/xxVx1VDyeHIbZI/A==
X-Received: by 2002:a05:6a20:72a5:b0:1bd:22f1:f8de with SMTP id adf61e73a8af0-1c0cc742e65mr2769367637.25.1720117589983;
        Thu, 04 Jul 2024 11:26:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a983cddsm1837474a91.30.2024.07.04.11.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:26:29 -0700 (PDT)
Message-ID: <6686e955.170a0220.68a3d.44dd@mx.google.com>
Date: Thu, 04 Jul 2024 11:26:29 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Kernel: v6.10-rc6-8-gc562ba719df5
X-Kernelci-Report-Type: build
X-Kernelci-Branch: fixes
X-Kernelci-Tree: riscv
Subject: riscv/fixes build: 1 build: 0 failed,
 1 passed (v6.10-rc6-8-gc562ba719df5)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_112631_793651_72AB895D 
X-CRM114-Status: UNSURE (   3.01  )
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

cmlzY3YvZml4ZXMgYnVpbGQ6IDEgYnVpbGQ6IDAgZmFpbGVkLCAxIHBhc3NlZCAodjYuMTAtcmM2
LTgtZ2M1NjJiYTcxOWRmNSkKCkZ1bGwgQnVpbGQgU3VtbWFyeTogaHR0cHM6Ly9rZXJuZWxjaS5v
cmcvYnVpbGQvcmlzY3YvYnJhbmNoL2ZpeGVzL2tlcm5lbC92Ni4xMC1yYzYtOC1nYzU2MmJhNzE5
ZGY1LwoKVHJlZTogcmlzY3YKQnJhbmNoOiBmaXhlcwpHaXQgRGVzY3JpYmU6IHY2LjEwLXJjNi04
LWdjNTYyYmE3MTlkZjUKR2l0IENvbW1pdDogYzU2MmJhNzE5ZGY1NzBjOTg2Y2FmMDk0MWZlYTI0
NDkxNTBiY2JjNApHaXQgVVJMOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9yaXNjdi9saW51eC5naXQKQnVpbHQ6IDEgdW5pcXVlIGFyY2hpdGVjdHVyZQoK
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KCkRldGFpbGVkIHBlci1kZWZjb25maWcgYnVpbGQgcmVw
b3J0czoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2
KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgot
LS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8aW5mb0BrZXJuZWxjaS5vcmc+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
