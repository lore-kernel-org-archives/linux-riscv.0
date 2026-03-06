Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BD7F51415
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 07:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LATEHgkYqG3XskB0a4ObDXw6H9pidCy3LDf/quNxflo=; b=LHM979XcWISZzH
	4XmH68hYkI9wpPQ8aC7aRDlBC9eRssH/1vDUg9iYW2xJlTPEu65TD9yfYR675ooN4JKAyY/jJqHPw
	1vyT0MMNKbmrkqpd1/Jha+b3fz62JssiAUB04jfQYQIXYMMpRR6Y/PwxjwOb8XWaWi+Cxp9c7PMdO
	AEjCl1b9hPlL9JMZmdHE/V468PFb5sw8zP6vgUCxRkUTOeero6YFAHNxF4isEHu5MYDejxrMsZFRT
	AMoTduFLb6avw+SIMM2X5MPtKBAtqIyruzufrHI3ce8QphX8gH9Yb2aAYHE/yD1ApNnWQANTBqjSH
	q4du1PAMF/BqVt7lDa8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPEz-000000037fz-1j0g;
	Fri, 06 Mar 2026 07:04:53 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPEv-000000037e6-1kUo
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 07:04:51 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-662f5c5507cso7213191eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 23:04:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772780688; cv=none;
        d=google.com; s=arc-20240605;
        b=WLVMpymA70qVKLgPTTI2l8+seqgw31JhS+7Ei+OI9eL0QKMIXBoRJPL0G1vCD9A5Bk
         /NO5VCTrOTEtLq3rXd9ZDhp10mVFBYRHAX7L8X6TmZXaqm1Z5qwt5S68/xorcDhSLBl0
         I9iJQ5XARGmy+HuA4C0vNV6i+YXMMHy5tOFYMF8mrLCZ6JSUYGOryQKxKRAN7fgQRkIG
         Jxn/QLPRPkx1MNcEmLXDwv8cxrxc27F59IU8GftuV+e0+AoItky5AaDe0+pXhvHjSRTG
         3+sLXTzVU14K+z8/cbeRqik29/wG/VIJ5NSzysj1GX5JG1tIGsZAqJdSdZ5zCC7jWccf
         4YgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HVySQsieckJFK9NwiXNz9/fIecprCPpUdU69L33AQGM=;
        fh=9waPEJgR3EmqWZvfDVYBQHHbKoRPZ7m+Op7krlhJyCs=;
        b=D8d9Qu+oXpa0LdCh9hSgYeZQSQxHmSRmAZRTT4tbthf6P71InH5+Y4yoQObcg2CgE6
         YK0LcPeI3IyTnSRRxJa/ef2dl3kI9XkxWSZ4yIVpdmyJHEBpF3tECumfCuublImNmQgp
         nDjHYOCU0Z+W5cZS/feW70H0ZIRPoAXj/aTFGJcfT7EygAWkpeeOYfe1U3sIRSIRfBtM
         mXp5lL8R0yozHaAHizHPkejd9AtwTx31uK9ACcbvyqMcSce5m9PBSy+b/jCtI5cEVmnF
         YtvMWTjNPyBTBqSkc6dBrjENtS/TEqbXxmZGxuZZdw8k0tL8DhYfM+ZOEVH4HTZqNkVu
         I2xw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772780688; x=1773385488; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVySQsieckJFK9NwiXNz9/fIecprCPpUdU69L33AQGM=;
        b=IaU7w5FryBmhmPs/OL6OJ69Vk2UPDG+wUDtKRZv9lv8kQP2lla1Q6SOIpoPd/pRHRk
         wDNV3edgdt7I0q4bGocOAEQ5Bkkb5kdvNtaBIh5YaqgOxWghdoJU+IPKvyoFXL5VbkYa
         MpyqT9DY+g52TFo7+tbsF3GjgSdSnHk9oJDTFH/QhQmqL/bH1yRH6BX9m2irgdrARoFw
         sNt69jomt3h9If6DlmVwiKDILTqtz9Evi1Amj9HHOOBDVQErvutV60dGYT7O30u4JUJV
         UU0/lP5hUkykJc5fGcFDAZCj1g/W/C8x/fx8bIQQCEkCsETcZdtS+mjFSKWikrrgnpIc
         UPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780688; x=1773385488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVySQsieckJFK9NwiXNz9/fIecprCPpUdU69L33AQGM=;
        b=Jle7Z5No3IcSRxz68KtJbhdyowUzSpcyaKB0FfNKXchmiha9s4fFp2D4n5R61kzYg3
         MSvXi+QqRmRAhsrjQJBVt+9Cl8TE67X8bOzsTQOMPTlLBySUSmE6AtlRKStlICoTdraf
         EQj2+QUM7JDT7MTLGVx1D6OGAEnhwPybXI+HSkdrzIOx03s4XDiCeiist5kVkOzn7rkg
         rkptpfoG6Td5GvYCJ4u5BB9tiAVd0miBxviKZbgwyD36RkpJDzsRgZO+YI7PS06MlvcJ
         KPqoDFkJrow+GOkPx1dFSEC+e57+JyeIrIW8+h6G9+IypPU7BG7R+kB9pxv4NUJe4YQw
         +0HA==
X-Forwarded-Encrypted: i=1; AJvYcCU0O8212Hrtx42wcDjp5Z998V//fBsIQIMhup7z0NEMWZA33+TiLhcKttvPkUsscuCdSkNKP3Qzfirciw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtbsEShcxOgR9Vx32/mgvYlk785KhDDZbLV157wfZ/zHDX7jPO
	K+scyujx2rH0PR8lBw1FGBl88GPLkAcPlBuGEnoOXNAwGlnGCvuMM3/R0xOjQVU15YqkWsyk8pI
	DPnlP/LyMzzJQFQ9j7um8H1AnDtq3+QUzUBgJK8+1jA==
X-Gm-Gg: ATEYQzyMnw6LKiKFh5S1qDfgrm5kDGKV5Q0DCLuWGB5Hi5Yc9cyFl15Y4J4/KrRCpHR
	c4IoYtA1SYk2IjrZStnQGm8Bue+oO56zbiIeAkReWxld/Dye4L4W0kIkb89wRNnYzx411KDaYAN
	/Wa685P/2Mm1wDITd8ONMW1OuyJo+rF7arSjK3YPlIxWQ3ZHPqowswqFBLSp7SxMELWnbc/5tZB
	L0Myb00KaoA9lf6+sA1UUFEhI1BDJhqjgpda8yQOfoSJgA0ZKdAYWGdRoCe7Ne9HqNhk9WZ3vND
	arhoCCG4xPpH/EmJQq3zx8Ek2gJpI4TCNsSxgdHrCWg5ULSBhxeZYO2RXvo2ZCttRwRVydBHrgb
	vJBwNfAX1gyc1ecFYLurlo5dwxQ==
X-Received: by 2002:a05:6820:1ca3:b0:67a:3dd:3fe7 with SMTP id
 006d021491bc7-67b9bd2ef0fmr746008eaf.47.1772780688470; Thu, 05 Mar 2026
 23:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com> <20260120080013.2153519-4-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-4-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Mar 2026 12:34:37 +0530
X-Gm-Features: AaiRm52vplQjZIJ_yYHgtG1kWnM8unoFggovyMF3JIYyAr9uZDY-IpREqe4Zs_A
Message-ID: <CAAhSdy1jeJVHgABQxEzKCqYKLQteVkzM6p5mz2vJBY5A0gmFkg@mail.gmail.com>
Subject: Re: [PATCH 03/27] RISC-V: KVM: Check host Ssaia extension when
 creating AIA irqchip
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Shuah Khan <shuah@kernel.org>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_230449_685409_E2CCE0ED 
X-CRM114-Status: GOOD (  12.80  )
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMTozMOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGUgS1ZNIHVzZXItc3BhY2UgbWF5IGNyZWF0
ZSBLVk0gQUlBIGlycWNoaXAgYmVmb3JlIGNoZWNraW5nCj4gVkNQVSBTc2FpYSBleHRlbnNpb24g
YXZhaWxhYmlsaXR5IHNvIEtWTSBBSUEgaXJxY2hpcCBtdXN0IGZhaWwKPiB3aGVuIGhvc3QgZG9l
cyBub3QgaGF2ZSBTc2FpYSBleHRlbnNpb24uCj4KPiBGaXhlczogODlkMDEzMDZlMzRkICgiUklT
Qy1WOiBLVk06IEltcGxlbWVudCBkZXZpY2UgaW50ZXJmYWNlIGZvciBBSUEgaXJxY2hpcCIpCj4g
U2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgoK
UXVldWVkIHRoaXMgYXMgZml4IGZvciBMaW51eC03LjAtcmNYCgpSZWdhcmRzLApBbnVwCgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9k
ZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+IGluZGV4IGIxOTVhOTNhZGQx
Yy4uYmVkNGQyYzhjNDRjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2Uu
Ywo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+IEBAIC0xMSw2ICsxMSw3IEBA
Cj4gICNpbmNsdWRlIDxsaW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9rdm1faG9zdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+ICsjaW5jbHVk
ZSA8bGludXgvY3B1ZmVhdHVyZS5oPgo+Cj4gIHN0YXRpYyBpbnQgYWlhX2NyZWF0ZShzdHJ1Y3Qg
a3ZtX2RldmljZSAqZGV2LCB1MzIgdHlwZSkKPiAgewo+IEBAIC0yMiw2ICsyMyw5IEBAIHN0YXRp
YyBpbnQgYWlhX2NyZWF0ZShzdHJ1Y3Qga3ZtX2RldmljZSAqZGV2LCB1MzIgdHlwZSkKPiAgICAg
ICAgIGlmIChpcnFjaGlwX2luX2tlcm5lbChrdm0pKQo+ICAgICAgICAgICAgICAgICByZXR1cm4g
LUVFWElTVDsKPgo+ICsgICAgICAgaWYgKCFyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShO
VUxMLCBTU0FJQSkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ICsKPiAgICAg
ICAgIHJldCA9IC1FQlVTWTsKPiAgICAgICAgIGlmIChrdm1fdHJ5bG9ja19hbGxfdmNwdXMoa3Zt
KSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAtLQo+IDIuNDMuMAo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
