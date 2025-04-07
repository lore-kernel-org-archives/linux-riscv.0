Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4F2C36018
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fnLjKfihEypHkFwcYJidLnVGWWyUW/YDy3d9euNKcw=; b=JztXU7pfS0kg1s
	h00h8sozZDBKCVQ6vh6XQtNP26FDUfJmzvhAAa7hsKXxKBFbX6JEvmhAN1gbQU/b0mE20Jf8MfPFk
	L+e0aoVyKPDdcY5eoNSizvaDQdF64DG7A2RK+gon28Yx2a/CfI1BdEP7C0jD0mf1f/OvKPDzLIhP7
	NgZi8L7aKszNPBWA3TcqjfUdWETHCyMAS8yLycJNLXpmXWRK4WZyj5lnEjMkXW6AHpZyFy02ERQKO
	7kfDopfdkHywdlwRAigSH23PHJcmu5+OC/gNzYBRffoMD7ZE87dlei171dycZ9LEN0FDEt/+V13u3
	Io3rc+pqcAOA+n6hstew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1raM-00000001gYs-1cdA;
	Mon, 07 Apr 2025 18:52:42 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1quZ-00000001TZd-2BsM
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 18:09:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22409077c06so57709465ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 11:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049370; x=1744654170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMjCLGzG+iKPyMJNKKfkgkaaKsErgB/MOxToztcG4nk=;
        b=hs/xX7JwuOKkVoOTl9moxBVd/Ka3eIe6xf1wacYWXF96J4Q6sArbUwnGPgiQJ4F3F8
         r9l2pZA4+cLTls3h45ztVpWthkRiyd+FjlQ4jkMMs93RQTYcZ936D8gHWrwR660qTJIc
         iEfbSgHGTUalY3EEu0JjCLYSwMcyZ14dnzAEkOqJhyQ2PAUstD4qVZIcNHmb3hbzZ7di
         17zroS723QlBeTLOpFIx0QjcSuOP2BHVYVEO4q+bdr36JVgF4weGmchDltJ6BhsHcoyn
         FbJXrTgBLw1W09CHypE5xNZ53fMiUJppIeXTJTMMDf0h8q3xxTY6MKYr7eiduQzMH41y
         ZGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049370; x=1744654170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMjCLGzG+iKPyMJNKKfkgkaaKsErgB/MOxToztcG4nk=;
        b=Vpf05CN4uo4eVEt725jqiwEKpfgIttUp4Fr6MLRV3Ozw8UkEUrMZhDVDQZm5L7bRwP
         1wj9XBDHNeIJwu5LbYdUdTJPvslWKu0kFJgMuPfC/SPbQxg3tQa8WXU5JziU1imZ0CvB
         FleQ5RJuxRCzL7bhNubf5YXj3kY8NeMiDHwCTyuaW2uALvT/3dDGQrCfXsxrgX/vjsuH
         JzEaqWNLE3Qz97NmbMH93AD3B8BbVaaqeButDtW7p2xBiwvYY8b5qL7/nKxQLqp+d3Qb
         FzDeXxMF57pLFisYizq46LJt6IZSKnftAfQZcSW7xI0bjxBQ+meULGbXwdWTX8WGS7Rb
         Xipw==
X-Gm-Message-State: AOJu0YyGrgfRQ9DGL2VvqEyy3+VrsM6g4Ywf90Brb9q/Us1I6wfSecLl
	lYMeBs/PesuTbuIwzi+1uKURxaE01EMRT5hYrJcabGcfJahitsCZksIvLSxg
X-Gm-Gg: ASbGncvIOiL7zJSk8so8J+L+uwZHgvRFo0Bg7AbBgtTq58d8hV6HdIChqMtI8SjvBdk
	PVbGDNa3crJqBjTnGC++x7W3tbu5OS6gL3wCJ6XQWAYFm8bNpKowS6xsJ+kb940iXbq36Ibg+rd
	gSw7zd2oA1QqUP+k+puLwUIhXlVWa3Yg1/8BIEIYU0/NBY3ZMFPV9yjp9RbLxLw1tHpeITiWWsV
	AIdKhMnSQq35JpH+ET1pUZfMvfuFb8rMdEkGXG23r3TWBcsxvynlSw8Y2VIjeigSjiV0ms32Edc
	Y9awi2Wvajr3LY+whSS97amDZAoR/kZ0lDwLclutN0rB75n3Drk77SZooPJBVQjZq89pr4V0AT6
	N9OPKuytKjzl2usTO0mblxAp3gtJrIvGDrw==
X-Google-Smtp-Source: AGHT+IFm3nEZ9gY9atSzADAapLMqEef81qmFhhoX5lX79/arRk7VY+zxr+6spU/7xP1WGipqyHp2rw==
X-Received: by 2002:a17:903:3bc6:b0:224:fa0:36da with SMTP id d9443c01a7336-22a8a85bf1amr140171225ad.18.1744049370199;
        Mon, 07 Apr 2025 11:09:30 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.09.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:09:29 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andy.chiu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	puranjay12@gmail.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vicent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com,
	olivia.chu@sifive.com,
	c2232430@gmail.com
Subject: [PATCH v4 09/12] riscv: ftrace: support PREEMPT
Date: Tue,  8 Apr 2025 02:08:33 +0800
Message-Id: <20250407180838.42877-9-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_110931_556690_002D491D 
X-CRM114-Status: UNSURE (   9.81  )
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

RnJvbTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KCk5vdywgd2UgY2FuIHNhZmVs
eSBlbmFibGUgZHluYW1pYyBmdHJhY2Ugd2l0aCBrZXJuZWwgcHJlZW1wdGlvbi4KClNpZ25lZC1v
ZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+ClJldmlld2VkLWJ5OiBCasO2
cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9LY29uZmlnIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IDdk
YmVkMTA4NDNkMi4uZGMwZmMxMWI2ZTk2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcK
KysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCkBAIC0xNTcsNyArMTU3LDcgQEAgY29uZmlnIFJJU0NW
CiAJc2VsZWN0IEhBVkVfRlRSQUNFX01DT1VOVF9SRUNPUkQgaWYgIVhJUF9LRVJORUwKIAlzZWxl
Y3QgSEFWRV9GVU5DVElPTl9HUkFQSF9UUkFDRVIgaWYgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRI
X0FSR1MKIAlzZWxlY3QgSEFWRV9GVU5DVElPTl9HUkFQSF9GUkVHUwotCXNlbGVjdCBIQVZFX0ZV
TkNUSU9OX1RSQUNFUiBpZiAhWElQX0tFUk5FTCAmJiAhUFJFRU1QVElPTgorCXNlbGVjdCBIQVZF
X0ZVTkNUSU9OX1RSQUNFUiBpZiAhWElQX0tFUk5FTAogCXNlbGVjdCBIQVZFX0VCUEZfSklUIGlm
IE1NVQogCXNlbGVjdCBIQVZFX0dVUF9GQVNUIGlmIE1NVQogCXNlbGVjdCBIQVZFX0ZVTkNUSU9O
X0FSR19BQ0NFU1NfQVBJCi0tIAoyLjM5LjMgKEFwcGxlIEdpdC0xNDUpCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
