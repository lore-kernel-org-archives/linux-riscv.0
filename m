Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81820CD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 13:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0r90fvvl9ufZZfiPoyqgX6CMBTNGPhvZMcHE5wPo20w=; b=tnv15GR0yjOWc7
	pgWjfgBZAbfCLaS6mYRHVDQFS55MDElfpE8LUW674xExwb3r5oXUWrelOIptE549S+5QvWoNNptro
	e4AM0gSF1Djhu0qsvXP2eFQhU/enBq91Z22cwhrpSDzL0uBOoFn8YmX2+3WGAia6HgRffODMWnaob
	/k4rsuG6Zl1Qu8TBpvDQRQmduQo2EJiITMBMOhMxBLAUKRjLW9acbHD6d5tj8fa/76mK3NpUmF7yk
	dHv29+X4KqC+BaUJQTh7UC2bY3oCzzsc3Hgc5I90Jfd8WieN1JUttK+vev0vJEDqU9ITBEiUO7vip
	GHbjlIyYVdKSP80xKCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCvC-00000001N7b-34Xs;
	Thu, 18 Jun 2026 13:36:42 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCvA-00000001N73-0WCU
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 13:36:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4905529b933so8561455e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2026 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781789798; x=1782394598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qavgJPHHOECEJ91w79AZ813o0Mh7WejFknktQtGHNq8=;
        b=O8aKpGa6L9V5RdXkCDlOylLEux5K50WwEKaxS6tRo2dIpNSFR9TSF5R3d4qqws/2P9
         JPatowTqpeOX/3ifDl7y9q+lAt0owLsbMSz0GlvnNU55qBooED2CB+7VRfPfIDiBOpJr
         6EcGFv6yWzuCTHghQWl63nNS4ezSkCbLXPw30q+9Zbr4B8SsJlprzlwxaahikPGYb19z
         Cxn50JiGIQ4oLs/z5JjaL2QHBVEkv2yCYKo5hRQVrgUBqgutVC9icHHGqdNybRVGXDBv
         5e4t2Sh/ig0YXwiNX+XK3ls5tTlBtrt82i6xyLJ7K8lmMFfNcl2dbYu7z4RsNMN5g9X4
         eJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781789798; x=1782394598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qavgJPHHOECEJ91w79AZ813o0Mh7WejFknktQtGHNq8=;
        b=LG9airiqCKUtr7wai9lVcxrcyBy+GH18E/FBDYe6UUXb6zj01gFoPsRn/KXWDMWtwY
         TWLkwoNIubILC6E10RqSgRizX6WLGS81XEX+ep3e6LLRAWpg7wEq4aYuK00TG3EhpxLb
         T0kBk1RQGe2hMJpWpF8k+RDTtrZw3tXIuGXvXNVr8eQHVZPgkvAjdoFTJxaCIlz+tE3Z
         T79E/CCKxyYVPuMjMnR3BMgdyTYEu8IOzy/WCCt7BmBs7aYIELpUmY9V1NCPaB3t5EQ/
         QVG0UJ0VHl/o3aWrGvIYGJyX5VxY483GQZWToB0RS4pAKT3/UhNQU1HTYMzrgjxM9w0+
         0gig==
X-Forwarded-Encrypted: i=1; AFNElJ/J5AbgoWMptnc9YWIBj5pCY4+uNcmOrTK9WscvzVGX1WRGoUgomi1v9WBnbzIIplZ/hQ9Sqg/Zu8ISSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yws/NvYithlb3RD8nC3G2fH8rIUDMdb+k8RtVXoNnlSTo92/LCC
	w7xJDfNRSQogL0FuSFKiKkpJ3u8Tbm/31jw9TtNkB/RV/y2ditmGYkOa
X-Gm-Gg: AfdE7ckgB8Sqb+RxO9NP8/s3Y/AuhqmFuxoirSJHaBy9qBexZdQFZUXPm2j0q1PXBsd
	7UJnTFVTG54xN7niFVKrJgt1xtv752g+hG+blUrnLRrqXVPF6MoQTl3XyoJVCwoIG4CM9N8lL49
	vS2JzH+6hLU+miM51pGU+2e/xFIxLVS0v2+NiVEz58MMPiRPhNTfoOhQj/6XbWhO0JOqinfRudi
	MOLr1cxXxYIl6g5WdFp4pAgLR0UtsGIMMKF3qfvfKjviUHZ2BzE5+zgC7aBnPWBVCVmN92HDjB8
	+Iz+Cjmrqpdeb+gMwVemOFpkJEj2OnBWwEQ6DPhXeWjuOR5b8e0H32tZ2dK7gTdmD/KAe1fx17q
	SzQu+2yKJhjuqILpHqqP0tL6Zn1lI6HTvRWTtLCPkJXLSJqjVteXOH54ikQ9wmpKda609EthZKT
	wNQahv92motjp73Qnc0TICBhzPv3wHYQehQxrUUgqIMqdFw+LEMBlYA1Aa5yFU
X-Received: by 2002:a05:600c:4f91:b0:492:1e36:d16e with SMTP id 5b1f17b1804b1-492333f7ff3mr144524195e9.36.1781789797510;
        Thu, 18 Jun 2026 06:36:37 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a58fddsm233967025e9.8.2026.06.18.06.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 06:36:37 -0700 (PDT)
Date: Thu, 18 Jun 2026 14:36:34 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>,
 zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 cuiyunhui@bytedance.com, iommu@lists.linux.dev, joro@8bytes.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 luxu.kernel@bytedance.com, palmer@dabbelt.com, pjw@kernel.org,
 robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org,
 yuanzhu@bytedance.com
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
Message-ID: <20260618143634.7f3dd6c5@pumpkin>
In-Reply-To: <CAJF2gTRH6x78A3J5HJ5kUM47aDv8R0yFr8LRP+7jiLX4GL3ssg@mail.gmail.com>
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
	<20260615123821.373248-1-guoren@kernel.org>
	<7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
	<CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
	<e051d822-d0be-4a88-ba86-ec9b5905fd1e@iscas.ac.cn>
	<CAJF2gTRH6x78A3J5HJ5kUM47aDv8R0yFr8LRP+7jiLX4GL3ssg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_063640_177708_D2692D2E 
X-CRM114-Status: GOOD (  11.69  )
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

T24gVGh1LCAxOCBKdW4gMjAyNiAxNzo1MTozNCArMDgwMApHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IEhpIFZpdmlhbiwKPiAKPiBBcyBub3RlZCBpbiB0aGUgUklTQy1WIElP
TU1VIFNwZWNpZmljYXRpb24sIENoYXB0ZXIgNjoKPiA+IFdoZXRoZXIgYW4gOC1ieXRlIGFjY2Vz
cyB0byBhbiBJT01NVSByZWdpc3RlciBpcyBzaW5nbGUtY29weSBhdG9taWMgaXMgVU5TUEVDSUZJ
RUQsIGFuZCBzdWNoIGFuIGFjY2VzcyBtYXkgYXBwZWFyLCBpbnRlcm5hbGx5IHRvIHRoZSBJT01N
VSwgYXMgaWYgdHdvIHNlcGFyYXRlIDQtYnl0ZSBhY2Nlc3NlcyDigJQgZmlyc3QgdG8gdGhlIGhp
Z2ggaGFsZiBhbmQgc2Vjb25kIHRvIHRoZSBsb3cgaGFsZiDigJQgd2VyZSBwZXJmb3JtZWQuICAK
PiAKPiBUaGVyZWZvcmUsIHRoZSBhdG9taWNpdHkgb2YgNjQtYml0IE1NSU8gYWNjZXNzZXMgaXMg
VU5TUEVDSUZJRUQgYW5kCj4gbm90IGNsZWFybHkgZGVmaW5lZCBpbiB0aGUgY3VycmVudCByYXRp
ZmllZCBSSVNDLVYgSU9NTVUKPiBzcGVjaWZpY2F0aW9uLiBUbyBoYW5kbGUgdGhpcyBjb3JyZWN0
bHksIHRoZSBMaW51eCBSSVNDLVYgSU9NTVUgZHJpdmVyCj4gc2hvdWxkIGZhbGwgYmFjayB0byAz
Mi1iaXQgTU1JTyBhY2Nlc3NlcyB3aGVuIHJlYWRpbmcgNjQtYml0IHJlZ2lzdGVycwo+IChlLmcu
LCBwZXJmb3JtYW5jZSBjb3VudGVycykuIFRoZSBiZWhhdmlvciBvZiAzMi1iaXQgTU1JTyBhY2Nl
c3NlcyBpcwo+IG1vcmUgcHJlY2lzZWx5IGRlZmluZWQgaW4gdGhlIFJJU0MtViBJT01NVSBzcGVj
aWZpY2F0aW9uLgo+IAo+IFRodXMsIG1hbnkgaGFyZHdhcmUgdmVuZG9ycyBpbXBsZW1lbnQgMzIt
Yml0IE1NSU8gKHJhdGhlciB0aGFuIDY0LWJpdAo+IE1NSU8pIGJhc2VkIG9uIHRoZSBjdXJyZW50
IHJhdGlmaWVkIFJJU0MtViBJT01NVSBzcGVjaWZpY2F0aW9uLCBhbmQKPiB0aGlzIGRyaXZlciBk
b2VzIG5vdCBhcHBlYXIgdG8gYmVuZWZpdCBmcm9tIDY0LWJpdCBNTUlPIGFjY2VzcyBlaXRoZXIu
Cj4gUGVyZm9ybWFuY2UgaXMgZnVuZGFtZW50YWxseSBjb25zdHJhaW5lZCBieSBidXMgbGF0ZW5j
eTsgYXNzdW1pbmcgdGhhdAo+IHNpbXBseSByZWR1Y2luZyB0aGUgbnVtYmVyIG9mIGFjY2Vzc2Vz
IHdpbGwgaW1wcm92ZSBwZXJmb3JtYW5jZSBpcyBhbgo+IG92ZXJzaW1wbGlmaWNhdGlvbiB0aGF0
IGlnbm9yZXMgdGhlIHVuZGVybHlpbmcgaGFyZHdhcmUKPiBjaGFyYWN0ZXJpc3RpY3MuCgpJZiB0
aGUgYnVzIGxhdGVuY3kgaXMgc2lnbmlmaWNhbnQgaXQgaXMgYWxtb3N0IGNlcnRhaW5seSB3b3J0
aCB1c2luZwptZW1vcnkgYWNjZXNzZXMgdG8gYXZvaWQgcmUtcmVhZGluZyB0aGUgaGkgcmVnaXN0
ZXIuCgpTb21ldGhpbmcgbGlrZSB0aGlzIG1pZ2h0IHdvcms6CgpzdGF0aWMgdm9sYXRpbGUgdTMy
IGhpX3ByZXYsIGxvX3ByZXY7CgoJdTMyIGhpID0gcmVhZF9yZWdfaGkoKTsKCXUzMiBsbyA9IHJl
YWRfcmVnX2xvKCk7CgoJaWYgKGxvIDw9IGxvX3ByZXYgfHwgaGkgIT0gaGlfcHJldikgewoJCXUz
MiBoaV90bXAgPSByZWFkX3JlZ19oaTsKCQlpZiAoaGlfdG1wICE9IGhpKSB7CgkJCWhpID0gaGlf
dG1wOwoJCQlsbyA9IDA7CgkJfQoJCWxvX3ByZXYgPSB+MHU7CgkJaGlfcHJldiA9IGhpOwoJfQoJ
bG9fcHJldiA9IGxvOwoJcmV0dXJuICh1NjQpaGkgPDwgMzIgfCBsbzsKCkl0IHNob3VsZG4ndCBu
ZWVkIGFueSBsb2NraW5nIGJ1dCB0aGUgYWNjZXNzZXMgZG8gbmVlZCB0byBiZSBvcmRlcmVkLgoK
CURhdmlkCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
