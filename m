Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C8BC54E58
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 21:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8FwqlDLONQQQchXa08ugeItNXymQJT7364K+uu6XTeM=; b=SzjHLW4XQD8ocF
	VoiO6w0noInVAPSC2Eu4ecAHaXcJomTOI0dAbSr/UYySIp4ZJ7iTojfD2pc2zU0pZk7//SQfkjJA8
	xLJ+ecwA8LVt/4SBIgEtJGwM4u74u1OH5DFvZngeKhK+BMu4h5nUW+C07HuEhui/DDYZj+aBfjKiW
	su2xlw1Nstj9eQVrbgicDAmWsLvEwX+6P/iKgJnvbxf5pN+mqvjbxNRqeBT4o1fjRpz8Nqrw+LE83
	h7TUA+RfcTmWM5JU+CT2PSlHqbpFMC+mtCQEdNtjaGAv+3vvI9QEATlZ1KPJ3Kr7TqpTvVgKPK1tB
	4hqEkjYGNDLW2N99+vhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlEsf-00000001bow-3sGE;
	Fri, 15 Mar 2024 21:14:21 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlEsa-00000001bob-3lpS
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 21:14:20 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso1553357a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 14:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710537255; x=1711142055; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=li8FQZuAORjepNxPzIU1BizKX/F5AKPGAg36p1UGgCM=;
        b=aqBzJOSx6Z6G+6+AKUJ5IkDC2boOiWCTL6ihYMvsxGIUBSZHqutyZuj8tKGAg3fPrC
         TpoLAVNBAy6gteTt4mYSruxoKkaSnwnW+5PjnM2H3nq5P4IE3y0oprVLltaVDx+7t5XJ
         I64G5axNOoUItUDym7xRKO9PNuQgamb01IqQTYOAlrjTKqnAVrScsrMrWmMYvKjb/owh
         TggKaZOyHVKRFwoP9be6INnBJVXOlEzvCJgzSw8nWTUCR59SSRH7CV5zZMD+IiaRbB+J
         67y8nRSKoyo+rLr5SlkiWtf5CzZ0sS2S8ifjB6hUzoor1XUM4xse9aWEY5AVoBKvrmLu
         Tj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710537255; x=1711142055;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li8FQZuAORjepNxPzIU1BizKX/F5AKPGAg36p1UGgCM=;
        b=faM62Q46bRJ2jDtOLsTUz+JagIm7EWThHn6vonnRkhgugfF+u310dP6AHjq/ClZDRv
         fr/cYHPnvQbQIzasL+cPvVcKArcyiorjy3MJUzavL7htXnwdxVAdJfNgmt4Jt16hcSzd
         tWQBp3HFl+iLgAVn5rsCiK0VkXhnXbPMNA3s2KTXgSVW1L0L3GqHa7i6lwAizYGxYMZr
         ANpbuOaNBpZ87uhqyVl2CWBjCpPnRfFika5zSLuHydmxqEa67FJ0kfFzc02ZZ4ggfb3y
         a4v2M8lc0r2GPHhfER0QjHGK5JOuGaH/cOLdG3oPOZjjAG9BvcC8Wuba9iWIeD6qlDc6
         ezhw==
X-Forwarded-Encrypted: i=1; AJvYcCUfaVSXZOIaWHOpqAnOT966sutdUbbKKip070TG+XsArBPgzrPIYhf2+dC2WLzhktnmOic6wFI7ANKjYLDgqwIfPaJZWPS6H/8K06tI8DYV
X-Gm-Message-State: AOJu0Yw7F8vo5xWyB2qBStYQHvl4lL15FP0Vrf0kSYzxdD3dNubb8mMu
	NyCjOV2L3fPDqfjw6zUewMQKI+HCNKfPAo5eN7yip2SOVtjbCCDOhUot9KIKLc9w0cGDj0GOZ24
	1
X-Google-Smtp-Source: AGHT+IGhL4qoSYYN2vo4rHa2yEPyLL49RSVgVviNAIZ4xP4ABXwJ1zCbt3Ou3SkYADLOtNYkVfqPBA==
X-Received: by 2002:a17:90b:305:b0:29b:a35e:6663 with SMTP id ay5-20020a17090b030500b0029ba35e6663mr3846121pjb.3.1710537255273;
        Fri, 15 Mar 2024 14:14:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id sh1-20020a17090b524100b0029951d04dc4sm3387111pjb.54.2024.03.15.14.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 14:14:14 -0700 (PDT)
Message-ID: <65f4ba26.170a0220.17201.b760@mx.google.com>
Date: Fri, 15 Mar 2024 14:14:14 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.9-mw1-18-g099dbac6e90c
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 7 builds: 0 failed, 7 passed,
 2 warnings (riscv-for-linus-6.9-mw1-18-g099dbac6e90c)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_141417_079406_E66AF035 
X-CRM114-Status: UNSURE (   3.12  )
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

cmlzY3YvZm9yLW5leHQgYnVpbGQ6IDcgYnVpbGRzOiAwIGZhaWxlZCwgNyBwYXNzZWQsIDIgd2Fy
bmluZ3MgKHJpc2N2LWZvci1saW51cy02LjktbXcxLTE4LWcwOTlkYmFjNmU5MGMpCgpGdWxsIEJ1
aWxkIFN1bW1hcnk6IGh0dHBzOi8va2VybmVsY2kub3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9mb3It
bmV4dC9rZXJuZWwvcmlzY3YtZm9yLWxpbnVzLTYuOS1tdzEtMTgtZzA5OWRiYWM2ZTkwYy8KClRy
ZWU6IHJpc2N2CkJyYW5jaDogZm9yLW5leHQKR2l0IERlc2NyaWJlOiByaXNjdi1mb3ItbGludXMt
Ni45LW13MS0xOC1nMDk5ZGJhYzZlOTBjCkdpdCBDb21taXQ6IDA5OWRiYWM2ZTkwYzYyMGQ4Y2Uw
YmJmNzViYmRjOTRkYTFmZWI0ZmIKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNo
aXRlY3R1cmUKCldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBkZWZjb25maWcgKGdjYy0x
MCk6IDEgd2FybmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAoZ2NjLTEwKTogMSB3YXJu
aW5nCgoKV2FybmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6ODEw
OjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3VuZHMg
WzAsIDBdIFstV2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxl
ZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpk
ZWZjb25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdz
LCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29uZmln
IChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDEgd2FybmluZywgMCBzZWN0aW9u
IG1pc21hdGNoZXMKCldhcm5pbmdzOgogICAgc2VjdXJpdHkvc2VjdXJpdHkuYzo4MTA6Mjogd2Fy
bmluZzog4oCYbWVtY3B54oCZIG9mZnNldCAzMiBpcyBvdXQgb2YgdGhlIGJvdW5kcyBbMCwgMF0g
Wy1XYXJyYXktYm91bmRzXQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29uZmlnK0NPTkZJ
R19TTVA9biAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAxIHdhcm5pbmcsIDAg
c2VjdGlvbiBtaXNtYXRjaGVzCgpXYXJuaW5nczoKICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6ODEw
OjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3VuZHMg
WzAsIDBdIFstV2FycmF5LWJvdW5kc10KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2sy
MTBfZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2Fybmlu
Z3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9r
MjEwX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2Fy
bmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21t
dV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9y
cywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFT
UywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1v
cmUgaW5mbyB3cml0ZSB0byA8aW5mb0BrZXJuZWxjaS5vcmc+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
