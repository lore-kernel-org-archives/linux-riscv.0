Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0FAC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjkIdVAZUL6seIpAq1KMiQhb79uLVa4sn7dLZuKLNZM=; b=wcx7wPcLuSYFns
	kFcDK+n0tTpS0+ivruqjQJLC/EXPcBaK5Ug6I2C4wO/NQbGtlHwkNU4WQr/kXkJ6s8fN16bvBfpg1
	w70alDC+wGj4P1O1iAZBGvW10E4bdx8A0QGg1VKYn/JvCivNp6R2vKCRjNtgXd3fGtKgDy0id6usb
	S6Z+cxML0aDQ5SUXZC7c6oCNZZi91uwYTdSmJOaiVoTQg9j6VWv7nZi6T9oTdnHvE/ihl5D3UCmcT
	Oblh6FQrC3MOlFTTDi9kwxe5JJG52V6GXnTFsN2uWgtdeU2sMRizZ2FkMCXEgBrTaeoUEN7NOBcgm
	7ymQKbXw1MEnUqiTGv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qya5Z-009oxk-2x;
	Thu, 02 Nov 2023 15:58:33 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qya5X-009owt-02
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 15:58:32 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-da0344eb3fdso1105425276.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698940709; x=1699545509; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNEPrHtpWZXoQfJIOfV77wIMEMFhpxTl9HwUi1VWxhY=;
        b=nwcvmD27+l+qVACQkL5ADdLrhIFciRc/u8u+rz4DnnEDmLpWvioT1/Kv4dJ9j1KorW
         YYV2jezXomisSFrResEJBJ+3SgcU8z/+WtkiwQnvrP3RPMyfRbM1lnM53cWHRhGbfhL1
         0KmdfDUV0TA227WwrzLMUTWWXr46K8JE+NcPwQKOY5s4T4aYnSB6Y+v5jA5bed5t71ou
         k9fLnYQ1eWUlE07YE0oXQ0jE1tHcLtqquTxWtslqqyuj2DpjRqDh6P5ML9N5O0F/MHhN
         JfRSQVeotWHbJSXMfmYjLOJi6DtmESbBx1zLAR8yOgQLxmmLmgZ0B5CXNv4bxJKyupAr
         cDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698940709; x=1699545509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNEPrHtpWZXoQfJIOfV77wIMEMFhpxTl9HwUi1VWxhY=;
        b=qOFb1AkUbH00nTTTFXFuDqzn9fJHriZjJ3XFjAkVDCWLKYORCuCkGhtpJxjbnyTbHf
         H421LaY//Jeti82pb1KLj8ahv1efen7F9KdPvZlCGZv3sai/IRrf2OAMasPYDg27+iwf
         ZNlOqxS8jnUK8nmprF9G/Jr6BX6a0RfsWaX0RywDlZo+U6APsvpdUK0osBToH00Y+ZU+
         fd3tvmnyaJBsyIFijXfCY2hCPdAsqnbMJXY12qRs2i5M0ygpziw222QyW68dOkgb3a3l
         5gSVMLz5L3iD1GhbDEsh2zzhO4d/CWi+tf5aP915+lCfJTNwFpVag1NX5CezigyGPSTh
         enxA==
X-Gm-Message-State: AOJu0Ywryu8WB3lNuPpuCgjM0tIgTeVqCe1zyr8RwWu/xemSPmalKFXY
	VP1Gm+1bVxezjLtppjHwDzP4AJEXsV2fb9HDOb9ujA==
X-Google-Smtp-Source: AGHT+IF1f4Ty+Vh8knd8cOh5yMOedkwEBaET2+CuYstsFQXP9Qws7opMHu00sYoRsA3vWpGcDnE57SVqvvlBibRBQiQ=
X-Received: by 2002:a25:ae10:0:b0:da0:5b63:d062 with SMTP id
 a16-20020a25ae10000000b00da05b63d062mr19548830ybj.35.1698940708790; Thu, 02
 Nov 2023 08:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231026233837.612405-1-debug@rivosinc.com> <ZUPEDWofcqgzsgMS@debug.ba.rivosinc.com>
 <20231102085609.39a22424bba9a75a1523e23b@linux-foundation.org>
In-Reply-To: <20231102085609.39a22424bba9a75a1523e23b@linux-foundation.org>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 2 Nov 2023 08:58:17 -0700
Message-ID: <CAKC1njQH_WgvQOonme8bgWm9FXvayBQKR1536Z8G_yX9LuvCcg@mail.gmail.com>
Subject: Re: [PATCH v6] scripts/gdb: add lx_current support for riscv
To: Andrew Morton <akpm@linux-foundation.org>
Cc: woodrow.shen@sifive.com, Andrew Jones <ajones@ventanamicro.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Glenn Washburn <development@efficientek.com>, Jeff Xie <xiehuan09@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_085831_050192_05198EA2 
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

T24gVGh1LCBOb3YgMiwgMjAyMyBhdCA4OjU24oCvQU0gQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51
eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIDIgTm92IDIwMjMgMDg6NDU6MTcg
LTA3MDAgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gPiBQaW5n
Cj4gPgo+ID4gKyBDQzogYWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZwo+ID4KPiA+IFdobyBzaG91
bGQgSSBwaW5nIHRvIG1ha2Ugc3VyZSB0aGF0IGl0IGxhbmRzIHVwIGluIG1haW5saW5lPwo+ID4g
SXQncyBxdWl0ZSBhIHRyaXZpYWwgY2hhbmdlIHRvIHN1cHBvcnQgbHhfY3VycmVudCByaXNjdiBh
cmNoLgo+Cj4gSSBtb3ZlZCBpdCBmcm9tIG1tLmdpdCdzIG1tLW5vbm1tLXVuc3RhYmxlIGJyYW5j
aCBpbnRvIHRoZQo+IG1tLW5vbm1tLXN0YWJsZSBicmFuY2ggZWFybGllciB0aGlzIHdlZWsuICBt
bS1ub25tbS1zdGFibGUgaXMgd2hhdCBJJ2xsCj4gYmUgc2VuZGluZyB0byBMaW51cyBsYXRlciB0
aGlzIG1lcmdlIHdpbmRvdy4KPgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
