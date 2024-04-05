Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42785C67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 07:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+/Py5vIirrFA/Le9mybC68gKOT+8ifqCIzULji4e704=; b=W5daUOIyi4JccC
	lMp6GAKY4XqR44KNxe4hhmpYbfDdg0s26eUdRQBSHnkGzqrPNZQvt8G22MtaDjccF/6sYIYJlV/k9
	OgFHi4W9i8cNVtBr+u0toIK7iiKNA0uKmvGM7athIBQ33O2ttLGFUf02utW4oeIYnbEkzFgFIc0i3
	Hrz/662PgHdgAnKkMw/TN3IR0jNOFr5b4nXKqrFK18FwxCeozV7TpvZQ9QAgZL/L1KzaGBKBHaclU
	cVnPaW6x+2DLmoh4WHrIwOORc11fukGbvaR/RD82Nu+wbehoOMWjefj7FsCFPTBI66g8jqar7VTY1
	nJI3adn0Hm21BO/ioD+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rse0p-00000005fp5-0lhX;
	Fri, 05 Apr 2024 07:29:23 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rse0m-00000005fo5-07Mt
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 07:29:21 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-22e8676c670so981116fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 00:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712302157; x=1712906957; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kJYdc8+HTjkTFGe5N3Nszffy9GS2z86KHOqXghgULTc=;
        b=k0LDjzNhg+3d2xE7wyU9ZTun73H18chNaByJ/MHvAJYXM4QF3tZvUPDf0rDJ4ssUIM
         7mCDorCxXxOzjSRv0ID3W1G4/gqyR61e/XJZRJY2ofR7y5uZE0kkiXBbKpQSjtwkZxfq
         EMTyoju+QJkbw8+SEC16LExEVsc6IL7Uoe0ziUQE9XX21m3u7QZWeRcDnzP4mhC46F0M
         LXnv2Q9/czs6zHQYSe3PWP+GjX2C6SQ5pXySjRshAb8PsgrE7bgTyApUnXJo//LjqS+1
         oL8dGv+yn+fixa0czJt1Wf2FbtDOI36Du+dx/7kP413iEOkrshIv0I85/KIx1M4TFn9N
         uzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712302157; x=1712906957;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJYdc8+HTjkTFGe5N3Nszffy9GS2z86KHOqXghgULTc=;
        b=pqhtlk21+v5v/DCL+HFcNntjf/ZqIt1czHEMpaUn3d/RsDG66RYJ6b71+8VuaptLcV
         aPvH+XX/lwpnCIVwJ+VtVVSjqh0Gma6VnKazQxCavcEVG7t+skxvOC7BOyVKjFvhe7fL
         vLKQmutBKt5y5M2VO+kiP+gLFc9sq4cb5q5vURU5EOeXjoMk2onM5ck9OFhGSVWhseW/
         2KQciZW2zHbIr6O5U+ZoX55Xp+cX9wi2s6HqdZyjnRYAPy0VxNs0tCCq2C0rAjKXXAeu
         RAlIHUtKsVHNZHWg9g2HxQbrCulFSTV7CNebCsEELv1b0q47q2lOHp+UgcsBMMawovfs
         HL/g==
X-Forwarded-Encrypted: i=1; AJvYcCX3OP99gMyTaCYQXAwM+Kv4QtvjUwCI6wh+5PlqYzgwaZxQqZWSj+iJWdV4DdRJUm1/kGQKQTAqzXTuiHg6n8IPfKyRpApaIEnrS4mKDLIx
X-Gm-Message-State: AOJu0Ywhw4NLcSU2Kfz1LpL7ZBgUGB/JlPBh146/iqC+Vz1HBvIEgRlt
	Si3c86ROcyb4Ff+hy9RzwWOA6Uo0ElrTxbZHZwqW2+gp8w6QIS0YpCoKnTB9dyE=
X-Google-Smtp-Source: AGHT+IEIW2LhjM//Yb7EBpniJOw+//zEljOX0zDFqdHsQbA8EmCqH10PJ8RJzx83JmvEtxKpdYV7PQ==
X-Received: by 2002:a05:6870:7b42:b0:22e:9792:97e5 with SMTP id ji2-20020a0568707b4200b0022e979297e5mr478414oab.30.1712302157337;
        Fri, 05 Apr 2024 00:29:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id fa24-20020a056a002d1800b006eae2f3c7d4sm836782pfb.102.2024.04.05.00.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:29:16 -0700 (PDT)
Message-ID: <660fa84c.050a0220.74c47.292a@mx.google.com>
Date: Fri, 05 Apr 2024 00:29:16 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: fixes
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.9-rc1-14-gd14fa1fcf69d
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 8 builds: 0 failed,
 8 passed (v6.9-rc1-14-gd14fa1fcf69d)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_002920_108112_2ABBEE35 
X-CRM114-Status: UNSURE (   2.86  )
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

cmlzY3YvZml4ZXMgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQgKHY2LjktcmMx
LTE0LWdkMTRmYTFmY2Y2OWQpCgpGdWxsIEJ1aWxkIFN1bW1hcnk6IGh0dHBzOi8va2VybmVsY2ku
b3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9maXhlcy9rZXJuZWwvdjYuOS1yYzEtMTQtZ2QxNGZhMWZj
ZjY5ZC8KClRyZWU6IHJpc2N2CkJyYW5jaDogZml4ZXMKR2l0IERlc2NyaWJlOiB2Ni45LXJjMS0x
NC1nZDE0ZmExZmNmNjlkCkdpdCBDb21taXQ6IGQxNGZhMWZjZjY5ZGI5ZDA3MGU3NWYxYzQ0MjUy
MTFmYTYxOWRmYzgKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1cmUK
Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJl
cG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBnY2MtMTAp
IOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFT
UywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgZ2NjLTEwKSDigJQg
UEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgY2xhbmctMTYp
IOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgY2xhbmct
MTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgZ2Nj
LTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJp
c2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1p
c21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNv
bmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAg
c2VjdGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8aW5mb0BrZXJu
ZWxjaS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
