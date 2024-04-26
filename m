Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D1EC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 18:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CwmwojzsW/5+Xio+mcZGcm+kz0TTta4NpokZwslSgKA=; b=o9MexxnWizqxqm
	Xbkh1lzqTx6R0VSDZ+2pUWcGayzgKW6Reazu8TMyKIg11RWBNAGzubiU3cs2SSIxFWR9mxAFfl1Wo
	34E0+cdloGXwnVS7ZBLLKr5VthgSRxBmWKXb5NuKSBpo0Jgbqb8YPE0Fq+wUo9s1G8nkhTCrYSolt
	f9FctNKvc2ruC3N1fRABNaUtaYRJFxKVSbqhHsPScn8RR22RH+/nK4nIqkHlHfCDZVLh5cqZVb40L
	5BWp0zTnCgkkDPjcM0p/3yKZv5Kn1tZEVa3+JjKPl+mCoJnIUBLXMNoOxbiMiutQ/khePFkUDHXt0
	32eep6y/SikR/gNDL7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Q6h-0000000DdAm-0PY1;
	Fri, 26 Apr 2024 18:15:35 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Q6c-0000000Dd8E-2imu
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 18:15:32 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1eab699fcddso18289425ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 11:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714155326; x=1714760126; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VKWxB5mEeaRK+vwDUp29hcO8pUmoiw5AqihdgsIqDdo=;
        b=X+ai8HjnTM21ktb/uZ5gpM25n6n7K3KGWggX3jnWT1FQU1TBKw03vS0O2Sws+YlLwI
         83rgDfp0n+wOYXBNedoRY7GU1YC7OzqQyal4gPDtNlMu4oMsKjejwRgCp+IRW0UM+4hy
         mzvkhEvp9+M9nFyJnZU1QLiBPIKjLBLgoFTXa2atJpCaZ2yAGoSaSARWwNR5Yu8jsR0M
         NPy8VUz2WFfSaFBZgBFL/x1PaYDsQECPUd+Bko22OpYyftW85JigHghev/zBfYJiXKc6
         10ETKM/VvuQY7gdJbS0Da+9Vqk7OMhIIqiARg0Z3iUBMYXwVE3PZCcpk1ms13Xz8fdr4
         3Bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714155326; x=1714760126;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKWxB5mEeaRK+vwDUp29hcO8pUmoiw5AqihdgsIqDdo=;
        b=beeC4rDKS0lJULD5PE6jSlltdB5Vle5fj7jT1ALgvlB09gdvl5YsDX1CzoxJn/44Yv
         V6x3FQNNFBCHAdTk1EBUWJH1qkpAhGrJoLufsS2l4Ofr9mpMW8R1QX+E5gq6XJx6B+hw
         HUc382A5EXRq8HidOZCL4HGosL41TMP8UuoT8uW4VguEN3JqfLUrmWUVy6GwdRtJHZgO
         PZPLYe2yfTfS2XhGHBR2IaLYcQts8CO9AYUk7NaKXf9+x1218jt+PKDaJVbtSA3j5Nkx
         cohPOn5jdp12u5KjM4qWUtQn0OHnAWthBGMVju9l+IrZJt8Cuj0Np02p9ftpZPLK+Glu
         vd0A==
X-Forwarded-Encrypted: i=1; AJvYcCVOa8mlhCbvhald7TtfRYqJ0xv/fFtZX6F+JrxubOMLikG7oCmI7Gd1i3Qn+avATJI/9pmnqjGrQCQqtGGEWI/Z46tSS7UAQV3QH/qyjoST
X-Gm-Message-State: AOJu0Yyb92tGiphjNHaKqrlvEv3m7BvwU9bi5naO+d7yuC3/W3yfLcZu
	hwSDYUyVVcrXrDtteEhJrXKTdj3JZgT7CxLbcBUTdC0qrTyd+poQxaQCqznvPUA6jOoTyKoabM/
	NfpQ=
X-Google-Smtp-Source: AGHT+IH5up7hiuEpqsQl1GgmDVg2VUAjJjUb6epXrE1EuJK3hgJLToox8Py1yB27u3lRndbGjj9BLw==
X-Received: by 2002:a17:902:b610:b0:1e3:e1e8:bb5 with SMTP id b16-20020a170902b61000b001e3e1e80bb5mr3096105pls.28.1714155326447;
        Fri, 26 Apr 2024 11:15:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d89500b001e44578dccasm15810723plz.254.2024.04.26.11.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:15:26 -0700 (PDT)
Message-ID: <662bef3e.170a0220.c963c.b007@mx.google.com>
Date: Fri, 26 Apr 2024 11:15:26 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: fixes
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.9-rc3-10-g6beb6bc5a81e
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 8 builds: 0 failed,
 8 passed (riscv-for-linus-6.9-rc3-10-g6beb6bc5a81e)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_111530_945640_B87D0B29 
X-CRM114-Status: UNSURE (   2.91  )
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

cmlzY3YvZml4ZXMgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQgKHJpc2N2LWZv
ci1saW51cy02LjktcmMzLTEwLWc2YmViNmJjNWE4MWUpCgpGdWxsIEJ1aWxkIFN1bW1hcnk6IGh0
dHBzOi8va2VybmVsY2kub3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9maXhlcy9rZXJuZWwvcmlzY3Yt
Zm9yLWxpbnVzLTYuOS1yYzMtMTAtZzZiZWI2YmM1YTgxZS8KClRyZWU6IHJpc2N2CkJyYW5jaDog
Zml4ZXMKR2l0IERlc2NyaWJlOiByaXNjdi1mb3ItbGludXMtNi45LXJjMy0xMC1nNmJlYjZiYzVh
ODFlCkdpdCBDb21taXQ6IDZiZWI2YmM1YTgxZTE0MzNhMTUzNGU3NTE3M2Y2N2Q0MmE2ZjIyNWEK
R2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
cmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1cmUKCj09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAw
IGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCmRlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMs
IDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJv
cnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNTLCAw
IGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywg
MCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpub21tdV9rMjEwX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFT
UywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTAp
IOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3Ys
IGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNt
YXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8aW5mb0BrZXJuZWxjaS5vcmc+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
