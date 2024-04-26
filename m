Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67E1C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXij/yS7wB30PzOMD68VG76SRaXB8uW2/HaJvj0y/4Y=; b=DQqsb1v3xO1YOO
	iONpoTZxM7Se6Pm4j6Jbg2wMdToNA/RNoE3L+ma3LS74MxeVJux9QwwH1Zb5+NS213HCyWHJwJzNa
	/7gV7Qcvx/yxqHDTfp4IEGo5pt0bNFrl4inkIG/FJbDKX+WHWRTHMYycr0oMkPLc+D25hoQSDBGFM
	d6s1WR/75QoRFNQd2HkOIbqreMLZ9nrryMK04bsFMzlWEugSRLRWge2OGr8NhyCJuIzg8S8lfrXDx
	AOB8uQcP1M2JsVqx5LNaV/Hlo+siWiS0/A3KNDlKaFUMGMqKhKRRdrsKku0XND74nHuxxjfl9rQBX
	DA2gEbDd27KlYzq73i4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0GJa-0000000BX59-3qS2;
	Fri, 26 Apr 2024 07:48:14 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0GJX-0000000BX25-0tK1
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 07:48:13 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-36a17999886so8179105ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 00:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1714117687; x=1714722487; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNEXb7K7k6t0jTc2DZhY7wfuFpObcVhQaJunE5Y0/3Y=;
        b=OiftAoHP3dn5Iyr8Hd/o0WommQFhE5DoqZhTXbxBs7mQekDQ3y+LkPE/cClWFwvD2U
         ++AUl5l48LgvAtdlmUe+0dNnDt48XfOlo4G39L0wi4vBVfvK9LQ21fE00vScsrSAiiVj
         c6wcVSewgi25mmN2/vzcbxpqNcKoXF8NFCVvduoQJHGkEG54MXjyHGl5L99CpN0Xc7t+
         xAtUXIC0DrO5okIeX8Dc7wvT/bWXb5E4UuaMNz1iN0qeZMqD4chODd+Y1vGmwZ/sVSyb
         1ttGuSd80/3MSXAFk2xoK1Jj9EypzpgOdJvraL9CbdMH4DWd6Yo9UmkrLafK6xv8C7Wm
         gQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714117687; x=1714722487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNEXb7K7k6t0jTc2DZhY7wfuFpObcVhQaJunE5Y0/3Y=;
        b=ES2jfb3LkVO3kgowDrioIa0qLxD5dHcF6HsneYNXXnBshnjDQrBQjSLJiVPh5GFjfg
         z+Oo3ZS3MSimPeH7Dn/VU1MfuwCvJLGTh81QVE0NRYM/KfAL0vbw3wIOJoeD1LDF7oiy
         IgzBFpoBspxfRUuELIuhYc+0attkqecSctVxdvejOA71v+vOp9GPjR6+RuFG/5E7uZQA
         2aFFjsr4utmJQfzBzZEnPoAVdV5o04z5vjv8Bw6VIYW0hLdgiZQdvUU6zaxTj2tzFKTA
         SikrgksQZCBr/f0Uv7DhbHFiVHwqcdD3mwc0D994/PIdCFTH3GyTEV97U7U/QU5UejT1
         gczw==
X-Forwarded-Encrypted: i=1; AJvYcCX1KsiKFnrLhEr9AKiaNOew9qtVx87F2inxp7yuQbUjDG/b9ygS4U/D4sDJTPxD0cFSiR2YTPFcM7Yo+tIHZdLyzcgapZ1TVl9bLwaTJKpt
X-Gm-Message-State: AOJu0YzZRkUVhr7fTx5X+/BuuE0yrgjh42xeNxxQZHciDPRXlx/VcYF1
	YZoavUAXFNjkP4KdzRp1StOsZUKZ8X/y+vcPfWU6B5ec5jfcrABE0v6t2uUSV+i3MdprEDPy1DC
	gErtdPQ6nHJe4q1+RRxHwX82g16TFb8HO/vfL4A==
X-Google-Smtp-Source: AGHT+IH2kcTnzYfBFJ/vpjEldVVO004BbvrN6JipfMdczlULdyDkCg/N4VNB2dpxRuYiuEQfYrwp5U/HbOfG3wASDPg=
X-Received: by 2002:a05:6e02:1fc9:b0:36b:239f:c0e with SMTP id
 dj9-20020a056e021fc900b0036b239f0c0emr2320106ilb.0.1714117686829; Fri, 26 Apr
 2024 00:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240426031637.4135544-1-atishp@rivosinc.com>
In-Reply-To: <20240426031637.4135544-1-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 26 Apr 2024 13:17:55 +0530
Message-ID: <CAAhSdy2xECj3AOBNCVJSsNi==7PdT5riqx7-gsVd-v0MdRU2ag@mail.gmail.com>
Subject: Re: [PATCH v2 kvm-riscv/for-next 0/2] Fixes for kvm-riscv
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_004811_448043_66956EBD 
X-CRM114-Status: GOOD (  13.55  )
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

T24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgNToxOOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEhlcmUgYXJlIHR3byBmaXhlcyBmb3IgaXNzdWVzIGZvdW5k
IGR1cmluZyByZXZpZXcvdGVzdGluZyBhZnRlciB0aGUKPiBzZXJpZXNbMV0gaGFzIGJlZW4gcXVl
dWVkIGZvciA2LjEwLgo+Cj4gQEFudXA6IENhbiB5b3UgcGxlYXNlIHNxdWFzaCB0aGVtIGludG8g
dGhlIG9yaWdpbmFsIHNvdXJjZSBjb21taXQKPiAyMmY1ZGFjNDEwMDQgdGhhdCBpbnRyb2R1Y2Vk
IHRoaXMgPwo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDQyMDE1MTc0
MS45NjI1MDAtMS1hdGlzaHBAcml2b3NpbmMuY29tLwo+Cj4gQ2hhbmdlcyBmcm9tIHYxLT52MjoK
PiAxLiBBZGRlZCBSQiB0YWdzLgo+IDIuIE9wdGltaXplZCB0aGUgbG9naWMgZm9yIG92ZXJmbG93
IG1hc2suCj4gMy4gVXBkYXRlIHRoZSBmaXhlcyB0YWcuIFRoZSBjb3ZlciBsZXR0ZXIgc2hvdWxk
IGJlIGVub3VnaCB0byBpbmRpY2F0ZSB0aGUgYmFzZQo+ICAgIHRhZyBmb3IgcmViYXNpbmcuCj4K
PiBBdGlzaCBQYXRyYSAoMik6Cj4gZHJpdmVycy9wZXJmOiByaXNjdjogUmVtb3ZlIHRoZSB3YXJu
aW5nIGZyb20gc3RvcCBmdW5jdGlvbgo+IGRyaXZlcnMvcGVyZjogcmlzY3Y6IEZpeCBSVjMyIHNu
YXBzaG90IG92ZXJmbG93IHVzZSBjYXNlCgpUaGFua3MsIEkgaGF2ZSBzcXVhc2hlZCBib3RoIGZp
eGVzIGludG8gYXBwcm9wcmlhdGUgY29tbWl0IGFsb25nCndpdGggU2FtdWVsJ3MgUmV2aWV3ZWQt
YnkKClJlZ2FyZHMsCkFudXAKCj4KPiBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMgICAgICAgfCAg
MiAtLQo+IGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgICB8IDQ1ICsrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0KPiBpbmNsdWRlL2xpbnV4L3BlcmYvcmlzY3ZfcG11LmggfCAg
MiArKwo+IDMgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0p
Cj4KPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
