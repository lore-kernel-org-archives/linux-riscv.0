Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D9EC6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 20:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qF2Krpxr0K67dabSn3RwKZ87/0Myh4cUWS/CczOTLUc=; b=eVgT8lxkPNmz/x
	qJrRo9afRjIQjhG35QxDr+K8OkQ8I30/KTDnatltszLYsxzj0cwgarHUOwsyn/auHg2i1HSIdFAf7
	UrEBqlT1ZdbK0lILHEVJ1lm/2u8Z/7Zl0qkSeSP6U+ed4op6qfuO9IwG0uP8jN3IHGlCJl8euvWNL
	6d79Eq3v0xTcjjdL2o5s866b4SG/KSVAZjEhs/qRvksQzF2tyQG6jfzLIQ5mhipY3M4jX/Hx793Vv
	TwxLKCYGaw3MUvFsDCuJCQ9dmrPwaKhSorZ9dBlA6m+5vALxDVriCfwIQdeDDvSqhA8BEGuqDMqS7
	xW3ssbg9Br9FtveLa2NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrkkI-0000000Ch8W-06gq;
	Tue, 02 Apr 2024 20:28:38 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrkkE-0000000Ch5j-1Esb
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 20:28:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e0bfc42783so47240445ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712089709; x=1712694509; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SEuz5eg1sAXT56aFAGbumhm1cfT8OeIH3yDBVhPqqQA=;
        b=TzmwylQ58C2/zIsUcI5KYBo4Y6zLsycqP379kpAbYa9eccTqVtDwNEovCQk72S5+oC
         1i/KfZCmtSl9alwUBRcahPaBbvl5E6Bj5zTjgHtmErrEG3SBiqh7w85RJTBPyeNmVLpD
         Ptg0O906q+M4UB1saKhxI1M+9YOeVYmUKZC8dcMro4KXjwTOLCkEIpC+pGfnrNtbS7SA
         w8Fzc2QOvxJFLDuWeQzARdk+JOyCpZlaFh9YIyI3aEPX59HZ9+jMeRk8vsE/xRudlCrU
         qvaBDaJxTgrBuY/b8k3//WJhcvyw+okJaMjxklbK+7zztPsRui2ekBVMAgNwhzBde1pN
         SQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712089709; x=1712694509;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEuz5eg1sAXT56aFAGbumhm1cfT8OeIH3yDBVhPqqQA=;
        b=xTb1Jtdk7m0nyZ5H9w47e50yyHPgLCZGvfmUok8YYNsCUZsEANA1oIfknb6SjajvQC
         NdB8um2Uhg26U3ySSqWogLpkJOBMm5S7D3F6ODaia2IG8DRgZQrI9s14/EhHiPiaIGrb
         UWmFMlTP/ea9Gvn5BQPaTGvXe/lib52FSXvLAZhQ014tOYDD+aui60dG877DhRWve/Cw
         u1lWQfOGO0MhREe9RdAr31gaUZLDw+2ZtirGgmN7x6hIZ46HCBWO6e15JrXjpA+If/+Q
         +i1VKYiiDhIJROGPmC96ToqgEX3JTHCQY0lAeilnkZzsmhGKV60JcyIpdJ5PgX6HuA4+
         Ec3w==
X-Forwarded-Encrypted: i=1; AJvYcCWyApFJQutYTlKHNIhcSeSku/PUY+FGsJjkwoQ47Qmah/RSoRkRAB6OhJGuHcuL7fqftuInYZYnAtMblGbfzl210V88LOMSdh7ovRzyBIU1
X-Gm-Message-State: AOJu0YwoWGKYUAtuHbjY7CvqvmNwumeuQuJTNXczYImpA3F1HUbdChBJ
	6CGC3coEbLaOqbAgd4avZbv330Qe8SLMcBw/K+dGAgfqseZiVsgsXcs4q6XbodY=
X-Google-Smtp-Source: AGHT+IGbwwL+G9Fu8gJ3LRCpp42wwBSRtPgSfgic5fbMvDgFlXHqMwaouJn9Iehs5XSS2HaBHbtVdw==
X-Received: by 2002:a17:902:e74f:b0:1e0:d630:f054 with SMTP id p15-20020a170902e74f00b001e0d630f054mr16781287plf.7.1712089709483;
        Tue, 02 Apr 2024 13:28:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id mf11-20020a170902fc8b00b001e27557050dsm1100985plb.178.2024.04.02.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 13:28:28 -0700 (PDT)
Message-ID: <660c6a6c.170a0220.a8fb2.4774@mx.google.com>
Date: Tue, 02 Apr 2024 13:28:28 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: fixes
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.9-rc1-8-g7115ff4a8bfed
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 8 builds: 0 failed,
 8 passed (v6.9-rc1-8-g7115ff4a8bfed)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_132834_476094_AE919FCD 
X-CRM114-Status: UNSURE (   3.50  )
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
LTgtZzcxMTVmZjRhOGJmZWQpCgpGdWxsIEJ1aWxkIFN1bW1hcnk6IGh0dHBzOi8va2VybmVsY2ku
b3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9maXhlcy9rZXJuZWwvdjYuOS1yYzEtOC1nNzExNWZmNGE4
YmZlZC8KClRyZWU6IHJpc2N2CkJyYW5jaDogZml4ZXMKR2l0IERlc2NyaWJlOiB2Ni45LXJjMS04
LWc3MTE1ZmY0YThiZmVkCkdpdCBDb21taXQ6IDcxMTVmZjRhOGJmZWQzYjkyOTRiYWQyZTExMTc0
NGU2YWJlYWRmMWEKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
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
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEw
KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5n
LTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJp
c2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24g
bWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVm
Y29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAg
c2VjdGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8aW5mb0BrZXJu
ZWxjaS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
