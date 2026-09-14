Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9B7C88E67
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 05:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cd9IV22yoKcgEvqKB3s4ueN9RHUUAdD/NJNrrTfRpyo=; b=nz5dXue+M0/axB
	MBr2J4ozmqNxk4JtI4/GVVZ/egNPlgpqMsllfHns4jpJhXNWZh12X1eDAiFFArkjannia2GuBkfHM
	VhC3msXSNq3n4LygMcDSJSre5XGWAH5mv3CwpZoHzNRmCCSBz2nndoGpbNyJTF2Ltmh6a6TTQ4Kub
	Bmp4no1vLuUS6nvQQFMdg4QWhn1Zhi168GYcz7cXJpptGiUb+vnAw0fE4V5pbfYFoYzZSKwNYzn8p
	ArbwqXPAewnGVSVZv1saPpDbybiTLbS7Cfj0pyc/yr7j8DC4AR4sDj8TZJAqiXEskEzi3We7AuWn2
	+yMV4spxf5Gp/EzyYG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ysW-00000002LnG-0ASv;
	Mon, 14 Sep 2026 05:05:16 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ysT-00000002LmF-0rVh
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 05:05:14 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f633cd78so652746f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 22:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789362311; cv=none;
        d=google.com; s=arc-20260327;
        b=bfRrwdpFW6C25H8H9okXNl/xaPC527UF1Cay8yG11lBakh6KOKCsAcQpYhm78kqcps
         FX2yvBGROMY09T/biPpHY2LwKh4C2EuocOuo1rO/009iIEK1pGucE3MsK93avnM1BKCQ
         lYYssiU+6eraxiRxUyNiqQ/r2XkTi2bt78m8lkozoMKieVq8CqGltbo5o5soQRuH2nyg
         ip7KDeE0wtNnLrgqWjHVJM7Kvn7w9QKGXsyERZzJ0ljHxCmhFPSQt6IQFtyzgd1lNit6
         MTgSu00ph1TR2aJVLyaoq79MBYrJE5SZ5jEKm5V/UuzHsLOiISUc1IYCa7lg/gXLhezN
         KNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2lFbqmyGf2+vEHGBSIgu/0dJXwPUBsUwy+yR+CvMM8g=;
        fh=ASgdX4+ePY+87EaRgvkFQot3290VQiKkJHYWRoAAV/0=;
        b=B/ycmmjNXszU0GJ9tX9khGz9yi7kwObqx6mFF1ZKEWRD/JGi/lGoqU8Wnt3RahIk0y
         k7ndQLoojeB5bD0/drW+3y31NJujB81UhGqHOOOKzDR+Y7tDfIjDyiT6MhW1MVqNotic
         pc/A2rovYyY9osy7rn5OIvLnEAi4qRg3L5htpz1b/zwyPjZwX3c8leueT/NwvDbC+M0a
         fbUG0hWTOXCqMRk1XtsDOggjtYvghDZfXsVQlZZxt87GajE6wxagjy3bdc7DjGzqNyYc
         qQ9+CedKq0DcFxi2RvolTu9vv6d7Bvb/54rowv9mjuI5XG6RCNpdKl8n+0oxrEwf0aDw
         +PKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789362311; x=1789967111; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2lFbqmyGf2+vEHGBSIgu/0dJXwPUBsUwy+yR+CvMM8g=;
        b=vox8zsHAyaqA9qJl3E7edDOI5Q3EOo8SkCrORtChu1mek5dyeSqwuPh5f3iATaEXv6
         awnbzD5jh1nExLEOcAGfDq1kvArZc7/fyPcgz/Fp1htIFq5kTuHmaPbz30EPuOUf0V9J
         DzjPF9r/upeEBUdw9mV+oyEoKQN/Z4r3gamRMW4Z/MZLcrI3z/+iIPSTdLpMsG/LiBfm
         k7/+bQJN5tPVINjgPtzhLV64Fd7XiWCcgStg527FUDGkS3f6iM1xtWc7rqZY4OQ25kto
         9h27ARYxc1VOi8AP17r26SzstaDJ1GctHQHPs23Bwr1NRbUScPz1sWAMjANLtnR5Cf1t
         CX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789362311; x=1789967111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2lFbqmyGf2+vEHGBSIgu/0dJXwPUBsUwy+yR+CvMM8g=;
        b=UEUFBJsN4GuMLzrMrFCSMiUjwlsdx8UyD1O4govratrAXMXCRY0t9Sb0MXsIO047ek
         2r2eokYpMGYGAd63q43gqtmPqx34tngmUWmlvrZzBaKB6TSYmTm8i1HXPNqo+o01PttT
         WWFshXCgpMEQDtDDey2xYSMOaDRVHpzyy8YX6sQE5zhmJgZuxsrzdLqaexAZ6e7Zc1C8
         N491eTjlHuL2bw8nlpv05kXAoRim4t4kvbEk8tMu+hNLS034XpgZkWO4+HOxwBIFKFUb
         aGiuo4pwiZqVz4t7x2WSktMq0in8PB3pS4HBWXAiUinKgn/xndnIS/Z5EvLL3HunFBLz
         T4BQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXqYuTW0RNA4/3l3VE4K29Jz7aum4T5EfdFXArFc7OPY7yxZeC6MJ/K2xGjs87ATxM+K6GV0JJc1kR2w==@lists.infradead.org
X-Gm-Message-State: AFuF++n4MfM3pw65LbWQci9vgWEbVHjIdpZ8EUki3/N4rxjVOSgvILWK
	7dvb4GBc5Aw4xZ0BUdlbVAbOUP1FRdV3eelfYCu7ytuZ/DBavwJGHE/UiGRADbW/C5UF5EkC7NQ
	f+B/MsXqZ7AMO4Ibmtv1VNw+Tj0ShwPp5eHuIRpUR1XiZTdJlgOwZ
X-Gm-Gg: AYBFou2MLn3X6HXyP1tTJtLi9Cq9PDuovkMECU3gEobUSgflhOxcqBDtczOhCsO/9sB
	PN4SwWOBIr2Z1JxdHH6csgBAA1HbFV0/4fOgWaJUICJUOGlIvTWxO+SsBLRtRvG8PtWu3AKVVA0
	NDu9qgT0v/cL0RbhDlTRYHJguzhBJcPF5GmQtfrFLhXjpKLuGAbGSLA1vCq2BvUSe+lzAiAVTDW
	aojbl+b6iSn+VmTr+6dApxqCKLZ0xI0DvTuVOL4wZTHJMZqTTapASKw4ZC9krjiTx3BoBk1vd1W
	wlY0EF1VZDzbWfMT9ghBC4aDWQDXuv5kB2gxjpC5JEqfQLMHfKWWfppUOGlvuCO8dV8xjaOLDT1
	ga1DTxm7gsVS2zIjTb/e2ebnlcnpHCIhZ7SxpQgJ1L8TSayvD+RE5QOtUDldCN2/W8zRqoHPBxA
	==
X-Received: by 2002:a05:6000:2891:b0:487:212:a412 with SMTP id
 ffacd0b85a97d-48702ae4de6mr759634f8f.9.1789362311187; Sun, 13 Sep 2026
 22:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260825083719.643970-1-suunj1331@gmail.com>
In-Reply-To: <20260825083719.643970-1-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Sep 2026 10:34:59 +0530
X-Gm-Features: AcwNN1UE_9mObcL_0yUCsop8W1hIdGl2EPgpfLQFtwqx2oRTCfP20KwRbzdJA5Y
Message-ID: <CAAhSdy33LqjYrozd0X7c6kLGz=bHgOuPAk+r6Je2R9a5Nh_-VA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] RISC-V: KVM: Fix PMU counter handling issues
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel-mentees@lists.linux.dev, me@brighamcampbell.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_220513_270494_08A9C43E 
X-CRM114-Status: GOOD (  11.77  )
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

T24gVHVlLCBBdWcgMjUsIDIwMjYgYXQgMjowN+KAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgZml4ZXMgdGhyZWUgaXNzdWVzIGlu
IHRoZSBLVk0gUklTQy1WIFBNVSBpbXBsZW1lbnRhdGlvbjoKPgo+IC0gcHJlc2VydmUgZmlybXdh
cmUgY291bnRlciB2YWx1ZXMgYWNyb3NzIHN0b3Avc3RhcnQ7Cj4gLSByZXBvcnQgZmFpbHVyZXMg
d2hlbiB3cml0aW5nIHNuYXBzaG90IGRhdGEgdG8gZ3Vlc3QgbWVtb3J5OyBhbmQKPiAtIGZpeCBw
ZXJmLWJhY2tlZCBjb3VudGVyIGFjY291bnRpbmcgYWNyb3NzIHJlYWQgYW5kIHN0b3AuCj4KPiBU
aGUgY2hhbmdlcyB3ZXJlIHRlc3RlZCB3aXRoIHRoZSBleGlzdGluZyBLVk0gUklTQy1WIFNCSSBQ
TVUgc2VsZnRlc3RzCj4gYW5kIGFkZGl0aW9uYWwgdGVzdHMgY292ZXJpbmcgdGhlIGFmZmVjdGVk
IHN0b3Avc3RhcnQsIHNuYXBzaG90IGZhaWx1cmUsCj4gYW5kIHJlcGVhdGVkIHJlYWQgcGF0aHMu
Cj4KPiBTZXVuZ0p1IENoZW9uICgzKToKPiAgIFJJU0MtVjogS1ZNOiBQcmVzZXJ2ZSBmaXJtd2Fy
ZSBjb3VudGVyIHZhbHVlIGFjcm9zcyBzdG9wL3N0YXJ0Cj4gICBSSVNDLVY6IEtWTTogUmVwb3J0
IHNuYXBzaG90IHdyaXRlIGZhaWx1cmUgdG8gdGhlIGd1ZXN0Cj4gICBSSVNDLVY6IEtWTTogRml4
IHBlcmYtYmFja2VkIGNvdW50ZXIgYWNjb3VudGluZyBhY3Jvc3Mgc3RvcCBhbmQgcmVhZAo+Cj4g
IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgfCAzMyArKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9u
cygtKQo+Cj4KPiBiYXNlLWNvbW1pdDogMGEwZDFkNTVkYWQ1NzA3MjRiZjhjN2VhODM0MDk2Mzlj
ZmI0YmU5Ygo+IC0tCj4gMi41Mi4wCj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGVzZSBwYXRjaGVzIGFzIGZpeGVzIGZvciBM
aW51eC03LjMtcmNYCgpUaGFua3MsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
