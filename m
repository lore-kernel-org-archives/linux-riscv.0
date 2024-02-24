Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8722C48BF6
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Feb 2024 04:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZfbcaMI+ABfLK746JHUbLQHznQkb15ArqDUg1RmlCgE=; b=vyzUDf8Up9qdtN
	ri8h31q8XJ8pwoWg3TDRkSFdba+LRgyRAWqVkZxSpCA4A/IoduZtggA/9rX6CNqQbd7IMRh1zQ8wI
	djdI0Z47jqDdyIdRmkzT1RjdAgFOTjS/Qm0E/Y7rkm6Up7r7Io+eB08Kt7Xc0WV1s9O3Ozy30lKmG
	cMFqlNtdnpbii0jpm/jyw9IWe6HMQ9/OsC6AAKTzYJFD5FvBz3Slw7MCvLDIfu7J9YRNHOUdo6C6Y
	axBqidSB3YrQqV87MBk+rLPyNG7lpQvqVzQ+6xkCiKh9VTAl8Dub2O2MRWD4iaMjHqmjMftS6pAEv
	UYvDx5r3Esibf+BEUb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdjTR-0000000C0ML-17rr;
	Sat, 24 Feb 2024 04:17:17 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdjTO-0000000C0LY-02GL
	for linux-riscv@lists.infradead.org;
	Sat, 24 Feb 2024 04:17:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d934c8f8f7so13476745ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 20:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708748233; x=1709353033; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CODpieb0TLJ3irUp4+AswDtUbh3q5UIOQgbD01VwWQo=;
        b=rrHSaIC8wS8XHMh+0+FG7dsOROIyF4G+UE36slhsiJeemxiWK4Udxu0RYuybQ7knxB
         7aAJMDlje6KE6gxRCjXQQyVJyBOGAff1xdii52/LT+Hnwo1Nn+4x346wb/U6j+tWNzJP
         X30EJ95rI6xyGkBIt+Ox4t5h2F/eAliAfIDYykhyNgLYQ7I1/KTtEBQGN9NLDRsm+APV
         bYQJpLkoiNQc3LGdHNapgVumGy+lLII+rw+UQSFg90CjcAjiPGrbXOfadQ3Px5hIffB0
         eD5psE+Zd4FsmayrX8PRl2+iw8ppsRY2i5ofmanG3+rOoPX5bH6mvlggbQrWjgVWZ/5Q
         B7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708748233; x=1709353033;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CODpieb0TLJ3irUp4+AswDtUbh3q5UIOQgbD01VwWQo=;
        b=GxjxJjL8aweMRqSyd8rDutgOome9cgTpDWPUVn6rIFB+ZjOwfOYX29Tc+QFLtt+oAn
         owppLgy560fqL338m0XPpCQp33KRxnNo/vsi+3uPBlSnjoRDBl1nQvAD3YNlEJO2A+1i
         eFLuMDW1em+PMaaH+bm1TM8w05rh36agqXpelIe8UFfCqM7WTjNd4UMrx9kC6dEO8Q6P
         +x6gfsByYE6zRwC/XUXjmhkSCihB4JYzT+BiT9BYQmX6z4Ywc8xdCAaG+4mi6GOJx70l
         I266/5zljD+BPVfhdo+Sf0EYS84j9+6tlaITAQccO0z1NsXGGIL3Z7LIUHGN6PH0rrKD
         MAMA==
X-Forwarded-Encrypted: i=1; AJvYcCXyKEDf6l8nRLWNBz6uzvMXxyN1QsVJY+gzuhicgWujok7LNnah3aZ37LTldmSRyLBMZqbGL63354P/8nPkaG1BeYBUT9u6WU1Cdt8t9QF4
X-Gm-Message-State: AOJu0Yxbq3FOTbsMNkGEfyhyzymUcHYTIW8prtOw3L0mVNRXBAL+RqBa
	80d6Jhione++8ulR/4nHzfG898trmStyiqgvN1KTuL0iKnKKkPh9Xayy9pvhFuY=
X-Google-Smtp-Source: AGHT+IGsMVNkgiPdyeTyPc0LY8zTnJAXFlVf7JL0IsAjUZhxwKFt/odBKnU6ycOl2fyaWDjuvbI1Og==
X-Received: by 2002:a17:903:2442:b0:1db:d7a8:850b with SMTP id l2-20020a170903244200b001dbd7a8850bmr2152709pls.25.1708748232788;
        Fri, 23 Feb 2024 20:17:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y1-20020a170902ed4100b001d8b8bf8e45sm194942plb.37.2024.02.23.20.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 20:17:12 -0800 (PST)
Message-ID: <65d96dc8.170a0220.85983.0a29@mx.google.com>
Date: Fri, 23 Feb 2024 20:17:12 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Tree: riscv
X-Kernelci-Branch: fixes
X-Kernelci-Kernel: riscv-for-linus-6.8-rc4-9-gd82f32202e0df
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 7 builds: 0 failed, 7 passed,
 2 warnings (riscv-for-linus-6.8-rc4-9-gd82f32202e0df)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_201714_366878_E6C0246E 
X-CRM114-Status: UNSURE (   1.67  )
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

cmlzY3YvZml4ZXMgYnVpbGQ6IDcgYnVpbGRzOiAwIGZhaWxlZCwgNyBwYXNzZWQsIDIgd2Fybmlu
Z3MgKHJpc2N2LWZvci1saW51cy02LjgtcmM0LTktZ2Q4MmYzMjIwMmUwZGYpCgpGdWxsIEJ1aWxk
IFN1bW1hcnk6IGh0dHBzOi8va2VybmVsY2kub3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9maXhlcy9r
ZXJuZWwvcmlzY3YtZm9yLWxpbnVzLTYuOC1yYzQtOS1nZDgyZjMyMjAyZTBkZi8KClRyZWU6IHJp
c2N2CkJyYW5jaDogZml4ZXMKR2l0IERlc2NyaWJlOiByaXNjdi1mb3ItbGludXMtNi44LXJjNC05
LWdkODJmMzIyMDJlMGRmCkdpdCBDb21taXQ6IGQ4MmYzMjIwMmUwZGY3YmY0MGQ0YjY3YzhhNGZm
OWNlYTMyZGY0ZDkKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1cmUK
Cldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBkZWZjb25maWcgKGdjYy0xMCk6IDEgd2Fy
bmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAoZ2NjLTEwKTogMSB3YXJuaW5nCgoKV2Fy
bmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6ODEwOjI6IHdhcm5p
bmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3VuZHMgWzAsIDBdIFst
V2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVm
Y29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcg
KHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMSB3YXJuaW5nLCAwIHNlY3Rpb24g
bWlzbWF0Y2hlcwoKV2FybmluZ3M6CiAgICBzZWN1cml0eS9zZWN1cml0eS5jOjgxMDoyOiB3YXJu
aW5nOiDigJhtZW1jcHnigJkgb2Zmc2V0IDMyIGlzIG91dCBvZiB0aGUgYm91bmRzIFswLCAwXSBb
LVdhcnJheS1ib3VuZHNdCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2
LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlz
bWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29uZmlnK0NPTkZJR19TTVA9biAo
cmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAxIHdhcm5pbmcsIDAgc2VjdGlvbiBt
aXNtYXRjaGVzCgpXYXJuaW5nczoKICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6ODEwOjI6IHdhcm5p
bmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3VuZHMgWzAsIDBdIFst
V2FycmF5LWJvdW5kc10KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29u
ZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBz
ZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVm
Y29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAg
c2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3Nk
Y2FyZF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJu
aW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11
X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJv
cnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3
cml0ZSB0byA8aW5mb0BrZXJuZWxjaS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
