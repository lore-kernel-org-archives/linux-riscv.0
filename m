Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DECC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 06:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GM4AiCDcirenrE6L3yAAzFpYITTegp10MwECyodVeA=; b=bIPC0cgvRxMBtA
	aFU24wMwboHuGWynM5FYjJUVke9Q1g9vAZLeExz869yJDM4im2fA3NgLLQs8AoRgUHD+K4ckkaZnn
	LIDwqSpLFmWwnViOok5hQeknCY3p3DW6kFCP5t0hZniOOUyKpr2Xs45Qu2fxo9N9/iBa5vQutw5Wp
	DN71/fqaUIfjD6vUWkWBDXkhu55JfbyS6mFtWfm50T1tzYPWICdf6f/77WqTgg8HkV3jDNxgdqDfo
	3m4WJEtSkl/1bASx854hbPqu+9JibezP6rb6KqxWQGJ2gUAm4oQYhFpgOHYz2w3t4aGeBhNUC0snv
	027w0gdaMPVgbIUNAq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s77zh-00000000d6x-0Or0;
	Wed, 15 May 2024 06:20:05 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s77zd-00000000d5l-3z7x
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 06:20:03 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-36c7004daecso24551345ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1715754000; x=1716358800; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXBk01eAYtbUsAxjAP5iGYBzxJrtGgpchSjyGGop1NU=;
        b=dCf8qAt60F9GF7EyYTie5gJGYIk3gGAW0l+iJxC0QnBNCYb5jM6Y6bR3hMJz203kIU
         5XvWJrC6Gc0OLCs2EupbyoL8FIw5WAquDKX9gjurQHY1SUhqUbzSF0UqQaMAEpnTRSNR
         DD4antXLJPIjEgAheXUk5sC7fXvdZSrxkIhZUQss8avrAFomW2pO3S+VPWxu8k2paYRD
         V0xcsOyNcoHn8t6R+WsDI7XUkle4xEYc3hfSO9pEb41rmAs+gWa5UPFM9ISd2kCNyy4g
         knRhE2mTF4FAvkRrZx17emRfrhhYSPxnVFV0z3BOyizKdlTjohkgy69QPw3N3ylWEyLC
         pZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715754000; x=1716358800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXBk01eAYtbUsAxjAP5iGYBzxJrtGgpchSjyGGop1NU=;
        b=OrwRbkJMySIRhSTt7LKXxNlx+YoelDzw27XQ6K+cjXpkDmab14n9y+xDfvkhSuN+wl
         NU0qSBPB7vHCve3G0eLCm70w84pjMPPHHiRxlBAy2z9BZEhxLluI0YWTXrcza0/WF3sU
         Xynf93+7gcAylVLTk4eMdx1KyCvLwlhyvYfShH30Wr+10mThWJRCRdrp6XJZ0ACFXqk8
         XT6RwEp2FJloTGWq8oiHrKs/ec4AQsNUbWWpSOn2Ddm7TpCCxV5bbzhEtOJMErw1xm7u
         m5MVonVtgnEKITxovduspgbsNxUFopuYQkQFYRJmMsmPORNsAvmqZmpnoTVvmMmg2db1
         bX2A==
X-Forwarded-Encrypted: i=1; AJvYcCViPhcevFnezQdOODL4JGKN0tg9zN4T8xPy+2KfAtlDnvR+qqWnsZ1+qBhu+D+VQULdO3q8LNUBlQJ2p7n5HwGlWADuRCIuFFXfnZA+Y6Cq
X-Gm-Message-State: AOJu0YxEYixOR6Wx3G4uN8Es0olPeeBNuDXZLBsdxr50tOFXsm7J+rqh
	O/XEQPTjtwPpqdUAOQbdqngxSHyWW5J4chbvFxrUZDmP62Nyvvca7urCTBrS0zaEABDqLvpaKxX
	T8S9P2lYBxYSul+CUDa71uaUuhLCrRGDIZRt0Fw==
X-Google-Smtp-Source: AGHT+IFkE8DQwyCj3o5jxhZZChCPfs/heM6LGJLIaFfgGkAUVO7wCCuZJPaCHqr48cEbTVMpVAMjeT1LwCMTCZfprkA=
X-Received: by 2002:a05:6e02:1a01:b0:36b:31d2:f148 with SMTP id
 e9e14a558f8ab-36cb7757227mr129234915ab.15.1715753999877; Tue, 14 May 2024
 23:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <PH7PR20MB4962C6D8FD6989BC79F9483FBB1D2@PH7PR20MB4962.namprd20.prod.outlook.com>
 <IA1PR20MB4953F852CB7A9C5FE45E18EBBB1D2@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB4953F852CB7A9C5FE45E18EBBB1D2@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 May 2024 11:49:48 +0530
Message-ID: <CAAhSdy2uSAA4TLmCvjuLsZT26wJyCQ0L61m5vg3BbBCSvHxVqg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add Sophgo SG2042 external
 hardware monitor support
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_232002_018441_28B99E20 
X-CRM114-Status: GOOD (  14.81  )
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

T24gU3VuLCBNYXkgNSwgMjAyNCBhdCA2OjQ44oCvQU0gSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QG91dGxvb2suY29tPiB3cm90ZToKPgo+IER1ZSB0byB0aGUgZGVzaWduLCBTb3BoZ28gU0cyMDQy
IHVzZSBhbiBleHRlcm5hbCBNQ1UgdG8gcHJvdmlkZQo+IGhhcmR3YXJlIGluZm9ybWF0aW9uLCB0
aGVybWFsIGluZm9ybWF0aW9uIGFuZCByZXNldCBjb250cm9sLgo+Cj4gQWRkIGJpbmRpbmdzIGZv
ciB0aGlzIG1vbml0b3IgZGV2aWNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8
aW5vY2hpYW1hQG91dGxvb2suY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVu
c2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIC4uLi9od21vbi9zb3BoZ28sc2cyMDQy
LWh3bW9uLW1jdS55YW1sICAgICAgICB8IDQzICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9zb3BoZ28sc2cyMDQyLWh3bW9uLW1jdS55
YW1sCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3
bW9uL3NvcGhnbyxzZzIwNDItaHdtb24tbWN1LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvaHdtb24vc29waGdvLHNnMjA0Mi1od21vbi1tY3UueWFtbAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5mMDY2N2FjNDFkNzUKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL3Nv
cGhnbyxzZzIwNDItaHdtb24tbWN1LnlhbWwKPiBAQCAtMCwwICsxLDQzIEBACj4gKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPiArJVlBTUwg
MS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2h3bW9uL3Nv
cGhnbyxzZzIwNDItaHdtb24tbWN1LnlhbWwjCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6IFNvcGhnbyBTRzIwNDIg
b25ib2FyZCBNQ1Ugc3VwcG9ydAo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBJbm9jaGkgQW1h
b3RvIDxpbm9jaGlhbWFAb3V0bG9vay5jb20+Cj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBh
dGlibGU6Cj4gKyAgICBjb25zdDogc29waGdvLHNnMjA0Mi1od21vbi1tY3UKPiArCj4gKyAgcmVn
Ogo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgIiN0aGVybWFsLXNlbnNvci1jZWxscyI6Cj4g
KyAgICBjb25zdDogMQo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRpYmxlCj4gKyAgLSBy
ZWcKPiArICAtICIjdGhlcm1hbC1zZW5zb3ItY2VsbHMiCj4gKwo+ICthbGxPZjoKPiArICAtICRy
ZWY6IC9zY2hlbWFzL3RoZXJtYWwvdGhlcm1hbC1zZW5zb3IueWFtbCMKPiArCj4gK3VuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgaTJj
IHsKPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArICAgICAgICAjc2l6ZS1jZWxs
cyA9IDwwPjsKPiArCj4gKyAgICAgICAgaHdtb25AMTcgewo+ICsgICAgICAgICAgICBjb21wYXRp
YmxlID0gInNvcGhnbyxzZzIwNDItaHdtb24tbWN1IjsKPiArICAgICAgICAgICAgcmVnID0gPDB4
MTc+Owo+ICsgICAgICAgICAgICAjdGhlcm1hbC1zZW5zb3ItY2VsbHMgPSA8MT47Cj4gKyAgICAg
ICAgfTsKPiArICAgIH07Cj4gLS0KPiAyLjQ1LjAKPgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
