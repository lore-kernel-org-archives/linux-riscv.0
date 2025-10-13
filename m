Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB368CCD18D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 17:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bay4dyKFwdHYS6FfRrpuVmfIXLqaLVfzUSjkFYWgwcg=; b=mO26Zyvg2EVARz
	chNFMDQ5S5QdXyXsK5CmaKstOJ2BJMpxJY0rI1HDECVl8FeZBz5teQF5iMu6jvTihTn6PDxehQyA1
	jO98t1ErA5qx3O6tacT6pnpKG7vALskB1ag4xmJgSyZLDEeuolDeXJCWfEcRLZUdZfSsNYB4yIJMF
	szfq0K6LasU7oUvLiis+LT9Qf/EFmPzgILe6qvx/ydLkbBL46TWoaGd1iGHYt38JE6c6mBuo978T6
	On+3WYAfOMRUEJ85AtRcNPSGW6bM6dMz6p2P45BXh5bjEpJALtPOGF7zbX82QAbp4nsNRBIxcya1Y
	gI5eIDSLmr2YDKywkIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MXr-0000000E4Ag-2YMG;
	Mon, 13 Oct 2025 17:41:15 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MXp-0000000E4AG-207P
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 17:41:14 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-930a6c601b3so443249239f.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 10:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760377272; x=1760982072; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UltuTfLMWFwExhawJAiiHDqM2t3dFAy15foosSKHKoI=;
        b=o+4G4NetJP4Kg4l4XjBfvRhsYHqJPio+3X47wyYVo2GQgrW97JTsaR29o6z//HIzn5
         IGgAlocoYSB6pbjVM75PUGEavvc3zw2uIeUwPZhEAWir3DYTqRXnEb0IPvberBFTs/8G
         Qzv39zHr0+2JuctEkbj0Od2VDMJ+DvZMM9/b1TCHfgOThcVI+LQsMT9UhI1GpZwAWlwD
         iHe+Z5DQ3Zkpwqt6BsbEFT0Te/WBDIu8PjSoxi8uqzn8pluzWj3MuocRJBgQmJ8pN85j
         K0zxQIpxWQ1xfHfD/iNisyl4HLzDqUAyTLuFvGNEEIK2iyHju8qnpHA6oagIaIVmb3UP
         I15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760377272; x=1760982072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UltuTfLMWFwExhawJAiiHDqM2t3dFAy15foosSKHKoI=;
        b=RJbkIod+J1kmXZAuToJjw5WCSe4/9dzJ1qNjFRi6NuECBUGYu1PZZZFPDoVvbaYwIM
         xX0yVjBBregjo3T+MaP1SsRXIFOTCnLMq7Rx2CPwOM8+eEf03aIBEZEG1ronovgGN8y+
         nnd2ElSSciT0U5hqCFdYDDpCzlM6FZf6mOc07NoGEfZdV9H4jeWv7jPIa+JdMbEvNlB/
         +jFPyDAC6OhPIfapmyFipAZwU8pU1unJUbA58QnQ/nurNKM1hctkv3kMPHxtAnH0YSAO
         eOK0CvjN/FnLwkpUX38qDui5ayxD9zDYPvOhH1sNrpY6rW+qNBBcA8vlgVFJaI3DlTOZ
         AYAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXpat/kVWZaP/yLQsaoZUiZ3+ek5nJkHz5Alx88Me3lS4uHlfXrLKojxnevmTVpWC5A/r12r/vsgkWvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUDXkc6AUK87Gg75CIgoiOnTpdLBcUJK+jYZ16X1swZaWXY+fo
	ek1t4ZKGpjiX7zQxaLBqKucRzVJZ4DKOOEYqUmh+8JDu+ihBLxat6u4qfUHHsns0viU=
X-Gm-Gg: ASbGncsyX6sUv51uExLd2MaXbpoWuJWHLwvRVLenuVhN3hHCnYL4Mx2B2MqAZ7AlwLi
	8L/qiTcFZsih1fkQMhoyBddiOJ+zUUf5te1Gl19qsjU7kQahGTLcgBW3okrpZrwiYf21SfdkGOO
	20F6YlRYfHp0xkdz+KRXDDXmB2SFmWaLgKVH2c3847jebPRDDDEwJD9rOlS1yvt8h4Ogu91O71h
	LHrHOMCHH6C5CYm2kqdmrr9XeXmTJA7QwsWWl4ZQVulsVhbMjGFypCRMZqqput5kQNhkm05Z68W
	vO0B2ZTyqJ7Z58ENftDDHbNPzEgGW8o171u5oF69Q+vWKC+d0EKHjLXMlEnZhiExNo9Z2s7Rj70
	ykK9AgYPWOalTuL6tRECK61YjEYb+PD6SD7/tfSDfqxw=
X-Google-Smtp-Source: AGHT+IGksZJATtR9dICb9YFDLoYCnIOn9SbEaI89/f+xN2pNKg219Slp1yc0ndJtssXs/Ex7tkdSVw==
X-Received: by 2002:a05:6602:740e:b0:887:638a:29b5 with SMTP id ca18e2360f4ac-93bd1975876mr2285945239f.9.1760377272238;
        Mon, 13 Oct 2025 10:41:12 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f729ce111sm3807015173.58.2025.10.13.10.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 10:41:11 -0700 (PDT)
Date: Mon, 13 Oct 2025 12:41:11 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: alex@ghiti.fr, alexghiti@rivosinc.com, aou@eecs.berkeley.edu, 
	cleger@rivosinc.com, evan@rivosinc.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	pjw@kernel.org, samuel.holland@sifive.com, shuah@kernel.org, 
	zhangyin2018@iscas.ac.cn, zihongyao@outlook.com
Subject: Re: [PATCH v2 4/4] selftests/riscv: Add Zicbop prefetch test
Message-ID: <20251013-b0cf6d4c5952c56cd489eca9@orel>
References: <20251009-49032bae395a1c26cbe80928@orel>
 <20251013161645.29357-1-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251013161645.29357-1-zihong.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_104113_539350_6D21A55D 
X-CRM114-Status: GOOD (  10.59  )
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

T24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgMTI6MTY6NDFBTSArMDgwMCwgWWFvIFppaG9uZyB3cm90
ZToKPiBUaGFua3MgZm9yIHRoZSByZXZpZXcsIEnigJlsbCBmaXggdGhvc2UgaXNzdWVzIGluIHRo
ZSBuZXh0IHJldmlzaW9uLgo+IAo+IEFsc28sIGRvIHlvdSB0aGluayBpdOKAmXMgd29ydGggcmVu
YW1pbmcgY2JvLmMgdG8gc29tZXRoaW5nIG1vcmUgZ2VuZXJpYwo+IChsaWtlIHppY2JvLmMpLCBv
ciBzaG91bGQgSSBrZWVwIHRoZSBjdXJyZW50IG5hbWUgZm9yIGNvbnNpc3RlbmN5PwoKVGhlIGNi
byAoY2FjaGUtYmxvY2sgb3BlcmF0aW9ucykgbmFtZSByZXByZXNlbnRzIGFsbCB0aGUgY2JvLioK
aW5zdHJ1Y3Rpb25zIGFuZCBhbGwgdGhlIHByZWZldGNoLiogaW5zdHJ1Y3Rpb25zLCBqdXN0IGFz
IHNlY3Rpb24gMi4yCiJDYWNoZS1CbG9jayBPcGVyYXRpb25zIiBvZiB0aGUgQ01PIHNwZWMgaW50
cm9kdWNlcyBhbGwgb2YgdGhlbSB1bmRlcgp0aGUgc2FtZSBoZWFkaW5nLgoKVGhhbmtzLApkcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
