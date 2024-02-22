Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33315C48BEB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 03:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HpDACZZ6LuqLWI+4mW1K6oKOoSkqwWmYGNMpFyLCc7Y=; b=JvwEx9Tk3alTHb
	xustJgKFczkzNb/9oO4gE4Wa59HNIpkivyElFn6HW2ga0UBThq94A3kZK0Bm9EogM1I3YEzk7AryG
	AGpKuWwwQXtktNzoYhb1FgFWjXUuPXir0VdkNnrsM0d0Up0qzMj0LVeZyHvlSSXjXFZUAcp3ycXYT
	RhienNCxbwF1GN0aOKN8C2GnpLnv5ciiS7l+suUvrAxbXPm9OAly9GtW3IL1CJ5u/3vT6YrICeNiz
	cCU+1h9rdvEK2yJnWRO9bkqREuwDImCCpPBU+hY/o7tupauXwan87KmIPyCQA9IHASRkZycqNIrwN
	HJfiLsmMCDuEK4CwYlRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rczqX-00000003OZp-49P7;
	Thu, 22 Feb 2024 03:34:05 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rczqU-00000003OZP-3qad
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 03:34:04 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6e2da00185dso3925263a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 19:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708572841; x=1709177641; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6pClInqbXSwJSSrBs7RX+aHnRUhPxr97Kdj1u5pDE9E=;
        b=EdkkgIBGWemqUOZoQkgtrrNQ2xXMRgLyv2P3cgnu9oTGpmKtqt6gbRsD6kUUSbHXFg
         +GKfHSZuZqVZilVGpt8aqup50FIkWpXczYcMx4HsQL2xYKBNPFm14X0XbTCfW6dDG5Xf
         DiZdb341rh89ayQiMIkU5mZvEU/X3yI0U/2FMJspDZBejtvoJOwOqlKHTtB49G4iDN/y
         tytcy/2b7Ias012ZkViClBBM5YqtIo1z8KQUqSQu3lYx+o7/8RhyJq8WTFe/QIVUnC/6
         RwInvMi311ZkyAZoeSVuXGlOJCCDvjV67vlam2a+1mialFCcvt1IfySwfusGZimVCwyg
         suNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708572841; x=1709177641;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pClInqbXSwJSSrBs7RX+aHnRUhPxr97Kdj1u5pDE9E=;
        b=jm9LnJZmlbAg+3pN0Ftk/9itIw7xfXTIwm9kO3gXhVyo/v8dSDcdB+mJ6imF1QamZm
         CcItCOMfGvEAluunbPRV7aEOBl+uLTC4kU+1fJ2fAILU6kIGVJlcWyI4a9LJCARXyZ52
         kqKYg8mexTYgejfzteb9aJc3v06wxo0mky96g8CPxGEvAE/OLHn8/G2iSPs4VUWrUmEc
         woCg9MlG6UL6VDHa6j6HyqpVefJ5tImJwwJLEoXE7imxo/ESigqAuR6PY7JEx/FAcl1f
         jPrRRtIl4ZEO/6gsdJiQf0oO0uo1fY5vjw64PwmFNJ6sPHZbdB/g7IaVDaSQx0Q7R87h
         eZkw==
X-Forwarded-Encrypted: i=1; AJvYcCWPOeAzY46bjhXguT0CJn96sYqmfxwir2FrtfZ9vZmQ0Csie3kSvC03SqfRrqVdyArT+656JENNstVLX9jKgo+rEZYBOetPS24ZlpN0Nhl1
X-Gm-Message-State: AOJu0Yz9425r5HqNijze7NmNePBboci1ivhgK16MiMBbTc6YWwPvZe8N
	cZXcUuALcFSQxnG6rI9BTy+1Jcb7GW+6Kuj6FEHzM1TXgo7AfxO0VVN8EzmuopSJM7ohw09PJwz
	g9x4=
X-Google-Smtp-Source: AGHT+IFRjHdmQm1G0tCP/WO2+AePhHTYeRexf6iauPI4yMDcNHOYhxgzqUiLIFzmRwWZ/UPAJVbNig==
X-Received: by 2002:a05:6359:1011:b0:17b:c8d:f3a7 with SMTP id ib17-20020a056359101100b0017b0c8df3a7mr18205445rwb.32.1708572841253;
        Wed, 21 Feb 2024 19:34:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p4-20020aa78604000000b006e363ca24dcsm9002604pfn.67.2024.02.21.19.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 19:34:00 -0800 (PST)
Message-ID: <65d6c0a8.a70a0220.cd2f1.c50b@mx.google.com>
Date: Wed, 21 Feb 2024 19:34:00 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Tree: riscv
X-Kernelci-Branch: fixes
X-Kernelci-Kernel: riscv-for-linus-6.8-rc4-3-g58506612bf023
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 6 builds: 0 failed, 6 passed,
 2 warnings (riscv-for-linus-6.8-rc4-3-g58506612bf023)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_193403_202501_C3D50A74 
X-CRM114-Status: UNSURE (   2.31  )
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

cmlzY3YvZml4ZXMgYnVpbGQ6IDYgYnVpbGRzOiAwIGZhaWxlZCwgNiBwYXNzZWQsIDIgd2Fybmlu
Z3MgKHJpc2N2LWZvci1saW51cy02LjgtcmM0LTMtZzU4NTA2NjEyYmYwMjMpCgpGdWxsIEJ1aWxk
IFN1bW1hcnk6IGh0dHBzOi8va2VybmVsY2kub3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9maXhlcy9r
ZXJuZWwvcmlzY3YtZm9yLWxpbnVzLTYuOC1yYzQtMy1nNTg1MDY2MTJiZjAyMy8KClRyZWU6IHJp
c2N2CkJyYW5jaDogZml4ZXMKR2l0IERlc2NyaWJlOiByaXNjdi1mb3ItbGludXMtNi44LXJjNC0z
LWc1ODUwNjYxMmJmMDIzCkdpdCBDb21taXQ6IDU4NTA2NjEyYmYwMjNmMDNhYjczYTcyMzdjMDll
MTYxOGI2NmIzOTkKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
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
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklH
X1NNUD1uIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDEgd2FybmluZywgMCBz
ZWN0aW9uIG1pc21hdGNoZXMKCldhcm5pbmdzOgogICAgc2VjdXJpdHkvc2VjdXJpdHkuYzo4MTA6
Mjogd2FybmluZzog4oCYbWVtY3B54oCZIG9mZnNldCAzMiBpcyBvdXQgb2YgdGhlIGJvdW5kcyBb
MCwgMF0gWy1XYXJyYXktYm91bmRzXQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIx
MF9kZWZjb25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5p
bmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVf
azIxMF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJu
aW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11
X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3Jz
LCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNT
LCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLQpGb3IgbW9y
ZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
